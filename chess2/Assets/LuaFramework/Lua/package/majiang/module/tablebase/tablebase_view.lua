




local ModuleCache = ModuleCache
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local CSmartTimer = ModuleCache.SmartTimer.instance
local GameObject = UnityEngine.GameObject
local GameSDKInterface = ModuleCache.GameSDKInterface
local class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
---@class TableBaseView : View
local TableBaseView = class('tableBaseView', View)
local ComponentUtil = ModuleCache.ComponentUtil
local PlayerPrefs = UnityEngine.PlayerPrefs

function TableBaseView:initialize(...)
    View.initialize(self, ...)
    local gameRoot = GameObject.Find("GameRoot")
    self.uicamera = GetComponentWithPath(gameRoot, "Game/UIRoot/UICamera", "UnityEngine.Camera")
    self.sliderBattery = GetComponentWithPath(self.root, "TopRight/Child/BatteryTime/Battery", ComponentTypeName.Slider)
    self.batteryCharging = GetComponentWithPath(self.root, "TopRight/Child/BatteryTime/Battery/ImageCharging", ComponentTypeName.Transform).gameObject
    self.textTime = GetComponentWithPath(self.root, "TopRight/Child/BatteryTime/Time/Text", ComponentTypeName.Text)
    self.goWifiStateArray = {}    
    for i=1,5 do
        local goState = GetComponentWithPath(self.root, "TopRight/Child/BatteryTime/WifiState/state" .. (i - 1), ComponentTypeName.Transform).gameObject
        table.insert(self.goWifiStateArray, goState)
    end
    
    self.goGState2G = GetComponentWithPath(self.root, "TopRight/Child/BatteryTime/GState/2g", ComponentTypeName.Transform).gameObject
    self.goGState3G = GetComponentWithPath(self.root, "TopRight/Child/BatteryTime/GState/3g", ComponentTypeName.Transform).gameObject
    self.goGState4G = GetComponentWithPath(self.root, "TopRight/Child/BatteryTime/GState/4g", ComponentTypeName.Transform).gameObject

    self.textPingState = GetComponentWithPath(self.root, "TopRight/Child/BatteryTime/TextPingState", ComponentTypeName.Text)

    self.buttonActivity = GetComponentWithPath(self.root, "TopRight/Child/ButtonActivity", ComponentTypeName.Transform).gameObject
    self.redPointObj = GetComponentWithPath(self.root, "TopRight/Child/ButtonActivity/RedPoint", ComponentTypeName.Transform).gameObject

    self.buttonMic = GetComponentWithPath(self.root, "BottomRight/Child/Action/ButtonMic", ComponentTypeName.Button)
    self.buttonRealTimeVoice = GetComponentWithPath(self.root, "BottomRight/Child/Action/ButtonRealTimeVoice", ComponentTypeName.Transform).gameObject
    self.realTimeSpeakerCloseStateTag = GetComponentWithPath(self.root, "BottomRight/Child/Action/ButtonRealTimeVoice/CloseStateTag", ComponentTypeName.Transform).gameObject

    self:refresh_buttonActivity_state()
    self:refresh_buttonRealTimeVoice_state()
end

function TableBaseView:refresh_voice_shake()
    self.openVoice = (PlayerPrefs.GetFloat("openVoiceVolume", 0.5) > 0)
    self.openShake = (PlayerPrefs.GetInt("openShake", 1) == 0)
    self.openGuoHu = (PlayerPrefs.GetInt("openGuoHu", self.ConfigData.defGuoHu or 1) == 0)
    self.openFast = false and (PlayerPrefs.GetInt("openFast", 1) == 1)
end

function TableBaseView:get_world_pos(screenPos, z)
    return self.uicamera:ScreenToWorldPoint(Vector3.New(screenPos.x, screenPos.y, z))
end

function TableBaseView:refresh_battery_time_info()

    local batteryValue = GameSDKInterface:GetCurBatteryLevel()
    batteryValue = batteryValue / 100
    self.sliderBattery.value = batteryValue
    self.textTime.text = os.date("%H:%M", os.time())

    local signalType = ModuleCache.SDKInterface().get_cur_signal_type()

    if(signalType == "none")then
        self:show_wifi_state(true, 0)
        self:show_4g_state(false)
    elseif(signalType == "wifi")then
        local wifiLevel = ModuleCache.SDKInterface().get_cur_signal_strength()
        self:show_wifi_state(true, math.ceil(wifiLevel))
        self:show_4g_state(false)
    else
        self:show_wifi_state(false)
        self:show_4g_state(true, signalType)
    end
    ModuleCache.ComponentUtil.SafeSetActive(self.batteryCharging, GameSDKInterface:GetCurChargeState())
end

function TableBaseView:show_wifi_state(show, wifiLevel)    
    for i=1,#self.goWifiStateArray do        
        ModuleCache.ComponentUtil.SafeSetActive(self.goWifiStateArray[i], show and wifiLevel + 1 == i)   
    end
end

function TableBaseView:show_4g_state(show, signalType)
    ModuleCache.ComponentUtil.SafeSetActive(self.goGState2G, show and signalType == "2g")       
    ModuleCache.ComponentUtil.SafeSetActive(self.goGState3G, show and signalType == "3g")       
    ModuleCache.ComponentUtil.SafeSetActive(self.goGState4G, show and signalType == "4g")       
end

