
local require = require

--- @class ModuleCache
--- @field public AppData AppData
--- @field public GameManager GameManager
--- @field public ComponentUtil ComponentUtil
--- @field public ComponentManager ComponentManager
--- @field public PlayModeUtil PlayModeUtil
--- @field public ModuleManager ModuleManager
--- @field public JMsgManager JMsgManager
--- @field public OssManager OssManager
--- @field public GameUtil GameUtil
--- @field public Config Config
--- @field public PayManager PayManager
--- @field public SDKInterface SDKInterface
--- @field public ShareManager ShareManager
--- @field public TextureCacheManager TextureCacheManager
--- @field public UserDataManager UserDataManager
--- @field public SoundManager SoundManager
--- @field public WechatManager WechatManager
--- @field public TalkingDataMgr TalkingDataMgr
--- @field public GVoiceManager GVoiceManager
--- @field public GameParameters GameParameters
--- @field public LogManager LogManager
--- @field public PlayerPrefsManager PlayerPrefsManager
--- @field public Log Log
--- @field public LogManager LogManager
--- @field public PackageManager PackageManager
--- @field public ComponentCache ComponentCache
--- @field public GPSManager GPSManager
--- @field public EmojiUtil EmojiUtil
ModuleCache = {}
local Config = require("package.public.config.config")
local ModuleCache = ModuleCache

local LuaBridge = LuaBridge

