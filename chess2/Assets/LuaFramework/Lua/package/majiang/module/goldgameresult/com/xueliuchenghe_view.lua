




local class = require("lib.middleclass")
---@type GoldResultComViewBase
local Base = require('package.majiang.module.goldgameresult.com.base.com_view_base')

---@class GoldResult_XueLiuChengHe_view:GoldResultComViewBase
local GoldResult_XueLiuChengHe_view = class('goldResult_XueLiuChengHe_view', Base)

local Util = Util
local ModuleCache = ModuleCache
local TableUtil = TableUtil
local ComponentUtil = ModuleCache.ComponentUtil
local TableManager = TableManager
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ComponentTypeName = ModuleCache.ComponentTypeName
local Vector3 = Vector3
local Color = UnityEngine.Color


function GoldResult_XueLiuChengHe_view:new()
    local view = {}
    setmetatable(view, { __index = GoldResult_XueLiuChengHe_view })
    return view
end

function GoldResult_XueLiuChengHe_view:onInit(rootObj)
    Base.onInit(self,rootObj)
    self.gameInfoParent = GetComponentWithPath(self.root, "Center/Child/GameInfo/ScrollView/Viewport/Content", ComponentTypeName.Transform).gameObject
    self.poorObjs = {}
end

function GoldResult_XueLiuChengHe_view:on_init_players_info_holder()
    Base.on_init_players_info_holder(self)
    local totalSeat = TableManager.curTableData.totalSeat
    if 3 == totalSeat then
        local infoHolder2 = self.infoHolders[2]
        infoHolder2.gameObject.transform.localPosition = Vector3(-300,0,0)
        local infoHolder3 = self.infoHolders[3]
        infoHolder3.gameObject.transform.localPosition = Vector3(300,0,0)
    end
end

function GoldResult_XueLiuChengHe_view:on_init_info_holder(root,infoHolder)
    Base.on_init_info_holder(self,root,infoHolder)
    infoHolder.selfAddInfoText = GetComponentWithPath(root, "selfAddInfoText", ComponentTypeName.Text)
    infoHolder.otherAddInfoText = GetComponentWithPath(root, "otherAddInfoText", ComponentTypeName.Text)
end

---刷新玩家结算信息
function GoldResult_XueLiuChengHe_view:on_refreshPlayerInfo(gameState)
    local totalSeat = TableManager.curTableData.totalSeat
    local myIndex = TableManager.curTableData.SeatID
    local optIndexs = {}
    local curIndex = myIndex + 1
    for i=1,totalSeat do
        table.insert(optIndexs,curIndex)
        curIndex = curIndex + 1
        if curIndex > totalSeat then
            curIndex = 1
        end
    end
    local maxLen = #self.infoHolders
    for i=1,maxLen do
        local infoHolder = self.infoHolders[i]
        if i > totalSeat then
            ComponentUtil.SafeSetActive(infoHolder.gameObject,false)
        else
            ComponentUtil.SafeSetActive(infoHolder.gameObject,true)
            self:on_setPlayerInfo(optIndexs[i],infoHolder,gameState)
        end
    end
    self:setResultInfo(gameState)
end

function GoldResult_XueLiuChengHe_view:on_setPlayerInfo(index,infoHolder,gameState)
    Base.on_setPlayerInfo(self,index,infoHolder,gameState)
    local playerState = gameState.Player[index]
    local playerId = playerState.UserID
    local localSeat = TableUtil.get_local_seat(index - 1, TableManager.curTableData.SeatID, TableManager.curTableData.totalSeat)
    local actualAmount = gameState.ScoreSettle[index].ActualAmount
    infoHolder.selfAddInfoText.text = ""
    infoHolder.otherAddInfoText.text = ""
    if 1 == localSeat then
        infoHolder.selfAddInfoText.text = self:calculateAddInfo(index,gameState)
    else
        infoHolder.otherAddInfoText.text = self:calculateAddInfo(index,gameState)
    end
end

function GoldResult_XueLiuChengHe_view:setResultInfo(gameState)
    local datas = {}
    local ScoreSettles = gameState.ScoreSettle
    for j=1,#ScoreSettles do
        local index = j
        local ScoreSettle = ScoreSettles[j]
        for i=1,#ScoreSettle.DtailData do
            local dtail = ScoreSettle.DtailData[i]
            local info =
            {
                Name = dtail.name,
                ActualAmount = dtail.amount,
                Index = j,
                BeiShu = dtail.beishu,
                ExState = dtail.exstate,
            }
            table.insert(datas,info)
        end
    end

    local childs = TableUtil.get_all_child(self.gameInfoParent)
    for i=1,#datas do
        local data = datas[i]
        local infoObj = nil
        if(i <= #childs) then
            infoObj = childs[i]
        else
            infoObj = TableUtil.poor("Template", self.gameInfoParent, Vector3.zero, self.poorObjs, self.clones)
        end
        local titelText = GetComponentWithPath(infoObj, "", ComponentTypeName.Text)
        local beiShuText = GetComponentWithPath(infoObj, "BeiShuText", ComponentTypeName.Text)
        local locationText = GetComponentWithPath(infoObj, "locationText", ComponentTypeName.Text)
        local actualAmountText =  GetComponentWithPath(infoObj, "actualAmountText", "TextWrap")
        local winTopTag =  GetComponentWithPath(infoObj, "winTopTag", ComponentTypeName.Transform).gameObject

        titelText.text = data.Name

        beiShuText.text = data.BeiShu.."倍"

        local localSeat = TableUtil.get_local_seat(data.Index - 1, TableManager.curTableData.SeatID, TableManager.curTableData.totalSeat)
        locationText.text = self.locationTexs[localSeat]

        local actualAmount = data.ActualAmount
        local text = Util.filterPlayerGoldNum(actualAmount)
        if actualAmount == 0 then
            actualAmountText.atlas = self.GoldNumbersHolder
        elseif actualAmount >= 0 then
            actualAmountText.atlas = self.GoldNumbersHolder
            text = "+"..text
        else
            actualAmountText.atlas = self.BlueNumbersHolder
        end
        actualAmountText.text = text
        ComponentUtil.SafeSetActive(winTopTag,data.ExState == 1)
    end
end

function GoldResult_XueLiuChengHe_view:calculateAddInfo(index,gameState)
    return ""
end

return GoldResult_XueLiuChengHe_view