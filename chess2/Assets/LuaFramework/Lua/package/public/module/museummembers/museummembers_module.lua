






local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local MuseumMembersModule = class("museumMembersModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local CSmartTimer = ModuleCache.SmartTimer.instance


function MuseumMembersModule:initialize(...)
	-- 开始初始化                view        loginModel           模块数据
	ModuleBase.initialize(self, "museummembers_view", nil, ...)
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function MuseumMembersModule:on_module_inited()		
	for i=1,#self.view.settingToggles do
		self.view.settingToggles[i].onValueChanged:AddListener(function(isCheck)
		if(isCheck) then 
			self.view:refresh_view()
			if(i == 1) then
				self:get_data_list(self.selectData)
			elseif(i == 2) then
				self:get_check_list(self.selectData)
			elseif(i == 3) then
				self:get_user_record(self.selectData)
			end
		end
		end)
	end

	self.view.dropDown.onValueChanged:AddListener(function(idx)
		--_dropdown.value :0      1:
		self.memberDataTab = nil
		self:get_data_list(self.selectData)
	end )
end


-- 绑定module层的交互事件
function MuseumMembersModule:on_module_event_bind()
	self:subscibe_module_event("share","Update_museumMembers",function( eventHead, eventData )
		self.memberDataTab = nil
		self:get_data_list(self.selectData)
	end)
end

-- 绑定loginModel层事件，模块内交互
function MuseumMembersModule:on_model_event_bind()
	
end


--isFellowShipOpen == true 联谊界面右上角的入口打开
function MuseumMembersModule:on_show(data)
	self.selectData = data
	self.memberDataTab = nil

	-- TODO XLQ: 当前玩法是否打开标记功能
	self.openBiaoJi = true
	--local temp = string.split(AppData.get_url_game_name(), "_")[1]
	--for i =1, #openBiaoJiTab do
	--	if openBiaoJiTab[i] == temp then
	--		self.openBiaoJi = true
	--		break
	--	end
	--end

	local tempY = 0
	if self.openBiaoJi then
		tempY = 55*2
	end
	
	self.view.dropDown.template.sizeDelta = Vector2.New(self.view.dropDown.template.sizeDelta.x, 120+tempY )

	self.view.dropDown.value = 0
	self.view.inputField.text = ""

	if  not self.selectData.isFellowShipOpen then

		if self.selectData.playerRole_orginal == "OWNER" or self.selectData.playerRole_orginal == "ADMIN" then
			self.view.stateSwitcher:SwitchState("Owner")
		else
			self.view.stateSwitcher:SwitchState("Member")
		end

	else
		self.view.stateSwitcher:SwitchState("FellowShip")
		self.view.settingToggles[2].isOn = false
		self.view.settingToggles[3].isOn = false

	end

	local openIdx = 1
	--TODO XLQ 必须要在 self.memberDataTab = nil 之后调用
	if self.selectData.ApprovalMemberCount and self.selectData.ApprovalMemberCount > 0 and not self.selectData.isFellowShipOpen then
		openIdx = 2
	end

	self.view.settingToggles[openIdx].isOn = false
	self.view.settingToggles[openIdx].isOn = true
end

--function MuseumMembersModule:on_hide()
--	self.view:reset()
--end

function MuseumMembersModule:get_user_record(data)
	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/member/getParlorUserRecord?",
		showModuleNetprompt = true,
		params = {
			uid = self.modelData.roleData.userID,
			parlorId = self.selectData.orginalParlorId or self.selectData.id,
			gameName = self.selectData.gameId
		}
	}
	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		if(retData.success) then
			self.retData = retData.data
			self.view:initLoopScrollViewList(retData.data, self.selectData.playerRole_orginal,3)
		end
	end, function(wwwErrorData)
		print(wwwErrorData.error)
	end)
end

