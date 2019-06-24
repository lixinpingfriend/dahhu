using System;
using LuaInterface;

public class QPYX_UnityEngine_Networking_UnityWebRequestAsyncOperationWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.Networking.UnityWebRequestAsyncOperation), typeof(UnityEngine.AsyncOperation));
		L_YXQP.RegFunction("New", QPYX__CreateUnityEngine_Networking_UnityWebRequestAsyncOperation_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("webRequest", QPYX_get_webRequest_YXQP, null);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUnityEngine_Networking_UnityWebRequestAsyncOperation_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				UnityEngine.Networking.UnityWebRequestAsyncOperation QPYX_obj_YXQP = new UnityEngine.Networking.UnityWebRequestAsyncOperation();
				ToLua.PushObject(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UnityEngine.Networking.UnityWebRequestAsyncOperation.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_webRequest_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Networking.UnityWebRequestAsyncOperation QPYX_obj_YXQP = (UnityEngine.Networking.UnityWebRequestAsyncOperation)QPYX_o_YXQP;
			UnityEngine.Networking.UnityWebRequest QPYX_ret_YXQP = QPYX_obj_YXQP.webRequest;
			ToLua.PushObject(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index webRequest on a nil value");
		}
	}
}

