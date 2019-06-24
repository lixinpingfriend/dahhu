
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

local TableMatchView = Class('tableMatchView', View)

local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local GameSDKInterface = ModuleCache.GameSDKInterface
local Vector3 = Vector3
local Util = require('util.game_util')
function TableMatchView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/tablematch/public_windowtablematch.prefab", "Public_WindowTableMatch", 1)

    --View.set_1080p(self)
    self.players = {}
    self.pos = {}
    self.tablepos = {}
    self.getbg = false
    self.initBaseSeat = false

    self.matchinfo = GetComponentWithPath(self.root, "Center/MatchInfo", ComponentTypeName.Transform).gameObject
    self.upgradeTrans = GetComponentWithPath(self.root, "Center/MatchUpgrade", ComponentTypeName.Transform)
    self.goldTrans = GetComponentWithPath(self.root, "Center/GoldInfo", ComponentTypeName.Transform)
    self.mengBan = GetComponentWithPath(self.root, "Center/MengBan", "UnityEngine.CanvasGroup")
    self.signTrans = GetComponentWithPath(self.root, "Center/MatchSignSuccess", ComponentTypeName.Transform)
    self.uiState = GetComponentWithPath(self.root, "Center", "UIStateSwitcher")

    self.holderMojong = GetComponentWithPath(self.root, "Holder/SeatMajong", ComponentTypeName.Transform).gameObject
    self.holderPoker = GetComponentWithPath(self.root, "Holder/SeatPoker", ComponentTypeName.Transform).gameObject
    self.uiState3d = GetComponentWithPath(self.root, "Center/GoldInfo", "UIStateSwitcher")

    local package = ModuleCache.PlayModeUtil.getInfoByGameId(ModuleCache.GameManager.curGameId).package
    if package == "paohuzi" then
        self.BtnLeftOpen = GetComponentWithPath(self.root, "GameName/paohuzi/TopRight/TopRoot/BtnLeftOpen", ComponentTypeName.Transform).gameObject

    end

    ComponentUtil.SafeSetActive(self.holderMojong, false)
    ComponentUtil.SafeSetActive(self.holderPoker, false)

    self.haveSignNum = GetComponentWithPath(self.root, "Center/MatchSignSuccess/Info/Num1", ComponentTypeName.Text)
    self.needSignNum = GetComponentWithPath(self.root, "Center/MatchSignSuccess/Info/Num2", ComponentTypeName.Text)

	local Manager = require("package.public.module.function_manager")
	local size = 0.93
	self:fixed_tran_size(Manager.FindObject(self.root, "Center"))
	self:fixed_tran_size(Manager.FindObject(self.root, "GameName/RUNFAST/Center"), size)
	self:fixed_tran_size(Manager.FindObject(self.root, "GameName/RUNFAST/TopLeft"), size)
	self:fixed_tran_size(Manager.FindObject(self.root, "GameName/majiang/Center"), size)
	self:fixed_tran_size(Manager.FindObject(self.root, "GameName/majiang/TopRight"), size)
	self:fixed_tran_size(Manager.FindObject(self.root, "GameName/huzi/Center"), size)
	self:fixed_tran_size(Manager.FindObject(self.root, "GameName/huzi/TopRight"), size)
	self:fixed_tran_size(Manager.FindObject(self.root, "TopRight"), size)
end

function TableMatchView:show_view(matchtype)
    self.uiState:SwitchState(matchtype)
end


--matchcurdata 比赛场信息
--    {
--    MatchID 比赛场id
--    StageID
--    CurLoopCnt 当前轮
--    UserCnt 剩余比赛玩家数
--    SignupUserCnt 总报名人数
--    RoomCnt 剩余房间数
--    QuitScore 淘汰分
--    Rank 当前名次
--    }

