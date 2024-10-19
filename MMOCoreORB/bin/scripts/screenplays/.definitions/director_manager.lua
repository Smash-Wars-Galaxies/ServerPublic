---@meta

---@param filename string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:1272
function includeFile(filename) end

---@param mili number
---@param play string
---@param key string
---@param obj userdata
---@param args string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:1590
function createEvent(mili, play, key, obj, args) end

---@param save boolean
---@param mili number
---@param play string
---@param key string
---@param obj userdata
---@param args string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:1590
function createEvent(save, mili, play, key, obj, args) end


---@param timeInMinutes number
---@param play string
---@param key string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:1651
function createEventActualTime(timeInMinutes, play, key) end

---@param mili number
---@param play string
---@param key string
---@param eventName string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:1679
function createServerEvent(mili, play, key, eventName) end

---@param eventName string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:1730
function hasServerEvent(eventName) end

---@param eventName string
---@param mili number
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:1750
function rescheduleServerEvent(eventName, mili) end

---@param eventName string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:1814
function getServerEventID(eventName) end

---@param objectID integer
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:1787
function getServerEventTimeLeft(objectID) end

---@param eventType integer
---@param play string
---@param key string
---@param sceneObject userdata
---@param persistence integer
---@overload fun(eventType: integer, play: string, key: string, sceneObject: userdata)
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:2961
function createObserver(eventType, play, key, sceneObject, persistence) end

---@param eventType integer
---@param play string
---@param key string
---@param sceneObject userdata
---@overload fun(eventType: integer, sceneObject: userdata)
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:3022
function dropObserver(eventType, play, key, sceneObject) end

---@param eventType integer
---@param sceneObject userdata
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:3003
function hasObserver(eventType, sceneObject) end

---@param zoneid string
---@param mobile string
---@param respawnTimer integer
---@param x number
---@param z number
---@param y number
---@param heading number
---@param parentID integer
---@param randomRespawn boolean
---@overload fun(zoneid: string, mobile: string, respawnTimer: integer, x: number, z: number, y: number, heading: number, parentID: integer)
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:2521
function spawnMobile(zoneid, mobile, respawnTimer, x, z, y, heading, parentID, randomRespawn) end

---@param zoneid string
---@param mobile string
---@param level integer
---@param x number
---@param z number
---@param y number
---@param heading number
---@param parentID integer
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:2602
function spawnEventMobile(zoneid, mobile, level, x, z, y, heading, parentID) end

---@param creature userdata
---@param message userdata
---@overload fun(message: string)
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:1863
function spatialChat(creature, message) end

---@param scene userdata
---@param message userdata
---@param moodType number
---@param chatType number
---@overload fun(message: string)
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:1913
function spatialMoodChat(scene, message, moodType, chatType) end

---@param min integer
---@param max integer
---@overload fun(max: integer)
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:1973
function getRandomNumber(min, max) end

---@param argument string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:1996
function getHashCode(argument) end

---@param creatureObject userdata
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:2232
function forcePeace(creatureObject) end

---@param key string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:1297
function readSharedMemory(key) end

---@param key string
---@param data integer
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:1337
function writeSharedMemory(key, data) end

---@param key string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:1314
function deleteSharedMemory(key) end

---@param key string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:1361
function readStringSharedMemory(key) end

---@param key string
---@param data string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:1401
function writeStringSharedMemory(key, data) end

---@param key string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:1378
function deleteStringSharedMemory(key) end

---@param key string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:1425
function readVector3SharedMemory(key) end

---@param key string
---@param x number
---@param z number
---@param y number
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:1471
function writeVector3SharedMemory(key, x, z, y) end

---@param key string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:1448
function deleteVector3SharedMemory(key) end

---@param key string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:1499
function readStringVectorSharedMemory(key) end

---@param key string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:1552
function writeStringVectorSharedMemory(key) end

---@param key string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:1529
function deleteStringVectorSharedMemory(key) end

---@param script string
---@param x number
---@param z number
---@param y number
---@param parentID integer
---@param dw number
---@param dx number
---@param dy number
---@param dz number
---@param zoneID string
---@overload fun(zoneID: string, script: string, x: number, z: number, y: number, parentID: integer)
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:2802
function spawnSceneObject(script, x, z, y, parentID, dw, dx, dy, dz, zoneID) end

---@param zoneID string
---@param script string
---@param x number
---@param z number
---@param y number
---@param radius integer
---@param cellID integer
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:2895
function spawnActiveArea(zoneID, script, x, z, y, radius, cellID) end

