






local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local MuseumFellowShipModule = class("museumFellowShipModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local UnityEngine = UnityEngine


function MuseumFellowShipModule:initialize(...)
	ModuleBase.initialize(self, "museumFellowShip_view", nil, ...)
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function MuseumFellowShipModule:on_module_inited()

	for i = 1, #self.view.playerFilterToggles do
		self.view.playerFilterToggles[i].onValueChanged:AddListener(function(isCheck)
			if isCheck then
				--0今天 1前天 2昨天 3最近30天 4上个月
				if i == 3 then
					self.MembersFilterType = 0
				elseif i == 4 or i == 5 then
					self.MembersFilterType = i-1
				else
					self.MembersFilterType  = i
				end

				self:getFellowshipMembers()
			end

		end)
	end

	for i = 1, #self.view.dataFilterToggles do
		self.view.dataFilterToggles[i].onValueChanged:AddListener(function(isCheck)
			if isCheck then
				--0今天 1前天 2昨天 3最近30天 4上个月
				if i == 3 then
					self.DataFilterType = 0
				elseif i == 4 or i == 5 then
					self.DataFilterType = i-1
				else
					self.DataFilterType  = i
				end

				self:getFellowshipParlorData()
			end

		end)
	end

	self.view.museumDropdown.onValueChanged:AddListener(function(value)
		self:getFellowshipMembers()
	end)

end



-- 绑定module层的交互事件
function MuseumFellowShipModule:on_module_event_bind()
	--self:subscibe_module_event("jPush_manager","jPush_recv_msg",function( eventHead, eventData )
	--	print_table(eventData, "-------------------jPush_recv_msg----"..eventData.type)
	--	if not eventData.message or eventData.message == "" then
	--		return
	--	end
    --
	--	local roomInfo = ModuleCache.Json.decode(eventData.message)
    --
	--	if eventData.type == "parlor_fellowship_invite" then
	--		--同意联谊邀请
    --
	--	end
    --
    --
	--end)

	self:subscibe_module_event("museumfellowship","Update_FellowShipMembers",function( eventHead, eventData )-- 调整成员归属通知
		self:getFellowshipMembers()
	end)
end


--initiatorParlorId :发起联谊 圈id	orginalParlorId:原始圈id		masterParlorId: 联谊虚拟圈id
function MuseumFellowShipModule:on_show(data)
	self.view:hide()
	self.museumData = data
	self.view.noFellowShipObj:SetActive( self.museumData.fellowshipType == 0)
	self.view.haveFellowShipObj:SetActive( self.museumData.fellowshipType ~= 0)
	self.view.memberBtnObj:SetActive( self.museumData.fellowshipType ~= 0)
	self.view.msgBtnObj:SetActive( self.museumData.fellowshipType ~= 0)

	if self.museumData.fellowshipType == 0 then--(integer, optional): 亲友圈类型 0普通 1联谊虚拟圈 2联谊发起圈 3联谊副圈 ,
		self:pageInviteOnPendingReceive()
	else
		self:getParlorByIdList()

		self.sortType = 4
		self.view.roundSortIcon.rotation = Vector3(0,0,0)
		self.view.winerSortToggle.isOn = false
		self.view.roundSortToggle.isOn = true

		self:getFellowshipMembers()
		self:getFellowshipParlorData()
		print_table(self.museumData,"~~~~~~~~~~~~~~~~~~~~~~")
		self.view.dissBtnObj:SetActive(self.museumData.initiatorParlorId == self.museumData.orginalParlorId)
		self.view.quitBtnObj:SetActive(self.museumData.initiatorParlorId ~= self.museumData.orginalParlorId)
	end

	print("@@@@@@@@@@@@@@@@self.museumData.initiatorParlorId:",self.museumData.initiatorParlorId,
	"############self.museumData.orginalParlorId:",self.museumData.orginalParlorId,"$$$$$$$$$$$self.museumData.masterParlorId",self.museumData.masterParlorId)
end


function MuseumFellowShipModule:on_click(obj, arg)
	print(obj.name)
	ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
	if obj.name == "ImageBack" then
		ModuleCache.ModuleManager.hide_module("public", "museumfellowship")

	elseif obj.name == "helpBtn" then
		self.view.helpObj:SetActive(true)
	elseif obj.name == "closeBtn_help" then
		self.view.helpObj:SetActive(false)

	elseif obj.name == "LoadMoreInvitationBtn" then
		self.invitData.currentPage = self.invitData.currentPage +1
		self:pageInviteOnPendingReceive(true)

	elseif obj.name == "loadPlayerBtn" then
		self.invitData.currentPage = self.invitData.currentPage +1
		self:getFellowshipMembers(true)

	elseif obj.name == "createBtn" then
		ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common("<size=48>您确定发起联谊活动？</size>\n<size=36>(为了更好了解联谊，请先查看联谊说明)</size>", function()
			ModuleCache.ModuleManager.show_module("public", "joinroom",{mode =9,callback =function(receiveParlorId)
				self:invitation(receiveParlorId)
			end})
		end, nil)
	elseif obj.name == "addMuseum" then
		ModuleCache.ModuleManager.show_module("public", "joinroom",{mode =9,callback =function(receiveParlorId)
			self:invitation(receiveParlorId)
		end})
	elseif obj.name == "agreeBtn" or obj.name == "refuseBtn" then
		local array = string.split(obj.gameObject.transform.parent.name, "_")
		local data = self.invitData.list[tonumber(array[2]) ]
		local auditSuccess = 1
		if obj.name == "refuseBtn" then
			auditSuccess = 0
		end
		self:auditInvit(data.id, auditSuccess)
	elseif obj.name == "quitBtn" then
		ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common("您确定要退出联谊吗？", function()
			self:exitFellowship()
		end, nil)
	elseif obj.name == "dissBtn" then
		ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common("您确定要解散联谊吗？", function()
			self:dissFellowship()
		end, nil)
	elseif obj.name == "bigWinerBtn" then --self.sortType or 4,--排序字段 1大赢家升序 2大赢家降序 3桌数升序 4桌数降序
		if not self.view.winerSortToggle.isOn then
			self.sortType = 2
			self.view.winerSortIcon.rotation = Vector3(0,0,0)
		else
			if self.sortType == 2 then
				self.sortType = 1
				self.view.winerSortIcon.rotation = Vector3(0,0,180)
			elseif self.sortType == 1 then
				self.sortType = 2
				self.view.winerSortIcon.rotation = Vector3(0,0,0)
			end
		end

		self.view.winerSortToggle.isOn = true
		self:getFellowshipMembers()

	elseif obj.name == "RoundNumBtn" then --self.sortType or 4,--排序字段 1大赢家升序 2大赢家降序 3桌数升序 4桌数降序
		if not self.view.roundSortToggle.isOn then
			self.sortType = 4
			self.view.roundSortIcon.rotation = Vector3(0,0,0)
		else
			if self.sortType == 4 then
				self.sortType = 3
				self.view.roundSortIcon.rotation = Vector3(0,0,180)
			elseif self.sortType == 3 then
				self.sortType = 4
				self.view.roundSortIcon.rotation = Vector3(0,0,0)
			end
		end

		self.view.roundSortToggle.isOn = true
		self:getFellowshipMembers()

	elseif obj.name == "playerSearchBtn" then
		self:getFellowshipMembers()
	elseif obj.name == "totalData" then
		local array = string.split(obj.gameObject.transform.parent.name, "_")
		local data = self.view.dataList[tonumber(array[2]) ]

		if not data.isCheckDay then
			data.isCheckDay = true
			self:getFellowshipParlorDayData(data)
			data.item.dataInfoParent:SetActive(true)
			data.item.contentSizeFitter:SetLayoutVertical()
			data.item.openIcon.localScale = Vector3.New(1, -1, 1)
		else
			data.isCheckDay = false
			data.item.dataInfoParent:SetActive(false)
			data.item.openIcon.localScale = Vector3.New(1, 1, 1)

			local setPosEnd = function()
				--Yield(0)
				--Yield(0)
				--Yield(0)
				WaitForEndOfFrame()
				--WaitForSeconds(1.1)
				if not self.isDestroy then
					--data.item.contentSizeFitter_dataInfo:SetLayoutVertical()
					--data.item.verticalLayoutGroup_dataInfo:SetLayoutVertical()
					data.item.contentSizeFitter_dataInfo.enabled = false
					data.item.contentSizeFitter_dataInfo.enabled = true
					data.item.verticalLayoutGroup_dataInfo.enabled = false
					data.item.verticalLayoutGroup_dataInfo.enabled = true
					WaitForEndOfFrame()
					--data.item.contentSizeFitter:SetLayoutVertical()
					--data.item.verticalLayoutGroup:SetLayoutVertical()
					data.item.contentSizeFitter.enabled = false
					data.item.contentSizeFitter.enabled = true
					data.item.verticalLayoutGroup.enabled = false
					data.item.verticalLayoutGroup.enabled = true
					WaitForEndOfFrame()
					--self.view.contentSizeFitter_fellowShip:SetLayoutVertical()
					--self.view.verticalLayoutGroup_fellowShip:SetLayoutVertical()
					self.view.contentSizeFitter_fellowShip.enabled = false
					self.view.contentSizeFitter_fellowShip.enabled = true
					self.view.verticalLayoutGroup_fellowShip.enabled = false
					self.view.verticalLayoutGroup_fellowShip.enabled = true
				end
			end
			self:start_unity_coroutine(setPosEnd)
		end
	elseif obj.name == "groupBtn" then
		local array = string.split(obj.gameObject.transform.parent.name, "_")
		local data = self.view.memberList[tonumber(array[2]) ]

		if self.museumData.playerRole == "OWNER" or self.museumData.playerRole == "ADMIN" then
			if tonumber(self.modelData.roleData.userID) ~= tonumber(data.uid)  then
				--parlorUserType (integer, optional): 0圈主 1管理员 2圈友 ,
				if data.parlorUserType == 2 or (data.parlorUserType == 1 and self.museumData.playerRole == "OWNER") then

					data.headImg = ModuleCache.ComponentManager.GetComponentWithPath(obj.transform.parent.gameObject,"Avatar/Image", "UnityEngine.UI.Image").sprite
					ModuleCache.ModuleManager.show_module("public", "museummembersinfo", {
						museumData = self.museumData,
						showType = "fellowShip",-- normal 正常亲友圈的成员管理 ，fellowShip 联谊圈的成员管理
						curMemberData = data,
						callback = function()

						end
					})
				else
					ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("权限不够，不能对管理员进行标记。")
				end
			else
				ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("不能对自己进行标记。")
			end
		end


	elseif obj.name == "checkRecordBtn" then
		local array = string.split(obj.gameObject.transform.parent.name, "_")
		local data = self.view.memberList[tonumber(array[2]) ]

		local initData = {}
		initData.museumData = self.museumData
		initData.playerId = data.uid
		initData.parlorId = data.masterParlorId
		ModuleCache.ModuleManager.show_module("public","gamehistory",initData)

	elseif obj.name == "historyBtn" then
		ModuleCache.ModuleManager.show_module("public","museumfellowshiphistory",self.museumData)
	elseif obj.name == "msgBtn" then
		ModuleCache.ModuleManager.show_module("public","museumfellowshipmsg",self.museumData)

	elseif obj.name == "memberBtn" then
		self.museumData.isFellowShipOpen = true
		ModuleCache.ModuleManager.show_module("public","museummembers",self.museumData)

	elseif obj.name == "kickBtn" then
		ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common("您确定要将该亲友圈踢出联谊吗？", function()
			local array = string.split(obj.gameObject.transform.parent.name, "_")
			local data = self.view.museumList[tonumber(array[2]) ]
			self:exitFellowship(data.parlorId)
		end, nil)
	end
end


function MuseumFellowShipModule:on_hide(data)
	self.invitData = nil
end

function MuseumFellowShipModule:on_destroy()
	self.invitData = nil
end

--获取被邀请联谊列表
function MuseumFellowShipModule:pageInviteOnPendingReceive(isloadMore)
	local curPageNum = 1
	if self.invitData and self.invitData.currentPage then
		curPageNum = self.invitData.currentPage
	end

	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/fellowship/pageInviteOnPendingReceive?",
		showModuleNetprompt = true,
		params = {
			uid = self.modelData.roleData.userID,
			parlorId = self.museumData.id,
			pageNum = curPageNum
		}
	}
	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		if (retData.success) then

			if isloadMore and self.invitData then
				for i =1, #retData.data.list do
					table.insert(self.invitData.list,#self.invitData.list +1, retData.data.list[i])
				end
			else
				self.invitData = retData.data
			end

			self.view:show()
			self.view:initLoopScrollViewList_invit(self.invitData)

		end
	end, function(wwwErrorData)
		print(wwwErrorData.error)
	end)
