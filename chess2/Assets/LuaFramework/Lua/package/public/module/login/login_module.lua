





local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")

---@class LoginModule:ModuleBase
---@field model LoginModel
---@field loginModel LoginModel
---@field view LoginView
---@field loginView LoginView
local LoginModule = require("lib.middleclass")("BullFight.LoginModule", ModuleBase)
TableManager = require("package.public.table_manager")
TableManagerPoker = require("package.public.table_manager_poker")
TableUtil = require("package.public.table_util")
MatchingManager = require("package.public.matching_manager")

-- 常用模块引用
local ModuleCache = ModuleCache
local UnityEngine = UnityEngine
local PlayModeUtil = ModuleCache.PlayModeUtil
local GameManager = ModuleCache.GameManager

local iPhoneSpeaker

function LoginModule:initialize(...)
	self._get_app_upgrade_info_count = 0
	-- 开始初始化                view        loginModel           模块数据
	ModuleBase.initialize(self, "login_view", "login_model", ...)
	self.modelData.reset()

	self.modelData.defaultHead = self.view.defaultHead.sprite

	if ModuleCache.GameConfigProject.developmentMode then
		PlayModeUtil.test_mode(true)
	end
	--关闭多点触控
	UnityEngine.Input.multiTouchEnabled = false

	if ModuleCache.GameManager.customPlatformName == "IPhonePlayer" and ModuleCache.GameManager.appVersion ~= "1.6.0" then
		iPhoneSpeaker = iPhoneSpeaker or require("iPhoneSpeaker")
		if iPhoneSpeaker then
			iPhoneSpeaker.ForceToSpeaker()
		end
	end

	self:subscibe_app_focus_event(function (eventHead, state)
		if not self.view:is_active() then
			return
		end

		if state then
			self:process_mwenter()
		end
	end)

	ModuleCache.LogManager.uid = ModuleCache.PlayerPrefsManager.GetString(ModuleCache.AppData.PLAYER_PREFS_KEY_USERID, "0")

	ModuleCache.WechatManager.init()
end

function LoginModule:on_show()

	self:showPlayMode()

	--ModuleCache.AssetBundleManager:LoadAssetBundleAsync("public/module/hall/public_windowhall.prefab", "Public_WindowHall", nil)
	--ModuleCache.AssetBundleManager:LoadAssetBundleAsync("public/module/hall/public_windowhall.prefab", "Public_WindowHall", nil)
	--ModuleCache.AssetBundleManager:LoadAssetBundleAsync("public/module/table/public_table.prefab", "Public_Table", nil)
	-- ModuleCache.AssetBundleManager:LoadAssetBundleAsync("runfast/module/tablerunfast/runfast_table.prefab", "Runfast_Table", nil)
	-- ModuleCache.AssetBundleManager:LoadAssetBundleAsync("biji/module/tablebiji/biji_table.prefab", "BiJi_Table", nil)
	--self:subscibe_time_event(0.01, false, 0):OnComplete(function ( ... )
	--	ModuleCache.PreLoadManager.preLoad()
	--end)
	self:process_mwenter()

	--print(ModuleCache.GameSDKInterface.WeRech11)
end

