






local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
---@class SettingModule : ModuleBase
---@field settingView SettingView
local SettingModule = class("BullFight.SettingModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local UnityEngine = UnityEngine
local PlayerPrefs = UnityEngine.PlayerPrefs


function SettingModule:initialize(...)
	-- 开始初始化                view        loginModel           模块数据
	ModuleBase.initialize(self, "setting_view", nil, ...)
	self.roleData = {}
end

-- 模块初始化完成回调，包含了view，Model初始化完成
function SettingModule:on_module_inited()
	local needUpdate = false
	if ModuleCache.GameManager.appAssetVersionUpdateData.appData or ModuleCache.GameManager.appAssetVersionUpdateData.assetData then
		needUpdate = true
	end
	self.view.updateRedTip:SetActive(needUpdate)

	self.settingView.toggleMusic.onValueChanged:AddListener(function()
		local musicVolume = 1
		if(self.settingView.toggleMusic.isOn) then musicVolume = 0 end
		ModuleCache.SoundManager.set_music_volume(musicVolume)
    	self.settingView:refresh_music_volume()
	end)
	self.settingView.toggleSound.onValueChanged:AddListener(function()
		local soundVolume = 1
		if(self.settingView.toggleSound.isOn) then soundVolume = 0 end
		ModuleCache.SoundManager.set_sound_volume(soundVolume)
		self.settingView:refresh_sound_volume()
	end)
	self.settingView.toggleYuYin.onValueChanged:AddListener(function()
		if(self.settingView.toggleYuYin.isOn) then
			PlayerPrefs.SetInt("openVoice", 0)
		else
			PlayerPrefs.SetInt("openVoice", 1)
		end
		self.settingView:refresh_YuYin()
	end)

	self.settingView.toggleZhenDong.onValueChanged:AddListener(function()
		if(self.settingView.toggleZhenDong.isOn) then
			PlayerPrefs.SetInt("openShake", 0)
		else
			PlayerPrefs.SetInt("openShake", 1)
		end
		self.settingView:refresh_ZhenDong()
	end)
end



-- 绑定module层的交互事件
function SettingModule:on_module_event_bind()

end

-- 绑定loginModel层事件，模块内交互
function SettingModule:on_model_event_bind()
	
end

function SettingModule:on_show()
	self.settingView:refreshView()
	self:get_user_info()
	local needUpdate = false

	local updatePackageAssetData = ModuleCache.PackageManager.get_app_package_update_info("public")
	if not updatePackageAssetData then
		local config = ModuleCache.PlayModeUtil.getInfoByGameId(ModuleCache.GameManager.curGameId)
		if config then
			updatePackageAssetData = ModuleCache.PackageManager.get_app_package_update_info(config.package)
		end
	end
	if updatePackageAssetData then
		needUpdate = true
	end

	if ModuleCache.GameManager.appAssetVersionUpdateData.appData then
		needUpdate = true
	end

	--print_table(ModuleCache.GameManager.appAssetVersionUpdateData)
	
	self.view.updateRedTip:SetActive(needUpdate)

    if(ModuleCache.GameManager.iosAppStoreIsCheck)then
        self.settingView.UIStateSwitcher:SwitchState("IosCheck")        
    else
        self.settingView.UIStateSwitcher:SwitchState("Normal")  
		self.settingView.buttonLogout.gameObject:SetActive(not needUpdate)
		self.settingView.buttonUpdateGame.gameObject:SetActive(needUpdate)      
		self.settingView.buttonExit.gameObject:SetActive(true)
    end  
end

function SettingModule:get_user_info()
	self:get_general_data(self.modelData.roleData.userID, function (userdata)
		self.settingView:refreshPlayerInfo(userdata)
	end)

	--local requestData = {
    --    baseUrl = ModuleCache.GameManager.netAdress.httpCurApiUrl .. "user/info?",
    --    params = {
    --        uid = self.modelData.roleData.userID,
    --    },
	--	cacheDataKey = "user/info?uid=" .. self.modelData.roleData.userID,
	--	cacheDataImmediatelyCallback = true,
    --}
	--
    --self:http_get(requestData, function(wwwOperation)
    --    local www = wwwOperation.www;
    --    local retData = ModuleCache.Json.decode(www.text)
    --    if retData.ret and retData.ret == 0 then    --OK
	--		self.settingView:refreshPlayerInfo(retData.data)
    --    else
	--
    --    end
    --end, function(error)
    --    print(error.error)
    --
    --end, function(cacheDataText)
	--	if self.isDestroy then  -- 要注意缓存回调时有可能view已经销毁了
    --        return
    --    end
    --    local retData = ModuleCache.Json.decode(cacheDataText)
    --    if retData.ret and retData.ret == 0 then    --OK
	--		self.settingView:refreshPlayerInfo(retData.data)
    --    else
	--
    --    end
    --end)
end



function SettingModule:on_click(obj, arg)	
	print(obj.name)
	ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
	if obj.name == "closeBtn" then
		ModuleCache.ModuleManager.hide_module("public", "setting")
		return
	elseif obj == self.settingView.buttonLogout.gameObject then
		ModuleCache.GameManager.logout(true);
	elseif obj == self.settingView.buttonUpdateGame.gameObject then  --更新
		if ModuleCache.GameManager.appAssetVersionUpdateData.appData then
			ModuleCache.GameManager.logout(false)
		else
			-- 需要判断是否有App更新
			local playMode = ModuleCache.PlayModeUtil.getInfoByGameId(ModuleCache.GameManager.curGameId)
			ModuleCache.PackageManager.update_package_version(playMode.package, function()
				ModuleCache.ModuleManager.show_module("public", "hall")
				self:hide()
			end)
		end
		--ModuleCache.GameManager.logout(false)
	elseif obj.name == "ButtonClearPlayerPrefs" then
		local useTestDevelopMod = ModuleCache.PlayerPrefsManager.GetInt(ModuleCache.AppData.USE_TEST_DEVELOP_MOD, 0)
		local OpenDevelopmentMode = ModuleCache.PlayerPrefsManager.GetInt(ModuleCache.AppData.PLAYER_PREFS_KEY_OpenDevelopmentMode, 0)
		ModuleCache.PlayerPrefsManager.DeleteAll()
		ModuleCache.PlayerPrefsManager.SetInt(ModuleCache.AppData.USE_TEST_DEVELOP_MOD, useTestDevelopMod)
		ModuleCache.PlayerPrefsManager.SetInt(ModuleCache.AppData.PLAYER_PREFS_KEY_OpenDevelopmentMode, OpenDevelopmentMode)
		ModuleCache.GameManager.reboot()
	elseif obj == self.settingView.buttonClear.gameObject then
		ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common(string.format("重置系统将清除所有本地数据，是否重置？"), function()
			ModuleCache.GameManager.repair()
		end, nil)
	elseif obj == self.settingView.buttonExit.gameObject then
		ModuleCache.ModuleManager.show_public_module("alertdialog"):show_common(string.format("您确定要退出游戏？"), function()
			UnityEngine.Application.Quit()
		end, nil)
	elseif(obj.name == 'ButtonUploadLog')then
		ModuleCache.ModuleManager.show_public_module("netprompt")
		ModuleCache.LogManager.upload_log_archive(nil, function()
			ModuleCache.ModuleManager.hide_public_module("netprompt")
			ModuleCache.ModuleManager.show_public_module("alertdialog"):show_center_button('上传日志信息成功')
		end, function()
			ModuleCache.ModuleManager.show_public_module("netprompt")
		end, function(err)
			ModuleCache.ModuleManager.hide_public_module("netprompt")
			ModuleCache.ModuleManager.show_public_module("alertdialog"):show_center_button(err)
		end)
	end
end




return SettingModule



