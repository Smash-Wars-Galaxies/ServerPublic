
ForceGhostConvoHandler = conv_handler:new {}

function ForceGhostConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local screenID = LuaConversationScreen(pConvScreen):getScreenID()
	local template = LuaConversationTemplate(pConvTemplate)
	local clonedConversation = LuaConversationScreen(pConvScreen)

	-- Turn away those who have not completed their hologrind
	if not SmashJediManager:hasCompletedMasteries(pPlayer) then
		return template:getScreen("cant_convert")
	end

	-- If we are on the intro screen check if they have the right faction and standing
	if screenID == "intro" then
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
				return template:getScreen("become")
			end
		else
			return template:getScreen("trainers")
		end
	elseif screenID == "learn_force" then
		if SmashJediManager:hasCompletedMasteries(pPlayer) and not SmashJediManager:hasProgressed(pPlayer) then
			SmashJediManager:setForceSensitive(pPlayer)
		end
	elseif screenID == "location" then
		--give waypoint
		--Floating message "Something tells you to look on Yavin 4..."
	end
end

return ForceGhostConvoHandler