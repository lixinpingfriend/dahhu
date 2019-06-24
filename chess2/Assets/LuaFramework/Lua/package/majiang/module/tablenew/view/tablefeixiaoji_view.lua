

local class = require("lib.middleclass")
local Base = require('package.majiang.module.tablenew.view.tablecommon_view')
---@class TableFeiXiaoJiView:TableCommonView
local TableFeiXiaoJiView = class('tableFeiXiaoJiView', Base)
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local TableUtil = TableUtil
local Vector3 = Vector3
---@type Mj2DManager
local MjManager = require('package.majiang.module.tablenew.mj2d_manager')
---@type Mj2D
local Mj2D = require('package.majiang.module.tablenew.mj.mj2d')

function TableFeiXiaoJiView:init_ui()
    Base.init_ui(self)
    self.feixiaoJi = GetComponentWithPath(self.root, "Bottom/Child/FeiXiaoJiBg", ComponentTypeName.Transform).gameObject
    self.feixiaoJiMJ1 = GetComponentWithPath(self.root, "Bottom/Child/FeiXiaoJiBg/BuZhang_1", ComponentTypeName.Transform).gameObject
    self.feixiaoJiMJ2 = GetComponentWithPath(self.root, "Bottom/Child/FeiXiaoJiBg/BuZhang_2", ComponentTypeName.Transform).gameObject
end

--- 开始刷新gameState
function TableFeiXiaoJiView:game_state_begin(gameState)
    Base.game_state_begin(self, gameState)
    self:show_bu_zhang(self.gameState.KeBuZhang and #self.gameState.KeBuZhang > 0)
end

--- 显示补张
function TableFeiXiaoJiView:show_bu_zhang(show)
    self.feixiaoJi:SetActive(show)
    if(not show) then
        return
    end
    ---@type Mj2D
    local mj = Mj2D:new(self.gameState.KeBuZhang[1], nil, {gameObject = self.feixiaoJiMJ1, spriteHolder = self.frontSpriteH})
    mj:set_skin(self.mjColorSet, self.mjScaleSet)
    MjManager.insert(mj, MjManager.mjType.custom)
    if(#self.gameState.KeBuZhang > 1) then
        self.feixiaoJiMJ2:SetActive(true)
        local mj = Mj2D:new(self.gameState.KeBuZhang[2], nil, {gameObject = self.feixiaoJiMJ2, spriteHolder = self.frontSpriteH})
        mj:set_skin(self.mjColorSet, self.mjScaleSet)
        MjManager.insert(mj, MjManager.mjType.custom)
        self.feixiaoJiMJ1.transform.localPosition = Vector3.New(-83, self.feixiaoJiMJ1.transform.localPosition.y, 0)
        self.feixiaoJiMJ2.transform.localPosition = Vector3.New(83, self.feixiaoJiMJ2.transform.localPosition.y, 0)
    else
        self.feixiaoJiMJ2:SetActive(false)
        self.feixiaoJiMJ1.transform.localPosition = Vector3.New(0, self.feixiaoJiMJ1.transform.localPosition.y, 0)
    end
end

---癞子
function TableFeiXiaoJiView:game_state_lai_zi(show)
    show = self.gameState.JiangPai and #self.gameState.JiangPai > 1
    self.laiZiMJ:SetActive(show)
    if(not show) then
        return
    end
    ---@type Mj2D
    local mj = Mj2D:new(self.gameState.JiangPai[2], nil, {gameObject = self.laiZiMJ, spriteHolder = self.frontSpriteH})
    mj:set_skin(self.mjColorSet, self.mjScaleSet)
    MjManager.insert(mj, MjManager.mjType.custom)
    self.laiZiText.text = ""
    self.baoPai:SetActive(true)
end

---癞根
function TableFeiXiaoJiView:game_state_lai_gen(show)
    show = self.gameState.JiangPai and #self.gameState.JiangPai > 0
    self.laiGenMJ:SetActive(show)
    if(not show) then
        return
    end
    ---@type Mj2D
    local mj = Mj2D:new(self.gameState.JiangPai[1], nil, {gameObject = self.laiGenMJ, spriteHolder = self.frontSpriteH})
    mj:set_skin(self.mjColorSet, self.mjScaleSet)
    MjManager.insert(mj, MjManager.mjType.custom)
    if(self.laiZiMJ.activeSelf) then
        self.baoPaiMidText.text = "杠上花"
        self.laiGenText.text = ""
    else
        self.baoPaiMidText.text = ""
        self.laiGenText.text = "杠上花"
    end
    self.baoPai:SetActive(true)
end

return  TableFeiXiaoJiView