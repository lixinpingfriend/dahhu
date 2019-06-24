using System;
using LuaInterface;

public class QPYX_UnityEngine_Events_UnityEvent_boolWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.Events.UnityEvent<bool>), typeof(UnityEngine.Events.UnityEventBase), "UnityEvent_bool");
		L_YXQP.RegFunction("AddListener", QPYX_AddListener_YXQP);
		L_YXQP.RegFunction("RemoveListener", QPYX_RemoveListener_YXQP);
		L_YXQP.RegFunction("Invoke", QPYX_Invoke_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_AddListener_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Events.UnityEvent<bool>  QPYX_obj_YXQP  = (UnityEngine.Events.UnityEvent<bool>)ToLua.CheckObject<UnityEngine.Events.UnityEvent<bool>>(L_YXQP, 1);
			UnityEngine.Events.UnityAction<bool> QPYX_arg0_YXQP = (UnityEngine.Events.UnityAction<bool>)ToLua.CheckDelegate<UnityEngine.Events.UnityAction<bool>>(L_YXQP, 2);
			QPYX_obj_YXQP.AddListener(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_RemoveListener_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Events.UnityEvent<bool>  QPYX_obj_YXQP  = (UnityEngine.Events.UnityEvent<bool>)ToLua.CheckObject<UnityEngine.Events.UnityEvent<bool>>(L_YXQP, 1);
			UnityEngine.Events.UnityAction<bool> QPYX_arg0_YXQP = (UnityEngine.Events.UnityAction<bool>)ToLua.CheckDelegate<UnityEngine.Events.UnityAction<bool>>(L_YXQP, 2);
			QPYX_obj_YXQP.RemoveListener(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Invoke_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Events.UnityEvent<bool>  QPYX_obj_YXQP  = (UnityEngine.Events.UnityEvent<bool>)ToLua.CheckObject<UnityEngine.Events.UnityEvent<bool>>(L_YXQP, 1);
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.Invoke(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}
}

