





local ModuleCache = ModuleCache
local ComponentTypeName = ModuleCache.ComponentTypeName
local TableManager = TableManager
local Vector3 = Vector3
local Time = Time
local class = require("lib.middleclass")
local ModuleBase = require('package.majiang.module.tablebase.tablebase_module')
---@class TableModule:TableBaseModule
---@field model TableModel
---@field tableModel TableModel
---@field view TableView
---@field tableView TableView
local TableModule = class('tableModule', ModuleBase)
local SoundManager = ModuleCache.SoundManager
local Application = UnityEngine.Application
local CSmartTimer = ModuleCache.SmartTimer.instance
local PlayerPrefs = UnityEngine.PlayerPrefs
local ComponentUtil = ModuleCache.ComponentUtil
local ApplicationEvent = ApplicationEvent
local onAppFocusCallback

local Input = UnityEngine.Input
local dragYLimit = 110
local math = math

local curTableData =nil
local string = string

function TableModule:initialize(...)
	curTableData =TableManager.curTableData 
	ModuleBase.initialize(self, "table_view", "table_model", ...)
--显示比赛场
	if(curTableData.RoomType == 3) then
		ModuleCache.ModuleManager.show_module("majiang", "tablematch")
	end
end

function TableModule:on_module_inited(...)
	ModuleBase.on_module_inited(self)

--[[	self.kickedTime = self:subscibe_time_event(30, false, 0):OnUpdate(function(t)
		t = t.surplusTimeRound
		self.view.buttonBegin_countDownTex.text = "("..t.."s)"
	end):OnComplete(function(t)
		
	end)
]]
end

function TableModule:on_module_event_bind()
	ModuleBase.on_module_event_bind(self)

	self:subscibe_module_event("tablestrategy", "Event_TableStragy_BeginGame", function(eventHead, eventData)
		self.model:request_select_piao(eventData)
	end)
	self:subscibe_module_event("tableadd", "Event_BaoQue", function(eventHead, eventData)
		self.tableModel:request_que_mj(eventData)
	end)
	--一局结束开始下一局
	self:subscibe_module_event("tablestrategy", "Event_Show_TableStrategy", function(eventHead, eventData)
		if(not self.gameState) then
			self.model:request_restart_mj(eventData)
			return
		end
		self.tableView.ReadyTing = false
		self.view:reset_seat_all_mj()
		self.showOneResult = false
		self:show_table_presettlement(false)  ---关闭牌桌预览相关控件
		if(self.gameState.IsChangeRoomWhileRestart) then
			if(self.gameState.IsAutoStartAfterChangeRoom) then
				ModuleCache.PlayerPrefsManager.SetInt("ChangeTable", 2)
			else
				ModuleCache.PlayerPrefsManager.SetInt("ChangeTable", 1)
			end
			if(self.view.ConfigData.isKaWuXing) then
				TableManager.kaWuXingPiao = eventData.xiaojiScore
			end
			self:dispatch_module_event("roomsetting", "Event_RoomSetting_ExitRoom")
		else
			self.model:request_restart_mj(eventData)
		end
	end)

	self:subscibe_module_event("tablestrategy", "Event_QiShouHu_Continue", function(eventHead, eventData)
		self.tableModel:request_restart_mj()
	end)

	self:subscibe_module_event("onegameresult", "Event_Close_OneGameResult", function(eventHead, eventData)
		if self.view.ConfigData.isHuangShiHH  --黄石晃晃打开牌桌回放相关操作界面
				or 4 == curTableData.RoomType then   --金币场打开牌桌回放相关操作界面
			self:show_table_presettlement(true)
		end
	end)

	self:subscibe_model_event("Event_Msg_ReturnKickedTimeOutNTF", function(eventHead, eventData)
		print("----------------------------Kickedtimeout :",eventData.Time)
		self.view:set_begin_countdown_state(true)

		if self.kickedTimeId then
			CSmartTimer:Kill(self.kickedTimeId)
		end
		
		self.kickedTimeId = self:subscibe_time_event(eventData.Time, false, 0):OnUpdate(function(t)
			t = t.surplusTimeRound
			self.view.buttonBegin_countDownTex.text = "("..t.."s)"
		end):OnComplete(function(t)
			
		end).id
	end)

	self:subscibe_package_event("Event_Refresh_Mj_Scale_Color", function(eventHead, eventData)
		self.view:refresh_mj_color_scale(true)
	end)

	-- 退出房间
	self:subscibe_model_event("Event_Msg_Exit_Room", function(eventHead, eventData)
		if(eventData.Error and eventData.Error == 0)then
			if ModuleCache.ModuleManager.module_is_active("majiang", "totalgameresult") then
				TableManager:disconnect_all_client_no_exit_room()
				self:dispatch_module_event("roomsetting", "Event_Receive_Msg_Exit_Room")
			else
				self:exit_room()
			end
		else
			ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("牌局进行中，无法离开游戏")
		end
	end)

	self:subscibe_module_event("tablepop", "Event_MaiMa", function(eventHead, eventData)
		self.model:request_maima_mj(eventData)
	end)

	-------------------------------------提前开局相关-----------------------------
	self:subscibe_package_event("Event_Tablestrategy_StartNow", function(eventHead, eventData)
		local action = eventData
		local curPlayer = self.curPlayer
		self.model:request_start_now(action,curPlayer)
	end)
	self:subscibe_module_event("tablestrategy", "Event_StartNow", function(eventHead, eventData)
		local action = eventData
		local curPlayer = self.curPlayer
		self.model:request_start_now(action,curPlayer)
	end)
	self:subscibe_model_event("Event_Msg_StartNowNTF", function(eventHead, eventData)
		local Actions = eventData.Action
		local agreeCount = 0
		local RefuseIndex = 0
		for i=1,#Actions do
			local act = Actions[i]
			if 3 == act then
				agreeCount = -1
				RefuseIndex = i
				break
			end
			if 2 == act or 1 == act then
				agreeCount = agreeCount + 1
			end
		end
		if -1 == agreeCount then
			ModuleCache.ModuleManager.hide_module("public", "table_earlystart")
			if 1 == eventData.ErrCode then
				local localIndex = TableUtil.get_local_seat(RefuseIndex - 1,self.view.mySeat,curTableData.totalSeat)
				local name = self.view.seatHolderArray[localIndex].textPlayerName.text
				local text = name.."拒绝提前开始游戏"
				ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(text)
			end
		elseif agreeCount >= self.curPlayer then  ---如果全部同意，则断线重连
            if(self.view.ConfigData.isKaWuXing) then ---卡五星开局发送买飘数
                self:dispatch_module_event("tablestrategy", "Event_Show_TableStrategy",{xiaojiScore = TableManager.curTableData.kaWuXingPiao, paoScore = -1})
            end
            ---修改游戏规则中的人数,存回去
            self:subscibe_time_event(0.25, false, 0):OnComplete(function(t)
				self.curTableData.ruleJsonInfo.PlayerNum = self.curPlayer
				self.curTableData.Rule = ModuleCache.Json.encode(self.curTableData.ruleJsonInfo)
				TableManager:heartbeat_timeout_reconnect_game_server()
			end)
		else
			local intentData = {}
			intentData.earlyStartData = eventData
			self.table_earlystart_module = ModuleCache.ModuleManager.show_module("public","table_earlystart",intentData)
		end
	end)
	-------------------------------------Eed--------------------------------------
