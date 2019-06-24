using System;
using LuaInterface;

public class QPYX_DG_Tweening_DOTweenAnimationWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(DG.Tweening.DOTweenAnimation), typeof(DG.Tweening.Core.ABSAnimationComponent));
		L_YXQP.RegFunction("CreateTween", QPYX_CreateTween_YXQP);
		L_YXQP.RegFunction("DOPlay", QPYX_DOPlay_YXQP);
		L_YXQP.RegFunction("DOPlayBackwards", QPYX_DOPlayBackwards_YXQP);
		L_YXQP.RegFunction("DOPlayForward", QPYX_DOPlayForward_YXQP);
		L_YXQP.RegFunction("DOPause", QPYX_DOPause_YXQP);
		L_YXQP.RegFunction("DOTogglePause", QPYX_DOTogglePause_YXQP);
		L_YXQP.RegFunction("DORewind", QPYX_DORewind_YXQP);
		L_YXQP.RegFunction("DORestart", QPYX_DORestart_YXQP);
		L_YXQP.RegFunction("DOComplete", QPYX_DOComplete_YXQP);
		L_YXQP.RegFunction("DOKill", QPYX_DOKill_YXQP);
		L_YXQP.RegFunction("DOPlayById", QPYX_DOPlayById_YXQP);
		L_YXQP.RegFunction("DOPlayAllById", QPYX_DOPlayAllById_YXQP);
		L_YXQP.RegFunction("DOPauseAllById", QPYX_DOPauseAllById_YXQP);
		L_YXQP.RegFunction("DOPlayBackwardsById", QPYX_DOPlayBackwardsById_YXQP);
		L_YXQP.RegFunction("DOPlayBackwardsAllById", QPYX_DOPlayBackwardsAllById_YXQP);
		L_YXQP.RegFunction("DOPlayForwardById", QPYX_DOPlayForwardById_YXQP);
		L_YXQP.RegFunction("DOPlayForwardAllById", QPYX_DOPlayForwardAllById_YXQP);
		L_YXQP.RegFunction("DOPlayNext", QPYX_DOPlayNext_YXQP);
		L_YXQP.RegFunction("DORewindAndPlayNext", QPYX_DORewindAndPlayNext_YXQP);
		L_YXQP.RegFunction("DORestartById", QPYX_DORestartById_YXQP);
		L_YXQP.RegFunction("DORestartAllById", QPYX_DORestartAllById_YXQP);
		L_YXQP.RegFunction("GetTweens", QPYX_GetTweens_YXQP);
		L_YXQP.RegFunction("TypeToDOTargetType", QPYX_TypeToDOTargetType_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("delay", QPYX_get_delay_YXQP, QPYX_set_delay_YXQP);
		L_YXQP.RegVar("duration", QPYX_get_duration_YXQP, QPYX_set_duration_YXQP);
		L_YXQP.RegVar("easeType", QPYX_get_easeType_YXQP, QPYX_set_easeType_YXQP);
		L_YXQP.RegVar("easeCurve", QPYX_get_easeCurve_YXQP, QPYX_set_easeCurve_YXQP);
		L_YXQP.RegVar("loopType", QPYX_get_loopType_YXQP, QPYX_set_loopType_YXQP);
		L_YXQP.RegVar("loops", QPYX_get_loops_YXQP, QPYX_set_loops_YXQP);
		L_YXQP.RegVar("id", QPYX_get_id_YXQP, QPYX_set_id_YXQP);
		L_YXQP.RegVar("isRelative", QPYX_get_isRelative_YXQP, QPYX_set_isRelative_YXQP);
		L_YXQP.RegVar("isFrom", QPYX_get_isFrom_YXQP, QPYX_set_isFrom_YXQP);
		L_YXQP.RegVar("isIndependentUpdate", QPYX_get_isIndependentUpdate_YXQP, QPYX_set_isIndependentUpdate_YXQP);
		L_YXQP.RegVar("autoKill", QPYX_get_autoKill_YXQP, QPYX_set_autoKill_YXQP);
		L_YXQP.RegVar("isActive", QPYX_get_isActive_YXQP, QPYX_set_isActive_YXQP);
		L_YXQP.RegVar("isValid", QPYX_get_isValid_YXQP, QPYX_set_isValid_YXQP);
		L_YXQP.RegVar("target", QPYX_get_target_YXQP, QPYX_set_target_YXQP);
		L_YXQP.RegVar("animationType", QPYX_get_animationType_YXQP, QPYX_set_animationType_YXQP);
		L_YXQP.RegVar("targetType", QPYX_get_targetType_YXQP, QPYX_set_targetType_YXQP);
		L_YXQP.RegVar("forcedTargetType", QPYX_get_forcedTargetType_YXQP, QPYX_set_forcedTargetType_YXQP);
		L_YXQP.RegVar("autoPlay", QPYX_get_autoPlay_YXQP, QPYX_set_autoPlay_YXQP);
		L_YXQP.RegVar("useTargetAsV3", QPYX_get_useTargetAsV3_YXQP, QPYX_set_useTargetAsV3_YXQP);
		L_YXQP.RegVar("endValueFloat", QPYX_get_endValueFloat_YXQP, QPYX_set_endValueFloat_YXQP);
		L_YXQP.RegVar("endValueV3", QPYX_get_endValueV3_YXQP, QPYX_set_endValueV3_YXQP);
		L_YXQP.RegVar("endValueV2", QPYX_get_endValueV2_YXQP, QPYX_set_endValueV2_YXQP);
		L_YXQP.RegVar("endValueColor", QPYX_get_endValueColor_YXQP, QPYX_set_endValueColor_YXQP);
		L_YXQP.RegVar("endValueString", QPYX_get_endValueString_YXQP, QPYX_set_endValueString_YXQP);
		L_YXQP.RegVar("endValueRect", QPYX_get_endValueRect_YXQP, QPYX_set_endValueRect_YXQP);
		L_YXQP.RegVar("endValueTransform", QPYX_get_endValueTransform_YXQP, QPYX_set_endValueTransform_YXQP);
		L_YXQP.RegVar("optionalBool0", QPYX_get_optionalBool0_YXQP, QPYX_set_optionalBool0_YXQP);
		L_YXQP.RegVar("optionalFloat0", QPYX_get_optionalFloat0_YXQP, QPYX_set_optionalFloat0_YXQP);
		L_YXQP.RegVar("optionalInt0", QPYX_get_optionalInt0_YXQP, QPYX_set_optionalInt0_YXQP);
		L_YXQP.RegVar("optionalRotationMode", QPYX_get_optionalRotationMode_YXQP, QPYX_set_optionalRotationMode_YXQP);
		L_YXQP.RegVar("optionalScrambleMode", QPYX_get_optionalScrambleMode_YXQP, QPYX_set_optionalScrambleMode_YXQP);
		L_YXQP.RegVar("optionalString", QPYX_get_optionalString_YXQP, QPYX_set_optionalString_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CreateTween_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DG.Tweening.DOTweenAnimation  QPYX_obj_YXQP  = (DG.Tweening.DOTweenAnimation)ToLua.CheckObject<DG.Tweening.DOTweenAnimation>(L_YXQP, 1);
			QPYX_obj_YXQP.CreateTween();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOPlay_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DG.Tweening.DOTweenAnimation  QPYX_obj_YXQP  = (DG.Tweening.DOTweenAnimation)ToLua.CheckObject<DG.Tweening.DOTweenAnimation>(L_YXQP, 1);
			QPYX_obj_YXQP.DOPlay();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOPlayBackwards_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DG.Tweening.DOTweenAnimation  QPYX_obj_YXQP  = (DG.Tweening.DOTweenAnimation)ToLua.CheckObject<DG.Tweening.DOTweenAnimation>(L_YXQP, 1);
			QPYX_obj_YXQP.DOPlayBackwards();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOPlayForward_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DG.Tweening.DOTweenAnimation  QPYX_obj_YXQP  = (DG.Tweening.DOTweenAnimation)ToLua.CheckObject<DG.Tweening.DOTweenAnimation>(L_YXQP, 1);
			QPYX_obj_YXQP.DOPlayForward();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOPause_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DG.Tweening.DOTweenAnimation  QPYX_obj_YXQP  = (DG.Tweening.DOTweenAnimation)ToLua.CheckObject<DG.Tweening.DOTweenAnimation>(L_YXQP, 1);
			QPYX_obj_YXQP.DOPause();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOTogglePause_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DG.Tweening.DOTweenAnimation  QPYX_obj_YXQP  = (DG.Tweening.DOTweenAnimation)ToLua.CheckObject<DG.Tweening.DOTweenAnimation>(L_YXQP, 1);
			QPYX_obj_YXQP.DOTogglePause();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DORewind_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DG.Tweening.DOTweenAnimation  QPYX_obj_YXQP  = (DG.Tweening.DOTweenAnimation)ToLua.CheckObject<DG.Tweening.DOTweenAnimation>(L_YXQP, 1);
			QPYX_obj_YXQP.DORewind();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DORestart_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				DG.Tweening.DOTweenAnimation  QPYX_obj_YXQP  = (DG.Tweening.DOTweenAnimation)ToLua.CheckObject<DG.Tweening.DOTweenAnimation>(L_YXQP, 1);
				QPYX_obj_YXQP.DORestart();
				return 0;
			}
			else if (QPYX_count_YXQP == 2)
			{
				DG.Tweening.DOTweenAnimation  QPYX_obj_YXQP  = (DG.Tweening.DOTweenAnimation)ToLua.CheckObject<DG.Tweening.DOTweenAnimation>(L_YXQP, 1);
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				QPYX_obj_YXQP.DORestart(QPYX_arg0_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.DOTweenAnimation.DORestart");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOComplete_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DG.Tweening.DOTweenAnimation  QPYX_obj_YXQP  = (DG.Tweening.DOTweenAnimation)ToLua.CheckObject<DG.Tweening.DOTweenAnimation>(L_YXQP, 1);
			QPYX_obj_YXQP.DOComplete();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOKill_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DG.Tweening.DOTweenAnimation  QPYX_obj_YXQP  = (DG.Tweening.DOTweenAnimation)ToLua.CheckObject<DG.Tweening.DOTweenAnimation>(L_YXQP, 1);
			QPYX_obj_YXQP.DOKill();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOPlayById_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			DG.Tweening.DOTweenAnimation  QPYX_obj_YXQP  = (DG.Tweening.DOTweenAnimation)ToLua.CheckObject<DG.Tweening.DOTweenAnimation>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.DOPlayById(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOPlayAllById_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			DG.Tweening.DOTweenAnimation  QPYX_obj_YXQP  = (DG.Tweening.DOTweenAnimation)ToLua.CheckObject<DG.Tweening.DOTweenAnimation>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.DOPlayAllById(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOPauseAllById_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			DG.Tweening.DOTweenAnimation  QPYX_obj_YXQP  = (DG.Tweening.DOTweenAnimation)ToLua.CheckObject<DG.Tweening.DOTweenAnimation>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.DOPauseAllById(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOPlayBackwardsById_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			DG.Tweening.DOTweenAnimation  QPYX_obj_YXQP  = (DG.Tweening.DOTweenAnimation)ToLua.CheckObject<DG.Tweening.DOTweenAnimation>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.DOPlayBackwardsById(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOPlayBackwardsAllById_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			DG.Tweening.DOTweenAnimation  QPYX_obj_YXQP  = (DG.Tweening.DOTweenAnimation)ToLua.CheckObject<DG.Tweening.DOTweenAnimation>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.DOPlayBackwardsAllById(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOPlayForwardById_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			DG.Tweening.DOTweenAnimation  QPYX_obj_YXQP  = (DG.Tweening.DOTweenAnimation)ToLua.CheckObject<DG.Tweening.DOTweenAnimation>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.DOPlayForwardById(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOPlayForwardAllById_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			DG.Tweening.DOTweenAnimation  QPYX_obj_YXQP  = (DG.Tweening.DOTweenAnimation)ToLua.CheckObject<DG.Tweening.DOTweenAnimation>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.DOPlayForwardAllById(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOPlayNext_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DG.Tweening.DOTweenAnimation  QPYX_obj_YXQP  = (DG.Tweening.DOTweenAnimation)ToLua.CheckObject<DG.Tweening.DOTweenAnimation>(L_YXQP, 1);
			QPYX_obj_YXQP.DOPlayNext();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DORewindAndPlayNext_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DG.Tweening.DOTweenAnimation  QPYX_obj_YXQP  = (DG.Tweening.DOTweenAnimation)ToLua.CheckObject<DG.Tweening.DOTweenAnimation>(L_YXQP, 1);
			QPYX_obj_YXQP.DORewindAndPlayNext();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DORestartById_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			DG.Tweening.DOTweenAnimation  QPYX_obj_YXQP  = (DG.Tweening.DOTweenAnimation)ToLua.CheckObject<DG.Tweening.DOTweenAnimation>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.DORestartById(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DORestartAllById_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			DG.Tweening.DOTweenAnimation  QPYX_obj_YXQP  = (DG.Tweening.DOTweenAnimation)ToLua.CheckObject<DG.Tweening.DOTweenAnimation>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.DORestartAllById(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetTweens_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DG.Tweening.DOTweenAnimation  QPYX_obj_YXQP  = (DG.Tweening.DOTweenAnimation)ToLua.CheckObject<DG.Tweening.DOTweenAnimation>(L_YXQP, 1);
			System.Collections.Generic.List<DG.Tweening.Tween> QPYX_o_YXQP = QPYX_obj_YXQP.GetTweens();
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_TypeToDOTargetType_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			System.Type QPYX_arg0_YXQP = ToLua.CheckMonoType(L_YXQP, 1);
			DG.Tweening.Core.TargetType QPYX_o_YXQP = DG.Tweening.DOTweenAnimation.TypeToDOTargetType(QPYX_arg0_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
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
	static int QPYX_get_delay_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.delay;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index delay on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_duration_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.duration;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index duration on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_easeType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			DG.Tweening.Ease QPYX_ret_YXQP = QPYX_obj_YXQP.easeType;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index easeType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_easeCurve_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			UnityEngine.AnimationCurve QPYX_ret_YXQP = QPYX_obj_YXQP.easeCurve;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index easeCurve on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_loopType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			DG.Tweening.LoopType QPYX_ret_YXQP = QPYX_obj_YXQP.loopType;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index loopType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_loops_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.loops;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index loops on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_id_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			string QPYX_ret_YXQP = QPYX_obj_YXQP.id;
			LuaDLL.lua_pushstring(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index id on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isRelative_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.isRelative;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isRelative on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isFrom_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.isFrom;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isFrom on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isIndependentUpdate_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.isIndependentUpdate;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isIndependentUpdate on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_autoKill_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.autoKill;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index autoKill on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isActive_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.isActive;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isActive on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isValid_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.isValid;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isValid on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_target_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			UnityEngine.Component QPYX_ret_YXQP = QPYX_obj_YXQP.target;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index target on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_animationType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			DG.Tweening.Core.DOTweenAnimationType QPYX_ret_YXQP = QPYX_obj_YXQP.animationType;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index animationType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_targetType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			DG.Tweening.Core.TargetType QPYX_ret_YXQP = QPYX_obj_YXQP.targetType;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index targetType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_forcedTargetType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			DG.Tweening.Core.TargetType QPYX_ret_YXQP = QPYX_obj_YXQP.forcedTargetType;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index forcedTargetType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_autoPlay_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.autoPlay;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index autoPlay on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_useTargetAsV3_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.useTargetAsV3;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index useTargetAsV3 on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_endValueFloat_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.endValueFloat;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index endValueFloat on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_endValueV3_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_ret_YXQP = QPYX_obj_YXQP.endValueV3;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index endValueV3 on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_endValueV2_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_ret_YXQP = QPYX_obj_YXQP.endValueV2;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index endValueV2 on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_endValueColor_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			UnityEngine.Color QPYX_ret_YXQP = QPYX_obj_YXQP.endValueColor;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index endValueColor on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_endValueString_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			string QPYX_ret_YXQP = QPYX_obj_YXQP.endValueString;
			LuaDLL.lua_pushstring(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index endValueString on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_endValueRect_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			UnityEngine.Rect QPYX_ret_YXQP = QPYX_obj_YXQP.endValueRect;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index endValueRect on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_endValueTransform_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			UnityEngine.Transform QPYX_ret_YXQP = QPYX_obj_YXQP.endValueTransform;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index endValueTransform on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_optionalBool0_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.optionalBool0;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index optionalBool0 on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_optionalFloat0_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.optionalFloat0;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index optionalFloat0 on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_optionalInt0_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.optionalInt0;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index optionalInt0 on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_optionalRotationMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			DG.Tweening.RotateMode QPYX_ret_YXQP = QPYX_obj_YXQP.optionalRotationMode;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index optionalRotationMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_optionalScrambleMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			DG.Tweening.ScrambleMode QPYX_ret_YXQP = QPYX_obj_YXQP.optionalScrambleMode;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index optionalScrambleMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_optionalString_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			string QPYX_ret_YXQP = QPYX_obj_YXQP.optionalString;
			LuaDLL.lua_pushstring(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index optionalString on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_delay_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.delay = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index delay on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_duration_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.duration = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index duration on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_easeType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			DG.Tweening.Ease QPYX_arg0_YXQP = (DG.Tweening.Ease)ToLua.CheckObject(L_YXQP, 2, typeof(DG.Tweening.Ease));
			QPYX_obj_YXQP.easeType = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index easeType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_easeCurve_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			UnityEngine.AnimationCurve QPYX_arg0_YXQP = (UnityEngine.AnimationCurve)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.AnimationCurve));
			QPYX_obj_YXQP.easeCurve = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index easeCurve on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_loopType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			DG.Tweening.LoopType QPYX_arg0_YXQP = (DG.Tweening.LoopType)ToLua.CheckObject(L_YXQP, 2, typeof(DG.Tweening.LoopType));
			QPYX_obj_YXQP.loopType = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index loopType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_loops_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.loops = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index loops on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_id_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.id = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index id on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_isRelative_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.isRelative = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isRelative on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_isFrom_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.isFrom = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isFrom on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_isIndependentUpdate_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.isIndependentUpdate = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isIndependentUpdate on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_autoKill_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.autoKill = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index autoKill on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_isActive_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.isActive = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isActive on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_isValid_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.isValid = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isValid on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_target_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			UnityEngine.Component QPYX_arg0_YXQP = (UnityEngine.Component)ToLua.CheckObject<UnityEngine.Component>(L_YXQP, 2);
			QPYX_obj_YXQP.target = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index target on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_animationType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			DG.Tweening.Core.DOTweenAnimationType QPYX_arg0_YXQP = (DG.Tweening.Core.DOTweenAnimationType)ToLua.CheckObject(L_YXQP, 2, typeof(DG.Tweening.Core.DOTweenAnimationType));
			QPYX_obj_YXQP.animationType = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index animationType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_targetType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			DG.Tweening.Core.TargetType QPYX_arg0_YXQP = (DG.Tweening.Core.TargetType)ToLua.CheckObject(L_YXQP, 2, typeof(DG.Tweening.Core.TargetType));
			QPYX_obj_YXQP.targetType = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index targetType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_forcedTargetType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			DG.Tweening.Core.TargetType QPYX_arg0_YXQP = (DG.Tweening.Core.TargetType)ToLua.CheckObject(L_YXQP, 2, typeof(DG.Tweening.Core.TargetType));
			QPYX_obj_YXQP.forcedTargetType = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index forcedTargetType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_autoPlay_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.autoPlay = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index autoPlay on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_useTargetAsV3_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.useTargetAsV3 = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index useTargetAsV3 on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_endValueFloat_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.endValueFloat = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index endValueFloat on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_endValueV3_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
			QPYX_obj_YXQP.endValueV3 = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index endValueV3 on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_endValueV2_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_arg0_YXQP = ToLua.ToVector2(L_YXQP, 2);
			QPYX_obj_YXQP.endValueV2 = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index endValueV2 on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_endValueColor_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			UnityEngine.Color QPYX_arg0_YXQP = ToLua.ToColor(L_YXQP, 2);
			QPYX_obj_YXQP.endValueColor = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index endValueColor on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_endValueString_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.endValueString = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index endValueString on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_endValueRect_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			UnityEngine.Rect QPYX_arg0_YXQP = StackTraits<UnityEngine.Rect>.Check(L_YXQP, 2);
			QPYX_obj_YXQP.endValueRect = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index endValueRect on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_endValueTransform_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			UnityEngine.Transform QPYX_arg0_YXQP = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 2);
			QPYX_obj_YXQP.endValueTransform = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index endValueTransform on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_optionalBool0_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.optionalBool0 = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index optionalBool0 on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_optionalFloat0_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.optionalFloat0 = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index optionalFloat0 on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_optionalInt0_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.optionalInt0 = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index optionalInt0 on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_optionalRotationMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			DG.Tweening.RotateMode QPYX_arg0_YXQP = (DG.Tweening.RotateMode)ToLua.CheckObject(L_YXQP, 2, typeof(DG.Tweening.RotateMode));
			QPYX_obj_YXQP.optionalRotationMode = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index optionalRotationMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_optionalScrambleMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			DG.Tweening.ScrambleMode QPYX_arg0_YXQP = (DG.Tweening.ScrambleMode)ToLua.CheckObject(L_YXQP, 2, typeof(DG.Tweening.ScrambleMode));
			QPYX_obj_YXQP.optionalScrambleMode = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index optionalScrambleMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_optionalString_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenAnimation QPYX_obj_YXQP = (DG.Tweening.DOTweenAnimation)QPYX_o_YXQP;
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.optionalString = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index optionalString on a nil value");
		}
	}
}

