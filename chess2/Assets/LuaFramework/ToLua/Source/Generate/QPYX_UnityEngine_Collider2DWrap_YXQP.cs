using System;
using LuaInterface;

public class QPYX_UnityEngine_Collider2DWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.Collider2D), typeof(UnityEngine.Behaviour));
		L_YXQP.RegFunction("OverlapCollider", QPYX_OverlapCollider_YXQP);
		L_YXQP.RegFunction("Raycast", QPYX_Raycast_YXQP);
		L_YXQP.RegFunction("Cast", QPYX_Cast_YXQP);
		L_YXQP.RegFunction("GetContacts", QPYX_GetContacts_YXQP);
		L_YXQP.RegFunction("IsTouching", QPYX_IsTouching_YXQP);
		L_YXQP.RegFunction("IsTouchingLayers", QPYX_IsTouchingLayers_YXQP);
		L_YXQP.RegFunction("OverlapPoint", QPYX_OverlapPoint_YXQP);
		L_YXQP.RegFunction("Distance", QPYX_Distance_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateUnityEngine_Collider2D_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("density", QPYX_get_density_YXQP, QPYX_set_density_YXQP);
		L_YXQP.RegVar("isTrigger", QPYX_get_isTrigger_YXQP, QPYX_set_isTrigger_YXQP);
		L_YXQP.RegVar("usedByEffector", QPYX_get_usedByEffector_YXQP, QPYX_set_usedByEffector_YXQP);
		L_YXQP.RegVar("usedByComposite", QPYX_get_usedByComposite_YXQP, QPYX_set_usedByComposite_YXQP);
		L_YXQP.RegVar("composite", QPYX_get_composite_YXQP, null);
		L_YXQP.RegVar("offset", QPYX_get_offset_YXQP, QPYX_set_offset_YXQP);
		L_YXQP.RegVar("attachedRigidbody", QPYX_get_attachedRigidbody_YXQP, null);
		L_YXQP.RegVar("shapeCount", QPYX_get_shapeCount_YXQP, null);
		L_YXQP.RegVar("bounds", QPYX_get_bounds_YXQP, null);
		L_YXQP.RegVar("sharedMaterial", QPYX_get_sharedMaterial_YXQP, QPYX_set_sharedMaterial_YXQP);
		L_YXQP.RegVar("friction", QPYX_get_friction_YXQP, null);
		L_YXQP.RegVar("bounciness", QPYX_get_bounciness_YXQP, null);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUnityEngine_Collider2D_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				UnityEngine.Collider2D QPYX_obj_YXQP = new UnityEngine.Collider2D();
				ToLua.Push(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UnityEngine.Collider2D.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OverlapCollider_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Collider2D  QPYX_obj_YXQP  = (UnityEngine.Collider2D)ToLua.CheckObject<UnityEngine.Collider2D>(L_YXQP, 1);
			UnityEngine.ContactFilter2D QPYX_arg0_YXQP = StackTraits<UnityEngine.ContactFilter2D>.Check(L_YXQP, 2);
			UnityEngine.Collider2D[] QPYX_arg1_YXQP = ToLua.CheckObjectArray<UnityEngine.Collider2D>(L_YXQP, 3);
			int QPYX_o_YXQP = QPYX_obj_YXQP.OverlapCollider(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
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
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Collider2D  QPYX_obj_YXQP  = (UnityEngine.Collider2D)ToLua.CheckObject<UnityEngine.Collider2D>(L_YXQP, 1);
				UnityEngine.Vector2 QPYX_arg0_YXQP = ToLua.ToVector2(L_YXQP, 2);
				UnityEngine.RaycastHit2D[] QPYX_arg1_YXQP = ToLua.CheckStructArray<UnityEngine.RaycastHit2D>(L_YXQP, 3);
				int QPYX_o_YXQP = QPYX_obj_YXQP.Raycast(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<UnityEngine.RaycastHit2D[], float>(L_YXQP, 3))
			{
				UnityEngine.Collider2D  QPYX_obj_YXQP  = (UnityEngine.Collider2D)ToLua.CheckObject<UnityEngine.Collider2D>(L_YXQP, 1);
				UnityEngine.Vector2 QPYX_arg0_YXQP = ToLua.ToVector2(L_YXQP, 2);
				UnityEngine.RaycastHit2D[] QPYX_arg1_YXQP = ToLua.ToStructArray<UnityEngine.RaycastHit2D>(L_YXQP, 3);
				float QPYX_arg2_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 4);
				int QPYX_o_YXQP = QPYX_obj_YXQP.Raycast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<UnityEngine.ContactFilter2D, UnityEngine.RaycastHit2D[]>(L_YXQP, 3))
			{
				UnityEngine.Collider2D  QPYX_obj_YXQP  = (UnityEngine.Collider2D)ToLua.CheckObject<UnityEngine.Collider2D>(L_YXQP, 1);
				UnityEngine.Vector2 QPYX_arg0_YXQP = ToLua.ToVector2(L_YXQP, 2);
				UnityEngine.ContactFilter2D QPYX_arg1_YXQP = StackTraits<UnityEngine.ContactFilter2D>.To(L_YXQP, 3);
				UnityEngine.RaycastHit2D[] QPYX_arg2_YXQP = ToLua.ToStructArray<UnityEngine.RaycastHit2D>(L_YXQP, 4);
				int QPYX_o_YXQP = QPYX_obj_YXQP.Raycast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5 && TypeChecker.CheckTypes<UnityEngine.RaycastHit2D[], float, int>(L_YXQP, 3))
			{
				UnityEngine.Collider2D  QPYX_obj_YXQP  = (UnityEngine.Collider2D)ToLua.CheckObject<UnityEngine.Collider2D>(L_YXQP, 1);
				UnityEngine.Vector2 QPYX_arg0_YXQP = ToLua.ToVector2(L_YXQP, 2);
				UnityEngine.RaycastHit2D[] QPYX_arg1_YXQP = ToLua.ToStructArray<UnityEngine.RaycastHit2D>(L_YXQP, 3);
				float QPYX_arg2_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 4);
				int QPYX_arg3_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 5);
				int QPYX_o_YXQP = QPYX_obj_YXQP.Raycast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5 && TypeChecker.CheckTypes<UnityEngine.ContactFilter2D, UnityEngine.RaycastHit2D[], float>(L_YXQP, 3))
			{
				UnityEngine.Collider2D  QPYX_obj_YXQP  = (UnityEngine.Collider2D)ToLua.CheckObject<UnityEngine.Collider2D>(L_YXQP, 1);
				UnityEngine.Vector2 QPYX_arg0_YXQP = ToLua.ToVector2(L_YXQP, 2);
				UnityEngine.ContactFilter2D QPYX_arg1_YXQP = StackTraits<UnityEngine.ContactFilter2D>.To(L_YXQP, 3);
				UnityEngine.RaycastHit2D[] QPYX_arg2_YXQP = ToLua.ToStructArray<UnityEngine.RaycastHit2D>(L_YXQP, 4);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 5);
				int QPYX_o_YXQP = QPYX_obj_YXQP.Raycast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 6)
			{
				UnityEngine.Collider2D  QPYX_obj_YXQP  = (UnityEngine.Collider2D)ToLua.CheckObject<UnityEngine.Collider2D>(L_YXQP, 1);
				UnityEngine.Vector2 QPYX_arg0_YXQP = ToLua.ToVector2(L_YXQP, 2);
				UnityEngine.RaycastHit2D[] QPYX_arg1_YXQP = ToLua.CheckStructArray<UnityEngine.RaycastHit2D>(L_YXQP, 3);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
				int QPYX_arg3_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 5);
				float QPYX_arg4_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 6);
				int QPYX_o_YXQP = QPYX_obj_YXQP.Raycast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 7)
			{
				UnityEngine.Collider2D  QPYX_obj_YXQP  = (UnityEngine.Collider2D)ToLua.CheckObject<UnityEngine.Collider2D>(L_YXQP, 1);
				UnityEngine.Vector2 QPYX_arg0_YXQP = ToLua.ToVector2(L_YXQP, 2);
				UnityEngine.RaycastHit2D[] QPYX_arg1_YXQP = ToLua.CheckStructArray<UnityEngine.RaycastHit2D>(L_YXQP, 3);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
				int QPYX_arg3_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 5);
				float QPYX_arg4_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 6);
				float QPYX_arg5_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 7);
				int QPYX_o_YXQP = QPYX_obj_YXQP.Raycast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Collider2D.Raycast");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Cast_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Collider2D  QPYX_obj_YXQP  = (UnityEngine.Collider2D)ToLua.CheckObject<UnityEngine.Collider2D>(L_YXQP, 1);
				UnityEngine.Vector2 QPYX_arg0_YXQP = ToLua.ToVector2(L_YXQP, 2);
				UnityEngine.RaycastHit2D[] QPYX_arg1_YXQP = ToLua.CheckStructArray<UnityEngine.RaycastHit2D>(L_YXQP, 3);
				int QPYX_o_YXQP = QPYX_obj_YXQP.Cast(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<UnityEngine.RaycastHit2D[], float>(L_YXQP, 3))
			{
				UnityEngine.Collider2D  QPYX_obj_YXQP  = (UnityEngine.Collider2D)ToLua.CheckObject<UnityEngine.Collider2D>(L_YXQP, 1);
				UnityEngine.Vector2 QPYX_arg0_YXQP = ToLua.ToVector2(L_YXQP, 2);
				UnityEngine.RaycastHit2D[] QPYX_arg1_YXQP = ToLua.ToStructArray<UnityEngine.RaycastHit2D>(L_YXQP, 3);
				float QPYX_arg2_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 4);
				int QPYX_o_YXQP = QPYX_obj_YXQP.Cast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<UnityEngine.ContactFilter2D, UnityEngine.RaycastHit2D[]>(L_YXQP, 3))
			{
				UnityEngine.Collider2D  QPYX_obj_YXQP  = (UnityEngine.Collider2D)ToLua.CheckObject<UnityEngine.Collider2D>(L_YXQP, 1);
				UnityEngine.Vector2 QPYX_arg0_YXQP = ToLua.ToVector2(L_YXQP, 2);
				UnityEngine.ContactFilter2D QPYX_arg1_YXQP = StackTraits<UnityEngine.ContactFilter2D>.To(L_YXQP, 3);
				UnityEngine.RaycastHit2D[] QPYX_arg2_YXQP = ToLua.ToStructArray<UnityEngine.RaycastHit2D>(L_YXQP, 4);
				int QPYX_o_YXQP = QPYX_obj_YXQP.Cast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5 && TypeChecker.CheckTypes<UnityEngine.ContactFilter2D, UnityEngine.RaycastHit2D[], float>(L_YXQP, 3))
			{
				UnityEngine.Collider2D  QPYX_obj_YXQP  = (UnityEngine.Collider2D)ToLua.CheckObject<UnityEngine.Collider2D>(L_YXQP, 1);
				UnityEngine.Vector2 QPYX_arg0_YXQP = ToLua.ToVector2(L_YXQP, 2);
				UnityEngine.ContactFilter2D QPYX_arg1_YXQP = StackTraits<UnityEngine.ContactFilter2D>.To(L_YXQP, 3);
				UnityEngine.RaycastHit2D[] QPYX_arg2_YXQP = ToLua.ToStructArray<UnityEngine.RaycastHit2D>(L_YXQP, 4);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 5);
				int QPYX_o_YXQP = QPYX_obj_YXQP.Cast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5 && TypeChecker.CheckTypes<UnityEngine.RaycastHit2D[], float, bool>(L_YXQP, 3))
			{
				UnityEngine.Collider2D  QPYX_obj_YXQP  = (UnityEngine.Collider2D)ToLua.CheckObject<UnityEngine.Collider2D>(L_YXQP, 1);
				UnityEngine.Vector2 QPYX_arg0_YXQP = ToLua.ToVector2(L_YXQP, 2);
				UnityEngine.RaycastHit2D[] QPYX_arg1_YXQP = ToLua.ToStructArray<UnityEngine.RaycastHit2D>(L_YXQP, 3);
				float QPYX_arg2_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 4);
				bool QPYX_arg3_YXQP = LuaDLL.lua_toboolean(L_YXQP, 5);
				int QPYX_o_YXQP = QPYX_obj_YXQP.Cast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 6)
			{
				UnityEngine.Collider2D  QPYX_obj_YXQP  = (UnityEngine.Collider2D)ToLua.CheckObject<UnityEngine.Collider2D>(L_YXQP, 1);
				UnityEngine.Vector2 QPYX_arg0_YXQP = ToLua.ToVector2(L_YXQP, 2);
				UnityEngine.ContactFilter2D QPYX_arg1_YXQP = StackTraits<UnityEngine.ContactFilter2D>.Check(L_YXQP, 3);
				UnityEngine.RaycastHit2D[] QPYX_arg2_YXQP = ToLua.CheckStructArray<UnityEngine.RaycastHit2D>(L_YXQP, 4);
				float QPYX_arg3_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 5);
				bool QPYX_arg4_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 6);
				int QPYX_o_YXQP = QPYX_obj_YXQP.Cast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Collider2D.Cast");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetContacts_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<UnityEngine.Collider2D[]>(L_YXQP, 2))
			{
				UnityEngine.Collider2D  QPYX_obj_YXQP  = (UnityEngine.Collider2D)ToLua.CheckObject<UnityEngine.Collider2D>(L_YXQP, 1);
				UnityEngine.Collider2D[] QPYX_arg0_YXQP = ToLua.ToObjectArray<UnityEngine.Collider2D>(L_YXQP, 2);
				int QPYX_o_YXQP = QPYX_obj_YXQP.GetContacts(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<UnityEngine.ContactPoint2D[]>(L_YXQP, 2))
			{
				UnityEngine.Collider2D  QPYX_obj_YXQP  = (UnityEngine.Collider2D)ToLua.CheckObject<UnityEngine.Collider2D>(L_YXQP, 1);
				UnityEngine.ContactPoint2D[] QPYX_arg0_YXQP = ToLua.ToStructArray<UnityEngine.ContactPoint2D>(L_YXQP, 2);
				int QPYX_o_YXQP = QPYX_obj_YXQP.GetContacts(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<UnityEngine.Collider2D[]>(L_YXQP, 3))
			{
				UnityEngine.Collider2D  QPYX_obj_YXQP  = (UnityEngine.Collider2D)ToLua.CheckObject<UnityEngine.Collider2D>(L_YXQP, 1);
				UnityEngine.ContactFilter2D QPYX_arg0_YXQP = StackTraits<UnityEngine.ContactFilter2D>.Check(L_YXQP, 2);
				UnityEngine.Collider2D[] QPYX_arg1_YXQP = ToLua.ToObjectArray<UnityEngine.Collider2D>(L_YXQP, 3);
				int QPYX_o_YXQP = QPYX_obj_YXQP.GetContacts(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<UnityEngine.ContactPoint2D[]>(L_YXQP, 3))
			{
				UnityEngine.Collider2D  QPYX_obj_YXQP  = (UnityEngine.Collider2D)ToLua.CheckObject<UnityEngine.Collider2D>(L_YXQP, 1);
				UnityEngine.ContactFilter2D QPYX_arg0_YXQP = StackTraits<UnityEngine.ContactFilter2D>.Check(L_YXQP, 2);
				UnityEngine.ContactPoint2D[] QPYX_arg1_YXQP = ToLua.ToStructArray<UnityEngine.ContactPoint2D>(L_YXQP, 3);
				int QPYX_o_YXQP = QPYX_obj_YXQP.GetContacts(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Collider2D.GetContacts");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IsTouching_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<UnityEngine.ContactFilter2D>(L_YXQP, 2))
			{
				UnityEngine.Collider2D  QPYX_obj_YXQP  = (UnityEngine.Collider2D)ToLua.CheckObject<UnityEngine.Collider2D>(L_YXQP, 1);
				UnityEngine.ContactFilter2D QPYX_arg0_YXQP = StackTraits<UnityEngine.ContactFilter2D>.To(L_YXQP, 2);
				bool QPYX_o_YXQP = QPYX_obj_YXQP.IsTouching(QPYX_arg0_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<UnityEngine.Collider2D>(L_YXQP, 2))
			{
				UnityEngine.Collider2D  QPYX_obj_YXQP  = (UnityEngine.Collider2D)ToLua.CheckObject<UnityEngine.Collider2D>(L_YXQP, 1);
				UnityEngine.Collider2D QPYX_arg0_YXQP = (UnityEngine.Collider2D)ToLua.ToObject(L_YXQP, 2);
				bool QPYX_o_YXQP = QPYX_obj_YXQP.IsTouching(QPYX_arg0_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Collider2D  QPYX_obj_YXQP  = (UnityEngine.Collider2D)ToLua.CheckObject<UnityEngine.Collider2D>(L_YXQP, 1);
				UnityEngine.Collider2D QPYX_arg0_YXQP = (UnityEngine.Collider2D)ToLua.CheckObject<UnityEngine.Collider2D>(L_YXQP, 2);
				UnityEngine.ContactFilter2D QPYX_arg1_YXQP = StackTraits<UnityEngine.ContactFilter2D>.Check(L_YXQP, 3);
				bool QPYX_o_YXQP = QPYX_obj_YXQP.IsTouching(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Collider2D.IsTouching");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IsTouchingLayers_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				UnityEngine.Collider2D  QPYX_obj_YXQP  = (UnityEngine.Collider2D)ToLua.CheckObject<UnityEngine.Collider2D>(L_YXQP, 1);
				bool QPYX_o_YXQP = QPYX_obj_YXQP.IsTouchingLayers();
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Collider2D  QPYX_obj_YXQP  = (UnityEngine.Collider2D)ToLua.CheckObject<UnityEngine.Collider2D>(L_YXQP, 1);
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				bool QPYX_o_YXQP = QPYX_obj_YXQP.IsTouchingLayers(QPYX_arg0_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Collider2D.IsTouchingLayers");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OverlapPoint_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Collider2D  QPYX_obj_YXQP  = (UnityEngine.Collider2D)ToLua.CheckObject<UnityEngine.Collider2D>(L_YXQP, 1);
			UnityEngine.Vector2 QPYX_arg0_YXQP = ToLua.ToVector2(L_YXQP, 2);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.OverlapPoint(QPYX_arg0_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Distance_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Collider2D  QPYX_obj_YXQP  = (UnityEngine.Collider2D)ToLua.CheckObject<UnityEngine.Collider2D>(L_YXQP, 1);
			UnityEngine.Collider2D QPYX_arg0_YXQP = (UnityEngine.Collider2D)ToLua.CheckObject<UnityEngine.Collider2D>(L_YXQP, 2);
			UnityEngine.ColliderDistance2D QPYX_o_YXQP = QPYX_obj_YXQP.Distance(QPYX_arg0_YXQP);
			ToLua.PushValue(L_YXQP, QPYX_o_YXQP);
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

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_density_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Collider2D QPYX_obj_YXQP = (UnityEngine.Collider2D)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.density;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index density on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isTrigger_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Collider2D QPYX_obj_YXQP = (UnityEngine.Collider2D)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.isTrigger;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isTrigger on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_usedByEffector_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Collider2D QPYX_obj_YXQP = (UnityEngine.Collider2D)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.usedByEffector;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index usedByEffector on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_usedByComposite_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Collider2D QPYX_obj_YXQP = (UnityEngine.Collider2D)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.usedByComposite;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index usedByComposite on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_composite_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Collider2D QPYX_obj_YXQP = (UnityEngine.Collider2D)QPYX_o_YXQP;
			UnityEngine.CompositeCollider2D QPYX_ret_YXQP = QPYX_obj_YXQP.composite;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index composite on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_offset_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Collider2D QPYX_obj_YXQP = (UnityEngine.Collider2D)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_ret_YXQP = QPYX_obj_YXQP.offset;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index offset on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_attachedRigidbody_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Collider2D QPYX_obj_YXQP = (UnityEngine.Collider2D)QPYX_o_YXQP;
			UnityEngine.Rigidbody2D QPYX_ret_YXQP = QPYX_obj_YXQP.attachedRigidbody;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index attachedRigidbody on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_shapeCount_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Collider2D QPYX_obj_YXQP = (UnityEngine.Collider2D)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.shapeCount;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index shapeCount on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_bounds_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Collider2D QPYX_obj_YXQP = (UnityEngine.Collider2D)QPYX_o_YXQP;
			UnityEngine.Bounds QPYX_ret_YXQP = QPYX_obj_YXQP.bounds;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index bounds on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_sharedMaterial_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Collider2D QPYX_obj_YXQP = (UnityEngine.Collider2D)QPYX_o_YXQP;
			UnityEngine.PhysicsMaterial2D QPYX_ret_YXQP = QPYX_obj_YXQP.sharedMaterial;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index sharedMaterial on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_friction_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Collider2D QPYX_obj_YXQP = (UnityEngine.Collider2D)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.friction;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index friction on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_bounciness_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Collider2D QPYX_obj_YXQP = (UnityEngine.Collider2D)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.bounciness;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index bounciness on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_density_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Collider2D QPYX_obj_YXQP = (UnityEngine.Collider2D)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.density = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index density on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_isTrigger_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Collider2D QPYX_obj_YXQP = (UnityEngine.Collider2D)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.isTrigger = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isTrigger on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_usedByEffector_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Collider2D QPYX_obj_YXQP = (UnityEngine.Collider2D)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.usedByEffector = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index usedByEffector on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_usedByComposite_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Collider2D QPYX_obj_YXQP = (UnityEngine.Collider2D)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.usedByComposite = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index usedByComposite on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_offset_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Collider2D QPYX_obj_YXQP = (UnityEngine.Collider2D)QPYX_o_YXQP;
			UnityEngine.Vector2 QPYX_arg0_YXQP = ToLua.ToVector2(L_YXQP, 2);
			QPYX_obj_YXQP.offset = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index offset on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_sharedMaterial_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Collider2D QPYX_obj_YXQP = (UnityEngine.Collider2D)QPYX_o_YXQP;
			UnityEngine.PhysicsMaterial2D QPYX_arg0_YXQP = (UnityEngine.PhysicsMaterial2D)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.PhysicsMaterial2D));
			QPYX_obj_YXQP.sharedMaterial = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index sharedMaterial on a nil value");
		}
	}
}

