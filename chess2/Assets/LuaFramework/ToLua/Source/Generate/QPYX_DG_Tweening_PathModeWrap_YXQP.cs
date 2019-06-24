using System;
using LuaInterface;

public class QPYX_DG_Tweening_PathModeWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginEnum(typeof(DG.Tweening.PathMode));
		L_YXQP.RegVar("Ignore", QPYX_get_Ignore_YXQP, null);
		L_YXQP.RegVar("Full3D", QPYX_get_Full3D_YXQP, null);
		L_YXQP.RegVar("TopDown2D", QPYX_get_TopDown2D_YXQP, null);
		L_YXQP.RegVar("Sidescroller2D", QPYX_get_Sidescroller2D_YXQP, null);
		L_YXQP.RegFunction("IntToEnum", QPYX_IntToEnum_YXQP);
		L_YXQP.EndEnum();
		//dddddd
		TypeTraits<DG.Tweening.PathMode>.Check = QPYX_CheckType_YXQP;
		StackTraits<DG.Tweening.PathMode>.Push = QPYX_Push_YXQP;
	}

	static void QPYX_Push_YXQP(IntPtr L_YXQP, DG.Tweening.PathMode arg_YXQP)
	{
		ToLua.Push(L_YXQP, arg_YXQP);	}

	static bool QPYX_CheckType_YXQP(IntPtr L_YXQP, int pos_YXQP)	{
		return TypeChecker.CheckEnumType(typeof(DG.Tweening.PathMode), L_YXQP, pos_YXQP);
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_Ignore_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.PathMode.Ignore);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_Full3D_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.PathMode.Full3D);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_TopDown2D_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.PathMode.TopDown2D);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_Sidescroller2D_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.PathMode.Sidescroller2D);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IntToEnum_YXQP(IntPtr L_YXQP)	{
		int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 1);		DG.Tweening.PathMode QPYX_o_YXQP = (DG.Tweening.PathMode)QPYX_arg0_YXQP;
		ToLua.Push(L_YXQP, QPYX_o_YXQP);		return 1;
	}
}

