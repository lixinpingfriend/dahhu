using System;
using DG.Tweening;
using LuaInterface;

public class QPYX_DG_Tweening_TweenerWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(DG.Tweening.Tweener), typeof(DG.Tweening.Tween));
		L_YXQP.RegFunction("ChangeStartValue", QPYX_ChangeStartValue_YXQP);
		L_YXQP.RegFunction("ChangeEndValue", QPYX_ChangeEndValue_YXQP);
		L_YXQP.RegFunction("ChangeValues", QPYX_ChangeValues_YXQP);
		L_YXQP.RegFunction("SetSpeedBased", QPYX_SetSpeedBased_YXQP);
		L_YXQP.RegFunction("SetRelative", QPYX_SetRelative_YXQP);
		L_YXQP.RegFunction("SetDelay", QPYX_SetDelay_YXQP);
		L_YXQP.RegFunction("From", QPYX_From_YXQP);
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
	static int QPYX_ChangeStartValue_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				DG.Tweening.Tweener  QPYX_obj_YXQP  = (DG.Tweening.Tweener)ToLua.CheckObject<DG.Tweening.Tweener>(L_YXQP, 1);
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 2);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.ChangeStartValue(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				DG.Tweening.Tweener  QPYX_obj_YXQP  = (DG.Tweening.Tweener)ToLua.CheckObject<DG.Tweening.Tweener>(L_YXQP, 1);
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.ChangeStartValue(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.Tweener.ChangeStartValue");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ChangeEndValue_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				DG.Tweening.Tweener  QPYX_obj_YXQP  = (DG.Tweening.Tweener)ToLua.CheckObject<DG.Tweening.Tweener>(L_YXQP, 1);
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 2);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.ChangeEndValue(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<bool>(L_YXQP, 3))
			{
				DG.Tweening.Tweener  QPYX_obj_YXQP  = (DG.Tweening.Tweener)ToLua.CheckObject<DG.Tweening.Tweener>(L_YXQP, 1);
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.lua_toboolean(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.ChangeEndValue(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<float>(L_YXQP, 3))
			{
				DG.Tweening.Tweener  QPYX_obj_YXQP  = (DG.Tweening.Tweener)ToLua.CheckObject<DG.Tweening.Tweener>(L_YXQP, 1);
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.ChangeEndValue(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				DG.Tweening.Tweener  QPYX_obj_YXQP  = (DG.Tweening.Tweener)ToLua.CheckObject<DG.Tweening.Tweener>(L_YXQP, 1);
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				bool QPYX_arg2_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 4);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.ChangeEndValue(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.Tweener.ChangeEndValue");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ChangeValues_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				DG.Tweening.Tweener  QPYX_obj_YXQP  = (DG.Tweening.Tweener)ToLua.CheckObject<DG.Tweening.Tweener>(L_YXQP, 1);
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 2);
				object QPYX_arg1_YXQP = ToLua.ToVarObject(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.ChangeValues(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				DG.Tweening.Tweener  QPYX_obj_YXQP  = (DG.Tweening.Tweener)ToLua.CheckObject<DG.Tweening.Tweener>(L_YXQP, 1);
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 2);
				object QPYX_arg1_YXQP = ToLua.ToVarObject(L_YXQP, 3);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.ChangeValues(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.Tweener.ChangeValues");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetSpeedBased_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				DG.Tweening.Tweener  QPYX_obj_YXQP  = (DG.Tweening.Tweener)ToLua.CheckObject<DG.Tweening.Tweener>(L_YXQP, 1);
				DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetSpeedBased();
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				DG.Tweening.Tweener  QPYX_obj_YXQP  = (DG.Tweening.Tweener)ToLua.CheckObject<DG.Tweening.Tweener>(L_YXQP, 1);
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetSpeedBased(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.Tweener.SetSpeedBased");
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
				DG.Tweening.Tweener  QPYX_obj_YXQP  = (DG.Tweening.Tweener)ToLua.CheckObject<DG.Tweening.Tweener>(L_YXQP, 1);
				DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetRelative();
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				DG.Tweening.Tweener  QPYX_obj_YXQP  = (DG.Tweening.Tweener)ToLua.CheckObject<DG.Tweening.Tweener>(L_YXQP, 1);
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetRelative(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.Tweener.SetRelative");
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
			DG.Tweening.Tweener  QPYX_obj_YXQP  = (DG.Tweening.Tweener)ToLua.CheckObject<DG.Tweening.Tweener>(L_YXQP, 1);
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetDelay(QPYX_arg0_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_From_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				DG.Tweening.Tweener  QPYX_obj_YXQP  = (DG.Tweening.Tweener)ToLua.CheckObject<DG.Tweening.Tweener>(L_YXQP, 1);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.From();
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				DG.Tweening.Tweener  QPYX_obj_YXQP  = (DG.Tweening.Tweener)ToLua.CheckObject<DG.Tweening.Tweener>(L_YXQP, 1);
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.From(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.Tweener.From");
			}
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
				DG.Tweening.Tweener QPYX_obj_YXQP = (DG.Tweening.Tweener)ToLua.ToObject(L_YXQP, 1);
				DG.Tweening.Tween QPYX_arg0_YXQP = (DG.Tweening.Tween)ToLua.ToObject(L_YXQP, 2);
				DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetAs(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<DG.Tweening.Tween, DG.Tweening.TweenParams>(L_YXQP, 1))
			{
				DG.Tweening.Tweener QPYX_obj_YXQP = (DG.Tweening.Tweener)ToLua.ToObject(L_YXQP, 1);
				DG.Tweening.TweenParams QPYX_arg0_YXQP = (DG.Tweening.TweenParams)ToLua.ToObject(L_YXQP, 2);
				DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetAs(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.Tweener.SetAs");
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
			DG.Tweening.Tweener  QPYX_obj_YXQP  = (DG.Tweening.Tweener)ToLua.CheckObject<DG.Tweening.Tweener>(L_YXQP, 1);
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
			DG.Tweening.Tweener  QPYX_obj_YXQP  = (DG.Tweening.Tweener)ToLua.CheckObject<DG.Tweening.Tweener>(L_YXQP, 1);
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
			DG.Tweening.Tweener  QPYX_obj_YXQP  = (DG.Tweening.Tweener)ToLua.CheckObject<DG.Tweening.Tweener>(L_YXQP, 1);
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
			DG.Tweening.Tweener  QPYX_obj_YXQP  = (DG.Tweening.Tweener)ToLua.CheckObject<DG.Tweening.Tweener>(L_YXQP, 1);
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
			DG.Tweening.Tweener  QPYX_obj_YXQP  = (DG.Tweening.Tweener)ToLua.CheckObject<DG.Tweening.Tweener>(L_YXQP, 1);
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
			DG.Tweening.Tweener  QPYX_obj_YXQP  = (DG.Tweening.Tweener)ToLua.CheckObject<DG.Tweening.Tweener>(L_YXQP, 1);
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
			DG.Tweening.Tweener  QPYX_obj_YXQP  = (DG.Tweening.Tweener)ToLua.CheckObject<DG.Tweening.Tweener>(L_YXQP, 1);
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
			DG.Tweening.Tweener  QPYX_obj_YXQP  = (DG.Tweening.Tweener)ToLua.CheckObject<DG.Tweening.Tweener>(L_YXQP, 1);
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
			DG.Tweening.Tweener  QPYX_obj_YXQP  = (DG.Tweening.Tweener)ToLua.CheckObject<DG.Tweening.Tweener>(L_YXQP, 1);
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
				DG.Tweening.Tweener QPYX_obj_YXQP = (DG.Tweening.Tweener)ToLua.ToObject(L_YXQP, 1);
				bool QPYX_arg0_YXQP = LuaDLL.lua_toboolean(L_YXQP, 2);
				DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetUpdate(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<DG.Tweening.Tween, DG.Tweening.UpdateType>(L_YXQP, 1))
			{
				DG.Tweening.Tweener QPYX_obj_YXQP = (DG.Tweening.Tweener)ToLua.ToObject(L_YXQP, 1);
				DG.Tweening.UpdateType QPYX_arg0_YXQP = (DG.Tweening.UpdateType)ToLua.ToObject(L_YXQP, 2);
				DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetUpdate(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				DG.Tweening.Tweener  QPYX_obj_YXQP  = (DG.Tweening.Tweener)ToLua.CheckObject<DG.Tweening.Tweener>(L_YXQP, 1);
				DG.Tweening.UpdateType QPYX_arg0_YXQP = (DG.Tweening.UpdateType)ToLua.CheckObject(L_YXQP, 2, typeof(DG.Tweening.UpdateType));
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetUpdate(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.Tweener.SetUpdate");
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
				DG.Tweening.Tweener  QPYX_obj_YXQP  = (DG.Tweening.Tweener)ToLua.CheckObject<DG.Tweening.Tweener>(L_YXQP, 1);
				DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetRecyclable();
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				DG.Tweening.Tweener  QPYX_obj_YXQP  = (DG.Tweening.Tweener)ToLua.CheckObject<DG.Tweening.Tweener>(L_YXQP, 1);
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetRecyclable(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.Tweener.SetRecyclable");
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
				DG.Tweening.Tweener QPYX_obj_YXQP = (DG.Tweening.Tweener)ToLua.ToObject(L_YXQP, 1);
				DG.Tweening.Ease QPYX_arg0_YXQP = (DG.Tweening.Ease)ToLua.ToObject(L_YXQP, 2);
				DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetEase(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<DG.Tweening.Tween, UnityEngine.AnimationCurve>(L_YXQP, 1))
			{
				DG.Tweening.Tweener QPYX_obj_YXQP = (DG.Tweening.Tweener)ToLua.ToObject(L_YXQP, 1);
				UnityEngine.AnimationCurve QPYX_arg0_YXQP = (UnityEngine.AnimationCurve)ToLua.ToObject(L_YXQP, 2);
				DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetEase(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<DG.Tweening.Tween, DG.Tweening.EaseFunction>(L_YXQP, 1))
			{
				DG.Tweening.Tweener QPYX_obj_YXQP = (DG.Tweening.Tweener)ToLua.ToObject(L_YXQP, 1);
				DG.Tweening.EaseFunction QPYX_arg0_YXQP = (DG.Tweening.EaseFunction)ToLua.ToObject(L_YXQP, 2);
				DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetEase(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				DG.Tweening.Tweener  QPYX_obj_YXQP  = (DG.Tweening.Tweener)ToLua.CheckObject<DG.Tweening.Tweener>(L_YXQP, 1);
				DG.Tweening.Ease QPYX_arg0_YXQP = (DG.Tweening.Ease)ToLua.CheckObject(L_YXQP, 2, typeof(DG.Tweening.Ease));
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetEase(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				DG.Tweening.Tweener  QPYX_obj_YXQP  = (DG.Tweening.Tweener)ToLua.CheckObject<DG.Tweening.Tweener>(L_YXQP, 1);
				DG.Tweening.Ease QPYX_arg0_YXQP = (DG.Tweening.Ease)ToLua.CheckObject(L_YXQP, 2, typeof(DG.Tweening.Ease));
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
				DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetEase(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.Tweener.SetEase");
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
				DG.Tweening.Tweener  QPYX_obj_YXQP  = (DG.Tweening.Tweener)ToLua.CheckObject<DG.Tweening.Tweener>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetLoops(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				DG.Tweening.Tweener  QPYX_obj_YXQP  = (DG.Tweening.Tweener)ToLua.CheckObject<DG.Tweening.Tweener>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				DG.Tweening.LoopType QPYX_arg1_YXQP = (DG.Tweening.LoopType)ToLua.CheckObject(L_YXQP, 3, typeof(DG.Tweening.LoopType));
				DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetLoops(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.Tweener.SetLoops");
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
			DG.Tweening.Tweener  QPYX_obj_YXQP  = (DG.Tweening.Tweener)ToLua.CheckObject<DG.Tweening.Tweener>(L_YXQP, 1);
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
			DG.Tweening.Tweener  QPYX_obj_YXQP  = (DG.Tweening.Tweener)ToLua.CheckObject<DG.Tweening.Tweener>(L_YXQP, 1);
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
				DG.Tweening.Tweener  QPYX_obj_YXQP  = (DG.Tweening.Tweener)ToLua.CheckObject<DG.Tweening.Tweener>(L_YXQP, 1);
				DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetAutoKill();
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				DG.Tweening.Tweener  QPYX_obj_YXQP  = (DG.Tweening.Tweener)ToLua.CheckObject<DG.Tweening.Tweener>(L_YXQP, 1);
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.SetAutoKill(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.Tweener.SetAutoKill");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}
}

