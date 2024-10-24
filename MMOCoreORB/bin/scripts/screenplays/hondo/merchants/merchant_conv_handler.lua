MerchantConvoHandler = conv_handler:new {
    __type = "MerchantConvoHandler"
}

local function firstToUpper(str)
    -- Convert word to Word
    return (str:gsub("^%l", string.upper))
end

function MerchantConvoHandler.adjustPrice(self, conversingPlayer, cost)
    -- Calculate price adjustment
    local finalPrice = cost
    for lc = 1, #self.relations, 1 do
        local pGhost = CreatureObject(conversingPlayer):getPlayerObject()
        if pGhost ~= nil then
            local playerStanding = PlayerObject(pGhost):getFactionStanding(self.relations[lc].name)
            playerStanding = math.min(playerStanding, 5000) -- cap faction due to Rebel/Imperial

            local adjustment = self.relations[lc].priceAdjust

            if (playerStanding ~= nil) then
                if (playerStanding > 0 and (self.relations[lc].npcStanding > 0 or self.relations[lc].npcStanding == -9000)) then
                    -- Discount: You are my friend or are a friend of my friend
                    finalPrice = finalPrice / ((adjustment * playerStanding / 5000) / 100 + 1)
                elseif (playerStanding < 0 and self.relations[lc].npcStanding < 0 and self.relations[lc].npcStanding ~= -9000) then
                    -- Discount: You are also the enemy of my enemy
                    finalPrice = finalPrice / ((adjustment / 4 * math.abs(playerStanding) / 5000) / 100 + 1)
                elseif (playerStanding > 0 and self.relations[lc].npcStanding < 0) then
                    -- Surcharge: You are friendly with my enemy
                    finalPrice = finalPrice * ((adjustment * playerStanding / 5000) / 100 + 1)
                elseif (playerStanding < 0 and self.relations[lc].npcStanding == -9000) then
                    -- Surcharge: You are an enemy of my friend
                    finalPrice = finalPrice * ((adjustment * math.abs(playerStanding) / 5000) / 100 + 1)
                end
            end
        end
    end
    return math.floor(finalPrice)
end

function MerchantConvoHandler.purchaseItemCallback(self, pPlayer, pSui, eventIndex, args)
    local cancelPressed = (eventIndex == 1)
    if (cancelPressed or pPlayer == nil) then
        return
    end

    local pInventory = CreatureObject(pPlayer):getSlottedObject("inventory")
    if (pInventory == nil) then
        return
    end

    local choice = self.goods[tonumber(args) + 1]

    if (SceneObject(pInventory):isContainerFullRecursive() or SceneObject(pInventory):getContainerObjectsSize() < #choice.items) then
        local fullMsg = LuaStringIdChatParameter("@bartender:inv_full") --"The bartender was unable to hand you your %TO. It is likely your inventory is full."
        fullMsg:setTO(messageString)

        CreatureObject(pPlayer):sendSystemMessage(fullMsg:_getObject())
        return
    end

    local cost = MerchantConvoHandler.adjustPrice(self, pPlayer, choice.cost)
    if (CreatureObject(pPlayer):getCashCredits() < cost) then
        CreatureObject(pPlayer):sendSystemMessage("You lack the credits to purchase this")
        return
    end

    for ic = 1, #choice.items, 1 do
        local pItem = nil
        if (string.find(choice.items[ic], 'iff') == nil) then
            pItem = createLoot(pInventory, choice.items[ic], getRandomNumber(100), false)
        else
            pItem = giveItem(pInventory, choice.items[ic], -1)
        end

        if (pItem == nil) then
            local fullMsg = LuaStringIdChatParameter("@bartender:inv_full") --"The bartender was unable to hand you your %TO. It is likely your inventory is full."
            fullMsg:setTO(messageString)

            CreatureObject(pPlayer):sendSystemMessage(fullMsg:_getObject())
            return
        end

        local sceneObject = getSceneObject(pItem)
        if (sceneObject ~= nil) then
            local objectName = SceneObject(sceneObject):getDisplayedName()
            CreatureObject(pPlayer):sendSystemMessage("Purchase Complete! " ..
                objectName .. " has been added to your inventory.")
        end
    end

    CreatureObject(pPlayer):subtractCashCredits(cost)
end

function MerchantConvoHandler.getInitialScreen(self, pPlayer, pNpc, pConvTemplate)
    local template = LuaConversationTemplate(pConvTemplate)

    for lc = 1, #self.relations, 1 do
        local pGhost = CreatureObject(pPlayer):getPlayerObject()
        if pGhost ~= nil then
            local playerStanding = PlayerObject(pGhost):getFactionStanding(self.relations[lc].name)

            if (playerStanding ~= -9000) then -- Ignore special case price adjust standing
                if (playerStanding < self.relations[lc].npcStanding and self.relations[lc].npcStanding > 0) then
                    CreatureObject(pPlayer):sendSystemMessage("Hint: Increase your " ..
                        firstToUpper(self.relations[lc].name) .. " faction and speak with the NPC again.")
                    return template:getScreen("faction_too_low")
                elseif (self.relations[lc].npcStanding < 0 and (self.relations[lc].npcStanding + playerStanding) > 0) then
                    CreatureObject(pPlayer):sendSystemMessage("Hint: Decrease your " ..
                        firstToUpper(self.relations[lc].name) .. " faction and speak with the NPC again.")
                    return template:getScreen("get_lost")
                end
            end
        end
    end

    return template:getInitialScreen()
end

function MerchantConvoHandler.runScreenHandlers(self, pConvTemplate, pPlayer, pNpc, selectedOption, pConvScreen)
    local screen = LuaConversationScreen(pConvScreen)
    local screenID = screen:getScreenID()

    if screenID == "shop" then
        local goodsTable = self.goods

        local pSui = SuiListBox.new(self.__type, "purchaseItemCallback")
        pSui.setTitle("@bartender:sui_title")
        pSui.setPrompt("Select an item to purchase")

        for i = 1, #goodsTable, 1 do
            local itemName = goodsTable[i].itemName
            local itemCost = goodsTable[i].cost

            pSui.add("[" .. MerchantConvoHandler.adjustPrice(self, pPlayer, itemCost) .. "] " .. itemName, "")
        end

        pSui.sendTo(pPlayer)
    end

    return pConvScreen
end
