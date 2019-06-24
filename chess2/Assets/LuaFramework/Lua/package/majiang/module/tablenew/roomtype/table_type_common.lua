

local class = require("lib.middleclass")
---@class TableTypeCommon
---@field view TableCommonView
local TableTypeCommon = class('tableTypeCommon')
local Vector3 = Vector3
local ModuleCache = ModuleCache
local ComponentUtil = ModuleCache.ComponentUtil
local TableManager = TableManager
local TableUtil = TableUtil

function TableTypeCommon:initialize(view)
    self.view = view
    self.root = self.view.root
    self.curTableData = self.view.curTableData
    self:on_initialize()
end

function TableTypeCommon:on_initialize()
    self.view.beginImgObj:SetActive(true)
    self.view.beginCountDownObj:SetActive(false)
    self.view.jushuObj:SetActive(true)
end

--- 显示踢人
function TableTypeCommon:show_report_kick(seatHolder)

end

--- 可以踢人
function TableTypeCommon:can_kick(seatID, seatHolder)
    return not self.view:all_is_ready() and seatID ~= 0 and self.view.mySeat == 0 and not self.view.gameState
end

--- 获取分享的数据
function TableTypeCommon:get_share_data(shareData)

end

--- 自己已经准备的显示
function TableTypeCommon:show_me_ready()
    --self.view.buttonInvite.transform.anchoredPosition = Vector3.New(-200, self.view.buttonInvite.transform.anchoredPosition.y, 0)
    --self.view.buttonExit.transform.anchoredPosition = Vector3.New(200, self.view.buttonExit.transform.anchoredPosition.y, 0)
end

--- 自己还没准备的显示
function TableTypeCommon:show_me_not_ready(readyData)
    --self.view.buttonInvite.transform.anchoredPosition = Vector3.New(-440, self.view.buttonInvite.transform.anchoredPosition.y, 0)
    --self.view.buttonExit.transform.anchoredPosition = Vector3.New(440, self.view.buttonExit.transform.anchoredPosition.y, 0)
end

--- 准备结束
function TableTypeCommon:update_ready_end(allReady,userState)
    self.view.beginTopLeft:SetActive(allReady or self.view.gameState ~= nil)
    self.view.readyTopLeft:SetActive(not allReady and self.view.gameState == nil)
    self.view.textRoomNum2.gameObject:SetActive(not allReady and self.view.gameState == nil)
    self:refresh_rule_titel_state(not allReady and self.view.gameState == nil)
    self.view.buttonBackHall:SetActive(not allReady and self.view.gameState == nil and self.view.ConfigData.isOpenTableToHall)
end

--- 显示局数
function TableTypeCommon:show_round(gameState)
    if not self.view:process_round_info_display(gameState) then
        local totalRoundCount = self.curTableData.RoundCount
            or self.curTableData.ruleJsonInfo.roundCount or self.curTableData.videoData.roundcount
        local totalRoundText =  nil == totalRoundCount and "" or ("/" ..tostring(totalRoundCount))
        local curRound = 1
        if gameState then
            curRound = gameState.CurRound
            if self.view:all_is_ready() and gameState.Result ~= 0 then
                curRound = gameState.CurRound + 1
            end
        end
        self.view.jushu.text = "第"..tostring(curRound)..totalRoundText
        if(self.view.ConfigData.roundTitle and self.view.ruleJsonInfo.isDoubleQuan) then
            self.view.jushu.text = self.view.jushu.text .. self.view.ConfigData.roundTitle
        else
            self.view.jushu.text = self.view.jushu.text .. "局"
        end
    end
end

--- 显示分数
function TableTypeCommon:show_score(playerState, localSeat, serverSeat)
    self.view:show_score(playerState, localSeat, serverSeat)
end

--- 开始刷新gameState
function TableTypeCommon:game_state_begin(gameState)

end

--- 结束刷新gameState
function TableTypeCommon:game_state_end()

end

---开始设置玩家状态（gameState）
function TableTypeCommon:game_state_begin_set_player_state(playerState, localSeat, serverSeat)
    self:show_score(playerState, localSeat, serverSeat)
end

--- 显示准备时的错误信息
function TableTypeCommon:show_ready_error(data)
    ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(data.ErrInfo)
end

--- 玩家离开座位
function TableTypeCommon:player_leave_seat(seatHolder)

end

--- 玩家在座位上
function TableTypeCommon:player_on_seat(seatHolder, data)

end

--- 游戏未开始时（整个牌局） --- 此时不是所有玩家都准备了
function TableTypeCommon:set_game_not_begin_ui(seatHolder)

end

---显示牌桌预览相关操作控件
function TableTypeCommon:show_table_presettlement(show)
    self.view.preButtonChange:SetActive(false)
    self.view.preButtonBegin:SetActive(false)
    self.view.buttonBackToSettle:SetActive(true)
    self.view.buttonContinue:SetActive(true)
    self.view.preButtonEixt:SetActive(false)
    self.view.buttonBackHall:SetActive(false)
    if self.curTableData.needShowTotalResult then  ---如果是大结算
        self.view.buttonContinue:SetActive(false)
        self.view.buttonBackToSettle.transform.anchoredPosition =  Vector3.New(0, 92, 0)
    else
        self.view.buttonContinue:SetActive(true)
        self.view.buttonBackToSettle.transform.anchoredPosition =  Vector3.New(-200, 92, 0)
    end
