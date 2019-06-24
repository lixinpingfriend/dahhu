using System;
using LuaInterface;

public class QPYX_UnityEngine_TimeWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginStaticLibs("Time");
		L_YXQP.RegVar("time", QPYX_get_time_YXQP, null);
		L_YXQP.RegVar("timeSinceLevelLoad", QPYX_get_timeSinceLevelLoad_YXQP, null);
		L_YXQP.RegVar("deltaTime", QPYX_get_deltaTime_YXQP, null);
		L_YXQP.RegVar("fixedTime", QPYX_get_fixedTime_YXQP, null);
		L_YXQP.RegVar("unscaledTime", QPYX_get_unscaledTime_YXQP, null);
		L_YXQP.RegVar("fixedUnscaledTime", QPYX_get_fixedUnscaledTime_YXQP, null);
		L_YXQP.RegVar("unscaledDeltaTime", QPYX_get_unscaledDeltaTime_YXQP, null);
		L_YXQP.RegVar("fixedUnscaledDeltaTime", QPYX_get_fixedUnscaledDeltaTime_YXQP, null);
		L_YXQP.RegVar("fixedDeltaTime", QPYX_get_fixedDeltaTime_YXQP, QPYX_set_fixedDeltaTime_YXQP);
		L_YXQP.RegVar("maximumDeltaTime", QPYX_get_maximumDeltaTime_YXQP, QPYX_set_maximumDeltaTime_YXQP);
		L_YXQP.RegVar("smoothDeltaTime", QPYX_get_smoothDeltaTime_YXQP, null);
		L_YXQP.RegVar("maximumParticleDeltaTime", QPYX_get_maximumParticleDeltaTime_YXQP, QPYX_set_maximumParticleDeltaTime_YXQP);
		L_YXQP.RegVar("timeScale", QPYX_get_timeScale_YXQP, QPYX_set_timeScale_YXQP);
		L_YXQP.RegVar("frameCount", QPYX_get_frameCount_YXQP, null);
		L_YXQP.RegVar("renderedFrameCount", QPYX_get_renderedFrameCount_YXQP, null);
		L_YXQP.RegVar("realtimeSinceStartup", QPYX_get_realtimeSinceStartup_YXQP, null);
		L_YXQP.RegVar("captureFramerate", QPYX_get_captureFramerate_YXQP, QPYX_set_captureFramerate_YXQP);
		L_YXQP.RegVar("inFixedTimeStep", QPYX_get_inFixedTimeStep_YXQP, null);
		L_YXQP.EndStaticLibs();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_time_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushnumber(L_YXQP, UnityEngine.Time.time);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_timeSinceLevelLoad_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushnumber(L_YXQP, UnityEngine.Time.timeSinceLevelLoad);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_deltaTime_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushnumber(L_YXQP, UnityEngine.Time.deltaTime);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_fixedTime_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushnumber(L_YXQP, UnityEngine.Time.fixedTime);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_unscaledTime_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushnumber(L_YXQP, UnityEngine.Time.unscaledTime);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_fixedUnscaledTime_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushnumber(L_YXQP, UnityEngine.Time.fixedUnscaledTime);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_unscaledDeltaTime_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushnumber(L_YXQP, UnityEngine.Time.unscaledDeltaTime);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_fixedUnscaledDeltaTime_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushnumber(L_YXQP, UnityEngine.Time.fixedUnscaledDeltaTime);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_fixedDeltaTime_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushnumber(L_YXQP, UnityEngine.Time.fixedDeltaTime);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_maximumDeltaTime_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushnumber(L_YXQP, UnityEngine.Time.maximumDeltaTime);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_smoothDeltaTime_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushnumber(L_YXQP, UnityEngine.Time.smoothDeltaTime);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_maximumParticleDeltaTime_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushnumber(L_YXQP, UnityEngine.Time.maximumParticleDeltaTime);
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
			LuaDLL.lua_pushnumber(L_YXQP, UnityEngine.Time.timeScale);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_frameCount_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushinteger(L_YXQP,UnityEngine.Time.frameCount);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_renderedFrameCount_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushinteger(L_YXQP,UnityEngine.Time.renderedFrameCount);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_realtimeSinceStartup_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushnumber(L_YXQP, UnityEngine.Time.realtimeSinceStartup);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_captureFramerate_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushinteger(L_YXQP,UnityEngine.Time.captureFramerate);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_inFixedTimeStep_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushboolean(L_YXQP, UnityEngine.Time.inFixedTimeStep);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_fixedDeltaTime_YXQP(IntPtr L_YXQP)
	{
		try
		{
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.Time.fixedDeltaTime = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_maximumDeltaTime_YXQP(IntPtr L_YXQP)
	{
		try
		{
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.Time.maximumDeltaTime = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_maximumParticleDeltaTime_YXQP(IntPtr L_YXQP)
	{
		try
		{
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.Time.maximumParticleDeltaTime = QPYX_arg0_YXQP;
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
			UnityEngine.Time.timeScale = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_captureFramerate_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.Time.captureFramerate = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}
}

