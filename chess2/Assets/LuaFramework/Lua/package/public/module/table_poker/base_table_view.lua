




local ModuleCache = ModuleCache
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local CSmartTimer = ModuleCache.SmartTimer.instance

local class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
local BaseTableView = class('baseTableView', View)

local Sequence = DG.Tweening.DOTween.Sequence
local GameSDKInterface = ModuleCache.GameSDKInterface

local Util = Util

function BaseTableView:initialize(...)
    View.initialize(self, ...)

    self.GetComponentWithPath = GetComponentWithPath
    self.ComponentTypeName = ComponentTypeName
    self.CSmartTimer = CSmartTimer
    
    self.buttonStart = GetComponentWithPath(self.root, "Bottom/Action/ButtonStart", ComponentTypeName.Button) 
    self.buttonReady = GetComponentWithPath(self.root, "Bottom/Action/ButtonReady", ComponentTypeName.Button) 
    self.buttonInvite = GetComponentWithPath(self.root, "Bottom/Action/ButtonInviteFriend", ComponentTypeName.Button) 
    self.buttonLeave = GetComponentWithPath(self.root, "Bottom/Action/ButtonLeave", ComponentTypeName.Button) 
    self.buttonSetting = GetComponentWithPath(self.root, "PublicButtons/ButtonSettings", ComponentTypeName.Button)
    self.buttonMic = GetComponentWithPath(self.root, "PublicButtons/ButtonMic", ComponentTypeName.Button)    
    self.buttonChat = GetComponentWithPath(self.root, "PublicButtons/ButtonChat", ComponentTypeName.Button)
    self.buttonActivity = GetComponentWithPath(self.root, "PublicButtons/ButtonActivity", ComponentTypeName.Button)
    self.spriteActivityRedPoint = GetComponentWithPath(self.root, "PublicButtons/ButtonActivity/RedPoint", ComponentTypeName.Image)

    self.buttonLocation = GetComponentWithPath(self.root, "PublicButtons/ButtonLocation", ComponentTypeName.Button)
    self.sliderBattery = GetComponentWithPath(self.root, "Top/TopInfo/BatteryTime/Battery", ComponentTypeName.Slider)
    self.imageBatteryCharging = GetComponentWithPath(self.root, "Top/TopInfo/BatteryTime/Battery/ImageCharging", ComponentTypeName.Image)
    self.textTime = GetComponentWithPath(self.root, "Top/TopInfo/BatteryTime/Time/Text", ComponentTypeName.Text)
    self.goWifiStateArray = {}    
    for i=1,5 do
        local goState = GetComponentWithPath(self.root, "Top/TopInfo/BatteryTime/WifiState/state" .. (i - 1), ComponentTypeName.Transform).gameObject
        table.insert(self.goWifiStateArray, goState)
    end
    
    self.goGState2G = GetComponentWithPath(self.root, "Top/TopInfo/BatteryTime/GState/2g", ComponentTypeName.Transform).gameObject
    self.goGState3G = GetComponentWithPath(self.root, "Top/TopInfo/BatteryTime/GState/3g", ComponentTypeName.Transform).gameObject
    self.goGState4G = GetComponentWithPath(self.root, "Top/TopInfo/BatteryTime/GState/4g", ComponentTypeName.Transform).gameObject
    
    self.textPingValue = GetComponentWithPath(self.root, "Top/TopInfo/BatteryTime/PingVal", ComponentTypeName.Text)

    self.textRoomNum = GetComponentWithPath(self.root, "Top/TopInfo/RoomID/Text", ComponentTypeName.Text)
    print(self.textRoomNum)
    self.textRoundNum = GetComponentWithPath(self.root, "Top/TopInfo/RoundNum/Text", ComponentTypeName.Text)
    self.textRoomRule = GetComponentWithPath(self.root, "Top/TopInfo/RoomInfo/Text", ComponentTypeName.Text)
    self:initAllSeatHolders()
    self:showActivityBtn(false)
end


function BaseTableView:getTotalSeatCount()
    return 4
end

