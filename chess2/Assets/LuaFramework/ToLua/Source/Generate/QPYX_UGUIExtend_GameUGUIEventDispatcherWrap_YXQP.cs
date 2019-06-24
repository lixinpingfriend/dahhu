using System;
using LuaInterface;

public class QPYX_UGUIExtend_GameUGUIEventDispatcherWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginStaticLibs("GameUGUIEventDispatcher");
		L_YXQP.RegFunction("onCustomerHandle", QPYX_onCustomerHandle_YXQP);
		L_YXQP.RegFunction("onPressHandle", QPYX_onPressHandle_YXQP);
		L_YXQP.RegFunction("onPressUpHandle", QPYX_onPressUpHandle_YXQP);
		L_YXQP.RegFunction("onClickHandle", QPYX_onClickHandle_YXQP);
		L_YXQP.RegFunction("onEndDragHandle", QPYX_onEndDragHandle_YXQP);
		L_YXQP.RegFunction("onBeginDragHandle", QPYX_onBeginDragHandle_YXQP);
		L_YXQP.RegFunction("onDragHandle", QPYX_onDragHandle_YXQP);
		L_YXQP.RegFunction("onDropHandle", QPYX_onDropHandle_YXQP);
		L_YXQP.RegFunction("onSelectHandle", QPYX_onSelectHandle_YXQP);
		L_YXQP.RegFunction("onCancelHandle", QPYX_onCancelHandle_YXQP);
		L_YXQP.RegFunction("RemoveAllEvents", QPYX_RemoveAllEvents_YXQP);
		L_YXQP.RegVar("onCustomerFn", QPYX_get_onCustomerFn_YXQP, QPYX_set_onCustomerFn_YXQP);
		L_YXQP.RegVar("onPressFn", QPYX_get_onPressFn_YXQP, QPYX_set_onPressFn_YXQP);
		L_YXQP.RegVar("onClickFn", QPYX_get_onClickFn_YXQP, QPYX_set_onClickFn_YXQP);
		L_YXQP.RegVar("onDragFn", QPYX_get_onDragFn_YXQP, QPYX_set_onDragFn_YXQP);
		L_YXQP.RegVar("onEndDragFn", QPYX_get_onEndDragFn_YXQP, QPYX_set_onEndDragFn_YXQP);
		L_YXQP.RegVar("onBeginDragFn", QPYX_get_onBeginDragFn_YXQP, QPYX_set_onBeginDragFn_YXQP);
		L_YXQP.RegVar("onDropFn", QPYX_get_onDropFn_YXQP, QPYX_set_onDropFn_YXQP);
		L_YXQP.RegVar("onSelectFn", QPYX_get_onSelectFn_YXQP, QPYX_set_onSelectFn_YXQP);
		L_YXQP.RegVar("onCancelFn", QPYX_get_onCancelFn_YXQP, QPYX_set_onCancelFn_YXQP);
		L_YXQP.RegVar("onPressUpFn", QPYX_get_onPressUpFn_YXQP, QPYX_set_onPressUpFn_YXQP);
		L_YXQP.EndStaticLibs();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_onCustomerHandle_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<UnityEngine.Vector3>(L_YXQP, 4))
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
				object QPYX_arg2_YXQP = ToLua.ToVarObject(L_YXQP, 3);
				UnityEngine.Vector3 QPYX_arg3_YXQP = ToLua.ToVector3(L_YXQP, 4);
				UGUIExtend.GameUGUIEventDispatcher.onCustomerHandle(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<object>(L_YXQP, 4))
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
				object QPYX_arg2_YXQP = ToLua.ToVarObject(L_YXQP, 3);
				object QPYX_arg3_YXQP = ToLua.ToVarObject(L_YXQP, 4);
				UGUIExtend.GameUGUIEventDispatcher.onCustomerHandle(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UGUIExtend.GameUGUIEventDispatcher.onCustomerHandle");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_onPressHandle_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
			object QPYX_arg2_YXQP = ToLua.ToVarObject(L_YXQP, 3);
			object QPYX_arg3_YXQP = ToLua.ToVarObject(L_YXQP, 4);
			UGUIExtend.GameUGUIEventDispatcher.onPressHandle(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_onPressUpHandle_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
			object QPYX_arg2_YXQP = ToLua.ToVarObject(L_YXQP, 3);
			object QPYX_arg3_YXQP = ToLua.ToVarObject(L_YXQP, 4);
			UGUIExtend.GameUGUIEventDispatcher.onPressUpHandle(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_onClickHandle_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
				object QPYX_arg2_YXQP = ToLua.ToVarObject(L_YXQP, 3);
				UGUIExtend.GameUGUIEventDispatcher.onClickHandle(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 4)
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
				object QPYX_arg2_YXQP = ToLua.ToVarObject(L_YXQP, 3);
				object QPYX_arg3_YXQP = ToLua.ToVarObject(L_YXQP, 4);
				UGUIExtend.GameUGUIEventDispatcher.onClickHandle(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UGUIExtend.GameUGUIEventDispatcher.onClickHandle");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_onEndDragHandle_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
			object QPYX_arg2_YXQP = ToLua.ToVarObject(L_YXQP, 3);
			object QPYX_arg3_YXQP = ToLua.ToVarObject(L_YXQP, 4);
			UGUIExtend.GameUGUIEventDispatcher.onEndDragHandle(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_onBeginDragHandle_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
			object QPYX_arg2_YXQP = ToLua.ToVarObject(L_YXQP, 3);
			object QPYX_arg3_YXQP = ToLua.ToVarObject(L_YXQP, 4);
			UGUIExtend.GameUGUIEventDispatcher.onBeginDragHandle(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_onDragHandle_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
			object QPYX_arg2_YXQP = ToLua.ToVarObject(L_YXQP, 3);
			object QPYX_arg3_YXQP = ToLua.ToVarObject(L_YXQP, 4);
			UGUIExtend.GameUGUIEventDispatcher.onDragHandle(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_onDropHandle_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<UnityEngine.Vector3>(L_YXQP, 4))
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
				object QPYX_arg2_YXQP = ToLua.ToVarObject(L_YXQP, 3);
				UnityEngine.Vector3 QPYX_arg3_YXQP = ToLua.ToVector3(L_YXQP, 4);
				UGUIExtend.GameUGUIEventDispatcher.onDropHandle(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<bool>(L_YXQP, 4))
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
				object QPYX_arg2_YXQP = ToLua.ToVarObject(L_YXQP, 3);
				bool QPYX_arg3_YXQP = LuaDLL.lua_toboolean(L_YXQP, 4);
				UGUIExtend.GameUGUIEventDispatcher.onDropHandle(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<object>(L_YXQP, 4))
			{
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
				string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
				object QPYX_arg2_YXQP = ToLua.ToVarObject(L_YXQP, 3);
				object QPYX_arg3_YXQP = ToLua.ToVarObject(L_YXQP, 4);
				UGUIExtend.GameUGUIEventDispatcher.onDropHandle(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UGUIExtend.GameUGUIEventDispatcher.onDropHandle");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_onSelectHandle_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
			object QPYX_arg2_YXQP = ToLua.ToVarObject(L_YXQP, 3);
			object QPYX_arg3_YXQP = ToLua.ToVarObject(L_YXQP, 4);
			UGUIExtend.GameUGUIEventDispatcher.onSelectHandle(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_onCancelHandle_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
			object QPYX_arg2_YXQP = ToLua.ToVarObject(L_YXQP, 3);
			object QPYX_arg3_YXQP = ToLua.ToVarObject(L_YXQP, 4);
			UGUIExtend.GameUGUIEventDispatcher.onCancelHandle(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_RemoveAllEvents_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 0);
			UGUIExtend.GameUGUIEventDispatcher.RemoveAllEvents();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onCustomerFn_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UGUIExtend.GameUGUIEventDispatcher.onCustomerFn);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onPressFn_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UGUIExtend.GameUGUIEventDispatcher.onPressFn);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onClickFn_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UGUIExtend.GameUGUIEventDispatcher.onClickFn);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onDragFn_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UGUIExtend.GameUGUIEventDispatcher.onDragFn);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onEndDragFn_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UGUIExtend.GameUGUIEventDispatcher.onEndDragFn);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onBeginDragFn_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UGUIExtend.GameUGUIEventDispatcher.onBeginDragFn);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onDropFn_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UGUIExtend.GameUGUIEventDispatcher.onDropFn);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onSelectFn_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UGUIExtend.GameUGUIEventDispatcher.onSelectFn);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onCancelFn_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UGUIExtend.GameUGUIEventDispatcher.onCancelFn);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onPressUpFn_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UGUIExtend.GameUGUIEventDispatcher.onPressUpFn);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onCustomerFn_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaFunction QPYX_arg0_YXQP = ToLua.CheckLuaFunction(L_YXQP, 2);
			UGUIExtend.GameUGUIEventDispatcher.onCustomerFn = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onPressFn_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaFunction QPYX_arg0_YXQP = ToLua.CheckLuaFunction(L_YXQP, 2);
			UGUIExtend.GameUGUIEventDispatcher.onPressFn = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onClickFn_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaFunction QPYX_arg0_YXQP = ToLua.CheckLuaFunction(L_YXQP, 2);
			UGUIExtend.GameUGUIEventDispatcher.onClickFn = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onDragFn_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaFunction QPYX_arg0_YXQP = ToLua.CheckLuaFunction(L_YXQP, 2);
			UGUIExtend.GameUGUIEventDispatcher.onDragFn = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onEndDragFn_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaFunction QPYX_arg0_YXQP = ToLua.CheckLuaFunction(L_YXQP, 2);
			UGUIExtend.GameUGUIEventDispatcher.onEndDragFn = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onBeginDragFn_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaFunction QPYX_arg0_YXQP = ToLua.CheckLuaFunction(L_YXQP, 2);
			UGUIExtend.GameUGUIEventDispatcher.onBeginDragFn = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onDropFn_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaFunction QPYX_arg0_YXQP = ToLua.CheckLuaFunction(L_YXQP, 2);
			UGUIExtend.GameUGUIEventDispatcher.onDropFn = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onSelectFn_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaFunction QPYX_arg0_YXQP = ToLua.CheckLuaFunction(L_YXQP, 2);
			UGUIExtend.GameUGUIEventDispatcher.onSelectFn = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onCancelFn_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaFunction QPYX_arg0_YXQP = ToLua.CheckLuaFunction(L_YXQP, 2);
			UGUIExtend.GameUGUIEventDispatcher.onCancelFn = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onPressUpFn_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaFunction QPYX_arg0_YXQP = ToLua.CheckLuaFunction(L_YXQP, 2);
			UGUIExtend.GameUGUIEventDispatcher.onPressUpFn = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}
}