function TableBaseView:show_ping_delay(show, delaytime)
    ModuleCache.ComponentUtil.SafeSetActive(self.textPingState.gameObject, show)       
    if(not show)then
        return
    end
    delaytime = math.floor(delaytime * 1000)
    local content = ''
    if(delaytime >= 1000)then
        delaytime = delaytime / 1000
        delaytime = Util.getPreciseDecimal(delaytime, 2)
        content = '<color=#a31e2a>' .. delaytime .. 's</color>'
    elseif(delaytime >= 200)then
        content = '<color=#a31e2a>' .. delaytime .. 'ms</color>'
    elseif(delaytime >= 100)then
        content = '<color=#b5a324>' .. delaytime .. 'ms</color>'
    else
        content = '<color=#44b916>' .. delaytime .. 'ms</color>'
    end
    self.textPingState.text = content
end

-- 延时刷新state
function TableBaseView:pre_delay_state_time(newGameState)
    for i=1,#newGameState.Action do
        local action = newGameState.Action[i]
        if (9 == action.Action) then
            return -1
        end
    end
    return 0
end

function TableBaseView:get_chat_short_text(index)
    return TableUtil.get_chat_text(index)
end

--- 刷新游戏状态
function TableBaseView:refresh_game_state(gameState)

end

--- 刷新用户状态
function TableBaseView:refresh_user_state(userState)

end

---刷新用户离线状态
function TableBaseView:refresh_user_offline_state(userOfflineState)

end

--- 重置
function TableBaseView:reset_mj(refresh)

end

---刷新活动按钮状态
function TableBaseView:refresh_buttonActivity_state()
    ModuleCache.ComponentUtil.SafeSetActive(self.buttonActivity,false)
    --[[local object =
    {
        buttonActivity = self.buttonActivity,
        spriteRedPoint = self.redPointObj,
    }
    ModuleCache.ModuleManager.show_public_module("activity", object)--]]
end

function TableBaseView:refresh_buttonRealTimeVoice_state()
    if TableManager:cur_game_is_shishiyuyin_room() then
        ModuleCache.ComponentUtil.SafeSetActive(self.buttonMic.gameObject,false)
        ModuleCache.ComponentUtil.SafeSetActive(self.buttonRealTimeVoice,true)    
        local curState = ModuleCache.GVoiceManager().speaker_is_open()
        ModuleCache.ComponentUtil.SafeSetActive(self.realTimeSpeakerCloseStateTag,not curState)   
    else
        ModuleCache.ComponentUtil.SafeSetActive(self.buttonRealTimeVoice,false)    
    end
end

---获取当前时候显示听牌提示列表
function TableBaseView:getIsShowTingSetting()
    --TODO:这两个不敢改
    local gameInfo = ModuleCache.PlayModeUtil.getInfoByGameId(ModuleCache.GameManager.curGameId)
    local keyName = gameInfo.createName.."_isShowTing" ---游戏创建名，全局唯一
    local isShowTingDefValue = self.ConfigData.isShowTingDefValue or 1
    local isShowTingSetting = ModuleCache.PlayerPrefsManager.GetInt(keyName,isShowTingDefValue) == 1 and true or false
    return isShowTingSetting
end
---设置当前时候显示听牌提示列表
function TableBaseView:setIsShowTingSetting(isOpen)
    local gameInfo = ModuleCache.PlayModeUtil.getInfoByGameId(ModuleCache.GameManager.curGameId)
    local keyName = gameInfo.createName.."_isShowTing" ---游戏创建名，全局唯一
    PlayerPrefs.SetInt(keyName,isOpen and 1 or 2)
end

---获取当前普通话方言配置
function TableBaseView:getCurLocationSetting()
    local locationSetting = 0
    if self.ConfigData.isOpenLocationSetting then
        local key = string.format("%s_LocationSetting",ModuleCache.GameManager.curGameId)
        local defSetting = self.ConfigData.defLocationSetting or 0
        locationSetting = PlayerPrefs.GetInt(key,defSetting)
    end
    return locationSetting
end

---获取当前推荐出牌配置
function TableBaseView:getIsRecommendOutPaiSetting()
    local recommendOutMj = 0
    if self.ConfigData.IsOpenRecommendOutPaiSetting then
        local key = string.format("%s_IsRecommendOutPai",ModuleCache.GameManager.curGameId)
        local defSetting = self.ConfigData.defLocationSetting or 0
        recommendOutMj = PlayerPrefs.GetInt(key,defSetting)
    end
    return recommendOutMj
end

---获取是否开启简略小结算配置
function TableBaseView:getBriefOneGameResultSetting()
    local useBriefOneGameResult = 0
    if self.ConfigData.useBriefOneGameResult then
        local key = string.format("%s_useBriefOneGameResult",ModuleCache.GameManager.curGameId)
        useBriefOneGameResult = PlayerPrefs.GetInt(key,1)
    end
    return useBriefOneGameResult --- 0 不使用，1 开启，2 关闭
end
---设置开启简略小结算配置
function TableBaseView:setBriefOneGameResultSetting(isOpen)
    local key = string.format("%s_useBriefOneGameResult",ModuleCache.GameManager.curGameId)
    PlayerPrefs.SetInt(key,isOpen and 1 or 0)
end

---获取是否开启单击出牌配置
function TableBaseView:getOneClickOutMjSetting()
    local useOneClickOutMj = 0
    if self.ConfigData.useOneClickOutMj then
        local key = string.format("%s_useOneClickOutMj",ModuleCache.GameManager.curGameId)
        useOneClickOutMj = PlayerPrefs.GetInt(key,0)
    end
    return useOneClickOutMj
end
---设置开启单击出牌配置
function TableBaseView:setOneClickOutMjSetting(isOpen)
    local key = string.format("%s_useOneClickOutMj",ModuleCache.GameManager.curGameId)
    PlayerPrefs.SetInt(key,isOpen and 1 or 0)
end

return  TableBaseView