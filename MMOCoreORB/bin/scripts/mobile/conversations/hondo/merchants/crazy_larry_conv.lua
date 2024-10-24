-- Legend of Hondo Merchant System
-- By Tatwi www.tpot.ca 2015


crazylarry_template = ConvoTemplate:new {
  initialScreen = "start",
  templateType = "Lua",
  luaClassHandler = "CrazyLarryMerchantConvoHandler",
  screens = { {
    id = "start",
    leftDialog = "",
    customDialogText = "Welcome to Crazy Larry's Emporn... Empor... SHOP! I'm Crazy Larry!",
    stopConversation = "false",
    options = {
      { "Yeah, I know your name Larry...", "banter1" },
    }
  }, {
    id = "shop",
    leftDialog = "",
    customDialogText = "Here's what I have in stock at the moment...",
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
    customDialogText = "I swear it's in good condition!",
    stopConversation = "true",
    options = {
    }
  }, {
    id = "nope",
    leftDialog = "",
    customDialogText = "Well then...",
    stopConversation = "true",
    options = {
    }
  }, {
    id = "get_lost",
    leftDialog = "",
    customDialogText = "You've got some nerve showing your face around here!",
    stopConversation = "false",
    options = {
      { "At least mine is a pretty face!", "get_lost_reply" }
    }
  }, {
    id = "get_lost_reply",
    leftDialog = "",
    customDialogText = "Please don't make me contact the authorities.",
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
    id = "banter1",
    leftDialog = "",
    customDialogText = "Sorry. It's pretty busy around here lately... Nice to see another member of the Lokian gang for a change. What can I do for you?",
    stopConversation = "false",
    options = {
      { "You sell fish tanks, right?",  "banter2" },
      { "What are you selling?",        "shop" },
      { "Wadya buying? Wadya selling?", "shop" }
    }
  }, {
    id = "banter2",
    leftDialog = "",
    customDialogText = "I just found some sweet new jammers (shhh... don't tell anyone) and some other... less reuptable goods.",
    stopConversation = "false",
    options = {
      { "You're the man to see!", "banter3" }
    }
  }, {
    id = "banter3",
    leftDialog = "",
    customDialogText = "I guess that is what I am these days... Ah well, business is good! So, wadya say? ",
    stopConversation = "false",
    options = {
      { "Want to join us on our next job?", "banter4" },
      { "Care to show me your inventory?",  "shop" }
    }
  }, {
    id = "banter4",
    leftDialog = "",
    customDialogText = "I dunno... since we left Nym's and started our own thing here, you guys have done great with the pirating without me. I'm happy enough just finding... goodies.",
    stopConversation = "false",
    options = {
      { "Alright, old man. Let's see what you've got then.", "shop" }
    }
  }
  }
}

-- Template Footer
addConversationTemplate("crazylarry_template", crazylarry_template);
