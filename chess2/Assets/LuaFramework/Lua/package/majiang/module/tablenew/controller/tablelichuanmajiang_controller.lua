




local class = require("lib.middleclass")
---@type TableCommonController
local Base = require('package.majiang.module.tablenew.controller.tablecommon_controller')
---@class TableLiChuanMaJiangController:TableCommonController
local TableLiChuanMaJiangController = class('tableLiChuanMaJiangController', Base)
local ModuleCache = ModuleCache

function TableLiChuanMaJiangController:on_click(obj, arg)
    if obj ==  self.view.actionBtBaoFeng then
        self.model:request_que_mj(4)
    elseif obj ==  self.view.actionBtBaoJiang then
        self.model:request_que_mj(5)
    elseif obj ==  self.view.actionBtBaoTong then
        self.model:request_que_mj(3)
    elseif obj ==  self.view.actionBtBaoWan then
        self.model:request_que_mj(2)
    elseif obj ==  self.view.actionBtBaoTiao then
        self.model:request_que_mj(1)
    else
        Base.on_click(self, obj, arg)
    end
end



return TableLiChuanMaJiangController