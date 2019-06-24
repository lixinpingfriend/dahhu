






local require = require
local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")


---@class RuleSettingModule : Module
---@field ruleSettingView RuleSettingView
---@field view RuleSettingView
local RuleSettingModule = class("RuleSettingModule", ModuleBase)
-- 常用模块引用
local ModuleCache = ModuleCache
local UnityEngine = UnityEngine
local TableUtil = TableUtil
local TableManager = TableManager
local TableManagerPoker = TableManagerPoker
local CSmartTimer = ModuleCache.SmartTimer.instance

local PlayerPrefsManager = ModuleCache.PlayerPrefsManager
local masterCostTips = { "亲友圈", "大赢家", "房费均摊" }
---默认第一列的局数排列 麻将使用 选项上无对应json值时
local roundNums = { 4, 8, 16 }
local Config = require("package.public.config.config")
local AppData = AppData
local Input = UnityEngine.Input

local string = string


function RuleSettingModule:initialize(...)
	-- 开始初始化                view        loginModel           模块数据
	ModuleBase.initialize(self, "rulesetting_view", nil, ...)
	Input.multiTouchEnabled = false
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function RuleSettingModule:on_module_inited()
	for i=1,#self.view.masterCostToggles do
		self.view.masterCostToggles[i].onValueChanged:AddListener(function(isCheck)
			if(isCheck and  self.initSetCost) then
				if i ~= 1 then
					self:get_cost_power(i)--ModuleCache.ModuleManager.show_module("public", "museumcostpower", self:get_cost_power(i))
				else

					--设置圈主消耗 默认设置最低档
					self.oneDataNum = tonumber(string.split(self:get_round_data().coinNums, ",")[1])
					self.playerCount = self.view:get_player_count(self.wanfaType)

					if self.modelData.AppGlobalConfig.parlorChargingType == 1 then-- 以房间
						self.payNum = self.oneDataNum
					elseif self.modelData.AppGlobalConfig.parlorChargingType == 2 then--以人数
						self.payNum = self.oneDataNum * self.playerCount

						if self.isMjGame and self.playerCount == 2 then

							--self.modelData.AppGlobalConfig.twoPersonEqThree  1： 2人==3人      2： 2人 ~= 3人
							if not self.modelData.AppGlobalConfig.twoPersonEqThree or tonumber(self.modelData.AppGlobalConfig.twoPersonEqThree) == 1 then
								self.payNum = self.oneDataNum * 3
							else
								self.payNum = self.oneDataNum * 2
							end
						end

					end

					self.payType = 1
					self:refresh_cost_tips(self.payType)
				end

			end
		end)
	end

	self:subscibe_module_event("chessmuseumcostpower", "Event_Update_Power", function(eventHead, eventData)
		self.payNum = eventData
		self:refresh_cost_tips(self.payType)
	end)
end

function RuleSettingModule:get_cost_power(i)
	self.payType = i
	local powerData =
	{
		payNum = self.payNum,
		payType = self.payType,
		roundCount = self.view:get_round_data(self.wanfaType),
		playerCount = self.view:get_player_count(self.wanfaType),

	}
	print_table(powerData,"~~~get_cost_power~~~~~~~")

	ModuleCache.ModuleManager.show_module("public", "museumcostpower", powerData)
	return powerData
end

function RuleSettingModule:refresh_cost_tips(index, isInit)
	self.payType = index

	for i = 1, #self.view.masterCostToggles do
		if i == index then
			self.view.masterCostTexts[i].text = string.format("%s(%d)", masterCostTips[index], self.payNum)
		else
			self.view.masterCostTexts[i].text = string.format("%s", masterCostTips[i])
		end
	end
end

function RuleSettingModule:on_update()
	if self.showTip and Input.touchCount < 1 then
		self:hide_click_tip()
	end
	self.view:on_update()
end

-- 绑定module层的交互事件
function RuleSettingModule:on_module_event_bind()
	self:subscibe_module_event("chessmuseum", "Event_Save_Data", function(eventHead, eventData)

		self.parlorName = eventData.data.parlorName
        self.payType = eventData.data.payType
        self.payNum = eventData.data.payNum
        self.consumeType = eventData.data.consumeType

        self.diamondCostVitality = eventData.data.diamondCostVitality
		self.qrCodeShow = eventData.data.qrCodeShow
		self.wechatNumber = eventData.data.wechatNumber
		self.showRankListType = eventData.data.showRankListType
		self.sendMsgType = eventData.data.sendMsgType
		self.openRoomType = eventData.data.openRoomType
		self.launchRoundStatus = eventData.data.launchRoundStatus
		self.preventionCheat = eventData.data.preventionCheat

		self.allowDissolveRoom = eventData.data.allowDissolveRoom
		self.allowDissolveRoomTime = eventData.data.allowDissolveRoomTime
		self.allowInteractiveExpression = eventData.data.allowInteractiveExpression
		self.tempSealoffStatus = eventData.data.tempSealoffStatus
		self.banMemberCharge = eventData.data.banMemberCharge

		self.MuseumUs3D = eventData.data.MuseumUs3D
		if eventData.data.curBoxData and eventData.data.curBoxData.playRule then
			self.boxPlayRule_common = eventData.data.curBoxData.playRule
		end
        self:save_setting(eventData.isUniversalSet)
	end)


	self:subscibe_package_event("Event_Package_selectWanfaDone", function(eventHead, eventData)
		self.initSetCost = false
		local curSelectPlayMode = eventData
		local appName_temp
		if curSelectPlayMode.provinceId then
			appName_temp = ModuleCache.PlayModeUtil.getProvinceById(curSelectPlayMode.provinceId).appName
		end
		if appName_temp then
			appName_temp = appName_temp .. "_" .. curSelectPlayMode.gameName
		else
			appName_temp = curSelectPlayMode.gameName
		end
		self:get_parlor_cost(appName_temp)
	end )
end

-- 绑定loginModel层事件，模块内交互
function RuleSettingModule:on_model_event_bind()


