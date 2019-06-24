using System;
using LuaInterface;

public class QPYX_UnityEngine_AnimationClipWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.AnimationClip), typeof(UnityEngine.Object));
		L_YXQP.RegFunction("SampleAnimation", QPYX_SampleAnimation_YXQP);
		L_YXQP.RegFunction("SetCurve", QPYX_SetCurve_YXQP);
		L_YXQP.RegFunction("EnsureQuaternionContinuity", QPYX_EnsureQuaternionContinuity_YXQP);
		L_YXQP.RegFunction("ClearCurves", QPYX_ClearCurves_YXQP);
		L_YXQP.RegFunction("AddEvent", QPYX_AddEvent_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateUnityEngine_AnimationClip_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("length", QPYX_get_length_YXQP, null);
		L_YXQP.RegVar("frameRate", QPYX_get_frameRate_YXQP, QPYX_set_frameRate_YXQP);
		L_YXQP.RegVar("wrapMode", QPYX_get_wrapMode_YXQP, QPYX_set_wrapMode_YXQP);
		L_YXQP.RegVar("localBounds", QPYX_get_localBounds_YXQP, QPYX_set_localBounds_YXQP);
		L_YXQP.RegVar("legacy", QPYX_get_legacy_YXQP, QPYX_set_legacy_YXQP);
		L_YXQP.RegVar("humanMotion", QPYX_get_humanMotion_YXQP, null);
		L_YXQP.RegVar("empty", QPYX_get_empty_YXQP, null);
		L_YXQP.RegVar("events", QPYX_get_events_YXQP, QPYX_set_events_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUnityEngine_AnimationClip_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				UnityEngine.AnimationClip QPYX_obj_YXQP = new UnityEngine.AnimationClip();
				ToLua.PushSealed(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UnityEngine.AnimationClip.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SampleAnimation_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.AnimationClip  QPYX_obj_YXQP  = (UnityEngine.AnimationClip)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AnimationClip));
			UnityEngine.GameObject QPYX_arg0_YXQP = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.GameObject));
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			QPYX_obj_YXQP.SampleAnimation(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetCurve_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 5);
			UnityEngine.AnimationClip  QPYX_obj_YXQP  = (UnityEngine.AnimationClip)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AnimationClip));
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			System.Type QPYX_arg1_YXQP = ToLua.CheckMonoType(L_YXQP, 3);
			string QPYX_arg2_YXQP = ToLua.CheckString(L_YXQP, 4);
			UnityEngine.AnimationCurve QPYX_arg3_YXQP = (UnityEngine.AnimationCurve)ToLua.CheckObject(L_YXQP, 5, typeof(UnityEngine.AnimationCurve));
			QPYX_obj_YXQP.SetCurve(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_EnsureQuaternionContinuity_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.AnimationClip  QPYX_obj_YXQP  = (UnityEngine.AnimationClip)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AnimationClip));
			QPYX_obj_YXQP.EnsureQuaternionContinuity();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ClearCurves_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.AnimationClip  QPYX_obj_YXQP  = (UnityEngine.AnimationClip)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AnimationClip));
			QPYX_obj_YXQP.ClearCurves();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_AddEvent_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.AnimationClip  QPYX_obj_YXQP  = (UnityEngine.AnimationClip)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AnimationClip));
			UnityEngine.AnimationEvent QPYX_arg0_YXQP = (UnityEngine.AnimationEvent)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.AnimationEvent));
			QPYX_obj_YXQP.AddEvent(QPYX_arg0_YXQP);
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
	static int QPYX_get_length_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AnimationClip QPYX_obj_YXQP = (UnityEngine.AnimationClip)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.length;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index length on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_frameRate_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AnimationClip QPYX_obj_YXQP = (UnityEngine.AnimationClip)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.frameRate;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index frameRate on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_wrapMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AnimationClip QPYX_obj_YXQP = (UnityEngine.AnimationClip)QPYX_o_YXQP;
			UnityEngine.WrapMode QPYX_ret_YXQP = QPYX_obj_YXQP.wrapMode;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index wrapMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_localBounds_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AnimationClip QPYX_obj_YXQP = (UnityEngine.AnimationClip)QPYX_o_YXQP;
			UnityEngine.Bounds QPYX_ret_YXQP = QPYX_obj_YXQP.localBounds;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index localBounds on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_legacy_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AnimationClip QPYX_obj_YXQP = (UnityEngine.AnimationClip)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.legacy;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index legacy on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_humanMotion_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AnimationClip QPYX_obj_YXQP = (UnityEngine.AnimationClip)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.humanMotion;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index humanMotion on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_empty_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AnimationClip QPYX_obj_YXQP = (UnityEngine.AnimationClip)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.empty;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index empty on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_events_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AnimationClip QPYX_obj_YXQP = (UnityEngine.AnimationClip)QPYX_o_YXQP;
			UnityEngine.AnimationEvent[] QPYX_ret_YXQP = QPYX_obj_YXQP.events;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index events on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_frameRate_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AnimationClip QPYX_obj_YXQP = (UnityEngine.AnimationClip)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.frameRate = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index frameRate on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_wrapMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AnimationClip QPYX_obj_YXQP = (UnityEngine.AnimationClip)QPYX_o_YXQP;
			UnityEngine.WrapMode QPYX_arg0_YXQP = (UnityEngine.WrapMode)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.WrapMode));
			QPYX_obj_YXQP.wrapMode = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index wrapMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_localBounds_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AnimationClip QPYX_obj_YXQP = (UnityEngine.AnimationClip)QPYX_o_YXQP;
			UnityEngine.Bounds QPYX_arg0_YXQP = ToLua.ToBounds(L_YXQP, 2);
			QPYX_obj_YXQP.localBounds = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index localBounds on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_legacy_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AnimationClip QPYX_obj_YXQP = (UnityEngine.AnimationClip)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.legacy = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index legacy on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_events_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AnimationClip QPYX_obj_YXQP = (UnityEngine.AnimationClip)QPYX_o_YXQP;
			UnityEngine.AnimationEvent[] QPYX_arg0_YXQP = ToLua.CheckObjectArray<UnityEngine.AnimationEvent>(L_YXQP, 2);
			QPYX_obj_YXQP.events = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index events on a nil value");
		}
	}
}

