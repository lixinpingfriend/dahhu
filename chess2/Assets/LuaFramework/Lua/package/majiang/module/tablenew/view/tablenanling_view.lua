

local class = require("lib.middleclass")
local Base = require('package.majiang.module.tablenew.view.tablecommon_view')
---@class TableXueView:TableCommonView
local TableNanLingView = class('tableNanLingView', Base)
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local TableUtil = TableUtil

--- 显示见字胡
function TableNanLingView:show_jianzihu(num)
    return num > 17
end

--- 设置见字胡
function TableNanLingView:set_jianzihu(jianZiHuImage, jianZiHuSH)
    jianZiHuImage.sprite = jianZiHuSH:FindSpriteByName("2")
end

return  TableNanLingView