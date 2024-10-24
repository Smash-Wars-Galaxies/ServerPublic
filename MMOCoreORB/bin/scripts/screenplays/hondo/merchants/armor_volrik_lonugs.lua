VolrikLonugsMerchantConvoHandler = MerchantConvoHandler:new {
	__type = "VolrikLonugsMerchantConvoHandler",
	relations = {
		{ name = "tusken_raider", npcStanding = 100,   priceAdjust = 25 }, -- Friends
		{ name = "jawa",          npcStanding = -2000, priceAdjust = 10 }, -- Enemy
	},
	goods = {
		{ optName = "vendor_loot",  cost = 1000,  itemName = "Some Stuff I Found",           items = { "vendor_loot" } },
		{ optName = "vendor_gear",  cost = 5000,  itemName = "Some Random Gear",             items = { "vendor_gear" } },
		{ optName = "vendor_tapes", cost = 25000, itemName = "An Armor/Clothing Attachment", items = { "all_attachments" } },
	},
}
