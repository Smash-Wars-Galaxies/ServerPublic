forceGhostConvoTemplate = ConvoTemplate:new {
	initialScreen = "",
	templateType = "Lua",
	luaClassHandler = "ForceGhostConvoHandler",
	screens = {
        {
            id = "cant_convert",
            leftDialog = "",
            customDialogText = "I have no interest in speaking to you... ",
            stopConversation = "true",
            options = {}
        }, {
            id = "trainers",
            leftDialog = "",
            customDialogText = "I can help you no more, you must seek out Jarek and Kyra...",
            stopConversation = "false",
            options = {
                {"Where can I find them?", "location"}
            }
        },{
            id = "location",
            leftDialog = "",
            customDialogText = "The Force will guide you...",
            stopConversation = "true",
            options = {}
        },{
            id = "extra_bad_faction",
            leftDialog = "",
            customDialogText = "Your inability to build relationships with others makes me not want to talk to you at all.",
            stopConversation = "true",
            options = {}
        },{
            id = "really_bad_faction",
            leftDialog = "",
            customDialogText = "I could teach you the secrets of the universe, but you have very poor relations with people. Show me you can build relations with others.",
            stopConversation = "true",
            options = {}
        },{
            id = "bad_faction",
            leftDialog = "",
            customDialogText = "I want to teach you the secrets of the universe, but you have somewhat poor relations with people. Show me you can build relations with others.",
            stopConversation = "true",
            options = {}
        },{
            id = "kinda_bad_faction",
            leftDialog = "",
            customDialogText = "You want to learn the secrets of the universe? You are decent at making relations with others, show me you can do better. ",
            stopConversation = "true",
            options = {}
        },{
            id = "almost_bad_faction",
            leftDialog = "",
            customDialogText = "I'd like to teach you everything I know, and you are showing great promise. Continue to build relations with others.",
            stopConversation = "true",
            options = {}
        },{
            id = "become_fs",
            leftDialog = "",
            customDialogText = "So you found me at last... Are you interested in learning the secrets of the universe?",
            stopConversation = "false",
            options = {
                {"Absolutely!", "learn_force"},
                {"I don't think so...", "cant_convert"}
            }
        },{
            id = "learn_force",
            leftDialog = "@conversation/fs_experience_converter:s_433c2a58", -- Allow me to help you to open your mind to new possibilities...
            stopConversation = "true",
            options = {}
        }
    }
}

addConversationTemplate("forceGhostConvoTemplate", forceGhostConvoTemplate);

