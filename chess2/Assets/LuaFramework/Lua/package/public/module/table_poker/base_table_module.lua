




local ModuleCache = ModuleCache
local ComponentTypeName = ModuleCache.ComponentTypeName

local class = require("lib.middleclass")
local list = require("list")
local ModuleBase = require('core.mvvm.module_base')
local BaseTableModule = class('tableModule', ModuleBase)
local SoundManager = ModuleCache.SoundManager
local Application = UnityEngine.Application
local CSmartTimer = ModuleCache.SmartTimer.instance
local System = UnityEngine.System

local GameSDKInterface = ModuleCache.GameSDKInterface
local WechatManager = ModuleCache.WechatManager

local TableManagerPoker = require('package.public.table_manager_poker')
local Time = Time
local audioMusic = ModuleCache.SoundManager.audioMusic
local bgMusic2 = "bgmfight2"

local ChatMsgType = {}
ChatMsgType.shotMsg = 1
ChatMsgType.emojiMsg = 2
ChatMsgType.text = 3
ChatMsgType.voiceMsg = 0
ChatMsgType.gift = 10
ChatMsgType.tmpLeave = 99


local allChatMsgs = {}
local lastRoomNum

local voicePath = Application.persistentDataPath .. "/voice"


function BaseTableModule:initialize(...)
	ModuleBase.initialize(self, ...)
	self._module_init_time = Time.realtimeSinceStartup
	self:set_gameinfo_coming_time(Time.realtimeSinceStartup)
	self.TableManager = TableManagerPoker
	self.packageName = "guandan"
	self.moduleName = "guandan_table"
	self.click_interval = 1

	self.SoundManager = SoundManager
	self.Application = Application
	self.CSmartTimer = CSmartTimer
	self.GameSDKInterface = GameSDKInterface
	self.WechatManager = WechatManager
	self.ChatMsgType = ChatMsgType

	self.netClient = self.modelData.bullfightClient

	self.table_gift_module = ModuleCache.ModuleManager.show_module('public','table_gift')
	self.table_voice_module = ModuleCache.ModuleManager.show_module('public','table_voice')

	self.onAppFocusCallback = function ( eventHead, eventData )
		--print_debug("onAppFocusCallback", eventData)
        --self.model:request_TempLeave(not eventData)
		local onFocus = eventData
		local text = 'leave'
		if(onFocus)then
			text = ''
		end
		self.model:request_chat(ChatMsgType.tmpLeave, text)
	end
	ApplicationEvent.subscibe_app_focus_event(self.onAppFocusCallback)
	self:begin_location(function()
		self:UploadIpAndAddress()
	end)
	self:check_activity_is_open()

	self.museumData = self:get_museum_data()
	self.view:set_museum_data(self.museumData, self.modelData.roleData.userID, self.modelData.defaultHead)
end

function BaseTableModule:on_module_event_bind()
	
	self:subscibe_package_event("Event_RoomSetting_DissolvedRoom", function(eventHead, eventData)
		self:on_free_event(true)
	end)

	self:subscibe_package_event("Event_DissolvedRoom", function(eventHead, eventData)
		self:on_free_event(eventData == 2)
	end)

	self:subscibe_package_event("Event_RoomSetting_LeaveRoom", function(eventHead, eventData)
		self:on_leave_room_event(eventData)
	end)


	self:subscibe_package_event("Event_Send_ChatMsg", function(eventHead, eventData)
		self:on_send_chat_event(eventData)
	end)

	self:subscibe_package_event("Event_RoomSetting_RefreshBg", function(eventHead, eventData)
		self:refresh_table_bg()
	end)
	--打开商店
	self:subscibe_package_event("Event_Open_TableShop", function(eventHead, eventData)
		if(self.on_event_tableshop_open)then
			self:on_event_tableshop_open(true)
		end
	end)
	self:subscibe_package_event("Event_Close_TableShop", function(eventHead, eventData)
		if(self.on_event_tableshop_open)then
			self:on_event_tableshop_open(false)
		end
	end)
	self:subscibe_package_event("Event_Package_Refresh_Userinfo", function(eventHead, eventData)
		if(self.on_event_refresh_userinfo)then
			self:on_event_refresh_userinfo()
		end
	end)

	self:subscibe_package_event("Event_PokerTableFrame_Click_Leave", function(eventHead, eventData)
		if(self.on_click_poker_table_frame_leave_btn)then
			self:on_click_poker_table_frame_leave_btn()
		end
	end)
	self:subscibe_package_event("Event_PokerTableFrame_Click_Free", function(eventHead, eventData)
		self:on_click_poker_table_frame_free_btn()
	end)

	self:subscibe_package_event("Event_PokerTableFrame_Click_Setting", function(eventHead, eventData)
		self:on_click_setting_btn()
	end)
	self:subscibe_package_event("Event_PokerTableFrame_Click_Location", function(eventHead, eventData)
		self:on_click_location_btn()
	end)
	self:subscibe_package_event("Event_PokerTableFrame_Click_TestReconnect", function(eventHead, eventData)
		self:on_click_test_reconnect_btn()
	end)

	self:subscibe_package_event("Event_TableVoice_StartPlayVoice", function(eventHead, eventData)
		self:show_hide_seat_speak_amin(eventData, true)
	end)
	self:subscibe_package_event("Event_TableVoice_StopPlayVoice", function(eventHead, eventData)
		self:show_hide_seat_speak_amin(eventData, false)
	end)
	self:subscibe_package_event("Event_TableVoice_SendVoice", function(eventHead, eventData)
		self.model:request_chat(ChatMsgType.voiceMsg, eventData)
	end)

	self:subscibe_package_event("Event_PlayerInfo_SendGift", function(eventHead, eventData)
		local gift = {
			receiver = eventData.receiver,
			giftName = eventData.giftName,
			times = eventData.times,
		}
		local text = ModuleCache.Json.encode(gift)
		self.model:request_chat(ChatMsgType.gift, text)
	end)

	--红包雨
	self:subscibe_model_event("Event_Msg_Table_RoomAwardMessage", function(eventHead, eventData)
		local seatInfo = self:getSeatInfoByPlayerId(eventData.UserID, self.modelData.curTableData.roomInfo.seatInfoList)
		local roomAwardTable = {
			position = self.view.seatHolderArray[seatInfo.localSeatIndex].imagePlayerHead.transform.position,
			awardMsg = eventData.Message,
			isMe = (seatInfo.localSeatIndex == 1),
			canRob = eventData.canRob,
			sign = eventData.sign,
		}

		if(roomAwardTable) then
			ModuleCache.ModuleManager.show_public_module("redpacket", roomAwardTable)
		end
	end)
