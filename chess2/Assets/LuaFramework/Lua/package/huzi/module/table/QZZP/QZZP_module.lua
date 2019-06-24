local class = require("lib.middleclass")

local packageHead = "package.huzi.module."
local ModuleBase = require(packageHead .. "tablebase.tablebase_module")
local TableModule = class("huzi.TableModule", ModuleBase)

local ModuleCache       = ModuleCache
local TableUtilPaoHuZi  = require("package.huzi.module.tablebase.table_util")
local HandCardView      = require(packageHead .. "tablebase.handcard_view")
local SoundManager      = require(packageHead .. "tablebase.sound_manager")
local Manager           = require("package.public.module.function_manager")
local TableBaseModule   = class('tableBaseModule', ModuleBase)


function TableModule:initialize(...)
    local viewPath = AppData.Game_Name .. "." .. AppData.Game_Name .. "_view"
    local modelPath = AppData.Game_Name .. "." .. AppData.Game_Name .. "_model"
    ModuleBase.initialize(self, viewPath, modelPath, ...)
end

function TableModule:ChangeRuleName(str)
	str = string.gsub(str, "三人激情 ", "")
	str = string.gsub(str, "两人PK ", "")
	str = string.gsub(str, "四人(坐醒) ", "")
	return self:GetPayStr() .. str
end

return TableModule
