using System;
using LuaInterface;

public class QPYX_UnityEngine_WrapModeWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginEnum(typeof(UnityEngine.WrapMode));
		L_YXQP.RegVar("Once", QPYX_get_Once_YXQP, null);
		L_YXQP.RegVar("Loop", QPYX_get_Loop_YXQP, null);
		L_YXQP.RegVar("PingPong", QPYX_get_PingPong_YXQP, null);
		L_YXQP.RegVar("Default", QPYX_get_Default_YXQP, null);
		L_YXQP.RegVar("ClampForever", QPYX_get_ClampForever_YXQP, null);
		L_YXQP.RegVar("Clamp", QPYX_get_Clamp_YXQP, null);
		L_YXQP.RegFunction("IntToEnum", QPYX_IntToEnum_YXQP);
		L_YXQP.EndEnum();
		//dddddd
		TypeTraits<UnityEngine.WrapMode>.Check = QPYX_CheckType_YXQP;
		StackTraits<UnityEngine.WrapMode>.Push = QPYX_Push_YXQP;
	}

	static void QPYX_Push_YXQP(IntPtr L_YXQP, UnityEngine.WrapMode arg_YXQP)
	{
		ToLua.Push(L_YXQP, arg_YXQP);	}

	static bool QPYX_CheckType_YXQP(IntPtr L_YXQP, int pos_YXQP)	{
		return TypeChecker.CheckEnumType(typeof(UnityEngine.WrapMode), L_YXQP, pos_YXQP);
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_Once_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.WrapMode.Once);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_Loop_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.WrapMode.Loop);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_PingPong_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.WrapMode.PingPong);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_Default_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.WrapMode.Default);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_ClampForever_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.WrapMode.ClampForever);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_Clamp_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.WrapMode.Clamp);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IntToEnum_YXQP(IntPtr L_YXQP)	{
		int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 1);		UnityEngine.WrapMode QPYX_o_YXQP = (UnityEngine.WrapMode)QPYX_arg0_YXQP;
		ToLua.Push(L_YXQP, QPYX_o_YXQP);		return 1;
	}
}