end

--发送联谊邀请
function MuseumFellowShipModule:invitation(receiveParlorId)
	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/fellowship/invitation?",
		showModuleNetprompt = true,
		params = {
			uid = self.modelData.roleData.userID,
			sourceParlorId = self.museumData.initiatorParlorId or self.museumData.id,
			receiveParlorId = receiveParlorId
		},
	}

	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		if (retData.success) then
			ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("发送邀请成功")
		end
	end, function(wwwErrorData)
		print(wwwErrorData.error)
	end)
end

--审核联谊邀请
function MuseumFellowShipModule:auditInvit(invitId,auditSuccess)-- invitId:审核记录id     auditSuccess:1审核通过 0拒绝
	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/fellowship/auditInvit?",
		showModuleNetprompt = true,
		params = {
			uid = self.modelData.roleData.userID,
			id = invitId,
			auditSuccess = auditSuccess
		},
	}

	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		if (retData.success) then
			if auditSuccess == 1 then
				--ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("加入联谊成功，楼层玩法已更改为发起方玩法。")
				ModuleCache.ModuleManager.hide_module("public", "museumfellowship")
				self:dispatch_module_event("chessmuseum", "Event_Update_Notice")
			else
				self:pageInviteOnPendingReceive(false)
			end

		end
	end, function(wwwErrorData)
		print(wwwErrorData.error)
	end)
