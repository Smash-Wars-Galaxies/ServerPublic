/*
 * CommandFactory.h
 *
 *  Created on: Aug 23, 2011
 *      Author: dannuic
 */

#ifndef COMMANDFACTORY_H_
#define COMMANDFACTORY_H_

namespace server {
namespace zone {
namespace managers {
namespace objectcontroller {
namespace command {

template <typename id, typename val>
class CommandCreatorMap : public HashTable<id, val> {
	int hash(const id& k) const {
		return (int)k.hashCode();
	}

public:
	CommandCreatorMap() {
		HashTable<id, val>::setNullValue(nullptr);
	}
};

template <typename CtorSignature, typename UniqueIdType>
class CommandFactory;

template <typename BaseClassType, typename Param1Type, typename Param2Type, typename ClassType>
BaseClassType CreateCommand(Param1Type param1, Param2Type param2) {
	return new ClassType(param1, param2);
}

template <typename BaseClassType, typename Param1Type, typename Param2Type, typename UniqueIdType>
class CommandFactory<BaseClassType(Param1Type, Param2Type), UniqueIdType> {
protected:
	typedef BaseClassType (*CreateCommandFunc)(Param1Type, Param2Type);

public:
	BaseClassType createCommand(UniqueIdType uniqueID, Param1Type param1, Param2Type param2) {
		if (!commandCreator.containsKey(uniqueID))
			return nullptr;

		return commandCreator.get(uniqueID)(param1, param2);
	}

	template <typename ClassType>
	bool registerCommand(UniqueIdType uniqueID) {
		if (commandCreator.containsKey(uniqueID))
			return false;

		commandCreator.put(uniqueID, &CreateCommand<BaseClassType, Param1Type, Param2Type, ClassType>);

		return true;
	}

	bool unregisterCommand(UniqueIdType uniqueID) {
		return commandCreator.drop(uniqueID);
	}

	bool containsCommand(UniqueIdType uniqueID) const {
		return commandCreator.containsKey(uniqueID);
	}

protected:
	CommandCreatorMap<UniqueIdType, CreateCommandFunc> commandCreator;
};

} // namespace command
} // namespace objectcontroller
} // namespace managers
} // namespace zone
} // namespace server

#endif /* COMMANDFACTORY_H_ */
