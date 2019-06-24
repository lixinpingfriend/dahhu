local class = require("lib.middleclass")
local Base = require('package.majiang.module.tablenew.view.tablecommon_view')
---@class TableQingYangPingHuView:TableCommonView
local TableQingYangPingHuView = class('tableQingYangPingHuView', Base)
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local TableUtil = TableUtil
local Color = Color
---@type Mj2DManager
local MjManager = require('package.majiang.module.tablenew.mj2d_manager')

function TableQingYangPingHuView:show_table_pop(data, i)
    local initData = {}
    initData.userState = data
    initData.index = i
    ModuleCache.ModuleManager.show_module("majiang", "tablepopqingyang",initData)
end

function TableQingYangPingHuView:hide_table_pop()
    if(ModuleCache.ModuleManager.module_is_active("majiang", "tablepopqingyang")) then
        ModuleCache.ModuleManager.hide_module("majiang", "tablepopqingyang")
    end
end

function TableQingYangPingHuView:on_show_head_add_info(seatHolder, seatData, userState)
    local paoNum = tonumber(seatData["PiaoNum"])
    local xiaNum = tonumber(seatData["Pao"])
    seatHolder:show_head_add_text1("")
    seatHolder:show_head_add_text2("")
    if paoNum and paoNum > 0 then
        seatHolder:show_head_add_text1("买"..tostring(paoNum))
    else
        seatHolder:show_head_add_text1("买0")
    end
    if xiaNum and xiaNum > 0 then
        seatHolder:show_head_add_text2("下"..tostring(xiaNum))
    else
        seatHolder:show_head_add_text2("下0")
    end
end

--- 显示见字胡
function TableQingYangPingHuView:show_jianzihu(num)
    if self.ruleJsonInfo.WuQueBuKai then
        return num > 17
    end
    return num > 26
end

return TableQingYangPingHuView