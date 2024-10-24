-- Legend of Hondo Merchant System
-- By Tatwi www.tpot.ca 2015


volriklonugs_template = ConvoTemplate:new {
  initialScreen = "start",
  templateType = "Lua",
  luaClassHandler = "VolrikLonugsMerchantConvoHandler",
  screens = { {
    id = "start",
    leftDialog = "",
    customDialogText = "In the market for gear are ya?",
    stopConversation = "false",
    options = {
      { "That's right.",                          "shop" },
      { "Is this the only place I can get gear?", "help1" },
      { "Nope",                                   "nope" }
    }
  }, {
    id = "shop",
    leftDialog = "",
    customDialogText = "Honestly, it's a grab bag. You might get something useful, you might not. Who knows. Wanna buy?",
    stopConversation = "true",
    options = {
    }
  }, {
    id = "confirm_purchase",
    leftDialog = "",
    customDialogText = "Are you sure you would like to make this purchase?",
    stopConversation = "false",
    options = {
    }
  }, {
    id = "bye",
    leftDialog = "",
    customDialogText = "Careful out there.",
    stopConversation = "true",
    options = {
    }
  }, {
    id = "nope",
    leftDialog = "",
    customDialogText = "Good luck to ya!",
    stopConversation = "true",
    options = {
    }
  }, {
    id = "get_lost",
    leftDialog = "",
    customDialogText = "You've got a lot of nerve showing your face around here!",
    stopConversation = "false",
    options = {
      { "Really? Is it worth anything? If so, can I interest you in buying some?", "get_lost_reply" }
    }
  }, {
    id = "get_lost_reply",
    leftDialog = "",
    customDialogText = "Out!",
    stopConversation = "true",
    options = {
    }
  }, {
    id = "faction_too_low",
    leftDialog = "",
    customDialogText = "Sorry, but I don't trust you enough to do business with you.",
    stopConversation = "true",
    options = {
    }
  }, {
    id = "insufficient_funds",
    leftDialog = "",
    customDialogText = "Sorry, but you do not have enough credits on hand to make this purchase.",
    stopConversation = "true",
    options = {
    }
  }, {
    id = "help1",
    leftDialog = "",
    customDialogText = "The Empire will happily suit you up if you join them. Bet them Rebels would too. Otherwise, ya might need to get some second hand stuff, if you catch my meaning, or get someone on your crew to craft some for ya. There are some merchants on other planets of course, but that's dangerous stuff I don't know much about...",
    stopConversation = "false",
    options = {
      { "Really? No one else sells gear?",   "help1a" },
      { "OK, show me what you've got.",      "shop" },
      { "I see. Well, thanks for the tips.", "bye" }
    }
  }, {
    id = "help1a",
    leftDialog = "",
    customDialogText = "*cough* There is no finer establishment for gear than our own!",
    stopConversation = "false",
    options = {
      { "OK, show me what you've got.",                  "shop" },
      { "Riiiight, cetainly not! Thanks for your time.", "bye" }
    }
  }
  }
}

-- Template Footer
addConversationTemplate("volriklonugs_template", volriklonugs_template);
