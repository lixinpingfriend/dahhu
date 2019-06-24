





local class = require("lib.middleclass")
---@type TableCommonController
local Base = require('package.majiang.module.tablenew.controller.tablecommon_controller')
---@class TableDongZhiController:TableCommonController
---@field view TableDongZhiView
local TableDongZhiController = class('tableDongZhiController', Base)
---@type Mj2DManager
local MjManager = require('package.majiang.module.tablenew.mj2d_manager')

local Vector3 = Vector3

function TableDongZhiController:game_state_begin(gameState)
    Base.game_state_begin(self)
    self.gameState = gameState
end

function TableDongZhiController:on_click(obj, arg)
    if (obj.name == "Button_PaoFeng") then
        self.view:show_pao_quan(false)
        if #self.gameState.KePaoQuan > 0 then
            if #self.gameState.KePaoQuan[1].KeChu == 1 then
                self:request_paoquan(self.gameState.KePaoQuan[1].KeChu[1].ChuPai)
                return
            end
        end
        self.view:enter_pao_feng_state()
    else
        Base.on_click(self, obj, arg)
    end
end

function TableDongZhiController:click_my_hand_mj(obj)
    if self.view.isPaoFengState then
        self:on_click_pao_quan_mj(obj)
    else
        Base.click_my_hand_mj(self,obj)
    end
end

function TableDongZhiController:request_paoquan(pai)
    self.view:play_voice("common/chupai")
    self.model:request_paoquan(pai)
end

function TableDongZhiController:on_click_pao_quan_mj(obj)
    local mjlist = MjManager.get_seat_mjs(1, 1)
    for i=1,#mjlist do
        local mj2d = mjlist[i]
        if 1 == mj2d.isReadyPaoFeng and  mj2d.gameObject == obj then
            obj.transform.localPosition = Vector3.New(obj.transform.localPosition.x, 20, obj.transform.localPosition.z)
            mj2d.isReadyPaoFeng = 2
        elseif 2 == mj2d.isReadyPaoFeng and mj2d.gameObject == obj then
            self:request_paoquan(mj2d.pai)
        else
            mj2d.transform.localPosition = Vector3.New(mj2d.transform.localPosition.x, 0, mj2d.transform.localPosition.z)
            mj2d.isReadyPaoFeng = 1
        end
    end
end

function TableDongZhiController:on_end_drag(obj, arg)
    if self.view.isPaoFengState then
        local mjlist = MjManager.get_seat_mjs(1, 1)
        for i=1,#mjlist do
            local mj2d = mjlist[i]
            if (1 == mj2d.isReadyPaoFeng or 2 == mj2d.isReadyPaoFeng) and  mj2d.gameObject == obj then
                self:request_paoquan(mj2d.pai)
            end
        end
    end
end

return TableDongZhiController
