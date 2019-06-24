




local ModuleCache = ModuleCache
--local print = print
local UnityEngine = UnityEngine
local GameObject = UnityEngine.GameObject
---@type AppData
local AppData = AppData
---@type GameUtil
local Util = Util
local table = table
local string = string


---@class GameManager
local GameManager = {}

GameManager.developmentMode = false

--是否是测试人员
GameManager.tester = false
-- 初始化地址
GameManager.Server_Host = nil
GameManager.Server_Host_Gold = nil

-- 大众玩法的地址
GameManager.Public_Server_Host = nil

GameManager.appVersion = UnityEngine.Application.version
GameManager.appAssetVersion = 0
GameManager.appLocalAssetVersion = 0
GameManager.curPackageVersion = 0
-- 锁定版本不更新
GameManager.lockAssetUpdate = false

-- 渠道
GameManager.channel = "Official"

GameManager.netAdress = {}
GameManager.netAdress.httpCurApiUrl = nil
-- 当前的服务器ip
GameManager.netAdress.curServerHostIp = nil

GameManager.netAdress._httpApiUrlList = nil

--Android=1 iOS=2 用于版本升级、审核
GameManager.customOsType = nil
--Android 或者 IPhonePlayer  用于更新资源、地址分配
GameManager.customPlatformName = nil
-- 是否为手机设备
GameManager.deviceIsMobile = nil

-- ios版本是否在审核
GameManager.iosAppStoreIsCheck = false

-- 是否需要热更新资源
GameManager.needCheckVersionData = true

-- 在进入大厅时是否需要自动显示活动界面
GameManager.isNeedShowActivity = true

-- 当前选择的省份
GameManager.curProvince = 0
-- 是否第一次进游戏
GameManager.isFirstInGame = false

-- 当前选择的玩法的gameid 我数字
GameManager.curGameId = 0
-- 当前选择的玩法所在地区
GameManager.curLocation = 1

GameManager.isEditor = false

-- 是否开启服务器灰度测试
GameManager.openGameServerGradationTest = false

-- 是否为测试者
GameManager.isTestUser = false

-- 版本更新资源数据
GameManager.appAssetVersionUpdateData = {
    appData = nil,
    assetData = nil,
}



GameManager.print_toggle_data = {}

GameManager.gameRoot = nil

function GameManager.init()
    GameManager.modeData = require("package.public.model.model_data")

    UnityEngine.Application.targetFrameRate = 30
    GameManager.set_client_asset_version()
    GameManager.developmentMode = ModuleCache.GameConfigProject.developmentMode
    if ModuleCache.GameConfigProject.channel ~= "" then
        GameManager.channel = ModuleCache.GameConfigProject.channel
    end
    GameManager.customPlatformName = ModuleCache.CustomerUtil.platform
    GameManager.gameConfigProjectHttpApiUrl = ModuleCache.GameConfigProject.httpApiUrl

    if GameManager.developmentMode or ModuleCache.PlayerPrefsManager.GetInt(ModuleCache.AppData.PLAYER_PREFS_KEY_OpenDevelopmentMode, 0) == 1 then
        GameManager.tester = true
    end

    if GameManager.customPlatformName == "iOS" then
        GameManager.customOsType = 2
        GameManager.customPlatformName = "IPhonePlayer"
        GameManager.deviceIsMobile = true
        GameManager.platformIsIphone = true
    elseif GameManager.customPlatformName == "Windows" then
        GameManager.customOsType = 3
        --GameManager.developmentMode = true
    elseif GameManager.customPlatformName == "OSX" then
        GameManager.customOsType = 4
        --GameManager.developmentMode = true
    else
        GameManager.platformIsAndroid = true
        GameManager.customOsType = 1
        GameManager.deviceIsMobile = true
    end

    local t = typeof('UnityEngine.SystemInfo')
    local property = tolua.getproperty(t, 'deviceModel')
    GameManager.deviceModel = property:Get(nil, nil)

    property = tolua.getproperty(t, 'operatingSystem')
    GameManager.operatingSystem = property:Get(nil, nil)

    GameManager.needCheckVersionData = true
    local runtimePlatform = tostring(UnityEngine.Application.platform)
    GameManager.runtimePlatform = runtimePlatform

    GameManager.isEditor = false
    if runtimePlatform == "OSXEditor" or runtimePlatform == "WindowsEditor" then
        GameManager.isEditor = true
        if ModuleCache.GameConfigProject.assetLoadType == 0 then
            GameManager.needCheckVersionData = false
            GameManager.deviceIsMobile = false
        end
    end

    if GameManager.channel == "HAOCAI" and ModuleCache.PlayerPrefsManager.GetString("AppChannel", "") ~= "HAOCAI" then
        ModuleCache.PlayerPrefsManager.DeleteAll()
        ModuleCache.PlayerPrefsManager.SetString("AppChannel", GameManager.channel)
    end


    GameManager.select_province_id(ModuleCache.PlayerPrefsManager.GetInt(AppData.PLAYER_PREFS_KEY_PROVINCE, 0))
    ModuleCache.WechatManager._onGetIpsByHttpDNSResult = function(ipList)
        --GameManager.set_net_adress(ipList)
    end
    GameManager.set_upgrade_net_adres()
    GameManager.set_net_adress(ModuleCache.GameSDKInterface:GetIpsByHttpDNS(GameManager.Server_Host))

    local user = ModuleCache.PlayerPrefsManager.GetString(ModuleCache.AppData.PLAYER_PREFS_KEY_ACCOUNT, "noUser")
    GameManager.isFirstInGame = ModuleCache.PlayerPrefsManager.GetInt(AppData.PLAYER_PREFS_KEY_PLAY_MODE_SET.."_"..user, 0) == 0
    GameManager.lockAssetUpdate = ModuleCache.PlayerPrefsManager.GetInt(AppData.PLAYER_PREFS_KEY_LOCK_ASSET, 0) == 1


    if not GameManager.isFirstInGame then
        if GameManager.curGameId ~= 0 and GameManager.curProvince ~= 0 then
            ModuleCache.PlayerPrefsManager.SetInt(AppData.PLAYER_PREFS_KEY_PLAY_MODE_SET.."_"..user, 1)
            GameManager.isFirstInGame = false
        end
    end
    --GameManager.get_mw_data("%7b%22parlorId%22%3a%220%22%2c%22ruleMsg%22%3a%228%e5%b1%80%204%e4%ba%ba%e7%8e%a9%e6%b3%95%20%e5%ba%84%e5%ae%b6%e5%b8%a6%202%e9%a9%ac%20%e5%8a%a0%e9%a9%ac%202%e9%a9%ac%20%e9%a9%ac%e8%b7%9f%e6%9d%a0%20%e5%b0%81%e9%a1%b6%2010%e9%a9%ac%20AA%e6%94%af%e4%bb%98%20%22%2c%22local%22%3a%22%e6%99%ae%e5%ae%81%e5%ae%a2%e5%ae%b6%22%2c%22gameName%22%3a%22DHGDQP_PNMJ%22%2c%22roomType%22%3a0%2c%22roomId%22%3a%22771463%22%2c%22type%22%3a2%7d")
