local BranchPackageName = AppData.BranchRunfastName
local class = require("lib.middleclass")
---@class TableRunfastLogic
local TableRunfastLogic = class('TableRunfastLogic')
local TableData = require("package/runfast/module/tablerunfast/tablerunfast_data")
local TableSound = require(TableData.Path_tablerunfast_sound)
local CardSet = require(TableData.Path_gamelogic_set)
local CardCommon = require(TableData.Path_gamelogic_common)
local CardPattern = require(TableData.Path_gamelogic_pattern)
---@type CardLogic CardLogic
local CardLogic = require(TableData.Path_card_logic)
local cjson = require("cjson")
local ModuleCache = ModuleCache
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath

local CSmartTimer = ModuleCache.SmartTimer.instance
local GameSDKInterface = ModuleCache.GameSDKInterface
local log = require("util.log")

local table = table

local RoomState = {}
RoomState.waitReady = 0            --等待玩家准备状态
RoomState.waitSetBanker = 1        --等待定庄状态
RoomState.waitBet = 2            --等待下注状态
RoomState.waitResult = 3        --等待结算状态

function TableRunfastLogic:initialize(module)
    self.TableRunfastModule = module
    self.modelData = module.modelData
    self.TableRunfastView = self.TableRunfastModule.TableRunfastView
    self.TableRunfastModel = self.TableRunfastModule.TableRunfastModel
    self.TableRunfastHelper = self.TableRunfastModule.TableRunfastHelper

    self.timerMap = {}
    self:resetSeatHolderArray(TableData.seatMaxCount)
    self.RoomState = RoomState
    self.IsUserChenZhuoTiShi = true
    self.IsUserChenZhuoDragTiShi = false
end

function TableRunfastLogic:on_show()
end

function TableRunfastLogic:on_hide()
    --self:ClearTable(true,true,true,true,true)
end

------每贞更新
function TableRunfastLogic:update()
    if (not self.modelData.curTableData or (not self.modelData.curTableData.roomInfo)) then
        return
    end

    if ((not self.lastEverySecond) or (self.lastEverySecond + 1 < Time.realtimeSinceStartup)) then
        self.lastEverySecond = Time.realtimeSinceStartup
        self:UpdateEverySecond()
    end
end

------每秒更新
function TableRunfastLogic:UpdateEverySecond()
    --print("==每秒更新=")
end

function TableRunfastLogic:on_destroy()
    self.showResultViewSmartTimer = nil
    for k, v in pairs(self.timerMap) do
        SmartTimer.Kill(v.id)
    end
end

------开始回包
function TableRunfastLogic:on_table_start_rsp(data)
    self.TableRunfastView:showStartBtn(false)
end


------牌桌中有玩家进入房间的通知
function TableRunfastLogic:on_table_enter_notify(data)
    local posInfo = data.pos_info
    local seatInfo = self.TableRunfastHelper:getSeatInfoByRemoteSeatIndex(posInfo.pos_index, self.modelData.curTableData.roomInfo.seatInfoList)
    seatInfo.playerId = tostring(posInfo.player_id)
    seatInfo.isSeated = self:getBoolState(posInfo.player_id)--判断座位上是否有玩家
    seatInfo.isReady = self:getBoolState(posInfo.is_ready)--是否已准备
    if (self:getBoolState(posInfo.player_id)) then
        --判断是否玩家自己，单独记录自己的座位
        if (seatInfo.playerId == self.modelData.curTablePlayerId) then
            self.modelData.curTableData.roomInfo.mySeatInfo = seatInfo
            seatInfo.isOffline = false
        end
    end

    self.TableRunfastView:refreshSeat(seatInfo, seatInfo == self.modelData.curTableData.roomInfo.mySeatInfo)
    self.TableRunfastModule:refresh_share_clip_board()
end

------同步消息包:每个玩家的信息
function TableRunfastLogic:on_table_synchronize_notify(data)

end



------重置座位  seatCount
function TableRunfastLogic:resetSeatHolderArray(RealPlayerCount)
    local newSeatHolderArray = {}
    local seatHolderArray = self.TableRunfastView.srcSeatHolderArray
    local maxPlayerCount = RealPlayerCount
    if (maxPlayerCount == 4) then
        newSeatHolderArray[1] = seatHolderArray[1]
        newSeatHolderArray[2] = seatHolderArray[2]
        newSeatHolderArray[3] = seatHolderArray[4]
        newSeatHolderArray[4] = seatHolderArray[3]
    else
        newSeatHolderArray = seatHolderArray
    end

    for i, v in ipairs(seatHolderArray) do
        ModuleCache.ComponentUtil.SafeSetActive(v.seatRoot, false)
    end

    for i, v in ipairs(newSeatHolderArray) do
        ModuleCache.ComponentUtil.SafeSetActive(v.seatRoot, true)
    end

    self.TableRunfastView.seatHolderArray = newSeatHolderArray

    local ruleTable = nil
    if (TableManager.RunfastRuleJsonString ~= nil and TableManager.RunfastRuleJsonString ~= "") then
        ruleTable = ModuleCache.Json.decode(TableManager.RunfastRuleJsonString)
    end
    if (ruleTable ~= nil and ruleTable.playerCount < 4) then
        local seatHolder = self.TableRunfastView.seatHolderArray[4]
        if (seatHolder) then
            ModuleCache.ComponentUtil.SafeSetActive(seatHolder.seatRoot, false)
        end
    end
end

------获取布尔值
function TableRunfastLogic:getBoolState(value)
    if (value) then
        return value ~= 0 and value ~= "0"
    end
    return false
end

------刷新TableRunfastView的状态
function TableRunfastLogic:refreshMyTableViewState()
    local roomInfo = self.modelData.curTableData.roomInfo
    local mySeatInfo = roomInfo.mySeatInfo

    if (self.TableRunfastView:isJinBiChang()) then
        if (mySeatInfo.isReady) then
            self.TableRunfastView:SetJinBiChangStateSwitcher(false)
        else
            self.TableRunfastView:SetJinBiChangStateSwitcher("Center")
        end
        return
    end

    --是否要显示准备按钮
    self.TableRunfastView:EnterTableShowBtn(roomInfo.curRoundNum <= 0, mySeatInfo.isCreator)
    self:AutoReady()


    --是否要显示开始按钮
    local isAllPlayerReady = self.TableRunfastHelper:checkIsAllReady(roomInfo.seatInfoList)
    local isShowStartBtn = (not roomInfo.roundStarted) and isAllPlayerReady and mySeatInfo.isCreator
    self.TableRunfastView:showStartBtn(isShowStartBtn)
end

------刷新重置状态
function TableRunfastLogic:refreshResetState()
    local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
    for i = 1, #seatInfoList do
        local seatInfo = seatInfoList[i]
        self.TableRunfastView:refreshSeat(seatInfo, false)
    end

    self:refreshMyTableViewState()
    self.TableRunfastView:showContinueBtn(false)
end


------点击准备的回包
function TableRunfastLogic:on_table_ready_rsp(data)
    print("====on_table_ready_rsp")
    if (data.err_no == "0") then
        local roomInfo = self.modelData.curTableData.roomInfo
        local mySeatInfo = roomInfo.mySeatInfo
        mySeatInfo.isReady = true
        self:RefreshReadyBtn()
        if(roomInfo.IsNeedShowReplaceTable
        or self.TableRunfastView:isJinBiChang() and roomInfo.gamePhaseState == 3) then
            --self.TableRunfastView.JinBiChangStateSwitcher:SwitchState("ReplaceTableWait")
            self.TableRunfastView:SetState_DoingMatchingRoot(true)
            roomInfo.IsNeedShowReplaceTable = false
        else
            self.TableRunfastView:SetJinBiChangStateSwitcher(false)
        end
    end
    self:ClearTable(true,true,true,true)
end

------准备的广播通知
function TableRunfastLogic:on_table_ready_notify(data)
    print("====on_table_ready_notify")
    local posInfo = data.pos_info

    local player_id = posInfo.player_id
    local seatInfo = self.TableRunfastHelper:getSeatInfoByPlayerId(player_id, self.modelData.curTableData.roomInfo.seatInfoList)
    if (seatInfo == nil) then
        return
    end
    seatInfo.isReady = (posInfo.is_ready == 1)
    self:RefreshReadyBtn()
    self:ClearTable(nil,true,true,true)
end

------点击开始
function TableRunfastLogic:onclick_start_btn(obj)
    if (self.TableRunfastHelper:getSeatedSeatCount(self.modelData.curTableData.roomInfo.seatInfoList) <= 1) then
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("至少需要两位玩家")
        return
    end
    self.TableRunfastModel:request_start()
end

function TableRunfastLogic:onclick_ready_btn(obj)
    self.TableRunfastModel:request_ready()
end

------播放发牌动画
function TableRunfastLogic:playFaPaiAnim(seatInfo, onFinish)
    local seatHolder = self.TableRunfastView.seatHolderArray[seatInfo.localSeatIndex]
    local delay = 0.2
    local duration = 0.1
    local finishCount = 0
    local cardHolderList = seatHolder.inhandCardsArray
    local count = #cardHolderList
    if (seatInfo == self.modelData.curTableData.roomInfo.mySeatInfo) then

        for i = 1, #cardHolderList do
            local cardHolder = cardHolderList[i]

            ModuleCache.TransformUtil.SetX(cardHolder.cardRoot.transform, seatHolder.goTmpPokerHeapPos.transform.position.x, false)
            ModuleCache.TransformUtil.SetY(cardHolder.cardRoot.transform, seatHolder.goTmpPokerHeapPos.transform.position.y, false)
            local pokerHeapCardScale = ModuleCache.CustomerUtil.ConvertVector3(0.58, 0.58, 0.58)
            cardHolder.cardRoot.transform.localScale = pokerHeapCardScale

            self.TableRunfastHelper:playCardFlyToPosAnim(cardHolder, cardHolder.cardPosition, duration, (i - 1) * delay, function()
                ModuleCache.TransformUtil.SetX(cardHolder.cardRoot.transform, cardHolder.cardLocalPosition.x, true)
                ModuleCache.TransformUtil.SetY(cardHolder.cardRoot.transform, cardHolder.cardLocalPosition.y, true)
            end)

            self.TableRunfastHelper:playCardScaleAnim(cardHolder, cardHolder.cardLocalScale.x, duration, (i - 1) * delay, nil)

            self.TableRunfastHelper:playCardTurnAnim(cardHolder, true, duration, (i - 1) * delay, function()
                finishCount = finishCount + 1
                if (finishCount == count) then
                    if (onFinish) then
                        onFinish()
                    end
                end
            end)
        end

    else
        local startIndex = 1
        local endIndex = #cardHolderList
        local step = 1
        if (seatHolder.isInRight) then
            startIndex = #cardHolderList
            endIndex = 1
            step = -1
        end
        local index = 0
        for i = startIndex, endIndex, step do
            index = index + 1
            local cardHolder = cardHolderList[i]

            ModuleCache.TransformUtil.SetX(cardHolder.cardRoot.transform, seatHolder.goTmpPokerHeapPos.transform.position.x, false)
            ModuleCache.TransformUtil.SetY(cardHolder.cardRoot.transform, seatHolder.goTmpPokerHeapPos.transform.position.y, false)
            local pokerHeapCardScale = ModuleCache.CustomerUtil.ConvertVector3(0.58, 0.58, 0.58)
            cardHolder.cardRoot.transform.localScale = pokerHeapCardScale

            self.TableRunfastHelper:playCardFlyToPosAnim(cardHolder, cardHolder.cardPosition, duration, (index - 1) * 0.1, function()
                finishCount = finishCount + 1
                if (finishCount == count) then
                    if (onFinish) then
                        onFinish()
                    end
                end
            end)
        end
    end
end

------获取服务器现在的时间
function TableRunfastLogic:getServerNowTime()
    return self.modelData.curTableData.roomInfo.timeOffset + os.time()
end

------对赌加倍的回应
function TableRunfastLogic:on_table_bet_rsp(data)
end


