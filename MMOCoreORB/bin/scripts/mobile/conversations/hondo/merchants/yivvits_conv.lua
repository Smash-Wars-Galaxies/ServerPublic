-- Legend of Hondo Merchant System
-- By Tatwi www.tpot.ca 2015


yivvits_template = ConvoTemplate:new {
  initialScreen = "start",
  templateType = "Lua",
  luaClassHandler = "YivvitsMerchantConvoHandler",
  screens = { {
    id = "start",
    leftDialog = "",
    customDialogText = "Hello. Are you in need of a basic weapon to start practicing an adanced profession? If so, you've come to the right place.",
    stopConversation = "false",
    options = {
      { "May I see what you have in stock?", "shop" },
      { "Nope",                              "nope" }
    }
  }, {
    id = "shop",
    leftDialog = "",
    customDialogText = "These are all refurbished weapons, not so great, but they'll give you the experience you need to advance in your chosen profession.",
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
    customDialogText = "Thank you for your business.",
    stopConversation = "true",
    options = {
    }
  }, {
    id = "nope",
    leftDialog = "",
    customDialogText = "Rude to a Wookiee who's selling weapons... Are you brave or stupid?",
    stopConversation = "true",
    options = {
    }
  }, {
    id = "get_lost",
    leftDialog = "",
    customDialogText = "You've got some nerve showing your face around here!",
    stopConversation = "false",
    options = {
      { "Ah man, now what am I going to do?", "get_lost_reply" }
    }
  }, {
    id = "get_lost_reply",
    leftDialog = "",
    customDialogText = "Make like a tree and leave?",
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
  }
  }
}


-- Template Footer
addConversationTemplate("yivvits_template", yivvits_template);
