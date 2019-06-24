using System;
using LuaInterface;

public class QPYX_UnityEngine_EventSystems_AbstractEventDataWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.EventSystems.AbstractEventData), typeof(System.Object));
		L_YXQP.RegFunction("Reset", QPYX_Reset_YXQP);
		L_YXQP.RegFunction("Use", QPYX_Use_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("used", QPYX_get_used_YXQP, null);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Reset_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.EventSystems.AbstractEventData  QPYX_obj_YXQP  = (UnityEngine.EventSystems.AbstractEventData)ToLua.CheckObject<UnityEngine.EventSystems.AbstractEventData>(L_YXQP, 1);
			QPYX_obj_YXQP.Reset();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Use_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.EventSystems.AbstractEventData  QPYX_obj_YXQP  = (UnityEngine.EventSystems.AbstractEventData)ToLua.CheckObject<UnityEngine.EventSystems.AbstractEventData>(L_YXQP, 1);
			QPYX_obj_YXQP.Use();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_used_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.EventSystems.AbstractEventData QPYX_obj_YXQP = (UnityEngine.EventSystems.AbstractEventData)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.used;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index used on a nil value");
		}
	}
}

