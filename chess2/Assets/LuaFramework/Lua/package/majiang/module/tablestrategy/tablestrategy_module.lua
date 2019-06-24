

local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local TableStrategyModule = class("tableStrategyModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local UnityEngine = UnityEngine
local PlayerPrefs = UnityEngine.PlayerPrefs
local viewValues = {}

function TableStrategyModule:initialize(...)
	ModuleBase.initialize(self, "tablestrategy_view", nil, ...)
	
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function TableStrategyModule:on_module_inited()
	for i=1,#self.tableStrategyView.toggles do
		for j=1,#self.tableStrategyView.toggles[i] do  
			self.tableStrategyView.toggles[i][j].onValueChanged:AddListener(function(isCheck)
				if(isCheck) then
					self:set_view_value("tableStrategy", "value_" .. i .. "_" .. j , 1)
				else
					self:set_view_value("tableStrategy", "value_" .. i .. "_" .. j , 0)
				end
			end)
		end  
	end
	self.beginTime = Time.realtimeSinceStartup
	self.timeDown = 0
end

-- 绑定module层的交互事件
function TableStrategyModule:on_module_event_bind()

end

-- 绑定loginModel层事件，模块内交互
function TableStrategyModule:on_model_event_bind()
	
end

function TableStrategyModule:on_show(initData)
	self.gameName = initData.gameName
	self.view.gameName = initData.gameName
	local gameTypePanel = self.view.gameTypePanel
	for i=1,#gameTypePanel do
		local panel = gameTypePanel[i]
		panel:SetActive(panel.name == self.gameName)
	end
	local isTuo = initData.isTuo
	self.beginTime = Time.realtimeSinceStartup
	self.timeDown = 0
	self:refresh_view()
	if(isTuo) then
		self.view.diTuo.text = "坨："
	else
		self.view.diTuo.text = "抵："
	end
end

function TableStrategyModule:refresh_view()
	for i=1,#self.tableStrategyView.toggles do
		for j=1,#self.tableStrategyView.toggles[i] do   
			local viewValue = self:get_view_value("tableStrategy", "value_" .. i .. "_" .. j)
			self:set_view_value("tableStrategy", "value_" .. i .. "_" .. j, viewValue)
			self.tableStrategyView.toggles[i][j].isOn = (viewValue == 1)
		end 
	end
	self.tableStrategyView:refresh_dice_toggle()
end

function TableStrategyModule:set_view_values()
	for key, value in pairs(viewValues) do   
		PlayerPrefs.SetInt(key, value)
	end  
end

function TableStrategyModule:set_view_value(arg1, arg2, value)
	viewValues[arg1 .. "_" .. arg2] = value
end

function TableStrategyModule:get_view_value( arg1, arg2 )
	return PlayerPrefs.GetInt(arg1 .. "_" .. arg2, 0)
end

--function TableStrategyModule:on_hide()
--	--UpdateBeat:Remove(self.UpdateBeat, self)
--end
--
--function TableStrategyModule:on_destroy()
--	--UpdateBeat:Remove(self.UpdateBeat, self)
--end

function TableStrategyModule:on_update()
	if(not self.view.root.activeSelf)then
		return
	end
	if(15 >= self.timeDown and Time.realtimeSinceStartup - self.beginTime >= self.timeDown) then
		self.view:update_beat(15 - self.timeDown)
		self.timeDown = self.timeDown + 1
	end

	if(self.timeDown == 16) then -- 自动开始
		self:set_view_values()
		ModuleCache.ModuleManager.hide_module("majiang", "tablestrategy")
		self:dispatch_module_event("tablestrategy", "Event_TableStragy_BeginGame", self.view:get_send_data())
	end
end

function TableStrategyModule:on_click(obj, arg)	
	ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
	print_debug(obj.name)
	if obj.name == "BeginGame" then
		self:set_view_values()
		ModuleCache.ModuleManager.hide_module("majiang", "tablestrategy")
		self:dispatch_module_event("tablestrategy", "Event_TableStragy_BeginGame", self.view:get_send_data())
	elseif obj.name == "DiTuo" then
		self.view:refresh_dice_toggle()
	end
end

return TableStrategyModule



