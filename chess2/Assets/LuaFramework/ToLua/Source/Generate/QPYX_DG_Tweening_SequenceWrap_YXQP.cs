using System;
using DG.Tweening;
using LuaInterface;

public class QPYX_DG_Tweening_SequenceWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(DG.Tweening.Sequence), typeof(DG.Tweening.Tween));
		L_YXQP.RegFunction("SetSpeedBased", QPYX_SetSpeedBased_YXQP);
		L_YXQP.RegFunction("SetRelative", QPYX_SetRelative_YXQP);
		L_YXQP.RegFunction("SetDelay", QPYX_SetDelay_YXQP);
		L_YXQP.RegFunction("InsertCallback", QPYX_InsertCallback_YXQP);
		L_YXQP.RegFunction("PrependCallback", QPYX_PrependCallback_YXQP);
		L_YXQP.RegFunction("AppendCallback", QPYX_AppendCallback_YXQP);
		L_YXQP.RegFunction("PrependInterval", QPYX_PrependInterval_YXQP);
		L_YXQP.RegFunction("AppendInterval", QPYX_AppendInterval_YXQP);
		L_YXQP.RegFunction("Insert", QPYX_Insert_YXQP);
		L_YXQP.RegFunction("Join", QPYX_Join_YXQP);
		L_YXQP.RegFunction("Prepend", QPYX_Prepend_YXQP);
		L_YXQP.RegFunction("Append", QPYX_Append_YXQP);
		L_YXQP.RegFunction("SetAs", QPYX_SetAs_YXQP);
		L_YXQP.RegFunction("OnWaypointChange", QPYX_OnWaypointChange_YXQP);
		L_YXQP.RegFunction("OnKill", QPYX_OnKill_YXQP);
		L_YXQP.RegFunction("OnComplete", QPYX_OnComplete_YXQP);
		L_YXQP.RegFunction("OnStepComplete", QPYX_OnStepComplete_YXQP);
		L_YXQP.RegFunction("OnUpdate", QPYX_OnUpdate_YXQP);
		L_YXQP.RegFunction("OnRewind", QPYX_OnRewind_YXQP);
		L_YXQP.RegFunction("OnPause", QPYX_OnPause_YXQP);
		L_YXQP.RegFunction("OnPlay", QPYX_OnPlay_YXQP);
		L_YXQP.RegFunction("OnStart", QPYX_OnStart_YXQP);
		L_YXQP.RegFunction("SetUpdate", QPYX_SetUpdate_YXQP);
		L_YXQP.RegFunction("SetRecyclable", QPYX_SetRecyclable_YXQP);
		L_YXQP.RegFunction("SetEase", QPYX_SetEase_YXQP);
		L_YXQP.RegFunction("SetLoops", QPYX_SetLoops_YXQP);
		L_YXQP.RegFunction("SetTarget", QPYX_SetTarget_YXQP);
		L_YXQP.RegFunction("SetId", QPYX_SetId_YXQP);
		L_YXQP.RegFunction("SetAutoKill", QPYX_SetAutoKill_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetSpeedBased_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				DG.Tweening.Sequence  QPYX_obj_YXQP  = (DG.Tweening.Sequence)ToLua.CheckObject(L_YXQP, 1, typeof(DG.Tweening.Sequence));
				DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetSpeedBased();
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				DG.Tweening.Sequence  QPYX_obj_YXQP  = (DG.Tweening.Sequence)ToLua.CheckObject(L_YXQP, 1, typeof(DG.Tweening.Sequence));
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetSpeedBased(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.Sequence.SetSpeedBased");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetRelative_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				DG.Tweening.Sequence  QPYX_obj_YXQP  = (DG.Tweening.Sequence)ToLua.CheckObject(L_YXQP, 1, typeof(DG.Tweening.Sequence));
				DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetRelative();
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				DG.Tweening.Sequence  QPYX_obj_YXQP  = (DG.Tweening.Sequence)ToLua.CheckObject(L_YXQP, 1, typeof(DG.Tweening.Sequence));
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetRelative(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.Sequence.SetRelative");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetDelay_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			DG.Tweening.Sequence  QPYX_obj_YXQP  = (DG.Tweening.Sequence)ToLua.CheckObject(L_YXQP, 1, typeof(DG.Tweening.Sequence));
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetDelay(QPYX_arg0_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_InsertCallback_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			DG.Tweening.Sequence  QPYX_obj_YXQP  = (DG.Tweening.Sequence)ToLua.CheckObject(L_YXQP, 1, typeof(DG.Tweening.Sequence));
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			DG.Tweening.TweenCallback QPYX_arg1_YXQP = (DG.Tweening.TweenCallback)ToLua.CheckDelegate<DG.Tweening.TweenCallback>(L_YXQP, 3);
			DG.Tweening.Sequence QPYX_o_YXQP = QPYX_obj_YXQP.InsertCallback(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_PrependCallback_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			DG.Tweening.Sequence  QPYX_obj_YXQP  = (DG.Tweening.Sequence)ToLua.CheckObject(L_YXQP, 1, typeof(DG.Tweening.Sequence));
			DG.Tweening.TweenCallback QPYX_arg0_YXQP = (DG.Tweening.TweenCallback)ToLua.CheckDelegate<DG.Tweening.TweenCallback>(L_YXQP, 2);
			DG.Tweening.Sequence QPYX_o_YXQP = QPYX_obj_YXQP.PrependCallback(QPYX_arg0_YXQP);
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_AppendCallback_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			DG.Tweening.Sequence  QPYX_obj_YXQP  = (DG.Tweening.Sequence)ToLua.CheckObject(L_YXQP, 1, typeof(DG.Tweening.Sequence));
			DG.Tweening.TweenCallback QPYX_arg0_YXQP = (DG.Tweening.TweenCallback)ToLua.CheckDelegate<DG.Tweening.TweenCallback>(L_YXQP, 2);
			DG.Tweening.Sequence QPYX_o_YXQP = QPYX_obj_YXQP.AppendCallback(QPYX_arg0_YXQP);
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_PrependInterval_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			DG.Tweening.Sequence  QPYX_obj_YXQP  = (DG.Tweening.Sequence)ToLua.CheckObject(L_YXQP, 1, typeof(DG.Tweening.Sequence));
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			DG.Tweening.Sequence QPYX_o_YXQP = QPYX_obj_YXQP.PrependInterval(QPYX_arg0_YXQP);
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_AppendInterval_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			DG.Tweening.Sequence  QPYX_obj_YXQP  = (DG.Tweening.Sequence)ToLua.CheckObject(L_YXQP, 1, typeof(DG.Tweening.Sequence));
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			DG.Tweening.Sequence QPYX_o_YXQP = QPYX_obj_YXQP.AppendInterval(QPYX_arg0_YXQP);
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Insert_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			DG.Tweening.Sequence  QPYX_obj_YXQP  = (DG.Tweening.Sequence)ToLua.CheckObject(L_YXQP, 1, typeof(DG.Tweening.Sequence));
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			DG.Tweening.Tween QPYX_arg1_YXQP = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 3);
			DG.Tweening.Sequence QPYX_o_YXQP = QPYX_obj_YXQP.Insert(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Join_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			DG.Tweening.Sequence  QPYX_obj_YXQP  = (DG.Tweening.Sequence)ToLua.CheckObject(L_YXQP, 1, typeof(DG.Tweening.Sequence));
			DG.Tweening.Tween QPYX_arg0_YXQP = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 2);
			DG.Tweening.Sequence QPYX_o_YXQP = QPYX_obj_YXQP.Join(QPYX_arg0_YXQP);
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Prepend_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			DG.Tweening.Sequence  QPYX_obj_YXQP  = (DG.Tweening.Sequence)ToLua.CheckObject(L_YXQP, 1, typeof(DG.Tweening.Sequence));
			DG.Tweening.Tween QPYX_arg0_YXQP = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 2);
			DG.Tweening.Sequence QPYX_o_YXQP = QPYX_obj_YXQP.Prepend(QPYX_arg0_YXQP);
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Append_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			DG.Tweening.Sequence  QPYX_obj_YXQP  = (DG.Tweening.Sequence)ToLua.CheckObject(L_YXQP, 1, typeof(DG.Tweening.Sequence));
			DG.Tweening.Tween QPYX_arg0_YXQP = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 2);
			DG.Tweening.Sequence QPYX_o_YXQP = QPYX_obj_YXQP.Append(QPYX_arg0_YXQP);
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetAs_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<DG.Tweening.Tween, DG.Tweening.Tween>(L_YXQP, 1))
			{
				DG.Tweening.Sequence QPYX_obj_YXQP = (DG.Tweening.Sequence)ToLua.ToObject(L_YXQP, 1);
				DG.Tweening.Tween QPYX_arg0_YXQP = (DG.Tweening.Tween)ToLua.ToObject(L_YXQP, 2);
				DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetAs(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<DG.Tweening.Tween, DG.Tweening.TweenParams>(L_YXQP, 1))
			{
				DG.Tweening.Sequence QPYX_obj_YXQP = (DG.Tweening.Sequence)ToLua.ToObject(L_YXQP, 1);
				DG.Tweening.TweenParams QPYX_arg0_YXQP = (DG.Tweening.TweenParams)ToLua.ToObject(L_YXQP, 2);
				DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetAs(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.Sequence.SetAs");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OnWaypointChange_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			DG.Tweening.Sequence  QPYX_obj_YXQP  = (DG.Tweening.Sequence)ToLua.CheckObject(L_YXQP, 1, typeof(DG.Tweening.Sequence));
			DG.Tweening.TweenCallback<int> QPYX_arg0_YXQP = (DG.Tweening.TweenCallback<int>)ToLua.CheckDelegate<DG.Tweening.TweenCallback<int>>(L_YXQP, 2);
			DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.OnWaypointChange(QPYX_arg0_YXQP);
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
			DG.Tweening.Sequence  QPYX_obj_YXQP  = (DG.Tweening.Sequence)ToLua.CheckObject(L_YXQP, 1, typeof(DG.Tweening.Sequence));
			DG.Tweening.TweenCallback QPYX_arg0_YXQP = (DG.Tweening.TweenCallback)ToLua.CheckDelegate<DG.Tweening.TweenCallback>(L_YXQP, 2);
			DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.OnKill(QPYX_arg0_YXQP);
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
			DG.Tweening.Sequence  QPYX_obj_YXQP  = (DG.Tweening.Sequence)ToLua.CheckObject(L_YXQP, 1, typeof(DG.Tweening.Sequence));
			DG.Tweening.TweenCallback QPYX_arg0_YXQP = (DG.Tweening.TweenCallback)ToLua.CheckDelegate<DG.Tweening.TweenCallback>(L_YXQP, 2);
			DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.OnComplete(QPYX_arg0_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OnStepComplete_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			DG.Tweening.Sequence  QPYX_obj_YXQP  = (DG.Tweening.Sequence)ToLua.CheckObject(L_YXQP, 1, typeof(DG.Tweening.Sequence));
			DG.Tweening.TweenCallback QPYX_arg0_YXQP = (DG.Tweening.TweenCallback)ToLua.CheckDelegate<DG.Tweening.TweenCallback>(L_YXQP, 2);
			DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.OnStepComplete(QPYX_arg0_YXQP);
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
			DG.Tweening.Sequence  QPYX_obj_YXQP  = (DG.Tweening.Sequence)ToLua.CheckObject(L_YXQP, 1, typeof(DG.Tweening.Sequence));
			DG.Tweening.TweenCallback QPYX_arg0_YXQP = (DG.Tweening.TweenCallback)ToLua.CheckDelegate<DG.Tweening.TweenCallback>(L_YXQP, 2);
			DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.OnUpdate(QPYX_arg0_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OnRewind_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			DG.Tweening.Sequence  QPYX_obj_YXQP  = (DG.Tweening.Sequence)ToLua.CheckObject(L_YXQP, 1, typeof(DG.Tweening.Sequence));
			DG.Tweening.TweenCallback QPYX_arg0_YXQP = (DG.Tweening.TweenCallback)ToLua.CheckDelegate<DG.Tweening.TweenCallback>(L_YXQP, 2);
			DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.OnRewind(QPYX_arg0_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OnPause_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			DG.Tweening.Sequence  QPYX_obj_YXQP  = (DG.Tweening.Sequence)ToLua.CheckObject(L_YXQP, 1, typeof(DG.Tweening.Sequence));
			DG.Tweening.TweenCallback QPYX_arg0_YXQP = (DG.Tweening.TweenCallback)ToLua.CheckDelegate<DG.Tweening.TweenCallback>(L_YXQP, 2);
			DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.OnPause(QPYX_arg0_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OnPlay_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			DG.Tweening.Sequence  QPYX_obj_YXQP  = (DG.Tweening.Sequence)ToLua.CheckObject(L_YXQP, 1, typeof(DG.Tweening.Sequence));
			DG.Tweening.TweenCallback QPYX_arg0_YXQP = (DG.Tweening.TweenCallback)ToLua.CheckDelegate<DG.Tweening.TweenCallback>(L_YXQP, 2);
			DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.OnPlay(QPYX_arg0_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OnStart_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			DG.Tweening.Sequence  QPYX_obj_YXQP  = (DG.Tweening.Sequence)ToLua.CheckObject(L_YXQP, 1, typeof(DG.Tweening.Sequence));
			DG.Tweening.TweenCallback QPYX_arg0_YXQP = (DG.Tweening.TweenCallback)ToLua.CheckDelegate<DG.Tweening.TweenCallback>(L_YXQP, 2);
			DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.OnStart(QPYX_arg0_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetUpdate_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<DG.Tweening.Tween, bool>(L_YXQP, 1))
			{
				DG.Tweening.Sequence QPYX_obj_YXQP = (DG.Tweening.Sequence)ToLua.ToObject(L_YXQP, 1);
				bool QPYX_arg0_YXQP = LuaDLL.lua_toboolean(L_YXQP, 2);
				DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetUpdate(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<DG.Tweening.Tween, DG.Tweening.UpdateType>(L_YXQP, 1))
			{
				DG.Tweening.Sequence QPYX_obj_YXQP = (DG.Tweening.Sequence)ToLua.ToObject(L_YXQP, 1);
				DG.Tweening.UpdateType QPYX_arg0_YXQP = (DG.Tweening.UpdateType)ToLua.ToObject(L_YXQP, 2);
				DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetUpdate(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				DG.Tweening.Sequence  QPYX_obj_YXQP  = (DG.Tweening.Sequence)ToLua.CheckObject(L_YXQP, 1, typeof(DG.Tweening.Sequence));
				DG.Tweening.UpdateType QPYX_arg0_YXQP = (DG.Tweening.UpdateType)ToLua.CheckObject(L_YXQP, 2, typeof(DG.Tweening.UpdateType));
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetUpdate(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.Sequence.SetUpdate");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetRecyclable_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				DG.Tweening.Sequence  QPYX_obj_YXQP  = (DG.Tweening.Sequence)ToLua.CheckObject(L_YXQP, 1, typeof(DG.Tweening.Sequence));
				DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetRecyclable();
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				DG.Tweening.Sequence  QPYX_obj_YXQP  = (DG.Tweening.Sequence)ToLua.CheckObject(L_YXQP, 1, typeof(DG.Tweening.Sequence));
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetRecyclable(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.Sequence.SetRecyclable");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetEase_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<DG.Tweening.Tween, DG.Tweening.Ease>(L_YXQP, 1))
			{
				DG.Tweening.Sequence QPYX_obj_YXQP = (DG.Tweening.Sequence)ToLua.ToObject(L_YXQP, 1);
				DG.Tweening.Ease QPYX_arg0_YXQP = (DG.Tweening.Ease)ToLua.ToObject(L_YXQP, 2);
				DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetEase(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<DG.Tweening.Tween, UnityEngine.AnimationCurve>(L_YXQP, 1))
			{
				DG.Tweening.Sequence QPYX_obj_YXQP = (DG.Tweening.Sequence)ToLua.ToObject(L_YXQP, 1);
				UnityEngine.AnimationCurve QPYX_arg0_YXQP = (UnityEngine.AnimationCurve)ToLua.ToObject(L_YXQP, 2);
				DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetEase(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<DG.Tweening.Tween, DG.Tweening.EaseFunction>(L_YXQP, 1))
			{
				DG.Tweening.Sequence QPYX_obj_YXQP = (DG.Tweening.Sequence)ToLua.ToObject(L_YXQP, 1);
				DG.Tweening.EaseFunction QPYX_arg0_YXQP = (DG.Tweening.EaseFunction)ToLua.ToObject(L_YXQP, 2);
				DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetEase(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				DG.Tweening.Sequence  QPYX_obj_YXQP  = (DG.Tweening.Sequence)ToLua.CheckObject(L_YXQP, 1, typeof(DG.Tweening.Sequence));
				DG.Tweening.Ease QPYX_arg0_YXQP = (DG.Tweening.Ease)ToLua.CheckObject(L_YXQP, 2, typeof(DG.Tweening.Ease));
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetEase(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				DG.Tweening.Sequence  QPYX_obj_YXQP  = (DG.Tweening.Sequence)ToLua.CheckObject(L_YXQP, 1, typeof(DG.Tweening.Sequence));
				DG.Tweening.Ease QPYX_arg0_YXQP = (DG.Tweening.Ease)ToLua.CheckObject(L_YXQP, 2, typeof(DG.Tweening.Ease));
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
				DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetEase(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.Sequence.SetEase");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetLoops_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				DG.Tweening.Sequence  QPYX_obj_YXQP  = (DG.Tweening.Sequence)ToLua.CheckObject(L_YXQP, 1, typeof(DG.Tweening.Sequence));
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetLoops(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				DG.Tweening.Sequence  QPYX_obj_YXQP  = (DG.Tweening.Sequence)ToLua.CheckObject(L_YXQP, 1, typeof(DG.Tweening.Sequence));
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				DG.Tweening.LoopType QPYX_arg1_YXQP = (DG.Tweening.LoopType)ToLua.CheckObject(L_YXQP, 3, typeof(DG.Tweening.LoopType));
				DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetLoops(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.Sequence.SetLoops");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetTarget_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			DG.Tweening.Sequence  QPYX_obj_YXQP  = (DG.Tweening.Sequence)ToLua.CheckObject(L_YXQP, 1, typeof(DG.Tweening.Sequence));
			object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 2);
			DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetTarget(QPYX_arg0_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetId_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			DG.Tweening.Sequence  QPYX_obj_YXQP  = (DG.Tweening.Sequence)ToLua.CheckObject(L_YXQP, 1, typeof(DG.Tweening.Sequence));
			object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 2);
			DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetId(QPYX_arg0_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetAutoKill_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				DG.Tweening.Sequence  QPYX_obj_YXQP  = (DG.Tweening.Sequence)ToLua.CheckObject(L_YXQP, 1, typeof(DG.Tweening.Sequence));
				DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetAutoKill();
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				DG.Tweening.Sequence  QPYX_obj_YXQP  = (DG.Tweening.Sequence)ToLua.CheckObject(L_YXQP, 1, typeof(DG.Tweening.Sequence));
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetAutoKill(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.Sequence.SetAutoKill");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}
}

