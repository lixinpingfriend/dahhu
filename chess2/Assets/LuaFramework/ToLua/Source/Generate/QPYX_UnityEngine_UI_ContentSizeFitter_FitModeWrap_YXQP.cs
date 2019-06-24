using System;
using LuaInterface;

public class QPYX_UnityEngine_UI_ContentSizeFitter_FitModeWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginEnum(typeof(UnityEngine.UI.ContentSizeFitter.FitMode));
		L_YXQP.RegVar("Unconstrained", QPYX_get_Unconstrained_YXQP, null);
		L_YXQP.RegVar("MinSize", QPYX_get_MinSize_YXQP, null);
		L_YXQP.RegVar("PreferredSize", QPYX_get_PreferredSize_YXQP, null);
		L_YXQP.RegFunction("IntToEnum", QPYX_IntToEnum_YXQP);
		L_YXQP.EndEnum();
		//dddddd
		TypeTraits<UnityEngine.UI.ContentSizeFitter.FitMode>.Check = QPYX_CheckType_YXQP;
		StackTraits<UnityEngine.UI.ContentSizeFitter.FitMode>.Push = QPYX_Push_YXQP;
	}

	static void QPYX_Push_YXQP(IntPtr L_YXQP, UnityEngine.UI.ContentSizeFitter.FitMode arg_YXQP)
	{
		ToLua.Push(L_YXQP, arg_YXQP);	}

	static bool QPYX_CheckType_YXQP(IntPtr L_YXQP, int pos_YXQP)	{
		return TypeChecker.CheckEnumType(typeof(UnityEngine.UI.ContentSizeFitter.FitMode), L_YXQP, pos_YXQP);
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_Unconstrained_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.UI.ContentSizeFitter.FitMode.Unconstrained);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_MinSize_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.UI.ContentSizeFitter.FitMode.MinSize);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_PreferredSize_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.UI.ContentSizeFitter.FitMode.PreferredSize);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IntToEnum_YXQP(IntPtr L_YXQP)	{
		int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 1);		UnityEngine.UI.ContentSizeFitter.FitMode QPYX_o_YXQP = (UnityEngine.UI.ContentSizeFitter.FitMode)QPYX_arg0_YXQP;
		ToLua.Push(L_YXQP, QPYX_o_YXQP);		return 1;
	}
}

