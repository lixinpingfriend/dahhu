using System;
using LuaInterface;

public class QPYX_UnityEngine_UI_InputFieldWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.UI.InputField), typeof(UnityEngine.UI.Selectable));
		L_YXQP.RegFunction("MoveTextEnd", QPYX_MoveTextEnd_YXQP);
		L_YXQP.RegFunction("MoveTextStart", QPYX_MoveTextStart_YXQP);
		L_YXQP.RegFunction("OnBeginDrag", QPYX_OnBeginDrag_YXQP);
		L_YXQP.RegFunction("OnDrag", QPYX_OnDrag_YXQP);
		L_YXQP.RegFunction("OnEndDrag", QPYX_OnEndDrag_YXQP);
		L_YXQP.RegFunction("OnPointerDown", QPYX_OnPointerDown_YXQP);
		L_YXQP.RegFunction("ProcessEvent", QPYX_ProcessEvent_YXQP);
		L_YXQP.RegFunction("OnUpdateSelected", QPYX_OnUpdateSelected_YXQP);
		L_YXQP.RegFunction("ForceLabelUpdate", QPYX_ForceLabelUpdate_YXQP);
		L_YXQP.RegFunction("Rebuild", QPYX_Rebuild_YXQP);
		L_YXQP.RegFunction("LayoutComplete", QPYX_LayoutComplete_YXQP);
		L_YXQP.RegFunction("GraphicUpdateComplete", QPYX_GraphicUpdateComplete_YXQP);
		L_YXQP.RegFunction("ActivateInputField", QPYX_ActivateInputField_YXQP);
		L_YXQP.RegFunction("OnSelect", QPYX_OnSelect_YXQP);
		L_YXQP.RegFunction("OnPointerClick", QPYX_OnPointerClick_YXQP);
		L_YXQP.RegFunction("DeactivateInputField", QPYX_DeactivateInputField_YXQP);
		L_YXQP.RegFunction("OnDeselect", QPYX_OnDeselect_YXQP);
		L_YXQP.RegFunction("OnSubmit", QPYX_OnSubmit_YXQP);
		L_YXQP.RegFunction("CalculateLayoutInputHorizontal", QPYX_CalculateLayoutInputHorizontal_YXQP);
		L_YXQP.RegFunction("CalculateLayoutInputVertical", QPYX_CalculateLayoutInputVertical_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("shouldHideMobileInput", QPYX_get_shouldHideMobileInput_YXQP, QPYX_set_shouldHideMobileInput_YXQP);
		L_YXQP.RegVar("text", QPYX_get_text_YXQP, QPYX_set_text_YXQP);
		L_YXQP.RegVar("isFocused", QPYX_get_isFocused_YXQP, null);
		L_YXQP.RegVar("caretBlinkRate", QPYX_get_caretBlinkRate_YXQP, QPYX_set_caretBlinkRate_YXQP);
		L_YXQP.RegVar("caretWidth", QPYX_get_caretWidth_YXQP, QPYX_set_caretWidth_YXQP);
		L_YXQP.RegVar("textComponent", QPYX_get_textComponent_YXQP, QPYX_set_textComponent_YXQP);
		L_YXQP.RegVar("placeholder", QPYX_get_placeholder_YXQP, QPYX_set_placeholder_YXQP);
		L_YXQP.RegVar("caretColor", QPYX_get_caretColor_YXQP, QPYX_set_caretColor_YXQP);
		L_YXQP.RegVar("customCaretColor", QPYX_get_customCaretColor_YXQP, QPYX_set_customCaretColor_YXQP);
		L_YXQP.RegVar("selectionColor", QPYX_get_selectionColor_YXQP, QPYX_set_selectionColor_YXQP);
		L_YXQP.RegVar("onEndEdit", QPYX_get_onEndEdit_YXQP, QPYX_set_onEndEdit_YXQP);
		L_YXQP.RegVar("onValueChanged", QPYX_get_onValueChanged_YXQP, QPYX_set_onValueChanged_YXQP);
		L_YXQP.RegVar("onValidateInput", QPYX_get_onValidateInput_YXQP, QPYX_set_onValidateInput_YXQP);
		L_YXQP.RegVar("characterLimit", QPYX_get_characterLimit_YXQP, QPYX_set_characterLimit_YXQP);
		L_YXQP.RegVar("contentType", QPYX_get_contentType_YXQP, QPYX_set_contentType_YXQP);
		L_YXQP.RegVar("lineType", QPYX_get_lineType_YXQP, QPYX_set_lineType_YXQP);
		L_YXQP.RegVar("inputType", QPYX_get_inputType_YXQP, QPYX_set_inputType_YXQP);
		L_YXQP.RegVar("keyboardType", QPYX_get_keyboardType_YXQP, QPYX_set_keyboardType_YXQP);
		L_YXQP.RegVar("characterValidation", QPYX_get_characterValidation_YXQP, QPYX_set_characterValidation_YXQP);
		L_YXQP.RegVar("readOnly", QPYX_get_readOnly_YXQP, QPYX_set_readOnly_YXQP);
		L_YXQP.RegVar("multiLine", QPYX_get_multiLine_YXQP, null);
		L_YXQP.RegVar("asteriskChar", QPYX_get_asteriskChar_YXQP, QPYX_set_asteriskChar_YXQP);
		L_YXQP.RegVar("wasCanceled", QPYX_get_wasCanceled_YXQP, null);
		L_YXQP.RegVar("caretPosition", QPYX_get_caretPosition_YXQP, QPYX_set_caretPosition_YXQP);
		L_YXQP.RegVar("selectionAnchorPosition", QPYX_get_selectionAnchorPosition_YXQP, QPYX_set_selectionAnchorPosition_YXQP);
		L_YXQP.RegVar("selectionFocusPosition", QPYX_get_selectionFocusPosition_YXQP, QPYX_set_selectionFocusPosition_YXQP);
		L_YXQP.RegVar("minWidth", QPYX_get_minWidth_YXQP, null);
		L_YXQP.RegVar("preferredWidth", QPYX_get_preferredWidth_YXQP, null);
		L_YXQP.RegVar("flexibleWidth", QPYX_get_flexibleWidth_YXQP, null);
		L_YXQP.RegVar("minHeight", QPYX_get_minHeight_YXQP, null);
		L_YXQP.RegVar("preferredHeight", QPYX_get_preferredHeight_YXQP, null);
		L_YXQP.RegVar("flexibleHeight", QPYX_get_flexibleHeight_YXQP, null);
		L_YXQP.RegVar("layoutPriority", QPYX_get_layoutPriority_YXQP, null);
		L_YXQP.RegFunction("OnValidateInput", QPYX_UnityEngine_UI_InputField_OnValidateInput_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_MoveTextEnd_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.UI.InputField  QPYX_obj_YXQP  = (UnityEngine.UI.InputField)ToLua.CheckObject<UnityEngine.UI.InputField>(L_YXQP, 1);
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.MoveTextEnd(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_MoveTextStart_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.UI.InputField  QPYX_obj_YXQP  = (UnityEngine.UI.InputField)ToLua.CheckObject<UnityEngine.UI.InputField>(L_YXQP, 1);
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.MoveTextStart(QPYX_arg0_YXQP);
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
			UnityEngine.UI.InputField  QPYX_obj_YXQP  = (UnityEngine.UI.InputField)ToLua.CheckObject<UnityEngine.UI.InputField>(L_YXQP, 1);
			UnityEngine.EventSystems.PointerEventData QPYX_arg0_YXQP = (UnityEngine.EventSystems.PointerEventData)ToLua.CheckObject<UnityEngine.EventSystems.PointerEventData>(L_YXQP, 2);
			QPYX_obj_YXQP.OnBeginDrag(QPYX_arg0_YXQP);
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
			UnityEngine.UI.InputField  QPYX_obj_YXQP  = (UnityEngine.UI.InputField)ToLua.CheckObject<UnityEngine.UI.InputField>(L_YXQP, 1);
			UnityEngine.EventSystems.PointerEventData QPYX_arg0_YXQP = (UnityEngine.EventSystems.PointerEventData)ToLua.CheckObject<UnityEngine.EventSystems.PointerEventData>(L_YXQP, 2);
			QPYX_obj_YXQP.OnDrag(QPYX_arg0_YXQP);
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
			UnityEngine.UI.InputField  QPYX_obj_YXQP  = (UnityEngine.UI.InputField)ToLua.CheckObject<UnityEngine.UI.InputField>(L_YXQP, 1);
			UnityEngine.EventSystems.PointerEventData QPYX_arg0_YXQP = (UnityEngine.EventSystems.PointerEventData)ToLua.CheckObject<UnityEngine.EventSystems.PointerEventData>(L_YXQP, 2);
			QPYX_obj_YXQP.OnEndDrag(QPYX_arg0_YXQP);
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
			UnityEngine.UI.InputField  QPYX_obj_YXQP  = (UnityEngine.UI.InputField)ToLua.CheckObject<UnityEngine.UI.InputField>(L_YXQP, 1);
			UnityEngine.EventSystems.PointerEventData QPYX_arg0_YXQP = (UnityEngine.EventSystems.PointerEventData)ToLua.CheckObject<UnityEngine.EventSystems.PointerEventData>(L_YXQP, 2);
			QPYX_obj_YXQP.OnPointerDown(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ProcessEvent_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.UI.InputField  QPYX_obj_YXQP  = (UnityEngine.UI.InputField)ToLua.CheckObject<UnityEngine.UI.InputField>(L_YXQP, 1);
			UnityEngine.Event QPYX_arg0_YXQP = (UnityEngine.Event)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.Event));
			QPYX_obj_YXQP.ProcessEvent(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OnUpdateSelected_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.UI.InputField  QPYX_obj_YXQP  = (UnityEngine.UI.InputField)ToLua.CheckObject<UnityEngine.UI.InputField>(L_YXQP, 1);
			UnityEngine.EventSystems.BaseEventData QPYX_arg0_YXQP = (UnityEngine.EventSystems.BaseEventData)ToLua.CheckObject<UnityEngine.EventSystems.BaseEventData>(L_YXQP, 2);
			QPYX_obj_YXQP.OnUpdateSelected(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ForceLabelUpdate_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.InputField  QPYX_obj_YXQP  = (UnityEngine.UI.InputField)ToLua.CheckObject<UnityEngine.UI.InputField>(L_YXQP, 1);
			QPYX_obj_YXQP.ForceLabelUpdate();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Rebuild_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.UI.InputField  QPYX_obj_YXQP  = (UnityEngine.UI.InputField)ToLua.CheckObject<UnityEngine.UI.InputField>(L_YXQP, 1);
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
			UnityEngine.UI.InputField  QPYX_obj_YXQP  = (UnityEngine.UI.InputField)ToLua.CheckObject<UnityEngine.UI.InputField>(L_YXQP, 1);
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
			UnityEngine.UI.InputField  QPYX_obj_YXQP  = (UnityEngine.UI.InputField)ToLua.CheckObject<UnityEngine.UI.InputField>(L_YXQP, 1);
			QPYX_obj_YXQP.GraphicUpdateComplete();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ActivateInputField_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.InputField  QPYX_obj_YXQP  = (UnityEngine.UI.InputField)ToLua.CheckObject<UnityEngine.UI.InputField>(L_YXQP, 1);
			QPYX_obj_YXQP.ActivateInputField();
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
			UnityEngine.UI.InputField  QPYX_obj_YXQP  = (UnityEngine.UI.InputField)ToLua.CheckObject<UnityEngine.UI.InputField>(L_YXQP, 1);
			UnityEngine.EventSystems.BaseEventData QPYX_arg0_YXQP = (UnityEngine.EventSystems.BaseEventData)ToLua.CheckObject<UnityEngine.EventSystems.BaseEventData>(L_YXQP, 2);
			QPYX_obj_YXQP.OnSelect(QPYX_arg0_YXQP);
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
			UnityEngine.UI.InputField  QPYX_obj_YXQP  = (UnityEngine.UI.InputField)ToLua.CheckObject<UnityEngine.UI.InputField>(L_YXQP, 1);
			UnityEngine.EventSystems.PointerEventData QPYX_arg0_YXQP = (UnityEngine.EventSystems.PointerEventData)ToLua.CheckObject<UnityEngine.EventSystems.PointerEventData>(L_YXQP, 2);
			QPYX_obj_YXQP.OnPointerClick(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DeactivateInputField_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.InputField  QPYX_obj_YXQP  = (UnityEngine.UI.InputField)ToLua.CheckObject<UnityEngine.UI.InputField>(L_YXQP, 1);
			QPYX_obj_YXQP.DeactivateInputField();
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
			UnityEngine.UI.InputField  QPYX_obj_YXQP  = (UnityEngine.UI.InputField)ToLua.CheckObject<UnityEngine.UI.InputField>(L_YXQP, 1);
			UnityEngine.EventSystems.BaseEventData QPYX_arg0_YXQP = (UnityEngine.EventSystems.BaseEventData)ToLua.CheckObject<UnityEngine.EventSystems.BaseEventData>(L_YXQP, 2);
			QPYX_obj_YXQP.OnDeselect(QPYX_arg0_YXQP);
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
			UnityEngine.UI.InputField  QPYX_obj_YXQP  = (UnityEngine.UI.InputField)ToLua.CheckObject<UnityEngine.UI.InputField>(L_YXQP, 1);
			UnityEngine.EventSystems.BaseEventData QPYX_arg0_YXQP = (UnityEngine.EventSystems.BaseEventData)ToLua.CheckObject<UnityEngine.EventSystems.BaseEventData>(L_YXQP, 2);
			QPYX_obj_YXQP.OnSubmit(QPYX_arg0_YXQP);
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
			UnityEngine.UI.InputField  QPYX_obj_YXQP  = (UnityEngine.UI.InputField)ToLua.CheckObject<UnityEngine.UI.InputField>(L_YXQP, 1);
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
			UnityEngine.UI.InputField  QPYX_obj_YXQP  = (UnityEngine.UI.InputField)ToLua.CheckObject<UnityEngine.UI.InputField>(L_YXQP, 1);
			QPYX_obj_YXQP.CalculateLayoutInputVertical();
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
	static int QPYX_get_shouldHideMobileInput_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.shouldHideMobileInput;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index shouldHideMobileInput on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_text_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			string QPYX_ret_YXQP = QPYX_obj_YXQP.text;
			LuaDLL.lua_pushstring(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index text on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isFocused_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.isFocused;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isFocused on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_caretBlinkRate_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.caretBlinkRate;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index caretBlinkRate on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_caretWidth_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.caretWidth;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index caretWidth on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_textComponent_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			UnityEngine.UI.Text QPYX_ret_YXQP = QPYX_obj_YXQP.textComponent;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index textComponent on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_placeholder_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			UnityEngine.UI.Graphic QPYX_ret_YXQP = QPYX_obj_YXQP.placeholder;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index placeholder on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_caretColor_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			UnityEngine.Color QPYX_ret_YXQP = QPYX_obj_YXQP.caretColor;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index caretColor on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_customCaretColor_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.customCaretColor;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index customCaretColor on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_selectionColor_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			UnityEngine.Color QPYX_ret_YXQP = QPYX_obj_YXQP.selectionColor;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index selectionColor on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onEndEdit_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			UnityEngine.UI.InputField.SubmitEvent QPYX_ret_YXQP = QPYX_obj_YXQP.onEndEdit;
			ToLua.PushObject(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onEndEdit on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onValueChanged_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			UnityEngine.UI.InputField.OnChangeEvent QPYX_ret_YXQP = QPYX_obj_YXQP.onValueChanged;
			ToLua.PushObject(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onValueChanged on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onValidateInput_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			UnityEngine.UI.InputField.OnValidateInput QPYX_ret_YXQP = QPYX_obj_YXQP.onValidateInput;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onValidateInput on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_characterLimit_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.characterLimit;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index characterLimit on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_contentType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			UnityEngine.UI.InputField.ContentType QPYX_ret_YXQP = QPYX_obj_YXQP.contentType;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index contentType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_lineType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			UnityEngine.UI.InputField.LineType QPYX_ret_YXQP = QPYX_obj_YXQP.lineType;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index lineType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_inputType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			UnityEngine.UI.InputField.InputType QPYX_ret_YXQP = QPYX_obj_YXQP.inputType;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index inputType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_keyboardType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			UnityEngine.TouchScreenKeyboardType QPYX_ret_YXQP = QPYX_obj_YXQP.keyboardType;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index keyboardType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_characterValidation_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			UnityEngine.UI.InputField.CharacterValidation QPYX_ret_YXQP = QPYX_obj_YXQP.characterValidation;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index characterValidation on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_readOnly_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.readOnly;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index readOnly on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_multiLine_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.multiLine;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index multiLine on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_asteriskChar_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			char QPYX_ret_YXQP = QPYX_obj_YXQP.asteriskChar;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index asteriskChar on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_wasCanceled_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.wasCanceled;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index wasCanceled on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_caretPosition_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.caretPosition;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index caretPosition on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_selectionAnchorPosition_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.selectionAnchorPosition;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index selectionAnchorPosition on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_selectionFocusPosition_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.selectionFocusPosition;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index selectionFocusPosition on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_minWidth_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
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
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
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
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
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
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
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
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
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
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
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
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.layoutPriority;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index layoutPriority on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_shouldHideMobileInput_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.shouldHideMobileInput = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index shouldHideMobileInput on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_text_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.text = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index text on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_caretBlinkRate_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.caretBlinkRate = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index caretBlinkRate on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_caretWidth_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.caretWidth = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index caretWidth on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_textComponent_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			UnityEngine.UI.Text QPYX_arg0_YXQP = (UnityEngine.UI.Text)ToLua.CheckObject<UnityEngine.UI.Text>(L_YXQP, 2);
			QPYX_obj_YXQP.textComponent = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index textComponent on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_placeholder_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			UnityEngine.UI.Graphic QPYX_arg0_YXQP = (UnityEngine.UI.Graphic)ToLua.CheckObject<UnityEngine.UI.Graphic>(L_YXQP, 2);
			QPYX_obj_YXQP.placeholder = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index placeholder on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_caretColor_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			UnityEngine.Color QPYX_arg0_YXQP = ToLua.ToColor(L_YXQP, 2);
			QPYX_obj_YXQP.caretColor = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index caretColor on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_customCaretColor_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.customCaretColor = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index customCaretColor on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_selectionColor_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			UnityEngine.Color QPYX_arg0_YXQP = ToLua.ToColor(L_YXQP, 2);
			QPYX_obj_YXQP.selectionColor = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index selectionColor on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onEndEdit_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			UnityEngine.UI.InputField.SubmitEvent QPYX_arg0_YXQP = (UnityEngine.UI.InputField.SubmitEvent)ToLua.CheckObject<UnityEngine.UI.InputField.SubmitEvent>(L_YXQP, 2);
			QPYX_obj_YXQP.onEndEdit = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onEndEdit on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onValueChanged_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			UnityEngine.UI.InputField.OnChangeEvent QPYX_arg0_YXQP = (UnityEngine.UI.InputField.OnChangeEvent)ToLua.CheckObject<UnityEngine.UI.InputField.OnChangeEvent>(L_YXQP, 2);
			QPYX_obj_YXQP.onValueChanged = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onValueChanged on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onValidateInput_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			UnityEngine.UI.InputField.OnValidateInput QPYX_arg0_YXQP = (UnityEngine.UI.InputField.OnValidateInput)ToLua.CheckDelegate<UnityEngine.UI.InputField.OnValidateInput>(L_YXQP, 2);
			QPYX_obj_YXQP.onValidateInput = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onValidateInput on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_characterLimit_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.characterLimit = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index characterLimit on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_contentType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			UnityEngine.UI.InputField.ContentType QPYX_arg0_YXQP = (UnityEngine.UI.InputField.ContentType)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.UI.InputField.ContentType));
			QPYX_obj_YXQP.contentType = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index contentType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_lineType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			UnityEngine.UI.InputField.LineType QPYX_arg0_YXQP = (UnityEngine.UI.InputField.LineType)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.UI.InputField.LineType));
			QPYX_obj_YXQP.lineType = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index lineType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_inputType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			UnityEngine.UI.InputField.InputType QPYX_arg0_YXQP = (UnityEngine.UI.InputField.InputType)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.UI.InputField.InputType));
			QPYX_obj_YXQP.inputType = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index inputType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_keyboardType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			UnityEngine.TouchScreenKeyboardType QPYX_arg0_YXQP = (UnityEngine.TouchScreenKeyboardType)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.TouchScreenKeyboardType));
			QPYX_obj_YXQP.keyboardType = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index keyboardType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_characterValidation_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			UnityEngine.UI.InputField.CharacterValidation QPYX_arg0_YXQP = (UnityEngine.UI.InputField.CharacterValidation)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.UI.InputField.CharacterValidation));
			QPYX_obj_YXQP.characterValidation = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index characterValidation on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_readOnly_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.readOnly = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index readOnly on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_asteriskChar_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			char QPYX_arg0_YXQP = (char)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.asteriskChar = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index asteriskChar on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_caretPosition_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.caretPosition = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index caretPosition on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_selectionAnchorPosition_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.selectionAnchorPosition = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index selectionAnchorPosition on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_selectionFocusPosition_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.InputField QPYX_obj_YXQP = (UnityEngine.UI.InputField)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.selectionFocusPosition = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index selectionFocusPosition on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UnityEngine_UI_InputField_OnValidateInput_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.UI.InputField.OnValidateInput>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.UI.InputField.OnValidateInput>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}
}

