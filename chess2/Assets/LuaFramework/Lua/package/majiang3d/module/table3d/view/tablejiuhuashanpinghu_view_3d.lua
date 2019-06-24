local class = require("lib.middleclass")
local Base = require('package.majiang3d.module.table3d.view.table3dcommon_view')
---@class TableJiuHuaShanPingHuView_3d:Table3dCommonView
local TableJiuHuaShanPingHuView_3d = class('tableJiuHuaShanPingHuView_3d', Base)
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local TableUtil = TableUtil

function TableJiuHuaShanPingHuView_3d:show_table_pop(data, i)
    local initData = {}
    initData.userState = data
    initData.index = i
    ModuleCache.ModuleManager.show_module("majiang", "tablepopqingyang",initData)
end

function TableJiuHuaShanPingHuView_3d:hide_table_pop()
    if(ModuleCache.ModuleManager.module_is_active("majiang", "tablepopqingyang")) then
        ModuleCache.ModuleManager.hide_module("majiang", "tablepopqingyang")
    end
end

function TableJiuHuaShanPingHuView_3d:on_show_head_add_info(seatHolder, seatData, userState)
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
function TableJiuHuaShanPingHuView_3d:show_jianzihu(num)
    if self.ruleJsonInfo.WuQueBuKai then
        return num > 17
    end
    return num > 26
end

---获取手张中，牌角标类型
function TableJiuHuaShanPingHuView_3d:get_hand_tag_type(pai)
    if 32 == pai and self.ruleJsonInfo.HongZhongPei then
        return 7
    else
        return Base.get_hand_tag_type(self,pai)
    end
end
---获取花牌中,牌角标类型
function TableJiuHuaShanPingHuView_3d:get_hua_tag_type(pai)
    if 32 == pai and self.ruleJsonInfo.HongZhongPei then
        return 7
    else
        return Base.get_hua_tag_type(self,pai)
    end
end
---获取弃张中，牌角标类型
function TableJiuHuaShanPingHuView_3d:get_out_tag_type(pai)
    if 32 == pai and self.ruleJsonInfo.HongZhongPei then
        return 7
    else
        return Base.get_out_tag_type(self,pai)
    end
end
---获取下张中，牌角标类型
function TableJiuHuaShanPingHuView_3d:get_down_tag_type(pai)
    if 32 == pai and self.ruleJsonInfo.HongZhongPei then
        return 7
    else
        return Base.get_down_tag_type(self,pai)
    end
end


return TableJiuHuaShanPingHuView_3d