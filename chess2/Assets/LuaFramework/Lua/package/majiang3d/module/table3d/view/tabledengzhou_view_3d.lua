





local class = require("lib.middleclass")
local Base = require('package.majiang3d.module.table3d.view.table3dcommon_view')

---@class TableDengZhouView_3d:Table3dCommonView
local TableDengZhouView_3d = class('tableDengZhouView_3d', Base)
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local TableUtil = TableUtil
local selectCardXOffset = 80
---@type Mj2DManager
local MjManager = require('package.majiang.module.tablenew.mj2d_manager')
---@type Mj2D
local Mj2D = require('package.majiang.module.tablenew.mj.mj2d')
local Vector3 = Vector3
local Color = Color

--- 初始化ui
function TableDengZhouView_3d:init_ui()
    Base.init_ui(self)
    self.actionDiao = GetComponentWithPath(self.root, "Bottom/Child/WaitAction/Button_Diao", ComponentTypeName.Transform).gameObject
end

--- 初始化最大麻将数
function TableDengZhouView_3d:get_max_mj_num()
    return 20
end

--- 初始化单个座位
function TableDengZhouView_3d:init_seat(seatHolder, index)
    Base.init_seat(self,seatHolder, index)
    seatHolder.diAndTuo = GetComponentWithPath(seatHolder.seatRoot, "Info/DiAndTuo", ComponentTypeName.Transform).gameObject
    seatHolder.di = GetComponentWithPath(seatHolder.seatRoot, "Info/DiAndTuo/ImageDi", ComponentTypeName.Image).gameObject
    seatHolder.tuo = GetComponentWithPath(seatHolder.seatRoot, "Info/DiAndTuo/ImageTuo", ComponentTypeName.Image).gameObject
end

--- 开始刷新gameState
function TableDengZhouView_3d:game_state_begin(gameState)
    Base.game_state_begin(self, gameState)
    self:show_diao_dui(gameState.KeDiaoDui and #gameState.KeDiaoDui > 0)
end

--- 显示头像额外信息
function TableDengZhouView_3d:show_head_add_info(localSeat, seatData, userState)
    Base.show_head_add_info(self, localSeat, seatData)
    local seatHolder = self.seatHolderArray[localSeat]
    if(self:all_is_ready()) then
        seatHolder.diAndTuo:SetActive(seatData.DiTuo)
        seatHolder.di:SetActive(seatData.SeatID ~= userState.ZhuangJia)
        seatHolder.tuo:SetActive(seatData.SeatID == userState.ZhuangJia)
    end
end

--- 显示钓对
function TableDengZhouView_3d:show_diao_dui(show)
    self.actionDiao:SetActive(show)
    if(show) then
        self:show_wait_action()
    end
end

--- 重置状态 点击继续游戏
function TableDengZhouView_3d:reset_state()
    Base.reset_state(self)
    for i = 1, #self.seatHolderArray do
        ---@type SeatHolder2D
        local seatHolder = self.seatHolderArray[i]
        seatHolder.diAndTuo:SetActive(false)
    end
end

---开始设置玩家状态（gameState）
function TableDengZhouView_3d:game_state_begin_set_player_state(playerState, localSeat, serverSeat)
    Base.game_state_begin_set_player_state(self, playerState, localSeat, serverSeat)
    local seatHolder = self.seatHolderArray[localSeat]
    seatHolder.di:SetActive(serverSeat ~= self.gameState.ZhuangJia and playerState.DiTuo)
    seatHolder.tuo:SetActive(serverSeat == self.gameState.ZhuangJia and playerState.DiTuo)
end

return  TableDengZhouView_3d