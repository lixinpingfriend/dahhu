






local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local JoinRoomModule = class("BullFight.JoinRoomModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local UnityEngine = UnityEngine



function JoinRoomModule:initialize(...)
	-- 开始初始化                view        loginModel           模块数据
	ModuleBase.initialize(self, "joinRoom_view", "joinRoom_model", ...)

	self.strRoomNum = ''
	self.AgentParlorCount = 0
	self.curSelectPlayMode =  ModuleCache.PlayModeUtil.getInfoByGameName(AppData.Game_Name)--ModuleCache.PlayModeUtil.getInfoByIdAndLocation(ModuleCache.GameManager.curGameId, ModuleCache.GameManager.curLocation)

	local appName_temp = AppData.App_Name
	if self.curSelectPlayMode.provinceId then
		appName_temp = ModuleCache.PlayModeUtil.getProvinceById(self.curSelectPlayMode.provinceId).appName
	end

	self.curSelectPlayMode.gameName_temp =  appName_temp .. "_".. self.curSelectPlayMode.gameName
	print_table(self.curSelectPlayMode,"###########"..AppData.Game_Name)
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function JoinRoomModule:on_module_inited()

end


-- 绑定module层的交互事件
function JoinRoomModule:on_module_event_bind()
	self:subscibe_package_event("Event_Package_selectWanfaDone", function(eventHead, eventData)
		self.curSelectPlayMode = eventData

		local appName_temp = AppData.App_Name
		if self.curSelectPlayMode.provinceId then
			appName_temp = ModuleCache.PlayModeUtil.getProvinceById(self.curSelectPlayMode.provinceId).appName
		end

		self.curSelectPlayMode.gameName_temp =  appName_temp .. "_".. self.curSelectPlayMode.gameName
		print_table(eventData,"###########")

		self.view.wanfaTex.text = self.curSelectPlayMode.name
	end )

end


function JoinRoomModule:on_model_event_bind()

end

function JoinRoomModule:on_hide()
	self.modelData.museumOpen =nil
	self.modelData.joinRoomMuseum = false
end

function JoinRoomModule:on_destroy()
	self.modelData.museumOpen =nil
	self.modelData.joinRoomMuseum = false
end

function JoinRoomModule:on_show(joinData)
	if(not joinData) then
		joinData = { mode = 1 }
	end
	self.joinData = joinData
	self.joinMode = joinData.mode
	if self.joinMode == 2 then --创建亲友圈
		self.view.stateSwitcher:SwitchState("MuseumCreate")
		--self.view.museumToggles[2].isOn = false
		--self.view.museumToggles[2].isOn = true

		self.modelData.museumOpen = true
		self.view.idInput.text = tostring(self.modelData.roleData.userID)
		self:get_Agent_Parlor_Count()

		--self.view.wanfaTex.text = self.curSelectPlayMode.hallName

	elseif(self.joinMode == 1) then --加入房间
		self.view.stateSwitcher:SwitchState("JoinRoom")
	elseif(self.joinMode == 3) then --底注设定
		self.view.stateSwitcher:SwitchState("GoldEnter1")
	elseif(self.joinMode == 4 or self.joinMode == 6) then --入场设定
		self.view.stateSwitcher:SwitchState("GoldSet2")
	elseif(self.joinMode == 5) then --底分设定
		self.view.stateSwitcher:SwitchState("GoldEnter1")
	elseif(self.joinMode == 7) then --离场设定
		self.view.stateSwitcher:SwitchState("GoldEnter3")

	elseif(self.joinMode == 8) then --加入亲友圈
		self.view.stateSwitcher:SwitchState("MuseumJoin")
	elseif(self.joinMode == 9) then --亲友圈发送联谊邀请
		self.view.stateSwitcher:SwitchState("MuseumFellowShip")
	end
	self:cleanRoomNumAndRefreshView()
end

function JoinRoomModule:cleanRoomNumAndRefreshView()
	self.strRoomNum = ''
	self.joinRoomView:refreshRoomNumText(self.strRoomNum);
	self.view:refreshGoldNumText(self.strRoomNum)
end

function JoinRoomModule:removeLastNum()
	local len = string.len(self.strRoomNum)
	if(len == 0) then
		self.strRoomNum = ''
	else
		self.strRoomNum = string.sub(self.strRoomNum, 1, len - 1)
	end
end


function JoinRoomModule:on_click(obj, arg)
	ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
	if obj.name == "closeBtn" then
		--self:dispatch_module_event("joinroom_to_chessmuseum","Update_User_Parlor_List")

		ModuleCache.ModuleManager.destroy_module("public", "joinroom")
		return
	elseif obj == self.joinRoomView.keyboardMap.buttonDelete.gameObject then
		self:removeLastNum()
		self.joinRoomView:refreshRoomNumText(self.strRoomNum)
		self.view:refreshGoldNumText(self.strRoomNum)
	elseif obj == self.joinRoomView.keyboardMap.buttonClean.gameObject then
		self:cleanRoomNumAndRefreshView();
	elseif(obj.name == "ChangeWanfa") then
		local intentData = {
			openProvince = ModuleCache.GameManager.curProvince,
			museumOpen = true
		}
		ModuleCache.ModuleManager.show_module("public", "setplaymode",  intentData)
	elseif(obj.name == "createBtn") then--TODO XLQ:创建亲友圈
		if  self.view.nameInput.text == "" then
			ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("圈名不能为空！")
		elseif not Util.checkNameUnlawful(self.view.nameInput.text) then
			ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("名称不合法。")
		elseif self.view.idInput.text == "" then
			ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("圈主ID不能为空！")
		else
			if self.AgentParlorCount >= 1 then
				ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common(string.format("为了避免亲友圈资源浪费，从创建第二个亲友圈开始需要收取%s体力服务费，是否继续创建？",self.modelData.addParlorCost), function()
					self:create_museum({
						parlorName = self.view.nameInput.text,
						ownerUid = self.view.idInput.text,
						wechatNumber = self.view.wxNumInput.text,
					})
				end,nil )
			else
				self:create_museum({
					parlorName = self.view.nameInput.text,
					ownerUid = self.view.idInput.text,
					wechatNumber = self.view.wxNumInput.text,
				})
			end

		end

	else
		local len = table.getn(self.joinRoomView.keyboardMap)

		for i=0,len do
			if(obj == self.joinRoomView.keyboardMap[i].gameObject) then

				if(self.joinMode == 1 or self.joinMode == 2 or self.joinMode == 8 or self.joinMode == 9) then
					if(string.len(self.strRoomNum) >= 6) then
						return
					end
					self.strRoomNum = self.strRoomNum .. i

					self.joinRoomView:refreshRoomNumText(self.strRoomNum)
					if(string.len(self.strRoomNum) == 6) then
						local roomID = self:getRoomId()

						if roomID <= 99999 then
							self:getParlorListByNum(roomID)

						else
							if self.joinMode == 2 or self.joinMode == 8  then
								ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("圈号不存在")
							else
								self.modelData.tableCommonData.tableType = 0
								self.modelData.hallData.hideCircle = false
								TableManager:join_room({roomId = roomID})
							end
						end
						return
					end
				else
					if(string.len(self.strRoomNum) >= 8) then
						return
					end
					self.strRoomNum = self.strRoomNum .. i
					self.view:refreshGoldNumText(self.strRoomNum)
				end
			end
		end
	end
end


function JoinRoomModule:get_Agent_Parlor_Count()
	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/list/getAgentParlorCount?",
		showModuleNetprompt = true,
		hideTips500Error = true,
		params =
		{
			uid = self.modelData.roleData.userID,
		}
	}
	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		if (retData.success) then
			self.AgentParlorCount = tonumber( retData.data )
		else

		end
	end , function(wwwErrorData)
		print(wwwErrorData.error)
	end )