function BaseTableView:initAllSeatHolders()
    self.uiStateSwitcherSeatPrefab = self.GetComponentWithPath(self.root, "Holder/Seat", ComponentTypeName.Transform)
    self.srcSeatHolderArray = {}
    for i=1,self:getTotalSeatCount() do
        local seatHolder = {}
        local seatPosTran = self.GetComponentWithPath(self.root, "Seats/" .. i, ComponentTypeName.Transform)
        local goSeat = ModuleCache.ComponentUtil.InstantiateLocal(self.uiStateSwitcherSeatPrefab.gameObject, seatPosTran.gameObject)   
        self:initSeatHolder(seatHolder, goSeat, i)
        self.srcSeatHolderArray[i] = seatHolder
        ModuleCache.ComponentUtil.SafeSetActive(seatHolder.seatRoot, false)   
    end
end

function BaseTableView:initSeatHolder(seatHolder, seatRoot, index)
    local root = seatRoot
    seatHolder.seatRoot = seatRoot
    seatHolder.buttonNotSeatDown = GetComponentWithPath(root, "NotSeatDown", ComponentTypeName.Button)  
    seatHolder.goSeatInfo = GetComponentWithPath(root, "Info", ComponentTypeName.Transform).gameObject     
    seatHolder.uiStateSwitcher = ModuleCache.ComponentManager.GetComponent(root,"UIStateSwitcher")
    ModuleCache.TransformUtil.SetX(seatHolder.uiStateSwitcher.transform, 0, true)
    ModuleCache.TransformUtil.SetY(seatHolder.uiStateSwitcher.transform, 0, true)  
    if index == 1 then
       seatHolder.uiStateSwitcher:SwitchState("Bottom")
        local animSelectBankerHorizontal = GetComponentWithPath(root, "Info/EffectHorizontal", ComponentTypeName.Image)           
        seatHolder.animSelectBanker = animSelectBankerHorizontal
    elseif index == 2 or index == 3 then
       seatHolder.uiStateSwitcher:SwitchState("Left")
    elseif index == 4 then
       seatHolder.uiStateSwitcher:SwitchState("Left")
    elseif index == 5 or index == 6 then        
       seatHolder.uiStateSwitcher:SwitchState("Right")
       seatHolder.isInRight = true
    end
    seatHolder.imagePlayerHead = GetComponentWithPath(root, "Info/Avatar/Mask/Image", ComponentTypeName.Image) 
    self.defaultHeadSprite = seatHolder.imagePlayerHead.sprite
    seatHolder.textPlayerName = GetComponentWithPath(root, "Info/TextName", ComponentTypeName.Text)
    seatHolder.textScore =  GetComponentWithPath(root, "Info/Point/Text", ComponentTypeName.Text)
    seatHolder.imageDisconnect =  GetComponentWithPath(root, "Info/ImageStateDisconnect", ComponentTypeName.Image)
    seatHolder.imageTemporaryLeave = GetComponentWithPath(root, "Info/ImageStateTemporaryLeave", ComponentTypeName.Image)    --暂时离开
    seatHolder.imageReady = GetComponentWithPath(root, "State/Group/ImageReady", ComponentTypeName.Image)
    seatHolder.imageBanker = GetComponentWithPath(root, "Info/ImageBanker", ComponentTypeName.Image)
    seatHolder.imageCreator = GetComponentWithPath(root, "Info/ImageCreator", ComponentTypeName.Image)   
    seatHolder.goSpeakIcon =  GetComponentWithPath(root, "State/Group/Speak", ComponentTypeName.Transform).gameObject

    seatHolder.emojiRootTran = GetComponentWithPath(root, "State/Group/ChatFace", ComponentTypeName.Transform)
end

function BaseTableView:showActivityBtn(show)
    show = show or false
    if(self.buttonActivity)then
        ModuleCache.ComponentUtil.SafeSetActive(self.buttonActivity.gameObject, show)
    end
end