function TableMatchView:initTable(matchtype, goldinfo, matchinfo, roleData, matchcurdata)
    self:pannelExpand(false)
    local appname
    local playernum
    local goldname
    local golddifen
    local noshuffle = ""
    local param1 = ""
    local param2 = ""
    if goldinfo then
        local rule = ModuleCache.Json.decode(goldinfo.playRule)
        self.ruleJsonInfo = rule
        param1 = rule.QiHuBeiShu
        param2 = rule.FengDingType
        if tonumber(param2) == 1 then
            param2 = 50
        elseif tonumber(param2) == 2 then
            param2 = 100
        elseif tonumber(param2) == 3 then
            param2 = 80
        elseif tonumber(param2) == 4 then
            param2 = 200
        end
        appname = rule.gameName
        playernum = rule.playerCount or rule.PlayerNum
        if rule.NoShuffle then
            noshuffle = " 不洗牌"
        end

        goldname = goldinfo.goldName
        golddifen = goldinfo.baseScore
    else
        appname = matchinfo.gameId
        playernum = matchinfo.playerCount
        self.matchInfo = matchinfo
    end
    self.playerCount = playernum
    --local str = string.split(appname, "_")
    self.tableType = matchtype
    self:initLocalView()
    if self.tableType == 1 then
        self.uiState:SwitchState("gold")
        --self:do_scale(self.goldTrans, nil, 1)
        local infoText = GetComponentWithPath(self.root, "Center/GoldInfo/Info", ComponentTypeName.Text)
        infoText.text = goldname .. " 底分:" .. golddifen .. noshuffle
    elseif self.tableType == 2 then
        self.matchtype = matchcurdata.type
        if self.matchtype == "sign" then
            self:refreshSignNum(matchinfo)
            self.uiState:SwitchState("matchsign")
            --self:do_scale(self.signTrans, nil, 1)
            --self:do_fade(self.mengBan, nil, 0.6)
        elseif self.matchtype == "upgrade" then
            self.uiState:SwitchState("matchup")
            --self:do_scale(self.upgradeTrans, nil, 1)
            --self:do_fade(self.mengBan, nil, 0.6)
        elseif self.matchtype == "wait" then
            self.uiState:SwitchState("matchwait")
        elseif self.matchtype == "fail" then
            self.uiState:SwitchState("matchfail")
        end
    end
    for _, v in ipairs(self.seats) do
        local obj = GetComponentWithPath(v, "Info/HeadBg", ComponentTypeName.Transform).gameObject
        obj:SetActive(false)
    end
    self.mypinfo = { playerid = roleData.userID, localpos = 1 }
    local score
    if self.tableType == 2 then
        score = 0
        if matchcurdata.matchinfo.Score then
            score = matchcurdata.matchinfo.Score
        end
        self:set_posinfo(1, roleData, score)
    else
        self:set_posinfo(1, roleData)
        self:get_userinfo(roleData.userID, function(_, data)
            if self.seats[1] and data then
                local textGold = GetComponentWithPath(self.seats[1], "Info/HeadBg/SomeInfoRoot/CurrencyRoot/Gold/Count", ComponentTypeName.Text)
                textGold.text = data.gold
            end
        end)
    end

    self.tableinit = true

    --self:show(true);
end

function TableMatchView:memberUser(ids, id)
    local is
    if ids and type(ids) == "table" then
        for _, p in pairs(ids) do
            if tonumber(p) == tonumber(id) then
                is = true
            end
        end
    end
    return is
end

function TableMatchView:upgradeInfo(matchData, matchInfo, matchDynamicData, matchConfig, myinfo)
    self.uiState:SwitchState("matchup")
    local upUser = matchDynamicData.PromotionUsers
    local lunkong = false
    local circle = matchInfo.CurLoopCnt
    self.curScore = matchInfo.Score
    self.nextScore = matchInfo.Score * matchConfig.LoopScoreReserveRatio / 100
    if matchInfo.State == 5 then
        lunkong = true
    elseif matchInfo.State == 1 or matchInfo.State == 3 then
        circle = matchInfo.CurLoopCnt - 1
        self.nextScore = matchInfo.Score
    end

    if self:memberUser(upUser, myinfo.UserID) and (matchDynamicData.Type == "loop_start" or matchDynamicData.Type == "loop_playing") then
        lunkong = true
        circle = matchDynamicData.CurLoopCnt
        self.curScore = myinfo.Score
        self.nextScore = myinfo.Score * matchConfig.LoopScoreReserveRatio / 100
    end
    self.nextScore = math.floor(self.nextScore)
    self:refresh_myscore()
    print("晋级轮数：", circle, "\n上一轮分数：", matchInfo.Score, "\n乘以比例:", matchConfig.LoopScoreReserveRatio, "\n是否轮空:", lunkong, "\n我的本轮分数:", self.curScore, "\n我的下轮分数:", self.nextScore)
    local title = GetComponentWithPath(self.root, "Center/MatchUpgrade/Background/Title/Text", ComponentTypeName.Text)
    local socre = GetComponentWithPath(self.root, "Center/MatchUpgrade/Info/Num1", ComponentTypeName.Text)
    local upObj = GetComponentWithPath(self.root, "Center/MatchUpgrade/Info/UpText", ComponentTypeName.Transform).gameObject
    local emptyObj = GetComponentWithPath(self.root, "Center/MatchUpgrade/Info/EmptyText", ComponentTypeName.Transform).gameObject
    local slider = GetComponentWithPath(self.root, "Center/MatchUpgrade/Progress/Slider", ComponentTypeName.Slider)
    local progress = GetComponentWithPath(self.root, "Center/MatchUpgrade/Progress", ComponentTypeName.Transform).gameObject
    local uistate = GetComponentWithPath(self.root, "Center/MatchUpgrade/Progress/Node", "UIStateSwitcher")
    if lunkong then
        title.text = "恭喜轮空"
    else
        title.text = "恭喜晋级"
    end
    emptyObj:SetActive(lunkong)
    upObj:SetActive(not lunkong)
    progress:SetActive(matchData.matchRule == 1)
    socre.text = self.nextScore --
    if matchData.matchRule == 1 then
        --积分赛
        slider.value = 0.5
        uistate:SwitchState("jifen")
        local nodeText = {}
        for i = 1, 3 do
            local index = 1
            if i == 2 then
                index = 3
            elseif i == 3 then
                index = 5
            end
            nodeText[i] = GetComponentWithPath(self.root, "Center/MatchUpgrade/Progress/Node/" .. index .. "/Text", ComponentTypeName.Text)
            if type(circle) ~= "number" then
                circle = 1
            end
            if circle > 1 then
                nodeText[i].text = "第" .. circle + i - 1 .. "轮"
            else
                nodeText[i].text = "第" .. i .. "轮"
            end
        end
    end
