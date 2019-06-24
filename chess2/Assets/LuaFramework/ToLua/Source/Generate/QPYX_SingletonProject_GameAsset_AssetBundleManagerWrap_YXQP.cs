using System;
using LuaInterface;

public class QPYX_SingletonProject_GameAsset_AssetBundleManagerWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(SingletonProject<GameAsset.AssetBundleManager>), typeof(System.Object), "SingletonProject_GameAsset_AssetBundleManager");
		L_YXQP.RegFunction("New", QPYX_New_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateSingletonProject_GameAsset_AssetBundleManager_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("instance", QPYX_get_instance_YXQP, null);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateSingletonProject_GameAsset_AssetBundleManager_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				SingletonProject<GameAsset.AssetBundleManager> QPYX_obj_YXQP = new SingletonProject<GameAsset.AssetBundleManager>();
				ToLua.PushObject(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: SingletonProject<GameAsset.AssetBundleManager>.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_New_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 0);
			SingletonProject<GameAsset.AssetBundleManager>.New();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_instance_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.PushObject(L_YXQP, SingletonProject<GameAsset.AssetBundleManager>.instance);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}
}