end

---当牌桌右侧菜单状态变化时
function TableTypeCommon:on_right_menu_state_change(state)

end

---进入拦牌状态
function TableTypeCommon:on_game_state_wait_action()

end

---当现实结算时
function TableTypeCommon:on_show_one_game_result(gameState)
    if self.view:need_use_brief_one_game_result(gameState.Result) then
        self:show_brief_one_game_result(gameState)
    else
        self:show_normal_one_game_result(gameState)
    end
end
---打开普通小结算
function TableTypeCommon:show_normal_one_game_result(gameState)
    local initData = {}
    initData.gameState = gameState
    initData.tableView = self.view
    local onegameresultModule = nil
    local normalResultType = self.view.ConfigData.normalResultType
    if normalResultType then
        initData.normalResultType = normalResultType
        onegameresultModule = ModuleCache.ModuleManager.show_module("majiang",normalResultType,initData)
    else
        if self.view.ConfigData.pnShowResult then
            onegameresultModule = ModuleCache.ModuleManager.show_module("majiang", "onegameresultpuning",initData)
        else
            onegameresultModule = ModuleCache.ModuleManager.show_module("majiang", "onegameresult",initData)
        end
    end
    if onegameresultModule then
        onegameresultModule:set_auto_goto_total_result(self.view.ConfigData.autoOpenTotalResultTime)
    end
end
---打开简略小结算
function TableTypeCommon:show_brief_one_game_result(gameState)
    self.view:show_brief_one_result(gameState)
end
---刷新3D模式推荐按钮状态
function TableTypeCommon:on_refresh_goto3d_button_state()

    local Is3D = TableManager:get_cur_majiang_game_open_3d_state()
    if 1 ~= Is3D then
        ComponentUtil.SafeSetActive(self.view.buttonGoTo3d,false)
        ComponentUtil.SafeSetActive(self.view.maskGoTo3d,false)
        return
    end

    local openMask = false
    local mj2dOr3dSetKey = string.format("%s_FirstGoTo3d",self.curTableData.ruleJsonInfo.GameType)
    local curSet = ModuleCache.PlayerPrefsManager.GetInt(mj2dOr3dSetKey,0)
    if 0 == curSet and not self.view.ConfigData.isKaWuXing then  ---卡五星类型的玩法，不显示Mask
        openMask = true
    else
        openMask = false
    end
    ComponentUtil.SafeSetActive(self.view.buttonGoTo3d,true)
    ComponentUtil.SafeSetActive(self.view.maskGoTo3d,openMask)
    self.view.maskGoTo3d.transform.position = Vector3.zero
    ComponentUtil.SafeSetActive(self.view.buttonGoTo3dFinger,openMask)
    ModuleCache.PlayerPrefsManager.SetInt(mj2dOr3dSetKey,1)
end


function TableTypeCommon:refresh_rule_titel_state(state)
    if state then
        if self.ruletitelTimerId then
            return
        end
        self.view.ruleTitelObj:SetActive(true)
        local isMuseumRoom = false
        if TableManager.curTableData.HallID and TableManager.curTableData.HallID ~=0 then
            isMuseumRoom = true
        end
        local wanfaName, ruleName, renshu = TableUtil.get_rule_name_onegameresult(TableManager.curTableData.Rule,isMuseumRoom)
        self.view.ruleTtitelText.text = ruleName
        if ruleName == "" then
            self.view.ruleTitelObj:SetActive(false)
        end
        self.view:start_unity_coroutine(function ()
            ModuleCache.Coroutine.WaitForEndOfFrame()
            if not self.view.isDestroy and self.view.ruleTtitelText.transform.sizeDelta.y > 600 then
                self.view.ruleTitelVerticalLayoutGroup.childControlHeight = false
                local w = self.view.ruleTtitelText.transform.sizeDelta.x
                local h = 600
                self.view.ruleTtitelText.transform.sizeDelta = Vector2(w,h)
                self.view.ruleTtitelText.resizeTextForBestFit = true
                self.view.ruleTtitelText.resizeTextMaxSize = 26
                self.view.ruleTtitelText.resizeTextMinSize = 20
            end
        end)
        self.ruletitelTimerId = self.view:subscibe_time_event(5, false, 0):OnComplete(function()
            self.view.ruleTitelObj:SetActive(false)
        end).id
    else
        self.view.ruleTitelObj:SetActive(false)
    end
end


function TableTypeCommon:on_click(obj, arg)

end 

function TableTypeCommon:on_show_ting_hu_grid(pai)

end

function TableTypeCommon:on_hide_ting_hu_grid()

end

function TableTypeCommon:on_update_hu_list(yiTing, allCard,isShowTing)

end


return  TableTypeCommon