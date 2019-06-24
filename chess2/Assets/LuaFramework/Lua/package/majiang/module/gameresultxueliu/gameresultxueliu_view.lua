local class = require("lib.middleclass")
---@type GameResultViewBase
local Base = require('package.majiang.module.gameresultbase.gameresultbase_view')
---@class GameResultXueLiuView:GameResultViewBase
local GameResultXueLiuView = class('gameResultXueLiuView', Base)

local Util = Util
local ModuleCache = ModuleCache
local TableUtil = TableUtil
local ComponentUtil = ModuleCache.ComponentUtil
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ComponentTypeName = ModuleCache.ComponentTypeName
local TableManager = TableManager

---初始化
function GameResultXueLiuView:initialize(...)
    Base.initialize(self, "majiang/module/gameresult/majiang_gameresult_xlch.prefab", "MaJiang_GameResult_XLCH", 0)
    Base.set_1080p(self)
    self.poorObjs = {}
    self.gameInfoParent = GetComponentWithPath(self.root,"Center/Child/GameInfo/ScrollView/Viewport/Content",ComponentTypeName.Transform).gameObject
    self.locationTexs = {"本家","下家","对家","上家"}
    self.myFenShuText = GetComponentWithPath(self.root,"Center/Child/PlayerInfos/1/beiShuText",ComponentTypeName.Text)
    self.clones = TableUtil.get_all_child(self.hodlerRoot)
end

function GameResultXueLiuView:on_init_all_player_hodlers()
    local playerInfoRoot = GetComponentWithPath(self.root,"Center/Child/PlayerInfos", ComponentTypeName.Transform).gameObject
    for i=1,4 do
        local hodlerObj = GetComponentWithPath(playerInfoRoot,tostring(i),ComponentTypeName.Transform).gameObject
        local hodler = {}
        hodler.gameObject = hodlerObj
        hodler.headImage = GetComponentWithPath(hodler.gameObject,"handMask/handImage",ComponentTypeName.Image)
        hodler.bankerTag = GetComponentWithPath(hodler.gameObject,"bankerTag",ComponentTypeName.Transform).gameObject
        hodler.locationText = GetComponentWithPath(hodler.gameObject,"location/locationText",ComponentTypeName.Text)
        hodler.nameText = GetComponentWithPath(hodler.gameObject,"nameText",ComponentTypeName.Text)
        hodler.actualAmountTextSubText = GetComponentWithPath(hodler.gameObject,"actualAmountTextSub",ComponentTypeName.Text)
        hodler.actualAmountTextAddText = GetComponentWithPath(hodler.gameObject,"actualAmountTextAdd",ComponentTypeName.Text)
        table.insert(self.playerInfoHodlers,hodler)
    end
end

function GameResultXueLiuView:refersh_player_infos(gameState,curTableData)
    local tempTable = {}
    for i=1,#gameState.Player do
        local playerState = gameState.Player[i]
        table.insert(tempTable,{index = i , playerState = playerState})
    end
    for i=1,#tempTable do
        local data = tempTable[i]
        if data.index == curTableData.SeatID + 1 then
            table.remove(tempTable,i)
            table.insert(tempTable,1,data)
            break
        end
    end
    for i=1,#tempTable do
        local data = tempTable[i]
        self:on_refersh_player_info(data.index,data.playerState,gameState,curTableData,i)
    end
end

function GameResultXueLiuView:on_refersh_player_info(index,playerState,gameState,curTableData,disPos)
    local localSeat = TableUtil.get_local_seat(index - 1,curTableData.SeatID,curTableData.totalSeat)
    local infoHolder = self.playerInfoHodlers[disPos]
    local playerId = playerState.UserID
    infoHolder.nameText.text = tostring(playerId)
    TableUtil.download_seat_detail_info(playerId, function(playerInfo)
        if self.isDestroy then 
            return
        end
        infoHolder.headImage.sprite = playerInfo.headImage
    end, function(playerInfo)
        if self.isDestroy then 
            return
        end
        local tex = Util.filterPlayerName(playerInfo.playerName, 10)
        infoHolder.nameText.text = tex
    end)
    infoHolder.actualAmountTextSubText.text = ""
    infoHolder.actualAmountTextAddText.text = ""
    local beiShu = playerState.BeiShu 
    if beiShu == 0 then
        infoHolder.actualAmountTextAddText.text = "0"
    elseif beiShu > 0 then
        infoHolder.actualAmountTextAddText.text = "+"..tostring(beiShu)
    else
        infoHolder.actualAmountTextSubText.text = tostring(beiShu)
    end
    infoHolder.locationText.text = self.locationTexs[localSeat]
    infoHolder.bankerTag:SetActive(gameState.ZhuangJia == index - 1)
end

function GameResultXueLiuView:on_refersh_room_info(gameState,curTableData)
    Base.on_refersh_room_info(self,gameState,curTableData)
    local ScoreRecord = gameState.ScoreRecord  
    local totalBeiShu = 0
    local childs = TableUtil.get_all_child(self.gameInfoParent)
    for i=1,#ScoreRecord do
        local data = ScoreRecord[i]

        local sourceSeatID = data.sourceSeatID 
        local targetSeatID = data.targetSeatID
        local beiShu = data.beiShu   
        local amount = data.amount
        local sourceDescribe = data.sourceDescribe 
        local targetDescribe = data.targetDescribe

        local index = nil
        if sourceSeatID == TableManager.curTableData.SeatID then
            index = targetSeatID
        elseif targetSeatID == TableManager.curTableData.SeatID then
            index = sourceSeatID
        end
        
        if index then
            local infoObj = nil
            if(i <= #childs) then
                infoObj = childs[i]
            else
                infoObj = TableUtil.poor("Template",self.gameInfoParent, Vector3.zero, self.poorObjs, self.clones)
            end
            local titelText = GetComponentWithPath(infoObj, "titelText", ComponentTypeName.Text)
            local beiShuText = GetComponentWithPath(infoObj, "BeiShuText", ComponentTypeName.Text)
            local locationText = GetComponentWithPath(infoObj, "locationText", ComponentTypeName.Text)
            local actualAmountText =  GetComponentWithPath(infoObj, "actualAmountText", ComponentTypeName.Text)
            
            local actualAmount = amount

            local desTex = nil
            if sourceSeatID == TableManager.curTableData.SeatID then
                desTex = sourceDescribe
                actualAmount = -actualAmount
            elseif targetSeatID == TableManager.curTableData.SeatID then
                desTex = targetDescribe
            end 
    
            titelText.text = desTex
    
            beiShuText.text = "" --beiShu.."倍"
            totalBeiShu = totalBeiShu + beiShu

            local localSeat = TableUtil.get_local_seat(index, TableManager.curTableData.SeatID, TableManager.curTableData.totalSeat)
            locationText.text = self.locationTexs[localSeat]
    
            local text = tostring(actualAmount)
            if actualAmount > 0 then
                text = "+"..text
            end
            actualAmountText.text = text
        end
    end

    self.myFenShuText.text = totalBeiShu.."倍"
end


return GameResultXueLiuView