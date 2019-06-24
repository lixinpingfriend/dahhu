using System;
using LuaInterface;

public class QPYX_SmartTimerWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(SmartTimer), typeof(UnityEngine.MonoBehaviour));
		L_YXQP.RegFunction("Subscribe", QPYX_Subscribe_YXQP);
		L_YXQP.RegFunction("SingleSet", QPYX_SingleSet_YXQP);
		L_YXQP.RegFunction("Kill", QPYX_Kill_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("instance", QPYX_get_instance_YXQP, null);
		L_YXQP.RegVar("serverTimeDiff", QPYX_get_serverTimeDiff_YXQP, QPYX_set_serverTimeDiff_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Subscribe_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			SmartTimer  QPYX_obj_YXQP  = (SmartTimer)ToLua.CheckObject<SmartTimer>(L_YXQP, 1);
			double QPYX_arg0_YXQP = (double)LuaDLL.luaL_checknumber(L_YXQP, 2);
			bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
			int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
			TimeEvent QPYX_o_YXQP = QPYX_obj_YXQP.Subscribe(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SingleSet_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			SmartTimer  QPYX_obj_YXQP  = (SmartTimer)ToLua.CheckObject<SmartTimer>(L_YXQP, 1);
			TimeEvent QPYX_arg0_YXQP = (TimeEvent)ToLua.CheckObject<TimeEvent>(L_YXQP, 2);
			TimeEvent QPYX_o_YXQP = QPYX_obj_YXQP.SingleSet(QPYX_arg0_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Kill_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			SmartTimer  QPYX_obj_YXQP  = (SmartTimer)ToLua.CheckObject<SmartTimer>(L_YXQP, 1);
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.Kill(QPYX_arg0_YXQP);
			return 0;
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
	static int QPYX_get_instance_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, SmartTimer.instance);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_serverTimeDiff_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			SmartTimer QPYX_obj_YXQP = (SmartTimer)QPYX_o_YXQP;
			long QPYX_ret_YXQP = QPYX_obj_YXQP.serverTimeDiff;
			LuaDLL.tolua_pushint64(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index serverTimeDiff on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_serverTimeDiff_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			SmartTimer QPYX_obj_YXQP = (SmartTimer)QPYX_o_YXQP;
			long QPYX_arg0_YXQP = LuaDLL.tolua_checkint64(L_YXQP, 2);
			QPYX_obj_YXQP.serverTimeDiff = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index serverTimeDiff on a nil value");
		}
	}
}

