






local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")

---@class HowToPlayModule
---@field public howToPlayView HowToPlayView
local HowToPlayModule = class("BullFight.HowToPlayModule", ModuleBase)
local xstr = require("lib.xstr")

-- 常用模块引用
local ModuleCache = ModuleCache
local PlayerPrefs = UnityEngine.PlayerPrefs
local NetClientManager = ModuleCache.net.NetClientManager
local UnityEngine = UnityEngine
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath


function HowToPlayModule:initialize(...)
    -- 开始初始化                view        loginModel           模块数据
    ModuleBase.initialize(self, "howToPlay_view", nil, ...)
end


function HowToPlayModule:on_show(clickIndex)
    self.Config = ModuleCache.PlayModeUtil.getGameRuleConfig()--require(string.format("package.public.config.%s.config_%s",AppData.App_Name,AppData.Game_Name))
    local showIndex = nil
    if(not clickIndex) then
        self.wanfaType = ModuleCache.PlayModeUtil.get_playmodel_data(nil,nil,ModuleCache.GameManager.curGameId)

        if(AppData.isPokerGame()) then
            self.wanfaType = PlayerPrefs.GetInt(AppData.Game_Name .. "_wanfaType", 1)
        end
        if(self.wanfaType > #self.Config.createRoomTable) then
            self.wanfaType = 1
        end
        showIndex = self.wanfaType
    else
        self.wanfaType = clickIndex
        showIndex = 1
    end
    if(self.view.tagBtnToggles and #self.view.tagBtnToggles ~= 0) then
        for i=1,#self.view.tagBtnToggles do
            self.view.tagBtnToggles[i].onValueChanged:RemoveAllListeners()
        end
    end
    self.view:show_create(self.wanfaType, clickIndex)
    self.view.tagBtnToggles[showIndex].isOn = true
    for i=1,#self.view.tagBtnToggles do
        self.view.checkmarks[i]:SetActive(i == showIndex)
    end
    if(not clickIndex) then
        for i=1,#self.howToPlayView.tagBtnToggles do
            self.howToPlayView.tagBtnToggles[i].onValueChanged:AddListener(function(isCheck)
                if isCheck then
                    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
                    self.view:show_create(i)
                end
                self.howToPlayView.checkmarks[i]:SetActive(isCheck)
            end)
        end
    end
end


function HowToPlayModule:on_click(obj, arg)
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
    if obj == self.howToPlayView.buttonClose.gameObject then
        ModuleCache.ModuleManager.hide_module("public", "howtoplay")
        return
    end
end


return HowToPlayModule