end

-- 还是得用刷帧的方式来拖动
function TableModule:on_update()
	if self.isDrag and self.checkTouchCount then
		if Input.touchCount < 1 then
			self:on_end_drag(self.isDragMjobj)
		else
			self:on_update_dragbj_pos(self.isDragMjobj.transform)
		end
	end
end

function TableModule:on_press_up(obj, arg)
	if(obj and obj.name == "ButtonMic") then
		ModuleBase.press_up_voice(self, obj, arg)
	end

end

function TableModule:can_drag_mj(obj)
	return (obj and string.sub(obj.name,1,4) == "inMJ" or string.sub(obj.name,1,10) == "readyChuMJ"
		or string.sub(obj.name,1,6) == "dragMJ") and self.tableView:is_me_chu_mj(obj) and not self.selectLiang and not self.autoOutMJ
end

-- on_press_up -> on_click -> on_end_drag
function TableModule:on_begin_drag(obj, arg)  

	-- 手机上可以多点操作，所以过滤掉
	if self.isDragMjobj then
		return
	end
    if(self:can_drag_mj(obj)) then
		self:setTargetFrame(true)
		obj.transform:SetAsLastSibling()
		self.beginPressPos = obj.transform.localPosition
		self.isDrag = true
		self.isDragMjobj = obj
		self.checkTouchCount = Input.touchCount > 0
		self.tableView:ready_chu_mj(obj, self.isDrag)
		self.tableView:ready_drag_mj(obj, true)
	end
end

function TableModule:on_update_dragbj_pos(transform)
	if self.checkTouchCount and Input.touchCount > 0 then
		transform.position = self.tableView:get_world_pos(Input.GetTouch(0).position, transform.position.z)
	else
		transform.position = self.tableView:get_world_pos(Input.mousePosition, transform.position.z)
	end
	local x = transform.localPosition.x
	local y = transform.localPosition.y
	y = math.max(0, y)
	-- if(y < dragYLimit) then
	-- 	x = self.beginPressPos.x
	-- end
	transform.localPosition = Vector3.New(x, y , 0)
end

function TableModule:on_drag(obj, arg)
	-- print("on_drag", obj.name)
	if(obj and obj == self.isDragMjobj) then
		if not self.checkTouchCount then
			self:on_update_dragbj_pos(obj.transform)
		end
	elseif(obj and obj.name == "ButtonMic") then
		ModuleBase.on_drag_voice(self, obj, arg)
	end
end

