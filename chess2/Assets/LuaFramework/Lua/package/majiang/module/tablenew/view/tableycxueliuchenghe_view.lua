---宜昌血流成河
local class = require("lib.middleclass")
local Base = require('package.majiang.module.tablenew.view.tablexueliuchenghe_view')
local BaseBase = require('package.majiang.module.tablenew.view.tablecommon_view')
---@class TableYCXueLiuChengHeView:TableXueLiuChengHeView
local TableYCXueLiuChengHeView = class('tableYCXueLiuChengHeView', Base)
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local TableUtil = TableUtil
local Vector3 = Vector3
local DG = DG
local lastMJOffset = 20
local Color = Color
---@type Mj2DManager
local MjManager = require('package.majiang.module.tablenew.mj2d_manager')
---@type Mj2D
local Mj2D = require('package.majiang.module.tablenew.mj.mj2d')

function TableYCXueLiuChengHeView:init_ui()
    Base.init_ui(self)
end

function TableYCXueLiuChengHeView:on_init_ui()
    Base.on_init_ui(self)
end

--- 初始化单个座位
function TableYCXueLiuChengHeView:init_seat(seatHolder, index)
    Base.init_seat(self,seatHolder, index)
end

---开始设置玩家状态（gameState）
function TableYCXueLiuChengHeView:game_state_begin_set_player_state(playerState, localSeat, serverSeat)
    Base.game_state_begin_set_player_state(self, playerState, localSeat, serverSeat)
end

function TableYCXueLiuChengHeView:qisanzhang_click_select(selectMj)
    local pai = self:get_mj(selectMj).pai
    if(selectMj.transform.localPosition.y < lastMJOffset and #self.qiSanZhangPais < 3) then
        selectMj.transform.localPosition = Vector3.New(selectMj.transform.localPosition.x, lastMJOffset, selectMj.transform.localPosition.z)
        table.insert(self.qiSanZhangPais, pai)
    elseif(selectMj.transform.localPosition.y > 0) then
        selectMj.transform.localPosition = Vector3.New(selectMj.transform.localPosition.x, 0, selectMj.transform.localPosition.z)
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

function TableYCXueLiuChengHeView:init_qsz()
    self.qiSanZhangPais = {}
    local mjs = self:get_my_hand_mjs()
    for i = 1, #mjs do
        ---@type Mj2D
        local mj = mjs[i]
        local pai = mj.pai
        if(mj.gameObject.activeSelf) then
            local isGray = false
            mj:set_disable(isGray)
            if(isGray) then
                mj:set_color(Color.gray, mj.skinObj)
            else
                mj:set_color(Color.white, mj.skinObj)
            end
        end
    end
end


---打开弃三张界面
function TableYCXueLiuChengHeView:oepn_qisz_panel()
    if not self.qiSanZhangPanel then
        local s1 = "majiang/module/table/qisanzhang.prefab"
        local s2 = "QiSanZhang"
        self.qiSanZhangPanel = ModuleCache.ViewUtil.InitGameObject(s1, s2,self.root)
        self.qiSanZhangPanel.transform:SetSiblingIndex(self.diceObj.transform:GetSiblingIndex())
        self.buttongQiSZNo = GetComponentWithPath(self.qiSanZhangPanel, "Button_QiSanZhang_No", ComponentTypeName.Transform).gameObject
        self.buttongQiSZ = GetComponentWithPath(self.qiSanZhangPanel, "Button_QiSanZhang_Ok", ComponentTypeName.Transform).gameObject
        self.buttongQiSZDisable = GetComponentWithPath(self.qiSanZhangPanel, "Button_QiSanZhang_Ok_Dis", ComponentTypeName.Transform).gameObject
        local gameEventCollector = ModuleCache.ComponentManager.GetComponent(self.qiSanZhangPanel, "UGUIExtend.GameEventCollector")
        gameEventCollector.packageName = "majiang"
        gameEventCollector.moduleName = "tablenew"
        --print(gameEventCollector.packageName)
        --GetComponentWithPath(self.buttongQiSZ, "", "GameEventTriggerClickListener").gameEventCollector = gameEventCollector
        --GetComponentWithPath(self.buttongQiSZNo, "", "GameEventTriggerClickListener").gameEventCollector = gameEventCollector
    end
    self.qiSanZhangPanel:SetActive(true)
end

---关闭弃三张界面
function TableYCXueLiuChengHeView:close_qisz_panel()
    if self.qiSanZhangPanel then
        self.qiSanZhangPanel:SetActive(false)
    end
end

---获取操作的声音
function TableYCXueLiuChengHeView:get_action_sound(action)
    if(action == self.actions.mingGang or action == self.actions.anGang or action == self.actions.dianGang) then
        action = self.actions.mingGang
    elseif 33 == action or 43 == action or 44 == action or 45 == action then
        action = self.actions.hu
    end
    return action
end

---获取操作的特效
function TableYCXueLiuChengHeView:get_action_tx(action)
    if(action == self.actions.mingGang or action == self.actions.anGang or action == self.actions.dianGang) then
        action = self.actions.mingGang
    elseif 33 == action or 43 == action or 44 == action or 45 == action then
        action = self.actions.hu
    end
    return action
end

return TableYCXueLiuChengHeView