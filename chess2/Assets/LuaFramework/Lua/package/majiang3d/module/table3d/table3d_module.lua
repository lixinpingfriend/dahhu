



local class = require("lib.middleclass")

local ModuleBaseBase = require('package.majiang.module.tablebase.tablebase_module')
local ModuleBase = require('package.majiang.module.tablenew.tablenew_module')
---@class Table3DModule:TableMJModule
local Table3DModule = class('table3dModule', ModuleBase) ---继承于2D麻将module

local Table3DEvent = require('package.majiang3d.module.table3D.table3d_event') ---3D事件系统
local Mj3dHelper = require("package.majiang3d.module.table3d.table3d_helper") ---3D麻将帮助类
local ApplicationEvent = ApplicationEvent
local Mj3d = require("package.majiang3d.module.table3d.Mj3d")

local ModuleCache = ModuleCache
local TableManager = TableManager

ModuleCache.GameManager.set_rendering_AmbientMode()

function Table3DModule:on_initialize(...)

	--UnityEngine.Input.multiTouchEnabled = true

    local config = TableManager.curTableData.gameRuleConfig
    local wanfaType = Config.GetWanfaIdx(self.curTableData.ruleJsonInfo.GameType)
    if(wanfaType > #config.createRoomTable) then
        wanfaType = 1
    end
    self.ConfigData = config.createRoomTable[wanfaType]
    if(self.ConfigData.view) then
        ModuleBaseBase.initialize(self,"view."..self.ConfigData.view.."_3d","table3d_model",...)
    else
        ModuleBaseBase.initialize(self,"view.table3dcommon_view", "table3d_model",...)
    end

    local controller = nil
    if(self.ConfigData.controller) then
        if not self.ConfigData.use3dcontroller then
            controller = require('package.majiang.module.tablenew.controller.' .. self.ConfigData.controller)
        else
            controller = require('package.majiang3d.module.table3d.controller.' .. self.ConfigData.controller.."_3d")
        end
    else
        controller = require('package.majiang.module.tablenew.controller.tablecommon_controller')
    end
    self.controller = controller:new(self)

    Mj3dHelper:Init(self)  ---初始化帮助类
    self:init_3d_event()
    --self:set_next_state_delay_time(0.5) ---设置最小刷新间隔
end

function Table3DModule:init_3d_event()
    self.CheckOpen = false

    ---@ type Table3DEvent
    self.table3DEvent = Table3DEvent:Create(self.view.cam3d,8)
    self.table3DEvent:RegOnClick(self.onClick3d)
    self.table3DEvent:RegOnPress(self.onPress3d)
    self.table3DEvent:RegOnDrag(self.onDrag3d)
    self.table3DEvent:RegOnDrop(self.onDrop3d)

    ---@ type Table3DEvent
    self.myHandMj3DEvent = Table3DEvent:Create(self.view.myHandMjCam,9)

    self.onApplicationFocus = function (eventHead, eventData)
        self.table3DEvent:Check(false)  ---当程序获的焦点发生变化时，处理一次3D事件检测
    end
    ApplicationEvent.subscibe_app_focus_event(self.onApplicationFocus)

    if self.ConfigData.use3dcontroller then
        self.myHandMj3DEvent:RegOnClick(function (obj)
            self.controller:click_my_hand_mj_3d(obj)
        end)
        self.myHandMj3DEvent:RegOnPress(function (obj,state)
            self.controller:press_my_hand_mj_3d(obj,state)
        end)
        self.myHandMj3DEvent:RegOnDrag(function (obj)
            self.controller:drag_my_hand_mj_3d(obj)
        end)
        self.myHandMj3DEvent:RegOnDrop(function (obj,targetObj)
            self.controller:drop_my_hand_mj_3d(obj,targetObj)
        end)
    else
        ----初始化本地玩家的3D事件
        ---@type SeatHolder3D
        local mySeatHodler3d =  self.view.seatHolderArray[1]
        ---@type Mj3dHodler
        local myMJ3DHodler = mySeatHodler3d.mj3dHodler
        ---注册3D物体被点击时的处理事件
        self.myHandMj3DEvent:RegOnClick( function (obj)
            if obj.transform.parent == myMJ3DHodler.handMjTrans then
                myMJ3DHodler:onHandMjClick(obj)
            end
        end)
        ---注册3D物体被按下时的处理事件
        self.myHandMj3DEvent:RegOnPress( function (obj,state)
            if obj.transform.parent == myMJ3DHodler.handMjTrans then
                myMJ3DHodler:onHandMjPress(obj,state)
            end
        end)
        ---注册3D物体拖动时的处理事件
        self.myHandMj3DEvent:RegOnDrag( function (obj)
            if obj.transform.parent == myMJ3DHodler.handMjTrans then
                myMJ3DHodler:onHandMjDrag(obj)
            end
        end)
        ---注册3D物体拖放时的处理事件
        self.myHandMj3DEvent:RegOnDrop( function (obj,targetObj)
            if obj.transform.parent == myMJ3DHodler.handMjTrans then
                myMJ3DHodler:onHandMjDrop(obj,targetObj)
            end
        end)
    end
end

function Table3DModule:on_module_event_bind()
    self.packageName = "majiang"
    ModuleBase.on_module_event_bind(self)
    self:subscibe_package_event("Event_Refresh_Mj3d_Skin",function(eventHead, eventData)
        local skinType = ModuleCache.PlayerPrefsManager.GetInt(string.format("%s_Mj3d_Skin",self.curTableData.ruleJsonInfo.GameType),1)
        Mj3d:switchAllMj3dSkinStyle(skinType)
    end)
    self:subscibe_package_event("Event_RoomSetting_Refresh3dLayout",function(eventHead, eventData)
        local layoutType = eventData
        self.view:switchTableLayout(layoutType)
        TableManager:heartbeat_timeout_reconnect_game_server()
    end)
    self:subscibe_package_event("Event_RoomSetting_Refresh3dStyle",function(eventHead, eventData)
        local tableStyle = eventData
        self.view:switchTableStyle(tableStyle)
    end)
end

--- 显示结算界面
function Table3DModule:show_game_result(gameState)
    local showDissolve = ModuleCache.ModuleManager.module_is_active("public", "dissolveroom")
    if(gameState) then
        if gameState.Result == 2 then
			self.presettlementTotalState = gameState
		end
        if(self.showOneResult and gameState.Result == 2) then
            self.curTableData.needShowTotalResult = true
			self:dispatch_module_event("table", "Event_Total_Result",gameState)
        else
            self.curTableData.needShowTotalResult = false
        end
        if( gameState.Result == 1  or gameState.Result == 3 ) then
            self.showOneResult = true
            self.presettlementState = gameState
            local waitTime = #gameState.Dun * self.view.showDunTimeSpaceing + 0.1
            self.controller:show_mai_ma(gameState,waitTime)
            ---如果刚断线重连上来，则再次刷新一次UserState，因为游戏是否是已经开局状态状态的判断需要UserState中的数据和gamsState数据
            ---现在修改为，小结算断线重连后，先发UserState ，再发gamsState,所以需要在收到gamsState之后再执行一次刷新UserState的逻辑
            if self.gameStateCounter <= 1 then  
				if self.userState then ---兼容一下小结算断线重连后先发gamsState后发UserState老逻辑，服务器玩法太多，防止万一没更新啥的，
					self:refresh_user_state(self.userState)
				end
            end
			self:report_play_round_data(self.curTableData,gameState)
        elseif(gameState.Result == 2 and (showDissolve or not self.showOneResult)) then
            ---这简直就是灾难，show_game_result 在tablebase_module中调用，没有受到GameStateCache的影响
            ---但是 totalgameresult 对 gameState 的引用来自 curTableData
            ---curTableData中的 gameState 的更新又是受到 GameStateCache 的影响
            ---所以必须在大结算打开之前更新 curTableData.gameState
            self.curTableData.gameState = gameState
            local initData = {}
			initData.gameState = gameState
            ModuleCache.ModuleManager.hide_module("public", "dissolveroom")
            ModuleCache.ModuleManager.show_module("majiang", "totalgameresult",initData)
        end
        --- 刷新游戏状态   是否显示  托管
        self:dispatch_module_event("table", "Event_Refresh_State",gameState)
    end
end

---使用UI的弹起事件来触发3D事件的检测
function Table3DModule:on_press_up(obj, arg)
    ModuleBase.on_press_up(self,obj, arg)
    --[[if self.CheckOpen then
        self.CheckOpen = false
        self.table3DEvent:Check(false,arg)
        self.myHandMj3DEvent:Check(false,arg)
    end--]]
    self.table3DEvent:Check(false,arg)
    self.myHandMj3DEvent:Check(false,arg)
end
---使用UI的按下事件来触发3D事件的检测
function Table3DModule:on_press(obj, arg)
    ModuleBase.on_press(self,obj, arg)
    --[[if obj == self.view.disRtObj then
        self.CheckOpen = true
        self.table3DEvent:Check(true,arg)
        self.myHandMj3DEvent:Check(true,arg)
    end--]]
    self.table3DEvent:Check(true,arg)
    self.myHandMj3DEvent:Check(true,arg)
end
---使用UI的拖动事件来触发3D的拖动事件
function Table3DModule:on_drag(obj, arg)
    ModuleBase.on_drag(self,obj,arg)
    self.table3DEvent:updateDrag()
    self.myHandMj3DEvent:updateDrag()
end

function Table3DModule:on_begin_drag(obj, arg)

end

function Table3DModule:on_end_drag(obj, arg)

end

---3D按下弹起事件
function Table3DModule.onPress3d(obj,state)
    print("按下 ： "..obj.name)
end
---3D点击事件
function Table3DModule.onClick3d(obj)
    print("点击 ： "..obj.name)
end
---3D拖动事件
function Table3DModule.onDrag3d(obj)
    print("拖动 ： "..obj.name)
end
---3D拖放事件
function Table3DModule.onDrop3d(obj,targetObj)
    print("拖放 ： "..obj.name)
end

function Table3DModule:on_update()

end

function Table3DModule:on_begin_drag(obj, arg)

end

function Table3DModule:on_destroy()
    ApplicationEvent.unsubscibe_app_focus_event(self.onApplicationFocus)
	--UnityEngine.Input.multiTouchEnabled = false
end

return Table3DModule



