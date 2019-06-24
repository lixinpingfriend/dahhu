using System;
using LuaInterface;

public class QPYX_UnityEngine_UI_SelectableWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.UI.Selectable), typeof(UnityEngine.EventSystems.UIBehaviour));
		L_YXQP.RegFunction("IsInteractable", QPYX_IsInteractable_YXQP);
		L_YXQP.RegFunction("FindSelectable", QPYX_FindSelectable_YXQP);
		L_YXQP.RegFunction("FindSelectableOnLeft", QPYX_FindSelectableOnLeft_YXQP);
		L_YXQP.RegFunction("FindSelectableOnRight", QPYX_FindSelectableOnRight_YXQP);
		L_YXQP.RegFunction("FindSelectableOnUp", QPYX_FindSelectableOnUp_YXQP);
		L_YXQP.RegFunction("FindSelectableOnDown", QPYX_FindSelectableOnDown_YXQP);
		L_YXQP.RegFunction("OnMove", QPYX_OnMove_YXQP);
		L_YXQP.RegFunction("OnPointerDown", QPYX_OnPointerDown_YXQP);
		L_YXQP.RegFunction("OnPointerUp", QPYX_OnPointerUp_YXQP);
		L_YXQP.RegFunction("OnPointerEnter", QPYX_OnPointerEnter_YXQP);
		L_YXQP.RegFunction("OnPointerExit", QPYX_OnPointerExit_YXQP);
		L_YXQP.RegFunction("OnSelect", QPYX_OnSelect_YXQP);
		L_YXQP.RegFunction("OnDeselect", QPYX_OnDeselect_YXQP);
		L_YXQP.RegFunction("Select", QPYX_Select_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("allSelectables", QPYX_get_allSelectables_YXQP, null);
		L_YXQP.RegVar("navigation", QPYX_get_navigation_YXQP, QPYX_set_navigation_YXQP);
		L_YXQP.RegVar("transition", QPYX_get_transition_YXQP, QPYX_set_transition_YXQP);
		L_YXQP.RegVar("colors", QPYX_get_colors_YXQP, QPYX_set_colors_YXQP);
		L_YXQP.RegVar("spriteState", QPYX_get_spriteState_YXQP, QPYX_set_spriteState_YXQP);
		L_YXQP.RegVar("animationTriggers", QPYX_get_animationTriggers_YXQP, QPYX_set_animationTriggers_YXQP);
		L_YXQP.RegVar("targetGraphic", QPYX_get_targetGraphic_YXQP, QPYX_set_targetGraphic_YXQP);
		L_YXQP.RegVar("interactable", QPYX_get_interactable_YXQP, QPYX_set_interactable_YXQP);
		L_YXQP.RegVar("image", QPYX_get_image_YXQP, QPYX_set_image_YXQP);
		L_YXQP.RegVar("animator", QPYX_get_animator_YXQP, null);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IsInteractable_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.Selectable  QPYX_obj_YXQP  = (UnityEngine.UI.Selectable)ToLua.CheckObject<UnityEngine.UI.Selectable>(L_YXQP, 1);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.IsInteractable();
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_FindSelectable_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.UI.Selectable  QPYX_obj_YXQP  = (UnityEngine.UI.Selectable)ToLua.CheckObject<UnityEngine.UI.Selectable>(L_YXQP, 1);
			UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
			UnityEngine.UI.Selectable QPYX_o_YXQP = QPYX_obj_YXQP.FindSelectable(QPYX_arg0_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
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
			UnityEngine.UI.Selectable  QPYX_obj_YXQP  = (UnityEngine.UI.Selectable)ToLua.CheckObject<UnityEngine.UI.Selectable>(L_YXQP, 1);
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
			UnityEngine.UI.Selectable  QPYX_obj_YXQP  = (UnityEngine.UI.Selectable)ToLua.CheckObject<UnityEngine.UI.Selectable>(L_YXQP, 1);
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
			UnityEngine.UI.Selectable  QPYX_obj_YXQP  = (UnityEngine.UI.Selectable)ToLua.CheckObject<UnityEngine.UI.Selectable>(L_YXQP, 1);
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
			UnityEngine.UI.Selectable  QPYX_obj_YXQP  = (UnityEngine.UI.Selectable)ToLua.CheckObject<UnityEngine.UI.Selectable>(L_YXQP, 1);
			UnityEngine.UI.Selectable QPYX_o_YXQP = QPYX_obj_YXQP.FindSelectableOnDown();
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
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
			UnityEngine.UI.Selectable  QPYX_obj_YXQP  = (UnityEngine.UI.Selectable)ToLua.CheckObject<UnityEngine.UI.Selectable>(L_YXQP, 1);
			UnityEngine.EventSystems.AxisEventData QPYX_arg0_YXQP = (UnityEngine.EventSystems.AxisEventData)ToLua.CheckObject<UnityEngine.EventSystems.AxisEventData>(L_YXQP, 2);
			QPYX_obj_YXQP.OnMove(QPYX_arg0_YXQP);
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
			UnityEngine.UI.Selectable  QPYX_obj_YXQP  = (UnityEngine.UI.Selectable)ToLua.CheckObject<UnityEngine.UI.Selectable>(L_YXQP, 1);
			UnityEngine.EventSystems.PointerEventData QPYX_arg0_YXQP = (UnityEngine.EventSystems.PointerEventData)ToLua.CheckObject<UnityEngine.EventSystems.PointerEventData>(L_YXQP, 2);
			QPYX_obj_YXQP.OnPointerDown(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OnPointerUp_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.UI.Selectable  QPYX_obj_YXQP  = (UnityEngine.UI.Selectable)ToLua.CheckObject<UnityEngine.UI.Selectable>(L_YXQP, 1);
			UnityEngine.EventSystems.PointerEventData QPYX_arg0_YXQP = (UnityEngine.EventSystems.PointerEventData)ToLua.CheckObject<UnityEngine.EventSystems.PointerEventData>(L_YXQP, 2);
			QPYX_obj_YXQP.OnPointerUp(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OnPointerEnter_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.UI.Selectable  QPYX_obj_YXQP  = (UnityEngine.UI.Selectable)ToLua.CheckObject<UnityEngine.UI.Selectable>(L_YXQP, 1);
			UnityEngine.EventSystems.PointerEventData QPYX_arg0_YXQP = (UnityEngine.EventSystems.PointerEventData)ToLua.CheckObject<UnityEngine.EventSystems.PointerEventData>(L_YXQP, 2);
			QPYX_obj_YXQP.OnPointerEnter(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OnPointerExit_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.UI.Selectable  QPYX_obj_YXQP  = (UnityEngine.UI.Selectable)ToLua.CheckObject<UnityEngine.UI.Selectable>(L_YXQP, 1);
			UnityEngine.EventSystems.PointerEventData QPYX_arg0_YXQP = (UnityEngine.EventSystems.PointerEventData)ToLua.CheckObject<UnityEngine.EventSystems.PointerEventData>(L_YXQP, 2);
			QPYX_obj_YXQP.OnPointerExit(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OnSelect_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.UI.Selectable  QPYX_obj_YXQP  = (UnityEngine.UI.Selectable)ToLua.CheckObject<UnityEngine.UI.Selectable>(L_YXQP, 1);
			UnityEngine.EventSystems.BaseEventData QPYX_arg0_YXQP = (UnityEngine.EventSystems.BaseEventData)ToLua.CheckObject<UnityEngine.EventSystems.BaseEventData>(L_YXQP, 2);
			QPYX_obj_YXQP.OnSelect(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OnDeselect_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.UI.Selectable  QPYX_obj_YXQP  = (UnityEngine.UI.Selectable)ToLua.CheckObject<UnityEngine.UI.Selectable>(L_YXQP, 1);
			UnityEngine.EventSystems.BaseEventData QPYX_arg0_YXQP = (UnityEngine.EventSystems.BaseEventData)ToLua.CheckObject<UnityEngine.EventSystems.BaseEventData>(L_YXQP, 2);
			QPYX_obj_YXQP.OnDeselect(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Select_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.Selectable  QPYX_obj_YXQP  = (UnityEngine.UI.Selectable)ToLua.CheckObject<UnityEngine.UI.Selectable>(L_YXQP, 1);
			QPYX_obj_YXQP.Select();
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
	static int QPYX_get_allSelectables_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.PushSealed(L_YXQP, UnityEngine.UI.Selectable.allSelectables);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_navigation_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Selectable QPYX_obj_YXQP = (UnityEngine.UI.Selectable)QPYX_o_YXQP;
			UnityEngine.UI.Navigation QPYX_ret_YXQP = QPYX_obj_YXQP.navigation;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index navigation on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_transition_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Selectable QPYX_obj_YXQP = (UnityEngine.UI.Selectable)QPYX_o_YXQP;
			UnityEngine.UI.Selectable.Transition QPYX_ret_YXQP = QPYX_obj_YXQP.transition;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index transition on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_colors_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Selectable QPYX_obj_YXQP = (UnityEngine.UI.Selectable)QPYX_o_YXQP;
			UnityEngine.UI.ColorBlock QPYX_ret_YXQP = QPYX_obj_YXQP.colors;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index colors on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_spriteState_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Selectable QPYX_obj_YXQP = (UnityEngine.UI.Selectable)QPYX_o_YXQP;
			UnityEngine.UI.SpriteState QPYX_ret_YXQP = QPYX_obj_YXQP.spriteState;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index spriteState on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_animationTriggers_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Selectable QPYX_obj_YXQP = (UnityEngine.UI.Selectable)QPYX_o_YXQP;
			UnityEngine.UI.AnimationTriggers QPYX_ret_YXQP = QPYX_obj_YXQP.animationTriggers;
			ToLua.PushObject(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index animationTriggers on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_targetGraphic_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Selectable QPYX_obj_YXQP = (UnityEngine.UI.Selectable)QPYX_o_YXQP;
			UnityEngine.UI.Graphic QPYX_ret_YXQP = QPYX_obj_YXQP.targetGraphic;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index targetGraphic on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_interactable_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Selectable QPYX_obj_YXQP = (UnityEngine.UI.Selectable)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.interactable;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index interactable on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_image_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Selectable QPYX_obj_YXQP = (UnityEngine.UI.Selectable)QPYX_o_YXQP;
			UnityEngine.UI.Image QPYX_ret_YXQP = QPYX_obj_YXQP.image;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index image on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_animator_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Selectable QPYX_obj_YXQP = (UnityEngine.UI.Selectable)QPYX_o_YXQP;
			UnityEngine.Animator QPYX_ret_YXQP = QPYX_obj_YXQP.animator;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index animator on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_navigation_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Selectable QPYX_obj_YXQP = (UnityEngine.UI.Selectable)QPYX_o_YXQP;
			UnityEngine.UI.Navigation QPYX_arg0_YXQP = StackTraits<UnityEngine.UI.Navigation>.Check(L_YXQP, 2);
			QPYX_obj_YXQP.navigation = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index navigation on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_transition_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Selectable QPYX_obj_YXQP = (UnityEngine.UI.Selectable)QPYX_o_YXQP;
			UnityEngine.UI.Selectable.Transition QPYX_arg0_YXQP = (UnityEngine.UI.Selectable.Transition)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.UI.Selectable.Transition));
			QPYX_obj_YXQP.transition = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index transition on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_colors_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Selectable QPYX_obj_YXQP = (UnityEngine.UI.Selectable)QPYX_o_YXQP;
			UnityEngine.UI.ColorBlock QPYX_arg0_YXQP = StackTraits<UnityEngine.UI.ColorBlock>.Check(L_YXQP, 2);
			QPYX_obj_YXQP.colors = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index colors on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_spriteState_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Selectable QPYX_obj_YXQP = (UnityEngine.UI.Selectable)QPYX_o_YXQP;
			UnityEngine.UI.SpriteState QPYX_arg0_YXQP = StackTraits<UnityEngine.UI.SpriteState>.Check(L_YXQP, 2);
			QPYX_obj_YXQP.spriteState = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index spriteState on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_animationTriggers_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Selectable QPYX_obj_YXQP = (UnityEngine.UI.Selectable)QPYX_o_YXQP;
			UnityEngine.UI.AnimationTriggers QPYX_arg0_YXQP = (UnityEngine.UI.AnimationTriggers)ToLua.CheckObject<UnityEngine.UI.AnimationTriggers>(L_YXQP, 2);
			QPYX_obj_YXQP.animationTriggers = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index animationTriggers on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_targetGraphic_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Selectable QPYX_obj_YXQP = (UnityEngine.UI.Selectable)QPYX_o_YXQP;
			UnityEngine.UI.Graphic QPYX_arg0_YXQP = (UnityEngine.UI.Graphic)ToLua.CheckObject<UnityEngine.UI.Graphic>(L_YXQP, 2);
			QPYX_obj_YXQP.targetGraphic = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index targetGraphic on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_interactable_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Selectable QPYX_obj_YXQP = (UnityEngine.UI.Selectable)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.interactable = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index interactable on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_image_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.Selectable QPYX_obj_YXQP = (UnityEngine.UI.Selectable)QPYX_o_YXQP;
			UnityEngine.UI.Image QPYX_arg0_YXQP = (UnityEngine.UI.Image)ToLua.CheckObject<UnityEngine.UI.Image>(L_YXQP, 2);
			QPYX_obj_YXQP.image = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index image on a nil value");
		}
	}
}

