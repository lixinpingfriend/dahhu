local packageHead       = "package.huzi.module."
require(packageHead .. "tablebase.config")
local ModuleCache       = ModuleCache
local class             = require("lib.middleclass")
local list              = require("list")
local ModuleBase        = require('core.mvvm.module_base')
local TableUtilPaoHuZi  = require("package.huzi.module.tablebase.table_util")
local HandCardView      = require(packageHead .. "tablebase.handcard_view")
local SoundManager      = require(packageHead .. "tablebase.sound_manager")

local Manager           = require("package.public.module.function_manager")
local TableBaseModule   = class('tableBaseModule', ModuleBase)
HuZi_TableModule        = TableBaseModule   --回放是由这个扩展
local Time              = UnityEngine.Time
local TableManager      = TableManager
local ComponentTypeName = ModuleCache.ComponentTypeName
local CSmartTimer       = ModuleCache.SmartTimer.instance
local GameSDKInterface  = ModuleCache.GameSDKInterface
local WechatManager     = ModuleCache.WechatManager
local audioMusic        = ModuleCache.SoundManager.audioMusic
local string            = string
local bgMusic2          = "bgmfight2"

TableBaseModule.ChatConfig = {}
TableBaseModule.ChatConfig.chatShotTextList = 
{
	[1] = "大家好！很高兴见到各位。",
	[2] = "快点吧，花儿都谢了",
	[3] = "不许走，决战到天亮",
	[4] = "风水轮流转，你等着",
	[5] = "快点出牌呀",
	[6] = "这烂牌，我也是醉了",
	[7] = "你的牌打得太好啦",
	[8] = "怎么又断线了，网络怎么这么差啊",
	[9] = "不好意思，我有事要先走一步了",
	[10] = "运气好，想输都难",
	[11] = "不要吵了专心玩游戏"
}

TableBaseModule.SortCardHelperPath = "package.huzi.module.tablebase.SortCardHelper"

function TableBaseModule:initialize(...)
	if AppData.Game_Name == "XXZP" or AppData.Game_Name == "LDZP" then
		local tabRule = ModuleCache.Json.decode(TableManager.phzTableData.Rule)	
		if tabRule.Ratio == nil then
			tabRule.Ratio = 0.001
			TableManager.phzTableData.Rule = ModuleCache.Json.encode(tabRule)
		end
	end

	ModuleBase.initialize(self, ...)
	self.model.module = self
	local huifangPath = "package.huzi.module.table.table_module_huifang"
	package.loaded[huifangPath] = nil
    require(huifangPath)        --添加回放的函数
    self.TableData = TableManager.phzTableData
    self.netClient = self.modelData.bullfightClient
    self.table_gift_module = ModuleCache.ModuleManager.show_module('public','table_gift')
    self.table_voice_module = ModuleCache.ModuleManager.show_module('public','table_voice')
    self:on_module_initedSelf()
    self.resultWait = true
    self.view:refresh_voice_shake()
    self.view:SetModel(self.model)
	self.view:SetModule(self)
	
	TableManager.phzTableData.seatUserIdInfo = TableManager.phzTableData.seatUserIdInfo or {}
	local selfSeatID = TableManager.phzTableData.SeatID
	TableManager.phzTableData.seatUserIdInfo[selfSeatID .. ""] = TableManager.phzTableData.UserID

    --使用协程每秒刷新网络状态
    self:start_lua_coroutine(function ()
        while self.view do
            self:on_update_per_secondOn()
            coroutine.wait(1)
        end
    end)
    self.view:InitOther()
    self.PlayerNum = self.view.PlayerNum
    self.playersView = self.view.playersView
	self:bind_handcard_view()
    self:bind_ctrl_view()
    
    self:subscibe_package_event("Event_RoomSetting_ZiPaiSheZhi", function(eventHead, eventData)
        self:Event_RoomSetting_ZiPaiSheZhi()
	end)
	
	self:subscibe_package_event("Event_RoomSetting_ChangeKanPos", function(eventHead, eventData)
        self:Event_RoomSetting_KanPosSheZhi()
    end)

    self:subscibe_package_event("Event_RoomSetting_RefreshBg", function(eventHead, eventData)
        self.view:refresh_table_bg()
	end)

	self:subscibe_package_event("Event_Tablestrategy_StartNow", function(eventHead, eventData)
		local action = eventData
		local curPlayer = self:get_cur_player_count()
		self.model:request_start_now(action,curPlayer)
	end)

    self:InitPuTong()
    self:InitActivity_module()

    -- 音效预加载
    self:start_lua_coroutine(function ()
        if huzijiazaiyinxiaole or TableManager:cur_game_is_gold_room_type() then
            return
        end
        coroutine.wait(0.1)
        huzijiazaiyinxiaole = true
        for i=1,20 do
            SoundManager:play_card(i,true,true)
            SoundManager:play_card(i,false,true)
        end
    end)
    if self.view.ruleInfo.ShiShiYuYin then
        self:InitShiShiYuYin()
    end
	
	self.SortCardHelper = require(self.SortCardHelperPath)
    self:reset()
    self:init_playback_data()
	self:InitGameStateCon()

	self:begin_location(function(data)
		self.model:request_update_tempInfo(emCommonTempInfo.GPS, ModuleCache.Json.encode(data)) --发送给服务器自己的 服务器会同步所有人的
	end)
end

-- 将服务器的做座位索引转换为本地位置索引
function TableBaseModule:get_local_seat(seatIndex)
    local mySeatIndex = self.TableData.SeatID
	local seatCount = self.view.PlayerNum
	local localSeat = 1
	if seatCount == 3 or seatCount == 2 then	--3人和2人玩法计算
		if mySeatIndex == nil then
			return localSeat
		end
		localSeat = (seatIndex + seatCount - mySeatIndex) % seatCount + 1
	elseif seatCount == 4 then --4人玩法
		if self.xingSeat == nil then	--当前没人坐醒
			localSeat = (seatIndex + seatCount - mySeatIndex) % seatCount + 1
		else		--有人坐醒 
			if self.xingSeat == seatIndex then	--坐醒人是这个位置	则返回4
				localSeat = 4		
			else
				if mySeatIndex == self.xingSeat then
					if self.Msg_Table_GameStateNTF ~= nil and self.Msg_Table_GameStateNTF.zhuang ~= nil then
						mySeatIndex = self.Msg_Table_GameStateNTF.zhuang
					end
				end
				if mySeatIndex > self.xingSeat then
					mySeatIndex = mySeatIndex - 1
				end
				
				if seatIndex > self.xingSeat then        --计算的位置如果大于坐醒人位号 则补空缺
					seatIndex = seatIndex - 1
				end
				localSeat = (seatIndex + 3 - mySeatIndex) % 3 + 1        --剩下的按照3人算法即可
			end
		end
	end
    
    return localSeat
end

--获取当前人数
function TableBaseModule:getDangQianRenShu()
    local numo = 0
    for key, v in pairs(self.model.Msg_Table_UserStateNTF.State) do
        if v.UserID ~= "0" and v.UserID ~= nil then
            numo = numo + 1
        end
    end
    return numo
end

function TableBaseModule:on_module_initedSelf(...)
    self.lastPingTime = Time.realtimeSinceStartup
    self.model.lastReceiveHeartPackTime = Time.realtimeSinceStartup
    self.gameClient = self.modelData.gameClient
end

function TableBaseModule:Event_Msg_Table_UserStateNTF(eventHead, eventData) 
	self.Msg_Table_UserStateNTF = eventData
	self.outLinetTag = false
	self.needUpdateAll = true
	if self.modelData.tableCommonData.tableType ~= 1 then
		local bShowLevel = not self:is_in_game()
        self:show_leave_btn(bShowLevel)
        self:show_invite_btn(bShowLevel)
    end
	self.view:refresh_user_state(eventData)
    self.model:request_get_kicked_timeout()
end

function TableBaseModule:Event_Msg_User_Offline(eventHead, eventData) 
	local nCount = #eventData.OfflineTime
	for i=1, nCount do
		local localSeatID = self:get_local_seat(i- 1)
		self.playersView[localSeatID]:StartCalcLeftTime(eventData.OfflineTime[i])
	end
end