end

function TableMatchView:refreshSignNum(data)
    if self.matchInfo and data and type(data) == "table" then
        if data.matchId == self.matchInfo.matchId then
            print("比赛报名人数:", data.currentEntryNum)
            if self.matchInfo.minUserNum > data.currentEntryNum then
                self.haveSignNum.text = data.currentEntryNum  --eventData.currentEntryNum
                self.needSignNum.text = self.matchInfo.minUserNum - data.currentEntryNum
            else
                self.haveSignNum.text = self.matchInfo.minUserNum - 1 --eventData.currentEntryNum
                self.needSignNum.text =  1
            end

        end
    end
end

function TableMatchView:initLocalView()
    local seatItem = self.holderPoker
    local gamename = ModuleCache.PlayModeUtil.getInfoByGameId(ModuleCache.GameManager.curGameId).package
    if gamename == "majiang" then
        self.gameName = "majiang"
        seatItem = self.holderMojong
    elseif gamename == "runfast" then
        self.gameName = "RUNFAST"
    else
        self.gameName = gamename
    end

    if gamename == 'paohuzi' or gamename == 'huzi' then
        seatItem = self.holderMojong
    end
    
    print("加载金币场背景：", self.gameName, self.playerCount, seatItem.name)
    local bgp = GetComponentWithPath(self.root, "GameName/" .. self.gameName, ComponentTypeName.Transform).gameObject
    bgp:SetActive(true)
    local bg = self:getBg(self.gameName)
    if self.gameName == "RUNFAST" then
        self:refreshBatteryAndTimeInfo(bg)
    else
        self:refreshBatteryAndTimeInfo(self.root)
    end

    if bg and bgp then
        local background = GetComponentWithPath(bgp, "Background", ComponentTypeName.Transform)
        bg.transform:SetParent(background)
    end

    self.seats = {}
    if not self.initBaseSeat and bgp then
        for i = 1, self.playerCount or 6 do
            local s = GetComponentWithPath(bgp, "Center/Seats/" .. i, ComponentTypeName.Transform).gameObject
            local target = ComponentUtil.InstantiateLocal(seatItem, Vector3.zero)
            local obj = GetComponentWithPath(target, "Info/HeadBg", ComponentTypeName.Transform).gameObject
            local matching = GetComponentWithPath(target, "Info/Matching", ComponentTypeName.Transform)
            target.transform:SetParent(s.transform)
            target.transform.localScale = Vector3.one
            target.transform.localPosition = Vector3.zero
            target.name = "Seat"
            ComponentUtil.SafeSetActive(target, true)
            if matching then
                ComponentUtil.SafeSetActive(matching.gameObject, true)
            end

            ComponentUtil.SafeSetActive(obj, false)
            table.insert(self.seats, target)
        end
        self.initBaseSeat = true
    end
    ModuleCache.ModuleManager.destroy_module("public", "goldentrance")
    ModuleCache.ModuleManager.destroy_module("public", "bisai")
    ModuleCache.ModuleManager.destroy_module("public", "hall")
    ModuleCache.ModuleManager.destroy_module("public", "login")
    self:show()