end

function RuleSettingModule:is_press_toggle(obj)
	local name = obj.name
	return (name == "1" or name == "2" or name == "1_Disable" or name == "2_Disable")
end

function RuleSettingModule:is_click_toggle(obj)
	local name = obj.name
	return (name == "1" or name == "2")
end

function RuleSettingModule:hide_click_tip()
	self.showTip = false
	self.view.clickTipObj:SetActive(false)
	--self.view.clickTipRectTransform.anchoredPosition = Vector2.New(-1000,-2000)
end

function RuleSettingModule:on_press(obj, arg)
	if(self:is_press_toggle(obj)) then
		self.showTip = Input.touchCount > 0
		local clickTip = self.view:show_click_tip(obj)
		if(clickTip) then
			local clickPos = obj.transform.position --self.view:get_world_pos(Input.mousePosition, obj.transform.position.z)
			self.view.clickTipObj:SetActive(true)
			self.view.clickTipObj.transform.position = clickPos
			self.view.clickTipObj.transform.anchoredPosition = self.view.clickTipObj.transform.anchoredPosition + Vector3.New(-362,15,0)
			self.view.clickTipText.text = clickTip
		end
	end
end

function RuleSettingModule:on_press_up(obj, arg)
	if(not self.showTip and self:is_press_toggle(obj)) then
		self:hide_click_tip()
	end
end