function LoginModule:process_mwenter()
	--ModuleCache.GameSDKCallback.instance.mwEnterRoomID = "%7B%22local%22%3A%22%E7%BA%A2%E4%B8%AD%E9%BA%BB%E5%B0%86%22%2C%22roomId%22%3A%22938353%22%2C%22parlorId%22%3A%220%22%2C%22ruleMsg%22%3A%228%E5%B1%80%204%E4%BA%BA%E7%8E%A9%E6%B3%95%20%E5%8F%AF%E6%8E%A5%E7%82%AE%20%E7%BA%A2%E4%B8%AD%20%E4%B8%8D%E5%8F%AF%E5%90%83%E7%89%8C%204%E7%BA%A2%E4%B8%AD%E8%83%A1%E7%89%8C%20%E6%89%8E2%E7%A0%81%20AA%E6%94%AF%E4%BB%98%20%22%2C%22roomType%22%3A0%2C%22gameName%22%3A%22DHHNQP_HZMJ__DHQGQPBID%22%2C%22type%22%3A2%7D"
	--ModuleCache.GameSDKCallback.instance.mwEnterRoomID = "%7b%22scene%22%3a%22hallshare%22%2c%22appGameName%22%3a%22DHGXQP_SANGONG%22%7d"
	local mwData = ModuleCache.GameManager.get_mw_data()
	if mwData then
		if mwData.appName and mwData.appName ~= ModuleCache.AppData.get_app_name() then
			if ModuleCache.GameManager.change_game_buy_appName_gameName(mwData.appName, mwData.gameName) then
				ModuleCache.GameManager.logout()
			end
		end
	end
end

function LoginModule:showPlayMode( )
	if(ModuleCache.GameManager.getCurProvinceId() == 0 or ModuleCache.GameManager.getCurGameId() == 0 ) then
		return
	end

	if ModuleCache.GameManager.getCurProvinceId() ~= 0 then
		ModuleCache.GameManager.select_province_id(ModuleCache.GameManager.getCurProvinceId())
	end

	if ModuleCache.GameManager.getCurGameId() ~= 0 then
		ModuleCache.GameManager.select_game_id(ModuleCache.GameManager.getCurGameId())
	end
end


-- 模块初始化完成回调，包含了view，loginModel初始化完成
function LoginModule:on_module_inited()
	if ModuleCache.GameManager.deviceIsMobile and not ModuleCache.GameConfigProject.developmentMode then
		self.loginView.toggleUseAccount.isOn = false
		self.loginView.goPannelTest:SetActive(false)
	else
		local accountName = ModuleCache.PlayerPrefsManager.GetString(ModuleCache.AppData.PLAYER_PREFS_KEY_ACCOUNT)
		if accountName then
			self.loginView.inputAccount.text = accountName
		end

		self.loginView.toggleUseAccount.isOn = ModuleCache.PlayerPrefsManager.GetInt(ModuleCache.AppData.PLAYER_PREFS_KEY_TOGGLE_USE_ACCOUNT, 0) == 1
		self.loginView.inputAccount.gameObject:SetActive(self.loginView.toggleUseAccount.isOn)
		self.loginView.toggleUseAccount.onValueChanged:AddListener(function(state)
			self.loginView.inputAccount.gameObject:SetActive(state)
		end)
	end

	self.loginView.textVersion.text = ModuleCache.GameManager.appVersion .. "|" .. (ModuleCache.GameManager.appInternalAssetVersion or "0") .. "_" .. (ModuleCache.GameManager.appAssetVersion or "0")

	-- 设置进入主界面弹出活动界面
	GameManager.isNeedShowActivity = true
	-- self:CheckIosNetError()
	ModuleCache.PackageManager.init()
	self:subscibe_time_event_on(20, function()
		if not self._get_app_upgrade_info_callback_state then
			ModuleCache.Log.report_exception("更新重启后再登录界面卡住了", "", "")
			ModuleCache.GameManager.reboot()
		end
	end)
	local gameRoot = UnityEngine.GameObject.Find("GameRoot")
	local canvas = ModuleCache.ComponentManager.GetComponentWithPath(gameRoot, "Game/UIRoot/UIWindowParent/Canvas", ComponentTypeName.RectTransform)
	if(not ModuleCache.GameManager.isEditor and ModuleCache.GameManager.deviceIsMobile)then
		if(canvas.sizeDelta.y > canvas.sizeDelta.x or (ModuleCache.UnityEngine.Screen.width < ModuleCache.UnityEngine.Screen.height or (not ModuleCache.GameManager.isLandscapeOrientation())))then
			ModuleCache.GameManager.force_change_orientation_Landscape(false)
			self:subscibe_time_event_on(1, function()
				ModuleCache.GameManager.reboot()
			end)
			return
		end
	end
	self:_get_app_upgrade_info()

	self.loginView.toggleUseSimlateAcc.onValueChanged:AddListener( function(isCheck)
		self.loginView.testIdInput.gameObject:SetActive( isCheck)
	end )
