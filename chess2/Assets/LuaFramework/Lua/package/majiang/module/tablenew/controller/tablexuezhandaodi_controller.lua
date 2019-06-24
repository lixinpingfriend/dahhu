local class = require("lib.middleclass")
---@type TableCommonController
local BaseBase = require('package.majiang.module.tablenew.controller.tablecommon_controller')
---@type TableXueLiuChengHeController
local Base = require('package.majiang.module.tablenew.controller.tablexueliuchenghe_controller')
---@class TableXueZhanDaoDiController:TableXueLiuChengHeController
local TableXueZhanDaoDiController = class('tableXueZhanDaoDiController', Base)

--- 点击
function TableXueZhanDaoDiController:on_click(obj, arg)
    if obj.name == "Button_Nang" then
        self:ting_mj(obj)
    else
        Base.on_click(self, obj, arg)
    end
end


--- 点击
function TableXueZhanDaoDiController:check_3d_action_effect_and_play(obj, arg)
    if obj.name == "Button_Nang" then
        self:ting_mj(obj)
    else
        Base.on_click(self, obj, arg)
    end
end

function TableXueZhanDaoDiController:check_3d_action_effect_and_play(gameState)
    ---todo:血战不需要播放这些特效
end


function TableXueZhanDaoDiController:show_mai_ma(gameState,time)
    BaseBase.show_mai_ma(self,gameState,time)
end

return TableXueZhanDaoDiController