using System;
using LuaInterface;

public class QPYX_GameSDKCallbackWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(GameSDKCallback), typeof(UnityEngine.MonoBehaviour));
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("gameSdkCallback", QPYX_get_gameSdkCallback_YXQP, QPYX_set_gameSdkCallback_YXQP);
		L_YXQP.RegVar("onSdkInitHandler", QPYX_get_onSdkInitHandler_YXQP, QPYX_set_onSdkInitHandler_YXQP);
		L_YXQP.RegVar("mwEnterRoomID", QPYX_get_mwEnterRoomID_YXQP, QPYX_set_mwEnterRoomID_YXQP);
		L_YXQP.RegVar("urlOpenData", QPYX_get_urlOpenData_YXQP, QPYX_set_urlOpenData_YXQP);
		L_YXQP.RegVar("instance", QPYX_get_instance_YXQP, null);
		L_YXQP.EndClass();
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
	static int QPYX_get_gameSdkCallback_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameSDKCallback QPYX_obj_YXQP = (GameSDKCallback)QPYX_o_YXQP;
			LuaInterface.LuaFunction QPYX_ret_YXQP = QPYX_obj_YXQP.gameSdkCallback;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index gameSdkCallback on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onSdkInitHandler_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameSDKCallback QPYX_obj_YXQP = (GameSDKCallback)QPYX_o_YXQP;
			UnityEngine.Events.UnityAction<bool> QPYX_ret_YXQP = QPYX_obj_YXQP.onSdkInitHandler;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onSdkInitHandler on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_mwEnterRoomID_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameSDKCallback QPYX_obj_YXQP = (GameSDKCallback)QPYX_o_YXQP;
			string QPYX_ret_YXQP = QPYX_obj_YXQP.mwEnterRoomID;
			LuaDLL.lua_pushstring(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index mwEnterRoomID on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_urlOpenData_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameSDKCallback QPYX_obj_YXQP = (GameSDKCallback)QPYX_o_YXQP;
			string QPYX_ret_YXQP = QPYX_obj_YXQP.urlOpenData;
			LuaDLL.lua_pushstring(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index urlOpenData on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_instance_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, GameSDKCallback.instance);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_gameSdkCallback_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameSDKCallback QPYX_obj_YXQP = (GameSDKCallback)QPYX_o_YXQP;
			LuaFunction QPYX_arg0_YXQP = ToLua.CheckLuaFunction(L_YXQP, 2);
			QPYX_obj_YXQP.gameSdkCallback = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index gameSdkCallback on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onSdkInitHandler_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameSDKCallback QPYX_obj_YXQP = (GameSDKCallback)QPYX_o_YXQP;
			UnityEngine.Events.UnityAction<bool> QPYX_arg0_YXQP = (UnityEngine.Events.UnityAction<bool>)ToLua.CheckDelegate<UnityEngine.Events.UnityAction<bool>>(L_YXQP, 2);
			QPYX_obj_YXQP.onSdkInitHandler = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onSdkInitHandler on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_mwEnterRoomID_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameSDKCallback QPYX_obj_YXQP = (GameSDKCallback)QPYX_o_YXQP;
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.mwEnterRoomID = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index mwEnterRoomID on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_urlOpenData_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameSDKCallback QPYX_obj_YXQP = (GameSDKCallback)QPYX_o_YXQP;
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.urlOpenData = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index urlOpenData on a nil value");
		}
	}
}

