






local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local MuseumMembersInfoModule = class("museumMembersInfoModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local UnityEngine = UnityEngine
local GameManager = ModuleCache.GameManager
local CSmartTimer = ModuleCache.SmartTimer.instance

local grapString = {"","A组","B组","C组","封停","D组","E组","F组","G组","H组"}

function MuseumMembersInfoModule:initialize(...)
	-- 开始初始化                view        loginModel           模块数据
	ModuleBase.initialize(self, "museummembersinfo_view", nil, ...)
end

-- 模块初始化完成回调，包含了view，Model初始化完成

function MuseumMembersInfoModule:on_module_inited()
	-- 1 正常     2 A组    3 B组    4 C组    5 封停  6 D组  7 E     8 F     9 G     10 H
	for i=1,#self.view.tabToggles do
		self.view.tabToggles[i].onValueChanged:AddListener(function(isCheck)
			if(isCheck and self.initDone and self.curMemberData.groupNum ~= (i -1)) then
				if i == 5 then
					ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common(string.format("封停后该玩家不能再加入亲友圈房间，\n是否确定封停该玩家？"), function()
						self:change_userTab(i-1)
					end, function()
						self.view:setTabImg(self.curMemberData.groupNum)
					end)
				elseif i == 1 then --标记为正常
					self:change_userTab(i-1)

				else
					ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common(string.format("标记为同组的玩家不能加入同一个房间，\n是否将该玩家标记为%s？",grapString[i]), function()
						self:change_userTab(i-1)
					end, function()
						self.view:setTabImg(self.curMemberData.groupNum)
					end)

				end


			end
		end)
	end

	self.view.changeParlorDropdown.onValueChanged:AddListener(function(value)
		if value ~= self.changeParlorIdx then
			self:changeCurrentParlorId(value)
		end
	end)

	self.view.nameInput.onEndEdit:AddListener(function(str)
		self:changeComments()
	end)
end



-- 绑定module层的交互事件
function MuseumMembersInfoModule:on_module_event_bind()

end

-- 绑定loginModel层事件，模块内交互
function MuseumMembersInfoModule:on_model_event_bind()
	
end


function MuseumMembersInfoModule:on_show(data)
	self.initDone = false
	self.selectData = data.museumData
	self.curMemberData = data.curMemberData
	self.callback = data.callback

	self.curMemberData.playerRole = self.selectData.playerRole


	self.curParlorId = self.selectData.id
	if data.showType then
		if data.showType == "normal" then
			self.curParlorId = self.selectData.orginalParlorId
			self.curMemberData.playerRole = self.selectData.playerRole_orginal
		end
		self.view.stateSwitcher:SwitchState(data.showType)
	end

	self.view:refresh_view(self.curMemberData)

	self.initDone = true
end


--标记玩家类型
--data.groupNum  0 正常     1 A组    2 B组    3 C组    4 封顶
function MuseumMembersInfoModule:change_userTab(groupNum)
	local sealoffStr ="false"
	if (groupNum == 4) then
		sealoffStr = "true"
	end

	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/member/changeParlorUserSealOffAndGroupNum?",
		showModuleNetprompt = true,
		params = {
			uid = self.modelData.roleData.userID,
			playerId = self.curMemberData.uid,
			parlorId = self.curParlorId,
			sealOff = sealoffStr ,
			groupNum = groupNum

		}
	}
	print_table(requestData,"##########")
	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		if(retData.success) then
			if groupNum == 0 then
				ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(self.curMemberData.name.."已被取消标记。")
			else
				if groupNum == 4 then
					ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("封停成功： "..self.curMemberData.name.."已被禁止加入房间。")
				else
					ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("分组成功："..self.curMemberData.name.."已被添加到"..grapString[groupNum +1])
				end
			end


			self:dispatch_module_event("share", "Update_museumMembers")
			self:dispatch_module_event("museumfellowship", "Update_FellowShipMembers")
			self.view:setTabImg(groupNum)
			self.curMemberData.groupNum = groupNum

		end
	end, function(wwwErrorData)
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



