




local ModuleCache = ModuleCache
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local CSmartTimer = ModuleCache.SmartTimer.instance

local class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
local Manager = require("manager.function_manager")
---@class PokerTableFrameView
local PokerTableFrameView = class('baseTableView', View)
local GameSDKInterface = ModuleCache.GameSDKInterface

local Util = Util

function PokerTableFrameView:initialize(...)
    View.initialize(self, "publictable/module/pokertableframe/pokertableframe.prefab", "PokerTableFrame")

    self.buttonTextReconnect = GetComponentWithPath(self.root, "TestBtnReconnection", ComponentTypeName.Button)
	ModuleCache.ComponentUtil.SafeSetActive(self.buttonTextReconnect.gameObject, ModuleCache.GameManager.developmentMode or false)

	
	self:fixed_tran_size(Manager.FindObject(self.root, "Style_1"))
	self:fixed_tran_size(Manager.FindObject(self.root, "Style_2"))
end

function PokerTableFrameView:initView(style)
    if(self._inted)then
        return
    end
    self._inted = true
    self.goStyles = {}
    for i = 1, 2 do
        local tran = GetComponentWithPath(self.root, "Style_"..i, ComponentTypeName.Transform)
        if(tran)then
            self.goStyles[i] = tran.gameObject
            ModuleCache.ComponentUtil.SafeSetActive(self.goStyles[i], false)
        end
    end
    local root = self.goStyles[style]
    assert(root, '选择的Style不存在 style='..style)
    ModuleCache.ComponentUtil.SafeSetActive(root, true)
    self.textRoomNum = GetComponentWithPath(root, "Top/TopRight/RoomID/Text", ComponentTypeName.Text)
    self.goWifiStateArray = {}
    for i=1,5 do
        local goState = GetComponentWithPath(root, "Top/TopRight/WifiState/state" .. (i - 1), ComponentTypeName.Transform).gameObject
        table.insert(self.goWifiStateArray, goState)
    end
    self.goGState2G = GetComponentWithPath(root, "Top/TopRight/GState/2g", ComponentTypeName.Transform).gameObject
    self.goGState3G = GetComponentWithPath(root, "Top/TopRight/GState/3g", ComponentTypeName.Transform).gameObject
    self.goGState4G = GetComponentWithPath(root, "Top/TopRight/GState/4g", ComponentTypeName.Transform).gameObject
    self.sliderBattery = GetComponentWithPath(root, "Top/TopRight/Battery", ComponentTypeName.Slider)
    print(self.sliderBattery)
    self.imageBatteryCharging = GetComponentWithPath(root, "Top/TopRight/Battery/ImageCharging", ComponentTypeName.Image)
    self.textPingValue = GetComponentWithPath(root, "Top/TopRight/PingVal", ComponentTypeName.Text)
    self.textTime = GetComponentWithPath(root, "Top/TopRight/Time/Text", ComponentTypeName.Text)

    self.buttonLocation = GetComponentWithPath(root, "Top/ButtonLocation", ComponentTypeName.Button)
    if(not self.buttonLocation)then
        self.buttonLocation = GetComponentWithPath(root, "Top/TopLeft/NewUI/LeftRoot/Bg/Style/ButtonLocation", ComponentTypeName.Button)
    end

    self.buttonFree = GetComponentWithPath(root, "Top/TopLeft/NewUI/LeftRoot/Bg/Style/ButtonFree", ComponentTypeName.Button)
    self.buttonOpen = GetComponentWithPath(root, "Top/TopLeft/NewUI/Buttons/BtnLeftOpen", ComponentTypeName.Button)
    self.buttonGoldShop = GetComponentWithPath(root, "Top/TopLeft/NewUI/Buttons/ButtonGoldShop", ComponentTypeName.Button)
    self.buttonActivity = GetComponentWithPath(root, "Top/TopLeft/NewUI/Buttons/ButtonActivity", ComponentTypeName.Button)
    self.spriteActivityRedPoint = GetComponentWithPath(root, "Top/TopLeft/NewUI/Buttons/ButtonActivity/RedPoint", ComponentTypeName.Image)

    self.buttonClose = GetComponentWithPath(root, "Top/TopLeft/NewUI/LeftRoot/BtnLeftClose", ComponentTypeName.Button)

    self.goDetailPanel = GetComponentWithPath(root, "Top/TopLeft/NewUI/LeftRoot", ComponentTypeName.Transform).gameObject
    self.uiStateSwitcher = GetComponentWithPath(root, "Top/TopRight", 'UIStateSwitcher')

    self:showActivityBtn(false)
