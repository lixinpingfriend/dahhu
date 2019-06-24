




local class = require("lib.middleclass")
local Base = require('package.majiang.module.tablenew.view.tablecommon_view')
---@class TableHaiAnMaJiangView:TableCommonView
local TableHaiAnMaJiangView = class('tableHaiAnMaJiangView', Base)
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local TableUtil = TableUtil
local Color = Color
---@type Mj2DManager
local MjManager = require('package.majiang.module.tablenew.mj2d_manager')

function TableHaiAnMaJiangView:refresh_voice_shake()
    Base.refresh_voice_shake(self)
    self.openGuoHu = true
end

function TableHaiAnMaJiangView:init_ui()
    Base.init_ui(self)
    self.baoPaiGrid = GetComponentWithPath(self.root, "Left/Child/BaoPai/Grid", ComponentTypeName.Transform).gameObject
    local s1 = "majiang/module/table/ntha/baozi.prefab"
    local s2 = "BaoZi"
    self.baoZi = ModuleCache.ViewUtil.InitGameObject(s1, s2,self.baoPaiGrid)
    self.baoZi:SetActive(false)
    self.baoZiDiceImage =  GetComponentWithPath(self.baoZi, "DiceImage",ComponentTypeName.Image)
    self.diceAtlas = self.diceImage1SH --- diceImage1SH 在 table_view 中初始化的
end

function TableHaiAnMaJiangView:game_state_end()
    Base.game_state_end(self)
    if 0 ~= self.gameState.Dice1 then
        self:play_dice(nil,self.gameState.Dice1,self.gameState.Dice2)
    end
end

---重载开杠打色，用来显示豹子标记,可以再坑点？？？？？是的就是这么坑，不服单挑
function TableHaiAnMaJiangView:show_kaigang_dice(dice1,dice2,callback)
    local diceValue = (dice1 == dice2) and dice1 or 0
    if not self.ruleJsonInfo["BaoZi"] then
        diceValue = 0
    end
    self:set_bao_zi(diceValue)
    if callback then
        callback()
    end
end

---设置左上角豹子标记
function TableHaiAnMaJiangView:set_bao_zi(diceValue)
    diceValue = diceValue or 0
    if 0 == diceValue then
        self.baoZi:SetActive(false)
        return
    end
    self.baoZi:SetActive(true)
    self.baoZiDiceImage.sprite = self.diceAtlas:FindSpriteByName(tostring(diceValue))
    self.baoPai:SetActive(true)
end

return TableHaiAnMaJiangView