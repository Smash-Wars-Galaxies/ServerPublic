/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef SKILLBOXLIST_H_
#define SKILLBOXLIST_H_

#include "engine/engine.h"
#include "engine/util/json_utils.h"

#include "server/zone/objects/scene/variables/DeltaVector.h"

class Skill;

class SkillList : public DeltaVector<Reference<Skill*> > {
#ifdef ODB_SERIALIZATION
	Vector<String> skills;
#endif
public:
	SkillList() = default;
	SkillList(Vector<String>& skills);

	bool add(Skill* skill, DeltaMessage* message = nullptr);
	void remove(Skill* skill, DeltaMessage* message = nullptr);

	bool containsSkill(const String& skill) const;

	bool toBinaryStream(ObjectOutputStream* stream) override;
	bool parseFromBinaryStream(ObjectInputStream* stream) override;

	void getStringList(Vector<String>& skills) const;
	void loadFromNames(Vector<String>& skills);

	void insertToMessage(BaseMessage* msg) const override;

	// Check if skill passed in has any skills in the list that depend on it
	bool is_depended_on(const String& skill) const;

	// Returns a list of skills that if granted with dependencies would produce 
	// the same list
	const Vector<String> minimal_requirements() const;

	friend void to_json(nlohmann::json& j, const SkillList& s);
};

#endif /*SKILLBOXLIST_H_*/
