local ObjectManager = require("managers.object.object_manager")
local QuestManager = require("managers.quest.quest_manager")

SmashJediManagerCommon = ScreenPlay:new {
	forceSensitiveBranches = {
		"force_sensitive_combat_prowess_ranged_accuracy",
		"force_sensitive_combat_prowess_ranged_speed",
		"force_sensitive_combat_prowess_melee_accuracy",
		"force_sensitive_combat_prowess_melee_speed",
		"force_sensitive_enhanced_reflexes_ranged_defense",
		"force_sensitive_enhanced_reflexes_melee_defense",
		"force_sensitive_enhanced_reflexes_vehicle_control",
		"force_sensitive_enhanced_reflexes_survival",
		"force_sensitive_crafting_mastery_experimentation",
		"force_sensitive_crafting_mastery_assembly",
		"force_sensitive_crafting_mastery_repair",
		"force_sensitive_crafting_mastery_technique",
		"force_sensitive_heightened_senses_healing",
		"force_sensitive_heightened_senses_surveying",
		"force_sensitive_heightened_senses_persuasion",
		"force_sensitive_heightened_senses_luck"
	}
}

SMASH_JEDI_PROGRESSION_SCREEN_PLAY_STATE_STRING = "SmashJediProgression"
SMASH_JEDI_PROGRESSION_GLOWING = 1
SMASH_JEDI_PROGRESSION_HAS_CRYSTAL = 2
SMASH_JEDI_PROGRESSION_HAS_VILLAGE_ACCESS = 4
SMASH_JEDI_PROGRESSION_COMPLETED_VILLAGE = 8
SMASH_JEDI_PROGRESSION_ACCEPTED_MELLICHAE = 16
SMASH_JEDI_PROGRESSION_DEFEATED_MELLIACHAE = 32
SMASH_JEDI_PROGRESSION_COMPLETED_PADAWAN_TRIALS = 64

-- Set the jedi progression screen play state on the player.
-- @param pPlayer pointer to the creature object of the player.
-- @param state the state to set.
function SmashJediManagerCommon.setJediProgressionScreenPlayState(pPlayer, state)
	if (pPlayer == nil) then
		return
	end

	CreatureObject(pPlayer):setScreenPlayState(state, VILLAGE_JEDI_PROGRESSION_SCREEN_PLAY_STATE_STRING)
end

function SmashJediManagerCommon.isVillageEligible(pPlayer)
	if (pPlayer == nil) then
		return false
	end

	return VillageJediManagerCommon.hasJediProgressionScreenPlayState(pPlayer, VILLAGE_JEDI_PROGRESSION_HAS_VILLAGE_ACCESS) and QuestManager.hasCompletedQuest(pPlayer, QuestManager.quests.FS_VILLAGE_ELDER)
end

-- Check if the player has the jedi progression screen play state.
-- @param pPlayer pointer to the creature object of the player.
-- @param state the state to check if the player has.
-- @return true if the player has the state.
function SmashJediManagerCommon.hasJediProgressionScreenPlayState(pPlayer, state)
	if (pPlayer == nil) then
		return false
	end

	return CreatureObject(pPlayer):hasScreenPlayState(state, VILLAGE_JEDI_PROGRESSION_SCREEN_PLAY_STATE_STRING)
end

function SmashJediManagerCommon.getLearnedForceSensitiveBranches(pPlayer)
	if (pPlayer == nil) then
		return 0
	end

	local branchesLearned = 0

	for i = 1, #SmashJediManagerCommon.forceSensitiveBranches, 1 do
		if (CreatureObject(pPlayer):hasSkill(SmashJediManagerCommon.forceSensitiveBranches[i] .. "_04")) then
			branchesLearned = branchesLearned + 1
		end
	end

	return branchesLearned
end

return SmashJediManagerCommon
