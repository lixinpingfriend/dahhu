using System;
using LuaInterface;

public class QPYX_UnityEngine_ParticleSystemWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.ParticleSystem), typeof(UnityEngine.Component));
		L_YXQP.RegFunction("SetParticles", QPYX_SetParticles_YXQP);
		L_YXQP.RegFunction("GetParticles", QPYX_GetParticles_YXQP);
		L_YXQP.RegFunction("SetCustomParticleData", QPYX_SetCustomParticleData_YXQP);
		L_YXQP.RegFunction("GetCustomParticleData", QPYX_GetCustomParticleData_YXQP);
		L_YXQP.RegFunction("Simulate", QPYX_Simulate_YXQP);
		L_YXQP.RegFunction("Play", QPYX_Play_YXQP);
		L_YXQP.RegFunction("Pause", QPYX_Pause_YXQP);
		L_YXQP.RegFunction("Stop", QPYX_Stop_YXQP);
		L_YXQP.RegFunction("Clear", QPYX_Clear_YXQP);
		L_YXQP.RegFunction("IsAlive", QPYX_IsAlive_YXQP);
		L_YXQP.RegFunction("Emit", QPYX_Emit_YXQP);
		L_YXQP.RegFunction("EnableMeshNonUniformScaleFix", QPYX_EnableMeshNonUniformScaleFix_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateUnityEngine_ParticleSystem_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("isPlaying", QPYX_get_isPlaying_YXQP, null);
		L_YXQP.RegVar("isEmitting", QPYX_get_isEmitting_YXQP, null);
		L_YXQP.RegVar("isStopped", QPYX_get_isStopped_YXQP, null);
		L_YXQP.RegVar("isPaused", QPYX_get_isPaused_YXQP, null);
		L_YXQP.RegVar("time", QPYX_get_time_YXQP, QPYX_set_time_YXQP);
		L_YXQP.RegVar("particleCount", QPYX_get_particleCount_YXQP, null);
		L_YXQP.RegVar("randomSeed", QPYX_get_randomSeed_YXQP, QPYX_set_randomSeed_YXQP);
		L_YXQP.RegVar("useAutoRandomSeed", QPYX_get_useAutoRandomSeed_YXQP, QPYX_set_useAutoRandomSeed_YXQP);
		L_YXQP.RegVar("main", QPYX_get_main_YXQP, null);
		L_YXQP.RegVar("emission", QPYX_get_emission_YXQP, null);
		L_YXQP.RegVar("shape", QPYX_get_shape_YXQP, null);
		L_YXQP.RegVar("velocityOverLifetime", QPYX_get_velocityOverLifetime_YXQP, null);
		L_YXQP.RegVar("limitVelocityOverLifetime", QPYX_get_limitVelocityOverLifetime_YXQP, null);
		L_YXQP.RegVar("inheritVelocity", QPYX_get_inheritVelocity_YXQP, null);
		L_YXQP.RegVar("forceOverLifetime", QPYX_get_forceOverLifetime_YXQP, null);
		L_YXQP.RegVar("colorOverLifetime", QPYX_get_colorOverLifetime_YXQP, null);
		L_YXQP.RegVar("colorBySpeed", QPYX_get_colorBySpeed_YXQP, null);
		L_YXQP.RegVar("sizeOverLifetime", QPYX_get_sizeOverLifetime_YXQP, null);
		L_YXQP.RegVar("sizeBySpeed", QPYX_get_sizeBySpeed_YXQP, null);
		L_YXQP.RegVar("rotationOverLifetime", QPYX_get_rotationOverLifetime_YXQP, null);
		L_YXQP.RegVar("rotationBySpeed", QPYX_get_rotationBySpeed_YXQP, null);
		L_YXQP.RegVar("externalForces", QPYX_get_externalForces_YXQP, null);
		L_YXQP.RegVar("noise", QPYX_get_noise_YXQP, null);
		L_YXQP.RegVar("collision", QPYX_get_collision_YXQP, null);
		L_YXQP.RegVar("trigger", QPYX_get_trigger_YXQP, null);
		L_YXQP.RegVar("subEmitters", QPYX_get_subEmitters_YXQP, null);
		L_YXQP.RegVar("textureSheetAnimation", QPYX_get_textureSheetAnimation_YXQP, null);
		L_YXQP.RegVar("lights", QPYX_get_lights_YXQP, null);
		L_YXQP.RegVar("trails", QPYX_get_trails_YXQP, null);
		L_YXQP.RegVar("customData", QPYX_get_customData_YXQP, null);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUnityEngine_ParticleSystem_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				UnityEngine.ParticleSystem QPYX_obj_YXQP = new UnityEngine.ParticleSystem();
				ToLua.PushSealed(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UnityEngine.ParticleSystem.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetParticles_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.ParticleSystem  QPYX_obj_YXQP  = (UnityEngine.ParticleSystem)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.ParticleSystem));
			UnityEngine.ParticleSystem.Particle[] QPYX_arg0_YXQP = ToLua.CheckStructArray<UnityEngine.ParticleSystem.Particle>(L_YXQP, 2);
			int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
			QPYX_obj_YXQP.SetParticles(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetParticles_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.ParticleSystem  QPYX_obj_YXQP  = (UnityEngine.ParticleSystem)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.ParticleSystem));
			UnityEngine.ParticleSystem.Particle[] QPYX_arg0_YXQP = ToLua.CheckStructArray<UnityEngine.ParticleSystem.Particle>(L_YXQP, 2);
			int QPYX_o_YXQP = QPYX_obj_YXQP.GetParticles(QPYX_arg0_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetCustomParticleData_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.ParticleSystem  QPYX_obj_YXQP  = (UnityEngine.ParticleSystem)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.ParticleSystem));
			System.Collections.Generic.List<UnityEngine.Vector4> QPYX_arg0_YXQP = (System.Collections.Generic.List<UnityEngine.Vector4>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<UnityEngine.Vector4>));
			UnityEngine.ParticleSystemCustomData QPYX_arg1_YXQP = (UnityEngine.ParticleSystemCustomData)ToLua.CheckObject(L_YXQP, 3, typeof(UnityEngine.ParticleSystemCustomData));
			QPYX_obj_YXQP.SetCustomParticleData(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetCustomParticleData_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.ParticleSystem  QPYX_obj_YXQP  = (UnityEngine.ParticleSystem)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.ParticleSystem));
			System.Collections.Generic.List<UnityEngine.Vector4> QPYX_arg0_YXQP = (System.Collections.Generic.List<UnityEngine.Vector4>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<UnityEngine.Vector4>));
			UnityEngine.ParticleSystemCustomData QPYX_arg1_YXQP = (UnityEngine.ParticleSystemCustomData)ToLua.CheckObject(L_YXQP, 3, typeof(UnityEngine.ParticleSystemCustomData));
			int QPYX_o_YXQP = QPYX_obj_YXQP.GetCustomParticleData(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Simulate_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.ParticleSystem  QPYX_obj_YXQP  = (UnityEngine.ParticleSystem)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.ParticleSystem));
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				QPYX_obj_YXQP.Simulate(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.ParticleSystem  QPYX_obj_YXQP  = (UnityEngine.ParticleSystem)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.ParticleSystem));
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				QPYX_obj_YXQP.Simulate(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.ParticleSystem  QPYX_obj_YXQP  = (UnityEngine.ParticleSystem)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.ParticleSystem));
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				bool QPYX_arg2_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 4);
				QPYX_obj_YXQP.Simulate(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 5)
			{
				UnityEngine.ParticleSystem  QPYX_obj_YXQP  = (UnityEngine.ParticleSystem)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.ParticleSystem));
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				bool QPYX_arg2_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 4);
				bool QPYX_arg3_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 5);
				QPYX_obj_YXQP.Simulate(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.ParticleSystem.Simulate");
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
				UnityEngine.ParticleSystem  QPYX_obj_YXQP  = (UnityEngine.ParticleSystem)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.ParticleSystem));
				QPYX_obj_YXQP.Play();
				return 0;
			}
			else if (QPYX_count_YXQP == 2)
			{
				UnityEngine.ParticleSystem  QPYX_obj_YXQP  = (UnityEngine.ParticleSystem)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.ParticleSystem));
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				QPYX_obj_YXQP.Play(QPYX_arg0_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.ParticleSystem.Play");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Pause_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				UnityEngine.ParticleSystem  QPYX_obj_YXQP  = (UnityEngine.ParticleSystem)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.ParticleSystem));
				QPYX_obj_YXQP.Pause();
				return 0;
			}
			else if (QPYX_count_YXQP == 2)
			{
				UnityEngine.ParticleSystem  QPYX_obj_YXQP  = (UnityEngine.ParticleSystem)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.ParticleSystem));
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				QPYX_obj_YXQP.Pause(QPYX_arg0_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.ParticleSystem.Pause");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Stop_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				UnityEngine.ParticleSystem  QPYX_obj_YXQP  = (UnityEngine.ParticleSystem)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.ParticleSystem));
				QPYX_obj_YXQP.Stop();
				return 0;
			}
			else if (QPYX_count_YXQP == 2)
			{
				UnityEngine.ParticleSystem  QPYX_obj_YXQP  = (UnityEngine.ParticleSystem)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.ParticleSystem));
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				QPYX_obj_YXQP.Stop(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.ParticleSystem  QPYX_obj_YXQP  = (UnityEngine.ParticleSystem)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.ParticleSystem));
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				UnityEngine.ParticleSystemStopBehavior QPYX_arg1_YXQP = (UnityEngine.ParticleSystemStopBehavior)ToLua.CheckObject(L_YXQP, 3, typeof(UnityEngine.ParticleSystemStopBehavior));
				QPYX_obj_YXQP.Stop(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.ParticleSystem.Stop");
			}
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
			if (QPYX_count_YXQP == 1)
			{
				UnityEngine.ParticleSystem  QPYX_obj_YXQP  = (UnityEngine.ParticleSystem)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.ParticleSystem));
				QPYX_obj_YXQP.Clear();
				return 0;
			}
			else if (QPYX_count_YXQP == 2)
			{
				UnityEngine.ParticleSystem  QPYX_obj_YXQP  = (UnityEngine.ParticleSystem)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.ParticleSystem));
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				QPYX_obj_YXQP.Clear(QPYX_arg0_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.ParticleSystem.Clear");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IsAlive_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				UnityEngine.ParticleSystem  QPYX_obj_YXQP  = (UnityEngine.ParticleSystem)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.ParticleSystem));
				bool QPYX_o_YXQP = QPYX_obj_YXQP.IsAlive();
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				UnityEngine.ParticleSystem  QPYX_obj_YXQP  = (UnityEngine.ParticleSystem)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.ParticleSystem));
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				bool QPYX_o_YXQP = QPYX_obj_YXQP.IsAlive(QPYX_arg0_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.ParticleSystem.IsAlive");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Emit_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.ParticleSystem  QPYX_obj_YXQP  = (UnityEngine.ParticleSystem)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.ParticleSystem));
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				QPYX_obj_YXQP.Emit(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.ParticleSystem  QPYX_obj_YXQP  = (UnityEngine.ParticleSystem)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.ParticleSystem));
				UnityEngine.ParticleSystem.EmitParams QPYX_arg0_YXQP = StackTraits<UnityEngine.ParticleSystem.EmitParams>.Check(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				QPYX_obj_YXQP.Emit(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.ParticleSystem.Emit");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_EnableMeshNonUniformScaleFix_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 1);
//			UnityEngine.ParticleSystem.EnableMeshNonUniformScaleFix(QPYX_arg0_YXQP);
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
	static int QPYX_get_isPlaying_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystem QPYX_obj_YXQP = (UnityEngine.ParticleSystem)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.isPlaying;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isPlaying on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isEmitting_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystem QPYX_obj_YXQP = (UnityEngine.ParticleSystem)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.isEmitting;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isEmitting on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isStopped_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystem QPYX_obj_YXQP = (UnityEngine.ParticleSystem)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.isStopped;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isStopped on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isPaused_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystem QPYX_obj_YXQP = (UnityEngine.ParticleSystem)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.isPaused;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isPaused on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_time_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystem QPYX_obj_YXQP = (UnityEngine.ParticleSystem)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.time;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index time on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_particleCount_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystem QPYX_obj_YXQP = (UnityEngine.ParticleSystem)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.particleCount;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index particleCount on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_randomSeed_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystem QPYX_obj_YXQP = (UnityEngine.ParticleSystem)QPYX_o_YXQP;
			uint QPYX_ret_YXQP = QPYX_obj_YXQP.randomSeed;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index randomSeed on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_useAutoRandomSeed_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystem QPYX_obj_YXQP = (UnityEngine.ParticleSystem)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.useAutoRandomSeed;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index useAutoRandomSeed on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_main_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystem QPYX_obj_YXQP = (UnityEngine.ParticleSystem)QPYX_o_YXQP;
			UnityEngine.ParticleSystem.MainModule QPYX_ret_YXQP = QPYX_obj_YXQP.main;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index main on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_emission_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystem QPYX_obj_YXQP = (UnityEngine.ParticleSystem)QPYX_o_YXQP;
			UnityEngine.ParticleSystem.EmissionModule QPYX_ret_YXQP = QPYX_obj_YXQP.emission;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index emission on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_shape_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystem QPYX_obj_YXQP = (UnityEngine.ParticleSystem)QPYX_o_YXQP;
			UnityEngine.ParticleSystem.ShapeModule QPYX_ret_YXQP = QPYX_obj_YXQP.shape;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index shape on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_velocityOverLifetime_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystem QPYX_obj_YXQP = (UnityEngine.ParticleSystem)QPYX_o_YXQP;
			UnityEngine.ParticleSystem.VelocityOverLifetimeModule QPYX_ret_YXQP = QPYX_obj_YXQP.velocityOverLifetime;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index velocityOverLifetime on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_limitVelocityOverLifetime_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystem QPYX_obj_YXQP = (UnityEngine.ParticleSystem)QPYX_o_YXQP;
			UnityEngine.ParticleSystem.LimitVelocityOverLifetimeModule QPYX_ret_YXQP = QPYX_obj_YXQP.limitVelocityOverLifetime;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index limitVelocityOverLifetime on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_inheritVelocity_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystem QPYX_obj_YXQP = (UnityEngine.ParticleSystem)QPYX_o_YXQP;
			UnityEngine.ParticleSystem.InheritVelocityModule QPYX_ret_YXQP = QPYX_obj_YXQP.inheritVelocity;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index inheritVelocity on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_forceOverLifetime_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystem QPYX_obj_YXQP = (UnityEngine.ParticleSystem)QPYX_o_YXQP;
			UnityEngine.ParticleSystem.ForceOverLifetimeModule QPYX_ret_YXQP = QPYX_obj_YXQP.forceOverLifetime;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index forceOverLifetime on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_colorOverLifetime_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystem QPYX_obj_YXQP = (UnityEngine.ParticleSystem)QPYX_o_YXQP;
			UnityEngine.ParticleSystem.ColorOverLifetimeModule QPYX_ret_YXQP = QPYX_obj_YXQP.colorOverLifetime;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index colorOverLifetime on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_colorBySpeed_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystem QPYX_obj_YXQP = (UnityEngine.ParticleSystem)QPYX_o_YXQP;
			UnityEngine.ParticleSystem.ColorBySpeedModule QPYX_ret_YXQP = QPYX_obj_YXQP.colorBySpeed;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index colorBySpeed on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_sizeOverLifetime_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystem QPYX_obj_YXQP = (UnityEngine.ParticleSystem)QPYX_o_YXQP;
			UnityEngine.ParticleSystem.SizeOverLifetimeModule QPYX_ret_YXQP = QPYX_obj_YXQP.sizeOverLifetime;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index sizeOverLifetime on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_sizeBySpeed_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystem QPYX_obj_YXQP = (UnityEngine.ParticleSystem)QPYX_o_YXQP;
			UnityEngine.ParticleSystem.SizeBySpeedModule QPYX_ret_YXQP = QPYX_obj_YXQP.sizeBySpeed;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index sizeBySpeed on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_rotationOverLifetime_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystem QPYX_obj_YXQP = (UnityEngine.ParticleSystem)QPYX_o_YXQP;
			UnityEngine.ParticleSystem.RotationOverLifetimeModule QPYX_ret_YXQP = QPYX_obj_YXQP.rotationOverLifetime;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index rotationOverLifetime on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_rotationBySpeed_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystem QPYX_obj_YXQP = (UnityEngine.ParticleSystem)QPYX_o_YXQP;
			UnityEngine.ParticleSystem.RotationBySpeedModule QPYX_ret_YXQP = QPYX_obj_YXQP.rotationBySpeed;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index rotationBySpeed on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_externalForces_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystem QPYX_obj_YXQP = (UnityEngine.ParticleSystem)QPYX_o_YXQP;
			UnityEngine.ParticleSystem.ExternalForcesModule QPYX_ret_YXQP = QPYX_obj_YXQP.externalForces;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index externalForces on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_noise_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystem QPYX_obj_YXQP = (UnityEngine.ParticleSystem)QPYX_o_YXQP;
			UnityEngine.ParticleSystem.NoiseModule QPYX_ret_YXQP = QPYX_obj_YXQP.noise;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index noise on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_collision_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystem QPYX_obj_YXQP = (UnityEngine.ParticleSystem)QPYX_o_YXQP;
			UnityEngine.ParticleSystem.CollisionModule QPYX_ret_YXQP = QPYX_obj_YXQP.collision;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index collision on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_trigger_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystem QPYX_obj_YXQP = (UnityEngine.ParticleSystem)QPYX_o_YXQP;
			UnityEngine.ParticleSystem.TriggerModule QPYX_ret_YXQP = QPYX_obj_YXQP.trigger;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index trigger on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_subEmitters_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystem QPYX_obj_YXQP = (UnityEngine.ParticleSystem)QPYX_o_YXQP;
			UnityEngine.ParticleSystem.SubEmittersModule QPYX_ret_YXQP = QPYX_obj_YXQP.subEmitters;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index subEmitters on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_textureSheetAnimation_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystem QPYX_obj_YXQP = (UnityEngine.ParticleSystem)QPYX_o_YXQP;
			UnityEngine.ParticleSystem.TextureSheetAnimationModule QPYX_ret_YXQP = QPYX_obj_YXQP.textureSheetAnimation;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index textureSheetAnimation on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_lights_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystem QPYX_obj_YXQP = (UnityEngine.ParticleSystem)QPYX_o_YXQP;
			UnityEngine.ParticleSystem.LightsModule QPYX_ret_YXQP = QPYX_obj_YXQP.lights;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index lights on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_trails_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystem QPYX_obj_YXQP = (UnityEngine.ParticleSystem)QPYX_o_YXQP;
			UnityEngine.ParticleSystem.TrailModule QPYX_ret_YXQP = QPYX_obj_YXQP.trails;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index trails on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_customData_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystem QPYX_obj_YXQP = (UnityEngine.ParticleSystem)QPYX_o_YXQP;
			UnityEngine.ParticleSystem.CustomDataModule QPYX_ret_YXQP = QPYX_obj_YXQP.customData;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index customData on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_time_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystem QPYX_obj_YXQP = (UnityEngine.ParticleSystem)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.time = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index time on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_randomSeed_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystem QPYX_obj_YXQP = (UnityEngine.ParticleSystem)QPYX_o_YXQP;
			uint QPYX_arg0_YXQP = (uint)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.randomSeed = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index randomSeed on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_useAutoRandomSeed_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystem QPYX_obj_YXQP = (UnityEngine.ParticleSystem)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.useAutoRandomSeed = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index useAutoRandomSeed on a nil value");
		}
	}
}

