
local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

---@class LoginView
local LoginView = Class('loginView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath

function LoginView:initialize(...)
    -- 初始View
    View.initialize(self, "public/module/login/public_windowlogin.prefab", "Public_WindowLogin", 0)
    self.goPannelTest = ModuleCache.ComponentUtil.Find(self.root, "PannelTest")

    self.inputAccount = GetComponentWithPath(self.root, "PannelTest/InputAccount", ComponentTypeName.InputField)
    self.testIdInput = GetComponentWithPath(self.root, "PannelTest/InputField",ComponentTypeName.InputField)
    self.toggleUseAccount = GetComponentWithPath(self.root, "PannelTest/ToggleUseAccount", ComponentTypeName.Toggle)
    self.textVersion = GetComponentWithPath(self.root, "version/TextVersion", ComponentTypeName.Text)
    self.toggleUserAgreement = GetComponentWithPath(self.root, "ToggleUserAgreement", ComponentTypeName.Toggle)

    self.toggleUseSimlateAcc = GetComponentWithPath(self.root, "PannelTest/ToggleUseSimlateAcc", ComponentTypeName.Toggle)

    self.goLogin = ModuleCache.ComponentManager.Find(self.root, "Login")
    self.buttonLoginPhone = GetComponentWithPath(self.root, "Login/ButtonLoginPhone", ComponentTypeName.Button)
    self.buttonAnonymity = GetComponentWithPath(self.root, "Login/ButtonAnonymity", ComponentTypeName.Button)

    self.testPanel = GetComponentWithPath(self.root, "TestPanel",ComponentTypeName.Transform).gameObject

    self.defaultHead =  GetComponentWithPath(self.root, "Background/defaultHead",ComponentTypeName.Image)
    self.repairDialogObj =  GetComponentWithPath(self.root, "repairDialog",ComponentTypeName.Transform).gameObject

    ModuleCache.ComponentUtil.SafeSetActive(self.goLogin, false)
    ModuleCache.ComponentUtil.SafeSetActive(self.buttonAnonymity.gameObject, false)

    if not ModuleCache.GameConfigProject.developmentMode then
        ModuleCache.ComponentUtil.SafeSetActive(self.testPanel, false)
    end

    if ModuleCache.GameManager.channel == "HAOCAI" then
        local logSprite = ModuleCache.ViewUtil.GetSpriteFromeAssetBundle("public/module/login/public_loginhaocai.atlas", "logo_HaoCai")
        local imageLog = GetComponentWithPath(self.root, "Logo",ComponentTypeName.Image)
        imageLog.sprite = logSprite
        imageLog:SetNativeSize()
        self.stateSwitcher = ModuleCache.ComponentManager.GetComponent(self.root, "UIStateSwitcher")
        self.stateSwitcher:SwitchState("HAOCAI")
    end

    if ModuleCache.GameManager.platformIsIphone and ModuleCache.PlayerPrefsManager.GetString(ModuleCache.AppData.PLAYER_PREFS_KEY_USERID, "0") == "0" then
        self:set_button_report_active(false)
    end

    self.toggleUseSimlateAcc.isOn = false
	self.testIdInput.text =  ModuleCache.PlayerPrefsManager.GetString("UseSimlateAcc", "")
	local Manager = require("package.public.module.function_manager")
	self:fixed_tran_size(Manager.FindObject(self.root, "version"), 0.93)
	self:fixed_tran_size(Manager.FindObject(self.root, "RightButton"), 0.93)
end

function LoginView:appstore_process()
    self.stateSwitcher = ModuleCache.ComponentManager.GetComponent(self.root, "UIStateSwitcher")
    self.stateSwitcher:SwitchState("AppStore")
end

function LoginView:set_button_report_active(state)
    ModuleCache.ComponentManager.Find(self.root, "RightButton/ButtonReport"):SetActive(state)
end

function LoginView:on_view_init() 
end

return LoginView