using System;
using LuaInterface;

public class QPYX_UnityEngine_TrackedReferenceWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.TrackedReference), typeof(System.Object));
		L_YXQP.RegFunction("Equals", QPYX_Equals_YXQP);
		L_YXQP.RegFunction("GetHashCode", QPYX_GetHashCode_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_op_Equality_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.TrackedReference QPYX_arg0_YXQP = (UnityEngine.TrackedReference)ToLua.ToObject(L_YXQP, 1);
			UnityEngine.TrackedReference QPYX_arg1_YXQP = (UnityEngine.TrackedReference)ToLua.ToObject(L_YXQP, 2);
			bool QPYX_o_YXQP = QPYX_arg0_YXQP == QPYX_arg1_YXQP;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Equals_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.TrackedReference  QPYX_obj_YXQP  = (UnityEngine.TrackedReference)ToLua.CheckObject<UnityEngine.TrackedReference>(L_YXQP, 1);
			object QPYX_arg0_YXQP = ToLua.ToVarObject(L_YXQP, 2);
			bool QPYX_o_YXQP = QPYX_obj_YXQP != null ? QPYX_obj_YXQP.Equals(QPYX_arg0_YXQP) : QPYX_arg0_YXQP == null;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetHashCode_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.TrackedReference  QPYX_obj_YXQP  = (UnityEngine.TrackedReference)ToLua.CheckObject<UnityEngine.TrackedReference>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.GetHashCode();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}
}