-- 很坑爹的一个状态，如果在拖动
function TableModule:on_end_drag(obj, arg)
	-- print("on_end_drag", obj.name)
	self:setTargetFrame(false)
    if obj == self.isDragMjobj then
		self.isDrag = false
		local y = obj.transform.localPosition.y
		y = math.max(0, y)
		if(y < dragYLimit) then
			local x = self.beginPressPos.x
			y = 0
			obj.name = string.format("inMJ_%s_%s", self.view:get_mj_pai(obj), self.view:get_mj_index(obj))
			obj.transform.localPosition = Vector3.New(x, y , 0)
			self.tableView:reset_drag_mj()
		else 
			local pai = self.tableView:get_mj_pai(obj)
			if(pai) then
				self:chu_mj(obj, pai)
			end
		end
		self.isDragMjobj = nil
	end
end

function TableModule:on_press(obj, arg)
	if(obj.name == "ButtonMic") then
		ModuleBase.press_voice(self, obj, arg)
	elseif(string.sub(obj.name,1,10) == "readyChuMJ"  and self.view.openFast) then
		self.isDrag = false
		local pai = self.tableView:get_mj_pai(obj)
		if(pai) then
			self:chu_mj(obj, pai)
		end
	end
end

function TableModule:on_click(obj, arg)	
	local playerClickButtonSound = true

	if(self.lastClickInviteTime and self.lastClickInviteTime + 1 > Time.realtimeSinceStartup)then
		return
	end
	if(obj == self.tableView.buttonSetting.gameObject) then		
		local intentData = {}
		intentData.tableBackgroundSpriteSetName = "RoomSetting_TableBackground_Name_" .. "MJ"
		intentData.canDissolveRoom = not self.view.inviteAndExit.activeSelf
		if 4 == curTableData.RoomType then
			intentData.canDissolveRoom = false
		end
		intentData.tableBackgroundSprite = self.view.tableBackgroundSprite
		intentData.tableBackgroundSprite2 = self.view.tableBackgroundSprite2
		intentData.tableBackgroundSprite3 = self.view.tableBackgroundSprite3
		intentData.isOpenLocationSetting = self.view.ConfigData.isOpenLocationSetting
		intentData.defLocationSetting = self.view.ConfigData.defLocationSetting
		intentData.defGuoHu = self.view.ConfigData.defGuoHu
		ModuleCache.ModuleManager.show_module("public", "roomsetting", intentData)
		-- 先保留，因为安庆有
		-- ModuleCache.ModuleManager.show_module("public", "roomsetting", not self.view.inviteAndExit.activeSelf)
	elseif(obj == self.tableView.buttonWarning.gameObject) then
        local data ={};
        data.gameType="majiang";
        data.seatHolderArray = self.view.seatHolderArray;
        data.tableCount=curTableData.totalSeat;
        data.isPlay=self.view:all_is_ready();
        data.isShowLocation=true;
        --打开定位功能界面
        ModuleCache.ModuleManager.show_module("public", "tablelocation",data);
		--ModuleCache.ModuleManager.show_module("public", "tablegps", self.view.tipText .. "," .. self.view.distanceText)
	elseif (obj.name == "ButtonInvite" or obj.name == "NotSeatDown") then
		self.lastClickInviteTime = Time.realtimeSinceStartup			
		self:inviteWeChatFriend()
	elseif (obj.name == "ButtonChat") then
		local textList = Config.chatShotTextList
		local locationSetting = self.view:getCurLocationSetting()
		if 1 == locationSetting then
			textList = self.view.ConfigData.chatShotTextList
		end
		ModuleCache.ModuleManager.show_module("public", "tablechat",
		{is_New_Sever=self:is_new_version(), config = Config, backgroundStyle = "BackgroundStyle_1", chatShotTextList = textList})
	elseif (obj.name == "ButtonMic") then

	elseif (obj.name == "ButtonAddGold") then
		self.model:request_add_gold()
		ModuleCache.ModuleManager.show_module("public", "goldadd")
	elseif (string.sub(obj.name,1,4) == "inMJ") then
		if(not self.tableView:is_gray(obj)) then
			playerClickButtonSound = false
			if(self.selectLiang) then
				self.view:click_select_coverd(self.view:get_mj_pai(obj))
			elseif(self.view.meHuanSanz) then
				self.view:click_select_hsz(obj)
			else
				self.tableView:ready_chu_mj(obj, self.isDrag)
			end
		end
	elseif (string.sub(obj.name,1,10) == "readyChuMJ") then
		playerClickButtonSound = false
		if(not self.view.openFast) then
			if self.isDrag then
				self:on_end_drag(self.isDragMjobj)
				self.isDragMjobj = nil
				self.isDrag = false
			else
				local pai = self.tableView:get_mj_pai(obj)
				if(pai) then
					self:chu_mj(obj, pai)
				end
			end
		end
	elseif (obj.name == "Button_Chi") then
		if (#self.gameState.KeChi == 1 and #self.gameState.KeChi[1].ChiFa == 1) then
			self:chi_mj(nil, false, self.gameState.KeChi[1].Pai, self.gameState.KeChi[1].ChiFa[1])
        else
			self:chi_mj()
		end
	elseif (obj.name == "Button_Peng") then
		if (#self.gameState.KePeng == 1) then
			self:peng_mj_new(self.gameState.KePeng[1])
		else
			self:peng_mj_new()
		end
	elseif (obj.name == "Button_Gang") then
		self:gang_mj_new(self.view.wanfaName == "长沙麻将")
	elseif (obj.name == "Button_Gang_Right") then
		self:gang_mj_new(self.view.wanfaName == "长沙麻将", self.view.selectCardPanelRight)
	elseif (obj.name == "Button_BuHua") then
		if(self.view.wanfaName == "长沙麻将") then
			self:gang_mj_new(false)
		else
			self:buhua_mj()
		end
	elseif (obj.name == "Button_Hu") then
		self:hu_mj()
	elseif (obj.name == "Button_Guo") then
		self:guo_mj()
	elseif obj.name =="Button_Ting" or obj.name == "Button_Nang" then
		self:ting_mj(obj)
	elseif (obj.name == "Button_KaiGang") then

	elseif (obj.name == "Button_HaiDi") then
		self.tableModel:request_mopai_mj()
	elseif (obj.name == "Button_Diao") then
		if (#self.gameState.KeDiaoDui == 1) then
			self:diao_mj(self.gameState.KeDiaoDui[1])
        else
			self:diao_mj()
		end
	elseif(string.sub(obj.name, 1, 3) == "Chi") then
		local array = string.split(obj.name, "_")
		self:chi_mj(nil, false, tonumber(array[4]), tonumber(array[3]))
	elseif(string.sub(obj.name, 1, 4) == "Peng") then
		local array = string.split(obj.name, "_")
		self:peng_mj_new(tonumber(array[3]))
	elseif(string.sub(obj.name, 1, 4) == "Gang") then
		local array = string.split(obj.name, "_")
		self:gang_mj(tonumber(array[3]), self.csKaiGang)
	elseif(string.sub(obj.name, 1, 4) == "Diao") then
		local array = string.split(obj.name, "_")
		self:diao_mj(tonumber(array[3]))
	elseif (obj.name == "BtnNoSelectCard" or obj.name == "SelectCardPanelRight") then
		self.tableView:hide_select_card_childs()
	elseif (obj.name == "ButtonExit") then
		self:dispatch_module_event("roomsetting", "Event_RoomSetting_ExitRoom")
	elseif (obj.name == "ButtonBegin") then
		if(self.view.ConfigData.isKaWuXing) then
			self:dispatch_module_event("tablestrategy", "Event_Show_TableStrategy",{xiaojiScore = TableManager.curTableData.kaWuXingPiao, paoScore = -1})
		else
			self:dispatch_module_event("tablestrategy", "Event_Show_TableStrategy")
		end
	elseif (obj.name == "ButtonKick") then
		local playerId, playerName = self.tableView:get_kick_player_name(obj)
		ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common(string.format("是否将%s踢出本房间？", playerName), function()
			self.tableModel:request_kick_player(playerId)
		end, nil)
	elseif (obj.name == "Image") then
		self.tableView:look_player_info(obj)
	elseif (obj.name == "ImageAnticheat") then
		ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("开局后显示玩家信息")
	elseif (obj.name == "ButtonPiao") then
		self.tableModel:request_piao()
		self.tableView:hide_select_hua()
		self.tableView:hide_wait_action_select_card()
	elseif (obj.name == "ButtonNoPiao") then
		self.tableModel:request_guo_mj()
		self.tableView:hide_select_hua()
		self.tableView:hide_wait_action_select_card()
	elseif(string.sub(obj.name, 1, 3) == "Zun") then
		local zun = tonumber(string.sub(obj.name, 4, 4))
		self.tableModel:request_select_piao({xiaojiScore = zun, paoScore = -1})
	elseif(obj.name == "ButtonRule") then
		ModuleCache.ModuleManager.show_module("public", "tablerule", self.view.gamerule)
	elseif(obj.name == "ButtonRobot") then
		self:add_robot()
	elseif(string.sub(obj.name, 1, 4) == "CSHu") then
		local array = string.split(obj.name, "_")
		self.tableModel:request_hu_mj(tonumber(array[2]))
		self.tableView:hide_wait_action_select_card()
	elseif(string.sub(obj.name, 1, 8) == "ButtonCS") then
		local array = string.split(obj.name, "_")
		local actionType = tonumber(array[2])
		local actionPai = tonumber(array[3])
		if(actionType == 1) then
			local chiList = self.view:kechi_kaigang(actionPai)
			if(#chiList == 1) then
				self:chi_mj(nil, true, actionPai, chiList[1])
			else
				self:chi_mj(obj, true)
			end
		elseif(actionType == 2) then
			self:peng_mj_new(actionPai)
		elseif(actionType == 3) then
			self:gang_mj(actionPai, true)
		elseif(actionType == 4) then
			self:gang_mj(actionPai)
		elseif(actionType == 5) then
			self:hu_mj()
		end
	elseif(obj.name == "BtnNoSelectCardCS") then
		obj.transform.parent.gameObject:SetActive(false)
	elseif(string.sub(obj.name, 1, 7) == "BuZhang") then
		local array = string.split(obj.name, "_")
		self.tableModel:request_buzhang_mj(self.gameState.KeBuZhang[tonumber(array[2])])
	elseif(obj.name == "Button_YaHu") then
		self.model:request_yahu_mj()
	elseif obj.name =="Button_Liang" then
		if self.view.ConfigData.isHuangShiHH then
			self.model:request_liang()
		else
			self:liang_mj(obj)
		end
	elseif(obj.name == "Button_SelectDone") then
		self.selectLiangDone = true
		self.view:select_coverd_done()
		self.selectLiang = false
	elseif (obj.name == "Button_BuLiang") then
		self:cancel_liang()
	elseif (obj.name ==  "ButtonNoIntrust") then
		self.model:request_Intrust(2) --取消托管
	elseif (obj.name ==  "GEixtBtn") then
		--金币场退出房间
		ModuleCache.PlayerPrefsManager.SetInt("ChangeTable", -1)
		self:dispatch_module_event("roomsetting", "Event_RoomSetting_ExitRoom")
	elseif (obj.name ==  "GRuleBtn") then
		ModuleCache.ModuleManager.show_module("public", "goldhowtoplay")
	elseif (obj.name ==  "ButtonChange") then
		--金币场切换对手
		ModuleCache.PlayerPrefsManager.SetInt("ChangeTable", 1)
		self:dispatch_module_event("roomsetting", "Event_RoomSetting_ExitRoom")
		self.view:TimingChangeBtnInvalidTag(5) ---切换对手按钮设置无效5秒
	elseif (obj.name == "Button_Huan") then
		self.model:request_huan_sanz(self.view.hszPais)
	elseif (obj.name == "ButtonBackToSettle") then
		if self.view.ConfigData.isHuangShiHH then --现在只有黄石晃晃有这个需求
			local initData = {}
			initData.gameState = self.presettlementState
			ModuleCache.ModuleManager.show_module("majiang", "onegameresultpuning",initData)
		end
	elseif (obj.name == "ButtonContinue") then
		if self.view.ConfigData.isHuangShiHH then --现在只有黄石晃晃有这个需求
			ModuleCache.ModuleManager.destroy_module("majiang", "onegameresultpuning")
			if(self.gameState.Result ~= 3) then
				self:dispatch_module_event("tablestrategy", "Event_Show_TableStrategy")
			else
				self:dispatch_module_event("tablestrategy", "Event_QiShouHu_Continue")
			end
		end
	elseif (obj.name == "ButtonBCS") then
		ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common("是否确认消耗2钻石祈福财神？", function()
			local playerid = TableManager.curTableData.modelData.roleData.userID
			ModuleCache.ModuleManager.show_module("public", "baicaishen",playerid)
		end, nil)
	elseif (obj.name == "Button_HuGrid") then
		local isShowTing = self.view:getIsShowTingSetting()
		if isShowTing then
			self.view:setIsShowTingSetting(false)
			ComponentUtil.SafeSetActive(self.view.huGrid,false)
		else
			self.view:setIsShowTingSetting(true)
			if not self.view.jianZiHu.gameObject.activeSelf then
				ComponentUtil.SafeSetActive(self.view.huGrid,true)
			end
		end
	elseif (obj.name == "ButtonMenu" or obj.name == "RightMenuEventMask") then
		self.view:setRightMenuState(not self.view.rightMenu.activeSelf)
	elseif(obj.name == "ButtonExitOnMenu") then
		if nil == self.gameState then
			self:dispatch_module_event("roomsetting", "Event_RoomSetting_ExitRoom")
		else
			if(self.curTableData.HallID and self.curTableData.HallID > 0) then
				if not self.curTableData.ruleJsonInfo.allowDissolveRoom or self.curTableData.ruleJsonInfo.allowDissolveRoom == 1 then
					self:dispatch_module_event("roomsetting", "Event_RoomSetting_DissolvedRoom", 1)
					self:dispatch_package_event("Event_RoomSetting_DissolvedRoom", 1)
				else
					ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("圈主禁止解散房间。")
				end
			else
				self:dispatch_module_event("roomsetting", "Event_RoomSetting_DissolvedRoom", 1)
				self:dispatch_package_event("Event_RoomSetting_DissolvedRoom", 1)
			end
		end
	elseif(obj.name == "ButtonActivity") then
		local object =
		{
			showRegionType = "table",
			showType="Manual",
		}
		ModuleCache.ModuleManager.show_public_module("activity", object)
	elseif(obj.name == "ButtonEarlyStart") then
		local isNotice = ModuleCache.PlayerPrefsManager.GetInt(string.format("%s_EarlyStartNotice",ModuleCache.GameManager.curGameId),2)
		if 2 == isNotice then
			local intentData = {}
			intentData.isNotice = true
            self.table_earlystart_module = ModuleCache.ModuleManager.show_module("public","table_earlystart",intentData)
		else
			---申请立即开始
			self:dispatch_module_event("tablestrategy", "Event_StartNow",1)
		end
	end

	if obj.transform.parent.gameObject.name == "RightMenu" then
		self.view:setRightMenuState(false)
	end

	if playerClickButtonSound then
		ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
	end
end

function TableModule:guo_hu_action(callback)
	if(self.view.openGuoHu and self.tableView.canHu) then
		ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common(string.format("您确认放弃胡牌吗？"), function()
			if(callback) then
				callback()
			end
		end, nil)
		self.view.canHu = false
	elseif(callback) then
		callback()
	end
end

-- 实时刷新游戏状态
function TableModule:show_game_result(newGameState)
	local showDissolve = ModuleCache.ModuleManager.module_is_active("public", "dissolveroom")
    if(newGameState) then
		if(self.showOneResult and newGameState.Result == 2) then
			TableManager.curTableData.needShowTotalResult = true
		end
		if( newGameState.Result == 1  or newGameState.Result == 3 ) then
			self.showOneResult = true
			self.presettlementState = newGameState
			if(self.view.ConfigData.isKaWuXing) then
				if #newGameState.MaiMa > 0 then
					self:show_maima_kawuxing(newGameState)
				else
					self:show_maima_custom(newGameState)
				end
			else
				self:show_maima_custom(newGameState)
			end
		elseif((showDissolve and newGameState.Result == 2) or (newGameState.Result == 2 and (not self.showOneResult ) )) then
			ModuleCache.ModuleManager.hide_module("public", "dissolveroom")
			local initData = {}
			initData.gameState = newGameState
			ModuleCache.ModuleManager.show_module("majiang", "totalgameresult",initData)
			self.resultWait = false
		end

		--刷新游戏状态   是否显示  托管
		self:dispatch_module_event("table", "Event_Refresh_State",newGameState)
    end
end

function TableModule:refresh_user_state(data)
	ModuleBase.refresh_user_state(self, data)
	for i=1,#data.State do
		if(curTableData.SeatID == i - 1) then
			local zunCount = 0
			if(self.gameState) then
				zunCount = self.gameState.zunnum
			end
			if(zunCount == 5 and data.State[i].PiaoType == 1) then
				self.tableModel:request_select_piao({xiaojiScore = zunCount, paoScore = -1})
			end
		end

		--准备按钮显示后请求一次踢人倒计时
		if(not data.State[i].Ready and data.State[i].SeatID == self.view.mySeat and self.gameState == nil ) then
			self.model:request_get_kicked_timeout()
		end
	end
	
	self:dispatch_module_event("table", "Event_All_Player_Ready",self:all_player_ready_done(data))
end

function TableModule:all_player_ready_done(data)
	local allReady = true
	for i,v in ipairs(data.State) do
		if v.Ready == false then
			allReady = false
			break
		end
	end
	return allReady
end

function TableModule:on_show()
	ModuleBase.on_show(self)
end

-- 服务器版本是否是新版本
function TableModule:is_new_version()
	return TableManager.curTableData.serverIsNew
end

function TableModule:on_destroy()
	ModuleBase.on_destroy(self)
	self:setTargetFrame(false)
	TableManager.chatMsgs = {}
	--UpdateBeat:Remove(self.on_update, self)
	-- ApplicationEvent.unsubscibe_app_focus_event(onAppFocusCallback)
end

function TableModule:add_robot()
	local requestData = {
		params = {
			roomid = curTableData.RoomID
		},
		baseUrl = "http://116.62.41.223:8081/AddRobot?robotnum=4&",
	}

	Util.http_get(requestData, function(wwwOperation)

	end, function(error)
		print(error.error)
	end)
end

-------------分离 吃碰杠等操作
function TableModule:chi_mj(obj, kaiGang, pai, chifa)
	if(pai) then
		self:guo_hu_action(function ()
			self.tableModel:request_chi_mj(pai, chifa)
			self.tableView:hide_wait_action_select_card()
		end)
	elseif(kaiGang) then
		self.view:show_cardsel_kaigang(obj.transform.parent.parent.gameObject)
	else
		self.tableView:show_chigrid()
	end
end

function TableModule:peng_mj_new(pai)
	self:guo_hu_action(function ()
		--if(self.view.openGuoHu and self.tableView.wanfaName == "红中麻将" and #self.gameState.KeGang > 0) then
		--	-- 只有红中麻将才需要这个提示，各个红中麻将的提示又不一样
		--	ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common("您是否确认要放弃杠牌？\n放弃杠牌后本局游戏中不允许再杠此牌", function()
		--		if (pai) then
		--			self:peng_mj(pai)
		--		else
		--			self:peng_mj()
		--		end
		--	end, nil)
		--else
			if (pai) then
				self:peng_mj(pai)
			else
				self:peng_mj()
			end
		--end
	end)
end

function TableModule:peng_mj(pai)
	if(pai) then
		if self.tableView.ReadyTing then
			self.tableView.ReadyTing = false
			self.view:show_not_ting(false)
		end

		self.tableModel:request_peng_mj(pai)
		self.tableView:hide_wait_action_select_card()
	else
		self.tableView:show_penggrid()
	end
end

function TableModule:gang_mj_new(kaiGang, parent)
	self.csKaiGang = kaiGang
	local gangList = nil
	if(kaiGang) then
		gangList = self.gameState.KeKaiGang2
	else
		gangList = self.gameState.KeGang
	end

	if (#gangList == 1) then
		self:gang_mj(gangList[1], kaiGang)
	else
		if(kaiGang) then
			self.tableView:show_kaiganggrid(parent)
		else
			self.tableView:show_ganggrid(parent)
		end
	end
end

function TableModule:gang_mj(pai, kaiGang)
	self:guo_hu_action(function ()
		if(not kaiGang) then
			self.tableModel:request_gang_mj(pai)
		else
			self.tableModel:request_kaigang_mj(pai)
		end
		if self.tableView.ReadyTing then
			self.tableView.ReadyTing = false
			self.view:show_not_ting(false)
		end
		self.tableView:hide_wait_action_select_card()
	end)
end

function TableModule:hu_mj(pai)
	self.tableModel:request_hu_mj(pai)
	self.tableView:hide_wait_action_select_card()
end

function TableModule:chu_mj(obj, pai)
	if(self.autoOutMJ) then
		return
	end

	if self.lastChuMjTime then ---最短出牌时间，限制短时间连续出牌
		if UnityEngine.Time.time - self.lastChuMjTime < 0.3 then
			return
		end
	end
	self.lastChuMjTime = UnityEngine.Time.time

	if(not self.selectLiangDone) then
		self.view.selectKeZi = nil
	end

	self.selectLiangDone = false
	self.tableView:chu_mj(obj, pai)
	self.tableModel:request_chu_mj(pai,self.tableView.ReadyTing, self.view.selectKeZi)
	if self.tableView.ReadyTing then
		self.tableView.ReadyTing = false
		self.view.selectKeZi = {}
		self.view:show_not_ting(false)
	end
end

function TableModule:guo_mj()
	self.selectLiang = false
	self:guo_hu_action(function ()
		if self.tableView.ReadyTing then
			self.tableView.ReadyTing = false
			self.view:show_not_ting(false)
		end

		self.tableModel:request_guo_mj()
		self.tableView:hide_wait_action_select_card()
	end)
end

function TableModule:buhua_mj()
	self:guo_hu_action(function ()
		self.tableModel:request_buhua_mj()
		self.tableView:hide_wait_action_select_card()
	end)
end

function TableModule:ting_mj(obj)
	self:guo_hu_action(function ()
		if self.tableView.TingPaiState == 1 then -- TingPaiState = 1 开局可听    TingPaiState = 2 牌局过程中的可以听
			self.tableModel:request_kai_ju_ting_mj()
			self.tableView:hide_wait_action_select_card()
		elseif self.tableView.TingPaiState == 2 then
			--TODO
			self.tableView:show_not_ting(true)
			obj:SetActive(false)
			self.tableView.ReadyTing = true
			self.tableView.showWaitAction = false
		end
	end)
end

function TableModule:cancel_liang()
	if(self.selectLiang) then
		self.view.selectLiangObj:SetActive(false)
	else
		self.view.buliangObj:SetActive(false)
	end
	self.view.waitAction:SetActive(true)
	self.view.actionBtGuo:SetActive(true)
	if(not self.view.onlyRightGang) then
		self.view.showWaitAction = true
	end
	self.view.ReadyTing = false
	self.selectLiang = false
	self.view:cancel_liang()
end

function TableModule:liang_mj(obj)
	--self:guo_hu_action(function ()
		self.view.actionBtGuo:SetActive(false)
		self.view.waitAction:SetActive(false)
		if(#self.gameState.BuLiang > 0 and #self.gameState.KeLiang > 1) then
			self.selectLiang = true
			self.view.selectLiangGray:SetActive(false)
			self.view.selectLiangObj:SetActive(true)
			self.view:show_select_covered()
		else
			self.tableView:show_not_ting(true)
			self.view.buliangObj:SetActive(true)
		end
		self.tableView.ReadyTing = true
		self.tableView.showWaitAction = false
		self.view:hide_select_card_childs()
		self.view.buttonGangRight:SetActive(false)
		self.view.buttonGangRightDisable:SetActive(false)
	--end)
end

function TableModule:diao_mj(pai)
	if(pai) then
		self:guo_hu_action(function ()
			self.tableModel:request_diao_dui(pai)
			self.tableView:hide_wait_action_select_card()
		end)
	else

	end
end

function TableModule:setTargetFrame(anim)
	ModuleCache.UnityEngine.Application.targetFrameRate = (anim and 60) or ModuleCache.AppData.tableTargetFrameRate
end

function TableModule:show_maima_custom(newGameState)
	local waitTime = 2
	local maiMa = newGameState.MaiMa
	if(self.view.ConfigData.isLiuZhou) then
		maiMa = newGameState.Player[curTableData.SeatID + 1].MaPai
	end
	if # maiMa >0 then
		waitTime = #maiMa *0.2 +1.3
		self:subscibe_time_event(1, false, 0):OnComplete(function(t)
			if(self:can_show_result()) then
				ModuleCache.ModuleManager.show_module("majiang", "tablepop", newGameState)
			end
		end)
	end

	self.view:play_hu_sound(newGameState)
	self.resultWait = false
	self.showOneResult = true
	self:subscibe_time_event(waitTime, false, 0):OnComplete(function(t)
		if(self:can_show_result()) then
			if(ModuleCache.ModuleManager.module_is_active("majiang", "tablepop")) then
				ModuleCache.ModuleManager.hide_module("majiang", "tablepop")
			end
			local initData = {}
			initData.gameState = newGameState
			if self.view.ConfigData.pnShowResult then
				ModuleCache.ModuleManager.show_module("majiang", "onegameresultpuning", initData)
			else
				ModuleCache.ModuleManager.show_module("majiang", "onegameresult", initData)
			end
		end
	end)
end

---显示牌桌预览相关操作控件
function TableModule:show_table_presettlement(state)
	if 4 == curTableData.RoomType then
		ModuleCache.ComponentUtil.SafeSetActive(self.view.preButtonChange,true)
		ModuleCache.ComponentUtil.SafeSetActive(self.view.preButtonBegin,true)
		ModuleCache.ComponentUtil.SafeSetActive(self.view.buttonBackToSettle,false)
		ModuleCache.ComponentUtil.SafeSetActive(self.view.buttonContinue,false)
	else
		ModuleCache.ComponentUtil.SafeSetActive(self.view.preButtonChange,false)
		ModuleCache.ComponentUtil.SafeSetActive(self.view.preButtonBegin,false)
		ModuleCache.ComponentUtil.SafeSetActive(self.view.buttonBackToSettle,true)
		ModuleCache.ComponentUtil.SafeSetActive(self.view.buttonContinue,true)
		if curTableData.needShowTotalResult then  --如果是大结算
			ModuleCache.ComponentUtil.SafeSetActive(self.view.buttonContinue,false)
			self.view.buttonBackToSettle.transform.anchoredPosition =  Vector3.New(0, 92, 0)
		else
			ModuleCache.ComponentUtil.SafeSetActive(self.view.buttonContinue,true)
			self.view.buttonBackToSettle.transform.anchoredPosition =  Vector3.New(-200, 92, 0)
		end
	end
	ModuleCache.ComponentUtil.SafeSetActive(self.view.PreSettlementObj, state)
end

function TableModule:show_maima_kawuxing(newGameState)
	if(newGameState.Result == 1) then
		self.resultWait = false
	end
	local waitTime = 2.5
	if(ModuleCache.ModuleManager.module_is_active("majiang", "tablepop")) then
		waitTime = 0
	else
		self.view:play_hu_sound(newGameState)
	end
	self:subscibe_time_event(waitTime, false, 0):OnComplete(function(t)
		if(self:can_show_result()) then
			ModuleCache.ModuleManager.show_module("majiang", "tablepop", newGameState)
		end
	end)
end

function TableModule:can_show_result()
	local showTotalResult = ModuleCache.ModuleManager.module_is_active("majiang", "totalgameresult")
	return not showTotalResult and self.gameState and self.gameState.Result ~= 0 and (not self.view.seatHolderArray[1].ready or TableManager.curTableData.isPlayBack)
end

function TableModule:update_user_state()
	ModuleBase.update_user_state(self)
	self:update_early_start()
end

function TableModule:update_early_start()
	local isActive = false
	local isEnable = false
	local curPlayerNum = self.curPlayer
	local curMaxPlayerNum  = self.curTableData.ruleJsonInfo.PlayerNum
	local playerNumData = {}

	if curPlayerNum < curMaxPlayerNum then
		--self.view:show_begin_button_time_down(false)
	end

	if true then  ---老框架不提供提前开始功能true
		self.view:set_early_start_button_state(false,false,curPlayerNum,playerNumData)
		return
	end

	local playerNumIsChange = false
	if self.lastCurPlayr ~= self.curPlayer then
		playerNumIsChange = true
	end
	self.lastCurPlayr = self.curPlayer

	if curPlayerNum < curMaxPlayerNum then
		for k,v in pairs(self.view.ConfigData) do
			if v.tag and v.tag.togglesTile and v.tag.togglesTile == "人数:" then
				local numData = v.list[1] or {}
				for i=1,#numData do
					local num = string.split(numData[i]["json"], ":")[2]
					num = tonumber(num)
					if num < curMaxPlayerNum then
						table.insert(playerNumData,num)
					end
				end
				break
			end
		end
		if #playerNumData >= 1 then
			isActive = true
			for i=1,#playerNumData do
				local num = playerNumData[i]
				if curPlayerNum >= num then
					isEnable = true
					break
				end
			end
		end
	end
	self.view:set_early_start_button_state(isActive,isEnable,curPlayerNum,playerNumData)

	if playerNumIsChange and ModuleCache.ModuleManager.module_is_active("public", "table_earlystart") then
		ModuleCache.ModuleManager.hide_module("public", "table_earlystart")
	end
end

return  TableModule