function RuleSettingModule:refresh_view(data)
	self.showType = data.showType
	self.view.showType = self.showType
	self.view.create:SetActive(data.showType < 3)
	self.view.save:SetActive(data.showType == 3)

	self.view.buttonCreate.gameObject:SetActive(not self.modelData.curGameFree)
	self.view.buttonCreate_free.gameObject:SetActive(self.modelData.curGameFree )
	if data.showType == 1 then --1为正常创建 2为亲友圈创建 3为亲友圈保存
		self:get_freeByGameId()
	end

	 if data.showType == 2 then

		local diamondCostVitality = data.museumData.diamondCostVitality;
		-- 修改创建图标
		if diamondCostVitality == 1 then
			self.view.createStateSwitch:SwitchState("ShowPowerIcon")
		elseif diamondCostVitality == 0 then
			self.view.createStateSwitch:SwitchState("ShowPayIcon")
		end
	else
		self.view.createStateSwitch:SwitchState("ShowPayNum")
	end

	if(data.showType < 3) then -- 1为正常创建 2为亲友圈创建 3为亲友圈保存
		self.museumData = data.museumData
		self.view.payInfoObj:SetActive(not self.museumData)
		-- self.view.textMuseumTip.gameObject:SetActive(self.museumData ~= nil)
        self.view.FreeCreatePayInfoObj:SetActive(self.museumData ~= nil)
		if(self.museumData) then
			local boxData = self.museumData.curBoxData
			self.view.FreeCreatePayTypeTex.text = masterCostTips[boxData.payType]
            -- self.view.textMuseumTip.text = string.format("注：%s(%d)",masterCostTips[self.museumData.payType],self.museumData.payNum)

            self.lastMuseumData = self.museumData

            self.payType = boxData.payType
			self.payNum = boxData.payNum

			self.allowDissolveRoom = self.museumData.allowDissolveRoom
			self.allowDissolveRoomTime = self.museumData.allowDissolveRoomTime
			self.allowInteractiveExpression = self.museumData.allowInteractiveExpression

			self.initSetCost = false
			self.view.masterCostToggles[self.payType].isOn = false
			self.view.masterCostToggles[self.payType].isOn = true
			self:refresh_cost_tips(self.payType, true)
		end
		self.totalCard = self.modelData.roleData.cards or 0


		if(AppData.isPokerGame() or AppData.Game_Name == "KWX" or AppData.Game_Name == "ESMJ"or AppData.Game_Name == "NTCP" or AppData.isZiPaiGame(AppData.Game_Name) or AppData.isHuaPaiGame(AppData.Game_Name)) then
			self.wanfaType = PlayerPrefsManager.GetInt(AppData.get_url_game_name() .. "_wanfaType", 1)
		else
			print(self.curGameId)
			self.wanfaType = ModuleCache.PlayModeUtil.get_playmodel_data(nil,nil, ModuleCache.GameManager.curGameId)
			if not self.wanfaType then
				ModuleCache.Log.report_exception("错误的wanfaType", string.format("%s_%s_%s" ,ModuleCache.GameManager.curProvince, ModuleCache.GameManager.curGameId, ModuleCache.GameManager.curProvince), "")
				self.wanfaType = 1
			else
				if(self.wanfaType > #self.wanfaConfig.createRoomTable) then
					self.wanfaType = 1
				end
			end
		end

		self.view:show_create(self.wanfaType, true,self.showType)
		self.view:refresh_prices(self.showType, self.wanfaType)
		 if self.showType then
            if self.showType == 2 then
                self.view.costText.text = "x" .. self:get_pay_num()
            end
        end

		if self.view.needDiam == 0 and self.showType == 1 then
			self.view.createStateSwitch:SwitchState("NotShowPayNum")
		end
		self:dispatch_module_event("rulesetting", "Event_Send_WanfaType", self.wanfaType)
	else
		self.lastMuseumData = data.museumData
		local boxData = data.boxData or {}
		if self.data.createBox then
			boxData = {}
		end
		local playRuleString = boxData.playRule or ""
		print("@@@@@@@@@@playRuleString:",playRuleString)
		local notHaveRule = (not playRuleString or playRuleString == "")
		if notHaveRule then
			self.wanfaType = 1
			self.view:show_create(self.wanfaType, true,self.showType)
			playRuleString = self.view:get_payinfo_data(1, false, self.curGameName)
		end

		self.playRule = TableUtil.convert_rule(playRuleString)
		local gameType = self.playRule.GameType or self.playRule.gameType or self.playRule.game_type or self.playRule.bankerType
		if(not gameType) then
			self.wanfaType = 4
		else
			self.wanfaType = Config.GetWanfaIdx(gameType)
		end

		print("@@@@@@@@@@playRuleString:",playRuleString,gameType,self.wanfaType)

		if self.data.createBox then
			self.payType = 1
			self.payNum =self:get_pay_num()
		else
			self.payType = boxData.payType  or 1
			self.payNum = boxData.payNum or self:get_pay_num()
		end

		self.playerCount = boxData.playerCount or self.view:get_player_count(self.wanfaType)
		self.roundCount = boxData.roundCount or  self.view:get_round_data(self.wanfaType)

		self.parlorNum = self.lastMuseumData.parlorNum
		self.parlorId = self.lastMuseumData.id
		self.parlorName = self.lastMuseumData.parlorName
		--self.consumeType = self.lastMuseumData.consumeType

		self.showRankListType = self.lastMuseumData.showRankListType
		self.sendMsgType = self.lastMuseumData.sendMsgType
		self.preventionCheat = self.lastMuseumData.preventionCheat

		self.wechatNumber = self.lastMuseumData.wechatNumber
		self.openRoomType = self.lastMuseumData.openRoomType
		self.launchRoundStatus = self.lastMuseumData.launchRoundStatus

		self.allowDissolveRoom = self.lastMuseumData.allowDissolveRoom
		self.allowDissolveRoomTime = self.lastMuseumData.allowDissolveRoomTime
		self.allowInteractiveExpression = self.lastMuseumData.allowInteractiveExpression

		self.tempSealoffStatus = self.lastMuseumData.tempSealoffStatus
		self.banMemberCharge = self.lastMuseumData.banMemberCharge

		print("------------------self.playerCount:",self.playerCount,self.roundCount,self.lastMuseumData.playRule)
		self.view.saveTip.text = string.format("注：%s(%d)", masterCostTips[self.payType], self.payNum)

		self.initSetCost = false
		self.view.masterCostToggles[self.payType].isOn = false
		self.view.masterCostToggles[self.payType].isOn = true
		self:refresh_cost_tips(self.payType)

		if(not notHaveRule) then
			self.view:show_create(self.wanfaType, true,self.showType)
		end
		self:refresh_toggle_view_museum(playRuleString)
	end

	self.initSetCost = true
end

function RuleSettingModule:on_click(obj, arg)
	--print_debug(obj.name)
	ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
	if obj == self.view.buttonCreate.gameObject or obj == self.view.buttonCreate_free.gameObject then
		--local rule = self.view:get_round_data(self.wanfaType)
		if(AppData.isPokerGame()) then
			self:connect_login_server()
			return
		end
		self.modelData.tableCommonData.tableType = 0
		TableManager:connect_login_server(function()
			TableManager:request_login_login_server(self.modelData.roleData.userID, self.modelData.roleData.password)
		end,
		--登录成功回调
		function(data)
			if(not data.ErrorCode or data.ErrorCode == 0)then
				local createInfo =
				{
					GameName = Config.get_create_name(self.wanfaType),
					RoundCount = self.view:get_round_data(self.wanfaType,self.museumData),
					Rule = self.view:get_payinfo_data(self.wanfaType, self.museumData),
					HallID = 0,
				}
				if(self.museumData) then
					self.modelData.tableCommonData.tableType = 0
					if self.museumData.curBoxData then
						createInfo.boxId  = self.museumData.curBoxData.boxId
					end
					createInfo.HallID = self.museumData.parlorNum
					createInfo.Rule = ModuleCache.Json.decode(createInfo.Rule)
					createInfo.Rule.PayType = self.museumData.payType
					createInfo.Rule.consumeType = self.museumData.consumeType

					createInfo.Rule.allowDissolveRoom = self.allowDissolveRoom
					createInfo.Rule.allowDissolveRoomTime = self.allowDissolveRoomTime
					createInfo.Rule.allowInteractiveExpression = self.allowInteractiveExpression


					--TODO XLQ:跑胡子房间设置没有局数（用胡息结算代替局数）
					if createInfo.Rule.roundCount == 1 and createInfo.Rule.JieSuanHuXi then
						createInfo.Rule.roundCount = createInfo.Rule.JieSuanHuXi

						createInfo.RoundCount = createInfo.Rule.JieSuanHuXi
					end

					createInfo.Rule = ModuleCache.Json.encode(createInfo.Rule)
				end
				--print_table(createInfo,"------------createInfo:")
				TableManager:henanmj_request_create_room(createInfo)
			else
				TableManager:disconnect_login_server()
				if data.ErrorInfo == "密码检验失败" or data.ErrorInfo == "密码校验失败" then
					ModuleCache.GameManager.logout()
				end
				ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(data.ErrorInfo)
			end
		end, nil, nil, function ()
			TableManager:showNetErrDialog(nil)
		end)
	elseif(obj.name == "ButtonSave") then
		local wanfaName = ""
		local ruleName = ""
		local renshu = 4
		local ruleStr = self.view:get_payinfo_data(self.wanfaType, nil, self.curGameName)

		wanfaName,ruleName,renshu = TableUtil.get_rule_name(ruleStr , false, self.curGameName)

		local tip = string.format("您当前设置的快速组局玩法：\n%s %s",wanfaName,ruleName)

		--字牌公告规则特殊处理
		if (AppData.Game_Name == 'XXZP' or AppData.Game_Name == 'LDZP') then
			ruleName = TableUtil.get_rule_name_paohuzi(ruleStr)

			tip = string.format("您当前设置的快速组局玩法：\n %s",ruleName)
		end

		ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common(tip, function()
			self:save_setting()
		end)
	elseif(self:is_click_toggle(obj)) then
		local retData = self.view.toggles[obj.transform.parent.parent.name]
		self.view:click_toggle(retData, self.showType, self.wanfaType)
		if self.showType then
			if self.showType == 3 then
				self.view.saveTip.text =string.format("注：%s(%d)",masterCostTips[self.payType],self:get_pay_num())

				self.payNum = self:get_pay_num()
				self:refresh_cost_tips(self.payType)
			elseif self.showType == 2 then
				self.view.costText.text = "x".. self:get_pay_num()
			end
		end

	elseif(string.sub(obj.name, 1, 7) == "CopyBtn") then
		local array = string.split(obj.name, "_")
		self:changeWafa(array[2])
		if self.showType then
			if self.showType == 3 then
				self.view.saveTip.text =string.format("注：%s(%d)",masterCostTips[self.payType],self:get_pay_num())

				self.payNum = self:get_pay_num()
				self:refresh_cost_tips(self.payType)
			elseif self.showType == 2 then
				self.view.costText.text = "x".. self:get_pay_num()
			end
		end
	elseif(obj.name == "CloseWanfaGuideBtn") then
		self.view.ChangeWanfaGuide:SetActive(false)
	elseif(obj.name == "ChangeWanfa") then
		self:show_change_wanfa_view()
	end
end

function RuleSettingModule:show_change_wanfa_view()
	if not AppData.Is_Independent_App and ModuleCache.GameManager.channel ~= "HAOCAI" then
		self.view.ChangeWanfaGuide:SetActive(false)
		if self.curGameName then
			ModuleCache.GameManager.change_game_by_gameName(self.curGameName, true)
		end
		local intentData = {
			openProvince = ModuleCache.GameManager.curProvince,
			museumOpen = true
		}
		ModuleCache.ModuleManager.show_module('public', "setplaymode",  intentData)
	else
		ModuleCache.ModuleManager.show_module("public", "switchgame", "chessmuseum_select_wanfa")
	end
end

--点击左边按钮切换玩法
function RuleSettingModule:changeWafa(idx)
	local retData = self.view.tagBtnToggles[idx]
	self.wanfaType = tonumber(idx)

	local config =nil
	if self.showType == 2 or self.showType == 3 then
		local getConfig = ModuleCache.PlayModeUtil.getProvinceByAppName(self.view.tempAppName)
		config = require(getConfig.modName)
	end

	local gameType = Config.get_wanfaType_name(self.wanfaType,self.view.tempGameName,nil,config)

	local playModeData = ModuleCache.PlayModeUtil.get_playmodel_data(gameType)
	if(playModeData)then
		-- 这里可以用createName吗？
		--ModuleCache.GameManager.change_game_by_gameName(playModeData.gameName, playModeData.name)
		ModuleCache.GameManager.change_game_by_gameName(playModeData.createName, true)
	end
	print(idx,"@@@@@@changeWafa@@@@@@@@",retData, self.showType, self.wanfaType)
	self.view:click_tag_toggle(retData, self.showType, self.wanfaType)
	self:dispatch_module_event("rulesetting", "Event_Send_WanfaType", self.wanfaType)
end


--data =｛
--showType = 3,
--museumData = TableUtil.copy_data(data),
--boxData = data.curBoxData,
--curBoxId = self.curBoxId,
--createBox = self.createBox,
--gameId = data.curBoxData.gameId
--｝

function RuleSettingModule:on_show(data)
	print_table(data)
	self.data = data
	self.initSetCost = false
	local appAndGameName = AppData.get_app_and_game_name()
	if data.showType == 2 or data.showType == 3 then  -- 1为正常创建 2为亲友圈创建 3为亲友圈保存
        self.curGameName = nil
		if data.boxData then
			appAndGameName = data.boxData.gameId
        else
            ----代表还没创建包间
            --local intentData = {
            --    openProvince = ModuleCache.GameManager.curProvince,
            --    museumOpen = true
            --}
            --ModuleCache.ModuleManager.show_module("public", "setplaymode",  intentData)

		end
		--self.view:hide()
        self:get_parlor_cost(appAndGameName)
    else
		self.museumData = nil
        self:refresh_config(appAndGameName)
	--elseif data.showType == 2 then
	--	appAndGameName = data.boxData.gameId
	end

	print("~~~~~~~~~当前gameId:",appAndGameName)

	self.view.ChangeWanfaGuide:SetActive(data.createBox)
	self.view.ChangeWanfaObj:SetActive(data.createBox)
end

function RuleSettingModule:refresh_config(appGameName)
	self.curGameName = appGameName
	self.wanfaConfig = ModuleCache.PlayModeUtil.getGameRuleConfig(appGameName)--require(string.format("package.public.config.%s.config_%s",tempAppName,tempGameName))

	local arr = string.split(appGameName, "_")
	if #arr > 1 then
		self.view.tempAppName = arr[1]
		self.view.tempGameName = arr[2]
	end

	self.view.Config = self.wanfaConfig
	self:refresh_view(self.data)

	self.view.ChangeWanfaTex.text = ModuleCache.PlayModeUtil.getConfigByAppAndGameName(appGameName).name

	self.isMjGame = not AppData.isPokerGame(arr[2])
end

---获取牌友圈配置
function RuleSettingModule:get_parlor_cost(appGameName)
	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/list/getParlorCost?",
		showModuleNetprompt = true,
		params =
		{
			uid = self.modelData.roleData.userID,
			gameName = appGameName
		},
		cacheDataKey = string.format("parlor/list/getParlorCost?%s", appGameName),
		cacheDataImmediatelyCallback = true
	}
	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		if (retData.success) then
			if #retData.data.parlorConfigs == 0 then
				ModuleCache.ModuleManager.hide_module("public", "createroom")
				ModuleCache.ModuleManager.hide_module("public", "rulesetting")
				ModuleCache.ModuleManager.show_public_module("alertdialog"):show_center_button("当前选择的玩法未找到亲友圈配置，请联系客服！", function()
					self:dispatch_module_event("rulesetting", "not_get_parlor_cost")
				end, nil)
				return;
			end

			self.modelData.AppGlobalConfig.consumeConfigs = retData.data.parlorConfigs
			self.modelData.AppGlobalConfig.parlorChargingType = retData.data.parlorChargingType
			self.modelData.AppGlobalConfig.twoPersonEqThree = retData.data.twoPersonEqThree or false
			self:refresh_config(appGameName)
			--self.view:show()
		else

		end
	end, function(wwwErrorData)
		print(wwwErrorData.error)
	end )