end

function GameManager.getCurGameId()
    local provinceId = GameManager.getCurProvinceId()
    local province = ModuleCache.PlayModeUtil.getProvinceById(provinceId)
    local gameId = ModuleCache.PlayerPrefsManager.GetInt(AppData.PLAYER_PREFS_KEY_PLAY_MODE .. "_" .. province.gameName, 0)
    -- 湖北大冶的玩法全部转到黄石市下
    if provinceId == 10 then
        if gameId == 201 then
            gameId = 302
        elseif gameId == 202 then
            gameId = 303
        --[[elseif gameId == 701 then
            gameId = 201--]]
        end
    end
    return gameId
end

function GameManager.getCurProvinceId()
    local id = ModuleCache.PlayerPrefsManager.GetInt(AppData.PLAYER_PREFS_KEY_PROVINCE, 0)
    return id
end

-- 设置GameManager中的Server_Host，这是游戏中真正用于请求的ip
function GameManager.set_server_host()
    if not AppData.ServerHostData then
        return
    end
    if GameManager.deviceIsMobile and ModuleCache.PlayerPrefsManager.GetInt(ModuleCache.AppData.USE_TEST_DEVELOP_MOD, 0) > 0 then
        ModuleCache.GameConfigProject.developmentMode = true
        GameManager.developmentMode = true
        GameManager.isTestUser = true
        if ModuleCache.PlayerPrefsManager.GetInt(ModuleCache.AppData.USE_TEST_DEVELOP_MOD, 0) == 2 and AppData.ServerHostData.test2 then
            GameManager.Server_Host = AppData.ServerHostData.test2
            GameManager.Server_Host_Gold = AppData.Server_Host_Datas.dhamqp.test2
        else
            GameManager.Server_Host = AppData.ServerHostData.test
            GameManager.Server_Host_Gold = AppData.Server_Host_Datas.dhamqp.test
        end
    else
        if ModuleCache.GameConfigProject.developmentMode and string.find(GameManager.gameConfigProjectHttpApiUrl, "test") == 1 then
            if ModuleCache.PlayerPrefsManager.GetInt(ModuleCache.AppData.USE_TEST_DEVELOP_MOD, 0) == 2 and AppData.ServerHostData.test2 then
                GameManager.Server_Host = AppData.ServerHostData.test2
                GameManager.Server_Host_Gold = AppData.Server_Host_Datas.dhamqp.test2
            else
                GameManager.Server_Host = AppData.ServerHostData.test
                GameManager.Server_Host_Gold = AppData.Server_Host_Datas.dhamqp.test
            end
            GameManager.isTestUser = true
        else
            local playGameCount = ModuleCache.PlayerPrefsManager.GetInt(ModuleCache.AppData.PLAYER_PREFS_KEY_PLAYGAMECOUNT .. ModuleCache.AppData.App_Name, 0)
            -- 加起来小局数超过
            if playGameCount > 100 then
                GameManager.Server_Host = AppData.ServerHostData.vip
                GameManager.Server_Host_Gold = AppData.Server_Host_Datas.dhamqp.vip
            else
                GameManager.Server_Host = AppData.ServerHostData.api
                GameManager.Server_Host_Gold = AppData.Server_Host_Datas.dhamqp.api
            end
        end
    end
end

