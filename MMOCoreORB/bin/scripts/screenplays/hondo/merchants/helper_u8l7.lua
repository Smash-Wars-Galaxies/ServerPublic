N3wBMerchantConvoHandler = MerchantConvoHandler:new {
	__type = "N3wBMerchantConvoHandler",
	relations = {
		{ name = "townsperson", npcStanding = -9000, priceAdjust = 10 }, -- Adjust price only
	},
	goods = {
		{ optName = "generic_tool",    cost = 500, itemName = "Generic Crafting Tool",           items = { "object/tangible/crafting/station/generic_tool.iff" } },
		{ optName = "food_tool",       cost = 500, itemName = "Food and Chemical Crafting Tool", items = { "object/tangible/crafting/station/food_tool.iff" } },
		{ optName = "survey_mineral",  cost = 500, itemName = "Mineral Survey Tool",             items = { "object/tangible/survey_tool/survey_tool_mineral.iff" } },
		{ optName = "survey_chemical", cost = 500, itemName = "Chemical Survey Tool",            items = { "object/tangible/survey_tool/survey_tool_liquid.iff" } },
		{ optName = "pistol",          cost = 500, itemName = "CDEF Pistol",                     items = { "object/weapon/ranged/pistol/pistol_cdef.iff" } },
		{ optName = "carbine",         cost = 500, itemName = "CDEF Carbine",                    items = { "object/weapon/ranged/carbine/carbine_cdef.iff" } },
		{ optName = "rifle",           cost = 500, itemName = "CDEF Rifle",                      items = { "object/weapon/ranged/rifle/rifle_cdef.iff" } },
		{ optName = "staff",           cost = 500, itemName = "Wood Staff",                      items = { "object/weapon/melee/polearm/lance_staff_wood_s1.iff" } },
		{ optName = "axe",             cost = 500, itemName = "Heavy Duty Axe",                  items = { "object/weapon/melee/axe/axe_heavy_duty.iff" } },
		{ optName = "slitherhorn",     cost = 500, itemName = "Slitherhorn (instrument)",        items = { "object/tangible/instrument/slitherhorn.iff" } },
	},
}