end


--- 根据亲友圈的规则反推出对应按钮的勾选与显示
function RuleSettingModule:refresh_toggle_view_museum(rule)
	local ruleTable = ModuleCache.Json.decode(rule)
	local needRefresh = false
	for k,v in pairs(self.view.toggles) do
		local toggleData = v.toggleData
		local toggle = v
		if (k == "1_1_1" or k == "1_1_2" or k == "1_1_3") and not string.find(toggleData.json, "roundCount") then
			local splitStrs = string.split(k, "_")
			local curRound = roundNums[tonumber(splitStrs[3])]
			if(curRound == (ruleTable.roundCount or self.roundCount)) then
				self.view:click_toggle(toggle,self.showType,self.wanfaType)
			end
		else
			local isOn, onIndex = TableUtil.check_toggle_on(toggleData, rule)
			if (isOn) then
				if(toggleData.toggleType == 1) then
					self.view:click_toggle(toggle,self.showType,self.wanfaType)
				else
					self.view:refresh_textColor(toggle, true)
					PlayerPrefsManager.SetInt(toggle.playerPrefsStr[self.showType], 1)
					needRefresh = true
				end
				if(toggleData.dropDown) then
					local splitStrs = string.split(toggleData.dropDown, ",")
					local splitTitles = nil
					if(toggleData.dropDownTitles) then
						splitTitles = string.split(toggleData.dropDownTitles, ",")
					end
					toggle.drop.transform.sizeDelta = Vector2(toggleData.dropDownWidth or 106,toggle.drop.transform.sizeDelta.y)
					toggle.dropRect.sizeDelta = Vector2(toggle.dropRect.sizeDelta.x,65*#splitStrs)
					toggle.drop.options:Clear()
					for i = 1, #splitStrs do
						local title = splitStrs[i] .. (toggleData.dropAddStr or "倍")
						if(splitTitles) then
							title = splitTitles[i]
						end
						local optionData = UnityEngine.UI.Dropdown.OptionData(title)
						toggle.drop.options:Add(optionData)
					end
					toggle.dropText.text = splitStrs[onIndex] .. (toggleData.dropAddStr or "倍")
					if(splitTitles) then
						toggle.dropText.text = splitTitles[onIndex]
					end
					toggle.drop.value = onIndex - 1
					PlayerPrefsManager.SetInt(toggle.dropKey, onIndex - 1)
				end
			elseif(toggleData.toggleType == 2) then
				self.view:refresh_textColor(toggle, false)
				PlayerPrefsManager.SetInt(toggle.playerPrefsStr[self.showType], 0)
				needRefresh = true
			end
		end
	end
	if needRefresh then
		self.view:show_create(self.wanfaType, true,self.showType)
	end
end

--- 获取下拉框的索引值
function RuleSettingModule:get_drop_index(value,dropList)
	for i = 1, #dropList do
		if(value == tonumber(dropList[i])) then
			return i
		end
	end
end

--@TODO 这个坑还有点大啊
--- 保存亲友圈设置
function RuleSettingModule:save_setting(isUniversalSet)
    isUniversalSet = isUniversalSet or false
   
	local rule = self.view:get_payinfo_data(self.wanfaType)
	rule = ModuleCache.Json.decode(rule)
	print_table(rule,"---------save_setting-----------rule---")
	rule.PayType = self.payType
	rule.consumeType = self.consumeType

	rule.allowDissolveRoom = self.allowDissolveRoom
	rule.allowDissolveRoomTime = self.allowDissolveRoomTime
	rule.allowInteractiveExpression = self.allowInteractiveExpression

	--TODO XLQ:跑胡子房间设置没有局数（用胡息结算代替局数）
	if rule.roundCount == 1 and rule.JieSuanHuXi then
		rule.roundCount = rule.JieSuanHuXi
		self.lastMuseumData.roundCount = rule.JieSuanHuXi
	end

	--TODO XLQ 亲友圈设置界面 -   isUniversalSet ：通用设置界面  点击保存 局数和人数 保持当前亲友圈的设置的局数和人数不变
	if isUniversalSet then
		rule.roundCount = self.lastMuseumData.roundCount
		rule.playerCount = self.lastMuseumData.playerCount
		rule.PlayerNum = self.lastMuseumData.playerCount
	end


	if AppData.Game_Name == "RUNFAST" or AppData.Game_Name == "RUNFASTDL"  then
		if rule.game_type == 1 then --1：安徽跑得快  2：经典玩法
			rule.allow_unruled_multitriple = false --最后一手飞机可以乱带（安徽跑得快：false, 经典玩法：true）
			rule.rate = 1
			rule.tripleA_is_bomb = true
		else
			rule.allow_unruled_multitriple = true
			rule.tripleA_is_bomb = false
		end

		if rule.playerCount == 2 then
			rule.black3_on_firstloop = false
		elseif rule.playerCount == 4 then
			rule.init_card_cnt = 13
			rule.tripleA_is_bomb = false
		end

		if AppData.Game_Name == "RUNFASTDL" then
			rule.init_card_cnt = 10
		end

		rule.no_triple_p1 = false --最后一手三带一（安徽跑得快：false, 经典玩法：true）
		rule.ruleType = 1
		rule.bankerType = 0
	end

	rule = ModuleCache.Json.encode(rule)
	--print_table(self.lastMuseumData,"DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD")
    --
	--print(self.wanfaType,"##############2######",rule)

	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "parlor/room/updateParlor?",
		params = {
			uid = self.modelData.roleData.userID,
			playRule = rule,
			parlorNum = self.parlorNum,
			parlorId = self.parlorId,
			playerCount = self.lastMuseumData.playerCount,
			roundCount = self.lastMuseumData.roundCount,
			payType =self.payType,
			payNum = self.payNum,
			consumeType = self.consumeType,--"CONSUME_CARD",--
			parlorName = self.parlorName,
            diamondCostVitality = self.diamondCostVitality,
			qrCodeShow = self.qrCodeShow,
			wechatNumber = self.wechatNumber,

			showRankListType = self.showRankListType,
			openRoomType = self.openRoomType,
			launchRoundStatus = self.launchRoundStatus,

			sendMsgType = self.sendMsgType,
			preventionCheat = self.preventionCheat,
			gameName = self.curGameName,

			allowDissolveRoom = self.allowDissolveRoom,
			allowDissolveRoomTime = self.allowDissolveRoomTime,
			allowInteractiveExpression = self.allowInteractiveExpression,
			editBox = 1,--"是否新增或编辑包间  1是 0否
			tempSealoffStatus = self.tempSealoffStatus,--是否开启离线封停
			banMemberCharge = self.banMemberCharge, -- 禁止成员充值  0 关闭  1 打开
		}
	}

	if not self.data.createBox and self.data.boxData then
		requestData.params.boxId = self.data.boxData.boxId
	end

	--local roundCount = self.view:get_round_data(self.wanfaType)
	-- if(self.payType == 3 or self.payType == 2) then
	-- 	local level = 0
	-- 	if(self.payType == 3) then
	-- 		level = self:get_pay_level(self.roundCount, self.playerCount)
	-- 	else
	-- 		level = self:get_pay_level(self.roundCount, 1)
	-- 	end
	-- 	local totalNum = self:get_total_num(roundCount, level)
	-- 	local playerCount = self.view:get_player_count(self.wanfaType)
	-- 	if(self.payType == 3) then
	-- 		requestData.params.payNum = math.ceil(totalNum/playerCount)
	-- 	else
	-- 		requestData.params.payNum = totalNum
	-- 	end
	-- elseif(self.payType == 1) then
	-- 	requestData.params.payNum = math.ceil(roundCount/8)
	-- end
	print_table(requestData.params,"--------------------requestData.params---")
	--TODO XLQ 亲友圈设置界面 -   isUniversalSet ：通用设置界面  点击保存 局数和人数 保持当前亲友圈的设置的局数和人数不变
	if isUniversalSet == false then
		--requestData.params.payNum =self:get_pay_num()
		requestData.params.playerCount = self.view:get_player_count(self.wanfaType)
		requestData.params.roundCount = self.view:get_round_data(self.wanfaType,self.museumData)
	elseif self.boxPlayRule_common then
		requestData.params.playRule = self.boxPlayRule_common
	end

	self:http_get(requestData, function(wwwData)
		local retData = wwwData.www.text
		retData = ModuleCache.Json.decode(retData)
		if(retData.success) then

			if self.MuseumUs3D and self.MuseumUs3D ~= PlayerPrefsManager.GetInt("MuseumUs3D",-1) then
				PlayerPrefsManager.SetInt("MuseumUs3D",self.MuseumUs3D)
				if self.MuseumUs3D ==2 then
					ModuleCache.TalkingDataMgr().setEvent("Museum_UI_Type_3D", {data = 1})
				else
					ModuleCache.TalkingDataMgr().setEvent("Museum_UI_Type_2D", {data = 1})
				end


				ModuleCache.ModuleManager.destroy_module("public", "chessmuseum")
				ModuleCache.ModuleManager.show_module("public", "chessmuseum",{callback = function()
					ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(AppData.MuseumName .."数据修改成功！")
					ModuleCache.ModuleManager.hide_module("public", "museuminfo")
					ModuleCache.ModuleManager.destroy_module("public", "rulesetting")
				end})

			else
				ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(AppData.MuseumName .."数据修改成功！")
				local wanfaName = ""
				local ruleName = ""
				local renshu = 4

				--TODO XLQ:亲友圈玩法不显示支付方式
				rule = ModuleCache.Json.decode(rule)
				rule.PayType = -1
				rule = ModuleCache.Json.encode(rule)

				wanfaName,ruleName,renshu = TableUtil.get_rule_name(rule, false)

				--字牌公告规则特殊处理
				if (AppData.Game_Name == 'XXZP' or AppData.Game_Name == 'LDZP') then
					ruleName = TableUtil.get_rule_name_paohuzi(rule)
				end

				local data =
				{
					toNotice = self.view.noticeToggle.isOn,
					showMsg = false,
					parlorNum = self.parlorNum,
					notice = string.format("%s %s",wanfaName,ruleName)
				}

				--字牌公告不显示玩法名
				if (AppData.Game_Name == 'XXZP' or AppData.Game_Name == 'LDZP') then
					data.notice = ruleName
				end
				self:dispatch_module_event("rulesetting", "Update_Power",self.diamondCostVitality);
				self:dispatch_module_event("chessmuseum", "Event_Update_Box_Notice", data)
			end

		elseif(retData.errMsg) then
			ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(retData.errMsg)
		end
	end, function(wwwErrorData)
        print(wwwErrorData.error)
		ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(AppData.MuseumName .. "数据修改失败！")
	end)