--- 获取Upgrade升级的专用地址
function GameManager.set_upgrade_net_adres(forceUserTestUrl)
    local url = nil
    if GameManager.deviceIsMobile and ModuleCache.PlayerPrefsManager.GetInt(ModuleCache.AppData.USE_TEST_DEVELOP_MOD, 0) == 1 then
        url = AppData.Server_Host_Datas[string.lower(AppData.Const_App_Name)].test
    else
        if ModuleCache.GameConfigProject.developmentMode and (forceUserTestUrl or string.find(GameManager.gameConfigProjectHttpApiUrl, "test") == 1) then
            url = AppData.Server_Host_Datas[string.lower(AppData.Const_App_Name)].test
        else
            url = AppData.Server_Host_Datas[string.lower(AppData.Const_App_Name)].api
        end
    end

    local newServerHost = ModuleCache.GameSDKInterface:GetIpsByHttpDNS(url)
    local dataList = ModuleCache.GameUtil.split(newServerHost, ',')
    GameManager.netAdress.appUpgradeHttpCurApiUrl = "http://" .. dataList[math.random(1, #dataList)] .. ":8080/" .. AppData.App_Upgrade_Net_Url_Root_Directory .. "/api/"

end

--- 并发获取可用的IP地址
function GameManager.get_and_set_net_adress()
    local newServerHost = ModuleCache.GameSDKInterface:GetIpsByHttpDNS(GameManager.Server_Host)
    GameManager.set_net_adress(newServerHost)
    local dataList = ModuleCache.GameUtil.split(newServerHost, ',')
    for i, v in ipairs(dataList) do
        dataList[i] = "http://" .. v .. ":8080/" .. AppData.Net_Url_Root_Directory .. "/api/ping?" .. v
    end

    ModuleCache.WWWUtil.GetConcurrence(dataList, 3, function(data)
        print(data.text, "最快的反馈")

        if string.sub(data.text, 1, 1) ~= "{" then
            GameManager.set_net_adress(ModuleCache.GameSDKInterface:GetIpsByHttpDNS(GameManager.Server_Host))
            return
        end

        local retData = ModuleCache.Json.decode(data.text)
        if retData and retData.ret == 0 then
            GameManager.set_net_adress(retData.data)
        end
    end, function(error)
        print(error.error)
        GameManager.set_net_adress(ModuleCache.GameSDKInterface:GetIpsByHttpDNS(GameManager.Server_Host))
    end)
end


--- 获取基准分辨率， 返回width,height
function GameManager.get_basis_screen_resolution()
    if not GameManager.basis_screen_resolution then
        GameManager.basis_screen_resolution = {}
        --        LuaHelper.GetComponentWithPath(view.gameObject, "Player/DefaultHead", IMAGE)
        local canvasSizeDelta = ModuleCache.ComponentManager.GetComponentWithPath(UnityEngine.GameObject.Find("GameRoot"), "Lobby/UIRoot/UIWindowParent/Canvas", ComponentTypeName.RectTransform).sizeDelta
        local math = math
        GameManager.basis_screen_resolution.width = math.ceil(canvasSizeDelta.x)
        GameManager.basis_screen_resolution.height = math.ceil(canvasSizeDelta.y)
    end
    return GameManager.basis_screen_resolution
end

function GameManager.set_client_asset_version()
    local platform = ModuleCache.CustomerUtil.platform
    local appAssetVersion
    local appInternalAssetVersion = 0
    local text = ModuleCache.GameSDKInterface:ReadFileFromeAssets(ModuleCache.FileUtility.EncryptFilePath(platform .. "/AssetDataBytes/version.txt"))
    print("app内置资源版本号", text)
    appInternalAssetVersion = tonumber(text)
    appAssetVersion = appInternalAssetVersion or 0
    GameManager.appInternalAssetVersion = appAssetVersion
    local file, error = io.open(ModuleCache.AppData.ASSETS_DATA_ROOT .. "version.txt")
    if file then
        local persistentAssetVersion = file:read("*n")
        file:close()
        if persistentAssetVersion >= appInternalAssetVersion then
            appAssetVersion = persistentAssetVersion
        else
            print("app包中的资源比磁盘中的资源要新，需要把磁盘中的资源删除掉", appInternalAssetVersion)
            ModuleCache.PackageManager.clear_all_package_download_data()
        end
        print("本地资源版本号", persistentAssetVersion)
    else
        print("磁盘中不存在version.txt：", error)
    end
    GameManager.appAssetVersion = appAssetVersion
end


-- 账号注销
function GameManager.logout(clearCacheAccount)
    if clearCacheAccount then
        ModuleCache.PlayerPrefsManager.SetString(ModuleCache.AppData.PLAYER_PREFS_KEY_ACCOUNT, "0")
    end
    GameManager.isLogout = true
    -- 暂时先屏蔽掉
     ModuleCache.JMsgManager.clean()
    ModuleCache.net.NetClientManager.disconnect_all_client()
    ModuleCache.ModuleManager.destroy_public_package()
    for k,v in pairs(AppData.allPackageConfig) do
        if v.package_name ~= "public" then
            ModuleCache.ModuleManager.destroy_package(v.package_name)
        end
    end
    ModuleCache.ModuleManager.show_module("public", "login")

    --ModuleCache.Log.report_exception("Logout堆栈", ModuleCache.Log.print_debug("logout"))
end

-- 重启游戏
function GameManager.reboot(clearAllDownloadAsset)
    GameManager.resume_orientation()
    if clearAllDownloadAsset then
        ModuleCache.FileUtility.DirectoryDelete(ModuleCache.AppData.ASSETS_DATA_ROOT, true)
    end

    ModuleCache.Log.print("游戏内部重启")
    --return
    local uiCamera = ModuleCache.ComponentUtil.Find(GameObject.Find("GameRoot"), "Game/UIRoot/UICamera")
    if not uiCamera then
        uiCamera = ModuleCache.ComponentUtil.Find(GameObject.Find("GameRoot"), "Public/UIRoot/UICamera")
    end
    uiCamera:SetActive(false)
    -- GameObject.Find("GameRoot"):SetActive(false)
    ModuleCache.AssetBundleManager:Reset(true)  --清空所有的值
    ModuleCache.AssetBundleManager:Initialize() -- 必须要初始化才能再次使用
    local asset = ModuleCache.AssetBundleManager:LoadAssetBundle("public/ui/init/gamelauncher.bytes"):GetAsset("GameLauncher", false)
    local gameLauncher = ModuleCache.ComponentUtil.InstantiateLocal(asset)
    gameLauncher.name = "GameLauncher"
    GameObject.DontDestroyOnLoad(gameLauncher);
    ModuleCache.CustomerUtil.ReloadCurScene()
end

function GameManager.repair()
    local OpenDevelopmentMode = ModuleCache.PlayerPrefsManager.GetInt(ModuleCache.AppData.PLAYER_PREFS_KEY_OpenDevelopmentMode, 0)
    ModuleCache.PlayerPrefsManager.DeleteAll()
    ModuleCache.PlayerPrefsManager.SetInt(ModuleCache.AppData.PLAYER_PREFS_KEY_OpenDevelopmentMode, OpenDevelopmentMode)
    ModuleCache.PackageManager.clear_all_package_download_data(true)
    ModuleCache.PackageManager.clear_persistent_data()
    ModuleCache.GameManager.reboot()
end

-- 选择游戏玩法
function GameManager.select_game_id(gameID)
    print("设置玩法id",gameID)
    --print_traceback("select_game_id")
    if AppData.App_Name == "DHAMQP" then  --澳门金币场不保存本地
        GameManager.select_game_id_not_record(gameID)
    else
        local playMode = ModuleCache.PlayModeUtil.getInfoByGameId(gameID)

        if(AppData.App_Name == "DHAHQP" and playMode) then
            AppData.select_province_id(AppData.App_Name, playMode.gameName)
            GameManager.set_server_host()
            if GameManager.Server_Host then
                GameManager.set_net_adress(ModuleCache.GameSDKInterface:GetIpsByHttpDNS(GameManager.Server_Host))
            end
        end

        if gameID == 0 then
            gameID = 1
        else
            if (GameManager.curProvince > 0) then
                local province = ModuleCache.PlayModeUtil.getProvinceById(GameManager.curProvince)
                ModuleCache.PlayerPrefsManager.SetInt(AppData.PLAYER_PREFS_KEY_PLAY_MODE .. "_" .. province.gameName, gameID)
                local user = ModuleCache.PlayerPrefsManager.GetString(ModuleCache.AppData.PLAYER_PREFS_KEY_ACCOUNT, "noUser")
                local isFirst = ModuleCache.PlayerPrefsManager.GetInt(AppData.PLAYER_PREFS_KEY_PLAY_MODE_SET.."_"..user, 0) == 0
                if isFirst then
                    ModuleCache.PlayerPrefsManager.SetInt(AppData.PLAYER_PREFS_KEY_PLAY_MODE_SET.."_"..user, 1)
                    GameManager.isFirstInGame = false
                end
            end
        end

        ---@field curGameId @comment 当前选择的游戏id
        GameManager.curGameId = gameID

        if (playMode == nil) then
            ModuleCache.PlayerPrefsManager.SetInt(AppData.PLAYER_PREFS_KEY_PLAY_MODE, 0)
            GameManager.curProvince = 0
            GameManager.curGameId = 0
            GameManager.curLocation = 1
            return nil
        end

        GameManager.curLocation = playMode.location
        AppData.Game_Name = playMode.gameName  -- AppData.Game_Names[gameID]
    end
end

-- 选择游戏玩法
function GameManager.select_game_id_not_record(gameID)
    --print("设置玩法1id",gameID)
    --print_traceback("select_game_id_not_record")
    local playMode = ModuleCache.PlayModeUtil.getInfoByGameId(gameID)
    if gameID == 0 then
        gameID = 1
    end
    ---@field curGameId @comment 当前选择的游戏id
    GameManager.curGameId = gameID
    if (playMode == nil) then
        ModuleCache.PlayerPrefsManager.SetInt(AppData.PLAYER_PREFS_KEY_PLAY_MODE, 0)
        GameManager.curProvince = 0
        GameManager.curGameId = 0
        GameManager.curLocation = 1
        return nil
    end
    GameManager.curLocation = playMode.location
    AppData.Game_Name = playMode.gameName  -- AppData.Game_Names[gameID]
end

function GameManager.get_cur_package_version()
    local packageName = ModuleCache.PlayModeUtil.getInfoByGameId(GameManager.curGameId)
    if packageName then
        packageName = packageName.package
    end

    if packageName then
        return ModuleCache.PackageManager.get_cur_package_version(packageName)
    end

    return nil
end


-- 获取当前玩法数据
function GameManager.get_cur_playmodel_config_info()
    return ModuleCache.PlayModeUtil.getInfoByGameId(GameManager.curGameId)
end



-- 选择身份
function GameManager.select_province_id(provinceId)
    print("设置省份id：",provinceId)
    if provinceId == 12 then  --澳门金币场不保存本地
        GameManager.select_province_id_not_record(provinceId)
    else
        GameManager.curProvince = provinceId
        if (provinceId == 0) then
            provinceId = 1
            if GameManager.channel == "HAOCAI" then
                provinceId = 17
            end
        else
            ModuleCache.PlayerPrefsManager.SetInt(AppData.PLAYER_PREFS_KEY_PROVINCE, provinceId)
        end
        ModuleCache.PlayModeUtil.setCurConfig(provinceId)
        local province = ModuleCache.PlayModeUtil.getProvinceById(provinceId)
        if (GameManager.iosAppStoreIsCheck) then
            GameManager.select_game_id(ModuleCache.PlayerPrefsManager.GetInt(AppData.PLAYER_PREFS_KEY_PLAY_MODE .. "_" .. province.gameName, 1))
        else
            GameManager.select_game_id(ModuleCache.PlayerPrefsManager.GetInt(AppData.PLAYER_PREFS_KEY_PLAY_MODE .. "_" .. province.gameName, 0))--updatePlayModeId))
        end
        AppData.select_province_id(province.appName, AppData.Game_Name)
        GameManager.set_server_host()
        if GameManager.Server_Host then
            GameManager.set_net_adress(ModuleCache.GameSDKInterface:GetIpsByHttpDNS(GameManager.Server_Host))
        end
    end
