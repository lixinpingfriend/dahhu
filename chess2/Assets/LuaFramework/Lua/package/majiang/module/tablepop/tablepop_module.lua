






local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local TablePopModule = class("tablePopModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local TableUtil = TableUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local aniTime = 0.15
local PlayerPrefs = UnityEngine.PlayerPrefs

function TablePopModule:initialize(...)
	-- 开始初始化                view        loginModel           模块数据
	ModuleBase.initialize(self, "tablepop_view", nil, ...)
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function TablePopModule:on_module_inited()
    
end

-- 绑定module层的交互事件
function TablePopModule:on_module_event_bind()

end

-- 绑定loginModel层事件，模块内交互
function TablePopModule:on_model_event_bind()
	

end


function TablePopModule:on_click(obj, arg)	
	if(string.sub(obj.name, 1, 9) == "ButtonPao") then
		local pao = tonumber(string.sub(obj.name, 10, 10)) - 1
		if(self.view.ConfigData.isKaWuXing) then
			PlayerPrefs.SetInt(string.format("%s_kawuxing_piao",TableManager.curTableData.ruleJsonInfo.GameType), pao + 1)
			self.view:kawuxing_piao()
			if not TableManager:cur_game_is_gold_room_type() then
				return
			end
		end
		local showPao = self.view.ConfigData.isShowPao
		local showPiao = self.view.ConfigData.isShowPiao
		local sendData = {}
		sendData.xiaojiScore = -1
		sendData.paoScore = -1
		if(showPao) then
			sendData.paoScore = pao
		end
		if(showPiao) then
			sendData.xiaojiScore = pao
		end
		if(self.view.ConfigData.isQYLaZi) then
			sendData.paoScore = pao * 10
		end
		if(self.view.ConfigData.isDongHai) then
			sendData.xiaojiScore = pao + 1
		end
		if(self.view.ConfigData.isJJHK) then
			if 1 == pao then
				local jiamai = TableManager.curTableData.ruleJsonInfo.JiaMai
				sendData.xiaojiScore = tonumber(jiamai)
			end
		end
		--ModuleCache.ModuleManager.hide_module("majiang", "tablepop")
		self:dispatch_module_event("tablestrategy", "Event_TableStragy_BeginGame", sendData)
	elseif(string.sub(obj.name,1,2) == "MJ" and not self.doAnimation and self.view.canMaiMa) then
		local index = tonumber(string.sub(obj.name, 3, 3)) - 1
		self:dispatch_module_event("tablepop", "Event_MaiMa", index)
	end
end


function TablePopModule:on_show(maiMaData)
	self.view:refresh_view(maiMaData)
	if(not maiMaData) then
		return
	end
	self.oneResultState = nil
	if(maiMaData.Result == 1) then
		self.oneResultState = maiMaData
	end
	if(self.oneResultState and self.view.ConfigData.isKaWuXing) then
		self.doAnimation = true
		local zhongMaIndex =  {}
		local totalScore = 0
		for i=1,#self.oneResultState.ZhongMa do
			local zm = self.oneResultState.ZhongMa[i] + 1
			table.insert(zhongMaIndex,zm)
			totalScore = totalScore + self:get_score(self.oneResultState.MaiMa[zm])
		end

		self.view.kwxTitle.text = ""
		self.view.kwxScore.text = ""
		local oneResultState = self.oneResultState

		local sequence = self:create_sequence()
		for i=1,#zhongMaIndex do
			local index = zhongMaIndex[i]
			local zhongMaChild = self.view.kwxChilds[index]
			sequence:Append(zhongMaChild.transform:DOScaleX(0,0.25):SetDelay(0.25):OnStart(function ()
				zhongMaChild:SetActive(true)
			end):OnComplete(function()
				TableUtil.set_mj(oneResultState.MaiMa[index], zhongMaChild, self.view.mjScaleSet)
				TableUtil.set_mj_bg(1, zhongMaChild, self.view.mjColorSet)
			end))
			sequence:Append(zhongMaChild.transform:DOScaleX(1,0.25):OnComplete(function()
				GetComponentWithPath(zhongMaChild, "HighLight", ComponentTypeName.Transform).gameObject:SetActive(true)
			end))
		end
		sequence:OnComplete(function()
			self.view.kwxScore.gameObject:SetActive(true)
			self.view.kwxTitle.text = "买马完成！"
			self.view.kwxScore.text = "+" .. totalScore .. "f"
			self:become_small_animation(oneResultState, zhongMaIndex)
		end)
	end
end

function TablePopModule:become_small_animation(maiMaData, zhongMaIndex)
	local sequence = self:create_sequence()
	for j=1,#zhongMaIndex do
		local index =  zhongMaIndex[j]
		for i = 1, #maiMaData.MaiMa do
			local child = self.view.kwxChilds[i]
			if(i ~= index) then
				local index = i
				sequence:Join(child.transform:DOScaleX(0,aniTime):OnComplete(function()
					TableUtil.set_mj(maiMaData.MaiMa[index], child, self.view.mjScaleSet)
					TableUtil.set_mj_bg(1, child, self.view.mjColorSet)
				end))
			end
		end
	end
	sequence:OnComplete(function()
		self:become_big_animation(maiMaData, zhongMaIndex)
	end)
end

function TablePopModule:become_big_animation(maiMaData, zhongMaIndex)
	local sequence = self:create_sequence()
	for j=1,#zhongMaIndex do
		for i = 1, #maiMaData.MaiMa do
			local child = self.view.kwxChilds[i]
			if(i ~= zhongMaIndex[j]) then
				sequence:Join(child.transform:DOScaleX(1,aniTime))
			end
		end
	end
	sequence:OnComplete(function()
		self:subscibe_time_event(1, false, 0):OnComplete(function(t)
			if(maiMaData) then
				self.doAnimation = false
				if(ModuleCache.ModuleManager.module_is_active("majiang", "tablepop")) then
					ModuleCache.ModuleManager.hide_module("majiang", "tablepop")
				end
				if self.OnMaiMaComplateCallBack then  ---处理买马完成之后的回调
					self.OnMaiMaComplateCallBack()
				else
					---兼容老版框架
					local initData = {}
					initData.gameState = maiMaData
					ModuleCache.ModuleManager.show_module("majiang", "onegameresult", initData)
				end
			end
		end)
	end)
end

function TablePopModule:get_score(pai)
	if(pai >= 28) then
		return 10
	elseif(pai % 9 == 0) then
		return 9
	else
		return pai % 9
	end
end

return TablePopModule



