jediTrainerConvoTemplate = ConvoTemplate:new {
	initialScreen = "intro",
	templateType = "Lua",
	luaClassHandler = "JediTrainerConvoHandler",
	screens = {}
}
--[[ 
    Force Sensitive Training
    From: MMOCoreORB/bin/scripts/mobile/conversations/trainer/trainer_conv.lua
--]]

trainerType = ConvoScreen:new {
    id = "trainerType",
    leftDialog = "trainerType", -- Storage for the type of trainer, so it can be pulled in the convo handler.
    stopConversation = "false",
    options = {
        { "trainerType" , "trainer_fs" }
    }
}
jediTrainerConvoTemplate:addScreen(trainerType);

no_business = ConvoScreen:new {
    id = "no_business",
    leftDialog = "",
    customDialogText = "Not interested.",
    stopConversation = "true",
    options = {}
}
jediTrainerConvoTemplate:addScreen(no_business);

intro = ConvoScreen:new {
    id = "intro",
    leftDialog = "",
    stopConversation = "false",
    options = {}
}
jediTrainerConvoTemplate:addScreen(intro_trainer);

trainer_unknown = ConvoScreen:new {
    id = "trainer_unknown",
    leftDialog = "@skill_teacher:trainer_unknown",
    stopConversation = "true",
    options = {}
}
jediTrainerConvoTemplate:addScreen(trainer_unknown);

topped_out = ConvoScreen:new {
    id = "topped_out",
    leftDialog = "",
    stopConversation = "true",
    options = {}
}
jediTrainerConvoTemplate:addScreen(topped_out);

no_qualify = ConvoScreen:new {
    id = "no_qualify",
    leftDialog = "",
    stopConversation = "true",
    options = {}
}
jediTrainerConvoTemplate:addScreen(no_qualify);

msg2_1 = ConvoScreen:new {
    id = "msg2_1",
    leftDialog = "",
    stopConversation = "false",
    options = {}
}
jediTrainerConvoTemplate:addScreen(msg2_1);

msg2_2 = ConvoScreen:new {
    id = "msg2_2",
    leftDialog = "",
    stopConversation = "false",
    options = {}
}
jediTrainerConvoTemplate:addScreen(msg2_2);

learn = ConvoScreen:new {
    id = "learn",
    leftDialog = "",
    stopConversation = "false",
    options = {}
}
jediTrainerConvoTemplate:addScreen(learn);

confirm_learn = ConvoScreen:new {
    id = "confirm_learn",
    leftDialog = "",
    stopConversation = "false",
    options = {}
}
jediTrainerConvoTemplate:addScreen(confirm_learn);

cancel_learn = ConvoScreen:new {
    id = "cancel_learn",
    leftDialog = "",
    stopConversation = "false",
    options = {
        {"@skill_teacher:opt1_1", "msg2_1"}, -- I'm interested in learning a skill.
        {"@skill_teacher:opt1_2", "msg2_2"} -- What skills will I be able to learn next?
    }
}
jediTrainerConvoTemplate:addScreen(cancel_learn);

info = ConvoScreen:new {
    id = "info",
    leftDialog = "",
    stopConversation = "false",
    options = {}
}
jediTrainerConvoTemplate:addScreen(info);

nsf_skill_points = ConvoScreen:new {
    id = "nsf_skill_points",
    leftDialog = "",
    stopConversation = "false",
    options = {}
}
jediTrainerConvoTemplate:addScreen(nsf_skill_points);

addConversationTemplate("jediTrainerConvoTemplate", jediTrainerConvoTemplate);