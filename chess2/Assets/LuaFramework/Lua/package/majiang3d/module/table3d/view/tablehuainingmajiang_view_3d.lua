




local class = require("lib.middleclass")
local Base = require('package.majiang3d.module.table3d.view.table3dcommon_view')
---@class TableHuaiNingView_3d:Table3dCommonView
local TableHuaiNingView_3d = class('tableHuaiNingView_3d', Base)

function TableHuaiNingView_3d:on_show_head_add_info(seatHolder, seatData, userState)
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

return TableHuaiNingView_3d