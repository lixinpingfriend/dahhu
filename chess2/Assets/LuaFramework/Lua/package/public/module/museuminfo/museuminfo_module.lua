






local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local MuseumInfoModule = class("museumInfoModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local UnityEngine = UnityEngine
local GameManager = ModuleCache.GameManager
local roundNums = {6, 8, 16}
local playerNums = {4, 3}
local masterCostStrs = { "亲友圈", "大赢家", "房费均摊" }
local consumeTypes = {"CONSUME_COIN", "CONSUME_COIN", "CONSUME_COIN"}
local dissolveRoomTime ={[0]=120,[1]=180,[2]=300}
local PlayModeUtil = ModuleCache.PlayModeUtil
local PlayerPrefsManager = ModuleCache.PlayerPrefsManager


function MuseumInfoModule:initialize(...)
	-- 开始初始化                view        loginModel           模块数据
	ModuleBase.initialize(self, "museuminfo_view", nil, ...)
end



-- 模块初始化完成回调，包含了view，Model初始化完成
function MuseumInfoModule:on_module_inited()	

	for i=1,#self.view.settingToggles do
		self.view.settingToggles[i].onValueChanged:AddListener(function(isCheck)
		if(isCheck) then
			if i == 2 and not Util.checkNameUnlawful(self.view.inputFieldName.text) then
				self.view.settingToggles[1].isOn = true
				ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("名称不合法。")
			end
			self.view:refresh_master_panel(self.selectData)
		end
		end)
	end

	for i = 1, #self.view.powerCostToggles do
		self.view.powerCostToggles[i].onValueChanged:AddListener( function(isCheck)
			if (isCheck and self.isShow) then
				self:onPowerToggle(i)
				-- ModuleCache.ModuleManager.show_module("public", "museumcostpower", self:get_cost_power(i))

			end
		end )
	end
	
	for i = 1, #self.view.showQRCodeToggles do
		self.view.showQRCodeToggles[i].onValueChanged:AddListener( function(isCheck)
			if (isCheck and self.isShow) then
				-- 是否弹出二维码
				if i == 1 then
					if self.selectData.qrCodeImg and  self.selectData.qrCodeImg ~="" then
						self.qrCodeShow = 1
					else
						ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("请先在代理后台上传群二维码。")
						self.view.showQRCodeToggles[2].isOn = true;
						self.qrCodeShow = 0
					end
					
				elseif i == 2 then
					self.qrCodeShow = 0
				end
			end
		end )
	end

	for i = 1, #self.view.NewRoomToggles do
		self.view.NewRoomToggles[i].onValueChanged:AddListener( function(isCheck)
			if (isCheck and self.isShow) then
				self.openRoomType = i;
				self.view.sendData.museumData.openRoomType = i
			end
		end )
	end

	for i = 1, #self.view.PauseEnterToggles do
		self.view.PauseEnterToggles[i].onValueChanged:AddListener( function(isCheck)
			if (isCheck and self.isShow) then
				self.launchRoundStatus = i;
				self.view.sendData.museumData.launchRoundStatus = i
			end
		end )
	end

	for i = 1, #self.view.ScoreboardToggles do
		self.view.ScoreboardToggles[i].onValueChanged:AddListener( function(isCheck)
			if (isCheck and self.isShow) then
				self.showRankListType = i;
				self.view.sendData.museumData.showRankListType = i
			end
		end )
	end

	for i = 1, #self.view.ChatAuthToggles do
		self.view.ChatAuthToggles[i].onValueChanged:AddListener( function(isCheck)
			if (isCheck and self.isShow) then
				self.sendMsgType = i
				self.view.sendData.museumData.sendMsgType = i
			end
		end )
	end

	for i = 1, #self.view.ShowStyleToggles do
		self.view.ShowStyleToggles[i].onValueChanged:AddListener( function(isCheck)
			if (isCheck and self.isShow) then
				self.view.sendData.museumData.MuseumUs3D = i
			end
		end )
	end


	self.view.DissolveRoomToggle.onValueChanged:AddListener( function(isCheck)
		self.view.DissolveRoomDropdown.interactable = isCheck
		if isCheck then
			self.selectData.allowDissolveRoom =1
			self.view.sendData.museumData.allowDissolveRoom = 1
		else
			self.selectData.allowDissolveRoom = 0
			self.view.sendData.museumData.allowDissolveRoom = 0
		end

	end )

	self.view.DissolveRoomDropdown.onValueChanged:AddListener( function(value)
		self.selectData.allowDissolveRoomTime = dissolveRoomTime[value]
		self.view.sendData.museumData.allowDissolveRoomTime = dissolveRoomTime[value]
	end )

	self.view.InteractiveExpressionToggle.onValueChanged:AddListener( function(isCheck)

		if isCheck then
			self.selectData.allowInteractiveExpression = 1
			self.view.sendData.museumData.allowInteractiveExpression = 1
		else
			self.selectData.allowInteractiveExpression = 0
			self.view.sendData.museumData.allowInteractiveExpression = 0
		end
	end )

	self.view.PreventionCheatToggle.onValueChanged:AddListener( function(isCheck)

		if isCheck and self.isShow then
			ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common("您确定开启防作弊吗？开启后玩家\n在房间列表以及牌局内都看不到真实头像和昵称，结算的时候会显示真实头像和昵称。", function()
				self.preventionCheat = 1
				self.view.sendData.museumData.preventionCheat = 1
			end, function()
				self.view.PreventionCheatToggle.isOn = false
			end)
		else
			self.preventionCheat = 0
			self.view.sendData.museumData.preventionCheat = 0
		end
	end )

	self.view.OffLineFengTingToggle.onValueChanged:AddListener( function(isCheck)

		if isCheck then
			self.selectData.tempSealoffStatus = 1
			self.view.sendData.museumData.tempSealoffStatus = 1
		else
			self.selectData.tempSealoffStatus = 0
			self.view.sendData.museumData.tempSealoffStatus = 0
		end
	end )

	self.view.BalanceRechargeToggle.onValueChanged:AddListener( function(isCheck)

		if isCheck then
			self.selectData.banMemberCharge = 1
			self.view.sendData.museumData.banMemberCharge = 1
		else
			self.selectData.banMemberCharge = 0
			self.view.sendData.museumData.banMemberCharge = 0
		end
	end )

	self:subscibe_module_event("rulesetting", "not_get_parlor_cost", function(eventHead, eventData)
		self.view.settingToggles[1].isOn = false
		self.view.settingToggles[1].isOn = true
	end)
end


function MuseumInfoModule:get_round_data()
	for i=1,#self.modelData.AppGlobalConfig.consumeConfigs do
		local config = self.modelData.AppGlobalConfig.consumeConfigs[i]
		if(config.round == self.roundCount) then
			return config
		end
	end
	return nil
end

function MuseumInfoModule:onPowerToggle(i)

    -- 允许消耗体力
    if i == 1 then

        self.diamondCostVitality = 1;
        -- 不允许消耗体力
    elseif i == 2 then
        self.diamondCostVitality = 0;
    end
end

function MuseumInfoModule:get_cost_power(i)
	self.payType = i
	local powerData = 
	{	
		payNum = self.payNum,
		payType = self.payType,
		baseNum = self.baseNum,
		roundCount = self.roundCount,
		playerCount = self.playerCount,

	}

	ModuleCache.ModuleManager.show_module("public", "museumcostpower", powerData)
	return powerData
end

function MuseumInfoModule:refresh_cost_tips(index, isInit)
	self.payType = index
    self.view.sendData.museumData.payType = self.payType
	self.view.sendData.museumData.payNum = self.payNum

    for i = 1, #self.view.masterCostToggles do
        if i == index then
            self.view.masterCostTexts[i].text = string.format("%s(%d)", masterCostStrs[index], self.payNum)
        else
            self.view.masterCostTexts[i].text = string.format("%s", masterCostStrs[i])
        end

    end

end

-- 绑定module层的交互事件
function MuseumInfoModule:on_module_event_bind()

end

-- 绑定loginModel层事件，模块内交互
function MuseumInfoModule:on_model_event_bind()
	
end

function MuseumInfoModule:on_hide(intentData)
	self.isShow = false
end

function MuseumInfoModule:on_show(data)

	self.data = data
	self.createBox = data.createBox or false

	data = data.museumData or data

	if self.createBox then
		--self.view.settingToggles[1].isOn = false
		--self.view.settingToggles[1].isOn = true
		self._createAppGameName = AppData.get_app_and_game_name()
	else
		self._createAppGameName = nil
	end

	print_table(data)

	self.selectData = data
	self.selectData.isRuleOption = self.data.isRuleOption
	self.view.sendData =
	{
		showType = 3,
		museumData = TableUtil.copy_data(data),
		boxData = data.curBoxData,
		curBoxId = self.curBoxId,
		createBox = self.createBox,
		createAppGameName = self._createAppGameName
	}
	if data.curBoxData then
		self.curBoxId = data.curBoxData.boxId --  有包间id 是修改设置  没有包间id 是创建包间
		self.view.sendData.gameId = data.curBoxData.gameId
		--包间数据
		self.payType = data.curBoxData.payType
		self.payNum = data.curBoxData.payNum
		self.playerCount = data.curBoxData.playerCount
		self.roundCount = data.curBoxData.roundCount
	end

	self:get_user_data()


	--亲友圈数据
	self.memberCount = data.memberCount
	self.parlorNum = data.parlorNum
	self.diamondCostVitality = data.diamondCostVitality
	self.qrCodeShow = data.qrCodeShow
	self.showRankListType = data.showRankListType or 1
	self.sendMsgType = data.sendMsgType or 2
	self.openRoomType = data.openRoomType or 1
	self.launchRoundStatus = data.launchRoundStatus or 1
	self.preventionCheat = data.preventionCheat or 0

    -- 允许消耗体力
    if data.diamondCostVitality == 1 then
        self.view.powerCostToggles[1].isOn = true;
        self.view.powerCostToggles[2].isOn = false;
        -- 不允许消耗体力
    elseif data.diamondCostVitality == 0 then
        self.view.powerCostToggles[1].isOn = false;
        self.view.powerCostToggles[2].isOn = true;
    end
print("---------------------data.qrCodeShow:",data.qrCodeShow)
	 -- 强制弹出群二维码
    if data.qrCodeShow == 1 then
        self.view.showQRCodeToggles[1].isOn = true;
        self.view.showQRCodeToggles[2].isOn = false;
    elseif data.qrCodeShow == 0 then
        self.view.showQRCodeToggles[1].isOn = false;
        self.view.showQRCodeToggles[2].isOn = true;
    end


	for i = 1, #self.view.NewRoomToggles do
		self.view.NewRoomToggles[i].isOn = self.openRoomType == i
	end

	for i = 1, #self.view.PauseEnterToggles do
		self.view.PauseEnterToggles[i].isOn = self.launchRoundStatus == i
	end

	for i = 1, #self.view.ScoreboardToggles do
		self.view.ScoreboardToggles[i].isOn = self.showRankListType == i
	end

	for i = 1, #self.view.ChatAuthToggles do
		self.view.ChatAuthToggles[i].isOn = self.sendMsgType == i
	end

	self.view.sendData.museumData.MuseumUs3D = PlayerPrefsManager.GetInt("MuseumUs3D",-1) --  -1 玩家没有设置样式 ， 1 2d ， 2 3d
	if self.view.sendData.museumData.MuseumUs3D == -1 then
		self.view.sendData.museumData.MuseumUs3D = self.modelData.roleData.parlorStyleType
	end

	for i = 1, #self.view.ShowStyleToggles do
		self.view.ShowStyleToggles[i].isOn = self.view.sendData.museumData.MuseumUs3D == i
	end



	--允许牌局解散房间
	self.view.DissolveRoomToggle.isOn = self.selectData.allowDissolveRoom == 1
	self.selectData.allowDissolveRoom =  self.selectData.allowDissolveRoom or 1
	self.view.sendData.museumData.allowDissolveRoom = self.selectData.allowDissolveRoom or 1

	local getIdx = function()
		self.selectData.allowDissolveRoomTime =  self.selectData.allowDissolveRoomTime or 120
		self.view.sendData.museumData.allowDissolveRoomTime = self.selectData.allowDissolveRoomTime or 120

		if not self.selectData.allowDissolveRoomTime then
			return 0
		end
		for i =1, #dissolveRoomTime do
			if self.selectData.allowDissolveRoomTime == dissolveRoomTime[i] then
				return i
			end
		end
		return 0
	end
	self.view.DissolveRoomDropdown.value = getIdx()

	self.view.DissolveRoomDropdown.interactable  = self.view.DissolveRoomToggle.isOn

	--允许互动表情
	self.view.InteractiveExpressionToggle.isOn = self.selectData.allowInteractiveExpression == 1
	--离线封停
	self.view.OffLineFengTingToggle.isOn = self.selectData.tempSealoffStatus == 1
	--余额充值
	self.view.BalanceRechargeToggle.isOn = self.selectData.banMemberCharge == 1

	self.selectData.allowInteractiveExpression =  self.selectData.allowInteractiveExpression or 1
	self.view.sendData.museumData.allowInteractiveExpression = self.selectData.allowInteractiveExpression or 1

	--防作弊
	self.view.PreventionCheatToggle.isOn = self.preventionCheat == 1

	self.isShow = true
	
	ModuleCache.ModuleManager.show_module("public", "rulesetting", self.view.sendData)
	ModuleCache.ModuleManager.hide_module("public", "rulesetting")
	self.view:refresh_view(data)
	
    self.view.ownRoomObj:SetActive(false)
    self.view.roomCard.text = self.modelData.roleData.cards
    self.view.powerText.text = self.modelData.roleData.coins
    self.view.moreShow:SetActive(false)

	if self.selectData.playRule == "" and (self.selectData.playerRole == "OWNER" or self.selectData.playerRole == "ADMIN") then
		ModuleCache.ModuleManager.show_public_module("alertdialog"):show_center_button("请您先对亲友圈消耗方式、消耗数量、玩法规则进行设置，完成后“保存设置”即可体验亲友圈。", nil)
	end

	if self.data and self.data.isRuleOption then
		self.view.UIStateSwitcher:SwitchState("BoxRuleOption")
		self.view.settingToggles[2].isOn = false
		self.view.settingToggles[2].isOn = true

		self.view:refresh_master_panel(self.selectData)
	end
end

function MuseumInfoModule:CloseMuseumInfo()
	-- 如果创建包间的时候，没有保存而是返回了，需要还原AppGameName
	if self._createAppGameName then
		ModuleCache.GameManager.change_game_by_gameName(self._createAppGameName, true)
	end
	self.isShow = false
	ModuleCache.ModuleManager.hide_module("public", "museuminfo")
	ModuleCache.ModuleManager.destroy_module("public", "rulesetting")

end

function MuseumInfoModule:on_click(obj, arg)
	print(obj.name)
	ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
	if obj.name == "ImageBack" or obj.name == "ButtonClose" then
		if  self.data.boxNum and self.data.boxNum <1 then
			ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common("您尚未保存玩法，返回后将会保存默认的玩法，是否继续", function()
				self:dispatch_module_event("chessmuseum","Event_Save_Data",{data = self.selectData, isUniversalSet = false})
				self:CloseMuseumInfo()
				PlayerPrefsManager.SetInt("MuseumUs3D", self.view.sendData.museumData.MuseumUs3D)
			end, nil)
		else
			self:CloseMuseumInfo()
		end

	elseif(obj.name == "ButtonAdd") then
		self.selectData.type = 3
		ModuleCache.ModuleManager.show_module("public", "share", self.selectData)
	elseif(obj.name == "RoomCard") then
		ModuleCache.ModuleManager.show_module("public", "shop", 5)
	elseif(obj.name == "ButtonExit") then
		ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common_image_tex({
			topTex = "您确定要退出以下亲友圈吗？\n（退出后不能再加入该亲友圈牌局）",
			rightTex1 = "圈名："..self.selectData.parlorName_orginal ,
			rightTex2 = "圈号：0".. self.selectData.orginalParlorNum,
			headImg = self.selectData.parlorLogo_orginal
		}, function()
			self:exit_museum()
		end)
	elseif(obj.name == "ButtonNext") then
		if self.selectData.playerRole ~= "OWNER" and self.selectData.playerRole ~= "ADMIN" then
			if self.view.sendData.museumData.MuseumUs3D ~= PlayerPrefsManager.GetInt("MuseumUs3D",-1) then
				PlayerPrefsManager.SetInt("MuseumUs3D",self.view.sendData.museumData.MuseumUs3D)
				if self.view.sendData.museumData.MuseumUs3D == 2 then
					ModuleCache.TalkingDataMgr().setEvent("Museum_UI_Type_3D", {data = 1})
				else
					ModuleCache.TalkingDataMgr().setEvent("Museum_UI_Type_2D", {data = 1})
				end

				ModuleCache.ModuleManager.destroy_module("public", "chessmuseum")
				ModuleCache.ModuleManager.show_module("public", "chessmuseum",{callback = function()
					self:CloseMuseumInfo()
				end})
			else
				self:CloseMuseumInfo()
			end
		else
			--self.view.settingToggles[2].isOn = false
			--self.view.settingToggles[2].isOn = true
			self.view.sendData.museumData.parlorName = string.match(self.view.inputFieldName.text,"%s*(.-)%s*$")
			self.view.sendData.museumData.wechatNumber = string.match( self.view.inputFieldWXNum.text,"%s*(.-)%s*$")
			self:dispatch_module_event("chessmuseum","Event_Save_Data",{data = self.view.sendData.museumData, isUniversalSet = true})
		end

    elseif(obj.name == "moreShow" or obj.name == "bgShop") then
        ModuleCache.ModuleManager.show_module("public", "shop", { showpage = 2, isUsedDefault = true })
    elseif(obj.name == "ButtonMore") then
        self.view.moreShow:SetActive(not self.view.moreShow.activeSelf)
	elseif(obj.name == "ButtonEditor_ID") then
		if tonumber(self.modelData.roleData.userID) == tonumber(self.view.inputFieldID.text) then
			ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("该玩家已是圈主！")
		else
			self:get_user_info(self.view.inputFieldID.text)
		end

	end
end

function MuseumInfoModule:get_user_info(userID)
	print("---------------userID:",userID)
	if userID == nil or userID == "" then
		ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("请先输入玩家ID")
		return
	end

	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "user/info?",
		showModuleNetprompt = true,
		params = {
			uid = userID,
		},
		cacheDataKey = "user/info?uid=" .. userID,
		cacheDataImmediatelyCallback = true,
	}

	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		if(retData.success) then
			if retData.data then
				ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common_image_tex({
					topTex = "您确定将亲友圈转让给以下玩家吗？",
					rightTex1 = retData.data.nickname ,
					rightTex2 = "ID：".. retData.data.userId,
					headImg = retData.data.headImg
				}, function()
					self:change_museum_owner(userID)
				end)
			end
		else
			if  retData.errMsg then

			end
		end
	end, function(wwwErrorData)
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