end

function JoinRoomModule:create_museum(data)
	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/list/addParlor?",
		showModuleNetprompt = true,
		hideTips500Error = true,
		params =
		{
			uid = self.modelData.roleData.userID,
			parlorName = data.parlorName,
			ownerUid = data.ownerUid,
			wechatNumber = data.wechatNumber,
			canCreateBox = 0
			--gameName = self.curSelectPlayMode.gameName_temp
		}
	}
	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		if (retData.success) then
			ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("亲友圈创建成功！")
			self:dispatch_module_event("joinroom_to_chessmuseum","Update_User_Parlor_List")
			ModuleCache.ModuleManager.destroy_module("public", "joinroom")
		else
			ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.errMsg)
		end
	end , function(wwwErrorData)
		print(wwwErrorData.error)
		if tostring(wwwErrorData.error):find("500") ~= nil or tostring(wwwErrorData.error):find("error") ~= nil then
			if wwwErrorData.www.text then
				local retData = wwwErrorData.www.text
				retData = ModuleCache.Json.decode(retData)
				if retData.errMsg then
					retData = ModuleCache.Json.decode(retData.errMsg)
					if retData.code == "GAME_USER_NOT_FOUND" then
						ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("请输入正确的游戏ID作为圈主。")
					elseif retData.code == "USER_NOT_BIND_AGENT" then
						ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("暂时仅限代理可以创建亲友圈哦！")
					else
						ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.message)
					end


				end
			end
		end
	end )
