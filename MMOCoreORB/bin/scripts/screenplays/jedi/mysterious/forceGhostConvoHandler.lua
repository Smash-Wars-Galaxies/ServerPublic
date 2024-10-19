
ForceGhostConvoHandler = conv_handler:new {}
local Logger = require("utils.logger")

function ForceGhostConvoHandler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local template = LuaConversationTemplate(pConvTemplate)

	-- Turn away those who have not completed their hologrind
	if not SmashJediManager:hasCompletedMasteries(pPlayer) then
		return template:getScreen("cant_convert")
	end

	-- Check their standing and either tell them how bad it is or let them learn the force
	if not SmashJediManager:hasProgressed(pPlayer) then
		local standing = SmashJediManager:getFactionStanding(pPlayer)
		if (standing < 0) then
			return template:getScreen("extra_bad_faction")
		elseif (standing < 1000)  then
			return template:getScreen("really_bad_faction")
		elseif (standing < 2000) then
			return template:getScreen("bad_faction")
		elseif (standing < 3000) then
			return template:getScreen("kinda_bad_faction")
		elseif (standing < 5000) then
			return template:getScreen("almost_bad_faction")
		else
			return template:getScreen("become_fs")
		end
	end

	-- Otherwise tell them about the trainers
	return template:getScreen("trainers")
end

function ForceGhostConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local screenID = LuaConversationScreen(pConvScreen):getScreenID()

	-- If we are on the intro screen check if they have the right faction and standing
	if screenID == "learn_force" then
		if SmashJediManager:hasCompletedMasteries(pPlayer) and not SmashJediManager:hasProgressed(pPlayer) then
			SmashJediManager:setForceSensitive(pPlayer)
		end
	elseif screenID == "location" then
		-- Get the PlayerObject from the CreatureObject
		local playerObject = PlayerObject(CreatureObject(pPlayer):getPlayerObject())
		if playerObject ~= nil then
			-- Add the waypoint
			playerObject:addWaypoint("yavin4", "A Strange Camp", "A mysterious location on Yavin 4", -29, 1109, WAYPOINTPURPLE, true, true, WAYPOINTJEDI, 0)
			
			-- Send a message to the player
			CreatureObject(pPlayer):sendSystemMessage("Something tells you to look on Yavin 4...")
		end
	end

	return pConvScreen
end

return ForceGhostConvoHandler