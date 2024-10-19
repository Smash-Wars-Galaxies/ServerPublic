jediConverterConvoTemplate = ConvoTemplate:new {
	initialScreen = "intro",
	templateType = "Lua",
	luaClassHandler = "JediConverterConvoHandler",
	screens = {
		{
			id = "intro",
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
		}, {
			id = "learn_crafting",
			leftDialog = "@conversation/fs_experience_converter:s_7542cfea", -- Allow me to help you understand your experiences...
			stopConversation = "true",
			options = {}
		}, {
			id = "learn_combat",
			leftDialog = "@conversation/fs_experience_converter:s_7542cfea", -- Allow me to help you understand your experiences...
			stopConversation = "true",
			options = {}
		}, {
			id = "learn_senses",
			leftDialog = "@conversation/fs_experience_converter:s_7542cfea", -- Allow me to help you understand your experiences...
			stopConversation = "true",
			options = {}
		}, {
			id = "learn_reflex",
			leftDialog = "@conversation/fs_experience_converter:s_7542cfea", -- Allow me to help you understand your experiences...
			stopConversation = "true",
			options = {}
		}, {
			id = "learn_force",
			leftDialog = "@conversation/fs_experience_converter:s_433c2a58", -- Allow me to help you to open your mind to new possibilities...
			stopConversation = "true",
			options = {}
		}, {
			id = "what_aspects",
			leftDialog = "@conversation/fs_experience_converter:s_7abe0196", -- I sense that you are able to learn the following: %TO
			stopConversation = "true",
			options = {}
		}, {
			id = "no_business",
			leftDialog = "",
			customDialogText = "Sorry Stranger, I don't think we have any business to conduct.",
			stopConversation = "true",
			options = {}
		}
	}
}

addConversationTemplate("jediConverterConvoTemplate", jediConverterConvoTemplate);
