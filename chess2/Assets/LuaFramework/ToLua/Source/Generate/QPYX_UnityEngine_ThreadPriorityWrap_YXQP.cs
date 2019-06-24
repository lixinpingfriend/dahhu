using System;
using LuaInterface;

public class QPYX_UnityEngine_ThreadPriorityWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginEnum(typeof(UnityEngine.ThreadPriority));
		L_YXQP.RegVar("Low", QPYX_get_Low_YXQP, null);
		L_YXQP.RegVar("BelowNormal", QPYX_get_BelowNormal_YXQP, null);
		L_YXQP.RegVar("Normal", QPYX_get_Normal_YXQP, null);
		L_YXQP.RegVar("High", QPYX_get_High_YXQP, null);
		L_YXQP.RegFunction("IntToEnum", QPYX_IntToEnum_YXQP);
		L_YXQP.EndEnum();
		//dddddd
		TypeTraits<UnityEngine.ThreadPriority>.Check = QPYX_CheckType_YXQP;
		StackTraits<UnityEngine.ThreadPriority>.Push = QPYX_Push_YXQP;
	}

	static void QPYX_Push_YXQP(IntPtr L_YXQP, UnityEngine.ThreadPriority arg_YXQP)
	{
		ToLua.Push(L_YXQP, arg_YXQP);	}

	static bool QPYX_CheckType_YXQP(IntPtr L_YXQP, int pos_YXQP)	{
		return TypeChecker.CheckEnumType(typeof(UnityEngine.ThreadPriority), L_YXQP, pos_YXQP);
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_Low_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.ThreadPriority.Low);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_BelowNormal_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.ThreadPriority.BelowNormal);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_Normal_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.ThreadPriority.Normal);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_High_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.ThreadPriority.High);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IntToEnum_YXQP(IntPtr L_YXQP)	{
		int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 1);		UnityEngine.ThreadPriority QPYX_o_YXQP = (UnityEngine.ThreadPriority)QPYX_arg0_YXQP;
		ToLua.Push(L_YXQP, QPYX_o_YXQP);		return 1;
	}
}