end

-- 先屏蔽掉
function LoginModule:CheckIosNetError()
	if GameManager.customPlatformName == "IPhonePlayer" then
		if(ModuleCache.GameSDKInterface:IsUserCloseNetWork()) then
			ModuleCache.ModuleManager.show_module("public", "iosneterrorfix",nil)
			return

		end
	end
	self:_get_app_upgrade_info()
end

-- 绑定module层的交互事件
function LoginModule:on_module_event_bind()

end

-- 绑定loginModel层事件，模块内交互
function LoginModule:on_model_event_bind()
	self:subscibe_model_event("Event_Login_LoginSucess", function(eventHead, eventData)
		if ModuleCache.GameManager.curProvince ~= 0 and ModuleCache.GameManager.curGameId ~= 0 then
			ModuleCache.ModuleManager.show_module_only("public", "hall")
		end
		self.isLogin = true

		if(ModuleCache.GameManager.curProvince == 0 or ModuleCache.GameManager.curGameId == 0) then
            ModuleCache.ModuleManager.show_public_module("operate");
			return
		end
	end)

	self:subscibe_package_event("Event_Set_Play_Mode",function(eventHead, eventData)
		self:showPlayMode( )
		---- 这里应该是第一次选择用
		--if self.isLogin then
		--	if ModuleCache.GameManager.curProvince ~= 0 and ModuleCache.GameManager.curGameId ~= 0 then
		--		local config = PlayModeUtil.getInfoByGameId(ModuleCache.GameManager.curGameId)
		--		if not ModuleCache.PackageManager.get_app_package_update_info(config.package) then
		--			ModuleCache.ModuleManager.show_module_only("public", "hall")
		--		end
		--	end
		--end
	end
	)

	self:subscibe_package_event("Event_Package_GetVerifyStatusNoCheck", function(eventHead, eventData)
		local extendData = {
			mobile = eventData.mobile,
			verifyCode = eventData.verifyCode
		}
		if eventData.phoneBindWechat then
			self.loginModel:connect_login_server(0, "", extendData)
		else
			ModuleCache.WechatManager.login(function(data)
				if data.token and data.token ~= "" then
					extendData.weiXinCode = data.token
					self.loginModel:connect_login_server(0, "", extendData)
				end
			end, function(error)
				ModuleCache.ModuleManager.hide_public_module("netprompt")
			end)
		end
	end)
end



