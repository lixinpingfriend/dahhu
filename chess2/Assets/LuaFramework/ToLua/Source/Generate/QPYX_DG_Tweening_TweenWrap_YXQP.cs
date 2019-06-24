using System;
using DG.Tweening;
using LuaInterface;

public class QPYX_DG_Tweening_TweenWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(DG.Tweening.Tween), typeof(System.Object));
		L_YXQP.RegFunction("PathLength", QPYX_PathLength_YXQP);
		L_YXQP.RegFunction("PathGetDrawPoints", QPYX_PathGetDrawPoints_YXQP);
		L_YXQP.RegFunction("PathGetPoint", QPYX_PathGetPoint_YXQP);
		L_YXQP.RegFunction("Loops", QPYX_Loops_YXQP);
		L_YXQP.RegFunction("IsPlaying", QPYX_IsPlaying_YXQP);
		L_YXQP.RegFunction("IsInitialized", QPYX_IsInitialized_YXQP);
		L_YXQP.RegFunction("IsComplete", QPYX_IsComplete_YXQP);
		L_YXQP.RegFunction("IsBackwards", QPYX_IsBackwards_YXQP);
		L_YXQP.RegFunction("IsActive", QPYX_IsActive_YXQP);
		L_YXQP.RegFunction("ElapsedDirectionalPercentage", QPYX_ElapsedDirectionalPercentage_YXQP);
		L_YXQP.RegFunction("ElapsedPercentage", QPYX_ElapsedPercentage_YXQP);
		L_YXQP.RegFunction("Elapsed", QPYX_Elapsed_YXQP);
		L_YXQP.RegFunction("Duration", QPYX_Duration_YXQP);
		L_YXQP.RegFunction("Delay", QPYX_Delay_YXQP);
		L_YXQP.RegFunction("CompletedLoops", QPYX_CompletedLoops_YXQP);
		L_YXQP.RegFunction("WaitForStart", QPYX_WaitForStart_YXQP);
		L_YXQP.RegFunction("WaitForPosition", QPYX_WaitForPosition_YXQP);
		L_YXQP.RegFunction("WaitForElapsedLoops", QPYX_WaitForElapsedLoops_YXQP);
		L_YXQP.RegFunction("WaitForKill", QPYX_WaitForKill_YXQP);
		L_YXQP.RegFunction("WaitForRewind", QPYX_WaitForRewind_YXQP);
		L_YXQP.RegFunction("WaitForCompletion", QPYX_WaitForCompletion_YXQP);
		L_YXQP.RegFunction("GotoWaypoint", QPYX_GotoWaypoint_YXQP);
		L_YXQP.RegFunction("TogglePause", QPYX_TogglePause_YXQP);
		L_YXQP.RegFunction("SmoothRewind", QPYX_SmoothRewind_YXQP);
		L_YXQP.RegFunction("Rewind", QPYX_Rewind_YXQP);
		L_YXQP.RegFunction("Restart", QPYX_Restart_YXQP);
		L_YXQP.RegFunction("PlayForward", QPYX_PlayForward_YXQP);
		L_YXQP.RegFunction("PlayBackwards", QPYX_PlayBackwards_YXQP);
		L_YXQP.RegFunction("Play", QPYX_Play_YXQP);
		L_YXQP.RegFunction("Pause", QPYX_Pause_YXQP);
		L_YXQP.RegFunction("Kill", QPYX_Kill_YXQP);
		L_YXQP.RegFunction("Goto", QPYX_Goto_YXQP);
		L_YXQP.RegFunction("ForceInit", QPYX_ForceInit_YXQP);
		L_YXQP.RegFunction("Flip", QPYX_Flip_YXQP);
		L_YXQP.RegFunction("Complete", QPYX_Complete_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("timeScale", QPYX_get_timeScale_YXQP, QPYX_set_timeScale_YXQP);
		L_YXQP.RegVar("isBackwards", QPYX_get_isBackwards_YXQP, QPYX_set_isBackwards_YXQP);
		L_YXQP.RegVar("id", QPYX_get_id_YXQP, QPYX_set_id_YXQP);
		L_YXQP.RegVar("target", QPYX_get_target_YXQP, QPYX_set_target_YXQP);
		L_YXQP.RegVar("onPlay", QPYX_get_onPlay_YXQP, QPYX_set_onPlay_YXQP);
		L_YXQP.RegVar("onPause", QPYX_get_onPause_YXQP, QPYX_set_onPause_YXQP);
		L_YXQP.RegVar("onRewind", QPYX_get_onRewind_YXQP, QPYX_set_onRewind_YXQP);
		L_YXQP.RegVar("onUpdate", QPYX_get_onUpdate_YXQP, QPYX_set_onUpdate_YXQP);
		L_YXQP.RegVar("onStepComplete", QPYX_get_onStepComplete_YXQP, QPYX_set_onStepComplete_YXQP);
		L_YXQP.RegVar("onComplete", QPYX_get_onComplete_YXQP, QPYX_set_onComplete_YXQP);
		L_YXQP.RegVar("onKill", QPYX_get_onKill_YXQP, QPYX_set_onKill_YXQP);
		L_YXQP.RegVar("onWaypointChange", QPYX_get_onWaypointChange_YXQP, QPYX_set_onWaypointChange_YXQP);
		L_YXQP.RegVar("easeOvershootOrAmplitude", QPYX_get_easeOvershootOrAmplitude_YXQP, QPYX_set_easeOvershootOrAmplitude_YXQP);
		L_YXQP.RegVar("easePeriod", QPYX_get_easePeriod_YXQP, QPYX_set_easePeriod_YXQP);
		L_YXQP.RegVar("fullPosition", QPYX_get_fullPosition_YXQP, QPYX_set_fullPosition_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_PathLength_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
			float QPYX_o_YXQP = QPYX_obj_YXQP.PathLength();
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_PathGetDrawPoints_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
				UnityEngine.Vector3[] QPYX_o_YXQP = QPYX_obj_YXQP.PathGetDrawPoints();
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.Vector3[] QPYX_o_YXQP = QPYX_obj_YXQP.PathGetDrawPoints(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.Tween.PathGetDrawPoints");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_PathGetPoint_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.Vector3 QPYX_o_YXQP = QPYX_obj_YXQP.PathGetPoint(QPYX_arg0_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Loops_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.Loops();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IsPlaying_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.IsPlaying();
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IsInitialized_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.IsInitialized();
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IsComplete_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.IsComplete();
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IsBackwards_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.IsBackwards();
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IsActive_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.IsActive();
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ElapsedDirectionalPercentage_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
			float QPYX_o_YXQP = QPYX_obj_YXQP.ElapsedDirectionalPercentage();
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ElapsedPercentage_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
				float QPYX_o_YXQP = QPYX_obj_YXQP.ElapsedPercentage();
				LuaDLL.lua_pushnumber(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				float QPYX_o_YXQP = QPYX_obj_YXQP.ElapsedPercentage(QPYX_arg0_YXQP);
				LuaDLL.lua_pushnumber(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.Tween.ElapsedPercentage");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Elapsed_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
				float QPYX_o_YXQP = QPYX_obj_YXQP.Elapsed();
				LuaDLL.lua_pushnumber(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				float QPYX_o_YXQP = QPYX_obj_YXQP.Elapsed(QPYX_arg0_YXQP);
				LuaDLL.lua_pushnumber(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.Tween.Elapsed");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Duration_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
				float QPYX_o_YXQP = QPYX_obj_YXQP.Duration();
				LuaDLL.lua_pushnumber(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				float QPYX_o_YXQP = QPYX_obj_YXQP.Duration(QPYX_arg0_YXQP);
				LuaDLL.lua_pushnumber(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.Tween.Duration");
			}
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
			DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
			float QPYX_o_YXQP = QPYX_obj_YXQP.Delay();
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CompletedLoops_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.CompletedLoops();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_WaitForStart_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
			UnityEngine.Coroutine QPYX_o_YXQP = QPYX_obj_YXQP.WaitForStart();
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_WaitForPosition_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.YieldInstruction QPYX_o_YXQP = QPYX_obj_YXQP.WaitForPosition(QPYX_arg0_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_WaitForElapsedLoops_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.YieldInstruction QPYX_o_YXQP = QPYX_obj_YXQP.WaitForElapsedLoops(QPYX_arg0_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_WaitForKill_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
			UnityEngine.YieldInstruction QPYX_o_YXQP = QPYX_obj_YXQP.WaitForKill();
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_WaitForRewind_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
			UnityEngine.YieldInstruction QPYX_o_YXQP = QPYX_obj_YXQP.WaitForRewind();
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_WaitForCompletion_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
			UnityEngine.YieldInstruction QPYX_o_YXQP = QPYX_obj_YXQP.WaitForCompletion();
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GotoWaypoint_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				QPYX_obj_YXQP.GotoWaypoint(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3)
			{
				DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				QPYX_obj_YXQP.GotoWaypoint(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.Tween.GotoWaypoint");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_TogglePause_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
			QPYX_obj_YXQP.TogglePause();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SmoothRewind_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
			QPYX_obj_YXQP.SmoothRewind();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Rewind_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
				QPYX_obj_YXQP.Rewind();
				return 0;
			}
			else if (QPYX_count_YXQP == 2)
			{
				DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				QPYX_obj_YXQP.Rewind(QPYX_arg0_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.Tween.Rewind");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Restart_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
				QPYX_obj_YXQP.Restart();
				return 0;
			}
			else if (QPYX_count_YXQP == 2)
			{
				DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				QPYX_obj_YXQP.Restart(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3)
			{
				DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				QPYX_obj_YXQP.Restart(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.Tween.Restart");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_PlayForward_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
			QPYX_obj_YXQP.PlayForward();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_PlayBackwards_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
			QPYX_obj_YXQP.PlayBackwards();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Play_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
			DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.Play();
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Pause_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
			DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.Pause();
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
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
				QPYX_obj_YXQP.Kill();
				return 0;
			}
			else if (QPYX_count_YXQP == 2)
			{
				DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				QPYX_obj_YXQP.Kill(QPYX_arg0_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.Tween.Kill");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Goto_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				QPYX_obj_YXQP.Goto(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3)
			{
				DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				QPYX_obj_YXQP.Goto(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.Tween.Goto");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ForceInit_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
			QPYX_obj_YXQP.ForceInit();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Flip_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
			QPYX_obj_YXQP.Flip();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Complete_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
				QPYX_obj_YXQP.Complete();
				return 0;
			}
			else if (QPYX_count_YXQP == 2)
			{
				DG.Tweening.Tween  QPYX_obj_YXQP  = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 1);
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				QPYX_obj_YXQP.Complete(QPYX_arg0_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.Tween.Complete");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_timeScale_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Tween QPYX_obj_YXQP = (DG.Tweening.Tween)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.timeScale;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index timeScale on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isBackwards_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Tween QPYX_obj_YXQP = (DG.Tweening.Tween)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.isBackwards;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isBackwards on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_id_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Tween QPYX_obj_YXQP = (DG.Tweening.Tween)QPYX_o_YXQP;
			object QPYX_ret_YXQP = QPYX_obj_YXQP.id;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index id on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_target_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Tween QPYX_obj_YXQP = (DG.Tweening.Tween)QPYX_o_YXQP;
			object QPYX_ret_YXQP = QPYX_obj_YXQP.target;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index target on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onPlay_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Tween QPYX_obj_YXQP = (DG.Tweening.Tween)QPYX_o_YXQP;
			DG.Tweening.TweenCallback QPYX_ret_YXQP = QPYX_obj_YXQP.onPlay;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onPlay on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onPause_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Tween QPYX_obj_YXQP = (DG.Tweening.Tween)QPYX_o_YXQP;
			DG.Tweening.TweenCallback QPYX_ret_YXQP = QPYX_obj_YXQP.onPause;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onPause on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onRewind_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Tween QPYX_obj_YXQP = (DG.Tweening.Tween)QPYX_o_YXQP;
			DG.Tweening.TweenCallback QPYX_ret_YXQP = QPYX_obj_YXQP.onRewind;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onRewind on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onUpdate_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Tween QPYX_obj_YXQP = (DG.Tweening.Tween)QPYX_o_YXQP;
			DG.Tweening.TweenCallback QPYX_ret_YXQP = QPYX_obj_YXQP.onUpdate;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onUpdate on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onStepComplete_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Tween QPYX_obj_YXQP = (DG.Tweening.Tween)QPYX_o_YXQP;
			DG.Tweening.TweenCallback QPYX_ret_YXQP = QPYX_obj_YXQP.onStepComplete;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onStepComplete on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onComplete_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Tween QPYX_obj_YXQP = (DG.Tweening.Tween)QPYX_o_YXQP;
			DG.Tweening.TweenCallback QPYX_ret_YXQP = QPYX_obj_YXQP.onComplete;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onComplete on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onKill_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Tween QPYX_obj_YXQP = (DG.Tweening.Tween)QPYX_o_YXQP;
			DG.Tweening.TweenCallback QPYX_ret_YXQP = QPYX_obj_YXQP.onKill;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onKill on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onWaypointChange_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Tween QPYX_obj_YXQP = (DG.Tweening.Tween)QPYX_o_YXQP;
			DG.Tweening.TweenCallback<int> QPYX_ret_YXQP = QPYX_obj_YXQP.onWaypointChange;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onWaypointChange on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_easeOvershootOrAmplitude_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Tween QPYX_obj_YXQP = (DG.Tweening.Tween)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.easeOvershootOrAmplitude;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index easeOvershootOrAmplitude on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_easePeriod_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Tween QPYX_obj_YXQP = (DG.Tweening.Tween)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.easePeriod;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index easePeriod on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_fullPosition_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Tween QPYX_obj_YXQP = (DG.Tweening.Tween)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.fullPosition;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index fullPosition on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_timeScale_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Tween QPYX_obj_YXQP = (DG.Tweening.Tween)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.timeScale = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index timeScale on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_isBackwards_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Tween QPYX_obj_YXQP = (DG.Tweening.Tween)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.isBackwards = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isBackwards on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_id_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Tween QPYX_obj_YXQP = (DG.Tweening.Tween)QPYX_o_YXQP;
			object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 2);
			QPYX_obj_YXQP.id = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index id on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_target_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Tween QPYX_obj_YXQP = (DG.Tweening.Tween)QPYX_o_YXQP;
			object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 2);
			QPYX_obj_YXQP.target = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index target on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onPlay_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Tween QPYX_obj_YXQP = (DG.Tweening.Tween)QPYX_o_YXQP;
			DG.Tweening.TweenCallback QPYX_arg0_YXQP = (DG.Tweening.TweenCallback)ToLua.CheckDelegate<DG.Tweening.TweenCallback>(L_YXQP, 2);
			QPYX_obj_YXQP.onPlay = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onPlay on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onPause_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Tween QPYX_obj_YXQP = (DG.Tweening.Tween)QPYX_o_YXQP;
			DG.Tweening.TweenCallback QPYX_arg0_YXQP = (DG.Tweening.TweenCallback)ToLua.CheckDelegate<DG.Tweening.TweenCallback>(L_YXQP, 2);
			QPYX_obj_YXQP.onPause = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onPause on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onRewind_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Tween QPYX_obj_YXQP = (DG.Tweening.Tween)QPYX_o_YXQP;
			DG.Tweening.TweenCallback QPYX_arg0_YXQP = (DG.Tweening.TweenCallback)ToLua.CheckDelegate<DG.Tweening.TweenCallback>(L_YXQP, 2);
			QPYX_obj_YXQP.onRewind = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onRewind on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onUpdate_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Tween QPYX_obj_YXQP = (DG.Tweening.Tween)QPYX_o_YXQP;
			DG.Tweening.TweenCallback QPYX_arg0_YXQP = (DG.Tweening.TweenCallback)ToLua.CheckDelegate<DG.Tweening.TweenCallback>(L_YXQP, 2);
			QPYX_obj_YXQP.onUpdate = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onUpdate on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onStepComplete_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Tween QPYX_obj_YXQP = (DG.Tweening.Tween)QPYX_o_YXQP;
			DG.Tweening.TweenCallback QPYX_arg0_YXQP = (DG.Tweening.TweenCallback)ToLua.CheckDelegate<DG.Tweening.TweenCallback>(L_YXQP, 2);
			QPYX_obj_YXQP.onStepComplete = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onStepComplete on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onComplete_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Tween QPYX_obj_YXQP = (DG.Tweening.Tween)QPYX_o_YXQP;
			DG.Tweening.TweenCallback QPYX_arg0_YXQP = (DG.Tweening.TweenCallback)ToLua.CheckDelegate<DG.Tweening.TweenCallback>(L_YXQP, 2);
			QPYX_obj_YXQP.onComplete = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onComplete on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onKill_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Tween QPYX_obj_YXQP = (DG.Tweening.Tween)QPYX_o_YXQP;
			DG.Tweening.TweenCallback QPYX_arg0_YXQP = (DG.Tweening.TweenCallback)ToLua.CheckDelegate<DG.Tweening.TweenCallback>(L_YXQP, 2);
			QPYX_obj_YXQP.onKill = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onKill on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onWaypointChange_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Tween QPYX_obj_YXQP = (DG.Tweening.Tween)QPYX_o_YXQP;
			DG.Tweening.TweenCallback<int> QPYX_arg0_YXQP = (DG.Tweening.TweenCallback<int>)ToLua.CheckDelegate<DG.Tweening.TweenCallback<int>>(L_YXQP, 2);
			QPYX_obj_YXQP.onWaypointChange = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onWaypointChange on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_easeOvershootOrAmplitude_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Tween QPYX_obj_YXQP = (DG.Tweening.Tween)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.easeOvershootOrAmplitude = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index easeOvershootOrAmplitude on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_easePeriod_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Tween QPYX_obj_YXQP = (DG.Tweening.Tween)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.easePeriod = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index easePeriod on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_fullPosition_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Tween QPYX_obj_YXQP = (DG.Tweening.Tween)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.fullPosition = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index fullPosition on a nil value");
		}
	}
}

