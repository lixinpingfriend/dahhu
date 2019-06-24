using System;
using LuaInterface;

public class QPYX_UnityEngine_UI_VerticalLayoutGroupWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.UI.VerticalLayoutGroup), typeof(UnityEngine.UI.HorizontalOrVerticalLayoutGroup));
		L_YXQP.RegFunction("CalculateLayoutInputHorizontal", QPYX_CalculateLayoutInputHorizontal_YXQP);
		L_YXQP.RegFunction("CalculateLayoutInputVertical", QPYX_CalculateLayoutInputVertical_YXQP);
		L_YXQP.RegFunction("SetLayoutHorizontal", QPYX_SetLayoutHorizontal_YXQP);
		L_YXQP.RegFunction("SetLayoutVertical", QPYX_SetLayoutVertical_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CalculateLayoutInputHorizontal_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.VerticalLayoutGroup  QPYX_obj_YXQP  = (UnityEngine.UI.VerticalLayoutGroup)ToLua.CheckObject<UnityEngine.UI.VerticalLayoutGroup>(L_YXQP, 1);
			QPYX_obj_YXQP.CalculateLayoutInputHorizontal();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CalculateLayoutInputVertical_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.VerticalLayoutGroup  QPYX_obj_YXQP  = (UnityEngine.UI.VerticalLayoutGroup)ToLua.CheckObject<UnityEngine.UI.VerticalLayoutGroup>(L_YXQP, 1);
			QPYX_obj_YXQP.CalculateLayoutInputVertical();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetLayoutHorizontal_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.VerticalLayoutGroup  QPYX_obj_YXQP  = (UnityEngine.UI.VerticalLayoutGroup)ToLua.CheckObject<UnityEngine.UI.VerticalLayoutGroup>(L_YXQP, 1);
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
			UnityEngine.UI.VerticalLayoutGroup  QPYX_obj_YXQP  = (UnityEngine.UI.VerticalLayoutGroup)ToLua.CheckObject<UnityEngine.UI.VerticalLayoutGroup>(L_YXQP, 1);
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
}