end

function BaseTableModule:show_hide_seat_speak_amin(playerId, show)
	if(not self.modelData.curTableData or (not self.modelData.curTableData.roomInfo) or (not self.modelData.curTableData.roomInfo.seatInfoList))then
		return
	end
	local seatInfo = self:getSeatInfoByPlayerId(playerId, self.modelData.curTableData.roomInfo.seatInfoList)
	if(seatInfo)then
		if(show)then
			self.view:show_voice(seatInfo.localSeatIndex)
		else
			self.view:hide_voice(seatInfo.localSeatIndex)
		end
	end
end

function BaseTableModule:on_free_event(eventData)
	self.model:request_dissolve_room(eventData)
end

function BaseTableModule:on_leave_room_event(eventData)
	self.model:request_exit_room()
end

function BaseTableModule:on_send_chat_event(eventData)
	local msgType,text = nil, nil
	if(eventData.chatType == 1)then--短语
		msgType = ChatMsgType.shotMsg
		text = eventData.content
	elseif(eventData.chatType == 2)then--表情
		msgType = ChatMsgType.emojiMsg
		text = eventData.content
	elseif(eventData.chatType == 3)then -- 文本消息
		msgType = ChatMsgType.text
		text = eventData.content
	else
		return
	end
	self.model:request_chat(msgType, text)
end

function BaseTableModule:on_reset_notify(eventData)

end

--进入房间响应
function BaseTableModule:on_enter_room_rsp(evenData)
	if(self.modelData and self.modelData.roleData and self.modelData.roleData.myRoomSeatInfo and self.modelData.roleData.myRoomSeatInfo.RuleTable)then
		local ruleTable = self.modelData.roleData.myRoomSeatInfo.RuleTable
		if(ruleTable.VoiceChatForbidden)then
			if(self.view.buttonMic)then
				ModuleCache.ComponentUtil.SafeSetActive(self.view.buttonMic.gameObject, false)
			end
			if(self.view.buttonChat)then
				ModuleCache.ComponentUtil.SafeSetActive(self.view.buttonChat.gameObject, false)
			end
		end
	end


end

--准备响应
function BaseTableModule:on_ready_rsp(eventData)
	if(tostring(eventData.err_no) == "0") then	
		local mySeatInfo = self.modelData.curTableData.roomInfo.mySeatInfo
		mySeatInfo.isReady = true
		self.view:refreshSeatState(mySeatInfo)
		self.view:showReadyBtn_three(false)
	else
		ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(eventData.err_no)		
	end
end

--准备通知
function BaseTableModule:on_ready_notify(eventData)
	local playerId = eventData.pos_info.player_id
	local seatInfo = self:getSeatInfoByPlayerId(playerId, self.modelData.curTableData.roomInfo.seatInfoList)
	seatInfo.isReady = tonumber(eventData.pos_info.is_ready) == 1
	self.view:refreshSeatState(seatInfo)
end

--开始响应
function BaseTableModule:on_start_rsp(eventData)
	if(tostring(eventData.err_no) == "0") then
		self.view:showStartBtn(false)	
	else
		ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(eventData.err_no)		
	end		
end

--进入房间通知
function BaseTableModule:on_enter_notify(eventData)
	local playerId = eventData.pos_info.player_id
	local seatIndex = eventData.pos_info.pos_index
	local isReady = eventData.pos_info.is_ready == 1
	local seatInfo = self.modelData.curTableData.roomInfo.seatInfoList[seatIndex]
	seatInfo.isSeated = true
	seatInfo.playerId = playerId
	seatInfo.isReady = isReady
	seatInfo.coinBalance = eventData.pos_info.coinBalance
	seatInfo.isOffline = false

	self:addSeatInfo2ChatCurTableData(seatInfo)
	self.view:refreshSeatPlayerInfo(seatInfo)
	self.view:refreshSeatOfflineState(seatInfo)
	self.view:refreshSeatState(seatInfo)
	self:refresh_share_clip_board()
end

--开始通知
function BaseTableModule:on_start_notify(eventData)
	if(eventData.err_no and eventData.err_no ~= '0')then
		ModuleCache.ModuleManager.show_public_module("alertdialog"):show_center_button(eventData.err_no)
	end
	self.view:showStartBtn(false)
end

--离开房间返回
function BaseTableModule:on_leave_room_rsp(eventData)
	if(eventData.err_no and eventData.err_no == "0") then
		self:onLeaveRoomSuccess()		
	else
		ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("离开房间失败:" .. eventData.err_no)		
	end
end
--离开房间成功
function BaseTableModule:onLeaveRoomSuccess()
	self.TableManager:disconnect_game_server()
	ModuleCache.net.NetClientManager.disconnect_all_client()
	ModuleCache.ModuleManager.destroy_package(self.packageName)
	ModuleCache.ModuleManager.show_module("public", "hall")
end

--离开房间通知
function BaseTableModule:on_leave_room_notify(eventData)
	print_table(eventData);
	local playerId = eventData.player_id
	self:removeSeatInfoFromChatCurTableData(playerId)
	local seatInfo = self:getSeatInfoByPlayerId(playerId, self.modelData.curTableData.roomInfo.seatInfoList)
	if(not seatInfo)then
		return
	end
	seatInfo.playerId = "0"
	seatInfo.playerInfo = nil
	seatInfo.isSeated = false
	self.view:refreshSeatPlayerInfo(seatInfo)
	self.view:refreshSeatOfflineState(seatInfo)
	self.view:refreshSeatState(seatInfo)

    if self.checkLocation then
        self:checkLocation();
    end
	self:refresh_share_clip_board()
end

--设置庄家通知
function BaseTableModule:on_setbanker_notify(eventData)

end

--重连通知
function BaseTableModule:on_reconnect_notify(eventData)
	local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
	local seatInfo = self:getSeatInfoByPlayerId(eventData.player_id, seatInfoList)
	seatInfo.isOffline = false
	seatInfo.isTempLeave = false
	self.view:refreshSeatOfflineState(seatInfo)
end

--掉线通知
function BaseTableModule:on_disconnect_notify(eventData)
	local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
	local seatInfo = self:getSeatInfoByPlayerId(eventData.player_id, seatInfoList)
	if seatInfo then
		seatInfo.isOffline = true
		seatInfo.isTempLeave = false
		self.view:refreshSeatOfflineState(seatInfo)
	end
end

--发送聊天消息响应
function BaseTableModule:on_chat_rsp(eventData)

end

