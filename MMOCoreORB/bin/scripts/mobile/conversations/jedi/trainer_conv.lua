jediFSTrainerConvoTemplate = ConvoTemplate:new {
	initialScreen = "intro",
	templateType = "Lua",
	luaClassHandler = "JediFSTrainerConvoHandler",
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
jediFSTrainerConvoTemplate:addScreen(trainerType);

no_business = ConvoScreen:new {
    id = "no_business",
    leftDialog = "",
    customDialogText = "Not interested.",
    stopConversation = "true",
    options = {}
}
jediFSTrainerConvoTemplate:addScreen(no_business);

intro = ConvoScreen:new {
    id = "intro",
    leftDialog = "",
    stopConversation = "false",
    options = {}
}
jediFSTrainerConvoTemplate:addScreen(intro_trainer);

trainer_unknown = ConvoScreen:new {
    id = "trainer_unknown",
    leftDialog = "@skill_teacher:trainer_unknown",
    stopConversation = "true",
    options = {}
}
jediFSTrainerConvoTemplate:addScreen(trainer_unknown);

topped_out = ConvoScreen:new {
    id = "topped_out",
    leftDialog = "",
    stopConversation = "true",
    options = {}
}
jediFSTrainerConvoTemplate:addScreen(topped_out);

no_qualify = ConvoScreen:new {
    id = "no_qualify",
    leftDialog = "",
    stopConversation = "true",
    options = {}
}
jediFSTrainerConvoTemplate:addScreen(no_qualify);

msg2_1 = ConvoScreen:new {
    id = "msg2_1",
    leftDialog = "",
    stopConversation = "false",
    options = {}
}
jediFSTrainerConvoTemplate:addScreen(msg2_1);

msg2_2 = ConvoScreen:new {
    id = "msg2_2",
    leftDialog = "",
    stopConversation = "false",
    options = {}
}
jediFSTrainerConvoTemplate:addScreen(msg2_2);

learn = ConvoScreen:new {
    id = "learn",
    leftDialog = "",
    stopConversation = "false",
    options = {}
}
jediFSTrainerConvoTemplate:addScreen(learn);

confirm_learn = ConvoScreen:new {
    id = "confirm_learn",
    leftDialog = "",
    stopConversation = "false",
    options = {}
}
jediFSTrainerConvoTemplate:addScreen(confirm_learn);

cancel_learn = ConvoScreen:new {
    id = "cancel_learn",
    leftDialog = "",
    stopConversation = "false",
    options = {
        {"@skill_teacher:opt1_1", "msg2_1"}, -- I'm interested in learning a skill.
        {"@skill_teacher:opt1_2", "msg2_2"} -- What skills will I be able to learn next?
    }
}
jediFSTrainerConvoTemplate:addScreen(cancel_learn);

info = ConvoScreen:new {
    id = "info",
    leftDialog = "",
    stopConversation = "false",
    options = {}
}
jediFSTrainerConvoTemplate:addScreen(info);

nsf_skill_points = ConvoScreen:new {
    id = "nsf_skill_points",
    leftDialog = "",
    stopConversation = "false",
    options = {}
}
jediFSTrainerConvoTemplate:addScreen(nsf_skill_points);

addConversationTemplate("jediFSTrainerConvoTemplate", jediFSTrainerConvoTemplate);