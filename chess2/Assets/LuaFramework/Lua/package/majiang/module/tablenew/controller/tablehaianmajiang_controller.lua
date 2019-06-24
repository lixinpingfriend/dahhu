




local class = require("lib.middleclass")
---@type TableCommonController
local Base = require('package.majiang.module.tablenew.controller.tablecommon_controller')
---@class TableHaiAnMajiangController
local TableHaiAnMajiangController = class('tableHaiAnMajiangController', Base)

local ModuleCache = ModuleCache

--- 过胡提示
--[[function TableHaiAnMajiangController:guo_hu_action(callback,nocallback)
    if(self.view:can_hu()) then  ---强制开启过胡
        ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common(string.format("您确认放弃胡牌吗？"), function()
            if(callback) then
                callback()
            end
        end, function ()
            if nocallback then
                nocallback()
            end
        end)
    elseif(callback) then
        callback()
    end
end

--- 出牌
function TableHaiAnMajiangController:out_mj(pai)
    self:guo_hu_action(function ()
        self.model:request_chu_mj(pai,self.view.isMidTing)
        self.view:mid_ting_handle(false)
    end,function )
end--]]

return TableHaiAnMajiangController