local ModuleCache = ModuleCache
local TableManager = TableManager
local Vector3 = Vector3
local Time = Time
local class = require("lib.middleclass")
local ModuleBase = require('package.majiang.module.tablebase.tablebase_module')
---@type Mj2DManager
local MjManager = require('package.majiang.module.tablenew.mj2d_manager')
---@class TableMJModule:TableMJBaseModule
---@field model TableMJModel
---@field view TableMJView
local TableModule = class('tableModule', ModuleBase)
local CSmartTimer = ModuleCache.SmartTimer.instance
local Input = UnityEngine.Input
local dragYLimit = 110
local math = math
local string = string
local PlayerPrefs = UnityEngine.PlayerPrefs
local MatchingManager = require("package.public.matching_manager")


function TableModule:initialize(...)
	MjManager.clear()
	local list = require("list")
	self.cacheStates = list:new()
	self.curTableData = TableManager.curTableData
	if(self.curTableData.isPlayBack) then
		self.curTableData.gamerule = self.curTableData.videoData.gamerule
		self.curTableData.HallID = self.curTableData.videoData.hallnum
	else
		self.curTableData.gamerule = self.curTableData.Rule
	end
	self.curTableData.ruleJsonInfo = TableUtil.convert_rule(self.curTableData.gamerule)
	self:on_initialize(...)
	self:reset_state()
end