end

--- 获取局数
function RuleSettingModule:get_round_data(roundCount)
	roundCount = roundCount or self.view:get_round_data(self.wanfaType)
    for i=1,#self.modelData.AppGlobalConfig.consumeConfigs do
        local config = self.modelData.AppGlobalConfig.consumeConfigs[i]
        if(config.round == roundCount) then
            return config
        end
    end
    return nil
end

function RuleSettingModule:get_pay_level(roundCount, playerCount)

    local config = self:get_round_data(roundCount)
    local datas = string.split(config.coinNums, ",")
	local playerCount = self.lastMuseumData.playerCount
	local lastMuseumDataPayNum = self.lastMuseumData.payNum
	--TODO 根据策划要求2人与3人花费是一样的，之前没加这个有个很严重的漏洞
	if not AppData.isPokerGame() and self.lastMuseumData.parlorChargingType == 2 and playerCount == 2 then
		playerCount = 3
		lastMuseumDataPayNum = math.ceil(lastMuseumDataPayNum / 1.5)
	end
    for i = 1, #datas do
        local num = tonumber(datas[i])

        if self.lastMuseumData.parlorChargingType == 1 then
            if (self.lastMuseumData.payType == 3) then
                num = math.ceil(tonumber(datas[i]) / playerCount)
            end
        elseif self.lastMuseumData.parlorChargingType == 2 then
			-- 如果是圈主支付直接返回固定的1
			if self.payType == 1 then
				return 1
			end

            if (self.lastMuseumData.payType ~= 3) then
                num = tonumber(datas[i]) * playerCount
            end
        end

        if (lastMuseumDataPayNum == num) then
            return i
        elseif (lastMuseumDataPayNum < num) then
            if (i - 1 > 0) then
                return i - 1
            else
                return i
            end
        end

    end
    return 1
