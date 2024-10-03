mysteriousManConvoTemplate = ConvoTemplate:new {
	initialScreen = "intro",
	templateType = "Lua",
	luaClassHandler = "MysteriousManConvoHandler",
	screens = {}
}

--[[
    Faction Messages
--]]

cant_convert = ConvoScreen:new {
    id = "cant_convert",
    leftDialog = "",
    customDialogText = "I have no interest in speaking to you... ",
    stopConversation = "true",
    options = {}
}
mysteriousManConvoTemplate:addScreen(cant_convert);

extra_bad_faction = ConvoScreen:new {
    id = "extra_bad_faction",
    leftDialog = "",
    customDialogText = "Your inability to build relationships with others makes me not want to talk to you at all.",
    stopConversation = "true",
    options = {}
}
mysteriousManConvoTemplate:addScreen(extra_bad_faction);

really_bad_faction = ConvoScreen:new {
    id = "really_bad_faction",
    leftDialog = "",
    customDialogText = "I could teach you the secrets of the universe, but you have very poor relations with people. Show me you can build relations with others.",
    stopConversation = "true",
    options = {}
}
mysteriousManConvoTemplate:addScreen(really_bad_faction);

bad_faction = ConvoScreen:new {
    id = "bad_faction",
    leftDialog = "",
    customDialogText = "I want to teach you the secrets of the universe, but you have somewhat poor relations with people. Show me you can build relations with others.",
    stopConversation = "true",
    options = {}
}
mysteriousManConvoTemplate:addScreen(bad_faction);

kinda_bad_faction = ConvoScreen:new {
    id = "kinda_bad_faction",
    leftDialog = "",
    customDialogText = "You want to learn the secrets of the universe? You are decent at making relations with others, show me you can do better. ",
    stopConversation = "true",
    options = {}
}
mysteriousManConvoTemplate:addScreen(kinda_bad_faction);

almost_bad_faction = ConvoScreen:new {
    id = "almost_bad_faction",
    leftDialog = "",
    customDialogText = "I'd like to teach you everything I know, and you are showing great promise. Continue to build relations with others.",
    stopConversation = "true",
    options = {}
}
mysteriousManConvoTemplate:addScreen(almost_bad_faction);

become_fs = ConvoScreen:new {
    id = "become",
    leftDialog = "",
    customDialogText = "So you found me at last... Are you interested in learning the secrets of the universe?",
    stopConversation = "false",
    options = {
        {"Absolutely!", "learn_force"},
        {"I don't think so...", "cant_convert"}
    }
}
mysteriousManConvoTemplate:addScreen(become_fs);

--[[ 
    Force Sensitive XP Conversion
    From: MMOCoreORB/bin/scripts/mobile/conversations/village/paemos_conv.lua     
--]]

intro = ConvoScreen:new {
	id = "intro",
	leftDialog = "Welcome, friend! Come here and tell me how I may help you today?", -- Welcome, friend! Come here and tell me what insight I may provide for you today?
	stopConversation = "false",
	options = {
		{"I wish to broaden my knowledge", "intro_convert"}, -- I wish to learn more about using the Force for crafting.
		{"I wish to train my skills", "intro_trainer"}, -- I wish to learn more about using the Force for combat.
	}
}
mysteriousManConvoTemplate:addScreen(intro);

intro_convert = ConvoScreen:new {
	id = "intro_convert",
	leftDialog = "@conversation/fs_experience_converter:s_962f82a6", -- Welcome, friend! Come here and tell me what insight I may provide for you today?
	stopConversation = "false",
	options = {
		{"@conversation/fs_experience_converter:s_73ab6ff4", "learn_crafting"}, -- I wish to learn more about using the Force for crafting.
		{"@conversation/fs_experience_converter:s_76fa10e4", "learn_combat"}, -- I wish to learn more about using the Force for combat.
		{"@conversation/fs_experience_converter:s_968c3ff6", "learn_senses"}, -- I wish to learn more about using the Force to enchance my senses.
		{"@conversation/fs_experience_converter:s_2734c210", "learn_reflex"}, -- I wish to learn more about using the Force to enhance my reflexes.
		-- Was used to convert old jedi system to new
		--{"@conversation/fs_experience_converter:s_69a7c6ca", "learn_force"}, -- I wish to learn new uses of the Force.
		{"@conversation/fs_experience_converter:s_e4c01185", "what_aspects"} -- What aspects of the Force am I ready to learn?
	}
}
mysteriousManConvoTemplate:addScreen(intro_convert);

