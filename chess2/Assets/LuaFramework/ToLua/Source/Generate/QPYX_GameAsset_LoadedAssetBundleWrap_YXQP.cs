using System;
using LuaInterface;

public class QPYX_GameAsset_LoadedAssetBundleWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(GameAsset.LoadedAssetBundle), typeof(System.Object));
		L_YXQP.RegFunction("IsLoadedAll", QPYX_IsLoadedAll_YXQP);
		L_YXQP.RegFunction("LoadAllAssets", QPYX_LoadAllAssets_YXQP);
		L_YXQP.RegFunction("GetAsset", QPYX_GetAsset_YXQP);
		L_YXQP.RegFunction("Reset", QPYX_Reset_YXQP);
		L_YXQP.RegFunction("UnloadAssetBundle", QPYX_UnloadAssetBundle_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("assetBundleName", QPYX_get_assetBundleName_YXQP, QPYX_set_assetBundleName_YXQP);
		L_YXQP.RegVar("assetBundle", QPYX_get_assetBundle_YXQP, QPYX_set_assetBundle_YXQP);
		L_YXQP.RegVar("assetObjects", QPYX_get_assetObjects_YXQP, QPYX_set_assetObjects_YXQP);
		L_YXQP.RegVar("cacheGameObject", QPYX_get_cacheGameObject_YXQP, QPYX_set_cacheGameObject_YXQP);
		L_YXQP.RegVar("dependAssetBundles", QPYX_get_dependAssetBundles_YXQP, QPYX_set_dependAssetBundles_YXQP);
		L_YXQP.RegVar("referencedCount", QPYX_get_referencedCount_YXQP, QPYX_set_referencedCount_YXQP);
		L_YXQP.RegVar("isLoaded", QPYX_get_isLoaded_YXQP, QPYX_set_isLoaded_YXQP);
		L_YXQP.RegVar("erroMsg", QPYX_get_erroMsg_YXQP, QPYX_set_erroMsg_YXQP);
		L_YXQP.RegVar("onLoaded", QPYX_get_onLoaded_YXQP, QPYX_set_onLoaded_YXQP);
		L_YXQP.RegVar("asyncLoad", QPYX_get_asyncLoad_YXQP, QPYX_set_asyncLoad_YXQP);
		L_YXQP.RegVar("isAsyncLoading", QPYX_get_isAsyncLoading_YXQP, QPYX_set_isAsyncLoading_YXQP);
		L_YXQP.RegVar("isStatic", QPYX_get_isStatic_YXQP, QPYX_set_isStatic_YXQP);
		L_YXQP.RegVar("assetBundleCreateRequest", QPYX_get_assetBundleCreateRequest_YXQP, QPYX_set_assetBundleCreateRequest_YXQP);
		L_YXQP.RegVar("assetBundleRequest", QPYX_get_assetBundleRequest_YXQP, QPYX_set_assetBundleRequest_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IsLoadedAll_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			GameAsset.LoadedAssetBundle  QPYX_obj_YXQP  = (GameAsset.LoadedAssetBundle)ToLua.CheckObject<GameAsset.LoadedAssetBundle>(L_YXQP, 1);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.IsLoadedAll();
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LoadAllAssets_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			GameAsset.LoadedAssetBundle  QPYX_obj_YXQP  = (GameAsset.LoadedAssetBundle)ToLua.CheckObject<GameAsset.LoadedAssetBundle>(L_YXQP, 1);
			QPYX_obj_YXQP.LoadAllAssets();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetAsset_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			GameAsset.LoadedAssetBundle  QPYX_obj_YXQP  = (GameAsset.LoadedAssetBundle)ToLua.CheckObject<GameAsset.LoadedAssetBundle>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
			UnityEngine.Object QPYX_o_YXQP = QPYX_obj_YXQP.GetAsset(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
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
			ToLua.CheckArgsCount(L_YXQP, 1);
			GameAsset.LoadedAssetBundle  QPYX_obj_YXQP  = (GameAsset.LoadedAssetBundle)ToLua.CheckObject<GameAsset.LoadedAssetBundle>(L_YXQP, 1);
			QPYX_obj_YXQP.Reset();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UnloadAssetBundle_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				GameAsset.LoadedAssetBundle  QPYX_obj_YXQP  = (GameAsset.LoadedAssetBundle)ToLua.CheckObject<GameAsset.LoadedAssetBundle>(L_YXQP, 1);
				QPYX_obj_YXQP.UnloadAssetBundle();
				return 0;
			}
			else if (QPYX_count_YXQP == 2)
			{
				GameAsset.LoadedAssetBundle  QPYX_obj_YXQP  = (GameAsset.LoadedAssetBundle)ToLua.CheckObject<GameAsset.LoadedAssetBundle>(L_YXQP, 1);
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				QPYX_obj_YXQP.UnloadAssetBundle(QPYX_arg0_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: GameAsset.LoadedAssetBundle.UnloadAssetBundle");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_assetBundleName_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameAsset.LoadedAssetBundle QPYX_obj_YXQP = (GameAsset.LoadedAssetBundle)QPYX_o_YXQP;
			string QPYX_ret_YXQP = QPYX_obj_YXQP.assetBundleName;
			LuaDLL.lua_pushstring(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index assetBundleName on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_assetBundle_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameAsset.LoadedAssetBundle QPYX_obj_YXQP = (GameAsset.LoadedAssetBundle)QPYX_o_YXQP;
			UnityEngine.AssetBundle QPYX_ret_YXQP = QPYX_obj_YXQP.assetBundle;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index assetBundle on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_assetObjects_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameAsset.LoadedAssetBundle QPYX_obj_YXQP = (GameAsset.LoadedAssetBundle)QPYX_o_YXQP;
			System.Collections.Generic.Dictionary<string,UnityEngine.Object> QPYX_ret_YXQP = QPYX_obj_YXQP.assetObjects;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index assetObjects on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_cacheGameObject_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameAsset.LoadedAssetBundle QPYX_obj_YXQP = (GameAsset.LoadedAssetBundle)QPYX_o_YXQP;
			UnityEngine.GameObject QPYX_ret_YXQP = QPYX_obj_YXQP.cacheGameObject;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index cacheGameObject on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_dependAssetBundles_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameAsset.LoadedAssetBundle QPYX_obj_YXQP = (GameAsset.LoadedAssetBundle)QPYX_o_YXQP;
			GameAsset.LoadedAssetBundle[] QPYX_ret_YXQP = QPYX_obj_YXQP.dependAssetBundles;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index dependAssetBundles on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_referencedCount_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameAsset.LoadedAssetBundle QPYX_obj_YXQP = (GameAsset.LoadedAssetBundle)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.referencedCount;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index referencedCount on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isLoaded_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameAsset.LoadedAssetBundle QPYX_obj_YXQP = (GameAsset.LoadedAssetBundle)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.isLoaded;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isLoaded on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_erroMsg_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameAsset.LoadedAssetBundle QPYX_obj_YXQP = (GameAsset.LoadedAssetBundle)QPYX_o_YXQP;
			string QPYX_ret_YXQP = QPYX_obj_YXQP.erroMsg;
			LuaDLL.lua_pushstring(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index erroMsg on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onLoaded_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameAsset.LoadedAssetBundle QPYX_obj_YXQP = (GameAsset.LoadedAssetBundle)QPYX_o_YXQP;
			System.Action QPYX_ret_YXQP = QPYX_obj_YXQP.onLoaded;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onLoaded on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_asyncLoad_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameAsset.LoadedAssetBundle QPYX_obj_YXQP = (GameAsset.LoadedAssetBundle)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.asyncLoad;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index asyncLoad on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isAsyncLoading_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameAsset.LoadedAssetBundle QPYX_obj_YXQP = (GameAsset.LoadedAssetBundle)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.isAsyncLoading;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isAsyncLoading on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isStatic_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameAsset.LoadedAssetBundle QPYX_obj_YXQP = (GameAsset.LoadedAssetBundle)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.isStatic;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isStatic on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_assetBundleCreateRequest_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameAsset.LoadedAssetBundle QPYX_obj_YXQP = (GameAsset.LoadedAssetBundle)QPYX_o_YXQP;
			UnityEngine.AssetBundleCreateRequest QPYX_ret_YXQP = QPYX_obj_YXQP.assetBundleCreateRequest;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index assetBundleCreateRequest on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_assetBundleRequest_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameAsset.LoadedAssetBundle QPYX_obj_YXQP = (GameAsset.LoadedAssetBundle)QPYX_o_YXQP;
			UnityEngine.AssetBundleRequest QPYX_ret_YXQP = QPYX_obj_YXQP.assetBundleRequest;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index assetBundleRequest on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_assetBundleName_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameAsset.LoadedAssetBundle QPYX_obj_YXQP = (GameAsset.LoadedAssetBundle)QPYX_o_YXQP;
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.assetBundleName = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index assetBundleName on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_assetBundle_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameAsset.LoadedAssetBundle QPYX_obj_YXQP = (GameAsset.LoadedAssetBundle)QPYX_o_YXQP;
			UnityEngine.AssetBundle QPYX_arg0_YXQP = (UnityEngine.AssetBundle)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.AssetBundle));
			QPYX_obj_YXQP.assetBundle = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index assetBundle on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_assetObjects_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameAsset.LoadedAssetBundle QPYX_obj_YXQP = (GameAsset.LoadedAssetBundle)QPYX_o_YXQP;
			System.Collections.Generic.Dictionary<string,UnityEngine.Object> QPYX_arg0_YXQP = (System.Collections.Generic.Dictionary<string,UnityEngine.Object>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.Dictionary<string,UnityEngine.Object>));
			QPYX_obj_YXQP.assetObjects = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index assetObjects on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_cacheGameObject_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameAsset.LoadedAssetBundle QPYX_obj_YXQP = (GameAsset.LoadedAssetBundle)QPYX_o_YXQP;
			UnityEngine.GameObject QPYX_arg0_YXQP = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.GameObject));
			QPYX_obj_YXQP.cacheGameObject = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index cacheGameObject on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_dependAssetBundles_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameAsset.LoadedAssetBundle QPYX_obj_YXQP = (GameAsset.LoadedAssetBundle)QPYX_o_YXQP;
			GameAsset.LoadedAssetBundle[] QPYX_arg0_YXQP = ToLua.CheckObjectArray<GameAsset.LoadedAssetBundle>(L_YXQP, 2);
			QPYX_obj_YXQP.dependAssetBundles = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index dependAssetBundles on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_referencedCount_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameAsset.LoadedAssetBundle QPYX_obj_YXQP = (GameAsset.LoadedAssetBundle)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.referencedCount = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index referencedCount on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_isLoaded_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameAsset.LoadedAssetBundle QPYX_obj_YXQP = (GameAsset.LoadedAssetBundle)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.isLoaded = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isLoaded on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_erroMsg_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameAsset.LoadedAssetBundle QPYX_obj_YXQP = (GameAsset.LoadedAssetBundle)QPYX_o_YXQP;
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.erroMsg = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index erroMsg on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onLoaded_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameAsset.LoadedAssetBundle QPYX_obj_YXQP = (GameAsset.LoadedAssetBundle)QPYX_o_YXQP;
			System.Action QPYX_arg0_YXQP = (System.Action)ToLua.CheckDelegate<System.Action>(L_YXQP, 2);
			QPYX_obj_YXQP.onLoaded = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onLoaded on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_asyncLoad_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameAsset.LoadedAssetBundle QPYX_obj_YXQP = (GameAsset.LoadedAssetBundle)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.asyncLoad = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index asyncLoad on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_isAsyncLoading_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameAsset.LoadedAssetBundle QPYX_obj_YXQP = (GameAsset.LoadedAssetBundle)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.isAsyncLoading = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isAsyncLoading on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_isStatic_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameAsset.LoadedAssetBundle QPYX_obj_YXQP = (GameAsset.LoadedAssetBundle)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.isStatic = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isStatic on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_assetBundleCreateRequest_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameAsset.LoadedAssetBundle QPYX_obj_YXQP = (GameAsset.LoadedAssetBundle)QPYX_o_YXQP;
			UnityEngine.AssetBundleCreateRequest QPYX_arg0_YXQP = (UnityEngine.AssetBundleCreateRequest)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.AssetBundleCreateRequest));
			QPYX_obj_YXQP.assetBundleCreateRequest = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index assetBundleCreateRequest on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_assetBundleRequest_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameAsset.LoadedAssetBundle QPYX_obj_YXQP = (GameAsset.LoadedAssetBundle)QPYX_o_YXQP;
			UnityEngine.AssetBundleRequest QPYX_arg0_YXQP = (UnityEngine.AssetBundleRequest)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.AssetBundleRequest));
			QPYX_obj_YXQP.assetBundleRequest = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index assetBundleRequest on a nil value");
		}
	}
}

