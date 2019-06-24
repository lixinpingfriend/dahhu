using System;
using LuaInterface;

public class QPYX_UnityEngine_AssetBundleWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.AssetBundle), typeof(UnityEngine.Object));
		L_YXQP.RegFunction("UnloadAllAssetBundles", QPYX_UnloadAllAssetBundles_YXQP);
		L_YXQP.RegFunction("GetAllLoadedAssetBundles", QPYX_GetAllLoadedAssetBundles_YXQP);
		L_YXQP.RegFunction("LoadFromFileAsync", QPYX_LoadFromFileAsync_YXQP);
		L_YXQP.RegFunction("LoadFromFile", QPYX_LoadFromFile_YXQP);
		L_YXQP.RegFunction("LoadFromMemoryAsync", QPYX_LoadFromMemoryAsync_YXQP);
		L_YXQP.RegFunction("LoadFromMemory", QPYX_LoadFromMemory_YXQP);
		L_YXQP.RegFunction("LoadFromStreamAsync", QPYX_LoadFromStreamAsync_YXQP);
		L_YXQP.RegFunction("LoadFromStream", QPYX_LoadFromStream_YXQP);
		L_YXQP.RegFunction("Contains", QPYX_Contains_YXQP);
		L_YXQP.RegFunction("LoadAsset", QPYX_LoadAsset_YXQP);
		L_YXQP.RegFunction("LoadAssetAsync", QPYX_LoadAssetAsync_YXQP);
		L_YXQP.RegFunction("LoadAssetWithSubAssets", QPYX_LoadAssetWithSubAssets_YXQP);
		L_YXQP.RegFunction("LoadAssetWithSubAssetsAsync", QPYX_LoadAssetWithSubAssetsAsync_YXQP);
		L_YXQP.RegFunction("LoadAllAssets", QPYX_LoadAllAssets_YXQP);
		L_YXQP.RegFunction("LoadAllAssetsAsync", QPYX_LoadAllAssetsAsync_YXQP);
		L_YXQP.RegFunction("Unload", QPYX_Unload_YXQP);
		L_YXQP.RegFunction("GetAllAssetNames", QPYX_GetAllAssetNames_YXQP);
		L_YXQP.RegFunction("GetAllScenePaths", QPYX_GetAllScenePaths_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateUnityEngine_AssetBundle_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("mainAsset", QPYX_get_mainAsset_YXQP, null);
		L_YXQP.RegVar("isStreamedSceneAssetBundle", QPYX_get_isStreamedSceneAssetBundle_YXQP, null);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUnityEngine_AssetBundle_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				UnityEngine.AssetBundle QPYX_obj_YXQP = new UnityEngine.AssetBundle();
				ToLua.PushSealed(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UnityEngine.AssetBundle.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UnloadAllAssetBundles_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 1);
			UnityEngine.AssetBundle.UnloadAllAssetBundles(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetAllLoadedAssetBundles_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 0);
			System.Collections.Generic.IEnumerable<UnityEngine.AssetBundle> QPYX_o_YXQP = UnityEngine.AssetBundle.GetAllLoadedAssetBundles();
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LoadFromFileAsync_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				UnityEngine.AssetBundleCreateRequest QPYX_o_YXQP = UnityEngine.AssetBundle.LoadFromFileAsync(QPYX_arg0_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				uint QPYX_arg1_YXQP = (uint)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.AssetBundleCreateRequest QPYX_o_YXQP = UnityEngine.AssetBundle.LoadFromFileAsync(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				uint QPYX_arg1_YXQP = (uint)LuaDLL.luaL_checknumber(L_YXQP, 2);
				ulong QPYX_arg2_YXQP = LuaDLL.tolua_checkuint64(L_YXQP, 3);
				UnityEngine.AssetBundleCreateRequest QPYX_o_YXQP = UnityEngine.AssetBundle.LoadFromFileAsync(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.AssetBundle.LoadFromFileAsync");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LoadFromFile_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				UnityEngine.AssetBundle QPYX_o_YXQP = UnityEngine.AssetBundle.LoadFromFile(QPYX_arg0_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				uint QPYX_arg1_YXQP = (uint)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.AssetBundle QPYX_o_YXQP = UnityEngine.AssetBundle.LoadFromFile(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				uint QPYX_arg1_YXQP = (uint)LuaDLL.luaL_checknumber(L_YXQP, 2);
				ulong QPYX_arg2_YXQP = LuaDLL.tolua_checkuint64(L_YXQP, 3);
				UnityEngine.AssetBundle QPYX_o_YXQP = UnityEngine.AssetBundle.LoadFromFile(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.AssetBundle.LoadFromFile");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LoadFromMemoryAsync_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				byte[] QPYX_arg0_YXQP = ToLua.CheckByteBuffer(L_YXQP, 1);
				UnityEngine.AssetBundleCreateRequest QPYX_o_YXQP = UnityEngine.AssetBundle.LoadFromMemoryAsync(QPYX_arg0_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				byte[] QPYX_arg0_YXQP = ToLua.CheckByteBuffer(L_YXQP, 1);
				uint QPYX_arg1_YXQP = (uint)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.AssetBundleCreateRequest QPYX_o_YXQP = UnityEngine.AssetBundle.LoadFromMemoryAsync(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.AssetBundle.LoadFromMemoryAsync");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LoadFromMemory_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				byte[] QPYX_arg0_YXQP = ToLua.CheckByteBuffer(L_YXQP, 1);
				UnityEngine.AssetBundle QPYX_o_YXQP = UnityEngine.AssetBundle.LoadFromMemory(QPYX_arg0_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				byte[] QPYX_arg0_YXQP = ToLua.CheckByteBuffer(L_YXQP, 1);
				uint QPYX_arg1_YXQP = (uint)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.AssetBundle QPYX_o_YXQP = UnityEngine.AssetBundle.LoadFromMemory(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.AssetBundle.LoadFromMemory");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LoadFromStreamAsync_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				System.IO.Stream QPYX_arg0_YXQP = (System.IO.Stream)ToLua.CheckObject<System.IO.Stream>(L_YXQP, 1);
				UnityEngine.AssetBundleCreateRequest QPYX_o_YXQP = UnityEngine.AssetBundle.LoadFromStreamAsync(QPYX_arg0_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				System.IO.Stream QPYX_arg0_YXQP = (System.IO.Stream)ToLua.CheckObject<System.IO.Stream>(L_YXQP, 1);
				uint QPYX_arg1_YXQP = (uint)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.AssetBundleCreateRequest QPYX_o_YXQP = UnityEngine.AssetBundle.LoadFromStreamAsync(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				System.IO.Stream QPYX_arg0_YXQP = (System.IO.Stream)ToLua.CheckObject<System.IO.Stream>(L_YXQP, 1);
				uint QPYX_arg1_YXQP = (uint)LuaDLL.luaL_checknumber(L_YXQP, 2);
				uint QPYX_arg2_YXQP = (uint)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.AssetBundleCreateRequest QPYX_o_YXQP = UnityEngine.AssetBundle.LoadFromStreamAsync(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.AssetBundle.LoadFromStreamAsync");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LoadFromStream_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				System.IO.Stream QPYX_arg0_YXQP = (System.IO.Stream)ToLua.CheckObject<System.IO.Stream>(L_YXQP, 1);
				UnityEngine.AssetBundle QPYX_o_YXQP = UnityEngine.AssetBundle.LoadFromStream(QPYX_arg0_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				System.IO.Stream QPYX_arg0_YXQP = (System.IO.Stream)ToLua.CheckObject<System.IO.Stream>(L_YXQP, 1);
				uint QPYX_arg1_YXQP = (uint)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.AssetBundle QPYX_o_YXQP = UnityEngine.AssetBundle.LoadFromStream(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				System.IO.Stream QPYX_arg0_YXQP = (System.IO.Stream)ToLua.CheckObject<System.IO.Stream>(L_YXQP, 1);
				uint QPYX_arg1_YXQP = (uint)LuaDLL.luaL_checknumber(L_YXQP, 2);
				uint QPYX_arg2_YXQP = (uint)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.AssetBundle QPYX_o_YXQP = UnityEngine.AssetBundle.LoadFromStream(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.AssetBundle.LoadFromStream");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Contains_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.AssetBundle  QPYX_obj_YXQP  = (UnityEngine.AssetBundle)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AssetBundle));
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.Contains(QPYX_arg0_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LoadAsset_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.AssetBundle  QPYX_obj_YXQP  = (UnityEngine.AssetBundle)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AssetBundle));
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				UnityEngine.Object QPYX_o_YXQP = QPYX_obj_YXQP.LoadAsset(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.AssetBundle  QPYX_obj_YXQP  = (UnityEngine.AssetBundle)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AssetBundle));
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				System.Type QPYX_arg1_YXQP = ToLua.CheckMonoType(L_YXQP, 3);
				UnityEngine.Object QPYX_o_YXQP = QPYX_obj_YXQP.LoadAsset(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.AssetBundle.LoadAsset");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LoadAssetAsync_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.AssetBundle  QPYX_obj_YXQP  = (UnityEngine.AssetBundle)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AssetBundle));
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				UnityEngine.AssetBundleRequest QPYX_o_YXQP = QPYX_obj_YXQP.LoadAssetAsync(QPYX_arg0_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.AssetBundle  QPYX_obj_YXQP  = (UnityEngine.AssetBundle)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AssetBundle));
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				System.Type QPYX_arg1_YXQP = ToLua.CheckMonoType(L_YXQP, 3);
				UnityEngine.AssetBundleRequest QPYX_o_YXQP = QPYX_obj_YXQP.LoadAssetAsync(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.AssetBundle.LoadAssetAsync");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LoadAssetWithSubAssets_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.AssetBundle  QPYX_obj_YXQP  = (UnityEngine.AssetBundle)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AssetBundle));
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				UnityEngine.Object[] QPYX_o_YXQP = QPYX_obj_YXQP.LoadAssetWithSubAssets(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.AssetBundle  QPYX_obj_YXQP  = (UnityEngine.AssetBundle)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AssetBundle));
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				System.Type QPYX_arg1_YXQP = ToLua.CheckMonoType(L_YXQP, 3);
				UnityEngine.Object[] QPYX_o_YXQP = QPYX_obj_YXQP.LoadAssetWithSubAssets(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.AssetBundle.LoadAssetWithSubAssets");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LoadAssetWithSubAssetsAsync_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.AssetBundle  QPYX_obj_YXQP  = (UnityEngine.AssetBundle)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AssetBundle));
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				UnityEngine.AssetBundleRequest QPYX_o_YXQP = QPYX_obj_YXQP.LoadAssetWithSubAssetsAsync(QPYX_arg0_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.AssetBundle  QPYX_obj_YXQP  = (UnityEngine.AssetBundle)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AssetBundle));
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				System.Type QPYX_arg1_YXQP = ToLua.CheckMonoType(L_YXQP, 3);
				UnityEngine.AssetBundleRequest QPYX_o_YXQP = QPYX_obj_YXQP.LoadAssetWithSubAssetsAsync(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.AssetBundle.LoadAssetWithSubAssetsAsync");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LoadAllAssets_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				UnityEngine.AssetBundle  QPYX_obj_YXQP  = (UnityEngine.AssetBundle)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AssetBundle));
				UnityEngine.Object[] QPYX_o_YXQP = QPYX_obj_YXQP.LoadAllAssets();
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				UnityEngine.AssetBundle  QPYX_obj_YXQP  = (UnityEngine.AssetBundle)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AssetBundle));
				System.Type QPYX_arg0_YXQP = ToLua.CheckMonoType(L_YXQP, 2);
				UnityEngine.Object[] QPYX_o_YXQP = QPYX_obj_YXQP.LoadAllAssets(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.AssetBundle.LoadAllAssets");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LoadAllAssetsAsync_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				UnityEngine.AssetBundle  QPYX_obj_YXQP  = (UnityEngine.AssetBundle)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AssetBundle));
				UnityEngine.AssetBundleRequest QPYX_o_YXQP = QPYX_obj_YXQP.LoadAllAssetsAsync();
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				UnityEngine.AssetBundle  QPYX_obj_YXQP  = (UnityEngine.AssetBundle)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AssetBundle));
				System.Type QPYX_arg0_YXQP = ToLua.CheckMonoType(L_YXQP, 2);
				UnityEngine.AssetBundleRequest QPYX_o_YXQP = QPYX_obj_YXQP.LoadAllAssetsAsync(QPYX_arg0_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.AssetBundle.LoadAllAssetsAsync");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Unload_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.AssetBundle  QPYX_obj_YXQP  = (UnityEngine.AssetBundle)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AssetBundle));
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.Unload(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetAllAssetNames_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.AssetBundle  QPYX_obj_YXQP  = (UnityEngine.AssetBundle)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AssetBundle));
			string[] QPYX_o_YXQP = QPYX_obj_YXQP.GetAllAssetNames();
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetAllScenePaths_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.AssetBundle  QPYX_obj_YXQP  = (UnityEngine.AssetBundle)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AssetBundle));
			string[] QPYX_o_YXQP = QPYX_obj_YXQP.GetAllScenePaths();
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_op_Equality_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Object QPYX_arg0_YXQP = (UnityEngine.Object)ToLua.ToObject(L_YXQP, 1);
			UnityEngine.Object QPYX_arg1_YXQP = (UnityEngine.Object)ToLua.ToObject(L_YXQP, 2);
			bool QPYX_o_YXQP = QPYX_arg0_YXQP == QPYX_arg1_YXQP;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_mainAsset_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AssetBundle QPYX_obj_YXQP = (UnityEngine.AssetBundle)QPYX_o_YXQP;
			UnityEngine.Object QPYX_ret_YXQP = QPYX_obj_YXQP.mainAsset;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index mainAsset on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isStreamedSceneAssetBundle_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AssetBundle QPYX_obj_YXQP = (UnityEngine.AssetBundle)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.isStreamedSceneAssetBundle;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isStreamedSceneAssetBundle on a nil value");
		}
	}
}

