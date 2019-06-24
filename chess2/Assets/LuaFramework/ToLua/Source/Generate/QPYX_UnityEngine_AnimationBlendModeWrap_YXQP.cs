using System;
using LuaInterface;

public class QPYX_UnityEngine_AnimationBlendModeWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginEnum(typeof(UnityEngine.AnimationBlendMode));
		L_YXQP.RegVar("Blend", QPYX_get_Blend_YXQP, null);
		L_YXQP.RegVar("Additive", QPYX_get_Additive_YXQP, null);
		L_YXQP.RegFunction("IntToEnum", QPYX_IntToEnum_YXQP);
		L_YXQP.EndEnum();
		//dddddd
		TypeTraits<UnityEngine.AnimationBlendMode>.Check = QPYX_CheckType_YXQP;
		StackTraits<UnityEngine.AnimationBlendMode>.Push = QPYX_Push_YXQP;
	}

	static void QPYX_Push_YXQP(IntPtr L_YXQP, UnityEngine.AnimationBlendMode arg_YXQP)
	{
		ToLua.Push(L_YXQP, arg_YXQP);	}

	static bool QPYX_CheckType_YXQP(IntPtr L_YXQP, int pos_YXQP)	{
		return TypeChecker.CheckEnumType(typeof(UnityEngine.AnimationBlendMode), L_YXQP, pos_YXQP);
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_Blend_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.AnimationBlendMode.Blend);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_Additive_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, UnityEngine.AnimationBlendMode.Additive);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IntToEnum_YXQP(IntPtr L_YXQP)	{
		int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 1);		UnityEngine.AnimationBlendMode QPYX_o_YXQP = (UnityEngine.AnimationBlendMode)QPYX_arg0_YXQP;
		ToLua.Push(L_YXQP, QPYX_o_YXQP);		return 1;
	}
}