function LoginModule:on_click(obj, arg)
	ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
	local _cmd = obj.name
	print(_cmd)
	if "ButtonLogin" == _cmd then
		if ModuleCache.GameManager.iosAppStoreIsCheck and ModuleCache.GameManager.deviceIsMobile and not ModuleCache.GameSDKInterface:IsAppExist("wechat://") then
			ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("请先安装微信客户端")
		else
			self:login()
		end
		if ModuleCache.GameManager.iosAppStoreIsCheck then
			ModuleCache.TalkingDataMgr().setEventCheckVersion("Check_LoginWechat")
		end
	elseif "ButtonLoginPhone" == _cmd then
		self:login(false, true)
	elseif "ButtonAnonymity" == _cmd then
		self:anonymity_login()
		if ModuleCache.GameManager.iosAppStoreIsCheck then
			ModuleCache.TalkingDataMgr().setEventCheckVersion("Check_LoginAnonymity")
		end
	elseif "ButtonTest" == _cmd then
		local data = {
			--link = "http://fishwxh5.naler.cn/mayouquan/tyby/?userId=exsv32v&name=%E9%80%9F%E6%AF%94%E4%BF%A1&purl=http%3a%2f%2fwww.baidu.com&sign=xxxx",
			link = "weixin://app/wx8d1873caf543503b/jumpWxa/?userName=gh_1fb92b96e5eb&path=pages%2FpayOrder%2Findex%3Fbody%3D%E6%94%AF%E4%BB%98%E5%AE%A2%E6%9C%8D%E5%BE%AE%E4%BF%A1%3Ajctx1234kf%26money%3D100%26orderNo%3D63a5ff45a781489ca810f12012c9c7ce&miniProgramType=0",
			--link = "http://fishwxh5.naler.cn/subixin/tyby/",
			showType = 0,
			style = 4,
			--hide = true
		}
		ModuleCache.ModuleManager.show_module("public", "webview", data);
		--local t = typeof('UnityEngine.UserAuthorization')
		--local field = tolua.getfield(t, 'Microphone')
		--print(UnityEngine.Application.HasUserAuthorization(field:Get(nil)))
		--print(ModuleCache.GVoiceManager().GetTalkingStatus())
		--local kljsdf = UnityEngine.Microphone.Start("record", true, 60, 8000)
		--print(kljsdf, type(kljsdf), tostring(kljsdf))
		--self:subscibe_time_event_on(1, function ()
		--	print(UnityEngine.Microphone.IsRecording("record"))
		--	print(kljsdf.length)
		--end)

		--print(kljsldjf .. "123")

		--UnityEngine.Screen.orientation = UnityEngine.ScreenOrientation.Portrait
		--ModuleCache.GameSDKInterface:BuglyPrintLog(5, "牌型数据错误，触发断线重连")
		--ModuleCache.GameSDKInterface:CopyTextToClipboard()
		--print(ModuleCache.GameSDKInterface:AndroidIsRoot())
		--print(ModuleCache.GameSDKInterface:AndroidIsSimulator())
		--ModuleCache.FunctionManager.CopyToClipBoard("www.baidu.com")
		--ModuleCache.FunctionManager.CopyToClipBoard("www.baidu.com")
		--ModuleCache.ShareManager().shareImage(false)
		--self.loginModel:connect_login_server(nil, nil, nil,self.view.testIdInput.text)
		--ModuleCache.SDKInterface().open_ios_setting()
		--local uiCamera = ModuleCache.ComponentManager.GetComponentWithPath(UnityEngine.GameObject.Find("GameRoot"), "Game/UIRoot/UICamera", ComponentTypeName.Camera)
		--ModuleCache.CustomerUtil.MirrorCamera(uiCamera, UnityEngine.Vector3(-1, -1, 1))
	elseif "ButtonClearCache" == _cmd then
		ModuleCache.FileUtility.DirectoryDelete(UnityEngine.Application.persistentDataPath, true)
	elseif obj == self.loginView.toggleUserAgreement.gameObject then
		self.loginView.toggleUserAgreement.isOn = true
		ModuleCache.ModuleManager.show_module("public", "useragreement")
	elseif "ButtonReport" == _cmd then
		ModuleCache.ModuleManager.show_public_module("customerservicesystem");
		ModuleCache.LogManager.upload_log_archive()
	elseif "ButtonRepair" == _cmd then
		if not self.view.repairDialogObj.activeSelf then
			self.view.repairDialogObj:SetActive(true)
		end
	elseif "repairConfirmBtn" == _cmd then
		ModuleCache.GameManager.repair()
		self.view.repairDialogObj:SetActive(false)
	elseif "repairCancelBtn" == _cmd then
		self.view.repairDialogObj:SetActive(false)
	end
end