---@param creature userdata
---@param script string
---@param x number
---@param y number
---@param angle integer
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:2733
function spawnBuilding(creature, script, x, y, angle) end

---@param patrol string
---@param planet string
---@param x number
---@param z number
---@param y number
---@param parentID integer
---@param direction integer
---@param stationary boolean
---@param attackable boolean
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:2657
function spawnSecurityPatrol(patrol, planet, x, z, y, parentID, direction, stationary, attackable) end

---@param creature userdata
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:2705
function despawnSecurityPatrol(creature) end

---@param objectID integer
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:2772
function destroyBuilding(objectID) end

---@param objectID integer
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:1951
function getSceneObject(objectID) end

---@param objectID integer
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:2059
function getCreatureObject(objectID) end

---@param creatureObject userdata
---@param sceneObject userdata
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:2256
function addStartingItemsInto(creatureObject, sceneObject) end

---@param creatureObject userdata
---@param sceneObject userdata
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:2275
function addStartingWeaponsInto(creatureObject, sceneObject) end

---@param terminal userdata
---@param state boolean
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:2492
function setAuthorizationState(terminal, state) end

---@param obj userdata
---@param objectString string
---@param slot integer
---@param overload boolean
---@overload fun(obj: userdata, objectString: string, slot: integer)
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:2296
function giveItem(obj, objectString, slot, overload) end

---@param datapad userdata
---@param objectString string
---@param controlledObjectPath string
---@param slot integer
---@param mobile boolean
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:2349
function giveControlDevice(datapad, objectString, controlledObjectPath, slot, mobile) end

---@param datapad userdata
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:2455
function checkTooManyHirelings(datapad) end

---@param data integer
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:1250
function checkInt64Lua(data) end

---@param cm userdata
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:1843
function getChatMessage(cm) end

---@param stringid string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:3256
function getStringId(stringid) end

---@param rank integer
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:3271
function getRankName(rank) end

---@param rank integer
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:3288
function getRankCost(rank) end

---@param rank integer
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:3303
function getRankDelegateRatioFrom(rank) end

---@param rank integer
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:3318
function getRankDelegateRatioTo(rank) end

---@param rank integer
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:3333
function isHighestRank(rank) end

---@param rank integer
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:3350
function getFactionPointsCap(rank) end

---@param name string
---@param start boolean
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:1230
function registerScreenPlay(name, start) end

---@param zoneName string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:3380
function getZoneByName(zoneName) end

---@param zoneid string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:3406
function isZoneEnabled(zoneid) end

---@param container userdata
---@param objectTemplate string
---@param checkChildren boolean
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:2081
function getContainerObjectByTemplate(container, objectTemplate, checkChildren) end

---@param sco userdata
---@param allowEntry boolean
---@param obj userdata
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:2138
function updateCellPermission(sco, allowEntry, obj) end

---@param sco userdata
---@param allowEntry number
---@param obj userdata
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:2184
function updateCellPermissionGroup(sco, allowEntry, obj) end

---@param questID integer
---@param questName string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:4022
function getQuestInfo(questID, questName) end

---@param questName string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:4002
function getPlayerQuestID(questName) end

---@param container userdata
---@param lootGroup string
---@param level number
---@param maxCondition boolean
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:895
function createLoot(container, lootGroup, level, maxCondition) end

---@param container userdata
---@param lootGroup string
---@param level number
---@param maxCondition boolean
---@param setSize number
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:947
function createLootSet(container, lootGroup, level, maxCondition, setSize) end

---@param container userdata
---@param level number
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:988
function createLootFromCollection(container, level) end

---@param player userdata
---@param typeString string
---@param quantity integer
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:1035
function givePlayerResource(player, typeString, quantity) end

---@param zoneName string
---@param regionName string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:2015
function getRegion(zoneName, regionName) end

---@param player userdata
---@param screenPlay string
---@param variable string
---@param data string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:862
function writeScreenPlayData(player, screenPlay, variable, data) end

---@param player userdata
---@param screenPlay string
---@param variable string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:1130
function readScreenPlayData(player, screenPlay, variable) end

---@param player userdata
---@param screenPlay string
---@param variable string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:1169
function deleteScreenPlayData(player, screenPlay, variable) end

---@param player userdata
---@param screenPlay string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:1200
function clearScreenPlayData(player, screenPlay) end

---@param crc integer
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:3365
function getObjectTemplatePathByCRC(crc) end

---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:1109
function getTimestamp() end

---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:1116
function getTimestampMilli() end

