using System;
using LuaInterface;

public class QPYX_UnityEngine_RenderTextureFormatWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginEnum(typeof(UnityEngine.RenderTextureFormat));
		L_YXQP.RegVar("ARGB32", QPYX_get_ARGB32_YXQP, null);
		L_YXQP.RegVar("Depth", QPYX_get_Depth_YXQP, null);
		L_YXQP.RegVar("ARGBHalf", QPYX_get_ARGBHalf_YXQP, null);
		L_YXQP.RegVar("Shadowmap", QPYX_get_Shadowmap_YXQP, null);
		L_YXQP.RegVar("RGB565", QPYX_get_RGB565_YXQP, null);
		L_YXQP.RegVar("ARGB4444", QPYX_get_ARGB4444_YXQP, null);
		L_YXQP.RegVar("ARGB1555", QPYX_get_ARGB1555_YXQP, null);
		L_YXQP.RegVar("Default", QPYX_get_Default_YXQP, null);
		L_YXQP.RegVar("ARGB2101010", QPYX_get_ARGB2101010_YXQP, null);
		L_YXQP.RegVar("DefaultHDR", QPYX_get_DefaultHDR_YXQP, null);
		L_YXQP.RegVar("ARGB64", QPYX_get_ARGB64_YXQP, null);
		L_YXQP.RegVar("ARGBFloat", QPYX_get_ARGBFloat_YXQP, null);
		L_YXQP.RegVar("RGFloat", QPYX_get_RGFloat_YXQP, null);
		L_YXQP.RegVar("RGHalf", QPYX_get_RGHalf_YXQP, null);
		L_YXQP.RegVar("RFloat", QPYX_get_RFloat_YXQP, null);
		L_YXQP.RegVar("RHalf", QPYX_get_RHalf_YXQP, null);
		L_YXQP.RegVar("R8", QPYX_get_R8_YXQP, null);
		L_YXQP.RegVar("ARGBInt", QPYX_get_ARGBInt_YXQP, null);
		L_YXQP.RegVar("RGInt", QPYX_get_RGInt_YXQP, null);
		L_YXQP.RegVar("RInt", QPYX_get_RInt_YXQP, null);
		L_YXQP.RegVar("BGRA32", QPYX_get_BGRA32_YXQP, null);
		L_YXQP.RegVar("RGB111110Float", QPYX_get_RGB111110Float_YXQP, null);
		L_YXQP.RegVar("RG32", QPYX_get_RG32_YXQP, null);
		L_YXQP.RegVar("RGBAUShort", QPYX_get_RGBAUShort_YXQP, null);
		L_YXQP.RegVar("RG16", QPYX_get_RG16_YXQP, null);
		L_YXQP.RegVar("BGRA10101010_XR", QPYX_get_BGRA10101010_XR_YXQP, null);
		L_YXQP.RegVar("BGR101010_XR", QPYX_get_BGR101010_XR_YXQP, null);
		L_YXQP.RegFunction("IntToEnum", QPYX_IntToEnum_YXQP);
		L_YXQP.EndEnum();
		//dddddd
		TypeTraits<UnityEngine.RenderTextureFormat>.Check = QPYX_CheckType_YXQP;
		StackTraits<UnityEngine.RenderTextureFormat>.Push = QPYX_Push_YXQP;
	}

	static void QPYX_Push_YXQP(IntPtr L_YXQP, UnityEngine.RenderTextureFormat arg_YXQP)
	{
		ToLua.Push(L_YXQP, arg_YXQP);	}

	static bool QPYX_CheckType_YXQP(IntPtr L_YXQP, int pos_YXQP)	{
		return TypeChecker.CheckEnumType(typeof(UnityEngine.RenderTextureFormat), L_YXQP, pos_YXQP);
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_ARGB32_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.RenderTextureFormat.ARGB32);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_Depth_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.RenderTextureFormat.Depth);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_ARGBHalf_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.RenderTextureFormat.ARGBHalf);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_Shadowmap_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.RenderTextureFormat.Shadowmap);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_RGB565_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.RenderTextureFormat.RGB565);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_ARGB4444_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.RenderTextureFormat.ARGB4444);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_ARGB1555_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.RenderTextureFormat.ARGB1555);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_Default_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.RenderTextureFormat.Default);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_ARGB2101010_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.RenderTextureFormat.ARGB2101010);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_DefaultHDR_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.RenderTextureFormat.DefaultHDR);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_ARGB64_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.RenderTextureFormat.ARGB64);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_ARGBFloat_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.RenderTextureFormat.ARGBFloat);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_RGFloat_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.RenderTextureFormat.RGFloat);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_RGHalf_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.RenderTextureFormat.RGHalf);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_RFloat_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.RenderTextureFormat.RFloat);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_RHalf_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.RenderTextureFormat.RHalf);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_R8_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.RenderTextureFormat.R8);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_ARGBInt_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.RenderTextureFormat.ARGBInt);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_RGInt_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.RenderTextureFormat.RGInt);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_RInt_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.RenderTextureFormat.RInt);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_BGRA32_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.RenderTextureFormat.BGRA32);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_RGB111110Float_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.RenderTextureFormat.RGB111110Float);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_RG32_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.RenderTextureFormat.RG32);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_RGBAUShort_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.RenderTextureFormat.RGBAUShort);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_RG16_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.RenderTextureFormat.RG16);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_BGRA10101010_XR_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.RenderTextureFormat.BGRA10101010_XR);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_BGR101010_XR_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.RenderTextureFormat.BGR101010_XR);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IntToEnum_YXQP(IntPtr L_YXQP)	{
		int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 1);		UnityEngine.RenderTextureFormat QPYX_o_YXQP = (UnityEngine.RenderTextureFormat)QPYX_arg0_YXQP;
		ToLua.Push(L_YXQP, QPYX_o_YXQP);		return 1;
	}
}

