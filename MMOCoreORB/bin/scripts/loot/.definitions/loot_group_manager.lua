---@meta

---@param filename string
function includeFile(filename) end

---@class LootItem
---@field itemTemplate string name of loot item to generate
---@field weight integer chance of this item being selected out of 1000000

---@class LootGroupTemplate
---@field description string description of the loot group
---@field minimumLevel integer minimum item level for roll
---@field maximumLevel integer maximum item level for roll
---@field lootItems LootItem[] list of loot items to randomly select from

---@param name string
---@param template LootGroupTemplate
function addLootGroupTemplate(name, template) end


---@param name string
---@param template table
function addLootItemTemplate(name, template) end



