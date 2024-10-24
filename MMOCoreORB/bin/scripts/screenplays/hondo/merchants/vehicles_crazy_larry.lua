CrazyLarryMerchantConvoHandler = MerchantConvoHandler:new {
	__type = "CrazyLarryMerchantConvoHandler",
	relations = {
		{ name = "jawa",          npcStanding = 100,   priceAdjust = 25 }, -- Friends
		{ name = "tusken_raider", npcStanding = -2000, priceAdjust = 10 }, -- Enemy
	},
	goods = {
		{ optName = "vendor_loot",         cost = 1000,  itemName = "Some Stuff I Found",   items = { "vendor_loot" } },
		{ optName = "vendor_strange",      cost = 25000, itemName = "Random Strange Items", items = { "strange_items" } },
		{ optName = "item_craft_hack",     cost = 50000, itemName = "Cr.4.ft Hacking Chip", items = { "object/tangible/component/item/craft_hack.iff" } },
		-- { optName = "item_scanner_jammer", cost = 25000, itemName = "Phantom SRS Jammer",   items = { "object/tangible/component/item/scanner_jammer.iff" } },
	},
}
