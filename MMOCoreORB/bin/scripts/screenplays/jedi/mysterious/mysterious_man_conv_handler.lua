
MysteriousManConvoHandler = conv_handler:new {}

function MysteriousManConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local screenID = LuaConversationScreen(pConvScreen):getScreenID()
	local template = LuaConversationTemplate(pConvTemplate)
	local clonedConversation = LuaConversationScreen(pConvScreen)
	if not SmashJediManager:hasCompletedMasteries(pPlayer) then
		return template:getScreen("cant_convert")
	end

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
		end
	elseif screenID == "learn_force" then
		if SmashJediManager:hasCompletedMasteries(pPlayer) and not SmashJediManager:hasProgressed(pPlayer) then
			SmashJediManager:setForceSensitive(pPlayer)
		end
	elseif (string.find(screenID, "learn_")) then
		local learnType = string.sub(screenID, 7)
		MysteriousExperienceConverter:sendConversionSUI(pPlayer, pNpc, learnType)
	elseif (screenID == "what_aspects") then
		local branchList = MysteriousExperienceConverter:getBranchLearnList(pPlayer)
		clonedConversation:setDialogTextTO(branchList)
	end

	return pConvScreen
end

return MysteriousManConvoHandler