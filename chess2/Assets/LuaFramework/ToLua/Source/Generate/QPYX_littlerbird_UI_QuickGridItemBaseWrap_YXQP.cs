using System;
using LuaInterface;

public class QPYX_littlerbird_UI_QuickGridItemBaseWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(littlerbird.UI.QuickGridItemBase), typeof(UnityEngine.MonoBehaviour));
		L_YXQP.RegFunction("Init", QPYX_Init_YXQP);
		L_YXQP.RegFunction("OnPointerClick", QPYX_OnPointerClick_YXQP);
		L_YXQP.RegFunction("OnItemTweenComplete", QPYX_OnItemTweenComplete_YXQP);
		L_YXQP.RegFunction("OnAllTweenComplete", QPYX_OnAllTweenComplete_YXQP);
		L_YXQP.RegFunction("OnDataChange", QPYX_OnDataChange_YXQP);
		L_YXQP.RegFunction("OnSelectChange", QPYX_OnSelectChange_YXQP);
		L_YXQP.RegFunction("OnItemClick", QPYX_OnItemClick_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("config", QPYX_get_config_YXQP, QPYX_set_config_YXQP);
		L_YXQP.RegVar("index", QPYX_get_index_YXQP, QPYX_set_index_YXQP);
		L_YXQP.RegVar("line", QPYX_get_line_YXQP, QPYX_set_line_YXQP);
		L_YXQP.RegVar("data", QPYX_get_data_YXQP, QPYX_set_data_YXQP);
		L_YXQP.RegVar("selected", QPYX_get_selected_YXQP, null);
		L_YXQP.RegVar("localTsf", QPYX_get_localTsf_YXQP, null);
		L_YXQP.RegVar("localGo", QPYX_get_localGo_YXQP, null);
		L_YXQP.RegVar("itemName", QPYX_get_itemName_YXQP, null);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Init_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			littlerbird.UI.QuickGridItemBase  QPYX_obj_YXQP  = (littlerbird.UI.QuickGridItemBase)ToLua.CheckObject<littlerbird.UI.QuickGridItemBase>(L_YXQP, 1);
			QPYX_obj_YXQP.Init();
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
			littlerbird.UI.QuickGridItemBase  QPYX_obj_YXQP  = (littlerbird.UI.QuickGridItemBase)ToLua.CheckObject<littlerbird.UI.QuickGridItemBase>(L_YXQP, 1);
			UnityEngine.EventSystems.PointerEventData QPYX_arg0_YXQP = (UnityEngine.EventSystems.PointerEventData)ToLua.CheckObject<UnityEngine.EventSystems.PointerEventData>(L_YXQP, 2);
			QPYX_obj_YXQP.OnPointerClick(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OnItemTweenComplete_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			littlerbird.UI.QuickGridItemBase  QPYX_obj_YXQP  = (littlerbird.UI.QuickGridItemBase)ToLua.CheckObject<littlerbird.UI.QuickGridItemBase>(L_YXQP, 1);
			QPYX_obj_YXQP.OnItemTweenComplete();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OnAllTweenComplete_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			littlerbird.UI.QuickGridItemBase  QPYX_obj_YXQP  = (littlerbird.UI.QuickGridItemBase)ToLua.CheckObject<littlerbird.UI.QuickGridItemBase>(L_YXQP, 1);
			QPYX_obj_YXQP.OnAllTweenComplete();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OnDataChange_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			littlerbird.UI.QuickGridItemBase  QPYX_obj_YXQP  = (littlerbird.UI.QuickGridItemBase)ToLua.CheckObject<littlerbird.UI.QuickGridItemBase>(L_YXQP, 1);
			QPYX_obj_YXQP.OnDataChange();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OnSelectChange_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			littlerbird.UI.QuickGridItemBase  QPYX_obj_YXQP  = (littlerbird.UI.QuickGridItemBase)ToLua.CheckObject<littlerbird.UI.QuickGridItemBase>(L_YXQP, 1);
			QPYX_obj_YXQP.OnSelectChange();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OnItemClick_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			littlerbird.UI.QuickGridItemBase  QPYX_obj_YXQP  = (littlerbird.UI.QuickGridItemBase)ToLua.CheckObject<littlerbird.UI.QuickGridItemBase>(L_YXQP, 1);
			QPYX_obj_YXQP.OnItemClick();
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
	static int QPYX_get_config_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGridItemBase QPYX_obj_YXQP = (littlerbird.UI.QuickGridItemBase)QPYX_o_YXQP;
			littlerbird.UI.QuickGrid QPYX_ret_YXQP = QPYX_obj_YXQP.config;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index config on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_index_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGridItemBase QPYX_obj_YXQP = (littlerbird.UI.QuickGridItemBase)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.index;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index index on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_line_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGridItemBase QPYX_obj_YXQP = (littlerbird.UI.QuickGridItemBase)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.line;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index line on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_data_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGridItemBase QPYX_obj_YXQP = (littlerbird.UI.QuickGridItemBase)QPYX_o_YXQP;
			object QPYX_ret_YXQP = QPYX_obj_YXQP.data;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index data on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_selected_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGridItemBase QPYX_obj_YXQP = (littlerbird.UI.QuickGridItemBase)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.selected;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index selected on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_localTsf_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGridItemBase QPYX_obj_YXQP = (littlerbird.UI.QuickGridItemBase)QPYX_o_YXQP;
			UnityEngine.Transform QPYX_ret_YXQP = QPYX_obj_YXQP.localTsf;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index localTsf on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_localGo_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGridItemBase QPYX_obj_YXQP = (littlerbird.UI.QuickGridItemBase)QPYX_o_YXQP;
			UnityEngine.GameObject QPYX_ret_YXQP = QPYX_obj_YXQP.localGo;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index localGo on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_itemName_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGridItemBase QPYX_obj_YXQP = (littlerbird.UI.QuickGridItemBase)QPYX_o_YXQP;
			string QPYX_ret_YXQP = QPYX_obj_YXQP.itemName;
			LuaDLL.lua_pushstring(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index itemName on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_config_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGridItemBase QPYX_obj_YXQP = (littlerbird.UI.QuickGridItemBase)QPYX_o_YXQP;
			littlerbird.UI.QuickGrid QPYX_arg0_YXQP = (littlerbird.UI.QuickGrid)ToLua.CheckObject<littlerbird.UI.QuickGrid>(L_YXQP, 2);
			QPYX_obj_YXQP.config = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index config on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_index_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGridItemBase QPYX_obj_YXQP = (littlerbird.UI.QuickGridItemBase)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.index = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index index on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_line_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGridItemBase QPYX_obj_YXQP = (littlerbird.UI.QuickGridItemBase)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.line = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index line on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_data_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			littlerbird.UI.QuickGridItemBase QPYX_obj_YXQP = (littlerbird.UI.QuickGridItemBase)QPYX_o_YXQP;
			object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 2);
			QPYX_obj_YXQP.data = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index data on a nil value");
		}
	}
}