-- 登录账号
function LoginModule:login(autoLogin, loginPhone)
	if autoLogin and (not ModuleCache.GameManager.deviceIsMobile)  then
		return
	end

	--print(autoLogin, ModuleCache.PlayerPrefsManager.GetString(AppData.PLAYER_PREFS_KEY_USERID, "0"), GameManager.isLogout)
	--微信登录一个月重置一次
	if 	os.time() - ModuleCache.PlayerPrefsManager.GetInt("LastWechatLoginTime", 0)  > 2592000 then
		ModuleCache.PlayerPrefsManager.SetString(ModuleCache.AppData.PLAYER_PREFS_KEY_ACCOUNT, "0")
		ModuleCache.PlayerPrefsManager.SetString(ModuleCache.AppData.PLAYER_PREFS_KEY_PASSWORD, "0")
	end

	if self.loginView.toggleUseAccount.isOn then
		local inputAccount = self.loginView.inputAccount
		local text = inputAccount.text
		if string.len(text) < 2 then
			if not autoLogin then
				ModuleCache.ModuleManager.show_public_module("textprompt"):show_center_tips("账户输入错误")
			end
		else
			ModuleCache.PlayerPrefsManager.SetString(ModuleCache.AppData.PLAYER_PREFS_KEY_ACCOUNT, text)
			self._loginAccountText = text
			local idAndToken = string.split(text, "_")
			local password = "liuyu"
			if #idAndToken > 1 then
				password = idAndToken[2]
			end
			if self.loginView.toggleUseSimlateAcc.isOn then
				self.loginModel:connect_login_server(tonumber(idAndToken[1]), password, {testUserId = self.view.testIdInput.text})
				ModuleCache.PlayerPrefsManager.SetString("UseSimlateAcc", self.view.testIdInput.text)
			else
				self.loginModel:connect_login_server(tonumber(idAndToken[1]), password, {testUserId = ""})
			end

		end
	else
		local accountID = ModuleCache.PlayerPrefsManager.GetString(ModuleCache.AppData.PLAYER_PREFS_KEY_ACCOUNT, "0")
		local password = ModuleCache.PlayerPrefsManager.GetString(ModuleCache.AppData.PLAYER_PREFS_KEY_PASSWORD, "0")
		if accountID ~= "0" and password ~= "0" and password ~= "" then
			if self.loginView.toggleUseSimlateAcc.isOn then
				self.loginModel:connect_login_server(tonumber(accountID), password, {testUserId = self.view.testIdInput.text})
				ModuleCache.PlayerPrefsManager.SetString("UseSimlateAcc", self.view.testIdInput.text)
			else
				self.loginModel:connect_login_server(tonumber(accountID), password, {testUserId = ""})
			end


		else
			local lastUerID = ModuleCache.PlayerPrefsManager.GetString(AppData.PLAYER_PREFS_KEY_USERID, "0")
			-- 需要自动登录
			-- not autoLogin 代表手动点击
			if not autoLogin or (lastUerID == "0" and (not GameManager.isLogout)) then
				if not loginPhone then
					ModuleCache.WechatManager.init_with_appName(ModuleCache.AppData.get_app_name())
					ModuleCache.WechatManager.login(function(data)
						print_table(data, "WeChatManager.login")
						self.modelData.weXinUserData = data
						if data.token and data.token ~= "" then
							self.loginModel:connect_login_server(0, "", {weiXinCode = data.token})
						end
					end, function(error)
						ModuleCache.ModuleManager.hide_public_module("netprompt")
						print_table(error)
					end)
					ModuleCache.PlayerPrefsManager.SetInt("LastWechatLoginTime", os.time())
				else
					ModuleCache.ModuleManager.show_module("public", "phonebinding", "Login")
				end
			end
		end
	end
	GameManager.isLogout = false
	if self.loginView.toggleUseAccount.isOn then
		ModuleCache.PlayerPrefsManager.SetInt(ModuleCache.AppData.PLAYER_PREFS_KEY_TOGGLE_USE_ACCOUNT, 1)
	else
		ModuleCache.PlayerPrefsManager.SetInt(ModuleCache.AppData.PLAYER_PREFS_KEY_TOGGLE_USE_ACCOUNT, 0)
	end
	ModuleCache.SDKInterface().init_android_webviewX5()
