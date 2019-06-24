
local class = require("lib.middleclass")
local Base = require('package.majiang.module.tablenew.view.tablecommon_view')
---@class TableLvLiangKDDView:TableCommonView
local TableLvLiangKDDView = class('tableLvLiangKDDView', Base)
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentUtil.GetComponentWithPath
local TableUtil = TableUtil
local selectCardXOffset = 80
local Color = Color
local Vector3 = Vector3
local Vector2 = Vector2
local Util = Util

--- 初始化ui
function TableLvLiangKDDView:init_ui()
    Base.init_ui(self)
    self.waitActionCS = GetComponentWithPath(self.root, "Bottom/Child/WaitActionCS", ComponentTypeName.Transform).gameObject
    self.waitActionCSChilds = TableUtil.get_all_child(self.waitActionCS)
    self.csSelectKaiGang = GetComponentWithPath(self.root, "SelectKaiGang", ComponentTypeName.Transform).gameObject
    self.selectHaiDi = GetComponentWithPath(self.root, "SelectHaiDi", ComponentTypeName.Transform).gameObject
end

function TableLvLiangKDDView:init_config()
    Base.init_config(self)
    self.actionSounds["11"] = {"gang1"}
    self.actionSounds["3"] = {"buzhang"}
    self.actionSounds["4"] = {"buzhang"}
    self.actionSounds["5"] = {"buzhang"}
end

function TableLvLiangKDDView:get_action_tx(action)
    if(action == self.actions.mingGang or action == self.actions.anGang or action == self.actions.dianGang) then
        return 100 + action
    end
    return Base.get_action_tx(self, action)
end

---显示听牌标志
function TableLvLiangKDDView:show_ting_pai_tag(localSeat, show)

end

---可胡
function TableLvLiangKDDView:show_ke_hu(show)
    local show = show and #self.gameState.KeHuLeiXing == 0
    self.actionHu:SetActive(show)
    if(show) then
        self:show_wait_action()
    end
end

---可杠 吕梁变成可补
function TableLvLiangKDDView:show_ke_gang(show)
    self.actionGang:SetActive(show)
    if(show) then
        self:show_wait_action()
    end
end

---长沙麻将可杠
function TableLvLiangKDDView:show_ke_gang2(show)
    self.actionGang:SetActive(show)
    if(show) then
        self:show_wait_action()
    end
end

--- 隐藏操作以及弹出的操作列表
function TableLvLiangKDDView:hide_wait_action_select_card()
    Base.hide_wait_action_select_card(self)
    self.csSelectKaiGang:SetActive(false)
    self.waitActionCS:SetActive(false)
end

