using System;
using LuaInterface;

public class QPYX_UnityEngine_DebugWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.Debug), typeof(System.Object));
		L_YXQP.RegFunction("DrawLine", QPYX_DrawLine_YXQP);
		L_YXQP.RegFunction("DrawRay", QPYX_DrawRay_YXQP);
		L_YXQP.RegFunction("Break", QPYX_Break_YXQP);
		L_YXQP.RegFunction("DebugBreak", QPYX_DebugBreak_YXQP);
		L_YXQP.RegFunction("Log", QPYX_Log_YXQP);
		L_YXQP.RegFunction("LogFormat", QPYX_LogFormat_YXQP);
		L_YXQP.RegFunction("LogError", QPYX_LogError_YXQP);
		L_YXQP.RegFunction("LogErrorFormat", QPYX_LogErrorFormat_YXQP);
		L_YXQP.RegFunction("ClearDeveloperConsole", QPYX_ClearDeveloperConsole_YXQP);
		L_YXQP.RegFunction("LogException", QPYX_LogException_YXQP);
		L_YXQP.RegFunction("LogWarning", QPYX_LogWarning_YXQP);
		L_YXQP.RegFunction("LogWarningFormat", QPYX_LogWarningFormat_YXQP);
		L_YXQP.RegFunction("Assert", QPYX_Assert_YXQP);
		L_YXQP.RegFunction("AssertFormat", QPYX_AssertFormat_YXQP);
		L_YXQP.RegFunction("LogAssertion", QPYX_LogAssertion_YXQP);
		L_YXQP.RegFunction("LogAssertionFormat", QPYX_LogAssertionFormat_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateUnityEngine_Debug_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("unityLogger", QPYX_get_unityLogger_YXQP, null);
		L_YXQP.RegVar("developerConsoleVisible", QPYX_get_developerConsoleVisible_YXQP, QPYX_set_developerConsoleVisible_YXQP);
		L_YXQP.RegVar("isDebugBuild", QPYX_get_isDebugBuild_YXQP, null);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUnityEngine_Debug_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				UnityEngine.Debug QPYX_obj_YXQP = new UnityEngine.Debug();
				ToLua.PushSealed(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UnityEngine.Debug.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DrawLine_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Debug.DrawLine(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Color QPYX_arg2_YXQP = ToLua.ToColor(L_YXQP, 3);
				UnityEngine.Debug.DrawLine(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Color QPYX_arg2_YXQP = ToLua.ToColor(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
				UnityEngine.Debug.DrawLine(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 5)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Color QPYX_arg2_YXQP = ToLua.ToColor(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
				bool QPYX_arg4_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 5);
				UnityEngine.Debug.DrawLine(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Debug.DrawLine");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DrawRay_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Debug.DrawRay(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Color QPYX_arg2_YXQP = ToLua.ToColor(L_YXQP, 3);
				UnityEngine.Debug.DrawRay(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Color QPYX_arg2_YXQP = ToLua.ToColor(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
				UnityEngine.Debug.DrawRay(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 5)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Color QPYX_arg2_YXQP = ToLua.ToColor(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
				bool QPYX_arg4_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 5);
				UnityEngine.Debug.DrawRay(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Debug.DrawRay");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Break_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 0);
			UnityEngine.Debug.Break();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DebugBreak_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 0);
			UnityEngine.Debug.DebugBreak();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Log_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 1);
				UnityEngine.Debug.Log(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 2)
			{
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 1);
				UnityEngine.Object QPYX_arg1_YXQP = (UnityEngine.Object)ToLua.CheckObject<UnityEngine.Object>(L_YXQP, 2);
				UnityEngine.Debug.Log(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Debug.Log");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LogFormat_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (TypeChecker.CheckTypes<UnityEngine.Object, string>(L_YXQP, 1) && TypeChecker.CheckParamsType<object>(L_YXQP, 3, QPYX_count_YXQP - 2))
			{
				UnityEngine.Object QPYX_arg0_YXQP = (UnityEngine.Object)ToLua.ToObject(L_YXQP, 1);
				string QPYX_arg1_YXQP = ToLua.ToString(L_YXQP, 2);
				object[] QPYX_arg2_YXQP = ToLua.ToParamsObject(L_YXQP, 3, QPYX_count_YXQP - 2);
				UnityEngine.Debug.LogFormat(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else if (TypeChecker.CheckTypes<string>(L_YXQP, 1) && TypeChecker.CheckParamsType<object>(L_YXQP, 2, QPYX_count_YXQP - 1))
			{
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 1);
				object[] QPYX_arg1_YXQP = ToLua.ToParamsObject(L_YXQP, 2, QPYX_count_YXQP - 1);
				UnityEngine.Debug.LogFormat(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Debug.LogFormat");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LogError_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 1);
				UnityEngine.Debug.LogError(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 2)
			{
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 1);
				UnityEngine.Object QPYX_arg1_YXQP = (UnityEngine.Object)ToLua.CheckObject<UnityEngine.Object>(L_YXQP, 2);
				UnityEngine.Debug.LogError(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Debug.LogError");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LogErrorFormat_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (TypeChecker.CheckTypes<UnityEngine.Object, string>(L_YXQP, 1) && TypeChecker.CheckParamsType<object>(L_YXQP, 3, QPYX_count_YXQP - 2))
			{
				UnityEngine.Object QPYX_arg0_YXQP = (UnityEngine.Object)ToLua.ToObject(L_YXQP, 1);
				string QPYX_arg1_YXQP = ToLua.ToString(L_YXQP, 2);
				object[] QPYX_arg2_YXQP = ToLua.ToParamsObject(L_YXQP, 3, QPYX_count_YXQP - 2);
				UnityEngine.Debug.LogErrorFormat(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else if (TypeChecker.CheckTypes<string>(L_YXQP, 1) && TypeChecker.CheckParamsType<object>(L_YXQP, 2, QPYX_count_YXQP - 1))
			{
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 1);
				object[] QPYX_arg1_YXQP = ToLua.ToParamsObject(L_YXQP, 2, QPYX_count_YXQP - 1);
				UnityEngine.Debug.LogErrorFormat(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Debug.LogErrorFormat");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ClearDeveloperConsole_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 0);
			UnityEngine.Debug.ClearDeveloperConsole();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LogException_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				System.Exception QPYX_arg0_YXQP = (System.Exception)ToLua.CheckObject<System.Exception>(L_YXQP, 1);
				UnityEngine.Debug.LogException(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 2)
			{
				System.Exception QPYX_arg0_YXQP = (System.Exception)ToLua.CheckObject<System.Exception>(L_YXQP, 1);
				UnityEngine.Object QPYX_arg1_YXQP = (UnityEngine.Object)ToLua.CheckObject<UnityEngine.Object>(L_YXQP, 2);
				UnityEngine.Debug.LogException(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Debug.LogException");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LogWarning_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 1);
				UnityEngine.Debug.LogWarning(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 2)
			{
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 1);
				UnityEngine.Object QPYX_arg1_YXQP = (UnityEngine.Object)ToLua.CheckObject<UnityEngine.Object>(L_YXQP, 2);
				UnityEngine.Debug.LogWarning(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Debug.LogWarning");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LogWarningFormat_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (TypeChecker.CheckTypes<UnityEngine.Object, string>(L_YXQP, 1) && TypeChecker.CheckParamsType<object>(L_YXQP, 3, QPYX_count_YXQP - 2))
			{
				UnityEngine.Object QPYX_arg0_YXQP = (UnityEngine.Object)ToLua.ToObject(L_YXQP, 1);
				string QPYX_arg1_YXQP = ToLua.ToString(L_YXQP, 2);
				object[] QPYX_arg2_YXQP = ToLua.ToParamsObject(L_YXQP, 3, QPYX_count_YXQP - 2);
				UnityEngine.Debug.LogWarningFormat(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else if (TypeChecker.CheckTypes<string>(L_YXQP, 1) && TypeChecker.CheckParamsType<object>(L_YXQP, 2, QPYX_count_YXQP - 1))
			{
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 1);
				object[] QPYX_arg1_YXQP = ToLua.ToParamsObject(L_YXQP, 2, QPYX_count_YXQP - 1);
				UnityEngine.Debug.LogWarningFormat(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Debug.LogWarningFormat");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Assert_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 1);
				UnityEngine.Debug.Assert(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<string>(L_YXQP, 2))
			{
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 1);
				string QPYX_arg1_YXQP = ToLua.ToString(L_YXQP, 2);
				UnityEngine.Debug.Assert(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<UnityEngine.Object>(L_YXQP, 2))
			{
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 1);
				UnityEngine.Object QPYX_arg1_YXQP = (UnityEngine.Object)ToLua.ToObject(L_YXQP, 2);
				UnityEngine.Debug.Assert(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<object>(L_YXQP, 2))
			{
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 1);
				object QPYX_arg1_YXQP = ToLua.ToVarObject(L_YXQP, 2);
				UnityEngine.Debug.Assert(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<string, UnityEngine.Object>(L_YXQP, 2))
			{
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 1);
				string QPYX_arg1_YXQP = ToLua.ToString(L_YXQP, 2);
				UnityEngine.Object QPYX_arg2_YXQP = (UnityEngine.Object)ToLua.ToObject(L_YXQP, 3);
				UnityEngine.Debug.Assert(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<object, UnityEngine.Object>(L_YXQP, 2))
			{
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 1);
				object QPYX_arg1_YXQP = ToLua.ToVarObject(L_YXQP, 2);
				UnityEngine.Object QPYX_arg2_YXQP = (UnityEngine.Object)ToLua.ToObject(L_YXQP, 3);
				UnityEngine.Debug.Assert(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Debug.Assert");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_AssertFormat_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (TypeChecker.CheckTypes<bool, UnityEngine.Object, string>(L_YXQP, 1) && TypeChecker.CheckParamsType<object>(L_YXQP, 4, QPYX_count_YXQP - 3))
			{
				bool QPYX_arg0_YXQP = LuaDLL.lua_toboolean(L_YXQP, 1);
				UnityEngine.Object QPYX_arg1_YXQP = (UnityEngine.Object)ToLua.ToObject(L_YXQP, 2);
				string QPYX_arg2_YXQP = ToLua.ToString(L_YXQP, 3);
				object[] QPYX_arg3_YXQP = ToLua.ToParamsObject(L_YXQP, 4, QPYX_count_YXQP - 3);
				UnityEngine.Debug.AssertFormat(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				return 0;
			}
			else if (TypeChecker.CheckTypes<bool, string>(L_YXQP, 1) && TypeChecker.CheckParamsType<object>(L_YXQP, 3, QPYX_count_YXQP - 2))
			{
				bool QPYX_arg0_YXQP = LuaDLL.lua_toboolean(L_YXQP, 1);
				string QPYX_arg1_YXQP = ToLua.ToString(L_YXQP, 2);
				object[] QPYX_arg2_YXQP = ToLua.ToParamsObject(L_YXQP, 3, QPYX_count_YXQP - 2);
				UnityEngine.Debug.AssertFormat(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Debug.AssertFormat");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LogAssertion_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 1);
				UnityEngine.Debug.LogAssertion(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 2)
			{
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 1);
				UnityEngine.Object QPYX_arg1_YXQP = (UnityEngine.Object)ToLua.CheckObject<UnityEngine.Object>(L_YXQP, 2);
				UnityEngine.Debug.LogAssertion(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Debug.LogAssertion");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LogAssertionFormat_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (TypeChecker.CheckTypes<UnityEngine.Object, string>(L_YXQP, 1) && TypeChecker.CheckParamsType<object>(L_YXQP, 3, QPYX_count_YXQP - 2))
			{
				UnityEngine.Object QPYX_arg0_YXQP = (UnityEngine.Object)ToLua.ToObject(L_YXQP, 1);
				string QPYX_arg1_YXQP = ToLua.ToString(L_YXQP, 2);
				object[] QPYX_arg2_YXQP = ToLua.ToParamsObject(L_YXQP, 3, QPYX_count_YXQP - 2);
				UnityEngine.Debug.LogAssertionFormat(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else if (TypeChecker.CheckTypes<string>(L_YXQP, 1) && TypeChecker.CheckParamsType<object>(L_YXQP, 2, QPYX_count_YXQP - 1))
			{
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 1);
				object[] QPYX_arg1_YXQP = ToLua.ToParamsObject(L_YXQP, 2, QPYX_count_YXQP - 1);
				UnityEngine.Debug.LogAssertionFormat(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Debug.LogAssertionFormat");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_unityLogger_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.PushObject(L_YXQP, UnityEngine.Debug.unityLogger);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_developerConsoleVisible_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushboolean(L_YXQP, UnityEngine.Debug.developerConsoleVisible);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isDebugBuild_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushboolean(L_YXQP, UnityEngine.Debug.isDebugBuild);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_developerConsoleVisible_YXQP(IntPtr L_YXQP)
	{
		try
		{
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			UnityEngine.Debug.developerConsoleVisible = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}
}

