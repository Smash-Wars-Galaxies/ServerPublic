local ObjectManager = require("managers.object.object_manager")

JediConverterConvoHandler = conv_handler:new {}

function JediConverterConvoHandler:getInitialScreen(pPlayer, pNpc, pConvTemplate)
	local convoTemplate = LuaConversationTemplate(pConvTemplate)

	CreatureObject(pNpc):doAnimation("beckon")

	if (SmashJediManager.hasProgressed(CreatureObject(pPlayer))) then
		return convoTemplate:getScreen("intro")
	else
		return convoTemplate:getScreen("no_business")
	end
end

function JediConverterConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()
	local pConvScreen = screen:cloneScreen()
	local clonedConversation = LuaConversationScreen(pConvScreen)

	if (string.find(screenID, "learn_")) then
		local learnType = string.sub(screenID, 7)
		SmashExperienceConverter:sendConversionSUI(pPlayer, pNpc, learnType)
	elseif (screenID == "what_aspects") then
		local branchList = SmashExperienceConverter:getBranchLearnList(pPlayer)
		clonedConversation:setDialogTextTO(branchList)
	end

	return pConvScreen
end

return JediConverterConvoHandler