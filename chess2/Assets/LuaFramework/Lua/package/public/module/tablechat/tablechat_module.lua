

local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local TableChatModule = class("tableChatModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local UnityEngine = UnityEngine

local minMsgInterval = 2
local maxChatMsgNum = 40

function TableChatModule:initialize(...)
	self.allChatMsgs = TableManager.chatMsgs
	-- 开始初始化                view        loginModel           模块数据
	ModuleBase.initialize(self, "tablechat_view", "tablechat_model", ...)

	
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function TableChatModule:on_module_inited()
	for i=1,#self.tableChatView.toggles do
		self.tableChatView.toggles[i].onValueChanged:AddListener(function(isCheck)
			if(isCheck) then 
				self.tableChatView:refresh_toggles()
			end
		end)
	end  
end

-- 绑定module层的交互事件
function TableChatModule:on_module_event_bind()
	self:subscibe_package_event("Event_Refresh_ChatMsg", function(eventHead, eventData)
		self:refresh_chat_msgs()
	end)
	--- 刷新跑胡子聊天消息
	self:subscibe_package_event("Event_PaoHuZi_Refresh_ChatMsg", function(eventHead, eventData)
		self:refresh_phz_chat_msgs()
	end)
	self:subscibe_module_event("table", "Event_Refresh_ChatMsg", function(eventHead, eventData)
		self:refresh_chat_msgs()
	end)
end

-- 绑定loginModel层事件，模块内交互
function TableChatModule:on_model_event_bind()
	
end

function TableChatModule:on_show(data)
	local is_New_Sever = (data or false) and data.is_New_Sever
	local allChatMsgs = (data or nil) and data.allChatMsgs
	local curTableData = (data or nil) and data.curTableData
	local config = (data or nil) and data.config
	local hideTextChat = (data or nil) and data.hideTextChat
	if data.seatHolderArray then
		self.view.curTableData.seatHolderArray = data.seatHolderArray
	end
	self.view:show_text_chat_panel(not hideTextChat)
	if(allChatMsgs)then
		self.allChatMsgs = allChatMsgs
	end
	if(curTableData)then
		self.view.curTableData = curTableData
	end
	if(config)then
		self.view.config = config
	end
	self.is_New_Sever = is_New_Sever
	if(data.chatShotTextList) then
		self.view.chatShotTextList = data.chatShotTextList
	end
	self:refresh_chat_msgs()
end

function TableChatModule:on_click(obj, arg)	
	print(obj.name)
	ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
	if obj.name == "ButtonClose" then
		ModuleCache.ModuleManager.hide_module("public", "tablechat")
	else
		if(self.lastSendMsgTime and self.lastSendMsgTime + minMsgInterval > Time.realtimeSinceStartup)then
			ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("您说话太快！喘口气吧~")	
			return
		end
		self.lastSendMsgTime = Time.realtimeSinceStartup

		if obj.transform.parent.parent.parent.parent.name == "PanelShortMsg" then
			
			for i=1,#self.tableChatView.chatTextObjs do
				if(obj == self.tableChatView.chatTextObjs[i]) then
					local chatTextBubbleData = 
					{
						content = obj.name,
						chatType = 1,
						userId = self.modelData.roleData.userID
					}
					
					print("----------------------send short msg  self.is_New_Sever:", self.is_New_Sever)
					if not self.is_New_Sever then
						self:dispatch_module_event("tablechat", "Event_Client_ChatMsg", chatTextBubbleData)
						chatTextBubbleData ={
							words = self.view.chatShotTextList[i]
						}
					end
					self:dispatch_module_event("tablechat", "Event_Send_ChatMsg", chatTextBubbleData)
					self:dispatch_package_event("Event_Send_ChatMsg", chatTextBubbleData)
					
					ModuleCache.ModuleManager.hide_module("public", "tablechat")
				end
			end
		elseif(obj.name == "Image") then
			for i=1,#self.tableChatView.chatFaceObjs do
				if(obj == self.tableChatView.chatFaceObjs[i]) then
					local chatTextBubbleData = 
					{
						content = i .. "",
						chatType = 2,
						userId = self.modelData.roleData.userID
					}
					if not self.is_New_Sever then
						chatTextBubbleData ={
							emoticon = i .. ""
						}
					end
					self:dispatch_module_event("tablechat", "Event_Send_ChatMsg", chatTextBubbleData)
					self:dispatch_package_event("Event_Send_ChatMsg", chatTextBubbleData)
					ModuleCache.ModuleManager.hide_module("public", "tablechat")
				end
			end
		elseif(obj.name == "ButtonSend") then--发送聊天消息
			if(self.tableChatView.MsgText.text ~= "") then
				local chatTextBubbleData = 
				{
					words = self.tableChatView.MsgText.text,
					content = self.tableChatView.MsgText.text,
					chatType = 3,
					userId = self.modelData.roleData.userID
				}
				if not self.is_New_Sever then
					chatTextBubbleData ={
						words = self.tableChatView.MsgText.text
					}
				end

				self:dispatch_module_event("tablechat", "Event_Send_ChatMsg", chatTextBubbleData)
				self:dispatch_package_event("Event_Send_ChatMsg", chatTextBubbleData)
				self.tableChatView.MsgText.text = ""
			end
		elseif(obj.name == "voiceBtn") then

			local voiceMsgIdx =tonumber(obj.transform.parent.parent.parent.parent.name) 
			local chatMsg = self.chatMsgs[voiceMsgIdx]
			--print("---------------",chatMsg.content)

			local voiceBtnAnimation = GetComponentWithPath(obj.gameObject, "", "UIImageAnimation")
			voiceBtnAnimation:Play(0)

			local voiceData = {}
			voiceData.fileid = chatMsg.content
			if string.sub(voiceData.fileid, 1, 1) == "{" then
				local jsonData = ModuleCache.Json.decode(voiceData.fileid)
				if(jsonData.key)then
					voiceData.savePath = UnityEngine.Application.persistentDataPath .. "/" .. jsonData.key .. ".data"
					ModuleCache.SoundManager.audioMusic.mute = true
					-- 这个也需要在基类中处理
					ModuleCache.CustomVoiceManager.play_recorded_file(voiceData.savePath,function()
						ModuleCache.SoundManager.audioMusic.mute = false
						if voiceBtnAnimation then
							voiceBtnAnimation:Stop(2)
						end
					end)
				else
					return
				end
			else
				return
			end
		elseif(obj.transform.parent == self.view.goInteractiveFaceItemPrefab.transform.parent)then
			self:on_click_interactive_face(obj, arg)
		end
	end
end

function TableChatModule:on_click_interactive_face(obj, arg)
	for i, v in pairs(self.view.interactiveFaceHolderList) do
		if(obj == v.root)then
			local data = v.data
			local onFinish = function()
				self:dispatch_package_event("Event_PlayerInfo_SendGift", {giftName = data.key, times = data.times})
				ModuleCache.ModuleManager.hide_module("public", "tablechat")
			end
			if(data.needGold > 0)then
				--在这里扣费，成功之后发送
				self:request_cost_gold(data.needGold, onFinish)
			else
				onFinish()
			end
			return
		end
	end
end


function TableChatModule:request_cost_gold(goldNum, callback)
	local requestData = {
		params =
		{
			uid = self.modelData.roleData.userID,
			gameId = ModuleCache.AppData.get_app_and_game_name(),
			coins = goldNum,
			coinType = 8,       --钻石2，金币8
			event = 33,         --表情扣费
		},
		showModuleNetprompt = true,
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "pay/decr?",
	}
	local onResponse = function(wwwOperation)
		local www = wwwOperation.www;
		local retData = ModuleCache.Json.decode(www.text)
		if retData.success then
			if callback then
				callback();
			end
		else
			ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.errMsg)
		end
	end

	local onError = function(data)
		print(data.error);
	end
	local onSystemError = function(data)
		ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(data.message)
	end

	self:http_get(requestData, onResponse, onError, nil, onSystemError);
