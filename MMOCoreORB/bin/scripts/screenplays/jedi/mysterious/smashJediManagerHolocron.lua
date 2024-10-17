local ObjectManager = require("managers.object.object_manager")

USEDHOLOCRON = "used_holocron"
HOLOCRONCOOLDOWNTIME = 24 * 60 * 60 * 1000 -- 24 hours

SmashJediManagerHolocron = ScreenPlay:new {}

-- Check if the player can use the holocron.
-- @param pPlayer pointer to the creature object of the player who tries to use the holocron.
-- @return true if the player can use the holocron.
function SmashJediManagerHolocron.canUseHolocron(pPlayer)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return false
	end

	return PlayerObject(pGhost):isJedi() and CreatureObject(pPlayer):checkCooldownRecovery(USEDHOLOCRON)
end

-- Checks if the player can replenish the force or not.
-- @param pPlayer pointer to the creature object of the player who should be checked.
-- @return true if the player can replenish the force.
function SmashJediManagerHolocron.canReplenishForce(pPlayer)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return false
	end

	return PlayerObject(pGhost):getForcePower() < PlayerObject(pGhost):getForcePowerMax()
end

-- Use the holocron on the player.
-- @param pSceneObject pointer to the scene object of the holocron.
-- @param pPlayer pointer to the creature object of the player who is using the holocron.
function SmashJediManagerHolocron.useTheHolocron(pSceneObject, pPlayer)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end

	-- The holocrom hums softly as you feel your Force power replenish.
	CreatureObject(pPlayer):sendSystemMessage("@jedi_spam:holocron_force_replenish")
	PlayerObject(pGhost):setForcePower(PlayerObject(pGhost):getForcePowerMax());
	CreatureObject(pPlayer):addCooldown(USEDHOLOCRON, HOLOCRONCOOLDOWNTIME)

	SceneObject(pSceneObject):destroyObjectFromWorld()
	SceneObject(pSceneObject):destroyObjectFromDatabase()
end

-- Send message to the player that he cannot replenish the force.
-- @param pPlayer pointer to the creature object of the player that tries to use the holocron.
function SmashJediManagerHolocron.cannotReplenishForce(pPlayer)
	-- You are already at your maximum Force power.
	CreatureObject(pPlayer):sendSystemMessage("@jedi_spam:holocron_force_max")
end

-- Send message to the player that he cannot use the holocron.
-- @param pPlayer pointer to the creature object of the player that tries to use the holocron.
function SmashJediManagerHolocron.cannotUseHolocron(pPlayer)
	-- The holocron hums briefly, but otherwise does nothing.
	CreatureObject(pPlayer):sendSystemMessage("@jedi_spam:holocron_no_effect")
end

-- Handling of the useHolocron event.
-- @param pSceneObject pointer to the holocron object.
-- @param pPlayer pointer to the creature object that used the holocron.
function SmashJediManagerHolocron.useHolocron(pSceneObject, pPlayer)
	if SmashJediManagerHolocron.canUseHolocron(pPlayer) then
		if SmashJediManagerHolocron.canReplenishForce(pPlayer) then
			SmashJediManagerHolocron.useTheHolocron(pSceneObject, pPlayer)
		else
			SmashJediManagerHolocron.cannotReplenishForce(pPlayer)
		end
	else
		SmashJediManagerHolocron.cannotUseHolocron(pPlayer)
	end
end

return SmashJediManagerHolocron
