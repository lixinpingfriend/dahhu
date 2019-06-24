using System;
using LuaInterface;

public class QPYX_UnityEngine_EventSystems_BaseEventDataWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.EventSystems.BaseEventData), typeof(UnityEngine.EventSystems.AbstractEventData));
		L_YXQP.RegFunction("New", QPYX__CreateUnityEngine_EventSystems_BaseEventData_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("currentInputModule", QPYX_get_currentInputModule_YXQP, null);
		L_YXQP.RegVar("selectedObject", QPYX_get_selectedObject_YXQP, QPYX_set_selectedObject_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUnityEngine_EventSystems_BaseEventData_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				UnityEngine.EventSystems.EventSystem QPYX_arg0_YXQP = (UnityEngine.EventSystems.EventSystem)ToLua.CheckObject<UnityEngine.EventSystems.EventSystem>(L_YXQP, 1);
				UnityEngine.EventSystems.BaseEventData QPYX_obj_YXQP = new UnityEngine.EventSystems.BaseEventData(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UnityEngine.EventSystems.BaseEventData.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_currentInputModule_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.EventSystems.BaseEventData QPYX_obj_YXQP = (UnityEngine.EventSystems.BaseEventData)QPYX_o_YXQP;
			UnityEngine.EventSystems.BaseInputModule QPYX_ret_YXQP = QPYX_obj_YXQP.currentInputModule;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index currentInputModule on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_selectedObject_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.EventSystems.BaseEventData QPYX_obj_YXQP = (UnityEngine.EventSystems.BaseEventData)QPYX_o_YXQP;
			UnityEngine.GameObject QPYX_ret_YXQP = QPYX_obj_YXQP.selectedObject;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index selectedObject on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_selectedObject_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.EventSystems.BaseEventData QPYX_obj_YXQP = (UnityEngine.EventSystems.BaseEventData)QPYX_o_YXQP;
			UnityEngine.GameObject QPYX_arg0_YXQP = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.GameObject));
			QPYX_obj_YXQP.selectedObject = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index selectedObject on a nil value");
		}
	}
}

