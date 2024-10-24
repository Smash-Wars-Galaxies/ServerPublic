NalYaroMerchantConvoHandler = MerchantConvoHandler:new {
	__type = "NalYaroMerchantConvoHandler",
	relations = {
		--{name="jabba", npcStanding=50, priceAdjust=5}, -- Friend
		{ name = "borvo",    npcStanding = -4000, priceAdjust = 5 }, -- Enemy
		{ name = "valarian", npcStanding = -200,  priceAdjust = 10 }, -- Enemy
		{ name = "hutt",     npcStanding = -200,  priceAdjust = 10 }, -- Enemy
	},
	goods = {
		{ optName = "vendor_loot",     cost = 1000, itemName = "Some Stuff I Found",  items = { "vendor_loot" } },
		{ optName = "vendor_creature", cost = 5000, itemName = "Some Creature Stuff", items = { "vendor_creature" } },
	},
}