function MuseumMembersModule:get_check_list(data)
	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/member/getApprovalMember?",
		showModuleNetprompt = true,
		params = {
			uid = self.modelData.roleData.userID,
			parlorId = self.selectData.orginalParlorId or self.selectData.id,
		}
	}
	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		if(retData.success) then
			self.retData = retData.data
			self.view:initLoopScrollViewList(retData.data, self.selectData.playerRole_orginal,2)
		end
	end, function(wwwErrorData)
        print(wwwErrorData.error)
	end)
end

function MuseumMembersModule:get_data_list(data, isReduce,isloadMore)
	isReduce = isReduce or false
	self.isReduce = isReduce

	--if self.memberDataTab ~= nil and not isloadMore then
	--	self.view:initLoopScrollViewList(self.memberDataTab, self.selectData.playerRole_orginal,1, isReduce)
	--	return
	--end

	local curPageNum = 1
	if self.memberDataTab and self.memberDataTab.currentPage then
		curPageNum = self.memberDataTab.currentPage
	end

	local _parlorId = self.selectData.orginalParlorId
	local url ="parlor/member/getMembers?"
	if self.selectData.isFellowShipOpen then
		url = "parlor/fellowship/getParlorFellowshipMembers?"
		_parlorId = self.selectData.id
	end


	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. url,
		showModuleNetprompt = true,
		params = {
			uid = self.modelData.roleData.userID,
			parlorId = _parlorId,
			pageSize = 50,
			pageNum = curPageNum,
			keyword = self.view.inputField.text,
			queryType = self.view.dropDown.value,
		}
	}
	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		if(retData.success) then
			self.retData = retData.data

			if isloadMore and self.memberDataTab then
				for i =1, #retData.data.members do
					table.insert(self.memberDataTab.members,#self.memberDataTab.members +1, retData.data.members[i])
				end
			else
				self.memberDataTab = retData.data
			end

			self.requireTime = 0
			if self.timeId then
				CSmartTimer:Kill(self.timeId)
			end
			self.timeId = self:subscibe_time_event(3600, false, 0):OnUpdate(function(t)
				t = t.surplusTimeRound
				self.requireTime = self.requireTime +1
			end):OnComplete(function(t)

			end).id

			self.view:initLoopScrollViewList(self.memberDataTab, self.selectData.playerRole_orginal,1, isReduce,  self.selectData.isFellowShipOpen)
		end
	end, function(wwwErrorData)
        print(wwwErrorData.error)
	end)
end

