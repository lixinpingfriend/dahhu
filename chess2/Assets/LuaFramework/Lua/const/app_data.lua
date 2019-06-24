local string = string
AppData = { }
---@class AppData
local AppData = AppData

require 'tolua.reflection'
tolua.loadassembly('Assembly-CSharp')

require('const.server_host')
require('const.asset_config')

AppData.channelData = {
    Official = 0,
    HAOCAI = 10469
}

--是否为独立App，与合集App区分
AppData.Is_Independent_App = false

AppData.Const_App_Name = "DHGDQP"

--通用玩法的AppName
AppData.Const_Universal_App_Name = "DHAMQP"

-- 用于检测是否有升级信息
AppData.Get_App_Upgrade_Info_Url = nil
AppData.Get_App_Upgrade_Info_Url_Game_Name = "DHGDQP_RUNFAST"
AppData.App_Upgrade_Net_Url_Root_Directory = "dhgdqp/bullfight"

AppData.ServerHostData = nil
AppData.CommonServerHostData = AppData.Server_Host_Datas
AppData.Common_Net_Url_Root_Directory = "dhahqp/bullfight"
AppData.App_Name = AppData.Const_App_Name
AppData.App_Name_Temp = AppData.Const_App_Name  --TODO XLQ 亲友圈使用
-- 游戏名
AppData.Game_Name = nil
AppData.Game_Name_Temp = nil    ----TODO XLQ 亲友圈使用




AppData.Biji_GameName = AppData.App_Name .. "_BIJI_BJ"
AppData.Runfast_GameName = AppData.App_Name .. "_RUNFAST_RUNFAST"
AppData.ZhaJinHua_GameName = AppData.App_Name .. "_ZHAJINHUA_ZHAJINHUA"
AppData.CowBoy_GameName = AppData.App_Name .. "_BULLFIGHT_BF"
AppData.GuanDan_GameName = AppData.App_Name .. "_GUANDAN_GD"
AppData.DouDiZhu_GameName = AppData.App_Name .. "_DOUDIZHU_DOUDIZHU"


-- 是否由客户端获取UNIONID
AppData.OPEN_CLIENT_GET_UNIONID = false

-- Appstore充值
AppData.AppStoreProductName = "dhqpyx_1"

AppData.MuseumName = "亲友圈"

AppData.tableTargetFrameRate = 45

AppData.iPhoneIsinfinityDisplay = false
AppData.isiPhoneXs = false
AppData.AndroidAdaptScreen = false	--安卓开启全面屏适配

-- ===========================不常改变数据
AppData.DESKey = "15880288"
AppData.SALT_A = "SbtATxjoo989000x*29lyp"
AppData.SALT_B = "SbtB009XVVWDVLXX89#S)X"

AppData.PLAYER_PREFS_KEY_OpenDevelopmentMode = "PlayerPrefs_OpenDevelopmentMode"
AppData.PLAYER_PREFS_KEY_ACCOUNT = "PlayerPrefs_Login_AccountName"
AppData.PLAYER_PREFS_KEY_PASSWORD = "PlayerPrefs_Login_Password"
AppData.PLAYER_PREFS_KEY_USERID = "PlayerPrefs_Login_USERID"
AppData.PLAYER_PREFS_KEY_PLAY_MODE = "PlayerPrefs_Play_Mode"
AppData.PLAYER_PREFS_KEY_PLAY_MODE_LAST = "PlayerPrefs_Play_Mode_Last"
AppData.PLAYER_PREFS_KEY_PROVINCE = "PlayerPrefs_Province"
AppData.PLAYER_PREFS_KEY_PLAY_MODE_SET = "PlayerPrefs_Play_Mode_set"
AppData.PLAYER_PREFS_KEY_TOGGLE_USE_ACCOUNT = "PlayerPrefs_Login_ToggleUseACCOUNT"
AppData.PLAYER_PREFS_KEY_PLAYGAMECOUNT = "PlayerPrefs_PlayGameCount_"
AppData.PLAYER_PREFS_KEY_USED_PLAYMODE = "PlayerPrefs_Used_Play_Mode"
AppData.PLAYER_PREFS_KEY_LOCK_ASSET = "PlayerPrefs_GameManager_Lock_Asset"
AppData.PLAYER_PREFS_KEY_LastJoinGVoiceTeamName = "LastJoinGVoiceTeamName"
AppData.PLAYER_PREFS_KEY_GVoiceTeamNameSpeakerOpenState = "GVoiceTeamNameSpeakerOpenState"

