-- Legend of Hondo Merchant System
-- By Tatwi www.tpot.ca 2015


cyanyaro_template = ConvoTemplate:new {
  initialScreen = "start",
  templateType = "Lua",
  luaClassHandler = "CyanYaroMerchantConvoHandler",
  screens = { {
    id = "start",
    leftDialog = "",
    customDialogText = "Hey, don't mind Nal. He's a bit thickheaded, but he makes for a loyal husband. Looking for some Bounty Hunter gear, are you?",
    stopConversation = "false",
    options = {
      { "Yes, what can you tell me about it?", "help1" },
      { "Nope",                                "nope" }
    }
  }, {
    id = "shop",
    leftDialog = "",
    customDialogText = "Made your choice, have you? Money well spent if you ask me!",
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
    customDialogText = "Come back real soon, darlin!",
    stopConversation = "true",
    options = {
    }
  }, {
    id = "nope",
    leftDialog = "",
    customDialogText = "I'm not to be trifled with. Toyed with, perhaps, but not trifled.",
    stopConversation = "true",
    options = {
    }
  }, {
    id = "get_lost",
    leftDialog = "",
    customDialogText = "You've got some nerve showing your face around here!",
    stopConversation = "false",
    options = {
      { "Backing away slowly...", "get_lost_reply" }
    }
  }, {
    id = "get_lost_reply",
    leftDialog = "",
    customDialogText = "Speed it up, ugly!",
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
    customDialogText = "What exactly would you like to know more about, hun?",
    stopConversation = "false",
    options = {
      { "Tell me about the tools of the trade.", "tools" },
      { "Is that Bounty Hunter Armor any good?", "bounty_hunter" },
      { "You sell Mabari Armor, eh? How is it?", "mabari" }
    }
  }, {
    id = "tools",
    leftDialog = "",
    customDialogText = "Don't know who sells'em to be honest, but if you ever hope to find your mark you're going to need to get some droids. Arakyd Probe Droids can be sent out to find what planet the mark is on and Seeker droids will find and track the mark when let loose on the same planet. Get a Droid Engineer on your crew to make some for you.",
    stopConversation = "false",
    options = {
      { "I have some more questions.",     "help1" },
      { "Alright, show me your prices...", "shop" },
      { "Yeah. Well, I have to be going.", "bye" }
    }
  }, {
    id = "bounty_hunter",
    leftDialog = "",
    customDialogText = "When it comes to protection, yer not going to find anything better than this here Bounty Hunter armor nowheres else. Different maybe, but not better! Boba Fett would disagree, of course, but I think 55% to Kinetic, Energy, Electricity, Blast, and Cold is plenty. He seems to think his Mandolorian suit is better, because it resist Heat and Acic too, but whatever!",
    stopConversation = "false",
    options = {
      { "I have some more questions.",     "help1" },
      { "Alright, show me your prices...", "shop" },
      { "Yeah. Well, I have to be going.", "bye" }
    }
  }, {
    id = "mabari",
    leftDialog = "",
    customDialogText = "Made popular in the Clone Wars by female shape shifter Zam Wesell, a suit of Mabari Armor is very basic in its protections. It's more style than protection really. You're look'n at 24/24/12/4 resists to Kinectic, Energy, Electricity, and Acid. Same as basic Bone Armor really.",
    stopConversation = "false",
    options = {
      { "I have some more questions.",     "help1" },
      { "Alright, show me your prices...", "shop" },
      { "Yeah. Well, I have to be going.", "bye" }
    }
  }
  }
}

-- Template Footer
addConversationTemplate("cyanyaro_template", cyanyaro_template);
