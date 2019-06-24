





local class = require("lib.middleclass")
local Base = require('package.majiang3d.module.table3d.view.table3dcommon_view')
---@class TableSiHongView_3d:Table3dCommonView
local TableSiHongView_3d = class('tableSiHongView_3d', Base)
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local TableUtil = TableUtil

function TableSiHongView_3d:show_mid_ting(showMidTing)
    return self:show_action_ting()
end

function TableSiHongView_3d:show_action_ting()
    local showTing = false
    if(#self.gameState.KeLiang > 0) then
        for j=1,#self.gameState.KeLiang[1].KeChu do
            if(#self.gameState.KeLiang[1].KeChu[j].TingPai == 1) then
                showTing = true
                break
            end
        end
    end
    return showTing
end

--- 报听中的听牌
function TableSiHongView_3d:show_mid_ting_pai(pai)
    local showTing = false
    if(#self.gameState.KeLiang > 0) then
        for j=1,#self.gameState.KeLiang[1].KeChu do
            if(pai == self.gameState.KeLiang[1].KeChu[j].ChuPai and #self.gameState.KeLiang[1].KeChu[j].TingPai == 1) then
                showTing = true
                break
            end
        end
    end
    return showTing
end

return TableSiHongView_3d
