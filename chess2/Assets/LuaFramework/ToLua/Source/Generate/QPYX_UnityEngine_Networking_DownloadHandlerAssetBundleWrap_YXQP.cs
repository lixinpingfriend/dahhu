using System;
using LuaInterface;

public class QPYX_UnityEngine_Networking_DownloadHandlerAssetBundleWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.Networking.DownloadHandlerAssetBundle), typeof(UnityEngine.Networking.DownloadHandler));
		L_YXQP.RegFunction("GetContent", QPYX_GetContent_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateUnityEngine_Networking_DownloadHandlerAssetBundle_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("assetBundle", QPYX_get_assetBundle_YXQP, null);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUnityEngine_Networking_DownloadHandlerAssetBundle_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				uint QPYX_arg1_YXQP = (uint)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.Networking.DownloadHandlerAssetBundle QPYX_obj_YXQP = new UnityEngine.Networking.DownloadHandlerAssetBundle(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<UnityEngine.Hash128, uint>(L_YXQP, 2))
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				UnityEngine.Hash128 QPYX_arg1_YXQP = StackTraits<UnityEngine.Hash128>.To(L_YXQP, 2);
				uint QPYX_arg2_YXQP = (uint)LuaDLL.lua_tonumber(L_YXQP, 3);
				UnityEngine.Networking.DownloadHandlerAssetBundle QPYX_obj_YXQP = new UnityEngine.Networking.DownloadHandlerAssetBundle(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<uint, uint>(L_YXQP, 2))
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				uint QPYX_arg1_YXQP = (uint)LuaDLL.lua_tonumber(L_YXQP, 2);
				uint QPYX_arg2_YXQP = (uint)LuaDLL.lua_tonumber(L_YXQP, 3);
				UnityEngine.Networking.DownloadHandlerAssetBundle QPYX_obj_YXQP = new UnityEngine.Networking.DownloadHandlerAssetBundle(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
				UnityEngine.Hash128 QPYX_arg2_YXQP = StackTraits<UnityEngine.Hash128>.Check(L_YXQP, 3);
				uint QPYX_arg3_YXQP = (uint)LuaDLL.luaL_checknumber(L_YXQP, 4);
				UnityEngine.Networking.DownloadHandlerAssetBundle QPYX_obj_YXQP = new UnityEngine.Networking.DownloadHandlerAssetBundle(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UnityEngine.Networking.DownloadHandlerAssetBundle.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetContent_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Networking.UnityWebRequest QPYX_arg0_YXQP = (UnityEngine.Networking.UnityWebRequest)ToLua.CheckObject<UnityEngine.Networking.UnityWebRequest>(L_YXQP, 1);
			UnityEngine.AssetBundle QPYX_o_YXQP = UnityEngine.Networking.DownloadHandlerAssetBundle.GetContent(QPYX_arg0_YXQP);
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_assetBundle_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Networking.DownloadHandlerAssetBundle QPYX_obj_YXQP = (UnityEngine.Networking.DownloadHandlerAssetBundle)QPYX_o_YXQP;
			UnityEngine.AssetBundle QPYX_ret_YXQP = QPYX_obj_YXQP.assetBundle;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index assetBundle on a nil value");
		}
	}
}

