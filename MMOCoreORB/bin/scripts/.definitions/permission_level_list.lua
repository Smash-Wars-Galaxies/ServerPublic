---@meta

---@param filename string
function includeFile(filename) end

---@enum SpecialType
local special_type = {
    Normal = 1,
    CSR = 1,
    Developer = 2,
}

---@class Level
---@field level number admin_level required in database
---@field name string name of the level
---@field flag? SpecialType
---@field tag string tag to append to the username ingame
---@field skills string[] a list of skills granted to the character

---@param level Level
function addLevel(level) end

