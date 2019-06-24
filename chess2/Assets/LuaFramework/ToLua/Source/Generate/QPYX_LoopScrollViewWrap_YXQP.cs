using System;
using LuaInterface;

public class QPYX_LoopScrollViewWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(LoopScrollView), typeof(UnityEngine.MonoBehaviour));
		L_YXQP.RegFunction("SetData", QPYX_SetData_YXQP);
		L_YXQP.RegFunction("GetBaseNodeByIndex", QPYX_GetBaseNodeByIndex_YXQP);
		L_YXQP.RegFunction("MoveToIndex", QPYX_MoveToIndex_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("item2Item", QPYX_get_item2Item_YXQP, QPYX_set_item2Item_YXQP);
		L_YXQP.RegVar("OnItemClick", QPYX_get_OnItemClick_YXQP, QPYX_set_OnItemClick_YXQP);
		L_YXQP.RegVar("OnItemPress", QPYX_get_OnItemPress_YXQP, QPYX_set_OnItemPress_YXQP);
		L_YXQP.RegVar("OnDataChange", QPYX_get_OnDataChange_YXQP, QPYX_set_OnDataChange_YXQP);
		L_YXQP.RegVar("onValueChanged", QPYX_get_onValueChanged_YXQP, QPYX_set_onValueChanged_YXQP);
		L_YXQP.RegVar("needItemEvent", QPYX_get_needItemEvent_YXQP, QPYX_set_needItemEvent_YXQP);
		L_YXQP.RegVar("needCenter", QPYX_get_needCenter_YXQP, QPYX_set_needCenter_YXQP);
		L_YXQP.RegVar("m_cellRect", QPYX_get_m_cellRect_YXQP, QPYX_set_m_cellRect_YXQP);
		L_YXQP.RegVar("m_currentIndex", QPYX_get_m_currentIndex_YXQP, QPYX_set_m_currentIndex_YXQP);
		L_YXQP.RegVar("allowDrag", QPYX_get_allowDrag_YXQP, QPYX_set_allowDrag_YXQP);
		L_YXQP.RegVar("cellScale", QPYX_get_cellScale_YXQP, null);
		L_YXQP.RegVar("directionPos", QPYX_get_directionPos_YXQP, null);
		L_YXQP.RegVar("scale", QPYX_get_scale_YXQP, null);
		L_YXQP.RegVar("pageCount", QPYX_get_pageCount_YXQP, null);
		L_YXQP.RegVar("pageScale", QPYX_get_pageScale_YXQP, null);
		L_YXQP.RegVar("instantiateCount", QPYX_get_instantiateCount_YXQP, null);
		L_YXQP.RegVar("canDrag", QPYX_get_canDrag_YXQP, null);
		L_YXQP.RegVar("instantiateItems", QPYX_get_instantiateItems_YXQP, null);
		L_YXQP.RegVar("instantiateSize", QPYX_get_instantiateSize_YXQP, null);
		L_YXQP.RegVar("maxPrevPos", QPYX_get_maxPrevPos_YXQP, null);
		L_YXQP.RegFunction("OnBaseNodeEvent_bool", QPYX_LoopScrollView_OnBaseNodeEvent_bool_YXQP);
		L_YXQP.RegFunction("OnBaseNodeEvent", QPYX_LoopScrollView_OnBaseNodeEvent_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetData_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				LoopScrollView  QPYX_obj_YXQP  = (LoopScrollView)ToLua.CheckObject<LoopScrollView>(L_YXQP, 1);
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 2);
				QPYX_obj_YXQP.SetData(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3)
			{
				LoopScrollView  QPYX_obj_YXQP  = (LoopScrollView)ToLua.CheckObject<LoopScrollView>(L_YXQP, 1);
				object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				QPYX_obj_YXQP.SetData(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: LoopScrollView.SetData");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetBaseNodeByIndex_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			LoopScrollView  QPYX_obj_YXQP  = (LoopScrollView)ToLua.CheckObject<LoopScrollView>(L_YXQP, 1);
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			LoopBaseNode QPYX_o_YXQP = QPYX_obj_YXQP.GetBaseNodeByIndex(QPYX_arg0_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_MoveToIndex_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			LoopScrollView  QPYX_obj_YXQP  = (LoopScrollView)ToLua.CheckObject<LoopScrollView>(L_YXQP, 1);
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.MoveToIndex(QPYX_arg0_YXQP);
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
	static int QPYX_get_item2Item_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			LoopScrollView QPYX_obj_YXQP = (LoopScrollView)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.item2Item;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index item2Item on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_OnItemClick_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			LoopScrollView QPYX_obj_YXQP = (LoopScrollView)QPYX_o_YXQP;
			LoopScrollView.OnBaseNodeEvent QPYX_ret_YXQP = QPYX_obj_YXQP.OnItemClick;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index OnItemClick on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_OnItemPress_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			LoopScrollView QPYX_obj_YXQP = (LoopScrollView)QPYX_o_YXQP;
			LoopScrollView.OnBaseNodeEvent<bool> QPYX_ret_YXQP = QPYX_obj_YXQP.OnItemPress;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index OnItemPress on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_OnDataChange_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			LoopScrollView QPYX_obj_YXQP = (LoopScrollView)QPYX_o_YXQP;
			LoopScrollView.OnDataChangeEvent QPYX_ret_YXQP = QPYX_obj_YXQP.OnDataChange;
			ToLua.PushObject(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index OnDataChange on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onValueChanged_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			LoopScrollView QPYX_obj_YXQP = (LoopScrollView)QPYX_o_YXQP;
			LoopScrollView.OnContentPosChangeEvent QPYX_ret_YXQP = QPYX_obj_YXQP.onValueChanged;
			ToLua.PushObject(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onValueChanged on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_needItemEvent_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			LoopScrollView QPYX_obj_YXQP = (LoopScrollView)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.needItemEvent;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index needItemEvent on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_needCenter_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			LoopScrollView QPYX_obj_YXQP = (LoopScrollView)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.needCenter;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index needCenter on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_m_cellRect_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			LoopScrollView QPYX_obj_YXQP = (LoopScrollView)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_ret_YXQP = QPYX_obj_YXQP.m_cellRect;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index m_cellRect on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_m_currentIndex_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			LoopScrollView QPYX_obj_YXQP = (LoopScrollView)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.m_currentIndex;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index m_currentIndex on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_allowDrag_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			LoopScrollView QPYX_obj_YXQP = (LoopScrollView)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.allowDrag;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index allowDrag on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_cellScale_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			LoopScrollView QPYX_obj_YXQP = (LoopScrollView)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.cellScale;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index cellScale on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_directionPos_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			LoopScrollView QPYX_obj_YXQP = (LoopScrollView)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.directionPos;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index directionPos on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_scale_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			LoopScrollView QPYX_obj_YXQP = (LoopScrollView)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.scale;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index scale on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_pageCount_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			LoopScrollView QPYX_obj_YXQP = (LoopScrollView)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.pageCount;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index pageCount on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_pageScale_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			LoopScrollView QPYX_obj_YXQP = (LoopScrollView)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.pageScale;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index pageScale on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_instantiateCount_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			LoopScrollView QPYX_obj_YXQP = (LoopScrollView)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.instantiateCount;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index instantiateCount on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_canDrag_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			LoopScrollView QPYX_obj_YXQP = (LoopScrollView)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.canDrag;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index canDrag on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_instantiateItems_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			LoopScrollView QPYX_obj_YXQP = (LoopScrollView)QPYX_o_YXQP;
			System.Collections.Generic.List<UnityEngine.RectTransform> QPYX_ret_YXQP = QPYX_obj_YXQP.instantiateItems;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index instantiateItems on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_instantiateSize_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			LoopScrollView QPYX_obj_YXQP = (LoopScrollView)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_ret_YXQP = QPYX_obj_YXQP.instantiateSize;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index instantiateSize on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_maxPrevPos_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			LoopScrollView QPYX_obj_YXQP = (LoopScrollView)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.maxPrevPos;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index maxPrevPos on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_item2Item_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			LoopScrollView QPYX_obj_YXQP = (LoopScrollView)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.item2Item = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index item2Item on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_OnItemClick_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			LoopScrollView QPYX_obj_YXQP = (LoopScrollView)QPYX_o_YXQP;
			LoopScrollView.OnBaseNodeEvent QPYX_arg0_YXQP = (LoopScrollView.OnBaseNodeEvent)ToLua.CheckDelegate<LoopScrollView.OnBaseNodeEvent>(L_YXQP, 2);
			QPYX_obj_YXQP.OnItemClick = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index OnItemClick on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_OnItemPress_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			LoopScrollView QPYX_obj_YXQP = (LoopScrollView)QPYX_o_YXQP;
			LoopScrollView.OnBaseNodeEvent<bool> QPYX_arg0_YXQP = (LoopScrollView.OnBaseNodeEvent<bool>)ToLua.CheckDelegate<LoopScrollView.OnBaseNodeEvent<bool>>(L_YXQP, 2);
			QPYX_obj_YXQP.OnItemPress = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index OnItemPress on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_OnDataChange_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			LoopScrollView QPYX_obj_YXQP = (LoopScrollView)QPYX_o_YXQP;
			LoopScrollView.OnDataChangeEvent QPYX_arg0_YXQP = (LoopScrollView.OnDataChangeEvent)ToLua.CheckObject<LoopScrollView.OnDataChangeEvent>(L_YXQP, 2);
			QPYX_obj_YXQP.OnDataChange = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index OnDataChange on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onValueChanged_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			LoopScrollView QPYX_obj_YXQP = (LoopScrollView)QPYX_o_YXQP;
			LoopScrollView.OnContentPosChangeEvent QPYX_arg0_YXQP = (LoopScrollView.OnContentPosChangeEvent)ToLua.CheckObject<LoopScrollView.OnContentPosChangeEvent>(L_YXQP, 2);
			QPYX_obj_YXQP.onValueChanged = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onValueChanged on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_needItemEvent_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			LoopScrollView QPYX_obj_YXQP = (LoopScrollView)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.needItemEvent = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index needItemEvent on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_needCenter_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			LoopScrollView QPYX_obj_YXQP = (LoopScrollView)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.needCenter = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index needCenter on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_m_cellRect_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			LoopScrollView QPYX_obj_YXQP = (LoopScrollView)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_arg0_YXQP = ToLua.ToVector2(L_YXQP, 2);
			QPYX_obj_YXQP.m_cellRect = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index m_cellRect on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_m_currentIndex_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			LoopScrollView QPYX_obj_YXQP = (LoopScrollView)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.m_currentIndex = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index m_currentIndex on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_allowDrag_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			LoopScrollView QPYX_obj_YXQP = (LoopScrollView)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.allowDrag = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index allowDrag on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LoopScrollView_OnBaseNodeEvent_bool_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<LoopScrollView.OnBaseNodeEvent<bool>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<LoopScrollView.OnBaseNodeEvent<bool>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LoopScrollView_OnBaseNodeEvent_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<LoopScrollView.OnBaseNodeEvent>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<LoopScrollView.OnBaseNodeEvent>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}
}

