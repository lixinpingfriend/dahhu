using System;
using LuaInterface;

public class QPYX_DG_Tweening_DOTweenWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(DG.Tweening.DOTween), typeof(System.Object));
		L_YXQP.RegFunction("Init", QPYX_Init_YXQP);
		L_YXQP.RegFunction("SetTweensCapacity", QPYX_SetTweensCapacity_YXQP);
		L_YXQP.RegFunction("Clear", QPYX_Clear_YXQP);
		L_YXQP.RegFunction("ClearCachedTweens", QPYX_ClearCachedTweens_YXQP);
		L_YXQP.RegFunction("Validate", QPYX_Validate_YXQP);
		L_YXQP.RegFunction("ManualUpdate", QPYX_ManualUpdate_YXQP);
		L_YXQP.RegFunction("To", QPYX_To_YXQP);
		L_YXQP.RegFunction("ToAxis", QPYX_ToAxis_YXQP);
		L_YXQP.RegFunction("ToAlpha", QPYX_ToAlpha_YXQP);
		L_YXQP.RegFunction("Punch", QPYX_Punch_YXQP);
		L_YXQP.RegFunction("Shake", QPYX_Shake_YXQP);
		L_YXQP.RegFunction("ToArray", QPYX_ToArray_YXQP);
		L_YXQP.RegFunction("Sequence", QPYX_Sequence_YXQP);
		L_YXQP.RegFunction("CompleteAll", QPYX_CompleteAll_YXQP);
		L_YXQP.RegFunction("Complete", QPYX_Complete_YXQP);
		L_YXQP.RegFunction("FlipAll", QPYX_FlipAll_YXQP);
		L_YXQP.RegFunction("Flip", QPYX_Flip_YXQP);
		L_YXQP.RegFunction("GotoAll", QPYX_GotoAll_YXQP);
		L_YXQP.RegFunction("Goto", QPYX_Goto_YXQP);
		L_YXQP.RegFunction("KillAll", QPYX_KillAll_YXQP);
		L_YXQP.RegFunction("Kill", QPYX_Kill_YXQP);
		L_YXQP.RegFunction("PauseAll", QPYX_PauseAll_YXQP);
		L_YXQP.RegFunction("Pause", QPYX_Pause_YXQP);
		L_YXQP.RegFunction("PlayAll", QPYX_PlayAll_YXQP);
		L_YXQP.RegFunction("Play", QPYX_Play_YXQP);
		L_YXQP.RegFunction("PlayBackwardsAll", QPYX_PlayBackwardsAll_YXQP);
		L_YXQP.RegFunction("PlayBackwards", QPYX_PlayBackwards_YXQP);
		L_YXQP.RegFunction("PlayForwardAll", QPYX_PlayForwardAll_YXQP);
		L_YXQP.RegFunction("PlayForward", QPYX_PlayForward_YXQP);
		L_YXQP.RegFunction("RestartAll", QPYX_RestartAll_YXQP);
		L_YXQP.RegFunction("Restart", QPYX_Restart_YXQP);
		L_YXQP.RegFunction("RewindAll", QPYX_RewindAll_YXQP);
		L_YXQP.RegFunction("Rewind", QPYX_Rewind_YXQP);
		L_YXQP.RegFunction("SmoothRewindAll", QPYX_SmoothRewindAll_YXQP);
		L_YXQP.RegFunction("SmoothRewind", QPYX_SmoothRewind_YXQP);
		L_YXQP.RegFunction("TogglePauseAll", QPYX_TogglePauseAll_YXQP);
		L_YXQP.RegFunction("TogglePause", QPYX_TogglePause_YXQP);
		L_YXQP.RegFunction("IsTweening", QPYX_IsTweening_YXQP);
		L_YXQP.RegFunction("TotalPlayingTweens", QPYX_TotalPlayingTweens_YXQP);
		L_YXQP.RegFunction("PlayingTweens", QPYX_PlayingTweens_YXQP);
		L_YXQP.RegFunction("PausedTweens", QPYX_PausedTweens_YXQP);
		L_YXQP.RegFunction("TweensById", QPYX_TweensById_YXQP);
		L_YXQP.RegFunction("TweensByTarget", QPYX_TweensByTarget_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateDG_Tweening_DOTween_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("Version", QPYX_get_Version_YXQP, null);
		L_YXQP.RegVar("useSafeMode", QPYX_get_useSafeMode_YXQP, QPYX_set_useSafeMode_YXQP);
		L_YXQP.RegVar("showUnityEditorReport", QPYX_get_showUnityEditorReport_YXQP, QPYX_set_showUnityEditorReport_YXQP);
		L_YXQP.RegVar("timeScale", QPYX_get_timeScale_YXQP, QPYX_set_timeScale_YXQP);
		L_YXQP.RegVar("useSmoothDeltaTime", QPYX_get_useSmoothDeltaTime_YXQP, QPYX_set_useSmoothDeltaTime_YXQP);
		L_YXQP.RegVar("maxSmoothUnscaledTime", QPYX_get_maxSmoothUnscaledTime_YXQP, QPYX_set_maxSmoothUnscaledTime_YXQP);
		L_YXQP.RegVar("drawGizmos", QPYX_get_drawGizmos_YXQP, QPYX_set_drawGizmos_YXQP);
		L_YXQP.RegVar("defaultUpdateType", QPYX_get_defaultUpdateType_YXQP, QPYX_set_defaultUpdateType_YXQP);
		L_YXQP.RegVar("defaultTimeScaleIndependent", QPYX_get_defaultTimeScaleIndependent_YXQP, QPYX_set_defaultTimeScaleIndependent_YXQP);
		L_YXQP.RegVar("defaultAutoPlay", QPYX_get_defaultAutoPlay_YXQP, QPYX_set_defaultAutoPlay_YXQP);
		L_YXQP.RegVar("defaultAutoKill", QPYX_get_defaultAutoKill_YXQP, QPYX_set_defaultAutoKill_YXQP);
		L_YXQP.RegVar("defaultLoopType", QPYX_get_defaultLoopType_YXQP, QPYX_set_defaultLoopType_YXQP);
		L_YXQP.RegVar("defaultRecyclable", QPYX_get_defaultRecyclable_YXQP, QPYX_set_defaultRecyclable_YXQP);
		L_YXQP.RegVar("defaultEaseType", QPYX_get_defaultEaseType_YXQP, QPYX_set_defaultEaseType_YXQP);
		L_YXQP.RegVar("defaultEaseOvershootOrAmplitude", QPYX_get_defaultEaseOvershootOrAmplitude_YXQP, QPYX_set_defaultEaseOvershootOrAmplitude_YXQP);
		L_YXQP.RegVar("defaultEasePeriod", QPYX_get_defaultEasePeriod_YXQP, QPYX_set_defaultEasePeriod_YXQP);
		L_YXQP.RegVar("logBehaviour", QPYX_get_logBehaviour_YXQP, QPYX_set_logBehaviour_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateDG_Tweening_DOTween_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				DG.Tweening.DOTween QPYX_obj_YXQP = new DG.Tweening.DOTween();
				ToLua.PushObject(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: DG.Tweening.DOTween.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Init_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				DG.Tweening.IDOTweenInit QPYX_o_YXQP = DG.Tweening.DOTween.Init();
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 1)
			{
				System.Nullable<bool> QPYX_arg0_YXQP = ToLua.CheckNullable<bool>(L_YXQP, 1);
				DG.Tweening.IDOTweenInit QPYX_o_YXQP = DG.Tweening.DOTween.Init(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				System.Nullable<bool> QPYX_arg0_YXQP = ToLua.CheckNullable<bool>(L_YXQP, 1);
				System.Nullable<bool> QPYX_arg1_YXQP = ToLua.CheckNullable<bool>(L_YXQP, 2);
				DG.Tweening.IDOTweenInit QPYX_o_YXQP = DG.Tweening.DOTween.Init(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				System.Nullable<bool> QPYX_arg0_YXQP = ToLua.CheckNullable<bool>(L_YXQP, 1);
				System.Nullable<bool> QPYX_arg1_YXQP = ToLua.CheckNullable<bool>(L_YXQP, 2);
				System.Nullable<DG.Tweening.LogBehaviour> QPYX_arg2_YXQP = ToLua.CheckNullable<DG.Tweening.LogBehaviour>(L_YXQP, 3);
				DG.Tweening.IDOTweenInit QPYX_o_YXQP = DG.Tweening.DOTween.Init(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.DOTween.Init");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetTweensCapacity_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 1);
			int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			DG.Tweening.DOTween.SetTweensCapacity(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Clear_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				DG.Tweening.DOTween.Clear();
				return 0;
			}
			else if (QPYX_count_YXQP == 1)
			{
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 1);
				DG.Tweening.DOTween.Clear(QPYX_arg0_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.DOTween.Clear");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ClearCachedTweens_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 0);
			DG.Tweening.DOTween.ClearCachedTweens();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Validate_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 0);
			int QPYX_o_YXQP = DG.Tweening.DOTween.Validate();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ManualUpdate_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 1);
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			DG.Tweening.DOTween.ManualUpdate(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_To_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<DG.Tweening.Core.DOGetter<UnityEngine.Quaternion>, DG.Tweening.Core.DOSetter<UnityEngine.Quaternion>, UnityEngine.Vector3, float>(L_YXQP, 1))
			{
				DG.Tweening.Core.DOGetter<UnityEngine.Quaternion> QPYX_arg0_YXQP = (DG.Tweening.Core.DOGetter<UnityEngine.Quaternion>)ToLua.ToObject(L_YXQP, 1);
				DG.Tweening.Core.DOSetter<UnityEngine.Quaternion> QPYX_arg1_YXQP = (DG.Tweening.Core.DOSetter<UnityEngine.Quaternion>)ToLua.ToObject(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg2_YXQP = ToLua.ToVector3(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 4);
				DG.Tweening.Core.TweenerCore<UnityEngine.Quaternion,UnityEngine.Vector3,DG.Tweening.Plugins.Options.QuaternionOptions> QPYX_o_YXQP = DG.Tweening.DOTween.To(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<DG.Tweening.Core.DOGetter<UnityEngine.Vector4>, DG.Tweening.Core.DOSetter<UnityEngine.Vector4>, UnityEngine.Vector4, float>(L_YXQP, 1))
			{
				DG.Tweening.Core.DOGetter<UnityEngine.Vector4> QPYX_arg0_YXQP = (DG.Tweening.Core.DOGetter<UnityEngine.Vector4>)ToLua.ToObject(L_YXQP, 1);
				DG.Tweening.Core.DOSetter<UnityEngine.Vector4> QPYX_arg1_YXQP = (DG.Tweening.Core.DOSetter<UnityEngine.Vector4>)ToLua.ToObject(L_YXQP, 2);
				UnityEngine.Vector4 QPYX_arg2_YXQP = ToLua.ToVector4(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 4);
				DG.Tweening.Core.TweenerCore<UnityEngine.Vector4,UnityEngine.Vector4,DG.Tweening.Plugins.Options.VectorOptions> QPYX_o_YXQP = DG.Tweening.DOTween.To(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<DG.Tweening.Core.DOGetter<UnityEngine.Vector3>, DG.Tweening.Core.DOSetter<UnityEngine.Vector3>, UnityEngine.Vector3, float>(L_YXQP, 1))
			{
				DG.Tweening.Core.DOGetter<UnityEngine.Vector3> QPYX_arg0_YXQP = (DG.Tweening.Core.DOGetter<UnityEngine.Vector3>)ToLua.ToObject(L_YXQP, 1);
				DG.Tweening.Core.DOSetter<UnityEngine.Vector3> QPYX_arg1_YXQP = (DG.Tweening.Core.DOSetter<UnityEngine.Vector3>)ToLua.ToObject(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg2_YXQP = ToLua.ToVector3(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 4);
				DG.Tweening.Core.TweenerCore<UnityEngine.Vector3,UnityEngine.Vector3,DG.Tweening.Plugins.Options.VectorOptions> QPYX_o_YXQP = DG.Tweening.DOTween.To(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<DG.Tweening.Core.DOGetter<UnityEngine.Color>, DG.Tweening.Core.DOSetter<UnityEngine.Color>, UnityEngine.Color, float>(L_YXQP, 1))
			{
				DG.Tweening.Core.DOGetter<UnityEngine.Color> QPYX_arg0_YXQP = (DG.Tweening.Core.DOGetter<UnityEngine.Color>)ToLua.ToObject(L_YXQP, 1);
				DG.Tweening.Core.DOSetter<UnityEngine.Color> QPYX_arg1_YXQP = (DG.Tweening.Core.DOSetter<UnityEngine.Color>)ToLua.ToObject(L_YXQP, 2);
				UnityEngine.Color QPYX_arg2_YXQP = ToLua.ToColor(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 4);
				DG.Tweening.Core.TweenerCore<UnityEngine.Color,UnityEngine.Color,DG.Tweening.Plugins.Options.ColorOptions> QPYX_o_YXQP = DG.Tweening.DOTween.To(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<DG.Tweening.Core.DOSetter<float>, float, float, float>(L_YXQP, 1))
			{
				DG.Tweening.Core.DOSetter<float> QPYX_arg0_YXQP = (DG.Tweening.Core.DOSetter<float>)ToLua.ToObject(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 4);
				DG.Tweening.Tweener QPYX_o_YXQP = DG.Tweening.DOTween.To(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<DG.Tweening.Core.DOGetter<UnityEngine.RectOffset>, DG.Tweening.Core.DOSetter<UnityEngine.RectOffset>, UnityEngine.RectOffset, float>(L_YXQP, 1))
			{
				DG.Tweening.Core.DOGetter<UnityEngine.RectOffset> QPYX_arg0_YXQP = (DG.Tweening.Core.DOGetter<UnityEngine.RectOffset>)ToLua.ToObject(L_YXQP, 1);
				DG.Tweening.Core.DOSetter<UnityEngine.RectOffset> QPYX_arg1_YXQP = (DG.Tweening.Core.DOSetter<UnityEngine.RectOffset>)ToLua.ToObject(L_YXQP, 2);
				UnityEngine.RectOffset QPYX_arg2_YXQP = (UnityEngine.RectOffset)ToLua.ToObject(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 4);
				DG.Tweening.Tweener QPYX_o_YXQP = DG.Tweening.DOTween.To(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<DG.Tweening.Core.DOGetter<UnityEngine.Rect>, DG.Tweening.Core.DOSetter<UnityEngine.Rect>, UnityEngine.Rect, float>(L_YXQP, 1))
			{
				DG.Tweening.Core.DOGetter<UnityEngine.Rect> QPYX_arg0_YXQP = (DG.Tweening.Core.DOGetter<UnityEngine.Rect>)ToLua.ToObject(L_YXQP, 1);
				DG.Tweening.Core.DOSetter<UnityEngine.Rect> QPYX_arg1_YXQP = (DG.Tweening.Core.DOSetter<UnityEngine.Rect>)ToLua.ToObject(L_YXQP, 2);
				UnityEngine.Rect QPYX_arg2_YXQP = StackTraits<UnityEngine.Rect>.To(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 4);
				DG.Tweening.Core.TweenerCore<UnityEngine.Rect,UnityEngine.Rect,DG.Tweening.Plugins.Options.RectOptions> QPYX_o_YXQP = DG.Tweening.DOTween.To(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<DG.Tweening.Core.DOGetter<UnityEngine.Vector2>, DG.Tweening.Core.DOSetter<UnityEngine.Vector2>, UnityEngine.Vector2, float>(L_YXQP, 1))
			{
				DG.Tweening.Core.DOGetter<UnityEngine.Vector2> QPYX_arg0_YXQP = (DG.Tweening.Core.DOGetter<UnityEngine.Vector2>)ToLua.ToObject(L_YXQP, 1);
				DG.Tweening.Core.DOSetter<UnityEngine.Vector2> QPYX_arg1_YXQP = (DG.Tweening.Core.DOSetter<UnityEngine.Vector2>)ToLua.ToObject(L_YXQP, 2);
				UnityEngine.Vector2 QPYX_arg2_YXQP = ToLua.ToVector2(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 4);
				DG.Tweening.Core.TweenerCore<UnityEngine.Vector2,UnityEngine.Vector2,DG.Tweening.Plugins.Options.VectorOptions> QPYX_o_YXQP = DG.Tweening.DOTween.To(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<DG.Tweening.Core.DOGetter<int>, DG.Tweening.Core.DOSetter<int>, int, float>(L_YXQP, 1))
			{
				DG.Tweening.Core.DOGetter<int> QPYX_arg0_YXQP = (DG.Tweening.Core.DOGetter<int>)ToLua.ToObject(L_YXQP, 1);
				DG.Tweening.Core.DOSetter<int> QPYX_arg1_YXQP = (DG.Tweening.Core.DOSetter<int>)ToLua.ToObject(L_YXQP, 2);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 4);
				DG.Tweening.Tweener QPYX_o_YXQP = DG.Tweening.DOTween.To(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<DG.Tweening.Core.DOGetter<double>, DG.Tweening.Core.DOSetter<double>, double, float>(L_YXQP, 1))
			{
				DG.Tweening.Core.DOGetter<double> QPYX_arg0_YXQP = (DG.Tweening.Core.DOGetter<double>)ToLua.ToObject(L_YXQP, 1);
				DG.Tweening.Core.DOSetter<double> QPYX_arg1_YXQP = (DG.Tweening.Core.DOSetter<double>)ToLua.ToObject(L_YXQP, 2);
				double QPYX_arg2_YXQP = (double)LuaDLL.lua_tonumber(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 4);
				DG.Tweening.Core.TweenerCore<double,double,DG.Tweening.Plugins.Options.NoOptions> QPYX_o_YXQP = DG.Tweening.DOTween.To(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<DG.Tweening.Core.DOGetter<float>, DG.Tweening.Core.DOSetter<float>, float, float>(L_YXQP, 1))
			{
				DG.Tweening.Core.DOGetter<float> QPYX_arg0_YXQP = (DG.Tweening.Core.DOGetter<float>)ToLua.ToObject(L_YXQP, 1);
				DG.Tweening.Core.DOSetter<float> QPYX_arg1_YXQP = (DG.Tweening.Core.DOSetter<float>)ToLua.ToObject(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 4);
				DG.Tweening.Core.TweenerCore<float,float,DG.Tweening.Plugins.Options.FloatOptions> QPYX_o_YXQP = DG.Tweening.DOTween.To(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<DG.Tweening.Core.DOGetter<uint>, DG.Tweening.Core.DOSetter<uint>, uint, float>(L_YXQP, 1))
			{
				DG.Tweening.Core.DOGetter<uint> QPYX_arg0_YXQP = (DG.Tweening.Core.DOGetter<uint>)ToLua.ToObject(L_YXQP, 1);
				DG.Tweening.Core.DOSetter<uint> QPYX_arg1_YXQP = (DG.Tweening.Core.DOSetter<uint>)ToLua.ToObject(L_YXQP, 2);
				uint QPYX_arg2_YXQP = (uint)LuaDLL.lua_tonumber(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 4);
				DG.Tweening.Tweener QPYX_o_YXQP = DG.Tweening.DOTween.To(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<DG.Tweening.Core.DOGetter<string>, DG.Tweening.Core.DOSetter<string>, string, float>(L_YXQP, 1))
			{
				DG.Tweening.Core.DOGetter<string> QPYX_arg0_YXQP = (DG.Tweening.Core.DOGetter<string>)ToLua.ToObject(L_YXQP, 1);
				DG.Tweening.Core.DOSetter<string> QPYX_arg1_YXQP = (DG.Tweening.Core.DOSetter<string>)ToLua.ToObject(L_YXQP, 2);
				string QPYX_arg2_YXQP = ToLua.ToString(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 4);
				DG.Tweening.Core.TweenerCore<string,string,DG.Tweening.Plugins.Options.StringOptions> QPYX_o_YXQP = DG.Tweening.DOTween.To(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<DG.Tweening.Core.DOGetter<long>, DG.Tweening.Core.DOSetter<long>, long, float>(L_YXQP, 1))
			{
				DG.Tweening.Core.DOGetter<long> QPYX_arg0_YXQP = (DG.Tweening.Core.DOGetter<long>)ToLua.ToObject(L_YXQP, 1);
				DG.Tweening.Core.DOSetter<long> QPYX_arg1_YXQP = (DG.Tweening.Core.DOSetter<long>)ToLua.ToObject(L_YXQP, 2);
				long QPYX_arg2_YXQP = LuaDLL.tolua_toint64(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 4);
				DG.Tweening.Tweener QPYX_o_YXQP = DG.Tweening.DOTween.To(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<DG.Tweening.Core.DOGetter<ulong>, DG.Tweening.Core.DOSetter<ulong>, ulong, float>(L_YXQP, 1))
			{
				DG.Tweening.Core.DOGetter<ulong> QPYX_arg0_YXQP = (DG.Tweening.Core.DOGetter<ulong>)ToLua.ToObject(L_YXQP, 1);
				DG.Tweening.Core.DOSetter<ulong> QPYX_arg1_YXQP = (DG.Tweening.Core.DOSetter<ulong>)ToLua.ToObject(L_YXQP, 2);
				ulong QPYX_arg2_YXQP = LuaDLL.tolua_touint64(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 4);
				DG.Tweening.Tweener QPYX_o_YXQP = DG.Tweening.DOTween.To(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.DOTween.To");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ToAxis_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 4)
			{
				DG.Tweening.Core.DOGetter<UnityEngine.Vector3> QPYX_arg0_YXQP = (DG.Tweening.Core.DOGetter<UnityEngine.Vector3>)ToLua.CheckDelegate<DG.Tweening.Core.DOGetter<UnityEngine.Vector3>>(L_YXQP, 1);
				DG.Tweening.Core.DOSetter<UnityEngine.Vector3> QPYX_arg1_YXQP = (DG.Tweening.Core.DOSetter<UnityEngine.Vector3>)ToLua.CheckDelegate<DG.Tweening.Core.DOSetter<UnityEngine.Vector3>>(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
				DG.Tweening.Core.TweenerCore<UnityEngine.Vector3,UnityEngine.Vector3,DG.Tweening.Plugins.Options.VectorOptions> QPYX_o_YXQP = DG.Tweening.DOTween.ToAxis(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5)
			{
				DG.Tweening.Core.DOGetter<UnityEngine.Vector3> QPYX_arg0_YXQP = (DG.Tweening.Core.DOGetter<UnityEngine.Vector3>)ToLua.CheckDelegate<DG.Tweening.Core.DOGetter<UnityEngine.Vector3>>(L_YXQP, 1);
				DG.Tweening.Core.DOSetter<UnityEngine.Vector3> QPYX_arg1_YXQP = (DG.Tweening.Core.DOSetter<UnityEngine.Vector3>)ToLua.CheckDelegate<DG.Tweening.Core.DOSetter<UnityEngine.Vector3>>(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
				DG.Tweening.AxisConstraint QPYX_arg4_YXQP = (DG.Tweening.AxisConstraint)ToLua.CheckObject(L_YXQP, 5, typeof(DG.Tweening.AxisConstraint));
				DG.Tweening.Core.TweenerCore<UnityEngine.Vector3,UnityEngine.Vector3,DG.Tweening.Plugins.Options.VectorOptions> QPYX_o_YXQP = DG.Tweening.DOTween.ToAxis(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.DOTween.ToAxis");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ToAlpha_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			DG.Tweening.Core.DOGetter<UnityEngine.Color> QPYX_arg0_YXQP = (DG.Tweening.Core.DOGetter<UnityEngine.Color>)ToLua.CheckDelegate<DG.Tweening.Core.DOGetter<UnityEngine.Color>>(L_YXQP, 1);
			DG.Tweening.Core.DOSetter<UnityEngine.Color> QPYX_arg1_YXQP = (DG.Tweening.Core.DOSetter<UnityEngine.Color>)ToLua.CheckDelegate<DG.Tweening.Core.DOSetter<UnityEngine.Color>>(L_YXQP, 2);
			float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			float QPYX_arg3_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
			DG.Tweening.Tweener QPYX_o_YXQP = DG.Tweening.DOTween.ToAlpha(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Punch_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 4)
			{
				DG.Tweening.Core.DOGetter<UnityEngine.Vector3> QPYX_arg0_YXQP = (DG.Tweening.Core.DOGetter<UnityEngine.Vector3>)ToLua.CheckDelegate<DG.Tweening.Core.DOGetter<UnityEngine.Vector3>>(L_YXQP, 1);
				DG.Tweening.Core.DOSetter<UnityEngine.Vector3> QPYX_arg1_YXQP = (DG.Tweening.Core.DOSetter<UnityEngine.Vector3>)ToLua.CheckDelegate<DG.Tweening.Core.DOSetter<UnityEngine.Vector3>>(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg2_YXQP = ToLua.ToVector3(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
				DG.Tweening.Core.TweenerCore<UnityEngine.Vector3,UnityEngine.Vector3[],DG.Tweening.Plugins.Options.Vector3ArrayOptions> QPYX_o_YXQP = DG.Tweening.DOTween.Punch(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5)
			{
				DG.Tweening.Core.DOGetter<UnityEngine.Vector3> QPYX_arg0_YXQP = (DG.Tweening.Core.DOGetter<UnityEngine.Vector3>)ToLua.CheckDelegate<DG.Tweening.Core.DOGetter<UnityEngine.Vector3>>(L_YXQP, 1);
				DG.Tweening.Core.DOSetter<UnityEngine.Vector3> QPYX_arg1_YXQP = (DG.Tweening.Core.DOSetter<UnityEngine.Vector3>)ToLua.CheckDelegate<DG.Tweening.Core.DOSetter<UnityEngine.Vector3>>(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg2_YXQP = ToLua.ToVector3(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
				int QPYX_arg4_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 5);
				DG.Tweening.Core.TweenerCore<UnityEngine.Vector3,UnityEngine.Vector3[],DG.Tweening.Plugins.Options.Vector3ArrayOptions> QPYX_o_YXQP = DG.Tweening.DOTween.Punch(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 6)
			{
				DG.Tweening.Core.DOGetter<UnityEngine.Vector3> QPYX_arg0_YXQP = (DG.Tweening.Core.DOGetter<UnityEngine.Vector3>)ToLua.CheckDelegate<DG.Tweening.Core.DOGetter<UnityEngine.Vector3>>(L_YXQP, 1);
				DG.Tweening.Core.DOSetter<UnityEngine.Vector3> QPYX_arg1_YXQP = (DG.Tweening.Core.DOSetter<UnityEngine.Vector3>)ToLua.CheckDelegate<DG.Tweening.Core.DOSetter<UnityEngine.Vector3>>(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg2_YXQP = ToLua.ToVector3(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
				int QPYX_arg4_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 5);
				float QPYX_arg5_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 6);
				DG.Tweening.Core.TweenerCore<UnityEngine.Vector3,UnityEngine.Vector3[],DG.Tweening.Plugins.Options.Vector3ArrayOptions> QPYX_o_YXQP = DG.Tweening.DOTween.Punch(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.DOTween.Punch");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Shake_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				DG.Tweening.Core.DOGetter<UnityEngine.Vector3> QPYX_arg0_YXQP = (DG.Tweening.Core.DOGetter<UnityEngine.Vector3>)ToLua.CheckDelegate<DG.Tweening.Core.DOGetter<UnityEngine.Vector3>>(L_YXQP, 1);
				DG.Tweening.Core.DOSetter<UnityEngine.Vector3> QPYX_arg1_YXQP = (DG.Tweening.Core.DOSetter<UnityEngine.Vector3>)ToLua.CheckDelegate<DG.Tweening.Core.DOSetter<UnityEngine.Vector3>>(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				DG.Tweening.Core.TweenerCore<UnityEngine.Vector3,UnityEngine.Vector3[],DG.Tweening.Plugins.Options.Vector3ArrayOptions> QPYX_o_YXQP = DG.Tweening.DOTween.Shake(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<float>(L_YXQP, 4))
			{
				DG.Tweening.Core.DOGetter<UnityEngine.Vector3> QPYX_arg0_YXQP = (DG.Tweening.Core.DOGetter<UnityEngine.Vector3>)ToLua.CheckDelegate<DG.Tweening.Core.DOGetter<UnityEngine.Vector3>>(L_YXQP, 1);
				DG.Tweening.Core.DOSetter<UnityEngine.Vector3> QPYX_arg1_YXQP = (DG.Tweening.Core.DOSetter<UnityEngine.Vector3>)ToLua.CheckDelegate<DG.Tweening.Core.DOSetter<UnityEngine.Vector3>>(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 4);
				DG.Tweening.Core.TweenerCore<UnityEngine.Vector3,UnityEngine.Vector3[],DG.Tweening.Plugins.Options.Vector3ArrayOptions> QPYX_o_YXQP = DG.Tweening.DOTween.Shake(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<UnityEngine.Vector3>(L_YXQP, 4))
			{
				DG.Tweening.Core.DOGetter<UnityEngine.Vector3> QPYX_arg0_YXQP = (DG.Tweening.Core.DOGetter<UnityEngine.Vector3>)ToLua.CheckDelegate<DG.Tweening.Core.DOGetter<UnityEngine.Vector3>>(L_YXQP, 1);
				DG.Tweening.Core.DOSetter<UnityEngine.Vector3> QPYX_arg1_YXQP = (DG.Tweening.Core.DOSetter<UnityEngine.Vector3>)ToLua.CheckDelegate<DG.Tweening.Core.DOSetter<UnityEngine.Vector3>>(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.Vector3 QPYX_arg3_YXQP = ToLua.ToVector3(L_YXQP, 4);
				DG.Tweening.Core.TweenerCore<UnityEngine.Vector3,UnityEngine.Vector3[],DG.Tweening.Plugins.Options.Vector3ArrayOptions> QPYX_o_YXQP = DG.Tweening.DOTween.Shake(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5 && TypeChecker.CheckTypes<UnityEngine.Vector3, int>(L_YXQP, 4))
			{
				DG.Tweening.Core.DOGetter<UnityEngine.Vector3> QPYX_arg0_YXQP = (DG.Tweening.Core.DOGetter<UnityEngine.Vector3>)ToLua.CheckDelegate<DG.Tweening.Core.DOGetter<UnityEngine.Vector3>>(L_YXQP, 1);
				DG.Tweening.Core.DOSetter<UnityEngine.Vector3> QPYX_arg1_YXQP = (DG.Tweening.Core.DOSetter<UnityEngine.Vector3>)ToLua.CheckDelegate<DG.Tweening.Core.DOSetter<UnityEngine.Vector3>>(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.Vector3 QPYX_arg3_YXQP = ToLua.ToVector3(L_YXQP, 4);
				int QPYX_arg4_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 5);
				DG.Tweening.Core.TweenerCore<UnityEngine.Vector3,UnityEngine.Vector3[],DG.Tweening.Plugins.Options.Vector3ArrayOptions> QPYX_o_YXQP = DG.Tweening.DOTween.Shake(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5 && TypeChecker.CheckTypes<float, int>(L_YXQP, 4))
			{
				DG.Tweening.Core.DOGetter<UnityEngine.Vector3> QPYX_arg0_YXQP = (DG.Tweening.Core.DOGetter<UnityEngine.Vector3>)ToLua.CheckDelegate<DG.Tweening.Core.DOGetter<UnityEngine.Vector3>>(L_YXQP, 1);
				DG.Tweening.Core.DOSetter<UnityEngine.Vector3> QPYX_arg1_YXQP = (DG.Tweening.Core.DOSetter<UnityEngine.Vector3>)ToLua.CheckDelegate<DG.Tweening.Core.DOSetter<UnityEngine.Vector3>>(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 4);
				int QPYX_arg4_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 5);
				DG.Tweening.Core.TweenerCore<UnityEngine.Vector3,UnityEngine.Vector3[],DG.Tweening.Plugins.Options.Vector3ArrayOptions> QPYX_o_YXQP = DG.Tweening.DOTween.Shake(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 6 && TypeChecker.CheckTypes<UnityEngine.Vector3, int, float>(L_YXQP, 4))
			{
				DG.Tweening.Core.DOGetter<UnityEngine.Vector3> QPYX_arg0_YXQP = (DG.Tweening.Core.DOGetter<UnityEngine.Vector3>)ToLua.CheckDelegate<DG.Tweening.Core.DOGetter<UnityEngine.Vector3>>(L_YXQP, 1);
				DG.Tweening.Core.DOSetter<UnityEngine.Vector3> QPYX_arg1_YXQP = (DG.Tweening.Core.DOSetter<UnityEngine.Vector3>)ToLua.CheckDelegate<DG.Tweening.Core.DOSetter<UnityEngine.Vector3>>(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.Vector3 QPYX_arg3_YXQP = ToLua.ToVector3(L_YXQP, 4);
				int QPYX_arg4_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 5);
				float QPYX_arg5_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 6);
				DG.Tweening.Core.TweenerCore<UnityEngine.Vector3,UnityEngine.Vector3[],DG.Tweening.Plugins.Options.Vector3ArrayOptions> QPYX_o_YXQP = DG.Tweening.DOTween.Shake(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 6 && TypeChecker.CheckTypes<float, int, float>(L_YXQP, 4))
			{
				DG.Tweening.Core.DOGetter<UnityEngine.Vector3> QPYX_arg0_YXQP = (DG.Tweening.Core.DOGetter<UnityEngine.Vector3>)ToLua.CheckDelegate<DG.Tweening.Core.DOGetter<UnityEngine.Vector3>>(L_YXQP, 1);
				DG.Tweening.Core.DOSetter<UnityEngine.Vector3> QPYX_arg1_YXQP = (DG.Tweening.Core.DOSetter<UnityEngine.Vector3>)ToLua.CheckDelegate<DG.Tweening.Core.DOSetter<UnityEngine.Vector3>>(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 4);
				int QPYX_arg4_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 5);
				float QPYX_arg5_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 6);
				DG.Tweening.Core.TweenerCore<UnityEngine.Vector3,UnityEngine.Vector3[],DG.Tweening.Plugins.Options.Vector3ArrayOptions> QPYX_o_YXQP = DG.Tweening.DOTween.Shake(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 7 && TypeChecker.CheckTypes<float, int, float, bool>(L_YXQP, 4))
			{
				DG.Tweening.Core.DOGetter<UnityEngine.Vector3> QPYX_arg0_YXQP = (DG.Tweening.Core.DOGetter<UnityEngine.Vector3>)ToLua.CheckDelegate<DG.Tweening.Core.DOGetter<UnityEngine.Vector3>>(L_YXQP, 1);
				DG.Tweening.Core.DOSetter<UnityEngine.Vector3> QPYX_arg1_YXQP = (DG.Tweening.Core.DOSetter<UnityEngine.Vector3>)ToLua.CheckDelegate<DG.Tweening.Core.DOSetter<UnityEngine.Vector3>>(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 4);
				int QPYX_arg4_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 5);
				float QPYX_arg5_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 6);
				bool QPYX_arg6_YXQP = LuaDLL.lua_toboolean(L_YXQP, 7);
				DG.Tweening.Core.TweenerCore<UnityEngine.Vector3,UnityEngine.Vector3[],DG.Tweening.Plugins.Options.Vector3ArrayOptions> QPYX_o_YXQP = DG.Tweening.DOTween.Shake(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP, QPYX_arg6_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 7 && TypeChecker.CheckTypes<UnityEngine.Vector3, int, float, bool>(L_YXQP, 4))
			{
				DG.Tweening.Core.DOGetter<UnityEngine.Vector3> QPYX_arg0_YXQP = (DG.Tweening.Core.DOGetter<UnityEngine.Vector3>)ToLua.CheckDelegate<DG.Tweening.Core.DOGetter<UnityEngine.Vector3>>(L_YXQP, 1);
				DG.Tweening.Core.DOSetter<UnityEngine.Vector3> QPYX_arg1_YXQP = (DG.Tweening.Core.DOSetter<UnityEngine.Vector3>)ToLua.CheckDelegate<DG.Tweening.Core.DOSetter<UnityEngine.Vector3>>(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.Vector3 QPYX_arg3_YXQP = ToLua.ToVector3(L_YXQP, 4);
				int QPYX_arg4_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 5);
				float QPYX_arg5_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 6);
				bool QPYX_arg6_YXQP = LuaDLL.lua_toboolean(L_YXQP, 7);
				DG.Tweening.Core.TweenerCore<UnityEngine.Vector3,UnityEngine.Vector3[],DG.Tweening.Plugins.Options.Vector3ArrayOptions> QPYX_o_YXQP = DG.Tweening.DOTween.Shake(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP, QPYX_arg6_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 8)
			{
				DG.Tweening.Core.DOGetter<UnityEngine.Vector3> QPYX_arg0_YXQP = (DG.Tweening.Core.DOGetter<UnityEngine.Vector3>)ToLua.CheckDelegate<DG.Tweening.Core.DOGetter<UnityEngine.Vector3>>(L_YXQP, 1);
				DG.Tweening.Core.DOSetter<UnityEngine.Vector3> QPYX_arg1_YXQP = (DG.Tweening.Core.DOSetter<UnityEngine.Vector3>)ToLua.CheckDelegate<DG.Tweening.Core.DOSetter<UnityEngine.Vector3>>(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
				int QPYX_arg4_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 5);
				float QPYX_arg5_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 6);
				bool QPYX_arg6_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 7);
				bool QPYX_arg7_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 8);
				DG.Tweening.Core.TweenerCore<UnityEngine.Vector3,UnityEngine.Vector3[],DG.Tweening.Plugins.Options.Vector3ArrayOptions> QPYX_o_YXQP = DG.Tweening.DOTween.Shake(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP, QPYX_arg6_YXQP, QPYX_arg7_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.DOTween.Shake");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ToArray_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			DG.Tweening.Core.DOGetter<UnityEngine.Vector3> QPYX_arg0_YXQP = (DG.Tweening.Core.DOGetter<UnityEngine.Vector3>)ToLua.CheckDelegate<DG.Tweening.Core.DOGetter<UnityEngine.Vector3>>(L_YXQP, 1);
			DG.Tweening.Core.DOSetter<UnityEngine.Vector3> QPYX_arg1_YXQP = (DG.Tweening.Core.DOSetter<UnityEngine.Vector3>)ToLua.CheckDelegate<DG.Tweening.Core.DOSetter<UnityEngine.Vector3>>(L_YXQP, 2);
			UnityEngine.Vector3[] QPYX_arg2_YXQP = ToLua.CheckStructArray<UnityEngine.Vector3>(L_YXQP, 3);
			float[] QPYX_arg3_YXQP = ToLua.CheckNumberArray<float>(L_YXQP, 4);
			DG.Tweening.Core.TweenerCore<UnityEngine.Vector3,UnityEngine.Vector3[],DG.Tweening.Plugins.Options.Vector3ArrayOptions> QPYX_o_YXQP = DG.Tweening.DOTween.ToArray(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Sequence_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 0);
			DG.Tweening.Sequence QPYX_o_YXQP = DG.Tweening.DOTween.Sequence();
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CompleteAll_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				int QPYX_o_YXQP = DG.Tweening.DOTween.CompleteAll();
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 1)
			{
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 1);
				int QPYX_o_YXQP = DG.Tweening.DOTween.CompleteAll(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.DOTween.CompleteAll");
			}
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
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 1);
				int QPYX_o_YXQP = DG.Tweening.DOTween.Complete(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 1);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				int QPYX_o_YXQP = DG.Tweening.DOTween.Complete(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.DOTween.Complete");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_FlipAll_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 0);
			int QPYX_o_YXQP = DG.Tweening.DOTween.FlipAll();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
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
			object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 1);
			int QPYX_o_YXQP = DG.Tweening.DOTween.Flip(QPYX_arg0_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GotoAll_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 1);
				int QPYX_o_YXQP = DG.Tweening.DOTween.GotoAll(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 1);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				int QPYX_o_YXQP = DG.Tweening.DOTween.GotoAll(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.DOTween.GotoAll");
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
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				int QPYX_o_YXQP = DG.Tweening.DOTween.Goto(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				bool QPYX_arg2_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				int QPYX_o_YXQP = DG.Tweening.DOTween.Goto(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.DOTween.Goto");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_KillAll_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				int QPYX_o_YXQP = DG.Tweening.DOTween.KillAll();
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 1 && TypeChecker.CheckTypes<bool>(L_YXQP, 1))
			{
				bool QPYX_arg0_YXQP = LuaDLL.lua_toboolean(L_YXQP, 1);
				int QPYX_o_YXQP = DG.Tweening.DOTween.KillAll(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (TypeChecker.CheckTypes<bool>(L_YXQP, 1) && TypeChecker.CheckParamsType<object>(L_YXQP, 2, QPYX_count_YXQP - 1))
			{
				bool QPYX_arg0_YXQP = LuaDLL.lua_toboolean(L_YXQP, 1);
				object[] QPYX_arg1_YXQP = ToLua.ToParamsObject(L_YXQP, 2, QPYX_count_YXQP - 1);
				int QPYX_o_YXQP = DG.Tweening.DOTween.KillAll(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.DOTween.KillAll");
			}
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
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 1);
				int QPYX_o_YXQP = DG.Tweening.DOTween.Kill(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 1);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				int QPYX_o_YXQP = DG.Tweening.DOTween.Kill(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.DOTween.Kill");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_PauseAll_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 0);
			int QPYX_o_YXQP = DG.Tweening.DOTween.PauseAll();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
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
			object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 1);
			int QPYX_o_YXQP = DG.Tweening.DOTween.Pause(QPYX_arg0_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_PlayAll_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 0);
			int QPYX_o_YXQP = DG.Tweening.DOTween.PlayAll();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Play_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 1);
				int QPYX_o_YXQP = DG.Tweening.DOTween.Play(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 1);
				object QPYX_arg1_YXQP = ToLua.ToVarObject(L_YXQP, 2);
				int QPYX_o_YXQP = DG.Tweening.DOTween.Play(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.DOTween.Play");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_PlayBackwardsAll_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 0);
			int QPYX_o_YXQP = DG.Tweening.DOTween.PlayBackwardsAll();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_PlayBackwards_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 1);
				int QPYX_o_YXQP = DG.Tweening.DOTween.PlayBackwards(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 1);
				object QPYX_arg1_YXQP = ToLua.ToVarObject(L_YXQP, 2);
				int QPYX_o_YXQP = DG.Tweening.DOTween.PlayBackwards(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.DOTween.PlayBackwards");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_PlayForwardAll_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 0);
			int QPYX_o_YXQP = DG.Tweening.DOTween.PlayForwardAll();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_PlayForward_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 1);
				int QPYX_o_YXQP = DG.Tweening.DOTween.PlayForward(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 1);
				object QPYX_arg1_YXQP = ToLua.ToVarObject(L_YXQP, 2);
				int QPYX_o_YXQP = DG.Tweening.DOTween.PlayForward(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.DOTween.PlayForward");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_RestartAll_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				int QPYX_o_YXQP = DG.Tweening.DOTween.RestartAll();
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 1)
			{
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 1);
				int QPYX_o_YXQP = DG.Tweening.DOTween.RestartAll(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.DOTween.RestartAll");
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
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 1);
				int QPYX_o_YXQP = DG.Tweening.DOTween.Restart(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<bool>(L_YXQP, 2))
			{
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 1);
				bool QPYX_arg1_YXQP = LuaDLL.lua_toboolean(L_YXQP, 2);
				int QPYX_o_YXQP = DG.Tweening.DOTween.Restart(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<object>(L_YXQP, 2))
			{
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 1);
				object QPYX_arg1_YXQP = ToLua.ToVarObject(L_YXQP, 2);
				int QPYX_o_YXQP = DG.Tweening.DOTween.Restart(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<bool, float>(L_YXQP, 2))
			{
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 1);
				bool QPYX_arg1_YXQP = LuaDLL.lua_toboolean(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				int QPYX_o_YXQP = DG.Tweening.DOTween.Restart(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<object, bool>(L_YXQP, 2))
			{
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 1);
				object QPYX_arg1_YXQP = ToLua.ToVarObject(L_YXQP, 2);
				bool QPYX_arg2_YXQP = LuaDLL.lua_toboolean(L_YXQP, 3);
				int QPYX_o_YXQP = DG.Tweening.DOTween.Restart(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 1);
				object QPYX_arg1_YXQP = ToLua.ToVarObject(L_YXQP, 2);
				bool QPYX_arg2_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
				int QPYX_o_YXQP = DG.Tweening.DOTween.Restart(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.DOTween.Restart");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_RewindAll_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				int QPYX_o_YXQP = DG.Tweening.DOTween.RewindAll();
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 1)
			{
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 1);
				int QPYX_o_YXQP = DG.Tweening.DOTween.RewindAll(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.DOTween.RewindAll");
			}
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
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 1);
				int QPYX_o_YXQP = DG.Tweening.DOTween.Rewind(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 1);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				int QPYX_o_YXQP = DG.Tweening.DOTween.Rewind(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.DOTween.Rewind");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SmoothRewindAll_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 0);
			int QPYX_o_YXQP = DG.Tweening.DOTween.SmoothRewindAll();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
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
			object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 1);
			int QPYX_o_YXQP = DG.Tweening.DOTween.SmoothRewind(QPYX_arg0_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_TogglePauseAll_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 0);
			int QPYX_o_YXQP = DG.Tweening.DOTween.TogglePauseAll();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
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
			object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 1);
			int QPYX_o_YXQP = DG.Tweening.DOTween.TogglePause(QPYX_arg0_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IsTweening_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 1);
				bool QPYX_o_YXQP = DG.Tweening.DOTween.IsTweening(QPYX_arg0_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 1);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				bool QPYX_o_YXQP = DG.Tweening.DOTween.IsTweening(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.DOTween.IsTweening");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_TotalPlayingTweens_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 0);
			int QPYX_o_YXQP = DG.Tweening.DOTween.TotalPlayingTweens();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_PlayingTweens_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 0);
			System.Collections.Generic.List<DG.Tweening.Tween> QPYX_o_YXQP = DG.Tweening.DOTween.PlayingTweens();
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_PausedTweens_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 0);
			System.Collections.Generic.List<DG.Tweening.Tween> QPYX_o_YXQP = DG.Tweening.DOTween.PausedTweens();
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_TweensById_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 1);
				System.Collections.Generic.List<DG.Tweening.Tween> QPYX_o_YXQP = DG.Tweening.DOTween.TweensById(QPYX_arg0_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 1);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				System.Collections.Generic.List<DG.Tweening.Tween> QPYX_o_YXQP = DG.Tweening.DOTween.TweensById(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.DOTween.TweensById");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_TweensByTarget_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 1);
				System.Collections.Generic.List<DG.Tweening.Tween> QPYX_o_YXQP = DG.Tweening.DOTween.TweensByTarget(QPYX_arg0_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 1);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				System.Collections.Generic.List<DG.Tweening.Tween> QPYX_o_YXQP = DG.Tweening.DOTween.TweensByTarget(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.DOTween.TweensByTarget");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_Version_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushstring(L_YXQP, DG.Tweening.DOTween.Version);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_useSafeMode_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushboolean(L_YXQP, DG.Tweening.DOTween.useSafeMode);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_showUnityEditorReport_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushboolean(L_YXQP, DG.Tweening.DOTween.showUnityEditorReport);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_timeScale_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushnumber(L_YXQP, DG.Tweening.DOTween.timeScale);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_useSmoothDeltaTime_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushboolean(L_YXQP, DG.Tweening.DOTween.useSmoothDeltaTime);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_maxSmoothUnscaledTime_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushnumber(L_YXQP, DG.Tweening.DOTween.maxSmoothUnscaledTime);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_drawGizmos_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushboolean(L_YXQP, DG.Tweening.DOTween.drawGizmos);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_defaultUpdateType_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, DG.Tweening.DOTween.defaultUpdateType);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_defaultTimeScaleIndependent_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushboolean(L_YXQP, DG.Tweening.DOTween.defaultTimeScaleIndependent);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_defaultAutoPlay_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, DG.Tweening.DOTween.defaultAutoPlay);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_defaultAutoKill_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushboolean(L_YXQP, DG.Tweening.DOTween.defaultAutoKill);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_defaultLoopType_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, DG.Tweening.DOTween.defaultLoopType);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_defaultRecyclable_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushboolean(L_YXQP, DG.Tweening.DOTween.defaultRecyclable);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_defaultEaseType_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, DG.Tweening.DOTween.defaultEaseType);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_defaultEaseOvershootOrAmplitude_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushnumber(L_YXQP, DG.Tweening.DOTween.defaultEaseOvershootOrAmplitude);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_defaultEasePeriod_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushnumber(L_YXQP, DG.Tweening.DOTween.defaultEasePeriod);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_logBehaviour_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, DG.Tweening.DOTween.logBehaviour);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_useSafeMode_YXQP(IntPtr L_YXQP)
	{
		try
		{
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			DG.Tweening.DOTween.useSafeMode = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_showUnityEditorReport_YXQP(IntPtr L_YXQP)
	{
		try
		{
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			DG.Tweening.DOTween.showUnityEditorReport = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_timeScale_YXQP(IntPtr L_YXQP)
	{
		try
		{
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			DG.Tweening.DOTween.timeScale = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_useSmoothDeltaTime_YXQP(IntPtr L_YXQP)
	{
		try
		{
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			DG.Tweening.DOTween.useSmoothDeltaTime = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_maxSmoothUnscaledTime_YXQP(IntPtr L_YXQP)
	{
		try
		{
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			DG.Tweening.DOTween.maxSmoothUnscaledTime = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_drawGizmos_YXQP(IntPtr L_YXQP)
	{
		try
		{
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			DG.Tweening.DOTween.drawGizmos = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_defaultUpdateType_YXQP(IntPtr L_YXQP)
	{
		try
		{
			DG.Tweening.UpdateType QPYX_arg0_YXQP = (DG.Tweening.UpdateType)ToLua.CheckObject(L_YXQP, 2, typeof(DG.Tweening.UpdateType));
			DG.Tweening.DOTween.defaultUpdateType = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_defaultTimeScaleIndependent_YXQP(IntPtr L_YXQP)
	{
		try
		{
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			DG.Tweening.DOTween.defaultTimeScaleIndependent = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_defaultAutoPlay_YXQP(IntPtr L_YXQP)
	{
		try
		{
			DG.Tweening.AutoPlay QPYX_arg0_YXQP = (DG.Tweening.AutoPlay)ToLua.CheckObject(L_YXQP, 2, typeof(DG.Tweening.AutoPlay));
			DG.Tweening.DOTween.defaultAutoPlay = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_defaultAutoKill_YXQP(IntPtr L_YXQP)
	{
		try
		{
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			DG.Tweening.DOTween.defaultAutoKill = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_defaultLoopType_YXQP(IntPtr L_YXQP)
	{
		try
		{
			DG.Tweening.LoopType QPYX_arg0_YXQP = (DG.Tweening.LoopType)ToLua.CheckObject(L_YXQP, 2, typeof(DG.Tweening.LoopType));
			DG.Tweening.DOTween.defaultLoopType = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_defaultRecyclable_YXQP(IntPtr L_YXQP)
	{
		try
		{
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			DG.Tweening.DOTween.defaultRecyclable = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_defaultEaseType_YXQP(IntPtr L_YXQP)
	{
		try
		{
			DG.Tweening.Ease QPYX_arg0_YXQP = (DG.Tweening.Ease)ToLua.CheckObject(L_YXQP, 2, typeof(DG.Tweening.Ease));
			DG.Tweening.DOTween.defaultEaseType = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_defaultEaseOvershootOrAmplitude_YXQP(IntPtr L_YXQP)
	{
		try
		{
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			DG.Tweening.DOTween.defaultEaseOvershootOrAmplitude = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_defaultEasePeriod_YXQP(IntPtr L_YXQP)
	{
		try
		{
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			DG.Tweening.DOTween.defaultEasePeriod = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_logBehaviour_YXQP(IntPtr L_YXQP)
	{
		try
		{
			DG.Tweening.LogBehaviour QPYX_arg0_YXQP = (DG.Tweening.LogBehaviour)ToLua.CheckObject(L_YXQP, 2, typeof(DG.Tweening.LogBehaviour));
			DG.Tweening.DOTween.logBehaviour = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}
}