end

--联谊中批量获取亲友圈
function MuseumFellowShipModule:getParlorByIdList()
	local parlorIdListStr = ""
	for i=1,#self.museumData.fellowshipParlorList  do
		if i ~= #self.museumData.fellowshipParlorList  then
			parlorIdListStr =parlorIdListStr.. self.museumData.fellowshipParlorList [i].slaveParlorId..","
		else
			parlorIdListStr =parlorIdListStr.. self.museumData.fellowshipParlorList [i].slaveParlorId
		end

	end

	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/list/getParlorByIdList?",
		showModuleNetprompt = true,
		params = {
			uid = self.modelData.roleData.userID,
			parlorIdList = parlorIdListStr
		},
	}

	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		if (retData.success) then
			self.view:show()
			 -- 当前圈是发起圈
			self.view:initLoopScrollViewList_museum(retData.data,self.museumData)
		end
	end, function(wwwErrorData)
		print(wwwErrorData.error)
	end)
end

--退出联谊
function MuseumFellowShipModule:exitFellowship(_parlorId) -- _parlorId :nil 退出   否则为发起方踢出其他圈
	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/fellowship/exitFellowship?",
		showModuleNetprompt = true,
		params = {
			uid = self.modelData.roleData.userID,
			parlorId = _parlorId or self.museumData.orginalParlorId
		},
	}

	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		if (retData.success) then
			self:dispatch_module_event("chessmuseum", "Event_Update_Notice")
			if not _parlorId then
				ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("退出联谊成功")
				ModuleCache.ModuleManager.hide_module("public", "museumfellowship")

			else
				for i=1,#self.museumData.fellowshipParlorList  do
					if self.museumData.fellowshipParlorList[i].slaveParlorId ==  _parlorId then
						table.remove(self.museumData.fellowshipParlorList,i)
					end
				end
				
				ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("踢出联谊成功")
				self:getParlorByIdList()
			end

		end
	end, function(wwwErrorData)
		print(wwwErrorData.error)
	end)
