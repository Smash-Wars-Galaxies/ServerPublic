/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef REGRANTSKILLSCOMMAND_H_
#define REGRANTSKILLSCOMMAND_H_

#include "server/zone/objects/creature/commands/QueueCommand.h"
#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/managers/skill/SkillManager.h"
#include "system/lang/String.h"

class RegrantSkillsCommand : public QueueCommand {
public:

	RegrantSkillsCommand(const String& name, ZoneProcessServer* server)
		: QueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {
		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;


		Locker clocker(creature);

		SkillManager* skillManager = SkillManager::instance();
		for( const auto &skill: creature->getSkillList()->minimal_requirements()) {
			skillManager->surrenderSkill(skill, creature, true);

			info(true) << "regranting " << skill << " to " << creature->getCreatureName();

			bool skillGranted = skillManager->awardSkill(skill, creature, true, true, true);
			if (!skillGranted ) {
				StringIdChatParameter params;
				params.setTO(skill);
				params.setStringId("skill_teacher", "prose_train_failed");

				creature->sendSystemMessage(params);
			}
		}
		creature->sendSystemMessage("Regranted skills" );
					
		return SUCCESS;
	}
};

#endif //REGRANTSKILLSCOMMAND_H_