------重连:游戏的信息:发牌,断线重连,玩家进入
function TableRunfastLogic:on_table_gameinfo(data)
    if (data.game_loop_cnt > 0 and self.isDataInited and data.reconn_player_id and self.modelData.curTablePlayerId) then
        if (data.reconn_player_id == 0 or data.reconn_player_id == self.modelData.curTablePlayerId) then
            --print("===自己断线重连data.reconn_player_id=",data.reconn_player_id)
        else
            print("===别人断线重连data.reconn_player_id=", data.reconn_player_id)
            return
        end
    end

    self.TableRunfastView:SetNotAllowActionMaskLastPokerAutoState(false)
    self:AllowPlayerAction(true)
    self:initTableSeatDataMy(data)
    local roomInfo = self.modelData.curTableData.roomInfo
    if(roomInfo.curRoundNum == 0 and #roomInfo.seatInfoList ~= roomInfo.maxPlayerCount)then
        self.TableRunfastModule:refresh_share_clip_board()
    else
        self.TableRunfastModule:clean_share_clip_board()
    end
    roomInfo.JustReceived_gameinfo = true
    self.TableRunfastModule:subscibe_time_event(2, false, 0):OnComplete(function(t)
        roomInfo.JustReceived_gameinfo = false
    end)
    self.TableRunfastView:setRoomInfo(roomInfo)--刷新房间信息显示
    self.TableRunfastView:CheckTopRoomInfo()
    --刷新每个座位状态的显示
    local seatList = roomInfo.seatInfoList
    for i = 1, #seatList do
        seatList[i].inHandPokerList = seatList[i].inHandPokerList or {}
        self.TableRunfastView:refreshSeat(seatList[i], seatList[i] == roomInfo.mySeatInfo)
    end
    self:refreshMyTableViewState()--刷新玩家自己桌面
    if(self.TableRunfastView:isJinBiChang()) then
        if(roomInfo.gamePhaseState == 3) then
            --self.TableRunfastView.JinBiChangStateSwitcher:SwitchState("ReplaceTableWait")
            self.TableRunfastView:SetState_DoingMatchingRoot(true)
        end
    end
    local isAllPlayerReady = self.TableRunfastHelper:checkIsAllReady(seatList)
    local IsHavePlayerOffline = self:CheckIsHavePlayerOffline()
    if (isAllPlayerReady) then
        if (roomInfo.mySeatInfo.isCreator) then
            if (data.cards == nil or #data.cards <= 0) then
                print("====on_table_gameinfo.onclick_start_btn   return")
                if (IsHavePlayerOffline) then
                    print("====有玩家离线,不发牌")
                else
                    self:onclick_start_btn()
                end
                return
            end
        end
    else
        print("====有玩家没准备")
        self:RefreshReadyBtn()
        return
    end

    ------这里游戏可以打牌了
    --隐藏上局别人打的牌
    self:ResetOtherThrowPoker()
    --隐藏OK图标
    self.TableRunfastView:HideOkIcon()
    --检查是否新的开局
    if (data.desk_player_id <= 0 and #data.desk_cards <= 0) then
        --print("====新的开局")
        roomInfo.isNewRound = true--新的开局,断线重连这个值也是true
        TableSound:Reset()
        self:ClearTable(true,true,true,true)

        --print("这里是新的开局")
        print("==============roomInfo.is_opening_cards=",roomInfo.is_opening_cards)
        if (roomInfo.is_opening_cards) then
            roomInfo.HeiTao3FlyPlayerId = roomInfo.next_player_id--新的开局:记录黑桃3飞向的玩家id
            roomInfo.IsNewRoundMsg = true --新的开局:记录这局需要开局动画
            self:ResetClickCount()

            if (self.TableRunfastView:isJinBiChang()) then
                self:ResetAllSeatInfoRechargeState()
            end

            self.TableRunfastView:ShowServiceFee()--新的开局:金币场,扣房费的提示

            --新的开局几秒之后这里的数据需要重置
            self.TableRunfastModule:subscibe_time_event(4, false, 0):OnComplete(function(t)
                roomInfo.isNewRound = false
                roomInfo.HeiTao3FlyPlayerId = nil
                roomInfo.IsNewRoundMsg = nil
            end)
        end
    else
        roomInfo.isNewRound = false
    end

    if (data.desk_player_id > 0 and #data.desk_cards > 0) then
        self:ResetClockTimeDown()
    end

    --发牌
    if (data.cards and #data.cards > 0) then
        ModuleCache.ModuleManager.hide_module(BranchPackageName, "tablerule")
        self:OnlyTwoPlayerHandlerThirdSeatShow()
        self:MyCards(data)
        self.TableRunfastView:EnterTableAlreadyStartGameClearBtn()
        self:SetKickBtnShowState(false)
        roomInfo.accountWaitReady = false
        roomInfo.gamePhaseState = 2
        self.TableRunfastView:SetState_DoingMatchingRoot(false)
    else
        self:RefreshReadyBtn()
    end
    --销毁匹配界面
    self.TableRunfastModule:dispatch_package_event("Event_Have_Enter_Table")
    self:initCurThorwPoker()--显示上局的出牌
    self.TableRunfastView:HideOthersBackPoker()
    self.TableRunfastView:RefreshRemainPokerInHand()
    self:TurnWhoThrowPokerEffect()--轮到谁出牌
    self:unSelectedAllPoker()
    self:CheckIntrust()
    self:OnlyTwoPlayerHandlerThirdSeatShow()

    self.TableRunfastView:PBUI2()
    --self.TableRunfastView:CheckAnticheatUI()


    if (data.reconn_player_id and data.reconn_player_id > 0 and data.reconn_player_id == tonumber(self.modelData.curTablePlayerId)) then
        print("===自己断线重连data.reconn_player_id=", data.reconn_player_id)
        ModuleCache.ModuleManager.hide_module("public", "dissolveroom")
        self.TableRunfastModule:subscibe_time_event(1, false, 0):OnComplete(function(t)
            --self:Check_myself_reconn()
        end)
    end

    print("================tableType=", self.modelData.tableCommonData.tableType)
end

function TableRunfastLogic:Check_myself_reconn()
    --print("===自己断线重连检查是否要的起")
    --local roomInfo = self.modelData.curTableData.roomInfo
    --local locIsFirstPattern = roomInfo.mySeatInfo.is_first_pattern
    --if(not locIsFirstPattern)then
    --    local myHandPokerNumTable = roomInfo.mySeatInfo.InMyHandPokerNumTable--我手上的牌
    --    local othersPokerNumTable = roomInfo.curPokerTable--别人打的牌
    --    local p_IsMaxPoker = self:IsMustThrowMaxPoker()
    --    local TiShiTable = CardLogic.tishi(myHandPokerNumTable,p_mustPokerNum,othersPokerNumTable,nil,nil,p_IsMaxPoker)
    --    if(self:CheckTableIsNilOrEmpty(TiShiTable)) then
    --        self:onClickNotAfford()
    --    end
    --end
end

------当前这局的小结
function TableRunfastLogic:on_table_currentgameaccount(data)
    --print("===当前这局的小结")
    local roomInfo = self.modelData.curTableData.roomInfo
    roomInfo.gamePhaseState = 3

    roomInfo.accountWaitReady = true
    roomInfo.JustReceived_CurrentGameAccount = true
    self.TableRunfastModule:subscibe_time_event(2, false, 0):OnComplete(function(t)
        roomInfo.JustReceived_CurrentGameAccount = false
    end)
    self.TableRunfastView:SetNotAllowActionMaskLastPokerAutoState(false)
    self:AllowPlayerAction(true)
    --self.TableRunfastView:CheckAnticheatUI()
    self:HideAllPlayerNotAfford(1)
    self:StopAllPlayerClockTimeDown(true)
    self:ResetSingle()
    self:ResetAllSeatInfoRechargeState()
    self:Clear_CheckDoingStateEventId()
    self.TableRunfastView:SetCancelIntrustState(false)
    TableSound:Reset()
    --roomInfo.matchInfo = data.matchResult
    roomInfo.curAccountData = data
    roomInfo.isJinBiChang = self.TableRunfastView:isJinBiChang()
    roomInfo.isGoldSettle = self.TableRunfastView:isGoldSettle()
    roomInfo.IsFriendsCirclePreventCheating = self.TableRunfastView.IsFriendsCirclePreventCheating

    local myself_Id = tonumber(roomInfo.mySeatInfo.playerId)
    local win_Id = data.winner_id or 0
    local win_seatInfo = nil
    if(win_Id <= 0) then
        if (data.players ~= nil and #data.players > 0) then
            for i = 1, #data.players do
                local locData = data.players[i]
                if (locData.remain_card_cnt <= 0) then
                    win_Id = tonumber(locData.player_id)
                    break
                end
            end
        end
    end
    if(win_Id > 0) then
        print("==赢家id=",win_Id)
        win_seatInfo = self.TableRunfastHelper:getSeatInfoByPlayerId(win_Id, roomInfo.seatInfoList)
    end


    if (self.TableRunfastView:isJinBiChang() or self.TableRunfastView:isMatchTable()) then
        for i = 1, #data.players do
            local locPlayerData = data.players[i]
            if (tonumber(locPlayerData.player_id) == tonumber(roomInfo.mySeatInfo.playerId)) then
                roomInfo.mySeatInfo.PlayerMatchInfo = locPlayerData.matchInfo
            end
        end
    end
    self.TableRunfastView:CheckTopRoomInfo()
    self.TableRunfastModule:subscibe_time_event(0.8, false, 0):OnComplete(function(t)
        local isOldAccountShow = true
        if (isOldAccountShow) then
            if (self.TableRunfastView:isMatchTable()) then
                print("==弹结算界面:比赛场")
                ModuleCache.ModuleManager.show_module(BranchPackageName, "currentgameaccount1", self.modelData)
            elseif (self.TableRunfastView:isFriendTable()) then
                print("==弹结算界面:好友场")
                ModuleCache.ModuleManager.show_module(BranchPackageName, "currentgameaccount", self.modelData)
            end

            --清理桌面
            self:ResetOtherThrowPoker()
            self.TableRunfastView:SetState_RecordPokerShowRoot(false)
            self.TableRunfastView:SetState_RecordPokerTimeRoot(false)
            if (not roomInfo.JustReceived_gameinfo) then
                self:ResetAllPlayerReadyState()
            end
            self:ClearTable(nil,true,true,true)


            --刷新积分或者金币
            if (data.players ~= nil and #data.players > 0) then
                for i = 1, #data.players do
                    local player_id = data.players[i].player_id
                    local seatInfo = self.TableRunfastHelper:getSeatInfoByPlayerId(player_id, self.modelData.curTableData.roomInfo.seatInfoList)
                    if (seatInfo ~= nil) then
                        seatInfo.score = data.players[i].score
                        seatInfo.coinBalance = data.players[i].coinBalance
                        self.TableRunfastView:RefreshSeatInfoCurrency(seatInfo)
                    end
                end
            end


            --print("显示:谁赢啦")
            --self.TableRunfastView:SetState_WhoWinEffect(win_seatInfo, true)
            if(self.TableRunfastView:isJinBiChang()) then
                --print("显示没有出的牌")
                self.LightPokersShowNeedTime = 0     --亮牌过程需要多久
                self.LightPokersShowFrequency = 0.04 --亮牌过程每隔多久亮一张牌
                local LightPokersShow_WaitTime = 0
                self.TableRunfastModule:subscibe_time_event(LightPokersShow_WaitTime, false, 0):OnComplete(function(t)
                    --self.TableRunfastView:SetState_WhoWinEffect(win_seatInfo, false)
                    if (data.players ~= nil and #data.players > 0) then
                        for i = 1, #data.players do
                            local locData = data.players[i]
                            local locId = tonumber(locData.player_id)
                            if (locId == win_Id) then
                                --print("赢家手上没有牌,不需要任何显示",locId)
                            else
                                --print("输家需要显示手上剩余的牌",locId)
                                local resultTable = self:GetShengYuPokers(locData.cards, locData.played_cards)
                                if (locId == myself_Id) then
                                    --print("====我自己输了,显示没有出的牌")
                                    self:refreshMyHandPokerListBySeverData(resultTable)
                                    ModuleCache.ComponentUtil.SafeSetActive(self.TableRunfastView.PokerPrefabParent.gameObject, true)
                                else
                                    --print("====别的玩家输了,显示没有出的牌")
                                    --print_table(resultTable)
                                    local tmpseatInfo = self.TableRunfastHelper:getSeatInfoByPlayerId(locData.player_id, roomInfo.seatInfoList)
                                    self:SetLightPokersShow(tmpseatInfo, true, resultTable, true,self.LightPokersShowFrequency)
                                    local NeedTime = #resultTable * self.LightPokersShowFrequency
                                    if(self.LightPokersShowNeedTime < NeedTime) then
                                        self.LightPokersShowNeedTime = NeedTime
                                    end
                                end
                            end
                        end
                    end

                    self.TableRunfastModule:subscibe_time_event(self.LightPokersShowNeedTime, false, 0):OnComplete(function(t)
                        print("==弹结算界面:金币场亮牌之后再弹")
                        ModuleCache.ModuleManager.show_module(BranchPackageName, "currentgameaccount1", self.modelData)
                    end)
                end)
            end
            return
        end
    end)
end

function TableRunfastLogic:on_table_discardreply(data)
    self.IsWaitDiscardreply = nil
    if (self.WaitDiscardreplyEventId) then
        --print("====已经回应,杀死等待函数")
        CSmartTimer:Kill(self.WaitDiscardreplyEventId)
        self.WaitDiscardreplyEventId = nil
    end

    self.myfn = nil

    if (data.cards ~= nil and #data.cards >= 0) then
        self.modelData.curTableData.roomInfo.mySeatInfo.InMyHandPokerNumTable = data.cards
        self:refreshMyHandPokerListBySeverData(self.modelData.curTableData.roomInfo.mySeatInfo.InMyHandPokerNumTable)
    end

    if (data.is_ok == false) then
        -- 第一局首发必须包含黑桃3
        -- 牌型不匹配
        -- 牌点太小了
        -- 对方爆单，请出最大牌
        -- 不可以出手上没有的牌
        -- 最少要出一张
        -- 出牌数量大于最大手牌数量
        -- 有大必管，逃避不是办法
        -- 首发必须出牌
        if (string.find(data.desc, "还没轮到你出牌") ~= nil
                or string.find(data.desc, "重复点击无效") ~= nil) then
            return
        else
            self.TableRunfastModule:subscibe_time_event(1.5, false, 0):OnComplete(function(t)
                TableManagerPoker:heartbeat_timeout_reconnect_game_server()
            end)
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(data.desc)
        end
    end
end

------轮到谁出牌的效果
function TableRunfastLogic:TurnWhoThrowPokerEffect()
    local next_player_id = tonumber(self.modelData.curTableData.roomInfo.next_player_id)
    local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
    --闪烁效果
    for i = 1, #seatInfoList do
        local seatInfo = seatInfoList[i]
        local seatInfoPlayerId = tonumber(seatInfo.playerId)
        local seatHolder = self.TableRunfastView.seatHolderArray[seatInfo.localSeatIndex]
        ModuleCache.ComponentUtil.SafeSetActive(seatHolder.HeadSelected.gameObject, (seatInfoPlayerId == next_player_id))
    end

    --闹钟效果
    local next_seatInfo = self.TableRunfastHelper:getSeatInfoByPlayerId(next_player_id, seatInfoList)
    if (next_seatInfo) then
        if (self.TableRunfastView:isJinBiChang() or self.TableRunfastView.isPlayBacking) then
            --金币场的闹钟时间是由服务器发过来的
        elseif (self.TableRunfastView:isFriendTable()) then
            local locTime = 15
            if (self.IsWaitOnClickNotAfford and self.NotAffordWaitTime > 2) then
                locTime = self.NotAffordWaitTime
            end
            self:StartClockTimeDown(next_seatInfo, locTime)
        end
    end
end

function TableRunfastLogic:ShowClock2(seatHolder, boolShow, localSeatIndex, seatInfoPlayerId)
    if (self.TableRunfastView.isPlayBacking) then
        boolShow = false
    end
    seatHolder.clockHolder.textClockTime = 15
    ModuleCache.ComponentUtil.SafeSetActive(seatHolder.clockHolder.goClock.gameObject, boolShow)
    if (boolShow) then
        self.modelData.curTableData.curTimeDownLocalSeatIndex = localSeatIndex
        --print("=====self.NotAffordWaitTime="..tostring(self.NotAffordWaitTime))
        --print("=====self.IsWaitOnClickNotAfford="..tostring(self.IsWaitOnClickNotAfford))
        if (self.IsWaitOnClickNotAfford and self.NotAffordWaitTime > 2) then
            seatHolder.clockHolder.textClockTime = self.NotAffordWaitTime
        end
    end
    seatHolder.clockHolder.textClock.text = tostring(seatHolder.clockHolder.textClockTime)
end

function TableRunfastLogic:ResetClockTimeDown()
    self.modelData.curTableData.curTimeDownLocalSeatIndex = nil
    local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
    for i = 1, #seatInfoList do
        local seatInfo = seatInfoList[i]
        local seatHolder = self.TableRunfastView.seatHolderArray[seatInfo.localSeatIndex]
        seatHolder.clockHolder.textClockTime = 15
        ModuleCache.ComponentUtil.SafeSetActive(seatHolder.clockHolder.goClock.gameObject, false)
    end
end

------收到出牌信息
function TableRunfastLogic:DiscardNotify(data)
    self:Clear_CheckDoingStateEventId()
    if(self.IsUserChenZhuoTiShi) then
        self:DiscardNotify_ChenZhuo(data)
    else
        self:DiscardNotify_Old(data)
    end
end

function TableRunfastLogic:DiscardNotify_Old(data)
    self.myfn = nil
    self.modelData.curTableData.roomInfo.discard_serial_no = data.discard_serial_no
    self.modelData.curTableData.roomInfo.next_player_id = data.next_player_id
    self.modelData.curTableData.roomInfo.curThorwCardPlayerId = data.player_id
    self.modelData.curTableData.roomInfo.next_player_discard_bomb = data.next_player_discard_bomb
    if (not data.is_passed) then
        self.modelData.curTableData.roomInfo.lastThrowPokerPlayerId = data.player_id
    end
    self.modelData.curTableData.roomInfo.black3_player = data.black3_player
    local next_player_id = tonumber(self.modelData.curTableData.roomInfo.next_player_id)
    local myId = tonumber(self.modelData.curTableData.roomInfo.mySeatInfo.playerId)
    local currThrowId = tonumber(self.modelData.curTableData.roomInfo.curThorwCardPlayerId)

    self:HideNotAffordByPlayerId(next_player_id)

    if (true) then
        local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
        for i = 1, #seatInfoList do
            local seatInfo = seatInfoList[i]
            local seatInfoPlayerId = tonumber(seatInfo.playerId)
            if (seatInfoPlayerId == currThrowId and currThrowId ~= myId) then
            elseif (seatInfoPlayerId == next_player_id) then
                --print("===seatInfo.localSeatIndex="..seatInfo.localSeatIndex)
                self:HideOtherThrowCards(seatInfo.localSeatIndex)
            end
        end
    end

    if (data.is_passed) then
        if (currThrowId == myId) then
            --print("====自己过牌")
            self:unSelectedAllPoker()
        else
            --print("====别人过牌")
        end
        self:NotAffordEffect()
    else
        if (currThrowId == myId) then
            --print("====自己出牌:把牌扔出去")
            self.modelData.curTableData.roomInfo.mySeatInfo.rest_card_cnt = data.rest_card_cnt
            self.modelData.curTableData.roomInfo.mySeatInfo.is_single = (data.warning_flag == 1)

            if (self.TableRunfastView:isJinBiChang()) then
                self:StopAllPlayerClockTimeDown(true)
            end

            if (self:IsJinBiChangAndIntrust() and data.cards and #data.cards > 0
            or self:IsMatchTableAndIntrust() and data.cards and #data.cards > 0
            or self.IsJustCancelIntrust) then
                local numList = self:PokerListSort(data.cards)
                self:FirstThrowPoker(numList)
                self:throwPokerType(data.cards, true)
                self.IsJustCancelIntrust = false
            end
        else
            --print("====别人出牌:记录别人这次出的牌")
            if (data.cards ~= nil and #data.cards >= 0) then
                self.modelData.curTableData.roomInfo.curPokerTable = {}
                self.TableRunfastHelper:NumTableInsertToNewTable(self.modelData.curTableData.roomInfo.curPokerTable, data.cards)

                --别人显示牌
                local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
                for i = 1, #seatInfoList do
                    local seatInfo = seatInfoList[i]
                    local seatInfoPlayerId = tonumber(seatInfo.playerId)
                    if (seatInfoPlayerId == currThrowId and currThrowId ~= myId) then
                        seatInfo.rest_card_cnt = data.rest_card_cnt
                        seatInfo.is_single = (data.warning_flag == 1)
                        --print("===别人出牌显示seatInfoPlayerId="..seatInfoPlayerId.." 剩余牌数="..tostring(data.rest_card_cnt))
                        self:otherThrowCards(seatInfo, data.cards)
                        self:throwPokerType(data.cards)
                        self.TableRunfastView:SetRemainPokerInHand(seatInfo)
                    elseif (seatInfoPlayerId == next_player_id) then
                        self:HideOtherThrowCards(seatInfo.localSeatIndex)
                    end
                end
            end
        end
    end

    local curRuleTable = self.modelData.curTableData.roomInfo.createRoomRule
    local nextPlayerIsMy = self:nextPlayerIsMy()
    local isCanAfford = true
    local fn = nil
    local intJiZhongChuPaiFangShi = nil
    local boolZhiJieChuPai = false--是否可以直接出牌
    local isLastHintPoker = false --是否是最后一手牌
    --如果下一个是我出牌隐藏我已经出的牌,检查是否要的起,如果要不起直接过,不需要用户点击要不起
    if (nextPlayerIsMy) then
        self:ResetFirstThrowPoker()
        --print("===是否首发:"..tostring(data.is_first_pattern))
        self.modelData.curTableData.roomInfo.mySeatInfo.is_first_pattern = data.is_first_pattern
        local myHandPokerTable = self.modelData.curTableData.roomInfo.mySeatInfo.InMyHandPokerNumTable--我手上的牌
        local otherThrowPokerTable = self.modelData.curTableData.roomInfo.curPokerTable--别人打的牌
        local set = CardSet.new(myHandPokerTable)
        local otherThrowPokerCP = nil
        if (data.is_first_pattern) then
            otherThrowPokerCP = nil
        else
            local locPlayId = self.modelData.curTableData.roomInfo.lastThrowPokerPlayerId or self.modelData.curTableData.roomInfo.curThorwCardPlayerId
            otherThrowPokerCP = CardPattern.new(otherThrowPokerTable, #otherThrowPokerTable, self:Is_black3_player(nil, tonumber(locPlayId)))
            if (otherThrowPokerCP == nil) then
                print("====别人打的牌不符合规则")
            end
        end

        --提示接口
        local locIsMaxPoker = self:IsMustThrowMaxPoker()
        fn, intJiZhongChuPaiFangShi, boolZhiJieChuPai = set:hintIterator(otherThrowPokerCP, nil, locIsMaxPoker, self:Is_black3_player())

        --接牌时检查是否要的起
        if (data.is_first_pattern) then
            --print("首发,那么就是要的起")
            isCanAfford = true
        else
            if (fn == nil) then
                isCanAfford = false
                --print("自动检查要不起fn == nil")
                self:WaitNotAffordAndAction()
            else
                --print("自动检查要不起fn ~= nil")
                isCanAfford = true
                if (intJiZhongChuPaiFangShi == 1) then
                    --只有一种出牌方式
                    local pt = fn()
                    local onlyOnePokerTable = pt.cards
                    if (self:IsJinBiChangAndIntrust()) then
                    else
                        self:UpPoker(onlyOnePokerTable)
                    end
                end
            end
        end

        --最后一手自动出牌
        if (fn ~= nil and boolZhiJieChuPai == true) then
            local pt = fn()
            local lastThrowPokerTable = pt.cards --最后一手的牌
            if (lastThrowPokerTable ~= nil and #lastThrowPokerTable > 0) then
                --print("====最后一手强制自动出牌")
                self:LastForceThrowPoker(lastThrowPokerTable)
            end
        end
    end
    --如果下一个是我并且要的起,显示操作按钮
    --下一个出牌的是我并且要的起牌并且不是安徽玩法
    local boolShowDoing = true
    if (nextPlayerIsMy) then
        if (self.TableRunfastView.isPlayBacking) then
            boolShowDoing = false
        elseif (curRuleTable.allow_pass) then
            boolShowDoing = true
        else
            boolShowDoing = isCanAfford
            self:CheckDoingState(boolShowDoing)
        end

        if(not self.TableRunfastView.isPlayBacking) then
            self:SetMyHandPokerGradient(not isCanAfford)
            if(isCanAfford) then
                self:CheckMySelectPokerCompareOtherPoker()
            end
        end
    else
        boolShowDoing = false
    end

    self:SetDoingState(boolShowDoing)
    self.TableRunfastView:RefreshRemainPokerInHand()
    self:TurnWhoThrowPokerEffect()
    self:CheckZhaDanFlyScore(data)
    if (data.is_first_pattern) then
        self:HideAllPlayerNotAfford(1.2)
    end
end


function TableRunfastLogic:DiscardNotify_ChenZhuo(data)
    local roomInfo = self.modelData.curTableData.roomInfo
    self.myfn = nil
    roomInfo.discard_serial_no = data.discard_serial_no
    roomInfo.next_player_id = data.next_player_id
    roomInfo.curThorwCardPlayerId = data.player_id
    roomInfo.next_player_discard_bomb = data.next_player_discard_bomb
    if (not data.is_passed) then
        roomInfo.lastThrowPokerPlayerId = data.player_id
    end
    roomInfo.black3_player = data.black3_player
    local next_player_id = tonumber(roomInfo.next_player_id)
    local myId = tonumber(roomInfo.mySeatInfo.playerId)
    local currThrowId = tonumber(roomInfo.curThorwCardPlayerId)

    self:HideNotAffordByPlayerId(next_player_id)

    if (true) then
        local seatInfoList = roomInfo.seatInfoList
        for i = 1, #seatInfoList do
            local seatInfo = seatInfoList[i]
            local seatInfoPlayerId = tonumber(seatInfo.playerId)
            if (seatInfoPlayerId == currThrowId and currThrowId ~= myId) then
            elseif (seatInfoPlayerId == next_player_id) then
                --print("===seatInfo.localSeatIndex="..seatInfo.localSeatIndex)
                self:HideOtherThrowCards(seatInfo.localSeatIndex)
            end
        end
    end

    if (data.is_passed) then
        if (currThrowId == myId) then
            --print("====自己过牌")
            self:unSelectedAllPoker()
        else
            --print("====别人过牌")
        end
        self:NotAffordEffect()
    else
        if (currThrowId == myId) then
            --print("====自己出牌:把牌扔出去")
            roomInfo.mySeatInfo.rest_card_cnt = data.rest_card_cnt
            roomInfo.mySeatInfo.is_single = (data.warning_flag == 1)

            if (self.TableRunfastView:isJinBiChang()) then
                self:StopAllPlayerClockTimeDown(true)
            end

            if (self:IsJinBiChangAndIntrust() and data.cards and #data.cards > 0
            or self:IsMatchTableAndIntrust() and data.cards and #data.cards > 0
            or self.IsJustCancelIntrust) then
                local numList = self:PokerListSort(data.cards)
                self:FirstThrowPoker(numList)
                self:throwPokerType(data.cards, true)
                self.IsJustCancelIntrust = false
            end
        else
            --print("====别人出牌:记录别人这次出的牌")
            if (data.cards ~= nil and #data.cards >= 0) then
                roomInfo.curPokerTable = {}
                self.TableRunfastHelper:NumTableInsertToNewTable(roomInfo.curPokerTable, data.cards)

                --别人显示牌
                local seatInfoList = roomInfo.seatInfoList
                for i = 1, #seatInfoList do
                    local seatInfo = seatInfoList[i]
                    local seatInfoPlayerId = tonumber(seatInfo.playerId)
                    if (seatInfoPlayerId == currThrowId and currThrowId ~= myId) then
                        seatInfo.rest_card_cnt = data.rest_card_cnt
                        seatInfo.is_single = (data.warning_flag == 1)
                        --print("===别人出牌显示seatInfoPlayerId="..seatInfoPlayerId.." 剩余牌数="..tostring(data.rest_card_cnt))
                        self:otherThrowCards(seatInfo, data.cards)
                        self:throwPokerType(data.cards)
                        self.TableRunfastView:SetRemainPokerInHand(seatInfo)
                    elseif (seatInfoPlayerId == next_player_id) then
                        self:HideOtherThrowCards(seatInfo.localSeatIndex)
                    end
                end
            end
        end
    end

    local curRuleTable = roomInfo.createRoomRule
    local nextPlayerIsMy = self:nextPlayerIsMy()
    local TiShiTable = nil
    local isCanAfford = true
    local fn = nil
    local intJiZhongChuPaiFangShi = nil
    local boolZhiJieChuPai = false--是否可以直接出牌
    local GradientNumList = nil
    local isLastHintPoker = false --是否是最后一手牌
    --如果下一个是我出牌隐藏我已经出的牌,检查是否要的起,如果要不起直接过,不需要用户点击要不起
    if (nextPlayerIsMy) then
        self:ResetClickCount()
        self:ResetFirstThrowPoker()
        --print("===是否首发:"..tostring(data.is_first_pattern))
        roomInfo.mySeatInfo.is_first_pattern = data.is_first_pattern
        local myHandPokerTable = roomInfo.mySeatInfo.InMyHandPokerNumTable--我手上的牌
        local otherThrowPokerTable = roomInfo.curPokerTable--别人打的牌
        if(self:IsJinBiChangAndIntrust()) then
            print("====托管状态")
        else
            local outcard = nil
            local MyselfIsBlack3Player = false
            local OutCardIsBlack3Player = false
            if(not data.is_first_pattern) then
                outcard = otherThrowPokerTable
            end
            if(self:IsFirstMustBlack3()) then  -- 规则上4个3出了一个黑桃3，剩余的3个3是否算炸弹
                MyselfIsBlack3Player = self:Is_black3_player()
                if(outcard and #outcard > 0) then
                    --其他玩家是否为黑桃三
                    local lastThrowPokerPlayerId = roomInfo.lastThrowPokerPlayerId or roomInfo.curThorwCardPlayerId
                    OutCardIsBlack3Player = self:Is_black3_player(nil, tonumber(lastThrowPokerPlayerId))
                end
            end
            TiShiTable,boolZhiJieChuPai,GradientNumList = CardLogic.tishi(myHandPokerTable,nil,outcard,nil,nil,self:IsMustThrowMaxPoker(),MyselfIsBlack3Player,OutCardIsBlack3Player)
            if(data.is_first_pattern) then
                --print("首发,那么就是要的起")
                isCanAfford = true
            else
                print("这里是接牌了")
                if(self:CheckTableIsNilOrEmpty(TiShiTable)) then
                    --print("====接牌自动检查:要不起")
                    isCanAfford = false
                    self:WaitNotAffordAndAction()
                else
                    --print("====接牌自动检查:要得起")
                    isCanAfford = true
                    if(#TiShiTable == 1) then
                        --print("====只有一种出牌方式,直接提上去")
                        self:unSelectedAllPoker()
                        self:UpPoker(TiShiTable[1])
                    end
                end
            end

            if(TiShiTable and boolZhiJieChuPai) then
                --print("====最后一手自动出牌")
                local LastAutoThrowPokerTable = TiShiTable[1]
                if (LastAutoThrowPokerTable ~= nil and #LastAutoThrowPokerTable > 0) then
                    --print("====最后一手强制自动出牌")
                    self:LastForceThrowPoker(LastAutoThrowPokerTable)
                end
            end
        end
    end
    --如果下一个是我并且要的起,显示操作按钮
    --下一个出牌的是我并且要的起牌并且不是安徽玩法
    local boolShowDoing = true
    if (nextPlayerIsMy) then
        if (self.TableRunfastView.isPlayBacking) then
            boolShowDoing = false
        elseif (curRuleTable.allow_pass) then
            boolShowDoing = true
        else
            boolShowDoing = isCanAfford
            self:CheckDoingState(boolShowDoing)
        end

        if(not self.TableRunfastView.isPlayBacking) then
            self:SetMyHandPokerGradient(not isCanAfford,GradientNumList)
            if(isCanAfford) then
                self:CheckMySelectPokerCompareOtherPoker()
            end
        end
    else
        boolShowDoing = false
    end

    self:SetDoingState(boolShowDoing)
    self.TableRunfastView:RefreshRemainPokerInHand()
    self:TurnWhoThrowPokerEffect()
    self:CheckZhaDanFlyScore(data)
    if (data.is_first_pattern) then
        self:HideAllPlayerNotAfford(1.2)
    end
end

function TableRunfastLogic:Clear_CheckDoingStateEventId()
    if (self.CheckDoingStateEventId) then
        CSmartTimer:Kill(self.CheckDoingStateEventId)
        self.CheckDoingStateEventId = nil
    end
end
function TableRunfastLogic:CheckDoingState(boolShowDoing)
    --1.本来要不起,但是判断错误要的起,显示按钮,自己可以点击提示,这个出错也没有影响
    --2.本来要的起,但是判断错误要不起,隐藏按钮,没有操作按钮,这个时候,会卡住流程
    --这个定时器是为了检查万一出现2的情况,要把操作按钮显示出来,不能卡流程
    if(boolShowDoing or (not self:nextPlayerIsMy())) then
        return
    end

    print("==你要不起的情况下检查自己的操作按钮")
    self:Clear_CheckDoingStateEventId()
    --要不起整个过程一秒可以完成,考虑可能会有网络延迟,这里给出的时间长一点
    self.CheckDoingStateEventId = self.TableRunfastModule:subscibe_time_event(5, false, 0):OnComplete(function(t)
        self:SetDoingState(true)
    end).id
end

function TableRunfastLogic:HideAllPlayerNotAfford(delayTime)
    --print("==隐藏所有玩家的要不起")
    local TempAction = function ()
        local seatHolderArray = self.TableRunfastView.seatHolderArray
        for i = 1, #seatHolderArray do
            local seatHolder = self.TableRunfastView:GetSeatHolder(nil,i)
            if(seatHolder and seatHolder.NotAffordEffectRoot) then
                ModuleCache.ComponentUtil.SafeSetActive(seatHolder.NotAffordEffectRoot.gameObject, false)
            end
        end
    end
    if(delayTime and delayTime > 0) then
        self.TableRunfastModule:subscibe_time_event(delayTime, false, 0):OnComplete(function(t)
            TempAction()
        end)
    else
        TempAction()
    end
end

function TableRunfastLogic:HideNotAffordByPlayerId(_PlayerId)
    local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
    for i = 1, #seatInfoList do
        local seatInfo = seatInfoList[i]
        if (tonumber(_PlayerId) == tonumber(seatInfo.playerId)) then
            local seatHolder = self.TableRunfastView.seatHolderArray[seatInfo.localSeatIndex]
            if (seatHolder and seatHolder.NotAffordEffectRoot ) then
                ModuleCache.ComponentUtil.SafeSetActive(seatHolder.NotAffordEffectRoot.gameObject, false)
            end
        end
    end
end

function TableRunfastLogic:throwPokerType(cardsNumTable, IsMySelf)
    local curThrowPlayId = tonumber(self.modelData.curTableData.roomInfo.curThorwCardPlayerId)--出牌的人玩家Id
    if (IsMySelf) then
        curThrowPlayId = tonumber(self.modelData.curTableData.roomInfo.mySeatInfo.playerId)--出牌的人玩家Id
    end
    local throwPokerLocalIndexId = self:getLocalSeatIndex(curThrowPlayId)--出牌的人本地坐标
    local is_black3_player = self:Is_black3_player(nil, tonumber(curThrowPlayId))
    local pt = CardPattern.new(cardsNumTable, #cardsNumTable, is_black3_player)--出牌的类型
    if (pt ~= nil) then
        local boolMale = self:GetPlayerIsMaleByPlayerId(curThrowPlayId)
        TableSound:PlaySound_DaPai()
        TableSound:PlaySound_PokerType(boolMale,pt.disp_type)--出牌的声音
        self:PlayThrowPokerEffect(throwPokerLocalIndexId, pt.disp_type,#cardsNumTable)--出牌特效
    end
end

--回放的出牌类型
function TableRunfastLogic:PB_ThrowPokerType(seatInfo, throwPokerTable)
    local localSeatIndex = seatInfo.localSeatIndex
    local pt = CardPattern.new(throwPokerTable, #throwPokerTable, self:Is_black3_player())--出牌的类型
    if (pt ~= nil) then
        local boolMale = true--self:GetPlayerIsMaleByPlayerId(curThrowPlayId)
        TableSound:PlaySound_PokerType(boolMale,pt.disp_type)--出牌的声音
        --self:PlayThrowPokerEffect(localSeatIndex,pt.disp_type)--出牌特效
    end
end

------别人出牌显示:seatInfo谁出牌,cardsNumTable出了什么牌
function TableRunfastLogic:otherThrowCards(seatInfo, cardsNumTable)
    local seatHolder = self.TableRunfastView.seatHolderArray[seatInfo.localSeatIndex]
    for i = 1, #cardsNumTable do
        local pokerSlot = seatHolder.otherThrowPokerSlotTable[i]
        self:setCardInfo2(pokerSlot, cardsNumTable[i])
        self.TableRunfastHelper:PlayScaleAnim(pokerSlot.gameObject, 0.5, 1, 0.1)
    end

    if (self.TableRunfastView.isPlayBacking) then
        self.TableRunfastModule:PB_RefreshInHandPokerForOthers(seatInfo, cardsNumTable)
    end
end

function TableRunfastLogic:ResetOtherThrowPoker()
    local seatHolderArray = self.TableRunfastView.seatHolderArray
    for i = 2, #seatHolderArray do
        self:HideOtherThrowCards(i)
    end
end

------隐藏别人出过的牌
function TableRunfastLogic:HideOtherThrowCards(localSeatIndex)
    local seatHolder = self.TableRunfastView:GetSeatHolder(nil,localSeatIndex)
    local slotTable = seatHolder.otherThrowPokerSlotTable
    if (slotTable == nil) then
        return
    end

    for i = 1, #slotTable do
        local pokerSlot = slotTable[i]
        if (pokerSlot ~= nil) then
            ModuleCache.ComponentUtil.SafeSetActive(pokerSlot.gameObject, false)
        end
    end
end


function TableRunfastLogic:onClickPoker(obj, IsClickEnter)
    local roomInfo = self.modelData.curTableData.roomInfo
    local cardsArray = self.TableRunfastView.seatHolderArray[1].inhandCardsArray--手上所有的牌
    local selectedPokersArray = self.TableRunfastView.seatHolderArray[1].selectedPokersArray or {}--已经选了的牌

    local isPickUpHint = false --接牌提示
    if (IsClickEnter and roomInfo.mySeatInfo.is_first_pattern and roomInfo.mySeatInfo.is_first_pattern == false) then
        isPickUpHint = #self:GetSelectedPokerList() == 0
    end

    for i = 1, #cardsArray do
        if (obj == cardsArray[i].cardRoot) then
            --已经扔出去,已经隐藏,灰暗的牌都不能点击
            if (cardsArray[i].isThrowed or cardsArray[i].isHide or cardsArray[i].isDarkness) then
                return
            end

            if (cardsArray[i].selected) then
                cardsArray[i].selected = false
                for j = 1, #selectedPokersArray do
                    if (selectedPokersArray[j] == cardsArray[i].poker) then
                        table.remove(selectedPokersArray, j)
                        break
                    end
                end
                self.TableRunfastView:refreshCardSelect(cardsArray[i])
            else
                cardsArray[i].selected = true
                table.insert(selectedPokersArray, cardsArray[i].poker)
                self.TableRunfastView:refreshCardSelect(cardsArray[i])
            end
        end
    end
    self.TableRunfastView.seatHolderArray[1].selectedPokersArray = selectedPokersArray
    self:CheckPickUpClickHint(isPickUpHint,IsClickEnter)
    self:CheckSelectPokerRule()
end

function TableRunfastLogic:CheckPickUpClickHint(isPickUpHint,IsClickEnter)
    if(self.IsUserChenZhuoTiShi) then
        self:CheckPickUpClickHint_ChenZhuo(IsClickEnter)
    else
        self:CheckPickUpClickHint_Old(isPickUpHint)
    end
end

function TableRunfastLogic:CheckPickUpClickHint_ChenZhuo(IsClickEnter)
    if(not IsClickEnter) then
        return
    end
    local roomInfo = self.modelData.curTableData.roomInfo
    self.OnClickPokerCount = (self.OnClickPokerCount or 0) + 1
    local p_firstOp = self.OnClickPokerCount == 1
    if ((not self:nextPlayerIsMy()) or (not p_firstOp) or roomInfo.mySeatInfo.is_first_pattern) then
        --print("====不是自己操作,不是第一次,不是接牌")
        return
    end

    local othersPokerNumTable = roomInfo.curPokerTable
    if(othersPokerNumTable and #othersPokerNumTable == 1) then
        --print("====别人打单牌,不用提示了")
        return
    end
    local myHandPokerNumTable = roomInfo.mySeatInfo.InMyHandPokerNumTable
    local selectedPokerList = self:GetSelectedPokerList()
    local TiShiTable = CardLogic.tishi(myHandPokerNumTable,nil,othersPokerNumTable,selectedPokerList,p_firstOp)
    if(TiShiTable and #TiShiTable > 0) then
        local UpPokerNumList = TiShiTable[1]
        self:unSelectedAllPoker()
        self:UpPoker(UpPokerNumList)
        --print("====将牌提上去")
        --print_table(UpPokerNumList)
    end
end

function TableRunfastLogic:CheckPickUpClickHint_Old(isPickUpHint)
    if (not isPickUpHint) then
        return
    end
    local selectedPokerList = self:GetSelectedPokerList()
    if (#selectedPokerList ~= 1) then
        return
    end

    local myHandPokerNumTable = self.modelData.curTableData.roomInfo.mySeatInfo.InMyHandPokerNumTable--我手上的牌
    local pokerNumTable = self.modelData.curTableData.roomInfo.curPokerTable--别人打的牌
    local othersThrowPokerCP = CardPattern.new(pokerNumTable, #pokerNumTable, false)
    local set = CardSet.new(myHandPokerNumTable)
    local essential_card = selectedPokerList[1]
    print("=====essential_card", essential_card)
    local locfn = set:hintIterator(othersThrowPokerCP, essential_card, false, false)
    if (locfn ~= nil) then
        print("========可以接牌提示2=")
        local pt = locfn()
        if (pt == nil) then
            print("====pt == nil")
        elseif (pt.cards == nil) then
            print("====pt.cards == nil")
        else
            print("========可以接牌提示3=")
            print_table(pt.cards)
            local needUpPokerList = {}
            local oldPokerList = pt.cards
            for i = 1, #oldPokerList do
                if (oldPokerList[i] ~= essential_card) then
                    table.insert(needUpPokerList, oldPokerList[i])
                end
            end
            self:UpPoker(needUpPokerList)
            print_table(needUpPokerList)
        end
    end
    locfn = nil
end


function TableRunfastLogic:onDragPokerEffect(startIndex, endIndex)
    local cardsArray = self.TableRunfastView.seatHolderArray[1].inhandCardsArray--手上所有的牌
    for i = 1, #cardsArray do
        if (i >= startIndex and i <= endIndex) then
            if (cardsArray[i].isThrowed or cardsArray[i].isHide) then
            else
                self.TableRunfastHelper:enableGradientColor(cardsArray[i], true)
            end
        else
            self.TableRunfastHelper:enableGradientColor(cardsArray[i], false)
        end
    end
end

function TableRunfastLogic:onDragPoker(startIndex, endIndex)
    local OldSelectedPokerList = self:GetSelectedPokerList()
    local p_opCards = {}
    local cardsArray = self.TableRunfastView.seatHolderArray[1].inhandCardsArray--手上所有的牌
    local selectedPokersArray = self.TableRunfastView.seatHolderArray[1].selectedPokersArray or {}--已经选了的牌
    if(selectedPokersArray == nil or #selectedPokersArray <= 0) then
        self.DragPokerCount = 0
    end
    for i = startIndex, endIndex do
        if (cardsArray[i].isThrowed or cardsArray[i].isHide or cardsArray[i].isDarkness) then
            --这样的牌不让拖
        else
            if (cardsArray[i].selected) then
                cardsArray[i].selected = false
                for j = 1, #selectedPokersArray do
                    if (selectedPokersArray[j] == cardsArray[i].poker) then
                        table.remove(selectedPokersArray, j)
                        table.insert(p_opCards,cardsArray[i].poker.PokerNum)
                        break
                    end
                end
                self.TableRunfastView:refreshCardSelect(cardsArray[i])
            else
                cardsArray[i].selected = true
                table.insert(selectedPokersArray, cardsArray[i].poker)
                table.insert(p_opCards,cardsArray[i].poker.PokerNum)
                self.TableRunfastView:refreshCardSelect(cardsArray[i])
            end
        end
    end
    self.TableRunfastView.seatHolderArray[1].selectedPokersArray = selectedPokersArray


    self.DragPokerCount = (self.DragPokerCount or 0) + 1
    if(self.IsUserChenZhuoDragTiShi and self:nextPlayerIsMy() and p_opCards and #p_opCards > 0) then
        --print("=======滑牌的提示")
        local roomInfo = self.modelData.curTableData.roomInfo
        local myHandPokerTable = roomInfo.mySeatInfo.InMyHandPokerNumTable--我手上的牌
        local p_mustPokerNum = nil
        local ruleTable = roomInfo.createRoomRule
        local p_IsMaxPoker = self:IsMustThrowMaxPoker()
        local p_outcard = nil
        local p_firstOp = self.DragPokerCount == 1
        if(not roomInfo.mySeatInfo.is_first_pattern) then
            p_outcard = roomInfo.curPokerTable
        end

        --print("====滑牌的数量=",#p_opCards)
        local TiShiTable = CardLogic.tishi(myHandPokerTable,p_mustPokerNum,p_outcard,p_opCards,p_firstOp,p_IsMaxPoker)
        print_table(TiShiTable)
        if(TiShiTable and #TiShiTable > 0) then
            if(p_firstOp) then
                local UpPokerNumList = TiShiTable[1]
                if(self.TableRunfastHelper:ListIsHaveData(OldSelectedPokerList)) then
                    for i = 1, #OldSelectedPokerList do
                        table.insert(UpPokerNumList,OldSelectedPokerList[i])
                    end
                end
                self:unSelectedAllPoker()
                self:UpPoker(UpPokerNumList)
            end
        end
    end

    ---罗老师提示-------------------
    local isFirstDrag = OldSelectedPokerList == nil or #OldSelectedPokerList <= 0 ---是否是第一次滑动
    local roomInfo = self.modelData.curTableData.roomInfo
    local myHandPokerNumTable = roomInfo.mySeatInfo.InMyHandPokerNumTable--我手上的牌
    local othersPokerNumTable = roomInfo.curPokerTable--别人打的牌
    local locIsMaxPoker = self:IsMustThrowMaxPoker()
    local locIsFirstRound = self:IsFirstRound()
    local ruleTable = roomInfo.createRoomRule
    local locIsContainsHeiTao3 = (ruleTable.black3_on_firstloop or ruleTable.first_must_black3) and self:IsContainsHeiTao3(myHandPokerNumTable)
    local locIsFirstPattern = roomInfo.mySeatInfo.is_first_pattern
    local locPlayId = roomInfo.lastThrowPokerPlayerId or roomInfo.curThorwCardPlayerId
    local isFirstPattern = othersPokerNumTable == nil or #othersPokerNumTable == 0
    if self:nextPlayerIsMy() and p_opCards and #p_opCards > 0 then
        local othersThrowPokerCP = nil
        local startPokerNum = nil
        -- 如果设定了红桃三先出并且有红桃三、所有局都是红桃三先出或者第一局红桃三先出
        if locIsContainsHeiTao3 and (ruleTable.every_round_black3_first or locIsFirstRound) and ruleTable.init_card_cnt == #myHandPokerNumTable then
            othersThrowPokerCP = nil
            startPokerNum = self:GetMustThrowNum()
        elseif (locIsFirstPattern == true) then
            othersThrowPokerCP = nil
        else
            local locPlayId = roomInfo.lastThrowPokerPlayerId or roomInfo.curThorwCardPlayerId
            othersThrowPokerCP = CardPattern.new(othersPokerNumTable, #othersPokerNumTable, self:Is_black3_player(nil, tonumber(locPlayId)))
        end
        if othersThrowPokerCP then
            print_table(othersThrowPokerCP)
        end

        if isFirstDrag then
            local set = CardSet.new(p_opCards)
            local _,_,_,pattern_set = set:hintIterator(othersThrowPokerCP, startPokerNum, locIsMaxPoker, self:Is_black3_player())
            if pattern_set and #pattern_set > 0 then
                self:unSelectedAllPoker()
                self:UpPoker(pattern_set[1].cards)
            end
            --[[
            local opTipPatterns = set:getHintIterators(othersThrowPokerCP, startPokerNum, locIsMaxPoker, self:Is_black3_player())
            if opTipPatterns then
                print_table(opTipPatterns)
                local tipPattern = self:GetBestPattern(opTipPatterns,isFirstPattern)
                if tipPattern then
                    self:unSelectedAllPoker()
                    self:UpPoker(tipPattern.data.cards)
                end
            else
                print("opTipPatterns is nil")
            end
            ]]

        else
            ---剔除重复的部分
            local oldTable,newTable = self:RemoveTableRepeat(OldSelectedPokerList, p_opCards)
            local set = CardSet.new(newTable)
            local _,_,_,pattern_set = set:hintIterator(othersThrowPokerCP, startPokerNum, locIsMaxPoker, self:Is_black3_player())
            if pattern_set and #pattern_set > 0 then
                local plusTable = self:ArrayPlus(oldTable, pattern_set[1].cards)
                self:unSelectedAllPoker()
                self:UpPoker(plusTable)
            end
            --[[
            local opTipPatterns = set:getHintIterators(othersThrowPokerCP, startPokerNum, locIsMaxPoker, self:Is_black3_player())
            if opTipPatterns then
                local tipPattern = self:GetBestPattern(opTipPatterns,isFirstPattern)
                if tipPattern then
                    local plusTable = self:ArrayPlus(oldTable, tipPattern.data.cards)
                    self:unSelectedAllPoker()
                    self:UpPoker(plusTable)
                end
            end
            ]]
        end
    end

    self:CheckSelectPokerRule()
end

---pokersType 0炸弹 1单牌  2 对子  3连对  4三带二  5顺子 6飞机
---根据罗老师提示  第一次滑动提示
function TableRunfastLogic:GetBestPattern(patterns,isFirstPattern)
    ---按牌型数量排列选取数量最多的牌型 3带默认数量为5
    if patterns == nil then
        return nil
    end
    local myPatterns = {} ---自己封装的牌型列表 data:patterns[i]  pokersType  pokerNum
    if #patterns == 0 then
        return self:GetMyPatternData(patterns)
    else
        for i = 1, #patterns do
            table.insert(myPatterns, self:GetMyPatternData(patterns[i]))
        end
    end

    if isFirstPattern then ---首发才排序  压牌不排序
    ---按数量大排序->按牌型大排序->按牌型值小排序
    table.sort(myPatterns, function(a,b)
        if a.pokerNum == b.pokerNum then
            if a.pokersType == b.pokersType then
                return a.data.value < b.data.value
            else
                return a.pokersType > b.pokersType
            end
        else
            return a.pokerNum > b.pokerNum
        end
    end)
    end

    return myPatterns[1]
end

---封装自己的牌型数据
function TableRunfastLogic:GetMyPatternData(pattern)
    local myPattern = {}
    local curNum = 0
    local curType = 0
    myPattern.data = pattern
    curType = pattern.type
    if(curType==1) then --单牌和顺子
        curNum = pattern.card_cnt
        if curNum == 1 then
            myPattern.pokersType = 1
        else
            myPattern.pokersType = 5
        end
    elseif curType == 2 then --对子和连对
        curNum = 2*pattern.repeat_cnt
        if curNum == 2 then
            myPattern.pokersType = 2
        else
            myPattern.pokersType = 3
        end
    elseif curType == 3 then --所有三带都算5张 飞机就是多个三带
        curNum = 5*pattern.repeat_cnt
        if curNum == 5 then
            myPattern.pokersType = 4
        else
            myPattern.pokersType = 6
        end
    elseif curType == 4 or curType == 5 then --4炸弹 5 4带3  炸弹牌型不提示包括4带3
        curNum = 0
        myPattern.pokersType = 0
    end
    myPattern.pokerNum = curNum
    return myPattern
end

---去掉两个数组重复的对象 即反选
function TableRunfastLogic:RemoveTableRepeat(tableA,tableB)
    local findIndex = function(t, value)
        for i=1,#t do
            if t[i] == value then
                return i
            end
        end
        return -1
    end

    if tableA and #tableA>0 then
        for i=#tableA,1,-1 do
            local index = findIndex(tableB,tableA[i])
            if index>0 then
                table.remove(tableB, index)
                table.remove(tableA, i)
            end
        end
    end
    return tableA,tableB
end

---两个数组相加
function TableRunfastLogic:ArrayPlus(tableA,tableB)
    local result = {}
    if tableA and #tableA>0 then
        for i=1,#tableA do
            table.insert(result, tableA[i])
        end
    end

    local contain = function(value)
        for i=1,#result do
            if result[i] == value then
                return true
            end
        end
        return false
    end
    if tableB and #tableB>0 then
        for i=1,#tableB do
            if contain( tableB[i]) == false then
                table.insert(result, tableB[i])
            end
        end
    end
    return result
end

------不选择牌
function TableRunfastLogic:unSelectedAllPoker()
    self.DragPokerCount = 0 
    self.TableRunfastView.seatHolderArray[1].selectedPokersArray = {}
    local cardsArray = self.TableRunfastView.seatHolderArray[1].inhandCardsArray--牌槽
    for i = 1, #cardsArray do
        cardsArray[i].selected = false
        if (cardsArray[i].isThrowed or cardsArray[i].isHide) then
        else
            self.TableRunfastView:refreshCardSelect(cardsArray[i])
        end
    end
    self:CheckSelectPokerRule()
end

------出牌准备阶段
function TableRunfastLogic:onReadyThrowCard()
    --1.0检查是否在等待
    if (self.IsWaitDiscardreply) then
        return
    end

    --1.1检查是否有数据
    self:AllowPlayerAction(false)
    local numList = self:GetSelectedPokerList()
    if (numList == nil or #numList <= 0) then
        if (GameSDKInterface:GetPlatformName() == "WindowsEditor") then
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("你没有选择任何牌")
        end
        self:AllowPlayerAction(true)
        return
    end

    self:ResetClickCount()

    --print("--1.2检查首发必须包含黑桃3")
    local mustThrowNum = self:GetMustThrowNum()
    if (mustThrowNum) then
        print("====必出牌=" .. tostring(mustThrowNum))
        if (not self.TableRunfastHelper:IsNumTableContains(numList, mustThrowNum)) then
            if (mustThrowNum == self:GetHeiTao3RepresentativeNum()) then
                ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("首发必须包含黑桃3")
            end
            self:unSelectedAllPoker()
            self:AllowPlayerAction(true)
            return
        end
    end

    --print("--2.0发送数据")
    numList = self:PokerListSort(numList)
    self.TableRunfastModel:request_discardInfo(numList, self.modelData.curTableData.roomInfo.discard_serial_no)

    --3.把牌打出去
    self:FirstThrowPoker()
    self:throwPokerType(numList, true)
    self:SetDoingState(false)
    self:AllowPlayerAction(true,0.4)

    --4.0等待服务器回应
    self.IsWaitDiscardreply = true
    self.WaitDiscardreplyEventId = self.TableRunfastModule:subscibe_time_event(3, false, 0):OnComplete(function(t)
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("等待超时,重新连接")
        TableManagerPoker:heartbeat_timeout_reconnect_game_server()
    end).id
end

function TableRunfastLogic:PokerListSort(numList)
    if (numList == nil or #numList <= 0) then
        return numList
    end

    local boolsandaier = false
    local pt = CardPattern.new(numList, #numList, false)--出牌的类型
    if (pt ~= nil) then
        if (pt.disp_type == "sandaier" or pt.disp_type == "feiji") then
            boolsandaier = true
        end
    end

    if (boolsandaier) then
        local tableSanZhang = {}
        local tableLiangZhang = {}
        local tableDanZhang = {}
        local card_type_stat, card_name_info, card_name_stat = CardCommon.InitParse(numList)
        --[[
		print("=============card_type_stat")
		print_table(card_type_stat)
		print("=============card_name_info")
		print_table(card_name_info)
		print("=============card_name_stat")
		print_table(card_name_stat)
		]]

        for i = 1, #card_name_info do
            local card_name_info_Table = card_name_info[i]
            if (card_name_info_Table ~= nil ) then
                if (#card_name_info_Table == 3) then
                    --三个的
                    for m = 1, #card_name_info_Table do
                        --print("====3card_name_info_Table[m]="..tostring(card_name_info_Table[m]))
                        table.insert(tableSanZhang, card_name_info_Table[m])
                    end
                elseif (#card_name_info_Table == 2) then
                    --对子
                    for m = 1, #card_name_info_Table do
                        --print("====card_name_info_Table[m]="..tostring(card_name_info_Table[m]))
                        table.insert(tableLiangZhang, card_name_info_Table[m])
                    end
                else
                    --单牌
                    for m = 1, #card_name_info_Table do
                        table.insert(tableDanZhang, card_name_info_Table[m])
                    end
                end
            end
        end
        --把两张的加入
        for i = 1, #tableLiangZhang do
            table.insert(tableSanZhang, tableLiangZhang[i])
        end
        --把单张的加入
        CardCommon.Sort(tableDanZhang)
        for i = 1, #tableDanZhang do
            table.insert(tableSanZhang, tableDanZhang[i])
        end
        return tableSanZhang
    else
        CardCommon.Sort(numList)
    end
    return numList
end
--获取选中的牌
function TableRunfastLogic:GetSelectedPokerList()
    return self:GetMoveUpPokerList()
end
--获取拉上去的牌
function TableRunfastLogic:GetMoveUpPokerList()
    local resultNumList = {}
    local pokerSlotTable = self.TableRunfastView.seatHolderArray[1].inhandCardsArray
    --print("====GetMoveUpPokerList")
    for i = 1, #pokerSlotTable do
        local cardHolder = pokerSlotTable[i]--牌槽
        if (cardHolder.cardRoot.transform.localPosition.y > 5) then
            if (cardHolder.poker and cardHolder.poker.PokerNum) then
                table.insert(resultNumList, cardHolder.poker.PokerNum)
            end
        end
    end
    --print("====#resultNumList="..tostring(#resultNumList))
    --print_table(resultNumList)
    return resultNumList
end

------重置第一人称出牌的扑克
function TableRunfastLogic:ResetFirstThrowPoker()
    local FirstThrowPokerSlotArray = self.TableRunfastView.FirstThrowPokerSlotArray
    for i = 1, #FirstThrowPokerSlotArray do
        local FirstThrowPokerSlot = FirstThrowPokerSlotArray[i]
        ModuleCache.ComponentUtil.SafeSetActive(FirstThrowPokerSlot.PrefabGo, false)
    end
end

------第一人称出牌的扑克
function TableRunfastLogic:FirstThrowPoker(ThrowPokerList)
    local selectedPokersArray = ThrowPokerList or self.TableRunfastView.seatHolderArray[1].selectedPokersArray or {}--已经选了的牌
    if (selectedPokersArray == nil or #selectedPokersArray <= 0) then
        return
    end

    --重置出牌的槽
    self:ResetFirstThrowPoker()
    --出牌的动画
    local FirstThrowPokerSlotArray = self.TableRunfastView.FirstThrowPokerSlotArray
    local resultNumList = ThrowPokerList or self:GetSelectedPokerList()
    resultNumList = self:PokerListSort(resultNumList)
    for i = 1, #resultNumList do
        local FirstThrowPokerSlot = FirstThrowPokerSlotArray[i]
        FirstThrowPokerSlot.FaceImage.sprite = self.TableRunfastHelper:GetPokerSprite(resultNumList[i], nil)
        ModuleCache.ComponentUtil.SafeSetActive(FirstThrowPokerSlot.PrefabGo, true)
        local locOffestY = -200
        self.TableRunfastHelper:PlayMoveYAnim(FirstThrowPokerSlot.FaceImage, locOffestY, 0, 0.1)
    end

    -- --隐藏你手中已经出过的牌
    local cardsArray = self.TableRunfastView.seatHolderArray[1].inhandCardsArray--牌槽
    for i = 1, #cardsArray do
        for m = 1, #selectedPokersArray do
            if (cardsArray[i].poker == selectedPokersArray[m]) then
                cardsArray[i].isThrowed = true
                cardsArray[i].isHide = true
                cardsArray[i].selected = false
                ModuleCache.ComponentUtil.SafeSetActive(cardsArray[i].cardRoot.transform.parent.transform.gameObject, false)
            end
        end
    end

    --没有选中任何牌
    self:unSelectedAllPoker()
end

------重置牌槽
function TableRunfastLogic:ResetPokerSlot()
    local cardsArray = self.TableRunfastView.seatHolderArray[1].inhandCardsArray--牌槽
    for i = 1, #cardsArray do
        cardsArray[i].isThrowed = false--已经扔出去
        cardsArray[i].selected = false--已经选择
        cardsArray[i].isHide = false--是否隐藏
        cardsArray[i].isDarkness = false--是否变灰暗
        self.TableRunfastHelper:enableGradientColor(cardsArray[i], false)
        cardsArray[i].cardRoot.transform.localPosition = ModuleCache.CustomerUtil.ConvertVector3(0, 0, 0)
        ModuleCache.ComponentUtil.SafeSetActive(cardsArray[i].cardRoot.transform.gameObject, true)
        ModuleCache.ComponentUtil.SafeSetActive(cardsArray[i].cardRoot.transform.parent.transform.gameObject, false)
    end
end


--等待自动点击要不起和后面的行为操作
function TableRunfastLogic:WaitNotAffordAndAction()
    if (self:IsJinBiChangAndIntrust()) then
        return
    end

    if (not self:IsAllowPass()) then--必压的玩法,由服务器去自动判断能不能要的起
        return
    end

    self.IsWaitOnClickNotAfford = true
    local serial_no = self.modelData.curTableData.roomInfo.discard_serial_no
    self.WaitNotAffordAndActionId = self.TableRunfastModule:subscibe_time_event(self.NotAffordWaitTime, false, 0):OnComplete(function(t)
        self:onClickNotAfford(serial_no)
    end).id
end

function TableRunfastLogic:IsAllowPass()
    --print("==是否可以过牌")
    local Rule = self.modelData.curTableData.roomInfo.createRoomRule
    if (Rule and (not Rule.allow_pass)) then
        return false
    end
    return true
end

------初始化要不起等待的时间
function TableRunfastLogic:InitiNotAffordWaitTime()
    self.NotAffordWaitTime = 0.6
    local curRule = self.modelData.curTableData.roomInfo.createRoomRule
    if (curRule ~= nil) then
        if (curRule.allow_pass) then
            self.NotAffordWaitTime = 5
        elseif (curRule.playerCount == 2) then
            self.NotAffordWaitTime = 1.2
        end
    end
end
------点击要不起
function TableRunfastLogic:onClickNotAfford(serial_no_local)
    if (self:IsJinBiChangAndIntrust()) then
        return
    end
    self:ResetClickCount()

    local clientClickMethod = serial_no_local and "自动" or "手动"
    self.IsWaitOnClickNotAfford = nil
    serial_no_local = serial_no_local or self.modelData.curTableData.roomInfo.discard_serial_no
    self.TableRunfastModel:request_discardInfo(nil, serial_no_local, clientClickMethod)    --发送请求
    self:SetDoingState(false)
    if (self.WaitNotAffordAndActionId) then
        CSmartTimer:Kill(self.WaitNotAffordAndActionId)
        self.WaitNotAffordAndActionId = nil
    end
end

------点击要不起的效果
function TableRunfastLogic:NotAffordEffect()
    local currThrowId = tonumber(self.modelData.curTableData.roomInfo.curThorwCardPlayerId)
    local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
    for i = 1, #seatInfoList do
        local seatInfo = seatInfoList[i]
        local seatInfoPlayerId = tonumber(seatInfo.playerId)
        if (seatInfoPlayerId == currThrowId) then
            local seatHolder = self.TableRunfastView.seatHolderArray[seatInfo.localSeatIndex]
            if (seatHolder and seatHolder.NotAffordEffectRoot ) then
                self.TableRunfastHelper:PlayScaleAnim(seatHolder.NotAffordEffectRoot.gameObject, 0, 1, 0.1)
                TableSound:PlaySound_NotAfford(self:GetPlayerIsMaleByPlayerId(seatInfo.playerId))
            end
            return
        end
    end
end

function TableRunfastLogic:initTableSeatDataMy(data)
    self.isDataInited = true
    self:InitiTempSeatInfoList()
    self.modelData.curTableData = self.modelData.curTableData or {}
    local roomInfo = self.modelData.curTableData.roomInfo or {}
    self.modelData.curTableData = {}
    --local roomInfo = {}
    roomInfo.roomNum = data.room_id   --房间号码
    roomInfo.roomType = 1 ---= remoteRoomInfo.ruleType--规则类型
    roomInfo.totalRoundCount = data.game_total_cnt
    roomInfo.curRoundNum = data.game_loop_cnt
    roomInfo.maxPlayerCount = data.max_player_cnt
    roomInfo.next_player_id = data.next_player_id
    roomInfo.timestamp = data.time
    roomInfo.is_opening_cards = data.is_opening_cards or false
    roomInfo.black3_player = data.black3_player
    roomInfo.discard_serial_no = data.discard_serial_no
    roomInfo.CurTip = ""
    roomInfo.feeNum = data.feeNum
    roomInfo.baseCoinScore = data.baseCoinScore or 0
    roomInfo.gamePhaseState = data.gamePhaseState
    roomInfo.roomTitle = data.roomTitle
    roomInfo.matchInfo = data.matchInfo
    roomInfo.goldFieldId = data.goldFieldId
    roomInfo.tableType = data.tableType
    roomInfo.minEnterGoldNum = data.minEnterGoldNum
    roomInfo.maxEnterGoldNum = data.maxEnterGoldNum

    roomInfo.timeOffset = data.time - os.time()
    if (roomInfo.roundStarted == nil or roomInfo.roundStarted == false) then
        roomInfo.roundStarted = data.cards and #data.cards > 0
    end
    --roomInfo.gamePhaseState = 1
    self.modelData.curTableData.roomInfo = roomInfo

    --房间的规则

    local RuleJsonString = nil
    local RuleTable = nil
    if (self.modelData.roleData and self.modelData.roleData.myRoomSeatInfo and self.modelData.roleData.myRoomSeatInfo.Rule) then
        RuleJsonString = self.modelData.roleData.myRoomSeatInfo.Rule
    end
    if(RuleJsonString == nil or RuleJsonString == "") then
        RuleJsonString = TableManager.RunfastRuleJsonString
    end
    if(RuleJsonString == nil or RuleJsonString == "") then
        print("error====致命错误:没有规则json")
    else
        RuleTable = ModuleCache.Json.decode(RuleJsonString)
        if(self.TableRunfastView:isJinBiChang()) then
            if(RuleTable.GameType == "pdk_3" or RuleTable.game_type == "pdk_3" or RuleTable.GameType == "pdk_2" or RuleTable.game_type == "pdk_2") then
                RuleTable.GameType = 2
                RuleTable.game_type = 2
                RuleJsonString = ModuleCache.Json.encode(RuleTable)
            end
        end
        print("==房间规则=" .. tostring(RuleJsonString))
        self.TableRunfastHelper:CheckRule(RuleTable)

        CardCommon.InitConf(RuleTable)
        roomInfo.CurTip = TableManager:GetCurTip(RuleTable.game_type)
    end
    roomInfo.CurRuleJsonString = RuleJsonString
    roomInfo.CurRuleTable = RuleTable
    roomInfo.createRoomRule = RuleTable
    CardLogic.initRule(RuleTable)

    --跑得快金币场,好友场湖南跑得快启用优化提示
    if(self.TableRunfastView:isFriendTable()) then
        self.IsUserChenZhuoTiShi = false
    else
        self.IsUserChenZhuoTiShi = true
    end
    --self.IsUserChenZhuoTiShi = true


    self:InitiNotAffordWaitTime()--初始化要不起等待的时间


    --缓存座位信息
    local remoteSeatInfoList = data.players
    local seatInfoList = {}
    local seatCount = #remoteSeatInfoList
    for i = 1, #remoteSeatInfoList do
        local remoteSeatInfo = remoteSeatInfoList[i]
        local seatInfo = {}
        seatInfo.seatIndex = remoteSeatInfo.player_pos
        seatInfo.playerId = tostring(remoteSeatInfo.player_id or 0)
        seatInfo.player_id = remoteSeatInfo.player_id or 0
        seatInfo.isSeated = self:getBoolState(remoteSeatInfo.player_id)--判断座位上是否有玩家
        seatInfo.isCreator = (self:getBoolState(remoteSeatInfo.is_owner))--是否是房主
        seatInfo.isReady = (self:getBoolState(remoteSeatInfo.is_ready))--是否已准备
        seatInfo.score = (remoteSeatInfo.score) or 0  --玩家房间内积分
        seatInfo.winTimes = remoteSeatInfo.win_cnt --玩家房间内赢得次数
        seatInfo.isOffline = remoteSeatInfo.is_offline --玩家是否掉线
        seatInfo.is_single = remoteSeatInfo.is_single
        seatInfo.is_single_soundplayed = remoteSeatInfo.is_single

        seatInfo.enter_cnt = remoteSeatInfo.enter_cnt
        seatInfo.isBreakLineReconnection = seatInfo.enter_cnt > 2--大于2表示断线重连
        seatInfo.rest_card_cnt = remoteSeatInfo.rest_card_cnt
        seatInfo.coinBalance = remoteSeatInfo.coinBalance
        seatInfo.IntrustState = remoteSeatInfo.state
        seatInfo.PlayerMatchInfo = remoteSeatInfo.matchInfo

        local playerInfo = self:GetTempSeatInfoListPlayerInfo(seatInfo.player_id)
        if (playerInfo == nil) then
            --print("=====playerInfo == nil")
        else
            seatInfo.playerInfo = playerInfo
        end

        seatInfo.roomInfo = roomInfo
        table.insert(seatInfoList, seatInfo)
        --绑定玩家到座位
        if (self:getBoolState(remoteSeatInfo.player_id)) then
            --判断是否玩家自己，单独记录自己的座位
            if (tonumber(seatInfo.playerId) == tonumber(self.modelData.curTablePlayerId)) then
                roomInfo.mySeatInfo = seatInfo
                seatInfo.isOffline = false
            end
        end
    end

    self:resetSeatHolderArray(roomInfo.maxPlayerCount)
    if (roomInfo.curRoundNum <= 0) then
        self:OnlyTwoPlayerHandlerThirdSeatShow()
    end

    local mySeatIndex = roomInfo.mySeatInfo.seatIndex
    local seatInfoListCount = #seatInfoList
    for i = 1, seatInfoListCount do
        local seatInfo = seatInfoList[i]
        --转换为本地位置索引
        seatInfo.localSeatIndex = self.TableRunfastHelper:getLocalIndexFromRemoteSeatIndex(seatInfo.seatIndex, mySeatIndex, roomInfo.maxPlayerCount)
        --print("本地坐标=localSeatIndex="..seatInfo.localSeatIndex.." 玩家坐标="..seatInfo.seatIndex)
    end

    roomInfo.seatInfoList = seatInfoList

    --记录上局的数据
    self.modelData.curTableData.roomInfo.next_player_id = data.next_player_id
    self.modelData.curTableData.roomInfo.curThorwCardPlayerId = data.desk_player_id
    local myId = tonumber(self.modelData.curTableData.roomInfo.mySeatInfo.playerId)
    local currThrowId = tonumber(self.modelData.curTableData.roomInfo.curThorwCardPlayerId)
    self.modelData.curTableData.roomInfo.curPokerTable = {}
    self.modelData.curTableData.roomInfo.my_desk_cards = {}
    if (data.desk_cards ~= nil and #data.desk_cards > 0) then
        if (currThrowId ~= myId) then
            self.TableRunfastHelper:NumTableInsertToNewTable(self.modelData.curTableData.roomInfo.curPokerTable, data.desk_cards)
        elseif (not self:nextPlayerIsMy()) then
            self.TableRunfastHelper:NumTableInsertToNewTable(self.modelData.curTableData.roomInfo.my_desk_cards, data.desk_cards)
        end
    end

    if (data.desk_player_id <= 0 and #data.desk_cards <= 0) then
        --新的开局
        self.modelData.curTableData.roomInfo.mySeatInfo.is_first_pattern = self:nextPlayerIsMy()
    else
        --重连
        if (self:nextPlayerIsMy()) then
            self.modelData.curTableData.roomInfo.mySeatInfo.is_first_pattern = (currThrowId == myId)
        else
            self.modelData.curTableData.roomInfo.mySeatInfo.is_first_pattern = false
        end
    end
    --print("==检查是否是自己首发 "..tostring(self.modelData.curTableData.roomInfo.mySeatInfo.is_first_pattern))

    self.TableRunfastModule:subscibe_time_event(3, false, 0):OnComplete(function(t)
        self:ResetBreakLineReconnection()
    end)

    self.TableRunfastView:CheckLayoutUI(self.modelData.curTableData.roomInfo.createRoomRule)
    self.TableRunfastView:InitFriendsCirclePreventCheatingState()
end

------发牌我的牌
function TableRunfastLogic:MyCards(data)
    local set = CardSet.new(data.cards)
    CardCommon.Sort(set.cards)
    local numList = set.cards--data.cards--手上的扑克牌
    local roomInfo = self.modelData.curTableData.roomInfo--房间信息
    roomInfo.state = RoomState.waitResult--房间状态
    local mySeatInfo = roomInfo.mySeatInfo--我的座位信息
    self:ResetPokerSlot()
    mySeatInfo.inHandPokerList = {}--填充我的手牌信息
    mySeatInfo.inHandPokerNumList = numList
    for i = 1, #numList do
        local locPokerTable = self.TableRunfastHelper:NumberToPokerTable(numList[i])
        table.insert(mySeatInfo.inHandPokerList, locPokerTable)
    end
    mySeatInfo.InMyHandPokerNumTable = data.cards

    --给其他玩家手牌填充假的数据
    local seatInfoList = roomInfo.seatInfoList
    for i = 1, #seatInfoList do
        local seatInfo = seatInfoList[i]
        if (seatInfo.isSeated and seatInfo.isReady) then
            if (seatInfo ~= mySeatInfo) then
                seatInfo.inHandPokerList = {}
                if (self.TableRunfastView.isPlayBacking) then
                    --回放模式
                    local locPlayId = seatInfo.playerId
                    local inHandData = self.TableRunfastModule:PB_GetHandDataByPlayerId(locPlayId)
                    if (inHandData ~= nil) then
                        local locSet = CardSet.new(inHandData.cards)
                        CardCommon.Sort(locSet.cards)
                        inHandData.cards = locSet.cards

                        for i = 1, #inHandData.cards do
                            local locCardNum = inHandData.cards[i]
                            local locPokerTable = self.TableRunfastHelper:NumberToPokerTable(locCardNum)
                            table.insert(seatInfo.inHandPokerList, locPokerTable)
                        end
                        print_table(seatInfo.inHandPokerList)
                    end
                else
                    --正常打牌模式
                    for i = 1, #mySeatInfo.inHandPokerList do
                        local poker = {}
                        poker.colour = "S"
                        poker.number = "A"
                        table.insert(seatInfo.inHandPokerList, poker)
                    end
                end

            end

            self.TableRunfastView:refreshSeat(seatInfo, false)--不分自己还是其他玩家
            if (seatInfo == mySeatInfo) then
                if (roomInfo.IsNewRoundMsg) then
                    self:MySelfStartFaPai()
                else
                    self:refreshMyHandPokerListBySeverData(mySeatInfo.InMyHandPokerNumTable)
                end
            end
            local onFinish = nil
            if (seatInfo == mySeatInfo) then
                onFinish = function()
                    self.TableRunfastView:refreshSeatCardsSelect(mySeatInfo)
                end
            end
            self:SetMyPokerFace()
        end
    end

    if (not roomInfo.IsFaPaiDoing) then
        self:MyCardsCheckDoingRoot()
    else
        self.TableRunfastModule:subscibe_time_event(3, false, 0):OnComplete(function(t)
            self:MyCardsCheckDoingRoot()
        end)
    end
end

function TableRunfastLogic:MyCardsCheckDoingRoot()
    --谁出牌的操作按钮
    local boolShowDoingRoot = self:nextPlayerIsMy() and (not self.TableRunfastView.isPlayBacking)
    self:SetDoingState(boolShowDoingRoot)
end

------是首局
function TableRunfastLogic:IsFirstRound()
    local curRoundNum = self.modelData.curTableData.roomInfo.curRoundNum
    return curRoundNum and curRoundNum == 1
end

--获取黑桃3代表的数字
function TableRunfastLogic:GetHeiTao3RepresentativeNum()
    return TableData.HeiTao3RepresentativeNum
end

------手上的扑克牌是否包含黑桃3
function TableRunfastLogic:IsContainsHeiTao3(numList)
    local heitao3 = self:GetHeiTao3RepresentativeNum()
    for i = 1, #numList do
        if (numList[i] and numList[i] == heitao3) then
            return true
        end
    end
    return false
end

--获取必出牌:3人或4人玩法首局首发必出黑桃3数字代号是
function TableRunfastLogic:GetMustThrowNum()
    if (self:IsFirstMustBlack3()) then
        local roomInfo = self.modelData.curTableData.roomInfo
        local InMyHandPokerNumTable = roomInfo.mySeatInfo.InMyHandPokerNumTable
        --没出过牌,并且手中有黑桃3
        if (roomInfo.CurRuleTable.init_card_cnt == #InMyHandPokerNumTable
                and self:IsContainsHeiTao3(InMyHandPokerNumTable)) then
            return self:GetHeiTao3RepresentativeNum()
        end
    end
    return nil
end

function TableRunfastLogic:Is_black3_player(black3_player, playerId)
    black3_player = black3_player or self.modelData.curTableData.roomInfo.black3_player
    playerId = playerId or tonumber(self.modelData.curTableData.roomInfo.mySeatInfo.playerId)
    --print("==black3_player="..tostring(black3_player).." playerId="..tostring(playerId))
    return black3_player == playerId
end

--检查我的下家是否报单
function TableRunfastLogic:myNextPlayerIsSingle()
    local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
    for i = 1, #seatInfoList do
        local seatInfo = seatInfoList[i]
        if (seatInfo ~= nil and seatInfo.localSeatIndex == 2) then
            return seatInfo.is_single
        end
    end
    return false
end

------下一个出牌是我吗
function TableRunfastLogic:nextPlayerIsMy()
    local myId = tonumber(self.modelData.curTableData.roomInfo.mySeatInfo.playerId)
    local nextId = tonumber(self.modelData.curTableData.roomInfo.next_player_id)
    return myId == nextId
end

------设置自己手中的扑克牌为正面
function TableRunfastLogic:SetMyPokerFace()
    local inMyHandCards = self.modelData.curTableData.roomInfo.mySeatInfo.inHandPokerList
    local pokerSlotList = self.TableRunfastView.seatHolderArray[1].inhandCardsArray
    for i = 1, #pokerSlotList do
        local pokerSlot = pokerSlotList[i]
        if (i <= #inMyHandCards ) then
            self.TableRunfastHelper:showCardFace(pokerSlot)
        else
            pokerSlot.isThrowed = true
            pokerSlot.isHide = true
        end
    end
end

function TableRunfastLogic:setCardInfo2(PokerSlot, num)
    local PokerTable = self.TableRunfastHelper:NumberToPokerTable(num)
    local sprite = self.TableRunfastView.cardAssetHolder:FindSpriteByName(PokerTable.SpriteName)
    local  locImage = GetComponentWithPath(PokerSlot.gameObject, "face", ComponentTypeName.Image)
    locImage.sprite = sprite
end

------点击提示:isHeiTao3黑桃3开局提示,isFirst下一个出牌的玩家是否首发
function TableRunfastLogic:onClickHint()
    local roomInfo = self.modelData.curTableData.roomInfo
    self:unSelectedAllPoker()
    local myHandPokerNumTable = roomInfo.mySeatInfo.InMyHandPokerNumTable--我手上的牌
    local othersPokerNumTable = roomInfo.curPokerTable--别人打的牌

    --陈卓写的提示
    if(self.IsUserChenZhuoTiShi) then
        self.ClickHintBtnCount = (self.ClickHintBtnCount or 0) + 1
        local p_mustPokerNum = nil
        local p_outcard = nil
        local p_IsMaxPoker = self:IsMustThrowMaxPoker()
        local MyselfIsBlack3Player = false
        local OutCardIsBlack3Player = false
        if(self:IsFirstMustBlack3()) then
            MyselfIsBlack3Player = self:Is_black3_player()
            if(p_outcard and #p_outcard > 0) then
                local lastThrowPokerPlayerId = roomInfo.lastThrowPokerPlayerId or roomInfo.curThorwCardPlayerId
                OutCardIsBlack3Player = self:Is_black3_player(nil, tonumber(lastThrowPokerPlayerId))
            end
        end

        local ruleTable = roomInfo.createRoomRule
        local locIsFirstPattern = roomInfo.mySeatInfo.is_first_pattern
        if(locIsFirstPattern and ruleTable.init_card_cnt == #myHandPokerNumTable) then
            --print("1====这里是开局首发,要考虑黑桃3")
            if(self:IsContainsHeiTao3(myHandPokerNumTable) and ruleTable.first_must_black3) then
                p_mustPokerNum = self:GetMustThrowNum()
                --print("1====这里说明出牌必须包含黑桃3")
            end
        elseif(locIsFirstPattern == true) then
            --print("1====这里是你打牌过程中的首发")
        else
            --print("1====这里是你接牌")
            p_outcard = othersPokerNumTable
        end

        local tishiTable = CardLogic.tishi(myHandPokerNumTable,p_mustPokerNum,p_outcard,nil,nil,p_IsMaxPoker,MyselfIsBlack3Player,OutCardIsBlack3Player)
        if(self:CheckTableIsNilOrEmpty(tishiTable)) then
            --print("onClickHint======点击提示反馈:要不起")
            self:onClickNotAfford()
        else
            --print("onClickHint======点击提示反馈:要得起")
            if(self.ClickHintBtnCount > #tishiTable) then
                self.ClickHintBtnCount = 1
            end
            local UpPokerNumList = tishiTable[self.ClickHintBtnCount]
            --print_table(tishiTable)
            --print_table(UpPokerNumList)
            --print("====将提示的牌拖出来")
            self:UpPoker(UpPokerNumList)
            self.TableRunfastModule:ClearMyAllPokerGradientColor()
        end
        return
    end


    --旧的提示
    if (self.myfn == nil) then
        --print("onClickHint====myfn初始化")
        local locIsMaxPoker = self:IsMustThrowMaxPoker()
        local locIsFirstRound = self:IsFirstRound()
        local ruleTable = roomInfo.createRoomRule
        local locIsContainsHeiTao3 = ruleTable.black3_on_firstloop and self:IsContainsHeiTao3(myHandPokerNumTable)
        local locIsFirstPattern = roomInfo.mySeatInfo.is_first_pattern

        local set = CardSet.new(myHandPokerNumTable)
        local othersThrowPokerCP = nil
        local startPokerNum = nil
        if (locIsFirstRound and locIsContainsHeiTao3 and ruleTable.init_card_cnt == #myHandPokerNumTable ) then
            --print("onClickHint====开局黑桃3")
            othersThrowPokerCP = nil
            startPokerNum = self:GetMustThrowNum()
        elseif (locIsFirstPattern == true) then
            --print("onClickHint====别人要不起自己首发")
            othersThrowPokerCP = nil
        else
            --print("onClickHint====检查是否接的上牌")
            local locPlayId = roomInfo.lastThrowPokerPlayerId or roomInfo.curThorwCardPlayerId
            print("locPlayId", locPlayId)
            othersThrowPokerCP = CardPattern.new(othersPokerNumTable, #othersPokerNumTable, self:Is_black3_player(nil, tonumber(locPlayId)))
            if (othersThrowPokerCP == nil) then
                --print("====别人打的牌异常")
            else
                --print("last patttern", othersThrowPokerCP.type, othersThrowPokerCP.value, othersThrowPokerCP.disp_type, self:Is_black3_player(nil, tonumber(self.modelData.curTableData.roomInfo.curThorwCardPlayerId)) )
            end
        end
        self.myfn = set:hintIterator(othersThrowPokerCP, startPokerNum, locIsMaxPoker, self:Is_black3_player())
    end

    if (self:CheckTableIsNilOrEmpty(myHandPokerNumTable)) then
        --print("onClickHint==自己手上没有牌")
    end
    if (self:CheckTableIsNilOrEmpty(othersPokerNumTable)) then
        --print("onClickHint==上家没出牌")
    end

    if (self.myfn == nil) then
        --print("onClickHint======点击提示反馈:要不起")
        self:onClickNotAfford()
    else
        --print("onClickHint======点击提示反馈:要得起")
        local pt = self.myfn()
        self:UpPoker(pt.cards)--将牌拖出来
    end
end

--最后一手强制自动出牌,lastThrowPokerTable最后一手你要强制出的牌
function TableRunfastLogic:LastForceThrowPoker(lastThrowPokerTable)
    if (self:IsJinBiChangAndIntrust()) then
        return
    end

    self.TableRunfastView:SetNotAllowActionMaskLastPokerAutoState(true)
    self:unSelectedAllPoker()
    --延迟
    self.TableRunfastModule:subscibe_time_event(0.5, false, 0):OnComplete(function(t)
        self.TableRunfastView:SetNotAllowActionMaskLastPokerAutoState(true)
        self:unSelectedAllPoker()
        self:UpPoker(lastThrowPokerTable)
        self:onReadyThrowCard()
        self.TableRunfastView:SetNotAllowActionMaskLastPokerAutoState(false, 1.5)
    end)
end

------将提示的牌点出来
function TableRunfastLogic:UpPoker(pokerNumTable)
    if (pokerNumTable == nil or #pokerNumTable <= 0) then
        return
    end

    local cardsArray = self.TableRunfastView.seatHolderArray[1].inhandCardsArray--手上所有的牌
    for i = 1, #pokerNumTable do
        local locPokerNum = pokerNumTable[i]--提示的牌的数字
        for m = 1, #cardsArray do
            if (cardsArray[m].isHide or cardsArray[m].isThrowed or cardsArray[m].poker == nil) then
                --已经打出的牌
            else
                local cardNum = cardsArray[m].poker.PokerNum
                if (cardNum == locPokerNum) then
                    self:onClickPoker(cardsArray[m].cardRoot)
                end
            end
        end
    end
end

--通过名字寻找poker
function TableRunfastLogic:FindPokerByName(pokerName)
    local cardsArray = self.TableRunfastView.seatHolderArray[1].inhandCardsArray--手上所有的牌
    for i = 1, #cardsArray do
        if (cardsArray[i] and cardsArray[i].cardRoot) then
            if (cardsArray[i].cardRoot.transform.parent.name == pokerName) then
                return cardsArray[i]
            end
        end
    end
    return nil
end

------初始化上家出的牌
function TableRunfastLogic:initCurThorwPoker()
    local myId = tonumber(self.modelData.curTableData.roomInfo.mySeatInfo.playerId)--我的id
    local locPlayId = tonumber(self.modelData.curTableData.roomInfo.curThorwCardPlayerId)--上个出牌的id
    local next_player_id = tonumber(self.modelData.curTableData.roomInfo.next_player_id) --下一个出牌的id
    local locPokerTable = self.modelData.curTableData.roomInfo.curPokerTable--上手牌
    if (locPlayId == nil or locPlayId == 0 or locPlayId == "0" or locPlayId == next_player_id or #locPokerTable <= 0 or myId == locPlayId) then
        --后面新增:断线重连后,显示自己出过的牌
        if (myId == locPlayId and not self:nextPlayerIsMy()) then
            if (#self.modelData.curTableData.roomInfo.my_desk_cards > 0) then
                self:ResetFirstThrowPoker()
                local FirstThrowPokerSlotArray = self.TableRunfastView.FirstThrowPokerSlotArray
                local resultNumList = self.modelData.curTableData.roomInfo.my_desk_cards
                resultNumList = self:PokerListSort(resultNumList)
                for i = 1, #resultNumList do
                    local FirstThrowPokerSlot = FirstThrowPokerSlotArray[i]
                    FirstThrowPokerSlot.FaceImage.sprite = self.TableRunfastHelper:GetPokerSprite(resultNumList[i], nil)
                    ModuleCache.ComponentUtil.SafeSetActive(FirstThrowPokerSlot.PrefabGo, true)
                    self.TableRunfastHelper:PlayMoveYAnim(FirstThrowPokerSlot.FaceImage, 0, 0, 0)
                end
                self.modelData.curTableData.roomInfo.my_desk_cards = {}
            end
        end
        return
    else
        local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
        local seatInfo = self.TableRunfastHelper:getSeatInfoByPlayerId(locPlayId, seatInfoList)
        locPokerTable = self:PokerListSort(locPokerTable)
        self:otherThrowCards(seatInfo, locPokerTable)
    end
end

------通过玩家ID获取本地下标
function TableRunfastLogic:getLocalSeatIndex(playId)
    local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
    for i = 1, #seatInfoList do
        local seatInfo = seatInfoList[i]
        if (seatInfo ~= nil and tonumber(seatInfo.playerId) == playId) then
            return seatInfo.localSeatIndex
        end
    end
    return nil
end

------出牌特效
function TableRunfastLogic:PlayThrowPokerEffect(localSeatIndex, effectName,ThrowPokerCount)

    local effectRoot = nil
    local seatHolder = self.TableRunfastView.seatHolderArray[localSeatIndex]
    if (seatHolder ~= nil) then
        if (effectName == "shunzi") then
            effectRoot = seatHolder.EffectType.Effect_Shunzi
        elseif (effectName == "sandaiyi") then
            effectRoot = seatHolder.EffectType.Effect_Sandaiyi
        elseif (effectName == "sandaier") then
            effectRoot = seatHolder.EffectType.Effect_Sandaier
        elseif (effectName == "liandui") then
            effectRoot = seatHolder.EffectType.Effect_Liandui
        elseif (effectName == "feiji") then
            effectRoot = seatHolder.EffectType.Effect_Feiji
        elseif (effectName == "zhadan") then
            effectRoot = seatHolder.EffectType.Effect_Zhadan
        end
    end

    if (effectRoot ~= nil) then
        if(localSeatIndex > 1) then
            local offX = 260
            local everyX = 20
            if(ThrowPokerCount <= 4) then
                offX = 260
            else
                offX = offX + (ThrowPokerCount - 4) * everyX
            end

            if(localSeatIndex == 2) then
                offX = -1 * offX
            end

            local tempPos = seatHolder.EffectRoot.transform.transform.localPosition
            tempPos.x = offX
            seatHolder.EffectRoot.transform.transform.localPosition = tempPos
        end

        ModuleCache.ComponentUtil.SafeSetActive(effectRoot.gameObject, false)
        ModuleCache.ComponentUtil.SafeSetActive(effectRoot.gameObject, true)
        local waitTime = 2
        if (effectRoot == seatHolder.EffectType.Effect_Feiji) then
            waitTime = 1.2
        end

        self.TableRunfastModule:subscibe_time_event(waitTime, false, 0):OnComplete(function(t)
            ModuleCache.ComponentUtil.SafeSetActive(effectRoot.gameObject, false)
        end)
    end
end

------是否允许玩家操作,WaitTimeAutoRecover等待时间自动恢复
function TableRunfastLogic:AllowPlayerAction(boolAllowAction, delayTime)
    self.TableRunfastView:SetNotAllowActionMaskState(not boolAllowAction, delayTime)
end

------重置报单的数据
function TableRunfastLogic:ResetSingle()
    local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
    for i = 1, #seatInfoList do
        local seatInfo = seatInfoList[i]
        if (seatInfo ~= nil) then
            seatInfo.is_single = false
            seatInfo.is_single_soundplayed = false
            if (seatInfo.localSeatIndex ~= 1) then
                local seatHolder = self.TableRunfastView.seatHolderArray[seatInfo.localSeatIndex]
                if (seatHolder ~= nil) then
                    ModuleCache.ComponentUtil.SafeSetActive(seatHolder.Warning.gameObject, false)
                    ModuleCache.ComponentUtil.SafeSetActive(seatHolder.RemainPokerRoot.gameObject, false)
                end
            end
        end
    end
end

------通过玩家id获取玩家是否是男性
function TableRunfastLogic:GetPlayerIsMaleByPlayerId(_PlayerId)
    local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
    for i = 1, #seatInfoList do
        local seatInfo = seatInfoList[i]
        if (seatInfo ~= nil) then
            if (tostring(seatInfo.playerId) == tostring(_PlayerId)) then
                return seatInfo.playerInfo ~= nil and seatInfo.playerInfo.gender == 1
            end
        end
    end
    return false
end

------收到包:客户自定义的信息变化广播
function TableRunfastLogic:on_table_CustomInfoChangeBroadcast(data)
    --print("==on_table_CustomInfoChangeBroadcast")
    --print_table(data.customInfoList)
    if (self.modelData == nil or self.modelData.curTableData == nil
            or self.modelData.curTableData.roomInfo == nil
            or self.modelData.curTableData.roomInfo.seatInfoList == nil) then
        return
    end
    if (data == nil or data.customInfoList == nil or #data.customInfoList <= 0) then
        return
    end
    for i = 1, #data.customInfoList do
        local player_id = data.customInfoList[i].player_id
        local customInfo = data.customInfoList[i].customInfo
        if (customInfo == nil or customInfo == "") then
            print("==customInfo == nil or customInfo ==")
        else
            local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
            for m = 1, #seatInfoList do
                local seatInfo = seatInfoList[m]
                if (tostring(seatInfo.playerId) == tostring(player_id)) then
                    local locTable = ModuleCache.Json.decode(customInfo)
                    if (seatInfo.playerInfo == nil) then
                        print("====seatInfo.playerInfo == nil")
                    else
                        --print("==ip="..locTable.ip.."  address="..locTable.address)
                        --seatInfo.playerInfo.ip = locTable.ip
                        seatInfo.playerInfo.locationData = seatInfo.playerInfo.locationData or {}
                        seatInfo.playerInfo.locationData.address = locTable.address
                        seatInfo.playerInfo.locationData.gpsInfo = locTable.gpsInfo
                    end
                end
            end
        end
    end

    self:CheckLocation()
end

------检查位置
function TableRunfastLogic:CheckLocation()
    if (self.TableRunfastView:isJinBiChang() or self.TableRunfastView:isMatchTable()) then
        ModuleCache.ComponentUtil.SafeSetActive(self.TableRunfastView.BtnLocation.gameObject, false)
        return
    end
    local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
    --获取玩家信息列表
    local playerInfoList = TableManagerPoker:getPlayerInfoList(seatInfoList)
    -- 是否显示定位图标
    TableManagerPoker:isShowLocation(playerInfoList, self.TableRunfastView.BtnLocation)


    self:CheckOpen_tablelocation()
end

function TableRunfastLogic:CheckOpen_tablelocation()
    local roomInfo = self.modelData.curTableData.roomInfo
    if(not roomInfo.is_opening_cards) then
        return
    end
    if(roomInfo.curRoundNum and roomInfo.curRoundNum > 1) then
        return
    end
    local seatInfoList = roomInfo.seatInfoList
    if(#seatInfoList < 3) then
        return
    end

    local data ={}
    data.gameType = BranchPackageName
    data.seatHolderArray = seatInfoList

    data.roomID = roomInfo.roomNum
    data.tableCount = roomInfo.maxPlayerCount
    data.isPlay = true
    data.isShowLocation = false
    print("====自动打开定位功能界面")
    ModuleCache.ModuleManager.show_module("public", "tablelocation",data);
end

------检查是否中途退出这局游戏
function TableRunfastLogic:CheckIsDroppedOutThisRoundGame()
    return self.modelData.curTableData.roomInfo.curRoundNum > 0 and self.modelData.curTableData.roomInfo.totalRoundCount ~= self.modelData.curTableData.roomInfo.curRoundNum
end

------自动准备
function TableRunfastLogic:AutoReady()
    -- print("---------------------------------------------------1.1只有还没开始前才能自动开始")
    if (self.modelData.curTableData.roomInfo.curRoundNum <= 0) then
        --print("1.2   >=3人玩法都自动开始")

        --self.modelData.roleData.RoomType == 2 快速组局
        if self.modelData.roleData.RoomType == 2 then
            self.TableRunfastView:refreshAllBtnState()
            return
        end

        if (self.modelData.curTableData.roomInfo.maxPlayerCount >= 3) then
            if (not self.modelData.curTableData.roomInfo.mySeatInfo.isReady) then
                --print("====AutoReady3")
                self.TableRunfastModel:request_ready()
                self:SetKickBtnShowState(false)
                return
            end
        else
            --print("1.3  2人玩法房主不自动准备")
            local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
            if (#seatInfoList == 2) then
                ModuleCache.ComponentUtil.SafeSetActive(self.TableRunfastView.ButtonInviteFriendDray.gameObject, true)
            elseif (#seatInfoList == 1) then
                ModuleCache.ComponentUtil.SafeSetActive(self.TableRunfastView.ButtonInviteFriendDray.gameObject, false)
            end
            if (self.modelData.curTableData.roomInfo.mySeatInfo.isCreator) then
                --房主不自动准备
                if (#seatInfoList == 2) then
                    ModuleCache.ComponentUtil.SafeSetActive(self.TableRunfastView.ButtonLeave.gameObject, false)
                    ModuleCache.ComponentUtil.SafeSetActive(self.TableRunfastView.buttonReady.gameObject, true)
                elseif (#seatInfoList == 1) then
                    ModuleCache.ComponentUtil.SafeSetActive(self.TableRunfastView.ButtonLeave.gameObject, true)
                    ModuleCache.ComponentUtil.SafeSetActive(self.TableRunfastView.buttonReady.gameObject, false)
                end
                self:SetKickBtnShowState(true)
            else
                self.TableRunfastModel:request_ready()
                return
            end
        end
    end
end

function TableRunfastLogic:ClickButtonReadyAction()
    if (self.modelData.curTableData.roomInfo.maxPlayerCount <= 2) then
        local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
        if (#seatInfoList <= 1) then
            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("等待其他玩家进入房间")
            return
        end

        local myseatInfo = self.modelData.curTableData.roomInfo.mySeatInfo
        for i = 1, #seatInfoList do
            local seatInfo = seatInfoList[i]
            if (seatInfo ~= nil) then
                if (myseatInfo == seatInfo) then
                    --自己不管
                else
                    if (seatInfo.isReady) then
                        self.TableRunfastModel:request_ready()
                    else
                        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("等待其他玩家先准备")
                    end
                end
            end
        end
    end
end

function TableRunfastLogic:SetKickBtnShowState(_isShow)
    local myIsCreator = self.modelData.curTableData.roomInfo.mySeatInfo.isCreator
    if (not myIsCreator
            or self.modelData.curTableData.roomInfo.curRoundNum > 0
            or self.modelData.curTableData.roomInfo.maxPlayerCount >= 3
            or self.modelData.roleData.RoomType == 2 --RoomType == 2为快速组局，快速组局没有踢人功能
            or self.modelData.roleData.RoomType == 3--RoomType == 3为比赛场，没有踢人
    ) then
        _isShow = false
    end

    local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
    for i = 1, #seatInfoList do
        local seatInfo = seatInfoList[i]
        if (seatInfo ~= nil) then
            local localSeatIndex = seatInfo.localSeatIndex
            local seatHolder = self.TableRunfastView.seatHolderArray[localSeatIndex]
            if (localSeatIndex == 2) then
                ModuleCache.ComponentUtil.SafeSetActive(seatHolder.KickBtn.gameObject, _isShow)
            else
                ModuleCache.ComponentUtil.SafeSetActive(seatHolder.KickBtn.gameObject, false)
            end
        end
    end
end

function TableRunfastLogic:OnClickKickBtn(_PlayerId)
    self.TableRunfastModel:request_KickPlayerReq(_PlayerId)
end

------检查是否有玩家离线
function TableRunfastLogic:CheckIsHavePlayerOffline()
    local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
    for i = 1, #seatInfoList do
        local seatInfo = seatInfoList[i]
        if (seatInfo ~= nil and seatInfo.isOffline) then
            return true
        end
    end
    return false
end

------只有两个玩家时处理第三个玩家的座位显示
function TableRunfastLogic:OnlyTwoPlayerHandlerThirdSeatShow()
    if (self.modelData.curTableData.roomInfo.maxPlayerCount >= 3) then
        return
    end

    local seatHolder = self.TableRunfastView.seatHolderArray[3]
    ModuleCache.ComponentUtil.SafeSetActive(seatHolder.NotSeatRoot.gameObject, false)
    ModuleCache.ComponentUtil.SafeSetActive(seatHolder.ThirdSeatShow, true)
    if (self.modelData.curTableData.roomInfo.createRoomRule ~= nil) then
        local ruleTable = self.modelData.curTableData.roomInfo.createRoomRule
        seatHolder.ThirdSeatShowText.text = string.format( "剩余:%d张", ruleTable.init_card_cnt)
    end
end

function TableRunfastLogic:ResetAllPlayerReadyState()
    local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
    for i = 1, #seatInfoList do
        local seatInfo = seatInfoList[i]
        if (seatInfo ~= nil) then
            seatInfo.isReady = false
        end
    end
end

function TableRunfastLogic:RefreshReadyBtn()
    local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
    for i = 1, #seatInfoList do
        local seatInfo = seatInfoList[i]
        if (seatInfo ~= nil) then
            local localSeatIndex = seatInfo.localSeatIndex
            local seatHolder = self.TableRunfastView.seatHolderArray[localSeatIndex]
            ModuleCache.ComponentUtil.SafeSetActive(seatHolder.imageReady.gameObject, seatInfo.isReady)
        end
    end

    --收到准备广播 刷新所以按钮状态
    self.TableRunfastView:refreshAllBtnState()
end

function TableRunfastLogic:ResetBreakLineReconnection()
    local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
    for i = 1, #seatInfoList do
        local seatInfo = seatInfoList[i]
        if (seatInfo ~= nil) then
            seatInfo.isBreakLineReconnection = false
        end
    end
end

function TableRunfastLogic:IsBreakLineReconnectionByPlayerId(_PlayerId)
    local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
    for i = 1, #seatInfoList do
        local seatInfo = seatInfoList[i]
        if (seatInfo ~= nil) then
            if (tostring(seatInfo.playerId) == tostring(_PlayerId)) then
                return seatInfo.isBreakLineReconnection
            end
        end
    end
end

--通过服务器刷新我手中的牌
function TableRunfastLogic:refreshMyHandPokerListBySeverData(myHandPokerTableFromSever)

    local myHandPokerNumTable = myHandPokerTableFromSever
    if (myHandPokerNumTable == nil or #myHandPokerNumTable <= 0) then
        myHandPokerNumTable = self.modelData.curTableData.roomInfo.mySeatInfo.InMyHandPokerNumTable --我手上的牌
    end

    if (myHandPokerNumTable == nil or #myHandPokerNumTable <= 0) then
        print("==error自己手上没有牌,牌局结束了")
        self:ResetPokerSlot()
        return
    end

    --1.1排序
    local set = CardSet.new(myHandPokerNumTable)
    CardCommon.Sort(set.cards)
    myHandPokerNumTable = set.cards

    --1.2设置数据
    local pokerSlotTable = self.TableRunfastView.seatHolderArray[1].inhandCardsArray--牌的预设
    for i = 1, #pokerSlotTable do
        local cardHolder = pokerSlotTable[i]--牌槽
        if (i <= #myHandPokerNumTable) then
            local locPokerTable = self.TableRunfastHelper:NumberToPokerTable(myHandPokerNumTable[i])
            self.TableRunfastHelper:setCardInfo(cardHolder, locPokerTable)
            cardHolder.isThrowed = false
            cardHolder.isHide = false
            cardHolder.isDarkness = false
            cardHolder.cardRoot.transform.localPosition = ModuleCache.CustomerUtil.ConvertVector3(0, 0, 0)
        else
            cardHolder.isThrowed = true
            cardHolder.isHide = true
            cardHolder.isDarkness = true
            cardHolder.cardRoot.transform.localPosition = ModuleCache.CustomerUtil.ConvertVector3(0, 0, 0)
        end
        cardHolder.selected = false
        self.TableRunfastHelper:enableGradientColor(cardHolder, cardHolder.isDarkness)
        ModuleCache.ComponentUtil.SafeSetActive(cardHolder.cardRoot.transform.parent.transform.gameObject, not cardHolder.isHide)
    end
end


--设置自己手上的牌变灰暗
function TableRunfastLogic:SetMyInHandPokerDarkness(_boolDarkness)
    local InMyHandPoker = self.TableRunfastView.seatHolderArray[1].inhandCardsArray--手上所有的牌
    for i = 1, #InMyHandPoker do
        local locPoker = InMyHandPoker[i]
        if (locPoker == nil or locPoker.isThrowed or locPoker.isHide) then
            --这些牌不用管了
        else
            locPoker.isDarkness = _boolDarkness
            self.TableRunfastHelper:enableGradientColor(locPoker, _boolDarkness)
        end
    end
end

--检查选择的牌型规则,是否可以将牌打出去
function TableRunfastLogic:CheckSelectPokerRule()
    if (not self:nextPlayerIsMy()) then
        return
    end
    local roomInfo = self.modelData.curTableData.roomInfo
    self.TableRunfastView:SetBtnNotAffordState(not roomInfo.mySeatInfo.is_first_pattern)


    --print("==1.1检查是否有选牌")
    local selectedPokerList = self:GetSelectedPokerList()
    if (selectedPokerList == nil or #selectedPokerList <= 0) then
        --print("====你没有选择牌!")
        self.TableRunfastView:SetBtnThrowCardState(false)
        return
    end

    --print("==1.2检查牌型是否符合出牌规则")
    local myHandPokerNumTable = roomInfo.mySeatInfo.InMyHandPokerNumTable
    if (myHandPokerNumTable == nil or #myHandPokerNumTable <= 0) then
        self:ResetPokerSlot()
        print("==error自己手上没有牌,牌局结束了")
        return
    end
    if (#selectedPokerList > #myHandPokerNumTable) then
        --print("====error 你选择要出的牌大于你上手的牌=")
        ModuleCache.GameSDKInterface:BuglyPrintLog(5, "==error 你选择要出的牌的数量大于你上手的牌的数量")
        TableManagerPoker:heartbeat_timeout_reconnect_game_server()
        return
    end
    local mySelectedPokerCP = CardPattern.new(selectedPokerList, #myHandPokerNumTable, self:Is_black3_player())
    if (mySelectedPokerCP == nil) then
        --print("====你选择的牌不符合出牌规则!")
        self.TableRunfastView:SetBtnThrowCardState(false)
        return
    end
    --print("==1.3检查下家是否报单,报单要出最大牌")
    if (self:myNextPlayerIsSingle()) then
        local RuleTable = roomInfo.createRoomRule
        print("====下家报单,检查放走包赔RuleTable.pay_all=", RuleTable.pay_all)
        if (#selectedPokerList == 1 and RuleTable.pay_all == false) then
            local single_wrong = self:CheckSingle_wrong(myHandPokerNumTable, mySelectedPokerCP)
            --print("=======single_wrong="..tostring(single_wrong))
            if (single_wrong) then
                self.TableRunfastView:SetBtnThrowCardState(false)
                return
            end
        end
    end

    --print("==检查是否必出黑桃3")
    if (self.TableRunfastView:isJinBiChang()
            and roomInfo.createRoomRule.black3_on_firstloop
            and roomInfo.createRoomRule.init_card_cnt == #myHandPokerNumTable) then
        local locIsContainsHeiTao3 = self:IsContainsHeiTao3(myHandPokerNumTable)
        local MySelcetIsHeiTao3 = self:IsContainsHeiTao3(selectedPokerList)
        if (locIsContainsHeiTao3 and not MySelcetIsHeiTao3) then
            self.TableRunfastView:SetBtnThrowCardState(false)
            return
        end
    end
    if (roomInfo.createRoomRule.init_card_cnt == #myHandPokerNumTable) then
        --print("=====没有出过牌")
        if (self:IsFirstMustBlack3()) then
            --print("=====当前必须带黑桃3")
            local locIsContainsHeiTao3 = self:IsContainsHeiTao3(myHandPokerNumTable)
            local MySelcetIsHeiTao3 = self:IsContainsHeiTao3(selectedPokerList)
            if (locIsContainsHeiTao3 and not MySelcetIsHeiTao3) then
                self.TableRunfastView:SetBtnThrowCardState(false)
                return
            end
        end
    end

    --print("==1.3检查是否首发,如果是首发就不需要进行下一步判断了")
    if (roomInfo.mySeatInfo.is_first_pattern) then
        self.TableRunfastView:SetBtnThrowCardState(true)
        return
    end

    --print("==1.4检查接牌时能否大的起别人的牌")
    --print("==1.4.1检查别人打的牌")
    local pokerNumTable = roomInfo.curPokerTable--别人打的牌
    if (pokerNumTable == nil or #pokerNumTable <= 0 ) then
        print("==error别人打的牌数据为空")
        self.TableRunfastView:SetBtnThrowCardState(true)
        ModuleCache.GameSDKInterface:BuglyPrintLog(5, "==error别人打的牌数据为空")
        return
    end
    --print("==1.4.1检查别人打的牌是否是符合牌型")
    local throwPokerCP = CardPattern.new(pokerNumTable, #pokerNumTable, self:Is_black3_player(nil, tonumber(roomInfo.curThorwCardPlayerId)))
    if (throwPokerCP == nil) then
        local pokerNumTableJsonStr = "==error检查别人打的牌不符合牌型,别人打的牌=" .. ModuleCache.Json.encode(pokerNumTable)
        ModuleCache.GameSDKInterface:BuglyPrintLog(5, pokerNumTableJsonStr)
        TableManagerPoker:heartbeat_timeout_reconnect_game_server()
        return
    end
    if (mySelectedPokerCP:compable(throwPokerCP) and not mySelectedPokerCP:le(throwPokerCP)) then
        --这里你可以打起别人,可以显示按钮
    else
        --print("====你的牌打不起别人")
        self.TableRunfastView:SetBtnThrowCardState(false)
        return
    end

    --print("==1.5最后你可以点击出牌按钮")
    self.TableRunfastView:SetBtnThrowCardState(true)
end

--检查报单的提醒
function TableRunfastLogic:CheckSingle_wrong(myHandPokerNumTable, mySelectedPokerCP)
    local single_wrong = false
    for _, c in ipairs(myHandPokerNumTable) do
        local cm = CardCommon.NameIdx2Value(c)
        if (cm > mySelectedPokerCP.value) then
            single_wrong = true;
            break;
        end
    end
    return single_wrong
end

function TableRunfastLogic:SetDoingState(boolShowDoing)
    self.TableRunfastView:SetDoingState(boolShowDoing)
    if (boolShowDoing) then
        self:CheckSelectPokerRule()
    end
end

function TableRunfastLogic:SeatInfoListRemoveDataByPlayerId(_PlayerId)
    local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
    for i = 1, #seatInfoList do
        local seatInfo = seatInfoList[i]
        if (seatInfo ~= nil) then
            if (tonumber(seatInfo.playerId) == tonumber(_PlayerId)) then
                table.remove(seatInfoList, i)
                return
            end
        else
            table.remove(seatInfoList, i)
        end
    end
end

function TableRunfastLogic:InitiTempSeatInfoList()
    if (self.tempSeatInfoList == nil) then
        if (self.modelData ~= nil
                and self.modelData.curTableData ~= nil
                and self.modelData.curTableData.roomInfo ~= nil
                and self.modelData.curTableData.roomInfo.seatInfoList ~= nil) then
            self.tempSeatInfoList = {}
            local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
            for i = 1, #seatInfoList do
                table.insert(self.tempSeatInfoList, seatInfoList[i])
            end
        end
    end

    self.TableRunfastModule:subscibe_time_event(1, false, 0):OnComplete(function(t)
        self.tempSeatInfoList = nil
    end)
end

function TableRunfastLogic:GetTempSeatInfoListPlayerInfo(_PlayerId)
    local seatInfoList = self.tempSeatInfoList
    if (seatInfoList == nil or #seatInfoList <= 0) then
        return nil
    end

    for i = 1, #seatInfoList do
        local seatInfo = seatInfoList[i]
        if (seatInfo ~= nil) then
            if (tonumber(seatInfo.playerId) == tonumber(_PlayerId)) then
                return seatInfo.playerInfo
            end
        end
    end

    return nil
end

--检查炸弹,是否要飞的效果
function TableRunfastLogic:CheckZhaDanFlyScore(data)
    if (data.next_player_discard_bomb and data.is_first_pattern) then
        --    if(data.is_first_pattern) then
        local curRoomRule = self.modelData.curTableData.roomInfo.createRoomRule
        local Multiple = 10
        local BaseScore = self.TableRunfastView:GetBaseScore()
        print("====BaseScore", BaseScore)
        local locThrowZhaDanPlayerId = data.next_player_id--self.ThrowZhaDanPlayerId
        local fromPosTable = {}
        local targetPos = nil
        local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
        for i = 1, #seatInfoList do
            local seatInfo = seatInfoList[i]
            if (seatInfo ~= nil) then
                local seatHolder = self.TableRunfastView.seatHolderArray[seatInfo.localSeatIndex]
                if (locThrowZhaDanPlayerId == tonumber(seatInfo.playerId)) then
                    --加分的玩家
                    --print("加分的玩家="..tostring(seatInfo.playerId))
                    targetPos = seatHolder.imagePlayerHead.transform.position
                    local scoreVar = (Multiple * BaseScore * (curRoomRule.playerCount - 1))
                    print("====加分", scoreVar)
                    if (self.TableRunfastView:isGoldSettle()) then
                        --金币结算服务器会通知客户端刷新余额,客户端只需要飘分就行,飘的分不能超过玩家的余额
                    else
                        seatInfo.score = seatInfo.score + scoreVar
                        self:ZhaDanPiaoFen(seatHolder, true, scoreVar)
                    end
                    ModuleCache.ComponentUtil.SafeSetActive(seatHolder.ZhaDanEffectPread, false)
                    self.TableRunfastModule:subscibe_time_event(1, false, 0):OnComplete(function(t)
                        self.TableRunfastHelper:PlayScaleAnim(seatHolder.ZhaDanEffectPread, 1, 1.3, 0.6, 0.6)
                    end)
                else
                    --减分的玩家
                    --print("减分的玩家="..tostring(seatInfo.playerId))
                    local fromPos = seatHolder.imagePlayerHead.transform.position
                    table.insert( fromPosTable, fromPos)
                    local scoreVar = Multiple * BaseScore
                    if (self.TableRunfastView:isGoldSettle()) then

                    else
                        seatInfo.score = seatInfo.score - scoreVar
                        self:ZhaDanPiaoFen(seatHolder, false, scoreVar)
                    end
                    print("====减分", scoreVar)
                end
                self.TableRunfastModule:subscibe_time_event(1, false, 0):OnComplete(function(t)
                    self.TableRunfastView:RefreshSeatInfoCurrency(seatInfo)
                end)
            end
        end

        --飞金币
        if (fromPosTable ~= nil and #fromPosTable > 0 and targetPos ~= nil) then
            local len = 10
            local cloneObj = self.TableRunfastView.ZhaDanScorePrefab
            local parentObj = self.TableRunfastView.ZhaDanScoreRoot
            local duration = 0.6
            local delayTime = nil
            local autoDestory = true
            for i = 1, #fromPosTable do
                local fromPos = fromPosTable[i]
                self.TableRunfastHelper:FlyToTarget(len, cloneObj, parentObj, fromPos, targetPos, duration, delayTime, autoDestory)
            end
            TableSound:PlaySound_FlyGold()
        end
    end
end


function TableRunfastLogic:ZhaDanPiaoFen(seatHolder, isAdd, scoreCount, WaitTime)
    --print("====炸弹飘分的效果")
    WaitTime = WaitTime or 0.8
    self.TableRunfastModule:subscibe_time_event(WaitTime, false, 0):OnComplete(function(t)
        ModuleCache.ComponentUtil.SafeSetActive(seatHolder.PiaoFenRoot.gameObject, true)
        ModuleCache.ComponentUtil.SafeSetActive(seatHolder.PiaoFenWinText.gameObject, isAdd)
        ModuleCache.ComponentUtil.SafeSetActive(seatHolder.PiaoFenLostText.gameObject, not isAdd)
        if (isAdd) then
            seatHolder.PiaoFenWinText.text = "+" .. tostring(scoreCount)
        else
            seatHolder.PiaoFenLostText.text = "-" .. tostring(scoreCount)
        end
        self.TableRunfastHelper:PlayMoveYAnim(seatHolder.PiaoFenAnimRoot,0, 100, 0.5, 1.5)
    end)
end

--是否别人断线重连
function TableRunfastLogic:IsOtherBreakLineReconnection(breakLineReconnectionPlayerId, myId)
    if (breakLineReconnectionPlayerId ~= nil) then
        return breakLineReconnectionPlayerId ~= myId
    end
    return false
end

--是否必须出最大牌
function TableRunfastLogic:IsMustThrowMaxPoker()
    return self:myNextPlayerIsSingle()
end

--滑牌提示
function TableRunfastLogic:DragHint()
    -- print("=========DragHint=")
    local upList = self:GetMoveUpPokerList()
    -- print_table(upList)
    if (#upList > 5) then
        self.myfn = nil
        local myHandPokerNumTable = upList
        local pokerNumTable = self.modelData.curTableData.roomInfo.curPokerTable
        local locIsMaxPoker = false
        local locIsFirstRound = self:IsFirstRound()
        local ruleTable = self.modelData.curTableData.roomInfo.createRoomRule
        local locIsContainsHeiTao3 = ruleTable.black3_on_firstloop and self:IsContainsHeiTao3(myHandPokerNumTable)
        local locIsFirstPattern = self.modelData.curTableData.roomInfo.mySeatInfo.is_first_pattern
        local set = CardSet.new(myHandPokerNumTable)
        local othersThrowPokerCP = nil
        local startPokerNum = self:GetMustThrowNum()
        if (locIsFirstRound and locIsContainsHeiTao3) then
            print("onClickHint====开局黑桃3")
            othersThrowPokerCP = nil
        elseif (locIsFirstPattern == true) then
            print("onClickHint====别人要不起自己首发")
            othersThrowPokerCP = nil
        else
            print("onClickHint====检查是否接的上牌")
            local locPlayId = self.modelData.curTableData.roomInfo.lastThrowPokerPlayerId or self.modelData.curTableData.roomInfo.curThorwCardPlayerId
            --print("locPlayId", locPlayId)
            othersThrowPokerCP = CardPattern.new(pokerNumTable, #pokerNumTable, self:Is_black3_player(nil, tonumber(locPlayId)))
            if (othersThrowPokerCP == nil) then
                print("====别人打的牌异常")
            else
                print("last patttern", othersThrowPokerCP.type, othersThrowPokerCP.value, othersThrowPokerCP.disp_type, self:Is_black3_player(nil, tonumber(self.modelData.curTableData.roomInfo.curThorwCardPlayerId)) )
            end
        end
        self.myfn = set:hintIterator(othersThrowPokerCP, startPokerNum, locIsMaxPoker, self:Is_black3_player())
        if (self.myfn == nil) then
        else
            print("======11111111")
            self:unSelectedAllPoker()
            local pt = self.myfn()
            self:UpPoker(pt.cards)--将牌拖出来
        end
    end
end

function TableRunfastLogic:CurRoundIsBlack3First()
    --print("--当局是否黑桃3玩家先出")
    local roomInfo = self.modelData.curTableData.roomInfo
    if (roomInfo.CurRuleTable) then
        if (roomInfo.CurRuleTable.playerCount <= 2) then
            return false
        elseif (roomInfo.CurRuleTable.every_round_black3_first) then
            --金币场每局都是黑桃3玩家先出牌,后台必须配置every_round_black3_first = true
            return true
        else
            --好友场,比赛场:第一局没有赢家,所以第一局是黑桃3玩家先出牌,就规定第一手出牌必须带黑桃3,后面每局都是赢家先出牌,可以不带黑桃3
            --必须配置 every_round_black3_first = false
            if (roomInfo.curRoundNum == 1) then
                return true
            end
        end
    else
        print("error====没有规则字段请检查问题")
    end
    return false
end

-- 黑桃三先出算炸弹
function TableRunfastLogic:IsFirstMustBlack3()
    --print("--先出必带黑桃三")
    return self:CurRoundIsBlack3First() and self.modelData.curTableData.roomInfo.CurRuleTable.first_must_black3
end

function TableRunfastLogic:CheckHeiTao3Fly()
    --print("--黑桃三飞向先出玩家")
    local roomInfo = self.modelData.curTableData.roomInfo
    if (roomInfo.is_opening_cards) then
        if (self:CurRoundIsBlack3First()) then
            local HeiTao3FlyPlayerId = roomInfo.HeiTao3FlyPlayerId
            local seatInfo = self.TableRunfastHelper:getSeatInfoByPlayerId(HeiTao3FlyPlayerId, roomInfo.seatInfoList)
            if (seatInfo) then
                if (seatInfo ~= roomInfo.mySeatInfo) then
                    print("=============黑桃三先出玩家id=", seatInfo.playerId)
                    self.TableRunfastView:PlayHeiTao3Anim(seatInfo, function()
                        roomInfo.HeiTao3FlyPlayerId = nil
                        roomInfo.IsNewRoundMsg = nil
                    end)
                end
            end
        end
    end
end

function TableRunfastLogic:OneShotSettleNotify(data)
    print("====OneShotSettleNotify")
    if not self.modelData.curTableData or not self.modelData.curTableData.roomInfo then
        return
    end

    local is_bomb_settle = data.reason == "bomb_settle"--因为炸弹刷新分数
    if (data.players ~= nil and #data.players > 0) then
        local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
        for i = 1, #data.players do
            local locData = data.players[i]
            if (locData) then
                local seatInfo = self.TableRunfastHelper:getSeatInfoByPlayerId(locData.player_id, seatInfoList)
                if (seatInfo) then
                    seatInfo.coinBalance = locData.coinBalance
                    self.TableRunfastView:RefreshSeatInfoCurrency(seatInfo)
                    if(is_bomb_settle) then
                        local seatHolder = self.TableRunfastView:GetSeatHolderBySeatInfo(seatInfo)
                        if(seatHolder) then
                            local coin = locData.coin
                            self:ZhaDanPiaoFen(seatHolder,coin > 0, math.abs(coin))
                        end
                    end
                end
            end
        end
    end
end

function TableRunfastLogic:IntrustRsp(data)
    print("====IntrustRsp托管回应")
    local mySeatInfo = self.modelData.curTableData.roomInfo.mySeatInfo
    mySeatInfo.IntrustState = data.status
    self.TableRunfastView:SetCancelIntrustState(mySeatInfo.IntrustState == 1)
    if (mySeatInfo.IntrustState == 0) then
        print("====刚刚取消托管状态")
        self.IsJustCancelIntrust = true
    end
end

function TableRunfastLogic:IntrustNotify(data)
    --print("====IntrustNotify托管通知")
    --ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("托管通知")
    local roomInfo = self.modelData.curTableData.roomInfo
    local seatInfo = self.TableRunfastHelper:getSeatInfoByPlayerId(data.player_id, roomInfo.seatInfoList)
    if (seatInfo == nil) then
        print("warning====seatInfo == nil ")
    else
        seatInfo.IntrustState = data.status
        if (seatInfo == roomInfo.mySeatInfo) then
            self.TableRunfastView:SetCancelIntrustState(seatInfo.IntrustState == 1)
        end
    end
end

function TableRunfastLogic:IsMatchTableAndIntrust()
    return self.TableRunfastView:isMatchTable() and self:MySelfIsIntrust()
end

function TableRunfastLogic:IsJinBiChangAndIntrust( ... )
    return self.TableRunfastView:isJinBiChang() and self:MySelfIsIntrust()
end

function TableRunfastLogic:MySelfIsIntrust()
    --print("====我是否是托管状态")
    return self.modelData.curTableData.roomInfo.mySeatInfo.IntrustState == 1
end

function TableRunfastLogic:CheckIntrust()
    if (self.TableRunfastView:isJinBiChang() or self.TableRunfastView:isMatchTable()) then
        --print("====检查托管状态",self:MySelfIsIntrust())
        self.TableRunfastView:SetCancelIntrustState(self:MySelfIsIntrust())
    end
end

function TableRunfastLogic:TimeoutNotify(data)
    --print("===========测试TimeoutNotify玩家id:"..data.player_id .. " 时间:"..data.timeout)
    --ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("测试TimeoutNotify玩家id:"..data.player_id .. "时间:"..data.timeout)
    if (self.modelData.curTableData == nil) then
        return
    end

    if (data.timeout == nil or data.timeout <= 0) then
        data.timeout = 0
        return
    end
    local roomInfo = self.modelData.curTableData.roomInfo
    local timeOverIsAutoHide = false
    --if(data.event == nil or data.event == 0) then
    --	-- print("--准备")
    --elseif(data.event == 1) then
    --	-- print("--等待出牌，超时托管")
    --	timeOverIsAutoHide = true
    --elseif(data.event == 2) then
    --	-- print("--等待充值，超时破产  ")
    --else
    --	-- self:StopAllPlayerClockTimeDown(true)
    --end
    local seatInfo = self.TableRunfastHelper:getSeatInfoByPlayerId(data.player_id, roomInfo.seatInfoList)
    if (seatInfo) then
        self:StartClockTimeDown(seatInfo, data.timeout, timeOverIsAutoHide)
    end
end

function TableRunfastLogic:BankruptGoToHall()
    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("您已破产，将自动返回大厅！")
    self.TableRunfastModule:subscibe_time_event(1, false, 0):OnComplete(function(t)
        self.TableRunfastModule:GoToHall()
    end)
end

function TableRunfastLogic:BankruptNotify(data, isMy)
    print("====BankruptNotify")
    if (isMy or tonumber(data.player_id) == tonumber(self.modelData.curTableData.roomInfo.mySeatInfo.playerId)) then
        self:BankruptGoToHall()
    end
end

function TableRunfastLogic:StartClockTimeDown(seatInfo, time, timeOverIsAutoHide)
    --print("====开始闹钟倒计时","seatInfo.playerId="..tostring(seatInfo.playerId),"time="..tostring(time))
    local seatHolder = self.TableRunfastView:GetSeatHolderBySeatInfo(seatInfo)
    if (seatHolder == nil) then
        return
    end
    self:StopAllPlayerClockTimeDown(true)
    if (time <= 0) then
        return
    end
    ModuleCache.ComponentUtil.SafeSetActive(seatHolder.clockHolder.goClock.gameObject, true)
    self.ClockTimeDownId = self.TableRunfastModule:subscibe_time_event(time, false, 1):OnUpdate( function(t)
        t = t.surplusTimeRound
        seatHolder.clockHolder.textClock.text = t
        if (t <= 3) then
            TableSound:PlaySound_ClockDown()
        end

        if self.modelData.curTableData and self.modelData.curTableData.roomInfo and (self.modelData.curTableData.roomInfo.curAccountData) then
            --结算界面的倒计时
            self.TableRunfastModule:dispatch_package_event("Event_CurrentGameAccountTimeDown", t)
        end
    end)                       :OnComplete( function(t)
        if (timeOverIsAutoHide) then
            ModuleCache.ComponentUtil.SafeSetActive(seatHolder.clockHolder.goClock.gameObject, false)
        end
    end)                       .id
end

function TableRunfastLogic:StopAllPlayerClockTimeDown(IsHideClock)
    if self.ClockTimeDownId then
        CSmartTimer:Kill(self.ClockTimeDownId)
        self.ClockTimeDownId = nil
    end
    if (IsHideClock) then
        self:ResetClockTimeDown()
    end
end

function TableRunfastLogic:RechargeNotify(data)
    print("====Msg_Table_RechargeNotify")
    local roomInfo = self.modelData.curTableData.roomInfo
    local seatInfo = self.TableRunfastHelper:getSeatInfoByPlayerId(data.player_id, roomInfo.seatInfoList)
    self:SetSeatInfoRechargeState(seatInfo, data.open)
end

function TableRunfastLogic:ResetAllSeatInfoRechargeState()
    --print("====重置重置状态")
    local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
    for i = 1, #seatInfoList do
        local seatInfo = seatInfoList[i]
        self:SetSeatInfoRechargeState(seatInfo, false)
    end
end

function TableRunfastLogic:SetSeatInfoRechargeState(seatInfo, show)
    --print("===设置状态")
    if (seatInfo == nil) then
        print("====seatInfo == nil")
    else
        local seatHolder = self.TableRunfastView:GetSeatHolderBySeatInfo(seatInfo)
        if (seatHolder) then
            ModuleCache.ComponentUtil.SafeSetActive(seatHolder.RechargeGoldRoot.gameObject, show)
        end
    end
end

function TableRunfastLogic:GetGameType(gametype)
    if (self.TableRunfastView:isJinBiChang()) then
        return 2
    else
        return gametype
    end
end

function TableRunfastLogic:ResetSeatToNotSeatDown(seatInfo)
    local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
    if (seatInfo == nil) then
    else
        -- print("====没有找到这个玩家,但是被踢了=")
        local seatHolder = self.TableRunfastView:GetSeatHolderBySeatInfo(seatInfo)
        if (seatHolder) then
            ModuleCache.ComponentUtil.SafeSetActive(seatHolder.NotSeatRoot.gameObject, true)
            ModuleCache.ComponentUtil.SafeSetActive(seatHolder.goSeatInfo, false)
            ModuleCache.ComponentUtil.SafeSetActive(seatHolder.RechargeGoldRoot.gameObject, false)
            ModuleCache.ComponentUtil.SafeSetActive(seatHolder.NotAffordEffectRoot, false)
        end
        print("====#seatInfoList", #self.modelData.curTableData.roomInfo.seatInfoList )
        for i = 1, #seatInfoList do
            local locSeatInfo = seatInfoList[i]
            if (locSeatInfo == seatInfo) then
                table.remove(seatInfoList, i)
                break
            end
        end
        print("====#seatInfoList", #self.modelData.curTableData.roomInfo.seatInfoList )

    end
end

function TableRunfastLogic:CardRecorderMsg(data)
    local roomInfo = self.modelData.curTableData.roomInfo
    local seatInfo = self.TableRunfastHelper:getSeatInfoByPlayerId(data.playerId, roomInfo.seatInfoList)
    if (seatInfo == nil) then
        print("error====seatInfo == nil")
    else
        if (data.items and #data.items > 0) then
            self.TableRunfastView:SetRecordPokerCountSlotArrayData(data.items)
        end
        seatInfo.effectiveDuration = data.effectiveDuration
        if (seatInfo.effectiveDuration and seatInfo.effectiveDuration > 0) then
            local locShowTime = self:GetCardRecorderShowTime(seatInfo.effectiveDuration)
            if (locShowTime ~= "") then
                self.TableRunfastView.RecordPokerTimeText.text = locShowTime
            end
        end
    end
end

function TableRunfastLogic:GetCardRecorderShowTime(effectiveDuration)
    -- effectiveDuration = 58
    local result = ""
    local tianshu = math.floor(effectiveDuration / 86400 )
    local xiaoshi = nil
    local fenzhong = nil
    if (tianshu > 0) then
        result = result .. tianshu .. "天"
        xiaoshi = math.floor((effectiveDuration % 86400) / 3600)
        if (xiaoshi > 0) then
            result = result .. xiaoshi .. "小时"
        end
    else
        xiaoshi = math.floor(effectiveDuration / 3600 )
        if (xiaoshi > 0) then
            result = result .. xiaoshi .. "小时"
        end
        fenzhong = math.floor((effectiveDuration % 3600) / 60)
        if (fenzhong > 0) then
            result = result .. fenzhong .. "分钟"
        end
    end
    return result
end

function TableRunfastLogic:IsCardRecorderState(seatInfo)
    return (seatInfo.effectiveDuration and seatInfo.effectiveDuration > 0)
end

function TableRunfastLogic:GetShengYuPokers(initiCards, record_cards)
    --print("initiCards 手上初始的牌,record_cards出牌记录")
    local allCardsTable = cjson.decode(initiCards)--最初手上所有的牌
    local aleardyStepTable = cjson.decode(record_cards)
    for i = 1, 50 do
        local aleardyStep = aleardyStepTable["" .. i]
        if (aleardyStep == nil or aleardyStep == "PASS") then
            --print("没有出牌数据")
        else
            if (#aleardyStep > 0) then
                for k = 1, #aleardyStep do
                    local aleardyNum = aleardyStep[k]
                    if (aleardyNum and aleardyNum > 0) then
                        allCardsTable = self.TableRunfastHelper:NumTableDeleteNum(allCardsTable, aleardyNum)
                    end
                end
            end
        end
    end
    --print("排序后手上剩余的牌")
    local numList = self:PokerListSort(allCardsTable)
    return numList
end

function TableRunfastLogic:SetLightPokersShow(seatInfo, isShow, shengYuPokersTable, isAnim,FrequencyTime)
    print("亮牌显示状态")
    FrequencyTime = FrequencyTime or 0.04
    local seatHolder = self.TableRunfastView:GetSeatHolderBySeatInfo(seatInfo)
    if (seatHolder) then
        ModuleCache.ComponentUtil.SafeSetActive(seatHolder.LightPokersRoot.gameObject, isShow)
        print_table(seatHolder.LightPokersSlotTable)
        for i = 1, #seatHolder.LightPokersSlotTable do
            local PokerSlot = seatHolder.LightPokersSlotTable[i]
            if (isShow) then
                if (i <= #shengYuPokersTable) then
                    PokerSlot.FaceImage.sprite = self.TableRunfastHelper:GetPokerSprite(shengYuPokersTable[i])
                    if (isAnim) then
                        self.LightPokersEventId = self.TableRunfastModule:subscibe_time_event(i * FrequencyTime, false, 0):OnComplete(function(t)
                            ModuleCache.ComponentUtil.SafeSetActive(PokerSlot.PokerGo, true)
                        end).id
                        self.LightPokersEventIdList = self.LightPokersEventIdList or {}
                        table.insert(self.LightPokersEventIdList,self.LightPokersEventId)
                    else
                        ModuleCache.ComponentUtil.SafeSetActive(PokerSlot.PokerGo, true)
                    end
                else
                    ModuleCache.ComponentUtil.SafeSetActive(PokerSlot.PokerGo, false)
                end
            else
                ModuleCache.ComponentUtil.SafeSetActive(PokerSlot.PokerGo, false)
            end
        end
    end
end

function TableRunfastLogic:ClearLightPokers(isClearMyself)
    print("==清理亮牌")
    if(not self.TableRunfastView:isJinBiChang()) then
        return
    end
    if(isClearMyself) then
        self:ResetPokerSlot()
    end

    local seatHolderArray = self.TableRunfastView.seatHolderArray
    for i = 1, #seatHolderArray do
        if(i > 1) then
            local seatHolder = seatHolderArray[i]
            if(seatHolder) then
                ModuleCache.ComponentUtil.SafeSetActive(seatHolder.LightPokersRoot.gameObject, false)
                ModuleCache.ComponentUtil.SafeSetActive(seatHolder.NotAffordEffectRoot.gameObject, false)
            end
        end
    end
end


function TableRunfastLogic:ShowAnnounce(content, loopCount, delayTime)
    delayTime = delayTime or 1
    loopCount = loopCount or 1
    self.TableRunfastView.AnnounceTextContentSizeFitter.enabled = true
    self.TableRunfastView:SetState_Announce(true)
    self.TableRunfastView.AnnounceText.text = content
    local AnnounceTextTransform = self.TableRunfastView.AnnounceText.transform
    AnnounceTextTransform.transform.localPosition = ModuleCache.CustomerUtil.ConvertVector3(1000, 0, 0)
    self.TableRunfastModule:subscibe_time_event(delayTime, false, 0):OnComplete(function(t)
        self.TableRunfastView.AnnounceTextContentSizeFitter.enabled = false
        local TextWidth = self.TableRunfastView.AnnounceTextRectTransform.rect.width
        local StartX = 250 + TextWidth/2
        local TakeTime = StartX * 4 /100
        AnnounceTextTransform.transform.localPosition = ModuleCache.CustomerUtil.ConvertVector3(StartX, 0, 0)
        local sequence = self.TableRunfastModule:create_sequence()
        --print("======移动Start")
        sequence:Append(AnnounceTextTransform.transform:DOLocalMoveX(-StartX, TakeTime, true)):OnComplete(function()
            loopCount = loopCount - 1
            if(loopCount <= 0) then
                self.TableRunfastView:SetState_Announce(false)
            else
                self:ShowAnnounce(content,loopCount,delayTime)
            end
        end)
    end)
end

function TableRunfastLogic:MySelfStartFaPai()
    ModuleCache.ModuleManager.hide_module(BranchPackageName, "currentgameaccount1")
    --1.先播放开局动画
    --2.播放发牌动画(同时黑桃3旋转然后黑桃3飞向首发玩家)
    --3.发完牌后首发玩家出现我先出的字样
    --4.显示出牌按钮
    print("======开始发牌")
    local roomInfo = self.modelData.curTableData.roomInfo
    roomInfo.IsFaPaiDoing = true
    local StartRoundAnimTime = 1 --开局动画时间
    self.TableRunfastView:SetState_CenterRule(false,StartRoundAnimTime+1)
   print("销毁匹配界面")
    --销毁匹配界面
    self.TableRunfastModule:dispatch_package_event("Event_Have_Enter_Table")
    self.TableRunfastModule:subscibe_time_event(0.5, false, 0):OnComplete(function(t)
        print("====1.先播放开局动画")
        self.TableRunfastView:SetState_StartRoundAnimRoot(true, StartRoundAnimTime)
        self.TableRunfastModule:subscibe_time_event(1, false, 0):OnComplete(function(t)
            print("====2.播放发牌动画,黑桃3旋转")
            self:CheckHeiTao3Fly()
            self.TableRunfastView:MySelfFaPaiAnim(function()
                print("====3")
                self:MyCardsCheckDoingRoot()
                roomInfo.IsFaPaiDoing = false
            end)
        end)
    end)


end

function TableRunfastLogic:PlayerMatchRanksNotify(data)
    --print("====服务器及时刷新排行数据")
    if (data and data.playerRanks and #data.playerRanks > 0) then
        local mySeatInfo = self.modelData.curTableData.roomInfo.mySeatInfo
        local myId = tonumber(mySeatInfo.playerId)
        for i = 1, #data.playerRanks do
            local tempData = data.playerRanks[i]
            if (tempData.playerId == myId) then
                self.TableRunfastView:SetRankInfo(true,tempData)
            end
        end
    end
end

function TableRunfastLogic:CheckTableIsNilOrEmpty(_table)
    return (_table == nil or #_table <= 0)
end

function TableRunfastLogic:ResetClickCount()
    self.ClickHintBtnCount = 0 --点击提示的次数
    self.DragPokerCount = 0  --拖牌的次数
    self.OnClickPokerCount = 0 --点击牌的次数
end


function TableRunfastLogic:ClearSeat()
    local seatHolderArray = self.TableRunfastView.seatHolderArray
    for i = 1, #seatHolderArray do
        if(i > 1) then
            local seatHolder = seatHolderArray[i]            
            if(seatHolder) then
                self.TableRunfastHelper:refreshSeatInfo(seatHolder, {})
            end
        end
    end

    local LightPokersEventIdList = self.LightPokersEventIdList
    if(LightPokersEventIdList and #LightPokersEventIdList > 0) then
        --print("========================清理")
        --print_table(LightPokersEventIdList)
        for i = 1, #LightPokersEventIdList do
            local EventId = LightPokersEventIdList[i]
            CSmartTimer:Kill(EventId)
            EventId = nil
        end
    end
    self.LightPokersEventIdList = nil
end


function TableRunfastLogic:ClearTable(Clear_LightPokers,Clear_FirstPokerSlot,Clear_FirstThrowPoker,Clear_ClockTimeDown,Clear_Seat)
    print("====清除牌桌")
    if(Clear_LightPokers) then
        self:ClearLightPokers(true)
    end
    if(Clear_FirstPokerSlot) then
        self:ResetPokerSlot()
    end
    if(Clear_FirstThrowPoker) then
        self:ResetFirstThrowPoker()
    end
    if(Clear_ClockTimeDown) then
        self:ResetClockTimeDown()
    end

    if(Clear_Seat) then
        self:ClearSeat()
    end
end


function TableRunfastLogic:IsHave2MustPressA()
    --print("====有2必压A")
    local CurRuleTable = self.modelData.curTableData.roomInfo.CurRuleTable
    return CurRuleTable and CurRuleTable.allow_pass and CurRuleTable.have2mustpressA
end

function TableRunfastLogic:GetHeiTao2RepresentativeNum()
    return TableData.HeiTao2RepresentativeNum --print("====获取黑桃2代表的数字")
end

function TableRunfastLogic:IsMyHandHasHeiTao2()
    --print("====自己手上是否有2")
    local myHandPokerNumTable = self.modelData.curTableData.roomInfo.mySeatInfo.InMyHandPokerNumTable
    return self.TableRunfastHelper:IsNumTableContains(myHandPokerNumTable,self:GetHeiTao2RepresentativeNum())
end

function TableRunfastLogic:IsOtherThrowSingleA()
    --print("====别人是否打了单张A")
    local pokerNumTable = self.modelData.curTableData.roomInfo.curPokerTable--别人打的牌
    if(pokerNumTable and #pokerNumTable == 1) then
        local Num = pokerNumTable[1]
        local poker = self.TableRunfastHelper:NumberToPokerTable(Num)
        return poker.nameNum == 1
    end
    return false
end

function TableRunfastLogic:CheckHave2MustPressA()
    --检查是否勾选了规则,检查自己手上是否有2,检查别人是否打了一张A
    return self:IsHave2MustPressA() and self:IsOtherThrowSingleA() and self:IsMyHandHasHeiTao2()
end

function TableRunfastLogic:CalculateNotAffordList()
    local NotAffordList = {}

    local roomInfo = self.modelData.curTableData.roomInfo
    local locIsMaxPoker = self:IsMustThrowMaxPoker()
    local locIsFirstRound = self:IsFirstRound()
    local ruleTable = roomInfo.createRoomRule
    local locIsContainsHeiTao3 = ruleTable.black3_on_firstloop and self:IsContainsHeiTao3(myHandPokerNumTable)
    local locIsFirstPattern = roomInfo.mySeatInfo.is_first_pattern
    local myHandPokerNumTable = roomInfo.mySeatInfo.InMyHandPokerNumTable
    local othersPokerNumTable = roomInfo.curPokerTable--别人打的牌

    local set = CardSet.new(myHandPokerNumTable)
    local othersThrowPokerCP = nil
    local startPokerNum = nil
    if (locIsFirstRound and locIsContainsHeiTao3 and ruleTable.init_card_cnt == #myHandPokerNumTable ) then
        --print("onClickHint====开局黑桃3")
        othersThrowPokerCP = nil
        startPokerNum = self:GetMustThrowNum()
    elseif (locIsFirstPattern == true) then
        --print("onClickHint====别人要不起自己首发")
        othersThrowPokerCP = nil
    else
        --print("onClickHint====检查是否接的上牌")
        local locPlayId = roomInfo.lastThrowPokerPlayerId or roomInfo.curThorwCardPlayerId
        print("locPlayId", locPlayId)
        othersThrowPokerCP = CardPattern.new(othersPokerNumTable, #othersPokerNumTable, self:Is_black3_player(nil, tonumber(locPlayId)))
        if (othersThrowPokerCP == nil) then
            --print("====别人打的牌异常")
        else
            print("last patttern", othersThrowPokerCP.type, othersThrowPokerCP.value, othersThrowPokerCP.disp_type, self:Is_black3_player(nil, tonumber(self.modelData.curTableData.roomInfo.curThorwCardPlayerId)) )
        end
    end


    local NameIndexList = {} --打得起的扑克名字的列表
    print("==计算打得起扑克名字列表")
    local localFN = set:hintIterator(othersThrowPokerCP, startPokerNum, locIsMaxPoker, self:Is_black3_player())
    print("==localFN")
    print_table(localFN)
    for i = 1, 13 do
        if(localFN) then
            local pt = localFN()
            local cards = pt.cards
            if(cards and #cards > 0) then
                for m = 1, #cards do
                    local poker = self.TableRunfastHelper:NumberToPokerTable(cards[m])
                    if(self.TableRunfastHelper:IsNumTableContains(NameIndexList,poker.nameNum)) then
                    else
                        table.insert(NameIndexList,poker.nameNum)
                    end
                end
            end
        end
    end
    print_table(NameIndexList)

    print("==计算打不起的扑克数字")
    if(#NameIndexList > 0) then
        for i = 1, #myHandPokerNumTable do
            local Num = myHandPokerNumTable[i]
            local mypoker = self.TableRunfastHelper:NumberToPokerTable(Num)
            if(self.TableRunfastHelper:IsNumTableContains(NameIndexList,mypoker.nameNum)) then
            else
                table.insert(NotAffordList,Num)
                print("==打不起的牌Num="..Num,","..mypoker.SpriteName)
            end
        end
    end
    return NotAffordList
end

function TableRunfastLogic:SetMyHandPokerGradient(IsHandAllPokerGradient,GradientList)
    if(IsHandAllPokerGradient) then
        --print("==设置自己手牌全部变暗")
        local pokerSlotTable = self.TableRunfastView.seatHolderArray[1].inhandCardsArray--自己手上的牌槽
        for i = 1, #pokerSlotTable do
            local pokerSlot = pokerSlotTable[i]--牌槽
            if (pokerSlot.isHide or pokerSlot.isThrowed or pokerSlot.poker == nil) then
                --已经打出的牌
            else
                self.TableRunfastHelper:enableGradientColor(pokerSlot, true)
            end
        end
    else
        --print("==扑克变暗") --自己出牌,接牌的情况下
        local roomInfo = self.modelData.curTableData.roomInfo
        local IsFirstPattern = roomInfo.mySeatInfo.is_first_pattern
        if(IsFirstPattern) then
            return
        end

        --GradientList = self:CalculateNotAffordList()
        if(GradientList == nil or #GradientList <= 0 or not self:nextPlayerIsMy()) then
            return
        end

        local pokerSlotTable = self.TableRunfastView.seatHolderArray[1].inhandCardsArray--自己手上的牌槽
        for i = 1, #pokerSlotTable do
            local pokerSlot = pokerSlotTable[i]--牌槽
            if (pokerSlot.isHide or pokerSlot.isThrowed or pokerSlot.poker == nil) then
                --已经打出的牌
            else
                local PokerNum = pokerSlot.poker.PokerNum
                if(self.TableRunfastHelper:IsNumTableContains(GradientList,PokerNum)) then
                    --print_table(pokerSlot.poker)
                    self.TableRunfastHelper:enableGradientColor(pokerSlot, true)
                end
            end
        end
    end
end

function TableRunfastLogic:CheckMySelectPokerCompareOtherPoker()
    --print("==我出牌并且接牌的情况下:我早预选的牌与别人打的牌比较")
    if (not self:nextPlayerIsMy()) then
        return
    end

    local roomInfo = self.modelData.curTableData.roomInfo
    --print("==1.0检查你首发")
    local IsFirstPattern = roomInfo.mySeatInfo.is_first_pattern
    if(IsFirstPattern) then
        return
    end

    --print("==2.0检查你选的牌")
    local selectedPokerList = self:GetSelectedPokerList()
    if (selectedPokerList == nil or #selectedPokerList <= 0) then
        return
    end

    --print("==3.0检查牌型是否符合出牌规则")
    local myHandPokerNumTable = roomInfo.mySeatInfo.InMyHandPokerNumTable
    if (myHandPokerNumTable == nil or #myHandPokerNumTable <= 0) then
        print("==error 自己手上没有牌,牌局结束了")
        return
    end
    if (#selectedPokerList > #myHandPokerNumTable) then
        print("==error 你选择要出的牌的数量大于你上手的牌的数量")
        TableManagerPoker:heartbeat_timeout_reconnect_game_server()
        return
    end
    local mySelectedPokerCP = CardPattern.new(selectedPokerList, #myHandPokerNumTable, self:Is_black3_player())
    if (mySelectedPokerCP == nil) then
        print("====你选择的牌不符合出牌规则!")
        self:unSelectedAllPoker()
        return
    end

    local OtherPokerTable = roomInfo.curPokerTable--别人打的牌
    if (OtherPokerTable == nil or #OtherPokerTable <= 0 ) then
        print("==error别人打的牌数据为空")
        return
    end
    local OtherPokerCP = CardPattern.new(OtherPokerTable, #OtherPokerTable, self:Is_black3_player(nil, tonumber(roomInfo.curThorwCardPlayerId)))
    if (OtherPokerCP == nil) then
        print("==error检查别人打的牌不符合牌型")
        return
    end

    --print("==4.0比牌的大小")
    if (mySelectedPokerCP:compable(OtherPokerCP) and not mySelectedPokerCP:le(OtherPokerCP)) then
        --print("==你选的牌可以打起别人")
    else
        --print("==你选的牌不能打起别人,自动拖下去")
        self:unSelectedAllPoker()
    end
end



function TableRunfastLogic:start_write_log(_fields, str)
    self.TableRunfastModule:start_lua_coroutine(function()
        coroutine.wait(0)
        local logStr = log.format_pbc_table_tojson(_fields, str)
        ModuleCache.LogManager.raw_Log(logStr)
    end)
end



return TableRunfastLogic