--聊天消息通知
function BaseTableModule:on_chat_notify(eventData)
	local playerId = eventData.player_id
	local seatInfo = self:getSeatInfoByPlayerId(playerId, self.modelData.curTableData.roomInfo.seatInfoList)	
	if(seatInfo) then
		local chatMsg = eventData.chatMsg
		local chatData = {}
		chatData.userId = playerId
		chatData.chatType = chatMsg.msgType
		chatData.content = ''
		chatData.SeatID = seatInfo.seatIndex

		if(chatMsg.msgType == ChatMsgType.text) then
			self.view:show_chat_bubble(seatInfo.localSeatIndex, chatMsg.text)
			chatData.content = chatMsg.text
			table.insert(allChatMsgs, chatData)
		elseif(chatMsg.msgType == ChatMsgType.shotMsg) then
			local textIndex = chatMsg.text
			local text = self:getShotTextByShotTextIndex(textIndex, seatInfo)				
			self.view:show_chat_bubble(seatInfo.localSeatIndex, text)
			self:play_shot_vocie(textIndex, seatInfo)
			chatData.content = text
			--print(text)
			table.insert(allChatMsgs, chatData)
		--elseif(chatMsg.msgType == ChatMsgType.emojiMsg) then
		--	local emojiId = tonumber(chatMsg.text)
		--	self.view:show_chat_emoji(seatInfo.localSeatIndex, emojiId)
		elseif(chatMsg.msgType == ChatMsgType.voiceMsg) then
			local data = {
				playerId = seatInfo.playerId,
				fileid = chatMsg.text,
			}
			self:dispatch_package_event("Event_TableVoice_VoiceComing", data)
			chatData.content = chatMsg.text
			table.insert(allChatMsgs, chatData)
		elseif(chatMsg.msgType == ChatMsgType.gift or chatMsg.msgType == ChatMsgType.emojiMsg)then
			self:on_send_gift_chat_msg(playerId, chatMsg.text)
		elseif(chatMsg.msgType == ChatMsgType.tmpLeave)then
			local leaveData = {
				player_id = playerId,
				isTempLeave = chatMsg.text == 'leave',
			}
			self:on_temp_leave_notify(leaveData)
		end
		self:dispatch_package_event("Event_Refresh_ChatMsg")
	end	
end

function BaseTableModule:on_send_gift_chat_msg(senderPlayerId, content)
	local gift
	local chatface_id
	if(string.sub(content, 1, 1) == "{")then
		gift = ModuleCache.Json.decode(content)
	else
		chatface_id = tonumber(content)
	end
	local senderSeatInfo = self:getSeatInfoByPlayerId(senderPlayerId, self.modelData.curTableData.roomInfo.seatInfoList)
	if(not senderSeatInfo)then
		return
	end
	local sendSeatHolder = self.view.seatHolderArray[senderSeatInfo.localSeatIndex]
	local data = {
		fromPos = sendSeatHolder.imagePlayerHead.transform.position,
	}
	if(gift)then
		data.giftName = gift.giftName
		data.times = gift.times
		if(gift.receiver)then
			local receiverSeatInfo = self:getSeatInfoByPlayerId(gift.receiver, self.modelData.curTableData.roomInfo.seatInfoList)
			if(not receiverSeatInfo)then
				return
			end
			local receiverSeatHolder = self.view.seatHolderArray[receiverSeatInfo.localSeatIndex]
			data.toPos = receiverSeatHolder.imagePlayerHead.transform.position
			data.receiverId = gift.receiver
		end
	elseif(chatface_id)then
		if(sendSeatHolder.emojiRootTran)then
			data.fromPos = sendSeatHolder.emojiRootTran.position
		end
		data.is_common_chatface = true
		data.chatface_id = chatface_id
	else
		return
	end

	self:dispatch_package_event('Event_Table_Play_SendGift', data)
end

--解散房间响应
function BaseTableModule:on_free_room_rsp(eventData)

end

--解散房间请求通知
function BaseTableModule:on_free_room_request_notify(eventData)
	local freeRoomData, isFree, disAgreeSeatInfo = self:genFreeRoomData(eventData)
	self.freeRoomData = freeRoomData
	self.freeRoomData.dataType = "bullfight"
	if(disAgreeSeatInfo) then
		ModuleCache.ModuleManager.destroy_module("public", "dissolveroom")
	else
		ModuleCache.ModuleManager.show_module("public", "dissolveroom", self.freeRoomData)
	end
end

--解散房间通知
function BaseTableModule:on_free_room_notify(eventData)
	self.TableManager:disconnect_game_server()
	ModuleCache.net.NetClientManager.disconnect_all_client()
	ModuleCache.ModuleManager.destroy_package(self.packageName)
	ModuleCache.ModuleManager.show_module("public", "hall")
end

--暂时离开通知
function BaseTableModule:on_temp_leave_notify(eventData)
	local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
	local seatInfo = self:getSeatInfoByPlayerId(eventData.player_id, seatInfoList)
	seatInfo.isOffline = false
	seatInfo.isTempLeave = eventData.isTempLeave or false
	self.view:refreshSeatOfflineState(seatInfo)
end

function BaseTableModule:on_enter_room_event(roomInfo)
	if(roomInfo.roomNum ~= lastRoomNum)then
		allChatMsgs = {}
		ModuleCache.FileUtility.DirectoryDelete(voicePath, true)
		ModuleCache.FileUtility.DirectoryCreate(voicePath)
	end
	lastRoomNum = roomInfo.roomNum
	local seatInfoList = roomInfo.seatInfoList
	for i=1,#seatInfoList do
		local seatInfo = seatInfoList[i]
		if(seatInfo.isSeated)then
			self:addSeatInfo2ChatCurTableData(seatInfo)
		end
	end
end

function BaseTableModule:on_kick_player_rsp(eventData)

end

function BaseTableModule:on_kick_player_notify(eventData)

end

function BaseTableModule:on_shotsettle_notify(eventData)

end

function BaseTableModule:on_instrust_rsp(eventData)

end

function BaseTableModule:on_intrust_notify(eventData)

end

function BaseTableModule:on_recharge_notify(eventData)

end

