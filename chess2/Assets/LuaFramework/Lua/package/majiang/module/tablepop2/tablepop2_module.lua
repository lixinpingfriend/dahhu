

local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
---@class TablePop2Module
---@field view TablePop2View
local TablePop2Module = class("tablePop2Module", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local UnityEngine = UnityEngine
local PlayerPrefs = UnityEngine.PlayerPrefs
local ComponentUtil = ModuleCache.ComponentUtil

function TablePop2Module:initialize(...)
	-- 开始初始化                view        loginModel           模块数据
	ModuleBase.initialize(self, "tablepop2_view", nil, ...)
	self.curTableData = TableManager.curTableData
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function TablePop2Module:on_module_inited()
	for i=1,#self.view.toggles do
		for j=1,#self.view.toggles[i] do
			self.view.toggles[i][j].toggle.onValueChanged:AddListener(function(isCheck)
				if(isCheck) then
					PlayerPrefs.SetInt(string.format("%s_%s_tablePopVal2",TableManager.curTableData.ruleJsonInfo.GameType, i), j)
				end
			end)
		end  
	end
end

-- 绑定module层的交互事件
function TablePop2Module:on_module_event_bind()

end

-- 绑定loginModel层事件，模块内交互
function TablePop2Module:on_model_event_bind()
	
end

function TablePop2Module:on_show(ruleInfo)
	ComponentUtil.SafeSetActive(self.view.xiaoji, ruleInfo.YouPiao)
	ComponentUtil.SafeSetActive(self.view.pao, ruleInfo.YouPao)
	self:refresh_view()
	if(self.view.ConfigData.isHBTDH) then
		self.view.textXiaoJiTitle.text = "拉坐:"
		self.view.textPaoTitle.text = "下跑:"
		self.view.paoToggle[1].text.text = "不下"
		ComponentUtil.SafeSetActive(self.view.pao, ruleInfo.Pao)
		ComponentUtil.SafeSetActive(self.view.xiaoji, ruleInfo.LaZuo)
		ComponentUtil.SafeSetActive(self.view.xiaojiToggle[3].toggle.gameObject, true)
		if(ruleInfo.ZhuangJia) then
			self.view.xiaojiToggle[1].text.text = "不坐"
		else
			self.view.xiaojiToggle[1].text.text = "不拉"
		end
	end
	if(self.view.ConfigData.isXueZhanDD) then
		self.view.textXiaoJiTitle.text = "带抛:"
		self.view.textPaoTitle.text = "带攮:"
		ComponentUtil.SafeSetActive(self.view.pao, ruleInfo.Pao)
		ComponentUtil.SafeSetActive(self.view.xiaoji, ruleInfo.Piao)
		ComponentUtil.SafeSetActive(self.view.xiaojiToggle[3].toggle.gameObject, true)
		self.view.paoToggle[3].toggle.gameObject:SetActive(false)
		local titles1 = {"不抛","抛1","抛2"}
		local titles2 = {"不带","带攮"}
		for i = 1, #self.view.xiaojiToggle do
			self.view.xiaojiToggle[i].text.text = titles1[i]
		end
		for i = 1, #self.view.paoToggle do
			self.view.paoToggle[i].text.text = titles2[i]
		end
	end
end

function TablePop2Module:refresh_view()
	for i=1,#self.view.toggles do
		local selectIndex = PlayerPrefs.GetInt(string.format("%s_%s_tablePopVal2",TableManager.curTableData.ruleJsonInfo.GameType, i), 1)
		for j=1,#self.view.toggles[i] do
			self.view.toggles[i][j].toggle.isOn = (selectIndex == j)
		end 
	end
end

function TablePop2Module:on_click(obj, arg)
	ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
	if obj.name == "BeginGame" then
		self:dispatch_module_event("tablestrategy", "Event_TableStragy_BeginGame", self.view:get_send_data())
	end
end

return TablePop2Module



