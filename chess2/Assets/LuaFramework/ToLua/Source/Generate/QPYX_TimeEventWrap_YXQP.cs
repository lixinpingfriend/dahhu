using System;
using LuaInterface;

public class QPYX_TimeEventWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(TimeEvent), typeof(System.Object));
		L_YXQP.RegFunction("SetIntervalTime", QPYX_SetIntervalTime_YXQP);
		L_YXQP.RegFunction("ResetInterval", QPYX_ResetInterval_YXQP);
		L_YXQP.RegFunction("SetPause", QPYX_SetPause_YXQP);
		L_YXQP.RegFunction("OnUpdate", QPYX_OnUpdate_YXQP);
		L_YXQP.RegFunction("OnComplete", QPYX_OnComplete_YXQP);
		L_YXQP.RegFunction("OnKill", QPYX_OnKill_YXQP);
		L_YXQP.RegFunction("Single", QPYX_Single_YXQP);
		L_YXQP.RegFunction("Delay", QPYX_Delay_YXQP);
		L_YXQP.RegFunction("Start", QPYX_Start_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateTimeEvent_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("elapsedTime", QPYX_get_elapsedTime_YXQP, QPYX_set_elapsedTime_YXQP);
		L_YXQP.RegVar("surplusTime", QPYX_get_surplusTime_YXQP, QPYX_set_surplusTime_YXQP);
		L_YXQP.RegVar("elapsedcurrentTime", QPYX_get_elapsedcurrentTime_YXQP, QPYX_set_elapsedcurrentTime_YXQP);
		L_YXQP.RegVar("msgObj", QPYX_get_msgObj_YXQP, QPYX_set_msgObj_YXQP);
		L_YXQP.RegVar("id", QPYX_get_id_YXQP, QPYX_set_id_YXQP);
		L_YXQP.RegVar("surplusTimeRound", QPYX_get_surplusTimeRound_YXQP, null);
		L_YXQP.RegVar("elapsedTimeRound", QPYX_get_elapsedTimeRound_YXQP, null);
		L_YXQP.RegVar("elapsedcurrentTimeRound", QPYX_get_elapsedcurrentTimeRound_YXQP, null);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateTimeEvent_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				TimeEvent QPYX_obj_YXQP = new TimeEvent();
				ToLua.PushObject(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: TimeEvent.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetIntervalTime_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				TimeEvent  QPYX_obj_YXQP  = (TimeEvent)ToLua.CheckObject<TimeEvent>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				TimeEvent QPYX_o_YXQP = QPYX_obj_YXQP.SetIntervalTime(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				TimeEvent  QPYX_obj_YXQP  = (TimeEvent)ToLua.CheckObject<TimeEvent>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				System.Action<TimeEvent> QPYX_arg1_YXQP = (System.Action<TimeEvent>)ToLua.CheckDelegate<System.Action<TimeEvent>>(L_YXQP, 3);
				TimeEvent QPYX_o_YXQP = QPYX_obj_YXQP.SetIntervalTime(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: TimeEvent.SetIntervalTime");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ResetInterval_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			TimeEvent  QPYX_obj_YXQP  = (TimeEvent)ToLua.CheckObject<TimeEvent>(L_YXQP, 1);
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			TimeEvent QPYX_o_YXQP = QPYX_obj_YXQP.ResetInterval(QPYX_arg0_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetPause_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			TimeEvent  QPYX_obj_YXQP  = (TimeEvent)ToLua.CheckObject<TimeEvent>(L_YXQP, 1);
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			TimeEvent QPYX_o_YXQP = QPYX_obj_YXQP.SetPause(QPYX_arg0_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OnUpdate_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			TimeEvent  QPYX_obj_YXQP  = (TimeEvent)ToLua.CheckObject<TimeEvent>(L_YXQP, 1);
			System.Action<TimeEvent> QPYX_arg0_YXQP = (System.Action<TimeEvent>)ToLua.CheckDelegate<System.Action<TimeEvent>>(L_YXQP, 2);
			TimeEvent QPYX_o_YXQP = QPYX_obj_YXQP.OnUpdate(QPYX_arg0_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OnComplete_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			TimeEvent  QPYX_obj_YXQP  = (TimeEvent)ToLua.CheckObject<TimeEvent>(L_YXQP, 1);
			System.Action<TimeEvent> QPYX_arg0_YXQP = (System.Action<TimeEvent>)ToLua.CheckDelegate<System.Action<TimeEvent>>(L_YXQP, 2);
			TimeEvent QPYX_o_YXQP = QPYX_obj_YXQP.OnComplete(QPYX_arg0_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OnKill_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			TimeEvent  QPYX_obj_YXQP  = (TimeEvent)ToLua.CheckObject<TimeEvent>(L_YXQP, 1);
			System.Action<TimeEvent> QPYX_arg0_YXQP = (System.Action<TimeEvent>)ToLua.CheckDelegate<System.Action<TimeEvent>>(L_YXQP, 2);
			TimeEvent QPYX_o_YXQP = QPYX_obj_YXQP.OnKill(QPYX_arg0_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Single_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			TimeEvent  QPYX_obj_YXQP  = (TimeEvent)ToLua.CheckObject<TimeEvent>(L_YXQP, 1);
			TimeEvent QPYX_o_YXQP = QPYX_obj_YXQP.Single();
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Delay_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			TimeEvent  QPYX_obj_YXQP  = (TimeEvent)ToLua.CheckObject<TimeEvent>(L_YXQP, 1);
			TimeEvent QPYX_o_YXQP = QPYX_obj_YXQP.Delay();
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Start_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			TimeEvent  QPYX_obj_YXQP  = (TimeEvent)ToLua.CheckObject<TimeEvent>(L_YXQP, 1);
			TimeEvent QPYX_o_YXQP = QPYX_obj_YXQP.Start();
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_elapsedTime_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			TimeEvent QPYX_obj_YXQP = (TimeEvent)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.elapsedTime;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index elapsedTime on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_surplusTime_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			TimeEvent QPYX_obj_YXQP = (TimeEvent)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.surplusTime;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index surplusTime on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_elapsedcurrentTime_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			TimeEvent QPYX_obj_YXQP = (TimeEvent)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.elapsedcurrentTime;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index elapsedcurrentTime on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_msgObj_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			TimeEvent QPYX_obj_YXQP = (TimeEvent)QPYX_o_YXQP;
			UnityEngine.Object QPYX_ret_YXQP = QPYX_obj_YXQP.msgObj;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index msgObj on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_id_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			TimeEvent QPYX_obj_YXQP = (TimeEvent)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.id;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index id on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_surplusTimeRound_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			TimeEvent QPYX_obj_YXQP = (TimeEvent)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.surplusTimeRound;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index surplusTimeRound on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_elapsedTimeRound_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			TimeEvent QPYX_obj_YXQP = (TimeEvent)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.elapsedTimeRound;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index elapsedTimeRound on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_elapsedcurrentTimeRound_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			TimeEvent QPYX_obj_YXQP = (TimeEvent)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.elapsedcurrentTimeRound;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index elapsedcurrentTimeRound on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_elapsedTime_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			TimeEvent QPYX_obj_YXQP = (TimeEvent)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.elapsedTime = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index elapsedTime on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_surplusTime_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			TimeEvent QPYX_obj_YXQP = (TimeEvent)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.surplusTime = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index surplusTime on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_elapsedcurrentTime_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			TimeEvent QPYX_obj_YXQP = (TimeEvent)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.elapsedcurrentTime = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index elapsedcurrentTime on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_msgObj_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			TimeEvent QPYX_obj_YXQP = (TimeEvent)QPYX_o_YXQP;
			UnityEngine.Object QPYX_arg0_YXQP = (UnityEngine.Object)ToLua.CheckObject<UnityEngine.Object>(L_YXQP, 2);
			QPYX_obj_YXQP.msgObj = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index msgObj on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_id_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			TimeEvent QPYX_obj_YXQP = (TimeEvent)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.id = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index id on a nil value");
		}
	}
}

