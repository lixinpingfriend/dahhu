


local Class = require("lib.middleclass")
local View = require('core.mvvm.view_base')
-- ==========================================================================

---@class SettingView
local SettingView = Class('settingView', View)

local ModuleCache = ModuleCache

local ComponentTypeName = ModuleCache.ComponentTypeName
local GetComponentWithPath = ModuleCache.ComponentManager.GetComponentWithPath
local GetComponent = ModuleCache.ComponentManager.GetComponent
local ComponentUtil = ModuleCache.ComponentUtil
local PlayerPrefs = UnityEngine.PlayerPrefs

function SettingView:initialize(...)

    -- 初始View
    View.initialize(self, "public/module/setting/public_windowsetting.prefab", "Public_WindowSetting", 1)
    View.set_1080p(self)
    -- buttons
    self.buttonClear         = GetComponentWithPath(self.root, "Center/Buttons/ButtonClear", ComponentTypeName.Button)
    self.buttonUpdateGame    = GetComponentWithPath(self.root, "Center/Buttons/ButtonUpdate", ComponentTypeName.Button)
    self.buttonLogout        = GetComponentWithPath(self.root, "Center/Buttons/ButtonChange", ComponentTypeName.Button)
    self.buttonExit          = GetComponentWithPath(self.root, "Center/Buttons/ButtonExitGame", ComponentTypeName.Button)
    self.buttonClearPlayerPrefs          = GetComponentWithPath(self.root, "Center/Buttons/ButtonClearPlayerPrefs", ComponentTypeName.Button)
    self.updateRedTip        = GetComponentWithPath(self.root, "Center/Buttons/ButtonUpdate/RedTip", ComponentTypeName.Transform).gameObject

    -- toggle
    self.toggleYuYin         = GetComponentWithPath(self.root, "Center/ToggleYuYin", ComponentTypeName.Toggle)
    self.toggleZhenDong      = GetComponentWithPath(self.root, "Center/ToggleZhenDong", ComponentTypeName.Toggle)
    self.toggleMusic         = GetComponentWithPath(self.root, "Center/ToggleMusic", ComponentTypeName.Toggle)
    self.toggleSound         = GetComponentWithPath(self.root, "Center/ToggleSound", ComponentTypeName.Toggle)

    -- role
    self.textPlayerName      = GetComponentWithPath(self.root, "Center/Name", ComponentTypeName.Text)
    self.imagePlayerHeadIcon = GetComponentWithPath(self.root, "Center/Role/Avatar/Avatar/Image", ComponentTypeName.Image)
    self.imageMen            = GetComponentWithPath(self.root, "Center/MenImg", ComponentTypeName.Transform).gameObject
    self.imageWomen          = GetComponentWithPath(self.root, "Center/WomenImg", ComponentTypeName.Transform).gameObject
    self.textPlayerID        = GetComponentWithPath(self.root, "Center/Role/ID/TextID", ComponentTypeName.Text)
    self.textLocation        = GetComponentWithPath(self.root, "Center/Location", ComponentTypeName.Text)

    -- app info
    self.textAppLv           = GetComponentWithPath(self.root, "Center/AppLv", ComponentTypeName.Text)
    self.textResLv           = GetComponentWithPath(self.root, "Center/ResLv", ComponentTypeName.Text)
    self.textPackageLv       = GetComponentWithPath(self.root, "Center/PackageLv", ComponentTypeName.Text)

    -- UIstate
    self.UIStateSwitcher = ModuleCache.ComponentManager.GetComponent(self.root, "UIStateSwitcher")
    self.buttonClearPlayerPrefs.gameObject:SetActive(ModuleCache.GameManager.developmentMode)
    self:refreshView()

    if ModuleCache.GameManager.iosAppStoreIsCheck then
        ModuleCache.ComponentManager.Find(self.root, "Center/Buttons/ButtonUploadLog"):SetActive(false)
        ModuleCache.ComponentManager.Find(self.root, "Center/ToggleYuYin"):SetActive(false)
    end
end

function SettingView:refreshPlayMode()

end

function SettingView:refreshView()    
    self:refresh_music_volume()
    self:refresh_sound_volume()
    
    self:refresh_YuYin()
    self:refresh_ZhenDong()

    self:refreshAppdata()
end

function SettingView:refresh_YuYin()
    local openVoice = (PlayerPrefs.GetInt("openVoice", 1) == 1)
    local select = GetComponentWithPath(self.toggleYuYin.gameObject, "select", ComponentTypeName.Transform).gameObject
    local unselect = GetComponentWithPath(self.toggleYuYin.gameObject, "unselect", ComponentTypeName.Transform).gameObject
    self.toggleYuYin.isOn = not openVoice
    ComponentUtil.SafeSetActive(select, not openVoice)
    ComponentUtil.SafeSetActive(unselect, openVoice)
end

function SettingView:refresh_ZhenDong()
    local openShake = (PlayerPrefs.GetInt("openShake", 1) == 1)
    local select = GetComponentWithPath(self.toggleZhenDong.gameObject, "select", ComponentTypeName.Transform).gameObject
    local unselect = GetComponentWithPath(self.toggleZhenDong.gameObject, "unselect", ComponentTypeName.Transform).gameObject
    self.toggleZhenDong.isOn = not openShake
    ComponentUtil.SafeSetActive(select, not openShake)
    ComponentUtil.SafeSetActive(unselect, openShake)
end

function SettingView:refresh_music_volume()
    local value = ModuleCache.SoundManager.get_music_volume()    
    local select = GetComponentWithPath(self.toggleMusic.gameObject, "select", ComponentTypeName.Transform).gameObject
    local unselect = GetComponentWithPath(self.toggleMusic.gameObject, "unselect", ComponentTypeName.Transform).gameObject
    self.toggleMusic.isOn = (value <= 0)
    ComponentUtil.SafeSetActive(select, value <= 0)
    ComponentUtil.SafeSetActive(unselect, value > 0)
end

function SettingView:refresh_sound_volume()
    local value = ModuleCache.SoundManager.get_sound_volume()
    local select = GetComponentWithPath(self.toggleSound.gameObject, "select", ComponentTypeName.Transform).gameObject
    local unselect = GetComponentWithPath(self.toggleSound.gameObject, "unselect", ComponentTypeName.Transform).gameObject
    self.toggleSound.isOn = (value <= 0)
    ComponentUtil.SafeSetActive(select, value <= 0)
    ComponentUtil.SafeSetActive(unselect, value > 0)
end

function SettingView:refreshPlayerInfo(roleData)
    -- ModuleCache.GPSManager:GetMyGPSInfo() 
    self.textLocation.text = ModuleCache.GPSManager.gpsAddress or ""
    self.imagePlayerHeadIcon.sprite = roleData.headSprite
    self.textPlayerName.text = roleData.uiContractionsNickname
    self.textPlayerID.text = roleData.uiUserId
    self.imageMen:SetActive(not (roleData.gender == 2))
    self.imageWomen:SetActive(roleData.gender == 2)
end


function SettingView:refreshAppdata()
    self.textAppLv.text = "App版本号: "..ModuleCache.GameManager.appVersion.."|"..(ModuleCache.GameManager.appInternalAssetVersion or "0")
    self.textResLv.text = "Res版本号: "..(ModuleCache.GameManager.appAssetVersion or "0")
    self.textPackageLv.text = "Package版本号: "..(ModuleCache.GameManager.get_cur_package_version() or "0")
end


return SettingView