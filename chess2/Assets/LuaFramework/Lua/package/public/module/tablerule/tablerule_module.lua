






local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local TableRuleModule = class("tableRuleModule", ModuleBase)
local TableUtil = require("package.public.table_util")
-- 常用模块引用
local ModuleCache = ModuleCache
local Config = Config
local roundNums = {
	["mj"] = { 4, 8, 16 },
}

function TableRuleModule:initialize(...)
	-- 开始初始化                view        loginModel           模块数据
	ModuleBase.initialize(self, "tablerule_view", nil, ...)
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function TableRuleModule:on_module_inited()

end

-- 绑定module层的交互事件
function TableRuleModule:on_module_event_bind()

end

-- 绑定loginModel层事件，模块内交互
function TableRuleModule:on_model_event_bind()
	

end

function TableRuleModule:on_click(obj, arg)	
	print_debug(obj.name)
	ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
	if obj == self.view.buttonClose.gameObject or obj.name == "ImageBack" then
		ModuleCache.ModuleManager.hide_module("public", "tablerule")
	end
end


function TableRuleModule:on_show(rule)
	self.playRule = TableUtil.convert_rule(rule)
	local hallID = self.modelData.roleData.HallID
	if(TableManager.curTableData and TableManager.curTableData.HallID)  then
		hallID = TableManager.curTableData.HallID
	end
	hallID = hallID or self.playRule.HallID or 0
	self.view.hallID = hallID
	if self.playRule.roundCount then
		self.roundCount = self.playRule.roundCount
		self.view.payInfoObj:SetActive(hallID == 0)
		--TODO XLQ 亲友圈在房间中的规则  消耗类型显示为亲友圈设置的类型   由于快速组局进入的房间不知道consumeType  所以先注销 掉此功能
	else
		self.roundCount = TableManager.curTableData.RoundCount
		if(TableManager.curTableData.videoData and TableManager.curTableData.videoData.roundcount) then
			self.roundCount = TableManager.curTableData.videoData.roundcount
		end
		self.view.payInfoObj:SetActive(hallID == 0)
		--TODO XLQ 亲友圈在房间中的规则  消耗类型显示为亲友圈设置的类型   由于快速组局进入的房间不知道consumeType  所以先注销 掉此功能

	end

	local appGameName = self.playRule.GameID

	self.view.titleTex.text = TableUtil.get_rule_name(rule,false,appGameName)
	self.view.titleTex2.text = TableUtil.get_rule_name(rule,false,appGameName)
	local gameType = self.playRule.GameType or self.playRule.gameType or self.playRule.game_type or self.playRule.bankerType or 3

	local curRoundNums = roundNums["mj"]

	self.wanfaType = Config.GetWanfaIdx(gameType,appGameName)

	print("gameType : "..tostring(gameType))
	print("self.wanfaType : "..tostring(self.wanfaType))

	self.view:show_create(self.wanfaType, rule)
	for i=1,#self.view.toggles do
		for j=1,#self.view.toggles[i].list do
			local data = self.view.toggles[i].list[j]
			local toggle = data.toggle
			if(i == 1 and not self.playRule.roundCount and TableManager.curTableData.RoomType ~= 4) then
				toggle.isOn = (self.roundCount == curRoundNums[j])
			end
			self.view:refresh_textColor(data)
		end
	end

	local wanfaName, ruleName, renshu = TableUtil.get_rule_name_gold_room(rule)
	self.view.goldRoomRuleText.text = ruleName

	if TableManager:cur_game_is_gold_room_type() then
		self.view:switchViewState(self.view.viewState.gold)
	else
		self.view:switchViewState(self.view.viewState.common)
	end
end

return TableRuleModule