function BaseTableModule:on_model_event_bind()

	self:subscibe_model_event("Event_Table_Enter_Room", function(eventHead, eventData)     --登陆成功				
		self:on_enter_room_rsp(eventData)
	end)
	
	
	self:subscibe_model_event("Event_Table_Ready_Rsp", function(eventHead, eventData)     --登陆成功		
		ModuleCache.ModuleManager.hide_public_module("netprompt")				
		self:on_ready_rsp(eventData)
	end)
	
	self:subscibe_model_event("Event_Table_Start_Rsp", function(eventHead, eventData)     --登陆成功		
		ModuleCache.ModuleManager.hide_public_module("netprompt")		
		self:on_start_rsp(eventData)
	end)
	
	self:subscibe_model_event("Event_Table_EnterRoom_Notify", function(eventHead, eventData)     --登陆成功		
		self:on_enter_notify(eventData)
	end)
	
	self:subscibe_model_event("Event_Table_Leave_Room_Rsp", function(eventHead, eventData)     --登陆成功		
		ModuleCache.ModuleManager.hide_public_module("netprompt")
		self:on_leave_room_rsp(eventData)
	end)
	
	self:subscibe_model_event("Event_Table_Leave_Room_Notify", function(eventHead, eventData)     --登陆成功		
		ModuleCache.ModuleManager.hide_public_module("netprompt")
		self:on_leave_room_notify(eventData)
	end)
	
	self:subscibe_model_event("Event_Table_Start_Notify", function(eventHead, eventData)
		ModuleCache.ModuleManager.hide_public_module("netprompt")
		self:clean_share_clip_board()
		self:on_start_notify(eventData)		
	end)
	
	self:subscibe_model_event("Event_Table_Ready_Notify", function(eventHead, eventData)     --登陆成功				
		self:on_ready_notify(eventData)					
	end)
	
	
	self:subscibe_model_event("Event_Table_SetBanker_Notify", function(eventHead, eventData)
		self:on_setbanker_notify(eventData)		
	end)

	self:subscibe_model_event("Event_Table_Reconnect_Notify", function(eventHead, eventData)		
		self:on_reconnect_notify(eventData)	
	end)
	
	self:subscibe_model_event("Event_Table_Disconnect_Notify", function(eventHead, eventData)
		self:on_disconnect_notify(eventData)	
	end)
	
	--聊天相关
	self:subscibe_model_event("Event_Table_Chat", function(eventHead, eventData)
		self:on_chat_rsp(eventData)
	end)
	self:subscibe_model_event("Event_Table_Chat_Notify", function(eventHead, eventData)
		self:on_chat_notify(eventData)
	end)
	
	--解散房间相关
	self:subscibe_model_event("Event_Table_Dissolve_Room_Rsp", function(eventHead, eventData)		
		self:on_free_room_rsp(eventData)
	end)
	self:subscibe_model_event("Event_Table_Dissolve_RoomRequest_Notify", function(eventHead, eventData)
		self:on_free_room_request_notify(eventData)
	end)
	self:subscibe_model_event("Event_Table_Dissolve_Room_Notify", function(eventHead, eventData)
		self:on_free_room_notify(eventData)
	end)

	--暂时离开广播
	self:subscibe_model_event("Event_Table_TemporaryLeave_Notify", function(eventHead, eventData)
		self:on_temp_leave_notify(eventData)
	end)

	self:subscibe_model_event("Event_Table_CustomInfoChangeBroadcast", function(eventHead, eventData)
		ModuleCache.ModuleManager.hide_public_module("netprompt")
		self:on_table_CustomInfoChangeBroadcast(eventData)
	end)

	--踢人相关
	self:subscibe_model_event("Event_Table_KickPlayer", function(eventHead, eventData)		
		self:on_kick_player_rsp(eventData)
	end)
	self:subscibe_model_event("Event_Table_KickPlayer_Notify", function(eventHead, eventData)
		self:on_kick_player_notify(eventData)
	end)

	self:subscibe_model_event("Event_Table_ShotSettle_Notify", function(eventHead, eventData)
		self:on_shotsettle_notify(eventData)
	end)
	self:subscibe_model_event("Event_Table_Intrust", function(eventHead, eventData)
		self:on_instrust_rsp(eventData)
	end)
	self:subscibe_model_event("Event_Table_IntrustNotify", function(eventHead, eventData)
		self:on_intrust_notify(eventData)
	end)
	self:subscibe_model_event("Event_Table_Recharge_Notify", function(eventHead, eventData)
		self:on_recharge_notify(eventData)
	end)
end

function BaseTableModule:_on_model_event_unbind()
	
end

function BaseTableModule:genFreeRoomData(data)
	local freeRoomData = {}
	local freeRoomStateList = data.freeRoomStateList
	local isAllAgree = true
	local isAllAnswered = true
	local disAgreeSeatInfo = nil
	freeRoomData.expire = data.expire
	for i, v in ipairs(self.modelData.curTableData.roomInfo.seatInfoList) do
		if(v.isSeated) then
			local freeRoomSeatData = {}		
			local seatInfo = {}
			seatInfo.playerId = v.playerId
			seatInfo.playerInfo = v.playerInfo
			freeRoomSeatData.seatInfo = seatInfo
			freeRoomSeatData.isSponsor = false
			freeRoomSeatData.isAnswered = false
			freeRoomSeatData.agree = false		
			table.insert(freeRoomData, freeRoomSeatData)
			if(v == self.modelData.curTableData.roomInfo.mySeatInfo) then
				freeRoomData.mySeatFreeRoomData = freeRoomSeatData
			end
			for j, value in ipairs(freeRoomStateList) do
				if(freeRoomSeatData.seatInfo.playerId == value.player_id) then			
					freeRoomSeatData.isSponsor = value.sponsor == value.player_id
					freeRoomSeatData.isAnswered = true
					freeRoomSeatData.agree = value.agree							
				end
			end
			if(freeRoomSeatData.isAnswered and(not freeRoomSeatData.agree)) then
				disAgreeSeatInfo = freeRoomSeatData.seatInfo
			end
			isAllAgree = isAllAgree and freeRoomSeatData.agree
			isAllAnswered = isAllAnswered and freeRoomSeatData.isAnswered	
		end		
	end
	
	return freeRoomData, isAllAgree and isAllAnswered, disAgreeSeatInfo
end


function BaseTableModule:getShotTextByShotTextIndex(index, seatInfo)
	local content = self:get_short_text_config().chatShotTextList[tonumber(index)]
	if(not content)then
		content = self:get_short_text_config().chatShotTextList[index]
	end
	return content
end

function BaseTableModule:getChatShowShotText()
	return self:get_short_text_config()
end

function BaseTableModule:play_shot_vocie(key, seatInfo)	
	local voiceName = ""
	if(seatInfo.playerInfo and seatInfo.playerInfo.gender ~= 1) then		
		voiceName = "chat_female_" .. key
	else
		voiceName = "chat_male_" .. key
	end
	ModuleCache.SoundManager.play_sound("publictable", "publictable/sound/tablepoker/" .. voiceName .. ".bytes", voiceName)
