





local class = require("lib.middleclass")
local Base = require('package.majiang.module.tablenew.view.tablecommon_view')
---@class TableHuaiNingView:TableCommonView
local TableHuaiNingView = class('tableHuaiNingView', Base)
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local TableUtil = TableUtil
local selectCardXOffset = 80
---@type Mj2DManager
local MjManager = require('package.majiang.module.tablenew.mj2d_manager')
---@type Mj2D
local Mj2D = require('package.majiang.module.tablenew.mj.mj2d')
local Vector3 = Vector3
local Color = Color

function TableHuaiNingView:on_show_head_add_info(seatHolder, seatData, userState)
    local showNum = seatData[self.ConfigData.headTag.serverJson]
    if 0 == showNum then
        seatHolder:show_head_add_text1("压自摸")
    elseif 1 == showNum then
        seatHolder:show_head_add_text1("压单吊")
    elseif 2 == showNum then
        seatHolder:show_head_add_text1("压缺门")
    end
    showNum = seatData[self.ConfigData.headTag.serverJson2]
    if 0 == showNum then
        seatHolder:show_head_add_text2("下0分")
    elseif 1 == showNum then
        seatHolder:show_head_add_text2("下1分")
    elseif 2 == showNum then
        seatHolder:show_head_add_text2("下2分")
    end
end

return  TableHuaiNingView