-- 是否使用测试模式
AppData.USE_TEST_DEVELOP_MOD = "USE_TEST_DEVELOP_MOD"
AppData.PLAYER_PREFS_KEY_LAST_HALL_OPEN_MODULE = "PLAYER_PREFS_KEY_LAST_HALL_OPEN_MODULE"
AppData.PLAYER_PREFS_KEY_LAST_PROVINCE_GAME = "PLAYER_PREFS_KEY_LAST_PROVINCE_GAME"

AppData.ASSETS_DOWNLOAD_ROOT = UnityEngine.Application.persistentDataPath .. "/temp/"
AppData.ASSETS_DATA_ROOT = UnityEngine.Application.persistentDataPath .. "/assetsdata/"

-- 跑得快分支名
AppData.BranchRunfastName = "runfast"
AppData.BranchZhaJinHuaName = "zhajinhua"
AppData.BranchQuickRunName = "quickrun"
-- 掼蛋分支名
AppData.BranchGuanDanName = "guandan"
AppData.BranchDouDiZhuName = "doudizhu"
-- 长牌分支名
AppData.BranchChangPaiName = "changpai"
-- 扎金花分支名
AppData.BranchZhaJinHuaName = "zhajinhua"

function AppData.select_province_id(appName)
    local lowerAppName = string.lower(appName or AppData.Const_App_Name)
    if not AppData.Server_Host_Datas[lowerAppName] then
        print("选择的省份不存在")
        return
    end

    AppData.App_Name = appName
    AppData.ServerHostData = AppData.Server_Host_Datas[lowerAppName]
    AppData.Net_Url_Root_Directory = string.lower(lowerAppName .. "/" .. AppData.ServerHostData.defaultGameName)
    if(lowerAppName == "dhlamj" or lowerAppName == "dhaqmj" or lowerAppName == "dhwbmj" ) then
        AppData.Net_Url_Root_Directory = lowerAppName
    end
    -- 如果是连的测试服那就使用DHAHQP_
    AppData.Biji_GameName = appName .. "_BIJI_BJ"
    AppData.Runfast_GameName = appName .. "_RUNFAST_RUNFAST"
    AppData.ZhaJinHua_GameName = appName .. "_ZHAJINHUA_ZHAJINHUA"
    AppData.CowBoy_GameName = appName .. "_BULLFIGHT_BF"
    AppData.GuanDan_GameName = appName .. "_GUANDAN_GD"
    AppData.DouDiZhu_GameName = appName .. "_DOUDIZHU_DOUDIZHU"
    AppData.LaoYanCai_GameName = appName .. "_LAOYANCAI_LAOYANCAI"
    AppData.BaiBaZhang_GameName = appName .. "_BAIBAZHANG_BBZ"
    AppData.ShiSanZhang_GameName = appName .. "_SHISANZHANG_SSZ"
end

-- 设置poker系列的GameName，以避免在测试服需要部署多套服务器
function AppData.set_poker_gamename(testServer)
    local appName = AppData.App_Name
    if testServer then
        appName = "DHAHQP"
    end
    AppData.Biji_GameName = appName .. "_BIJI_BJ"
    AppData.Runfast_GameName = appName .. "_RUNFAST_RUNFAST"
    AppData.ZhaJinHua_GameName = appName .. "_ZHAJINHUA_ZHAJINHUA"
    AppData.CowBoy_GameName = appName .. "_BULLFIGHT_BF"
    AppData.GuanDan_GameName = appName .. "_GUANDAN_GD"
    AppData.DouDiZhu_GameName = appName .. "_DOUDIZHU_DOUDIZHU"
    AppData.LaoYanCai_GameName = appName .. "_LAOYANCAI_LAOYANCAI"
    AppData.DouDiZhu_GameName = appName .. "_DOUDIZHU_DOUDIZHU"
    AppData.BaiBaZhang_GameName = appName .. "_BAIBAZHANG_BBZ"
    AppData.ShiSanZhang_GameName = appName .. "_SHISANZHANG_SSZ"
end


function AppData.isPokerRule(rule)
    if not rule then
        return false
    end

    for k,v in pairs(AppData.allPackageConfig) do
        if(v.short_game_name and v.short_game_name ~= '' and string.find(rule, v.short_game_name))then
            print_table(v)
            return v.is_skynet_framework or false, v
        end
    end
    return false
end

function AppData.isPokerBijiRule(rule)
    if string.find(rule, "_BIJI_BJ") then
        return true
    end
end

function AppData.isPokerBullfightRule(rule)
    if rule and string.find(rule, "_BULLFIGHT_") then
        return true
    end
end

function AppData.isPokerGameByPackageName(packageName)
    for k,v in pairs(AppData.allPackageConfig) do
        if(v.package_name == packageName)then
            return v.is_skynet_framework or false, v
        end
    end
    return false
end

