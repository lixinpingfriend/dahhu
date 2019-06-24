using System;
using LuaInterface;

public class QPYX_UnityEngine_Events_UnityEvent_intWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.Events.UnityEvent<int>), typeof(UnityEngine.Events.UnityEventBase), "UnityEvent_int");
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
			UnityEngine.Events.UnityEvent<int>  QPYX_obj_YXQP  = (UnityEngine.Events.UnityEvent<int>)ToLua.CheckObject<UnityEngine.Events.UnityEvent<int>>(L_YXQP, 1);
			UnityEngine.Events.UnityAction<int> QPYX_arg0_YXQP = (UnityEngine.Events.UnityAction<int>)ToLua.CheckDelegate<UnityEngine.Events.UnityAction<int>>(L_YXQP, 2);
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
			UnityEngine.Events.UnityEvent<int>  QPYX_obj_YXQP  = (UnityEngine.Events.UnityEvent<int>)ToLua.CheckObject<UnityEngine.Events.UnityEvent<int>>(L_YXQP, 1);
			UnityEngine.Events.UnityAction<int> QPYX_arg0_YXQP = (UnityEngine.Events.UnityAction<int>)ToLua.CheckDelegate<UnityEngine.Events.UnityAction<int>>(L_YXQP, 2);
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
			UnityEngine.Events.UnityEvent<int>  QPYX_obj_YXQP  = (UnityEngine.Events.UnityEvent<int>)ToLua.CheckObject<UnityEngine.Events.UnityEvent<int>>(L_YXQP, 1);
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.Invoke(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}
}

