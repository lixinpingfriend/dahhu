
local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local ActivityRedPacketModule = class("activityRedPacketModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local UnityEngine = UnityEngine

function ActivityRedPacketModule:initialize(...)
    -- 开始初始化                view        loginModel           模块数据
    ModuleBase.initialize(self, "activity_redpacket_view", nil, ...)

end

function ActivityRedPacketModule:on_click(obj, arg)
    --    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    --    if obj == self.view.buttonBack.gameObject then
    --        ModuleCache.ModuleManager.hide_module("public", "activity");
    --    end
end

function ActivityRedPacketModule:on_show(data)


    self.view:init(data);
end

return ActivityRedPacketModule