end

--self.modelData.AppGlobalConfig.twoPersonEqThree  1： 2人==3人      2： 2人 ~= 3人
function RuleSettingModule:get_pay_num()
    local roundCount = self.view:get_round_data(self.wanfaType,self.museumData)

    local playerCount = self.view:get_player_count(self.wanfaType)
    local config = self:get_round_data(roundCount)
    local datas = string.split(config.coinNums, ",")

	local lv = self:get_pay_level(roundCount, playerCount)
	if self.data.createBox  then
		lv = 1
	end
	local tempPayNum = tonumber(datas[lv])

    if self.modelData.AppGlobalConfig.parlorChargingType == 1 then -- 以房间
        if (self.payType == 3) then
            tempPayNum = math.ceil(tempPayNum / playerCount)

        end
    elseif self.modelData.AppGlobalConfig.parlorChargingType == 2 then--以人数
		if (self.payType ~= 3) then
			if not  AppData.isPokerGame() and playerCount == 2 then
				if not self.modelData.AppGlobalConfig.twoPersonEqThree or tonumber(self.modelData.AppGlobalConfig.twoPersonEqThree) == 1 then
					tempPayNum = tonumber(tempPayNum) * 3
				else
					tempPayNum = tonumber(tempPayNum) * 2
				end

			else
				tempPayNum = tonumber(tempPayNum) * playerCount
			end
		elseif not  AppData.isPokerGame() and playerCount == 2 then --麻将的2人玩法都按3人收费
			if not self.modelData.AppGlobalConfig.twoPersonEqThree or tonumber(self.modelData.AppGlobalConfig.twoPersonEqThree) == 1 then
				tempPayNum = math.ceil(tonumber(tempPayNum *3 / 2) )
			else
				tempPayNum = tonumber(tempPayNum)
			end

		end
    end

    return tempPayNum
