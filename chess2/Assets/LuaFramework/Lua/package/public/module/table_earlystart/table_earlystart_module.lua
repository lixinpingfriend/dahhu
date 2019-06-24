local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")

local EarlyStartModule = class("EarlyStartModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local UnityEngine = UnityEngine

function EarlyStartModule:initialize(...)
    ModuleBase.initialize(self, "table_earlystart_view", nil, ...)
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function EarlyStartModule:on_module_inited()

end

-- 绑定module层的交互事件
function EarlyStartModule:on_module_event_bind()

end

-- 绑定loginModel层事件，模块内交互
function EarlyStartModule:on_model_event_bind()

end

function EarlyStartModule:on_show(InitData)
    if not InitData then
        return
    end
    local isNotice = InitData.isNotice
    if isNotice then
        self.view:show_apply_window()
    else
		local earlyStartData = InitData.earlyStartData
		local isPokerGame = InitData.isPokerGame
        self.view:hide_apply_window()
        self.view:refresh_view(earlyStartData, isPokerGame)
    end
    self.view.applyNotice_Toggle.onValueChanged:AddListener(function()
        if self.view.applyNotice_Toggle.isOn then
            ModuleCache.PlayerPrefsManager.SetInt(string.format("%s_EarlyStartNotice",ModuleCache.GameManager.curGameId),1)
        else
            ModuleCache.PlayerPrefsManager.SetInt(string.format("%s_EarlyStartNotice",ModuleCache.GameManager.curGameId),2)
        end
    end)
end

function EarlyStartModule:on_click(obj, arg)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj == self.view.buttonAgree.gameObject then
        self:dispatch_package_event("Event_Tablestrategy_StartNow", 2)
    elseif obj == self.view.buttonRefuse.gameObject then
        self:dispatch_package_event("Event_Tablestrategy_StartNow", 3)
    elseif obj == self.view.applyOk_Button.gameObject then
        self:dispatch_package_event("Event_Tablestrategy_StartNow", 1)
    elseif obj == self.view.applyEixt_Button then
        ModuleCache.ModuleManager.hide_module("public", "table_earlystart")
    end
end

function EarlyStartModule:on_update()
    if self.view then
        self.view:update_beat()
    end
end



return EarlyStartModule