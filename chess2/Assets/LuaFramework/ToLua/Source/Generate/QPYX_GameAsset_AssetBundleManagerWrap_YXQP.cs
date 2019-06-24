using System;
using LuaInterface;

public class QPYX_GameAsset_AssetBundleManagerWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(GameAsset.AssetBundleManager), typeof(SingletonProject<GameAsset.AssetBundleManager>));
		L_YXQP.RegFunction("Initialize", QPYX_Initialize_YXQP);
		L_YXQP.RegFunction("LoadAssetBundleManifestScriptableObject", QPYX_LoadAssetBundleManifestScriptableObject_YXQP);
		L_YXQP.RegFunction("GetFullManifest", QPYX_GetFullManifest_YXQP);
		L_YXQP.RegFunction("GetLoadedAssetBundleDic", QPYX_GetLoadedAssetBundleDic_YXQP);
		L_YXQP.RegFunction("Reset", QPYX_Reset_YXQP);
		L_YXQP.RegFunction("ResetPackage", QPYX_ResetPackage_YXQP);
		L_YXQP.RegFunction("PackageHaveLoad", QPYX_PackageHaveLoad_YXQP);
		L_YXQP.RegFunction("GetPackageHaveLoadeds", QPYX_GetPackageHaveLoadeds_YXQP);
		L_YXQP.RegFunction("UnLoadAssetBundle", QPYX_UnLoadAssetBundle_YXQP);
		L_YXQP.RegFunction("GetDependPackages", QPYX_GetDependPackages_YXQP);
		L_YXQP.RegFunction("AssetBundleIsInManifest", QPYX_AssetBundleIsInManifest_YXQP);
		L_YXQP.RegFunction("AssetBundleExist", QPYX_AssetBundleExist_YXQP);
		L_YXQP.RegFunction("LoadAssetBundle", QPYX_LoadAssetBundle_YXQP);
		L_YXQP.RegFunction("LoadAssetBundleAsync", QPYX_LoadAssetBundleAsync_YXQP);
		L_YXQP.RegFunction("UnLoadLoadedAssetBundle", QPYX_UnLoadLoadedAssetBundle_YXQP);
		L_YXQP.RegFunction("RemoveFromLoadedDic", QPYX_RemoveFromLoadedDic_YXQP);
		L_YXQP.RegFunction("LoadBytesFromStreamingAssets", QPYX_LoadBytesFromStreamingAssets_YXQP);
		L_YXQP.RegFunction("AssetBundleIsLoaded", QPYX_AssetBundleIsLoaded_YXQP);
		L_YXQP.RegFunction("LuaAssetBundleIsLoaded", QPYX_LuaAssetBundleIsLoaded_YXQP);
		L_YXQP.RegFunction("AssetBundlesIsLoadedOnly", QPYX_AssetBundlesIsLoadedOnly_YXQP);
		L_YXQP.RegFunction("AssetBundleIsLoadedOnly", QPYX_AssetBundleIsLoadedOnly_YXQP);
		L_YXQP.RegFunction("LoadAssetBundleFromFile", QPYX_LoadAssetBundleFromFile_YXQP);
		L_YXQP.RegFunction("LoadAssetBundleFromFileAsync", QPYX_LoadAssetBundleFromFileAsync_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateGameAsset_AssetBundleManager_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("onEventFn", QPYX_get_onEventFn_YXQP, QPYX_set_onEventFn_YXQP);
		L_YXQP.RegVar("loadAssetBundleNeedCRC", QPYX_get_loadAssetBundleNeedCRC_YXQP, QPYX_set_loadAssetBundleNeedCRC_YXQP);
		L_YXQP.RegVar("loadAssetBundleCheckInManifest", QPYX_get_loadAssetBundleCheckInManifest_YXQP, QPYX_set_loadAssetBundleCheckInManifest_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateGameAsset_AssetBundleManager_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				GameAsset.AssetBundleManager QPYX_obj_YXQP = new GameAsset.AssetBundleManager();
				ToLua.PushObject(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: GameAsset.AssetBundleManager.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Initialize_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			GameAsset.AssetBundleManager  QPYX_obj_YXQP  = (GameAsset.AssetBundleManager)ToLua.CheckObject<GameAsset.AssetBundleManager>(L_YXQP, 1);
			QPYX_obj_YXQP.Initialize();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LoadAssetBundleManifestScriptableObject_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			GameAsset.AssetBundleManager  QPYX_obj_YXQP  = (GameAsset.AssetBundleManager)ToLua.CheckObject<GameAsset.AssetBundleManager>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 3);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.LoadAssetBundleManifestScriptableObject(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetFullManifest_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			GameAsset.AssetBundleManager  QPYX_obj_YXQP  = (GameAsset.AssetBundleManager)ToLua.CheckObject<GameAsset.AssetBundleManager>(L_YXQP, 1);
			UnityEngine.AssetBundleManifest QPYX_o_YXQP = QPYX_obj_YXQP.GetFullManifest();
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetLoadedAssetBundleDic_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			GameAsset.AssetBundleManager  QPYX_obj_YXQP  = (GameAsset.AssetBundleManager)ToLua.CheckObject<GameAsset.AssetBundleManager>(L_YXQP, 1);
			System.Collections.Generic.Dictionary<string,GameAsset.LoadedAssetBundle> QPYX_o_YXQP = QPYX_obj_YXQP.GetLoadedAssetBundleDic();
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Reset_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameAsset.AssetBundleManager  QPYX_obj_YXQP  = (GameAsset.AssetBundleManager)ToLua.CheckObject<GameAsset.AssetBundleManager>(L_YXQP, 1);
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.Reset(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ResetPackage_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			GameAsset.AssetBundleManager  QPYX_obj_YXQP  = (GameAsset.AssetBundleManager)ToLua.CheckObject<GameAsset.AssetBundleManager>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
			QPYX_obj_YXQP.ResetPackage(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_PackageHaveLoad_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			GameAsset.AssetBundleManager  QPYX_obj_YXQP  = (GameAsset.AssetBundleManager)ToLua.CheckObject<GameAsset.AssetBundleManager>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.PackageHaveLoad(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetPackageHaveLoadeds_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			GameAsset.AssetBundleManager  QPYX_obj_YXQP  = (GameAsset.AssetBundleManager)ToLua.CheckObject<GameAsset.AssetBundleManager>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
			System.Collections.Generic.List<string> QPYX_o_YXQP = QPYX_obj_YXQP.GetPackageHaveLoadeds(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UnLoadAssetBundle_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				GameAsset.AssetBundleManager  QPYX_obj_YXQP  = (GameAsset.AssetBundleManager)ToLua.CheckObject<GameAsset.AssetBundleManager>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				QPYX_obj_YXQP.UnLoadAssetBundle(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3)
			{
				GameAsset.AssetBundleManager  QPYX_obj_YXQP  = (GameAsset.AssetBundleManager)ToLua.CheckObject<GameAsset.AssetBundleManager>(L_YXQP, 1);
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				QPYX_obj_YXQP.UnLoadAssetBundle(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: GameAsset.AssetBundleManager.UnLoadAssetBundle");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetDependPackages_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameAsset.AssetBundleManager  QPYX_obj_YXQP  = (GameAsset.AssetBundleManager)ToLua.CheckObject<GameAsset.AssetBundleManager>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			System.Collections.Generic.List<string> QPYX_o_YXQP = QPYX_obj_YXQP.GetDependPackages(QPYX_arg0_YXQP);
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_AssetBundleIsInManifest_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameAsset.AssetBundleManager  QPYX_obj_YXQP  = (GameAsset.AssetBundleManager)ToLua.CheckObject<GameAsset.AssetBundleManager>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.AssetBundleIsInManifest(QPYX_arg0_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_AssetBundleExist_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameAsset.AssetBundleManager  QPYX_obj_YXQP  = (GameAsset.AssetBundleManager)ToLua.CheckObject<GameAsset.AssetBundleManager>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.AssetBundleExist(QPYX_arg0_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LoadAssetBundle_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameAsset.AssetBundleManager  QPYX_obj_YXQP  = (GameAsset.AssetBundleManager)ToLua.CheckObject<GameAsset.AssetBundleManager>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			GameAsset.LoadedAssetBundle QPYX_o_YXQP = QPYX_obj_YXQP.LoadAssetBundle(QPYX_arg0_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LoadAssetBundleAsync_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			GameAsset.AssetBundleManager  QPYX_obj_YXQP  = (GameAsset.AssetBundleManager)ToLua.CheckObject<GameAsset.AssetBundleManager>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 3);
			System.Action<GameAsset.LoadedAssetBundle> QPYX_arg2_YXQP = (System.Action<GameAsset.LoadedAssetBundle>)ToLua.CheckDelegate<System.Action<GameAsset.LoadedAssetBundle>>(L_YXQP, 4);
			GameAsset.LoadedAssetBundle QPYX_o_YXQP = QPYX_obj_YXQP.LoadAssetBundleAsync(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UnLoadLoadedAssetBundle_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				GameAsset.AssetBundleManager  QPYX_obj_YXQP  = (GameAsset.AssetBundleManager)ToLua.CheckObject<GameAsset.AssetBundleManager>(L_YXQP, 1);
				GameAsset.LoadedAssetBundle QPYX_arg0_YXQP = (GameAsset.LoadedAssetBundle)ToLua.CheckObject<GameAsset.LoadedAssetBundle>(L_YXQP, 2);
				QPYX_obj_YXQP.UnLoadLoadedAssetBundle(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3)
			{
				GameAsset.AssetBundleManager  QPYX_obj_YXQP  = (GameAsset.AssetBundleManager)ToLua.CheckObject<GameAsset.AssetBundleManager>(L_YXQP, 1);
				GameAsset.LoadedAssetBundle QPYX_arg0_YXQP = (GameAsset.LoadedAssetBundle)ToLua.CheckObject<GameAsset.LoadedAssetBundle>(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				QPYX_obj_YXQP.UnLoadLoadedAssetBundle(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 4)
			{
				GameAsset.AssetBundleManager  QPYX_obj_YXQP  = (GameAsset.AssetBundleManager)ToLua.CheckObject<GameAsset.AssetBundleManager>(L_YXQP, 1);
				GameAsset.LoadedAssetBundle QPYX_arg0_YXQP = (GameAsset.LoadedAssetBundle)ToLua.CheckObject<GameAsset.LoadedAssetBundle>(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				bool QPYX_arg2_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 4);
				QPYX_obj_YXQP.UnLoadLoadedAssetBundle(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: GameAsset.AssetBundleManager.UnLoadLoadedAssetBundle");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_RemoveFromLoadedDic_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameAsset.AssetBundleManager  QPYX_obj_YXQP  = (GameAsset.AssetBundleManager)ToLua.CheckObject<GameAsset.AssetBundleManager>(L_YXQP, 1);
			GameAsset.LoadedAssetBundle QPYX_arg0_YXQP = (GameAsset.LoadedAssetBundle)ToLua.CheckObject<GameAsset.LoadedAssetBundle>(L_YXQP, 2);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.RemoveFromLoadedDic(QPYX_arg0_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LoadBytesFromStreamingAssets_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
			byte[] QPYX_o_YXQP = GameAsset.AssetBundleManager.LoadBytesFromStreamingAssets(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_AssetBundleIsLoaded_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameAsset.AssetBundleManager  QPYX_obj_YXQP  = (GameAsset.AssetBundleManager)ToLua.CheckObject<GameAsset.AssetBundleManager>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.AssetBundleIsLoaded(QPYX_arg0_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaAssetBundleIsLoaded_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameAsset.AssetBundleManager  QPYX_obj_YXQP  = (GameAsset.AssetBundleManager)ToLua.CheckObject<GameAsset.AssetBundleManager>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.LuaAssetBundleIsLoaded(QPYX_arg0_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_AssetBundlesIsLoadedOnly_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameAsset.AssetBundleManager  QPYX_obj_YXQP  = (GameAsset.AssetBundleManager)ToLua.CheckObject<GameAsset.AssetBundleManager>(L_YXQP, 1);
			string[] QPYX_arg0_YXQP = ToLua.CheckStringArray(L_YXQP, 2);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.AssetBundlesIsLoadedOnly(QPYX_arg0_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_AssetBundleIsLoadedOnly_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameAsset.AssetBundleManager  QPYX_obj_YXQP  = (GameAsset.AssetBundleManager)ToLua.CheckObject<GameAsset.AssetBundleManager>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.AssetBundleIsLoadedOnly(QPYX_arg0_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LoadAssetBundleFromFile_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			UnityEngine.AssetBundle QPYX_o_YXQP = GameAsset.AssetBundleManager.LoadAssetBundleFromFile(QPYX_arg0_YXQP);
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LoadAssetBundleFromFileAsync_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			UnityEngine.AssetBundleCreateRequest QPYX_o_YXQP = GameAsset.AssetBundleManager.LoadAssetBundleFromFileAsync(QPYX_arg0_YXQP);
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onEventFn_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameAsset.AssetBundleManager QPYX_obj_YXQP = (GameAsset.AssetBundleManager)QPYX_o_YXQP;
			LuaInterface.LuaFunction QPYX_ret_YXQP = QPYX_obj_YXQP.onEventFn;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onEventFn on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_loadAssetBundleNeedCRC_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameAsset.AssetBundleManager QPYX_obj_YXQP = (GameAsset.AssetBundleManager)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.loadAssetBundleNeedCRC;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index loadAssetBundleNeedCRC on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_loadAssetBundleCheckInManifest_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameAsset.AssetBundleManager QPYX_obj_YXQP = (GameAsset.AssetBundleManager)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.loadAssetBundleCheckInManifest;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index loadAssetBundleCheckInManifest on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onEventFn_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameAsset.AssetBundleManager QPYX_obj_YXQP = (GameAsset.AssetBundleManager)QPYX_o_YXQP;
			LuaFunction QPYX_arg0_YXQP = ToLua.CheckLuaFunction(L_YXQP, 2);
			QPYX_obj_YXQP.onEventFn = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onEventFn on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_loadAssetBundleNeedCRC_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameAsset.AssetBundleManager QPYX_obj_YXQP = (GameAsset.AssetBundleManager)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.loadAssetBundleNeedCRC = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index loadAssetBundleNeedCRC on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_loadAssetBundleCheckInManifest_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameAsset.AssetBundleManager QPYX_obj_YXQP = (GameAsset.AssetBundleManager)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.loadAssetBundleCheckInManifest = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index loadAssetBundleCheckInManifest on a nil value");
		}
	}
}

