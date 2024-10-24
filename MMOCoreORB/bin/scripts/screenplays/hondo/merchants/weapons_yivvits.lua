YivvitsMerchantConvoHandler = MerchantConvoHandler:new {
	__type = "YivvitsMerchantConvoHandler",
	relations = {
		{ name = "townsperson", npcStanding = -9000, priceAdjust = 15 }, -- Adjust price only
		{ name = "thug",        npcStanding = -3000, priceAdjust = 30 } -- Enemy
	},
	goods = {
		{ optName = "bounty_hunter", cost = 10000, itemName = "Bounty Hunter Rifle",             items = { "object/weapon/ranged/rifle/rifle_lightning.iff" } },
		{ optName = "rifleman",      cost = 10000, itemName = "Rifleman Laser Rifle",            items = { "object/weapon/ranged/rifle/rifle_laser_noob.iff" } },
		{ optName = "tka",           cost = 10000, itemName = "Teras Kasi Artist Vibroknuckler", items = { "object/weapon/melee/special/vibroknuckler.iff" } },
		{ optName = "carbineer",     cost = 10000, itemName = "Carbineer Laser Carbine",         items = { "object/weapon/ranged/carbine/carbine_laser.iff" } },
		{ optName = "commando",      cost = 10000, itemName = "Commando Launcher Pistol",        items = { "object/weapon/ranged/pistol/pistol_launcher.iff" } },
		{ optName = "fencer",        cost = 10000, itemName = "Fencer Ryyk Blade",               items = { "object/weapon/melee/sword/sword_blade_ryyk.iff" } },
		{ optName = "pikeman",       cost = 10000, itemName = "Pikeman Polearm",                 items = { "object/weapon/melee/polearm/polearm_vibro_axe.iff" } },
		{ optName = "pistoleer",     cost = 10000, itemName = "Pistoleer Republic Blaster",      items = { "object/weapon/ranged/pistol/pistol_republic_blaster.iff" } },
		{ optName = "swordsman",     cost = 10000, itemName = "Swordsman Vibroaxe",              items = { "object/weapon/melee/axe/axe_vibroaxe.iff" } }
	}
}
