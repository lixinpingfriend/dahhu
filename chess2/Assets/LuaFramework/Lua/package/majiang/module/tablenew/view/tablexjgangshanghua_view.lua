

local class = require("lib.middleclass")
local Base = require('package.majiang.module.tablenew.view.tablecommon_view')
---@class TableXJGangShangHuaView:TableCommonView
local TableXJGangShangHuaView = class('tableXJGangShangHuaView', Base)
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local TableUtil = TableUtil
---@type Mj2DManager
local MjManager = require('package.majiang.module.tablenew.mj2d_manager')
---@type Mj2D
local Mj2D = require('package.majiang.module.tablenew.mj.mj2d')

function TableXJGangShangHuaView:init_ui()
    Base.init_ui(self)
    self.bigHuaSwitchState:SwitchState("BigHua")
    self.xjGangShangHuaTip = GetComponentWithPath(self.root, "Center/Child/YangZhouTip", ComponentTypeName.Transform).gameObject
    self.actionYaHu = GetComponentWithPath(self.waitAction, "Button_YaHu", ComponentTypeName.Transform).gameObject
end

function TableXJGangShangHuaView:reset_state()
    Base.reset_state(self)
    self.xjGangShangHuaTip:SetActive(false)
end

--- 初始化单个座位
function TableXJGangShangHuaView:init_seat(seatHolder, index)
    seatHolder.objYaHu = GetComponentWithPath(seatHolder.seatRoot, "Info/ImageYa", ComponentTypeName.Image).gameObject
end

---癞根
function TableXJGangShangHuaView:game_state_lai_gen(show)
    show = self.gameState.JiangPai and #self.gameState.JiangPai > 0
    self.laiGenMJ:SetActive(show)
    if(not show) then
        if(#self.gameState.Dun > 0 and self.gameState.Result == 0) then
            self.xjGangShangHuaTip:SetActive(true)
        end
        return
    end
    ---@type Mj2D
    local mj = Mj2D:new(self.gameState.JiangPai[1], nil, {gameObject = self.laiGenMJ, spriteHolder = self.frontSpriteH})
    mj:set_skin(self.mjColorSet, self.mjScaleSet)
    MjManager.insert(mj, MjManager.mjType.custom)
    self.laiGenText.text = "杠后牌"
    self.baoPai:SetActive(true)
    self.xjGangShangHuaTip:SetActive(false)
end

---开始设置玩家状态（gameState）
function TableXJGangShangHuaView:game_state_begin_set_player_state(playerState, localSeat, serverSeat)
    Base.game_state_begin_set_player_state(self, playerState, localSeat, serverSeat)
    local seatHolder = self.seatHolderArray[localSeat]
    seatHolder.objYaHu:SetActive(playerState.HuaPai and #playerState.HuaPai > 0)
end

--- 开始刷新gameState
function TableXJGangShangHuaView:game_state_begin(gameState)
    Base.game_state_begin(self, gameState)
    self:show_ke_ya_hua(#gameState.KeYaHu > 0)
end

---可压胡
function TableXJGangShangHuaView:show_ke_ya_hua(show)
    self.actionYaHu:SetActive(show)
    if(show) then
        self:show_wait_action()
    end
end

return  TableXJGangShangHuaView