end

function TableMatchView:matchinfo_view(matchInfo, matchName)
    if matchName then
        local nameText = GetComponentWithPath(self.root, "Center/MatchInfo/Type/Type1Root/UpText", ComponentTypeName.Text)
        nameText.text = matchName
    end
    if matchInfo then
        self.matchinfoText = GetComponentWithPath(self.root, "Center/MatchInfo/DownText", ComponentTypeName.Text)
        self.matchnumText = GetComponentWithPath(self.root, "Center/MatchInfo/JinJi/Num", ComponentTypeName.Text)

        self.quitScore = matchInfo.QuitScore
        self.matchinfoText.text = "淘汰分:" .. matchInfo.QuitScore .. " 名次:" .. matchInfo.Rank .. " 轮数:" ..
                matchInfo.CurLoopCnt .. " 人数:" .. matchInfo.UserCnt
        self.matchnumText.text = matchInfo.RoomCnt
    end
end

function TableMatchView:hide_matchinfo()
    ComponentUtil.SafeSetActive(self.matchinfo, false)
end

function TableMatchView:update_matchinfo(matchinfo)
    print_table(matchinfo, "更新比赛信息")
    print("牌桌初始化：", self.tableinit)
    if not matchinfo or not self.tableinit then
        return
    end
    self.noneNatchInfo = nil
    self:matchinfo_view(matchinfo)
    if self.seats[1] then
        local textScore = GetComponentWithPath(self.seats[1], "Info/HeadBg/SomeInfoRoot/CurrencyRoot/Point/Text", ComponentTypeName.Text)
        local goldSwitch = GetComponentWithPath(self.seats[1], "Info/HeadBg/SomeInfoRoot/CurrencyRoot", "UIStateSwitcher")
        textScore.text = matchinfo.score
        goldSwitch:SwitchState("Point")
    end
end

function TableMatchView:pannelExpand(b)
    local pannel
    if self.gameName == "majiang" then
        pannel = GetComponentWithPath(self.root, "GameName/majiang/TopRight/TopRoot/RightMenu", ComponentTypeName.Transform).gameObject
    elseif self.gameName == "RUNFAST" then
        pannel = GetComponentWithPath(self.root, "GameName/RUNFAST/TopLeft/Root/LeftRoot", ComponentTypeName.Transform).gameObject
    elseif self.gameName == "paohuzi" then
		pannel = GetComponentWithPath(self.root, "GameName/paohuzi/TopRight/TopRoot/RightMenu", ComponentTypeName.Transform).gameObject
	elseif self.gameName == "huzi" then
        pannel = GetComponentWithPath(self.root, "GameName/huzi/TopRight/TopRoot/RightMenu", ComponentTypeName.Transform).gameObject
    end
    if pannel then
        ComponentUtil.SafeSetActive(pannel, b)
    end

end

function TableMatchView:update_player(players)
    --print_table(players, "更新玩家")
    if not self.tableinit then
        return
    end
    for i = 1, #players do
        local id = tonumber(players[i].UserID)
        if id == tonumber(self.mypinfo.playerid) then
            self.mypinfo.serverpos = players[i].SeatID
            self.pos[1] = id
            self.players[id] = {}
            self.players[id].userID = id
            self.players[id].pos = 1
            self.players[id].serverpos = players[i].SeatID
            self:refreshSeatPlayerInfo(self.players[id])
        end
    end
    for i = 1, #players do
        local id = tonumber(players[i].UserID)
        if id ~= tonumber(self.mypinfo.playerid) and self.mypinfo.serverpos then
            if self.players[id] and self.players[id].playerInfo then
                self:refreshSeatPlayerInfo(self.players[id])
            else
                local pos = self:serverSeatIdToLocal(players[i].SeatID, self.mypinfo.serverpos, self.playerCount)
                self.players[id] = {} -- pos
                self.players[id].userID = id
                self.players[id].pos = pos
                self.players[id].serverpos = players[i].SeatID
                self:refreshSeatPlayerInfo(self.players[id])
            end
            self.pos[self.players[id].pos] = id
        end
        --print("玩家位置", id, self.players[id].pos)
    end
    local le = {}
    for pos, id in pairs(self.pos) do
        local e = false
        for i = 1, #players do
            if tonumber(id) == tonumber(players[i].UserID) then
                e = true
            end
        end
        if not e then
            self.pos[pos] = nil
            table.insert(le, pos)
        end
    end
    if #le > 0 then
        for i = 1, #le do
            self:playerleave(le[i])
            self.tablepos[le[i]] = nil
        end
    end
