using System;
using LuaInterface;

public class QPYX_UnityEngine_QualitySettingsWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.QualitySettings), typeof(UnityEngine.Object));
		L_YXQP.RegFunction("GetQualityLevel", QPYX_GetQualityLevel_YXQP);
		L_YXQP.RegFunction("SetQualityLevel", QPYX_SetQualityLevel_YXQP);
		L_YXQP.RegFunction("IncreaseLevel", QPYX_IncreaseLevel_YXQP);
		L_YXQP.RegFunction("DecreaseLevel", QPYX_DecreaseLevel_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateUnityEngine_QualitySettings_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("names", QPYX_get_names_YXQP, null);
		L_YXQP.RegVar("shadowCascade4Split", QPYX_get_shadowCascade4Split_YXQP, QPYX_set_shadowCascade4Split_YXQP);
		L_YXQP.RegVar("anisotropicFiltering", QPYX_get_anisotropicFiltering_YXQP, QPYX_set_anisotropicFiltering_YXQP);
		L_YXQP.RegVar("maxQueuedFrames", QPYX_get_maxQueuedFrames_YXQP, QPYX_set_maxQueuedFrames_YXQP);
		L_YXQP.RegVar("blendWeights", QPYX_get_blendWeights_YXQP, QPYX_set_blendWeights_YXQP);
		L_YXQP.RegVar("pixelLightCount", QPYX_get_pixelLightCount_YXQP, QPYX_set_pixelLightCount_YXQP);
		L_YXQP.RegVar("shadows", QPYX_get_shadows_YXQP, QPYX_set_shadows_YXQP);
		L_YXQP.RegVar("shadowProjection", QPYX_get_shadowProjection_YXQP, QPYX_set_shadowProjection_YXQP);
		L_YXQP.RegVar("shadowCascades", QPYX_get_shadowCascades_YXQP, QPYX_set_shadowCascades_YXQP);
		L_YXQP.RegVar("shadowDistance", QPYX_get_shadowDistance_YXQP, QPYX_set_shadowDistance_YXQP);
		L_YXQP.RegVar("shadowResolution", QPYX_get_shadowResolution_YXQP, QPYX_set_shadowResolution_YXQP);
		L_YXQP.RegVar("shadowmaskMode", QPYX_get_shadowmaskMode_YXQP, QPYX_set_shadowmaskMode_YXQP);
		L_YXQP.RegVar("shadowNearPlaneOffset", QPYX_get_shadowNearPlaneOffset_YXQP, QPYX_set_shadowNearPlaneOffset_YXQP);
		L_YXQP.RegVar("shadowCascade2Split", QPYX_get_shadowCascade2Split_YXQP, QPYX_set_shadowCascade2Split_YXQP);
		L_YXQP.RegVar("lodBias", QPYX_get_lodBias_YXQP, QPYX_set_lodBias_YXQP);
		L_YXQP.RegVar("masterTextureLimit", QPYX_get_masterTextureLimit_YXQP, QPYX_set_masterTextureLimit_YXQP);
		L_YXQP.RegVar("maximumLODLevel", QPYX_get_maximumLODLevel_YXQP, QPYX_set_maximumLODLevel_YXQP);
		L_YXQP.RegVar("particleRaycastBudget", QPYX_get_particleRaycastBudget_YXQP, QPYX_set_particleRaycastBudget_YXQP);
		L_YXQP.RegVar("softParticles", QPYX_get_softParticles_YXQP, QPYX_set_softParticles_YXQP);
		L_YXQP.RegVar("softVegetation", QPYX_get_softVegetation_YXQP, QPYX_set_softVegetation_YXQP);
		L_YXQP.RegVar("vSyncCount", QPYX_get_vSyncCount_YXQP, QPYX_set_vSyncCount_YXQP);
		L_YXQP.RegVar("antiAliasing", QPYX_get_antiAliasing_YXQP, QPYX_set_antiAliasing_YXQP);
		L_YXQP.RegVar("asyncUploadTimeSlice", QPYX_get_asyncUploadTimeSlice_YXQP, QPYX_set_asyncUploadTimeSlice_YXQP);
		L_YXQP.RegVar("asyncUploadBufferSize", QPYX_get_asyncUploadBufferSize_YXQP, QPYX_set_asyncUploadBufferSize_YXQP);
		L_YXQP.RegVar("realtimeReflectionProbes", QPYX_get_realtimeReflectionProbes_YXQP, QPYX_set_realtimeReflectionProbes_YXQP);
		L_YXQP.RegVar("billboardsFaceCameraPosition", QPYX_get_billboardsFaceCameraPosition_YXQP, QPYX_set_billboardsFaceCameraPosition_YXQP);
		L_YXQP.RegVar("resolutionScalingFixedDPIFactor", QPYX_get_resolutionScalingFixedDPIFactor_YXQP, QPYX_set_resolutionScalingFixedDPIFactor_YXQP);
		L_YXQP.RegVar("desiredColorSpace", QPYX_get_desiredColorSpace_YXQP, null);
		L_YXQP.RegVar("activeColorSpace", QPYX_get_activeColorSpace_YXQP, null);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUnityEngine_QualitySettings_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				UnityEngine.QualitySettings QPYX_obj_YXQP = new UnityEngine.QualitySettings();
				ToLua.PushSealed(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UnityEngine.QualitySettings.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetQualityLevel_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 0);
			int QPYX_o_YXQP = UnityEngine.QualitySettings.GetQualityLevel();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetQualityLevel_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 1);
				UnityEngine.QualitySettings.SetQualityLevel(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 2)
			{
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 1);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				UnityEngine.QualitySettings.SetQualityLevel(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.QualitySettings.SetQualityLevel");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IncreaseLevel_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				UnityEngine.QualitySettings.IncreaseLevel();
				return 0;
			}
			else if (QPYX_count_YXQP == 1)
			{
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 1);
				UnityEngine.QualitySettings.IncreaseLevel(QPYX_arg0_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.QualitySettings.IncreaseLevel");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DecreaseLevel_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				UnityEngine.QualitySettings.DecreaseLevel();
				return 0;
			}
			else if (QPYX_count_YXQP == 1)
			{
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 1);
				UnityEngine.QualitySettings.DecreaseLevel(QPYX_arg0_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.QualitySettings.DecreaseLevel");
			}
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
	static int QPYX_get_names_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.QualitySettings.names);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_shadowCascade4Split_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.QualitySettings.shadowCascade4Split);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_anisotropicFiltering_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.QualitySettings.anisotropicFiltering);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_maxQueuedFrames_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushinteger(L_YXQP,UnityEngine.QualitySettings.maxQueuedFrames);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_blendWeights_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.QualitySettings.blendWeights);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_pixelLightCount_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushinteger(L_YXQP,UnityEngine.QualitySettings.pixelLightCount);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_shadows_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.QualitySettings.shadows);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_shadowProjection_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.QualitySettings.shadowProjection);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_shadowCascades_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushinteger(L_YXQP,UnityEngine.QualitySettings.shadowCascades);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_shadowDistance_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushnumber(L_YXQP, UnityEngine.QualitySettings.shadowDistance);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_shadowResolution_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.QualitySettings.shadowResolution);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_shadowmaskMode_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.QualitySettings.shadowmaskMode);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_shadowNearPlaneOffset_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushnumber(L_YXQP, UnityEngine.QualitySettings.shadowNearPlaneOffset);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_shadowCascade2Split_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushnumber(L_YXQP, UnityEngine.QualitySettings.shadowCascade2Split);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_lodBias_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushnumber(L_YXQP, UnityEngine.QualitySettings.lodBias);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_masterTextureLimit_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushinteger(L_YXQP,UnityEngine.QualitySettings.masterTextureLimit);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_maximumLODLevel_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushinteger(L_YXQP,UnityEngine.QualitySettings.maximumLODLevel);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_particleRaycastBudget_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushinteger(L_YXQP,UnityEngine.QualitySettings.particleRaycastBudget);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_softParticles_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushboolean(L_YXQP, UnityEngine.QualitySettings.softParticles);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_softVegetation_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushboolean(L_YXQP, UnityEngine.QualitySettings.softVegetation);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_vSyncCount_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushinteger(L_YXQP,UnityEngine.QualitySettings.vSyncCount);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_antiAliasing_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushinteger(L_YXQP,UnityEngine.QualitySettings.antiAliasing);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_asyncUploadTimeSlice_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushinteger(L_YXQP,UnityEngine.QualitySettings.asyncUploadTimeSlice);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_asyncUploadBufferSize_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushinteger(L_YXQP,UnityEngine.QualitySettings.asyncUploadBufferSize);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_realtimeReflectionProbes_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushboolean(L_YXQP, UnityEngine.QualitySettings.realtimeReflectionProbes);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_billboardsFaceCameraPosition_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushboolean(L_YXQP, UnityEngine.QualitySettings.billboardsFaceCameraPosition);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_resolutionScalingFixedDPIFactor_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushnumber(L_YXQP, UnityEngine.QualitySettings.resolutionScalingFixedDPIFactor);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_desiredColorSpace_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.QualitySettings.desiredColorSpace);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_activeColorSpace_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.QualitySettings.activeColorSpace);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_shadowCascade4Split_YXQP(IntPtr L_YXQP)
	{
		try
		{
			UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
			UnityEngine.QualitySettings.shadowCascade4Split = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_anisotropicFiltering_YXQP(IntPtr L_YXQP)
	{
		try
		{
			UnityEngine.AnisotropicFiltering QPYX_arg0_YXQP = (UnityEngine.AnisotropicFiltering)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.AnisotropicFiltering));
			UnityEngine.QualitySettings.anisotropicFiltering = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_maxQueuedFrames_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.QualitySettings.maxQueuedFrames = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_blendWeights_YXQP(IntPtr L_YXQP)
	{
		try
		{
			UnityEngine.BlendWeights QPYX_arg0_YXQP = (UnityEngine.BlendWeights)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.BlendWeights));
			UnityEngine.QualitySettings.blendWeights = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_pixelLightCount_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.QualitySettings.pixelLightCount = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_shadows_YXQP(IntPtr L_YXQP)
	{
		try
		{
			UnityEngine.ShadowQuality QPYX_arg0_YXQP = (UnityEngine.ShadowQuality)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.ShadowQuality));
			UnityEngine.QualitySettings.shadows = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_shadowProjection_YXQP(IntPtr L_YXQP)
	{
		try
		{
			UnityEngine.ShadowProjection QPYX_arg0_YXQP = (UnityEngine.ShadowProjection)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.ShadowProjection));
			UnityEngine.QualitySettings.shadowProjection = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_shadowCascades_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.QualitySettings.shadowCascades = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_shadowDistance_YXQP(IntPtr L_YXQP)
	{
		try
		{
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.QualitySettings.shadowDistance = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_shadowResolution_YXQP(IntPtr L_YXQP)
	{
		try
		{
			UnityEngine.ShadowResolution QPYX_arg0_YXQP = (UnityEngine.ShadowResolution)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.ShadowResolution));
			UnityEngine.QualitySettings.shadowResolution = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_shadowmaskMode_YXQP(IntPtr L_YXQP)
	{
		try
		{
			UnityEngine.ShadowmaskMode QPYX_arg0_YXQP = (UnityEngine.ShadowmaskMode)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.ShadowmaskMode));
			UnityEngine.QualitySettings.shadowmaskMode = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_shadowNearPlaneOffset_YXQP(IntPtr L_YXQP)
	{
		try
		{
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.QualitySettings.shadowNearPlaneOffset = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_shadowCascade2Split_YXQP(IntPtr L_YXQP)
	{
		try
		{
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.QualitySettings.shadowCascade2Split = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_lodBias_YXQP(IntPtr L_YXQP)
	{
		try
		{
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.QualitySettings.lodBias = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_masterTextureLimit_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.QualitySettings.masterTextureLimit = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_maximumLODLevel_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.QualitySettings.maximumLODLevel = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_particleRaycastBudget_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.QualitySettings.particleRaycastBudget = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_softParticles_YXQP(IntPtr L_YXQP)
	{
		try
		{
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			UnityEngine.QualitySettings.softParticles = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_softVegetation_YXQP(IntPtr L_YXQP)
	{
		try
		{
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			UnityEngine.QualitySettings.softVegetation = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_vSyncCount_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.QualitySettings.vSyncCount = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_antiAliasing_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.QualitySettings.antiAliasing = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_asyncUploadTimeSlice_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.QualitySettings.asyncUploadTimeSlice = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_asyncUploadBufferSize_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.QualitySettings.asyncUploadBufferSize = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_realtimeReflectionProbes_YXQP(IntPtr L_YXQP)
	{
		try
		{
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			UnityEngine.QualitySettings.realtimeReflectionProbes = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_billboardsFaceCameraPosition_YXQP(IntPtr L_YXQP)
	{
		try
		{
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			UnityEngine.QualitySettings.billboardsFaceCameraPosition = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_resolutionScalingFixedDPIFactor_YXQP(IntPtr L_YXQP)
	{
		try
		{
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.QualitySettings.resolutionScalingFixedDPIFactor = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}
}

