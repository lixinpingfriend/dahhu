local class = require("lib.middleclass")
local ViewBase = require('package.huzi.module.tablebase.tablebase_view')
local TableView = class("huzi.TableView", ViewBase)
local TableUtilPaoHuZi = require("package.huzi.module.tablebase.table_util")

TableView.bgName = {}
TableView.bgName[1] = "1"
TableView.bgName[2] = "2"
TableView.bgName[3] = "5"

TableView.nZiPaiPaiLei = 2
TableView.nDefaultSortType = 2		--默认对子排序

function TableView:set_wanfa()
	local curTableData = TableManager.phzTableData
    if not self.gamerule then
        self.gamerule = curTableData.Rule
        self.wanfaName,
            self.ruleName,
            self.playerNum,
            self.wanfaTable = TableUtilPaoHuZi.get_rule_name(curTableData.Rule, curTableData.HallID == 0)
    end

    local ruleInfo = TableUtilPaoHuZi.convert_rule(curTableData.Rule)

    self.txtWanFa.text = self.wanfaTable
end
return TableView