end

function TableMatchView:serverSeatIdToLocal(targetSeatId, mySeatId, seatCount)
    local localIndex = targetSeatId + (1 - mySeatId) + seatCount
    if (localIndex > seatCount) then
        return localIndex - seatCount
    else
        return localIndex;
    end
end

--刷新座位玩家信息
function TableMatchView:refreshSeatPlayerInfo(seatInfo)
    if (seatInfo.playerInfo) then
        --print("======TableMatchView:refreshSeatPlayerInfo1111======")
        self:setPlayerInfo(seatInfo.pos, seatInfo.playerInfo)
    else
        --print("======TableMatchView:refreshSeatPlayerInfo2222======",self.tablepos[seatInfo.pos],seatInfo.userID)
        if not (self.tablepos[seatInfo.pos] and tonumber(self.tablepos[seatInfo.pos]) == tonumber(seatInfo.userID)) then
            seatInfo.playerInfo = nil
            self:get_userinfo(seatInfo.userID, function(err, data)
                if (err) then
                    self:refreshSeatPlayerInfo(seatInfo)
                    return
                end
                local playerInfo = {}
                playerInfo.userID = data.userId
                playerInfo.nickname = data.nickname
                playerInfo.headImg = data.headImg
                playerInfo.gold = data.gold
                seatInfo.playerInfo = playerInfo
                self:setPlayerInfo(seatInfo.pos, seatInfo.playerInfo, seatInfo.score)
            end)
        end
    end
end

function TableMatchView:get_userinfo(playerId, callback)
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "user/info?",
        params = {
            uid = playerId,
        },
        cacheDataKey = "user/info?uid=" .. playerId,
        cacheDataImmediatelyCallback = true,
    }

    Util.http_get(requestData, function(wwwOperation)
        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
        if retData.ret and retData.ret == 0 then
            --OK
            callback(nil, retData.data)
        else
            callback(retData.ret, nil)
        end
    end, function(error)
        print(error.error)
        callback(error.error, nil)
    end, function(cacheDataText)
        local retData = ModuleCache.Json.decode(cacheDataText)
        if retData.ret and retData.ret == 0 then
            --OK
            callback(nil, retData.data)
        else
            callback(retData.ret, nil)
        end
    end)

end

function TableMatchView:setPlayerInfo(pos, playerInfo, score)
    if not (self.tablepos[pos] and tonumber(self.tablepos[pos]) == tonumber(playerInfo.userID)) and self.seats[pos] then
        print("玩家进入", pos, playerInfo.userID)
        self:set_posinfo(pos, playerInfo, score)
    end
end

function TableMatchView:refresh_myscore()
    if not self.seats  then
        return
    end
    local obj = self.seats[1]
    if not obj then
        return
    end
    local textScore = GetComponentWithPath(obj, "Info/HeadBg/SomeInfoRoot/CurrencyRoot/Point/Text", ComponentTypeName.Text)
    textScore.text = self.curScore .. ""
end

function TableMatchView:set_posinfo(pos, roleData, score)
    --print_table(roleData, "set_posinfo")
    --print("set_posinfo", pos, score, tostring(self.seats[pos]))
    local obj = self.seats[pos]
    if not obj then
        return
    end
    if not roleData then
        return
    end
    obj.name = roleData.userID
    self.tablepos[pos] = roleData.userID
    local textPlayerName = GetComponentWithPath(obj, "Info/HeadBg/SomeInfoRoot/TextName", ComponentTypeName.Text)
    local imagePlayerHead = GetComponentWithPath(obj, "Info/HeadBg/Avatar/Mask/Image", ComponentTypeName.Image)
    local head = GetComponentWithPath(obj, "Info/HeadBg", ComponentTypeName.Transform).gameObject
    local matching = GetComponentWithPath(obj, "Info/Matching", ComponentTypeName.Transform)
    local textScore = GetComponentWithPath(obj, "Info/HeadBg/SomeInfoRoot/CurrencyRoot/Point/Text", ComponentTypeName.Text)
    local textGold = GetComponentWithPath(obj, "Info/HeadBg/SomeInfoRoot/CurrencyRoot/Gold/Count", ComponentTypeName.Text)
    local goldSwitch = GetComponentWithPath(obj, "Info/HeadBg/SomeInfoRoot/CurrencyRoot", "UIStateSwitcher")
    if matching then
        ComponentUtil.SafeSetActive(matching.gameObject, false)
    end

    if type(score) == "number" then
        textScore.text = Util.filterPlayerGoldNum(score)
        goldSwitch:SwitchState("Point")
    else
        textGold.text = self:getStrYiWan(roleData.gold)
        goldSwitch:SwitchState("Gold")
    end
    if roleData.nickname then
        textPlayerName.text = Util.filterPlayerName(roleData.nickname)

        self:image_load_sprite(imagePlayerHead, roleData.headImg)
        ComponentUtil.SafeSetActive(head, true)
    else
        self:get_userinfo(roleData.userID, function(error, data)
            if textGold then
                textGold.text = Util.filterPlayerGoldNum(data.gold)
                textPlayerName.text = Util.filterPlayerName(data.nickname)
                self:image_load_sprite(imagePlayerHead, data.headImg)
                ComponentUtil.SafeSetActive(head, true)
            end
        end)
    end

