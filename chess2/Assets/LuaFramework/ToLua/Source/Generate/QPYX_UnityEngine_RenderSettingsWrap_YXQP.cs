using System;
using LuaInterface;

public class QPYX_UnityEngine_RenderSettingsWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.RenderSettings), typeof(UnityEngine.Object));
		L_YXQP.RegFunction("New", QPYX__CreateUnityEngine_RenderSettings_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("ambientProbe", QPYX_get_ambientProbe_YXQP, QPYX_set_ambientProbe_YXQP);
		L_YXQP.RegVar("customReflection", QPYX_get_customReflection_YXQP, QPYX_set_customReflection_YXQP);
		L_YXQP.RegVar("fog", QPYX_get_fog_YXQP, QPYX_set_fog_YXQP);
		L_YXQP.RegVar("fogStartDistance", QPYX_get_fogStartDistance_YXQP, QPYX_set_fogStartDistance_YXQP);
		L_YXQP.RegVar("fogEndDistance", QPYX_get_fogEndDistance_YXQP, QPYX_set_fogEndDistance_YXQP);
		L_YXQP.RegVar("fogMode", QPYX_get_fogMode_YXQP, QPYX_set_fogMode_YXQP);
		L_YXQP.RegVar("fogColor", QPYX_get_fogColor_YXQP, QPYX_set_fogColor_YXQP);
		L_YXQP.RegVar("fogDensity", QPYX_get_fogDensity_YXQP, QPYX_set_fogDensity_YXQP);
		L_YXQP.RegVar("ambientMode", QPYX_get_ambientMode_YXQP, QPYX_set_ambientMode_YXQP);
		L_YXQP.RegVar("ambientSkyColor", QPYX_get_ambientSkyColor_YXQP, QPYX_set_ambientSkyColor_YXQP);
		L_YXQP.RegVar("ambientEquatorColor", QPYX_get_ambientEquatorColor_YXQP, QPYX_set_ambientEquatorColor_YXQP);
		L_YXQP.RegVar("ambientGroundColor", QPYX_get_ambientGroundColor_YXQP, QPYX_set_ambientGroundColor_YXQP);
		L_YXQP.RegVar("ambientIntensity", QPYX_get_ambientIntensity_YXQP, QPYX_set_ambientIntensity_YXQP);
		L_YXQP.RegVar("ambientLight", QPYX_get_ambientLight_YXQP, QPYX_set_ambientLight_YXQP);
		L_YXQP.RegVar("subtractiveShadowColor", QPYX_get_subtractiveShadowColor_YXQP, QPYX_set_subtractiveShadowColor_YXQP);
		L_YXQP.RegVar("skybox", QPYX_get_skybox_YXQP, QPYX_set_skybox_YXQP);
		L_YXQP.RegVar("sun", QPYX_get_sun_YXQP, QPYX_set_sun_YXQP);
		L_YXQP.RegVar("reflectionIntensity", QPYX_get_reflectionIntensity_YXQP, QPYX_set_reflectionIntensity_YXQP);
		L_YXQP.RegVar("reflectionBounces", QPYX_get_reflectionBounces_YXQP, QPYX_set_reflectionBounces_YXQP);
		L_YXQP.RegVar("defaultReflectionMode", QPYX_get_defaultReflectionMode_YXQP, QPYX_set_defaultReflectionMode_YXQP);
		L_YXQP.RegVar("defaultReflectionResolution", QPYX_get_defaultReflectionResolution_YXQP, QPYX_set_defaultReflectionResolution_YXQP);
		L_YXQP.RegVar("haloStrength", QPYX_get_haloStrength_YXQP, QPYX_set_haloStrength_YXQP);
		L_YXQP.RegVar("flareStrength", QPYX_get_flareStrength_YXQP, QPYX_set_flareStrength_YXQP);
		L_YXQP.RegVar("flareFadeSpeed", QPYX_get_flareFadeSpeed_YXQP, QPYX_set_flareFadeSpeed_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUnityEngine_RenderSettings_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				UnityEngine.RenderSettings QPYX_obj_YXQP = new UnityEngine.RenderSettings();
				ToLua.PushSealed(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UnityEngine.RenderSettings.New");
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
	static int QPYX_get_ambientProbe_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.PushValue(L_YXQP, UnityEngine.RenderSettings.ambientProbe);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_customReflection_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.PushSealed(L_YXQP, UnityEngine.RenderSettings.customReflection);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_fog_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushboolean(L_YXQP, UnityEngine.RenderSettings.fog);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_fogStartDistance_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushnumber(L_YXQP, UnityEngine.RenderSettings.fogStartDistance);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_fogEndDistance_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushnumber(L_YXQP, UnityEngine.RenderSettings.fogEndDistance);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_fogMode_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.RenderSettings.fogMode);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_fogColor_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.RenderSettings.fogColor);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_fogDensity_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushnumber(L_YXQP, UnityEngine.RenderSettings.fogDensity);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_ambientMode_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.RenderSettings.ambientMode);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_ambientSkyColor_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.RenderSettings.ambientSkyColor);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_ambientEquatorColor_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.RenderSettings.ambientEquatorColor);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_ambientGroundColor_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.RenderSettings.ambientGroundColor);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_ambientIntensity_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushnumber(L_YXQP, UnityEngine.RenderSettings.ambientIntensity);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_ambientLight_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.RenderSettings.ambientLight);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_subtractiveShadowColor_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.RenderSettings.subtractiveShadowColor);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_skybox_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.RenderSettings.skybox);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_sun_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.PushSealed(L_YXQP, UnityEngine.RenderSettings.sun);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_reflectionIntensity_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushnumber(L_YXQP, UnityEngine.RenderSettings.reflectionIntensity);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_reflectionBounces_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushinteger(L_YXQP,UnityEngine.RenderSettings.reflectionBounces);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_defaultReflectionMode_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.RenderSettings.defaultReflectionMode);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_defaultReflectionResolution_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushinteger(L_YXQP,UnityEngine.RenderSettings.defaultReflectionResolution);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_haloStrength_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushnumber(L_YXQP, UnityEngine.RenderSettings.haloStrength);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_flareStrength_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushnumber(L_YXQP, UnityEngine.RenderSettings.flareStrength);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_flareFadeSpeed_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushnumber(L_YXQP, UnityEngine.RenderSettings.flareFadeSpeed);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_ambientProbe_YXQP(IntPtr L_YXQP)
	{
		try
		{
			UnityEngine.Rendering.SphericalHarmonicsL2 QPYX_arg0_YXQP = StackTraits<UnityEngine.Rendering.SphericalHarmonicsL2>.Check(L_YXQP, 2);
			UnityEngine.RenderSettings.ambientProbe = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_customReflection_YXQP(IntPtr L_YXQP)
	{
		try
		{
			UnityEngine.Cubemap QPYX_arg0_YXQP = (UnityEngine.Cubemap)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.Cubemap));
			UnityEngine.RenderSettings.customReflection = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_fog_YXQP(IntPtr L_YXQP)
	{
		try
		{
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			UnityEngine.RenderSettings.fog = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_fogStartDistance_YXQP(IntPtr L_YXQP)
	{
		try
		{
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.RenderSettings.fogStartDistance = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_fogEndDistance_YXQP(IntPtr L_YXQP)
	{
		try
		{
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.RenderSettings.fogEndDistance = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_fogMode_YXQP(IntPtr L_YXQP)
	{
		try
		{
			UnityEngine.FogMode QPYX_arg0_YXQP = (UnityEngine.FogMode)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.FogMode));
			UnityEngine.RenderSettings.fogMode = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_fogColor_YXQP(IntPtr L_YXQP)
	{
		try
		{
			UnityEngine.Color QPYX_arg0_YXQP = ToLua.ToColor(L_YXQP, 2);
			UnityEngine.RenderSettings.fogColor = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_fogDensity_YXQP(IntPtr L_YXQP)
	{
		try
		{
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.RenderSettings.fogDensity = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_ambientMode_YXQP(IntPtr L_YXQP)
	{
		try
		{
			UnityEngine.Rendering.AmbientMode QPYX_arg0_YXQP = (UnityEngine.Rendering.AmbientMode)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.Rendering.AmbientMode));
			UnityEngine.RenderSettings.ambientMode = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_ambientSkyColor_YXQP(IntPtr L_YXQP)
	{
		try
		{
			UnityEngine.Color QPYX_arg0_YXQP = ToLua.ToColor(L_YXQP, 2);
			UnityEngine.RenderSettings.ambientSkyColor = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_ambientEquatorColor_YXQP(IntPtr L_YXQP)
	{
		try
		{
			UnityEngine.Color QPYX_arg0_YXQP = ToLua.ToColor(L_YXQP, 2);
			UnityEngine.RenderSettings.ambientEquatorColor = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_ambientGroundColor_YXQP(IntPtr L_YXQP)
	{
		try
		{
			UnityEngine.Color QPYX_arg0_YXQP = ToLua.ToColor(L_YXQP, 2);
			UnityEngine.RenderSettings.ambientGroundColor = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_ambientIntensity_YXQP(IntPtr L_YXQP)
	{
		try
		{
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.RenderSettings.ambientIntensity = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_ambientLight_YXQP(IntPtr L_YXQP)
	{
		try
		{
			UnityEngine.Color QPYX_arg0_YXQP = ToLua.ToColor(L_YXQP, 2);
			UnityEngine.RenderSettings.ambientLight = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_subtractiveShadowColor_YXQP(IntPtr L_YXQP)
	{
		try
		{
			UnityEngine.Color QPYX_arg0_YXQP = ToLua.ToColor(L_YXQP, 2);
			UnityEngine.RenderSettings.subtractiveShadowColor = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_skybox_YXQP(IntPtr L_YXQP)
	{
		try
		{
			UnityEngine.Material QPYX_arg0_YXQP = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 2);
			UnityEngine.RenderSettings.skybox = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_sun_YXQP(IntPtr L_YXQP)
	{
		try
		{
			UnityEngine.Light QPYX_arg0_YXQP = (UnityEngine.Light)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.Light));
			UnityEngine.RenderSettings.sun = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_reflectionIntensity_YXQP(IntPtr L_YXQP)
	{
		try
		{
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.RenderSettings.reflectionIntensity = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_reflectionBounces_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.RenderSettings.reflectionBounces = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_defaultReflectionMode_YXQP(IntPtr L_YXQP)
	{
		try
		{
			UnityEngine.Rendering.DefaultReflectionMode QPYX_arg0_YXQP = (UnityEngine.Rendering.DefaultReflectionMode)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.Rendering.DefaultReflectionMode));
			UnityEngine.RenderSettings.defaultReflectionMode = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_defaultReflectionResolution_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.RenderSettings.defaultReflectionResolution = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_haloStrength_YXQP(IntPtr L_YXQP)
	{
		try
		{
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.RenderSettings.haloStrength = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_flareStrength_YXQP(IntPtr L_YXQP)
	{
		try
		{
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.RenderSettings.flareStrength = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_flareFadeSpeed_YXQP(IntPtr L_YXQP)
	{
		try
		{
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.RenderSettings.flareFadeSpeed = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}
}

