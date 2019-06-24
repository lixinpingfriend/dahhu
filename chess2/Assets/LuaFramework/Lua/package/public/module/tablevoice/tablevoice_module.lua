






local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local TableVoiceModule = class("tableVoiceModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local UnityEngine = UnityEngine
local ComponentUtil = ModuleCache.ComponentUtil

function TableVoiceModule:initialize(...)
	-- 开始初始化                view        loginModel           模块数据
	ModuleBase.initialize(self, "tablevoice_view", nil, ...)
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function TableVoiceModule:on_module_inited()

end

-- 绑定module层的交互事件
function TableVoiceModule:on_module_event_bind()

end

-- 绑定loginModel层事件，模块内交互
function TableVoiceModule:on_model_event_bind()
	

end


function TableVoiceModule:on_click(obj, arg)	
	
end


function TableVoiceModule:on_show(speaking)
	ComponentUtil.SafeSetActive(self.view.speaking, speaking)
	ComponentUtil.SafeSetActive(self.view.cancelRecord, not speaking)
end

return TableVoiceModule