end

function BaseTableModule:on_press_up(obj, arg)
	if(obj == self.view.buttonMic.gameObject) then
		local data = {
			obj = obj,
			arg = arg,
		}
		self:dispatch_package_event('Event_TableVoice_OnPressUpMic', data)
	end
end

function BaseTableModule:on_drag(obj, arg)	
	if(obj == self.view.buttonMic.gameObject) then
		local data = {
			obj = obj,
			arg = arg,
		}
		self:dispatch_package_event('Event_TableVoice_OnDragMic', data)
	end
end

function BaseTableModule:on_press(obj, arg)
	print('on_press---------------')
	if(obj == self.view.buttonMic.gameObject) then
		local data = {
			obj = obj,
			arg = arg,
		}
		self:dispatch_package_event('Event_TableVoice_OnPressMic', data)
	end
end

function BaseTableModule:on_click(obj, arg)
	if((not self.modelData.curTableData) or (not self.modelData.curTableData.roomInfo))then
		return
	end
	self.lastClickObj = obj
	self.lastClickTime = Time.realtimeSinceStartup
	self:playBtnClick()
	if(self.lastClickInviteTime and self.lastClickInviteTime + self.click_interval > Time.realtimeSinceStartup) then
		return
	end
	if(obj == self.view.buttonSetting.gameObject) then		
		self:on_click_setting_btn(obj, arg)
	elseif(obj == self.view.buttonStart.gameObject) then
		self:on_click_start_btn(obj, arg)	
	elseif(obj == self.view.buttonReady.gameObject) then		
		self:on_click_ready_btn(obj, arg)				
	elseif(obj == self.view.buttonLeave.gameObject) then
		self:on_click_leave_btn(obj, arg)
	elseif(obj.name == "NotSeatDown" or obj == self.view.buttonInvite.gameObject) then		
		self.lastClickInviteTime = Time.realtimeSinceStartup			
		self:inviteWeChatFriend()		
	elseif(obj.name == "ButtonChat") then
		self:on_click_chat_btn(obj, arg)
	elseif(obj.name == "ButtonActivity") then
		self:on_click_activity_btn(obj, arg)
	elseif(obj.name == "Image") then
		self:on_click_player_image(obj, arg)
	elseif(obj == self.view.buttonLocation.gameObject)then
		self:on_click_location_btn(obj, arg)
	end
end

function BaseTableModule:getSeatInfoByHeadImageObj(obj)
	local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
	for i=1, #seatInfoList do
		local seatInfo = seatInfoList[i]
		local seatHolder = self.view.seatHolderArray[seatInfo.localSeatIndex]
		if(seatHolder.imagePlayerHead.gameObject == obj)then
			return seatInfo
		end
	end
	return nil
end

function BaseTableModule:inviteWeChatFriend()
	if(ModuleCache.GameManager.iosAppStoreIsCheck)then
		return
	end
	if(not self:canInviteWaChatFriend())then
		return
	end
	self:shareRoomNum()
end

function BaseTableModule:canInviteWaChatFriend()
	return self.modelData.curTableData.roomInfo.curRoundNum == 0
end

function BaseTableModule:refresh_share_clip_board()
	self:share_room_info_text(self:get_share_data())
end

function BaseTableModule:clean_share_clip_board()
	ModuleCache.ShareManager().clear_share_room_info_text()
end

function BaseTableModule:setShareData(totalPlayer, totalGames, comeIn, curPlayer)
	self.share_totalPlayer = totalPlayer
	self.share_totalGames = totalGames
	self.share_comeIn = comeIn
	self.share_curPlayer = curPlayer
end

function BaseTableModule:get_share_data()
	if(self.on_pre_share_room_num)then
		self:on_pre_share_room_num()
	end
	local roomInfo = self.modelData.curTableData.roomInfo
	local ruleTable = roomInfo.ruleTable
	local shareData = { }
	shareData.type = 2
	shareData.roomId = ""
	shareData.rule = ruleTable
	shareData.baseScore = roomInfo.baseCoinScore    --底分
	shareData.goldId = self.modelData.tableCommonData.goldFieldID

	local proStr = ModuleCache.PlayModeUtil.get_province_data(AppData.App_Name).shortName
	local gameType = ruleTable.GameType or ruleTable.gameType or ruleTable.game_type or ruleTable.bankerType or 3
	local _, wanfaName = Config.GetWanfaIdx(gameType)
	if(string.find( wanfaName,proStr))then
		shareData.title = wanfaName
	else
		shareData.title = proStr .. wanfaName
	end
	if(AppData.App_Name == "DHAHQP" or AppData.Is_Independent_App) then
		shareData.title = wanfaName
	end
	shareData.ruleName = wanfaName .. ' ' .. roomInfo.ruleDesc
	shareData.userID = self.modelData.roleData.userID
	shareData.parlorId = ""
	shareData.roomType = 0
	shareData.roomId = tostring(roomInfo.roomNum)
	shareData.totalPlayer = self.share_totalPlayer
	shareData.totalGames = self.share_totalGames
	shareData.comeIn = self.share_comeIn
	shareData.curPlayer = self.share_curPlayer
	if shareData.goldId and shareData.goldId ~= 0 then
		shareData.gameName = self.modelData.hallData.normalGameName
	else
		shareData.gameName = AppData.get_url_game_name()
	end

	if(self.modelData.roleData.HallID and self.modelData.roleData.HallID > 0) then

		shareData.parlorId = self.modelData.roleData.HallID .. ""
		shareData.roomType = self.modelData.roleData.RoomType
		local rule
		if type(shareData.rule) == "string" then
			rule = ModuleCache.Json.decode(shareData.rule)
		else
			rule = shareData.rule
		end

		local rule
		if type(shareData.rule) == "string" then
			rule = ModuleCache.Json.decode(shareData.rule)
		else
			rule = shareData.rule
		end

		rule.PayType = -1
		rule = ModuleCache.Json.encode(rule)

		local wanfaName,ruleName,renshu = TableUtil.get_rule_name(rule , false)
		shareData.ruleName = wanfaName .. ' ' ..  ruleName

	else
		shareData.roomType = 0
	end
	if(self.modelData.roleData.RoomType == 3) then-- 比赛场分享
		shareData.type = 4
		shareData.matchId = self.modelData.roleData.MatchID
	elseif self.modelData.roleData.RoomType == 2 then--快速组局
		shareData.parlorId = shareData.parlorId ..  string.format("%06d",ModuleCache.GameManager.curGameId)
	end
	print("--------------share-----------shareData.type:",shareData.type,shareData.parlorId,shareData.matchId)
	return shareData
