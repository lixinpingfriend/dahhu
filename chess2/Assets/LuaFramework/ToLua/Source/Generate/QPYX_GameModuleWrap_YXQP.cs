using System;
using LuaInterface;

public class QPYX_GameModuleWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(GameModule), typeof(UnityEngine.MonoBehaviour));
		L_YXQP.RegFunction("InitComponent", QPYX_InitComponent_YXQP);
		L_YXQP.RegFunction("SetLayers", QPYX_SetLayers_YXQP);
		L_YXQP.RegFunction("SetRendererSortingOrder", QPYX_SetRendererSortingOrder_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("projectName", QPYX_get_projectName_YXQP, QPYX_set_projectName_YXQP);
		L_YXQP.RegVar("packageName", QPYX_get_packageName_YXQP, QPYX_set_packageName_YXQP);
		L_YXQP.RegVar("moduleName", QPYX_get_moduleName_YXQP, QPYX_set_moduleName_YXQP);
		L_YXQP.RegVar("componentCache", QPYX_get_componentCache_YXQP, QPYX_set_componentCache_YXQP);
		L_YXQP.RegVar("m_canvasList", QPYX_get_m_canvasList_YXQP, QPYX_set_m_canvasList_YXQP);
		L_YXQP.RegVar("canvasRoot", QPYX_get_canvasRoot_YXQP, QPYX_set_canvasRoot_YXQP);
		L_YXQP.RegVar("rendererSortingList", QPYX_get_rendererSortingList_YXQP, QPYX_set_rendererSortingList_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_InitComponent_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameModule  QPYX_obj_YXQP  = (GameModule)ToLua.CheckObject<GameModule>(L_YXQP, 1);
			LuaTable QPYX_arg0_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);
			QPYX_obj_YXQP.InitComponent(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetLayers_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			GameModule  QPYX_obj_YXQP  = (GameModule)ToLua.CheckObject<GameModule>(L_YXQP, 1);
			QPYX_obj_YXQP.SetLayers();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetRendererSortingOrder_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			GameModule  QPYX_obj_YXQP  = (GameModule)ToLua.CheckObject<GameModule>(L_YXQP, 1);
			QPYX_obj_YXQP.SetRendererSortingOrder();
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
	static int QPYX_get_projectName_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameModule QPYX_obj_YXQP = (GameModule)QPYX_o_YXQP;
			string QPYX_ret_YXQP = QPYX_obj_YXQP.projectName;
			LuaDLL.lua_pushstring(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index projectName on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_packageName_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameModule QPYX_obj_YXQP = (GameModule)QPYX_o_YXQP;
			string QPYX_ret_YXQP = QPYX_obj_YXQP.packageName;
			LuaDLL.lua_pushstring(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index packageName on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_moduleName_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameModule QPYX_obj_YXQP = (GameModule)QPYX_o_YXQP;
			string QPYX_ret_YXQP = QPYX_obj_YXQP.moduleName;
			LuaDLL.lua_pushstring(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index moduleName on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_componentCache_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameModule QPYX_obj_YXQP = (GameModule)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache> QPYX_ret_YXQP = QPYX_obj_YXQP.componentCache;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index componentCache on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_m_canvasList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameModule QPYX_obj_YXQP = (GameModule)QPYX_o_YXQP;
			System.Collections.Generic.List<CanvasData> QPYX_ret_YXQP = QPYX_obj_YXQP.m_canvasList;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index m_canvasList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_canvasRoot_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameModule QPYX_obj_YXQP = (GameModule)QPYX_o_YXQP;
			UnityEngine.Canvas QPYX_ret_YXQP = QPYX_obj_YXQP.canvasRoot;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index canvasRoot on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_rendererSortingList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameModule QPYX_obj_YXQP = (GameModule)QPYX_o_YXQP;
			System.Collections.Generic.List<RendererSorting> QPYX_ret_YXQP = QPYX_obj_YXQP.rendererSortingList;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index rendererSortingList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_projectName_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameModule QPYX_obj_YXQP = (GameModule)QPYX_o_YXQP;
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.projectName = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index projectName on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_packageName_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameModule QPYX_obj_YXQP = (GameModule)QPYX_o_YXQP;
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.packageName = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index packageName on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_moduleName_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameModule QPYX_obj_YXQP = (GameModule)QPYX_o_YXQP;
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.moduleName = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index moduleName on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_componentCache_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameModule QPYX_obj_YXQP = (GameModule)QPYX_o_YXQP;
			System.Collections.Generic.List<ComponentCache> QPYX_arg0_YXQP = (System.Collections.Generic.List<ComponentCache>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<ComponentCache>));
			QPYX_obj_YXQP.componentCache = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index componentCache on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_m_canvasList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameModule QPYX_obj_YXQP = (GameModule)QPYX_o_YXQP;
			System.Collections.Generic.List<CanvasData> QPYX_arg0_YXQP = (System.Collections.Generic.List<CanvasData>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<CanvasData>));
			QPYX_obj_YXQP.m_canvasList = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index m_canvasList on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_canvasRoot_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameModule QPYX_obj_YXQP = (GameModule)QPYX_o_YXQP;
			UnityEngine.Canvas QPYX_arg0_YXQP = (UnityEngine.Canvas)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.Canvas));
			QPYX_obj_YXQP.canvasRoot = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index canvasRoot on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_rendererSortingList_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameModule QPYX_obj_YXQP = (GameModule)QPYX_o_YXQP;
			System.Collections.Generic.List<RendererSorting> QPYX_arg0_YXQP = (System.Collections.Generic.List<RendererSorting>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<RendererSorting>));
			QPYX_obj_YXQP.rendererSortingList = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index rendererSortingList on a nil value");
		}
	}
}