--监听事件
function TableBaseModule:on_module_event_bind()
    self:subscibe_model_event("Event_Msg_Table_GameStateNTF", handler(self,self.refresh_game_state))     ---实时游戏状态
    self:subscibe_model_event("Event_Msg_RoomUserInfoNTF", handler(self,self.refresh_seat_info))
	self:subscibe_model_event("Event_Msg_Table_UserStateNTF", handler(self,self.Event_Msg_Table_UserStateNTF))  --刷新用户信息
	self:subscibe_model_event("Event_Msg_User_Offline", handler(self,self.Event_Msg_User_Offline))  --刷新用户信息
	

    self:subscibe_model_event("Event_Msg_RoomUserOnlineNTF", function(eventHead, eventData)
		self.view:refresh_user_online(eventData)
    end)

    self:subscibe_model_event("Event_Msg_RoomUserOfflineNTF", function(eventHead, eventData)
        self.outLinetTag = true
        self.view:refresh_user_offline(eventData)
    end)

    self:subscibe_model_event("Event_Msg_KickedNTF", function(eventHead, eventData)
        self:exit_room("您已被房主踢出房间")
    end)

    self:subscibe_model_event("Event_Msg_SameUserLoginNTF", function(eventHead, eventData)
        ModuleCache.ModuleManager.destroy_module("huzi", "table")
        ModuleCache.ModuleManager.destroy_package("huzi")
        -- ModuleCache.ModuleManager.show_public_module("alertdialog"):show_center_button("您已经断开连接，请重新登陆", function()
        -- 	ModuleCache.GameManager.logout(true);
        -- end)
    end)

    self:subscibe_model_event("Event_Msg_DismissNTF", function(eventHead, eventData)
        if (#eventData.Action == 0) then
            local str = "已拒绝解散房间，游戏继续"

            if self.model.Msg_Table_UserStateNTF and self.model.Msg_Table_UserStateNTF.BaseCoinScore ~= 0 then
                str = "牌局中无法退出游戏"
            end

            ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(str)
            ModuleCache.ModuleManager.hide_module("public", "dissolveroom")
        else
            ModuleCache.ModuleManager.show_module("public", "dissolveroom", eventData)
        end
    end)

	self:subscibe_model_event("Event_Msg_RoomDismissedNTF", function(eventHead, eventData)
        self:exit_room("已解散房间")
    end)

    self:subscibe_model_event("Event_Msg_ReportStateNTF", function(eventHead, eventData)
        self.view:refresh_report_state(eventData)
    end)


    self:subscibe_model_event("Event_Msg_MessageNTF", function(eventHead, eventData)
        --收到聊天消息
        TableUtilPaoHuZi.print("收到聊天消息")
        self:refresh_chat_message(eventData)
    end)

    self:subscibe_model_event("Event_Private_MessageNTF", function(eventHead, eventData)
        self:refresh_private_message(eventData)
    end)

    --- 一局结束开始下一局
    self:subscibe_module_event(
        "tablestrategy",
        "Event_Show_TableStrategy",
		function(eventHead, eventData)
			if self.model.Msg_Table_UserStateNTF_Self.Ready then
				self:reset()
				ModuleCache.ModuleManager.destroy_module("huzi", "singleresult")
			end
			self.model:request_restart()
		end
    )

    --Event_Msg_Table_Restart
    --- 回放播放按钮点击事件
    self:subscibe_module_event(
        "Playback",
        "Event_Playback_Play",
        function(eventHead, eventData)
            self:playback_play()
        end
    )
    --- 回放暂停按钮点击事件
    self:subscibe_module_event(
        "Playback",
        "Event_Playback_Pause",
        function(eventHead, eventData)
            self:playback_pause()
        end
    )
    --- 回放后退按钮点击事件
    self:subscibe_module_event(
        "Playback",
        "Event_Playback_Back",
        function(eventHead, eventData)
            self:playback_back()
        end
    )
    --- 回放前进按钮点击事 件
    self:subscibe_module_event(
        "Playback",
        "Event_Playback_Front",
        function(eventHead, eventData)
            self:playback_front()
        end
    )
    --- 回放重置按钮点击事  件
    self:subscibe_module_event(
        "Playback",
        "Event_Playback_Reset",
        function(eventHead, eventData)
            self:playback_reset()
            self.playingPlayback = true
        end
    )
    --- 回放退出按钮点击事件
    self:subscibe_module_event(
        "Playback",
        "Event_Playback_Exit",
        function(eventHead, eventData)
            ModuleCache.ModuleManager.destroy_module("huzi", "table")
			ModuleCache.ModuleManager.show_module("public", "hall")
			local historylist = ModuleCache.ModuleManager.get_module("public", "gamehistory")
			if historylist then
				historylist:show_view()
			end
			local roomdetail = ModuleCache.ModuleManager.get_module("public", "gamehistorydetails")
			if roomdetail then
				roomdetail:show_view()
			end
        end
    )
    
    self:subscibe_model_event("Event_Msg_Exit_Room", handler(self,self.Event_Msg_Exit_Room))                                -- 退出房间
    self:subscibe_module_event("roomsetting", "Event_RoomSetting_ExitRoom", handler(self, self.Event_RoomSetting_ExitRoom)) --离开房间
    self:subscibe_module_event("totalresult", "Event_RoomSetting_ExitRoom", handler(self, self.Event_RoomSetting_ExitRoom)) --离开房间
    self:subscibe_module_event("tablechat", "Event_Send_ChatMsg", handler(self,self.Event_Send_ChatMsg))                    --发送聊天信息
    self:subscibe_package_event("Event_Send_ChatMsg", handler(self,self.Event_Send_ChatMsg))                                --发送聊天信息
	self:subscibe_package_event("Event_Client_ChatMsg", handler(self, self.Event_Client_ChatMsg))                           --聊天信息
	self:subscibe_module_event("dissolveroom", "Event_DissolvedRoom", handler(self,self.Event_RoomSetting_DissolvedRoom))   --解散房间
    self:subscibe_package_event("Event_DissolvedRoom", handler(self,self.Event_RoomSetting_DissolvedRoom))   --解散房间
    self:subscibe_module_event("roomsetting", "Event_RoomSetting_DissolvedRoom", handler(self,self.Event_RoomSetting_DissolvedRoom))    --解散房间
    self:subscibe_package_event("Event_RoomSetting_DissolvedRoom", handler(self, self.Event_RoomSetting_DissolvedRoom))     --解散房间
    self:subscibe_package_event("Event_Refresh_Voice_Shake", handler(self,self.Event_Refresh_Voice_Shake))                  --语音震动
    self:subscibe_model_event("Event_Msg_RoomAwardMessageNTF", handler(self,self.Event_Msg_RoomAwardMessageNTF))            --红包奖励
    self:subscibe_package_event("Event_TableVoice_StartPlayVoice", handler(self, self.Event_TableVoice_StartPlayVoice))     --开始语音信息
    self:subscibe_package_event("Event_TableVoice_StopPlayVoice", handler(self,self.Event_TableVoice_StopPlayVoice))        --停止语音信息
    self:subscibe_package_event("Event_TableVoice_SendVoice", handler(self, self.Event_TableVoice_SendVoice))               --发送语音信息
    self:subscibe_package_event("Event_PlayerInfo_SendGift", handler(self ,self.Event_PlayerInfo_SendGift))                 --玩家信息
    self:subscibe_app_focus_event(handler(self,self.onAppFocusCallback))                                                    --APP聚集焦点时调用
    self.model:request_get_kicked_timeout()                                                                                 --进入牌桌请求同步踢人倒计时  断线重连
    self:subscibe_model_event("Event_Table_Leave_Room_Rsp", handler(self,self.Event_Table_Leave_Room_Rsp))                  --离开房间
    self:subscibe_model_event("Event_Table_Leave_Room_Notify", handler(self,self.Event_Table_Leave_Room_Notify))            --离开房间
    self:subscibe_package_event("Event_Package_Refresh_Userinfo", handler(self, self.Event_Package_Refresh_Userinfo))       --刷新用户信息
    self:subscibe_model_event("Event_Msg_ReturnKickedTimeOutNTF", handler(self, self.Event_Msg_ReturnKickedTimeOutNTF))       --TODO XLQ:踢人倒计时
end

--退出房间
function TableBaseModule:Event_Msg_Exit_Room(eventHead, eventData)
    -- 这个侯震哥哥注释掉的我为什么要加上呢
    if (eventData.Error and eventData.Error == 0) then
        if not TableManager:cur_game_is_gold_room_type() then
            self:exit_room()
        else
            ModuleCache.net.NetClientManager.disconnect_all_client()
        end
    else
        TableUtilPaoHuZi.print("退出房间=====================")
        if ModuleCache.ModuleManager.module_is_active("huzi", "totalresult") and not TableManager:cur_game_is_gold_room_type() then
            self:exit_room()
        else
            if eventData.Error == -1 then
                ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("牌局进行中,无法离开游戏")
            else
                ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("离开房间失败:" .. eventData.Error)
            end
        end
    end
end

--发送聊天信息
function TableBaseModule:Event_Send_ChatMsg(eventHead, eventData)
    self.model:request_chat(eventData)
end

--聊天信息
function TableBaseModule:Event_Client_ChatMsg(eventHead, eventData)
    local textIndex = tonumber(eventData.content)
    TableUtilPaoHuZi.print("--------", textIndex)
    if (self.view.openVoice) then
        self:player_shot_voice(textIndex, TableManager.phzTableData.SeatID)
    end
end 

--解散房间
function TableBaseModule:Event_RoomSetting_DissolvedRoom(eventHead, eventData)
    self.model:request_dissolve_room(eventData)
end 

--语音震动
function TableBaseModule:Event_Refresh_Voice_Shake(eventHead, eventData)
    self.view:refresh_voice_shake()
    TableManager:refresh_voice_shake()
end

--红包奖励消息
function TableBaseModule:Event_Msg_RoomAwardMessageNTF(eventHead, eventData)
    local seat = TableUtilPaoHuZi.get_local_seatByUserID(eventData.UserID .. '')
    local roomAwardTable = {
        position = seat.objNone.transform.position,
        awardMsg = eventData.Message,
        isMe = eventData.UserID .. '' == self.modelData.roleData.userID .. '',
    }
    if (roomAwardTable) then
        ModuleCache.ModuleManager.show_public_module("redpacket", roomAwardTable)
    end
end

--开始语音信息
function TableBaseModule:Event_TableVoice_StartPlayVoice(eventHead, eventData)
    if eventData ~=nil then
        self:show_voice(eventData)
    end
end

--停止语音信息
function TableBaseModule:Event_TableVoice_StopPlayVoice(eventHead, eventData)
    if eventData ~=nil then
        self:hide_voice(eventData)
    end
end

--发送语音信息
function TableBaseModule:Event_TableVoice_SendVoice(eventHead, eventData)
    local chatTextBubbleData =
    {
        content = eventData,
        voice = eventData,
        chatType = 0,
        userId = self.modelData.roleData.userID
    }
    self.model:request_chat(chatTextBubbleData)
end

--玩家信息
function TableBaseModule:Event_PlayerInfo_SendGift(eventHead, eventData)
    if(eventData.receiver)then
        local seatId
        for i, v in pairs(TableManager.phzTableData.seatUserIdInfo) do
            if(v == eventData.receiver)then
                seatId = tonumber(i)
            end
        end
        if(seatId)then
            local gift = {
                receiver = seatId,
                giftName = eventData.giftName,
                times = eventData.times,
            }
            local text = ModuleCache.Json.encode(gift)
            local chatTextBubbleData =
            {
                content = text,
                voice = text,
                chatType = 10,
                userId = self.modelData.roleData.userID
            }
            self.model:request_chat(chatTextBubbleData)
        end
    else
        local gift = {
            giftName = eventData.giftName,
            times = eventData.times,
        }
        local text = ModuleCache.Json.encode(gift)
        local chatTextBubbleData =
        {
            content = text,
            voice = text,
            chatType = 10,
            userId = self.modelData.roleData.userID
        }
        self.model:request_chat(chatTextBubbleData)
    end
end

--APP聚焦调用
function TableBaseModule:onAppFocusCallback(eventHead, eventData)
    if eventData then
        self.model:request_report_player(0)

        --后台切换请求同步踢人倒计时
        self.model:request_get_kicked_timeout()
    else
        self.model:request_report_player(1)
    end
end

--离开房间
function TableBaseModule:Event_Table_Leave_Room_Rsp(eventHead, eventData)
    ModuleCache.ModuleManager.hide_public_module("netprompt")
    if (eventData.err_no and eventData.err_no == "0") then
        --TODO XLQ 金币场
        TableManagerPoker:disconnect_game_server()

        -- 金币场 退出
        ModuleCache.ModuleManager.destroy_package("huzi")
        ModuleCache.ModuleManager.show_module("public", "hall")
    else
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(eventData.err_no)
    end
end

function TableBaseModule:Event_Table_Leave_Room_Notify(eventHead, eventData)
    ModuleCache.ModuleManager.hide_public_module("netprompt")
end

function TableBaseModule:Event_Package_Refresh_Userinfo(eventHead, eventData)
    self.model:request_ACTION_REFRESH_COINS()
end

--踢人回调
function TableBaseModule:Event_Msg_ReturnKickedTimeOutNTF(eventHead, eventData)
    print("============Kickedtimeout :",eventData.Time)
    self.view.btnReady_cd:SetActive(true)

    if self.kickedTimeId then
        CSmartTimer:Kill(self.kickedTimeId)
    end

    self.kickedTimeId = self:subscibe_time_event(eventData.Time, false, 1):OnUpdate(function(t)
        t = t.surplusTimeRound
        if self.view.txtReady_cd then
            self.view.txtReady_cd.text = "("..t.."s)"
        end
    end):OnComplete(function(t)
        self.view.btnReady_cd:SetActive(false)
    end).id
end

--推出房间
function TableBaseModule:Event_RoomSetting_ExitRoom(eventHead, eventData)
    self.model:request_exit_room()
end

--- 离开房间
function TableBaseModule:request_exit_room()
    TableUtilPaoHuZi.print("离开房间")
    self:dispatch_module_event("roomsetting", "Event_RoomSetting_ExitRoom")
end

--- 刷新座位信息
function TableBaseModule:refresh_seat_info(eventHead, data)
    self.view:refresh_seat_info(data)
    if data.AppendData ~= nil and string.sub(data.AppendData, 1, 1) == "{" then
        self:update_seat_location(data.SeatID, ModuleCache.Json.decode(data.AppendData))
	end
end

--- 邀请好友
function TableBaseModule:invite_friend(shareToClipboard)
    if (ModuleCache.GameManager.iosAppStoreIsCheck) then
        return
    end


	local curTableData = self.view.TableData

    local ruleInfo = TableUtilPaoHuZi.convert_rule(curTableData.Rule)
    if self.model.Msg_Table_UserStateNTF and self.model.Msg_Table_UserStateNTF.BaseCoinScore ~= 0 and ruleInfo.isPrivateRoom ~= true then
        if not self.model.Msg_Table_GameStateNTF or self.model.Msg_Table_GameStateNTF.result ~= 0 then
            return
        end
    end

    --TODO XLQ 亲友圈分享不显示支付方式     RoomType 0 普通房间     1 亲友圈自由开房   2 亲友圈快速组局
    if curTableData.RoomType == 2 or curTableData.RoomType == 1 then
        ruleInfo.PayType = -1
    end

	self.gamerule = curTableData.Rule
	self.wanfaName,
	self.ruleName,
	self.playerNum,
	self.wanfaTable = TableUtilPaoHuZi.get_rule_name(curTableData.Rule, curTableData.HallID == 0)

	self.ruleName = self:ChangeRuleName(self.ruleName)

    local shareData = {}
    shareData.type = 2
    shareData.roomId = curTableData.RoomID .. ""
    shareData.rule = self.gamerule
    shareData.ruleName =  "金币场-匹配模式 " .. self.ruleName


    local config = ModuleCache.PlayModeUtil.getGameRuleConfig()--require(string.format("package.public.config.%s.config_%s",AppData.App_Name,AppData.Game_Name))

    if not self.Msg_Table_UserStateNTF then
        return
    end
    
    if self.Msg_Table_UserStateNTF.BaseCoinScore > 0 then
        shareData.ruleName = string.format('金币场-匹配模式 底分:%d ', self.Msg_Table_UserStateNTF.BaseCoinScore)
    end

    if self.Msg_Table_UserStateNTF and self.Msg_Table_UserStateNTF.BaseCoinScore == 0 then
        shareData.ruleName = string.format('好友场 ')
    end


    shareData.ruleName = self.ruleName
    shareData.title = self.wanfaName
    shareData.userID = self.modelData.roleData.userID
    if curTableData.HallID and (curTableData.HallID > 0) then
        shareData.parlorId = curTableData.HallID .. ""
        shareData.roomType = curTableData.RoomType
    else
        shareData.roomType = 0
    end

    if (curTableData.RoomType == 3) then
        -- 比赛场分享
        shareData.type = 4
        shareData.matchId = curTableData.MatchID
    elseif curTableData.RoomType == 2 then
        --快速组局
        shareData.parlorId = shareData.parlorId .. string.format("%06d", ModuleCache.GameManager.curGameId)
    end

    shareData.curPlayer = self:getDangQianRenShu()
    shareData.roundCount = curTableData.RoundCount
    shareData.totalPlayer = self.PlayerNum
    shareData.totalGames = curTableData.RoundCount
    shareData.comeIn = false
    shareData.type = 2
    shareData.payType = ruleInfo.PayType
    shareData.isMj = true 
    
    print_debug("--------------share-----------shareData.type:", shareData.type, shareData.parlorId, shareData.matchId)
    if not shareToClipboard then
		ModuleCache.ModuleManager.show_module("public", "table_share", {shareType = "ShareRoom", shareData = shareData})
    else
        if self.Msg_Table_UserStateNTF and self.Msg_Table_UserStateNTF.BaseCoinScore == 0 then
            self:share_room_info_text(shareData)
        end
    end
end

--- 刷新聊天消息
function TableBaseModule:refresh_chat_message(eventData)
    if eventData.SeatID == nil or (eventData.SeatID > self.PlayerNum or eventData.SeatID < 0) then
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(eventData.Message)
        return
    end

    if string.sub(eventData.Message, 1, 1) ~= "{" then
        return
    end

    local chatData = ModuleCache.Json.decode(eventData.Message)
    if not chatData then
        return
    end
    -- for k,v tin pairs(chatData) do
    -- 	print("###########eventData.Message:",k,v)
    -- end

    if (not chatData.chatType ) then
        if chatData.voice then
            local data = {
                playerId = eventData.SeatID,
                fileid = chatData.voice,
            }
            self:dispatch_package_event("Event_TableVoice_VoiceComing", data)
            return
        else
            if chatData.words then
                chatData.chatType = 3
            elseif chatData.emoticon then
                chatData.chatType = 2
            end
        end

    end

    if (chatData.chatType == 1) then
        local textIndex = tonumber(chatData.content)
        self:player_shot_voice(textIndex, eventData.SeatID)
    elseif (chatData.chatType == 2) then
        --表情
        local emoticonIdx = tonumber( chatData.content or chatData.emoticon)
        if emoticonIdx > 100 then
            emoticonIdx = emoticonIdx / 100
        end

        --self:show_chat_face(eventData.SeatID, emoticonIdx)
        self:on_send_gift_chat_msg(eventData.SeatID, emoticonIdx .. '')
    elseif (chatData.chatType == 3) then
        --文字
        chatData.SeatID = eventData.SeatID
        chatData.userId = TableManager.phzTableData.seatUserIdInfo[tostring(eventData.SeatID)]
        table.insert(TableManager.chatMsgs, chatData)
        --self:dispatch_module_event("table", "Event_Refresh_ChatMsg")
        self:dispatch_package_event("Event_PaoHuZi_Refresh_ChatMsg")
        self:show_chat_bubble(eventData.SeatID, chatData.content or chatData.words)
    elseif (chatData.chatType == 0) then
        --语音
        chatData.SeatID = eventData.SeatID
        table.insert(TableManager.chatMsgs, chatData)--TODO:XLQ语音聊天消息加入聊天记录

        local data = {
            playerId = eventData.SeatID,
            fileid = chatData.content,
        }
        self:dispatch_package_event("Event_TableVoice_VoiceComing", data)
    elseif(chatData.chatType == 10)then
        self:on_send_gift_chat_msg(eventData.SeatID, chatData.content)
    elseif (chatData.chatType == 4) then
        TableUtilPaoHuZi.print("定位信息", eventData.SeatID, chatData)
        --定位
        self:update_seat_location(eventData.SeatID, chatData)
    end
end

function TableBaseModule:ChangeRuleName(ruleName)
	local curTableData = self.view.TableData
	return self:GetPayStr() .. (curTableData.RoundCount or 1) .. '局 ' .. ruleName
end

function TableBaseModule:GetPayStr()
	local ruleInfo = ModuleCache.Json.decode(TableManager.phzTableData.Rule)
	local strPay = ""
	local temps = {}
	temps[0] = "房主支付 "
	temps[1] = "AA支付 "
	temps[2] = "大赢家支付 "
	if ruleInfo.PayType ~= nil and temps[ruleInfo.PayType] ~= nil then
		strPay = strPay .. temps[ruleInfo.PayType]
	end
	return strPay
end

--- 离开房间
function TableBaseModule:exit_room(tip)
    TableManager:disconnect_login_server()
    TableManager:disconnect_game_server()
    ModuleCache.net.NetClientManager.disconnect_all_client()
    ModuleCache.ModuleManager.hide_public_module("netprompt")
    ModuleCache.ModuleManager.hide_package("public")
    ModuleCache.ModuleManager.destroy_module("huzi", "table")
    ModuleCache.ModuleManager.destroy_module("huzi", "singleresult")
    ModuleCache.ModuleManager.destroy_package("huzi")
    ModuleCache.ModuleManager.show_module("public", "hall")
    if (tip) then
        ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(tip)
    end

end

function TableBaseModule:press_up_voice(obj, arg)
    local data = {
        obj = obj,
        arg = arg,
    }
    self:dispatch_package_event('Event_TableVoice_OnPressUpMic', data)
end

function TableBaseModule:on_drag_voice(obj, arg)
    local data = {
        obj = obj,
        arg = arg,
    }
    self:dispatch_package_event('Event_TableVoice_OnDragMic', data)
end

function TableBaseModule:press_voice(obj, arg)
    local data = {
        obj = obj,
        arg = arg,
    }
    self:dispatch_package_event('Event_TableVoice_OnPressMic', data)
end

function TableBaseModule:on_show()
    --self.lastUpdateBeatTime = 0
    self.lastPingTime = Time.realtimeSinceStartup
    self.model.lastReceiveHeartPackTime = Time.realtimeSinceStartup
    self.gameClient = self.modelData.gameClient
    self:on_update()
end

function TableBaseModule:reconnect()

end

function TableBaseModule:on_update(t)
    if not self.view then
        return
    end
    self.view:update_beat()
end

--刷新网络信息
function TableBaseModule:on_update_per_secondOn()
    if not self.view then
        return
    end

    if (self.model.lastPingReqeustTime) then
        self.view:show_ping_delay(true, UnityEngine.Time.realtimeSinceStartup - self.model.lastPingReqeustTime)
    elseif (self.model.pingDelayTime) then
        self.view:show_ping_delay(true, self.model.pingDelayTime)
    else
        self.view:show_ping_delay(true, 0.05)
    end


    if (not audioMusic.isPlaying or audioMusic.clip.name ~= bgMusic2) then
        ModuleCache.SoundManager.play_music("public", "public/sound/bgmmusic/" .. bgMusic2 .. ".bytes", bgMusic2)
    end

    self.view:refresh_battery_time_info()

    if (TableManager.phzTableData.isPlayBack) then
        return
    end

    if self.gameClient.clientConnected and (self.gameClient.lastReceivePackTime + 15 < Time.realtimeSinceStartup) then
        TableManager:heartbeat_timeout_reconnect_game_server()
    end

    if self.gameClient.clientConnected and (self.lastPingTime + 3 < Time.realtimeSinceStartup) then
        self.lastPingTime = Time.realtimeSinceStartup
        if TableManager.clientConnected then
            self.model:request_heartbeat()
        end
    end
end

function TableBaseModule:PauseMusic()
    SoundManager.audioMusic.mute = true
end

function TableBaseModule:UnPauseMusic()
    SoundManager.audioMusic.mute = false
end

function TableBaseModule:InitPuTong()
    local key = string.format("%s_LocationSetting",ModuleCache.GameManager.curGameId)
    if ModuleCache.PlayerPrefsManager.HasKey(key) then
        local curLocationSetting = ModuleCache.PlayerPrefsManager.GetInt(key)
        SoundManager.location_setttingPuTong = curLocationSetting
    else
        SoundManager.location_setttingPuTong = nil
    end


    self:subscibe_package_event("Event_RoomSetting_location_settting", function(eventHead, eventData)
        local key = string.format("%s_LocationSetting",ModuleCache.GameManager.curGameId)
        local curLocationSetting = ModuleCache.PlayerPrefsManager.GetInt(key)
        SoundManager.location_setttingPuTong = curLocationSetting

        print(SoundManager.location_setttingPuTong)
    end)

    
end


function TableBaseModule:InitActivity_module()
    local object = 
    {
    buttonActivity=self.view.ButtonActivity,
    spriteRedPoint = self.view.spriteRedPoint
    }
    ModuleCache.ModuleManager.show_public_module("activity", object);
end

function TableBaseModule:Event_RoomSetting_ZiPaiSheZhi()
    self.view:SetZP_ZPPaiLeiStart()
        -- 小结算和 大结算阶段不能换牌... 否则容易引起更大的问题
    if self.model.Msg_Table_GameStateNTF and self.model.Msg_Table_GameStateNTF.result ~= 0 then
        return
    end

    self.model.booIsLoadAll_ZiPai = true
    self.bChangeCardType = true
    table.insert(self.gameStateTable, DataPaoHuZi.Msg_Table_GameStateNTF)
    self:start_lua_coroutine(
        function()
            coroutine.wait(0.8)
            self.model.booIsLoadAll_ZiPai = nil
        end
	)
end

function TableBaseModule:Event_RoomSetting_KanPosSheZhi( )
	local data = self.Msg_Table_GameStateNTF
	if data == nil or data.result ~= 0 then
		return
	end
	for i = 1, #data.player do
		if self.TableData.SeatID == i -1 then	--自己的座位
			self:update_hand_card(data.player[i], true)
		end
	end
end

--- 绑定手牌视图
function TableBaseModule:bind_handcard_view()
    HandCardView.view = self.view
    HandCardView.table_model = self
    HandCardView:bind_view(self, self.view.handcardHolder, self.view.cloneRoot, self.view.line)
end

--- 绑定控制视图
function TableBaseModule:bind_ctrl_view()
	self.CardCtrlView = require(packageHead .. "table." .. AppData.Game_Name .. "." .. AppData.Game_Name .. "_cardctrl"):new()
    self.CardCtrlView:bind_view(self, self.view.ctrlHolder, self.view.cloneRoot)
end


--- 重置牌桌数据
function TableBaseModule:reset()
    self:refresh_remainder_cards()
    HandCardView:clear()
    self.CardCtrlView:clear()

    for i = 1, self.PlayerNum do
        self.playersView[i]:InitCards()
        self.playersView[i]:Reset()
		self.playersView[i]:show_light(false)
	end
	self.view.XingRoot:SetActive(false)
    self.gameState = nil
    self.lastGameState = nil
	self.showSingleResult = false
	self.view:ShowLeftCard(false)
end


--- 注册刷帧
function TableBaseModule:on_update()
    if self.isDrag and self.checkTouchCount then
        HandCardView:on_drag_update()
    end
end

--- 抬起状态
function TableBaseModule:on_press_up(obj, arg)
    if (obj and obj.name == "Voice") then
        self.press_up_voice(self, obj, arg)
    end

    self.isDrag = false
    self.isDragObj = nil
    HandCardView:on_drag_end()
end

--- 开始拖动
--- on_press_up -> on_click -> on_end_drag
function TableBaseModule:on_begin_drag(obj, arg)
    -- 手机上可以多点操作，所以过滤掉
    self.checkTouchCount = UnityEngine.Input.touchCount > 0
    if self.isDragObj then
        return
    end
end

--- 拖动状态中
function TableBaseModule:on_drag(obj, arg)
    if (obj and obj == self.isDragObj) then
        if not self.checkTouchCount then
            HandCardView:on_drag_update()
        end
    elseif (obj and obj.name == "Voice") then
        self.on_drag_voice(self, obj, arg)
    end
end

--- 结束拖动
function TableBaseModule:on_end_drag(obj, arg)
    if obj == self.isDragObj then
        HandCardView:on_drag_end()
    end

    self.isDragObj = nil
    self.isDrag = false
    TableUtilPaoHuZi.set_frame_rate(false, TableUtilPaoHuZi.playingAnim)
end

--- 开始按下状态
function TableBaseModule:on_press(obj, arg)
    if self.TableData.isPlayBack then
        return
    end

    if (obj.name == "Voice") then
        self.press_voice(self, obj, arg)
    elseif (type(tonumber(obj.name)) == "number") then
        self.isDrag = true
        self.isDragObj = obj
        TableUtilPaoHuZi.set_frame_rate(true, TableUtilPaoHuZi.playingAnim)
        HandCardView:on_drag_begin(obj)
    end
end

--- 单独聊天信息
function TableBaseModule:refresh_private_message(data)
    TableUtilPaoHuZi.print("单独聊天信息")
end

--- 播放短语
function TableBaseModule:player_shot_voice(index, seatId)
    local localSeatID = self:get_local_seat(seatId)
    local text = self.ChatConfig.chatShotTextList[index] or ""
    self.playersView[localSeatID]:show_chat_bubble(text)
    self.playersView[localSeatID]:play_shot_voice(index)
end

--- 显示表情
function TableBaseModule:show_chat_face(SeatID, emoticonIdx)
    local localSeatID = self:get_local_seat(SeatID)
    self.playersView[localSeatID]:show_chat_face(emoticonIdx)
end

--- 显示文本
function TableBaseModule:show_chat_bubble(SeatID, text)
    local localSeatID = self:get_local_seat(SeatID)
    self.playersView[localSeatID]:show_chat_bubble(text)
end

--显示表情
function TableBaseModule:on_send_gift_chat_msg(seatId, content)
    local gift
    local chatface_id
    if(string.sub(content, 1, 1) == "{")then
        gift = ModuleCache.Json.decode(content)
    else
        chatface_id = tonumber(content)
    end
    local sendPlayerView = self.playersView[self:get_local_seat(seatId)]
    if(not sendPlayerView)then
        return
    end
    local data = {
        fromPos = sendPlayerView.seat.head.transform.position,
    }
    if(gift)then
        data.giftName = gift.giftName
        data.times = gift.times
        if(gift.receiver)then
            local receiverPlayerView = self.playersView[self:get_local_seat(gift.receiver)]
            if(not receiverPlayerView)then
                return
            end
            data.toPos = receiverPlayerView.seat.head.transform.position
            data.receiverId = gift.receiver
        end
    elseif(chatface_id)then
        if(sendPlayerView.seat.objFace)then
            data.fromPos = sendPlayerView.seat.objFace.transform.position
        end
        data.is_common_chatface = true
        data.chatface_id = chatface_id
    else
        return
    end

    self:dispatch_package_event('Event_Table_Play_SendGift', data)
end

--- 显示语音
function TableBaseModule:show_voice(SeatID)
    local localSeatID = self:get_local_seat(SeatID)
    self.playersView[localSeatID]:show_voice(true)
end

--- 隐藏语音
function TableBaseModule:hide_voice(SeatID)
    local localSeatID = self:get_local_seat(SeatID)
    self.playersView[localSeatID]:show_voice()
end

function TableBaseModule:update_seat_location(SeatID, data)
	self.locationDatas = self.locationDatas or {}
	if SeatID ~= nil then
		self.locationDatas[SeatID] = data
	end
end

--- 刷新剩余多少牌
function TableBaseModule:refresh_remainder_cards(num)
    if self.model.Msg_Table_GameStateNTF and self.model.Msg_Table_GameStateNTF.result ~= 0 then
        Manager.SetActive(self.view.remainderCardObj, false)
        return
    end

    if not num or type(num) ~= "number" or num == 0 then
        Manager.SetActive(self.view.remainderCardObj, false)
        return
    end

    Manager.SetActive(self.view.remainderCardObj, true)
   
 
    --self.view.remainderCardImg.sprite = self.view.remainderCardSpriteHolder:FindSpriteByName(tostring(level))
    self.view.remainderCardNum.text = tostring(num)
end

--- 显示离开座位按钮
function TableBaseModule:show_leave_btn(show)
    local ruleInfo = TableUtilPaoHuZi.convert_rule(self.TableData.Rule)
    if self.model.Msg_Table_UserStateNTF and self.model.Msg_Table_UserStateNTF.BaseCoinScore ~= 0 then
        Manager.SetActive(self.view.btnLeave.gameObject, false)
    else
        Manager.SetActive(self.view.btnLeave.gameObject, not self.roundStart and show)
    end

end

--- 显示邀请好友按钮  
function TableBaseModule:show_invite_btn(show)
    local ruleInfo = TableUtilPaoHuZi.convert_rule(self.TableData.Rule)
    if self.model.Msg_Table_UserStateNTF and self.model.Msg_Table_UserStateNTF.BaseCoinScore ~= 0 then
        Manager.SetActive(self.view.btnInvite.gameObject, false)
    else
        Manager.SetActive(self.view.btnInvite.gameObject, not self.roundStart and show)
    end
end

function TableBaseModule:on_click(obj, arg)
    if not obj then
        return
    end
    ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")

    print(obj.name)
    if obj == self.view.btnTopRule.gameObject then
        
        ModuleCache.ModuleManager.show_module("public", "tablerule", self.TableData.Rule)
    elseif obj == self.view.btnInvite.gameObject then
        self:invite_friend()
    elseif obj == self.view.btnLeave.gameObject then
        self:request_exit_room()
    elseif obj == self.view.buttonWarning.gameObject then

    elseif obj == self.view.btnReady.gameObject or obj == self.view.btnReady_cd.gameObject then
        self:dispatch_module_event("tablestrategy", "Event_Show_TableStrategy")
        self.view.btnReady.gameObject:SetActive(false)
        self.view.btnReady_cd.gameObject:SetActive(false)
    elseif obj == self.view.btnStart.gameObject then
        -- 发送准备协议
        self:dispatch_module_event("tablestrategy", "Event_Show_TableStrategy")
	elseif obj == self.view.btnChat.gameObject then
        self:show_chat()
    elseif obj == self.view.btnSettings.gameObject then
        self:show_settings()
    elseif obj == self.view.btnReconnect.gameObject then
        ModuleCache.GameManager.logout()
    elseif obj == self.view.btnActivity.gameObject then
        local object = 
        {
        showRegionType = "table",
        showType="Manual",
        }
         ModuleCache.ModuleManager.show_public_module("activity", object)
    elseif obj.name == "btnTuoGuan" then
        self.model:request_quxiaoTuoGuan()
        self.view.btnTuoGuan.gameObject:SetActive(false)          
    elseif obj.name == "ButtonHuanFu" then
		self.view:changeBg()
	elseif(obj == self.view.btnEarlyStart.gameObject) then
		local isNotice = ModuleCache.PlayerPrefsManager.GetInt(string.format("%s_EarlyStartNotice",ModuleCache.GameManager.curGameId),2)
		if 2 == isNotice then
			local intentData = {}
			intentData.isNotice = true
            self.table_earlystart_module = ModuleCache.ModuleManager.show_module("public","table_earlystart",intentData)
		else
			local action = 1
			local curPlayer = self:get_cur_player_count()
			self.model:request_start_now(action,curPlayer)
		end
    end
end

--- 显示设置
function TableBaseModule:show_settings()
    local intentData = {}
    intentData.tableBackgroundSpriteSetName = "RoomSetting_TableBackground_Name_" .. "HuZi"
    intentData.canDissolveRoom = not self.view.btnInvite.gameObject.activeSelf

    local bundlePath = "huzi/module/table/huzi_tablebackground".. self.view.bgName[1] .. ".atlas"
    local assetName = "bg" .. self.view.bgName[1]
	intentData.tableBackgroundSprite = ModuleCache.ViewUtil.GetSpriteFromeAssetBundle(bundlePath, "bg" .. self.view.bgName[1])
	
	local bundlePath = "huzi/module/table/huzi_tablebackground".. self.view.bgName[2] .. ".atlas"
    local assetName = "bg" .. self.view.bgName[2]
	intentData.tableBackgroundSprite2 = ModuleCache.ViewUtil.GetSpriteFromeAssetBundle(bundlePath, "bg" .. self.view.bgName[2])
	
	local bundlePath = "huzi/module/table/huzi_tablebackground".. self.view.bgName[3] .. ".atlas"
    local assetName = "bg" .. self.view.bgName[3]
    intentData.tableBackgroundSprite3 = ModuleCache.ViewUtil.GetSpriteFromeAssetBundle(bundlePath, "bg" .. self.view.bgName[3])

    ModuleCache.ModuleManager.show_module("public", "roomsetting", intentData)
end

--- 显示聊天
function TableBaseModule:show_chat()
	local seatArray = {}
	for i, v in ipairs(self.playersView) do
        if i <= #self.playersView then
			seatArray[i] = v.playerInfo
			if not seatArray[i] then
				seatArray[i] = {}
			end
			if v.SeatID then
				seatArray[i].SeatID = v.SeatID
			end
        end
    end
    local temp = {
        is_New_Sever = true,
        config = self.ChatConfig,
		backgroundStyle = "BackgroundStyle_1",
		seatHolderArray = seatArray
    }

    temp.hideTextChat = TableManager:cur_game_is_gold_room_type()
    ModuleCache.ModuleManager.show_module("public", "tablechat", temp)
end

function TableBaseModule:clear()
    TableManager.chatMsgs = {}
    --- 清空聊天信息

    HandCardView:clear()
    self.CardCtrlView:set_active(false)
end


function TableBaseModule:on_destroy()

    if(self.table_voice_module)then
        ModuleCache.ModuleManager.destroy_module('public','table_voice')
    end
    if(self.table_gift_module)then
        ModuleCache.ModuleManager.destroy_module('public','table_gift')
	end
	
	for i=1, self.PlayerNum do
		self.playersView[i]:Reset()
		self.playersView[i]:Destroy()
	end

    ModuleCache.ModuleManager.destroy_module("huzi", "playback")
    ModuleCache.ModuleManager.destroy_module("huzi", "singleresult")
    ModuleCache.ModuleManager.destroy_module("huzi", "totalresult")
    ModuleCache.ModuleManager.destroy_module("public", "roomsetting")
    ModuleCache.ModuleManager.destroy_module("public", "tablerule")
    ModuleCache.ModuleManager.destroy_module("public", "tablechat")
	self:clear()
	if self.bDestroyShiShiYuYin then
		self:ShiShiYuYin_TuiChu()
	end
	self.isDestroy = true
end


--------------------------牌局内-------------------------------------------

--添加牌局内触发事件
function TableBaseModule:AddGameStateEvent(nEventNum, handlerEvent)
    self.GameStateEvent = self.GameStateEvent or {}
    self.GameStateEvent[nEventNum] = handlerEvent
end

--- 判断是否有动作ID
function TableBaseModule:has_actionWhat(id)
    local data = DataPaoHuZi.Msg_Table_GameStateNTF

    if data == nil or data.player == nil then
        return false
    end

    for i = 1, #data.player do

        if data.action then
            for j = 1, #data.action do
                if data.action[j].action == id then
                    return true
                end
            end
        end
    end

    return false
end

function TableBaseModule:has_ActionHu()
	return 	self:has_actionWhat(HuziAction.Hu) or 
			self:has_actionWhat(HuziAction.PingHu) or
			self:has_actionWhat(HuziAction.ZiMo) or
			self:has_actionWhat(HuziAction.TianHu) or
			self:has_actionWhat(HuziAction.DiHu) or
			self:has_actionWhat(HuziAction.SanLongWuKan) or 
			self:has_actionWhat(HuziAction.JiePao) 
end

--初始化游戏事件派发携程
function TableBaseModule:InitGameStateCon()
    local curTableData = TableManager.phzTableData
    if curTableData.isPlayBack then
        return
    end

    self:start_lua_coroutine(
        function()
            while true do
                self.gameStateTable = self.gameStateTable or {}
                if #self.gameStateTable > 0 then
                    local boolIsFlag = false
                    self:start_lua_coroutine(function()
                        self:play_game_state()
                        boolIsFlag = true
                    end)
                    for i=1,250 do
                        if boolIsFlag then
                            break
                        end
                        coroutine.wait(0.05)
                    end

                    if not self.view then
                        return
                    end

                    if not boolIsFlag then
                        ModuleCache.GameManager.logout()
						UnityLogError("huzi大问题 play_game_state没有执行完整")
                    end
					table.remove(self.gameStateTable, 1)
					if self.tagXing ~= nil and self.tagXing then
						coroutine.wait(4)	--播放醒牌动画 下一个消息为结算 延迟显示结算
						self.tagXing = false
					else
						coroutine.wait(0.5)
					end
                    
                else
                    coroutine.wait(0)
                end
            end
        end
    )
end

--- 实时刷新游戏状态
function TableBaseModule:refresh_game_state(eventHead, data)
    self.model.Msg_Table_GameStateNTFNew = data
    if not self.lastGameState then
        self.firstGameState = true
    else
        self.firstGameState = false
    end
    self.roundStart = true
    self.gameStateTable = self.gameStateTable or {}
	--seq相同则不推送
    if self.lastMsgSeqNo == nil or self.lastMsgSeqNo ~= data.SeqNo then
		table.insert(self.gameStateTable, data)
    end
    self.lastMsgSeqNo = data.SeqNo
    
    self.lastGameState = data
end

--- 播放游戏状态
function TableBaseModule:play_game_state()
    local data = self.gameStateTable[1]
    
    self.Msg_Table_GameStateNTF = data
	self.model.Msg_Table_GameStateNTF = data
	self:ReadyBeforPlay(data)
end

function TableBaseModule:ReadyBeforPlay(data)
	self:CheckXingChange(data)

	--二人状态就显示丢弃的牌堆
	if self.PlayerNum == 2 and data.result ~= 1 then
		self.view:ShowLeftCard(true)
	end

	--处理开局信息
    if self:has_actionWhat(HuziAction.KaiJu)  then
        HandCardView.isFirstLoad = true
        for i=1,self.PlayerNum do
            self.playersView[i]:InitCards()
		end
		self.view:PlayFaPaiAni()
		--if self.RealTimeSpeech then
		--	self.RealTimeSpeech:InitShiShiYuYin(true)	--刷新实时语音的参数
		--end
    end

	--结算
	if data.result == 0 then
		ModuleCache.ModuleManager.destroy_module("huzi", "singleresult")
	end

	if data.result ~= 0 then
		for i=1,self.PlayerNum do
			self.playersView[i]:hide_chuzhang(true)
		end
        self:show_game_result(data)     
	end
	self.view:ShowBtnSortCard(data.result == 0 and self.xingSeat ~= self.TableData.SeatID and not TableManager.phzTableData.isPlayBack )

    -- 假如有一个人未曾准备好 则说明处于 小结算后的待准备状态
    if self:isInZhunBeiIng() and data.result == 1 then
        --隐藏邀请和 退出按钮
        Manager.SetActive(self.view.btnInvite.gameObject, false)
        Manager.SetActive(self.view.btnLeave.gameObject, false)
        for i = 1, #data.player do
            local localSeatID = self:get_local_seat(i - 1)
            self.playersView[localSeatID].data = data.player[i]
            local score = data.player[i].total_score
            self.playersView[localSeatID]:update_score(score)
		end
        return
    end
	
	if data.result == 2 then	--大结算消息 不播放玩家动作
        return
	end
    self:play(data)
end

--4人检查坐醒
function TableBaseModule:CheckXingChange(data)
	local xingSeat = -1
	local playerCount = #data.player
	for i=1, playerCount do
		if data.player[i].type == 1 then	--坐醒用户
			xingSeat = i - 1
		end
	end

	--TableManager.phzTableData.players 数据与 UserID对应排序
	self:CheckHuanWei()

	local curTableData = TableManager.phzTableData

	self.xingSeat = self.xingSeat or -1
	if self.PlayerNum == 4 and xingSeat >= 0 and xingSeat ~= self.xingSeat then
		self.xingSeat = xingSeat
		if self.TableData.isPlayBack then
			for i = 1, #curTableData.players do
				local localSeatID = self:get_local_seat(curTableData.players[i].seatId)
				self.playersView[localSeatID]:refresh_player_info(curTableData.players[i])
			end
		else
			self.view:refresh_user_state(self.Msg_Table_UserStateNTF)
		end
		
	end
end

--- 检查换位
function TableBaseModule:CheckHuanWei()
	if self.Msg_Table_GameStateNTF == nil then
		return
	end
	local curTableData = TableManager.phzTableData
	local players = {}
	if curTableData.players ~= nil then
		for i=1, #curTableData.players do
			for j=1, #self.Msg_Table_GameStateNTF.player do
				local userID1 = self.Msg_Table_GameStateNTF.player[j].UserID
				local userID2 = curTableData.players[i].userId .. ""
				if userID1 == userID2 then
					players[j] = curTableData.players[i]
					players[j].seatId = j - 1
				end
			end
		end
		curTableData.players = players
	end
end

--- 播放游戏状态
function TableBaseModule:play(data)
    self:refresh_paiju(data)
    HandCardView:set_out_card_enable(data.ke_chu ~= 0)
    HandCardView:set_drag_enable(true)
    self.CardCtrlView:show_btns(data)


    for i = 1, #data.player do
        local localSeatID = self:get_local_seat(i - 1)

        self.playersView[localSeatID].localSeatID = localSeatID
        self.playersView[localSeatID].seatID = i - 1
        self.playersView[localSeatID].zhuang = data.zhuang == i - 1
		self.playersView[localSeatID].playersViewAll = self.playersView
        
        if localSeatID == 1 then
            local dataNew = self.model.Msg_Table_GameStateNTFNew
            -- 决定是否显示 托管按钮
            self.view:quxiaoTuoGuan(dataNew.player[i])
        end  
	end

	--播放动作
	if data.action then
		for j = 1, #data.action do
			local seatID = data.action[j].seat_id
			local localSeatID
			if seatID < 10000 then
				localSeatID = self:get_local_seat(seatID)
			else
				localSeatID = 1
				seatID = self.TableData.SeatID
			end
			local actionID = data.action[j].action
			local action_xiazhang_index = data.action[j].xia_zhang_size
			UnityLogBlue(localSeatID .. "号座位 播放动作"..actionID)
			self.playersView[localSeatID]:refresh_game_state(data.player[seatID+1], actionID, action_xiazhang_index)
		end
	end
		
	if self.bChangeCardType then
		for i = 1, #data.player do
			local localSeatID = self:get_local_seat(i - 1)
			self.playersView[localSeatID]:UpdateCards(data.player[i])
		end	
		self.bChangeCardType = false
	end
	
	--如果需要重新刷新所有
	if self.needUpdateAll then
		for i=1, #data.player do
			local localSeatID = self:get_local_seat(i - 1)
			self.playersView[localSeatID]:UpdateCards(data.player[i])
			self.needUpdateAll = false
		end
		
	end

    --如果有胡牌 其它玩家手牌要摆到下张
    if data.result ~= 0 or self:has_ActionHu() then    
        for i = 1, #data.player do
            local localSeatID = self:get_local_seat(i - 1)
            self.playersView[localSeatID]:HupaiHandToXia(data.player[i])
		end
		HandCardView:clear()
    end
    
    HandCardView:set_out_card_enable(data.ke_chu ~= 0)
    HandCardView:set_drag_enable(true)
end


--- 刷新牌局信息
function TableBaseModule:refresh_paiju(data)
    self.TableData.CurRound = data.CurRound
    TableUtilPaoHuZi.print("刷新手牌及状态")
    self:show_leave_btn(false)
    self:show_invite_btn(false)
    self.view:show_start_btn()
    self.view:refresh_round(data.CurRound)
    self:refresh_remainder_cards(#data.dun)
    local cardData = {}
	local count = 0	

	for i = 1, #data.player do		
		local localSeatID = self:get_local_seat(i - 1)
		
        self.playersView[localSeatID]:show_ready(false)
        self.playersView[localSeatID]:show_kick(false)
        self.playersView[localSeatID]:show_banker(data.zhuang == i - 1)
		self.playersView[localSeatID]:show_xing(data.player[i].type == 1)

		local dataNew = self.model.Msg_Table_GameStateNTFNew
		if not self:has_actionWhat(HuziAction.KaiJu)  then    --开局不显示闹钟
			self.playersView[localSeatID]:show_light(dataNew.cur_player == i - 1)
		end
		self.playersView[localSeatID]:update_huxi()
		self.playersView[localSeatID]:update_score(data.player[i].total_score)
        if TableManager:cur_game_is_gold_room_type() then
            self.playersView[localSeatID]:update_score(data.player[i].Balance)
		end
		
		if localSeatID == 1 then
			self.playersView[localSeatID]:refresh_TingZhang(data.yi_ting)
		end

		if ((not TableManager.phzTableData.isPlayBack and self.TableData.SeatID == i -1) or 
			(TableManager.phzTableData.isPlayBack and localSeatID == 1))
			and data.result == 0 and not self:has_ActionHu() then	
			self:update_hand_card(data.player[i], false)
		end
	end
	
	

	--刷新手牌听牌标记
	if data.ke_chu == nil or not data.ke_chu then
		HandCardView:HideTingTag()
	end

	local ruleInfo = TableUtilPaoHuZi.convert_rule(self.TableData.Rule)
    if self.PlayerNum == 4 and ruleInfo.KanZhuangJiaPai ~= nil and ruleInfo.KanZhuangJiaPai ~= true and self.TableData.SeatID == DataPaoHuZi.ZuoXingIndex and data.result == 0 then
        self.view.MsgZuoXing.text = "你当前是坐醒方，不可看牌"
    else
        self.view.MsgZuoXing.text = ""
    end
    if not self.view then
        return
    end
end

--- 显示结算
function TableBaseModule:show_game_result(data)
    --- 大结算
    if data.result == 2 then
        ModuleCache.ModuleManager.destroy_module("public", "dissolveroom")
        ModuleCache.ModuleManager.show_module("huzi", "totalresult", self)

       
        --- 没有显示  小结算或者显示了小结算但不是最后一局则表示是解散房间
        if not self.showSingleResult or (self.showSingleResult and DataPaoHuZi.Msg_DismissNTF and #DataPaoHuZi.Msg_DismissNTF.Action ~= 0) then
            ModuleCache.ModuleManager.destroy_module("huzi", "singleresult")
            ModuleCache.ModuleManager.get_module("huzi", "totalresult"):show_result()
        end
        return
    elseif data.result == 1 then
        self.showSingleResult = true

        self:InitActivity_module()
    end
    ModuleCache.ModuleManager.destroy_module("huzi", "singleresult")
    ModuleCache.ModuleManager.show_module("huzi", "singleresult", self)
end

--- 是否在准备状态
function TableBaseModule:isInZhunBeiIng()
    if not self.model.Msg_Table_UserStateNTF then
        return false
    end

    local num = 0
    for key, v in pairs(self.model.Msg_Table_UserStateNTF.State) do
        if v.UserID ~= "0" and v.UserID ~= nil and v.Ready then
            num = num + 1
        end
    end

    return  num ~= self.PlayerNum and self.model.Msg_Table_UserStateNTF_Self.Ready
end

function TableBaseModule:is_all_ready()
    if self.outLinetTag then
        return false
    end

    if not self.model.Msg_Table_UserStateNTF then
        return false
    end
    local num = 0
    for key, v in pairs(self.model.Msg_Table_UserStateNTF.State) do
        if v.UserID ~= "0" and v.UserID ~= nil and v.Ready then
            num = num + 1
        end
    end

    return num == self.PlayerNum - 1
end

function TableBaseModule:get_cur_player_count()
	local num = 0
	if self.model.Msg_Table_UserStateNTF == nil then
		return 1
	end
    for key, v in pairs(self.playersView) do
        if v.playerInfo ~= nil and v.playerInfo ~= "0" then
            num = num + 1
        end
	end
	return num
end

function TableBaseModule:is_in_game()
    if self.outLinetTag then
        return false
    end

    if not self.model.Msg_Table_UserStateNTF then
        return false
	end
	if self.Msg_Table_GameStateNTF ~= nil then
		return true
	end
    local num = 0
    for key, v in pairs(self.model.Msg_Table_UserStateNTF.State) do
        if v.UserID ~= "0" and v.UserID ~= nil and v.Ready then
            num = num + 1
        end
    end

    return num == self.PlayerNum
end

---请求理牌
function TableBaseModule:request_sortCard()
    local key = "SortCard_" .. AppData.Game_Name .. TableManager.phzTableData.modelData.roleData.userID
	local nSortType = ModuleCache.PlayerPrefsManager.GetInt(key)
	nSortType = (nSortType) % 2 + 1
	ModuleCache.PlayerPrefsManager.SetInt(key, nSortType)
	local data = self.Msg_Table_GameStateNTF
	if data == nil or data.result ~= 0 then
		return
	end
	for i = 1, #data.player do
		if self.TableData.SeatID == i -1 then	--自己的座位
			self:update_hand_card(data.player[i], true)
			break
		end
	end
end

--刷新手牌 
--player   玩家数据
--bReSort  强制重新排列
function TableBaseModule:update_hand_card(player, bReSort)
	local data = self.Msg_Table_GameStateNTF

    local cardData = {}
    local count = 0

	for j = 1, #player.fixed_pai do
		local nCount = #(player.fixed_pai[j].pai)
		for k=1,nCount do
			table.insert(cardData, player.fixed_pai[j].pai[k].pai)
		end
		count = count + 1
	end
	for j = 1, #player.shou_zhang do
		local nCount = #(player.shou_zhang[j].pai)
		for k=1,nCount do
			table.insert(cardData, player.shou_zhang[j].pai[k].pai)	
		end
	end

	self:start_lua_coroutine(function ()
		local sortCard = self.SortCardHelper:SortHandCard(cardData, HandCardView)	
		
		HandCardView:init_data({cards = sortCard, count = count, }, false , nil, bReSort)
		
		if data.ke_ting ~= nil then
			HandCardView:UpdateTingTag(data.ke_ting)
		end
	end)
end	

function TableBaseModule:is_qinyou_cheat()
    local  cachKey = string.format("parlor/list/getParlorDetail?%s", TableManager.phzTableData.HallID)
    local text = ModuleCache.PlayerPrefsManager.GetString(cachKey, "")
    if text ~= "" then
        local retData = ModuleCache.Json.decode(text)
        if(retData.success) then
			local data =  retData.data
			if TableManager.curTableData.HallID and TableManager.curTableData.HallID > 0 then
				return data.preventionCheat == 1
			end
        end
	end

	return false
end

--显示听牌提示
function TableBaseModule:ShowTingTips(value)
	local data = self.Msg_Table_GameStateNTF
	if not data.ke_chu then
		return
	end
	if data.ke_ting then
		local nCount = #data.ke_ting
		for i=1, nCount do
			if data.ke_ting[i].chu_pai == value then
				self.playersView[1]:refresh_TingZhang(data.ke_ting[i].ting_pai)
				return
			end
		end
	end
	self.playersView[1]:refresh_TingZhang({})
end

--获取剩余牌的数量 --听牌提示用
function TableBaseModule:GetLeftCardCount(value)
	--遍历自己手牌
	local data = self.Msg_Table_GameStateNTF
	local nCountCard = 0
	local selfIndex = self.TableData.SeatID + 1
	local nCountShou = #data.player[selfIndex].shou_zhang
	for j = 1, nCountShou do
		local nCount = #(data.player[selfIndex].shou_zhang[j].pai)
		for k=1,nCount do
			if data.player[selfIndex].shou_zhang[j].pai[k].pai == value then
				nCountCard = nCountCard + 1
			end
		end
	end

	--遍历所有人下张
	for i=1,self.PlayerNum do
		local nCountXia = #data.player[i].xia_zhang
		for j = 1, nCountXia do
			local nCount = #(data.player[i].xia_zhang[j].pai)
			for k=1,nCount do
				if data.player[i].xia_zhang[j].pai[k] == value then
					nCountCard = nCountCard + 1
				end
			end
		end
	end

	--遍历所有人弃张
	for i=1, self.PlayerNum do
		local nCountQi = #data.player[i].qi_zhang
		for j = 1, nCountQi do
			if data.player[i].qi_zhang[j] == value then
				nCountCard = nCountCard + 1
			end
		end
	end

	local nLeft = 4 - nCountCard
	if nLeft < 0 then
		nLeft = 0
	end
	return nLeft
end

--提前开始初始化(部分模块需要重新初始化)
function TableBaseModule:EarlyStartInit()
	for i=1, self.PlayerNum do
		self.playersView[i]:Reset()
		self.playersView[i]:Destroy()
	end
	self.PlayerNum = self:get_cur_player_count()
	self.view.PlayerNum = self.PlayerNum
	TableUtilPaoHuZi.PlayerNum = self.PlayerNum	--宇龙以前的代码用到 有空改掉
	local ruleInfo = ModuleCache.Json.decode(TableManager.phzTableData.Rule)
	ruleInfo.PlayerNum = self.PlayerNum
    TableManager.phzTableData.Rule = ModuleCache.Json.encode(ruleInfo)
    TableManager.curTableData.Rule = TableManager.phzTableData.Rule
	self.view:InitPlayer()
	self.playersView = self.view.playersView
end

---------------------实时语音--------------------------------------------------------
function TableBaseModule:InitShiShiYuYin()
    local ruleInfo = TableUtilPaoHuZi.convert_rule(self.TableData.Rule)
	if ruleInfo.ShiShiYuYin then
		self:ShiShiYuYin()
	end
end

function TableBaseModule:ShiShiYuYin_AnNiu()
    if not self.view then
        return
    end

    self.view.btnVoice.gameObject:SetActive(false)
    self.view.Voice1.gameObject:SetActive(false)
    self.view.Voice2.gameObject:SetActive(false)

    if ModuleCache.GVoiceManager().speaker_is_open() then
        self.view.Voice1.gameObject:SetActive(true)
    else
        self.view.Voice2.gameObject:SetActive(true)
    end
end

-- 实时语音功能 
function TableBaseModule:ShiShiYuYin()
    self.view.Voice1 = Manager.GetButton(self.view.root, "RightBtn/fixed/Voice1")
    self.view.Voice2 = Manager.GetButton(self.view.root, "RightBtn/fixed/Voice2")

    self.view.Voice2.onClick:AddListener(
        function()
            ModuleCache.GVoiceManager().openSpeaker()
            self:ShiShiYuYin_AnNiu()
        end
    )

    self.view.Voice1.onClick:AddListener(
        function()
            ModuleCache.GVoiceManager().closeSpeaker()
            self:ShiShiYuYin_AnNiu()
        end
    )

    self:ShiShiYuYin_AnNiu()

    --ModuleCache.GVoiceManager().joinTeam(TableManager.phzTableData.RoomID,function()
    --    print('刷新咯')
    --    self:ShiShiYuYin_AnNiu()
    --end
    --)
    --ModuleCache.PlayerPrefsManager.SetString("房间号语音", TableManager.phzTableData.RoomID)

    self.bDestroyShiShiYuYin = true
end

function TableBaseModule:ShiShiYuYin_TuiChu()
    local roomID = ModuleCache.PlayerPrefsManager.GetString("房间号语音")

    if roomID then
        --ModuleCache.GVoiceManager().quitTeam(roomID, 5000)
    end
end
---------------------实时语音--------------------------------------------------------

--刷新公共信息
function TableBaseModule:UpdateTempInfo(data)
	if data == nil then
		return
	end
	local nID = data.TempData[1].Data[1].Id
	if nID == 1 then		--1是实时语音用到
		if self.RealTimeSpeech ~= nil then
			self.RealTimeSpeech:UpdateState(data)
		end
	elseif nID == emCommonTempInfo.GPS then	--GPS
		local nCount = 0
		self.locationDatas = {}
		for i=1, #data.TempData do
			if data.TempData[i].Data[1].Note ~= "" then
				self.locationDatas[i-1] = ModuleCache.Json.decode(data.TempData[i].Data[1].Note)
				nCount = nCount  + 1
			else
				self.locationDatas[i-1] = nil
			end
		end
		if nCount > 1 then		--1个人不检测
			self.view:ShowGpsInfo(false)
		end
	elseif nID == 20181214 then
		self.TableData.RoomHisID = tonumber(data.TempData[1].Data[1].Note)
		TableManager.curTableData.RoomHisID = tonumber(data.TempData[1].Data[1].Note)
	end
	
end
-------------------------------------------------------------------------------------

return TableBaseModule