

local class = require("lib.middleclass")
local Base = require('package.majiang.module.tablenew.roomtype.table_type_common')
---@class TableTypeMatch:TableTypeCommon
---@field view TableCommonView
local TableTypeMatch = class('tableTypeMatch', Base)
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil

function TableTypeMatch:on_initialize()
    ModuleCache.ModuleManager.show_module("majiang", "tablematch")
end

--- 开始刷新gameState
function TableTypeMatch:game_state_begin(gameState)
    self.view:begin_time_down(gameState.IntrustRestTime, function (t)
        self:show_time_down(t)
    end)
end

--- 显示局数
function TableTypeMatch:show_round(gameState)
    local curRound = gameState and gameState.CurRound or 1
    self.view.jushu.text = "第" .. tostring(curRound) .. "/" .. self.curTableData.RoundCount
    if(self.view.ConfigData.roundTitle and self.view.ruleJsonInfo.isDoubleQuan) then
        self.view.jushu.text = self.view.jushu.text .. self.view.ConfigData.roundTitle
    else
        self.view.jushu.text = self.view.jushu.text .. "局"
    end
end

---刷新3D模式推荐按钮状态
function TableTypeMatch:on_refresh_goto3d_button_state()
    ComponentUtil.SafeSetActive(self.view.buttonGoTo3d,false)
    ComponentUtil.SafeSetActive(self.view.maskGoTo3d,false)
end

return  TableTypeMatch