---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:1123
function getFormattedTime() end

---@param zoneName string
---@param x number
---@param y number
---@param minimumDistance number
---@param maximumDistance number
---@param forceSpawn boolean
---@overload fun(zoneName: string, x: number, y: number, minimumDistance: number, maximumDistance: number)
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:3477
function getSpawnPoint(zoneName, x, y, minimumDistance, maximumDistance, forceSpawn) end

---@param x number
---@param y number
---@param radius number
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:4336
function getSpawnPointInArea(x, y, radius) end

---@param zoneName string
---@param x number
---@param y number
---@param minimumDistance number
---@param maximumDistance number
---@param areaSize number
---@param maximumHeightDifference number
---@param forceSpawn boolean
---@overload fun(zoneName: string, x: number, y: number, minimumDistance: number, maximumDistance: number, areaSize: number, maximumHeightDifference: number)
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:3552
function getSpawnArea(zoneName, x, y, minimumDistance, maximumDistance, areaSize, maximumHeightDifference, forceSpawn) end

---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:3651
function makeCreatureName() end

---@param creature userdata
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:3665
function getGCWDiscount(creature) end

---@param creatureObject userdata
---@param x number
---@param y number
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:3689
function getTerrainHeight(creatureObject, x, y) end

---@param creature userdata
---@param skillName string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:3719
function awardSkill(creature, skillName) end

---@param zoneid string
---@param x number
---@param y number
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:3738
function getCityRegionAt(zoneid, x, y) end

---@param scene userdata
---@param ticketDepartPlanet string
---@param ticketDepartPoint string
---@param ticketArrivePoint string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:3772
function setDungeonTicketAttributes(scene, ticketDepartPlanet, ticketDepartPoint, ticketArrivePoint) end

---@param keyString string
---@param valueString string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:3800
function setQuestStatus(keyString, valueString) end

---@param keyString string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:3816
function getQuestStatus(keyString) end

---@param keyString string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:3836
function removeQuestStatus(keyString) end

---@param faction integer
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:3851
function setCoaWinningFaction(faction) end

---@param zoneName string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:3871
function getControllingFaction(zoneName) end

---@param zoneName string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:3897
function getImperialScore(zoneName) end

---@param zoneName string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:3923
function getRebelScore(zoneName) end

---@param zoneName string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:3949
function getWinningFactionDifficultyScaling(zoneName) end

---@param object integer | userdata
---@param effect string
---@param zone string
---@param x number
---@param z number
---@param y number
---@param cell number
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:3975
function playClientEffectLoc(object, effect, zone, x, z, y, cell) end

---@param keyString string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:4050
function getQuestVectorMap(keyString) end

---@param keyString string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:4070
function createQuestVectorMap(keyString) end

---@param keyString string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:4090
function removeQuestVectorMap(keyString) end

---@param templateName string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:4211
function creatureTemplateExists(templateName) end

---@param error string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:4228
function printLuaError(error) end

---@param logLevel number
---@param message string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:4243
function logLua(logLevel, message) end

---@param level number
---@param message string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:4298
function logLuaEvent(level, message) end

---@param playerName string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:4378
function getPlayerByName(playerName) end

---@param senderName string
---@param subject string
---@param body string
---@param recipient string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:4401
function sendMail(senderName, subject, body, recipient) end

---@param senderName string
---@param subject string
---@param body string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:4422
function sendMailToOnlinePlayers(senderName, subject, body) end

---@param zoneID string
---@param x number
---@param z number
---@param y number
---@param flatten boolean
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:4458
function spawnTheaterObject(zoneID, x, z, y, flatten) end

---@param templatePath string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:4512
function getSchematicItemName(templatePath) end

---@param type string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:4533
function getBadgeListByType(type) end

---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:4562
function getGalaxyName() end

---@param questCrc integer
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:4574
function getQuestTasks(questCrc) end

---@param creature userdata
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:4606
function broadcastToGalaxy(creature) end

---@param x number
---@param y number
---@param zoneName string
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:4633
function getWorldFloor(x, y, zoneName) end

---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:4662
function useCovertOvert() end

---@param player userdata
---@param chassisBlueprint userdata
---@param chassisDealer userdata
---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:4688
function generateShipDeed(player, chassisBlueprint, chassisDealer) end

---@source 
function createNavMesh() end

---@source 
function destroyNavMesh() end

---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:4670
function getFactionMap() end

---@source MMOCoreORB/src/server/zone/managers/director/DirectorManager.cpp:4682
function reloadScreenplays() end

