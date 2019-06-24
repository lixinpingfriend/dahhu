using System;
using LuaInterface;

public class QPYX_UnityEngine_UI_SliderWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.UI.Slider), typeof(UnityEngine.UI.Selectable));
		L_YXQP.RegFunction("Rebuild", QPYX_Rebuild_YXQP);
		L_YXQP.RegFunction("LayoutComplete", QPYX_LayoutComplete_YXQP);
		L_YXQP.RegFunction("GraphicUpdateComplete", QPYX_GraphicUpdateComplete_YXQP);
		L_YXQP.RegFunction("OnPointerDown", QPYX_OnPointerDown_YXQP);
		L_YXQP.RegFunction("OnDrag", QPYX_OnDrag_YXQP);
		L_YXQP.RegFunction("OnMove", QPYX_OnMove_YXQP);
		L_YXQP.RegFunction("FindSelectableOnLeft", QPYX_FindSelectableOnLeft_YXQP);
		L_YXQP.RegFunction("FindSelectableOnRight", QPYX_FindSelectableOnRight_YXQP);
		L_YXQP.RegFunction("FindSelectableOnUp", QPYX_FindSelectableOnUp_YXQP);
		L_YXQP.RegFunction("FindSelectableOnDown", QPYX_FindSelectableOnDown_YXQP);
		L_YXQP.RegFunction("OnInitializePotentialDrag", QPYX_OnInitializePotentialDrag_YXQP);
		L_YXQP.RegFunction("SetDirection", QPYX_SetDirection_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("fillRect", QPYX_get_fillRect_YXQP, QPYX_set_fillRect_YXQP);
		L_YXQP.RegVar("handleRect", QPYX_get_handleRect_YXQP, QPYX_set_handleRect_YXQP);
		L_YXQP.RegVar("direction", QPYX_get_direction_YXQP, QPYX_set_direction_YXQP);
		L_YXQP.RegVar("minValue", QPYX_get_minValue_YXQP, QPYX_set_minValue_YXQP);
		L_YXQP.RegVar("maxValue", QPYX_get_maxValue_YXQP, QPYX_set_maxValue_YXQP);
		L_YXQP.RegVar("wholeNumbers", QPYX_get_wholeNumbers_YXQP, QPYX_set_wholeNumbers_YXQP);
		L_YXQP.RegVar("value", QPYX_get_value_YXQP, QPYX_set_value_YXQP);
		L_YXQP.RegVar("normalizedValue", QPYX_get_normalizedValue_YXQP, QPYX_set_normalizedValue_YXQP);
		L_YXQP.RegVar("onValueChanged", QPYX_get_onValueChanged_YXQP, QPYX_set_onValueChanged_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Rebuild_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.UI.Slider  QPYX_obj_YXQP  = (UnityEngine.UI.Slider)ToLua.CheckObject<UnityEngine.UI.Slider>(L_YXQP, 1);
			UnityEngine.UI.CanvasUpdate QPYX_arg0_YXQP = (UnityEngine.UI.CanvasUpdate)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.UI.CanvasUpdate));
			QPYX_obj_YXQP.Rebuild(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LayoutComplete_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.Slider  QPYX_obj_YXQP  = (UnityEngine.UI.Slider)ToLua.CheckObject<UnityEngine.UI.Slider>(L_YXQP, 1);
			QPYX_obj_YXQP.LayoutComplete();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GraphicUpdateComplete_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.Slider  QPYX_obj_YXQP  = (UnityEngine.UI.Slider)ToLua.CheckObject<UnityEngine.UI.Slider>(L_YXQP, 1);
			QPYX_obj_YXQP.GraphicUpdateComplete();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OnPointerDown_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.UI.Slider  QPYX_obj_YXQP  = (UnityEngine.UI.Slider)ToLua.CheckObject<UnityEngine.UI.Slider>(L_YXQP, 1);
			UnityEngine.EventSystems.PointerEventData QPYX_arg0_YXQP = (UnityEngine.EventSystems.PointerEventData)ToLua.CheckObject<UnityEngine.EventSystems.PointerEventData>(L_YXQP, 2);
			QPYX_obj_YXQP.OnPointerDown(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OnDrag_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.UI.Slider  QPYX_obj_YXQP  = (UnityEngine.UI.Slider)ToLua.CheckObject<UnityEngine.UI.Slider>(L_YXQP, 1);
			UnityEngine.EventSystems.PointerEventData QPYX_arg0_YXQP = (UnityEngine.EventSystems.PointerEventData)ToLua.CheckObject<UnityEngine.EventSystems.PointerEventData>(L_YXQP, 2);
			QPYX_obj_YXQP.OnDrag(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OnMove_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.UI.Slider  QPYX_obj_YXQP  = (UnityEngine.UI.Slider)ToLua.CheckObject<UnityEngine.UI.Slider>(L_YXQP, 1);
			UnityEngine.EventSystems.AxisEventData QPYX_arg0_YXQP = (UnityEngine.EventSystems.AxisEventData)ToLua.CheckObject<UnityEngine.EventSystems.AxisEventData>(L_YXQP, 2);
			QPYX_obj_YXQP.OnMove(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_FindSelectableOnLeft_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.Slider  QPYX_obj_YXQP  = (UnityEngine.UI.Slider)ToLua.CheckObject<UnityEngine.UI.Slider>(L_YXQP, 1);
			UnityEngine.UI.Selectable QPYX_o_YXQP = QPYX_obj_YXQP.FindSelectableOnLeft();
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_FindSelectableOnRight_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.Slider  QPYX_obj_YXQP  = (UnityEngine.UI.Slider)ToLua.CheckObject<UnityEngine.UI.Slider>(L_YXQP, 1);
			UnityEngine.UI.Selectable QPYX_o_YXQP = QPYX_obj_YXQP.FindSelectableOnRight();
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_FindSelectableOnUp_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.Slider  QPYX_obj_YXQP  = (UnityEngine.UI.Slider)ToLua.CheckObject<UnityEngine.UI.Slider>(L_YXQP, 1);
			UnityEngine.UI.Selectable QPYX_o_YXQP = QPYX_obj_YXQP.FindSelectableOnUp();
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_FindSelectableOnDown_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.Slider  QPYX_obj_YXQP  = (UnityEngine.UI.Slider)ToLua.CheckObject<UnityEngine.UI.Slider>(L_YXQP, 1);
			UnityEngine.UI.Selectable QPYX_o_YXQP = QPYX_obj_YXQP.FindSelectableOnDown();
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OnInitializePotentialDrag_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.UI.Slider  QPYX_obj_YXQP  = (UnityEngine.UI.Slider)ToLua.CheckObject<UnityEngine.UI.Slider>(L_YXQP, 1);
			UnityEngine.EventSystems.PointerEventData QPYX_arg0_YXQP = (UnityEngine.EventSystems.PointerEventData)ToLua.CheckObject<UnityEngine.EventSystems.PointerEventData>(L_YXQP, 2);
			QPYX_obj_YXQP.OnInitializePotentialDrag(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetDirection_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.UI.Slider  QPYX_obj_YXQP  = (UnityEngine.UI.Slider)ToLua.CheckObject<UnityEngine.UI.Slider>(L_YXQP, 1);
			UnityEngine.UI.Slider.Direction QPYX_arg0_YXQP = (UnityEngine.UI.Slider.Direction)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.UI.Slider.Direction));
			bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
			QPYX_obj_YXQP.SetDirection(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
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
	static int QPYX_get_fillRect_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Slider QPYX_obj_YXQP = (UnityEngine.UI.Slider)QPYX_o_YXQP;
			UnityEngine.RectTransform QPYX_ret_YXQP = QPYX_obj_YXQP.fillRect;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index fillRect on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_handleRect_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Slider QPYX_obj_YXQP = (UnityEngine.UI.Slider)QPYX_o_YXQP;
			UnityEngine.RectTransform QPYX_ret_YXQP = QPYX_obj_YXQP.handleRect;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index handleRect on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_direction_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Slider QPYX_obj_YXQP = (UnityEngine.UI.Slider)QPYX_o_YXQP;
			UnityEngine.UI.Slider.Direction QPYX_ret_YXQP = QPYX_obj_YXQP.direction;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index direction on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_minValue_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Slider QPYX_obj_YXQP = (UnityEngine.UI.Slider)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.minValue;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index minValue on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_maxValue_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Slider QPYX_obj_YXQP = (UnityEngine.UI.Slider)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.maxValue;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index maxValue on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_wholeNumbers_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Slider QPYX_obj_YXQP = (UnityEngine.UI.Slider)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.wholeNumbers;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index wholeNumbers on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_value_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Slider QPYX_obj_YXQP = (UnityEngine.UI.Slider)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.value;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index value on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_normalizedValue_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Slider QPYX_obj_YXQP = (UnityEngine.UI.Slider)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.normalizedValue;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index normalizedValue on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onValueChanged_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Slider QPYX_obj_YXQP = (UnityEngine.UI.Slider)QPYX_o_YXQP;
			UnityEngine.UI.Slider.SliderEvent QPYX_ret_YXQP = QPYX_obj_YXQP.onValueChanged;
			ToLua.PushObject(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onValueChanged on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_fillRect_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Slider QPYX_obj_YXQP = (UnityEngine.UI.Slider)QPYX_o_YXQP;
			UnityEngine.RectTransform QPYX_arg0_YXQP = (UnityEngine.RectTransform)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.RectTransform));
			QPYX_obj_YXQP.fillRect = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index fillRect on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_handleRect_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Slider QPYX_obj_YXQP = (UnityEngine.UI.Slider)QPYX_o_YXQP;
			UnityEngine.RectTransform QPYX_arg0_YXQP = (UnityEngine.RectTransform)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.RectTransform));
			QPYX_obj_YXQP.handleRect = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index handleRect on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_direction_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Slider QPYX_obj_YXQP = (UnityEngine.UI.Slider)QPYX_o_YXQP;
			UnityEngine.UI.Slider.Direction QPYX_arg0_YXQP = (UnityEngine.UI.Slider.Direction)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.UI.Slider.Direction));
			QPYX_obj_YXQP.direction = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index direction on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_minValue_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Slider QPYX_obj_YXQP = (UnityEngine.UI.Slider)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.minValue = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index minValue on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_maxValue_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Slider QPYX_obj_YXQP = (UnityEngine.UI.Slider)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.maxValue = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index maxValue on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_wholeNumbers_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Slider QPYX_obj_YXQP = (UnityEngine.UI.Slider)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.wholeNumbers = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index wholeNumbers on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_value_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Slider QPYX_obj_YXQP = (UnityEngine.UI.Slider)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.value = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index value on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_normalizedValue_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Slider QPYX_obj_YXQP = (UnityEngine.UI.Slider)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.normalizedValue = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index normalizedValue on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onValueChanged_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Slider QPYX_obj_YXQP = (UnityEngine.UI.Slider)QPYX_o_YXQP;
			UnityEngine.UI.Slider.SliderEvent QPYX_arg0_YXQP = (UnityEngine.UI.Slider.SliderEvent)ToLua.CheckObject<UnityEngine.UI.Slider.SliderEvent>(L_YXQP, 2);
			QPYX_obj_YXQP.onValueChanged = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onValueChanged on a nil value");
		}
	}
}