end

-- 解散联谊
function MuseumFellowShipModule:dissFellowship()
	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/fellowship/dissFellowship?",
		showModuleNetprompt = true,
		params = {
			uid = self.modelData.roleData.userID,
			masterParlorId = self.museumData.masterParlorId
		},
	}
	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		if (retData.success) then
			ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("解散联谊成功")
			ModuleCache.ModuleManager.hide_module("public", "museumfellowship")
			self:dispatch_module_event("chessmuseum", "Event_Update_Notice")
		end
	end, function(wwwErrorData)
		print(wwwErrorData.error)
	end)
end

-- 获取联谊玩家数据
function MuseumFellowShipModule:getFellowshipMembers(isloadMore)

	local curPageNum = 1
	if self.membersData and self.membersData.currentPage then
		curPageNum = self.membersData.currentPage
	end

	--筛选亲友圈id  选所有亲友圈传nil
	local slaveParlorId = nil
	if self.view.museumList and tonumber(self.view.museumDropdown.value) > 0 then
		slaveParlorId = self.view.museumList[tonumber(self.view.museumDropdown.value)].parlorId
	end

	local playerId = nil
	if self.view.playerInput.text ~= "" and self.view.playerInput.text ~= 0 then
		playerId = self.view.playerInput.text
	end


	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/fellowship/getFellowshipMembersData?",
		showModuleNetprompt = true,
		params = {
			uid = self.modelData.roleData.userID,
			parlorId = self.museumData.masterParlorId,
			playerId = playerId,
			dateType = self.MembersFilterType or 0,--0今天 1前天 2昨天 3最近30天 4上个月
			sortType = self.sortType or 4,--排序字段 1大赢家升序 2大赢家降序 3桌数升序 4桌数降序
			slaveParlorId =  slaveParlorId,--筛选亲友圈id  选所有亲友圈传nil
			pageNum = curPageNum,
			pageSize =20
		}
	}
	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		if (retData.success) then
			self.view.playerInput.text = ""

			if isloadMore and self.membersData then
				for i =1, #retData.data.list do
					table.insert(self.membersData.list,#self.membersData.list +1, retData.data.list[i])
				end
			else
				self.membersData = retData.data
			end

			self.view:initLoopScrollViewList_Member(self.membersData)

		end
	end, function(wwwErrorData)
		print(wwwErrorData.error)
	end)
