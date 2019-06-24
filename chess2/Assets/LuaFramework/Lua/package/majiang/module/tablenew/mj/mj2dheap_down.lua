




local Mj2DHeap = require('package.majiang.module.tablenew.mj.mj2dheap')
local class = require("lib.middleclass")
---@type Mj2D
local Mj2D = require('package.majiang.module.tablenew.mj.mj2d')
---@type Mj2DManager
local MjManager = require('package.majiang.module.tablenew.mj2d_manager')

---@class Mj2DHeapDown:Mj2DHeap
local Mj2DHeapDown = class("mj2dHeapDown", Mj2DHeap)
local Color = Color
local Vector3 = Vector3
local lastMJOffset = 20 --最后一张牌位移
local TableUtil = TableUtil
local xiaZhangWidth = { 80, 35, 82, 35 } -- 下张宽度

--- 设置下张牌堆 downData 下张数据 localSeat 本地座位 serverSeat 服务器座位 downIndex 索引 notYellow 癞子不变色（特殊）
function Mj2DHeapDown:add_mj(params)
    if(#params.downData.Pai <= 4) then ---正常下张
        ---@type Mj2D
        local mjHolder = Mj2D:new(0, params.seatHolder.downPoint, {cloneName = params.localSeat .. "_4MJ", index = params.downIndex})
        params.mj = mjHolder
        self:set_mj(params)
        local childs = TableUtil.get_all_child(mjHolder.gameObject)
        for i = 1, #childs do
            local obj = childs[i]
            if(#params.downData.Pai > 2 or params.localSeat ~= 2) then
                obj:SetActive(i <= #params.downData.Pai)
            else
                obj:SetActive(i == 2 or i == 3)
            end
            if(obj.activeSelf) then
                local curIndex = i
                if(params.localSeat == 2) then
                    if(#params.downData.Pai > 2) then
                        if(i == 1) then
                            curIndex = 3
                        elseif(i == 3) then
                            curIndex = 1
                        end
                    else
                        if(i == 3) then
                            curIndex = 1
                        end
                    end
                end
                local pai = params.downData.Pai[curIndex]
                ---@type Mj2D
                local mj = Mj2D:new(pai, nil,
                    {gameObject = obj, spriteHolder = params.spriteHolder, tagSpriteHolder = params.tagSpriteHolder})
                mj:set_skin(self.view.mjColorSet, self.view.mjScaleSet)
                local fromYou = false
                if(self.view:is_top(params.downData.Seat, params.serverSeat)) then
                    local pecialProcess = false
                    if  2 == self.view.totalSeat then ---如果是二人麻将
                        if #params.downData.Pai == 3 then
                            if params.downData.Pai[1] ~= params.downData.Pai[2]
                                and  params.downData.Pai[1] ~= params.downData.Pai[3]
                                and  params.downData.Pai[2] ~= params.downData.Pai[3]  then  ---如是是吃
                                pecialProcess = true  ---则进行特殊处理
                            end
                        end
                    end
                    if pecialProcess then
                        fromYou =((params.downData.JinZhang + 1) == curIndex)
                    else
                        fromYou = (#params.downData.Pai == 3 and curIndex == 2 or curIndex == 2) or (#params.downData.Pai == 4 and curIndex == 4)
                    end
                elseif(self.view:is_right(params.downData.Seat, params.serverSeat)) then
                    fromYou = curIndex == 3
                elseif(self.view:is_left(params.downData.Seat, params.serverSeat)) then
                    fromYou = curIndex == 1
                end
                local gray = params.downData.JinZhang ~= -1 and #params.downData.Pai > 2 and fromYou
                if(gray) then
                    mj:set_color(Color.gray)
                    mj:set_def_color(Color.gray)
                else
                    mj:set_color(Color.white)
                    mj:set_def_color(Color.white)
                end
                mj:hide_tag()
                local tagType = self.view:get_down_tag_type(pai)
                if tagType then
                    mj:set_tag(tagType)
                end
                if(self.view:is_laizi(pai)) then
                    mj:set_lai_zi(gray,tagType, nil, params.notYellow)
                end
                MjManager.insert(mj, MjManager.mjType.down,params.localSeat)
            end
        end
        if(params.localSeat == 2) then
            mjHolder.transform:SetAsFirstSibling()
        end
        local num = math.min(3, #params.downData.Pai)
        self.view.downOffset = self.view.downOffset + xiaZhangWidth[params.localSeat] * self.view.xiaZhangScale[params.localSeat] * num + lastMJOffset * 0.8
        if(params.localSeat == 1 and self.view.maxMjNum == 14) then
            self.view.downOffset = self.view.downOffset + 20
        end
    else ---十三烂
        for i = 1, #params.downData.Pai do
            local pai = params.downData.Pai[i]
            local mjHolder = Mj2D:new(0, params.seatHolder.downPoint,
            {cloneName = params.localSeat .. "_4MJ", index = params.downIndex})
            local childs = TableUtil.get_all_child(mjHolder.gameObject)
            local showIndex = 1
            if(params.localSeat == 2) then
                showIndex = 3
            end
            for j = 1, #childs do
                childs[j]:SetActive(j == showIndex)
            end
            local obj = childs[showIndex]
            ---@type Mj2D
            local mj = Mj2D:new(pai, nil,{gameObject = obj, spriteHolder = params.spriteHolder, tagSpriteHolder = params.tagSpriteHolder})
            mj:set_skin(self.view.mjColorSet, self.view.mjScaleSet)
            params.mj = mjHolder
            self:set_mj(params)
            mj:set_color(Color.white)
            mj:set_def_color(Color.white)
            mj:hide_tag()

            local tagType = self.view:get_down_tag_type(pai)
            if(self.view:is_laizi(pai)) then
                mj:set_lai_zi(false,tagType, nil, params.notYellow)
            end
            mj:set_tag(tagType)

            if(params.localSeat == 2) then
                mjHolder.transform:SetAsFirstSibling()
            end
            self.view.downOffset = self.view.downOffset + xiaZhangWidth[params.localSeat] * self.view.xiaZhangScale[params.localSeat] * 1
            MjManager.insert(mj, MjManager.mjType.down,params.localSeat)
        end
        self.view.downOffset = self.view.downOffset + lastMJOffset
    end
end

--- 设置麻将相关
function Mj2DHeapDown:set_mj(params)
    local mj = params.mj
    local localSeat = params.localSeat
    mj:set_local_scale(Vector3.New(self.view.xiaZhangScale[localSeat], self.view.xiaZhangScale[localSeat], 1))
    if (localSeat == 1) then
        mj:set_local_pos(Vector3.New(self.view.downOffset, 0 , 0))
    elseif (localSeat == 2) then
        mj:set_local_pos(Vector3.New(0, self.view.downOffset, 0))
    elseif (localSeat == 3) then
        mj:set_local_pos(Vector3.New(-self.view.downOffset, 0 , 0))
    elseif (localSeat == 4) then
        mj:set_local_pos(Vector3.New(0, -self.view.downOffset, 0))
    end
end

return Mj2DHeapDown