function AppData.isPokerGame(gameName)
    gameName = gameName or AppData.Game_Name
    for k,v in pairs(AppData.allPackageConfig) do
        if(v.game_name == gameName)then
            return v.is_skynet_framework or false, v
        end
    end
    return false
end

function AppData.isPokerGameByGameId(gameId)
    for k,v in pairs(AppData.allPackageConfig) do
        if(v.game_name and v.game_name ~= '')then
            local index =string.find(gameId, v.game_name)
            if(index and index > 0)then
                return v.is_skynet_framework or false, v
            end
        end
    end
    return false
end

function AppData.isZiPaiGame(gameName)
	gameName = gameName or AppData.Game_Name
	local len = string.len(gameName)
	if string.sub(gameName, len - 1, len) == "ZP" then
		return true
	end
    
    return false
end

function AppData.isHuaPaiGame(gameName)
	gameName = gameName or AppData.Game_Name
	local len = string.len(gameName)
	if string.sub(gameName, len - 1, len) == "HP" then
		return true
	end
    
    return false
end

function AppData.get_url_game_name()
    return AppData.get_app_and_game_name()
end

function AppData.getGoldRunfastGameName()
    return "DHAMQP_RUNFAST"
end

function AppData.getDefautMatchGameName()
    return "DHAMQP_RUNFAST"
end

function AppData.get_cur_server_host_ip()
    return ModuleCache.GameManager.netAdress.curServerHostIp

end
--特殊处理
function AppData.get_app_and_game_name()
    return AppData.App_Name .. "_" .. AppData.Game_Name
end

--为了兼容独立App的接口
function AppData.get_real_app_and_game_name()
    return AppData.App_Name .. "_" .. AppData.Game_Name
end

function AppData.get_real_app_and_game_name()
    return AppData.App_Name .. "_" .. AppData.Game_Name
end

-- 要适配六安、安庆、皖北和大胡棋牌游戏的通打，好爽
function AppData.get_app_name()
    return AppData.App_Name
end

--通用玩法，全部指向澳门
local univeral_list = {
    "RUNFAST"
}

--是都是通用玩法（全部指向澳门）
function AppData.is_universal_game(gameName)
    --if not gameName then
    --    gameName = AppData.Game_Name
    --end
    --
    --for _,v in ipairs(univeral_list) do
    --    if gameName == v then
    --        return true
    --    end
    --end
    return false
end

--是都是通用玩法（全部指向澳门）
--appGameName 如DHHUBEIQP_RUNFAST
--也支持WanfaName DHHUBEIQP_RUNFAST_RUNFAST
function AppData.is_universal_app_game(appGameName)
    --if not appGameName then
    --    appGameName = AppData.get_app_and_game_name()
    --end
    --
    --for _,v in ipairs(univeral_list) do
    --    if string.find(appGameName, v) then
    --        return true
    --    end
    --end
    return false
end

--转换成统一的app和game_name
function AppData.to_universal_app_game_name(appGameName)
    local s = string.split(appGameName, "_")
    local n = AppData.Const_Universal_App_Name
    if s and #s > 1 then
        for i = 2, #s do
            n = n .. "_" .. s[i]
        end
        appGameName = n
    end
    return appGameName
end

--转换成统一的app和game_name
function AppData.init()
	AppData.check_full_screen()
    local ModuleCache = ModuleCache
    if not ModuleCache.GameManager.platformIsIphone then
        return
    end

    local UnityEngine = UnityEngine
    if UnityEngine.Screen.width * 1.0 / UnityEngine.Screen.height > 1.8 then
        AppData.iPhoneIsinfinityDisplay = true
        local deviceModel = ModuleCache.GameManager.deviceModel
        --因为获取不到iphone11的字段，所以只能通过排除发，iphone的宽屏手机不是iphoneX就是iphoneXS
        if deviceModel == "iPhone10,3" or deviceModel == "iPhone10,6" then
        else
            AppData.isiPhoneXs = true
        end
    end
end

--检查全面屏
function AppData.check_full_screen()
	if ModuleCache.GameManager.platformIsAndroid and not ModuleCache.GameManager.isEditor and not AppData.AndroidAdaptScreen then
		return
	end
	
	local UnityEngine = UnityEngine
	if UnityEngine.Screen.width * 1.0 / UnityEngine.Screen.height >= 2 then
		AppData.isFullScreen = true
	end
end

function AppData.getWebGameUserId(userId)
    local preNameMap = {

    }
    local preName
    if not AppData.Is_Independent_App then
        preName = '10'
    else
        local const_app_name = AppData.Const_App_Name
        preName = preNameMap[const_app_name]
        assert(preName, string.format('%s不存在WebGameUserId的前缀映射', const_app_name))
    end
    return preName .. userId
end