end


-- 选择身份
function GameManager.select_province_id_not_record(provinceId)
    print("设置省份1id：",provinceId)
    GameManager.curProvince = provinceId
    if (provinceId == 0) then
        provinceId = 1
    end
    ModuleCache.PlayModeUtil.setCurConfig(provinceId)
    local province = ModuleCache.PlayModeUtil.getProvinceById(provinceId)
    AppData.select_province_id(province.appName, AppData.Game_Name)
    GameManager.set_server_host()
    if GameManager.Server_Host then
        GameManager.set_net_adress(ModuleCache.GameSDKInterface:GetIpsByHttpDNS(GameManager.Server_Host))
    end

end

-- 选择身份
function GameManager.select_province_name_not_record(provinceName)
    AppData.select_province_id(provinceName)
    GameManager.set_server_host()
    if GameManager.Server_Host then
        GameManager.set_net_adress(ModuleCache.GameSDKInterface:GetIpsByHttpDNS(GameManager.Server_Host))
    end
end


function GameManager.change_game_buy_appName_gameName(appName, gameName)
    print(appName .. gameName)
    local provinceConf = ModuleCache.PlayModeUtil.getProvinceByAppName(appName)
    local playModeConf  = ModuleCache.PlayModeUtil.getDeepCopyTable(require(provinceConf.modName))
    local playMode = ModuleCache.PlayModeUtil.getInfoByGameName(gameName,playModeConf)
    GameManager.select_province_id(provinceConf.id)
    GameManager.select_game_id(playMode.gameId)
    return true