function BaseTableView:setRoomInfo(roomInfo)
    if(self.modelData.roleData and self.modelData.roleData.HallID and tonumber(self.modelData.roleData.HallID) > 0) then
        self.textRoomNum.text = AppData.MuseumName .."房号:" .. roomInfo.roomNum
    else
        self.textRoomNum.text = "房号:" .. roomInfo.roomNum
    end


    self.textRoomRule.text = roomInfo.ruleDesc
    self.textRoundNum.text = "(第" .. roomInfo.curRoundNum .. "/" .. roomInfo.totalRoundCount .. "局)"
    self.textRoundNum.gameObject:SetActive(true)
end

function BaseTableView:refreshBatteryAndTimeInfo()
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

function BaseTableView:is_open_shake()
    return (ModuleCache.PlayerPrefsManager.GetInt("openShake", 1) == 1)
end

function BaseTableView:is_open_voice()
    return (ModuleCache.PlayerPrefsManager.GetInt("openVoice", 1) == 1)
end


function BaseTableView:shakePhone(ms)
    if(self:is_open_shake())then
        ModuleCache.GameSDKInterface:ShakePhone(ms)
    end
end

function BaseTableView:showWifiState(show, wifiLevel)    
    for i=1,#self.goWifiStateArray do        
        ModuleCache.ComponentUtil.SafeSetActive(self.goWifiStateArray[i], show and wifiLevel + 1 == i)   
    end
end

function BaseTableView:show4GState(show, signalType)
    ModuleCache.ComponentUtil.SafeSetActive(self.goGState2G, show and signalType == "2g")       
    ModuleCache.ComponentUtil.SafeSetActive(self.goGState3G, show and signalType == "3g")       
    ModuleCache.ComponentUtil.SafeSetActive(self.goGState4G, show and signalType == "4g")       
end

function BaseTableView:showReadyBtn_three(show)
    self:showReadyBtn(show)
    if show then
        self.buttonLeave.transform.localPosition =  Vector3.New(-300,self.buttonInvite.transform.localPosition.y,0)
        self.buttonInvite.transform.localPosition =  Vector3.New(0,self.buttonInvite.transform.localPosition.y,0)
        self.buttonReady.transform.localPosition =  Vector3.New(300,self.buttonInvite.transform.localPosition.y,0)
    else
        self.buttonLeave.transform.localPosition =  Vector3.New(-155,self.buttonInvite.transform.localPosition.y,0)
        self.buttonInvite.transform.localPosition =  Vector3.New(155,self.buttonInvite.transform.localPosition.y,0)
    end

end

function BaseTableView:showReadyBtn(show)    
    ModuleCache.ComponentUtil.SafeSetActive(self.buttonReady.gameObject, show)   
end

function BaseTableView:showInviteBtn(show)
    ModuleCache.ComponentUtil.SafeSetActive(self.buttonInvite.gameObject, show and (not ModuleCache.GameManager.iosAppStoreIsCheck))   
end

function BaseTableView:showLeaveBtn(show)
    ModuleCache.ComponentUtil.SafeSetActive(self.buttonLeave.gameObject, show)
end

function BaseTableView:showStartBtn(show)
    ModuleCache.ComponentUtil.SafeSetActive(self.buttonStart.gameObject, show)    
end

--置灰
function BaseTableView:setGray(go, isGray)
    if(not self._grayMat)then
        return
    end
    local components = ModuleCache.ComponentUtil.GetComponentsInChildren(go, ComponentTypeName.Image)
    local len = components.Length
    for i=0,len - 1 do
        local image = components[i]
        if(isGray)then
            image.material = self._grayMat
        else
            image.material = nil
        end
    end
end


