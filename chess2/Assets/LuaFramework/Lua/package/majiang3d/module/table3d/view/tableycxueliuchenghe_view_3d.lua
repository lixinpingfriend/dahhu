---宜昌血流成河 3D view
local class = require("lib.middleclass")
---@type TableXueLiuChengHeView_3d
local Base = require('package.majiang3d.module.table3d.view.tablexueliuchenghe_view_3d')
local BaseBase = require('package.majiang3d.module.table3d.view.table3dcommon_view')
---@class TableYCXueLiuChengHeView_3d:TableXueLiuChengHeView_3d
local TableYCXueLiuChengHeView_3d = class('tableYCXueLiuChengHeView_3d', Base)
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local TableUtil = TableUtil
local Vector3 = Vector3
local DG = DG
local lastMJOffset = 1
local Color = Color
---@type Mj2DManager
local MjManager = require('package.majiang.module.tablenew.mj2d_manager')
---@type Mj2D
local Mj2D = require('package.majiang.module.tablenew.mj.mj2d')


function TableYCXueLiuChengHeView_3d:init_ui()
    Base.init_ui(self)
end

function TableYCXueLiuChengHeView_3d:on_init_ui()
    Base.on_init_ui(self)
end

--- 初始化单个座位
function TableYCXueLiuChengHeView_3d:init_seat(seatHolder, index)
    Base.init_seat(self,seatHolder, index)
end

---开始设置玩家状态（gameState）
function TableYCXueLiuChengHeView_3d:game_state_begin_set_player_state(playerState, localSeat, serverSeat)
    Base.game_state_begin_set_player_state(self, playerState, localSeat, serverSeat)
end

function TableYCXueLiuChengHeView_3d:qisanzhang_click_select(mj3d)
    local pai = mj3d:Pai()
    if(mj3d.transform.localPosition.y < lastMJOffset and #self.qiSanZhangPais < 3) then
        mj3d.transform.localPosition = Vector3.New(mj3d.transform.localPosition.x, lastMJOffset, mj3d.transform.localPosition.z)
        table.insert(self.qiSanZhangPais, pai)
    elseif(mj3d.transform.localPosition.y > 0) then
        mj3d.transform.localPosition = Vector3.New(mj3d.transform.localPosition.x, 0, mj3d.transform.localPosition.z)
        TableUtil.remove_table_index(self.qiSanZhangPais, pai)
    end
    if(#self.qiSanZhangPais == 0) then
        self:init_qsz()
    else
        if self.buttongQiSZ then
            self.buttongQiSZ:SetActive(#self.qiSanZhangPais == 3)
        end
        if self.buttongQiSZDisable then
            self.buttongQiSZDisable:SetActive(#self.qiSanZhangPais ~= 3)
        end
    end
end

function TableYCXueLiuChengHeView_3d:set_hand_data(params)
    local myPlayerState = self.gameState.Player[self.mySeat + 1]
    if 14 == #myPlayerState.ShouZhang then
        params.lastMjMove = true
    end
    Base.set_hand_data(self,params)
end

function TableYCXueLiuChengHeView_3d:endPlayDiceAndDealAni()
    Base.endPlayDiceAndDealAni(self)
    local mySeatHolder = self.seatHolderArray[1]
    local myHandMj = mySeatHolder.mj3dHodler.HandMj
    for i = 1,#myHandMj do
        ---@type Mj3d
        local mj3d = myHandMj[i]
        mj3d.transform.localPosition = Vector3(mj3d.transform.localPosition.x,0,mj3d.transform.localPosition.z)
        mj3d:setMj3Active(true)
    end
    if(self.gameState.HuanSanZhang and #self.gameState.Player[self.mySeat + 1].SanZhang == 0) then
        self:init_hsz()
        self:recommend_san_zhang()
    end
end

--- 初始化换三张的牌
function TableYCXueLiuChengHeView_3d:init_qsz()
    self.qiSanZhangPais = {}
    ---@type SeatHolder3D
    local mySeatHolder = self.seatHolderArray[1]
    local myHandMj = mySeatHolder.mj3dHodler.HandMj
    for i = 1,#myHandMj do
        ---@type Mj3d
        local mj3d = myHandMj[i]
        local pai = mj3d:Pai()
        local isGray = false
        mj3d:setColliderState(not isGray)
        if(isGray) then
            mj3d:setMj3dDefState(mj3d.mj3dState.gray)
        else
            mj3d:setMj3dDefState(mj3d.mj3dState.normal)
        end
        mj3d:resetDefState()
    end
end

function TableYCXueLiuChengHeView_3d:game_state_end()
    Base.game_state_end(self)
    if (not self.gameState.QiSanZhang) and (not self.gameState.HuanSanZhang) then
        local mySeatHolder = self.seatHolderArray[1]
        local myHandMj = mySeatHolder.mj3dHodler.HandMj
        for i = 1,#myHandMj do
            ---@type Mj3d
            local mj3d = myHandMj[i]
            mj3d.transform.localPosition = Vector3(mj3d.transform.localPosition.x,0,mj3d.transform.localPosition.z)
        end
    end
end

---打开弃三张界面
function TableYCXueLiuChengHeView_3d:oepn_qisz_panel()
    if not self.qiSanZhangPanel then
        local s1 = "majiang/module/table/qisanzhang.prefab"
        local s2 = "QiSanZhang"
        self.qiSanZhangPanel = ModuleCache.ViewUtil.InitGameObject(s1, s2,self.root)
        self.qiSanZhangPanel.transform:SetSiblingIndex(self.diceObj.transform:GetSiblingIndex())
        self.buttongQiSZNo = GetComponentWithPath(self.qiSanZhangPanel, "Button_QiSanZhang_No", ComponentTypeName.Transform).gameObject
        self.buttongQiSZ = GetComponentWithPath(self.qiSanZhangPanel, "Button_QiSanZhang_Ok", ComponentTypeName.Transform).gameObject
        self.buttongQiSZDisable = GetComponentWithPath(self.qiSanZhangPanel, "Button_QiSanZhang_Ok_Dis", ComponentTypeName.Transform).gameObject
        local gameEventCollector = ModuleCache.ComponentManager.GetComponent(self.qiSanZhangPanel, "UGUIExtend.GameEventCollector")
        gameEventCollector.packageName = "majiang3d"
        gameEventCollector.moduleName = "table3d"
        --GetComponentWithPath(self.buttongQiSZ, "", "GameEventTriggerClickListener").gameEventCollector = gameEventCollector
        --GetComponentWithPath(self.buttongQiSZNo, "", "GameEventTriggerClickListener").gameEventCollector = gameEventCollector
    end
    self.qiSanZhangPanel:SetActive(true)
end

---关闭弃三张界面
function TableYCXueLiuChengHeView_3d:close_qisz_panel()
    if self.qiSanZhangPanel then
        self.qiSanZhangPanel:SetActive(false)
    end
end

---获取操作的声音
function TableYCXueLiuChengHeView_3d:get_action_sound(action)
    if(action == self.actions.mingGang or action == self.actions.anGang or action == self.actions.dianGang) then
        action = self.actions.mingGang
    elseif 33 == action or 43 == action or 44 == action or 45 == action then
        action = self.actions.hu
    end
    return action
end

---获取操作的特效
function TableYCXueLiuChengHeView_3d:get_action_tx(action)
    if(action == self.actions.mingGang or action == self.actions.anGang or action == self.actions.dianGang) then
        action = self.actions.mingGang
    elseif 33 == action or 43 == action or 44 == action or 45 == action then
        action = self.actions.hu
    end
    return action
end

return TableYCXueLiuChengHeView_3d