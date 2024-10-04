/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions. */

#ifndef GMRESTORECOMMAND_H_
#define GMRESTORECOMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"

class GmRestoreCommand : public QueueCommand {
public:

	GmRestoreCommand(const String& name, ZoneProcessServer* server) : QueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		try {
			auto pm = server->getPlayerManager();

			// Collect list of online players
			Vector<CreatureObject*> patients;

			auto iter = server->getPlayerManager()->getOnlineZoneClientMap()->iterator();
			while (iter.hasNext()) {
				auto clients = iter.next();
				for (int i = 0; i < clients.size(); i++) {
					auto session = clients.get(i);
					if (session == nullptr) {
						continue;
					}

					Reference<CreatureObject*> patient = session->getPlayer();
					if (creature == nullptr) {
						continue;
					}

					patients.add(patient);
				}
			}

			// Handle arguments
			StringTokenizer args(arguments.toString());
			if (!args.hasMoreTokens()) {
				// Revive all players
				for (auto patient = patients.begin(); patient != patients.end(); ++patient){
					revivePatient(creature, *patient);
				}
			} else {
				String firstArg;
				args.getStringToken(firstArg);

				if (firstArg.toLowerCase() == "buff") {
					for (auto patient = patients.begin(); patient != patients.end(); ++patient){
						Locker clocker(*patient, creature);

						if ((*patient)->isPlayerCreature()) {
							pm->enhanceCharacter(*patient);
						} else if ((*patient)->isCreature()) {
							pm->enhanceCharacter(*patient);
						}
					}
					creature->sendSystemMessage("All online players have been enhanced.");
				} else {
					creature->sendSystemMessage("Syntax: /gmrestore [buff]]");
					return INVALIDTARGET;
				}
			}
		} catch (Exception& e) {
			creature->sendSystemMessage("Syntax: /gmrestore [buff]]");
		}

		return SUCCESS;
	}

	void revivePatient(CreatureObject* creature, CreatureObject* patient) const {
		Locker clocker(patient, creature);

		ManagedReference<PlayerObject*> targetGhost = patient->getPlayerObject();
		if (targetGhost != nullptr) {
			if(targetGhost->getJediState() > 1){
				targetGhost->setForcePower(targetGhost->getForcePowerMax());
			}

			if(patient->isDead()){
				targetGhost->removeSuiBoxType(SuiWindowType::CLONE_REQUEST);
			}
		}

		patient->healDamage(creature, CreatureAttribute::HEALTH, 5000);
		patient->healDamage(creature, CreatureAttribute::ACTION, 5000);
		patient->healDamage(creature, CreatureAttribute::MIND, 5000);

		for (int i = 0; i < 9; ++i) {
			patient->setWounds(i, 0);
		}

		patient->setShockWounds(0);

		patient->clearDots();

		patient->removeFeignedDeath();

		patient->setPosture(CreaturePosture::UPRIGHT);

		patient->notifyObservers(ObserverEventType::CREATUREREVIVED, creature, 0);

		patient->broadcastPvpStatusBitmask();

		if (patient->isPlayerCreature()) {
			patient->sendSystemMessage("You have been restored.");
		}
	}
};

#endif //GMRESTORECOMMAND_H_
