
local class = require("lib.middleclass")
local Base = require('package.majiang3d.module.table3d.view.table3dcommon_view')
---@class TableNanLingView_3d:Table3dCommonView
local TableNanLingView_3d = class('tableNanLingView_3d', Base)
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local TableUtil = TableUtil

--- 显示见字胡
function TableNanLingView_3d:show_jianzihu(num)
    return num > 17
end

--- 设置见字胡
function TableNanLingView_3d:set_jianzihu(jianZiHuImage, jianZiHuSH)
    jianZiHuImage.sprite = jianZiHuSH:FindSpriteByName("2")
end

return  TableNanLingView_3d