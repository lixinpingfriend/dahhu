




local class = require("lib.middleclass")
local Base = require('package.majiang.module.tablenew.view.tablecommon_view')
---@class TableDongZhiView:TableCommonView
local TableDongZhiView = class('tableDongZhiView', Base)
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local TableUtil = TableUtil
local Color = Color
---@type Mj2DManager
local MjManager = require('package.majiang.module.tablenew.mj2d_manager')

function TableDongZhiView:on_init_ui()
    Base.on_init_ui(self)
    self.actionPaoFeng = GetComponentWithPath(self.root, "Bottom/Child/WaitAction/Button_PaoFeng", ComponentTypeName.Transform).gameObject
    self.paoQuanRoot = GetComponentWithPath(self.root, "PaoQuan", ComponentTypeName.Transform).gameObject
    self.paoQuanTags = {}
    for i=1,4 do
        local tag = {}
        tag.obj = GetComponentWithPath(self.paoQuanRoot,tostring(i), ComponentTypeName.Transform).gameObject
        tag.pao = {}
        for j=1,3 do
            local pao = GetComponentWithPath(tag.obj,tostring(j), ComponentTypeName.Transform).gameObject
            tag.pao[#tag.pao + 1] = pao
        end
        self.paoQuanTags[#self.paoQuanTags + 1] = tag
    end
end

--- 开始刷新gameState
function TableDongZhiView:game_state_begin(gameState)
    Base.game_state_begin(self, gameState)
    self.isPaoFengState = false
    self:show_pao_quan(#gameState.KePaoQuan > 0)
    self:refresh_pao_feng_state(gameState)
end

---刷新玩家跑风状态
function TableDongZhiView:refresh_pao_feng_state(gameState)
    for i=1,#gameState.Player do
        local playerState = gameState.Player[i]
        local localSeat = self:server_to_local_seat(i - 1)
        local tag = self.paoQuanTags[localSeat]
        local pao = playerState.FanShu ---与服务器商定，番数里面存的是跑圈数，此玩法没有番数
        if 0 ~= gameState.Result then  ---当可点击的操作时候，隐藏跑风状态
            pao = 0
        end
        tag.obj:SetActive(pao > 0)
        for j=1,3 do
            local isOpen = pao == j
            tag.pao[j]:SetActive(isOpen)
        end
    end
end

--- 显示跑圈
function TableDongZhiView:show_pao_quan(show)
    self.actionPaoFeng:SetActive(show)
    if(show) then
        self:show_wait_action()
    end
end

---进入跑风状态
function TableDongZhiView:enter_pao_feng_state()
    self.isPaoFengState = true
    local paolist = self.gameState.KePaoQuan[1].Pai
    local mjlist =  MjManager.get_seat_mjs(1, 1)
    for j=1,#mjlist do
        local mj2d = mjlist[j]
        mj2d.isReadyPaoFeng = 1
        mj2d:set_disable(false)
        mj2d:set_color(Color.white,mj2d.skinObj)
    end
    if 0 ~= #paolist then
        for i=1,#paolist do
            for j=1,#mjlist do
                local mj2d = mjlist[j]
                if mj2d.isReadyPaoFeng then
                    if mj2d.pai == paolist[i] then  ---关闭不能跑风的牌
                        mj2d.isReadyPaoFeng = 0
                        mj2d:set_color(Color.gray,mj2d.skinObj)
                        mj2d:set_disable(true)
                    end
                else
                    mj2d:set_disable(false)
                end
            end
        end
    end
end

return TableDongZhiView