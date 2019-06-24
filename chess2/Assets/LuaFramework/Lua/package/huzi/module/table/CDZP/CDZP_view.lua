local class = require("lib.middleclass")
local ViewBase = require('package.huzi.module.tablebase.tablebase_view')
local TableView = class("huzi.TableView", ViewBase)
local TableUtilPaoHuZi = require("package.huzi.module.tablebase.table_util")

TableView.bgName = {}
TableView.bgName[1] = "4"
TableView.bgName[2] = "1"
TableView.bgName[3] = "2"

TableView.nZiPaiPaiLei = 2

function  TableView:set_wanfa()
	local ruleInfo = TableUtilPaoHuZi.convert_rule(self.TableData.Rule)

	local temps = {}
	local str = ""
	
	temps[1] = "全名堂 "
	temps[2] = "红黑点 "
	temps[3] = "多红对 "
	if ruleInfo.WanFa ~= nil and temps[ruleInfo.WanFa] ~= nil then
		self.txtWanFa.text = temps[ruleInfo.WanFa]
	end

	temps[0] = "(不充囤)"
	temps[1] = "(充1囤)"
	temps[2] = "(充2囤)"
	temps[3] = "(充3囤)"
	temps[4] = "(充4囤)"
	temps[5] = "(充5囤)"
	
	if ruleInfo.DiFen ~= nil and temps[ruleInfo.DiFen] ~= nil then
		self.txtWanFa.text = self.txtWanFa.text .. temps[ruleInfo.DiFen]
	end
	if self.model.Msg_Table_UserStateNTF and self.model.Msg_Table_UserStateNTF.BaseCoinScore ~= 0 then
        self.txtWanFa.text = self.txtWanFa.text .. ' 底注:' .. self.model.Msg_Table_UserStateNTF.BaseCoinScore
	end
	self.txtWanFaShow.gameObject:SetActive(false) 

	temps[0] = "不封顶 "
	temps[100] = "100封顶 "
	temps[200] = "200封顶 "
	if ruleInfo.FengDing ~= nil and temps[ruleInfo.FengDing] ~= nil then
		self.txtWanFaShow.text = self.txtWanFaShow.text .. temps[ruleInfo.FengDing]
	end

	if ruleInfo.DiFen ~= nil and temps[ruleInfo.DiFen] ~= nil then
		self.txtWanFaShow.text = self.txtWanFaShow.text .. temps[ruleInfo.DiFen]
	end
end

return TableView