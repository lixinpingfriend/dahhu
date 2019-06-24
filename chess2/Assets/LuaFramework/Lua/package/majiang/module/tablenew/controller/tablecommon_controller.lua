





local class = require("lib.middleclass")
---@class TableCommonController
---@field module TableMJModule
---@field model TableMJModel
---@field view TableMJView
local TableCommonController = class('tableCommonController')
local ModuleCache = ModuleCache
local UnityEngine = UnityEngine
local Time = UnityEngine.Time
local MatchingManager = require("package.public.matching_manager")
local TableManager = TableManager
local ComponentUtil = ModuleCache.ComponentUtil


function TableCommonController:initialize(module)
    self.module = module
    self.model = module.model
    self.view = module.view
    self.curTableData = self.module.curTableData
end

---自动换桌
function TableCommonController:auto_change_table(eventData)
    local gameState = self.module.gameState
    local goldid = self.module.modelData.tableCommonData.goldFildId
    if TableManager:cur_game_is_gold_room_type() then
        local connect = TableManager.clientConnected
        if connect then ---金币场连接存在
            self.model:request_restart_mj(eventData)
            ModuleCache.LogManager.custom_Log("金币场继续 goldid ："..tostring(goldid))
        else
            self.module:dispatch_module_event("tablestrategy", "Event_Gold_Room_Jump",goldid)
        end
    else
        self.model:request_restart_mj(eventData)
    end
end

--- 点击
function TableCommonController:on_click(obj, arg)
    if (obj.name == "ButtonBegin") then
        self.module:dispatch_module_event("tablestrategy", "Event_Show_TableStrategy")
    elseif(obj.name == "Button_BuHua") then
        self:buhua_mj()
    elseif(obj.name == "Button_RecOutMj") then
        self:click_recommend_mj(obj)
    elseif(obj.name == "ButtonEarlyStart") then
        local isNotice = ModuleCache.PlayerPrefsManager.GetInt(string.format("%s_EarlyStartNotice",ModuleCache.GameManager.curGameId),2)
        if 2 == isNotice then
            local intentData = {}
            intentData.isNotice = true
            self.module.table_earlystart_module = ModuleCache.ModuleManager.show_module("public","table_earlystart",intentData)
        else
            ---申请立即开始
            self.module:dispatch_module_event("tablestrategy", "Event_StartNow",1)
        end
    elseif(obj.name == "ButtonGoTo3d") then
        local Is3D = TableManager:get_cur_majiang_game_open_3d_state()
        if 1 ~= Is3D then -- Is3D ：1 使用新框架,开启3D和2D切换， 2 使用新框架,不开启3D
            return
        end
        local def3dOr2d = TableManager:get_cur_majiang_game_2dor3d_def()  -- def3dOr2d ：1 游戏默认设置为3D模式，2游戏默认设置为2D模式
        local mj2dOr3dSetKey = string.format("%s_MJ2dOr3d",self.curTableData.ruleJsonInfo.GameType)
        local curSet = ModuleCache.PlayerPrefsManager.GetInt(mj2dOr3dSetKey,def3dOr2d)
        if 1 ~= curSet then
            ModuleCache.PlayerPrefsManager.SetInt(mj2dOr3dSetKey,1)
            self.module:dispatch_package_event("Event_RoomSetting_Refresh2dOr3d", 1)
        end
    elseif(obj.name == "ButtonGoTo2d") then
        local Is3D = TableManager:get_cur_majiang_game_open_3d_state()
        if 1 ~= Is3D then -- Is3D ：1 使用新框架,开启3D和2D切换， 2 使用新框架,不开启3D
            return
        end
        local def3dOr2d = TableManager:get_cur_majiang_game_2dor3d_def()
        local mj2dOr3dSetKey = string.format("%s_MJ2dOr3d",self.curTableData.ruleJsonInfo.GameType)
        local curSet = ModuleCache.PlayerPrefsManager.GetInt(mj2dOr3dSetKey,def3dOr2d)
        if 2 ~= curSet then
            ModuleCache.PlayerPrefsManager.SetInt(mj2dOr3dSetKey,2)
            self.module:dispatch_package_event("Event_RoomSetting_Refresh2dOr3d", 2)
        end
    elseif(obj.name == "ButtonDontGoTo3d") then
        ComponentUtil.SafeSetActive(self.view.maskGoTo3d,false)
        ComponentUtil.SafeSetActive(self.view.buttonGoTo3dFinger,false)
    end
end

--- 点击我的手牌
function TableCommonController:click_my_hand_mj(obj)
    if(self.module:can_out(obj)) then
        if(self.view:hand_mj_is_outing(obj) and not self.view.openFast) then
            if self.module.isDrag then
                self.module:on_end_drag(self.module.isDragMjobj)
                self.module.isDragMjobj = nil
                self.module.isDrag = false
            else
                ---@type Mj2D
			    local mj = self.view:get_mj(obj)
			    self:chu_mj_pre_check(function ()
				    self.module:out_mj(obj)
			    end,nil,mj)
            end
        else
            self.view:click_hand_mj_can_out(obj, self.module.isDrag)
        end
    else
        --self.view:click_hand_mj_cant_out(obj)
    end
end

---当推荐出牌被点击时
function TableCommonController:click_recommend_mj(obj)
    if self.lastClickRecommendTime and (Time.time - self.lastClickRecommendTime < 1) then  ---限制点击执行频率
        return
    end
    self.lastClickRecommendTime = Time.time
    local mj = self.view:recommend_out_mj(obj) ---获取与推荐出牌一样的牌值手牌麻将对象
    if mj then
        self.module:out_mj(mj.gameObject)
    end