end


function LoginModule:anonymity_login()
	local accountID = ModuleCache.PlayerPrefsManager.GetString(ModuleCache.AppData.PLAYER_PREFS_KEY_ACCOUNT, "0")
	if accountID ~= "0" then
		local password = ModuleCache.PlayerPrefsManager.GetString(ModuleCache.AppData.PLAYER_PREFS_KEY_PASSWORD, "0")

		if self.loginView.toggleUseSimlateAcc.isOn then
			self.loginModel:connect_login_server(tonumber(accountID), password, {testUserId = self.view.testIdInput.text})
			ModuleCache.PlayerPrefsManager.SetString("UseSimlateAcc", self.view.testIdInput.text)
		else
			self.loginModel:connect_login_server(tonumber(accountID), password, {testUserId = ""})
		end

	else
		self.loginModel:connect_login_server(0, "", {weiXinCode = "youke"})
	end
end

function LoginModule:_get_app_upgrade_info()
	self._get_app_upgrade_info_count = self._get_app_upgrade_info_count + 1
	self._last_get_app_upgrade_info_time = os.time()
	ModuleCache.GameManager.get_app_upgrade_info(function(wwwData)
		self._get_app_upgrade_info_callback_state = true
		if wwwData.success == true then
			if self.isDestroy then  -- 要注意缓存回调时有可能view已经销毁了
            	return
        	end
			self:_on_app_upgrade_info(wwwData.map, wwwData.clientIp)
		else
			if self._get_app_upgrade_info_count > 3 then
				self._get_app_upgrade_info_count = 0
				self:_on_get_app_upgrade_info_error(wwwData.resultCode)
			else
				self:_get_app_upgrade_info()
			end
		end
	end, function(wwwErrorString)
		--不连续请求，需要延时请求
		self._get_app_upgrade_info_callback_state = true
		if self._get_app_upgrade_info_count > 3 then
			self._get_app_upgrade_info_count = 0
			self:_on_get_app_upgrade_info_error(wwwErrorString)
		else
			local diffTime = os.time() - self._last_get_app_upgrade_info_time
			if diffTime < 1 then
				self:subscibe_time_event_on(1, function()
					self:_get_app_upgrade_info()
				end)
			else
				self:_get_app_upgrade_info()
			end
		end
	end, true)
end

function LoginModule:_on_get_app_upgrade_info_error(errorInfo)
	local title = "连接服务器失败，请检查您的网络设置"
	if errorInfo and (string.find(errorInfo, "No Internet Connection")) then
		errorInfo = "\n请检查设备的Wi-Fi和蜂窝移动数据是否已开启，并且在\"设置\"中已为此应用打开蜂窝移动数据。"
		ModuleCache.ModuleManager.show_public_module_alertdialog():show_confirm_cancel(string.format("<size=50>%s</size>\n<size=30>%s</size>", title, errorInfo), function()
			self:_get_app_upgrade_info()
		end, function ()
			ModuleCache.SDKInterface().open_ios_setting()
		end, nil, nil,"重 试", "设 置", true)
		return
	end

	ModuleCache.ModuleManager.show_public_module_alertdialog():show_center_button(string.format("<size=50>%s</size>\n<size=30>%s</size>", title, errorInfo), function()
		self:_get_app_upgrade_info()
	end, nil, nil, "重 试")
end

