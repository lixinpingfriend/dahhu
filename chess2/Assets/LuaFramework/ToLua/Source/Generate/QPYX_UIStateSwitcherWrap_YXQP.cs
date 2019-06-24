using System;
using LuaInterface;

public class QPYX_UIStateSwitcherWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UIStateSwitcher), typeof(UnityEngine.MonoBehaviour));
		L_YXQP.RegFunction("SwitchState", QPYX_SwitchState_YXQP);
		L_YXQP.RegFunction("SwitchStateUsingID", QPYX_SwitchStateUsingID_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("states", QPYX_get_states_YXQP, QPYX_set_states_YXQP);
		L_YXQP.RegVar("Targets", QPYX_get_Targets_YXQP, QPYX_set_Targets_YXQP);
		L_YXQP.RegVar("CurrentStateID", QPYX_get_CurrentStateID_YXQP, null);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SwitchState_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UIStateSwitcher  QPYX_obj_YXQP  = (UIStateSwitcher)ToLua.CheckObject<UIStateSwitcher>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.SwitchState(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SwitchStateUsingID_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UIStateSwitcher  QPYX_obj_YXQP  = (UIStateSwitcher)ToLua.CheckObject<UIStateSwitcher>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.SwitchStateUsingID(QPYX_arg0_YXQP);
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
	static int QPYX_get_states_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UIStateSwitcher QPYX_obj_YXQP = (UIStateSwitcher)QPYX_o_YXQP;
			System.Collections.Generic.List<UIStateSwitcher.State> QPYX_ret_YXQP = QPYX_obj_YXQP.states;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index states on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_Targets_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UIStateSwitcher QPYX_obj_YXQP = (UIStateSwitcher)QPYX_o_YXQP;
			System.Collections.Generic.List<UnityEngine.GameObject> QPYX_ret_YXQP = QPYX_obj_YXQP.Targets;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index Targets on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_CurrentStateID_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UIStateSwitcher QPYX_obj_YXQP = (UIStateSwitcher)QPYX_o_YXQP;
			string QPYX_ret_YXQP = QPYX_obj_YXQP.CurrentStateID;
			LuaDLL.lua_pushstring(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index CurrentStateID on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_states_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UIStateSwitcher QPYX_obj_YXQP = (UIStateSwitcher)QPYX_o_YXQP;
			System.Collections.Generic.List<UIStateSwitcher.State> QPYX_arg0_YXQP = (System.Collections.Generic.List<UIStateSwitcher.State>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<UIStateSwitcher.State>));
			QPYX_obj_YXQP.states = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index states on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_Targets_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UIStateSwitcher QPYX_obj_YXQP = (UIStateSwitcher)QPYX_o_YXQP;
			System.Collections.Generic.List<UnityEngine.GameObject> QPYX_arg0_YXQP = (System.Collections.Generic.List<UnityEngine.GameObject>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<UnityEngine.GameObject>));
			QPYX_obj_YXQP.Targets = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index Targets on a nil value");
		}
	}
}

