-- Legend of Hondo Merchant System
-- By Tatwi www.tpot.ca 2015


u8l7_template = ConvoTemplate:new {
  initialScreen = "start",
  templateType = "Lua",
  luaClassHandler = "N3wBMerchantConvoHandler",
  screens = { {
    id = "start",
    leftDialog = "",
    customDialogText = "Hello, I am N-3wB, Human - Cyborg relations. How may I be of assistance today?",
    stopConversation = "false",
    options = {
      { "I need some basic crafting equipment.",   "shop" },
      { "Know where I can find a starter weapon?", "shop" },
      { "What can you tell me about this place?",  "help1" },
      { "Hey! You dropped your pocket!",           "nope" }
    }
  }, {
    id = "shop",
    leftDialog = "",
    customDialogText = "Indeed! The city supplies me with an endless amount of items people like yourself might find useful. Here is what I have available.",
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
    customDialogText = "Do take care of yourself.",
    stopConversation = "true",
    options = {
    }
  }, {
    id = "nope",
    leftDialog = "",
    customDialogText = "Hmmm.... Head lamp fluid I can understand, but in this dusty environment it's a travesty that they're out of elbow grease! ***BZZZZRRRRP ERR...OR*** Sorry, were you talking?",
    stopConversation = "true",
    options = {
    }
  }, {
    id = "get_lost",
    leftDialog = "",
    customDialogText = "You've got some nerve showing your face around here!",
    stopConversation = "false",
    options = {
      { "Says the tin man.", "get_lost_reply" }
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
    id = "help1",
    leftDialog = "",
    customDialogText = "It looks to me, that you are a member of that... group of adventuring entrepreneurs who recently relocated here from Lok. The generousity and hard work of your group has really made a positive impact here in Mos Espa. In fact, the crime rate has declined so much that the Imperial presence has dimimished significantly beyond their garrison on the ourskirts of town. You'll find many comforts and facilities are available to you here in Mos Espa",
    stopConversation = "false",
    options = {
      { "Are there other helpers like you?", "help1a" },
      { "Anything new I should know about?", "help1b" },
      { "How do I earn credits?",            "help1c" },
      { "Interesting. See you later.",       "bye" },
    }
  }, {
    id = "help1a",
    leftDialog = "",
    customDialogText = "Yes, there are many merchants, guides, and other characters throughout the galaxy who offer services such as item sales and item purchasing, while others may have tasks they need accomplished. Here in Mos Espa you will find Crazy Larry in the cantina. I know he has some... rarer goods!",
    stopConversation = "false",
    options = {
      { "Anything new I should know about?",   "help1b" },
      { "How do I earn credits?",              "help1c" },
      { "May I see what you have for sale?",   "shop" },
      { "Sounds like I need to go exploring!", "bye" }
    }
  }, {
    id = "help1b",
    leftDialog = "",
    customDialogText = "Let me put it this way, you're in a whole new world, starting on an adventure unlike any you have had before. Forget your previous experiences and enjoy this galaxy for what it is!",
    stopConversation = "false",
    options = {
      { "Are there other helpers like you?", "help1a" },
      { "How do I earn credits?",            "help1c" },
      { "May I see what you have for sale?", "shop" },
      { "Read the manual? Buhahahaha!",      "bye" }
    }
  }, {
    id = "help1c",
    leftDialog = "",
    customDialogText = "Your two main sources of income will be missions, from Mission Terminals like the ones nearby, and selling stuff to other players!. You can also make a bit of extra credits selling stuff to junk dealers.",
    stopConversation = "false",
    options = {
      { "Are there other helpers like you?", "help1a" },
      { "Anything new I should know about?", "help1b" },
      { "May I see what you have for sale?", "shop" },
      { "OK... great, thanks!",              "bye" }
    }
  }
  }
}

-- Template Footer
addConversationTemplate("u8l7_template", u8l7_template);