end

function GameManager.set_net_adress(ipList)
    local dataList = ModuleCache.GameUtil.split(ipList, ',')
    if (not dataList) then
        return
    end

    local ip
    if GameManager.netAdress._safeSlowIpList then
        ip = nil
        local ipInSafeSlowIpList
        for i = 1, #dataList do
            ipInSafeSlowIpList = false
            for j = 1, #GameManager.netAdress._safeSlowIpList do
                --print("ipInSafeSlowIpList", dataList[i], GameManager.netAdress._safeSlowIpList[j])
                if string.find(dataList[i], GameManager.netAdress._safeSlowIpList[j]) then
                    --print("ipInSafeSlowIpList", dataList[i])
                    ipInSafeSlowIpList = true
                    break
                end
            end
            if not ipInSafeSlowIpList then
                ip = dataList[i]
                break
            end
        end
    end
    ip = ip or dataList[1]
    GameManager.netAdress.curServerHostIp = ip .. ":8080/" .. AppData.Net_Url_Root_Directory .. "/"
    GameManager.netAdress.httpCurApiUrl = "http://" .. ip .. ":8080/" .. AppData.Net_Url_Root_Directory .. "/api/"
    GameManager.set_gold_net_adress(ModuleCache.GameSDKInterface:GetIpsByHttpDNS(GameManager.Server_Host_Gold))
end

function GameManager.set_gold_net_adress(ipList)
    local dataList = ModuleCache.GameUtil.split(ipList, ',')
    if (not dataList) then
        return
    end
    local ip = dataList[1]
    GameManager.netAdress.curGoldServerHostIp = ip .. ":8080/"  .. "dhamqp/"
end

