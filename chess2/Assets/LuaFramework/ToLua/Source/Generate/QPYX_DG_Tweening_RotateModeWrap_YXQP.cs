using System;
using LuaInterface;

public class QPYX_DG_Tweening_RotateModeWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginEnum(typeof(DG.Tweening.RotateMode));
		L_YXQP.RegVar("Fast", QPYX_get_Fast_YXQP, null);
		L_YXQP.RegVar("FastBeyond360", QPYX_get_FastBeyond360_YXQP, null);
		L_YXQP.RegVar("WorldAxisAdd", QPYX_get_WorldAxisAdd_YXQP, null);
		L_YXQP.RegVar("LocalAxisAdd", QPYX_get_LocalAxisAdd_YXQP, null);
		L_YXQP.RegFunction("IntToEnum", QPYX_IntToEnum_YXQP);
		L_YXQP.EndEnum();
		//dddddd
		TypeTraits<DG.Tweening.RotateMode>.Check = QPYX_CheckType_YXQP;
		StackTraits<DG.Tweening.RotateMode>.Push = QPYX_Push_YXQP;
	}

	static void QPYX_Push_YXQP(IntPtr L_YXQP, DG.Tweening.RotateMode arg_YXQP)
	{
		ToLua.Push(L_YXQP, arg_YXQP);	}

	static bool QPYX_CheckType_YXQP(IntPtr L_YXQP, int pos_YXQP)	{
		return TypeChecker.CheckEnumType(typeof(DG.Tweening.RotateMode), L_YXQP, pos_YXQP);
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_Fast_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.RotateMode.Fast);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_FastBeyond360_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.RotateMode.FastBeyond360);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_WorldAxisAdd_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.RotateMode.WorldAxisAdd);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_LocalAxisAdd_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.RotateMode.LocalAxisAdd);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IntToEnum_YXQP(IntPtr L_YXQP)	{
		int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 1);		DG.Tweening.RotateMode QPYX_o_YXQP = (DG.Tweening.RotateMode)QPYX_arg0_YXQP;
		ToLua.Push(L_YXQP, QPYX_o_YXQP);		return 1;
	}
}

