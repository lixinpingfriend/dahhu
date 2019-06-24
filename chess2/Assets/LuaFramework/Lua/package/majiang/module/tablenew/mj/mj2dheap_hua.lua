




local Mj2DHeap = require('package.majiang.module.tablenew.mj.mj2dheap')
local class = require("lib.middleclass")
---@type Mj2D
local Mj2D = require('package.majiang.module.tablenew.mj.mj2d')
---@type Mj2DManager
local MjManager = require('package.majiang.module.tablenew.mj2d_manager')
---@class Mj2DHeapHua:Mj2DHeap
local Mj2DHeapHua = class("mj2dHeapHua", Mj2DHeap)
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
function Mj2DHeapHua:add_mj(params)
    ---@type Mj2D
    local mj = Mj2D:new(params.huaData, params.seatHolder.huaPoint,
        {cloneName = params.localSeat .. "_HuaMJ", index = params.huaIndex,
            spriteHolder = params.spriteHolder, tagSpriteHolder = params.tagSpriteHolder})
    mj:set_skin(self.view.mjColorSet, self.view.mjScaleSet)
    params.mj = mj
    self:set_mj(params)
    mj:set_color(Color.white)
    mj:set_def_color(Color.white)
    mj:hide_tag()

    local tagType = self.view:get_hua_tag_type(params.huaData)
    print(" params.huaData : "..tostring(params.huaData))
    print(" tagType: "..tostring(tagType))
    print(" params.huaData : "..tostring(params.huaData))
    print(" tagType: "..tostring(tagType))
    print(" params.huaData : "..tostring(params.huaData))
    print(" tagType: "..tostring(tagType))
    print("%%^$$&%&^%^%&*^%^*&%$&$%^$%^$#^&%$%^$^%$^%&$^%")

    if(self.view:is_laizi(params.huaData)) then
        mj:set_lai_zi(false,tagType, nil, params.notYellow)
    end
    mj:set_tag(tagType)

    if(params.localSeat == 4) then
        mj.transform:SetAsFirstSibling()
    end
    MjManager.insert(mj, MjManager.mjType.hua,params.localSeat)
    return mj
end

--- 设置麻将相关
function Mj2DHeapHua:set_mj(params)
    local addIndex = params.huaIndex
    local localSeat = params.localSeat
    local mj = params.mj
    local seatHolder = params.seatHolder
    if(localSeat == 1 or localSeat == 3) then
        mj.transform.localPosition = seatHolder.huaMjBeginPos + Vector3.New(-outGridCell[localSeat][1] * (addIndex - 1), 0, 0)
    else
        mj.transform.localPosition = seatHolder.huaMjBeginPos + Vector3.New(0, -outGridCell[localSeat][2]  * (addIndex - 1), 0)
    end
end

return Mj2DHeapHua