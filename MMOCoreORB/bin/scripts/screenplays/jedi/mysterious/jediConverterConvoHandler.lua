
JediConverterConvoHandler = conv_handler:new {}

function JediConverterConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local screenID = LuaConversationScreen(pConvScreen):getScreenID()
	local template = LuaConversationTemplate(pConvTemplate)
	local clonedConversation = LuaConversationScreen(pConvScreen)

	-- Turn away those who have not unlocked sensitive
	if SmashJediManager:hasCompletedMasteries(pPlayer) and not SmashJediManager:hasProgressed(pPlayer) then
		return template:getScreen("cant_convert")
	end

	if screenID == "intro" then
		
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
end

return JediConverterConvoHandler