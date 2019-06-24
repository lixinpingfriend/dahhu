local class = require("lib.middleclass")
local packageHead = "package.huzi.module."
local ModuleBase = require(packageHead .. "tablebase.tablebase_module")
local TableModule = class("huzi.TableModule", ModuleBase)

function TableModule:initialize(...)
    local viewPath = AppData.Game_Name .. "." .. AppData.Game_Name .. "_view"
    local modelPath = AppData.Game_Name .. "." .. AppData.Game_Name .. "_model"
    ModuleBase.initialize(self, viewPath, modelPath, ...)
end

return TableModule