function MuseumMembersModule:on_click(obj, arg)	
	print(obj.name)
	ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
	if obj.name == "closeBtn" then
		self:dispatch_module_event("chessmuseum", "Event_Update_OneChessMuseum")
		ModuleCache.ModuleManager.hide_module("public", "museummembers")
	elseif(obj.name == "ButtonReduce") then
		self:get_data_list(self.selectData, true)
	elseif(obj.name == "ButtonBack") then
		self:get_data_list(self.selectData)
	elseif(obj.name == "ButtonAdd") then
		self.selectData.type = 3
		ModuleCache.ModuleManager.show_module("public", "share", self.selectData)
	elseif(obj.name == "ImageHead") then

		local parentName = obj.transform.parent.parent.parent.gameObject.name
		if(string.sub(parentName, 1, 4) == "item") then
			local array = string.split(parentName, "_")
			if self.isReduce then
				self:delete_member(self.memberDataTab.members[tonumber(array[2] ) - 2] )
			else

				--圈主和管理员有添加和删除成员 索引从3开始
				local memberIdx = 0
				if self.selectData.playerRole_orginal == "OWNER" or self.selectData.playerRole_orginal == "ADMIN" then
					memberIdx = 2
				end

				local data = self.memberDataTab.members[tonumber(array[2]) -memberIdx ]
				
				if self.openBiaoJi then
					data.headImg = ModuleCache.ComponentManager.GetComponent(obj.gameObject, "UnityEngine.UI.Image").sprite
					if self.selectData.playerRole_orginal == "OWNER" or self.selectData.playerRole_orginal == "ADMIN" then
						if tonumber(self.modelData.roleData.userID) ~= tonumber(data.uid)  then
							--parlorUserType (integer, optional): 0圈主 1管理员 2圈友 ,
							if data.parlorUserType == 2 or (data.parlorUserType == 1 and self.selectData.playerRole_orginal == "OWNER") then
								local _showTyp = "normal"
								if self.selectData.isFellowShipOpen then -- normal 正常亲友圈的成员管理 ，fellowShip 联谊圈的成员管理
									_showTyp = "fellowShip"
								end

								--data.sealOff ~= 2 or data.sealOffSurplusSeconds  <= 0
								if data.sealOff == 2 and data.sealOffSurplusSeconds >0 then
									data.realityTime = data.sealOffSurplusSeconds - self.requireTime

									if data.realityTime <= 0 then
										data.realityTime = 0
									end
								end

								ModuleCache.ModuleManager.show_module("public", "museummembersinfo", {
									museumData = self.selectData,
									showType = _showTyp,-- normal 正常亲友圈的成员管理 ，fellowShip 联谊圈的成员管理
									curMemberData = data,
									callback = function()
										self:delete_member(data)
									end
								})
							else
								ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("权限不够，不能对管理员进行标记。")
							end
						else
							ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("不能对自己进行标记。")
						end
					end
				else
					if self.selectData.playerRole_orginal == "OWNER" then

						if tonumber(self.modelData.roleData.userID) ~= tonumber(data.uid)  then
							local confirmText = ""
							if data.parlorUserType == 2 then
								confirmText = "设为管理员"
							elseif data.parlorUserType == 1 then
								confirmText = "撤销管理员"
							end

							ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common_image_tex({
								topTex = "",
								rightTex1 = "昵称："..data.name ,
								rightTex2 = "ID：".. data.uid,
								headImg = data.headImg,
								confirmText = confirmText,
								cancelText = "取消",
							}, function()
								if data.parlorUserType == 2 then
									self:change_userType(data,1)
								elseif data.parlorUserType == 1 then
									self:change_userType(data,2)
								end

							end)
						end
					end
				end


			end

		end
	elseif(obj.name == "ButtonAgree") then
		local parentName = obj.transform.parent.parent.gameObject.name
		if(string.sub(parentName, 1, 4) == "item") then
			local array = string.split(parentName, "_")
			self:check_member(tonumber(array[2]), true)
			--self:validateApproval(tonumber(array[2]) )
		end
	elseif(obj.name == "ButtonRefuse") then
		local parentName = obj.transform.parent.parent.gameObject.name
		if(string.sub(parentName, 1, 4) == "item") then
			local array = string.split(parentName, "_")
			self:check_member(tonumber(array[2]), false)
		end
	elseif(obj.name == "loadButton") then
		self.memberDataTab.currentPage = self.memberDataTab.currentPage +1
		self:get_data_list(self.selectData, self.isReduce, true)
	elseif(obj.name == "SearchButton") then
		--if self.view.inputField.text ~= "" then
			self.memberDataTab = nil
			self:get_data_list(self.selectData)
		--else
		--	ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("请输入昵称或ID进行搜索")
		--end

	end
end

function MuseumMembersModule:change_userType(data,parlorUserType) -- parlorUserType 1管理员 2圈友
	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/member/changeParlorUserType?",
		showModuleNetprompt = true,
		params = {
			parlorId = self.selectData.orginalParlorId or self.selectData.id,
			uid = self.modelData.roleData.userID,
			playerId = data.uid,
			parlorUserType = parlorUserType,
		}
	}
	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		if(retData.success) then
			if(parlorUserType == 1) then
				ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("成功设置"..data.name.."为管理员。")
			elseif(parlorUserType == 2) then
				ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("您已取消"..data.name.."的管理员。")
			end
			self.memberDataTab = nil
			self:get_data_list(self.selectData)
		else
			if(parlorUserType == 1) then
				ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("管理员设置失败。")
			elseif(parlorUserType == 2) then
				ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("取消管理员失败。")
			end
		end
	end, function(wwwErrorData)
		-- print("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$",wwwErrorData.www.text)

		-- android  wwwErrorData.error = 500 Internal Server Error      ios = internal server error
		if tostring(wwwErrorData.error):find("500") ~= nil or tostring(wwwErrorData.error):find("error") ~= nil then
			if wwwErrorData.www.text then
				local retData = wwwErrorData.www.text
				retData = ModuleCache.Json.decode(retData)
				if retData.errMsg then
					retData = ModuleCache.Json.decode(retData.errMsg)
					ModuleCache.ModuleManager.show_public_module("alertdialog"):show_center_button(retData.message, function()
						print(retData.message)
					end)
				end
			end
		end
	end)