end

function TableMatchView:getStrYiWan(scoreT)
    local score = tonumber(scoreT)
    local str = tostring(score)

    if scoreT == nil then
        return "0"
    end
    local str = tostring(score)
    if score >= 10 ^ 8 then
        local number = math.floor(score / 10 ^ 6)
        str = string.format("%.2f", number / 10 ^ 2) .. "亿"
    elseif score >= 10 ^ 6 then
        local number = math.floor(score / 10 ^ 2)
        str = string.format("%.0f", number / 10 ^ 2) .. "万"
    elseif score >= 10 ^ 4 then
        local number = math.floor(score / 10 ^ 2)
        str = string.format("%.1f", number / 10 ^ 2) .. "万"
    end

    return str
end

function TableMatchView:playerleave(pos)
    if not self.seats[pos] then
        return
    end
    print("玩家离开,", pos)
    local head = GetComponentWithPath(self.seats[pos], "Info/HeadBg", ComponentTypeName.Transform).gameObject
    local matching = GetComponentWithPath(self.seats[pos], "Info/Matching", ComponentTypeName.Transform)
    ComponentUtil.SafeSetActive(head, false)
    if matching then
        ComponentUtil.SafeSetActive(matching.gameObject, true)
    end

end


------刷新电池,时间,网络信号信息
function TableMatchView:refreshBatteryAndTimeInfo(root)
    if not root  then
        return
    end
    self.topright = GetComponentWithPath(root, "TopRight", ComponentTypeName.Transform).gameObject
    self.topright:SetActive(true)
    --电池,电池充电
    self.BatteryImage = GetComponentWithPath(root, "TopRight/TopRoot/Battery/ImageBackground/ImageLevel", ComponentTypeName.Image)
    self.BatteryChargingRoot = GetComponentWithPath(root, "TopRight/TopRoot/Battery/ImageCharging", ComponentTypeName.Transform).gameObject
    --当前的时间
    self.textTime = GetComponentWithPath(root, "TopRight/TopRoot/Time/Text", ComponentTypeName.Text)
    --当前的网络信号信息
    self.goGState2G = GetComponentWithPath(root, "TopRight/TopRoot/NetState/GState/2g", ComponentTypeName.Transform).gameObject
    self.goGState3G = GetComponentWithPath(root, "TopRight/TopRoot/NetState/GState/3g", ComponentTypeName.Transform).gameObject
    self.goGState4G = GetComponentWithPath(root, "TopRight/TopRoot/NetState/GState/4g", ComponentTypeName.Transform).gameObject
    self.textPingValue = GetComponentWithPath(root, "TopRight/TopRoot/PingVal", ComponentTypeName.Text)
    self.goWifiStateArray = {}
    for i = 1, 5 do
        local goState = GetComponentWithPath(root, "TopRight/TopRoot/NetState/WifiState/state" .. (i - 1), ComponentTypeName.Transform).gameObject
        table.insert(self.goWifiStateArray, goState)
    end
    local batteryValue = GameSDKInterface:GetCurBatteryLevel()
    batteryValue = batteryValue * 0.01
    self.BatteryImage.fillAmount = batteryValue
    self.textTime.text = os.date("%H:%M", os.time())
    ModuleCache.ComponentUtil.SafeSetActive(self.BatteryChargingRoot, GameSDKInterface:GetCurChargeState())
    local signalType = ModuleCache.SDKInterface().get_cur_signal_type()
    if (signalType == "none") then
        self:showWifiState(true, 0)
        self:show4GState(false)
    elseif (signalType == "wifi") then
        local wifiLevel = ModuleCache.SDKInterface().get_cur_signal_strength()
        self:showWifiState(true, math.ceil(wifiLevel))
        self:show4GState(false)
    else
        self:showWifiState(false)
        self:show4GState(true, signalType)
    end
