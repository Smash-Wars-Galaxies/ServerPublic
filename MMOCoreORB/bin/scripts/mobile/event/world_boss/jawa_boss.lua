jawa_boss = Creature:new {
	customName = "Glob the Footpad",
	socialGroup = "jawa",
	faction = "jawa",
	mobType = MOB_NPC,
	level = 500,
	chanceHit = 70.0,
	damageMin = 500,
	damageMax = 1300,
	baseXp = 600549,
	baseHAM = 290000,
	baseHAMmax = 310000,
	--[[damageMin = 7570,
	damageMax = 9950,
	baseXp = 28549,
	baseHAM = 1680000,
	baseHAMmax = 1950000,]]--
	armor = 3,
	resists = {35,40,30,30,0,30,0,30,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + STALKER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,
	scale = 4.0,

	templates = {"object/mobile/jawa.iff"},
	lootGroups = {
		{
			groups = {
				{group = "strange_items", chance = 10000000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "strange_items", chance = 10000000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "strange_items", chance = 10000000}
			},
			lootChance = 10000000
		},

	},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "object/weapon/ranged/rifle/rifle_flame_thrower.iff",
	secondaryWeapon = "none",
	conversationTemplate = "",
	
	-- primaryAttacks and secondaryAttacks should be separate skill groups specific to the weapon type listed in primaryWeapon and secondaryWeapon
	-- Use merge() to merge groups in creatureskills.lua together. If a weapon is set to "none", set the attacks variable to empty brackets
	primaryAttacks = merge(commandomaster,marksmanmaster, { {"poisongascloud",""} }),
	secondaryAttacks = { }
}

CreatureTemplates:addCreatureTemplate(jawa_boss, "jawa_boss")