function MuseumMembersInfoModule:on_click(obj, arg)
	print(obj.name)
	ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
	if obj.name == "BgMask" then
		ModuleCache.ModuleManager.hide_module("public", "museummembersinfo")
	elseif(obj.name == "ImageHead") then

		local parentName = obj.transform.parent.parent.parent.gameObject.name
		if(string.sub(parentName, 1, 4) == "item") then
			local array = string.split(parentName, "_")
			if self.isReduce then
				self:delete_member(tonumber(array[2]))
			else
				if self.selectData.playerRole == "OWNER" then
					local data = self.memberDataTab.members[tonumber(array[2]) -2 ]
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
	elseif(obj.name == "setButton") then
		self.view.setButton.interactable = false
		if self.kickedTimeId then
			CSmartTimer:Kill(self.kickedTimeId)
		end

		self.kickedTimeId = self:subscibe_time_event(1, false, 0):OnComplete(function(t)
			self.view.setButton.interactable = true
		end).id

		if self.curMemberData.parlorUserType == 2 then
			self:change_userType(self.curMemberData,1)
		elseif self.curMemberData.parlorUserType == 1 then
			self:change_userType(self.curMemberData,2)
		end

	elseif(obj.name == "removeBtn") then
		self.callback()
		ModuleCache.ModuleManager.hide_module("public", "museummembersinfo")


	elseif(obj.name == "colseDropDown") then
		self.view.changeParlorDropdown:Hide()
	elseif(obj.name == "historyBtn") then
		self:newInfo()
	elseif(obj.name == "historyClose") then
		self.view.historyPanel:SetActive(false)
	end
end

function MuseumMembersInfoModule:change_userType(data,parlorUserType) -- parlorUserType 1管理员 2圈友
	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/member/changeParlorUserType?",
		showModuleNetprompt = true,
		params = {
			parlorId = self.curParlorId,
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
				self.view.buttonText.text = "撤销管理员"
			elseif(parlorUserType == 2) then
				ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("您已取消"..data.name.."的管理员。")
				self.view.buttonText.text = "设为管理员"
			end

			self.view.adminObj:SetActive(parlorUserType == 1)
			self.curMemberData.parlorUserType = parlorUserType
			self:dispatch_module_event("share", "Update_museumMembers")
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

function MuseumMembersInfoModule:changeComments()
	if self.curMemberData.comments == self.view.nameInput.text  or self.view.nameInput.text == "" then
		ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("请输入有效的备注！")
		return
	end

	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/member/changeComments?",
		showModuleNetprompt = true,
		params = {
			parlorId = self.curParlorId,
			uid = self.modelData.roleData.userID,
			playerId = self.curMemberData.uid,
			comments =  self.view.nameInput.text,
		}
	}
	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		if(retData.success) then
			ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("备注修改成功！")
			--self.curMemberData.comments = self.view.nameInput.text
			self:dispatch_module_event("share", "Update_museumMembers")
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
					ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.message)
				end
			end
		end
	end)
end

function MuseumMembersInfoModule:changeCurrentParlorId(idx)
	if not self.parlorIdAll then
		self.parlorIdAll = string.split(self.curMemberData.allParlorId, ",")
	end

	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/fellowship/changeCurrentParlorId?",
		showModuleNetprompt = true,
		params = {
			uid = self.modelData.roleData.userID,
			playerId = self.curMemberData.uid,
			masterParlorId = self.curMemberData.masterParlorId ,
			currentParlorId =  tonumber(self.parlorIdAll[idx+1]),
		}
	}
	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		if(retData.success) then
			self.changeParlorIdx = idx
			ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("调整亲友圈成功")

			self:dispatch_module_event("museumfellowship", "Update_FellowShipMembers")
		else
			--self.view.changeParlorDropdown.value = self.changeParlorIdx or 0
		end
	end, function(wwwErrorData)
		--self.view.changeParlorDropdown.value = self.changeParlorIdx or 0
	end)
end

function MuseumMembersInfoModule:newInfo()
	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "user/newInfo?",
		showModuleNetprompt = true,
		params = {
			uid = self.modelData.roleData.userID,
			playerId = self.curMemberData.uid
		}
	}
	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		if(retData.success) then
			self.view.historyPanel:SetActive(true)
			self.view:image_load_sprite(self.view.headImg_history, retData.data.originalHeadImg )
			self.view.nickText_history.text = retData.data.originalNickname

			self.view:image_load_sprite(self.view.headImg_cur, retData.data.headImg)
			self.view.nickText_cur.text = retData.data.nickname
		end
	end, function(wwwErrorData)

	end)
end
return MuseumMembersInfoModule



