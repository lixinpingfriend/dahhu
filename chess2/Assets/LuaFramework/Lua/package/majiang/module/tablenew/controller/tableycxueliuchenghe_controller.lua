local class = require("lib.middleclass")
---@type TableXueLiuChengHeController
local Base = require('package.majiang.module.tablenew.controller.tablexueliuchenghe_controller')
---@class TableYCXueLiuChengHeController:TableXueLiuChengHeController
---@field view TableYCXueLiuChengHeView
---@field module TableMJModule
local TableYCXueLiuChengHeController = class('tableYCXueLiuChengHeController', Base)

--- 开始刷新gameState
function TableYCXueLiuChengHeController:game_state_begin(gameState)
    if(gameState.HuanSanZhang) then
        self.readyHuanSanZ = true
        self.waitHuanSanZ = (#gameState.Player[self.view.mySeat + 1].SanZhang == 0)
    end
    if(gameState.SanZhangType > 0 and self.readyHuanSanZ) then
        self.readyHuanSanZ = false
        self.waitHuanSanZ = false
        self.module:begin_cache_game_state()
        self.view:huan_san_zhang(gameState,
            function ()
                self.module:end_cache_game_state(self.module.gameState)
            end,
            function ()
                self.module:end_cache_game_state(self.module.gameState)
                self:try_enter_qisz(self.module.gameState)
            end)
    end
    if not self.view.isHuanSanZhang and not self.waitHuanSanZ then
        self:try_enter_qisz(gameState)
    end
    self:check_3d_action_effect_and_play(gameState)
end

function TableYCXueLiuChengHeController:try_enter_qisz(gameState)
    local QiSanZhangComplate = false
    local myPlayerState = gameState.Player[self.view.mySeat + 1]
    for i=1,#myPlayerState.state do
        if myPlayerState.state[i].id == 12 then
            QiSanZhangComplate = true
            break
        end
    end
    if self.view.curTableData.isPlayBack then
        QiSanZhangComplate = true
    end
    if(not gameState.HuanSanZhang 
        and not gameState.QiSanZhang 
        and not QiSanZhangComplate) then
        --todo:打开弃三张界面，进入弃三张流程
        self.waitQiSanZ = true
        self.view:init_qsz()
        self.view:oepn_qisz_panel()
    else
        --todo:关闭弃三张界面
        self.waitQiSanZ = false
        self.view:close_qisz_panel()
    end
end

--- 点击
function TableYCXueLiuChengHeController:on_click(obj, arg)
    if (obj.name == "Button_QiSanZhang_Ok") then
        self.model:request_qi_sanz(self.view.qiSanZhangPais)
    elseif (obj.name == "Button_QiSanZhang_No") then
        self.model:request_qi_sanz()
    else
        Base.on_click(self, obj, arg)
    end
end

--- 点击我的手牌
function TableYCXueLiuChengHeController:click_my_hand_mj(obj)
    if(self.waitQiSanZ) then
        self.view:qisanzhang_click_select(obj)
    else
        Base.click_my_hand_mj(self, obj)
    end
end

return TableYCXueLiuChengHeController