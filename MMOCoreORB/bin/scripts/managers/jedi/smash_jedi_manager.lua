
JediManager = require("managers.jedi.jedi_manager")
local Logger = require("utils.logger")

jediManagerName = "SmashJediManager"

PROFESSIONS_TO_MASTER = 2

SmashJediManager = JediManager:new {
	screenplayName = jediManagerName,
	jediManagerName = jediManagerName,
	jediProgressionType = CUSTOMJEDIPROGRESSION,
	startingEvent = nil,
}

--Filter spawn locations to places that are enabled
---@return string[]
function SmashJediManager:getValidFactions()
    local holoFactions = {
        --corellia/Talus
        "afarathu",
        "corsec",
        --Lok
        "bloodrazor", 
        "canyon_corsair",
        "lok_mercenaries",
        --Dantoonine
        "janta_tribe",
        "kunga_tribe",
        --Naboo
        "naboo_security_force",
        "trade_federation",
        "gungan",
        "plasma_thief",
        --Rori
        "rorgungan",
        "spice_collective",
        --Tatooine
        "townsperson",
        "jabba",
        "valarian"
        --Nothing on Dathomir, because I'm not a prick.
    }
    return holoFactions
end

---@param name string
---@return boolean
function SmashJediManager:isValidFaction(name)
    local factions = SmashJediManager:getValidFactions()
    for _, v in pairs(factions) do
        if v == name then
            return true
        end
    end
    return false
end

-- Return a list of all professions and their badge number that are available for the hologrind
-- @return a list of professions and their badge numbers.
function SmashJediManager:getGrindableProfessions()
	local grindableProfessions = {
		-- String Id, badge number, profession name
		--{ "pilot_rebel_navy_corellia", 	PILOT_REBEL_NAVY_CORELLIA },
		--{ "pilot_imperial_navy_corellia", 	PILOT_IMPERIAL_NAVY_CORELLIA },
		--{ "pilot_neutral_corellia", 		PILOT_CORELLIA },
		--{ "pilot_rebel_navy_tatooine", 	PILOT_REBEL_NAVY_TATOOINE },
		--{ "pilot_imperial_navy_naboo", 	PILOT_IMPERIAL_NAVY_NABOO },
		{ "crafting_architect_master", 		CRAFTING_ARCHITECT_MASTER  },
		{ "crafting_armorsmith_master", 	CRAFTING_ARMORSMITH_MASTER  },
		{ "crafting_artisan_master", 		CRAFTING_ARTISAN_MASTER  },
		{ "outdoors_bio_engineer_master", 	OUTDOORS_BIOENGINEER_MASTER  },
		{ "combat_bountyhunter_master", 	COMBAT_BOUNTYHUNTER_MASTER  },
		{ "combat_brawler_master", 		COMBAT_BRAWLER_MASTER  },
		{ "combat_carbine_master", 		COMBAT_CARBINE_MASTER  },
		{ "crafting_chef_master", 		CRAFTING_CHEF_MASTER  },
		{ "science_combatmedic_master", 	SCIENCE_COMBATMEDIC_MASTER  },
		{ "combat_commando_master", 		COMBAT_COMMANDO_MASTER  },
		{ "outdoors_creaturehandler_master", 	OUTDOORS_CREATUREHANDLER_MASTER  },
		{ "social_dancer_master", 		SOCIAL_DANCER_MASTER  },
		{ "science_doctor_master", 		SCIENCE_DOCTOR_MASTER  },
		{ "crafting_droidengineer_master", 	CRAFTING_DROIDENGINEER_MASTER  },
		{ "social_entertainer_master", 		SOCIAL_ENTERTAINER_MASTER  },
		{ "combat_1hsword_master", 		COMBAT_1HSWORD_MASTER  },
		{ "social_imagedesigner_master", 	SOCIAL_IMAGEDESIGNER_MASTER  },
		{ "combat_marksman_master", 		COMBAT_MARKSMAN_MASTER  },
		{ "science_medic_master", 		SCIENCE_MEDIC_MASTER  },
		{ "crafting_merchant_master", 		CRAFTING_MERCHANT_MASTER  },
		{ "social_musician_master", 		SOCIAL_MUSICIAN_MASTER  },
		{ "combat_polearm_master", 		COMBAT_POLEARM_MASTER  },
		{ "combat_pistol_master", 		COMBAT_PISTOL_MASTER  },
		--{ "social_politician_master", 	SOCIAL_POLITICIAN_MASTER  },
		{ "outdoors_ranger_master", 		OUTDOORS_RANGER_MASTER  },
		{ "combat_rifleman_master", 		COMBAT_RIFLEMAN_MASTER  },
		{ "outdoors_scout_master", 		OUTDOORS_SCOUT_MASTER  },
		--{ "crafting_shipwright", 		CRAFTING_SHIPWRIGHT },
		{ "combat_smuggler_master", 		COMBAT_SMUGGLER_MASTER  },
		{ "outdoors_squadleader_master", 	OUTDOORS_SQUADLEADER_MASTER  },
		{ "combat_2hsword_master", 		COMBAT_2HSWORD_MASTER  },
		{ "crafting_tailor_master", 		CRAFTING_TAILOR_MASTER  },
		{ "crafting_weaponsmith_master", 	CRAFTING_WEAPONSMITH_MASTER  },
		--{ "pilot_neutral_naboo", 		PILOT_NEUTRAL_NABOO },
		--{ "pilot_neutral_tatooine", 		PILOT_TATOOINE },
		--{ "pilot_imperial_navy_tatooine", 	PILOT_IMPERIAL_NAVY_TATOOINE },
		{ "combat_unarmed_master", 		COMBAT_UNARMED_MASTER  },
		--{ "pilot_rebel_navy_naboo", 		PILOT_REBEL_NAVY_NABOO }
	}
	return grindableProfessions
