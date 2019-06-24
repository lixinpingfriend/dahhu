using UnityEngine;
using System.Collections;
using System.IO;
using LuaInterface;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using System;

public class GameInit : LuaClient
{
    
    public string startLuaName = "init/main";

    protected LuaFunction onApplicationFocus = null;

    public static string encryptFilePathHeadStr = "QP";
    
    protected void Awake() {
        try {
            string uid = PlayerPrefs.GetString("PlayerPrefs_Login_USERID", "0");
            if (PlayerPrefs.GetInt("PlayerPrefs_OpenDevelopmentMode", 0) != 0) {
                uid += "_test";
            }
            BuglyAgent.ConfigDefault("DHQPYX", Application.version, uid, 0);
        } catch (System.Exception ex){
            Debug.LogException(ex);
        }
        BuglyAgent.ConfigAutoReportLogLevel(LogSeverity.LogException);
		#if UNITY_IPHONE || UNITY_IOS
		    BuglyAgent.InitWithAppId ("b84a162675");
		#elif UNITY_ANDROID
//		    BuglyAgent.InitWithAppId ("331505691e");
            BuglyAgent.EnableExceptionHandler();
		#endif

#if !UNITY_EDITOR
        GameConfigProject.instance.assetLoadType = 1;
        GameConfigProject.instance.testView = false;
#else
         if (GameConfigProject.instance.testView)
         {
             return;
         }
#endif
        GameObject gameRoot = GameObject.Find("GameRoot");
        if (!GameConfigProject.instance.testView && gameRoot != null) {
            gameRoot.name = "GameRootNeedDestroy";
            gameRoot.SetActive(false);
            Destroy(gameRoot);
        }
        if (!ClearPersistentExpireAssets()) {
            ClearPersistentExpireAssets();
        }
        new LuaLoader();
        base.Awake();
    }


  //清理本地过期资源，还需要删除之前下载过的冗余资源
    bool ClearPersistentExpireAssets() {
        try
        {
            bool needClearPersistentExpireAssets = false;
            var gameOriginalAssetVersion = GameSDKInterface.instance.ReadFileFromeAssets(FileUtility.EncryptFilePath(string.Format("{0}/AssetDataBytes/version.txt", DataConfigProject.platform)));
            if (Application.version != PlayerPrefs.GetString("_GameVersion", "1.0.0"))
            {
                Debug.Log(Application.version + " --" + PlayerPrefs.GetString("_GameVersion", "1.0.0"));
                needClearPersistentExpireAssets = true;
            }

            if (!needClearPersistentExpireAssets)
            {
                if (PlayerPrefs.GetString("_GameOriginalAssetVersion") != gameOriginalAssetVersion)
                {
                    needClearPersistentExpireAssets = true;
                }
                if (!needClearPersistentExpireAssets && !string.IsNullOrEmpty(gameOriginalAssetVersion)) {
                    int appInternalAssetVersion = int.Parse(gameOriginalAssetVersion);
                    if (File.Exists(Application.persistentDataPath + "/assetsdata/version.txt")) {
                        var textTmp = File.ReadAllText(Application.persistentDataPath + "/assetsdata/version.txt");
                        int appPersistentAssetVersion = int.Parse(textTmp.Split('|')[0]);
                        if (appInternalAssetVersion > appPersistentAssetVersion) {  //如果app自带资源版本号高，那么需要删除磁盘中的所有资源
                            needClearPersistentExpireAssets = true;
                        }
                    }
                }
            }

            if (needClearPersistentExpireAssets)
            {
                Debug.Log("needClearPersistentExpireAssets");
                string playerPrefsBackupData = PlayerPrefs.GetString("_PlayerPrefsBackupData", "");
//                PlayerPrefs.DeleteAll();
                if (!string.IsNullOrEmpty(playerPrefsBackupData))
                {
                   PlayerPrefs.SetString("_PlayerPrefsBackupData", playerPrefsBackupData);
                }
                bool result = FileUtility.DirectoryDelete(Application.persistentDataPath + "/assetsdata", true);
				if (!result) {
				    result = FileUtility.DeleteDirectory(Application.persistentDataPath + "/assetsdata", true);
				}
                if (!result) {
				    result = FileUtility.DeleteDirectory(Application.persistentDataPath + "/assetsdata", true);
				}
                PlayerPrefs.SetString("_ClearPersistentExpireAssets", result.ToString());
                PlayerPrefs.SetString("_GameVersion", Application.version);
                PlayerPrefs.SetString("_GameOriginalAssetVersion", gameOriginalAssetVersion);
                PlayerPrefs.Save();
            }
            
            return true;
        } catch (System.Exception ex) {
            Debug.LogException(ex);
            return false;
        }
    }


    protected override void OnLoadFinished() {
        luaState.Start();
        //StartLooper();
        loop = gameObject.AddComponent<LuaLooper>();
        loop.luaState = luaState;
        StartMain();
    }


    protected override void OpenLibs() {
        base.OpenLibs();
        // luaState.OpenLibs(LuaDLL.luaopen_sproto_core);
        // luaState.OpenLibs(LuaDLL.luaopen_protobuf_c);
        OpenCJson();
    }

    protected override void StartMain()
    {
        if (GameConfigProject.instance.testView) {
            return;
        }
        bool initSucess = false;
        try {
            luaState.DoFile(startLuaName);  //初始化脚本，如果出错了，那么很有可能是更新出错，把本地的缓存删除再次尝试
            initSucess = true;
        } catch (Exception ex) {
            #if !UNITY_EDITOR
            PlayerPrefs.DeleteAll();
            FileUtility.DirectoryDelete(Application.persistentDataPath, true);
            BuglyAgent.ReportException(ex, "Lua初始化失败：");
            #endif
            Debug.LogError("Lua初始化失败：" + ex);
        }   

        if (!initSucess) {
            try {
                Debug.Log("Lua初始化失败，删除缓存再次尝试！");
                luaState.DoFile(startLuaName);  //初始化失败后，删除磁盘缓存，再次初始化
            } catch (Exception ex) {
                BuglyAgent.ReportException(ex, "Lua初始化失败：");
                Debug.LogError("Lua再次初始化失败：" + ex);
            }   
        }
        levelLoaded = luaState.GetFunction("ApplicationEvent.on_level_was_loaded");
        onApplicationFocus = luaState.GetFunction("ApplicationEvent.on_app_focus");
    }

    void OnApplicationFocus(bool state) {
        if (onApplicationFocus != null) {
            onApplicationFocus.BeginPCall();
            onApplicationFocus.Push(state);
            onApplicationFocus.PCall();
            onApplicationFocus.EndPCall();
        }
    }

    public override void Destroy() {
        base.Destroy();
        if (onApplicationFocus != null) {
            onApplicationFocus.Dispose();
            onApplicationFocus = null;
        }
    }

    public void ReloadCurScene() {
        if (!FileUtility.DirectoryDelete(Application.persistentDataPath + "/assetsdata", true))
        {
            FileUtility.DeleteDirectory(Application.persistentDataPath + "/assetsdata", true);
        }
        CustomerUtil.ReloadCurScene();
    }

}