function LoginModule:_on_app_upgrade_info(data, ip)
	GameManager.iosAppStoreIsCheck = false
	if GameManager.customPlatformName == "IPhonePlayer" and data.checkVersion then
		local dataList = ModuleCache.GameUtil.split(data.checkVersion, ',')
		for _i, _v in ipairs(dataList) do
			if _v == GameManager.appVersion then
				local eventData = {}
				if ip then
					eventData.clientIp = ip
				end
				ModuleCache.TalkingDataMgr().setEventCheckVersion("Check_IsCheckVersion", eventData)
				GameManager.iosAppStoreIsCheck = true	--审核状态下不自动登录
				-- 提审时选择广东省的跑得快玩法
				ModuleCache.GameManager.select_province_id(2)
				ModuleCache.GameManager.select_game_id(1)
				break
			end
		end
	end

	if ModuleCache.GameManager.isEditor then
		--GameManager.iosAppStoreIsCheck = true
		--ModuleCache.GameManager.select_province_id(2)
		--ModuleCache.GameManager.select_game_id(1)
	end
	ModuleCache.ComponentUtil.SafeSetActive(self.loginView.goLogin.gameObject, true)
	if GameManager.iosAppStoreIsCheck then
		self.loginView:appstore_process()
		return
	else
		self:begin_location()
		self.view:set_button_report_active(true)
		ModuleCache.SDKInterface().is_have_record_permission()
		--ModuleCache.ComponentUtil.SafeSetActive(self.loginView.goLogin.gameObject, true)
    	--ModuleCache.ComponentUtil.SafeSetActive(self.loginView.buttonAnonymity.gameObject, false)
		--ModuleCache.GPSManager.StartGetMyGPSInfo()
	end


	if GameManager.needCheckVersionData then
		self:_check_asset_version_data(data)
	end
end

---_check_asset_version_data 检查是否数据需要更新
---@param data table
function LoginModule:_check_asset_version_data(data)
	local package = "public"
	if (GameManager.curGameId ~= 0) then
		local playMode = ModuleCache.PlayModeUtil.getInfoByGameId(GameManager.curGameId)
		package = playMode.package
	end


	ModuleCache.PackageManager.update_package_version(package, function()
		-- 更新完所有资源再去检测是否有apk、ipa需要更新
		self:process_app_version_update()
	end)
end


---process_app_version_update 处理App大版本的更新
function LoginModule:process_app_version_update()
	--是否有App新版本
	if GameManager.appAssetVersionUpdateData.appData  then
		local appData = GameManager.appAssetVersionUpdateData.appData
		if appData.forceUpgrade == 1 then
			ModuleCache.ModuleManager.show_public_module("alertdialog"):show_center_button(appData.versionDesc, function()
				if ModuleCache.GameManager.platformIsIphone then
					UnityEngine.Application.OpenURL(appData.url)
				else
					ModuleCache.ModuleManager.hide_public_module("alertdialog")
					self:_check_apk_version_data(appData,true)
				end
			end, true)
		else
			ModuleCache.ModuleManager.show_public_module("alertdialog"):show_confirm_cancel(appData.versionDesc, function()
				if ModuleCache.GameManager.platformIsIphone then
					UnityEngine.Application.OpenURL(appData.url)
				else
					ModuleCache.ModuleManager.hide_public_module("alertdialog")
					self:_check_apk_version_data(appData,true)
				end
			end, function()
				if ModuleCache.SDKInterface().get_cur_signal_type() == "wifi" then
					print("get_cur_signal_type is wifi")
					self:_check_apk_version_data(appData,false)
				end
				self:login(true)
			end)
		end
	else
		self:login(true)
	end
end

--display=false在玩家不知情的情况下更新
function LoginModule:_check_apk_version_data(data,display)
	if(data)then
		local saveDirPath = UnityEngine.Application.persistentDataPath .. "/apk"
		local intentData = {
			appData = {
				saveFilePath =  saveDirPath .. "/" .. AppData.App_Name .. "-" .. data.serverAppVersion .. ".apk",
				url = data.url,
				fileSize = 1024 * 1024 * 20,
			},
			updateFailureCallback = function(ret)	-- 更新失败需要再次走更新逻辑
				self:_get_app_upgrade_info()
			end,
			display = display,
		}
		ModuleCache.ModuleManager.show_module("public", "update", intentData)
	else

	end
end

return LoginModule



