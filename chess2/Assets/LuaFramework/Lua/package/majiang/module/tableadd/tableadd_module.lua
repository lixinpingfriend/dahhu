

local ModuleCache = ModuleCache
local ComponentTypeName = ModuleCache.ComponentTypeName

-- 初始化
local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local TableAddModule = class("TableAddModule", ModuleBase)

local SoundManager = ModuleCache.SoundManager
local CSmartTimer = ModuleCache.SmartTimer.instance

function TableAddModule:initialize(...)
	ModuleBase.initialize(self, "tableadd_view", nil, ...)
end

function TableAddModule:on_show()
	self.view:ShowBaoQueView()
end

function TableAddModule:on_hide()
	self.view:HideBaoQueView()
end

function TableAddModule:on_click(obj, arg)
	local playerClickButtonSound = true

	if (obj.name == "Button_Tiao") then
		self:dispatch_module_event("tableadd", "Event_BaoQue", 1)
	elseif (obj.name == "Button_Wan") then
		self:dispatch_module_event("tableadd", "Event_BaoQue", 2)
	elseif (obj.name == "Button_Tong") then
		self:dispatch_module_event("tableadd", "Event_BaoQue", 3)
	end

	if playerClickButtonSound then
		ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
	end
end

return  TableAddModule