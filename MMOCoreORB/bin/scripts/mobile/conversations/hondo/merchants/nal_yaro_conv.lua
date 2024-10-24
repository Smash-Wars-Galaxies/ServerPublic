-- Legend of Hondo Merchant System
-- By Tatwi www.tpot.ca 2015


nalyaro_template = ConvoTemplate:new {
  initialScreen = "start",
  templateType = "Lua",
  luaClassHandler = "NalYaroMerchantConvoHandler",
  screens = { {
    id = "start",
    leftDialog = "",
    customDialogText = "I ain't got time for chatter. Do you wanna buy some stuff or not?",
    stopConversation = "false",
    options = {
      { "Sure thing, boss.", "shop" },
      { "Nope",              "nope" }
    }
  }, {
    id = "shop",
    leftDialog = "",
    customDialogText = "People bring me the dead creatures they kill. I get the most out of it. You buy it.",
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
    customDialogText = "Get outa here, ya bum!",
    stopConversation = "true",
    options = {
    }
  }, {
    id = "nope",
    leftDialog = "",
    customDialogText = "Ooo, I oughta feed ya to the Sarlaac fer wastin' my time!",
    stopConversation = "true",
    options = {
    }
  }, {
    id = "get_lost",
    leftDialog = "",
    customDialogText = "You've got some nerve showing your face around here!",
    stopConversation = "false",
    options = {
      { "I'm leaving...", "get_lost_reply" }
    }
  }, {
    id = "get_lost_reply",
    leftDialog = "",
    customDialogText = "You're luck we're lettin' ya.",
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
addConversationTemplate("nalyaro_template", nalyaro_template);
