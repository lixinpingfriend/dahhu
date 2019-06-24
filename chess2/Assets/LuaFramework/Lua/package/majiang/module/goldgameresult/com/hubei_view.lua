




local class = require("lib.middleclass")
---@type GoldResultComViewBase
local Base = require('package.majiang.module.goldgameresult.com.base.com_view_base')

---@class GoldResult_HuBei_view:GoldResultComViewBase
local GoldResult_HuBei_view = class('goldResult_HuBei_view', Base)

local Util = Util
local ModuleCache = ModuleCache
local TableUtil = TableUtil
local ComponentUtil = ModuleCache.ComponentUtil
local TableManager = TableManager
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ComponentTypeName = ModuleCache.ComponentTypeName
local Vector3 = Vector3
local Color = UnityEngine.Color

function GoldResult_HuBei_view:new()
    local view = {}
    setmetatable(view, { __index = GoldResult_HuBei_view })
    return view
end

function GoldResult_HuBei_view:onInit(rootObj)
    Base.onInit(self,rootObj)
    self.poorObjs = {}
end

function GoldResult_HuBei_view:on_init_players_info_holder()
    Base.on_init_players_info_holder(self)
    local totalSeat = TableManager.curTableData.totalSeat
end

function GoldResult_HuBei_view:on_init_info_holder(root,infoHolder)
    Base.on_init_info_holder(self,root,infoHolder)
    infoHolder.locationText = GetComponentWithPath(root, "nameText/locationText", ComponentTypeName.Text)
    infoHolder.totalText = GetComponentWithPath(root, "totalText", ComponentTypeName.Text)
    infoHolder.addInfoParent = GetComponentWithPath(root, "ScrollView/Viewport/Content", ComponentTypeName.Transform).gameObject
    infoHolder.winerBg = GetComponentWithPath(root, "winerBg", ComponentTypeName.Transform).gameObject
    infoHolder.winerTag = GetComponentWithPath(root, "winerTag", ComponentTypeName.Transform).gameObject
end

function GoldResult_HuBei_view:on_refreshPlayerInfo(gameState)
    local winerIndex = 1
    for i=1,#gameState.Player do
        if #gameState.Player[i].HuPai ~= 0 then
            winerIndex = i
            break
        end
    end
    self.winerIndex = winerIndex
    Base.on_refreshPlayerInfo(self,gameState)
end

function GoldResult_HuBei_view:on_setPlayerInfo(index,infoHolder,gameState)
    index = (#gameState.Player - index + 1)
    Base.on_setPlayerInfo(self,index,infoHolder,gameState)
    local scoreSettle = gameState.ScoreSettle[index]

    local localSeat = TableUtil.get_local_seat(index - 1, TableManager.curTableData.SeatID, TableManager.curTableData.totalSeat)

    ComponentUtil.SafeSetActive(infoHolder.winerTag,index == self.winerIndex)
    ComponentUtil.SafeSetActive(infoHolder.winerBg,false)
    if 1 ~= localSeat then
        ComponentUtil.SafeSetActive(infoHolder.winerBg,index == self.winerIndex)
        ComponentUtil.SafeSetActive(infoHolder.otherBg,index ~= self.winerIndex)
    end

    infoHolder.totalText.text =  "总计：x"..tostring(scoreSettle.OwerBeishu)

    local hufaTable = self:calculateFuFa(index,gameState)
    local childs = TableUtil.get_all_child(infoHolder.addInfoParent)
    for i=1,#hufaTable do
        local hufaInfo = hufaTable[i]
        local infoObj = nil
        if(i <= #childs) then
            infoObj = childs[i]
        else
            infoObj = TableUtil.poor("Template",infoHolder.addInfoParent, Vector3.zero, self.poorObjs, self.clones)
        end

        local titelText = GetComponentWithPath(infoObj, "titelText", ComponentTypeName.Text)
        local beiShuText = GetComponentWithPath(infoObj, "beiShuText", ComponentTypeName.Text)

        local nameTex =  hufaInfo.Name
        local beiShuTex = hufaInfo.addStr
        if 1 == localSeat then
            nameTex = "<color=#93d6f7>"..nameTex.."</color>";
            beiShuTex = "<color=#ffe63b>"..beiShuTex.."</color>";
        else
            nameTex = "<color=#84590f>"..nameTex.."</color>";
            beiShuTex = "<color=#e63e0f>"..beiShuTex.."</color>";
        end
        titelText.text = nameTex
        beiShuText.text = beiShuTex
    end
end

function GoldResult_HuBei_view:calculateFuFa(index,gameState)
    local hufaTable = {}
    local playerState = gameState.Player[index]
    for i=1,#playerState.HuFa do
        local hufa = playerState.HuFa[i]
        local hufaInfo = {}
        local addStr = ""
        local opeStr =  ""
        if 0 == hufa.SymbolType then
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
        else
            local unitStr = hufa.Unit
            local opeStr = ""
            if 1 == hufa.SymbolType then
                opeStr = ""
                addStr = opeStr..tostring(hufa.Fen)..unitStr
                if 0 == hufa.Fen then
                    addStr = ""
                end
            elseif 2 == hufa.SymbolType then
                if hufa.Fen > 0 then
                    opeStr = "+"
                end
                addStr = opeStr..tostring(hufa.Fen)..unitStr
            elseif 3 == hufa.SymbolType then
                opeStr = "x"
                addStr = opeStr..tostring(hufa.Fen)..unitStr
            end
        end
        hufaInfo.Name = hufa.Name
        hufaInfo.addStr = addStr
        table.insert(hufaTable,hufaInfo)
    end
    return hufaTable
end

return GoldResult_HuBei_view