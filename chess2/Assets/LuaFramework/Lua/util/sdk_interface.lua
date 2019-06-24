local AppData = AppData
local GameSDKInterface = LuaBridge.GameSDKInterface.instance
---@class SDKInterface
local SDKInterface = {}
local ModuleCache = ModuleCache

local deviceUniqueIdentifier

function SDKInterface.init()

end

function SDKInterface.get_cur_signal_strength()
    local strength = 4
    if AppData.isiPhoneXs then
        if not ModuleCache.AppData.Is_Independent_App and ModuleCache.GameManager.appVersion ~= "1.6.0" then
            --strength = GameSDKInterface:GetCurSignalStrenth(true)
            return 4
        end
    else
        strength = GameSDKInterface:GetCurSignalStrenth()
    end
    return strength < 0 and 4 or strength
end

function SDKInterface.get_cur_signal_type()
    local type = "wifi"
    if AppData.isiPhoneXs then
        if not ModuleCache.AppData.Is_Independent_App and ModuleCache.GameManager.appVersion ~= "1.6.0" then
            type = GameSDKInterface:GetCurSignalType(true)
        end
    else
        type = GameSDKInterface:GetCurSignalType()
    end

    if ModuleCache.GameManager.platformIsIphone then
        if type == "0" then
            type = "none"
        elseif type == "1" then
            type = "wifi"
        elseif type == "2" then
            type = "4g"
        else
            type = "wifi"
        end
        return type
    end
    return type == "none" and "wifi" or type
end

-- 打开相册
function SDKInterface:open_pick(jsonStr)
    if ModuleCache.GameManager.platformIsAndroid then
        ModuleCache.GameSDKInterface:OpenPick(jsonStr)
    elseif ModuleCache.GameManager.platformIsIphone then
        if AppData.Is_Independent_App then
            ModuleCache.GameSDKInterface:OpenPick()
        else
            ModuleCache.GameSDKInterface:OpenPick("")
        end
    end
end


-- 保存图片到相册
function SDKInterface:saveImageToGallery(sourceImagePath, dcimName, storeImageName)
    -- 独立app（ 没有SaveImageToGallery 接口） 或者编辑器
    if ModuleCache.GameManager.runtimePlatform =="OSXEditor" or ModuleCache.GameManager.runtimePlatform  == "WindowsEditor" or  AppData.Is_Independent_App then
        local savelPath = ModuleCache.UnityEngine.Application.persistentDataPath .. "/CustomerService/"..storeImageName
        if ModuleCache.GameManager.runtimePlatform == "Android" then
            if ModuleCache.FileUtility.DirectoryExists("/mnt/sdcard/DCIM/Camera/") then
                savelPath = "/mnt/sdcard/DCIM/Camera/"..storeImageName
            else
                savelPath = "/mnt/sdcard/DCIM/camera/"..storeImageName
            end
        end

        local textureBytes = ModuleCache.GameUtil.file_load( sourceImagePath)
        if ModuleCache.GameManager.isEditor then
            textureBytes = ModuleCache.FileUtility.ReadAllBytes( sourceImagePath)
        end
        return ModuleCache.FileUtility.SaveFile(savelPath, textureBytes, false)
    else
        if ModuleCache.GameManager.platformIsAndroid then
            return ModuleCache.GameSDKInterface:SaveImageToGallery(sourceImagePath, dcimName, storeImageName)
        elseif ModuleCache.GameManager.platformIsIphone then
            return ModuleCache.GameSDKInterface:SaveImageToGallery(sourceImagePath, dcimName, storeImageName)
        end
    end
end

function SDKInterface.is_app_exisit(appName, bootDownload)
    local exist = true
    if appName == "XianLiao" then
        if ModuleCache.GameManager.platformIsIphone then
            exist = ModuleCache.GameSDKInterface:IsAppExist("xianliao://")
        else
            exist = ModuleCache.GameSDKInterface:IsAppExist("org.xianliao")
        end
    elseif appName == "LiaoBei" then
        if ModuleCache.GameManager.platformIsIphone then
            exist = ModuleCache.GameSDKInterface:IsAppExist("liaobeisdk://")
        else
            exist = ModuleCache.GameSDKInterface:IsAppExist("com.yunzhan.liaobei")
        end
    end
    if not exist and bootDownload then
        ModuleCache.ModuleManager.show_public_module_alertdialog():show_confirm_cancel("检测到您尚未安装此App，是否前往下载", function()
            if appName == "XianLiao" then
                ModuleCache.UnityEngine.Application.OpenURL("https://www.updrips.com/")
            elseif appName == "LiaoBei" then
                ModuleCache.UnityEngine.Application.OpenURL("https://www.liaobe.cn/")
            end
        end)
    end
    return exist
end

function SDKInterface.open_wexin_app()
    if ModuleCache.GameManager.platformIsIphone then
        ModuleCache.GameSDKInterface:StartApp("weixin://")
    else
        UnityEngine.Application.OpenURL("weixin://")
        --ModuleCache.GameSDKInterface:StartApp("com.tencent.mm/com.tencent.mm.ui.LauncherUI")
    end
