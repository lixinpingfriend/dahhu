using System;
using LuaInterface;

public class QPYX_UnityEngine_AsyncOperationWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.AsyncOperation), typeof(System.Object));
		L_YXQP.RegFunction("New", QPYX__CreateUnityEngine_AsyncOperation_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("isDone", QPYX_get_isDone_YXQP, null);
		L_YXQP.RegVar("progress", QPYX_get_progress_YXQP, null);
		L_YXQP.RegVar("priority", QPYX_get_priority_YXQP, QPYX_set_priority_YXQP);
		L_YXQP.RegVar("allowSceneActivation", QPYX_get_allowSceneActivation_YXQP, QPYX_set_allowSceneActivation_YXQP);
		L_YXQP.RegVar("completed", QPYX_get_completed_YXQP, QPYX_set_completed_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUnityEngine_AsyncOperation_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				UnityEngine.AsyncOperation QPYX_obj_YXQP = new UnityEngine.AsyncOperation();
				ToLua.PushObject(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UnityEngine.AsyncOperation.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isDone_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AsyncOperation QPYX_obj_YXQP = (UnityEngine.AsyncOperation)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.isDone;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isDone on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_progress_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AsyncOperation QPYX_obj_YXQP = (UnityEngine.AsyncOperation)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.progress;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index progress on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_priority_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AsyncOperation QPYX_obj_YXQP = (UnityEngine.AsyncOperation)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.priority;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index priority on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_allowSceneActivation_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AsyncOperation QPYX_obj_YXQP = (UnityEngine.AsyncOperation)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.allowSceneActivation;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index allowSceneActivation on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_completed_YXQP(IntPtr L_YXQP)
	{
		ToLua.Push(L_YXQP, new EventObject(typeof(System.Action<UnityEngine.AsyncOperation>)));
		return 1;
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_priority_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AsyncOperation QPYX_obj_YXQP = (UnityEngine.AsyncOperation)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.priority = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index priority on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_allowSceneActivation_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.AsyncOperation QPYX_obj_YXQP = (UnityEngine.AsyncOperation)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.allowSceneActivation = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index allowSceneActivation on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_completed_YXQP(IntPtr L_YXQP)
	{
		try
		{
			UnityEngine.AsyncOperation QPYX_obj_YXQP = (UnityEngine.AsyncOperation)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.AsyncOperation));
			EventObject QPYX_arg0_YXQP = null;
			if (LuaDLL.lua_isuserdata(L_YXQP, 2) != 0)			{
				QPYX_arg0_YXQP = (EventObject)ToLua.ToObject(L_YXQP, 2);			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "The event 'UnityEngine.AsyncOperation.completed' can only appear on the left hand side of += or -= when used outside of the type 'UnityEngine.AsyncOperation'");
			}

			if (QPYX_arg0_YXQP.op == EventOp.Add)			{
				System.Action<UnityEngine.AsyncOperation> QPYX_ev_YXQP = (System.Action<UnityEngine.AsyncOperation>)QPYX_arg0_YXQP.func;
				QPYX_obj_YXQP.completed += QPYX_ev_YXQP;
			}
			else if (QPYX_arg0_YXQP.op == EventOp.Sub)			{
				System.Action<UnityEngine.AsyncOperation> QPYX_ev_YXQP = (System.Action<UnityEngine.AsyncOperation>)QPYX_arg0_YXQP.func;
				QPYX_obj_YXQP.completed -= QPYX_ev_YXQP;
			}

			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}
}

