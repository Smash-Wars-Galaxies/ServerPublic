
JediTrainerConvoHandler = conv_handler:new {}

function JediTrainerConvoHandler:runScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local screenID = LuaConversationScreen(pConvScreen):getScreenID()
	local template = LuaConversationTemplate(pConvTemplate)
	local clonedConversation = LuaConversationScreen(pConvScreen)

	-- Turn away those who have not unlocked sensitive
	if SmashJediManager:hasCompletedMasteries(pPlayer) and not SmashJediManager:hasProgressed(pPlayer) then
		return template:getScreen("no_business")
	end

	return JediTrainerConvoHandler:runTrainerScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
end


function JediTrainerConvoHandler:runTrainerScreenHandlers(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
	local screen = LuaConversationScreen(pConvScreen)
	local screenID = screen:getScreenID()

	local trainerType = SkillTrainer:getTrainerType(pPlayer, pNpc, pConvTemplate)
	local playerID = SceneObject(pPlayer):getObjectID()
	local stringTable = "@jedi_trainer:"
	local isJediTrainer = true

	if (screenID == "intro_trainer") then
		local pConvScreen = screen:cloneScreen()
		local clonedConversation = LuaConversationScreen(pConvScreen)

		clonedConversation:setDialogTextStringId(stringTable .. "greeting")
		clonedConversation:addOption("@skill_teacher:opt1_1", "msg2_1")
		clonedConversation:addOption("@skill_teacher:opt1_2", "msg2_2")

		return pConvScreen
	end

	local skillList

	if (screenID == "msg2_1") then
		pConvScreen = screen:cloneScreen()
		local clonedConversation = LuaConversationScreen(pConvScreen)

		skillList = SkillTrainer:getTeachableSkills(pPlayer, trainerType, true)

		if (#skillList == 0) then
			clonedConversation:setDialogTextStringId(stringTable .. "msg3_1")
			clonedConversation:addOption("@skill_teacher:opt1_1", "msg2_1")
			clonedConversation:addOption("@skill_teacher:opt1_2", "msg2_2")
		else
			clonedConversation:setDialogTextStringId(stringTable .. screenID)
			pConvScreen = trainerConvHandler:addSkillResponses(pConvScreen, skillList, stringTable, "learn")
		end
	elseif (screenID == "msg2_2") then
		pConvScreen = screen:cloneScreen()
		local clonedConversation = LuaConversationScreen(pConvScreen)

		clonedConversation:setDialogTextStringId(stringTable .. screenID)
		skillList = SkillTrainer:getTeachableSkills(pPlayer, trainerType, false)
		pConvScreen = trainerConvHandler:addSkillResponses(pConvScreen, skillList, stringTable, "info")
	elseif (screenID == "cancel_learn") then
		pConvScreen = screen:cloneScreen()
		local clonedConversation = LuaConversationScreen(pConvScreen)

		clonedConversation:setDialogTextStringId(stringTable .. "msg_no")
		deleteData(playerID .. ":trainerTeachSkill")
	elseif (screenID == "topped_out") then
		pConvScreen = screen:cloneScreen()
		local clonedConversation = LuaConversationScreen(pConvScreen)

		clonedConversation:setDialogTextStringId(stringTable .. "topped_out")
	elseif (screenID == "no_qualify") then
		pConvScreen = screen:cloneScreen()
		local clonedConversation = LuaConversationScreen(pConvScreen)

		clonedConversation:setDialogTextStringId(stringTable .. "no_qualify")

		SkillTrainer:sendPrereqSui(pPlayer, pNpc, trainerType)
	elseif (screenID == "nsf_skill_points") then
		skillList = SkillTrainer:getTeachableSkills(pPlayer, trainerType, true)
		local skillNum = readData(playerID .. ":trainerTeachSkill")

		pConvScreen = trainerConvHandler:handleNsfSkillPointsScreen(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen, trainerType, stringTable, skillList, skillNum)
	elseif (screenID == "confirm_learn") then
		skillList = SkillTrainer:getTeachableSkills(pPlayer, trainerType, true)
		local skillNum = readData(playerID .. ":trainerTeachSkill")

		pConvScreen = trainerConvHandler:handleConfirmLearnScreen(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen, trainerType, stringTable, skillList, skillNum)
	elseif (screenID == "learn") then
		skillList = SkillTrainer:getTeachableSkills(pPlayer, trainerType, true)
		local skillNum = math.floor(selectedOption + 1)

		pConvScreen = trainerConvHandler:handleLearnScreen(pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen, trainerType, stringTable, skillList, skillNum)
	elseif (screenID == "info") then
		pConvScreen = screen:cloneScreen()
		local clonedConversation = LuaConversationScreen(pConvScreen)

		skillList = SkillTrainer:getTeachableSkills(pPlayer, trainerType, false)
		local skillNum = math.floor(selectedOption + 1)
		local skillName = skillList[skillNum]

		clonedConversation:setDialogTextStringId(stringTable .. "msg3_3")
		clonedConversation:addOption("@skill_teacher:opt1_1", "msg2_1")
		clonedConversation:addOption("@skill_teacher:opt1_2", "msg2_2")
		SkillTrainer:sendSkillInfoSui(pPlayer, pNpc, skillName)
	end

	return pConvScreen
end


return MysteriousManConvoHandler