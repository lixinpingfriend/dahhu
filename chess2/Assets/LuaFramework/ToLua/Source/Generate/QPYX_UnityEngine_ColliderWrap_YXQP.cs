using System;
using LuaInterface;

public class QPYX_UnityEngine_ColliderWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.Collider), typeof(UnityEngine.Component));
		L_YXQP.RegFunction("ClosestPointOnBounds", QPYX_ClosestPointOnBounds_YXQP);
		L_YXQP.RegFunction("ClosestPoint", QPYX_ClosestPoint_YXQP);
		L_YXQP.RegFunction("Raycast", QPYX_Raycast_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateUnityEngine_Collider_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("enabled", QPYX_get_enabled_YXQP, QPYX_set_enabled_YXQP);
		L_YXQP.RegVar("attachedRigidbody", QPYX_get_attachedRigidbody_YXQP, null);
		L_YXQP.RegVar("isTrigger", QPYX_get_isTrigger_YXQP, QPYX_set_isTrigger_YXQP);
		L_YXQP.RegVar("contactOffset", QPYX_get_contactOffset_YXQP, QPYX_set_contactOffset_YXQP);
		L_YXQP.RegVar("material", QPYX_get_material_YXQP, QPYX_set_material_YXQP);
		L_YXQP.RegVar("sharedMaterial", QPYX_get_sharedMaterial_YXQP, QPYX_set_sharedMaterial_YXQP);
		L_YXQP.RegVar("bounds", QPYX_get_bounds_YXQP, null);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUnityEngine_Collider_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				UnityEngine.Collider QPYX_obj_YXQP = new UnityEngine.Collider();
				ToLua.Push(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UnityEngine.Collider.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ClosestPointOnBounds_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Collider  QPYX_obj_YXQP  = (UnityEngine.Collider)ToLua.CheckObject<UnityEngine.Collider>(L_YXQP, 1);
			UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
			UnityEngine.Vector3 QPYX_o_YXQP = QPYX_obj_YXQP.ClosestPointOnBounds(QPYX_arg0_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ClosestPoint_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Collider  QPYX_obj_YXQP  = (UnityEngine.Collider)ToLua.CheckObject<UnityEngine.Collider>(L_YXQP, 1);
			UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
			UnityEngine.Vector3 QPYX_o_YXQP = QPYX_obj_YXQP.ClosestPoint(QPYX_arg0_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Raycast_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			UnityEngine.Collider  QPYX_obj_YXQP  = (UnityEngine.Collider)ToLua.CheckObject<UnityEngine.Collider>(L_YXQP, 1);
			UnityEngine.Ray QPYX_arg0_YXQP = ToLua.ToRay(L_YXQP, 2);
			UnityEngine.RaycastHit QPYX_arg1_YXQP;
			float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.Raycast(QPYX_arg0_YXQP, out QPYX_arg1_YXQP, QPYX_arg2_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			if (QPYX_o_YXQP) ToLua.Push(L_YXQP, QPYX_arg1_YXQP); else LuaDLL.lua_pushnil(L_YXQP);
			return 2;
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
	static int QPYX_get_enabled_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Collider QPYX_obj_YXQP = (UnityEngine.Collider)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.enabled;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index enabled on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_attachedRigidbody_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Collider QPYX_obj_YXQP = (UnityEngine.Collider)QPYX_o_YXQP;
			UnityEngine.Rigidbody QPYX_ret_YXQP = QPYX_obj_YXQP.attachedRigidbody;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index attachedRigidbody on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isTrigger_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Collider QPYX_obj_YXQP = (UnityEngine.Collider)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.isTrigger;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isTrigger on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_contactOffset_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Collider QPYX_obj_YXQP = (UnityEngine.Collider)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.contactOffset;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index contactOffset on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_material_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Collider QPYX_obj_YXQP = (UnityEngine.Collider)QPYX_o_YXQP;
			UnityEngine.PhysicMaterial QPYX_ret_YXQP = QPYX_obj_YXQP.material;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index material on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_sharedMaterial_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Collider QPYX_obj_YXQP = (UnityEngine.Collider)QPYX_o_YXQP;
			UnityEngine.PhysicMaterial QPYX_ret_YXQP = QPYX_obj_YXQP.sharedMaterial;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index sharedMaterial on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_bounds_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Collider QPYX_obj_YXQP = (UnityEngine.Collider)QPYX_o_YXQP;
			UnityEngine.Bounds QPYX_ret_YXQP = QPYX_obj_YXQP.bounds;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index bounds on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_enabled_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Collider QPYX_obj_YXQP = (UnityEngine.Collider)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.enabled = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index enabled on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_isTrigger_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Collider QPYX_obj_YXQP = (UnityEngine.Collider)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.isTrigger = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isTrigger on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_contactOffset_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Collider QPYX_obj_YXQP = (UnityEngine.Collider)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.contactOffset = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index contactOffset on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_material_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Collider QPYX_obj_YXQP = (UnityEngine.Collider)QPYX_o_YXQP;
			UnityEngine.PhysicMaterial QPYX_arg0_YXQP = (UnityEngine.PhysicMaterial)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.PhysicMaterial));
			QPYX_obj_YXQP.material = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index material on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_sharedMaterial_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Collider QPYX_obj_YXQP = (UnityEngine.Collider)QPYX_o_YXQP;
			UnityEngine.PhysicMaterial QPYX_arg0_YXQP = (UnityEngine.PhysicMaterial)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.PhysicMaterial));
			QPYX_obj_YXQP.sharedMaterial = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index sharedMaterial on a nil value");
		}
	}
}

