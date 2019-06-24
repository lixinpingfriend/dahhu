local BranchPackageName = AppData.BranchRunfastName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local Sequence = DG.Tweening.DOTween.Sequence
local TableData = require("package/runfast/module/tablerunfast/tablerunfast_data")
local CardCommon = require(TableData.Path_gamelogic_common)
---@class TableRunfastHelper
local TableRunfastHelper = {}
local ModuleCache = ModuleCache
TableRunfastHelper.WaitThisRoundFinish = "等待本局结束"
TableRunfastHelper.PokerStyleTypeKey = "RunfastPokerStyleType"

------初始化座位持有者:seatHolder座位持有者,seatIndex座位下标,goSeat座位对象,handPokerRoot扑克节点
function TableRunfastHelper:initSeatHolder(seatHolder, seatIndex, goSeat, handPokerRoot)
    local root = goSeat
    seatHolder.seatRoot = goSeat
    seatHolder.NotSeatRoot = GetComponentWithPath(root, "NotSeatRoot", ComponentTypeName.Transform).gameObject--没有人座位下的状态
    seatHolder.NotSeatRootUIStateSwitcher = GetComponentWithPath(root,"NotSeatRoot", "UIStateSwitcher")
    seatHolder.goSeatInfo = GetComponentWithPath(root, "Info", ComponentTypeName.Transform).gameObject--座位上玩家的信息
    seatHolder.HeadSelected =  GetComponentWithPath(root, "Info/HeadBg/Avatar/HeadSelected", ComponentTypeName.Transform).gameObject--座位上玩家的信息
    ModuleCache.ComponentUtil.SafeSetActive(seatHolder.HeadSelected,false)
    seatHolder.AvatarUIStateSwitcher = GetComponentWithPath(root,"Info/HeadBg/Avatar", "UIStateSwitcher")
    
    --ui状态切换
    local uiStateSwitcher = ModuleCache.ComponentManager.GetComponent(root,"UIStateSwitcher")
    ModuleCache.TransformUtil.SetX(uiStateSwitcher.transform, 0, true)
    ModuleCache.TransformUtil.SetY(uiStateSwitcher.transform, 0, true)
    if(seatIndex == 1) then
        uiStateSwitcher:SwitchState("Bottom")
    elseif(seatIndex == 2) then
        uiStateSwitcher:SwitchState("Right")
    elseif(seatIndex == 3) then
        uiStateSwitcher:SwitchState("Left")
        seatHolder.isInRight = true
    elseif(seatIndex == 4) then
        uiStateSwitcher:SwitchState("Left")
    end

    seatHolder.EffectXuanZhuanHeiTao3Root = GetComponentWithPath(root,"State/Group/EffectXuanZhuanHeiTao3Root", ComponentTypeName.Transform).gameObject
    ModuleCache.ComponentUtil.SafeSetActive(seatHolder.EffectXuanZhuanHeiTao3Root.gameObject, false)
    seatHolder.PiaoFenRoot = GetComponentWithPath(root,"State/Group/PiaoFenRoot", ComponentTypeName.Transform).gameObject
    ModuleCache.ComponentUtil.SafeSetActive(seatHolder.PiaoFenRoot, false)
    seatHolder.PiaoFenAnimRoot = GetComponentWithPath(root,"State/Group/PiaoFenRoot/AnimRoot", ComponentTypeName.Transform).gameObject
    seatHolder.PiaoFenWinText = GetComponentWithPath(root,"State/Group/PiaoFenRoot/AnimRoot/WinText", ComponentTypeName.Text)
    seatHolder.PiaoFenLostText = GetComponentWithPath(root,"State/Group/PiaoFenRoot/AnimRoot/LostText", ComponentTypeName.Text)

    seatHolder.WhoWinEffectRoot = GetComponentWithPath(root, "State/Group/WhoWinEffectRoot", ComponentTypeName.Transform).gameObject
    ModuleCache.ComponentUtil.SafeSetActive(seatHolder.WhoWinEffectRoot, false)
    seatHolder.WhoFirstPlayingRoot = GetComponentWithPath(root, "State/Group/WhoFirstPlayingRoot", ComponentTypeName.Transform).gameObject
    ModuleCache.ComponentUtil.SafeSetActive(seatHolder.WhoFirstPlayingRoot, false)

    seatHolder.CurrencyUIStateSwitcher = GetComponentWithPath(root, "Info/HeadBg/SomeInfoRoot/CurrencyRoot", "UIStateSwitcher")
    seatHolder.Warning = GetComponentWithPath(root, "State/Group/Warning", ComponentTypeName.Transform).gameObject
    ModuleCache.ComponentUtil.SafeSetActive(seatHolder.Warning,false)
    seatHolder.RemainPokerRoot = GetComponentWithPath(root, "State/Group/RemainPokerRoot", ComponentTypeName.Transform).gameObject
    ModuleCache.ComponentUtil.SafeSetActive(seatHolder.RemainPokerRoot,false)
    seatHolder.RemainPokerInHand = GetComponentWithPath(root, "State/Group/RemainPokerRoot/RemainPokerInHand", ComponentTypeName.Text)--手上剩余的牌的数量
    seatHolder.WarningBubbleRoot = GetComponentWithPath(root, "State/Group/WarningBubbleRoot", ComponentTypeName.Transform).gameObject--要不起的效果
    ModuleCache.ComponentUtil.SafeSetActive(seatHolder.WarningBubbleRoot,false)
    seatHolder.NotAffordEffectRoot = GetComponentWithPath(root, "State/Group/NotAfford/NotAffordImage", ComponentTypeName.Transform).gameObject
    ModuleCache.ComponentUtil.SafeSetActive(seatHolder.NotAffordEffectRoot,false)
    seatHolder.KickBtn = GetComponentWithPath(root, "State/Group/KickBtn", ComponentTypeName.Button)
    ModuleCache.ComponentUtil.SafeSetActive(seatHolder.KickBtn.gameObject,false)

    seatHolder.ZhaDanEffectRoot = GetComponentWithPath(root, "Info/HeadBg/ZhaDanEffectRoot", ComponentTypeName.Transform).gameObject
    seatHolder.ZhaDanEffectPread = GetComponentWithPath(seatHolder.ZhaDanEffectRoot.gameObject, "ZhaDanEffectPread", ComponentTypeName.Transform).gameObject
    ModuleCache.ComponentUtil.SafeSetActive(seatHolder.ZhaDanEffectPread,false)
    seatHolder.ZhaDanEffectMoveRoot = GetComponentWithPath(seatHolder.ZhaDanEffectRoot.gameObject, "ZhaDanEffectScore/MoveRoot", ComponentTypeName.Transform).gameObject

    seatHolder.ThirdSeatShow = GetComponentWithPath(root, "ThirdSeatShow", ComponentTypeName.Transform).gameObject
    seatHolder.ThirdSeatShowText = GetComponentWithPath(root, "ThirdSeatShow/Text", ComponentTypeName.Text)
    seatHolder.imagePlayerHead = GetComponentWithPath(root, "Info/HeadBg/Avatar/Mask/Image", ComponentTypeName.Image)--玩家头像
    seatHolder.textPlayerName = GetComponentWithPath(root, "Info/HeadBg/SomeInfoRoot/TextName", ComponentTypeName.Text)--玩家名字
    seatHolder.textPlayerId = GetComponentWithPath(root, "Info/PlayerId", ComponentTypeName.Text)
    seatHolder.textScore =  GetComponentWithPath(root, "Info/HeadBg/SomeInfoRoot/CurrencyRoot/Point/Text", ComponentTypeName.Text)--货币数量
    seatHolder.GoldCount = GetComponentWithPath(root, "Info/HeadBg/SomeInfoRoot/CurrencyRoot/Gold/Count", ComponentTypeName.Text)--货币数量
    seatHolder.imageDisconnect =  GetComponentWithPath(root, "Info/HeadBg/Avatar/Mask/ImageStateDisconnect", ComponentTypeName.Image)--断线
    seatHolder.imageReady = GetComponentWithPath(root, "State/Group/ImageReady", ComponentTypeName.Image)--已经准备
    seatHolder.imageCreator = GetComponentWithPath(root, "Info/ImageCreator", ComponentTypeName.Image)--房主
    seatHolder.RechargeGoldRoot = GetComponentWithPath(root,"Info/HeadBg/RechargeGoldRoot",ComponentTypeName.Transform).gameObject
    ModuleCache.ComponentUtil.SafeSetActive(seatHolder.RechargeGoldRoot.gameObject,false)
    --说话
    seatHolder.goSpeakIcon =  GetComponentWithPath(root, "State/Group/Speak", ComponentTypeName.Image)
    local locGoClock = GetComponentWithPath(root, "State/Group/Clock", ComponentTypeName.Transform).gameObject
    ModuleCache.ComponentUtil.SafeSetActive(locGoClock,false)
    seatHolder.clockHolder = 
    {
        goClock = locGoClock,
        textClock = GetComponentWithPath(locGoClock, "Text", "TextWrap")
    }

    --表情
    seatHolder.emojiRootTran = GetComponentWithPath(root, "State/Group/ChatFace", ComponentTypeName.Transform)
    
    --亮牌start-----------
    seatHolder.LightPokersSlotTable = {}
    local locLightPokersRooPath = ""
    if(seatIndex == 1) then
        --自己不要管
    elseif (seatIndex == 2) then
        locLightPokersRooPath = "State/LightPokersR"
    elseif (seatIndex == 3) then
        locLightPokersRooPath = "State/LightPokersL"
    elseif (seatIndex == 4) then
        locLightPokersRooPath = "State/LightPokersL"
    end
    if(string.len(locLightPokersRooPath) > 0) then
        seatHolder.LightPokersRoot = GetComponentWithPath(root, locLightPokersRooPath, ComponentTypeName.Transform).gameObject
        ModuleCache.ComponentUtil.SafeSetActive(seatHolder.LightPokersRoot, false)
        local LightPokersPrefab = GetComponentWithPath(root, "State/LightPokersPrefab", ComponentTypeName.Transform).gameObject
        local GridLayoutGroup1 = GetComponentWithPath(root, locLightPokersRooPath .. "/PokerRoot/GridLayoutGroup1", ComponentTypeName.Transform).gameObject
        local GridLayoutGroup2 = GetComponentWithPath(root, locLightPokersRooPath .. "/PokerRoot/GridLayoutGroup2", ComponentTypeName.Transform).gameObject
        for i = 1, TableData.pokerSlotMaxCount do
            ----PokerSlot扑克牌的槽:用于存放扑克牌的一些数据,PokerSlot.PokerGo扑克牌的gameObject,
            ----PokerSlot.FaceImage扑克牌的正面图,PokerSlot.BackImage扑克牌的背面图
            local PokerSlot = {}
            if(i<=8) then--1-8张牌在第一排,9-16张牌在第二排
                PokerSlot.PokerGo = ModuleCache.ComponentUtil.InstantiateLocal(LightPokersPrefab, GridLayoutGroup1)
            else
                PokerSlot.PokerGo = ModuleCache.ComponentUtil.InstantiateLocal(LightPokersPrefab, GridLayoutGroup2)
            end
            PokerSlot.PokerGo.name = "Poker" .. i
            PokerSlot.FaceImage = GetComponentWithPath(PokerSlot.PokerGo,"face", ComponentTypeName.Image)
            PokerSlot.BackImage = GetComponentWithPath(PokerSlot.PokerGo,"back", ComponentTypeName.Image)
            ModuleCache.ComponentUtil.SafeSetActive(PokerSlot.PokerGo, false)
            table.insert(seatHolder.LightPokersSlotTable,PokerSlot)
        end
    end
    --亮牌end--------------


    --牌
    seatHolder.handPokerCardsRoot = handPokerRoot --or (((seatIndex == 5 or seatIndex == 6) and GetComponentWithPath(root, "State/RightHandPokers", ComponentTypeName.Transform).gameObject) or GetComponentWithPath(root, "State/LeftHandPokers", ComponentTypeName.Transform).gameObject)
    if(seatHolder.handPokerCardsRoot == nil) then
        local locPath
        if(seatIndex == 2) then
            locPath = "State/RightHandPokers"
        elseif(seatIndex == 3) then
            locPath = "State/LeftHandPokers"
        elseif(seatIndex == 4) then
            locPath = "State/LeftHandPokers"
        end
        seatHolder.handPokerCardsRoot = GetComponentWithPath(root, locPath, ComponentTypeName.Transform).gameObject

        seatHolder.handPokerRoot = GetComponentWithPath(seatHolder.handPokerCardsRoot, "PokerRoot/GridLayoutGroup", ComponentTypeName.Transform).gameObject
        ModuleCache.ComponentUtil.SafeSetActive(seatHolder.handPokerRoot, false)
        seatHolder.handPokerPrefab = GetComponentWithPath(seatHolder.handPokerCardsRoot, "PokerRoot/GridLayoutGroup/PokerPrefab", ComponentTypeName.Transform).gameObject
        seatHolder.handPokerSlotTable = {}--用于回放
        ModuleCache.ComponentUtil.SafeSetActive(seatHolder.handPokerPrefab, false)
        for i=1,TableData.pokerSlotMaxCount do
            local tPoker = ModuleCache.ComponentUtil.InstantiateLocal(seatHolder.handPokerPrefab, seatHolder.handPokerRoot)
            tPoker.name = "Poker"..tostring(i)
            ModuleCache.ComponentUtil.SafeSetActive(tPoker, true)
            table.insert(seatHolder.handPokerSlotTable,tPoker)
        end

        seatHolder.ThrowPokerGridLayoutGroup = GetComponentWithPath(seatHolder.handPokerCardsRoot, "ThrowPokerRoot/GridLayoutGroup", ComponentTypeName.Transform).gameObject
        seatHolder.otherThrowPokerPrefab = GetComponentWithPath(seatHolder.handPokerCardsRoot, "ThrowPokerRoot/GridLayoutGroup/ThrowPokerPrefab", ComponentTypeName.Transform).gameObject
        seatHolder.otherThrowPokerSlotTable = {}--用于显示出的牌
        self:InstantiateOtherThrowPokerSlot(seatHolder.otherThrowPokerPrefab,seatHolder.ThrowPokerGridLayoutGroup,seatHolder.otherThrowPokerSlotTable)

        local effectPath = "Effect/"
        seatHolder.EffectRoot = GetComponentWithPath(seatHolder.handPokerCardsRoot,"Effect", ComponentTypeName.Transform).gameObject
        seatHolder.EffectType = {}
        seatHolder.EffectType.Effect_Feiji = GetComponentWithPath(seatHolder.handPokerCardsRoot, (effectPath.."Ainm_Paixing_Feiji"), ComponentTypeName.Transform).gameObject
        seatHolder.EffectType.Effect_Liandui = GetComponentWithPath(seatHolder.handPokerCardsRoot, (effectPath.."Ainm_Paixing_Liandui"), ComponentTypeName.Transform).gameObject
        seatHolder.EffectType.Effect_Sandaier = GetComponentWithPath(seatHolder.handPokerCardsRoot, (effectPath.."Ainm_Paixing_Sandaier"), ComponentTypeName.Transform).gameObject
        seatHolder.EffectType.Effect_Sandaiyi = GetComponentWithPath(seatHolder.handPokerCardsRoot, (effectPath.."Ainm_Paixing_Sandaiyi"), ComponentTypeName.Transform).gameObject
        seatHolder.EffectType.Effect_Shunzi = GetComponentWithPath(seatHolder.handPokerCardsRoot, (effectPath.."Ainm_Paixing_Shunzi"), ComponentTypeName.Transform).gameObject
        seatHolder.EffectType.Effect_Zhadan = GetComponentWithPath(seatHolder.handPokerCardsRoot, (effectPath.."Ainm_Paixing_Zhadan"), ComponentTypeName.Transform).gameObject
    end

    seatHolder.inHandCardsOriginalPos = seatHolder.handPokerCardsRoot.transform.position
    seatHolder.inhandCardsArray = {}
    local pokerSlotMaxCount = TableData.pokerSlotMaxCount
    for i=1,pokerSlotMaxCount do
        local pokerCard     
        if(seatIndex == 1) then
            pokerCard = GetComponentWithPath(seatHolder.handPokerCardsRoot, "" .. i .. "/Poker", ComponentTypeName.Transform).gameObject
        else
            pokerCard = GetComponentWithPath(seatHolder.handPokerCardsRoot, "PokerRoot/GridLayoutGroup/Poker" .. i, ComponentTypeName.Transform).gameObject 
        end

        local cardHolder = {}
        cardHolder.cardRoot = pokerCard      
        cardHolder.cardPosition = pokerCard.transform.position  
        cardHolder.cardLocalPosition = pokerCard.transform.localPosition
        cardHolder.cardLocalScale = pokerCard.transform.localScale
        cardHolder.face = GetComponentWithPath(cardHolder.cardRoot, "face", ComponentTypeName.Image)
        cardHolder.back = GetComponentWithPath(cardHolder.cardRoot, "back", ComponentTypeName.Transform)
        cardHolder.GradientColor = GetComponentWithPath(cardHolder.cardRoot, "face", "UiEffect.GradientColor")
        seatHolder.inhandCardsArray[i] = cardHolder
    end

