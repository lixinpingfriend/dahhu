local ModuleCache = ModuleCache
local class = require("lib.middleclass")
local ModuleBase = require('core.mvvm.module_base')
local TotalGameResultModule = class('totalGameResultModule', ModuleBase)
local PlayerPrefs = UnityEngine.PlayerPrefs
local PlayerPrefsManager = ModuleCache.PlayerPrefsManager
local TableManager = TableManager
local NetClientManager = ModuleCache.net.NetClientManager

local curTableData = nil

function TotalGameResultModule:initialize(...)

	ModuleBase.initialize(self, "totalgameresult_view", nil, ...)
	self.netClient = self.modelData.bullfightClient	
	curTableData =TableManager.curTableData 
	self.netClient = self.modelData.bullfightClient		    
	self.exitRoom = false

	--self.shareTypeToggle.isOn = PlayerPrefsManager.GetInt("shareTypeToggle", 0) == 1  -- shareTypeToggle ： 0 是分享图片   1 分享文字
	self.view.shareTypeToggle.onValueChanged:AddListener(function(isCheck)
		if isCheck then
			PlayerPrefsManager.SetInt("shareTypeToggle" ,1)
		else
			PlayerPrefsManager.SetInt("shareTypeToggle",0)
		end
	end	)
end

function TotalGameResultModule:process_match_room(gameState)
	local localSeat = nil
	local seatHolder = nil
	local ranking  = 1
	local rankingShowTex = ""
	local dialogData = {}
	local PlayerSort = {}
	for k,v in ipairs(gameState.Player) do 
		PlayerSort[k] = v
	end

	table.sort( PlayerSort, function ( a,b )
		return a.ZongBeiShu > b.ZongBeiShu
	end )
	
	--没有分出胜负 
	if PlayerSort[1].ZongBeiShu == PlayerSort[2].ZongBeiShu or PlayerSort[2].ZongBeiShu == PlayerSort[3].ZongBeiShu then
		return
	end

	for i,v in ipairs(gameState.Player) do
		localSeat = TableUtil.get_local_seat(i - 1, curTableData.SeatID, curTableData.totalSeat)
		seatHolder = curTableData.seatHolderArray[localSeat]
		--print(i,v.ZongBeiShu,"----------------------------------0000-------------seatHolder.playerId:",seatHolder.playerId,self.modelData.roleData.userID)
		if seatHolder.playerId == self.modelData.roleData.userID then
			
			for k,d in ipairs(gameState.Player) do
				if(v.ZongBeiShu < d.ZongBeiShu) then
					ranking = ranking +1
				end
			end
			
			dialogData = {}
			if(ranking == 1) then
				dialogData.btnType = 2
				dialogData.infoStr = "恭喜您，在本次比赛中获得冠军，请快点领取属于您的奖励！"
				dialogData.bottomStr = "请查看比赛记录获取兑奖码领取奖励"
				dialogData.onCallback = function()
					-- 跳转到 亲友圈-》比赛场-》-》比赛记录
					
					ModuleCache.ModuleManager.hide_public_module("netprompt")
					ModuleCache.ModuleManager.destroy_package("public")
					ModuleCache.ModuleManager.destroy_package("majiang")
					ModuleCache.ModuleManager.destroy_package("majiang3d")
					ModuleCache.ModuleManager.show_module("public", "hall")

					PlayerPrefs.SetInt("NeedJumpMatchHistory", 1)
				end
			elseif(ranking == 2) then
				dialogData.btnType = 2
				dialogData.infoStr = "恭喜您，在本次比赛中获得亚军，请快点领取属于您的奖励！"
				dialogData.bottomStr = "请查看比赛记录获取兑奖码领取奖励"
				dialogData.onCallback  = function()
					-- 跳转到 亲友圈-》比赛场-》-》比赛记录
					ModuleCache.ModuleManager.hide_public_module("netprompt")
					ModuleCache.ModuleManager.destroy_package("public")
					ModuleCache.ModuleManager.destroy_package("majiang")
					ModuleCache.ModuleManager.destroy_package("majiang3d")
					ModuleCache.ModuleManager.show_module("public", "hall")

					PlayerPrefs.SetInt("NeedJumpMatchHistory", 1)
				end
			else
				dialogData.btnType = 1
				if( #gameState.Player == 3) then
					dialogData.infoStr = "很遗憾，您在本次比赛中获得第3名，没有奖励，下次加油哦！"
				elseif( #gameState.Player == 4) then
					if PlayerSort[3].ZongBeiShu == PlayerSort[4].ZongBeiShu then
						dialogData.infoStr = "很遗憾，您在本次比赛中获得第3名，没有奖励，下次加油哦！"
					else
						dialogData.infoStr = string.format( "很遗憾，您在本次比赛中获得第%d名，没有奖励，下次加油哦！",ranking) 
					end
				end
			end 
			ModuleCache.ModuleManager.show_module("public","matchdialog", dialogData)
		end
	end
end


function TotalGameResultModule:on_module_inited()

end

function TotalGameResultModule:on_module_event_bind()
	self:subscibe_module_event("roomsetting", "Event_Receive_Msg_Exit_Room", function(eventHead, eventData)
		self.exitRoom = true
		if self.readyBackToHall then
			self:BackToHall()
		end
	end)
end

function TotalGameResultModule:on_click(obj, arg)
	print(obj.name)
	ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
	if(self.lastClickInviteTime and self.lastClickInviteTime + 1 > Time.realtimeSinceStartup)then
		return
	end
	if(obj.name == "BtnReturnHall") then
		if not self.exitRoom then
			self:dispatch_module_event("roomsetting", "Event_RoomSetting_ExitRoom")
			self.readyBackToHall = true
		else
			self:BackToHall()
		end
	elseif(obj.name == "BtnShareXianLiao") then
		if not ModuleCache.ShareManager().can_share_to_xianliao() then
			ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("当前版本暂不支持此功能，请下载新版本")
			return
		end

		self:share(ModuleCache.ShareManager().ShareTypeOfChannel.XianLiao)
	elseif(obj.name == "BtnShareWechat") then
		self:share(ModuleCache.ShareManager().ShareTypeOfChannel.Wechat)
	elseif (obj.name == "BtnReStart") then
		local sendData = nil
		if(self.view.ConfigData.isKaWuXing and TableManager.curTableData.ruleJsonInfo.YouPiao) then
			sendData = {xiaojiScore = TableManager.curTableData.kaWuXingPiao, paoScore = -1}
		end
		self:dispatch_module_event("tablestrategy", "Event_Show_TableStrategy", sendData)
		self:dispatch_module_event("tablestrategy", "Event_Table_Restart")

		---@type NetClient
		local client = NetClientManager.get_client("gameServer")
		client:reset_cdecompress()

		ModuleCache.ModuleManager.destroy_module("majiang", "totalgameresult")
	end
end

function TotalGameResultModule:share(ShareTypeOfChannel)
	if PlayerPrefsManager.GetInt("shareTypeToggle", 0) == 1 then
		if not ModuleCache.ShareManager().copyText or ModuleCache.ShareManager().copyText == "" then
			--ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("获取内容异常,请重试")
			ModuleCache.ShareManager().share_room_result_text(self.view:get_clip_board_text(self.gameState),function(copyText)
				local data = {
					ShareTypeOfChannel = ShareTypeOfChannel,
					text = ModuleCache.ShareManager().copyText
				}
				ModuleCache.ShareManager().share_app_result_text(data)
			end)
		else
			local data = {
				ShareTypeOfChannel = ShareTypeOfChannel,
				text = ModuleCache.ShareManager().copyText
			}
			ModuleCache.ShareManager().share_app_result_text(data)
		end
	else
		ModuleCache.ShareManager().share_app_result_image(false, false, false, ShareTypeOfChannel)
	end
end


-- 如果收到点击和自动跳转同时生效就会出问题
function TotalGameResultModule:on_show(initData)
	self.gameState = initData.gameState
	local totalRoundCount = curTableData.RoundCount
			or curTableData.ruleJsonInfo.roundCount or curTableData.videoData.roundcount
	local needShowRestart = self.gameState.RealyRound == totalRoundCount
			and self.view.ConfigData.useTotalResultRestart
	if curTableData.RoomType == 3 then
		self:process_match_room(self.gameState)
	end
	self.view:refresh_total_result_data(self.gameState)
	self.view.btnRestart:SetActive(needShowRestart)
	-- 当结算界面出来后，可以给服务器发包断开连接
	--self:dispatch_module_event("roomsetting", "Event_RoomSetting_ExitRoom")
	-- 先去掉，这里难道会有BUG?
	self.exitRoom = false
	ModuleCache.ShareManager().copyText = nil
end

function TotalGameResultModule:BackToHall()
	self:dispatch_package_event("Event_Package_Table_LoginAndExit", true)
	ModuleCache.ModuleManager.hide_public_module("netprompt")
	ModuleCache.ModuleManager.destroy_package("public")
	ModuleCache.ModuleManager.destroy_package("majiang")
	ModuleCache.ModuleManager.destroy_package("majiang3d")
	ModuleCache.ModuleManager.show_module("public", "hall")
end

function TotalGameResultModule:reconnect()
	self.totalGameResultModel.clientConnected = false
	self.totalGameResultModel:connect_server()
end


return  TotalGameResultModule