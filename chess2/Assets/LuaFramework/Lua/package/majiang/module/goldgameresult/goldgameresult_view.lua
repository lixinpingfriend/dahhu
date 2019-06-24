




local class = require("lib.middleclass")
local Base = require('core.mvvm.view_base')

---@class GoldGameResultView:View
local GoldGameResultView = class('goldGameResultView', Base)

local Util = Util
local ModuleCache = ModuleCache
local TableUtil = TableUtil
local ComponentUtil = ModuleCache.ComponentUtil
local TableManager = TableManager
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local ComponentTypeName = ModuleCache.ComponentTypeName

---初始化
function GoldGameResultView:initialize(...)
    Base.initialize(self, "majiang/module/goldgameresult/majiang_goldgameresult.prefab", "MaJiang_GoldGameResult", 0)

    Base.set_1080p(self)

    self.closeBtn  = GetComponentWithPath(self.root, "TopLeft/Child/closeBtn", ComponentTypeName.Transform).gameObject
    self.changeTableBtn = GetComponentWithPath(self.root, "TopRight/Child/changeTableBtn", ComponentTypeName.Transform).gameObject
    self.shareBtn = GetComponentWithPath(self.root, "Bottom/Child/shareBtn", ComponentTypeName.Transform).gameObject
    self.continueBtn = GetComponentWithPath(self.root, "Bottom/Child/continueBtn", ComponentTypeName.Transform).gameObject

    self.BaseCoinScoreText = GetComponentWithPath(self.root, "Bottom/Child/BaseCoinScoreText", ComponentTypeName.Text)
    self.FeeNumText = GetComponentWithPath(self.root, "Bottom/Child/FeeNumText", ComponentTypeName.Text)

    local config = TableManager.curTableData.gameRuleConfig
    local wanfaType = Config.GetWanfaIdx(TableManager.curTableData.ruleJsonInfo.GameType)
    if(wanfaType > #config.createRoomTable) then
        wanfaType = 1
    end
    self.ConfigData = config.createRoomTable[wanfaType]
end

---刷新界面
function GoldGameResultView:refresh_view(gameState)
    self:refreshRoomInfo(gameState)
    self:refreshPlayerInfo(gameState)
end

---刷新房间信息
function GoldGameResultView:refreshRoomInfo(gameState)
    self.BaseCoinScoreText.text = "本局底分:"..tostring(gameState.BaseCoinScore)
    self.FeeNumText.text = "本局服务费:"..tostring(gameState.FeeNum)
    self.comView:on_refreshRoomInfo(gameState)
end

---刷新玩家结算信息
function GoldGameResultView:refreshPlayerInfo(gameState)
    self.comView:on_refreshPlayerInfo(gameState)
end

function GoldGameResultView:calculateFuFa(index,gameState)
    local strHuFa = ""
    local hufaTable = {}
    local playerState = gameState.Player[index]
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
                --playerTranData.objChengBao:SetActive(true)
                --playerTranData.textScore.transform.localPosition = playerTranData.textScore.transform.localPosition - Vector3.New(0, 20, 0)
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
    return strHuFa
end


return GoldGameResultView