end

function MuseumMembersModule:check_member(index, agree)
	local data = self.view.checkList[index]
	local addstr = ""
	if(agree) then
		addstr = "agree=true&"
	else
		addstr = "agree=false&"
	end

	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/member/approvalMember?" .. addstr,
		showModuleNetprompt = true,
		params = {
			uid = self.modelData.roleData.userID,
			parlorId  = self.selectData.orginalParlorId or self.selectData.id,
			memberUid = data.uid,

		}
	}
	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		if(retData.success) then
			if(agree) then
				ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(data.name .. "加入了" .. AppData.MuseumName)
				self:dispatch_module_event("museummem","Updata_Coin_Show")--TODO XLQ:加入棋牌馆后刷新体力 （玩家已绑定其他代理，进入亲友圈需要扣除您%d体力）
			else
				ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("您拒绝了" .. data.name .. "的申请")
			end
			self:get_check_list(self.selectData)
		else
			self:get_check_list(self.selectData)
		end
	end, function(wwwErrorData)
		-- print("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$",wwwErrorData.www.text)

		-- android  wwwErrorData.error = 500 Internal Server Error      ios = internal server error
		 if tostring(wwwErrorData.error):find("500") ~= nil or tostring(wwwErrorData.error):find("error") ~= nil then
			if wwwErrorData.www.text then
				local retData = wwwErrorData.www.text
				retData = ModuleCache.Json.decode(retData)
				if retData.errMsg then
					retData = ModuleCache.Json.decode(retData.errMsg)
					ModuleCache.ModuleManager.show_public_module("alertdialog"):show_center_button(retData.message, function()
						print(retData.message)
					end)
				end
			end
		end
	end)
end

function MuseumMembersModule:delete_member(data)

	if self.selectData.playerRole_orginal == "ADMIN" and data.parlorUserType == 1 then -- 当前玩家是管理员
		ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("不允许删除管理员哦！")
		return
	end

	if(data.uid == self.memberDataTab.ownerId) then
		ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("不允许删除圈主哦！")
	else
		ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common("您确定要删除此成员吗？", function()
			local requestData = {
				baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/member/deleteMember?",
				showModuleNetprompt = true,
				params = {
					uid = self.modelData.roleData.userID,
					parlorId  = self.selectData.orginalParlorId or self.selectData.id,
					memberUid = data.uid
				}
			}
			self:http_get(requestData, function(wwwData)
				local retData = wwwData.www.text
				retData = ModuleCache.Json.decode(retData)
				if(retData.success) then
					self.memberDataTab = nil
					self:get_data_list(self.selectData)
				end
			end, function(wwwErrorData)
				print(wwwErrorData.error)
			end)

		end, nil)
	end
end

--圈主拉绑定了其他代理的玩家进圈时会  弹出二次确认框
function MuseumMembersModule:validateApproval(index)
	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/member/validateApproval?",
		showModuleNetprompt = true,
		params = {
			uid = self.modelData.roleData.userID,
			parlorId = self.selectData.orginalParlorId or self.selectData.id,
			memberUid = self.view.checkList[index].uid,

		}
	}
	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		if(retData.success) then
			if retData.data.validateResult == false then
				ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common(string.format( "该玩家已绑定其他代理，进入亲友圈需要扣除您%d体力\n赠送给该玩家，是否继续？",retData.data.amount), function()
					self:check_member(index, true)
				end,nil)
			else
				self:check_member(index, true)
			end
		end
	end, function(wwwErrorData)
		print(wwwErrorData.error)
	end)

end

return MuseumMembersModule