end

--- 刷新用户状态
function TableCommonController:refresh_user_state(data)

end

--- 显示买马 结算界面
function TableCommonController:show_mai_ma(gameState,time)
    local defWaitTime = self.view:need_use_brief_one_game_result(gameState.Result) and 0.5 or 2
    local waitTime = time or defWaitTime
    local maiMa = self:get_mai_ma_data(gameState)
    if # maiMa >0 then
        waitTime = #maiMa * 0.2 + 1.5 + waitTime
        self.module:subscibe_time_event(1.5, false, 0):OnComplete(function(t)
            if(self.module:can_show_result(gameState)) then
                ModuleCache.ModuleManager.show_module("majiang", "tablepop", gameState)
            end
        end)
    end
    self.view:play_hu_sound(gameState)
    self.showOneResult = true
    self.module:subscibe_time_event(waitTime, false, 0):OnComplete(function(t)
        if(self.module:can_show_result(gameState)) then
            if(ModuleCache.ModuleManager.module_is_active("majiang", "tablepop")) then
                ModuleCache.ModuleManager.hide_module("majiang", "tablepop")
            end
            local roomType = self.module.view.roomType
            roomType:on_show_one_game_result(gameState)
        end
    end)
end


--- 获取买马数据
function TableCommonController:get_mai_ma_data(gameState)
    return gameState.MaiMa
end

--- 杠牌
function TableCommonController:gang_mj()
    if (#self.module.gameState.KeGang == 1) then
        self:gang_one_mj(self.module.gameState.KeGang[1])
    else
        self.view:show_gang_grid()
    end
end

--- 杠单个牌
function TableCommonController:gang_one_mj(pai)
    self:guo_hu_action(function ()
        self.model:request_gang_mj(pai)
        self.view:hide_wait_action_select_card()
        self.view:hide_ting_hu_grid()
    end)
end

--- 出牌
function TableCommonController:out_mj(pai)
    self.model:request_chu_mj(pai,self.view.isMidTing)
    self.view:mid_ting_handle(false)
end

--- 过牌
function TableCommonController:guo_mj()
    if self.view.lastShowActionWaitTime then
        if Time.time - self.view.lastShowActionWaitTime < 0.5 then  ---在每次显示过按钮之后，0.5秒内无视点击操作，防止玩家误操作
            return
        end
    end
    if self.lastGuoTime then  ---限制过操作的最短间隔时间
        local passTime = Time.time - self.lastGuoTime
        if passTime < 0.5 then
            return
        end
    end
    self.lastGuoTime = Time.time
    self:guo_hu_action(function ()
        if(self.module.tingPaiState == 2) then
            self.tingPaiState = 0
            self.view:mid_ting_handle(false)
        end
        self.model:request_guo_mj()
        self.view:hide_wait_action_select_card()
    end)
end

--- 补花
function TableCommonController:buhua_mj()
    self:guo_hu_action(function ()
        self.model:request_buhua_mj()
        self.view:hide_wait_action_select_card()
    end)
end

--- 听
function TableCommonController:ting_mj(obj)
    self:guo_hu_action(function ()
        if self.module.tingPaiState == 1 then --- tingPaiState = 1 开局可听    tingPaiState = 2 牌局过程中的可以听
            self.model:request_kai_ju_ting_mj()
            self.view:hide_wait_action_select_card()
        elseif self.module.tingPaiState == 2 then
            self.view:mid_ting_handle(true)
            obj:SetActive(false)
            self.view.waitAction:SetActive(false)
        end
    end)
end

--- 吃
function TableCommonController:chi_mj(pai, chifa)
    self:guo_hu_action(function ()
        self.model:request_chi_mj(pai, chifa)
        self.view:hide_wait_action_select_card()
    end)
end

--- 碰
function TableCommonController:peng_mj(pai)
    self:guo_hu_action(function ()
        if (pai) then
            self:peng_one_mj(pai)
        else
            self:peng_one_mj()
        end
    end)
end

--- 碰单个牌
function TableCommonController:peng_one_mj(pai)
    if(pai) then
        self.model:request_peng_mj(pai)
        self.view:hide_wait_action_select_card()
    else
        self.view:show_peng_grid()
    end
end

--- 胡牌
function TableCommonController:hu_mj(pai)
    self.model:request_hu_mj(pai)
    self.view:hide_wait_action_select_card()
end

--- 过胡提示
function TableCommonController:guo_hu_action(callback,nocallback)
    if(self.view.openGuoHu and self.view:can_hu()) then
        ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common(string.format("您确认放弃胡牌吗？"), function()
            if(callback) then
                callback()
            end
        end, function ()
            if nocallback then
                nocallback()
            end
        end)
    elseif(callback) then
        callback()
    end
end

---出牌之前的检测
---mj 为 mj2d 或者 mj3d
function TableCommonController:chu_mj_pre_check(callback,nocallback,mj)
    self:guo_hu_action(callback,nocallback)
end

--- 开始刷新gameState
function TableCommonController:game_state_begin(gameState)

end

function TableCommonController:on_end_drag(obj, arg)

end


---当提前开始投票通过
function TableCommonController:on_earlystart_ok()

end

---当提前开始投票没通过
function TableCommonController:on_earlystart_no()

end

function TableCommonController:on_reset_state()
    -- body
end

return TableCommonController