end


------刷新手中的牌:
function TableRunfastHelper:refreshInHandCards(seatHolder, inHandPokerList, showFace, useAnim)
    local cardCount = #inHandPokerList--手中牌的数量
    local pokerSlotCount = #seatHolder.inhandCardsArray--牌槽的数量
    for i=1,pokerSlotCount do
        local cardHolder = seatHolder.inhandCardsArray[i]--牌槽
        if(i <= cardCount) then
            self:setCardInfo(cardHolder, inHandPokerList[i])--将数据放到牌槽中
            ModuleCache.ComponentUtil.SafeSetActive(cardHolder.cardRoot.transform.parent.transform.gameObject,true)
            if(useAnim)then
               self:playCardTurnAnim(cardHolder, showFace, 0.1, (i - 1) * 0.1, function() end)
            else
                if(showFace)then
                    self:showCardFace(cardHolder)          
                else
                    self:showCardBack(cardHolder)        
                end
            end
        else
            ModuleCache.ComponentUtil.SafeSetActive(cardHolder.cardRoot.transform.parent.transform.gameObject,false)
            cardHolder.isThrowed = true
            cardHolder.isHide = true
        end
    end

end

--刷新别人手上的牌
function TableRunfastHelper:refreshInHandCardsForOthers(seatInfo)
    local localSeatIndex = seatInfo.localSeatIndex
    local seatHolder = self.TableRunfastView.seatHolderArray[localSeatIndex]
    local pokerSlotCount = #seatHolder.inhandCardsArray
    for i=1,pokerSlotCount do   
        local cardHolder = seatHolder.inhandCardsArray[i]
        if(i <= #seatInfo.inHandPokerList) then
            local locPoker = seatInfo.inHandPokerList[i]
            if(locPoker ~= nil and cardHolder~=nil) then
                cardHolder.poker = cardHolder  
                cardHolder.face.sprite = self:GetPokerSprite(locPoker.PokerNum)
            end
            ModuleCache.ComponentUtil.SafeSetActive(cardHolder.cardRoot.transform.gameObject,true) 
        else
            ModuleCache.ComponentUtil.SafeSetActive(cardHolder.cardRoot.transform.gameObject,false)   
        end
    end
end

function TableRunfastHelper:playCardTurnAnim(cardHolder, toFace, duration, delayTime, onFinish)
    local sequence = self.module:create_sequence()
    local originalRotate = ModuleCache.CustomerUtil.ConvertVector3(0, 0, 0)
    local targetRotate = ModuleCache.CustomerUtil.ConvertVector3(0, 90, 0)
    if(toFace)then
        self:showCardBack(cardHolder)
    else
        self:showCardFace(cardHolder)
    end
    
    sequence:Append(cardHolder.cardRoot.transform:DOLocalRotate(targetRotate, duration * 0.5, DG.Tweening.RotateMode.Fast):SetDelay(delayTime):OnComplete(function()
        if(toFace)then
            self:showCardFace(cardHolder)
        else
            self:showCardBack(cardHolder)
        end 
    end))
    sequence:Append(cardHolder.cardRoot.transform:DOLocalRotate(originalRotate, duration * 0.5, DG.Tweening.RotateMode.Fast))
    sequence:OnComplete(function()
        if(onFinish)then
            onFinish()
        end        
    end)
end

------播放纸牌转的动画
function TableRunfastHelper:playCardTurnAnim(cardHolder, toFace, duration, delayTime, onFinish)
    local sequence = self.module:create_sequence()
    local originalRotate = ModuleCache.CustomerUtil.ConvertVector3(0, 0, 0)
    local targetRotate = ModuleCache.CustomerUtil.ConvertVector3(0, 90, 0)
    if(toFace)then
        self:showCardBack(cardHolder)
    else
        self:showCardFace(cardHolder)
    end
    
    sequence:Append(cardHolder.cardRoot.transform:DOLocalRotate(targetRotate, duration * 0.5, DG.Tweening.RotateMode.Fast):SetDelay(delayTime):OnComplete(function()
        if(toFace)then
            self:showCardFace(cardHolder)
        else
            self:showCardBack(cardHolder)
        end 
    end))
    sequence:Append(cardHolder.cardRoot.transform:DOLocalRotate(originalRotate, duration * 0.5, DG.Tweening.RotateMode.Fast))
    sequence:OnComplete(function()
        if(onFinish)then
            onFinish()
        end        
    end)
end

------播放纸牌飞的动画:cardHolder纸牌,targetPos目标位置,duration飞的时间,delayTime延迟时间,onFinish结束后的回调
function TableRunfastHelper:playCardFlyToPosAnim(cardHolder, targetPos, duration, delayTime, onFinish)
    local sequence = self.module:create_sequence()
    sequence:Append(cardHolder.cardRoot.transform:DOMove(targetPos, duration, false):SetDelay(delayTime))    
    sequence:OnComplete(function()
        if(onFinish)then
            onFinish()
        end        
    end)
end

------播放纸牌缩放的动画
function TableRunfastHelper:playCardScaleAnim(cardHolder, targetScale, duration, delayTime, onFinish)
    local sequence = self.module:create_sequence()
    sequence:Append(cardHolder.cardRoot.transform:DOScaleX(targetScale, duration):SetDelay(delayTime))    
    sequence:Join(cardHolder.cardRoot.transform:DOScaleY(targetScale, duration))    
    sequence:OnComplete(function()
        if(onFinish)then
            onFinish()
        end        
    end)
end


function TableRunfastHelper:playCardScaleAnim(cardHolder, targetScale, duration, delayTime, onFinish)
    local sequence = self.module:create_sequence()
    sequence:Append(cardHolder.cardRoot.transform:DOScaleX(targetScale, duration):SetDelay(delayTime))    
    sequence:Join(cardHolder.cardRoot.transform:DOScaleY(targetScale, duration))    
    sequence:OnComplete(function()
        if(onFinish)then
            onFinish()
        end        
    end)
end


function TableRunfastHelper:setInHandPokersOriginalPos(seatHolder)
    seatHolder.handPokerCardsRoot.transform.position = seatHolder.inHandCardsOriginalPos
end

--刷新座位相关信息
function TableRunfastHelper:refreshSeatInfo(seatHolder, seatInfo)
    if(seatInfo.playerId and (seatInfo.playerId ~= 0 and seatInfo.playerId ~= "0")) then
        ModuleCache.ComponentUtil.SafeSetActive(seatHolder.goSeatInfo, true)     
        ModuleCache.ComponentUtil.SafeSetActive(seatHolder.seatRoot, true)
        ModuleCache.ComponentUtil.SafeSetActive(seatHolder.NotSeatRoot.gameObject, false)
        ModuleCache.ComponentUtil.SafeSetActive(seatHolder.imageCreator.gameObject, seatInfo.isCreator)
        -- print("seatInfo", seatInfo.playerId, seatInfo.isOffline)
        self:refreshSeatOfflineState(seatHolder, seatInfo)
        seatHolder.textScore.text = seatInfo.score
        seatHolder.GoldCount.text = Util.filterPlayerGoldNum(seatInfo.coinBalance)
        if (seatInfo.playerInfo and seatInfo.playerInfo.userId) then
            self:setPlayerInfo(seatHolder, seatInfo.playerInfo)
        else
            self:get_userinfo(seatInfo.playerId, function(err, data)
                --{"data":{"breakRate":"0%","cards":99999979,"coins":50,"gender":1,"hasBind":false,
                --"headImg":"http://www.th7.cn/d/file/p/2016/09/12/f7ef1bbfe2db9d1913e8e8c22ffc7619.jpg",
                --"lostCount":0,"nickname":"TestUser111","score":0,"tieCount":0,"winCount":0},"ret":0}

                if(err)then
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
                playerInfo.ip = data.ip
                self:UpdateUserInfo(seatInfo.playerId,playerInfo)
                self:setPlayerInfo(seatHolder, playerInfo)
            end);
        end
        
    else      
        ModuleCache.ComponentUtil.SafeSetActive(seatHolder.goSeatInfo, false)
        --ModuleCache.ComponentUtil.SafeSetActive(seatHolder.seatRoot, false)        
        ModuleCache.ComponentUtil.SafeSetActive(seatHolder.NotSeatRoot.gameObject, true)
        ModuleCache.ComponentUtil.SafeSetActive(seatHolder.KickBtn.gameObject, false)                     
    end
end

function TableRunfastHelper:UpdateUserInfo(playerId,newplayerInfo)
    playerId = tonumber(playerId)
    local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
    for i = 1, #seatInfoList do
        local seatInfo = seatInfoList[i]
        if(seatInfo) then
            if(tonumber(seatInfo.playerId) == playerId) then
                --print("====此玩家替换新的信息",playerId)
                seatInfo.playerInfo = newplayerInfo
            end
        end
    end
end

function TableRunfastHelper:refreshSeatOfflineState(seatHolder, seatData)
    ModuleCache.ComponentUtil.SafeSetActive(seatHolder.imageDisconnect.gameObject, seatData.isOffline) 
   -- self.modelData.roleData.RoomType == 0 --0 非麻将馆房间 1 麻将馆普通开房 2 麻将馆随机组局 3 比赛场房间  
    if self.modelData.roleData.RoomType == 2 and self.modelData.curTableData.roomInfo.curRoundNum == 0 then--TODO XLQ 快速组局 离线玩家显示踢人按钮---
        ModuleCache.ComponentUtil.SafeSetActive(seatHolder.KickBtn.gameObject, seatData.isOffline)  
    end
end

--刷新座位的状态
function TableRunfastHelper:refreshSeatState(seatHolder, seatData)
    if(seatData.playerId and (seatData.playerId ~= 0 and seatData.playerId ~= "0")) then        
        if(self.modelData.curTableData.roomInfo.roundStarted) then
            ModuleCache.ComponentUtil.SafeSetActive(seatHolder.imageReady.gameObject, false)
        else
            ModuleCache.ComponentUtil.SafeSetActive(seatHolder.imageReady.gameObject, seatData.isReady and (not seatData.curRound))
        end
    else
        ModuleCache.ComponentUtil.SafeSetActive(seatHolder.imageReady.gameObject, false)
    end
end


------填写玩家信息
function TableRunfastHelper:setPlayerInfo(seatHolder, playerData)
    if(playerData.playerId ~= 0)then
        if(playerData.hasDownHead)then
           return
        end
        --seatHolder.textPlayerId.text = ""--"ID:"..tostring(playerData.playerId)
        if(self.TableRunfastView.IsFriendsCirclePreventCheating) then
            local IsMySelf = false
            if(self.MySeatInfoPlayerId == nil or self.MySeatInfoPlayerId == 0) then
                self.MySeatInfoPlayerId = self.TableRunfastView:GetMySeatInfoPlayerId()
            end
            IsMySelf = (tonumber(playerData.playerId) == self.MySeatInfoPlayerId)
            if(IsMySelf) then
                seatHolder.textPlayerName.text = Util.filterPlayerName(playerData.playerName,8)
                self.module:image_load_sprite(seatHolder.imagePlayerHead, playerData.headUrl,function(headsprite)
                    playerData.spriteHeadImage = headsprite
                end)
            else
                local fakeName = "****"
                if(playerData.playerName == fakeName) then
                else
                    playerData.RealName = playerData.playerName
                end
                playerData.playerName = fakeName
                seatHolder.textPlayerName.text = fakeName
                local headsprite = self.TableRunfastView:GetSpecificHeadSprite()
                playerData.spriteHeadImage = headsprite
                seatHolder.imagePlayerHead.sprite = headsprite
            end
        else
            seatHolder.textPlayerName.text = Util.filterPlayerName(playerData.playerName,8)
            self.module:image_load_sprite(seatHolder.imagePlayerHead, playerData.headUrl,function(headsprite)
                playerData.spriteHeadImage = headsprite
            end)
        end
    else
        seatHolder.textPlayerName.text = Util.filterPlayerName("正在获取..")
        return
    end
end


-------获取扑克图,两个参数输入一个即可,另外一个参数为nil
function TableRunfastHelper:GetPokerSprite(_PokerNum,_Poker)
    if(_PokerNum ~= nil) then
        local PokerTable = self:NumberToPokerTable(_PokerNum)
        return self.TableRunfastView.cardAssetHolder:FindSpriteByName(PokerTable.SpriteName)
    end

    if(_Poker ~= nil) then
        return self.TableRunfastView.cardAssetHolder:FindSpriteByName(_Poker.SpriteName)
    end
end

--设置牌的数据
function TableRunfastHelper:setCardInfo(cardHolder, poker)    
    cardHolder.poker = poker    
    cardHolder.face.sprite = self:GetPokerSprite(nil,poker)
end

--显示或隐藏牌
function TableRunfastHelper:showCard(cardHolder, show)
    ModuleCache.ComponentUtil.SafeSetActive(cardHolder.cardRoot, show)
end

--显示牌正面
function TableRunfastHelper:showCardFace(cardHolder)
    ModuleCache.ComponentUtil.SafeSetActive(cardHolder.face.gameObject, true)
    ModuleCache.ComponentUtil.SafeSetActive(cardHolder.back.gameObject, false)
end

--显示牌背面
function TableRunfastHelper:showCardBack(cardHolder)
    ModuleCache.ComponentUtil.SafeSetActive(cardHolder.face.gameObject, false)
    ModuleCache.ComponentUtil.SafeSetActive(cardHolder.back.gameObject, true)
end

function TableRunfastHelper:enableGradientColor(cardHolder,show)
    if(cardHolder) then
        cardHolder.GradientColor.enabled = show
    end
end


function TableRunfastHelper:NumberToPokerTable(pokerNum)
    --新定义的poker类:
    --poker.PokerNum是服务器发来的扑克数字代号
    --poker.PokerSpriteName扑克的正面显示的图片名称
    local poker = {}
    local colorStr
    local temp = CardCommon.ResolveCardIdx(pokerNum)
    if(temp.color == 1) then
        colorStr = "heitao"
    elseif (temp.color == 2) then
        colorStr = "hongtao"
    elseif (temp.color == 3) then
        colorStr = "meihua"
    elseif (temp.color == 4) then
        colorStr = "fangkuai"
    end
    poker.colorStr = colorStr
    poker.colorNum = temp.color
    poker.nameNum = temp.name
    poker.SpriteName = colorStr .. "_" .. temp.name
    poker.PokerNum = pokerNum
    return poker
end

function TableRunfastHelper:GetPokerColorName(pokerNum)
    --新定义的poker类:
    --poker.PokerNum是服务器发来的扑克数字代号
    --poker.PokerSpriteName扑克的正面显示的图片名称
    local poker = {}
    local TypeColor
    local TypeName
    local temp = CardCommon.ResolveCardIdx(pokerNum)
    if(temp.color == 1) then
        TypeColor = "黑桃"
    elseif (temp.color == 2) then
        TypeColor = "红桃"
    elseif (temp.color == 3) then
        TypeColor = "梅花"
    elseif (temp.color == 4) then
        TypeColor = "方块"
    end
    if(temp.name == 1) then
        TypeName = "A"
    elseif (temp.name == 11) then
        TypeName = "J"
    elseif (temp.name == 12) then
        TypeName = "Q"
    elseif (temp.name == 12) then
        TypeName = "K"
    else
        TypeName = "" .. temp.name
    end

    return (TypeColor .. TypeName)
end


------通过服务器的位置索引获得客户端显示的座位
function TableRunfastHelper:getSeatInfoByRemoteSeatIndex(remoteSeatIndex, seatInfoList)	
	for i=1,#seatInfoList do
		if(seatInfoList[i].seatIndex == remoteSeatIndex) then
			return seatInfoList[i]
		end
	end
	return nil
end

------将服务器的做座位索引转换为本地位置索引:seatIndex座位的下标(非本地下标),我的座位下标(非本地下标),seatCount座位的数量
function TableRunfastHelper:getLocalIndexFromRemoteSeatIndex(seatIndex, mySeatIndex, seatCount)
    --print("=====seatIndex="..tostring(seatIndex).."   mySeatIndex="..tostring(mySeatIndex).."   seatCount="..tostring(seatCount))
	local localIndex = seatIndex + (1 - mySeatIndex) + seatCount
	if(localIndex > seatCount) then
		return localIndex - seatCount
	else
		return localIndex
	end
end

------判断是否所有入座的玩家都已准备
function TableRunfastHelper:checkIsAllReady(seatInfoList)
    --人数不足
    local playerCount = self.modelData.curTableData.roomInfo.maxPlayerCount
    if(#seatInfoList ~= playerCount)  then
        -- print("====人数不足 playerCountMax="..playerCount)
        return false
    end

    --人数足,是否都准备了
    for i=1,#seatInfoList do
        if(seatInfoList[i].isReady == false) then
            return false
        end
    end
    return true
    --[[
    local isAllReady = true
	for i=1,#seatInfoList do        
		if(seatInfoList[i].isSeated) then            
            isAllReady = isAllReady and seatInfoList[i].isReady
		end
	end	    
	return isAllReady
    ]]
end




------通过玩家id获取座位信息
function TableRunfastHelper:getSeatInfoByPlayerId(playerId, seatInfoList)	
    local tmpPlyaerId = playerId
    if(type(playerId) == 'number')then
        tmpPlyaerId = tostring(playerId)
    end
	for i=1,#seatInfoList do
		if(seatInfoList[i].playerId == tmpPlyaerId) then
			return seatInfoList[i]
		end
	end
	return nil
end

------获取玩家的数量
function TableRunfastHelper:getSeatedSeatCount(seatInfoList)
	local count = 0    
	for i=1,#seatInfoList do
		if(seatInfoList[i].playerId ~= "0")then
			count = count + 1
		end
	end
	return count
end


function TableRunfastHelper:get_userinfo(playerId, callback)
    --print("请求此用户的数据================================",playerId)
    playerId = tonumber(playerId)
    self.GettingTable = self.GettingTable or {}
    if(self:IsNumTableContains(self.GettingTable,playerId)) then
        --print("====正在请求此玩家的数据,不需要再次请求:玩家Id=",playerId)
        return
    else
        table.insert(self.GettingTable,playerId)
        self.module:subscibe_time_event(0.1, false, 0):OnComplete(function(t)
            self.GettingTable = {}
        end)
    end


    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "user/info?",
        params = {
            uid = playerId,
        },
        cacheDataKey = "user/info?uid=" .. playerId,
        cacheDataImmediatelyCallback = true,
    }

    self.module:http_get(requestData, function(wwwOperation)
        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then    --OK
            callback(nil, retData.data)
        else
            callback(retData.ret, nil)
        end
    end, function(error)
        print(error.error)
        callback(error.error, nil);
    end, function(cacheDataText)
        local retData = ModuleCache.Json.decode(cacheDataText)
        if retData.ret and retData.ret == 0 then    --OK
            callback(nil, retData.data)
        else
            callback(retData.ret, nil)
        end
    end)
end


function TableRunfastHelper:InstantiateHandPokerSlot(prefab,parentRoot,SlotTable)
    ModuleCache.ComponentUtil.SafeSetActive(prefab, false)
    for i=1,TableData.pokerSlotMaxCount do
        local tPoker = ModuleCache.ComponentUtil.InstantiateLocal(prefab, parentRoot)
        tPoker.name = "Poker"..tostring(i)
        ModuleCache.ComponentUtil.SafeSetActive(tPoker, true)
        table.insert(SlotTable,tPoker)
    end
end

function TableRunfastHelper:InstantiateOtherThrowPokerSlot(prefab,parentRoot,SlotTable)
    ModuleCache.ComponentUtil.SafeSetActive(prefab, false)
    for i=1,TableData.pokerSlotMaxCount do
        local tPoker = ModuleCache.ComponentUtil.InstantiateLocal(prefab, parentRoot)
        tPoker.name = "ThrowPoker"..tostring(i)
        ModuleCache.ComponentUtil.SafeSetActive(tPoker, false)
        table.insert(SlotTable,tPoker)
    end
end

------缩放动画:TargetRoot目标节点,FromScale原始的比例,ToScale目标比例,Duration缩放时间,WaitTimeAutoHide等待多久后自动隐藏
function TableRunfastHelper:PlayScaleAnim(TargetRoot,FromScale,ToScale,Duration,WaitTimeAutoHide)
    --显示目标
    ModuleCache.ComponentUtil.SafeSetActive(TargetRoot.transform.gameObject,true)
    --显示原始比例
    local OldScale = TargetRoot.transform.localScale
    OldScale.x = FromScale
    OldScale.y = FromScale
    TargetRoot.transform.localScale = OldScale
    --显示缩放比例
    local sequence = self.module:create_sequence()
    sequence:Append(TargetRoot.transform:DOScaleX(ToScale, Duration))   
    sequence:Join(TargetRoot.transform:DOScaleY(ToScale, Duration))  

    --之后自动隐藏
    if(WaitTimeAutoHide ~= nil and WaitTimeAutoHide > 0) then
        self.module:subscibe_time_event(WaitTimeAutoHide, false, 0):OnComplete(function(t)
            ModuleCache.ComponentUtil.SafeSetActive(TargetRoot.transform.gameObject,false)
        end)
    end
end

------Y轴移动动画:TargetRoot目标节点,FromY原始的Y,ToY目标Y,Duration缩放时间,WaitTimeAutoHide等待多久后自动隐藏
function TableRunfastHelper:PlayMoveYAnim(TargetRoot,FromY,ToY,Duration,WaitTimeAutoHide)
    if(FromY ~= nil) then
        local OldPos = TargetRoot.transform.localPosition
        OldPos.y = FromY
        TargetRoot.transform.localPosition = OldPos
    end
    
    ModuleCache.ComponentUtil.SafeSetActive(TargetRoot.transform.gameObject,true)
    local sequence = self.module:create_sequence()
    sequence:Append(TargetRoot.transform:DOLocalMoveY(ToY, Duration, true))

    if(WaitTimeAutoHide ~= nil and WaitTimeAutoHide > 0) then
        self.module:subscibe_time_event(WaitTimeAutoHide, false, 0):OnComplete(function(t)
            ModuleCache.ComponentUtil.SafeSetActive(TargetRoot.transform.gameObject,false)
        end)
    end
end


------数组里面是否包含了某个值
function TableRunfastHelper:IsNumTableContains(_NumTable,_Num)
    if(_NumTable == nil or #_NumTable <= 0 or _Num == nil) then
        return false
    end

    for i=1,#_NumTable do
        if(_NumTable[i] == _Num) then
            return true
        end
    end
    return false
end

------数组里面是否包含了某个值的次数
function TableRunfastHelper:NumTableContainsCount(_NumTable,_Num)
    if(_NumTable == nil or #_NumTable <= 0 or _Num == nil) then
        return 0
    end

    local count = 0
    for i=1,#_NumTable do
        if(_NumTable[i] == _Num) then
            count = count + 1
        end
    end
    return count
end

--飞到目标位置 len 金币数量 cloneObj 克隆物体 parentObj 克隆父物体 fromPos 起始位置 targetPos 结束位置 duration 持续时间 delayTime 延迟时间 autoDestory 自动销毁 onFinish 回调
function TableRunfastHelper:FlyToTarget(len, cloneObj, parentObj, fromPos, targetPos, duration, delayTime, autoDestory, onFinish)
    duration = duration or 0.5
    delayTime = delayTime or 0

    local tmpDelayTime = math.min(0.1, 1 / len)
    self:setTargetFrame(true)
    for i=1,len do
        local tmpOnFinish = nil
        if(i == len)then
            tmpOnFinish = onFinish
        end
        local gold = ModuleCache.ComponentUtil.InstantiateLocal(cloneObj, parentObj)
        gold.transform.position = fromPos
        ModuleCache.ComponentUtil.SafeSetActive(gold, false)
        self:fly_random_path(gold.transform, fromPos, targetPos, duration, delayTime + (i - 1) * tmpDelayTime, function ()
            if(autoDestory)then
                UnityEngine.GameObject.Destroy(gold)
            end
            if(tmpOnFinish)then
                self:setTargetFrame(false)
                tmpOnFinish()
            end
        end)
    end
end

--随机路径飞
function TableRunfastHelper:fly_random_path(trans, fromPos, targetPos, duration, delayTime, onFinish)
    local randomSplitNum = math.random(3) --节点数
    duration = duration / randomSplitNum
    local moveVector = (targetPos - fromPos)/randomSplitNum
    local sequence = self.module:create_sequence()
    local downOrUp = math.random(-1,1)
    for i = 1, randomSplitNum do
        local addRandomVal = math.random()*downOrUp*0.15 --幅度
        if(i==randomSplitNum) then
            addRandomVal = 0
        end
        local targetPos = fromPos + moveVector*i + Vector3.New(addRandomVal, -addRandomVal, 0)
        if(i~=1) then
            delayTime = 0
        end
        ModuleCache.ComponentUtil.SafeSetActive(trans.gameObject, true)
        sequence:Append(trans:DOMove(targetPos, duration, false):SetDelay(delayTime))
    end
    sequence:OnComplete(function()
        if(onFinish)then
            onFinish()
        end
    end)
end

function TableRunfastHelper:setTargetFrame(anim)
    --UnityEngine.Application.targetFrameRate = (anim and 60) or ModuleCache.AppData.tableTargetFrameRate
end

--IsFiltNilValue是否过nil值
function TableRunfastHelper:NumTableInsertToNewTable(NewTable,NumTable,IsFiltNilValue)
    if(NumTable == nil or #NumTable <=0 ) then
        print("====error NumTable == nil or #NumTable <=0 ")
    end
    for i=1,#NumTable do
		local locNum = NumTable[i]
        table.insert(NewTable,locNum)
        -- if(locNum == nil and IsFiltNilValue) then
        --     --过滤nil值
        -- else
        --     table.insert(NewTable,locNum)
        -- end
	end
end

function TableRunfastHelper:NumTableDeleteNum(NumTable,Num)
    if(NumTable == nil or #NumTable <=0 ) then
        print("====error NumTable == nil or #NumTable <=0 ")
    end

    local NewTable = {}
    for i = 1, #NumTable do
        local locNum = NumTable[i]
        if(locNum == Num) then
            --print("===")
        else
            table.insert(NewTable,locNum)
        end
    end

    if(#NewTable > 0) then
        return NewTable
    else
        return NumTable
    end
end

function TableRunfastHelper:IsNilOrEmpty(str)
    --print("==判断是否一个空的字符串")
    if(str == nil or str == "") then
        return true
    end
    return false
end

function TableRunfastHelper:ListIsHaveData(List)
    --print("==判断一个列表里面是否有数据")
    if(List and #List > 0) then
        return true
    end
    return false
end

function TableRunfastHelper:PrintPokerNumList(PokerNumList,LogStr)
    local res = LogStr or ""
    if(PokerNumList and #PokerNumList > 0) then
        for i = 1, #PokerNumList do
            local Num = PokerNumList[i]
            if(Num == nil) then
                print("error Num == nil")
            else
                local ColorName = self:GetPokerColorName(Num)
                res = res .. ColorName .. ","
            end
        end
        print(res)
    end
end

function TableRunfastHelper:CheckRule(RuleTable)
    print("====这里检查游戏规则")
    if(RuleTable) then
        self:CheckRule2(RuleTable.gameName,"gameName","游戏名")
        self:CheckRule2(RuleTable.roundCount,"roundCount","局数")
        self:CheckRule2(RuleTable.playerCount,"playerCount","人数")
        self:CheckRule2(RuleTable.black3_on_firstloop,"black3_on_firstloop","首局先出黑桃3")
        self:CheckRule2(RuleTable.pay_all,"pay_all","放走包赔")
        self:CheckRule2(RuleTable.notify_card_cnt,"notify_card_cnt","显示牌数")
        self:CheckRule2(RuleTable.init_card_cnt,"init_card_cnt","16 or 15 or 13张牌玩法")
        self:CheckRule2(RuleTable.rate,"rate","倍数")
        self:CheckRule2(RuleTable.allow_pass,"allow_pass","允许过牌")
        self:CheckRule2(RuleTable.payType,"payType","支付方式")
        self:CheckRule2(RuleTable.allow_unruled_multitriple,"allow_unruled_multitriple","最后一手飞机可以乱带")
        self:CheckRule2(RuleTable.tripleA_is_bomb,"tripleA_is_bomb","三个A是炸弹")
        self:CheckRule2(RuleTable.no_triple_p1,"no_triple_p1","最后一手三带一")
        self:CheckRule2(RuleTable.every_round_black3_first,"every_round_black3_first","每局都是黑桃3玩家先出")
        self:CheckRule2(RuleTable.first_must_black3,"first_must_black3","先出必须带黑桃3")
        self:CheckRule2(RuleTable.allow_4plus3,"allow_4plus3","可以4带3")
        self:CheckRule2(RuleTable.red10_double,"red10_double","红桃10翻倍")
        self:CheckRule2(RuleTable.tailed_tripple,"tailed_tripple","最后3张甩尾")
    end
end

function TableRunfastHelper:CheckRule2(attribute,attributeName,des)
    if(attribute == nil) then
        print(string.format("error========游戏规则里面缺少字段:%s",attributeName),string.format("字段含义:%s",des))
    else
        --print(string.format("====游戏规则里面字段:%s的值=",tostring(attributeName)),attribute)
    end
end


return TableRunfastHelper