end

-- Handling of the onPlayerCreated event.
-- Hologrind professions will be generated for the player.
-- @param pCreatureObject pointer to the creature object of the created player.
function SmashJediManager:onPlayerCreated(pCreatureObject)
	local pGhost = CreatureObject(pCreatureObject):getPlayerObject()
	if (pGhost == nil) then
		return
	end

    -- Initialize player faction requirement
    local valid_factions = self:getValidFactions()
    PlayerObject(pGhost):setJediFaction(valid_factions[getRandomNumber(1, #valid_factions)])

    -- Initialize player hologrind requirements
	local skillList = self:getGrindableProfessions()
	for i = 1, PROFESSIONS_TO_MASTER, 1 do
		local skillNumber = 999
		repeat 
			skillNumber = getRandomNumber(1, #skillList)
		until (skillList[skillNumber][2] ~= 0)
		PlayerObject(pGhost):addHologrindProfession(skillList[skillNumber][2])
		table.remove(skillList, skillNumber)
	end
end

-- Check Hologrind professions and fix them for the player.
-- @param pCreatureObject pointer to the creature object of the created player.
function SmashJediManager:checkRequirements(pCreatureObject)
	local pGhost = CreatureObject(pCreatureObject):getPlayerObject()
	if (pGhost == nil) then
		return
	end


    -- Handle Faction Selection
    local faction = PlayerObject(pGhost):getJediFaction()
    if faction == "" and SmashJediManager:hasProgressed(pCreatureObject) then
        PlayerObject(pGhost):setJediFaction("corsec")
    elseif faction == "" or not SmashJediManager:isValidFaction(faction)  then
        local valid_factions = self:getValidFactions()
        PlayerObject(pGhost):setJediFaction(valid_factions[getRandomNumber(1, #valid_factions)])
    end

    -- Remove extra professions
	local professions = PlayerObject(pGhost):getHologrindProfessions()
    while (#professions > PROFESSIONS_TO_MASTER) do
        local to_remove = getRandomNumber(1, #professions)
        PlayerObject(pGhost):removeHologrindProfession(professions[to_remove])
        table.remove(professions, to_remove)
    end

	-- Create a list of unused skills to select from 
	local skillRemaining = self:getGrindableProfessions()

	local professions = PlayerObject(pGhost):getHologrindProfessions()
	for i = 1, #professions, 1 do
		for j = 1, #skillRemaining, 1 do
			if (professions[i] == skillRemaining[j][2]) then
				table.remove(skillRemaining, j)
				break
			end
		end
	end

	-- Loop over profession list and replace invalid ones
	local skillList = self:getGrindableProfessions()
	for i = 1, #professions, 1 do
		-- Check if it is a valid profession
		local found = false
		for j = 1, #skillList, 1 do
			if (professions[i] == skillList[j][2]) then
				found = true
				break
			end
		end

		-- Replace with one of the unused ones if it is not
		if (found ~= true) then
			print("Fixing invalid profession on character " .. PlayerObject(pGhost):getFirstname())
			local skillNumber = 999
			repeat 
				skillNumber = getRandomNumber(1, #skillRemaining)
			until (skillRemaining[skillNumber][2] ~= 0)
			PlayerObject(pGhost):setHologrindProfession(i, skillRemaining[skillNumber][2])
		end
	end
end

-- Check and count the number of mastered hologrind professions.
-- @param pCreatureObject pointer to the creature object of the player which should get its number of mastered professions counted.
-- @return the number of mastered hologrind professions.
function SmashJediManager:getMasteredCount(pCreatureObject)
	local pGhost = CreatureObject(pCreatureObject):getPlayerObject()
	if (pGhost == nil) then
		return 0
	end

	local professions = PlayerObject(pGhost):getHologrindProfessions()
	local masteredNumberOfProfessions = 0
	for i = 1, #professions, 1 do
		if PlayerObject(pGhost):hasBadge(professions[i]) then
			masteredNumberOfProfessions = masteredNumberOfProfessions + 1
		end
	end
	return masteredNumberOfProfessions
end

-- Check if the player is jedi.
-- @param pCreatureObject pointer to the creature object of the player to check if he is jedi.
-- @return returns if the player is jedi or not.
function SmashJediManager:hasCompletedMasteries(pCreatureObject)
	local pGhost = CreatureObject(pCreatureObject):getPlayerObject()
	if (pGhost == nil) then
		return false
	end

	return self:getMasteredCount(pCreatureObject) >= PROFESSIONS_TO_MASTER
end

-- Check if the player is jedi.
-- @param pCreatureObject pointer to the creature object of the player to check if he is jedi.
-- @return returns if the player is jedi or not.
function SmashJediManager:hasProgressed(pCreatureObject)
	local pGhost = CreatureObject(pCreatureObject):getPlayerObject()
	if (pGhost == nil) then
		return false
	end

	return PlayerObject(pGhost):getJediState() >= 1
end

-- Check if the player is jedi.
-- @param pCreatureObject pointer to the creature object of the player to check if he is jedi.
-- @return returns if the player is jedi or not.
function SmashJediManager:getFactionStanding(pCreatureObject)
	local pGhost = CreatureObject(pCreatureObject):getPlayerObject()
	if (pGhost == nil) then
		return false
	end

    local faction = PlayerObject(pGhost):getJediFaction()
	return PlayerObject(pGhost):getFactionStanding(faction)
end


function SmashJediManager:setForceSensitive(pCreatureObject)
	local pGhost = CreatureObject(pCreatureObject):getPlayerObject()
	if (pGhost == nil) then
		return false
	end

	PlayerObject(pGhost):setJediState(1)
	awardSkill(pCreatureObject, "force_title_jedi_novice")
end

-- Sui window ok pressed callback function.
function SmashJediManager:notifyOkPressed()
-- Do nothing.
end

-- Send a sui window to the player about unlocking jedi and award jedi status and force sensitive skill.
-- @param pCreatureObject pointer to the creature object of the player who unlocked jedi.
function SmashJediManager:sendSuiWindow(pCreatureObject)
	local suiManager = LuaSuiManager()
	suiManager:sendMessageBox(
        pCreatureObject,
        pCreatureObject,
        "@quest/force_sensitive/intro:force_sensitive",
        "Something has changed within you, perhaps now is the time to find someone who can answer some questions...",
        "@ok",
        "SmashJediManager",
        "notifyOkPressed"
    )
end

-- Check if the player has mastered all hologrind professions and send sui window and award skills.
-- @param pCreatureObject pointer to the creature object of the player to check the jedi progression on.
function SmashJediManager:checkIfProgressed(pCreatureObject)
	if self:hasCompletedMasteries(pCreatureObject) and not self:hasProgressed(pCreatureObject) then
		self:sendSuiWindow(pCreatureObject)
	end
end

-- Event handler for the BADGEAWARDED event.
-- @param pCreatureObject pointer to the creature object of the player who was awarded with a badge.
-- @param pCreatureObject2 pointer to the creature object of the player who was awarded with a badge.
-- @param badgeNumber the badge number that was awarded.
-- @return 0 to keep the observer active.
function SmashJediManager:onBadgeAwarded(pCreatureObject, pCreatureObject2, badgeNumber)
	if (pCreatureObject == nil) then
		return 0
	end

	self:checkIfProgressed(pCreatureObject)

	return 0
end

-- Handling of the onPlayerLoggedIn event. The progression of the player will be checked and observers will be registered.
-- @param pCreatureObject pointer to the creature object of the player who logged in.
function SmashJediManager:onPlayerLoggedIn(pCreatureObject)
	if (pCreatureObject == nil) then
		return
	end

	self:checkRequirements(pCreatureObject)
	self:checkIfProgressed(pCreatureObject)
	createObserver(BADGEAWARDED, "SmashJediManager", "onBadgeAwarded", pCreatureObject)

	-- Ensure anyone who has progressed has the force sensitive rank
	if self:hasProgressed(pCreatureObject) and not CreatureObject(pCreatureObject):hasSkill("force_title_jedi_novice") then
		awardSkill(pCreatureObject, "force_title_jedi_novice")
	end
end

-- Get the profession name from the badge number.
-- @param badgeNumber the badge number to find the profession name for.
-- @return the profession name associated with the badge number, Unknown profession returned if the badge number isn't found.
function SmashJediManager:badgeNumberToString(badgeNumber)
	local skillList = self:getGrindableProfessions()
	for i = 1, #skillList, 1 do
		if skillList[i][2] == badgeNumber then
			return skillList[i][1]
		end
	end
	return "Unknown profession"
end

-- Find out and send the response from the holocron to the player
-- @param pCreatureObject pointer to the creature object of the player who used the holocron.
function SmashJediManager:sendHolocronMessage(pCreatureObject)
	if self:getMasteredCount(pCreatureObject) >= PROFESSIONS_TO_MASTER then
		-- The Holocron is quiet. The ancients' knowledge of the Force will no longer assist you on your journey. You must continue seeking on your own.
		CreatureObject(pCreatureObject):sendSystemMessage("@jedi_spam:holocron_quiet")
		return true
	else
		local pGhost = CreatureObject(pCreatureObject):getPlayerObject()
		if (pGhost == nil) then
			return false
		end

		local professions = PlayerObject(pGhost):getHologrindProfessions()
		for i = 1, #professions, 1 do
			if not PlayerObject(pGhost):hasBadge(professions[i]) then
				local professionText = self:badgeNumberToString(professions[i])
				CreatureObject(pCreatureObject):sendSystemMessageWithTO("@jedi_spam:holocron_light_information", "@skl_n:" .. professionText)
				return false;
			end
		end

		return false
	end
end

-- Handling of the useItem event.
-- @param pSceneObject pointer to the item object.
-- @param itemType the type of item that is used.
-- @param pCreatureObject pointer to the creature object that used the item.
function SmashJediManager:useItem(pSceneObject, itemType, pCreatureObject)
	if (pCreatureObject == nil or pSceneObject == nil) then
		return
	end

	if itemType == ITEMHOLOCRON then
		local isSilent = self:sendHolocronMessage(pCreatureObject)
		if isSilent then
			return
		else
			SceneObject(pSceneObject):destroyObjectFromWorld()
			SceneObject(pSceneObject):destroyObjectFromDatabase()
		end
	end
end

function SmashJediManager:canLearnSkill(pPlayer, skillName)
	return true
end

registerScreenPlay("SmashJediManager", true)

return SmashJediManager
