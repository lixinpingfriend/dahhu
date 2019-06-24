using System;
using LuaInterface;

public class QPYX_UnityEngine_ScreenOrientationWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginEnum(typeof(UnityEngine.ScreenOrientation));
		L_YXQP.RegVar("Unknown", QPYX_get_Unknown_YXQP, null);
		L_YXQP.RegVar("Portrait", QPYX_get_Portrait_YXQP, null);
		L_YXQP.RegVar("PortraitUpsideDown", QPYX_get_PortraitUpsideDown_YXQP, null);
		L_YXQP.RegVar("LandscapeLeft", QPYX_get_LandscapeLeft_YXQP, null);
		L_YXQP.RegVar("LandscapeRight", QPYX_get_LandscapeRight_YXQP, null);
		L_YXQP.RegVar("AutoRotation", QPYX_get_AutoRotation_YXQP, null);
		L_YXQP.RegVar("Landscape", QPYX_get_Landscape_YXQP, null);
		L_YXQP.RegFunction("IntToEnum", QPYX_IntToEnum_YXQP);
		L_YXQP.EndEnum();
		//dddddd
		TypeTraits<UnityEngine.ScreenOrientation>.Check = QPYX_CheckType_YXQP;
		StackTraits<UnityEngine.ScreenOrientation>.Push = QPYX_Push_YXQP;
	}

	static void QPYX_Push_YXQP(IntPtr L_YXQP, UnityEngine.ScreenOrientation arg_YXQP)
	{
		ToLua.Push(L_YXQP, arg_YXQP);	}

	static bool QPYX_CheckType_YXQP(IntPtr L_YXQP, int pos_YXQP)	{
		return TypeChecker.CheckEnumType(typeof(UnityEngine.ScreenOrientation), L_YXQP, pos_YXQP);
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_Unknown_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.ScreenOrientation.Unknown);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_Portrait_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.ScreenOrientation.Portrait);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_PortraitUpsideDown_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.ScreenOrientation.PortraitUpsideDown);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_LandscapeLeft_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.ScreenOrientation.LandscapeLeft);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_LandscapeRight_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.ScreenOrientation.LandscapeRight);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_AutoRotation_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.ScreenOrientation.AutoRotation);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_Landscape_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.ScreenOrientation.Landscape);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IntToEnum_YXQP(IntPtr L_YXQP)	{
		int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 1);		UnityEngine.ScreenOrientation QPYX_o_YXQP = (UnityEngine.ScreenOrientation)QPYX_arg0_YXQP;
		ToLua.Push(L_YXQP, QPYX_o_YXQP);		return 1;
	}
}