function ModuleCache.load_init_module()
    ModuleCache.LuaBridge = LuaBridge
    ModuleCache.UnityEngine = UnityEngine
    ModuleCache.Coroutine = {
        WaitForSeconds = WaitForSeconds,
        StartCoroutine = StartCoroutine,
        StopCoroutine = StopCoroutine,
        Yield = Yield,
        WaitForEndOfFrame = WaitForEndOfFrame,
        WaitForFixedUpdate = WaitForFixedUpdate,
        WaitForSeconds = WaitForSeconds,
    }
    ModuleCache.try = require('lib.try')
    ModuleCache.catch = require('lib.catch')

    ModuleCache.AssetBundleManager = LuaBridge.AssetBundleManager.instance
    ModuleCache.ComponentUtil = LuaBridge.ComponentUtil
    ModuleCache.CustomerUtil = LuaBridge.CustomerUtil
    ModuleCache.FileUtility = LuaBridge.FileUtility
    ModuleCache.GameConfigProject = LuaBridge.GameConfigProject.instance
    ModuleCache.GameSDKInterface = LuaBridge.GameSDKInterface.instance
    ModuleCache.GameSDKCallback = LuaBridge.GameSDKCallback
    ModuleCache.LuaBridge = LuaBridge
    ModuleCache.LuaHelper = LuaBridge.LuaHelper
    ModuleCache.SmartTimer = LuaBridge.SmartTimer
    ModuleCache.Config = Config
    
    ModuleCache.CSmartTimer = LuaBridge.SmartTimer.instance
    ModuleCache.TransformUtil = LuaBridge.TransformUtil
    ModuleCache.ViewUtil = LuaBridge.ViewUtil
    ModuleCache.WWWUtil = LuaBridge.WWWUtil
    ModuleCache.BestHttpUtil = LuaBridge.BestHttpUtil
    ModuleCache.AudioPlayUtil = LuaBridge.AudioPlayUtil
    ModuleCache.WavUtility = LuaBridge.WavUtility
    ModuleCache.AsyncFileUtil = LuaBridge.AsyncFileUtil
    ModuleCache.SecurityUtil = LuaBridge.SecurityUtil

	require("const.define")
	require("const.game_const")
    require("const.game_parameters")
    require("core.application_event")
    ModuleCache.Log = require("util.log")
    ModuleCache.AppData = AppData
    ModuleCache.GameParameters = GameParameters

    ModuleCache.ComponentTypeName = ComponentTypeName
    ModuleCache.PlayerPrefsManager = require("manager.playerprefs_manager")
    ModuleCache.PackageManager = require("manager.package_manager")
    ModuleCache.ComponentManager = require("manager.component_manager")
    ModuleCache.FunctionManager = require("manager.function_manager")
    ModuleCache.GameUtil = require("util.game_util")
    ModuleCache.ModuleManager = require("core.module_manager")
    ModuleCache.JMsgManager = require("manager.jmsg_manager")
    ModuleCache.WechatManager = require("manager.wechat_manager")
    ModuleCache.TextureCacheManager = require("manager.texturecache_manager")
    ModuleCache.UserDataManager = require("manager.userdata_manager")
    ModuleCache.SoundManager = require("manager.sound_manager")
    ModuleCache.Json = require("cjson")
    ModuleCache.CustomVoiceManager = require("manager.custom_voice_manager")
    ModuleCache.CustomImageManager = require("manager.custom_image_manager")
    ModuleCache.GPSManager = require("manager.gps_manager")
    ModuleCache.PlayModeUtil = require("package.public.module.setplaymode.setplaymode_util")
    ModuleCache.LogConfig = require("manager.log_config")
    ModuleCache.OssManager = require("manager.oss_manager")
    ModuleCache.LogManager = require("manager.log_manager")

    ModuleCache.GameManager = require("manager.game_manager")
    ModuleCache.ComponentCache = require("const.component_cache")

    --ModuleCache.DOTweenAnimationTool = require("manager.DOTweenAnimationTool");

    ModuleCache.PreLoadManager = function()
        ModuleCache._PreLoadManager = ModuleCache._PreLoadManager or require("manager.preload_manager")
        return ModuleCache._PreLoadManager
    end

    ModuleCache.DOTweenAnimationTool = function()
        ModuleCache._DOTweenAnimationTool = ModuleCache._DOTweenAnimationTool or require("manager.DOTweenAnimationTool")
        return ModuleCache._DOTweenAnimationTool
    end

    ModuleCache.JpushManager = function()
        ModuleCache._JpushManager = ModuleCache._JpushManager or require("manager.jpush_manager")
        return ModuleCache._JpushManager
    end

    ModuleCache.TalkingDataMgr = function()
        ModuleCache._TalkingDataMgr = ModuleCache._TalkingDataMgr or require("manager.tkdata_manager")
        return ModuleCache._TalkingDataMgr
    end

    ModuleCache.ShareManager = function()
        ModuleCache._ShareManager = ModuleCache._ShareManager or require("manager.share_manager")
        return ModuleCache._ShareManager
    end

    ModuleCache.GVoiceManager = function()
        ModuleCache._GVoiceManager = ModuleCache._GVoiceManager or require("manager.gvoice_manager")
        return ModuleCache._GVoiceManager
    end

    ModuleCache.PoolManager = function()
        ModuleCache._PoolManager = ModuleCache._GVoiceManager or require("manager.pool_manager")
        return ModuleCache._PoolManager
    end
    ModuleCache.PayManager = function()
        ModuleCache._PayManager = ModuleCache._PayManager or require("manager.pay_manager")
        return ModuleCache._PayManager
    end
    ModuleCache.SDKInterface = function()
        ModuleCache._SDKInterface = ModuleCache._SDKInterface or require("util.sdk_interface")
        return ModuleCache._SDKInterface
    end

    ModuleCache.PreLoadManager = function()
        ModuleCache._PreLoadManager = ModuleCache._PreLoadManager or require("manager.preload_manager")
        return ModuleCache._PreLoadManager
    end

    ModuleCache.EmojiUtil = function()
        ModuleCache._EmojiUtil = ModuleCache._EmojiUtil or require("util.emoji_util")
        return ModuleCache._EmojiUtil
    end
end

-- 加注net相关的模块
function ModuleCache.load_net_module()
    if ModuleCache.net then
        return
    end
    ModuleCache.net = { }
    ModuleCache.net.Buffer = LuaBridge.Buffer
    --ModuleCache.net.NetworkManager = LuaBridge.NetworkManager
    ModuleCache.net.GameWebSocketClient = LuaBridge.GameWebSocketClient
    ModuleCache.net.NetClientManager = require("core.net.net_client_manager")
    ModuleCache.net.PbcUtil = require('protobuf.protobuf')
    ModuleCache.net.PbcUtilEditor = require("core.net.pbc_editor_util")
    ModuleCache.net.NetMsgHandler = require('core.net.net_msg_handler')
end