end

function RuleSettingModule:get_total_num(roundCount, level)
	local config = self:get_round_data(roundCount)
	local datas = string.split(config.coinNums, ",")
	print(datas[level])
	return tonumber(datas[level])
end

function RuleSettingModule:connect_login_server()
	TableManager:connect_login_server(function()
			TableManager:request_login_login_server(self.modelData.roleData.userID, self.modelData.roleData.password)
		end,
	--登录成功回调
	function(data)
		if(not data.ErrorCode or data.ErrorCode == 0)then
			if(data.RoomID ~= 0)then
				TableManager:request_join_room_login_server({roomId = data.RoomID})
				return
			end
			
			self.selectedRule = self.view:get_payinfo_data(self.wanfaType)
			local ruleTable = ModuleCache.Json.decode(self.selectedRule)
			local hallID = 0
			local boxId = 0
			if(self.museumData) then
				if self.museumData.curBoxData then
					boxId  = self.museumData.curBoxData.boxId
				end

				hallID = self.museumData.parlorNum

				ruleTable.PayType =  self.museumData.payType
				ruleTable.consumeType = self.museumData.consumeType

				ruleTable.allowDissolveRoom = self.allowDissolveRoom
				ruleTable.allowDissolveRoomTime = self.allowDissolveRoomTime
				ruleTable.allowInteractiveExpression = self.allowInteractiveExpression

				self.selectedRule = ModuleCache.Json.encode(ruleTable)
			end

			if AppData.Game_Name == "RUNFAST" then
				if ruleTable.game_type == 1 then --1：地方性跑得快  2：经典玩法
					ruleTable.allow_unruled_multitriple = false --最后一手飞机可以乱带（安徽跑得快：false, 经典玩法：true）
					ruleTable.rate = 1
					ruleTable.tripleA_is_bomb = true
				else
					ruleTable.allow_unruled_multitriple = true
					ruleTable.tripleA_is_bomb = false
				end

				if(ruleTable.playerCount <= 2) then
					ruleTable.every_round_black3_first = false
					ruleTable.first_must_black3 = false
					ruleTable.pay_all = false
				end

				if ruleTable.playerCount == 4 then
					ruleTable.init_card_cnt = 13
					ruleTable.tripleA_is_bomb = false
				end

				--检查参数是否存在
				ruleTable.rate = ruleTable.rate or 1
				ruleTable.no_triple_p1 = false --最后一手三带一（安徽跑得快：false, 经典玩法：true）
				ruleTable.ruleType = 1
				ruleTable.bankerType = 0

				self.selectedRule = ModuleCache.Json.encode(ruleTable)
				local createInfo = {
					GameName = AppData.Runfast_GameName,
					RoundCount = ruleTable.roundCount,
					Rule = self.selectedRule,
					HallID = hallID,
					boxId = boxId,
				}

				TableManager:henanmj_request_create_room(createInfo)
				return
				--TableManagerPoker:request_create_room_login_server(AppData.Runfast_GameName, ruleTable.roundCount, self.selectedRule,hallID)
			end

			--if AppData.Game_Name == "ZHAJINHUA" then
			--	print("创建房间炸金花==========")
			--	--ruleTable.gameName = "DHAHQP_ZHAJINHUA_ZHAJINHUA"
			--	-- ruleTable.roundCount = 8 --局数
			--	-- ruleTable.menNum = 0 --闷牌局数
			--	-- ruleTable.maxScore = 10 --封顶分数
			--	-- ruleTable.special = 0--特殊牌型0:散牌235大于豹子, 1:散牌235大于AAA
			--	-- ruleTable.allowEnter = false --游戏开始后允许加入
			--	-- ruleTable.addType = 0 --0:无 ,1: 豹子加分 ,2:顺金加分, 3: 豹子顺金都加分
			--	-- ruleTable.payType = 0--支付方式0:aa ,1:房主, 2:大赢家
			--	-- ruleTable.playerCount = 6
			--	if(ruleTable.leopardAddScore and ruleTable.shunKingAddScore) then
			--		ruleTable.addType = 3
			--	elseif(ruleTable.shunKingAddScore) then
			--		ruleTable.addType = 2
			--	elseif(ruleTable.leopardAddScore) then
			--		ruleTable.addType = 1
			--	else
			--		ruleTable.addType = 0
			--	end
			--	print_table(ruleTable)
			--	self.selectedRule = ModuleCache.Json.encode(ruleTable)
			--	local createInfo = {
			--		GameName = AppData.ZhaJinHua_GameName,
			--		RoundCount = ruleTable.roundCount,
			--		Rule = self.selectedRule,
			--		HallID = hallID,
			--		boxId = boxId,
			--	}
			--	TableManager:henanmj_request_create_room(createInfo)
			--	return
			--	--TableManagerPoker:request_create_room_login_server(AppData.ZhaJinHua_GameName, ruleTable.roundCount, self.selectedRule,hallID)
			--end

			local isPokerGame, packageConfig = AppData.isPokerGame()
			if(isPokerGame)then
				local createInfo = {
					GameName = packageConfig:get_full_game_name(),
					RoundCount = ruleTable.roundCount,
					Rule = self.selectedRule,
					HallID = hallID,
					boxId = boxId,
				}
				TableManager:henanmj_request_create_room(createInfo)
				--TableManagerPoker:request_create_room_login_server(packageConfig:get_full_game_name(), ruleTable.roundCount, self.selectedRule,hallID)
				return
			end
		else
			TableManager:disconnect_login_server()

			if data.ErrorInfo == "密码检验失败" or data.ErrorInfo == "密码校验失败" then
                ModuleCache.GameManager.logout()
            end
			ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(data.ErrorInfo)
		end
	end,
	--创建成功回调
	function (data)
		print("创建成功回调")
		if((not data.ErrorCode or data.ErrorCode == 0) and data.RoomID ~= 0)then
			local roleData = self.modelData.roleData
			roleData.myRoomSeatInfo.Rule = self.selectedRule
			local ruleTable = ModuleCache.Json.decode(self.selectedRule)
			--ModuleCache.GameManager.set_used_playMode(ruleTable.GameID)
			if AppData.Game_Name == "RUNFAST"  or AppData.Game_Name == "RUNFASTDL"  then
				TableManager.RunfastRuleJsonString = self.selectedRule
				print("====跑得快创建房间规则:"..self.selectedRule)
				ModuleCache.ModuleManager.destroy_package("runfast")
				ModuleCache.ModuleManager.destroy_package("quickrun")
			elseif AppData.Game_Name == "ZHAJINHUA" then
				print("====炸金花创建房间规则:"..self.selectedRule)
			end
			roleData.myRoomSeatInfo.RoundCount = ruleTable.roundCount
			TableManager:disconnect_login_server()
			self:connect_game_server()
		else
			TableManager:disconnect_login_server()
			ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(data.ErrorInfo)
		end
	end,
	--加入房间回调
	function (data)
		if data.ErrorCode == 0 then
			TableManager:disconnect_login_server()
			self:connect_game_server()
		else
			TableManager:disconnect_login_server()
			ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(data.ErrorInfo)
		end
	end)
