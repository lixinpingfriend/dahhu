using System;
using LuaInterface;

public class QPYX_UnityEngine_EventSystems_UIBehaviourWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.EventSystems.UIBehaviour), typeof(UnityEngine.MonoBehaviour));
		L_YXQP.RegFunction("IsActive", QPYX_IsActive_YXQP);
		L_YXQP.RegFunction("IsDestroyed", QPYX_IsDestroyed_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IsActive_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.EventSystems.UIBehaviour  QPYX_obj_YXQP  = (UnityEngine.EventSystems.UIBehaviour)ToLua.CheckObject<UnityEngine.EventSystems.UIBehaviour>(L_YXQP, 1);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.IsActive();
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IsDestroyed_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.EventSystems.UIBehaviour  QPYX_obj_YXQP  = (UnityEngine.EventSystems.UIBehaviour)ToLua.CheckObject<UnityEngine.EventSystems.UIBehaviour>(L_YXQP, 1);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.IsDestroyed();
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
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
}

