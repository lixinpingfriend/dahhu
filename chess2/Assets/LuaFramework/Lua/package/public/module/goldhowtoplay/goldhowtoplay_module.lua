




local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")

local GoldHowToPlayModule = class("GoldHowToPlayModule", ModuleBase)

local ModuleCache = ModuleCache

function GoldHowToPlayModule:initialize(...)
    -- 开始初始化                view        loginModel           模块数据
    ModuleBase.initialize(self, "goldhowtoplay_view", nil, ...)
end

function GoldHowToPlayModule:on_show(data)
    local index = 1
    if data then
        index = data
    end
    self.Config = ModuleCache.PlayModeUtil.getGameRuleConfig()--require(string.format("package.public.config.%s.config_%s", AppData.App_Name, AppData.Game_Name))
    local text = ""
    if self.Config and self.Config.HowToPlayTexts then
        text = self.Config.HowToPlayTexts[index]
    end
    self.view:SetText(text)
end

function GoldHowToPlayModule:on_click(obj, arg)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj == self.view.buttonClose.gameObject then
        ModuleCache.ModuleManager.hide_module("public", "goldhowtoplay")
    end
end

return GoldHowToPlayModule