function GameManager.change_game_by_gameName(appAndGameName, noRecord)
    local modelData = require("package.public.model.model_data")
    print("========change_game_by_gameName=======", appAndGameName, modelData.hallData.normalGameName)
    local gname = appAndGameName
    if appAndGameName:find("_") then
        gname = appAndGameName
    else
        if appAndGameName == AppData.MaJong_Game_Name then
            gname = AppData.Default_GameName
        else
            gname = AppData.Poker_App_Name .. "_" .. appAndGameName
        end
    end
    local s = string.split(gname, "_")
    if s and type(s) == "table" and #s > 1 then
        local _appName = s[1]
        local _gameName = s[2]
        local provinceConfig = ModuleCache.PlayModeUtil.getProvinceByAppName(_appName)
        if not provinceConfig then
            return
        end
        local provinceId = provinceConfig.id
        local config = require("package.public.module.playmodeconfigs." .. string.lower(provinceConfig.gameName) .. "_config")
        if not config then
            return
        end
        local gameConfig = ModuleCache.PlayModeUtil.getConfigByGameName(_gameName, config)
        if not gameConfig then
            return
        end
        local gameId = gameConfig.gameId
        if noRecord then
            GameManager.select_province_id_not_record(provinceId)
            GameManager.select_game_id_not_record(gameId)
        else
            GameManager.select_province_id(provinceId)
            GameManager.select_game_id(gameId)
        end
    end
end


function GameManager.set_conmmon_net_adress(ipList)
    local dataList = ModuleCache.GameUtil.split(ipList, ',')
    if (not dataList) then
        return
    end
    local ip = dataList[1]
    GameManager.netAdress.curServerHostIp = ip .. ":8080/" .. AppData.Net_Url_Root_Directory .. "/"
    GameManager.netAdress.httpCurApiUrl = "http://" .. ip .. ":8080/" .. AppData.Net_Url_Root_Directory .. "/api/"
end

--==============================--
--desc:获取版本升级数据
--time:2017-04-26 11:34:34
--@wwwData:
--@wwwDataError:
--return
--==============================--
function GameManager.get_app_upgrade_info(sucessCallback, errorCallback, showNetprompt)
    local requestData = {
        baseUrl = GameManager.netAdress.appUpgradeHttpCurApiUrl .. "upgrade/getAppUpgradeInfo?",
        getAppUpgradeInfo = true,
        showModuleNetprompt = showNetprompt,
        notRequiredToken = true,
        params = {
            osType = GameManager.customOsType,
            appVer = GameManager.appVersion,
            -- appVer = "1.0.0",
            gameName = ModuleCache.AppData.Get_App_Upgrade_Info_Url_Game_Name,
            sv = 1,
            bundleID = UnityEngine.Application.identifier,
            uid = ModuleCache.PlayerPrefsManager.GetString(AppData.PLAYER_PREFS_KEY_USERID, "0"),
            platformName = GameManager.customPlatformName,
            channelName = ModuleCache.GameManager.channel,
            assetVersion = GameManager.appAssetVersion
        },
        cacheDataKey = "httpcache:upgrade/getAppUpgradeInfo?",
        disableTimeOutReconnectTime = true
    }

    if ModuleCache.GameManager.channel == "HAOCAI" then
        requestData.params.uid = "111111"
    end

    local sucessHttpGet = function(wwwBytes)
        local retData  = ModuleCache.SecurityUtil.DESDecode(wwwBytes, AppData.DESKey)
        print(retData)
        retData = ModuleCache.Json.decode(retData)
        print("get_app_upgrade_info")
        print_table(retData)
        if retData.success then
            if not ModuleCache.GameManager.lockAssetUpdate and retData.map and retData.map.assetVersion and retData.map.assetVersion.updateContent then
                if not ModuleCache.GameManager.iosAppStoreIsCheck then
                    ModuleCache.FileUtility.SaveFile(ModuleCache.AppData.ASSETS_DATA_ROOT.."package.txt",retData.map.assetVersion.updateContent)
                    ModuleCache.PackageManager.set_package_asset_data(retData.map.assetVersion.updateContent)
                    if requestData.params.uid ~= "0" and retData.map.assetVersion.userIds and retData.map.assetVersion.userIds ~= "" and string.find(retData.map.assetVersion.userIds, requestData.params.uid) then
                        local data = {
                            platform = GameManager.customPlatformName,
                            uid = requestData.params.uid,
                            serverAssetVersion = retData.map.assetVersion.serverAssetVersion,
                        }
                        ModuleCache.TalkingDataMgr().setEvent("UpdateAssetsWithUID", data)
                    end
                end
            end
            GameManager._set_app_asset_version_update_data(retData.map)
        end
        if sucessCallback then
            sucessCallback(retData)
        end
    end


    Util.http_get(requestData, function(wwwData)
        sucessHttpGet(wwwData.www.text)
    end, function(wwwErrorData)
        -- 如果获取失败那么就自动切
        GameManager.get_and_set_net_adress()
        if errorCallback then
            errorCallback(wwwErrorData.error)
        end
    end, function(cacheDataText)
        -- 如果本地有缓存数据，使用缓存数据
        GameManager.get_and_set_net_adress()
        sucessHttpGet(cacheDataText)
    end)
end


-- 单独获取版本资源
function GameManager.get_app_asset_data_info(sucessCallback, errorCallback)
    if GameManager.iosAppStoreIsCheck then
        GameManager.appAssetVersionUpdateData.appData = nil
        GameManager.appAssetVersionUpdateData.assetData = nil
        return
    end

    GameManager.get_app_upgrade_info(function(wwwData)
        if wwwData.success == true then
            if sucessCallback then
                sucessCallback(GameManager.appAssetVersionUpdateData)
            end
        else
            -- GameManager.get_app_asset_data_info()
        end
    end, function(wwwDataError)
        if errorCallback then
            errorCallback(wwwDataError)
        end
    end, false)
