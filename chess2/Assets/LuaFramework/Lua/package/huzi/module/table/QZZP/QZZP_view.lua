local class = require("lib.middleclass")
local ViewBase = require('package.huzi.module.tablebase.tablebase_view')
local TableView = class("huzi.TableView", ViewBase)
local coroutine = require("coroutine")
local Manager = require("package.public.module.function_manager")
local TableUtilPaoHuZi = require("package.huzi.module.tablebase.table_util")

TableView.nZiPaiPaiLei = 3

TableView.bgName = {}
TableView.bgName[1] = "1"
TableView.bgName[2] = "2"
TableView.bgName[3] = "3"

function  TableView:set_wanfa()
    if not self.gamerule then
        self.gamerule = self.TableData.Rule
        self.wanfaName,
		self.ruleName,
		self.playerNum,
		self.wanfaTable = TableUtilPaoHuZi.get_rule_name(self.TableData.Rule, self.TableData.HallID == 0)
    end

    local ruleInfo = TableUtilPaoHuZi.convert_rule(self.TableData.Rule)
    
    print_table(ruleInfo)
	self.txtWanFa.text = "全州字牌"
	if self.model.Msg_Table_UserStateNTF and self.model.Msg_Table_UserStateNTF.BaseCoinScore ~= 0 then
        self.txtWanFa.text = self.txtWanFa.text .. ' 底注:' .. self.model.Msg_Table_UserStateNTF.BaseCoinScore
	end
	local temps = {}
	local str = ""
	
	temps[0] = "无王 "
	temps[1] = "单王 "
	temps[2] = "双王 "
	temps[3] = "三王 "
	temps[4] = "四王 "
	if ruleInfo.WangPaiNum ~= nil and temps[ruleInfo.WangPaiNum] ~= nil then
		str = str .. temps[ruleInfo.WangPaiNum]
	end	
	
	temps[0] = "跟醒 "
	temps[1] = "翻醒 "
	if ruleInfo.XingType ~= nil and temps[ruleInfo.XingType] ~= nil then
		str = str .. temps[ruleInfo.XingType]
	end

	if ruleInfo.ShuangXing then
		str = str .. "双醒 "
	end

	temps = {}
	temps[0] = "有王必自摸 "
	temps[1] = "按番限胡 "
	temps[2] = "按王限胡 "
	if ruleInfo.XianHuType ~= nil and temps[ruleInfo.XianHuType] ~= nil then
		str = str .. temps[ruleInfo.XianHuType]
	end

	if ruleInfo.SeatRule == 1 then
		str = str .. "不换位 "
	elseif ruleInfo.SeatRule == 2 then
		str = str .. "每局换位 "
	end

	if ruleInfo.FengDing and ruleInfo.FengDing == 300 then
		str = str .. "300封顶 "
	end

	if ruleInfo.WangPai then
		str = str .. "亡牌 "
	end

	if ruleInfo.HongZhuanHei then
		str = str .. "十三红3倍 十五红4倍 "
	end

	temps[1] = "AA支付 "
	temps[0] = "房主支付 "
	temps[2] = "大赢家支付 "
	if ruleInfo.PayType ~= nil and temps[ruleInfo.PayType] ~= nil then
		str = str .. temps[ruleInfo.PayType]
	end

	self.txtWanFaShow.text = str  
end

--显示剩余牌堆
function TableView:ShowLeftCard(bShow)
	local ruleInfo = TableUtilPaoHuZi.convert_rule(self.TableData.Rule)
	if ruleInfo.WangPai ~= nil and ruleInfo.WangPai then		--亡牌不显示
		bShow = false
	end
	if bShow then
		self:SetLeftCard()
	end
	self.imgLeftCards.gameObject:SetActive(bShow)
end

return TableView