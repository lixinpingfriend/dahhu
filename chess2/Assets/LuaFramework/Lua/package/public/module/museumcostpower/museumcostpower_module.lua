






local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local MuseumCostPowerModule = class("museumCostPowerModule", ModuleBase)
local GameManager = ModuleCache.GameManager
-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local UnityEngine = UnityEngine


function MuseumCostPowerModule:initialize(...)
	ModuleBase.initialize(self, "museumcostpower_view", nil, ...)
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function MuseumCostPowerModule:on_module_inited()		

end

function MuseumCostPowerModule:on_end_drag(obj, arg )
	if(obj.name == "Full") then
		self.isDrag = false
	end
end

function MuseumCostPowerModule:on_begin_drag(obj, arg )    

end

function MuseumCostPowerModule:on_drag(obj, arg )
	if(obj.name == "Full") then
		self.isDrag = true
	end
end

-- 绑定module层的交互事件
function MuseumCostPowerModule:on_module_event_bind()

end

-- 绑定loginModel层事件，模块内交互
function MuseumCostPowerModule:on_model_event_bind()
	
end

function MuseumCostPowerModule:on_show(data)
	self.selectData = data
	self.view:initLoopScrollViewList(data)
	self:dispatch_module_event("chessmuseumcostpower", "Event_Update_Power", self.view.selectPower)

end

function MuseumCostPowerModule:on_click(obj, arg)

	ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
	if obj.name == "BgMask" then
		self:dispatch_module_event("chessmuseumcostpower", "Event_Update_Power", self.view.selectPower)
		ModuleCache.ModuleManager.hide_module("public", "museumcostpower")
	elseif(obj.name == "Full" and not self.isDrag) then
		local parent = obj.transform.parent
		local array = string.split(parent.name, "_")
		local stopIndex = tonumber(array[2]) - 2
		self.view.selectPower = self.view:get_power(stopIndex, self.selectData)
		self.view:select_item(stopIndex)
	end
end

return MuseumCostPowerModule



