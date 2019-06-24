
local class = require("lib.middleclass")

local TableUtilPaoHuZi = require("package.huzi.module.tablebase.table_util")
local packageHead = "package.huzi.module."
local ModuleBase = TableUtilPaoHuZi.GetSingleResultModule()
local singleResutlModule = class("huzi.singleResultModule", ModuleBase)

return singleResutlModule
