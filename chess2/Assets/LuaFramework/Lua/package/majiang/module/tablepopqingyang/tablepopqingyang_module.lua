local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
---@class TablePopQingYangModule
---@field view TablePopQingYangView
local TablePopQingYangModule = class("tablePopQingYangModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local UnityEngine = UnityEngine
local PlayerPrefs = UnityEngine.PlayerPrefs
local ComponentUtil = ModuleCache.ComponentUtil

function TablePopQingYangModule:initialize(...)
	-- 开始初始化                view        loginModel           模块数据
	ModuleBase.initialize(self, "tablepopqingyang_view", nil, ...)
	self.curTableData = TableManager.curTableData
end


function TablePopQingYangModule:on_show(initData)
	self.initData = initData
	local userState = initData.userState
	local index = initData.index
	local PiaoType = userState.State[index].PiaoType
	if 1 == PiaoType then
		self.view.paoPanel:SetActive(true)
		self.view.xiaPanel:SetActive(false)
	elseif 2 == PiaoType then
		self.view.paoPanel:SetActive(false)
		self.view.xiaPanel:SetActive(true)
	elseif 3 == PiaoType then
		self.view.paoPanel:SetActive(true)
		self.view.xiaPanel:SetActive(true)
	end
end

function TablePopQingYangModule:on_click(obj, arg)
	ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
	if obj.transform.parent.gameObject == self.view.paoPanel then
		local value = tonumber(obj.name)
		local requestData = {}
		requestData.PiaoNum = value 
		requestData.type  = 1 
		self:dispatch_module_event("tablestrategy", "Event_TableStragy_XuanPiao", requestData)
	elseif obj.transform.parent.gameObject == self.view.xiaPanel then
		local value = tonumber(obj.name)
		local requestData = {}
		requestData.PiaoNum = value 
		requestData.type  = 2
		self:dispatch_module_event("tablestrategy", "Event_TableStragy_XuanPiao", requestData)
	end
end

return TablePopQingYangModule