function TableModule:on_initialize(...)
	local config = TableManager.curTableData.gameRuleConfig
	local wanfaType = Config.GetWanfaIdx(self.curTableData.ruleJsonInfo.GameType)
	if(wanfaType > #config.createRoomTable) then
		wanfaType = 1
	end
	self.ConfigData = config.createRoomTable[wanfaType]
	if(self.ConfigData.view) then
		ModuleBase.initialize(self, "view." .. self.ConfigData.view, "table_model", ...)
	else
		ModuleBase.initialize(self,"view.tablecommon_view", "table_model", ...)
	end
	if(self.ConfigData.controller) then
		self.controller = require('package.majiang.module.tablenew.controller.' .. self.ConfigData.controller):new(self)
	else
		self.controller = require('package.majiang.module.tablenew.controller.tablecommon_controller'):new(self)
	end
end

function TableModule:on_module_inited(...)
	ModuleBase.on_module_inited(self)
end

function TableModule:on_module_event_bind()
	ModuleBase.on_module_event_bind(self)
	self:subscibe_module_event("tablestrategy", "Event_TableStragy_BeginGame", function(eventHead, eventData)
		self.model:request_select_piao(eventData)
	end)
	self:subscibe_module_event("tablestrategy", "Event_TableStragy_XuanPiao", function(eventHead, eventData)
		self.model:request_select_xuan_piao(eventData)
	end)

	self:subscibe_module_event("tableadd", "Event_BaoQue", function(eventHead, eventData)
		self.model:request_que_mj(eventData)
	end)
	--一桌结束开始下一桌
	self:subscibe_module_event("tablestrategy", "Event_Table_Restart", function(eventHead, eventData)
		self.gameState = nil
		self.newGameState = nil
	end)
	--一局结束开始下一局
	self:subscibe_module_event("tablestrategy", "Event_Show_TableStrategy", function(eventHead, eventData)
		self:reset_state()
		self.view:show_table_presettlement(false)
		self.controller:auto_change_table(eventData)
	end)
    ---金币场退出房间
    self:subscibe_module_event("tablestrategy", "Event_Gold_Room_Quit", function(eventHead, eventData)
		TableManager.curTableData.goldRoomExitTag = true ---金币场退出标记
		local connect = TableManager.clientConnected
		if connect then ---金币场连接存在
			self:dispatch_module_event("roomsetting", "Event_RoomSetting_ExitRoom")
		end
		self:exit_room()
	end)
	self:subscibe_module_event("tablestrategy", "Event_Gold_Room_Jump", function(eventHead, eventData)
		local goldid = eventData
		MatchingManager:gold_jump(goldid,function ()
			ModuleCache.LogManager.custom_Log("金币场换桌 goldid ："..tostring(goldid).." 成功，删除牌桌")
			TableManager.curTableData.goldRoomExitTag = true ---金币场退出标记
			TableManager.curTableData.goldRoomJump = true 
			self:exit_room(nil,true)
		end)
		ModuleCache.LogManager.custom_Log("金币场换桌 goldid ："..tostring(goldid))
	end)
    ---当金币场跳转出错
	self:subscibe_package_event("Event_GoldJump_error", function(eventHead, eventData)
		TableManager.curTableData.goldRoomExitTag = true ---金币场退出标记
		self:exit_room()
	end)

	self:subscibe_module_event("tablestrategy", "Event_QiShouHu_Continue", function(eventHead, eventData)
		self.model:request_restart_mj()
	end)

	self:subscibe_module_event("onegameresult", "Event_Close_OneGameResult", function(eventHead, eventData)
		self.view:show_table_presettlement(true)
	end)

	self:subscibe_model_event("Event_Msg_ReturnKickedTimeOutNTF", function(eventHead, eventData)
		self.view:show_ready_time_down(eventData.Time)
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
			if TableManager:cur_game_is_gold_room_type() then
				TableManager.curTableData.goldRoomExitTag = false ---清理金币场退出标记
			end
		end
	end)

	self:subscibe_module_event("tablepop", "Event_MaiMa", function(eventHead, eventData)
		self.model:request_maima_mj(eventData)
	end)

	---注册监听2D，3D麻将切换的消息
	self:subscibe_package_event("Event_RoomSetting_Refresh2dOr3d", function(eventHead, eventData)
		PlayerPrefs.SetInt("Refresh2dOr3dRoomID",self.curTableData.RoomID) ---保存切换2D，3D模式时候的房间号，用于判断是否进行GPS作弊警告
		if 1 == eventData then
			---如果是切换到3D模式，则先检查资源更新
			ModuleCache.PackageManager.update_package_version("majiang3d", function()
				---断开连接，重连，切换2D，3D
                TableManager:heartbeat_timeout_reconnect_game_server()
            end)
		elseif 2 == eventData then
			---如果是切换到2D模式，则先检查资源更新
			ModuleCache.PackageManager.update_package_version("majiang", function()
				---断开连接，重连，切换2D，3D
                TableManager:heartbeat_timeout_reconnect_game_server()
            end)
		end
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
		local failedIndexTable = {}
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
			if 4 == act then
				table.insert(failedIndexTable,i)
			end
		end
		if #failedIndexTable > 0 then
			agreeCount = -1
		end
		if -1 == agreeCount or 4 == eventData.ErrCode then
			ModuleCache.ModuleManager.destroy_module("public", "table_earlystart")
			if 1 == eventData.ErrCode then
				local localIndex = self.view:server_to_local_seat(RefuseIndex - 1)
				local name = self.view.seatHolderArray[localIndex].textPlayerName.text
				local text = name.."拒绝提前开始游戏"
				ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(text)
			elseif 4 == eventData.ErrCode then
				local text = ""
				for i=1,#failedIndexTable do
					local index = failedIndexTable[i]
					local localIndex = self.view:server_to_local_seat(index - 1)
					local name = self.view.seatHolderArray[localIndex].textPlayerName.text
					text = text..name.." "
				end
				text = text.."体力和钻石不足无法提前开局"
				ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(text)
			end
			self.controller:on_earlystart_no()
		elseif agreeCount >= self.curPlayer then  ---如果全部同意，则断线重连
			self.controller:on_earlystart_ok()
			------修改游戏规则中的人数,存回去
			self.curTableData.ruleJsonInfo.PlayerNum = self.curPlayer
			self.curTableData.Rule = ModuleCache.Json.encode(self.curTableData.ruleJsonInfo)
			TableManager:heartbeat_timeout_reconnect_game_server() ---断线重连
		else
			local intentData = {}
			intentData.earlyStartData = eventData
			self.table_earlystart_module = ModuleCache.ModuleManager.show_module("public","table_earlystart",intentData)
			self:dispatch_module_event("tableBackAlert", "tableStartNow")
		end
	end)
	-------------------------------------Eed--------------------------------------

	self:subscibe_model_event("Event_Msg_UpdateTempInfoNTF", function(eventHead, eventData)
		local myUserTempInfo = eventData.TempData[self.view.mySeat + 1]
		if myUserTempInfo then
			for i=1,#myUserTempInfo.Data do
				local TempInfoData = myUserTempInfo.Data[i]
				local id = TempInfoData.Id
				local note = TempInfoData.Note
				if id == 20181214 then
					self.curTableData.RoomHisID = tonumber(note)
					break
				end
			end		
		end
	end)

	UpdateBeat:Add(self.on_update, self)
end

--- 重置状态
function TableModule:reset_state()
	self.paiDataStates = {}
	for i = 1, 4 do
		local paiState = {
			outMJNum = 0,
			huaMJNum = 0,
			chuPaiCnt = -1,
			lastHandData = nil,
			lastDownData = nil,
            downChangeType = 0,
			playBackOutMjNum = 0,
		}
		table.insert(self.paiDataStates, paiState)
	end
	self.showOneResult = false
	self.view:reset_state()
	self.controller:on_reset_state()
end

--- 检测手牌数据发生变化
function TableModule:check_state_hand_change(index, playerState)
	if(self.view:is_me(nil, index - 1)) then
		return true
	end
	local paiData = self.paiDataStates[index]
	if(not paiData.lastHandDatas) then
		self:set_last_hand_data(playerState, paiData)
		return true
	end
	if(#playerState.ShouZhang ~= #paiData.lastHandDatas) then
		self:set_last_hand_data(playerState, paiData)
		return true
	end
	local change = false
	for i = 1, #playerState.ShouZhang do
		local handData = playerState.ShouZhang[i]
		local lastHandData = paiData.lastHandDatas[i]
		if(handData.Pai ~= lastHandData.Pai or handData.State ~= lastHandData.State or handData.Gray ~= lastHandData.Gray) then
			change = true
			break
		end
	end
	self:set_last_hand_data(playerState, paiData)
	return change
end

--- 检测下张数据发生变化
function TableModule:check_state_down_change(index, playerState)
	local paiData = self.paiDataStates[index]
	if(not paiData.lastDownDatas) then
        paiData.downChangeType = 0
		self:set_last_down_data(playerState, paiData)
		return true
	end
	if(#playerState.XiaZhang ~= #paiData.lastDownDatas) then
        if(#playerState.XiaZhang > #paiData.lastDownDatas) then
            paiData.downChangeType = 1
        else
            paiData.downChangeType = 2
        end
		self:set_last_down_data(playerState, paiData)
		return true
	end
    paiData.downChangeType = 0
	local change = false
	for i = 1, #playerState.XiaZhang do
		local downData = playerState.XiaZhang[i]
		local lastDownData = paiData.lastDownDatas[i]
		if(#lastDownData.Pai ~= #downData.Pai) then
			change = true
			break
		end
		for j = 1, #downData.Pai do
			if(downData.Pai[j] ~= lastDownData.Pai[j]) then
				change = true
				break
			end
		end
	end
	if(change) then
		self:set_last_down_data(playerState, paiData)
	end
	return change
end

--- 设置最后的手牌数据
function TableModule:set_last_hand_data(playerState, paiData)
	paiData.lastHandDatas = {}
	for i = 1, #playerState.ShouZhang do
		table.insert(paiData.lastHandDatas, playerState.ShouZhang[i])
	end
end

---- 设置最后的下张数据
function TableModule:set_last_down_data(playerState, paiData)
	paiData.lastDownDatas = {}
	for i = 1, #playerState.XiaZhang do
		table.insert(paiData.lastDownDatas, playerState.XiaZhang[i])
	end
end

--- 检测牌局中牌堆状态变化
function TableModule:check_state_change(index, playerState, checkType)
	local paiData = self.paiDataStates[index]
	if(self.curTableData.isPlayBack) then
		if(playerState.ChuPaiCnt > 0 and (playerState.showArrow == nil or playerState.showArrow)) then
			self.view.newMJPointer = index
		end
		return true
	end

	if(checkType == 1) then --手张
		if(self:check_state_hand_change(index, playerState)) then
			return true
		end
	elseif(checkType == 2) then --弃张
		if(playerState.ChuPaiCnt > 0 and (playerState.showArrow == nil or playerState.showArrow)) then
			self.view.newMJPointer = index
		end
		if(#playerState.QiZhang ~= paiData.outMJNum or self.gameState.Result ~= 0) then
			return true
		end
	elseif(checkType == 3) then --下张
		if(self:check_state_down_change(index, playerState)) then
			return true
		end
	elseif(checkType == 4) then --花牌
		if(#playerState.HuaPai ~= paiData.huaMJNum) then
			return true
		end
	end
	return false
end

--- 等待状态刷新
function TableModule:is_waiting()
	return self.isCacheState
end

--- 实时刷新游戏状态
function TableModule:refresh_game_state(data)
	self.view.newGameState = data
	self.newGameState = data
	---这个GamsState计数是用来判断当前游戏状态是刚断线重连，还是游戏已经进行一段时间
	if not self.gameStateCounter then
		self.gameStateCounter = 1
	else
		self.gameStateCounter = self.gameStateCounter + 1
	end
	local hasCache = false
	if self.cacheStates.length > 0 then
		hasCache = true	
	end
	self.cacheStates:push(data)
	if(not self.isCacheState and not hasCache) then
		self:process_next_cache_game_state()
	end
end


--- 开始缓存游戏状态
function TableModule:begin_cache_game_state()
	self.isCacheState = true
	print("開始狀態緩存")
end

---处理下一个缓存的gameState
function TableModule:process_next_cache_game_state()
	local gameState = self.cacheStates:shift()
	if gameState then
		self:process_gams_state(gameState)
		return gameState
	end
end

---处理gameState
function TableModule:process_gams_state(gameState)
	self.gameState = gameState
	self.curTableData.gameState = gameState
	self:on_refresh_game_state(gameState)
end

TableModule.process_cahe_state_time_spaceing = 0.03

--- 结束缓存游戏状态
function TableModule:end_cache_game_state(newGameState)
	print("結束狀態緩存")
	self.isCacheState = false
	local lastProcessGameState = nil  ---最后处理的缓存GameState
	if newGameState then  ---插队执行的GameState
		self:process_gams_state(newGameState)
		lastProcessGameState = newGameState
	else
		lastProcessGameState = self:process_next_cache_game_state()
	end
	if(lastProcessGameState and not self.isCacheState) then
		self:subscibe_time_event(self.process_cahe_state_time_spaceing, false, 0):OnComplete(function(t)
			self:end_cache_game_state()
		end)
	end
end

---重置GameStaetu缓存
function TableModule:reset_cache_game_state()
	self.cacheStates:clear()
	self.isCacheState = false
end

--- 设置下一次state延迟时间 ,此接口的实现有BUG，暂时停用
function TableModule:set_next_state_delay_time(delayTime)
	--self.nextStateDelayTime = delayTime
end

--- 刷新状态实体
--Result = 16;			//0:在牌局中 1:已结算一小局 2:已结算所有局。3:局中结算 如果不是1，则忽略以下所有参数。
--CurPlayer = 8;		//当前等待出牌的座位号。为-1表示已出牌，为-2表示有人拦牌。   0xffffffff - 1 == -2
function TableModule:on_refresh_game_state(gameState)
	if(gameState.Result == 2) then
		return
	end
	self.controller:game_state_begin(gameState)
	if(self:is_waiting()) then
		return
	end
	self.view:game_state_begin(gameState)
	self.view.newMJPointer = 0
	self.view.isMidTing = false
	if(self.curTableData.isPlayBack) then
		self.view:set_mj_pointer()
	end
	self.view:game_state_dun()
	self.view:game_state_dice()
	if(gameState.CurPlayer == 0xffffffff - 1) then -- 0xffffffff - 1  = -2 拦牌
		self.view:game_state_wait_action()
	elseif(gameState.CurPlayer <= 4) then
		self.view:game_state_pointer_player()
	end
    self.view:game_state_lai_zi(gameState.LaiZi ~= 0)
    self.view:game_state_lai_gen(gameState.LaiGen ~= 0)
	self.view:game_state_wei_zhang(gameState.WeiZhang ~= 0)
	self.view:show_ke_bu_hua(gameState.KeBuHua and #gameState.KeBuHua > 0)
	self.view:show_ke_chi(gameState.KeChi and #gameState.KeChi > 0)
	self.view:show_ke_peng(gameState.KePeng and #gameState.KePeng > 0)
	self.view:show_ke_gang(gameState.KeGang and #gameState.KeGang > 0)
	self.view:show_ke_hu(gameState.KeHu and #gameState.KeHu > 0)
	self.view:show_ke_piao_hua(gameState.KePiaoHua)
	local showMidTing = true
	if(self.ConfigData.tingLocalJson) then
		showMidTing = self.curTableData.ruleJsonInfo[self.ConfigData.tingLocalJson]
	end
	self.view:show_ke_ting(gameState.KeTingBeg or self.view:show_mid_ting(showMidTing))
	if(gameState.KeTingBeg) then
		self.tingPaiState = 1
	elseif(self.view:show_mid_ting(showMidTing)) then
		self.tingPaiState = 2
	else
		self.tingPaiState = 0
	end
	if(self.gameState.bpcs and #self.gameState.bpcs > 0) then
		if(self:sankou_is_open()) then
			self.view:game_state_sankou_open()
		else
			self.view:game_state_sankou_close()
		end
	else
		self.view:game_state_sankou_disable()
	end
	self.view.allCard = self:caculate_all_mj(gameState)
	local yiTing = self.gameState.YiTing and #self.gameState.YiTing > 0 and self.gameState.YiTing[1] ~= 0
	local isShowTing = self.view:getIsShowTingSetting()
	self.view:update_hu_list(yiTing, self.view.allCard,isShowTing)
	local outTags = {}
	local allQue = true
	for i=1,#gameState.Player do
		outTags[i] = false
		if(gameState.Player[i].Que and gameState.Player[i].Que == 0) then
			allQue = false
		end
	end
	local showDingQue = true
	if(self.view.ConfigData.dingQueLocalJson) then
		showDingQue = self.ruleJsonInfo[self.view.ConfigData.dingQueLocalJson]
	end
	if(self.view.ConfigData.isDingQue and showDingQue) then
		self.view:show_ding_que(allQue)
	end
	for i = 1, #gameState.Action do
		local action = gameState.Action[i]
		local actionPlayerState = gameState.Player[action.SeatID + 1]
		if (9 == action.Action or (8 == action.Action and
				(not self.view:is_me(nil, action.SeatID)) or actionPlayerState.IntrustState == 1 or self.curTableData.isPlayBack)) then
			outTags[action.SeatID + 1] = true
		end
		local seatId = action.SeatID
		local localSeat = self.view:server_to_local_seat(seatId)
		if(self.view:is_me(localSeat)) then
			self.view:handle_action_me(localSeat, action.Action)
		else
			self.view:handle_action_other(localSeat, action.Action)
		end
	end
	for i = 1, #gameState.Player do
		local localSeat = self.view:server_to_local_seat(i - 1)
		local playerState = gameState.Player[i]
		if(playerState.piaohuacfgnew and playerState.piaohuacfgnew >= 2) then
			self.view:show_piao_hua(playerState.piaohuacfgnew - 1, localSeat)
		end
		if(playerState.lianzhuangnum > 1) then
			self.view:show_remain_banker_num(playerState.lianzhuangnum, localSeat)
		end
		self.view:show_ting_pai_tag(localSeat, #playerState.YiTing > 0)
		self.view:show_seat_sankou(localSeat, playerState.BaoPaiJingGao)
		self.view:game_state_begin_set_player_state(playerState, localSeat, i - 1)
		if(self:check_state_change(i, playerState, 1)) then
			self.view:game_state_begin_hand(i - 1)
			local handData
			local handIndex
			local isMe = self.view:is_me(nil, i - 1)
			if(isMe) then
				handData,handIndex = self:convert_hand_data(playerState)
				self.lastChuMjTime = UnityEngine.Time.time  ---每次刷新手牌都重置一下，这个变量干嘛，这个脚本搜一下就知道，̤̫(づ。◕ ౩ ◕。)づ
			else
				handData,handIndex = self:convert_hand_data_other(playerState)
			end
			for j = 1, #handData do
				local showHu = #playerState.HuPai ~= 0 and j > #handData - #playerState.HuPai and playerState.HuPai[1] ~= 0
				local lastMjMove = showHu or (i - 1 == gameState.ArrowPlayer and j == #handData)
				local params = {
					handData = handData[j],
					localSeat = localSeat,
					dataIndex = j,
					index = j,
					showHu = showHu,
					lastMjMove = lastMjMove,
					playerState = playerState,
				}
				if(handIndex) then
					params.dataIndex = handIndex[j]
				end
				params.lastMjPop = not showHu and lastMjMove and self.view:can_out() and localSeat == 1
				self.view:set_hand_data(params)
			end
			self.view:game_state_end_hand(i - 1)
		end

		if(self:check_state_change(i, playerState, 2)) then
			self.view:game_state_begin_out(i - 1)
			local showPointer = playerState.showArrow == nil or playerState.showArrow
			if(#playerState.QiZhang > self.paiDataStates[i].outMJNum) then
				for j = self.paiDataStates[i].outMJNum + 1, #playerState.QiZhang do
					local lastOut = j > #playerState.QiZhang - playerState.ChuPaiCnt
					if self.curTableData.isPlayBack then
						if #playerState.QiZhang <= self.paiDataStates[i].playBackOutMjNum then
							lastOut = false
						end
					end
					local params = {
						outData = playerState.QiZhang[j],
						localSeat = localSeat,
						outIndex = j,
						showPointer = lastOut and showPointer,
						lastOut = lastOut and outTags[i],
						serverSeat = i - 1,
						playerState = playerState,
					}
					self.view:set_out_data(params)
				end
			end
			self.view:game_state_end_out({serverSeat = i - 1, curOutNum = #playerState.QiZhang, preOutNum = self.paiDataStates[i].outMJNum})
			if(not self.curTableData.isPlayBack) then
				self.paiDataStates[i].outMJNum = #playerState.QiZhang
			else
				self.paiDataStates[i].playBackOutMjNum = #playerState.QiZhang
			end
		end

		if(self:check_state_change(i, playerState, 3)) then
			self.view:game_state_begin_down(i - 1)
			for j = 1, #playerState.XiaZhang do
				local downData = playerState.XiaZhang[j]
				local params =
				{
					downData = downData,
					localSeat = localSeat,
					serverSeat = i - 1,
					downIndex = j,
				}
				self.view:set_down_data(params)
			end
			self.view:game_state_end_down(i - 1, self.paiDataStates[i].downChangeType, playerState)
		end

		if(self:check_state_change(i, playerState, 4)) then
			self.view:game_state_begin_hua(i - 1)
			if(#playerState.HuaPai > self.paiDataStates[i].huaMJNum) then
				for j = self.paiDataStates[i].huaMJNum + 1, #playerState.HuaPai do
					local huaData = playerState.HuaPai[j]
					local params =
					{
						huaData = huaData,
						localSeat = localSeat,
						huaIndex = j,
						playerState = playerState,
					}
					self.view:set_hua_data(params)
				end
			end
			self.view:game_state_end_hua({serverSeat = i - 1, curHuaNum = #playerState.HuaPai, preHuaNum = self.paiDataStates[i].huaMJNum})
			if(not self.curTableData.isPlayBack) then
				self.paiDataStates[i].huaMJNum = #playerState.HuaPai
			end
		end
		self.view:game_state_end_set_player_state(playerState, localSeat, i - 1)
	end
	self.view:set_mj_pointer()
	self:update_recommend_pai(gameState)
	self.view:game_state_end()
	---处理牌局中打色
	if 0 ~= gameState.KaiGangDice1 or 0 ~= gameState.KaiGangDice2 then
		self:begin_cache_game_state()
		self.view:show_kaigang_dice(gameState.KaiGangDice1,gameState.KaiGangDice2,function ()
			self:end_cache_game_state()
		end)
	end

	self.view.playType:on_refresh_game_state(gameState)

	self.view:try_uploald_hu_screen_shot()  ---尝试提交可胡时候的截图
end

--- 三口被打开
function TableModule:sankou_is_open()
	for i=1,#self.gameState.bpcs do
		local sanKouData = self.gameState.bpcs[i]
		if(sanKouData.change)  then
			return true
		end
	end
	return false
end

--- 计算所有的牌
function TableModule:caculate_all_mj(gameState)
	local allCard = {}
	for i=1,43 do
		allCard[i] = 0
	end
	for i=1,#gameState.Player do
		local playerState = gameState.Player[i]
		for j=1,#playerState.ShouZhang do
			local pai = playerState.ShouZhang[j].Pai
			if(pai ~= 0) then
				allCard[pai] = allCard[pai] + 1
			end
		end
		for j=1,#playerState.QiZhang do
			local pai = playerState.QiZhang[j]
			if(pai ~= 0) then
				allCard[pai] = allCard[pai] + 1
			end
		end
		for j=1,#playerState.HuaPai do
			local pai = playerState.HuaPai[j]
			if(pai ~= 0) then
				allCard[pai] = allCard[pai] + 1
			end
		end
		for j=1,#playerState.XiaZhang do
			local pais = playerState.XiaZhang[j].Pai
			if(#pais == 4) then
				local realPais = playerState.XiaZhang[j].RealPai
				if(realPais and #realPais > 0) then --如果有真实的牌值
					for k = 1, #realPais do
						local pai = realPais[k]
						if(pai ~= 0) then
							allCard[pai] = allCard[pai] + 1
						end
					end
				elseif(playerState.XiaZhang[j].AnGang or (pais[1] == 0 and pais[4] ~= 0)) then
					local pai = pais[4]
					if(pai ~= 0) then
						allCard[pai] = allCard[pai] + 4
					end
				else
					for i = 1, #pais do
						local pai = pais[i]
						if(pai ~= 0) then
							allCard[pai] = allCard[pai] + 1
						end
					end
				end
			else
				for k=1,#pais do
					local pai = pais[k]
					if(pai ~= 0) then
						allCard[pai] = allCard[pai] + 1
					end
				end
			end
		end
	end

	if(gameState.LaiGen ~= 0 and allCard[gameState.LaiGen] < 4) then
		allCard[gameState.LaiGen] = allCard[gameState.LaiGen] + 1
	end
	return allCard
end

--- 手牌转换（其他人）
function TableModule:convert_hand_data_other(playerState)
	if(not playerState.MoZhang or playerState.MoZhang == 0) then
		return playerState.ShouZhang
	end
	local check = false
	local handData = {}
	local lastData
	if(playerState.MoZhang and playerState.MoZhang ~= 0) then
		for i = 1, #playerState.ShouZhang do
			local handPai = playerState.ShouZhang[i].Pai
			if(handPai == playerState.MoZhang and not check and not playerState.ShouZhang[i].Gray) then
				check = true
				lastData = playerState.ShouZhang[i]
			else
				table.insert(handData, playerState.ShouZhang[i])
			end
		end
	end
	if(lastData) then
		table.insert(handData, lastData)
	end
	return handData
end

--- 手牌转换（本人）
function TableModule:convert_hand_data(playerState)
	local handIndex = {}
	local handData = {}
	local lastData
	local lastIndex = 0
	local check = false
	if(playerState.MoZhang and playerState.MoZhang ~= 0) then
		for i = 1, #playerState.ShouZhang do
			local handPai = playerState.ShouZhang[i].Pai
			if(handPai == playerState.MoZhang and not check and not playerState.ShouZhang[i].Gray) then
				lastIndex = i
				check = true
			end
		end
	end

	check = false
	for i = 1, #playerState.ShouZhang do
		local handPai = playerState.ShouZhang[i].Pai
		if(playerState.MoZhang and playerState.MoZhang ~= 0) then
			if((i == lastIndex or (lastIndex == 0 and handPai == playerState.MoZhang)) and not check) then
				lastData = playerState.ShouZhang[i]
				lastIndex = i
				check = true
			else
				table.insert(handData, playerState.ShouZhang[i])
				table.insert(handIndex, i)
			end
		else
			table.insert(handData, playerState.ShouZhang[i])
			table.insert(handIndex, i)
		end
	end
	if(lastData) then
		table.insert(handData, lastData)
		table.insert(handIndex, lastIndex)
	end
	if(lastIndex ~= 0) then
		self.getHandIndex = lastIndex
	else
		self.getHandIndex = #playerState.ShouZhang
	end
	return handData, handIndex
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

-- on_press_up -> on_click -> on_end_drag
function TableModule:on_begin_drag(obj, arg)
	--- 手机上可以多点操作，所以过滤掉
	if(self:is_waiting() or self.isDragMjobj) then
		return
	end
    if(self:can_out(obj)) then
		self:setTargetFrame(true)
		obj.transform:SetAsLastSibling()
		self.beginPressPos = obj.transform.localPosition
		self.isDrag = true
		self.lastPressMjTime = UnityEngine.Time.time
		self.isDragMjobj = obj
		self.checkTouchCount = Input.touchCount > 0
		self.view:click_hand_mj_can_out(obj, self.isDrag)
		self.view:ready_drag_mj(obj, true)
	end
end

--- 可以出此麻将
function TableModule:can_out(obj)
	return obj.name == "1_InMJ" and self.view:can_out() and self:can_click(obj)
end

--- 可以触发点击事件
function TableModule:can_click(obj)
	local mj = self.view:get_mj(obj)
	return mj and mj:enable() and not self.autoOutMJ
end

function TableModule:on_update_dragbj_pos(transform)
	if self.checkTouchCount and Input.touchCount > 0 then
		transform.position = self.view:get_world_pos(Input.GetTouch(0).position, transform.position.z)
	else
		transform.position = self.view:get_world_pos(Input.mousePosition, transform.position.z)
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
		local dragTime = 999999
		if self.lastPressMjTime then
			dragTime = UnityEngine.Time.time - self.lastPressMjTime 
		end
		if(y < dragYLimit 
			and dragTime > 0.2) then ---拖动的前0.2释放立即出牌
			local x = self.beginPressPos.x
			y = 0
			obj.transform.localPosition = Vector3.New(x, y , 0)
			self.view:reset_drag_mj()
		else
			---@type Mj2D
			local mj = self.view:get_mj(obj)
			self.controller:chu_mj_pre_check(function ()
				self:out_mj(obj)
			end,function ()
				local x = self.beginPressPos.x
				y = 0
				obj.transform.localPosition = Vector3.New(x, y , 0)
				self.view:reset_drag_mj()
			end,mj)
		end
		self.isDragMjobj = nil
		self.controller:on_end_drag(obj, arg)
	end
end

function TableModule:on_press(obj, arg)
	if(obj.name == "ButtonMic") then
		ModuleBase.press_voice(self, obj, arg)
	elseif(string.sub(obj.name,1,10) == "readyChuMJ"  and self.view.openFast) then
		self.isDrag = false
		local mj = self.view:get_mj(obj)
		self.controller:chu_mj_pre_check(function ()
			self:out_mj(obj)
		end,nil,mj)
	elseif obj.name == "1_InMJ" then
		---@type Mj2d
		local mj = self.view:get_mj(obj)
		self.view:show_ting_hu_grid(mj.pai)
	end
end

function TableModule:on_click(obj, arg)
	local playerClickButtonSound = true

	if(self.lastClickInviteTime and self.lastClickInviteTime + 1 > Time.realtimeSinceStartup)then
		return
	end
	if(obj == self.view.buttonSetting.gameObject) then
		local intentData = {}
		intentData.tableBackgroundSpriteSetName = "RoomSetting_TableBackground_Name_" .. "MJ"
		intentData.canDissolveRoom = not self.view.inviteAndExit.activeSelf
		if TableManager:cur_game_is_gold_room_type() then
			intentData.canDissolveRoom = false
		end
		local Is3D = TableManager:get_cur_majiang_game_open_3d_state()
		local def3dOr2d = TableManager:get_cur_majiang_game_2dor3d_def()
		---房间创建配置里面is3D == 1 代表开放3D模式，这样可以在2D和3D间进行切换
		---房间创建配置里面is3D == 2 代表开放2D模式，只能进行2D游戏
		---房间创建配置里面is3D == nil 代表使用老框架的2D模式，只能进行2D游戏
		intentData.is3D = Is3D
		intentData.def3dOr2d = def3dOr2d
		local needShow2DBackgroundSet = false
		if 1 == Is3D then
			---设置2D，3D切换示意图
			local selected2dSprite,selected3dSprite = self.view:get_selected_2d_or_3d_Sprite()
			intentData.tableBackground2d = selected3dSprite
			intentData.tableBackground3d = selected3dSprite
			----------------------------------------------------------------------
			local mj2dOr3dSetKey = string.format("%s_MJ2dOr3d",self.curTableData.ruleJsonInfo.GameType)
			local curSetting = PlayerPrefs.GetInt(mj2dOr3dSetKey,def3dOr2d)
			if 2 == curSetting then
				needShow2DBackgroundSet = true
			elseif 1  == curSetting then
				---麻将3D布局类型配置
				local selected3dLayout1Sprite ,selected3dLayout2Sprite = self.view:get_selected_3d_layout_sprite()
				intentData.selected3dLayoutSprite1 = selected3dLayout1Sprite
				intentData.selected3dLayoutSprite2 = selected3dLayout2Sprite
                intentData.layout3dTypes = self.view.ConfigData.layout3dTypes
				----------------------------------------------------------------------
				---麻将3D桌子风格配置
				local table3dStyleDisSprite1,table3dStyleDisSprite2 = self.view:get_table_3d_style_sprite()
				intentData.table3dStyleDisSprite1 = table3dStyleDisSprite1
				intentData.table3dStyleDisSprite2 = table3dStyleDisSprite2
				intentData.table3dStyles = self.view.ConfigData.table3dStyles
				-----------------------------------------------------------------------
			end
		else
			needShow2DBackgroundSet = true
		end
		if needShow2DBackgroundSet then
			intentData.tableBackgroundSprite = self.view.tableBackgroundSprite
			intentData.tableBackgroundSprite2 = self.view.tableBackgroundSprite2
			intentData.tableBackgroundSprite3 = self.view.tableBackgroundSprite3
		end
		intentData.isOpenLocationSetting = self.view.ConfigData.isOpenLocationSetting ---是否开启方言普通话切换
		intentData.defLocationSetting = self.view.ConfigData.defLocationSetting  ---方言普通话默认配置
		intentData.defGuoHu = self.view.ConfigData.defGuoHu ---过胡默认配置
		intentData.IsOpenRecommendOutPaiSetting = self.view.ConfigData.IsOpenRecommendOutPaiSetting ---是否开启推荐出牌
		intentData.defRecommendOutPaiSetting = self.view.ConfigData.defRecommendOutPaiSetting ---默认推荐出牌配置
		intentData.useBriefOneGameResult = self.view.ConfigData.useBriefOneGameResult  ---是否使用简略小结算
		intentData.useOneClickOutMj= self.view.ConfigData.useOneClickOutMj  ---是否打开单击出牌选项
		ModuleCache.ModuleManager.show_module("public", "roomsetting", intentData)
	elseif(obj == self.view.buttonWarning.gameObject) then
        local data ={};
        data.gameType="majiang";
        data.seatHolderArray = self.view.seatHolderArray;
		data.tableCount=self.curTableData.totalSeat;
		data.isPlay=self.view:all_is_ready();
        data.isShowLocation=true;
        ModuleCache.ModuleManager.show_module("public", "tablelocation",data);
	elseif (obj.name == "ButtonInvite" or obj.name == "NotSeatDown") then
		self.lastClickInviteTime = Time.realtimeSinceStartup
		self:inviteWeChatFriend()
		self:update_early_start()
	elseif (obj.name == "ButtonBackHall") then
		TableManager:try_back_to_hall_form_table()
	elseif (obj.name == "ButtonChat") then
		local textList = Config.chatShotTextList
		local locationSetting = self.view:getCurLocationSetting()
		if 1 == locationSetting then
			textList = self.view.ConfigData.chatShotTextList
		end
		ModuleCache.ModuleManager.show_module("public", "tablechat",
				{is_New_Sever = true, config = Config, backgroundStyle = "BackgroundStyle_1",
				 chatShotTextList = textList,hideTextChat = TableManager:cur_game_is_gold_room_type()})
	elseif (obj.name == "ButtonMic") then

	elseif (obj.name == "1_InMJ") then
		if(not self:is_waiting() and self:can_click(obj)) then
			playerClickButtonSound = false
			self.controller:click_my_hand_mj(obj)
		end
	elseif (obj.name == "Button_Chi") then
		if(not self.curTableData.isPlayBack) then
			if (#self.gameState.KeChi == 1 and #self.gameState.KeChi[1].ChiFa == 1) then
				self.controller:chi_mj(self.gameState.KeChi[1].Pai, self.gameState.KeChi[1].ChiFa[1])
			else
				self.view:show_chi_grid()
			end
		end
	elseif (obj.name == "Button_Peng") then
		if(not self.curTableData.isPlayBack) then
			if (#self.gameState.KePeng == 1) then
				self.controller:peng_mj(self.gameState.KePeng[1])
			else
				self.controller:peng_mj()
			end
		end
	elseif (obj.name == "Button_Gang") then
		if(not self.curTableData.isPlayBack) then
			self.controller:gang_mj()
		end
	elseif (obj.name == "Button_Hu") then
		if(not self.curTableData.isPlayBack) then
			self.controller:hu_mj()
		end
	elseif (obj.name == "Button_Guo") then
		self.controller:guo_mj()
	elseif obj.name =="Button_Ting" then
		self.controller:ting_mj(obj)
	elseif (obj.name == "Button_KaiGang") then

	elseif(string.sub(obj.name, 1, 3) == "Chi") then
		local array = string.split(obj.name, "_")
		self.controller:chi_mj(tonumber(array[4]), tonumber(array[3]))
	elseif(string.sub(obj.name, 1, 4) == "Peng") then
		local array = string.split(obj.name, "_")
		self.controller:peng_mj(tonumber(array[3]))
	elseif(string.sub(obj.name, 1, 4) == "Gang") then
		local array = string.split(obj.name, "_")
		self.controller:gang_one_mj(tonumber(array[3]))
	elseif (obj.name == "BtnNoSelectCard") then
		self.view:hide_select_card_childs()
	elseif (obj.name == "ButtonExit") then
		self:dispatch_module_event("roomsetting", "Event_RoomSetting_ExitRoom")
	elseif (obj.name == "ButtonKick") then
		local playerId, playerName = self.view:get_kick_player_name(obj)
		print(playerId,playerName)
		ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common(string.format("是否将%s踢出本房间？", playerName), function()
			self.model:request_kick_player(playerId)
		end, nil)
	elseif (obj.name == "Image") then
		self:look_player_info(obj)
	elseif (obj.name == "ButtonPiao") then
		self.model:request_piao()
		self.view:hide_select_hua()
		self.view:hide_wait_action_select_card()
	elseif (obj.name == "ButtonNoPiao") then
		self.model:request_guo_mj()
		self.view:hide_select_hua()
		self.view:hide_wait_action_select_card()
	elseif(string.sub(obj.name, 1, 3) == "Zun") then
		local zun = tonumber(string.sub(obj.name, 4, 4))
		self.model:request_select_piao({xiaojiScore = zun, paoScore = -1})
	elseif(obj.name == "ButtonRule") then
		ModuleCache.ModuleManager.show_module("public", "tablerule", self.view.gamerule)
	elseif(obj.name == "ButtonRobot") then
		self:add_robot()
	elseif (obj.name ==  "ButtonNoIntrust") then
		self.model:request_Intrust(2) --取消托管
	elseif (obj.name ==  "GEixtBtn") then
		--金币场退出房间
		ModuleCache.PlayerPrefsManager.SetInt("ChangeTable", -1)
		self:dispatch_module_event("roomsetting", "Event_RoomSetting_ExitRoom")
	elseif (obj.name ==  "GRuleBtn") then
		ModuleCache.ModuleManager.show_module("public", "goldhowtoplay")
	elseif (obj.name == "ButtonBCS") then
		ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common("是否确认消耗2钻石祈福财神？", function()
			local playerid = self.modelData.roleData.userID
			ModuleCache.ModuleManager.show_module("public", "baicaishen",playerid)
		end, nil)
	elseif (obj.name == "Button_HuGrid") then
		local isShowTing = self.view:getIsShowTingSetting()
		if isShowTing then
			self.view:setIsShowTingSetting(false)
			ModuleCache.ComponentUtil.SafeSetActive(self.view.huGrid,false)
			ModuleCache.ComponentUtil.SafeSetActive(self.view.tingGrid,false)
		else
			self.view:setIsShowTingSetting(true)
			if not self.view.jianZiHu.gameObject.activeSelf then
				ModuleCache.ComponentUtil.SafeSetActive(self.view.huGrid,true)
			end
			if not self.view.tingJianZiHu.gameObject.activeSelf and (#self.gameState.KeLiang > 0) then
				ModuleCache.ComponentUtil.SafeSetActive(self.view.tingGrid,true)
			end
		end
	elseif (obj.name == "ButtonMenu" or obj.name == "RightMenuEventMask") then
		self.view:setRightMenuState(not self.view.rightMenu.activeSelf)
	elseif(obj.name == "ButtonExitOnMenu") then
		if TableManager:cur_game_is_gold_room_type() then
			TableManager.curTableData.goldRoomExitTag = true ---金币场退出标记
			self:dispatch_module_event("roomsetting", "Event_RoomSetting_ExitRoom")
			local connect = TableManager.clientConnected
			if not connect then ---金币场连接不存在
				self:exit_room()
			end
		else
			if nil == self.gameState and (not self.view.allReady) then
				self:dispatch_module_event("roomsetting", "Event_RoomSetting_ExitRoom")
			else

				-- self.modelData.roleData.RoomType == 0   非麻将馆房间 1 麻将馆普通开房 2 麻将馆随机组局 3 比赛场房间
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
		end
	elseif(obj.name == "Button2Dor3DSwitch") then
		local gameType = self.curTableData.ruleJsonInfo.GameType
		local def3dOr2d = TableManager:get_cur_majiang_game_2dor3d_def()
		local mj2dOr3dSetKey = string.format("%s_MJ2dOr3d",gameType)
		local curSet = ModuleCache.PlayerPrefsManager.GetInt(mj2dOr3dSetKey,def3dOr2d)
		local targetSetting = 1
		if 1 == curSet then
			targetSetting = 2
		end
		ModuleCache.PlayerPrefsManager.SetInt(mj2dOr3dSetKey,targetSetting)
		self:dispatch_package_event("Event_RoomSetting_Refresh2dOr3d", targetSetting)
	elseif (obj.name == "ButtonBackToSettle") then
		self.view.roomType:on_show_one_game_result(self.presettlementState)
	elseif (obj.name == "ButtonLookTotal") then
		local initData = {}
		initData.gameState = self.presettlementTotalState
		ModuleCache.ModuleManager.show_module("majiang", "totalgameresult",initData)
	elseif (obj.name == "ButtonContinue") then
		if TableManager:cur_game_is_gold_room_type() then
			--todo:此逻辑需要转移到房间类型对象中
			self:dispatch_module_event("tablestrategy", "Event_Show_TableStrategy")
		else
			ModuleCache.ModuleManager.destroy_module("majiang", "onegameresultpuning")
			if(self.gameState.Result ~= 3) then
				self:dispatch_module_event("tablestrategy", "Event_Show_TableStrategy")
			else
				self:dispatch_module_event("tablestrategy", "Event_QiShouHu_Continue")
			end
		end
	elseif (obj == self.view.preButtonChange) then---此按钮暂时金币场使用
		--todo:此逻辑需要转移到房间类型对象中
		if TableManager:cur_game_is_gold_room_type() then
			local goldid = self.modelData.tableCommonData.goldFildId
			self:dispatch_module_event("tablestrategy", "Event_Gold_Room_Jump",goldid)
		end
	elseif (obj == self.view.preButtonEixt) then ---此按钮暂时金币场使用
		--todo:此逻辑需要转移到房间类型对象中
		if TableManager:cur_game_is_gold_room_type() then
			self:dispatch_module_event("tablestrategy", "Event_Gold_Room_Quit")
		end
	elseif(obj.name == "ButtonActivity") then
		local object =
        {
        	showRegionType = "table",
        	showType="Manual",
        }
		ModuleCache.ModuleManager.show_public_module("activity", object)
	elseif(obj.name == "ButtonRealTimeVoice") then
		local curState = ModuleCache.GVoiceManager().speaker_is_open()
		if curState then
			self:dispatch_module_event("table_RealTimeVoice", "CloseRealTimeVoice")---关闭实时语音麦克风
		else
			self:dispatch_module_event("table_RealTimeVoice", "OpenRealTimeVoice")---打开实时语音麦克风
		end
		self.view:refresh_buttonRealTimeVoice_state()
	elseif(obj.name == "Button_CS") then
		ModuleCache.ModuleManager.show_public_module("customerservicesystem");
	end

	if obj.transform.parent.gameObject.name == "RightMenu" then
		self.view:setRightMenuState(false)
	end

	if(not self.curTableData.isPlayBack) then
		self.controller:on_click(obj, arg)
	end

	if(obj.name == "3DDisRt") then
		playerClickButtonSound = false
	end
	
	if self.view then
		self.view.roomType:on_click(obj, arg)
	end

	if playerClickButtonSound then
		ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
	end
end

--- 实时刷新游戏状态
function TableModule:show_game_result(gameState)
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
		if( gameState.Result == 1 or gameState.Result == 3) then
			self.showOneResult = true
			self.presettlementState = gameState
			self.controller:show_mai_ma(gameState)
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

--- 刷新用户状态
function TableModule:refresh_user_state(data)
	ModuleBase.refresh_user_state(self, data)
	self.lastUserState = self.userState or data
	self.userState = data
	self.view.allReady = true
	self.curPlayerNum = 0
	self.curTableData.seatUserIdInfo = self.curTableData.seatUserIdInfo or {}
	self.meIsReady = false
	for i=1,#data.State do
		local userId = data.State[i].UserID
		if(userId ~= "0") then
			self.curPlayerNum = self.curPlayerNum + 1
		end
		self.curTableData.seatUserIdInfo[(i - 1) .. ""] = userId
		if(not data.State[i].Ready) then
			self.view.allReady = false
		end
	end
	self:update_ready(data)
	local randomType = data.msgtype
	if(randomType == 1) then
		local mySeat = self.view.mySeat
		local randomed = true
		for i = 1, #self.lastUserState.State do
			local newStateData = self:get_new_seat_data(self.lastUserState.State[i].UserID)
			local newSeatID = newStateData.SeatID
			print("最新的座位" .. newSeatID)
			local preLocalSeat = self.view:server_to_local_seat(i - 1, mySeat)
			self.view.mySeat = self:get_new_seat_data(self.curTableData.modelData.roleData.userID).SeatID
			self.curTableData.SeatID = self.view.mySeat
			self:begin_cache_game_state()
			self.view:show_begin_random(preLocalSeat, newSeatID)
			self:subscibe_time_event(3.4, false, 0):OnComplete(function(t)
				self.view:show_end_random(preLocalSeat)
				if(randomed) then
					randomed = false
					self:end_cache_game_state()
					self:end_random_user_state(data)
				end
			end)
		end
	else
		self:end_random_user_state(data)
	end
	self:dispatch_module_event("table", "Event_All_Player_Ready",self.view.allReady)
	self.controller:refresh_user_state(data)
end

--- 结束随机座位
function TableModule:end_random_user_state(data)
	if(not self.curTableData.isPlayBack) then
		print_table(self.modelData.roleData)
		self.view.mySeat = self:get_new_seat_data(self.modelData.roleData.userID).SeatID
	end
	self.curTableData.SeatID = self.view.mySeat
	print("我之后的座位：" .. self.view.mySeat)
	self.view:update_seat_pointer()
	local allReady = self.view:all_is_ready()
	for i = 1, #data.State do
		local SeatData = data.State[i]
		local seatId = SeatData.SeatID
		local userId = SeatData.UserID
		local ready = SeatData.Ready
		local localSeat = self.view:server_to_local_seat(seatId)
		self.view:refresh_seat_info(data.State[i])
		if(ready) then
			if(self.view:is_me(localSeat)) then
				if(SeatData.PiaoType <= 0) then
					self.view:hide_table_pop()
				elseif(SeatData.PiaoType >= 1) then
					self.view:show_table_pop(data, i)
				end
				self.view:setPlayerWaitStateTagsState(localSeat,self.view.playerWaitTagType.commonWait,false)
			else
				if(SeatData.PiaoType <= 0) then
					self.view:setPlayerWaitStateTagsState(localSeat,self.view.playerWaitTagType.commonWait,false)
				elseif(SeatData.PiaoType >= 1) then
					self.view:setPlayerWaitStateTagsState(localSeat,self.view.playerWaitTagType.commonWait,true)
				end
			end
		else
			if(self.view:is_me(localSeat) and not self.gameState) then
				self.model:request_get_kicked_timeout()
			end
			self.view:setPlayerWaitStateTagsState(localSeat,self.view.playerWaitTagType.commonWait,false)
		end
		self.view:show_head_add_info(localSeat, SeatData, data)
	end
	if(allReady or self.gameState ~= nil) then
		self.view:set_game_begin_ui()
	else
		self.view:set_game_not_begin_ui()
	end
	if(data.DiceType) then
		self:begin_cache_game_state()
		self.view:play_dice(
			function ()
				self:end_cache_game_state()
			end)
	end
	self.view:update_ui_anticheat()
	self.view:refresh_buttonActivity_state() ---刷新活动按钮状态
end

--- 更新准备相关
function TableModule:update_ready(data)
	for i = 1, #data.State do
		local SeatData = data.State[i]
		local ready = SeatData.Ready
		local seatId = SeatData.SeatID
		local localSeat = self.view:server_to_local_seat(seatId)
		if 1 == localSeat then ---如果是自己则检查是否有准备状态错误信息
			if(data.State[i].ErrCode and data.State[i].ErrCode ~= 0) then
				self.view:show_ready_error(data.State[i],self)
			end
		end
		if(ready) then
			if(self.view:is_me(localSeat)) then
				self.meIsReady = true
				if(self.gameState and self.gameState.Result == 1) then --- 点击继续游戏之后 重置整个牌桌
					self.view:reset_state()
					ModuleCache.SoundManager.stop_all_sound()
				end
				self.view:show_me_ready(localSeat)
			else
				self.view:show_other_ready(localSeat, SeatData)
			end
		else
			if(self.view:is_me(localSeat) and not self.gameState) then
				self.view:show_me_not_ready(SeatData)
			end
		end
		self.view:show_seat_ready_info(localSeat, SeatData)
		self.view:show_head_add_info(localSeat, SeatData, data)
	end
	self.view:update_ready_end(data)
	if self.view:all_is_ready() then
		self:dispatch_module_event("tableBackAlert", "tableGameRuning")
	end
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
		self.view:show_begin_button_time_down(false)
	end

	if not self.view.ConfigData.IsOpenStartNow then
		self.view:set_early_start_button_state(isActive,isEnable,curPlayerNum,playerNumData)
		return
	end

	if not self.curTableData.ruleJsonInfo.StartNow or false == self.curTableData.ruleJsonInfo.StartNow then
		self.view:set_early_start_button_state(isActive,isEnable,curPlayerNum,playerNumData)
		return
	end

	local playerNumIsChange = false
	if self.lastCurPlayr ~= self.curPlayer then
		playerNumIsChange = true
	end
	self.lastCurPlayr = self.curPlayer

	if curPlayerNum < curMaxPlayerNum then
		for k,v in pairs(self.ConfigData) do
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

---更新推荐出牌
function TableModule:update_recommend_pai(gameState)
	local show =  #gameState.RecommendPai > 0
	if show then
		self.view:show_recommend_out_mj(gameState.RecommendPai[1]) ---服务器预留，使用数组，现阶段只需要推荐一张
	else
		self.view:hide_recommend_out_mj()
	end
end

--- 获取最新的座位信息
function TableModule:get_new_seat_data(userID)
	for i = 1, #self.userState.State do
		local data = self.userState.State[i]
		if(data.UserID == userID) then
			return data
		end
	end
	return nil
end

function TableModule:on_show()
	ModuleBase.on_show(self)
end

function TableModule:on_destroy()
	MjManager.clear()
	ModuleBase.on_destroy(self)
	self:setTargetFrame(false)
	TableManager.chatMsgs = {}
	UpdateBeat:Remove(self.on_update, self)
	-- ApplicationEvent.unsubscibe_app_focus_event(onAppFocusCallback)
end

function TableModule:add_robot()
	local requestData = {
		params = {
			roomid = TableManager.curTableData.RoomID
		},
		baseUrl = "http://116.62.41.223:8081/AddRobot?robotnum=4&",
	}

	Util.http_get(requestData, function(wwwOperation)

	end, function(error)
		print(error.error)
	end)
end

function TableModule:out_mj(obj)
	if(self:is_waiting()) then
		return
	end
	if self.lastChuMjTime then  ---最短出牌时间，限制短时间连续出牌
		if UnityEngine.Time.time - self.lastChuMjTime < 0.3 then
			return
		end
	end
	self.lastChuMjTime = UnityEngine.Time.time
	---@type Mj2D
	local mj = self.view:get_mj(obj)
	local pai = mj.pai
	local dataIndex = mj.dataIndex
	self:simulate_add_out(pai, dataIndex)
	self.view:out_mj(obj)
	self.controller:out_mj(pai)
end

--- 出牌的时候先更新数据
function TableModule:simulate_add_out(pai, dataIndex)
	local mySeat = self.curTableData.SeatID
	local playerState = self.gameState.Player[mySeat + 1]
	playerState.showArrow = true
	playerState.ChuPaiCnt = 1
    self.gameState.CurPlayer = 0xffffffff
    self.gameState.ArrowPlayer = 0xffffffff
	table.insert(playerState.QiZhang, pai)
	self.view.newMJPointer = mySeat + 1
	local params = {
		outData = playerState.QiZhang[#playerState.QiZhang],
		localSeat = 1,
		outIndex = #playerState.QiZhang,
		showPointer = true,
		lastOut = true,
		serverSeat = mySeat,
		playerState = playerState
	}
	self.view:set_out_data(params)
	self.view:out_mj_update_data(playerState, dataIndex, self.getHandIndex)
	self.paiDataStates[mySeat + 1].outMJNum = #playerState.QiZhang
	self.view:set_mj_pointer()
end

function TableModule:setTargetFrame(anim)
	ModuleCache.UnityEngine.Application.targetFrameRate = (anim and 60) or ModuleCache.AppData.tableTargetFrameRate
end


function TableModule:can_show_result(gameState)
	local showTotalResult = ModuleCache.ModuleManager.module_is_active("majiang", "totalgameresult")
	local curGameState = gameState or self.newGameState
	return not showTotalResult and curGameState and curGameState.Result ~= 0 and (not self.meIsReady or self.curTableData.isPlayBack)
end

--- 查看玩家信息
function TableModule:look_player_info(obj)
	if(self:is_waiting()) then
		return
	end
	---@type SeatHolder2D
	local seatHolder = self.view:get_click_local_seat(obj)
	if(seatHolder) then
		--TODO XLQ:亲友圈房间并且开启了防作弊
		if TableManager.curTableData.HallID and TableManager.curTableData.HallID >0 
			and seatHolder.museumData 
			and seatHolder.museumData.preventionCheat == 1 
			and seatHolder.seatId ~= 1 
			and not self.curTableData.isPlayBack then
			ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("圈主已开启防作弊功能，无法查看玩家信息。")
			return
		end

		if(self.curTableData.isPlayBack) then
			local serverSeat = seatHolder.serverSeat
			self.view.mySeat = serverSeat
			self.curTableData.SeatID = serverSeat
			self:refresh_user_state(self.userState)
			self:refresh_game_state(self.gameState)
			return
		end
		ModuleCache.ModuleManager.show_module("public", "playerinfo", seatHolder)
	end
end

return  TableModule