--刷新座位玩家状态
function BaseTableView:refreshSeatState(seatInfo, localSeatIndex)
    localSeatIndex = localSeatIndex or seatInfo.localSeatIndex
    local seatHolder = self.seatHolderArray[localSeatIndex]

    if(seatInfo.playerId and (seatInfo.playerId ~= 0 and seatInfo.playerId ~= "0")) then
        ModuleCache.ComponentUtil.SafeSetActive(seatHolder.imageReady.gameObject, seatInfo.isReady and (not seatInfo.roomInfo.isRoundStarted))
    else
        ModuleCache.ComponentUtil.SafeSetActive(seatHolder.imageReady.gameObject, false)    
    end
    
    seatHolder.textScore.text = seatInfo.score

    if self.modelData.roleData.RoomType == 2 and self.modelData.curTableData then
        local roomInfo =  self.modelData.curTableData.roomInfo

        if tonumber(seatInfo.playerId) == tonumber(self.modelData.curTableData.roomInfo.mySeatInfo.playerId) then
            self:showReadyBtn_three(not seatInfo.isReady and tonumber(roomInfo.curRoundNum) == 0)
        end

        if seatHolder.kickBtn then
            if  seatInfo.isOffline == false then
                ModuleCache.ComponentUtil.SafeSetActive(seatHolder.kickBtn.gameObject,
                tonumber(roomInfo.curRoundNum) == 0 and not seatInfo.isCreator  and roomInfo.mySeatInfo.isCreator
                and AppData.Game_Name ~= "DOUDIZHU" and AppData.Game_Name ~= "GUANDAN" and AppData.Game_Name ~= "WUSHIK"
                )
            else
                ModuleCache.ComponentUtil.SafeSetActive(seatHolder.kickBtn.gameObject,tonumber(roomInfo.curRoundNum) == 0)
            end
        end

        --print(seatHolder.kickBtn.gameObject.activeSelf,AppData.Game_Name,seatInfo.playerId,"-----------------seatInfo.isOffline:",seatInfo.isOffline,
        --tonumber(seatInfo.playedRoundCount),tonumber(self.modelData.curTableData.roomInfo.CreatorId),self.modelData.curTableData.roomInfo.mySeatInfo.playerId)
    end
end

--刷新在线状态
function BaseTableView:refreshSeatOfflineState(seatInfo, localSeatIndex)
    localSeatIndex = localSeatIndex or seatInfo.localSeatIndex
    local seatHolder = self.seatHolderArray[localSeatIndex]
    ModuleCache.ComponentUtil.SafeSetActive(seatHolder.imageDisconnect.gameObject, seatInfo.isOffline)
    if(not seatInfo.isOffline) then
        ModuleCache.ComponentUtil.SafeSetActive(seatHolder.imageTemporaryLeave.gameObject, seatInfo.isTemporaryLeave or seatInfo.isTempLeave or false)
    else
        ModuleCache.ComponentUtil.SafeSetActive(seatHolder.imageTemporaryLeave.gameObject, false)
    end

    -- self.modelData.roleData.RoomType == 0 --0 非麻将馆房间 1 麻将馆普通开房 2 麻将馆随机组局 3 比赛场房间
    --TODO XLQ 快速组局 离线玩家显示踢人按钮---
    if seatHolder.kickBtn and self.modelData.roleData.RoomType == 2 and tonumber(self.modelData.curTableData.roomInfo.curRoundNum) == 0 then
        local roomInfo =  self.modelData.curTableData.roomInfo
        if not seatInfo.isOffline and not roomInfo.mySeatInfo.isCreator then

            ModuleCache.ComponentUtil.SafeSetActive(seatHolder.kickBtn.gameObject, false)
        else
            if  AppData.Game_Name ~= "DOUDIZHU" and AppData.Game_Name ~= "GUANDAN" and AppData.Game_Name ~= "WUSHIK" then
                ModuleCache.ComponentUtil.SafeSetActive(seatHolder.kickBtn.gameObject, tonumber(roomInfo.mySeatInfo.playerId) ~= tonumber(seatInfo.playerId))
            else
                ModuleCache.ComponentUtil.SafeSetActive(seatHolder.kickBtn.gameObject, seatInfo.isOffline )
            end

        end

    end

    --print("======refreshSeatOfflineState===============",AppData.Game_Name,seatInfo.isOffline,seatInfo.playerId,seatHolder.kickBtn.gameObject.activeSelf)
end

