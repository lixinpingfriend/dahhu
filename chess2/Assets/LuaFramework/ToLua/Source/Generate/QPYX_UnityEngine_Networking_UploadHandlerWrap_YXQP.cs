using System;
using LuaInterface;

public class QPYX_UnityEngine_Networking_UploadHandlerWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.Networking.UploadHandler), typeof(System.Object));
		L_YXQP.RegFunction("Dispose", QPYX_Dispose_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("data", QPYX_get_data_YXQP, null);
		L_YXQP.RegVar("contentType", QPYX_get_contentType_YXQP, QPYX_set_contentType_YXQP);
		L_YXQP.RegVar("progress", QPYX_get_progress_YXQP, null);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Dispose_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Networking.UploadHandler  QPYX_obj_YXQP  = (UnityEngine.Networking.UploadHandler)ToLua.CheckObject<UnityEngine.Networking.UploadHandler>(L_YXQP, 1);
			QPYX_obj_YXQP.Dispose();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_data_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Networking.UploadHandler QPYX_obj_YXQP = (UnityEngine.Networking.UploadHandler)QPYX_o_YXQP;
			byte[] QPYX_ret_YXQP = QPYX_obj_YXQP.data;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index data on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_contentType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Networking.UploadHandler QPYX_obj_YXQP = (UnityEngine.Networking.UploadHandler)QPYX_o_YXQP;
			string QPYX_ret_YXQP = QPYX_obj_YXQP.contentType;
			LuaDLL.lua_pushstring(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index contentType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_progress_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Networking.UploadHandler QPYX_obj_YXQP = (UnityEngine.Networking.UploadHandler)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.progress;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index progress on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_contentType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Networking.UploadHandler QPYX_obj_YXQP = (UnityEngine.Networking.UploadHandler)QPYX_o_YXQP;
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.contentType = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index contentType on a nil value");
		}
	}
}