end

--获取联谊数据
function MuseumFellowShipModule:getFellowshipParlorData()
	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/fellowship/getFellowshipParlorData?",
		showModuleNetprompt = true,
		params = {
			uid = self.modelData.roleData.userID,
			masterParlorId = self.museumData.masterParlorId,
			dateType = self.DataFilterType or 0 --0今天 1前天 2昨天 3最近30天 4上个月
		},
	}
	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		if (retData.success) then
			self.view:initLoopScrollViewList_Data(retData.data.list)
		end
	end, function(wwwErrorData)
		print(wwwErrorData.error)
	end)
end

--获取联谊数据每日详情
function MuseumFellowShipModule:getFellowshipParlorDayData(data)
	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/fellowship/getFellowshipParlorDayData?",
		showModuleNetprompt = true,
		params = {
			uid = self.modelData.roleData.userID,
			masterParlorId = self.museumData.masterParlorId,
			dateType = self.DataFilterType or 0, --0今天 1前天 2昨天 3最近30天 4上个月
			parlorId = data.slaveParlorId,
			pageNum = 1
		},
	}
	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		if (retData.success) then
			self.view:initLoopScrollViewList_dayData(retData.data.list,data.item)
			local setPosEnd = function()
				--Yield(0)
				--Yield(0)
				--Yield(0)
				WaitForEndOfFrame()
				--WaitForSeconds(1.1)
				if not self.isDestroy then
					--data.item.contentSizeFitter_dataInfo:SetLayoutVertical()
					--data.item.verticalLayoutGroup_dataInfo:SetLayoutVertical()
					data.item.contentSizeFitter_dataInfo.enabled = false
					data.item.contentSizeFitter_dataInfo.enabled = true
					data.item.verticalLayoutGroup_dataInfo.enabled = false
					data.item.verticalLayoutGroup_dataInfo.enabled = true
					WaitForEndOfFrame()
					--data.item.contentSizeFitter:SetLayoutVertical()
					--data.item.verticalLayoutGroup:SetLayoutVertical()
					data.item.contentSizeFitter.enabled = false
					data.item.contentSizeFitter.enabled = true
					data.item.verticalLayoutGroup.enabled = false
					data.item.verticalLayoutGroup.enabled = true
					WaitForEndOfFrame()
					--self.view.contentSizeFitter_fellowShip:SetLayoutVertical()
					--self.view.verticalLayoutGroup_fellowShip:SetLayoutVertical()
					self.view.contentSizeFitter_fellowShip.enabled = false
					self.view.contentSizeFitter_fellowShip.enabled = true
					self.view.verticalLayoutGroup_fellowShip.enabled = false
					self.view.verticalLayoutGroup_fellowShip.enabled = true
				end
			end
			self:start_unity_coroutine(setPosEnd)

		end
	end, function(wwwErrorData)
		print(wwwErrorData.error)
	end)
end

return MuseumFellowShipModule