end


-- 设置版本更新信息
function GameManager._set_app_asset_version_update_data(data)
    if not ModuleCache.CustomerUtil.VersionCompare(GameManager.appVersion, data.version) then
        print("data.forceUpgrade", data.forceUpgrade, GameManager.appVersion, data.version)
        local updateUrl = data.url
        if updateUrl then
            local appDataUrlTable = ModuleCache.GameUtil.json_decode_to_table(data.url)
            if appDataUrlTable then
                updateUrl = appDataUrlTable[ModuleCache.GameManager.channel]
                -- 是否在版本排除的更新逻辑
                if updateUrl and appDataUrlTable.ExcludeVersion then
                    if string.find(tostring(appDataUrlTable.ExcludeVersion), ModuleCache.GameManager.appVersion) then
                        updateUrl = nil
                    end
                end
            end
        end

        if updateUrl then
            GameManager.appAssetVersionUpdateData.appData = {
                forceUpgrade = data.forceUpgrade,
                url = updateUrl,
                serverAppVersion = data.version,
                versionDesc = data.versionDesc
            }
        else
            GameManager.appAssetVersionUpdateData.appData = nil
        end
    else
        GameManager.appAssetVersionUpdateData.appData = nil
    end

    if not ModuleCache.GameManager.lockAssetUpdate and data.assetVersion then
        GameManager.appAssetVersionUpdateData.assetData = {}
        GameManager.appAssetVersionUpdateData.assetData.isForceUpdate = data.assetVersion.isForceUpdate
    else
        GameManager.appAssetVersionUpdateData.assetData = nil
    end
end

---获取魔窗数据
---@param text table
function GameManager.get_mw_data()
    local text = ModuleCache.GameSDKCallback.instance.mwEnterRoomID
    if (not text or text == "0") then
        return GameManager.get_mw_data_by_Clipboard()
    end
    local mwData
    -- 或报这种错误 Expected value but found unexpected end of string at character 70 stack traceback:
    ModuleCache.try {
        function()
            if string.lower(string.sub(text, 1, 1) ) == "{" then
                mwData = Util.json_decode_to_table(text)
                if mwData.appGameName then
                    local strs = string.split(mwData.appGameName, "_")
                    mwData.appName = strs[1]
                    mwData.gameName = strs[2]
                end
            else
                mwData = {}
                mwData.roomId = tonumber(text)
            end
        end,
        ModuleCache.catch {
            function(errors)
                if(errors)then
                    coroutine.start(function ()
                        --print('catch errors:' .. errors)
                        --coroutine.wait(0)
                        --assert(not errors, 'catch errors:' .. errors)
                    end)
                end
            end
        }
    }


    if not mwData then
        return
    end


    if string.find(text, "GPS检测") then
        mwData.NeedOpenGPS = true
    end

    if string.find(text, "相同IP检测") then
        mwData.CheckIPAddress = true
    end

    print_table(mwData, "get_mw_data")
    return mwData
end

-- 通过剪切版转换数据
function GameManager.get_mw_data_by_Clipboard()
    local text = ModuleCache.GameSDKInterface:GetTextFromClipboard()
    if (not text or text == "") then
        return nil
    end

    local needProcess = false
    if string.find(text, ModuleCache.ShareManager().get_table_share_text_app_name()) then
        needProcess = true
    end

    if not needProcess and ModuleCache.GameParameters.ShareProductName and string.find(text, ModuleCache.GameParameters.ShareProductName) then
        needProcess = true
    end

    if needProcess then
        text = string.split(text, "#")
        if #text == 3 then
            local mwData = {}
            local tmpContent = string.split(ModuleCache.GameUtil.decodeBase64(text[2]), "_")
            mwData.appName = tmpContent[1]
            mwData.gameName = tmpContent[2]

            if string.find(text[1], "GPS检测") then
                mwData.NeedOpenGPS = true
            end

            if string.find(text[1], "相同IP检测") then
                mwData.CheckIPAddress = true
            end

            mwData.roomId = tonumber(string.match(text[1], '%d%d%d%d%d%d'))
            print_table(mwData, "get_mw_data_by_Clipboard")
            return mwData
        end
    end
end



function GameManager.close_print()
    GameManager.print_toggle_data.print = print
    GameManager.print_toggle_data.print_table = print_table
    GameManager.print_toggle_data.print_debug = print_debug
    GameManager.print_toggle_data.print_traceback = print_traceback
    GameManager.print_toggle_data.print_pbc_table = print_pbc_table
    print = function( ... )
    end
    print_table = function( ... )
    end
    print_debug = function( ... )
    end
    print_traceback = function( ... )
    end
    print_pbc_table = function( ... )
    end
end

function GameManager.open_print()
    if not GameManager.print_toggle_data.print then
        return
    end
    ModuleCache.GameConfigProject.netTransferDataShow = true
    print = GameManager.print_toggle_data.print
    print_table = GameManager.print_toggle_data.print_table
    print_debug = GameManager.print_toggle_data.print_debug
    print_traceback = GameManager.print_toggle_data.print_traceback
    print_pbc_table = GameManager.print_toggle_data.print_pbc_table
