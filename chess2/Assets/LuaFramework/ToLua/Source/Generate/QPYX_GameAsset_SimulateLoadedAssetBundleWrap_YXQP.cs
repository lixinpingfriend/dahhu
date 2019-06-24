using System;
using LuaInterface;

public class QPYX_GameAsset_SimulateLoadedAssetBundleWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(GameAsset.SimulateLoadedAssetBundle), typeof(GameAsset.LoadedAssetBundle));
		L_YXQP.RegFunction("LoadAllAssets", QPYX_LoadAllAssets_YXQP);
		L_YXQP.RegFunction("GetAsset", QPYX_GetAsset_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateGameAsset_SimulateLoadedAssetBundle_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateGameAsset_SimulateLoadedAssetBundle_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Object QPYX_arg0_YXQP = (UnityEngine.Object)ToLua.CheckObject<UnityEngine.Object>(L_YXQP, 1);
				string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
				GameAsset.SimulateLoadedAssetBundle QPYX_obj_YXQP = new GameAsset.SimulateLoadedAssetBundle(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: GameAsset.SimulateLoadedAssetBundle.New");
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
			ToLua.CheckArgsCount(L_YXQP, 1);
			GameAsset.SimulateLoadedAssetBundle  QPYX_obj_YXQP  = (GameAsset.SimulateLoadedAssetBundle)ToLua.CheckObject<GameAsset.SimulateLoadedAssetBundle>(L_YXQP, 1);
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
			GameAsset.SimulateLoadedAssetBundle  QPYX_obj_YXQP  = (GameAsset.SimulateLoadedAssetBundle)ToLua.CheckObject<GameAsset.SimulateLoadedAssetBundle>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
			UnityEngine.Object QPYX_o_YXQP = QPYX_obj_YXQP.GetAsset(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}
}