--刷新座位玩家信息
function BaseTableView:refreshSeatPlayerInfo(seatInfo, localSeatIndex)
    --print(#self.seatHolderArray, seatInfo.localSeatIndex)
    localSeatIndex = localSeatIndex or seatInfo.localSeatIndex
    local seatHolder = self.seatHolderArray[localSeatIndex]
    if(seatInfo.playerId and (seatInfo.playerId ~= 0 and seatInfo.playerId ~= "0")) then
        ModuleCache.ComponentUtil.SafeSetActive(seatHolder.goSeatInfo, true)
        ModuleCache.ComponentUtil.SafeSetActive(seatHolder.buttonNotSeatDown.gameObject, false)
        ModuleCache.ComponentUtil.SafeSetActive(seatHolder.imageCreator.gameObject, seatInfo.isCreator or false)
        ModuleCache.ComponentUtil.SafeSetActive(seatHolder.imageBanker.gameObject, seatInfo.isBanker or false)
        if(seatInfo.playerInfo and seatInfo.playerInfo.userId and seatInfo.playerInfo.userId..'' == seatInfo.playerId..'')then
            self:setPlayerInfo(seatHolder, seatInfo.playerInfo)
        else
            seatInfo.playerInfo = nil
            self:get_userinfo(seatInfo.playerId, function(err, data)
                if(err)then
                    self:refreshSeatPlayerInfo(seatInfo)
                    return
                end
                local playerInfo = seatInfo.playerInfo or {}
                playerInfo.playerId = seatInfo.playerId
                playerInfo.userId = data.userId
		        playerInfo.playerName = data.nickname
                playerInfo.nickname = data.nickname
		        playerInfo.headUrl = data.headImg
                playerInfo.headImg = data.headImg
                playerInfo.gender = data.gender
                playerInfo.score = data.score
                playerInfo.lostCount = data.lostCount
                playerInfo.winCount = data.winCount
                playerInfo.tieCount = data.tieCount
                playerInfo.breakRate = data.breakRate
                playerInfo.localIp = data.ip
                playerInfo.ip = playerInfo.ip or ''
                seatInfo.playerInfo = playerInfo
                if(seatInfo.on_get_userinfo_callback_queue)then
                    local cb = seatInfo.on_get_userinfo_callback_queue:shift()
                    while cb do
                        cb(seatInfo)
                        cb = seatInfo.on_get_userinfo_callback_queue:shift()
                    end
                end
                if(seatInfo.chatDataSeatHolder)then
                    seatInfo.chatDataSeatHolder.playerInfo = playerInfo
                end
                self:setPlayerInfo(seatHolder, seatInfo.playerInfo)
            end)
        end
    else
        ModuleCache.ComponentUtil.SafeSetActive(seatHolder.goSeatInfo, false)
        ModuleCache.ComponentUtil.SafeSetActive(seatHolder.buttonNotSeatDown.gameObject, true)
    end
end

function BaseTableView:setPlayerInfo(seatHolder, playerInfo)
    if(playerInfo)then
        if(playerInfo.playerId ~= 0)then
            if(not self:is_my_self(playerInfo.playerId) and self:is_need_fangzuobi())then
                seatHolder.textPlayerName.text = '****'
            else
                seatHolder.textPlayerName.text = Util.filterPlayerName(playerInfo.playerName)
            end

            playerInfo.playerShowName = seatHolder.textPlayerName.text
            if(playerInfo.hasDownHead)then
                if(playerInfo.spriteHeadImage)then
                    if(not self:is_my_self(playerInfo.playerId) and self:is_need_fangzuobi())then
                        seatHolder.imagePlayerHead.sprite = self.defaultHead
                    else
                        seatHolder.imagePlayerHead.sprite = playerInfo.spriteHeadImage
                    end

                end
                return
            end
            if(not self:is_my_self(playerInfo.playerId) and self:is_need_fangzuobi())then
                seatHolder.imagePlayerHead.sprite = self.defaultHead
            else
                seatHolder.imagePlayerHead.sprite = self.defaultHeadSprite
            end
            self:startDownLoadHeadIcon(seatHolder.imagePlayerHead, playerInfo.headUrl, function (sprite )
                if(not self:is_my_self(playerInfo.playerId) and self:is_need_fangzuobi())then
                    seatHolder.imagePlayerHead.sprite = self.defaultHead
                end
                playerInfo.hasDownHead = true
                playerInfo.spriteHeadImage = sprite
            end)
        else
            seatHolder.textPlayerName.text = Util.filterPlayerName("正在获取..")
            return
        end
    else
        seatHolder.imagePlayerHead.sprite = self.defaultHeadSprite
        seatHolder.textPlayerName.text = ''
    end
end
 


function BaseTableView:get_userinfo(playerId, callback)
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "user/info?",
        params = {
            uid = playerId,
        },
        cacheDataKey = "user/info?uid=" .. playerId,
        cacheDataImmediatelyCallback = true,
    }

    self:http_get(requestData, function(wwwOperation)
        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then    --OK
            callback(nil, retData.data)
        else
            callback(retData.ret, nil)
        end
    end, function(error)
        print(error.error)
        callback(error.error, nil)
    end, function(cacheDataText)
        local retData = ModuleCache.Json.decode(cacheDataText)
        if retData.ret and retData.ret == 0 then    --OK
            callback(nil, retData.data)
        else
            callback(retData.ret, nil)
        end
    end)