end

--分享房号
function BaseTableModule:shareRoomNum()
	local shareData = self:get_share_data()
	if ModuleCache.ShareManager().can_share_to_xianliao() then
		ModuleCache.ModuleManager.show_module("public", "table_share", {shareType = "ShareRoom", shareData = shareData})
	else
		ModuleCache.ShareManager().shareRoomNum(shareData, false)
	end
end

--将服务器的做座位索引转换为本地位置索引
function BaseTableModule:getLocalIndexFromRemoteSeatIndex(seatIndex, mySeatIndex, seatCount)
	local localIndex = seatIndex + (1 - mySeatIndex) + seatCount
	if(localIndex > seatCount) then
		return localIndex - seatCount
	else
		return localIndex
	end
end

--通过玩家id获取座位信息
function BaseTableModule:getSeatInfoByPlayerId(playerId, seatInfoList)	
    local tmpPlyaerId = playerId
	for i=1,#seatInfoList do
		if(seatInfoList[i].playerId == tmpPlyaerId or tostring(seatInfoList[i].playerId) == tostring(tmpPlyaerId)) then
			return seatInfoList[i]
		end
	end
	return nil
end

function BaseTableModule:getSeatInfoBySeatIndex(seatIndex, seatInfoList)
    local tmpSeatIndex = seatIndex
	for i=1,#seatInfoList do
		if(seatInfoList[i].seatIndex == tmpSeatIndex) then
			return seatInfoList[i]
		end
	end
	return nil
end

function BaseTableModule:on_show(intentData)
	self.lastUpdateBeatTime = 0
	self.gameClient = self.modelData.bullfightClient
	UpdateBeat:Add(self.UpdateBeat, self)	
	self:refresh_table_bg()
end

function BaseTableModule:on_hide()
	UpdateBeat:Remove(self.UpdateBeat, self)
end

function BaseTableModule:on_destroy()
	ModuleCache.ModuleManager.destroy_module("public", "dissolveroom")
	self:_on_model_event_unbind()
	UpdateBeat:Remove(self.UpdateBeat, self)	
	ApplicationEvent.unsubscibe_app_focus_event(self.onAppFocusCallback)
	self.modelData.curTableData = nil
	self:dispatch_package_event('Event_On_PokerTable_Destroy')
	if(self.table_voice_module)then
		ModuleCache.ModuleManager.destroy_module('public','table_voice')
	end
	if(self.table_gift_module)then
		ModuleCache.ModuleManager.destroy_module('public','table_gift')
	end
end

function BaseTableModule:set_gameinfo_coming_time(time)
	self._gameinfo_coming_time = time
end

function BaseTableModule:UpdateBeat()
	if(self._module_init_time and (not self._gameinfo_coming_time))then
		if(self._module_init_time + 3 < Time.realtimeSinceStartup)then
			self._module_init_time = nil
			TableManagerPoker:heartbeat_timeout_reconnect_game_server()
			return
		end
	end
	if (self.lastUpdateBeatTime + 1 > Time.realtimeSinceStartup) then
		return 
	end
	self.lastUpdateBeatTime = Time.realtimeSinceStartup
	if(not self.model)then
		return
	end
	local pingDelayTime = 0.05
	if(self.model.lastPingReqeustTime)then
		pingDelayTime = UnityEngine.Time.realtimeSinceStartup - self.model.lastPingReqeustTime
		self.view:show_ping_delay(true, pingDelayTime)
	elseif(self.model.pingDelayTime)then
		pingDelayTime = self.model.pingDelayTime
		self.view:show_ping_delay(true, pingDelayTime)
	else
		self.view:show_ping_delay(true, 0.05)
	end
	self:dispatch_package_event('Event_Refresh_Ping_Value', pingDelayTime)

	self.view:refreshBatteryAndTimeInfo()
	if((not self.lastPingTime) or(self.lastPingTime + 3 < Time.realtimeSinceStartup)) then
		self.lastPingTime = Time.realtimeSinceStartup	
		if(self.TableManager.clientConnected)then
			self.model:request_ping()
		end
	end

	if self.gameClient and self.gameClient.clientConnected and (self.gameClient.lastReceivePackTime + 15 < Time.realtimeSinceStartup) then
		TableManagerPoker:heartbeat_timeout_reconnect_game_server()
	end
	
	
	if(not audioMusic.isPlaying) then
		self:playBgm()
	end
end

function BaseTableModule:on_click_test_reconnect_btn(obj, arg)
	ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("点击触发断线重连")
	TableManagerPoker:heartbeat_timeout_reconnect_game_server()
end

function BaseTableModule:is_open_shake()
    return (ModuleCache.PlayerPrefsManager.GetInt("openShake", 1) == 1)
end

function BaseTableModule:is_open_voice()
    return (ModuleCache.PlayerPrefsManager.GetFloat("openVoiceVolume", 0.5) > 0)
end


function BaseTableModule:shakePhone(ms)
    if(self:is_open_shake())then
        ModuleCache.GameSDKInterface:ShakePhone(ms)
    end
end

function BaseTableModule:on_click_start_btn(obj, arg)
	self.model:request_start()
end

function BaseTableModule:on_click_leave_btn(obj, arg)
	self.model:request_exit_room()
end


function BaseTableModule:on_click_ready_btn(obj, arg)
	self.model:request_ready()
end

function BaseTableModule:on_click_setting_btn(obj, arg)
	local data = self:getRoomSettingData()
	if(not data)then
		return
	end
	ModuleCache.ModuleManager.show_module("public", "roomsetting", data)		--根据房间是否开始的状态传值Moduel
end

function BaseTableModule:on_click_player_image(obj, arg)
	local seatInfo = self:getSeatInfoByHeadImageObj(obj)
	if (not seatInfo or (not seatInfo.playerInfo)) then
		print_debug("seatInfo is not exist")
		return
	end
	if(not self.view:is_my_self(seatInfo.playerId) and self.view:is_need_fangzuobi())then
		ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips('圈主已开启防作弊功能，无法查看玩家信息')
		return
	end
	local ruleTable = self.modelData.curTableData.roomInfo.ruleTable
	ModuleCache.ModuleManager.show_module("public", "playerinfo", seatInfo.playerInfo):enable_gift(not ruleTable.TableGiftForbidden)
end

function BaseTableModule:on_click_activity_btn(obj, arg)
	 local object = 
        {
        showRegionType = "table",
        showType="Manual",
        }
	ModuleCache.ModuleManager.show_public_module("activity", object)