function MuseumInfoModule:change_museum_owner(userID)
	print("---------------userID:",userID)
	if userID == nil or userID == "" then
		ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("请先输入玩家ID")
		return
	end

	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/list/changeParlorOwnerUid?",
		showModuleNetprompt = true,
		params = {
			uid = self.modelData.roleData.userID,
			ownerUid = userID,
			parlorId = self.selectData.id

		}
	}
	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		if(retData.success) then
			ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("亲友圈转让成功！")
			ModuleCache.ModuleManager.hide_module("public", "museuminfo")
			self:dispatch_module_event("joinroom_to_chessmuseum","Update_User_Parlor_List")
		else
			if  retData.errMsg then

			end
		end
	end, function(wwwErrorData)
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

function MuseumInfoModule:exit_museum()
	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/member/exit?",
		params = {
			uid = self.modelData.roleData.userID,
			parlorId = self.selectData.orginalParlorId,
		}
	}
	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		if(retData.success) then
			ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(string.format("退出%s成功！",AppData.MuseumName))
			local data =
			{
				toNotice = false,
				showMsg = false,
				parlorNum = self.parlorNum,
			}
			self:dispatch_module_event("chessmuseum", "Event_Update_Notice", data)
		elseif(retData.errMsg) then
			ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.errMsg)
		end
	end, function(wwwErrorData)
        print(wwwErrorData.error)
		ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(string.format("退出%s失败！",AppData.MuseumName))
	end)
end

function MuseumInfoModule:get_user_data()
	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "msg/getNewMsg?",
		--showModuleNetprompt = true,
		params = {
			uid = self.modelData.roleData.userID,
		}
	}
	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		if(retData.success) then
			self.view:update_user_data(retData.data)
		end
	end, function(wwwErrorData)
        print(wwwErrorData.error)
	end)
end


return MuseumInfoModule



