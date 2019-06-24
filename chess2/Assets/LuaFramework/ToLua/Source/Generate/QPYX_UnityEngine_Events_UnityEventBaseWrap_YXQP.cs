using System;
using LuaInterface;

public class QPYX_UnityEngine_Events_UnityEventBaseWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.Events.UnityEventBase), typeof(System.Object));
		L_YXQP.RegFunction("GetPersistentEventCount", QPYX_GetPersistentEventCount_YXQP);
		L_YXQP.RegFunction("GetPersistentTarget", QPYX_GetPersistentTarget_YXQP);
		L_YXQP.RegFunction("GetPersistentMethodName", QPYX_GetPersistentMethodName_YXQP);
		L_YXQP.RegFunction("SetPersistentListenerState", QPYX_SetPersistentListenerState_YXQP);
		L_YXQP.RegFunction("RemoveAllListeners", QPYX_RemoveAllListeners_YXQP);
		L_YXQP.RegFunction("ToString", QPYX_ToString_YXQP);
		L_YXQP.RegFunction("GetValidMethodInfo", QPYX_GetValidMethodInfo_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetPersistentEventCount_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Events.UnityEventBase  QPYX_obj_YXQP  = (UnityEngine.Events.UnityEventBase)ToLua.CheckObject<UnityEngine.Events.UnityEventBase>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.GetPersistentEventCount();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetPersistentTarget_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Events.UnityEventBase  QPYX_obj_YXQP  = (UnityEngine.Events.UnityEventBase)ToLua.CheckObject<UnityEngine.Events.UnityEventBase>(L_YXQP, 1);
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.Object QPYX_o_YXQP = QPYX_obj_YXQP.GetPersistentTarget(QPYX_arg0_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetPersistentMethodName_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Events.UnityEventBase  QPYX_obj_YXQP  = (UnityEngine.Events.UnityEventBase)ToLua.CheckObject<UnityEngine.Events.UnityEventBase>(L_YXQP, 1);
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			string QPYX_o_YXQP = QPYX_obj_YXQP.GetPersistentMethodName(QPYX_arg0_YXQP);
			LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetPersistentListenerState_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Events.UnityEventBase  QPYX_obj_YXQP  = (UnityEngine.Events.UnityEventBase)ToLua.CheckObject<UnityEngine.Events.UnityEventBase>(L_YXQP, 1);
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.Events.UnityEventCallState QPYX_arg1_YXQP = (UnityEngine.Events.UnityEventCallState)ToLua.CheckObject(L_YXQP, 3, typeof(UnityEngine.Events.UnityEventCallState));
			QPYX_obj_YXQP.SetPersistentListenerState(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_RemoveAllListeners_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Events.UnityEventBase  QPYX_obj_YXQP  = (UnityEngine.Events.UnityEventBase)ToLua.CheckObject<UnityEngine.Events.UnityEventBase>(L_YXQP, 1);
			QPYX_obj_YXQP.RemoveAllListeners();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ToString_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Events.UnityEventBase  QPYX_obj_YXQP  = (UnityEngine.Events.UnityEventBase)ToLua.CheckObject<UnityEngine.Events.UnityEventBase>(L_YXQP, 1);
			string QPYX_o_YXQP = QPYX_obj_YXQP.ToString();
			LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetValidMethodInfo_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 1);
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 2);
			System.Type[] QPYX_arg2_YXQP = ToLua.CheckObjectArray<System.Type>(L_YXQP, 3);
			System.Reflection.MethodInfo QPYX_o_YXQP = UnityEngine.Events.UnityEventBase.GetValidMethodInfo(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}
}

