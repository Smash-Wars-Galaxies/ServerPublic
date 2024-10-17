forceGhostConvoTemplate = ConvoTemplate:new {
	initialScreen = "intro",
	templateType = "Lua",
	luaClassHandler = "ForceGhostConvoHandler",
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
forceGhostConvoTemplate:addScreen(cant_convert);

trainers = ConvoScreen:new {
    id = "trainers",
    leftDialog = "",
    customDialogText = "I can help you no more, you must seek out Jarek and Kyra...",
    stopConversation = "true",
    options = {}
}
forceGhostConvoTemplate:addScreen(trainers);

extra_bad_faction = ConvoScreen:new {
    id = "extra_bad_faction",
    leftDialog = "",
    customDialogText = "Your inability to build relationships with others makes me not want to talk to you at all.",
    stopConversation = "true",
    options = {}
}
forceGhostConvoTemplate:addScreen(extra_bad_faction);

really_bad_faction = ConvoScreen:new {
    id = "really_bad_faction",
    leftDialog = "",
    customDialogText = "I could teach you the secrets of the universe, but you have very poor relations with people. Show me you can build relations with others.",
    stopConversation = "true",
    options = {}
}
forceGhostConvoTemplate:addScreen(really_bad_faction);

bad_faction = ConvoScreen:new {
    id = "bad_faction",
    leftDialog = "",
    customDialogText = "I want to teach you the secrets of the universe, but you have somewhat poor relations with people. Show me you can build relations with others.",
    stopConversation = "true",
    options = {}
}
forceGhostConvoTemplate:addScreen(bad_faction);

kinda_bad_faction = ConvoScreen:new {
    id = "kinda_bad_faction",
    leftDialog = "",
    customDialogText = "You want to learn the secrets of the universe? You are decent at making relations with others, show me you can do better. ",
    stopConversation = "true",
    options = {}
}
forceGhostConvoTemplate:addScreen(kinda_bad_faction);

almost_bad_faction = ConvoScreen:new {
    id = "almost_bad_faction",
    leftDialog = "",
    customDialogText = "I'd like to teach you everything I know, and you are showing great promise. Continue to build relations with others.",
    stopConversation = "true",
    options = {}
}
forceGhostConvoTemplate:addScreen(almost_bad_faction);

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
forceGhostConvoTemplate:addScreen(become_fs);

addConversationTemplate("forceGhostConvoTemplate", forceGhostConvoTemplate);