end

------wifi信号的强度:show 是否显示,wifiLevel wifi强度
function TableMatchView:showWifiState(show, wifiLevel)
    for i = 1, #self.goWifiStateArray do
        ModuleCache.ComponentUtil.SafeSetActive(self.goWifiStateArray[i], show and wifiLevel + 1 == i)
    end
end

------移动信号:show 是否显示,signalType 移动网络信号类型
function TableMatchView:show4GState(show, signalType)
    ModuleCache.ComponentUtil.SafeSetActive(self.goGState2G, show and signalType == "2g")
    ModuleCache.ComponentUtil.SafeSetActive(self.goGState3G, show and signalType == "3g")
    ModuleCache.ComponentUtil.SafeSetActive(self.goGState4G, show and signalType == "4g")
end

function TableMatchView:show_ping_delay(show, delaytime)
    ModuleCache.ComponentUtil.SafeSetActive(self.textPingValue.gameObject, show)
    if (not show) then
        return
    end
    delaytime = math.floor(delaytime * 1000)
    local content = ''
    if (delaytime >= 1000) then
        delaytime = delaytime / 1000
        delaytime = Util.getPreciseDecimal(delaytime, 2)
        content = '<color=#a31e2a>' .. delaytime .. 's</color>'
    elseif (delaytime >= 200) then
        content = '<color=#a31e2a>' .. delaytime .. 'ms</color>'
    elseif (delaytime >= 100) then
        content = '<color=#b5a324>' .. delaytime .. 'ms</color>'
    else
        content = '<color=#44b916>' .. delaytime .. 'ms</color>'
    end
    self.textPingValue.text = content
end

function TableMatchView:getBg(gamename)
    if self.getbg then
        return nil
    end
    self.getbg = true
    local bg = nil
    local s1
    local s2
    if gamename == "RUNFAST" then
        s1 = "runfast/module/tablerunfast/runfast_tablebg.prefab"
        s2 = "Runfast_TableBg"
        bg = ModuleCache.ViewUtil.InitViewGameObject(s1, s2, 1);
    elseif gamename == "majiang" then
        local packageName = 'majiang'
        s1 = packageName .. "/module/table/henanmj_tablebg.prefab"
        s2 = "HeNanMJ_TableBg"
        self.maJiangBg = nil
        bg = ModuleCache.ViewUtil.InitViewGameObject(s1, s2, 1);
        self.maJiangBg = bg
        self:refresh_majiang_2d_Bg()
    elseif gamename == "paohuzi"then
        s1 = "paohuzi/module/table/PaoHuZi_TableBg.prefab"
        s2 = "PaoHuZi_TableBg"

        bg = ModuleCache.ViewUtil.InitViewGameObject(string.lower(s1), s2, 1);

        local gameType = ModuleCache.PlayModeUtil.getInfoByGameId(ModuleCache.GameManager.curGameId).wanfaType
        local bgSetKey = string.format("%s_MJBackground", gameType)

        local key = bgSetKey
        if not ModuleCache.PlayerPrefsManager.HasKey(key) then
            ModuleCache.PlayerPrefsManager.SetInt(key, 1)
        end

        local tableBg = ModuleCache.PlayerPrefsManager.GetInt(key)
        bg.transform:Find("Bg" .. AppData.Game_Name .. tableBg).gameObject:SetActive(true)
    elseif gamename == "huzi" then
        s1 = "huzi/module/table/HuZi_TableBg.prefab"
        s2 = "HuZi_TableBg"
        
        bg = ModuleCache.ViewUtil.InitViewGameObject(string.lower(s1), s2, 1);

        local gameType = ModuleCache.PlayModeUtil.getInfoByGameId(ModuleCache.GameManager.curGameId).wanfaType
        local bgSetKey = string.format("%s_MJBackground", gameType)

        local key = bgSetKey
        if not ModuleCache.PlayerPrefsManager.HasKey(key) then
            ModuleCache.PlayerPrefsManager.SetInt(key, 1)
        end

        local tableBg = ModuleCache.PlayerPrefsManager.GetInt(key)
        bg.transform:Find("Bg" .. tableBg).gameObject:SetActive(true)
    else

        --bg = ModuleCache.ViewUtil.InitViewGameObject(s1, s2, 1);
    end
    return bg
end