end

function BaseTableModule:on_click_chat_btn(obj, arg)
	ModuleCache.ModuleManager.show_module("public", "tablechat",{is_New_Sever=true, allChatMsgs=allChatMsgs, curTableData = self.chatCurTableData, config=self:getChatShowShotText()})
end

function BaseTableModule:on_click_location_btn(obj, arg)
	if(not self.modelData.curTableData)then
		return
	end
	if(not self.playerCustomInfoMap)then
		self.playerCustomInfoMap = {}
	end
	local roomInfo = self.modelData.curTableData.roomInfo
	local seatInfoList = roomInfo.seatInfoList
	local mySeatInfo = roomInfo.mySeatInfo
	local list = {}
	local getingStr = '正在获取..'
	for i=1,#seatInfoList do
		local seatInfo = seatInfoList[i]
		if(seatInfo.playerId and seatInfo.playerId ~= 0)then
			if(seatInfo ~= mySeatInfo)then
				local data = self:get_location_data_by_playerid(seatInfo.playerId)
				print(data, seatInfo.playerId)
				if(data)then
					local tmpData = {}
					tmpData.playerShowName = getingStr
					tmpData.ip = data.ip
					tmpData.locationData = data
					if(seatInfo.playerInfo)then
						seatInfo.playerInfo.locationData = data
						seatInfo.playerInfo.ip = data.ip
						tmpData.playerShowName = seatInfo.playerInfo.playerShowName or getingStr
					end
					table.insert(list, tmpData)
				else

				end
			end
		end
	end
	-- for i=1,3 do
	-- 	local tmpData = {}
	-- 	tmpData.playerShowName = 'this is ' .. i
	-- 	tmpData.ip = '1.1.1.1'
	-- 	tmpData.locationData = {
	-- 		address = 'this is address',
	-- 		longitude = 100,
	-- 		latitude = 100,
	-- 	}
	-- 	table.insert( list, tmpData)
	-- end
	print_table(list)
	ModuleCache.ModuleManager.show_module("public", "tablegps", {seatInfoList=list})
end

function BaseTableModule:get_location_data_by_playerid(playerId)
	if(not self.playerCustomInfoMap)then
		self.playerCustomInfoMap = {}
	end
	print_table(self.playerCustomInfoMap,'------------------------------------'..playerId)
	return self.playerCustomInfoMap[playerId..'']
end

function BaseTableModule:playBtnClick()
	ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
end

function BaseTableModule:playBgm()

	if (not audioMusic.isPlaying or audioMusic.clip.name ~= bgMusic2) then
		ModuleCache.SoundManager.play_music("public", "public/sound/bgmmusic/" .. bgMusic2 .. ".bytes", bgMusic2)
	end
end

function BaseTableModule:getRoomSettingData()
	if(not self.modelData.curTableData or (not self.modelData.curTableData.roomInfo))then
		return
	end
	local canLeaveRoom = ((self.modelData.curTableData.roomInfo.curRoundNum == 0) and(not self.modelData.curTableData.roomInfo.mySeatInfo.isCreator))
	local intentData = {}
	intentData.tableBackgroundSpriteSetName = "RoomSetting_TableBackground_Name_" .. self.packageName
	intentData.canExitRoom = canLeaveRoom;
	intentData.canDissolveRoom = not canLeaveRoom
	if(self.modelData.curTableData.roomInfo.curRoundNum == 0)then
		intentData.canExitRoom = false
		intentData.canDissolveRoom = false
	end
	if(self.view.tableBackgroundImage)then
		intentData.tableBackgroundSprite = self.view.tableBackgroundImage.sprite
	end
	if(self.view.tableBackgroundImage2)then
		intentData.tableBackgroundSprite2 = self.view.tableBackgroundImage2.sprite
	end
	if(self.view.tableBackgroundImage3)then
		intentData.tableBackgroundSprite3 = self.view.tableBackgroundImage3.sprite
	end
	intentData.isOpenLocationSetting = self:get_config_data().isOpenLocationSetting
	intentData.defLocationSetting = self:get_config_data().defLocationSetting
	self:fillRoomSetting_PokerFaceChangeData(intentData)
	return intentData
end

function BaseTableModule:fillRoomSetting_PokerFaceChangeData(intentData)

end


function BaseTableModule:addSeatInfo2ChatCurTableData(seatInfo)
	if(not self.chatCurTableData)then
		self.chatCurTableData = {}
	end
	if(not self.chatCurTableData.seatHolderArray)then
		self.chatCurTableData.seatHolderArray = {}
	end
	local tmp = {}
	tmp.SeatID = seatInfo.seatIndex
	tmp.playerId = seatInfo.playerId
	seatInfo.chatDataSeatHolder = tmp
	table.insert( self.chatCurTableData.seatHolderArray, tmp )
end

function BaseTableModule:removeSeatInfoFromChatCurTableData(playerId)
	if(not self.chatCurTableData)then
		return
	end
	if(not self.chatCurTableData.seatHolderArray)then
		return
	end
	for i=1,#self.chatCurTableData.seatHolderArray do
		local tmp = self.chatCurTableData.seatHolderArray[i]
		if(tmp.playerId == playerId)then
			table.remove( self.chatCurTableData.seatHolderArray, i )
			return
		end
	end
end

function BaseTableModule:isAllSeatReady()
	local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
	local seatedCount = 0
	for i=1,#seatInfoList do
		local seatInfo = seatInfoList[i]
		if(seatInfo.playerId ~= 0)then
			seatedCount = seatedCount + 1
			if(not seatInfo.isReady)then
				return false
			end
		end
	end
	return seatedCount == self:getSeatCount()
end

function BaseTableModule:getSeatCount()
	return 4
end

function BaseTableModule:getSeatedSeatList(allSeatList)
	local list = {}
	for i, v in pairs(allSeatList) do
		if(v.playerId and v.playerId ~= 0 and v.playerId ~= '0')then
			table.insert(list, v)
		end
	end
	return list
end

function BaseTableModule:getServerNowTime()
	return self.modelData.curTableData.roomInfo.timeOffset + os.time()
end

function BaseTableModule:PauseMusic()
	self.SoundManager.audioMusic.mute = true
end

function BaseTableModule:UnPauseMusic()
	self.SoundManager.audioMusic.mute = false
end


------上传IP和地址
function BaseTableModule:CoroutineUploadIpAndAddress()
	self:subscibe_time_event(1, false, 0):OnComplete(function()
		self:UploadIpAndAddress()
	end)
