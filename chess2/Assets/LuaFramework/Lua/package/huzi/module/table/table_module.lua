
local class = require("lib.middleclass")

local packageHead = "package.huzi.module."
local ModuleBase = require("package.huzi.module.table." .. AppData.Game_Name ..  "." .. AppData.Game_Name .. "_module")
local TableModule = class("huzi.TableModule", ModuleBase)

return TableModule