end


function JoinRoomModule:join_museum(data)
	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/member/applyMember?",
		-- showModuleNetprompt = true,
		params =
		{
			uid = self.modelData.roleData.userID,
			parlorId = data.id or data.parlorId
		}
	}
	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		if (retData.success) then
			ModuleCache.ModuleManager.show_public_module("alertdialog"):show_center_button("申请成功，请等待圈主审核", function()
				self:dispatch_module_event("chessmuseum", "Event_Update_OneChessMuseum")
			end )
		else
			ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.errMsg)
		end
	end , function(wwwErrorData)
		print(wwwErrorData.error)
		if tostring(wwwErrorData.error):find("500") ~= nil or tostring(wwwErrorData.error):find("error") ~= nil then
			if wwwErrorData.www.text then
				local retData = wwwErrorData.www.text
				retData = ModuleCache.Json.decode(retData)
				if retData.errMsg then
					retData = ModuleCache.Json.decode(retData.errMsg)
					ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.message)
					if tostring(retData.message):find("在亲友圈") ~= nil then
						self:dispatch_module_event("match", "Update_CurParlor_Detail")
					end
				end
			end
		end
	end )
end


function JoinRoomModule:getParlorListByNum(parlorNum)
    local requestData = {
        baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/list/getParlorListByNum?",
        params = {
            uid = self.modelData.roleData.userID,
			parlorNum = parlorNum
        },
    }

	self:http_get(requestData, function(wwwOperation)
        local www = wwwOperation.www;
        local retData = ModuleCache.Json.decode(www.text)
		if (retData.success) then

			local dispose = function(data)
				if self.joinMode == 2 or self.joinMode == 8 then -- 亲友圈列表添加亲友圈功能
					ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common_image_tex({
						topTex = "您确定要申请加入以下亲友圈吗？",
						rightTex1 = "圈名："..data.parlorName ,
						rightTex2 = "圈号：0".. data.parlorNum,
						headImg = data.parlorLogo
					}, function()
						self:join_museum(data)
					end)
				else--大厅输入圈号进入牌桌流程
					if data.launchRoundStatus and data.launchRoundStatus == 2 then
						ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("亲友圈已暂停组局，请联系管理员！")
						return
					end
					local playRule = TableUtil.convert_rule(data.playRule)
					print_table(playRule)
					local createName=""

					if(playRule.gameName) then
						createName = playRule.gameName
					--else
					--	createName = Config.get_create_name_by_wanfatype(playRule.GameType)
					end

					print("---------------playRule.GameType:",playRule.GameType,createName)

					if createName  and createName ~= "" then
						self:getParlorBoxListByParlorId(data)
					else
						ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("游戏名称获取失败(playRule.gameName==nil),请联系圈主重设玩法")
					end

				end
			end

			if #retData.data == 1 then
				if self.joinMode == 9 then --发起联谊功能
					if self.joinData.callback then
						self.joinData.callback(retData.data[1].parlorId)
						ModuleCache.ModuleManager.destroy_module("public", "joinroom")
					end
				else
					dispose(retData.data[1])
				end


			elseif  #retData.data > 1 then
				ModuleCache.ModuleManager.show_module("public", "museumlist", {dataList =retData.data,callBack = function(data)
					if self.joinMode == 9 then --发起联谊功能
						if self.joinData.callBack then
							self.joinData.callBack(data.parlorId)
							ModuleCache.ModuleManager.destroy_module("public", "joinroom")
						end
					else
						dispose(data)
					end
				end})
			else
				ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("圈号不存在")

			end


		end
    end, function(wwwErrorData)
        print(wwwErrorData.error)
		if tostring(wwwErrorData.error):find("500") ~= nil or tostring(wwwErrorData.error):find("error") ~= nil then
			if wwwErrorData.www.text then
				local retData = wwwErrorData.www.text
				retData = ModuleCache.Json.decode(retData)
				if retData.errMsg then
					retData = ModuleCache.Json.decode(retData.errMsg)
					ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.message)
				end
			end
		end
    end)
