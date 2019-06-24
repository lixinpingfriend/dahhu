using System;
using LuaInterface;

public class QPYX_DG_Tweening_EaseWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginEnum(typeof(DG.Tweening.Ease));
		L_YXQP.RegVar("Unset", QPYX_get_Unset_YXQP, null);
		L_YXQP.RegVar("Linear", QPYX_get_Linear_YXQP, null);
		L_YXQP.RegVar("InSine", QPYX_get_InSine_YXQP, null);
		L_YXQP.RegVar("OutSine", QPYX_get_OutSine_YXQP, null);
		L_YXQP.RegVar("InOutSine", QPYX_get_InOutSine_YXQP, null);
		L_YXQP.RegVar("InQuad", QPYX_get_InQuad_YXQP, null);
		L_YXQP.RegVar("OutQuad", QPYX_get_OutQuad_YXQP, null);
		L_YXQP.RegVar("InOutQuad", QPYX_get_InOutQuad_YXQP, null);
		L_YXQP.RegVar("InCubic", QPYX_get_InCubic_YXQP, null);
		L_YXQP.RegVar("OutCubic", QPYX_get_OutCubic_YXQP, null);
		L_YXQP.RegVar("InOutCubic", QPYX_get_InOutCubic_YXQP, null);
		L_YXQP.RegVar("InQuart", QPYX_get_InQuart_YXQP, null);
		L_YXQP.RegVar("OutQuart", QPYX_get_OutQuart_YXQP, null);
		L_YXQP.RegVar("InOutQuart", QPYX_get_InOutQuart_YXQP, null);
		L_YXQP.RegVar("InQuint", QPYX_get_InQuint_YXQP, null);
		L_YXQP.RegVar("OutQuint", QPYX_get_OutQuint_YXQP, null);
		L_YXQP.RegVar("InOutQuint", QPYX_get_InOutQuint_YXQP, null);
		L_YXQP.RegVar("InExpo", QPYX_get_InExpo_YXQP, null);
		L_YXQP.RegVar("OutExpo", QPYX_get_OutExpo_YXQP, null);
		L_YXQP.RegVar("InOutExpo", QPYX_get_InOutExpo_YXQP, null);
		L_YXQP.RegVar("InCirc", QPYX_get_InCirc_YXQP, null);
		L_YXQP.RegVar("OutCirc", QPYX_get_OutCirc_YXQP, null);
		L_YXQP.RegVar("InOutCirc", QPYX_get_InOutCirc_YXQP, null);
		L_YXQP.RegVar("InElastic", QPYX_get_InElastic_YXQP, null);
		L_YXQP.RegVar("OutElastic", QPYX_get_OutElastic_YXQP, null);
		L_YXQP.RegVar("InOutElastic", QPYX_get_InOutElastic_YXQP, null);
		L_YXQP.RegVar("InBack", QPYX_get_InBack_YXQP, null);
		L_YXQP.RegVar("OutBack", QPYX_get_OutBack_YXQP, null);
		L_YXQP.RegVar("InOutBack", QPYX_get_InOutBack_YXQP, null);
		L_YXQP.RegVar("InBounce", QPYX_get_InBounce_YXQP, null);
		L_YXQP.RegVar("OutBounce", QPYX_get_OutBounce_YXQP, null);
		L_YXQP.RegVar("InOutBounce", QPYX_get_InOutBounce_YXQP, null);
		L_YXQP.RegVar("Flash", QPYX_get_Flash_YXQP, null);
		L_YXQP.RegVar("InFlash", QPYX_get_InFlash_YXQP, null);
		L_YXQP.RegVar("OutFlash", QPYX_get_OutFlash_YXQP, null);
		L_YXQP.RegVar("InOutFlash", QPYX_get_InOutFlash_YXQP, null);
		L_YXQP.RegVar("INTERNAL_Zero", QPYX_get_INTERNAL_Zero_YXQP, null);
		L_YXQP.RegVar("INTERNAL_Custom", QPYX_get_INTERNAL_Custom_YXQP, null);
		L_YXQP.RegFunction("IntToEnum", QPYX_IntToEnum_YXQP);
		L_YXQP.EndEnum();
		//dddddd
		TypeTraits<DG.Tweening.Ease>.Check = QPYX_CheckType_YXQP;
		StackTraits<DG.Tweening.Ease>.Push = QPYX_Push_YXQP;
	}

	static void QPYX_Push_YXQP(IntPtr L_YXQP, DG.Tweening.Ease arg_YXQP)
	{
		ToLua.Push(L_YXQP, arg_YXQP);	}

	static bool QPYX_CheckType_YXQP(IntPtr L_YXQP, int pos_YXQP)	{
		return TypeChecker.CheckEnumType(typeof(DG.Tweening.Ease), L_YXQP, pos_YXQP);
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_Unset_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.Ease.Unset);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_Linear_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.Ease.Linear);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_InSine_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.Ease.InSine);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_OutSine_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.Ease.OutSine);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_InOutSine_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.Ease.InOutSine);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_InQuad_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.Ease.InQuad);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_OutQuad_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.Ease.OutQuad);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_InOutQuad_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.Ease.InOutQuad);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_InCubic_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.Ease.InCubic);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_OutCubic_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.Ease.OutCubic);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_InOutCubic_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.Ease.InOutCubic);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_InQuart_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.Ease.InQuart);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_OutQuart_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.Ease.OutQuart);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_InOutQuart_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.Ease.InOutQuart);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_InQuint_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.Ease.InQuint);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_OutQuint_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.Ease.OutQuint);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_InOutQuint_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.Ease.InOutQuint);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_InExpo_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.Ease.InExpo);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_OutExpo_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.Ease.OutExpo);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_InOutExpo_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.Ease.InOutExpo);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_InCirc_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.Ease.InCirc);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_OutCirc_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.Ease.OutCirc);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_InOutCirc_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.Ease.InOutCirc);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_InElastic_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.Ease.InElastic);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_OutElastic_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.Ease.OutElastic);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_InOutElastic_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.Ease.InOutElastic);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_InBack_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.Ease.InBack);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_OutBack_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.Ease.OutBack);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_InOutBack_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.Ease.InOutBack);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_InBounce_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.Ease.InBounce);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_OutBounce_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.Ease.OutBounce);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_InOutBounce_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.Ease.InOutBounce);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_Flash_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.Ease.Flash);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_InFlash_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.Ease.InFlash);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_OutFlash_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.Ease.OutFlash);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_InOutFlash_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.Ease.InOutFlash);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_INTERNAL_Zero_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.Ease.INTERNAL_Zero);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_INTERNAL_Custom_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, DG.Tweening.Ease.INTERNAL_Custom);
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IntToEnum_YXQP(IntPtr L_YXQP)	{
		int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 1);		DG.Tweening.Ease QPYX_o_YXQP = (DG.Tweening.Ease)QPYX_arg0_YXQP;
		ToLua.Push(L_YXQP, QPYX_o_YXQP);		return 1;
	}
}