end

function SDKInterface.is_have_record_permission()
    if ModuleCache.GameManager.platformIsAndroid then
        return true
        --return GameSDKInterface:PermissionCheck("android.permission.RECORD_AUDIO")
        --local data = {
        --    eventName = "IsHasRecordPermission"
        --}
        --return SDKInterface.common_request(data) == "true"
    elseif ModuleCache.GameManager.platformIsIphone then
        if not SDKInterface._typeUserAuthorizationMicrophone then
            SDKInterface._typeUserAuthorizationMicrophone = tolua.getfield(typeof('UnityEngine.UserAuthorization'), 'Microphone'):Get(nil)
        end

        SDKInterface._hasUserAuthorization = ModuleCache.UnityEngine.Application.HasUserAuthorization(SDKInterface._typeUserAuthorizationMicrophone)
        if not SDKInterface._hasUserAuthorization then
            if ModuleCache.PlayerPrefsManager.GetString("Ios_RequestUserAuthorization" ,"") == "" then
                ModuleCache.UnityEngine.Application.RequestUserAuthorization(SDKInterface._typeUserAuthorizationMicrophone)
                ModuleCache.PlayerPrefsManager.SetString("Ios_RequestUserAuthorization" ,"RequestUserAuthorization")
            end
        end
        return SDKInterface._hasUserAuthorization
    else
        return false
    end
end


function SDKInterface.common_request(data)
    if data and data.eventName then
        data.eventId = data.eventName
    end
    local text = ModuleCache.Json.encode(data)
    print(text)
    return ModuleCache.GameSDKInterface:CommonRequest(text)
end

function SDKInterface.init_app(data)
    ModuleCache.GameSDKInterface:InitApp(ModuleCache.Json.encode(data))
end

function SDKInterface.open_ios_setting()
    ModuleCache.GameSDKInterface:CommonRequest(ModuleCache.Json.encode({eventId = "OpenSettings"}))
end


--初始化腾讯X5插件
function SDKInterface.init_android_webviewX5()
    if ModuleCache.GameManager.platformIsAndroid and not ModuleCache.AppData.Is_Independent_App then
        if ModuleCache.CustomerUtil.VersionCompare(ModuleCache.GameManager.appVersion, "1.7.2") then
            ModuleCache.GameSDKInterface:InitApp(ModuleCache.Json.encode({initQbSdk = 1}))
        end
    end
end

--是否支持WebGame
function SDKInterface.is_support_webgame()
    local minimumSupportAppversion = "0.1.0"
    if ModuleCache.AppData.Is_Independent_App then
        minimumSupportAppversion = "2.5.4"
    else
        minimumSupportAppversion = "1.7.3"
    end

    if ModuleCache.CustomerUtil.VersionCompare(ModuleCache.GameManager.appVersion, minimumSupportAppversion) then
        return true
    end
    if(ModuleCache.GameManager.isEditor)then
        return true
    end
    return false
end



function SDKInterface.is_gvoide_inited()
    return true
end

function SDKInterface.open_ios_setting()
    local data = {
        eventId = "OpenSettings"
    }
    ModuleCache.GameSDKInterface:CommonRequest(ModuleCache.Json.encode(data))
end


function SDKInterface.get_idfa()
    if not deviceUniqueIdentifier then
        if ModuleCache.GameManager.platformIsIphone then
            --deviceUniqueIdentifier = "I-" .. tostring(ModuleCache.GameSDKInterface:GetIDFA())
            deviceUniqueIdentifier = ModuleCache.PlayerPrefsManager.GetString("Ios_DeviceUniqueIdentifier" ,"")
            if deviceUniqueIdentifier == "" then
                deviceUniqueIdentifier = "I-" .. os.time() .. tostring(Util.guid())
                ModuleCache.PlayerPrefsManager.SetString("Ios_DeviceUniqueIdentifier" ,deviceUniqueIdentifier)
            end
        else
            local t = typeof('UnityEngine.SystemInfo')
            deviceUniqueIdentifier = tolua.getproperty(t, 'deviceUniqueIdentifier'):Get(nil, nil)
            if ModuleCache.GameManager.platformIsAndroid then
                deviceUniqueIdentifier = "A-" .. deviceUniqueIdentifier
            end
        end
    end
    return deviceUniqueIdentifier
end


-- 保存图片到相册
-- <param name="sourceImagePath">原始图片的完整路径</param>
-- <param name="dcimName">保存到相册中的某个文件夹 如 Game</param>
-- <param name="storeImageName">保存的图片文件名 如game.jpg</param>
function SDKInterface.save_image_to_gallery(sourceImagePath, dcimName, storeImageName)
    if ModuleCache.GameManager.platformIsIphone and ModuleCache.GameManager.appVersion == "1.6.0" then

    else
        ModuleCache.GameSDKInterface:SaveImageToGallery(sourceImagePath, dcimName, storeImageName)
    end
end



return SDKInterface