---刷新背景
function TableMatchView:refresh_majiang_2d_Bg(bgSet)
    if not self.maJiangBg then
        return
    end
    local GameID = AppData.get_app_and_game_name()
    local gameType = ModuleCache.PlayModeUtil.getInfoByGameId(ModuleCache.GameManager.curGameId).wanfaType
    if self.ruleJsonInfo then
        gameType = self.ruleJsonInfo.GameType
    end
    local Is3D = Config.get_mj3dSetting(GameID).Is3D
    local def3dOr2d = Config.get_mj3dSetting(GameID).goldRoomdef3dOr2d ---金币场匹配界面使用金币场配置
    local mj2dOr3dSetKey = string.format("%s_MJ2dOr3d", gameType)
    local curSetting = ModuleCache.PlayerPrefsManager.GetInt(mj2dOr3dSetKey, def3dOr2d)
    local package = ModuleCache.PlayModeUtil.getInfoByGameId(ModuleCache.GameManager.curGameId).package
    local mjBgSet = bgSet
    if 1 == Is3D then
        if not self.mjiang3dBg then
            local packageName = 'majiang3d'
            local s1 = packageName .. "/module/table3d/mj_table3d_bg.prefab"
            local s2 = "MJ_Table3D_BG"
            self.mjiang3dBg = ModuleCache.ViewUtil.InitViewGameObject(s1, s2, 1)
            self.mjiang3dBg.transform:SetParent(self.maJiangBg.transform)
            ModuleCache.ComponentUtil.SafeSetActive(self.mjiang3dBg, -10086 == mjBgSet)
            self.majiang3dBgSprite = {}
            local sprite2d = GetComponentWithPath(self.mjiang3dBg, "2dOr3dSelectPic/2d", ComponentTypeName.Image).sprite
            local sprite3d = GetComponentWithPath(self.mjiang3dBg, "2dOr3dSelectPic/3d", ComponentTypeName.Image).sprite
            local cam3d = GetComponentWithPath(self.mjiang3dBg, "Root3D/3DObjs/Cams/3DCam", ComponentTypeName.Camera)
            table.insert(self.majiang3dBgSprite, sprite2d)
            table.insert(self.majiang3dBgSprite, sprite3d)
            ---------------同步3D摄像机与UI摄像机的rect,在一些特殊的屏幕长宽比下摄像机的rect会有变动
            local gameRoot = UnityEngine.GameObject.Find("GameRoot")
            local uiCamera = GetComponentWithPath(gameRoot, "Game/UIRoot/UICamera", "UnityEngine.Camera")
            cam3d.rect = uiCamera.rect
            -----------------------------End-----------------------------------------
        end
    end
    if 1 == Is3D and 1 == curSetting then
        mjBgSet = -10086
    else
        if not mjBgSet then
            local config = ModuleCache.PlayModeUtil.get_playmodel_data(gameType)
            local defaultBg = 1
            if (config.cardTheame) then
                local strs = string.split(config.cardTheame, "|")
                if (strs[3]) then
                    defaultBg = tonumber(strs[3])
                end
            end
            local bgSetKey = string.format("%s_MJBackground", gameType)
            mjBgSet = ModuleCache.PlayerPrefsManager.GetInt(bgSetKey, defaultBg)
        end
    end
    local bgs = TableUtil.get_all_child(self.maJiangBg)
    self.majiang2dBgSprite = {}
    for i = 1, #bgs do
        local bg = bgs[i]
        ModuleCache.ComponentUtil.SafeSetActive(bg, i == mjBgSet)
        local Image = GetComponentWithPath(bg, "", ComponentTypeName.Image)
        if Image then
            local bgSprite = GetComponentWithPath(bg, "", ComponentTypeName.Image).sprite
            table.insert(self.majiang2dBgSprite, bgSprite)
        end
    end
    if -10086 == mjBgSet then
        if self.mjiang3dBg then
            ModuleCache.ComponentUtil.SafeSetActive(self.mjiang3dBg, true)
            local key = string.format("%s_Mj3dStyleSetting",ModuleCache.GameManager.curGameId)
            local tableStyle = ModuleCache.PlayerPrefsManager.GetInt(key, 1)
            GetComponentWithPath(self.mjiang3dBg, "Root3D/3DObjs/Table/Table1",
                    ComponentTypeName.Transform).gameObject:SetActive(tableStyle == 1)
            GetComponentWithPath(self.mjiang3dBg, "Root3D/3DObjs/Table/Table2",
                    ComponentTypeName.Transform).gameObject:SetActive(tableStyle == 2)
        end
        self.uiState3d:SwitchState("3d")
    else
        if self.mjiang3dBg then
            ModuleCache.ComponentUtil.SafeSetActive(self.mjiang3dBg, false)
        end
        self.uiState3d:SwitchState("2d")
    end
end

return TableMatchView