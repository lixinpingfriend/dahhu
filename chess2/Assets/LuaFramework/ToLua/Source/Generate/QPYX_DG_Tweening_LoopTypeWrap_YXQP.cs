using System;
using LuaInterface;

public class QPYX_DG_Tweening_LoopTypeWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginEnum(typeof(DG.Tweening.LoopType));
		L_YXQP.RegVar("Restart", QPYX_get_Restart_YXQP, null);
		L_YXQP.RegVar("Yoyo", QPYX_get_Yoyo_YXQP, null);
		L_YXQP.RegVar("Incremental", QPYX_get_Incremental_YXQP, null);
		L_YXQP.RegFunction("IntToEnum", QPYX_IntToEnum_YXQP);
		L_YXQP.EndEnum();
		//dddddd
		TypeTraits<DG.Tweening.LoopType>.Check = QPYX_CheckType_YXQP;
		StackTraits<DG.Tweening.LoopType>.Push = QPYX_Push_YXQP;
	}

	static void QPYX_Push_YXQP(IntPtr L_YXQP, DG.Tweening.LoopType arg_YXQP)
	{
		ToLua.Push(L_YXQP, arg_YXQP);	}

	static bool QPYX_CheckType_YXQP(IntPtr L_YXQP, int pos_YXQP)	{
		return TypeChecker.CheckEnumType(typeof(DG.Tweening.LoopType), L_YXQP, pos_YXQP);
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_Restart_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.LoopType.Restart);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_Yoyo_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.LoopType.Yoyo);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_Incremental_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.LoopType.Incremental);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IntToEnum_YXQP(IntPtr L_YXQP)	{
		int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 1);		DG.Tweening.LoopType QPYX_o_YXQP = (DG.Tweening.LoopType)QPYX_arg0_YXQP;
		ToLua.Push(L_YXQP, QPYX_o_YXQP);		return 1;
	}
}