learn_crafting = ConvoScreen:new {
	id = "learn_crafting",
	leftDialog = "@conversation/fs_experience_converter:s_7542cfea", -- Allow me to help you understand your experiences...
	stopConversation = "true",
	options = {}
}
mysteriousManConvoTemplate:addScreen(learn_crafting);

learn_combat = ConvoScreen:new {
	id = "learn_combat",
	leftDialog = "@conversation/fs_experience_converter:s_7542cfea", -- Allow me to help you understand your experiences...
	stopConversation = "true",
	options = {}
}
mysteriousManConvoTemplate:addScreen(learn_combat);

learn_senses = ConvoScreen:new {
	id = "learn_senses",
	leftDialog = "@conversation/fs_experience_converter:s_7542cfea", -- Allow me to help you understand your experiences...
	stopConversation = "true",
	options = {}
}
mysteriousManConvoTemplate:addScreen(learn_senses);

learn_reflex = ConvoScreen:new {
	id = "learn_reflex",
	leftDialog = "@conversation/fs_experience_converter:s_7542cfea", -- Allow me to help you understand your experiences...
	stopConversation = "true",
	options = {}
}
mysteriousManConvoTemplate:addScreen(learn_reflex);

learn_force = ConvoScreen:new {
	id = "learn_force",
	leftDialog = "@conversation/fs_experience_converter:s_433c2a58", -- Allow me to help you to open your mind to new possibilities...
	stopConversation = "true",
	options = {}
}
mysteriousManConvoTemplate:addScreen(learn_force);

what_aspects = ConvoScreen:new {
	id = "what_aspects",
	leftDialog = "@conversation/fs_experience_converter:s_7abe0196", -- I sense that you are able to learn the following: %TO
	stopConversation = "true",
	options = {}
}
mysteriousManConvoTemplate:addScreen(what_aspects);

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
mysteriousManConvoTemplate:addScreen(trainerType);

intro_trainer = ConvoScreen:new {
    id = "intro_trainer",
    leftDialog = "",
    stopConversation = "false",
    options = {}
}
mysteriousManConvoTemplate:addScreen(intro_trainer);

trainer_unknown = ConvoScreen:new {
    id = "trainer_unknown",
    leftDialog = "@skill_teacher:trainer_unknown",
    stopConversation = "true",
    options = {}
}
mysteriousManConvoTemplate:addScreen(trainer_unknown);

topped_out = ConvoScreen:new {
    id = "topped_out",
    leftDialog = "",
    stopConversation = "true",
    options = {}
}
mysteriousManConvoTemplate:addScreen(topped_out);

no_qualify = ConvoScreen:new {
    id = "no_qualify",
    leftDialog = "",
    stopConversation = "true",
    options = {}
}
mysteriousManConvoTemplate:addScreen(no_qualify);

msg2_1 = ConvoScreen:new {
    id = "msg2_1",
    leftDialog = "",
    stopConversation = "false",
    options = {}
}
mysteriousManConvoTemplate:addScreen(msg2_1);

msg2_2 = ConvoScreen:new {
    id = "msg2_2",
    leftDialog = "",
    stopConversation = "false",
    options = {}
}
mysteriousManConvoTemplate:addScreen(msg2_2);

learn = ConvoScreen:new {
    id = "learn",
    leftDialog = "",
    stopConversation = "false",
    options = {}
}
mysteriousManConvoTemplate:addScreen(learn);

confirm_learn = ConvoScreen:new {
    id = "confirm_learn",
    leftDialog = "",
    stopConversation = "false",
    options = {}
}
mysteriousManConvoTemplate:addScreen(confirm_learn);

cancel_learn = ConvoScreen:new {
    id = "cancel_learn",
    leftDialog = "",
    stopConversation = "false",
    options = {
        {"@skill_teacher:opt1_1", "msg2_1"}, -- I'm interested in learning a skill.
        {"@skill_teacher:opt1_2", "msg2_2"} -- What skills will I be able to learn next?
    }
}
mysteriousManConvoTemplate:addScreen(cancel_learn);

info = ConvoScreen:new {
    id = "info",
    leftDialog = "",
    stopConversation = "false",
    options = {}
}
mysteriousManConvoTemplate:addScreen(info);

nsf_skill_points = ConvoScreen:new {
    id = "nsf_skill_points",
    leftDialog = "",
    stopConversation = "false",
    options = {}
}
mysteriousManConvoTemplate:addScreen(nsf_skill_points);

addConversationTemplate("mysteriousManConvoTemplate", mysteriousManConvoTemplate);