end

function GameManager.get_used_playMode()
    local usedJson =  ModuleCache.PlayerPrefsManager.GetString(ModuleCache.AppData.PLAYER_PREFS_KEY_USED_PLAYMODE, "noUsed")
    if usedJson == "noUsed" then
        return nil
    end
    return ModuleCache.Json.decode(usedJson)
end

function GameManager.set_used_playMode(provinceId, gameId)
    if not provinceId or not gameId then
        provinceId = GameManager.curProvince
        gameId = GameManager.curGameId
    end
    if provinceId == 12 then return end
    local tb = GameManager.get_used_playMode()
    tb = tb == nil and {} or tb
    local simpleTb = nil
    for i = 1, #tb do
        if tb[i].provinceId == provinceId and tb[i].gameId == gameId then
            simpleTb = tb[i]
            table.remove(tb, i)
            break
        end
    end
    if not simpleTb then
        simpleTb = {
            provinceId = provinceId,
            gameId = gameId,
        }
    end
    table.insert(tb, 1, simpleTb)
    local json = ModuleCache.Json.encode(tb)

    print("---------存储的常用玩法为: "..json)
    ModuleCache.PlayerPrefsManager.SetString(ModuleCache.AppData.PLAYER_PREFS_KEY_USED_PLAYMODE, json)
end


function GameManager.player_switch_majiang3D()
    local GameID = AppData.get_app_and_game_name()
    local Is3D = Config.get_mj3dSetting(GameID).Is3D
    if 1 == Is3D then
        return true
    end
    return false
end

function GameManager.set_rendering_AmbientMode()
    --[[if ModuleCache.AppData.Const_App_Name == "LAMJ" and GameManager.runtimePlatform == "IPhonePlayer" then
        local t = typeof('UnityEngine.RenderSettings')
        local property = tolua.getproperty(t, 'ambientMode')
        if tostring(property:Get(nil, nil)) ~= "Flat" then
            local t1 = typeof('UnityEngine.Rendering.AmbientMode')
            local field = tolua.getfield(t1, 'Flat')
            property:Set(nil, field:Get(nil), nil)
        end
    else
        if tostring(ModuleCache.UnityEngine.RenderSettings.ambientMode) ~= "Flat" then
            local t1 = typeof('UnityEngine.Rendering.AmbientMode')
            local field = tolua.getfield(t1, 'Flat')
            ModuleCache.UnityEngine.RenderSettings.ambientMode = field:Get(nil);
        end
    end--]]
end

function GameManager.change_portrait_orientation()
    GameManager.change_orientation(UnityEngine.ScreenOrientation.Portrait)
end

function GameManager.force_change_orientation_Landscape(isLandscapeRight)
    local orientation = UnityEngine.ScreenOrientation.LandscapeLeft
    if(isLandscapeRight)then
        orientation = UnityEngine.ScreenOrientation.LandscapeRight
    end
    UnityEngine.Screen.orientation = orientation
end

function GameManager.isLandscapeOrientation()
    return UnityEngine.Screen.orientation == UnityEngine.ScreenOrientation.LandscapeRight or UnityEngine.Screen.orientation == UnityEngine.ScreenOrientation.LandscapeLeft
end

function GameManager.change_orientation(portrait)
    if portrait == UnityEngine.ScreenOrientation.Portrait then
        if(UnityEngine.Screen.orientation == UnityEngine.ScreenOrientation.LandscapeRight or UnityEngine.Screen.orientation == UnityEngine.ScreenOrientation.LandscapeLeft)then
            GameManager._screenOrientation = UnityEngine.Screen.orientation
        end
    end
    if portrait then
        --UnityEngine.Screen.orientation = UnityEngine.ScreenOrientation.LandscapeRight
        --UnityEngine.Screen.orientation = UnityEngine.ScreenOrientation.LandscapeLeft
        UnityEngine.Screen.orientation = UnityEngine.ScreenOrientation.Portrait
    end
end

function GameManager.resume_orientation()
    if GameManager._screenOrientation then
        UnityEngine.Screen.orientation = GameManager._screenOrientation
        UnityEngine.Screen.autorotateToLandscapeLeft = true
        UnityEngine.Screen.autorotateToLandscapeRight = true
        UnityEngine.Screen.autorotateToPortrait = false
        UnityEngine.Screen.autorotateToPortraitUpsideDown = false
        UnityEngine.Screen.orientation = UnityEngine.ScreenOrientation.AutoRotation
    end
end


-- 设置帧率
function GameManager.set_application_target_frame_rate(target)
    UnityEngine.Application.targetFrameRate = target
end

--更新Android版本
function GameManager.update_apk(data, updateFailureCallback)
    if(data)then
        local saveDirPath = UnityEngine.Application.persistentDataPath .. "/apk"
        local intentData = {
            appData = {
                saveFilePath =  saveDirPath .. "/" .. AppData.App_Name .. "-" .. data.serverAppVersion .. ".apk",
                url = data.url,
                fileSize = 1024 * 1024 * 20,
            },
            updateFailureCallback = updateFailureCallback,
            display = not data.hideUpdateView,
        }
        ModuleCache.ModuleManager.show_module("public", "update", intentData)
    end
end

GameManager.init()
return GameManager