--- 开始刷新gameState
function TableLvLiangKDDView:game_state_begin(gameState)
    Base.game_state_begin(self, gameState)
    self:show_ke_gang(gameState.KeGang and #gameState.KeGang > 0)
    self:show_ke_gang2(gameState.KeKaiGang2 and #gameState.KeKaiGang2 > 0)
    self:show_hai_di_lao(gameState.KeMo)
    self:show_qi_shou_hu(gameState)
    self:show_kai_gang(gameState)
end

--- 显示起手胡
function TableLvLiangKDDView:show_qi_shou_hu(gameState)
    self.waitActionCS:SetActive(false)
    for i = 1, #self.waitActionCSChilds do
        self.waitActionCSChilds[i]:SetActive(false)
    end
    for i = 1, #gameState.KeHuLeiXing do
        self.waitActionCSChilds[gameState.KeHuLeiXing[i]]:SetActive(true)
    end
    self.waitActionCS:SetActive(#gameState.KeHuLeiXing > 0)
    self.actionGuo:SetActive(#gameState.KeHuLeiXing > 0)
end

--- 显示开杠之后的操作（不是自己开杠的）
function TableLvLiangKDDView:show_kai_gang(gameState)
    self.csSelectKaiGang:SetActive(false)
    if(#gameState.GangPai2.GangPai > 0) then
        local kaiGangSeat = gameState.GangPai2.SeatID
        if(kaiGangSeat ~= self.mySeat) then
            self.waitAction:SetActive(false)
            self:show_kai_gang_detail(kaiGangSeat)
        end
    end
end

--- 显示海底捞
function TableLvLiangKDDView:show_hai_di_lao(show)
    self.selectHaiDi:SetActive(show)
end

--- 显示开杠详情
function TableLvLiangKDDView:show_kai_gang_detail(seatId)
    local playerId = self.curTableData.seatUserIdInfo[seatId .. ""]
    self.csSelectKaiGang:SetActive(true)
    local textName = GetComponentWithPath(self.csSelectKaiGang, "TextName", ComponentTypeName.Text)
    for i = 1, #self.gameState.GangPai2.GangPai do
        local actionObj = GetComponentWithPath(self.csSelectKaiGang, "" .. i, ComponentTypeName.Transform).gameObject
        local selectCardPanel = GetComponentWithPath(self.csSelectKaiGang, "SelectCardPanel" .. i, ComponentTypeName.Transform).gameObject
        self:set_kai_gang_data(actionObj, selectCardPanel, self.gameState.GangPai2.GangPai[i])
    end
    TableUtil.download_seat_detail_info(playerId, nil, function(playerInfo)
        textName.text = Util.filterPlayerName(playerInfo.playerName, 10) .. " 开杠"
    end)
end

--- 设置开杠数据
function TableLvLiangKDDView:set_kai_gang_data(actionObj, selectCardPanel,  pai)
    local mj = GetComponentWithPath(actionObj, "MJ", ComponentTypeName.Transform).gameObject
    TableUtil.set_mj(pai, mj, self.mjScaleSet, self.frontSpriteH)
    TableUtil.set_mj_bg(1, mj, self.mjColorSet)
    local grid = GetComponentWithPath(actionObj, "Grid", ComponentTypeName.Transform).gameObject
    local selectCardBg = GetComponentWithPath(selectCardPanel, "Bg", ComponentTypeName.RectTransform)
    local childs = TableUtil.get_all_child(grid)
    local keChi = (self:ke_chi_kai_gang(pai) ~= nil)
    local kePeng = self:have_action_kai_gang(pai, self.gameState.KePeng)
    local keGang = self:have_action_kai_gang(pai, self.gameState.KeKaiGang2)
    local keBu = self:have_action_kai_gang(pai, self.gameState.keGang)
    local keHu = self:have_action_kai_gang(pai, self.gameState.KeHu)
    childs[1]:SetActive(keChi)
    childs[2]:SetActive(not keChi)
    childs[3]:SetActive(kePeng)
    childs[4]:SetActive(not kePeng)
    childs[5]:SetActive(keGang)
    childs[6]:SetActive(not keGang)
    childs[7]:SetActive(keBu)
    childs[8]:SetActive(not keBu)
    childs[9]:SetActive(keHu)
    childs[10]:SetActive(not keHu)
    for i = 1, 5 do
        childs[i * 2 - 1].name = "ButtonCS_" .. i .. "_" .. pai
    end
    if(keChi) then
        local chiChilds = TableUtil.get_all_child(selectCardPanel)
        local newChiChilds = {}
        for i = 1, #chiChilds do
            if(chiChilds[i].name ~= "Bg" and chiChilds[i].name ~= "BtnNoSelectCardCS") then
                chiChilds[i]:SetActive(false)
                table.insert(newChiChilds,chiChilds[i])
            end
        end
        local chiNum = 0
        for i=1,#self.gameState.KeChi do
            local xAddOffset = 0
            local curPai = self.gameState.KeChi[i].Pai
            if(curPai == pai) then
                for j=1,#self.gameState.KeChi[i].ChiFa do
                    local target = nil
                    if(j <= #newChiChilds) then
                        target = newChiChilds[j]
                    else
                        target = TableUtil.poor("3_SelectCard", selectCardPanel,
                                self.selectCardClonePos[3] + Vector3.New(xAddOffset, 0, 0), self.poorObjs, self.clones)
                    end
                    target:SetActive(true)
                    local childs = TableUtil.get_all_child(target)
                    local curPai = self.gameState.KeChi[i].Pai
                    local index = #self.gameState.KeChi[i].ChiFa - j + 1
                    for k=1,#childs do
                        local mj = childs[k]
                        local pai = self.gameState.KeChi[i].ChiFa[index] + (k - 1)
                        if(pai == curPai) then
                            TableUtil.set_mj_color(mj, Color.yellow)
                        else
                            TableUtil.set_mj_color(mj, Color.white)
                        end
                        TableUtil.set_mj(pai, mj, self.mjScaleSet, self.frontSpriteH)
                        TableUtil.set_mj_bg(1, mj, self.mjColorSet)
                    end
                    target.name = "Chi" .. "_3_" .. self.gameState.KeChi[i].ChiFa[index] .. "_" .. self.gameState.KeChi[i].Pai
                    xAddOffset = xAddOffset - selectCardXOffset * 3 - 10
                    chiNum = chiNum + 1
                end
            end
        end
        selectCardBg.sizeDelta = Vector2.New(390 + (chiNum - 1) * (selectCardXOffset * 3 + 10), selectCardBg.sizeDelta.y)
    end
    selectCardPanel:SetActive(false)
end

--- 可吃 针对开杠
function TableLvLiangKDDView:ke_chi_kai_gang(pai)
    if(#self.gameState.KeChi == 0) then
        return nil
    end
    for i = 1, #self.gameState.KeChi do
        if(pai == self.gameState.KeChi[i].Pai) then
            return self.gameState.KeChi[i].ChiFa
        end
    end
    return nil
end

--- 开杠的牌有可操作的
function TableLvLiangKDDView:have_action_kai_gang(pai,list)
    if(not list or (list and #list == 0)) then
        return false
    end
    for i = 1, #list do
        if(pai == list[i]) then
            return true
        end
    end
    return false
end

--- 显示开杠的牌的多种操作（多吃等）
function TableLvLiangKDDView:show_select_card_kai_gang(actionObj)
    local selectCardPanel = GetComponentWithPath(actionObj.transform.parent.gameObject, "SelectCardPanel" .. actionObj.name, ComponentTypeName.Transform).gameObject
    selectCardPanel:SetActive(true)
end

--- 牌是否亮倒
function TableLvLiangKDDView:pai_is_open(playerState, handData)
    return self.curTableData.isPlayBack or (handData and handData.Pai ~= 0 and (#playerState.HuPai ~= 0 or handData.State == 2))
end

--- 牌是否扣倒
function TableLvLiangKDDView:pai_is_covered(handData)
    return false
end

return TableLvLiangKDDView