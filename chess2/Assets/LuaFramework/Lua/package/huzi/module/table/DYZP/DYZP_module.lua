local class = require("lib.middleclass")
local packageHead = "package.huzi.module."
local ModuleBase = require(packageHead .. "tablebase.tablebase_module")
local TableModule = class("huzi.TableModule", ModuleBase)

TableModule.SortCardHelperPath = "package.huzi.module.table.XXZP.XXZP_SortCardHelper"

function TableModule:initialize(...)
    local viewPath = AppData.Game_Name .. "." .. AppData.Game_Name .. "_view"
    local modelPath = AppData.Game_Name .. "." .. AppData.Game_Name .. "_model"
    ModuleBase.initialize(self, viewPath, modelPath, ...)
end

function TableModule:play(data)
	ModuleBase.play(self, data)
	self.playersView[1]:Set_Jiang()
end

function TableModule:ChangeRuleName(str)
	str = string.gsub(str, "慢 ", "慢节奏 ")
	str = string.gsub(str, "快 ", "快节奏 ")
	return self:GetPayStr() .. str
end

return TableModule