end


function JoinRoomModule:getParlorBoxListByParlorId(museumData)
	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/list/getParlorBoxListByParlorId?",
		showModuleNetprompt = true,
		params = {
			uid = self.modelData.roleData.userID,
			parlorId = museumData.parlorId or museumData.id,
		}
	}
	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		if (retData.success) then
			if #retData.data > 0 then
				----------过滤其他app的包间
				local boxDataList = nil
				if AppData.Is_Independent_App then
					local data = {}
					for i = 1, #retData.data do
						if self:independent_app_is_need_show_parlor(retData.data[i].gameId) then
							table.insert(data, retData.data[i])
						end
					end
					boxDataList = data
				else
					boxDataList = retData.data
				end
				local boxData = boxDataList[1]
				---------------

				------------切换到第一包间的玩法
				local playRule =  TableUtil.convert_rule(boxData.playRule)
				local arr = string.split(playRule.GameID, "_")
				if #arr <= 1 then
					arr = string.split(playRule.gameName or "", "_")
				end

				if #arr > 1 then
					if ModuleCache.GameManager.change_game_buy_appName_gameName(arr[1], arr[2]) then
						self:dispatch_package_event("Event_Set_Play_Mode", ModuleCache.PlayModeUtil.getConfigByAppAndGameName(ModuleCache.AppData.get_real_app_and_game_name()))
					end
				end

				self.modelData.tableCommonData.tableType = 0
				self.modelData.hallData.hideCircle = false
				ModuleCache.PlayerPrefsManager.SetString("JoinMuseumRoomGameID", museumData.gameId)
				----------------

				local gameName = nil
				if playRule.gameName and playRule.gameName ~= "" then
					gameName = playRule.gameName
				else
					--有得rule里没有 playRule.gameName
					local wanfaType = Config.GetWanfaIdx(playRule.GameType)
					gameName = Config.get_create_name(wanfaType)
				end

				TableManager:join_room({roomId = museumData.parlorNum,boxId = boxData.boxId,  gameName = gameName ,playRule = playRule})
			end

		end
	end, function(wwwErrorData)
		print(wwwErrorData.error)
		if tostring(wwwErrorData.error):find("500") ~= nil or tostring(wwwErrorData.error):find("error") ~= nil then
			if wwwErrorData.www.text then
				local retData = wwwErrorData.www.text
				retData = ModuleCache.Json.decode(retData)
				if retData.errMsg then
					retData = ModuleCache.Json.decode(retData.errMsg)
					ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.message)
				end
			end
		end
	end)
end

-- 独立App过滤牌友圈和包间
function JoinRoomModule:independent_app_is_need_show_parlor(gameId)
	if string.find(gameId, ModuleCache.AppData.Const_App_Name) then
		return true
	end

	if string.find(gameId, ModuleCache.AppData.Poker_App_Name) then
		if ModuleCache.AppData.Const_App_Name ~= "AQMJ" then
			for i = 1, #AppData.AQMJ_Only_Have_AppGameName do
				if gameId == AppData.AQMJ_Only_Have_AppGameName[i] then
					return false
				end
			end
		end
		return true
	end
end

function JoinRoomModule:getRoomId()
	return tonumber(self.strRoomNum)
end


return JoinRoomModule



