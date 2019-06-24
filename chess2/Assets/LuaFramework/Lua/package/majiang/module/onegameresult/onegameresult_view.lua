local ModuleCache = ModuleCache
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local CSmartTimer = ModuleCache.SmartTimer.instance
local GameObject = UnityEngine.GameObject
local class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
local OneGameResultView = class('oneGameResultView', View)
local ComponentUtil = ModuleCache.ComponentUtil
local curTableData = nil
local Color = UnityEngine.Color
local poorObjs = {}
local gameState = nil
local xOffset = 80
local xAddOffset = 10
local xlastOffset = 40
local totalSeat = 4
local colorMj = nil
local gridScale = 0.504
local PlayerPrefs = UnityEngine.PlayerPrefs
local TableUtil = TableUtil
local TableManager = TableManager
function OneGameResultView:initialize(...)
    curTableData = TableManager.curTableData
    View.initialize(self, "majiang/module/onegameresult/henanmj_onegameresult.prefab", "HeNanMJ_OneGameResult", 0)
    self.imageResult = GetComponentWithPath(self.root, "Top/Child/ImageTitle", ComponentTypeName.Image)
    self.imageResultSH = GetComponentWithPath(self.root, "Top/Child/ImageTitle", "SpriteHolder")
    self.cloneParent = GetComponentWithPath(self.root, "Center/Clone", ComponentTypeName.Transform).gameObject
    self.btnRestart = GetComponentWithPath(self.root, "Bottom/Child/BtnRestart", ComponentTypeName.Button).gameObject
    self.btnChangeTable = GetComponentWithPath(self.root, "Bottom/Child/ButtonChangeTable", ComponentTypeName.Button).gameObject
    self.btnShare = GetComponentWithPath(self.root, "Bottom/Child/BtnShare", ComponentTypeName.Button).gameObject
    self.btnContinue = GetComponentWithPath(self.root, "Bottom/Child/BtnContinue", ComponentTypeName.Button).gameObject
    self.btnLookTotal = GetComponentWithPath(self.root, "Bottom/Child/BtnLookTotal", ComponentTypeName.Button).gameObject

    self.textRoomID = GetComponentWithPath(self.root, "TopLeft/Child/RoomID", ComponentTypeName.Text)
    self.textWanfa = GetComponentWithPath(self.root, "TopLeft/Child/RoomID/WanFa", ComponentTypeName.Text)
    self.textJuShu = GetComponentWithPath(self.root, "TopLeft/Child/RoomID/WanFa/JuShu", ComponentTypeName.Text)
    self.textRule = GetComponentWithPath(self.root, "TopLeft/Child/RoomRule", ComponentTypeName.Text)

    self.btnReturn = GetComponentWithPath(self.root, "TopLeft/Child/BtnReturn", ComponentTypeName.Button).gameObject

    self.textQuanHao = GetComponentWithPath(self.root, "TopLeft/Child/RoomID/WanFa/JuShu/EndTime/QuanHao", ComponentTypeName.Text)
    self.textBeginTime = GetComponentWithPath(self.root, "TopRight/Child/BeginTime", ComponentTypeName.Text)
    self.textEndTime = GetComponentWithPath(self.root, "TopLeft/Child/RoomID/WanFa/JuShu/EndTime", ComponentTypeName.Text)

    self.MaiMaPanel = GetComponentWithPath(self.root, "Bottom/Child/MaiMa", ComponentTypeName.Transform).gameObject
    self.MaiMaCopyParent = GetComponentWithPath(self.root, "Bottom/Child/MaiMa/vector", ComponentTypeName.Transform).gameObject
    self.MaiMaCopyItem = GetComponentWithPath(self.root, "Bottom/Child/MaiMa/vector/MaiMaPai", ComponentTypeName.Transform).gameObject
    self.MaiMaCopyParent1 = GetComponentWithPath(self.root, "Bottom/Child/MaiMa/vectorMore", ComponentTypeName.Transform).gameObject
    self.MaiMaCopyItem1 = GetComponentWithPath(self.root, "Bottom/Child/MaiMa/vectorMore/MaiMaPai", ComponentTypeName.Transform).gameObject

    self.button_countDownTex = GetComponentWithPath(self.btnRestart, "Count down/Text", ComponentTypeName.Text)
    GetComponentWithPath(self.btnRestart, "Image", ComponentTypeName.Transform).gameObject:SetActive(curTableData.RoomType ~= 3)
    GetComponentWithPath(self.btnRestart, "Count down", ComponentTypeName.Transform).gameObject:SetActive(curTableData.RoomType == 3)
    self.frontSpriteH = GetComponentWithPath(self.root, "Center/Child/FrontSpriteH", "SpriteHolder")
    self.TagSpriteH = GetComponentWithPath(self.root, "Center/Child/TagSpriteH", "SpriteHolder")
    self.redAtlas = GetComponentWithPath(self.root, "RedNumbersHolder", "SpriteAtlas")
    self.greenAtlas = GetComponentWithPath(self.root, "GreenNumbersHolder", "SpriteAtlas")

    self.maiMaTitleSprite = GetComponentWithPath(self.root, "Bottom/Child/MaiMa/Image (1)/Image", ComponentTypeName.Image)
    self.maiMaTitleSH = GetComponentWithPath(self.root, "Bottom/Child/MaiMa/Image (1)/Image", "SpriteHolder")

    self.btnPreTabel = GetComponentWithPath(self.root, "Bottom/Child/BtnPreTabel", ComponentTypeName.Transform).gameObject
    ComponentUtil.SafeSetActive(self.btnPreTabel, false)

    local config = TableManager.curTableData.gameRuleConfig

    local wanfaType = Config.GetWanfaIdx(curTableData.ruleJsonInfo.GameType)
    if(wanfaType > #config.createRoomTable) then
        wanfaType = 1
    end
    self.ConfigData = config.createRoomTable[wanfaType]
    if(self.ConfigData.isChangSha) then
        self.maiMaTitleSprite.sprite = self.maiMaTitleSH:FindSpriteByName("2")
    elseif(self.ConfigData.maiMaTitelTag) then
        self.maiMaTitleSprite.sprite = self.maiMaTitleSH:FindSpriteByName(self.ConfigData.maiMaTitelTag)
    else
        self.maiMaTitleSprite.sprite = self.maiMaTitleSH:FindSpriteByName("1")
    end

    local GameID = TableManager.curTableData.appGameName
    local Is3D = Config.get_mj3dSetting(GameID).Is3D ---使用新框架的麻将才有回看功能
    if Is3D and (not self.ConfigData.NoPreTabel) or TableManager:cur_game_is_gold_room_type() then
        ComponentUtil.SafeSetActive(self.btnReturn, true)
    else
        ComponentUtil.SafeSetActive(self.btnReturn,false)
    end
    ComponentUtil.SafeSetActive(self.btnChangeTable, false) ---金币场不显示换桌

    self.goldMode = (TableManager:cur_game_is_gold_room_type() or curTableData.ruleJsonInfo.settleType == 1)
    local UIStateSwitcher = ModuleCache.ComponentManager.GetComponent(self.root, "UIStateSwitcher")
    if(not self.goldMode)then
        UIStateSwitcher:SwitchState("Custom")
        gridScale = 0.56
    else
        UIStateSwitcher:SwitchState("Gold")
        gridScale = 0.504
    end
    self:refresh_mj_color_scale()

    self.kaWuXingPiao = GetComponentWithPath(self.root, "Top/Child/KaWuXingPiao", ComponentTypeName.Transform).gameObject
    self.pao = GetComponentWithPath(self.kaWuXingPiao, "SelectPao", ComponentTypeName.Transform).gameObject
    self.paoList = TableUtil.get_all_child(self.pao)
    self.selects = {}
    for i = 1, #self.paoList do
        local selectObj = GetComponentWithPath(self.paoList[i],"IsSelect/Select",ComponentTypeName.RectTransform).gameObject
        table.insert(self.selects, {select = selectObj})
    end
end

function OneGameResultView:kawuxing_piao()
    local selectIndex = PlayerPrefs.GetInt(string.format("%s_kawuxing_piao",TableManager.curTableData.ruleJsonInfo.GameType), 1)
    TableManager.curTableData.kaWuXingPiao = selectIndex - 1
    for i = 1, #self.selects do
        self.selects[i].select:SetActive(i == selectIndex)
    end
end

function OneGameResultView:refresh_view(newGameState,autoOpenTotalResultTime)
    gameState = newGameState
    self.clones = TableUtil.get_all_child(self.cloneParent)
    self.playerTrans = {}
    colorMj = {}
    for i=1,4 do
        local playerTranData = {}
        local playerTran = GetComponentWithPath(self.root, "Top/Child/Player" .. i, ComponentTypeName.Transform).gameObject
        if(i<=curTableData.totalSeat) then
            playerTranData.xiaGrid = GetComponentWithPath(playerTran, "Grid1", ComponentTypeName.Transform).gameObject
            playerTranData.paiGrid = GetComponentWithPath(playerTran, "Grid2", ComponentTypeName.Transform).gameObject
            playerTranData.huaGrid = GetComponentWithPath(playerTran, "Grid3", ComponentTypeName.Transform).gameObject
            playerTranData.paiBeginPos = playerTranData.paiGrid.transform.localPosition
            playerTranData.textName = GetComponentWithPath(playerTran, "TextName", ComponentTypeName.Text)
            playerTranData.textScore = GetComponentWithPath(playerTran, "TextScore", "TextWrap")
            playerTranData.textScore1 = GetComponentWithPath(playerTran, "TextScore1", ComponentTypeName.Text)
            playerTranData.textHuFa = GetComponentWithPath(playerTran, "TextFB", ComponentTypeName.Text)
            playerTranData.objeBanker = GetComponentWithPath(playerTran, "ImageBanker", ComponentTypeName.Image).gameObject
            playerTranData.objPao = GetComponentWithPath(playerTran, "ImagePao", ComponentTypeName.Image).gameObject
            playerTranData.objHu = GetComponentWithPath(playerTran, "ImageHu", ComponentTypeName.Image).gameObject
            playerTranData.objDi = GetComponentWithPath(playerTran, "ImageDi", ComponentTypeName.Image).gameObject
            playerTranData.objTuo = GetComponentWithPath(playerTran, "ImageTuo", ComponentTypeName.Image).gameObject
            playerTranData.objDZMJ = GetComponentWithPath(playerTran, "dzmj", ComponentTypeName.Transform).gameObject
            playerTranData.objChengBao = GetComponentWithPath(playerTran, "ImageChengBao", ComponentTypeName.Image).gameObject
            playerTranData.goldTag = GetComponentWithPath(playerTran, "GoldTag", ComponentTypeName.Image).gameObject
            --playerTranData.huRangeText = GetComponentWithPath(playerTran, "HuRangeText", "TextWrap")   ---保持与普宁结算统一，预留
            playerTranData.fanShuObj = GetComponentWithPath(playerTran, "FanShuTitel", ComponentTypeName.Transform).gameObject
            playerTranData.fanShuText = GetComponentWithPath(playerTran, "FanShuTitel/FanShuText", ComponentTypeName.Text)
            ComponentUtil.SafeSetActive(playerTranData.goldTag, TableManager:cur_game_is_gold_room_type() or curTableData.ruleJsonInfo.settleType == 1)
            self.playerTrans[i] = playerTranData
            self:set_result(i)
        else
            ComponentUtil.SafeSetActive(playerTran, false)
        end
    end

    if(gameState.Result == 3) then
        self.imageResult.sprite = self.imageResultSH:FindSpriteByName("1")
        ComponentUtil.SafeSetActive(self.btnContinue, true)
        ComponentUtil.SafeSetActive(self.btnRestart, false)
        ComponentUtil.SafeSetActive(self.btnLookTotal, false)
        ComponentUtil.SafeSetActive(self.btnShare, false)
    else
        local showLookTotal = curTableData.needShowTotalResult or curTableData.dismiss or (curTableData.RoomType == 3 and newGameState.RestTime == 1000)
        ComponentUtil.SafeSetActive(self.btnRestart, not showLookTotal)
        ComponentUtil.SafeSetActive(self.btnLookTotal, showLookTotal)
        ComponentUtil.SafeSetActive(self.btnShare, true)
        ComponentUtil.SafeSetActive(self.btnContinue, false)

        --if self.timeEventID then
        --    CSmartTimer:Kill(self.timeEventID)
        --    self.timeEventID = nil
        --end
        --
        -- if showLookTotal then
        --    self.timeEventID =  self:subscibe_time_event(3, false, 0):OnComplete(function(t)
        --        self.timeEventID  = nil
        --        self:show_totalgameresult_module()
        --    end).id
        -- end
    end
    if(curTableData.isPlayBack) then
        --ComponentUtil.SafeSetActive(self.imageResult.gameObject, false)
        ComponentUtil.SafeSetActive(self.btnContinue, false)
        ComponentUtil.SafeSetActive(self.btnRestart, false)
        ComponentUtil.SafeSetActive(self.btnLookTotal, false)
        ComponentUtil.SafeSetActive(self.btnShare, false)
        ComponentUtil.SafeSetActive(self.btnReturn, false)

        self.textJuShu.text = ""
        self.textQuanHao.text = ""
        self.textRoomID.text = ""
        if(gameState.starttime and tonumber(gameState.starttime) > 0) then
            self.textBeginTime.text = "开始:" .. os.date("%Y/%m/%d %H:%M:%S", tonumber(gameState.starttime) - 2208988800 - 3600 * 8)
        else
            self.textBeginTime.text = ""
        end
        if(gameState.endtime and tonumber(gameState.endtime) > 0) then
           self.textEndTime.text = "结束:" .. os.date("%Y/%m/%d %H:%M:%S", tonumber(gameState.endtime) - 2208988800 - 3600 * 8)
        else
            self.textEndTime.text = ""
        end
        self.textWanfa.text =  TableUtil.get_rule_name(curTableData.videoData.gamerule)
        if(curTableData.videoData.roundcount) then
             if(curTableData.RoomType == 3) then
                self.textJuShu.text = "第" .. gameState.CurRound .. "局"
            else
                self.textJuShu.text = "第" .. gameState.CurRound .. "/" .. curTableData.videoData.roundcount .. "局"
            end
        end
        if curTableData.videoData.roomid or curTableData.videoData.hallnum then
            self.textRoomID.text = "房号:" ..  curTableData.videoData.roomid
            if(curTableData.videoData.hallnum and curTableData.videoData.hallnum > 0) then
                self.textQuanHao.text = "圈号:"..curTableData.videoData.hallnum
            end
        end
    else
        self:refreshRoomInfo()
    end

    if TableManager:cur_game_is_gold_room_type() then
        self.textRoomID.text = ""
        self.textWanfa.text = TableUtil.get_rule_name(curTableData.Rule)
        self.textJuShu.text = "底分:"..gameState.BaseCoinScore
    end

    if(curTableData.RoomType == 3 and gameState.Result == 1) then
        if self.kickedTimeId then
            CSmartTimer:Kill(self.kickedTimeId)
        end

        self.kickedTimeId = self:subscibe_time_event(gameState.RestTime, false, 1):OnUpdate(function(t)
            t = t.surplusTimeRound
            self.button_countDownTex.text = "("..t.."s)"
        end):OnComplete(function(t)
            ModuleCache.ModuleManager.destroy_module("majiang", "onegameresult")
            ModuleCache.ModuleManager.hide_module("public", "matchdialog")
        end).id
    end

    if (TableManager:cur_game_is_gold_room_type() and gameState.Result == 1) then --金币场小结算踢人倒计时
        if self.kickedTimeId then
            CSmartTimer:Kill(self.kickedTimeId)
        end
        self.kickedTimeId = self:subscibe_time_event(gameState.RestTime, false, 1):OnUpdate(function(t)
            t = t.surplusTimeRound
            --self.button_countDownTex.text = "("..t.."s)"
        end):OnComplete(function(t)
        end).id
    end

    if curTableData.RoomType == 3 and  gameState.RestTime ~= 1000 then
        ModuleCache.ModuleManager.show_module("public","matchdialog",
        {
            btnType = 1,
            infoStr = "存在同分的情况，未能决出冠亚军，需要继续进行比赛。",
        })
    end

    if(self.ConfigData.isKaWuXing and curTableData.ruleJsonInfo.YouPiao) then
        self.kaWuXingPiao:SetActive(true)
        --if(curTableData.totalSeat == 2) then
        --    self.kaWuXingPiao.transform.localPosition = Vector3.New(0, -65.6, 0)
        --end
        self:kawuxing_piao()
    end

end

function OneGameResultView:refreshRoomInfo()
    self.textRoomID.text = string.format( "房号:%d", curTableData.RoomID)
    if(gameState.starttime and tonumber(gameState.starttime) > 0) then
        self.textBeginTime.text = "开始:" .. os.date("%Y/%m/%d %H:%M:%S", tonumber(gameState.starttime) - 2208988800 - 3600 * 8)
    else
        self.textBeginTime.text = ""
    end
    if(gameState.endtime and tonumber(gameState.endtime) > 0) then
        self.textEndTime.text = "结束:" .. os.date("%Y/%m/%d %H:%M:%S", tonumber(gameState.endtime) - 2208988800 - 3600 * 8)
    else
        self.textEndTime.text = "结束:" .. os.date("%Y/%m/%d %H:%M:%S", os.time())
    end
    if(curTableData.RoomType == 3) then
        self.textJuShu.text = "第" .. tostring(gameState.CurRound) .. "局"
    else
        self.textJuShu.text = "第" .. tostring(gameState.CurRound) .. "/" .. tostring(curTableData.RoundCount) .. "局"
    end
    if curTableData.ruleJsonInfo.isDoubleQuan and gameState.QuanData and gameState.QuanData.maxQuan > 0 then
        local roundCountText = "圈"..tostring(gameState.QuanData.currentQuan).."第"..tostring(gameState.QuanData.currentZhuang).."/"..tostring(gameState.QuanData.maxZhuang).."庄"
        self.textJuShu.text = roundCountText
    elseif curTableData.ruleJsonInfo.isDoubleQuan and gameState.QuanData then
        local roundCountText = "第"..tostring(gameState.QuanData.currentQuan).."/"..tostring(curTableData.RoundCount).."圈"
        self.textJuShu.text = roundCountText
    end

    local isMuseumRoom = false
    if curTableData.HallID and curTableData.HallID ~=0 then
        self.textQuanHao.text = "圈号:"..curTableData.HallID
        isMuseumRoom = true
    else
         self.textQuanHao.text =""
    end
    local wanfaName, ruleName, renshu = TableUtil.get_rule_name_onegameresult(curTableData.Rule,isMuseumRoom)
    self.textWanfa.text = wanfaName
	self.textRule.text = "房间规则: "..ruleName
end

function OneGameResultView:is_one_hu()
    for i=1,#gameState.Player do
        local playerState = gameState.Player[i]
        if(#playerState.HuPai ~= 0) then
            return true
        end
    end
    return false
end

function OneGameResultView:set_result(index)
    local playerState = gameState.Player[index]
    local playerTranData = self.playerTrans[index]
    local playerId = curTableData.seatUserIdInfo[(index - 1) .. ""]
    local userId = tonumber(playerState.UserID)
    if userId and 0 ~= userId then
        playerId = userId
    end
    local localSeat = TableUtil.get_local_seat(index - 1, TableManager.curTableData.SeatID, TableManager.curTableData.totalSeat)
    TableUtil.download_seat_detail_info(playerId, nil, function(playerInfo)

        --TODO XLQ:亲友圈房间并且开启了防作弊 小结算不显示玩家昵称
        if TableManager.curTableData.HallID and TableManager.curTableData.HallID >0 and self.museumData and self.museumData.preventionCheat == 1 and localSeat ~= 1 then
            playerTranData.textName.text = "***"
        else
            playerTranData.textName.text = Util.filterPlayerName(playerInfo.playerName, 10, playerInfo.isRedName)
        end

    end)
    ComponentUtil.SafeSetActive(playerTranData.objeBanker, gameState.ZhuangJia == index - 1)
    ComponentUtil.SafeSetActive(playerTranData.objDi, index - 1 ~= gameState.ZhuangJia and playerState.DiTuo)
    ComponentUtil.SafeSetActive(playerTranData.objTuo, index - 1 == gameState.ZhuangJia and playerState.DiTuo)
    if playerState.BeiShu >= 0 then
        playerTranData.textScore.atlas = self.redAtlas
    else
        playerTranData.textScore.atlas = self.greenAtlas or self.redAtlas
    end

    ---处理每个游戏特殊得分数显示缩放模式
    local BeiShu = playerState.BeiShu
    local BeiShuScale = self.ConfigData.resultBeiShuScale or 1
    BeiShu = playerState.BeiShu / BeiShuScale

    if self.goldMode then ---金币场特殊处理
        for i=1,#gameState.ScoreSettle do
            if gameState.ScoreSettle[i].SeatID == (index - 1) then
                BeiShu = gameState.ScoreSettle[i].ActualAmount
                break
            end
        end
    end

    if(BeiShu >= 0) then
        playerTranData.textScore.text = string.format("+%s", Util.filterPlayerGoldNum(BeiShu))
        playerTranData.textScore1.text = string.format("<color=#e20c0c>+%s</color>", Util.filterPlayerGoldNum(BeiShu))
        if(BeiShu == 0) then
            playerTranData.textScore.text = string.format("%s", Util.filterPlayerGoldNum(BeiShu))
            playerTranData.textScore1.text = string.format("<color=#e20c0c>%s</color>", Util.filterPlayerGoldNum(BeiShu))
        end
    else
        playerTranData.textScore.text = string.format("%s", Util.filterPlayerGoldNum(BeiShu))
        playerTranData.textScore1.text = string.format("<color=#02c714>%s</color>", Util.filterPlayerGoldNum(BeiShu))
    end
    local strHuFa = ""
    local hufaTable = {}
    for i=1,#playerState.HuFa do
        local hufa = playerState.HuFa[i]
        if(not self.ConfigData.isDengZhou) then
            local addStr = ""
            if(hufa.Jia) then
                if(hufa.showfen) then
                    if(hufa.Fen >= 0) then
                        addStr =  addStr .. string.format("<color=#b13a1f>%s</color>", " +" .. hufa.Fen)
                    elseif(hufa.Fen < 0) then
                        addStr = addStr .. string.format("<color=#b13a1f>%s</color>", " " .. hufa.Fen)
                    end
                elseif(hufa.Fen > 0) then
                    addStr =  addStr .. string.format("<color=#b13a1f>%s</color>", " +" .. hufa.Fen)
                elseif(hufa.Fen < 0) then
                    addStr = addStr .. string.format("<color=#b13a1f>%s</color>", " " .. hufa.Fen)
                end
            else
                if(hufa.showfen) then
                    addStr = addStr .. string.format("<color=#b13a1f>%s</color>", " x" .. hufa.Fen)
                elseif(hufa.Fen ~= 1) then
                    addStr = addStr .. string.format("<color=#b13a1f>%s</color>", " x" .. hufa.Fen)
                end
            end
            if(hufa.Name ~= "承包") then
                strHuFa = strHuFa .. hufa.Name .. addStr .. " "
            else
                playerTranData.objChengBao:SetActive(true)
                playerTranData.textScore.transform.localPosition = playerTranData.textScore.transform.localPosition - Vector3.New(0, 20, 0)
            end
        else
            if(hufa.Name == "前" or hufa.Name == "后") then
                hufaTable[hufa.Name] = string.format("%s<color=#b13a1f>%s</color>", hufa.Name, hufa.Fen)
            elseif(hufa.Name == "胡牌" or hufa.Name == "放炮胡" or hufa.Name == "自摸胡") then
                if(hufa.Fen <= 0) then
                    hufaTable["胡牌"] = hufa.Fen .. ""
                else
                    hufaTable["胡牌"] = "+" .. hufa.Fen
                end
                if(hufa.Name ~= "胡牌") then
                    hufaTable["添加"] = hufa.Name
                else
                    hufaTable["添加"] = ""
                end
            elseif(hufa.Name == "逮胡") then
                if(hufa.Fen <= 0) then
                    hufaTable["逮胡"] = hufa.Fen .. ""
                else
                    hufaTable["逮胡"] = "+" .. hufa.Fen
                end
            elseif(hufa.Name == "漂") then
                if(hufa.Fen <= 0) then
                    hufaTable["漂"] = hufa.Fen .. ""
                else
                    hufaTable["漂"] = "+" .. hufa.Fen
                end
            end
        end
    end
    playerTranData.textHuFa.text = strHuFa

    if playerState.state and #playerState.state > 0 then ---处理各种附加状态
        for i=1,#playerState.state do 
            local state = playerState.state[i]
            if state.id == 1001 then  ---有互包关系
                local hubaoNickNames = {}
                local maxNum = #state.ext
                for j=1,maxNum do
                    local serverIndex = state.ext[j]
                    local otherPlayerId = curTableData.seatUserIdInfo[tostring(serverIndex)]
                    TableUtil.download_seat_detail_info(otherPlayerId, nil, function(playerInfo)
                        local nickName = Util.filterPlayerName(playerInfo.playerName, 10)
                        --TODO XLQ:亲友圈房间并且开启了防作弊 小结算不显示玩家昵称
                        if TableManager.curTableData.HallID and TableManager.curTableData.HallID >0 
                        and self.museumData and self.museumData.preventionCheat == 1 and localSeat ~= 1 then
                            nickName = ""
                        end
                        table.insert(hubaoNickNames,nickName)
                        if #hubaoNickNames == maxNum then
                            local hubaoStr = "与"
                            for k=1,#hubaoNickNames do
                                local nickName = hubaoNickNames[k]
                                hubaoStr = hubaoStr..nickName
                                if k ~= #hubaoNickNames then
                                    hubaoStr = hubaoStr.." "
                                end
                            end
                            local titel = self.ConfigData.HuBaoTitel or "互包"
                            playerTranData.textHuFa.text = playerTranData.textHuFa.text..hubaoStr..titel
                        end
                    end)
                end
            end
        end
    end

    if(self.ConfigData.isDengZhou and playerState.HuFa and #playerState.HuFa > 0) then
        ComponentUtil.SafeSetActive(playerTranData.objDZMJ, true)
        local hufaTitles = {"胡牌","逮胡","漂","前","后","添加"}
        for i=1,#hufaTitles do
            local strText = GetComponentWithPath(playerTranData.objDZMJ, "Text" .. i .. "/Text", ComponentTypeName.Text)
            if(not strText) then
                strText = GetComponentWithPath(playerTranData.objDZMJ, "Text" .. i, ComponentTypeName.Text)
                strText.text = hufaTable[hufaTitles[i]]
            else
                strText.text = string.format("<color=#b13a1f>%s</color>", hufaTable[hufaTitles[i]])
                local strText1 = GetComponentWithPath(playerTranData.objDZMJ, "Text" .. i, ComponentTypeName.Text)
                strText1.text = hufaTitles[i]
            end
        end
    end
    if(localSeat == 1) then
        if(playerState.BeiShu > 0 ) then
            self.imageResult.sprite = self.imageResultSH:FindSpriteByName("2")
        elseif(playerState.BeiShu == 0 ) then
            if(self:is_one_hu()) then
                self.imageResult.sprite = self.imageResultSH:FindSpriteByName("5")
            else
                self.imageResult.sprite = self.imageResultSH:FindSpriteByName("3")
            end
        else
            self.imageResult.sprite = self.imageResultSH:FindSpriteByName("4")
        end
        self.imageResult:SetNativeSize()
    end
    ComponentUtil.SafeSetActive(playerTranData.objPao, gameState.DianPao == index - 1)
    if(self.ConfigData.isDengZhou) then
        playerTranData.objPao.transform.anchoredPosition = Vector3.New(400, playerTranData.objPao.transform.anchoredPosition.y, 0)
        if TableManager:cur_game_is_gold_room_type()then
            playerTranData.objPao.transform.anchoredPosition = Vector3.New(340, playerTranData.objPao.transform.anchoredPosition.y, 0)
        end
    end
    local noHu = true
    if(#playerState.HuPai ~= 0) then
        noHu = false
        ComponentUtil.SafeSetActive(playerTranData.objHu, true)
        if(self.ConfigData.isDengZhou) then
            playerTranData.objHu.transform.anchoredPosition = Vector3.New(400, playerTranData.objHu.transform.anchoredPosition.y, 0)
            if TableManager:cur_game_is_gold_room_type()then
                playerTranData.objHu.transform.anchoredPosition = Vector3.New(340, playerTranData.objHu.transform.anchoredPosition.y, 0)
            end
        end
    else
        ComponentUtil.SafeSetActive(playerTranData.objHu, false)
    end

    local leftChilds = TableUtil.get_all_child(playerTranData.xiaGrid)
    local paiGridChilds = TableUtil.get_all_child(playerTranData.paiGrid)
    local huaChilds = TableUtil.get_all_child(playerTranData.huaGrid)

    local xzCount = 0
    for i=1,#playerState.XiaZhang do
        xzCount = xzCount + #playerState.XiaZhang[i].Pai
    end

    local leftWidth = 0
    for i=1,#playerState.XiaZhang do --下张摆放位置更新
        local xiaZhangData = playerState.XiaZhang[i]
        if(#xiaZhangData.Pai <= 4) then
            local needGray = false
            local pais = {}
            if(i > #leftChilds) then
                local mj = nil
                mj = TableUtil.poor("1_4MJ", playerTranData.xiaGrid, Vector3.New(leftWidth, 0 , 0), self.poorObjs, self.clones, Vector3.New(1, 1, 1))
                local mjChilds = TableUtil.get_all_child(mj)
                for j=1,#mjChilds do
                    if(j <= #playerState.XiaZhang[i].Pai) then
                        xzCount = xzCount - 1
                        ComponentUtil.SafeSetActive(mjChilds[j], true)
                        table.insert(colorMj, mjChilds[j])
                        local pai = nil
                        pai = playerState.XiaZhang[i].Pai[j]
                        if(pai == 0) then
                            TableUtil.set_mj_bg(2, mjChilds[j], self.mjColorSet)
                        else
                            TableUtil.set_mj_bg(1, mjChilds[j], self.mjColorSet)
                        end
                        self:insert_mj_by_pai(colorMj, pai, mjChilds[j])
                        TableUtil.set_mj(pai, mjChilds[j], self.mjScaleSet, self.frontSpriteH)

                        if self.initData.tableView.get_down_tag_type then
                            local tagType = self.initData.tableView:get_down_tag_type(pai,gameState)
                            TableUtil.set_tag(mjChilds[j],self.initData.tableView.tagSpriteH,tagType)
                            if(self:is_laizi(pai, gameState) and (not self.ConfigData.laiziNoYellow)) then
                                TableUtil.set_mj_color(mjChilds[j], Color.yellow)
                            else
                                TableUtil.set_mj_color(mjChilds[j],Color.white)
                            end
                        else
                            ---兼容老框架
                            if(self:is_laizi(pai, gameState)) then
                                TableUtil.set_laizi_tag(mjChilds[j], self.TagSpriteH, self.ConfigData)
                            end
                        end

                        if(j - 1 == xiaZhangData.JinZhang) then
                            if(#xiaZhangData.Pai > 2) then
                                needGray = true
                            end
                        end
                        table.insert(pais, {pai = pai, obj = mjChilds[j]})
                    else
                        ComponentUtil.SafeSetActive(mjChilds[j], false)
                    end
                end
                if(needGray) then
                    local xiaZhangSeat = TableUtil.get_local_seat(xiaZhangData.Seat, index - 1, curTableData.totalSeat)
                    local mj = nil
                    local pai = 0
                    if(xiaZhangSeat == 2) then
                        if(#xiaZhangData.Pai == 4) then
                            mj = pais[3].obj
                            pai = pais[3].pai
                        else
                            mj = pais[#pais].obj
                            pai = pais[#pais].pai
                        end
                    elseif(xiaZhangSeat == 3) then
                        if(#xiaZhangData.Pai == 4) then
                            mj = pais[4].obj
                            pai = pais[4].pai
                        else
                            mj = pais[2].obj
                            pai = pais[2].pai
                        end
                    elseif(xiaZhangSeat == 4) then
                        mj = pais[1].obj
                        pai = pais[1].pai
                    else

                    end
                    if(mj) then
                        if(not self:is_laizi(pai, gameState)) then
                            TableUtil.set_mj_white(mj, Color.gray)
                        else
                            TableUtil.set_laizi_tag(mj, self.TagSpriteH, self.ConfigData, true)
                        end
                    end
                end
            end
            local num = math.min(3, #playerState.XiaZhang[i].Pai)
            leftWidth = leftWidth + xOffset * num + xAddOffset
        else
            for j=1,#xiaZhangData.Pai do
                xzCount = xzCount - 1
                local mj = TableUtil.poor("1_4MJ", playerTranData.xiaGrid, Vector3.New(leftWidth, 0 , 0), self.poorObjs, self.clones, Vector3.New(1, 1, 1))
                local showIndex = 1
                local pai = xiaZhangData.Pai[j]
                local mjChilds = TableUtil.get_all_child(mj)
                for k=1,#mjChilds do
                    ComponentUtil.SafeSetActive(mjChilds[k], k == showIndex)
                    if(k == showIndex) then
                        if(pai == 0) then
                            TableUtil.set_mj_bg(2, mjChilds[showIndex], self.mjColorSet)
                        else
                            TableUtil.set_mj_bg(1, mjChilds[showIndex], self.mjColorSet)
                        end
                        self:insert_mj_by_pai(colorMj, pai, mjChilds[showIndex])
                        TableUtil.set_mj(pai, mjChilds[showIndex], self.mjScaleSet, self.frontSpriteH)

                        if self.initData.tableView.get_down_tag_type then
                            local tagType = self.initData.tableView:get_down_tag_type(pai)
                            TableUtil.set_tag(mjChilds[showIndex],self.initData.tableView.tagSpriteH,tagType)
                            if(self:is_laizi(pai, gameState) and (not self.ConfigData.laiziNoYellow)) then
                                TableUtil.set_mj_color(mjChilds[showIndex], Color.yellow)
                            else
                                TableUtil.set_mj_color(mjChilds[showIndex],Color.white)
                            end
                        else
                            ---兼容老框架
                            if(self:is_laizi(pai, gameState)) then
                                TableUtil.set_laizi_tag(mjChilds[showIndex], self.TagSpriteH, self.ConfigData)
                            else
                                TableUtil.set_mj_white(mjChilds[showIndex])
                            end
                        end

                    end
                end
                local num = 1
                leftWidth = leftWidth + xOffset * num
            end
            leftWidth = leftWidth + xAddOffset
        end
    end

    playerTranData.paiGrid.transform.localPosition = playerTranData.paiBeginPos + Vector3.New(leftWidth * gridScale , 0 , 0) 

    for i=1, #playerState.ShouZhang do
        local mj = nil
        local pai = playerState.ShouZhang[i].Pai
        if(i <= #paiGridChilds) then
            mj = paiGridChilds[i]
            mj.transform.localPosition = Vector3.New(xOffset * (i - 1), 0, 0)
        else
            mj = TableUtil.poor("MJ", playerTranData.paiGrid, Vector3.New(xOffset * (i - 1), 0, 0), self.poorObjs, self.clones) 
        end
        if(pai == 0) then
            TableUtil.set_mj_bg(2, mj, self.mjColorSet)
	    else
    	    TableUtil.set_mj_bg(1, mj, self.mjColorSet)
        end
        TableUtil.set_mj(pai, mj, self.mjScaleSet, self.frontSpriteH)
        TableUtil.set_mj_color(mj, Color.white)
        ComponentUtil.SafeSetActive(mj, true)
        local tag = GetComponentWithPath(mj, "Tag", ComponentTypeName.Transform).gameObject
        local tagImage = GetComponentWithPath(mj, "Tag", ComponentTypeName.Image)
        local showHu = #playerState.HuPai ~= 0 and i > (#playerState.ShouZhang - #playerState.HuPai) and playerState.HuPai[1] ~= 0
        ComponentUtil.SafeSetActive(tag, false)

        if self.initData.tableView.get_hand_tag_type then
            local tagType = self.initData.tableView:get_hand_tag_type(pai,gameState)
            TableUtil.set_tag(mj,self.initData.tableView.tagSpriteH,tagType)
            if( self:is_laizi(pai, gameState) and (not self.ConfigData.laiziNoYellow)) then
                TableUtil.set_mj_color(mj, Color.yellow)
            else
                TableUtil.set_mj_color(mj, Color.white)
            end
        else
            ---兼容老框架
            if(self:is_laizi(pai,gameState)) then
                TableUtil.set_laizi_tag(mj, self.TagSpriteH,self.ConfigData)
            end
        end

        if(showHu) then
            ComponentUtil.SafeSetActive(tag, true)
            tagImage.sprite = self.TagSpriteH:FindSpriteByName("2")
            mj.transform.localPosition = mj.transform.localPosition + Vector3.New(xlastOffset, 0, 0)
        end
    end

    for i=1, #playerState.HuaPai do
        local mj = nil
        local pai = playerState.HuaPai[i]
        if(i <= #huaChilds) then
            mj = huaChilds[i]
        else
            mj = TableUtil.poor("MJ", playerTranData.huaGrid, Vector3.zero, self.poorObjs, self.clones, Vector3.New(1,1,1)) 
        end
        TableUtil.set_mj(pai, mj, self.mjScaleSet)
        TableUtil.set_mj_bg(1, mj, self.mjColorSet)

        if self.initData.tableView.get_hua_tag_type then
            local tagType = self.initData.tableView:get_hua_tag_type(pai,gameState)
            TableUtil.set_tag(mj,self.initData.tableView.tagSpriteH,tagType)
            if( self:is_laizi(pai, gameState) and (not self.ConfigData.laiziNoYellow) ) then
                TableUtil.set_mj_color(mj, Color.yellow)
            else
                TableUtil.set_mj_color(mj, Color.white)
            end
        else
            ---兼容老框架
            if(self:is_laizi(pai, gameState)) then
                TableUtil.set_laizi_tag(mj, self.TagSpriteH,self.ConfigData)
            end
        end


        ComponentUtil.SafeSetActive(mj, true)
        ---处理 黄石晃晃麻将 赖子杠和红中杠/发财杠
        ---是的你没看错，就是用显示花牌的地方显示上面那些东东
        if self.ConfigData.isHuangShiHH then
            self:HSHHTagPorcess(mj,pai)
        end
    end

    if self.ConfigData.isShowFanShuWhileOneGameResult then
        playerTranData.fanShuObj:SetActive(true)
        playerTranData.fanShuText.text = tostring(playerState.FanShu)
    end
end

---黄石晃晃花牌标记处理
function OneGameResultView:HSHHTagPorcess(mj,pai)
    local tag = GetComponentWithPath(mj, "Image/Tag", ComponentTypeName.Transform).gameObject
    local tagImage = GetComponentWithPath(mj, "Image/Tag", ComponentTypeName.Image)
    local tagSH = GetComponentWithPath(mj, "Image/Tag", "SpriteHolder")
    tag:SetActive(true)
    if gameState.LaiZi == pai then
        tagImage.sprite = tagSH:FindSpriteByName("3")
    else
        tagImage.sprite = tagSH:FindSpriteByName("10")
    end
end

function OneGameResultView:insert_mj_by_pai(mjTable, pai, mj)
    local paiStr = pai .. ""
    if(not mjTable[paiStr]) then
        mjTable[paiStr] = {}
    end
    table.insert(mjTable[paiStr], mj)
end

function OneGameResultView:Init_MaiMaPanel(data) 
    self.contents = TableUtil.get_all_child(self.MaiMaCopyParent)
    local item = {}
    item[1] = nil
    for i=2,#self.contents do
        UnityEngine.GameObject.Destroy(self.contents[i])
        item[i] = nil
    end

    self.MaiMaPanel:SetActive(true)
    
    for i=1, #data.MaiMa do
        if(#data.MaiMa > 8) then
            item[i] = TableUtil.clone(self.MaiMaCopyItem1,self.MaiMaCopyParent1,UnityEngine.Vector3.zero)
        else
            item[i] = TableUtil.clone(self.MaiMaCopyItem,self.MaiMaCopyParent,UnityEngine.Vector3.zero)
        end
        TableUtil.set_mj(data.MaiMa[i], item[i], self.mjScaleSet, self.frontSpriteH)
        TableUtil.set_mj_bg(1, item[i], self.mjColorSet)
        item[i]:SetActive(true)
    end

    local idx
    for i=1, #data.ZhongMa do
        idx = data.ZhongMa[i]+1
        
        GetComponentWithPath(item[idx], "HighLight", ComponentTypeName.Transform).gameObject:SetActive(true)
    end
end

function OneGameResultView:handle_hufa(hufa, max)
    local addStr = ""
    if(string.len(hufa) < max) then
        for i=1,max-string.len(hufa) do
            addStr = addStr .. " "
        end
    end
    return hufa .. addStr
end

-- 显示总结算界面
function OneGameResultView:show_totalgameresult_module()
    if self.timeEventID then
        CSmartTimer:Kill(self.timeEventID)
        self.timeEventID = nil
    end
    local initData = {}
    initData.gameState = self.initData.gameState
    ModuleCache.ModuleManager.show_module("majiang", "totalgameresult",initData)
    ModuleCache.ModuleManager.destroy_module("majiang", "onegameresult")
end

function OneGameResultView:refresh_mj_color_scale()
    local config = curTableData.playModelData
    local defaultScale = 0
    local defaultColor = 0
    if(config and config.cardTheame) then
        local strs = string.split(config.cardTheame, "|")
        defaultScale = tonumber(strs[1])
        defaultColor = tonumber(strs[2])
    end
    self.mjScaleSet = PlayerPrefs.GetInt(string.format("%s_MJScale",curTableData.ruleJsonInfo.GameType), defaultScale)
    self.mjColorSet = PlayerPrefs.GetInt(string.format("%s_MJColor",curTableData.ruleJsonInfo.GameType), defaultColor)
end

function OneGameResultView:is_laizi(pai, newGameState)
    local isLai = newGameState.LaiZi == pai
    if newGameState.LaiZis then
        for i=1,#newGameState.LaiZis do
            local laiZiPai = newGameState.LaiZis[i]
            if laiZiPai == pai then
                isLai = true
            end
        end
    end
    return pai ~= 0 and (isLai or (self.ConfigData.isWuZhou and newGameState.LaiGen == pai and curTableData.ruleJsonInfo.GuiPai == 2))
end

return  OneGameResultView