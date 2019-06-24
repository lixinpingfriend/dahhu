





local class = require("lib.middleclass")
---@type TableCommonController
local Base = require('package.majiang.module.tablenew.controller.tablecommon_controller')
---@class TableDongZhiController:TableCommonController
---@field view TableChangShaView
local TableXiShuiMaJiangController = class('tableXiShuiMaJiangController', Base)
---@type Mj2DManager
local MjManager = require('package.majiang.module.tablenew.mj2d_manager')

local Vector3 = Vector3

function TableXiShuiMaJiangController:game_state_begin(gameState)
    Base.game_state_begin(self)
    self.gameState = gameState
end

function TableXiShuiMaJiangController:on_click(obj, arg)
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

return TableXiShuiMaJiangController
