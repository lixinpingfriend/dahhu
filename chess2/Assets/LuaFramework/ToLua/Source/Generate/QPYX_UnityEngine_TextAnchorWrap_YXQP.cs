using System;
using LuaInterface;

public class QPYX_UnityEngine_TextAnchorWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginEnum(typeof(UnityEngine.TextAnchor));
		L_YXQP.RegVar("UpperLeft", QPYX_get_UpperLeft_YXQP, null);
		L_YXQP.RegVar("UpperCenter", QPYX_get_UpperCenter_YXQP, null);
		L_YXQP.RegVar("UpperRight", QPYX_get_UpperRight_YXQP, null);
		L_YXQP.RegVar("MiddleLeft", QPYX_get_MiddleLeft_YXQP, null);
		L_YXQP.RegVar("MiddleCenter", QPYX_get_MiddleCenter_YXQP, null);
		L_YXQP.RegVar("MiddleRight", QPYX_get_MiddleRight_YXQP, null);
		L_YXQP.RegVar("LowerLeft", QPYX_get_LowerLeft_YXQP, null);
		L_YXQP.RegVar("LowerCenter", QPYX_get_LowerCenter_YXQP, null);
		L_YXQP.RegVar("LowerRight", QPYX_get_LowerRight_YXQP, null);
		L_YXQP.RegFunction("IntToEnum", QPYX_IntToEnum_YXQP);
		L_YXQP.EndEnum();
		//dddddd
		TypeTraits<UnityEngine.TextAnchor>.Check = QPYX_CheckType_YXQP;
		StackTraits<UnityEngine.TextAnchor>.Push = QPYX_Push_YXQP;
	}

	static void QPYX_Push_YXQP(IntPtr L_YXQP, UnityEngine.TextAnchor arg_YXQP)
	{
		ToLua.Push(L_YXQP, arg_YXQP);	}

	static bool QPYX_CheckType_YXQP(IntPtr L_YXQP, int pos_YXQP)	{
		return TypeChecker.CheckEnumType(typeof(UnityEngine.TextAnchor), L_YXQP, pos_YXQP);
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_UpperLeft_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.TextAnchor.UpperLeft);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_UpperCenter_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.TextAnchor.UpperCenter);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_UpperRight_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.TextAnchor.UpperRight);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_MiddleLeft_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.TextAnchor.MiddleLeft);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_MiddleCenter_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.TextAnchor.MiddleCenter);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_MiddleRight_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.TextAnchor.MiddleRight);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_LowerLeft_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.TextAnchor.LowerLeft);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_LowerCenter_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.TextAnchor.LowerCenter);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_LowerRight_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.TextAnchor.LowerRight);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IntToEnum_YXQP(IntPtr L_YXQP)	{
		int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 1);		UnityEngine.TextAnchor QPYX_o_YXQP = (UnityEngine.TextAnchor)QPYX_arg0_YXQP;
		ToLua.Push(L_YXQP, QPYX_o_YXQP);		return 1;
	}
}