end

function TableChatModule:is_me(userId)
    return (tostring(userId) == tostring(self.modelData.roleData.userID))
end

function TableChatModule:refresh_chat_msgs()
	self.chatMsgs = {}
	local allChatMsgs = self.allChatMsgs
	if(#allChatMsgs < maxChatMsgNum) then
		for i=1,#allChatMsgs do
			allChatMsgs[i].isMe = self:is_me(allChatMsgs[i].userId or 0)
			table.insert(self.chatMsgs, allChatMsgs[i])
		end
	else
		for i=#allChatMsgs - maxChatMsgNum + 1,#allChatMsgs do	
			allChatMsgs[i].isMe = self:is_me(allChatMsgs[i].userId or 0)
			table.insert(self.chatMsgs, allChatMsgs[i])
		end
	end 
	self.tableChatView:refresh_chat_msgs(self.chatMsgs)
end

--- 刷新跑胡子聊天消息
function TableChatModule:refresh_phz_chat_msgs()
	self.chatMsgs = {}
	local allChatMsgs = self.allChatMsgs
	if(#allChatMsgs < maxChatMsgNum) then
		for i=1,#allChatMsgs do
			allChatMsgs[i].isMe = self:is_me(allChatMsgs[i].userId or 0)
			table.insert(self.chatMsgs, allChatMsgs[i])
		end
	else
		for i=#allChatMsgs - maxChatMsgNum + 1,#allChatMsgs do
			allChatMsgs[i].isMe = self:is_me(allChatMsgs[i].userId or 0)
			table.insert(self.chatMsgs, allChatMsgs[i])
		end
	end
	self.tableChatView:refresh_phz_chat_msgs(self.chatMsgs)
end

return TableChatModule



