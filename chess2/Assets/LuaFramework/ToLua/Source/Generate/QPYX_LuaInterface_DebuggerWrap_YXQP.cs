using System;
using LuaInterface;

public class QPYX_LuaInterface_DebuggerWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginStaticLibs("Debugger");
		L_YXQP.RegFunction("Log", QPYX_Log_YXQP);
		L_YXQP.RegFunction("LogWarning", QPYX_LogWarning_YXQP);
		L_YXQP.RegFunction("LogError", QPYX_LogError_YXQP);
		L_YXQP.RegFunction("LogException", QPYX_LogException_YXQP);
		L_YXQP.RegVar("useLog", QPYX_get_useLog_YXQP, QPYX_set_useLog_YXQP);
		L_YXQP.RegVar("threadStack", QPYX_get_threadStack_YXQP, QPYX_set_threadStack_YXQP);
		L_YXQP.RegVar("logger", QPYX_get_logger_YXQP, QPYX_set_logger_YXQP);
		L_YXQP.EndStaticLibs();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Log_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1 && TypeChecker.CheckTypes<string>(L_YXQP, 1))
			{
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 1);
				LuaInterface.Debugger.Log(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 1 && TypeChecker.CheckTypes<object>(L_YXQP, 1))
			{
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 1);
				LuaInterface.Debugger.Log(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<string, object>(L_YXQP, 1))
			{
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 1);
				object QPYX_arg1_YXQP = ToLua.ToVarObject(L_YXQP, 2);
				LuaInterface.Debugger.Log(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<string, object, object>(L_YXQP, 1))
			{
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 1);
				object QPYX_arg1_YXQP = ToLua.ToVarObject(L_YXQP, 2);
				object QPYX_arg2_YXQP = ToLua.ToVarObject(L_YXQP, 3);
				LuaInterface.Debugger.Log(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<string, object, object, object>(L_YXQP, 1))
			{
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 1);
				object QPYX_arg1_YXQP = ToLua.ToVarObject(L_YXQP, 2);
				object QPYX_arg2_YXQP = ToLua.ToVarObject(L_YXQP, 3);
				object QPYX_arg3_YXQP = ToLua.ToVarObject(L_YXQP, 4);
				LuaInterface.Debugger.Log(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				return 0;
			}
			else if (TypeChecker.CheckTypes<string>(L_YXQP, 1) && TypeChecker.CheckParamsType<object>(L_YXQP, 2, QPYX_count_YXQP - 1))
			{
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 1);
				object[] QPYX_arg1_YXQP = ToLua.ToParamsObject(L_YXQP, 2, QPYX_count_YXQP - 1);
				LuaInterface.Debugger.Log(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: LuaInterface.Debugger.Log");
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
			if (QPYX_count_YXQP == 1 && TypeChecker.CheckTypes<string>(L_YXQP, 1))
			{
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 1);
				LuaInterface.Debugger.LogWarning(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 1 && TypeChecker.CheckTypes<object>(L_YXQP, 1))
			{
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 1);
				LuaInterface.Debugger.LogWarning(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<string, object>(L_YXQP, 1))
			{
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 1);
				object QPYX_arg1_YXQP = ToLua.ToVarObject(L_YXQP, 2);
				LuaInterface.Debugger.LogWarning(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<string, object, object>(L_YXQP, 1))
			{
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 1);
				object QPYX_arg1_YXQP = ToLua.ToVarObject(L_YXQP, 2);
				object QPYX_arg2_YXQP = ToLua.ToVarObject(L_YXQP, 3);
				LuaInterface.Debugger.LogWarning(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<string, object, object, object>(L_YXQP, 1))
			{
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 1);
				object QPYX_arg1_YXQP = ToLua.ToVarObject(L_YXQP, 2);
				object QPYX_arg2_YXQP = ToLua.ToVarObject(L_YXQP, 3);
				object QPYX_arg3_YXQP = ToLua.ToVarObject(L_YXQP, 4);
				LuaInterface.Debugger.LogWarning(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				return 0;
			}
			else if (TypeChecker.CheckTypes<string>(L_YXQP, 1) && TypeChecker.CheckParamsType<object>(L_YXQP, 2, QPYX_count_YXQP - 1))
			{
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 1);
				object[] QPYX_arg1_YXQP = ToLua.ToParamsObject(L_YXQP, 2, QPYX_count_YXQP - 1);
				LuaInterface.Debugger.LogWarning(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: LuaInterface.Debugger.LogWarning");
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
			if (QPYX_count_YXQP == 1 && TypeChecker.CheckTypes<string>(L_YXQP, 1))
			{
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 1);
				LuaInterface.Debugger.LogError(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 1 && TypeChecker.CheckTypes<object>(L_YXQP, 1))
			{
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 1);
				LuaInterface.Debugger.LogError(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<string, object>(L_YXQP, 1))
			{
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 1);
				object QPYX_arg1_YXQP = ToLua.ToVarObject(L_YXQP, 2);
				LuaInterface.Debugger.LogError(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<string, object, object>(L_YXQP, 1))
			{
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 1);
				object QPYX_arg1_YXQP = ToLua.ToVarObject(L_YXQP, 2);
				object QPYX_arg2_YXQP = ToLua.ToVarObject(L_YXQP, 3);
				LuaInterface.Debugger.LogError(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<string, object, object, object>(L_YXQP, 1))
			{
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 1);
				object QPYX_arg1_YXQP = ToLua.ToVarObject(L_YXQP, 2);
				object QPYX_arg2_YXQP = ToLua.ToVarObject(L_YXQP, 3);
				object QPYX_arg3_YXQP = ToLua.ToVarObject(L_YXQP, 4);
				LuaInterface.Debugger.LogError(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				return 0;
			}
			else if (TypeChecker.CheckTypes<string>(L_YXQP, 1) && TypeChecker.CheckParamsType<object>(L_YXQP, 2, QPYX_count_YXQP - 1))
			{
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 1);
				object[] QPYX_arg1_YXQP = ToLua.ToParamsObject(L_YXQP, 2, QPYX_count_YXQP - 1);
				LuaInterface.Debugger.LogError(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: LuaInterface.Debugger.LogError");
			}
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
				LuaInterface.Debugger.LogException(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 2)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				System.Exception QPYX_arg1_YXQP = (System.Exception)ToLua.CheckObject<System.Exception>(L_YXQP, 2);
				LuaInterface.Debugger.LogException(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: LuaInterface.Debugger.LogException");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_useLog_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushboolean(L_YXQP, LuaInterface.Debugger.useLog);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_threadStack_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushstring(L_YXQP, LuaInterface.Debugger.threadStack);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_logger_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.PushObject(L_YXQP, LuaInterface.Debugger.logger);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_useLog_YXQP(IntPtr L_YXQP)
	{
		try
		{
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			LuaInterface.Debugger.useLog = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_threadStack_YXQP(IntPtr L_YXQP)
	{
		try
		{
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			LuaInterface.Debugger.threadStack = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_logger_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaInterface.ILogger QPYX_arg0_YXQP = (LuaInterface.ILogger)ToLua.CheckObject<LuaInterface.ILogger>(L_YXQP, 2);
			LuaInterface.Debugger.logger = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}
}

