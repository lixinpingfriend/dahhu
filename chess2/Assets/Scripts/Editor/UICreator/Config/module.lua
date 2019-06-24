
local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local ClassName = class("PackageName.ClassName", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager

function ClassName:initialize(...)
	-- 开始初始化                view        loginModel           模块数据
	ModuleBase.initialize(self, "UIName_view", ModelName, ...)
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function ClassName:on_module_inited()

end

-- 绑定module层的交互事件
function ClassName:on_module_event_bind()

end

-- 绑定Model层事件，模块内交互
function ClassName:on_model_event_bind()
	

end

function ClassName:on_show(data)

end

function ClassName:on_click(obj, arg)	
	ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
end

return ClassName



