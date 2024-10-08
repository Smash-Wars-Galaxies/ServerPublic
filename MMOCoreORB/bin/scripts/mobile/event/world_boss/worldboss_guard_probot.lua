worldboss_guard_probot = Creature:new {
	customName = "Pr0-Atk Droid",
	socialGroup = "worldboss",
	faction = "",
	mobType = MOB_DROID,
	level = 150,
	chanceHit = 0.27,
	damageMin = 380,
	damageMax = 1490,
	baseXp = 30000,
	baseHAM = 20700,
	baseHAMmax = 25900,
	armor = 2,
	resists = {45,45,10,10,10,10,10,10,-1},
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
	scale = 1.5,

	templates = {"object/mobile/probot.iff"},
	lootGroups = {},
	conversationTemplate = "",

	lootGroups = {
		{
			groups = {
				{group = "strange_items", chance = 5000000},
				{group = "junk", chance = 5000000}
			}
		}
	},

	-- Primary and secondary weapon should be different types (rifle/carbine, carbine/pistol, rifle/unarmed, etc)
	-- Unarmed should be put on secondary unless the mobile doesn't use weapons, in which case "unarmed" should be put primary and "none" as secondary
	primaryWeapon = "droid_probot_ranged",
	secondaryWeapon = "unarmed",
	defaultAttack = "attack"
}

CreatureTemplates:addCreatureTemplate(worldboss_guard_probot , "worldboss_guard_probot")
