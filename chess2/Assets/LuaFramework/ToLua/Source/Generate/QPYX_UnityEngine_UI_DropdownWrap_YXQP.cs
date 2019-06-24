using System;
using LuaInterface;

public class QPYX_UnityEngine_UI_DropdownWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.UI.Dropdown), typeof(UnityEngine.UI.Selectable));
		L_YXQP.RegFunction("RefreshShownValue", QPYX_RefreshShownValue_YXQP);
		L_YXQP.RegFunction("AddOptions", QPYX_AddOptions_YXQP);
		L_YXQP.RegFunction("ClearOptions", QPYX_ClearOptions_YXQP);
		L_YXQP.RegFunction("OnPointerClick", QPYX_OnPointerClick_YXQP);
		L_YXQP.RegFunction("OnSubmit", QPYX_OnSubmit_YXQP);
		L_YXQP.RegFunction("OnCancel", QPYX_OnCancel_YXQP);
		L_YXQP.RegFunction("Show", QPYX_Show_YXQP);
		L_YXQP.RegFunction("Hide", QPYX_Hide_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("template", QPYX_get_template_YXQP, QPYX_set_template_YXQP);
		L_YXQP.RegVar("captionText", QPYX_get_captionText_YXQP, QPYX_set_captionText_YXQP);
		L_YXQP.RegVar("captionImage", QPYX_get_captionImage_YXQP, QPYX_set_captionImage_YXQP);
		L_YXQP.RegVar("itemText", QPYX_get_itemText_YXQP, QPYX_set_itemText_YXQP);
		L_YXQP.RegVar("itemImage", QPYX_get_itemImage_YXQP, QPYX_set_itemImage_YXQP);
		L_YXQP.RegVar("options", QPYX_get_options_YXQP, QPYX_set_options_YXQP);
		L_YXQP.RegVar("onValueChanged", QPYX_get_onValueChanged_YXQP, QPYX_set_onValueChanged_YXQP);
		L_YXQP.RegVar("value", QPYX_get_value_YXQP, QPYX_set_value_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_RefreshShownValue_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.Dropdown  QPYX_obj_YXQP  = (UnityEngine.UI.Dropdown)ToLua.CheckObject<UnityEngine.UI.Dropdown>(L_YXQP, 1);
			QPYX_obj_YXQP.RefreshShownValue();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_AddOptions_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<System.Collections.Generic.List<UnityEngine.Sprite>>(L_YXQP, 2))
			{
				UnityEngine.UI.Dropdown  QPYX_obj_YXQP  = (UnityEngine.UI.Dropdown)ToLua.CheckObject<UnityEngine.UI.Dropdown>(L_YXQP, 1);
				System.Collections.Generic.List<UnityEngine.Sprite> QPYX_arg0_YXQP = (System.Collections.Generic.List<UnityEngine.Sprite>)ToLua.ToObject(L_YXQP, 2);
				QPYX_obj_YXQP.AddOptions(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<System.Collections.Generic.List<string>>(L_YXQP, 2))
			{
				UnityEngine.UI.Dropdown  QPYX_obj_YXQP  = (UnityEngine.UI.Dropdown)ToLua.CheckObject<UnityEngine.UI.Dropdown>(L_YXQP, 1);
				System.Collections.Generic.List<string> QPYX_arg0_YXQP = (System.Collections.Generic.List<string>)ToLua.ToObject(L_YXQP, 2);
				QPYX_obj_YXQP.AddOptions(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<System.Collections.Generic.List<UnityEngine.UI.Dropdown.OptionData>>(L_YXQP, 2))
			{
				UnityEngine.UI.Dropdown  QPYX_obj_YXQP  = (UnityEngine.UI.Dropdown)ToLua.CheckObject<UnityEngine.UI.Dropdown>(L_YXQP, 1);
				System.Collections.Generic.List<UnityEngine.UI.Dropdown.OptionData> QPYX_arg0_YXQP = (System.Collections.Generic.List<UnityEngine.UI.Dropdown.OptionData>)ToLua.ToObject(L_YXQP, 2);
				QPYX_obj_YXQP.AddOptions(QPYX_arg0_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.UI.Dropdown.AddOptions");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ClearOptions_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.Dropdown  QPYX_obj_YXQP  = (UnityEngine.UI.Dropdown)ToLua.CheckObject<UnityEngine.UI.Dropdown>(L_YXQP, 1);
			QPYX_obj_YXQP.ClearOptions();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OnPointerClick_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.UI.Dropdown  QPYX_obj_YXQP  = (UnityEngine.UI.Dropdown)ToLua.CheckObject<UnityEngine.UI.Dropdown>(L_YXQP, 1);
			UnityEngine.EventSystems.PointerEventData QPYX_arg0_YXQP = (UnityEngine.EventSystems.PointerEventData)ToLua.CheckObject<UnityEngine.EventSystems.PointerEventData>(L_YXQP, 2);
			QPYX_obj_YXQP.OnPointerClick(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OnSubmit_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.UI.Dropdown  QPYX_obj_YXQP  = (UnityEngine.UI.Dropdown)ToLua.CheckObject<UnityEngine.UI.Dropdown>(L_YXQP, 1);
			UnityEngine.EventSystems.BaseEventData QPYX_arg0_YXQP = (UnityEngine.EventSystems.BaseEventData)ToLua.CheckObject<UnityEngine.EventSystems.BaseEventData>(L_YXQP, 2);
			QPYX_obj_YXQP.OnSubmit(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OnCancel_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.UI.Dropdown  QPYX_obj_YXQP  = (UnityEngine.UI.Dropdown)ToLua.CheckObject<UnityEngine.UI.Dropdown>(L_YXQP, 1);
			UnityEngine.EventSystems.BaseEventData QPYX_arg0_YXQP = (UnityEngine.EventSystems.BaseEventData)ToLua.CheckObject<UnityEngine.EventSystems.BaseEventData>(L_YXQP, 2);
			QPYX_obj_YXQP.OnCancel(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Show_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.Dropdown  QPYX_obj_YXQP  = (UnityEngine.UI.Dropdown)ToLua.CheckObject<UnityEngine.UI.Dropdown>(L_YXQP, 1);
			QPYX_obj_YXQP.Show();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Hide_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.Dropdown  QPYX_obj_YXQP  = (UnityEngine.UI.Dropdown)ToLua.CheckObject<UnityEngine.UI.Dropdown>(L_YXQP, 1);
			QPYX_obj_YXQP.Hide();
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
	static int QPYX_get_template_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Dropdown QPYX_obj_YXQP = (UnityEngine.UI.Dropdown)QPYX_o_YXQP;
			UnityEngine.RectTransform QPYX_ret_YXQP = QPYX_obj_YXQP.template;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index template on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_captionText_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Dropdown QPYX_obj_YXQP = (UnityEngine.UI.Dropdown)QPYX_o_YXQP;
			UnityEngine.UI.Text QPYX_ret_YXQP = QPYX_obj_YXQP.captionText;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index captionText on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_captionImage_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Dropdown QPYX_obj_YXQP = (UnityEngine.UI.Dropdown)QPYX_o_YXQP;
			UnityEngine.UI.Image QPYX_ret_YXQP = QPYX_obj_YXQP.captionImage;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index captionImage on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_itemText_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Dropdown QPYX_obj_YXQP = (UnityEngine.UI.Dropdown)QPYX_o_YXQP;
			UnityEngine.UI.Text QPYX_ret_YXQP = QPYX_obj_YXQP.itemText;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index itemText on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_itemImage_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Dropdown QPYX_obj_YXQP = (UnityEngine.UI.Dropdown)QPYX_o_YXQP;
			UnityEngine.UI.Image QPYX_ret_YXQP = QPYX_obj_YXQP.itemImage;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index itemImage on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_options_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Dropdown QPYX_obj_YXQP = (UnityEngine.UI.Dropdown)QPYX_o_YXQP;
			System.Collections.Generic.List<UnityEngine.UI.Dropdown.OptionData> QPYX_ret_YXQP = QPYX_obj_YXQP.options;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index options on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onValueChanged_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Dropdown QPYX_obj_YXQP = (UnityEngine.UI.Dropdown)QPYX_o_YXQP;
			UnityEngine.UI.Dropdown.DropdownEvent QPYX_ret_YXQP = QPYX_obj_YXQP.onValueChanged;
			ToLua.PushObject(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onValueChanged on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_value_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Dropdown QPYX_obj_YXQP = (UnityEngine.UI.Dropdown)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.value;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index value on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_template_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Dropdown QPYX_obj_YXQP = (UnityEngine.UI.Dropdown)QPYX_o_YXQP;
			UnityEngine.RectTransform QPYX_arg0_YXQP = (UnityEngine.RectTransform)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.RectTransform));
			QPYX_obj_YXQP.template = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index template on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_captionText_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Dropdown QPYX_obj_YXQP = (UnityEngine.UI.Dropdown)QPYX_o_YXQP;
			UnityEngine.UI.Text QPYX_arg0_YXQP = (UnityEngine.UI.Text)ToLua.CheckObject<UnityEngine.UI.Text>(L_YXQP, 2);
			QPYX_obj_YXQP.captionText = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index captionText on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_captionImage_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Dropdown QPYX_obj_YXQP = (UnityEngine.UI.Dropdown)QPYX_o_YXQP;
			UnityEngine.UI.Image QPYX_arg0_YXQP = (UnityEngine.UI.Image)ToLua.CheckObject<UnityEngine.UI.Image>(L_YXQP, 2);
			QPYX_obj_YXQP.captionImage = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index captionImage on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_itemText_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Dropdown QPYX_obj_YXQP = (UnityEngine.UI.Dropdown)QPYX_o_YXQP;
			UnityEngine.UI.Text QPYX_arg0_YXQP = (UnityEngine.UI.Text)ToLua.CheckObject<UnityEngine.UI.Text>(L_YXQP, 2);
			QPYX_obj_YXQP.itemText = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index itemText on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_itemImage_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Dropdown QPYX_obj_YXQP = (UnityEngine.UI.Dropdown)QPYX_o_YXQP;
			UnityEngine.UI.Image QPYX_arg0_YXQP = (UnityEngine.UI.Image)ToLua.CheckObject<UnityEngine.UI.Image>(L_YXQP, 2);
			QPYX_obj_YXQP.itemImage = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index itemImage on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_options_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Dropdown QPYX_obj_YXQP = (UnityEngine.UI.Dropdown)QPYX_o_YXQP;
			System.Collections.Generic.List<UnityEngine.UI.Dropdown.OptionData> QPYX_arg0_YXQP = (System.Collections.Generic.List<UnityEngine.UI.Dropdown.OptionData>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<UnityEngine.UI.Dropdown.OptionData>));
			QPYX_obj_YXQP.options = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index options on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onValueChanged_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Dropdown QPYX_obj_YXQP = (UnityEngine.UI.Dropdown)QPYX_o_YXQP;
			UnityEngine.UI.Dropdown.DropdownEvent QPYX_arg0_YXQP = (UnityEngine.UI.Dropdown.DropdownEvent)ToLua.CheckObject<UnityEngine.UI.Dropdown.DropdownEvent>(L_YXQP, 2);
			QPYX_obj_YXQP.onValueChanged = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onValueChanged on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_value_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Dropdown QPYX_obj_YXQP = (UnityEngine.UI.Dropdown)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.value = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index value on a nil value");
		}
	}
}