end

--显示聊天气泡
function BaseTableView:show_chat_bubble(localSeatIndex, content)
    local seatHolder = self.seatHolderArray[localSeatIndex]
    local seatRoot = seatHolder.seatRoot
    local chatBubble = GetComponentWithPath(seatRoot, "State/Group/ChatBubble", ComponentTypeName.RectTransform).gameObject
    local chatText = GetComponentWithPath(chatBubble, "TextBg/Text", ComponentTypeName.Text)
    chatText.text = content
    chatBubble:SetActive(true)
    if seatHolder.timeChatEvent_id then 
        CSmartTimer:Kill(seatHolder.timeChatEvent_id)
        seatHolder.timeChatEvent_id = nil
    end
    seatHolder.timeChatEvent_id = nil
    local timeEvent = nil
    timeEvent = View.subscibe_time_event(self, 3, false, 0):OnComplete(function(t)
        chatBubble:SetActive(false)
    end)
    seatHolder.timeChatEvent_id = timeEvent.id
end

--显示表情
function BaseTableView:show_chat_emoji(localSeatIndex, emojiId)

end



function BaseTableView:show_voice(localSeatIndex)
    local seatHolder = self.seatHolderArray[localSeatIndex]
    seatHolder.goSpeakIcon:SetActive(true)
end

function BaseTableView:hide_voice(localSeatIndex)
    local seatHolder = self.seatHolderArray[localSeatIndex]
    seatHolder.goSpeakIcon:SetActive(false)
end


function BaseTableView:resetSeatHolderArray(seatCount)
	local newSeatHolderArray = {}
	local seatHolderArray = self.srcSeatHolderArray
    newSeatHolderArray = seatHolderArray

	for i,v in ipairs(seatHolderArray) do
		ModuleCache.ComponentUtil.SafeSetActive(v.seatRoot, false)   
	end
	for i,v in ipairs(newSeatHolderArray) do
		ModuleCache.ComponentUtil.SafeSetActive(v.seatRoot, true)   
	end
	self.seatHolderArray = newSeatHolderArray
end

function BaseTableView:show_ping_delay(show, delaytime)
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

function BaseTableView:refresh_table_bg(tableBg)
    local isShow
    for i = 1, 3 do
        local bg = self['tableBackgroundImage'..i]
        if(bg)then
            if(tableBg == i)then
                isShow = true
            end
            ModuleCache.ComponentUtil.SafeSetActive(bg.gameObject, tableBg == i)
        end
    end
    if(not isShow and self.tableBackgroundImage)then
        ModuleCache.ComponentUtil.SafeSetActive(self.tableBackgroundImage.gameObject, true)
    end
end

function BaseTableView:set_museum_data(museumData, myPlayerId, defaultHead)
    self.defaultHead = defaultHead
    self.museumData = museumData
    self.myPlayerId = myPlayerId
end

function BaseTableView:is_need_fangzuobi()
    return self.museumData and self.museumData.preventionCheat == 1
end

function BaseTableView:is_my_self(playerId)
    return tostring(playerId) == tostring(self.myPlayerId)
end

return  BaseTableView