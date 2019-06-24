




local Mj2DHeap = require('package.majiang.module.tablenew.mj.mj2dheap')
local class = require("lib.middleclass")
---@type Mj2D
local Mj2D = require('package.majiang.module.tablenew.mj.mj2d')
---@type Mj2DManager
local MjManager = require('package.majiang.module.tablenew.mj2d_manager')
---@class Mj2DHeapOut:Mj2DHeap
local Mj2DHeapOut = class("mj2dHeapOut", Mj2DHeap)
local Color = Color
local Vector3 = Vector3
local outGridCell =  --弃张摆放宫格位移
{
    {82,104},
    {-54,36},
    {-82,-104},
    {54,-36},
}

--- 添加一个麻将
function Mj2DHeapOut:add_mj(params)
    ---@type Mj2D
    local mj = Mj2D:new(params.outData, params.seatHolder.outPoint,
        {cloneName = params.localSeat .. "_OutMJ", index = params.outIndex,
        spriteHolder = params.spriteHolder, tagSpriteHolder = params.tagSpriteHolder})
    mj:set_skin(self.view.mjColorSet, self.view.mjScaleSet)
    params.mj = mj
    self:set_mj(params)
    mj:set_color(Color.white)
    mj:set_def_color(Color.white)
    mj:hide_tag()

    local tagType = self.view:get_out_tag_type(params.outData)
    if(self.view:is_laizi(params.outData)) then
        mj:set_lai_zi(false,tagType, nil, params.notYellow)
    end
    mj:set_tag(tagType)

    if(params.localSeat == 1 or params.localSeat == 2) then
        mj.transform:SetAsFirstSibling()
    end
    mj:show_pointer(params.showPointer)
    if(params.showPointer) then
        self.view.mjPointers[params.serverSeat + 1] = self.view.mjPointers[params.serverSeat + 1] or {}
        table.insert(self.view.mjPointers[params.serverSeat + 1], mj)
    end
    if(params.lastOut) then
        if(self.view:is_hua(params.outData, params.playerState)) then
            self.view:play_buhua(params.localSeat)
        else
            self.view:play_custom(params.outData, params.localSeat)
        end
    end
    MjManager.insert(mj, MjManager.mjType.out,params.localSeat)
    return mj
end

--- 设置麻将相关
function Mj2DHeapOut:set_mj(params)
    local addIndex = params.outIndex
    if(params.localSeat == 1 or params.localSeat == 3) then
        params.mj:set_local_pos(params.seatHolder.outMjBeginPos + Vector3.New(outGridCell[params.localSeat][1] * ((addIndex - 1) % self:get_out_grid_Num()),
        outGridCell[params.localSeat][2] * math.floor((addIndex - 1) / self:get_out_grid_Num()), 0))
    else
        params.mj:set_local_pos(params.seatHolder.outMjBeginPos + Vector3.New(outGridCell[params.localSeat][1] * math.floor((addIndex - 1) / self:get_out_grid_Num()),
        outGridCell[params.localSeat][2]  * ((addIndex - 1) % self:get_out_grid_Num()), 0))
    end
end

---弃张每行数量
function Mj2DHeapOut:get_out_grid_Num()
    if 2 == self.view.totalSeat then
        return 17
    else
        return 10
    end
end

return Mj2DHeapOut