end

function PokerTableFrameView:showActivityBtn(show)
    if(not self._inted)then
        return
    end
    show = show or false
    ModuleCache.ComponentUtil.SafeSetActive(self.buttonActivity.gameObject, show)
end

function PokerTableFrameView:showRoomId(show)
    if(not self._inted)then
        return
    end
    if(show)then
        self.uiStateSwitcher:SwitchState("Normal")
    else
        self.uiStateSwitcher:SwitchState("HideRoomID")
    end
end

function PokerTableFrameView:setRoomInfo(roomNumber)
    if(not self._inted)then
        return
    end
    if self.modelData.roleData.HallID and self.modelData.roleData.HallID > 0 then
        self.textRoomNum.text = AppData.MuseumName .."房号:" .. roomNumber
    else
        self.textRoomNum.text = "房号:" .. roomNumber
    end
end

function PokerTableFrameView:refreshBatteryAndTimeInfo()
    if(not self._inted)then
        return
    end
    local batteryValue = GameSDKInterface:GetCurBatteryLevel()
    batteryValue = batteryValue / 100
    self.sliderBattery.value = batteryValue
    ModuleCache.ComponentUtil.SafeSetActive(self.imageBatteryCharging.gameObject, GameSDKInterface:GetCurChargeState())
    self.textTime.text = os.date("%H:%M", os.time())

    local signalType = ModuleCache.SDKInterface().get_cur_signal_type()

    if(signalType == "none")then
        self:showWifiState(true, 0)
        self:show4GState(false)
    elseif(signalType == "wifi")then
        local wifiLevel = ModuleCache.SDKInterface().get_cur_signal_strength()
        self:showWifiState(true, math.ceil(wifiLevel))
        self:show4GState(false)
    else
        self:showWifiState(false)
        self:show4GState(true, signalType)
    end

    
end

function PokerTableFrameView:showWifiState(show, wifiLevel)
    if(not self._inted)then
        return
    end
    for i=1,#self.goWifiStateArray do        
        ModuleCache.ComponentUtil.SafeSetActive(self.goWifiStateArray[i], show and wifiLevel + 1 == i)   
    end
end

function PokerTableFrameView:show4GState(show, signalType)
    if(not self._inted)then
        return
    end
    ModuleCache.ComponentUtil.SafeSetActive(self.goGState2G, show and signalType == "2g")       
    ModuleCache.ComponentUtil.SafeSetActive(self.goGState3G, show and signalType == "3g")       
    ModuleCache.ComponentUtil.SafeSetActive(self.goGState4G, show and signalType == "4g")       
end


function PokerTableFrameView:show_ping_delay(show, delaytime)
    if(not self._inted)then
        return
    end
    ModuleCache.ComponentUtil.SafeSetActive(self.textPingValue.gameObject, show)       
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
    self.textPingValue.text = content
end

function PokerTableFrameView:show_detail_panel(show)
    if(not self._inted)then
        return
    end
    show = show or false
    ModuleCache.ComponentUtil.SafeSetActive(self.goDetailPanel, show)
    ModuleCache.ComponentUtil.SafeSetActive(self.buttonOpen.gameObject, not show)
    self:show_shop_btn(self.is_show_shop and (not show))
end

function PokerTableFrameView:show_shop_btn(show)
    if(not self._inted)then
        return
    end
    show = show or false
    ModuleCache.ComponentUtil.SafeSetActive(self.buttonGoldShop.gameObject, self.is_show_shop)
end

function PokerTableFrameView:show_location_btn(show)
    if(not self._inted)then
        return
    end
    self.is_show_location_btn = show or false
    if(self.buttonLocation)then
        ModuleCache.ComponentUtil.SafeSetActive(self.buttonLocation.gameObject, self.is_show_location_btn)
    end
end

function PokerTableFrameView:show_free_btn(show)
    if(not self._inted)then
        return
    end
    show = show or false
    if(self.buttonFree)then
        ModuleCache.ComponentUtil.SafeSetActive(self.buttonFree.gameObject, show)
    end
end

return  PokerTableFrameView