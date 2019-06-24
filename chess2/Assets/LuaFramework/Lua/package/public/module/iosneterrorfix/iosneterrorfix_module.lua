
local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local IOSNetErrorFixModule = class("BullFight.IOSNetErrorFixModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache


function IOSNetErrorFixModule:initialize(...)
	-- 开始初始化                view        model           模块数据
	ModuleBase.initialize(self, "iosneterrorfix_view", nil, ...)
	print_debug("iosneterrorfix init finish")
end


function IOSNetErrorFixModule:on_show(content)
	
end


function IOSNetErrorFixModule:on_click(obj, arg)	
	print_debug(obj.name)
	ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
	if obj == self.iOSNetErrorFixView.btnBack.gameObject then
		--ModuleCache.ModuleManager.destroy_module("public", "billboard")
		ModuleCache.ModuleManager.hide_module("public", "iosneterrorfix")
	end
end


return IOSNetErrorFixModule



