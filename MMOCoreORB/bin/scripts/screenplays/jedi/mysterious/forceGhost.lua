---@module 'director_manager'

local ObjectManager = require("managers.object.object_manager")

ForceGhost = ScreenPlay:new {
	numberOfActs = 1,
	screenplayName = "ForceGhost",

	time_to_stay = 30,
	spawnPoints = {
		{planetName = "dantooine", xPos = 4228, zPos = 61, yPos = 5103, cell = 0},
        {planetName = "corellia", xPos = -3035, zPos = 34, yPos = -1823, cell = 0},
        {planetName = "tatooine", xPos = -4474, zPos = 46, yPos = -2150, cell = 0},
        {planetName = "yavin4", xPos = 5080, zPos = 73, yPos = 5538, cell = 0},
        {planetName = "dathomir", xPos = 3086, zPos = 126, yPos = 1673, cell = 0},
	},
}

--True here tells the server to load this screenplay at server load. False tells it to wait until explicitly started.
registerScreenPlay("ForceGhost", true)

--Filter spawn locations to places that are enabled
function ForceGhost:getValidSpawnLocations()
	local valid_locations = {}
	for i, point in pairs(self.spawnPoints) do
		if (isZoneEnabled(point.planetName)) then
			valid_locations[#valid_locations+1] = point
		end
	end
	return valid_locations
end

---Play an effect to announce the spawn or despawn of the mysterious man
---@args pCreature CreatureObject
function ForceGhost:playEffect(pCreature)
	playClientEffectLoc(
		CreatureObject(pCreature):getObjectID(),
		"clienteffect/level_granted.cef",
		CreatureObject(pCreature):getZoneName(),
		CreatureObject(pCreature):getPositionX(),
		CreatureObject(pCreature):getPositionZ(),
		CreatureObject(pCreature):getPositionY(),
		CreatureObject(pCreature):getParentID()
	)
end


--This gets executed automatically when the screenplay is started
function ForceGhost:start()
	self:spawn()
end

--Put all the initial spawning of mobiles in a nice method like this.
function ForceGhost:spawn()
	-- Get list of valid spawn locations
	local valid_spawns = self:getValidSpawnLocations()

	-- Select random location
	local spawn = valid_spawns[getRandomNumber(1, #valid_spawns)]

	-- Spawn Mysterious Man
	local pMobile = spawnMobile(spawn.planetName, "force_ghost", 0, spawn.xPos, spawn.zPos, spawn.yPos, getRandomNumber(360) - 180, spawn.cell)
	if (pMobile ~= nil) then
		self:playEffect(pMobile)
		print("Force Ghost spawned at " .. spawn.xPos .. ", " .. spawn.yPos .. " on " .. spawn.planetName .. ".")
		-- Despawn after time_to_stay minutes
		createEvent(self.time_to_stay * 60 * 1000, "ForceGhost", "despawn", pMobile, "")
	end
end

function ForceGhost:despawn(pMobile)
	if (pMobile == nil) then
		return
	end

	if (CreatureObject(pMobile):isInCombat() or AiAgent(pMobile):getFollowObject() ~= nil) then
		createEvent(10000, "ForceGhost", "despawn", pMobile, "")
		return
	end

	SceneObject(pMobile):destroyObjectFromWorld()
	self:playEffect(pMobile)
	print( "Force Ghost despwaned...")
	-- Respawn in one minute
	createEvent(60 * 1000, "MysteriousMan", "spawn", "", "")
end