end
function BaseTableModule:UploadIpAndAddress(_ip,_address)
	if((not self.modelData.curTableData) or 
	(not self.modelData.curTableData.roomInfo) or 
	(not self.modelData.curTableData.roomInfo.mySeatInfo) or
	(not self.modelData.curTableData.roomInfo.mySeatInfo.playerInfo))then
		self:CoroutineUploadIpAndAddress()
		return
	end
	local mySeatInfo = self.modelData.curTableData.roomInfo.mySeatInfo

	local newTable = {}
	newTable.ip = mySeatInfo.playerInfo.localIp or ""
	newTable.address = ModuleCache.GPSManager.gpsAddress or ""
	newTable.gpsInfo = ModuleCache.GPSManager.gps_info or ""
	local locationData = {}
	locationData.address = newTable.address
	locationData.gpsInfo = newTable.gpsInfo
	local locationStr = string.split(newTable.gpsInfo, ",")
	if(#locationStr > 0) then
		locationData.latitude = tonumber(locationStr[1])
		locationData.longitude = tonumber(locationStr[2])
	end
	mySeatInfo.playerInfo.locationData = locationData
	self.model:request_CustomInfoChange(ModuleCache.Json.encode(newTable))
end

------收到包:客户自定义的信息变化广播
function BaseTableModule:on_table_CustomInfoChangeBroadcast(data)
	print("==on_table_CustomInfoChangeBroadcast")
	print(#data.customInfoList)
	if(data ==nil or data.customInfoList == nil or #data.customInfoList <= 0) then
		return
	end
	for i=1,#data.customInfoList do
		local player_id = data.customInfoList[i].player_id
		local customInfo = data.customInfoList[i].customInfo
		if(customInfo and customInfo ~= "") then
			local locTable = ModuleCache.Json.decode(customInfo)
			locTable.gpsInfo = locTable.gpsInfo or ''
			local tmpData = {}
			tmpData.ip = locTable.ip
			tmpData.address = locTable.address
			tmpData.gpsInfo = locTable.gpsInfo
			local locationStr = string.split(locTable.gpsInfo, ",")
			if(#locationStr > 0) then
				tmpData.latitude = tonumber(locationStr[1])
				tmpData.longitude = tonumber(locationStr[2])
			end
			if(not self.playerCustomInfoMap)then
				self.playerCustomInfoMap = {}
			end
			self.playerCustomInfoMap[player_id..''] = tmpData
			if(self.modelData ==nil or self.modelData.curTableData == nil
			or self.modelData.curTableData.roomInfo == nil
			or self.modelData.curTableData.roomInfo.seatInfoList == nil) then
			else
				local seatInfoList = self.modelData.curTableData.roomInfo.seatInfoList
				for m=1,#seatInfoList do
					local seatInfo = seatInfoList[m]
					if(tostring(seatInfo.playerId) == tostring(player_id)) then
						if(seatInfo.playerInfo == nil) then
							print("====seatInfo.playerInfo == nil")
							seatInfo.on_get_userinfo_callback_queue = seatInfo.on_get_userinfo_callback_queue or list:new()
							local cb = function(seatInfo)
								seatInfo.playerInfo.ip = tmpData.ip
								seatInfo.playerInfo.locationData = seatInfo.playerInfo.locationData or {}
								seatInfo.playerInfo.locationData.address = tmpData.address
								seatInfo.playerInfo.locationData.gpsInfo = tmpData.gpsInfo
								seatInfo.playerInfo.locationData.latitude = tmpData.latitude
								seatInfo.playerInfo.locationData.longitude = tmpData.longitude
								if(self.checkLocation)then
									self:checkLocation()
								end
							end
							seatInfo.on_get_userinfo_callback_queue:push(cb)
						else
							print("==ip="..tmpData.ip.."  address="..tmpData.address)
							seatInfo.playerInfo.ip = tmpData.ip
							seatInfo.playerInfo.locationData = seatInfo.playerInfo.locationData or {}
							seatInfo.playerInfo.locationData.address = tmpData.address
							seatInfo.playerInfo.locationData.gpsInfo = tmpData.gpsInfo
							seatInfo.playerInfo.locationData.latitude = tmpData.latitude
							seatInfo.playerInfo.locationData.longitude = tmpData.longitude
						end
					end
				end
			end
		end


	end
end

function BaseTableModule:refresh_table_bg()
	local tableBg = ModuleCache.PlayerPrefsManager.GetInt("RoomSetting_TableBackground_Name_" .. self.packageName, 1)
	self.view:refresh_table_bg(tableBg)
end

-- 获取活动左侧列表协议
function BaseTableModule:check_activity_is_open()
	local object =
	{
		buttonActivity=self.view.buttonActivity,
		spriteRedPoint = self.view.spriteActivityRedPoint
	}
	ModuleCache.ModuleManager.show_public_module("activity", object);
end

function BaseTableModule:get_short_text_config()
	if(self.config)then
		return self.config
	end
	return self:get_config_data().ChatShortTextConfig
end

function BaseTableModule:get_config_data()
	local config =ModuleCache.PlayModeUtil.getGameRuleConfig()-- require(string.format("package.public.config.%s.config_%s",AppData.App_Name,AppData.Game_Name))
	local ruleTable = self.modelData.roleData.myRoomSeatInfo.RuleTable
	local gameType = ruleTable.GameType or ruleTable.gameType or ruleTable.game_type or ruleTable.bankerType or 3
	local wanfaType = Config.GetWanfaIdx(gameType)
	if(wanfaType > #config.createRoomTable) then
		wanfaType = 1
	end
	self._configData = config.createRoomTable[wanfaType]
	return self._configData
end

---获取当前普通话方言配置
function BaseTableModule:getCurLocationSetting()
	local locationSetting = 0
	local config = self:get_config_data()
	if config.isOpenLocationSetting then
		local key = string.format("%s_LocationSetting",ModuleCache.GameManager.curGameId)
		local defSetting = config.defLocationSetting or 0
		locationSetting = ModuleCache.PlayerPrefsManager.GetInt(key,defSetting)
	end
	return locationSetting
end

function BaseTableModule:on_click_poker_table_frame_free_btn()
	self:on_free_event(true)
end

function BaseTableModule:get_museum_data()
	local  cachKey = string.format("parlor/list/getParlorDetail?%s", self.modelData.roleData.HallID)
	local text = ModuleCache.PlayerPrefsManager.GetString(cachKey, "")
	if text ~= "" then
		local retData = ModuleCache.Json.decode(text)
		if(retData.success) then
			return retData.data
		end
	end
	return {preventionCheat = 0}
end

return BaseTableModule 