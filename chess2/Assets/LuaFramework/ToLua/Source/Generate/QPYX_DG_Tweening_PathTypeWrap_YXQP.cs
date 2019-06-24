using System;
using LuaInterface;

public class QPYX_DG_Tweening_PathTypeWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginEnum(typeof(DG.Tweening.PathType));
		L_YXQP.RegVar("Linear", QPYX_get_Linear_YXQP, null);
		L_YXQP.RegVar("CatmullRom", QPYX_get_CatmullRom_YXQP, null);
		L_YXQP.RegFunction("IntToEnum", QPYX_IntToEnum_YXQP);
		L_YXQP.EndEnum();
		//dddddd
		TypeTraits<DG.Tweening.PathType>.Check = QPYX_CheckType_YXQP;
		StackTraits<DG.Tweening.PathType>.Push = QPYX_Push_YXQP;
	}

	static void QPYX_Push_YXQP(IntPtr L_YXQP, DG.Tweening.PathType arg_YXQP)
	{
		ToLua.Push(L_YXQP, arg_YXQP);	}

	static bool QPYX_CheckType_YXQP(IntPtr L_YXQP, int pos_YXQP)	{
		return TypeChecker.CheckEnumType(typeof(DG.Tweening.PathType), L_YXQP, pos_YXQP);
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_Linear_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.PathType.Linear);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_CatmullRom_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.PathType.CatmullRom);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IntToEnum_YXQP(IntPtr L_YXQP)	{
		int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 1);		DG.Tweening.PathType QPYX_o_YXQP = (DG.Tweening.PathType)QPYX_arg0_YXQP;
		ToLua.Push(L_YXQP, QPYX_o_YXQP);		return 1;
	}
}

