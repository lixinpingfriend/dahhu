using System;
using LuaInterface;

public class QPYX_UnityEngine_UI_ContentSizeFitterWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.UI.ContentSizeFitter), typeof(UnityEngine.EventSystems.UIBehaviour));
		L_YXQP.RegFunction("SetLayoutHorizontal", QPYX_SetLayoutHorizontal_YXQP);
		L_YXQP.RegFunction("SetLayoutVertical", QPYX_SetLayoutVertical_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("horizontalFit", QPYX_get_horizontalFit_YXQP, QPYX_set_horizontalFit_YXQP);
		L_YXQP.RegVar("verticalFit", QPYX_get_verticalFit_YXQP, QPYX_set_verticalFit_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetLayoutHorizontal_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.ContentSizeFitter  QPYX_obj_YXQP  = (UnityEngine.UI.ContentSizeFitter)ToLua.CheckObject<UnityEngine.UI.ContentSizeFitter>(L_YXQP, 1);
			QPYX_obj_YXQP.SetLayoutHorizontal();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetLayoutVertical_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.ContentSizeFitter  QPYX_obj_YXQP  = (UnityEngine.UI.ContentSizeFitter)ToLua.CheckObject<UnityEngine.UI.ContentSizeFitter>(L_YXQP, 1);
			QPYX_obj_YXQP.SetLayoutVertical();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_op_Equality_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Object QPYX_arg0_YXQP = (UnityEngine.Object)ToLua.ToObject(L_YXQP, 1);
			UnityEngine.Object QPYX_arg1_YXQP = (UnityEngine.Object)ToLua.ToObject(L_YXQP, 2);
			bool QPYX_o_YXQP = QPYX_arg0_YXQP == QPYX_arg1_YXQP;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_horizontalFit_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ContentSizeFitter QPYX_obj_YXQP = (UnityEngine.UI.ContentSizeFitter)QPYX_o_YXQP;
			UnityEngine.UI.ContentSizeFitter.FitMode QPYX_ret_YXQP = QPYX_obj_YXQP.horizontalFit;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index horizontalFit on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_verticalFit_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ContentSizeFitter QPYX_obj_YXQP = (UnityEngine.UI.ContentSizeFitter)QPYX_o_YXQP;
			UnityEngine.UI.ContentSizeFitter.FitMode QPYX_ret_YXQP = QPYX_obj_YXQP.verticalFit;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index verticalFit on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_horizontalFit_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ContentSizeFitter QPYX_obj_YXQP = (UnityEngine.UI.ContentSizeFitter)QPYX_o_YXQP;
			UnityEngine.UI.ContentSizeFitter.FitMode QPYX_arg0_YXQP = (UnityEngine.UI.ContentSizeFitter.FitMode)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.UI.ContentSizeFitter.FitMode));
			QPYX_obj_YXQP.horizontalFit = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index horizontalFit on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_verticalFit_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ContentSizeFitter QPYX_obj_YXQP = (UnityEngine.UI.ContentSizeFitter)QPYX_o_YXQP;
			UnityEngine.UI.ContentSizeFitter.FitMode QPYX_arg0_YXQP = (UnityEngine.UI.ContentSizeFitter.FitMode)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.UI.ContentSizeFitter.FitMode));
			QPYX_obj_YXQP.verticalFit = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index verticalFit on a nil value");
		}
	}
}

