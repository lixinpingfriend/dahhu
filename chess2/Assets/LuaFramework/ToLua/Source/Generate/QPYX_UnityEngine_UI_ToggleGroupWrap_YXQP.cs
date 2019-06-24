using System;
using LuaInterface;

public class QPYX_UnityEngine_UI_ToggleGroupWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.UI.ToggleGroup), typeof(UnityEngine.EventSystems.UIBehaviour));
		L_YXQP.RegFunction("NotifyToggleOn", QPYX_NotifyToggleOn_YXQP);
		L_YXQP.RegFunction("UnregisterToggle", QPYX_UnregisterToggle_YXQP);
		L_YXQP.RegFunction("RegisterToggle", QPYX_RegisterToggle_YXQP);
		L_YXQP.RegFunction("AnyTogglesOn", QPYX_AnyTogglesOn_YXQP);
		L_YXQP.RegFunction("ActiveToggles", QPYX_ActiveToggles_YXQP);
		L_YXQP.RegFunction("SetAllTogglesOff", QPYX_SetAllTogglesOff_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("allowSwitchOff", QPYX_get_allowSwitchOff_YXQP, QPYX_set_allowSwitchOff_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_NotifyToggleOn_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.UI.ToggleGroup  QPYX_obj_YXQP  = (UnityEngine.UI.ToggleGroup)ToLua.CheckObject<UnityEngine.UI.ToggleGroup>(L_YXQP, 1);
			UnityEngine.UI.Toggle QPYX_arg0_YXQP = (UnityEngine.UI.Toggle)ToLua.CheckObject<UnityEngine.UI.Toggle>(L_YXQP, 2);
			QPYX_obj_YXQP.NotifyToggleOn(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UnregisterToggle_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.UI.ToggleGroup  QPYX_obj_YXQP  = (UnityEngine.UI.ToggleGroup)ToLua.CheckObject<UnityEngine.UI.ToggleGroup>(L_YXQP, 1);
			UnityEngine.UI.Toggle QPYX_arg0_YXQP = (UnityEngine.UI.Toggle)ToLua.CheckObject<UnityEngine.UI.Toggle>(L_YXQP, 2);
			QPYX_obj_YXQP.UnregisterToggle(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_RegisterToggle_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.UI.ToggleGroup  QPYX_obj_YXQP  = (UnityEngine.UI.ToggleGroup)ToLua.CheckObject<UnityEngine.UI.ToggleGroup>(L_YXQP, 1);
			UnityEngine.UI.Toggle QPYX_arg0_YXQP = (UnityEngine.UI.Toggle)ToLua.CheckObject<UnityEngine.UI.Toggle>(L_YXQP, 2);
			QPYX_obj_YXQP.RegisterToggle(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_AnyTogglesOn_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.ToggleGroup  QPYX_obj_YXQP  = (UnityEngine.UI.ToggleGroup)ToLua.CheckObject<UnityEngine.UI.ToggleGroup>(L_YXQP, 1);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.AnyTogglesOn();
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ActiveToggles_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.ToggleGroup  QPYX_obj_YXQP  = (UnityEngine.UI.ToggleGroup)ToLua.CheckObject<UnityEngine.UI.ToggleGroup>(L_YXQP, 1);
			System.Collections.Generic.IEnumerable<UnityEngine.UI.Toggle> QPYX_o_YXQP = QPYX_obj_YXQP.ActiveToggles();
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetAllTogglesOff_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.UI.ToggleGroup  QPYX_obj_YXQP  = (UnityEngine.UI.ToggleGroup)ToLua.CheckObject<UnityEngine.UI.ToggleGroup>(L_YXQP, 1);
			QPYX_obj_YXQP.SetAllTogglesOff();
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
	static int QPYX_get_allowSwitchOff_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ToggleGroup QPYX_obj_YXQP = (UnityEngine.UI.ToggleGroup)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.allowSwitchOff;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index allowSwitchOff on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_allowSwitchOff_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.UI.ToggleGroup QPYX_obj_YXQP = (UnityEngine.UI.ToggleGroup)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.allowSwitchOff = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index allowSwitchOff on a nil value");
		}
	}
}

