local class = require("lib.middleclass")
local ViewBase = require('package.huzi.module.table.XXZP.XXZP_view')
local TableView = class("huzi.TableView", ViewBase)
local TableUtilPaoHuZi = require("package.huzi.module.tablebase.table_util")
local Manager = require("package.public.module.function_manager")
local SoundManager = require("package.huzi.module.tablebase.sound_manager")

TableView.bgName = {}
TableView.bgName[1] = "1"
TableView.bgName[2] = "5"
TableView.bgName[3] = "2"

TableView.nDefaultKanPos = 2
TableView.nDefaultSortType = 2		--默认对子排序

return TableView