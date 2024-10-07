deathsting_boss = Creature:new {
	customName = "Corrupted Deathsting",
	socialGroup = "krayt",
	faction = "",
	mobType = MOB_CARNIVORE,
	level = 500,
	chanceHit = 70.0,
	damageMin = 5570,
	damageMax = 7950,
	baseXp = 28549,
	baseHAM = 1810000,
	baseHAMmax = 1850000,
	armor = 3,
	resists = {85,45,85,65,55,85,85,85,65},
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
	scale = 5.5,

	templates = {"object/mobile/som/deathsting.iff"},
	lootGroups = {
		{
	        groups = {
				{group = "junk", chance = 10000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "junk", chance = 10000000}
			},
			lootChance = 10000000
		},

	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"creatureareacombo","stateAccuracyBonus=100"},
		{"creatureareaknockdown","stateAccuracyBonus=100"},
		{"intimidationattack","stateAccuracyBonus=100"}
	}
}

CreatureTemplates:addCreatureTemplate(deathsting_boss, "deathsting_boss")
