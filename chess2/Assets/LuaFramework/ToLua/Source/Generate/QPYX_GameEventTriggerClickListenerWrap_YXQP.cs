using System;
using LuaInterface;

public class QPYX_GameEventTriggerClickListenerWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(GameEventTriggerClickListener), typeof(UnityEngine.MonoBehaviour));
		L_YXQP.RegFunction("OnPointerClick", QPYX_OnPointerClick_YXQP);
		L_YXQP.RegFunction("OnPointerDown", QPYX_OnPointerDown_YXQP);
		L_YXQP.RegFunction("OnPointerUp", QPYX_OnPointerUp_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("gameEventCollector", QPYX_get_gameEventCollector_YXQP, QPYX_set_gameEventCollector_YXQP);
		L_YXQP.RegVar("gameModule", QPYX_get_gameModule_YXQP, QPYX_set_gameModule_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OnPointerClick_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameEventTriggerClickListener  QPYX_obj_YXQP  = (GameEventTriggerClickListener)ToLua.CheckObject<GameEventTriggerClickListener>(L_YXQP, 1);
			UnityEngine.EventSystems.PointerEventData QPYX_arg0_YXQP = (UnityEngine.EventSystems.PointerEventData)ToLua.CheckObject<UnityEngine.EventSystems.PointerEventData>(L_YXQP, 2);
			QPYX_obj_YXQP.OnPointerClick(QPYX_arg0_YXQP);
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
			GameEventTriggerClickListener  QPYX_obj_YXQP  = (GameEventTriggerClickListener)ToLua.CheckObject<GameEventTriggerClickListener>(L_YXQP, 1);
			UnityEngine.EventSystems.PointerEventData QPYX_arg0_YXQP = (UnityEngine.EventSystems.PointerEventData)ToLua.CheckObject<UnityEngine.EventSystems.PointerEventData>(L_YXQP, 2);
			QPYX_obj_YXQP.OnPointerDown(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OnPointerUp_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			GameEventTriggerClickListener  QPYX_obj_YXQP  = (GameEventTriggerClickListener)ToLua.CheckObject<GameEventTriggerClickListener>(L_YXQP, 1);
			UnityEngine.EventSystems.PointerEventData QPYX_arg0_YXQP = (UnityEngine.EventSystems.PointerEventData)ToLua.CheckObject<UnityEngine.EventSystems.PointerEventData>(L_YXQP, 2);
			QPYX_obj_YXQP.OnPointerUp(QPYX_arg0_YXQP);
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
	static int QPYX_get_gameEventCollector_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameEventTriggerClickListener QPYX_obj_YXQP = (GameEventTriggerClickListener)QPYX_o_YXQP;
			UGUIExtend.GameEventCollector QPYX_ret_YXQP = QPYX_obj_YXQP.gameEventCollector;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index gameEventCollector on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_gameModule_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameEventTriggerClickListener QPYX_obj_YXQP = (GameEventTriggerClickListener)QPYX_o_YXQP;
			GameModule QPYX_ret_YXQP = QPYX_obj_YXQP.gameModule;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index gameModule on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_gameEventCollector_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameEventTriggerClickListener QPYX_obj_YXQP = (GameEventTriggerClickListener)QPYX_o_YXQP;
			UGUIExtend.GameEventCollector QPYX_arg0_YXQP = (UGUIExtend.GameEventCollector)ToLua.CheckObject<UGUIExtend.GameEventCollector>(L_YXQP, 2);
			QPYX_obj_YXQP.gameEventCollector = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index gameEventCollector on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_gameModule_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			GameEventTriggerClickListener QPYX_obj_YXQP = (GameEventTriggerClickListener)QPYX_o_YXQP;
			GameModule QPYX_arg0_YXQP = (GameModule)ToLua.CheckObject<GameModule>(L_YXQP, 2);
			QPYX_obj_YXQP.gameModule = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index gameModule on a nil value");
		}
	}
}

