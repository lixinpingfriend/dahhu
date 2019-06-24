using System;
using DG.Tweening;
using LuaInterface;

public class QPYX_UnityEngine_AudioSourceWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.AudioSource), typeof(UnityEngine.Behaviour));
		L_YXQP.RegFunction("Play", QPYX_Play_YXQP);
		L_YXQP.RegFunction("PlayDelayed", QPYX_PlayDelayed_YXQP);
		L_YXQP.RegFunction("PlayScheduled", QPYX_PlayScheduled_YXQP);
		L_YXQP.RegFunction("SetScheduledStartTime", QPYX_SetScheduledStartTime_YXQP);
		L_YXQP.RegFunction("SetScheduledEndTime", QPYX_SetScheduledEndTime_YXQP);
		L_YXQP.RegFunction("Stop", QPYX_Stop_YXQP);
		L_YXQP.RegFunction("Pause", QPYX_Pause_YXQP);
		L_YXQP.RegFunction("UnPause", QPYX_UnPause_YXQP);
		L_YXQP.RegFunction("PlayOneShot", QPYX_PlayOneShot_YXQP);
		L_YXQP.RegFunction("PlayClipAtPoint", QPYX_PlayClipAtPoint_YXQP);
		L_YXQP.RegFunction("SetCustomCurve", QPYX_SetCustomCurve_YXQP);
		L_YXQP.RegFunction("GetCustomCurve", QPYX_GetCustomCurve_YXQP);
		L_YXQP.RegFunction("GetOutputData", QPYX_GetOutputData_YXQP);
		L_YXQP.RegFunction("GetSpectrumData", QPYX_GetSpectrumData_YXQP);
		L_YXQP.RegFunction("SetSpatializerFloat", QPYX_SetSpatializerFloat_YXQP);
		L_YXQP.RegFunction("GetSpatializerFloat", QPYX_GetSpatializerFloat_YXQP);
		L_YXQP.RegFunction("SetAmbisonicDecoderFloat", QPYX_SetAmbisonicDecoderFloat_YXQP);
		L_YXQP.RegFunction("GetAmbisonicDecoderFloat", QPYX_GetAmbisonicDecoderFloat_YXQP);
		L_YXQP.RegFunction("DOTogglePause", QPYX_DOTogglePause_YXQP);
		L_YXQP.RegFunction("DOSmoothRewind", QPYX_DOSmoothRewind_YXQP);
		L_YXQP.RegFunction("DORewind", QPYX_DORewind_YXQP);
		L_YXQP.RegFunction("DORestart", QPYX_DORestart_YXQP);
		L_YXQP.RegFunction("DOPlayForward", QPYX_DOPlayForward_YXQP);
		L_YXQP.RegFunction("DOPlayBackwards", QPYX_DOPlayBackwards_YXQP);
		L_YXQP.RegFunction("DOPlay", QPYX_DOPlay_YXQP);
		L_YXQP.RegFunction("DOPause", QPYX_DOPause_YXQP);
		L_YXQP.RegFunction("DOGoto", QPYX_DOGoto_YXQP);
		L_YXQP.RegFunction("DOFlip", QPYX_DOFlip_YXQP);
		L_YXQP.RegFunction("DOKill", QPYX_DOKill_YXQP);
		L_YXQP.RegFunction("DOComplete", QPYX_DOComplete_YXQP);
		L_YXQP.RegFunction("DOPitch", QPYX_DOPitch_YXQP);
		L_YXQP.RegFunction("DOFade", QPYX_DOFade_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateUnityEngine_AudioSource_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("volume", QPYX_get_volume_YXQP, QPYX_set_volume_YXQP);
		L_YXQP.RegVar("pitch", QPYX_get_pitch_YXQP, QPYX_set_pitch_YXQP);
		L_YXQP.RegVar("time", QPYX_get_time_YXQP, QPYX_set_time_YXQP);
		L_YXQP.RegVar("timeSamples", QPYX_get_timeSamples_YXQP, QPYX_set_timeSamples_YXQP);
		L_YXQP.RegVar("clip", QPYX_get_clip_YXQP, QPYX_set_clip_YXQP);
		L_YXQP.RegVar("outputAudioMixerGroup", QPYX_get_outputAudioMixerGroup_YXQP, QPYX_set_outputAudioMixerGroup_YXQP);
		L_YXQP.RegVar("isPlaying", QPYX_get_isPlaying_YXQP, null);
		L_YXQP.RegVar("isVirtual", QPYX_get_isVirtual_YXQP, null);
		L_YXQP.RegVar("loop", QPYX_get_loop_YXQP, QPYX_set_loop_YXQP);
		L_YXQP.RegVar("ignoreListenerVolume", QPYX_get_ignoreListenerVolume_YXQP, QPYX_set_ignoreListenerVolume_YXQP);
		L_YXQP.RegVar("playOnAwake", QPYX_get_playOnAwake_YXQP, QPYX_set_playOnAwake_YXQP);
		L_YXQP.RegVar("ignoreListenerPause", QPYX_get_ignoreListenerPause_YXQP, QPYX_set_ignoreListenerPause_YXQP);
		L_YXQP.RegVar("velocityUpdateMode", QPYX_get_velocityUpdateMode_YXQP, QPYX_set_velocityUpdateMode_YXQP);
		L_YXQP.RegVar("panStereo", QPYX_get_panStereo_YXQP, QPYX_set_panStereo_YXQP);
		L_YXQP.RegVar("spatialBlend", QPYX_get_spatialBlend_YXQP, QPYX_set_spatialBlend_YXQP);
		L_YXQP.RegVar("spatialize", QPYX_get_spatialize_YXQP, QPYX_set_spatialize_YXQP);
		L_YXQP.RegVar("spatializePostEffects", QPYX_get_spatializePostEffects_YXQP, QPYX_set_spatializePostEffects_YXQP);
		L_YXQP.RegVar("reverbZoneMix", QPYX_get_reverbZoneMix_YXQP, QPYX_set_reverbZoneMix_YXQP);
		L_YXQP.RegVar("bypassEffects", QPYX_get_bypassEffects_YXQP, QPYX_set_bypassEffects_YXQP);
		L_YXQP.RegVar("bypassListenerEffects", QPYX_get_bypassListenerEffects_YXQP, QPYX_set_bypassListenerEffects_YXQP);
		L_YXQP.RegVar("bypassReverbZones", QPYX_get_bypassReverbZones_YXQP, QPYX_set_bypassReverbZones_YXQP);
		L_YXQP.RegVar("dopplerLevel", QPYX_get_dopplerLevel_YXQP, QPYX_set_dopplerLevel_YXQP);
		L_YXQP.RegVar("spread", QPYX_get_spread_YXQP, QPYX_set_spread_YXQP);
		L_YXQP.RegVar("priority", QPYX_get_priority_YXQP, QPYX_set_priority_YXQP);
		L_YXQP.RegVar("mute", QPYX_get_mute_YXQP, QPYX_set_mute_YXQP);
		L_YXQP.RegVar("minDistance", QPYX_get_minDistance_YXQP, QPYX_set_minDistance_YXQP);
		L_YXQP.RegVar("maxDistance", QPYX_get_maxDistance_YXQP, QPYX_set_maxDistance_YXQP);
		L_YXQP.RegVar("rolloffMode", QPYX_get_rolloffMode_YXQP, QPYX_set_rolloffMode_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUnityEngine_AudioSource_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				UnityEngine.AudioSource QPYX_obj_YXQP = new UnityEngine.AudioSource();
				ToLua.PushSealed(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UnityEngine.AudioSource.New");
			}
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
				UnityEngine.AudioSource  QPYX_obj_YXQP  = (UnityEngine.AudioSource)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioSource));
				QPYX_obj_YXQP.Play();
				return 0;
			}
			else if (QPYX_count_YXQP == 2)
			{
				UnityEngine.AudioSource  QPYX_obj_YXQP  = (UnityEngine.AudioSource)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioSource));
				ulong QPYX_arg0_YXQP = LuaDLL.tolua_checkuint64(L_YXQP, 2);
				QPYX_obj_YXQP.Play(QPYX_arg0_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.AudioSource.Play");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_PlayDelayed_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.AudioSource  QPYX_obj_YXQP  = (UnityEngine.AudioSource)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioSource));
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.PlayDelayed(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_PlayScheduled_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.AudioSource  QPYX_obj_YXQP  = (UnityEngine.AudioSource)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioSource));
			double QPYX_arg0_YXQP = (double)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.PlayScheduled(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetScheduledStartTime_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.AudioSource  QPYX_obj_YXQP  = (UnityEngine.AudioSource)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioSource));
			double QPYX_arg0_YXQP = (double)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.SetScheduledStartTime(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetScheduledEndTime_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.AudioSource  QPYX_obj_YXQP  = (UnityEngine.AudioSource)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioSource));
			double QPYX_arg0_YXQP = (double)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.SetScheduledEndTime(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Stop_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.AudioSource  QPYX_obj_YXQP  = (UnityEngine.AudioSource)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioSource));
			QPYX_obj_YXQP.Stop();
			return 0;
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
			UnityEngine.AudioSource  QPYX_obj_YXQP  = (UnityEngine.AudioSource)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioSource));
			QPYX_obj_YXQP.Pause();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UnPause_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.AudioSource  QPYX_obj_YXQP  = (UnityEngine.AudioSource)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioSource));
			QPYX_obj_YXQP.UnPause();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_PlayOneShot_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.AudioSource  QPYX_obj_YXQP  = (UnityEngine.AudioSource)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioSource));
				UnityEngine.AudioClip QPYX_arg0_YXQP = (UnityEngine.AudioClip)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.AudioClip));
				QPYX_obj_YXQP.PlayOneShot(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.AudioSource  QPYX_obj_YXQP  = (UnityEngine.AudioSource)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioSource));
				UnityEngine.AudioClip QPYX_arg0_YXQP = (UnityEngine.AudioClip)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.AudioClip));
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				QPYX_obj_YXQP.PlayOneShot(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.AudioSource.PlayOneShot");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_PlayClipAtPoint_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.AudioClip QPYX_arg0_YXQP = (UnityEngine.AudioClip)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioClip));
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.AudioSource.PlayClipAtPoint(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.AudioClip QPYX_arg0_YXQP = (UnityEngine.AudioClip)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioClip));
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.AudioSource.PlayClipAtPoint(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.AudioSource.PlayClipAtPoint");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetCustomCurve_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.AudioSource  QPYX_obj_YXQP  = (UnityEngine.AudioSource)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioSource));
			UnityEngine.AudioSourceCurveType QPYX_arg0_YXQP = (UnityEngine.AudioSourceCurveType)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.AudioSourceCurveType));
			UnityEngine.AnimationCurve QPYX_arg1_YXQP = (UnityEngine.AnimationCurve)ToLua.CheckObject(L_YXQP, 3, typeof(UnityEngine.AnimationCurve));
			QPYX_obj_YXQP.SetCustomCurve(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetCustomCurve_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.AudioSource  QPYX_obj_YXQP  = (UnityEngine.AudioSource)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioSource));
			UnityEngine.AudioSourceCurveType QPYX_arg0_YXQP = (UnityEngine.AudioSourceCurveType)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.AudioSourceCurveType));
			UnityEngine.AnimationCurve QPYX_o_YXQP = QPYX_obj_YXQP.GetCustomCurve(QPYX_arg0_YXQP);
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetOutputData_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.AudioSource  QPYX_obj_YXQP  = (UnityEngine.AudioSource)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioSource));
			float[] QPYX_arg0_YXQP = ToLua.CheckNumberArray<float>(L_YXQP, 2);
			int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
			QPYX_obj_YXQP.GetOutputData(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetSpectrumData_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			UnityEngine.AudioSource  QPYX_obj_YXQP  = (UnityEngine.AudioSource)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioSource));
			float[] QPYX_arg0_YXQP = ToLua.CheckNumberArray<float>(L_YXQP, 2);
			int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
			UnityEngine.FFTWindow QPYX_arg2_YXQP = (UnityEngine.FFTWindow)ToLua.CheckObject(L_YXQP, 4, typeof(UnityEngine.FFTWindow));
			QPYX_obj_YXQP.GetSpectrumData(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetSpatializerFloat_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.AudioSource  QPYX_obj_YXQP  = (UnityEngine.AudioSource)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioSource));
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.SetSpatializerFloat(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetSpatializerFloat_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.AudioSource  QPYX_obj_YXQP  = (UnityEngine.AudioSource)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioSource));
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			float QPYX_arg1_YXQP;
			bool QPYX_o_YXQP = QPYX_obj_YXQP.GetSpatializerFloat(QPYX_arg0_YXQP, out QPYX_arg1_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_arg1_YXQP);
			return 2;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetAmbisonicDecoderFloat_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.AudioSource  QPYX_obj_YXQP  = (UnityEngine.AudioSource)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioSource));
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.SetAmbisonicDecoderFloat(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetAmbisonicDecoderFloat_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.AudioSource  QPYX_obj_YXQP  = (UnityEngine.AudioSource)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioSource));
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			float QPYX_arg1_YXQP;
			bool QPYX_o_YXQP = QPYX_obj_YXQP.GetAmbisonicDecoderFloat(QPYX_arg0_YXQP, out QPYX_arg1_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_arg1_YXQP);
			return 2;
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
			UnityEngine.AudioSource  QPYX_obj_YXQP  = (UnityEngine.AudioSource)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioSource));
			int QPYX_o_YXQP = QPYX_obj_YXQP.DOTogglePause();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOSmoothRewind_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.AudioSource  QPYX_obj_YXQP  = (UnityEngine.AudioSource)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioSource));
			int QPYX_o_YXQP = QPYX_obj_YXQP.DOSmoothRewind();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DORewind_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				UnityEngine.AudioSource  QPYX_obj_YXQP  = (UnityEngine.AudioSource)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioSource));
				int QPYX_o_YXQP = QPYX_obj_YXQP.DORewind();
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				UnityEngine.AudioSource  QPYX_obj_YXQP  = (UnityEngine.AudioSource)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioSource));
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				int QPYX_o_YXQP = QPYX_obj_YXQP.DORewind(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.AudioSource.DORewind");
			}
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
				UnityEngine.AudioSource  QPYX_obj_YXQP  = (UnityEngine.AudioSource)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioSource));
				int QPYX_o_YXQP = QPYX_obj_YXQP.DORestart();
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				UnityEngine.AudioSource  QPYX_obj_YXQP  = (UnityEngine.AudioSource)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioSource));
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				int QPYX_o_YXQP = QPYX_obj_YXQP.DORestart(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.AudioSource.DORestart");
			}
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
			UnityEngine.AudioSource  QPYX_obj_YXQP  = (UnityEngine.AudioSource)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioSource));
			int QPYX_o_YXQP = QPYX_obj_YXQP.DOPlayForward();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
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
			UnityEngine.AudioSource  QPYX_obj_YXQP  = (UnityEngine.AudioSource)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioSource));
			int QPYX_o_YXQP = QPYX_obj_YXQP.DOPlayBackwards();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
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
			UnityEngine.AudioSource  QPYX_obj_YXQP  = (UnityEngine.AudioSource)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioSource));
			int QPYX_o_YXQP = QPYX_obj_YXQP.DOPlay();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
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
			UnityEngine.AudioSource  QPYX_obj_YXQP  = (UnityEngine.AudioSource)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioSource));
			int QPYX_o_YXQP = QPYX_obj_YXQP.DOPause();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOGoto_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.AudioSource  QPYX_obj_YXQP  = (UnityEngine.AudioSource)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioSource));
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				int QPYX_o_YXQP = QPYX_obj_YXQP.DOGoto(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.AudioSource  QPYX_obj_YXQP  = (UnityEngine.AudioSource)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioSource));
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				int QPYX_o_YXQP = QPYX_obj_YXQP.DOGoto(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.AudioSource.DOGoto");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOFlip_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.AudioSource  QPYX_obj_YXQP  = (UnityEngine.AudioSource)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioSource));
			int QPYX_o_YXQP = QPYX_obj_YXQP.DOFlip();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOKill_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				UnityEngine.AudioSource  QPYX_obj_YXQP  = (UnityEngine.AudioSource)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioSource));
				int QPYX_o_YXQP = QPYX_obj_YXQP.DOKill();
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				UnityEngine.AudioSource  QPYX_obj_YXQP  = (UnityEngine.AudioSource)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioSource));
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				int QPYX_o_YXQP = QPYX_obj_YXQP.DOKill(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.AudioSource.DOKill");
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
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				UnityEngine.AudioSource  QPYX_obj_YXQP  = (UnityEngine.AudioSource)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioSource));
				int QPYX_o_YXQP = QPYX_obj_YXQP.DOComplete();
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				UnityEngine.AudioSource  QPYX_obj_YXQP  = (UnityEngine.AudioSource)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioSource));
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				int QPYX_o_YXQP = QPYX_obj_YXQP.DOComplete(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.AudioSource.DOComplete");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOPitch_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.AudioSource  QPYX_obj_YXQP  = (UnityEngine.AudioSource)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioSource));
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOPitch(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOFade_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.AudioSource  QPYX_obj_YXQP  = (UnityEngine.AudioSource)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AudioSource));
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOFade(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
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
	static int QPYX_get_volume_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.volume;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index volume on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_pitch_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.pitch;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index pitch on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_time_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.time;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index time on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_timeSamples_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.timeSamples;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index timeSamples on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_clip_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			UnityEngine.AudioClip QPYX_ret_YXQP = QPYX_obj_YXQP.clip;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index clip on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_outputAudioMixerGroup_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			UnityEngine.Audio.AudioMixerGroup QPYX_ret_YXQP = QPYX_obj_YXQP.outputAudioMixerGroup;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index outputAudioMixerGroup on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isPlaying_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.isPlaying;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isPlaying on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isVirtual_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.isVirtual;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isVirtual on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_loop_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.loop;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index loop on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_ignoreListenerVolume_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.ignoreListenerVolume;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index ignoreListenerVolume on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_playOnAwake_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.playOnAwake;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index playOnAwake on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_ignoreListenerPause_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.ignoreListenerPause;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index ignoreListenerPause on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_velocityUpdateMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			UnityEngine.AudioVelocityUpdateMode QPYX_ret_YXQP = QPYX_obj_YXQP.velocityUpdateMode;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index velocityUpdateMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_panStereo_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.panStereo;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index panStereo on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_spatialBlend_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.spatialBlend;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index spatialBlend on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_spatialize_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.spatialize;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index spatialize on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_spatializePostEffects_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.spatializePostEffects;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index spatializePostEffects on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_reverbZoneMix_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.reverbZoneMix;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index reverbZoneMix on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_bypassEffects_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.bypassEffects;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index bypassEffects on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_bypassListenerEffects_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.bypassListenerEffects;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index bypassListenerEffects on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_bypassReverbZones_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.bypassReverbZones;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index bypassReverbZones on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_dopplerLevel_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.dopplerLevel;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index dopplerLevel on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_spread_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.spread;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index spread on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_priority_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.priority;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index priority on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_mute_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.mute;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index mute on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_minDistance_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.minDistance;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index minDistance on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_maxDistance_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.maxDistance;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index maxDistance on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_rolloffMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			UnityEngine.AudioRolloffMode QPYX_ret_YXQP = QPYX_obj_YXQP.rolloffMode;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index rolloffMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_volume_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.volume = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index volume on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_pitch_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.pitch = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index pitch on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_time_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.time = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index time on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_timeSamples_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.timeSamples = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index timeSamples on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_clip_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			UnityEngine.AudioClip QPYX_arg0_YXQP = (UnityEngine.AudioClip)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.AudioClip));
			QPYX_obj_YXQP.clip = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index clip on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_outputAudioMixerGroup_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			UnityEngine.Audio.AudioMixerGroup QPYX_arg0_YXQP = (UnityEngine.Audio.AudioMixerGroup)ToLua.CheckObject<UnityEngine.Audio.AudioMixerGroup>(L_YXQP, 2);
			QPYX_obj_YXQP.outputAudioMixerGroup = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index outputAudioMixerGroup on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_loop_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.loop = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index loop on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_ignoreListenerVolume_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.ignoreListenerVolume = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index ignoreListenerVolume on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_playOnAwake_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.playOnAwake = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index playOnAwake on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_ignoreListenerPause_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.ignoreListenerPause = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index ignoreListenerPause on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_velocityUpdateMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			UnityEngine.AudioVelocityUpdateMode QPYX_arg0_YXQP = (UnityEngine.AudioVelocityUpdateMode)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.AudioVelocityUpdateMode));
			QPYX_obj_YXQP.velocityUpdateMode = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index velocityUpdateMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_panStereo_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.panStereo = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index panStereo on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_spatialBlend_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.spatialBlend = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index spatialBlend on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_spatialize_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.spatialize = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index spatialize on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_spatializePostEffects_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.spatializePostEffects = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index spatializePostEffects on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_reverbZoneMix_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.reverbZoneMix = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index reverbZoneMix on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_bypassEffects_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.bypassEffects = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index bypassEffects on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_bypassListenerEffects_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.bypassListenerEffects = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index bypassListenerEffects on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_bypassReverbZones_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.bypassReverbZones = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index bypassReverbZones on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_dopplerLevel_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.dopplerLevel = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index dopplerLevel on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_spread_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.spread = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index spread on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_priority_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.priority = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index priority on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_mute_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.mute = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index mute on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_minDistance_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.minDistance = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index minDistance on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_maxDistance_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.maxDistance = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index maxDistance on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_rolloffMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AudioSource QPYX_obj_YXQP = (UnityEngine.AudioSource)QPYX_o_YXQP;
			UnityEngine.AudioRolloffMode QPYX_arg0_YXQP = (UnityEngine.AudioRolloffMode)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.AudioRolloffMode));
			QPYX_obj_YXQP.rolloffMode = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index rolloffMode on a nil value");
		}
	}
}

