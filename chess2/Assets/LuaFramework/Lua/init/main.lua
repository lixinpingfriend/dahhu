







local require= require


local LuaBridge = LuaBridge
local UnityEngine = UnityEngine

_CLIENT_ENV = true

local GameConfigProject = LuaBridge.GameConfigProject.instance
require("util.log")

local ComponentUtil = LuaBridge.ComponentUtil

local GameObject = UnityEngine.GameObject
local AssetBundleManager = LuaBridge.AssetBundleManager.instance
AssetBundleManager:Initialize()

local gameRoot = GameObject.Find("GameRoot")
if not gameRoot then
    local asset = AssetBundleManager:LoadAssetBundle("public/ui/init/gameroot.bytes"):GetAsset("GameRoot", false)
    gameRoot = ComponentUtil.InstantiateLocal(asset)
    gameRoot.name = "GameRoot"
end

local gameLauncher = GameObject.Find("GameLauncher")
if gameLauncher then
    gameLauncher:SetActive(false)
    GameObject.Destroy(gameLauncher)
end

-- 需要严格控制加载顺序
require("core.unity3d")
require("core.structure")
require("core.application_event")
require("core.ui_event_handle")
require("const.app_data")
require("const.module_cache")
require("util.log")


local ModuleCache = ModuleCache
ModuleCache.load_init_module()
ModuleCache.load_net_module()
ModuleCache.ModuleManager.init(ModuleCache)
ModuleCache.GameManager.gameRoot = gameRoot
local ComponentTypeName = ComponentTypeName
ModuleCache.AppData.init()
ModuleCache.ComponentCache.init()
ModuleCache.LogManager.custom_Log("game init")

if ModuleCache.GameManager.isEditor then
   local breakSocketHandle,debugXpCall = require("LuaDebugjit")("localhost", 7003)
   local timer = Timer.New(function()
       breakSocketHandle() end, 1, -1, false)
   timer:Start();
end

local canvasScaler = ModuleCache.ComponentManager.GetComponentWithPath(gameRoot, "Game/UIRoot/UIWindowParent/Canvas/CanvasScaler", ComponentTypeName.RectTransform)
ModuleCache.GameManager.canvasScalerSize = canvasScaler.sizeDelta
if UnityEngine.Screen.width * 1.0 / UnityEngine.Screen.height > 1.8 then
    local canvas = ModuleCache.ComponentManager.GetComponentWithPath(gameRoot, "Game/UIRoot/UIWindowParent/Canvas", ComponentTypeName.RectTransform)
    local camera = ModuleCache.ComponentManager.GetComponentWithPath(gameRoot, "Game/UIRoot/UICamera", ComponentTypeName.Camera)
    if ModuleCache.AppData.isFullScreen then
		local objiPhoneXBlcok = UnityEngine.GameObject.Find("GameRoot/Game/UIRoot/UIWindowParent/Canvas/iPhoneBlock")
		if objiPhoneXBlcok and ModuleCache.GameManager.isEditor then
			objiPhoneXBlcok:SetActive(true)
		else
			--camera.rect = UnityEngine.Rect(0.05, 0, 0.90, 1)
			--canvas.sizeDelta = Vector2(canvasScaler.sizeDelta.x * 0.90, canvasScaler.sizeDelta.y)
		end
		canvas.sizeDelta = canvasScaler.sizeDelta
    else
        canvas.sizeDelta = canvasScaler.sizeDelta
    end
    canvas.localScale = canvasScaler.localScale
end
canvasScaler.gameObject:SetActive(false)


ModuleCache.LogManager.register()

if not GameConfigProject.developmentMode then
    -- 非调试模式下关闭log
    GameConfigProject.netTransferDataShow = false
    ModuleCache.GameManager.close_print()
    if(ModuleCache.GameManager.isEditor)then
        ModuleCache.GameManager.open_print()
    end
    ModuleCache.GameManager.print_toggle_data.print = print
    print = function ( ... ) end
else
    require("mobdebug").start()
end

UnityEngine.Screen.sleepTimeout = -1
---------------------------------------------------------------------------------

local accountID = UnityEngine.PlayerPrefs.GetString(ModuleCache.AppData.PLAYER_PREFS_KEY_ACCOUNT, "0")
if accountID ~= "0" then
    ModuleCache.GameSDKInterface:BuglySetUserId(accountID)
end

ModuleCache.ModuleManager.show_module("public", "login")



