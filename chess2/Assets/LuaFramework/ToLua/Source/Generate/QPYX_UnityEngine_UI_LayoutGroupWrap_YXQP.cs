using System;
using LuaInterface;

public class QPYX_UnityEngine_UI_LayoutGroupWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.UI.LayoutGroup), typeof(UnityEngine.EventSystems.UIBehaviour));
		L_YXQP.RegFunction("CalculateLayoutInputHorizontal", QPYX_CalculateLayoutInputHorizontal_YXQP);
		L_YXQP.RegFunction("CalculateLayoutInputVertical", QPYX_CalculateLayoutInputVertical_YXQP);
		L_YXQP.RegFunction("SetLayoutHorizontal", QPYX_SetLayoutHorizontal_YXQP);
		L_YXQP.RegFunction("SetLayoutVertical", QPYX_SetLayoutVertical_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("padding", QPYX_get_padding_YXQP, QPYX_set_padding_YXQP);
		L_YXQP.RegVar("childAlignment", QPYX_get_childAlignment_YXQP, QPYX_set_childAlignment_YXQP);
		L_YXQP.RegVar("minWidth", QPYX_get_minWidth_YXQP, null);
		L_YXQP.RegVar("preferredWidth", QPYX_get_preferredWidth_YXQP, null);
		L_YXQP.RegVar("flexibleWidth", QPYX_get_flexibleWidth_YXQP, null);
		L_YXQP.RegVar("minHeight", QPYX_get_minHeight_YXQP, null);
		L_YXQP.RegVar("preferredHeight", QPYX_get_preferredHeight_YXQP, null);
		L_YXQP.RegVar("flexibleHeight", QPYX_get_flexibleHeight_YXQP, null);
		L_YXQP.RegVar("layoutPriority", QPYX_get_layoutPriority_YXQP, null);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CalculateLayoutInputHorizontal_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.LayoutGroup  QPYX_obj_YXQP  = (UnityEngine.UI.LayoutGroup)ToLua.CheckObject<UnityEngine.UI.LayoutGroup>(L_YXQP, 1);
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
			UnityEngine.UI.LayoutGroup  QPYX_obj_YXQP  = (UnityEngine.UI.LayoutGroup)ToLua.CheckObject<UnityEngine.UI.LayoutGroup>(L_YXQP, 1);
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
			UnityEngine.UI.LayoutGroup  QPYX_obj_YXQP  = (UnityEngine.UI.LayoutGroup)ToLua.CheckObject<UnityEngine.UI.LayoutGroup>(L_YXQP, 1);
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
			UnityEngine.UI.LayoutGroup  QPYX_obj_YXQP  = (UnityEngine.UI.LayoutGroup)ToLua.CheckObject<UnityEngine.UI.LayoutGroup>(L_YXQP, 1);
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
	static int QPYX_get_padding_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.LayoutGroup QPYX_obj_YXQP = (UnityEngine.UI.LayoutGroup)QPYX_o_YXQP;
			UnityEngine.RectOffset QPYX_ret_YXQP = QPYX_obj_YXQP.padding;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index padding on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_childAlignment_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.LayoutGroup QPYX_obj_YXQP = (UnityEngine.UI.LayoutGroup)QPYX_o_YXQP;
			UnityEngine.TextAnchor QPYX_ret_YXQP = QPYX_obj_YXQP.childAlignment;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index childAlignment on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_minWidth_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.LayoutGroup QPYX_obj_YXQP = (UnityEngine.UI.LayoutGroup)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.minWidth;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index minWidth on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_preferredWidth_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.LayoutGroup QPYX_obj_YXQP = (UnityEngine.UI.LayoutGroup)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.preferredWidth;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index preferredWidth on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_flexibleWidth_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.LayoutGroup QPYX_obj_YXQP = (UnityEngine.UI.LayoutGroup)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.flexibleWidth;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index flexibleWidth on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_minHeight_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.LayoutGroup QPYX_obj_YXQP = (UnityEngine.UI.LayoutGroup)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.minHeight;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index minHeight on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_preferredHeight_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.LayoutGroup QPYX_obj_YXQP = (UnityEngine.UI.LayoutGroup)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.preferredHeight;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index preferredHeight on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_flexibleHeight_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.LayoutGroup QPYX_obj_YXQP = (UnityEngine.UI.LayoutGroup)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.flexibleHeight;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index flexibleHeight on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_layoutPriority_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.LayoutGroup QPYX_obj_YXQP = (UnityEngine.UI.LayoutGroup)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.layoutPriority;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index layoutPriority on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_padding_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.LayoutGroup QPYX_obj_YXQP = (UnityEngine.UI.LayoutGroup)QPYX_o_YXQP;
			UnityEngine.RectOffset QPYX_arg0_YXQP = (UnityEngine.RectOffset)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.RectOffset));
			QPYX_obj_YXQP.padding = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index padding on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_childAlignment_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.LayoutGroup QPYX_obj_YXQP = (UnityEngine.UI.LayoutGroup)QPYX_o_YXQP;
			UnityEngine.TextAnchor QPYX_arg0_YXQP = (UnityEngine.TextAnchor)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.TextAnchor));
			QPYX_obj_YXQP.childAlignment = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index childAlignment on a nil value");
		}
	}
}

