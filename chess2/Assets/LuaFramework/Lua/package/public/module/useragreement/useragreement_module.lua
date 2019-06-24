






local class = require("lib.middleclass")
local ModuleBase = require("core.mvvm.module_base")
local UserAgreementModule = class("BullFight.UserAgreementModule", ModuleBase)

-- 常用模块引用
local ModuleCache = ModuleCache
local NetClientManager = ModuleCache.net.NetClientManager
local UnityEngine = UnityEngine
local needButtonOpenTestPanelClickCount = 8


function UserAgreementModule:initialize(...)
	ModuleBase.initialize(self, "userAgreement_view", nil, ...)

	self.buttonOpenTestPanelClickCount = 0
	self.buttonOpenTestPanelClickCount2 = 0
end


function UserAgreementModule:on_show()
	self.buttonOpenTestPanelClickCount = 0
	self.buttonOpenTestPanelClickCount2 = 0
	if ModuleCache.GameManager.channel == "Official" then
		self.userAgreementView.gameObjectPanelText:SetActive(true)
	end
	self.userAgreementView.gameObjectPanelTest:SetActive(false)
	self.userAgreementView.gameObjectPanelTestVerify:SetActive(false)
 	self.OpenDevelopmentMode = ModuleCache.PlayerPrefsManager.GetInt(ModuleCache.AppData.PLAYER_PREFS_KEY_OpenDevelopmentMode, 0)
	if ModuleCache.GameConfigProject.developmentMode or self.OpenDevelopmentMode == 1 then
		--self.userAgreementView.gameObjectPanelText:SetActive(false)
		needButtonOpenTestPanelClickCount = 0
	end
end


function UserAgreementModule:on_click(obj, arg)		
	if obj == self.userAgreementView.buttonClose.gameObject then
		ModuleCache.SoundManager.play_sound("public", "public/sound/button.bytes", "button")
		ModuleCache.ModuleManager.hide_module("public", "useragreement")

	elseif obj.name == "ButtonOpenTestPanel1" then
		self.buttonOpenTestPanelClickCount = self.buttonOpenTestPanelClickCount + 1
		if self.buttonOpenTestPanelClickCount > needButtonOpenTestPanelClickCount then
			self.userAgreementView.gameObjectPanelText:SetActive(false)
			self.userAgreementView.gameObjectPanelText_HAOCAI:SetActive(false)
			if ModuleCache.GameConfigProject.developmentMode or self.OpenDevelopmentMode == 1 then
				self.userAgreementView.gameObjectPanelTest:SetActive(true)
			else
				self.userAgreementView.gameObjectPanelTestVerify:SetActive(true)
			end
		end
	elseif obj.name == "ButtonPanelTestVerify" then
		if self.userAgreementView.inputTestVerify.text == "20181111" then
			self.userAgreementView.gameObjectPanelTest:SetActive(true)
			self.userAgreementView.gameObjectPanelTestVerify:SetActive(false)
		end
	elseif obj.name == "ButtonConnectTestServer" then--[[]]
		ModuleCache.GameManager.isTestUser = true
		ModuleCache.PlayerPrefsManager.SetInt(ModuleCache.AppData.PLAYER_PREFS_KEY_OpenDevelopmentMode, 1)
		ModuleCache.PlayerPrefsManager.SetInt(ModuleCache.AppData.USE_TEST_DEVELOP_MOD, 1)
		ModuleCache.GameManager.tester = true
		ModuleCache.GameConfigProject.developmentMode = true
		ModuleCache.GameManager.developmentMode = true
		ModuleCache.GameManager.gameConfigProjectHttpApiUrl = ModuleCache.AppData.ServerHostData.test
		ModuleCache.GameManager.Server_Host = ModuleCache.AppData.ServerHostData.test
		ModuleCache.GameManager.open_print()
		ModuleCache.GameManager.set_server_host()
		ModuleCache.GameManager.set_upgrade_net_adres(true)
		ModuleCache.GameManager.get_and_set_net_adress()
		ModuleCache.GameManager.logout()
	elseif obj.name == "ButtonConnectTestServer2" then--[[]]
		ModuleCache.GameManager.isTestUser = true
		ModuleCache.PlayerPrefsManager.SetInt(ModuleCache.AppData.PLAYER_PREFS_KEY_OpenDevelopmentMode, 1)
		ModuleCache.PlayerPrefsManager.SetInt(ModuleCache.AppData.USE_TEST_DEVELOP_MOD, 2)
		ModuleCache.GameManager.tester = true
		ModuleCache.GameConfigProject.developmentMode = true
		ModuleCache.GameManager.developmentMode = true
		if ModuleCache.AppData.ServerHostData.test2 then
			ModuleCache.GameManager.gameConfigProjectHttpApiUrl = ModuleCache.AppData.ServerHostData.test2
			ModuleCache.GameManager.Server_Host = ModuleCache.AppData.ServerHostData.test2
		else
			ModuleCache.GameManager.gameConfigProjectHttpApiUrl = ModuleCache.AppData.ServerHostData.test
			ModuleCache.GameManager.Server_Host = ModuleCache.AppData.ServerHostData.test
		end

		ModuleCache.GameManager.open_print()
		ModuleCache.GameManager.set_server_host()
		ModuleCache.GameManager.set_upgrade_net_adres(true)
		ModuleCache.GameManager.get_and_set_net_adress()
		ModuleCache.GameManager.logout()
	elseif obj.name == "ButtonConnectProductServer" then
		ModuleCache.GameManager.isTestUser = true
		ModuleCache.PlayerPrefsManager.SetInt(ModuleCache.AppData.USE_TEST_DEVELOP_MOD, 0)
		if self.view.toggleOpenDevelopModel.isOn then
			ModuleCache.GameConfigProject.developmentMode = true
			ModuleCache.GameManager.developmentMode = true
		else
			ModuleCache.GameConfigProject.developmentMode = false
			ModuleCache.GameManager.developmentMode = false
		end
		ModuleCache.GameManager.open_print()
		ModuleCache.GameManager.gameConfigProjectHttpApiUrl = ModuleCache.AppData.ServerHostData.api
		ModuleCache.GameManager.Server_Host = ModuleCache.AppData.ServerHostData.api
		ModuleCache.GameManager.set_server_host()
		ModuleCache.GameManager.set_upgrade_net_adres()
		ModuleCache.GameManager.get_and_set_net_adress()
		ModuleCache.GameManager.logout()
	else

		self.buttonOpenTestPanelClickCount = 0
		self.buttonOpenTestPanelClickCount2 = 0
	end
end


return UserAgreementModule