end

function RuleSettingModule:connect_game_server()
	TableManagerPoker.reconnectGameServerTimes = 0
	TableManagerPoker:connect_game_server(function()
		TableManagerPoker:request_login_game_server(self.modelData.roleData.userID, self.modelData.roleData.myRoomSeatInfo.Password)
	end,

	function(data)
		if(not data.err_no  or data.err_no == "0") then
			ModuleCache.ModuleManager.destroy_public_package()
			ModuleCache.SoundManager.stop_music()

			local ruleTable = self.modelData.roleData.myRoomSeatInfo.RuleTable
			if ruleTable.gameName == AppData.CowBoy_GameName then
				if (ruleTable.name and ruleTable.name == "ZhaJinNiu") then
					ModuleCache.ModuleManager.show_module("cowboy", "table_zhajinniu")
				else
					ModuleCache.ModuleManager.show_module("cowboy", "table")
				end
				return
			end

			local isPokerGame, packageConfig = AppData.isPokerGame()
			if(isPokerGame)then
				if packageConfig.package_name == "biji" and self.wanfaType == 3 then
					ModuleCache.ModuleManager.show_module(packageConfig.package_name, "tablebijisix")
					return
				end
				ModuleCache.ModuleManager.show_module(packageConfig.package_name, packageConfig.table_module_name)
			end
		else
			ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips(data.err_no)
		end
	end)
end

function RuleSettingModule:on_hide()
	self.modelData.museumOpen = true
	self.view:save_drop_values()
end

-- 获取当前游戏是否限免
function RuleSettingModule:get_freeByGameId()
	local requestData = {
		baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "public/getFreeByGameId?",
		params = {
			uid = self.modelData.roleData.userID,
		}
	}
	self:http_get(requestData, function(wwwData)
		local retData = ModuleCache.Json.decode(wwwData.www.text)
		if retData.ret == 0 then
			self.modelData.curGameFree = retData.data.free
			self.view.buttonCreate.gameObject:SetActive(not  retData.data.free)
			self.view.buttonCreate_free.gameObject:SetActive( retData.data.free )
		else

		end
	end, function(errorData)

		print(errorData.error)
	end)
end

return RuleSettingModule



