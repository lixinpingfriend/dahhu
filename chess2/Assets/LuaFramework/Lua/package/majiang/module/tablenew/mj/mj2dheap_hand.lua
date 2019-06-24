




local Mj2DHeap = require('package.majiang.module.tablenew.mj.mj2dheap')
---@type Mj2D
local Mj2D = require('package.majiang.module.tablenew.mj.mj2d')
---@type Mj2DManager
local MjManager = require('package.majiang.module.tablenew.mj2d_manager')

local class = require("lib.middleclass")
---@class Mj2DHeapHand:Mj2DHeap
local Mj2DHeapHand = class("mj2dHeapHand", Mj2DHeap)
local Color = Color
local Vector3 = Vector3
local lastMJOffset = 20 --最后一张牌位移

--- 设置手牌 handData 手牌数据 localSeat 本地座位 dataIndex 手牌数据索引 index 手牌索引
--- playerState 玩家整个数据 showHu 显示胡  lastMjMove 最后的牌是否偏移 notYellow 癞子不变色（特殊）
function Mj2DHeapHand:add_mj(params)
    ---@type Mj2D
    local mj = Mj2D:new(params.handData.Pai, nil,
        {gameObject = params.seatHolder.handObjs[params.index], index = params.dataIndex,
            spriteHolder = params.spriteHolder, tagSpriteHolder = params.tagSpriteHolder})
    local skinObj
    local isOpen = true
    if(self.view:pai_is_open(params.playerState, params.handData)) then
        skinObj = mj:set_state(2)
    elseif(self.view:pai_is_covered(params.handData) and params.localSeat ~= 1) then
        skinObj = mj:set_state(3)
    else
        isOpen = false
        skinObj = mj:set_state(1)
    end
    mj.skinObj = skinObj
    mj.dataIndex = params.dataIndex ---真实数据索引
    mj.index = params.index ---位置索引
    mj:hide_tag(skinObj)
    mj:set_skin(self.view.mjColorSet, self.view.mjScaleSet, skinObj)
    mj:set_disable(params.handData.Gray)
    if(params.handData.Gray) then
        mj:set_color(Color.gray, skinObj)
        mj:set_def_color(Color.gray)
    else
        mj:set_color(Color.white, skinObj)
        mj:set_def_color(Color.white)
    end
    mj:set_red_point(params.handData.IsFromOther, skinObj)
    params.isOpen = isOpen
    params.mj = mj
    self:set_mj(params)
    if(params.localSeat == 1 or isOpen) then
        mj:set_top_icon(Mj2D.topIconType.none,self.view.mjTopIconAtlas)
        if(self.view:show_ting(params.handData.Pai)) then
            --mj:set_tag(1, skinObj)
            mj:set_top_icon(Mj2D.topIconType.ting,self.view.mjTopIconAtlas)
            if self.view:check_ting_is_da(mj.pai,self.view.gameState) then
                mj:set_top_icon(Mj2D.topIconType.tingDa,self.view.mjTopIconAtlas)
            elseif self.view:check_ting_is_duo(mj.pai,self.view.gameState) then
                mj:set_top_icon(Mj2D.topIconType.tingDuo,self.view.mjTopIconAtlas)
            end
        end
        local tagType = self.view:get_hand_tag_type(params.handData.Pai)
        if(self.view:is_laizi(params.handData.Pai)) then
            mj:set_lai_zi(params.handData.Gray, tagType, skinObj, params.notYellow)
        end
        if(params.showHu) then
            --mj:set_tag(2, skinObj)
            tagType = 2
        end
        mj:set_tag(tagType, skinObj)
    end
    MjManager.insert(mj,MjManager.mjType.hand,params.localSeat,skinObj)
    return mj
end

--- 设置麻将相关
function Mj2DHeapHand:set_mj(params)
    local localSeat = params.localSeat
    local mj = params.mj
    local isOpen = params.isOpen
    local reduceOffset = 0
    local lastMjMove = params.lastMjMove
    local lastMjPop = params.lastMjPop
    local seatHolder = params.seatHolder
    if(localSeat == 1) then
        if(isOpen) then
            if(self.view.maxMjNum == 20) then
                reduceOffset = 10
            else
                reduceOffset = 19
            end
        end
        mj:set_local_pos(seatHolder.handMjBeginPos + Vector3.New(self.view.handOffset, 0, 0))
        self.view.handOffset = self.view.handOffset + self.view.rightWidthOffset[localSeat] - reduceOffset
        if(lastMjMove) then
            mj:set_local_pos(mj.transform.localPosition + Vector3.New(lastMJOffset, 0, 0))
        end
        if(lastMjPop and mj:enable()) then
            mj:set_local_pos(mj.transform.localPosition + Vector3.New(0, lastMJOffset, 0))
            self.view:handle_mjs_out_hand_mj(mj.pai) 
        end
    elseif(localSeat == 2) then
        if(not isOpen) then
            if(self.view.maxMjNum == 20) then
                reduceOffset = 5
            end
        end
        mj:set_local_pos(seatHolder.handMjBeginPos + Vector3.New(0, self.view.handOffset, 0))
        self.view.handOffset = self.view.handOffset + self.view.rightWidthOffset[localSeat] - reduceOffset
        if(lastMjMove) then
            mj:set_local_pos(mj.transform.localPosition + Vector3.New(0, lastMJOffset * 0.5, 0))
        end
        mj.transform:SetAsFirstSibling()
    elseif(localSeat == 3) then
        mj:set_local_pos(seatHolder.handMjBeginPos + Vector3.New(self.view.handOffset, 0, 0))
        self.view.handOffset = self.view.handOffset - self.view.rightWidthOffset[localSeat]
        if(lastMjMove) then
            mj:set_local_pos(mj.transform.localPosition - Vector3.New(lastMJOffset, 0, 0))
        end
    elseif(localSeat == 4) then
        if(not isOpen) then
            if(self.view.maxMjNum == 20) then
                reduceOffset = -5
            end
        end
        mj:set_local_pos(seatHolder.handMjBeginPos + Vector3.New(0, self.view.handOffset, 0))
        self.view.handOffset = self.view.handOffset - self.view.rightWidthOffset[localSeat] - reduceOffset
        if(lastMjMove) then
            mj:set_local_pos(mj.transform.localPosition - Vector3.New(0, lastMJOffset * 0.5, 0))
        end
    end
end

return Mj2DHeapHand