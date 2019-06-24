using System;
using LuaInterface;

public class QPYX_littlerbird_UI_QuickGridWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(littlerbird.UI.QuickGrid), typeof(UnityEngine.UI.ScrollRect));
		L_YXQP.RegFunction("OnDrag", QPYX_OnDrag_YXQP);
		L_YXQP.RegFunction("SetUserEvent", QPYX_SetUserEvent_YXQP);
		L_YXQP.RegFunction("SetUserData", QPYX_SetUserData_YXQP);
		L_YXQP.RegFunction("GetUserEvent", QPYX_GetUserEvent_YXQP);
		L_YXQP.RegFunction("UnSelect", QPYX_UnSelect_YXQP);
		L_YXQP.RegFunction("SelectAll", QPYX_SelectAll_YXQP);
		L_YXQP.RegFunction("SelectIndex", QPYX_SelectIndex_YXQP);
		L_YXQP.RegFunction("SetSelectData", QPYX_SetSelectData_YXQP);
		L_YXQP.RegFunction("SelectData", QPYX_SelectData_YXQP);
		L_YXQP.RegFunction("RefreshItem", QPYX_RefreshItem_YXQP);
		L_YXQP.RegFunction("Refresh", QPYX_Refresh_YXQP);
		L_YXQP.RegFunction("MoveIndex", QPYX_MoveIndex_YXQP);
		L_YXQP.RegFunction("MoveByData", QPYX_MoveByData_YXQP);
		L_YXQP.RegFunction("ShowItemPanel", QPYX_ShowItemPanel_YXQP);
		L_YXQP.RegFunction("HideItemPanel", QPYX_HideItemPanel_YXQP);
		L_YXQP.RegFunction("Clear", QPYX_Clear_YXQP);
		L_YXQP.RegFunction("SetData", QPYX_SetData_YXQP);
		L_YXQP.RegFunction("CalculateRows", QPYX_CalculateRows_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("OnItemClick", QPYX_get_OnItemClick_YXQP, QPYX_set_OnItemClick_YXQP);
		L_YXQP.RegVar("CanSelectItem", QPYX_get_CanSelectItem_YXQP, QPYX_set_CanSelectItem_YXQP);
		L_YXQP.RegVar("CanOpenItemPanel", QPYX_get_CanOpenItemPanel_YXQP, QPYX_set_CanOpenItemPanel_YXQP);
		L_YXQP.RegVar("OnItemSelectChange", QPYX_get_OnItemSelectChange_YXQP, QPYX_set_OnItemSelectChange_YXQP);
		L_YXQP.RegVar("OnItemDataChange", QPYX_get_OnItemDataChange_YXQP, QPYX_set_OnItemDataChange_YXQP);
		L_YXQP.RegVar("OnMoveFirstOrLast", QPYX_get_OnMoveFirstOrLast_YXQP, QPYX_set_OnMoveFirstOrLast_YXQP);
		L_YXQP.RegVar("movement", QPYX_get_movement_YXQP, QPYX_set_movement_YXQP);
		L_YXQP.RegVar("tweenType", QPYX_get_tweenType_YXQP, QPYX_set_tweenType_YXQP);
		L_YXQP.RegVar("cellWidth", QPYX_get_cellWidth_YXQP, QPYX_set_cellWidth_YXQP);
		L_YXQP.RegVar("cellHeight", QPYX_get_cellHeight_YXQP, QPYX_set_cellHeight_YXQP);
		L_YXQP.RegVar("clipWidth", QPYX_get_clipWidth_YXQP, QPYX_set_clipWidth_YXQP);
		L_YXQP.RegVar("clipHeight", QPYX_get_clipHeight_YXQP, QPYX_set_clipHeight_YXQP);
		L_YXQP.RegVar("pageCells", QPYX_get_pageCells_YXQP, QPYX_set_pageCells_YXQP);
		L_YXQP.RegVar("pageRows", QPYX_get_pageRows_YXQP, QPYX_set_pageRows_YXQP);
		L_YXQP.RegVar("needItemEvent", QPYX_get_needItemEvent_YXQP, QPYX_set_needItemEvent_YXQP);
		L_YXQP.RegVar("selectType", QPYX_get_selectType_YXQP, QPYX_set_selectType_YXQP);
		L_YXQP.RegVar("needItemPanel", QPYX_get_needItemPanel_YXQP, QPYX_set_needItemPanel_YXQP);
		L_YXQP.RegVar("fixHeightPanel", QPYX_get_fixHeightPanel_YXQP, QPYX_set_fixHeightPanel_YXQP);
		L_YXQP.RegVar("needItemPanelMask", QPYX_get_needItemPanelMask_YXQP, QPYX_set_needItemPanelMask_YXQP);
		L_YXQP.RegVar("Movement", QPYX_get_Movement_YXQP, QPYX_set_Movement_YXQP);
		L_YXQP.RegVar("ClipWidth", QPYX_get_ClipWidth_YXQP, QPYX_set_ClipWidth_YXQP);
		L_YXQP.RegVar("ClipHeight", QPYX_get_ClipHeight_YXQP, QPYX_set_ClipHeight_YXQP);
		L_YXQP.RegVar("itemMask", QPYX_get_itemMask_YXQP, null);
		L_YXQP.RegVar("itemPanel", QPYX_get_itemPanel_YXQP, null);
		L_YXQP.RegVar("dataList", QPYX_get_dataList_YXQP, QPYX_set_dataList_YXQP);
		L_YXQP.RegVar("content", QPYX_get_content_YXQP, null);
		L_YXQP.RegVar("tween", QPYX_get_tween_YXQP, null);
		L_YXQP.RegVar("selectList", QPYX_get_selectList_YXQP, null);
		L_YXQP.RegVar("items", QPYX_get_items_YXQP, null);
		L_YXQP.RegVar("isMoveFirst", QPYX_get_isMoveFirst_YXQP, null);
		L_YXQP.RegVar("isMoveLast", QPYX_get_isMoveLast_YXQP, null);
		L_YXQP.RegVar("currentRow", QPYX_get_currentRow_YXQP, null);
		L_YXQP.RegFunction("QuickGridItemEvenet", QPYX_littlerbird_UI_QuickGrid_QuickGridItemEvenet_YXQP);
		L_YXQP.RegFunction("QuickCallback", QPYX_littlerbird_UI_QuickGrid_QuickCallback_YXQP);
		L_YXQP.RegFunction("ReturnQuickGridItemEvent", QPYX_littlerbird_UI_QuickGrid_ReturnQuickGridItemEvent_YXQP);
		L_YXQP.RegFunction("ReturnQuickGridItemEvent_bool", QPYX_littlerbird_UI_QuickGrid_ReturnQuickGridItemEvent_bool_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OnDrag_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			littlerbird.UI.QuickGrid  QPYX_obj_YXQP  = (littlerbird.UI.QuickGrid)ToLua.CheckObject<littlerbird.UI.QuickGrid>(L_YXQP, 1);
			UnityEngine.EventSystems.PointerEventData QPYX_arg0_YXQP = (UnityEngine.EventSystems.PointerEventData)ToLua.CheckObject<UnityEngine.EventSystems.PointerEventData>(L_YXQP, 2);
			QPYX_obj_YXQP.OnDrag(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetUserEvent_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			littlerbird.UI.QuickGrid  QPYX_obj_YXQP  = (littlerbird.UI.QuickGrid)ToLua.CheckObject<littlerbird.UI.QuickGrid>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			littlerbird.UI.QuickGrid.QuickGridItemEvenet QPYX_arg1_YXQP = (littlerbird.UI.QuickGrid.QuickGridItemEvenet)ToLua.CheckDelegate<littlerbird.UI.QuickGrid.QuickGridItemEvenet>(L_YXQP, 3);
			QPYX_obj_YXQP.SetUserEvent(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetUserData_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			littlerbird.UI.QuickGrid  QPYX_obj_YXQP  = (littlerbird.UI.QuickGrid)ToLua.CheckObject<littlerbird.UI.QuickGrid>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			object QPYX_arg1_YXQP = ToLua.ToVarObject(L_YXQP, 3);
			QPYX_obj_YXQP.SetUserData(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetUserEvent_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			littlerbird.UI.QuickGrid  QPYX_obj_YXQP  = (littlerbird.UI.QuickGrid)ToLua.CheckObject<littlerbird.UI.QuickGrid>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			littlerbird.UI.QuickGrid.QuickGridItemEvenet QPYX_o_YXQP = QPYX_obj_YXQP.GetUserEvent(QPYX_arg0_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UnSelect_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			littlerbird.UI.QuickGrid  QPYX_obj_YXQP  = (littlerbird.UI.QuickGrid)ToLua.CheckObject<littlerbird.UI.QuickGrid>(L_YXQP, 1);
			QPYX_obj_YXQP.UnSelect();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SelectAll_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			littlerbird.UI.QuickGrid  QPYX_obj_YXQP  = (littlerbird.UI.QuickGrid)ToLua.CheckObject<littlerbird.UI.QuickGrid>(L_YXQP, 1);
			QPYX_obj_YXQP.SelectAll();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SelectIndex_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			littlerbird.UI.QuickGrid  QPYX_obj_YXQP  = (littlerbird.UI.QuickGrid)ToLua.CheckObject<littlerbird.UI.QuickGrid>(L_YXQP, 1);
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
			QPYX_obj_YXQP.SelectIndex(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetSelectData_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			littlerbird.UI.QuickGrid  QPYX_obj_YXQP  = (littlerbird.UI.QuickGrid)ToLua.CheckObject<littlerbird.UI.QuickGrid>(L_YXQP, 1);
			object[] QPYX_arg0_YXQP = ToLua.ToParamsObject(L_YXQP, 2, QPYX_count_YXQP - 1);
			QPYX_obj_YXQP.SetSelectData(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SelectData_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			littlerbird.UI.QuickGrid  QPYX_obj_YXQP  = (littlerbird.UI.QuickGrid)ToLua.CheckObject<littlerbird.UI.QuickGrid>(L_YXQP, 1);
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			object[] QPYX_arg1_YXQP = ToLua.ToParamsObject(L_YXQP, 3, QPYX_count_YXQP - 2);
			QPYX_obj_YXQP.SelectData(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_RefreshItem_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			littlerbird.UI.QuickGrid  QPYX_obj_YXQP  = (littlerbird.UI.QuickGrid)ToLua.CheckObject<littlerbird.UI.QuickGrid>(L_YXQP, 1);
			object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 2);
			QPYX_obj_YXQP.RefreshItem(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Refresh_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			littlerbird.UI.QuickGrid  QPYX_obj_YXQP  = (littlerbird.UI.QuickGrid)ToLua.CheckObject<littlerbird.UI.QuickGrid>(L_YXQP, 1);
			QPYX_obj_YXQP.Refresh();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_MoveIndex_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			littlerbird.UI.QuickGrid  QPYX_obj_YXQP  = (littlerbird.UI.QuickGrid)ToLua.CheckObject<littlerbird.UI.QuickGrid>(L_YXQP, 1);
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.MoveIndex(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_MoveByData_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			littlerbird.UI.QuickGrid  QPYX_obj_YXQP  = (littlerbird.UI.QuickGrid)ToLua.CheckObject<littlerbird.UI.QuickGrid>(L_YXQP, 1);
			object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 2);
			QPYX_obj_YXQP.MoveByData(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ShowItemPanel_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<int>(L_YXQP, 2))
			{
				littlerbird.UI.QuickGrid  QPYX_obj_YXQP  = (littlerbird.UI.QuickGrid)ToLua.CheckObject<littlerbird.UI.QuickGrid>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				QPYX_obj_YXQP.ShowItemPanel(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<object>(L_YXQP, 2))
			{
				littlerbird.UI.QuickGrid  QPYX_obj_YXQP  = (littlerbird.UI.QuickGrid)ToLua.CheckObject<littlerbird.UI.QuickGrid>(L_YXQP, 1);
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 2);
				QPYX_obj_YXQP.ShowItemPanel(QPYX_arg0_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: littlerbird.UI.QuickGrid.ShowItemPanel");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_HideItemPanel_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				littlerbird.UI.QuickGrid  QPYX_obj_YXQP  = (littlerbird.UI.QuickGrid)ToLua.CheckObject<littlerbird.UI.QuickGrid>(L_YXQP, 1);
				QPYX_obj_YXQP.HideItemPanel();
				return 0;
			}
			else if (QPYX_count_YXQP == 2)
			{
				littlerbird.UI.QuickGrid  QPYX_obj_YXQP  = (littlerbird.UI.QuickGrid)ToLua.CheckObject<littlerbird.UI.QuickGrid>(L_YXQP, 1);
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				QPYX_obj_YXQP.HideItemPanel(QPYX_arg0_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: littlerbird.UI.QuickGrid.HideItemPanel");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Clear_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			littlerbird.UI.QuickGrid  QPYX_obj_YXQP  = (littlerbird.UI.QuickGrid)ToLua.CheckObject<littlerbird.UI.QuickGrid>(L_YXQP, 1);
			QPYX_obj_YXQP.Clear();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetData_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			littlerbird.UI.QuickGrid  QPYX_obj_YXQP  = (littlerbird.UI.QuickGrid)ToLua.CheckObject<littlerbird.UI.QuickGrid>(L_YXQP, 1);
			object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 2);
			int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
			QPYX_obj_YXQP.SetData(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CalculateRows_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			littlerbird.UI.QuickGrid  QPYX_obj_YXQP  = (littlerbird.UI.QuickGrid)ToLua.CheckObject<littlerbird.UI.QuickGrid>(L_YXQP, 1);
			QPYX_obj_YXQP.CalculateRows();
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
	static int QPYX_get_OnItemClick_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			littlerbird.UI.QuickGrid.QuickGridItemEvenet QPYX_ret_YXQP = QPYX_obj_YXQP.OnItemClick;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index OnItemClick on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_CanSelectItem_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			littlerbird.UI.QuickGrid.ReturnQuickGridItemEvent<bool> QPYX_ret_YXQP = QPYX_obj_YXQP.CanSelectItem;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index CanSelectItem on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_CanOpenItemPanel_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			littlerbird.UI.QuickGrid.ReturnQuickGridItemEvent QPYX_ret_YXQP = QPYX_obj_YXQP.CanOpenItemPanel;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index CanOpenItemPanel on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_OnItemSelectChange_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			littlerbird.UI.QuickGrid.QuickGridItemEvenet QPYX_ret_YXQP = QPYX_obj_YXQP.OnItemSelectChange;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index OnItemSelectChange on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_OnItemDataChange_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			littlerbird.UI.QuickGrid.QuickGridItemEvenet QPYX_ret_YXQP = QPYX_obj_YXQP.OnItemDataChange;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index OnItemDataChange on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_OnMoveFirstOrLast_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			littlerbird.UI.QuickGrid.QuickCallback QPYX_ret_YXQP = QPYX_obj_YXQP.OnMoveFirstOrLast;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index OnMoveFirstOrLast on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_movement_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			littlerbird.UI.QuickGrid.MoveType QPYX_ret_YXQP = QPYX_obj_YXQP.movement;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index movement on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_tweenType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			littlerbird.UI.QuickGrid.GridTweenType QPYX_ret_YXQP = QPYX_obj_YXQP.tweenType;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index tweenType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_cellWidth_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.cellWidth;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index cellWidth on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_cellHeight_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.cellHeight;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index cellHeight on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_clipWidth_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.clipWidth;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index clipWidth on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_clipHeight_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.clipHeight;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index clipHeight on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_pageCells_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.pageCells;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index pageCells on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_pageRows_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.pageRows;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index pageRows on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_needItemEvent_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.needItemEvent;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index needItemEvent on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_selectType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			littlerbird.UI.QuickGrid.SelectType QPYX_ret_YXQP = QPYX_obj_YXQP.selectType;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index selectType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_needItemPanel_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.needItemPanel;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index needItemPanel on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_fixHeightPanel_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.fixHeightPanel;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index fixHeightPanel on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_needItemPanelMask_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.needItemPanelMask;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index needItemPanelMask on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_Movement_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			littlerbird.UI.QuickGrid.MoveType QPYX_ret_YXQP = QPYX_obj_YXQP.Movement;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index Movement on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_ClipWidth_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.ClipWidth;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index ClipWidth on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_ClipHeight_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.ClipHeight;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index ClipHeight on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_itemMask_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			littlerbird.UI.QuickGridMask QPYX_ret_YXQP = QPYX_obj_YXQP.itemMask;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index itemMask on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_itemPanel_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			littlerbird.UI.QuickGridItemPanelBase QPYX_ret_YXQP = QPYX_obj_YXQP.itemPanel;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index itemPanel on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_dataList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			System.Collections.Generic.List<object> QPYX_ret_YXQP = QPYX_obj_YXQP.dataList;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index dataList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_content_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			littlerbird.UI.QuickGridContent QPYX_ret_YXQP = QPYX_obj_YXQP.content;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index content on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_tween_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			littlerbird.UI.QuickGridTweenBase QPYX_ret_YXQP = QPYX_obj_YXQP.tween;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index tween on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_selectList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			System.Collections.Generic.List<object> QPYX_ret_YXQP = QPYX_obj_YXQP.selectList;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index selectList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_items_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			System.Collections.Generic.List<littlerbird.UI.QuickGridItemBase> QPYX_ret_YXQP = QPYX_obj_YXQP.items;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index items on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isMoveFirst_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.isMoveFirst;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isMoveFirst on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isMoveLast_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.isMoveLast;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isMoveLast on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_currentRow_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.currentRow;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index currentRow on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_OnItemClick_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			littlerbird.UI.QuickGrid.QuickGridItemEvenet QPYX_arg0_YXQP = (littlerbird.UI.QuickGrid.QuickGridItemEvenet)ToLua.CheckDelegate<littlerbird.UI.QuickGrid.QuickGridItemEvenet>(L_YXQP, 2);
			QPYX_obj_YXQP.OnItemClick = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index OnItemClick on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_CanSelectItem_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			littlerbird.UI.QuickGrid.ReturnQuickGridItemEvent<bool> QPYX_arg0_YXQP = (littlerbird.UI.QuickGrid.ReturnQuickGridItemEvent<bool>)ToLua.CheckDelegate<littlerbird.UI.QuickGrid.ReturnQuickGridItemEvent<bool>>(L_YXQP, 2);
			QPYX_obj_YXQP.CanSelectItem = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index CanSelectItem on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_CanOpenItemPanel_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			littlerbird.UI.QuickGrid.ReturnQuickGridItemEvent QPYX_arg0_YXQP = (littlerbird.UI.QuickGrid.ReturnQuickGridItemEvent)ToLua.CheckDelegate<littlerbird.UI.QuickGrid.ReturnQuickGridItemEvent>(L_YXQP, 2);
			QPYX_obj_YXQP.CanOpenItemPanel = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index CanOpenItemPanel on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_OnItemSelectChange_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			littlerbird.UI.QuickGrid.QuickGridItemEvenet QPYX_arg0_YXQP = (littlerbird.UI.QuickGrid.QuickGridItemEvenet)ToLua.CheckDelegate<littlerbird.UI.QuickGrid.QuickGridItemEvenet>(L_YXQP, 2);
			QPYX_obj_YXQP.OnItemSelectChange = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index OnItemSelectChange on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_OnItemDataChange_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			littlerbird.UI.QuickGrid.QuickGridItemEvenet QPYX_arg0_YXQP = (littlerbird.UI.QuickGrid.QuickGridItemEvenet)ToLua.CheckDelegate<littlerbird.UI.QuickGrid.QuickGridItemEvenet>(L_YXQP, 2);
			QPYX_obj_YXQP.OnItemDataChange = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index OnItemDataChange on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_OnMoveFirstOrLast_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			littlerbird.UI.QuickGrid.QuickCallback QPYX_arg0_YXQP = (littlerbird.UI.QuickGrid.QuickCallback)ToLua.CheckDelegate<littlerbird.UI.QuickGrid.QuickCallback>(L_YXQP, 2);
			QPYX_obj_YXQP.OnMoveFirstOrLast = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index OnMoveFirstOrLast on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_movement_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			littlerbird.UI.QuickGrid.MoveType QPYX_arg0_YXQP = (littlerbird.UI.QuickGrid.MoveType)ToLua.CheckObject(L_YXQP, 2, typeof(littlerbird.UI.QuickGrid.MoveType));
			QPYX_obj_YXQP.movement = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index movement on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_tweenType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			littlerbird.UI.QuickGrid.GridTweenType QPYX_arg0_YXQP = (littlerbird.UI.QuickGrid.GridTweenType)ToLua.CheckObject(L_YXQP, 2, typeof(littlerbird.UI.QuickGrid.GridTweenType));
			QPYX_obj_YXQP.tweenType = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index tweenType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_cellWidth_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.cellWidth = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index cellWidth on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_cellHeight_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.cellHeight = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index cellHeight on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_clipWidth_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.clipWidth = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index clipWidth on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_clipHeight_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.clipHeight = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index clipHeight on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_pageCells_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.pageCells = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index pageCells on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_pageRows_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.pageRows = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index pageRows on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_needItemEvent_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.needItemEvent = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index needItemEvent on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_selectType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			littlerbird.UI.QuickGrid.SelectType QPYX_arg0_YXQP = (littlerbird.UI.QuickGrid.SelectType)ToLua.CheckObject(L_YXQP, 2, typeof(littlerbird.UI.QuickGrid.SelectType));
			QPYX_obj_YXQP.selectType = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index selectType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_needItemPanel_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.needItemPanel = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index needItemPanel on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_fixHeightPanel_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.fixHeightPanel = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index fixHeightPanel on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_needItemPanelMask_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.needItemPanelMask = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index needItemPanelMask on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_Movement_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			littlerbird.UI.QuickGrid.MoveType QPYX_arg0_YXQP = (littlerbird.UI.QuickGrid.MoveType)ToLua.CheckObject(L_YXQP, 2, typeof(littlerbird.UI.QuickGrid.MoveType));
			QPYX_obj_YXQP.Movement = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index Movement on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_ClipWidth_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.ClipWidth = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index ClipWidth on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_ClipHeight_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.ClipHeight = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index ClipHeight on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_dataList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGrid QPYX_obj_YXQP = (littlerbird.UI.QuickGrid)QPYX_o_YXQP;
			System.Collections.Generic.List<object> QPYX_arg0_YXQP = (System.Collections.Generic.List<object>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<object>));
			QPYX_obj_YXQP.dataList = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index dataList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_littlerbird_UI_QuickGrid_QuickGridItemEvenet_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<littlerbird.UI.QuickGrid.QuickGridItemEvenet>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<littlerbird.UI.QuickGrid.QuickGridItemEvenet>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_littlerbird_UI_QuickGrid_QuickCallback_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<littlerbird.UI.QuickGrid.QuickCallback>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<littlerbird.UI.QuickGrid.QuickCallback>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_littlerbird_UI_QuickGrid_ReturnQuickGridItemEvent_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<littlerbird.UI.QuickGrid.ReturnQuickGridItemEvent>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<littlerbird.UI.QuickGrid.ReturnQuickGridItemEvent>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_littlerbird_UI_QuickGrid_ReturnQuickGridItemEvent_bool_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<littlerbird.UI.QuickGrid.ReturnQuickGridItemEvent<bool>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<littlerbird.UI.QuickGrid.ReturnQuickGridItemEvent<bool>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}
}

