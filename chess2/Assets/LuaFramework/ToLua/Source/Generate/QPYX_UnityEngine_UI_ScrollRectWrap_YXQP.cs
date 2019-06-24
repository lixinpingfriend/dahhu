using System;
using LuaInterface;

public class QPYX_UnityEngine_UI_ScrollRectWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.UI.ScrollRect), typeof(UnityEngine.EventSystems.UIBehaviour));
		L_YXQP.RegFunction("Rebuild", QPYX_Rebuild_YXQP);
		L_YXQP.RegFunction("LayoutComplete", QPYX_LayoutComplete_YXQP);
		L_YXQP.RegFunction("GraphicUpdateComplete", QPYX_GraphicUpdateComplete_YXQP);
		L_YXQP.RegFunction("IsActive", QPYX_IsActive_YXQP);
		L_YXQP.RegFunction("StopMovement", QPYX_StopMovement_YXQP);
		L_YXQP.RegFunction("OnScroll", QPYX_OnScroll_YXQP);
		L_YXQP.RegFunction("OnInitializePotentialDrag", QPYX_OnInitializePotentialDrag_YXQP);
		L_YXQP.RegFunction("OnBeginDrag", QPYX_OnBeginDrag_YXQP);
		L_YXQP.RegFunction("OnEndDrag", QPYX_OnEndDrag_YXQP);
		L_YXQP.RegFunction("OnDrag", QPYX_OnDrag_YXQP);
		L_YXQP.RegFunction("CalculateLayoutInputHorizontal", QPYX_CalculateLayoutInputHorizontal_YXQP);
		L_YXQP.RegFunction("CalculateLayoutInputVertical", QPYX_CalculateLayoutInputVertical_YXQP);
		L_YXQP.RegFunction("SetLayoutHorizontal", QPYX_SetLayoutHorizontal_YXQP);
		L_YXQP.RegFunction("SetLayoutVertical", QPYX_SetLayoutVertical_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("content", QPYX_get_content_YXQP, QPYX_set_content_YXQP);
		L_YXQP.RegVar("horizontal", QPYX_get_horizontal_YXQP, QPYX_set_horizontal_YXQP);
		L_YXQP.RegVar("vertical", QPYX_get_vertical_YXQP, QPYX_set_vertical_YXQP);
		L_YXQP.RegVar("movementType", QPYX_get_movementType_YXQP, QPYX_set_movementType_YXQP);
		L_YXQP.RegVar("elasticity", QPYX_get_elasticity_YXQP, QPYX_set_elasticity_YXQP);
		L_YXQP.RegVar("inertia", QPYX_get_inertia_YXQP, QPYX_set_inertia_YXQP);
		L_YXQP.RegVar("decelerationRate", QPYX_get_decelerationRate_YXQP, QPYX_set_decelerationRate_YXQP);
		L_YXQP.RegVar("scrollSensitivity", QPYX_get_scrollSensitivity_YXQP, QPYX_set_scrollSensitivity_YXQP);
		L_YXQP.RegVar("viewport", QPYX_get_viewport_YXQP, QPYX_set_viewport_YXQP);
		L_YXQP.RegVar("horizontalScrollbar", QPYX_get_horizontalScrollbar_YXQP, QPYX_set_horizontalScrollbar_YXQP);
		L_YXQP.RegVar("verticalScrollbar", QPYX_get_verticalScrollbar_YXQP, QPYX_set_verticalScrollbar_YXQP);
		L_YXQP.RegVar("horizontalScrollbarVisibility", QPYX_get_horizontalScrollbarVisibility_YXQP, QPYX_set_horizontalScrollbarVisibility_YXQP);
		L_YXQP.RegVar("verticalScrollbarVisibility", QPYX_get_verticalScrollbarVisibility_YXQP, QPYX_set_verticalScrollbarVisibility_YXQP);
		L_YXQP.RegVar("horizontalScrollbarSpacing", QPYX_get_horizontalScrollbarSpacing_YXQP, QPYX_set_horizontalScrollbarSpacing_YXQP);
		L_YXQP.RegVar("verticalScrollbarSpacing", QPYX_get_verticalScrollbarSpacing_YXQP, QPYX_set_verticalScrollbarSpacing_YXQP);
		L_YXQP.RegVar("onValueChanged", QPYX_get_onValueChanged_YXQP, QPYX_set_onValueChanged_YXQP);
		L_YXQP.RegVar("velocity", QPYX_get_velocity_YXQP, QPYX_set_velocity_YXQP);
		L_YXQP.RegVar("normalizedPosition", QPYX_get_normalizedPosition_YXQP, QPYX_set_normalizedPosition_YXQP);
		L_YXQP.RegVar("horizontalNormalizedPosition", QPYX_get_horizontalNormalizedPosition_YXQP, QPYX_set_horizontalNormalizedPosition_YXQP);
		L_YXQP.RegVar("verticalNormalizedPosition", QPYX_get_verticalNormalizedPosition_YXQP, QPYX_set_verticalNormalizedPosition_YXQP);
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
	static int QPYX_Rebuild_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.UI.ScrollRect  QPYX_obj_YXQP  = (UnityEngine.UI.ScrollRect)ToLua.CheckObject<UnityEngine.UI.ScrollRect>(L_YXQP, 1);
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
			UnityEngine.UI.ScrollRect  QPYX_obj_YXQP  = (UnityEngine.UI.ScrollRect)ToLua.CheckObject<UnityEngine.UI.ScrollRect>(L_YXQP, 1);
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
			UnityEngine.UI.ScrollRect  QPYX_obj_YXQP  = (UnityEngine.UI.ScrollRect)ToLua.CheckObject<UnityEngine.UI.ScrollRect>(L_YXQP, 1);
			QPYX_obj_YXQP.GraphicUpdateComplete();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IsActive_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.ScrollRect  QPYX_obj_YXQP  = (UnityEngine.UI.ScrollRect)ToLua.CheckObject<UnityEngine.UI.ScrollRect>(L_YXQP, 1);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.IsActive();
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_StopMovement_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.ScrollRect  QPYX_obj_YXQP  = (UnityEngine.UI.ScrollRect)ToLua.CheckObject<UnityEngine.UI.ScrollRect>(L_YXQP, 1);
			QPYX_obj_YXQP.StopMovement();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OnScroll_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.UI.ScrollRect  QPYX_obj_YXQP  = (UnityEngine.UI.ScrollRect)ToLua.CheckObject<UnityEngine.UI.ScrollRect>(L_YXQP, 1);
			UnityEngine.EventSystems.PointerEventData QPYX_arg0_YXQP = (UnityEngine.EventSystems.PointerEventData)ToLua.CheckObject<UnityEngine.EventSystems.PointerEventData>(L_YXQP, 2);
			QPYX_obj_YXQP.OnScroll(QPYX_arg0_YXQP);
			return 0;
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
			UnityEngine.UI.ScrollRect  QPYX_obj_YXQP  = (UnityEngine.UI.ScrollRect)ToLua.CheckObject<UnityEngine.UI.ScrollRect>(L_YXQP, 1);
			UnityEngine.EventSystems.PointerEventData QPYX_arg0_YXQP = (UnityEngine.EventSystems.PointerEventData)ToLua.CheckObject<UnityEngine.EventSystems.PointerEventData>(L_YXQP, 2);
			QPYX_obj_YXQP.OnInitializePotentialDrag(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OnBeginDrag_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.UI.ScrollRect  QPYX_obj_YXQP  = (UnityEngine.UI.ScrollRect)ToLua.CheckObject<UnityEngine.UI.ScrollRect>(L_YXQP, 1);
			UnityEngine.EventSystems.PointerEventData QPYX_arg0_YXQP = (UnityEngine.EventSystems.PointerEventData)ToLua.CheckObject<UnityEngine.EventSystems.PointerEventData>(L_YXQP, 2);
			QPYX_obj_YXQP.OnBeginDrag(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OnEndDrag_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.UI.ScrollRect  QPYX_obj_YXQP  = (UnityEngine.UI.ScrollRect)ToLua.CheckObject<UnityEngine.UI.ScrollRect>(L_YXQP, 1);
			UnityEngine.EventSystems.PointerEventData QPYX_arg0_YXQP = (UnityEngine.EventSystems.PointerEventData)ToLua.CheckObject<UnityEngine.EventSystems.PointerEventData>(L_YXQP, 2);
			QPYX_obj_YXQP.OnEndDrag(QPYX_arg0_YXQP);
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
			UnityEngine.UI.ScrollRect  QPYX_obj_YXQP  = (UnityEngine.UI.ScrollRect)ToLua.CheckObject<UnityEngine.UI.ScrollRect>(L_YXQP, 1);
			UnityEngine.EventSystems.PointerEventData QPYX_arg0_YXQP = (UnityEngine.EventSystems.PointerEventData)ToLua.CheckObject<UnityEngine.EventSystems.PointerEventData>(L_YXQP, 2);
			QPYX_obj_YXQP.OnDrag(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CalculateLayoutInputHorizontal_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.ScrollRect  QPYX_obj_YXQP  = (UnityEngine.UI.ScrollRect)ToLua.CheckObject<UnityEngine.UI.ScrollRect>(L_YXQP, 1);
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
			UnityEngine.UI.ScrollRect  QPYX_obj_YXQP  = (UnityEngine.UI.ScrollRect)ToLua.CheckObject<UnityEngine.UI.ScrollRect>(L_YXQP, 1);
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
			UnityEngine.UI.ScrollRect  QPYX_obj_YXQP  = (UnityEngine.UI.ScrollRect)ToLua.CheckObject<UnityEngine.UI.ScrollRect>(L_YXQP, 1);
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
			UnityEngine.UI.ScrollRect  QPYX_obj_YXQP  = (UnityEngine.UI.ScrollRect)ToLua.CheckObject<UnityEngine.UI.ScrollRect>(L_YXQP, 1);
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
	static int QPYX_get_content_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
			UnityEngine.RectTransform QPYX_ret_YXQP = QPYX_obj_YXQP.content;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index content on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_horizontal_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.horizontal;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index horizontal on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_vertical_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.vertical;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index vertical on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_movementType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
			UnityEngine.UI.ScrollRect.MovementType QPYX_ret_YXQP = QPYX_obj_YXQP.movementType;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index movementType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_elasticity_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.elasticity;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index elasticity on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_inertia_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.inertia;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index inertia on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_decelerationRate_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.decelerationRate;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index decelerationRate on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_scrollSensitivity_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.scrollSensitivity;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index scrollSensitivity on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_viewport_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
			UnityEngine.RectTransform QPYX_ret_YXQP = QPYX_obj_YXQP.viewport;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index viewport on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_horizontalScrollbar_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
			UnityEngine.UI.Scrollbar QPYX_ret_YXQP = QPYX_obj_YXQP.horizontalScrollbar;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index horizontalScrollbar on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_verticalScrollbar_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
			UnityEngine.UI.Scrollbar QPYX_ret_YXQP = QPYX_obj_YXQP.verticalScrollbar;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index verticalScrollbar on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_horizontalScrollbarVisibility_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
			UnityEngine.UI.ScrollRect.ScrollbarVisibility QPYX_ret_YXQP = QPYX_obj_YXQP.horizontalScrollbarVisibility;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index horizontalScrollbarVisibility on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_verticalScrollbarVisibility_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
			UnityEngine.UI.ScrollRect.ScrollbarVisibility QPYX_ret_YXQP = QPYX_obj_YXQP.verticalScrollbarVisibility;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index verticalScrollbarVisibility on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_horizontalScrollbarSpacing_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.horizontalScrollbarSpacing;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index horizontalScrollbarSpacing on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_verticalScrollbarSpacing_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.verticalScrollbarSpacing;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index verticalScrollbarSpacing on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onValueChanged_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
			UnityEngine.UI.ScrollRect.ScrollRectEvent QPYX_ret_YXQP = QPYX_obj_YXQP.onValueChanged;
			ToLua.PushObject(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onValueChanged on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_velocity_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_ret_YXQP = QPYX_obj_YXQP.velocity;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index velocity on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_normalizedPosition_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_ret_YXQP = QPYX_obj_YXQP.normalizedPosition;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index normalizedPosition on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_horizontalNormalizedPosition_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.horizontalNormalizedPosition;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index horizontalNormalizedPosition on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_verticalNormalizedPosition_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.verticalNormalizedPosition;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index verticalNormalizedPosition on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_minWidth_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
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
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
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
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
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
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
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
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
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
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
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
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.layoutPriority;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index layoutPriority on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_content_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
			UnityEngine.RectTransform QPYX_arg0_YXQP = (UnityEngine.RectTransform)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.RectTransform));
			QPYX_obj_YXQP.content = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index content on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_horizontal_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.horizontal = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index horizontal on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_vertical_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.vertical = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index vertical on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_movementType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
			UnityEngine.UI.ScrollRect.MovementType QPYX_arg0_YXQP = (UnityEngine.UI.ScrollRect.MovementType)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.UI.ScrollRect.MovementType));
			QPYX_obj_YXQP.movementType = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index movementType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_elasticity_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.elasticity = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index elasticity on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_inertia_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.inertia = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index inertia on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_decelerationRate_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.decelerationRate = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index decelerationRate on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_scrollSensitivity_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.scrollSensitivity = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index scrollSensitivity on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_viewport_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
			UnityEngine.RectTransform QPYX_arg0_YXQP = (UnityEngine.RectTransform)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.RectTransform));
			QPYX_obj_YXQP.viewport = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index viewport on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_horizontalScrollbar_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
			UnityEngine.UI.Scrollbar QPYX_arg0_YXQP = (UnityEngine.UI.Scrollbar)ToLua.CheckObject<UnityEngine.UI.Scrollbar>(L_YXQP, 2);
			QPYX_obj_YXQP.horizontalScrollbar = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index horizontalScrollbar on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_verticalScrollbar_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
			UnityEngine.UI.Scrollbar QPYX_arg0_YXQP = (UnityEngine.UI.Scrollbar)ToLua.CheckObject<UnityEngine.UI.Scrollbar>(L_YXQP, 2);
			QPYX_obj_YXQP.verticalScrollbar = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index verticalScrollbar on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_horizontalScrollbarVisibility_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
			UnityEngine.UI.ScrollRect.ScrollbarVisibility QPYX_arg0_YXQP = (UnityEngine.UI.ScrollRect.ScrollbarVisibility)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.UI.ScrollRect.ScrollbarVisibility));
			QPYX_obj_YXQP.horizontalScrollbarVisibility = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index horizontalScrollbarVisibility on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_verticalScrollbarVisibility_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
			UnityEngine.UI.ScrollRect.ScrollbarVisibility QPYX_arg0_YXQP = (UnityEngine.UI.ScrollRect.ScrollbarVisibility)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.UI.ScrollRect.ScrollbarVisibility));
			QPYX_obj_YXQP.verticalScrollbarVisibility = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index verticalScrollbarVisibility on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_horizontalScrollbarSpacing_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.horizontalScrollbarSpacing = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index horizontalScrollbarSpacing on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_verticalScrollbarSpacing_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.verticalScrollbarSpacing = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index verticalScrollbarSpacing on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onValueChanged_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
			UnityEngine.UI.ScrollRect.ScrollRectEvent QPYX_arg0_YXQP = (UnityEngine.UI.ScrollRect.ScrollRectEvent)ToLua.CheckObject<UnityEngine.UI.ScrollRect.ScrollRectEvent>(L_YXQP, 2);
			QPYX_obj_YXQP.onValueChanged = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onValueChanged on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_velocity_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_arg0_YXQP = ToLua.ToVector2(L_YXQP, 2);
			QPYX_obj_YXQP.velocity = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index velocity on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_normalizedPosition_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_arg0_YXQP = ToLua.ToVector2(L_YXQP, 2);
			QPYX_obj_YXQP.normalizedPosition = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index normalizedPosition on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_horizontalNormalizedPosition_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.horizontalNormalizedPosition = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index horizontalNormalizedPosition on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_verticalNormalizedPosition_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ScrollRect QPYX_obj_YXQP = (UnityEngine.UI.ScrollRect)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.verticalNormalizedPosition = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index verticalNormalizedPosition on a nil value");
		}
	}
}

