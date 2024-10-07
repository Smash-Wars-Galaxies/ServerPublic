rancor_boss = Creature:new {
	customName = "Corrupted Rancor",
	socialGroup = "rancor",
	faction = "",
	mobType = MOB_CARNIVORE,
	level = 500,
	chanceHit = 70.0,
	damageMin = 500,
	damageMax = 1300,
	baseXp = 600549,
	baseHAM = 290000,
	baseHAMmax = 310000,
	armor = 3,
	resists = {35,85,65,85,85,85,65,85,60},
	meatType = "meat_carnivore",
	meatAmount = 1000,
	hideType = "hide_bristley",
	hideAmount = 950,
	boneType = "bone_mammal",
	boneAmount = 905,
	milk = 0,
	tamingChance = 0,
	ferocity = 30,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + STALKER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,
	scale = 1.5,

	templates = {"object/mobile/rancor.iff"},
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
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"creatureareacombo","stateAccuracyBonus=100"},
		{"creatureareaknockdown","stateAccuracyBonus=100"},
		{"creatureareadisease","stateAccuracyBonus=90"},
		{"strongdisease",""},
		{"poisongascloud",""}
	}
}

CreatureTemplates:addCreatureTemplate(rancor_boss, "rancor_boss")
