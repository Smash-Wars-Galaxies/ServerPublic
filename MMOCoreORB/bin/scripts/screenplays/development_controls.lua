--Empire in Flames server, 2019
--For public release on Mod the Galaxy
--Happy development!

developmentMenuComponent = { }

function developmentMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	local menuResponse = LuaObjectMenuResponse(pMenuResponse)

	menuResponse:addRadialMenuItem(20, 3, "Axkva Min") -- Header
	menuResponse:addRadialMenuItemToRadialID(20, 21, 3, "Start")
	menuResponse:addRadialMenuItemToRadialID(20, 22, 3, "End")

	menuResponse:addRadialMenuItem(40, 3, "Nym's Auction") -- Header
	menuResponse:addRadialMenuItemToRadialID(40, 41, 3, "Start")
	menuResponse:addRadialMenuItemToRadialID(40, 42, 3, "End")

	menuResponse:addRadialMenuItem(60, 3, "Common Dev") -- Header
	menuResponse:addRadialMenuItemToRadialID(60, 61, 3, "Reload Screenplays")
--	menuResponse:addRadialMenuItemToRadialID(60, 62, 3, "Empty")
--	menuResponse:addRadialMenuItemToRadialID(60, 63, 3, "Empty")
--	menuResponse:addRadialMenuItemToRadialID(60, 64, 3, "Empty")
--	menuResponse:addRadialMenuItemToRadialID(60, 65, 3, "Empty")
end

function developmentMenuComponent:handleObjectMenuSelect(pDatapad, pPlayer, selectedID)
	if (pPlayer == nil or pDatapad == nil) then
		return 0
	end

	if (selectedID == 21) then
		AxkvaMinHeroicScreenplay:startAdminHeroic(pPlayer)
	end

	if (selectedID == 22) then
		local pHeroic = AxkvaMinHeroicScreenplay:getInstanceObject(pPlayer)
		AxkvaMinHeroicScreenplay:endInstance(pHeroic)
	end

	if (selectedID == 41) then
		NymAuctionScreenplay:startAdminHeroic(pPlayer)
	end

	if (selectedID == 42) then
		local pHeroic = NymAuctionScreenplay:getInstanceObject(pPlayer)
		NymAuctionScreenplay:endInstance(pHeroic)
	end

	if (selectedID == 61) then
		reloadScreenplays()
		CreatureObject(pPlayer):sendSystemMessage(" \\#FFFF33\\Reloading Screenplays.")
	end

	if (selectedID == 62) then
		CreatureObject(pPlayer):sendSystemMessage(" \\#FFFF33\\This function, " .. selectedID .. " is empty.")
	end

	if (selectedID == 63) then
		CreatureObject(pPlayer):sendSystemMessage(" \\#FFFF33\\This function, " .. selectedID .. " is empty.")
	end

	if (selectedID == 64) then
		CreatureObject(pPlayer):sendSystemMessage(" \\#FFFF33\\This function, " .. selectedID .. " is empty.")
	end

	if (selectedID == 65) then
		CreatureObject(pPlayer):sendSystemMessage(" \\#FFFF33\\This function, " .. selectedID .. " is empty.")
	end

	return 0
end
