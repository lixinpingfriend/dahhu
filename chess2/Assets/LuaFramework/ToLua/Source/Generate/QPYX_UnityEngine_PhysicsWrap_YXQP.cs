using System;
using LuaInterface;

public class QPYX_UnityEngine_PhysicsWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.Physics), typeof(System.Object));
		L_YXQP.RegFunction("Raycast", QPYX_Raycast_YXQP);
		L_YXQP.RegFunction("RaycastAll", QPYX_RaycastAll_YXQP);
		L_YXQP.RegFunction("RaycastNonAlloc", QPYX_RaycastNonAlloc_YXQP);
		L_YXQP.RegFunction("Linecast", QPYX_Linecast_YXQP);
		L_YXQP.RegFunction("OverlapSphere", QPYX_OverlapSphere_YXQP);
		L_YXQP.RegFunction("OverlapSphereNonAlloc", QPYX_OverlapSphereNonAlloc_YXQP);
		L_YXQP.RegFunction("OverlapCapsule", QPYX_OverlapCapsule_YXQP);
		L_YXQP.RegFunction("OverlapCapsuleNonAlloc", QPYX_OverlapCapsuleNonAlloc_YXQP);
		L_YXQP.RegFunction("CapsuleCast", QPYX_CapsuleCast_YXQP);
		L_YXQP.RegFunction("SphereCast", QPYX_SphereCast_YXQP);
		L_YXQP.RegFunction("CapsuleCastAll", QPYX_CapsuleCastAll_YXQP);
		L_YXQP.RegFunction("CapsuleCastNonAlloc", QPYX_CapsuleCastNonAlloc_YXQP);
		L_YXQP.RegFunction("SphereCastAll", QPYX_SphereCastAll_YXQP);
		L_YXQP.RegFunction("SphereCastNonAlloc", QPYX_SphereCastNonAlloc_YXQP);
		L_YXQP.RegFunction("CheckSphere", QPYX_CheckSphere_YXQP);
		L_YXQP.RegFunction("CheckCapsule", QPYX_CheckCapsule_YXQP);
		L_YXQP.RegFunction("CheckBox", QPYX_CheckBox_YXQP);
		L_YXQP.RegFunction("OverlapBox", QPYX_OverlapBox_YXQP);
		L_YXQP.RegFunction("OverlapBoxNonAlloc", QPYX_OverlapBoxNonAlloc_YXQP);
		L_YXQP.RegFunction("BoxCastAll", QPYX_BoxCastAll_YXQP);
		L_YXQP.RegFunction("BoxCastNonAlloc", QPYX_BoxCastNonAlloc_YXQP);
		L_YXQP.RegFunction("BoxCast", QPYX_BoxCast_YXQP);
		L_YXQP.RegFunction("IgnoreCollision", QPYX_IgnoreCollision_YXQP);
		L_YXQP.RegFunction("IgnoreLayerCollision", QPYX_IgnoreLayerCollision_YXQP);
		L_YXQP.RegFunction("GetIgnoreLayerCollision", QPYX_GetIgnoreLayerCollision_YXQP);
		L_YXQP.RegFunction("ComputePenetration", QPYX_ComputePenetration_YXQP);
		L_YXQP.RegFunction("ClosestPoint", QPYX_ClosestPoint_YXQP);
		L_YXQP.RegFunction("Simulate", QPYX_Simulate_YXQP);
		L_YXQP.RegFunction("SyncTransforms", QPYX_SyncTransforms_YXQP);
		L_YXQP.RegFunction("RebuildBroadphaseRegions", QPYX_RebuildBroadphaseRegions_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateUnityEngine_Physics_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegConstant("IgnoreRaycastLayer", 4);
		L_YXQP.RegConstant("DefaultRaycastLayers", -5);
		L_YXQP.RegConstant("AllLayers", -1);
		L_YXQP.RegVar("gravity", QPYX_get_gravity_YXQP, QPYX_set_gravity_YXQP);
		L_YXQP.RegVar("defaultContactOffset", QPYX_get_defaultContactOffset_YXQP, QPYX_set_defaultContactOffset_YXQP);
		L_YXQP.RegVar("bounceThreshold", QPYX_get_bounceThreshold_YXQP, QPYX_set_bounceThreshold_YXQP);
		L_YXQP.RegVar("defaultSolverIterations", QPYX_get_defaultSolverIterations_YXQP, QPYX_set_defaultSolverIterations_YXQP);
		L_YXQP.RegVar("defaultSolverVelocityIterations", QPYX_get_defaultSolverVelocityIterations_YXQP, QPYX_set_defaultSolverVelocityIterations_YXQP);
		L_YXQP.RegVar("sleepThreshold", QPYX_get_sleepThreshold_YXQP, QPYX_set_sleepThreshold_YXQP);
		L_YXQP.RegVar("queriesHitTriggers", QPYX_get_queriesHitTriggers_YXQP, QPYX_set_queriesHitTriggers_YXQP);
		L_YXQP.RegVar("queriesHitBackfaces", QPYX_get_queriesHitBackfaces_YXQP, QPYX_set_queriesHitBackfaces_YXQP);
		L_YXQP.RegVar("interCollisionDistance", QPYX_get_interCollisionDistance_YXQP, QPYX_set_interCollisionDistance_YXQP);
		L_YXQP.RegVar("interCollisionStiffness", QPYX_get_interCollisionStiffness_YXQP, QPYX_set_interCollisionStiffness_YXQP);
		L_YXQP.RegVar("interCollisionSettingsToggle", QPYX_get_interCollisionSettingsToggle_YXQP, QPYX_set_interCollisionSettingsToggle_YXQP);
		L_YXQP.RegVar("autoSimulation", QPYX_get_autoSimulation_YXQP, QPYX_set_autoSimulation_YXQP);
		L_YXQP.RegVar("autoSyncTransforms", QPYX_get_autoSyncTransforms_YXQP, QPYX_set_autoSyncTransforms_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUnityEngine_Physics_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				UnityEngine.Physics QPYX_obj_YXQP = new UnityEngine.Physics();
				ToLua.PushObject(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UnityEngine.Physics.New");
			}
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
			if (QPYX_count_YXQP == 1)
			{
				UnityEngine.Ray QPYX_arg0_YXQP = ToLua.ToRay(L_YXQP, 1);
				bool QPYX_o_YXQP = UnityEngine.Physics.Raycast(QPYX_arg0_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<UnityEngine.Ray, LuaInterface.LuaOut<UnityEngine.RaycastHit>>(L_YXQP, 1))
			{
				UnityEngine.Ray QPYX_arg0_YXQP = ToLua.ToRay(L_YXQP, 1);
				UnityEngine.RaycastHit QPYX_arg1_YXQP;
				bool QPYX_o_YXQP = UnityEngine.Physics.Raycast(QPYX_arg0_YXQP, out QPYX_arg1_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				if (QPYX_o_YXQP) ToLua.Push(L_YXQP, QPYX_arg1_YXQP); else LuaDLL.lua_pushnil(L_YXQP);
				return 2;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<UnityEngine.Vector3, UnityEngine.Vector3>(L_YXQP, 1))
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				bool QPYX_o_YXQP = UnityEngine.Physics.Raycast(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<UnityEngine.Ray, float>(L_YXQP, 1))
			{
				UnityEngine.Ray QPYX_arg0_YXQP = ToLua.ToRay(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 2);
				bool QPYX_o_YXQP = UnityEngine.Physics.Raycast(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<UnityEngine.Ray, float, int>(L_YXQP, 1))
			{
				UnityEngine.Ray QPYX_arg0_YXQP = ToLua.ToRay(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 2);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 3);
				bool QPYX_o_YXQP = UnityEngine.Physics.Raycast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<UnityEngine.Vector3, UnityEngine.Vector3, LuaInterface.LuaOut<UnityEngine.RaycastHit>>(L_YXQP, 1))
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.RaycastHit QPYX_arg2_YXQP;
				bool QPYX_o_YXQP = UnityEngine.Physics.Raycast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, out QPYX_arg2_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				if (QPYX_o_YXQP) ToLua.Push(L_YXQP, QPYX_arg2_YXQP); else LuaDLL.lua_pushnil(L_YXQP);
				return 2;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<UnityEngine.Vector3, UnityEngine.Vector3, float>(L_YXQP, 1))
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				bool QPYX_o_YXQP = UnityEngine.Physics.Raycast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<UnityEngine.Ray, LuaInterface.LuaOut<UnityEngine.RaycastHit>, float>(L_YXQP, 1))
			{
				UnityEngine.Ray QPYX_arg0_YXQP = ToLua.ToRay(L_YXQP, 1);
				UnityEngine.RaycastHit QPYX_arg1_YXQP;
				float QPYX_arg2_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				bool QPYX_o_YXQP = UnityEngine.Physics.Raycast(QPYX_arg0_YXQP, out QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				if (QPYX_o_YXQP) ToLua.Push(L_YXQP, QPYX_arg1_YXQP); else LuaDLL.lua_pushnil(L_YXQP);
				return 2;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<UnityEngine.Ray, float, int, UnityEngine.QueryTriggerInteraction>(L_YXQP, 1))
			{
				UnityEngine.Ray QPYX_arg0_YXQP = ToLua.ToRay(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 2);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 3);
				UnityEngine.QueryTriggerInteraction QPYX_arg3_YXQP = (UnityEngine.QueryTriggerInteraction)ToLua.ToObject(L_YXQP, 4);
				bool QPYX_o_YXQP = UnityEngine.Physics.Raycast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<UnityEngine.Vector3, UnityEngine.Vector3, float, int>(L_YXQP, 1))
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				int QPYX_arg3_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				bool QPYX_o_YXQP = UnityEngine.Physics.Raycast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<UnityEngine.Vector3, UnityEngine.Vector3, LuaInterface.LuaOut<UnityEngine.RaycastHit>, float>(L_YXQP, 1))
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.RaycastHit QPYX_arg2_YXQP;
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 4);
				bool QPYX_o_YXQP = UnityEngine.Physics.Raycast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, out QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				if (QPYX_o_YXQP) ToLua.Push(L_YXQP, QPYX_arg2_YXQP); else LuaDLL.lua_pushnil(L_YXQP);
				return 2;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<UnityEngine.Ray, LuaInterface.LuaOut<UnityEngine.RaycastHit>, float, int>(L_YXQP, 1))
			{
				UnityEngine.Ray QPYX_arg0_YXQP = ToLua.ToRay(L_YXQP, 1);
				UnityEngine.RaycastHit QPYX_arg1_YXQP;
				float QPYX_arg2_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				int QPYX_arg3_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				bool QPYX_o_YXQP = UnityEngine.Physics.Raycast(QPYX_arg0_YXQP, out QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				if (QPYX_o_YXQP) ToLua.Push(L_YXQP, QPYX_arg1_YXQP); else LuaDLL.lua_pushnil(L_YXQP);
				return 2;
			}
			else if (QPYX_count_YXQP == 5 && TypeChecker.CheckTypes<UnityEngine.Vector3, UnityEngine.Vector3, float, int, UnityEngine.QueryTriggerInteraction>(L_YXQP, 1))
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				int QPYX_arg3_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				UnityEngine.QueryTriggerInteraction QPYX_arg4_YXQP = (UnityEngine.QueryTriggerInteraction)ToLua.ToObject(L_YXQP, 5);
				bool QPYX_o_YXQP = UnityEngine.Physics.Raycast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5 && TypeChecker.CheckTypes<UnityEngine.Vector3, UnityEngine.Vector3, LuaInterface.LuaOut<UnityEngine.RaycastHit>, float, int>(L_YXQP, 1))
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.RaycastHit QPYX_arg2_YXQP;
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 4);
				int QPYX_arg4_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 5);
				bool QPYX_o_YXQP = UnityEngine.Physics.Raycast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, out QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				if (QPYX_o_YXQP) ToLua.Push(L_YXQP, QPYX_arg2_YXQP); else LuaDLL.lua_pushnil(L_YXQP);
				return 2;
			}
			else if (QPYX_count_YXQP == 5 && TypeChecker.CheckTypes<UnityEngine.Ray, LuaInterface.LuaOut<UnityEngine.RaycastHit>, float, int, UnityEngine.QueryTriggerInteraction>(L_YXQP, 1))
			{
				UnityEngine.Ray QPYX_arg0_YXQP = ToLua.ToRay(L_YXQP, 1);
				UnityEngine.RaycastHit QPYX_arg1_YXQP;
				float QPYX_arg2_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				int QPYX_arg3_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				UnityEngine.QueryTriggerInteraction QPYX_arg4_YXQP = (UnityEngine.QueryTriggerInteraction)ToLua.ToObject(L_YXQP, 5);
				bool QPYX_o_YXQP = UnityEngine.Physics.Raycast(QPYX_arg0_YXQP, out QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				if (QPYX_o_YXQP) ToLua.Push(L_YXQP, QPYX_arg1_YXQP); else LuaDLL.lua_pushnil(L_YXQP);
				return 2;
			}
			else if (QPYX_count_YXQP == 6)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.RaycastHit QPYX_arg2_YXQP;
				float QPYX_arg3_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
				int QPYX_arg4_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 5);
				UnityEngine.QueryTriggerInteraction QPYX_arg5_YXQP = (UnityEngine.QueryTriggerInteraction)ToLua.CheckObject(L_YXQP, 6, typeof(UnityEngine.QueryTriggerInteraction));
				bool QPYX_o_YXQP = UnityEngine.Physics.Raycast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, out QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				if (QPYX_o_YXQP) ToLua.Push(L_YXQP, QPYX_arg2_YXQP); else LuaDLL.lua_pushnil(L_YXQP);
				return 2;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Physics.Raycast");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_RaycastAll_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				UnityEngine.Ray QPYX_arg0_YXQP = ToLua.ToRay(L_YXQP, 1);
				UnityEngine.RaycastHit[] QPYX_o_YXQP = UnityEngine.Physics.RaycastAll(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<UnityEngine.Vector3, UnityEngine.Vector3>(L_YXQP, 1))
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.RaycastHit[] QPYX_o_YXQP = UnityEngine.Physics.RaycastAll(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<UnityEngine.Ray, float>(L_YXQP, 1))
			{
				UnityEngine.Ray QPYX_arg0_YXQP = ToLua.ToRay(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 2);
				UnityEngine.RaycastHit[] QPYX_o_YXQP = UnityEngine.Physics.RaycastAll(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<UnityEngine.Vector3, UnityEngine.Vector3, float>(L_YXQP, 1))
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				UnityEngine.RaycastHit[] QPYX_o_YXQP = UnityEngine.Physics.RaycastAll(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<UnityEngine.Ray, float, int>(L_YXQP, 1))
			{
				UnityEngine.Ray QPYX_arg0_YXQP = ToLua.ToRay(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 2);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 3);
				UnityEngine.RaycastHit[] QPYX_o_YXQP = UnityEngine.Physics.RaycastAll(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<UnityEngine.Vector3, UnityEngine.Vector3, float, int>(L_YXQP, 1))
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				int QPYX_arg3_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				UnityEngine.RaycastHit[] QPYX_o_YXQP = UnityEngine.Physics.RaycastAll(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<UnityEngine.Ray, float, int, UnityEngine.QueryTriggerInteraction>(L_YXQP, 1))
			{
				UnityEngine.Ray QPYX_arg0_YXQP = ToLua.ToRay(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 2);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 3);
				UnityEngine.QueryTriggerInteraction QPYX_arg3_YXQP = (UnityEngine.QueryTriggerInteraction)ToLua.ToObject(L_YXQP, 4);
				UnityEngine.RaycastHit[] QPYX_o_YXQP = UnityEngine.Physics.RaycastAll(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				int QPYX_arg3_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				UnityEngine.QueryTriggerInteraction QPYX_arg4_YXQP = (UnityEngine.QueryTriggerInteraction)ToLua.CheckObject(L_YXQP, 5, typeof(UnityEngine.QueryTriggerInteraction));
				UnityEngine.RaycastHit[] QPYX_o_YXQP = UnityEngine.Physics.RaycastAll(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Physics.RaycastAll");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_RaycastNonAlloc_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Ray QPYX_arg0_YXQP = ToLua.ToRay(L_YXQP, 1);
				UnityEngine.RaycastHit[] QPYX_arg1_YXQP = ToLua.CheckStructArray<UnityEngine.RaycastHit>(L_YXQP, 2);
				int QPYX_o_YXQP = UnityEngine.Physics.RaycastNonAlloc(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<UnityEngine.Vector3, UnityEngine.Vector3, UnityEngine.RaycastHit[]>(L_YXQP, 1))
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.RaycastHit[] QPYX_arg2_YXQP = ToLua.ToStructArray<UnityEngine.RaycastHit>(L_YXQP, 3);
				int QPYX_o_YXQP = UnityEngine.Physics.RaycastNonAlloc(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<UnityEngine.Ray, UnityEngine.RaycastHit[], float>(L_YXQP, 1))
			{
				UnityEngine.Ray QPYX_arg0_YXQP = ToLua.ToRay(L_YXQP, 1);
				UnityEngine.RaycastHit[] QPYX_arg1_YXQP = ToLua.ToStructArray<UnityEngine.RaycastHit>(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				int QPYX_o_YXQP = UnityEngine.Physics.RaycastNonAlloc(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<UnityEngine.Vector3, UnityEngine.Vector3, UnityEngine.RaycastHit[], float>(L_YXQP, 1))
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.RaycastHit[] QPYX_arg2_YXQP = ToLua.ToStructArray<UnityEngine.RaycastHit>(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 4);
				int QPYX_o_YXQP = UnityEngine.Physics.RaycastNonAlloc(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<UnityEngine.Ray, UnityEngine.RaycastHit[], float, int>(L_YXQP, 1))
			{
				UnityEngine.Ray QPYX_arg0_YXQP = ToLua.ToRay(L_YXQP, 1);
				UnityEngine.RaycastHit[] QPYX_arg1_YXQP = ToLua.ToStructArray<UnityEngine.RaycastHit>(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				int QPYX_arg3_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				int QPYX_o_YXQP = UnityEngine.Physics.RaycastNonAlloc(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5 && TypeChecker.CheckTypes<UnityEngine.Vector3, UnityEngine.Vector3, UnityEngine.RaycastHit[], float, int>(L_YXQP, 1))
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.RaycastHit[] QPYX_arg2_YXQP = ToLua.ToStructArray<UnityEngine.RaycastHit>(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 4);
				int QPYX_arg4_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 5);
				int QPYX_o_YXQP = UnityEngine.Physics.RaycastNonAlloc(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5 && TypeChecker.CheckTypes<UnityEngine.Ray, UnityEngine.RaycastHit[], float, int, UnityEngine.QueryTriggerInteraction>(L_YXQP, 1))
			{
				UnityEngine.Ray QPYX_arg0_YXQP = ToLua.ToRay(L_YXQP, 1);
				UnityEngine.RaycastHit[] QPYX_arg1_YXQP = ToLua.ToStructArray<UnityEngine.RaycastHit>(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				int QPYX_arg3_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				UnityEngine.QueryTriggerInteraction QPYX_arg4_YXQP = (UnityEngine.QueryTriggerInteraction)ToLua.ToObject(L_YXQP, 5);
				int QPYX_o_YXQP = UnityEngine.Physics.RaycastNonAlloc(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 6)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.RaycastHit[] QPYX_arg2_YXQP = ToLua.CheckStructArray<UnityEngine.RaycastHit>(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
				int QPYX_arg4_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 5);
				UnityEngine.QueryTriggerInteraction QPYX_arg5_YXQP = (UnityEngine.QueryTriggerInteraction)ToLua.CheckObject(L_YXQP, 6, typeof(UnityEngine.QueryTriggerInteraction));
				int QPYX_o_YXQP = UnityEngine.Physics.RaycastNonAlloc(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Physics.RaycastNonAlloc");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Linecast_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				bool QPYX_o_YXQP = UnityEngine.Physics.Linecast(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<LuaInterface.LuaOut<UnityEngine.RaycastHit>>(L_YXQP, 3))
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.RaycastHit QPYX_arg2_YXQP;
				bool QPYX_o_YXQP = UnityEngine.Physics.Linecast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, out QPYX_arg2_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg2_YXQP);
				return 2;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<int>(L_YXQP, 3))
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 3);
				bool QPYX_o_YXQP = UnityEngine.Physics.Linecast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<LuaInterface.LuaOut<UnityEngine.RaycastHit>, int>(L_YXQP, 3))
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.RaycastHit QPYX_arg2_YXQP;
				int QPYX_arg3_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				bool QPYX_o_YXQP = UnityEngine.Physics.Linecast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, out QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg2_YXQP);
				return 2;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<int, UnityEngine.QueryTriggerInteraction>(L_YXQP, 3))
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 3);
				UnityEngine.QueryTriggerInteraction QPYX_arg3_YXQP = (UnityEngine.QueryTriggerInteraction)ToLua.ToObject(L_YXQP, 4);
				bool QPYX_o_YXQP = UnityEngine.Physics.Linecast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.RaycastHit QPYX_arg2_YXQP;
				int QPYX_arg3_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				UnityEngine.QueryTriggerInteraction QPYX_arg4_YXQP = (UnityEngine.QueryTriggerInteraction)ToLua.CheckObject(L_YXQP, 5, typeof(UnityEngine.QueryTriggerInteraction));
				bool QPYX_o_YXQP = UnityEngine.Physics.Linecast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, out QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg2_YXQP);
				return 2;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Physics.Linecast");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OverlapSphere_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.Collider[] QPYX_o_YXQP = UnityEngine.Physics.OverlapSphere(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.Collider[] QPYX_o_YXQP = UnityEngine.Physics.OverlapSphere(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.QueryTriggerInteraction QPYX_arg3_YXQP = (UnityEngine.QueryTriggerInteraction)ToLua.CheckObject(L_YXQP, 4, typeof(UnityEngine.QueryTriggerInteraction));
				UnityEngine.Collider[] QPYX_o_YXQP = UnityEngine.Physics.OverlapSphere(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Physics.OverlapSphere");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OverlapSphereNonAlloc_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.Collider[] QPYX_arg2_YXQP = ToLua.CheckObjectArray<UnityEngine.Collider>(L_YXQP, 3);
				int QPYX_o_YXQP = UnityEngine.Physics.OverlapSphereNonAlloc(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.Collider[] QPYX_arg2_YXQP = ToLua.CheckObjectArray<UnityEngine.Collider>(L_YXQP, 3);
				int QPYX_arg3_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				int QPYX_o_YXQP = UnityEngine.Physics.OverlapSphereNonAlloc(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.Collider[] QPYX_arg2_YXQP = ToLua.CheckObjectArray<UnityEngine.Collider>(L_YXQP, 3);
				int QPYX_arg3_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				UnityEngine.QueryTriggerInteraction QPYX_arg4_YXQP = (UnityEngine.QueryTriggerInteraction)ToLua.CheckObject(L_YXQP, 5, typeof(UnityEngine.QueryTriggerInteraction));
				int QPYX_o_YXQP = UnityEngine.Physics.OverlapSphereNonAlloc(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Physics.OverlapSphereNonAlloc");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OverlapCapsule_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.Collider[] QPYX_o_YXQP = UnityEngine.Physics.OverlapCapsule(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				int QPYX_arg3_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				UnityEngine.Collider[] QPYX_o_YXQP = UnityEngine.Physics.OverlapCapsule(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				int QPYX_arg3_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				UnityEngine.QueryTriggerInteraction QPYX_arg4_YXQP = (UnityEngine.QueryTriggerInteraction)ToLua.CheckObject(L_YXQP, 5, typeof(UnityEngine.QueryTriggerInteraction));
				UnityEngine.Collider[] QPYX_o_YXQP = UnityEngine.Physics.OverlapCapsule(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Physics.OverlapCapsule");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OverlapCapsuleNonAlloc_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.Collider[] QPYX_arg3_YXQP = ToLua.CheckObjectArray<UnityEngine.Collider>(L_YXQP, 4);
				int QPYX_o_YXQP = UnityEngine.Physics.OverlapCapsuleNonAlloc(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.Collider[] QPYX_arg3_YXQP = ToLua.CheckObjectArray<UnityEngine.Collider>(L_YXQP, 4);
				int QPYX_arg4_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 5);
				int QPYX_o_YXQP = UnityEngine.Physics.OverlapCapsuleNonAlloc(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 6)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.Collider[] QPYX_arg3_YXQP = ToLua.CheckObjectArray<UnityEngine.Collider>(L_YXQP, 4);
				int QPYX_arg4_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 5);
				UnityEngine.QueryTriggerInteraction QPYX_arg5_YXQP = (UnityEngine.QueryTriggerInteraction)ToLua.CheckObject(L_YXQP, 6, typeof(UnityEngine.QueryTriggerInteraction));
				int QPYX_o_YXQP = UnityEngine.Physics.OverlapCapsuleNonAlloc(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Physics.OverlapCapsuleNonAlloc");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CapsuleCast_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.Vector3 QPYX_arg3_YXQP = ToLua.ToVector3(L_YXQP, 4);
				bool QPYX_o_YXQP = UnityEngine.Physics.CapsuleCast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5 && TypeChecker.CheckTypes<LuaInterface.LuaOut<UnityEngine.RaycastHit>>(L_YXQP, 5))
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.Vector3 QPYX_arg3_YXQP = ToLua.ToVector3(L_YXQP, 4);
				UnityEngine.RaycastHit QPYX_arg4_YXQP;
				bool QPYX_o_YXQP = UnityEngine.Physics.CapsuleCast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, out QPYX_arg4_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg4_YXQP);
				return 2;
			}
			else if (QPYX_count_YXQP == 5 && TypeChecker.CheckTypes<float>(L_YXQP, 5))
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.Vector3 QPYX_arg3_YXQP = ToLua.ToVector3(L_YXQP, 4);
				float QPYX_arg4_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 5);
				bool QPYX_o_YXQP = UnityEngine.Physics.CapsuleCast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 6 && TypeChecker.CheckTypes<LuaInterface.LuaOut<UnityEngine.RaycastHit>, float>(L_YXQP, 5))
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.Vector3 QPYX_arg3_YXQP = ToLua.ToVector3(L_YXQP, 4);
				UnityEngine.RaycastHit QPYX_arg4_YXQP;
				float QPYX_arg5_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 6);
				bool QPYX_o_YXQP = UnityEngine.Physics.CapsuleCast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, out QPYX_arg4_YXQP, QPYX_arg5_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg4_YXQP);
				return 2;
			}
			else if (QPYX_count_YXQP == 6 && TypeChecker.CheckTypes<float, int>(L_YXQP, 5))
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.Vector3 QPYX_arg3_YXQP = ToLua.ToVector3(L_YXQP, 4);
				float QPYX_arg4_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 5);
				int QPYX_arg5_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 6);
				bool QPYX_o_YXQP = UnityEngine.Physics.CapsuleCast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 7 && TypeChecker.CheckTypes<float, int, UnityEngine.QueryTriggerInteraction>(L_YXQP, 5))
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.Vector3 QPYX_arg3_YXQP = ToLua.ToVector3(L_YXQP, 4);
				float QPYX_arg4_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 5);
				int QPYX_arg5_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 6);
				UnityEngine.QueryTriggerInteraction QPYX_arg6_YXQP = (UnityEngine.QueryTriggerInteraction)ToLua.ToObject(L_YXQP, 7);
				bool QPYX_o_YXQP = UnityEngine.Physics.CapsuleCast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP, QPYX_arg6_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 7 && TypeChecker.CheckTypes<LuaInterface.LuaOut<UnityEngine.RaycastHit>, float, int>(L_YXQP, 5))
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.Vector3 QPYX_arg3_YXQP = ToLua.ToVector3(L_YXQP, 4);
				UnityEngine.RaycastHit QPYX_arg4_YXQP;
				float QPYX_arg5_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 6);
				int QPYX_arg6_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 7);
				bool QPYX_o_YXQP = UnityEngine.Physics.CapsuleCast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, out QPYX_arg4_YXQP, QPYX_arg5_YXQP, QPYX_arg6_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg4_YXQP);
				return 2;
			}
			else if (QPYX_count_YXQP == 8)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.Vector3 QPYX_arg3_YXQP = ToLua.ToVector3(L_YXQP, 4);
				UnityEngine.RaycastHit QPYX_arg4_YXQP;
				float QPYX_arg5_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 6);
				int QPYX_arg6_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 7);
				UnityEngine.QueryTriggerInteraction QPYX_arg7_YXQP = (UnityEngine.QueryTriggerInteraction)ToLua.CheckObject(L_YXQP, 8, typeof(UnityEngine.QueryTriggerInteraction));
				bool QPYX_o_YXQP = UnityEngine.Physics.CapsuleCast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, out QPYX_arg4_YXQP, QPYX_arg5_YXQP, QPYX_arg6_YXQP, QPYX_arg7_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg4_YXQP);
				return 2;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Physics.CapsuleCast");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SphereCast_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Ray QPYX_arg0_YXQP = ToLua.ToRay(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				bool QPYX_o_YXQP = UnityEngine.Physics.SphereCast(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<float>(L_YXQP, 3))
			{
				UnityEngine.Ray QPYX_arg0_YXQP = ToLua.ToRay(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				bool QPYX_o_YXQP = UnityEngine.Physics.SphereCast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<LuaInterface.LuaOut<UnityEngine.RaycastHit>>(L_YXQP, 3))
			{
				UnityEngine.Ray QPYX_arg0_YXQP = ToLua.ToRay(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.RaycastHit QPYX_arg2_YXQP;
				bool QPYX_o_YXQP = UnityEngine.Physics.SphereCast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, out QPYX_arg2_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg2_YXQP);
				return 2;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<UnityEngine.Vector3, float, UnityEngine.Vector3, LuaInterface.LuaOut<UnityEngine.RaycastHit>>(L_YXQP, 1))
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg2_YXQP = ToLua.ToVector3(L_YXQP, 3);
				UnityEngine.RaycastHit QPYX_arg3_YXQP;
				bool QPYX_o_YXQP = UnityEngine.Physics.SphereCast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, out QPYX_arg3_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg3_YXQP);
				return 2;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<UnityEngine.Ray, float, float, int>(L_YXQP, 1))
			{
				UnityEngine.Ray QPYX_arg0_YXQP = ToLua.ToRay(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				int QPYX_arg3_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				bool QPYX_o_YXQP = UnityEngine.Physics.SphereCast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<UnityEngine.Ray, float, LuaInterface.LuaOut<UnityEngine.RaycastHit>, float>(L_YXQP, 1))
			{
				UnityEngine.Ray QPYX_arg0_YXQP = ToLua.ToRay(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 2);
				UnityEngine.RaycastHit QPYX_arg2_YXQP;
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 4);
				bool QPYX_o_YXQP = UnityEngine.Physics.SphereCast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, out QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg2_YXQP);
				return 2;
			}
			else if (QPYX_count_YXQP == 5 && TypeChecker.CheckTypes<UnityEngine.Ray, float, LuaInterface.LuaOut<UnityEngine.RaycastHit>, float, int>(L_YXQP, 1))
			{
				UnityEngine.Ray QPYX_arg0_YXQP = ToLua.ToRay(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 2);
				UnityEngine.RaycastHit QPYX_arg2_YXQP;
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 4);
				int QPYX_arg4_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 5);
				bool QPYX_o_YXQP = UnityEngine.Physics.SphereCast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, out QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg2_YXQP);
				return 2;
			}
			else if (QPYX_count_YXQP == 5 && TypeChecker.CheckTypes<UnityEngine.Ray, float, float, int, UnityEngine.QueryTriggerInteraction>(L_YXQP, 1))
			{
				UnityEngine.Ray QPYX_arg0_YXQP = ToLua.ToRay(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				int QPYX_arg3_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				UnityEngine.QueryTriggerInteraction QPYX_arg4_YXQP = (UnityEngine.QueryTriggerInteraction)ToLua.ToObject(L_YXQP, 5);
				bool QPYX_o_YXQP = UnityEngine.Physics.SphereCast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5 && TypeChecker.CheckTypes<UnityEngine.Vector3, float, UnityEngine.Vector3, LuaInterface.LuaOut<UnityEngine.RaycastHit>, float>(L_YXQP, 1))
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg2_YXQP = ToLua.ToVector3(L_YXQP, 3);
				UnityEngine.RaycastHit QPYX_arg3_YXQP;
				float QPYX_arg4_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 5);
				bool QPYX_o_YXQP = UnityEngine.Physics.SphereCast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, out QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg3_YXQP);
				return 2;
			}
			else if (QPYX_count_YXQP == 6 && TypeChecker.CheckTypes<UnityEngine.Vector3, float, UnityEngine.Vector3, LuaInterface.LuaOut<UnityEngine.RaycastHit>, float, int>(L_YXQP, 1))
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg2_YXQP = ToLua.ToVector3(L_YXQP, 3);
				UnityEngine.RaycastHit QPYX_arg3_YXQP;
				float QPYX_arg4_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 5);
				int QPYX_arg5_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 6);
				bool QPYX_o_YXQP = UnityEngine.Physics.SphereCast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, out QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg3_YXQP);
				return 2;
			}
			else if (QPYX_count_YXQP == 6 && TypeChecker.CheckTypes<UnityEngine.Ray, float, LuaInterface.LuaOut<UnityEngine.RaycastHit>, float, int, UnityEngine.QueryTriggerInteraction>(L_YXQP, 1))
			{
				UnityEngine.Ray QPYX_arg0_YXQP = ToLua.ToRay(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 2);
				UnityEngine.RaycastHit QPYX_arg2_YXQP;
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 4);
				int QPYX_arg4_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 5);
				UnityEngine.QueryTriggerInteraction QPYX_arg5_YXQP = (UnityEngine.QueryTriggerInteraction)ToLua.ToObject(L_YXQP, 6);
				bool QPYX_o_YXQP = UnityEngine.Physics.SphereCast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, out QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg2_YXQP);
				return 2;
			}
			else if (QPYX_count_YXQP == 7)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg2_YXQP = ToLua.ToVector3(L_YXQP, 3);
				UnityEngine.RaycastHit QPYX_arg3_YXQP;
				float QPYX_arg4_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 5);
				int QPYX_arg5_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 6);
				UnityEngine.QueryTriggerInteraction QPYX_arg6_YXQP = (UnityEngine.QueryTriggerInteraction)ToLua.CheckObject(L_YXQP, 7, typeof(UnityEngine.QueryTriggerInteraction));
				bool QPYX_o_YXQP = UnityEngine.Physics.SphereCast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, out QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP, QPYX_arg6_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg3_YXQP);
				return 2;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Physics.SphereCast");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CapsuleCastAll_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.Vector3 QPYX_arg3_YXQP = ToLua.ToVector3(L_YXQP, 4);
				UnityEngine.RaycastHit[] QPYX_o_YXQP = UnityEngine.Physics.CapsuleCastAll(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.Vector3 QPYX_arg3_YXQP = ToLua.ToVector3(L_YXQP, 4);
				float QPYX_arg4_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 5);
				UnityEngine.RaycastHit[] QPYX_o_YXQP = UnityEngine.Physics.CapsuleCastAll(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 6)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.Vector3 QPYX_arg3_YXQP = ToLua.ToVector3(L_YXQP, 4);
				float QPYX_arg4_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 5);
				int QPYX_arg5_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 6);
				UnityEngine.RaycastHit[] QPYX_o_YXQP = UnityEngine.Physics.CapsuleCastAll(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 7)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.Vector3 QPYX_arg3_YXQP = ToLua.ToVector3(L_YXQP, 4);
				float QPYX_arg4_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 5);
				int QPYX_arg5_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 6);
				UnityEngine.QueryTriggerInteraction QPYX_arg6_YXQP = (UnityEngine.QueryTriggerInteraction)ToLua.CheckObject(L_YXQP, 7, typeof(UnityEngine.QueryTriggerInteraction));
				UnityEngine.RaycastHit[] QPYX_o_YXQP = UnityEngine.Physics.CapsuleCastAll(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP, QPYX_arg6_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Physics.CapsuleCastAll");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CapsuleCastNonAlloc_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 5)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.Vector3 QPYX_arg3_YXQP = ToLua.ToVector3(L_YXQP, 4);
				UnityEngine.RaycastHit[] QPYX_arg4_YXQP = ToLua.CheckStructArray<UnityEngine.RaycastHit>(L_YXQP, 5);
				int QPYX_o_YXQP = UnityEngine.Physics.CapsuleCastNonAlloc(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 6)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.Vector3 QPYX_arg3_YXQP = ToLua.ToVector3(L_YXQP, 4);
				UnityEngine.RaycastHit[] QPYX_arg4_YXQP = ToLua.CheckStructArray<UnityEngine.RaycastHit>(L_YXQP, 5);
				float QPYX_arg5_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 6);
				int QPYX_o_YXQP = UnityEngine.Physics.CapsuleCastNonAlloc(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 7)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.Vector3 QPYX_arg3_YXQP = ToLua.ToVector3(L_YXQP, 4);
				UnityEngine.RaycastHit[] QPYX_arg4_YXQP = ToLua.CheckStructArray<UnityEngine.RaycastHit>(L_YXQP, 5);
				float QPYX_arg5_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 6);
				int QPYX_arg6_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 7);
				int QPYX_o_YXQP = UnityEngine.Physics.CapsuleCastNonAlloc(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP, QPYX_arg6_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 8)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.Vector3 QPYX_arg3_YXQP = ToLua.ToVector3(L_YXQP, 4);
				UnityEngine.RaycastHit[] QPYX_arg4_YXQP = ToLua.CheckStructArray<UnityEngine.RaycastHit>(L_YXQP, 5);
				float QPYX_arg5_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 6);
				int QPYX_arg6_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 7);
				UnityEngine.QueryTriggerInteraction QPYX_arg7_YXQP = (UnityEngine.QueryTriggerInteraction)ToLua.CheckObject(L_YXQP, 8, typeof(UnityEngine.QueryTriggerInteraction));
				int QPYX_o_YXQP = UnityEngine.Physics.CapsuleCastNonAlloc(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP, QPYX_arg6_YXQP, QPYX_arg7_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Physics.CapsuleCastNonAlloc");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SphereCastAll_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Ray QPYX_arg0_YXQP = ToLua.ToRay(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.RaycastHit[] QPYX_o_YXQP = UnityEngine.Physics.SphereCastAll(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<UnityEngine.Ray, float, float>(L_YXQP, 1))
			{
				UnityEngine.Ray QPYX_arg0_YXQP = ToLua.ToRay(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				UnityEngine.RaycastHit[] QPYX_o_YXQP = UnityEngine.Physics.SphereCastAll(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<UnityEngine.Vector3, float, UnityEngine.Vector3>(L_YXQP, 1))
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg2_YXQP = ToLua.ToVector3(L_YXQP, 3);
				UnityEngine.RaycastHit[] QPYX_o_YXQP = UnityEngine.Physics.SphereCastAll(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<UnityEngine.Ray, float, float, int>(L_YXQP, 1))
			{
				UnityEngine.Ray QPYX_arg0_YXQP = ToLua.ToRay(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				int QPYX_arg3_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				UnityEngine.RaycastHit[] QPYX_o_YXQP = UnityEngine.Physics.SphereCastAll(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<UnityEngine.Vector3, float, UnityEngine.Vector3, float>(L_YXQP, 1))
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg2_YXQP = ToLua.ToVector3(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 4);
				UnityEngine.RaycastHit[] QPYX_o_YXQP = UnityEngine.Physics.SphereCastAll(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5 && TypeChecker.CheckTypes<UnityEngine.Vector3, float, UnityEngine.Vector3, float, int>(L_YXQP, 1))
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg2_YXQP = ToLua.ToVector3(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 4);
				int QPYX_arg4_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 5);
				UnityEngine.RaycastHit[] QPYX_o_YXQP = UnityEngine.Physics.SphereCastAll(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5 && TypeChecker.CheckTypes<UnityEngine.Ray, float, float, int, UnityEngine.QueryTriggerInteraction>(L_YXQP, 1))
			{
				UnityEngine.Ray QPYX_arg0_YXQP = ToLua.ToRay(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				int QPYX_arg3_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				UnityEngine.QueryTriggerInteraction QPYX_arg4_YXQP = (UnityEngine.QueryTriggerInteraction)ToLua.ToObject(L_YXQP, 5);
				UnityEngine.RaycastHit[] QPYX_o_YXQP = UnityEngine.Physics.SphereCastAll(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 6)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg2_YXQP = ToLua.ToVector3(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
				int QPYX_arg4_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 5);
				UnityEngine.QueryTriggerInteraction QPYX_arg5_YXQP = (UnityEngine.QueryTriggerInteraction)ToLua.CheckObject(L_YXQP, 6, typeof(UnityEngine.QueryTriggerInteraction));
				UnityEngine.RaycastHit[] QPYX_o_YXQP = UnityEngine.Physics.SphereCastAll(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Physics.SphereCastAll");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SphereCastNonAlloc_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Ray QPYX_arg0_YXQP = ToLua.ToRay(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.RaycastHit[] QPYX_arg2_YXQP = ToLua.CheckStructArray<UnityEngine.RaycastHit>(L_YXQP, 3);
				int QPYX_o_YXQP = UnityEngine.Physics.SphereCastNonAlloc(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<UnityEngine.Ray, float, UnityEngine.RaycastHit[], float>(L_YXQP, 1))
			{
				UnityEngine.Ray QPYX_arg0_YXQP = ToLua.ToRay(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 2);
				UnityEngine.RaycastHit[] QPYX_arg2_YXQP = ToLua.ToStructArray<UnityEngine.RaycastHit>(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 4);
				int QPYX_o_YXQP = UnityEngine.Physics.SphereCastNonAlloc(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<UnityEngine.Vector3, float, UnityEngine.Vector3, UnityEngine.RaycastHit[]>(L_YXQP, 1))
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg2_YXQP = ToLua.ToVector3(L_YXQP, 3);
				UnityEngine.RaycastHit[] QPYX_arg3_YXQP = ToLua.ToStructArray<UnityEngine.RaycastHit>(L_YXQP, 4);
				int QPYX_o_YXQP = UnityEngine.Physics.SphereCastNonAlloc(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5 && TypeChecker.CheckTypes<UnityEngine.Ray, float, UnityEngine.RaycastHit[], float, int>(L_YXQP, 1))
			{
				UnityEngine.Ray QPYX_arg0_YXQP = ToLua.ToRay(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 2);
				UnityEngine.RaycastHit[] QPYX_arg2_YXQP = ToLua.ToStructArray<UnityEngine.RaycastHit>(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 4);
				int QPYX_arg4_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 5);
				int QPYX_o_YXQP = UnityEngine.Physics.SphereCastNonAlloc(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5 && TypeChecker.CheckTypes<UnityEngine.Vector3, float, UnityEngine.Vector3, UnityEngine.RaycastHit[], float>(L_YXQP, 1))
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg2_YXQP = ToLua.ToVector3(L_YXQP, 3);
				UnityEngine.RaycastHit[] QPYX_arg3_YXQP = ToLua.ToStructArray<UnityEngine.RaycastHit>(L_YXQP, 4);
				float QPYX_arg4_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 5);
				int QPYX_o_YXQP = UnityEngine.Physics.SphereCastNonAlloc(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 6 && TypeChecker.CheckTypes<UnityEngine.Vector3, float, UnityEngine.Vector3, UnityEngine.RaycastHit[], float, int>(L_YXQP, 1))
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg2_YXQP = ToLua.ToVector3(L_YXQP, 3);
				UnityEngine.RaycastHit[] QPYX_arg3_YXQP = ToLua.ToStructArray<UnityEngine.RaycastHit>(L_YXQP, 4);
				float QPYX_arg4_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 5);
				int QPYX_arg5_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 6);
				int QPYX_o_YXQP = UnityEngine.Physics.SphereCastNonAlloc(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 6 && TypeChecker.CheckTypes<UnityEngine.Ray, float, UnityEngine.RaycastHit[], float, int, UnityEngine.QueryTriggerInteraction>(L_YXQP, 1))
			{
				UnityEngine.Ray QPYX_arg0_YXQP = ToLua.ToRay(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 2);
				UnityEngine.RaycastHit[] QPYX_arg2_YXQP = ToLua.ToStructArray<UnityEngine.RaycastHit>(L_YXQP, 3);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 4);
				int QPYX_arg4_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 5);
				UnityEngine.QueryTriggerInteraction QPYX_arg5_YXQP = (UnityEngine.QueryTriggerInteraction)ToLua.ToObject(L_YXQP, 6);
				int QPYX_o_YXQP = UnityEngine.Physics.SphereCastNonAlloc(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 7)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg2_YXQP = ToLua.ToVector3(L_YXQP, 3);
				UnityEngine.RaycastHit[] QPYX_arg3_YXQP = ToLua.CheckStructArray<UnityEngine.RaycastHit>(L_YXQP, 4);
				float QPYX_arg4_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 5);
				int QPYX_arg5_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 6);
				UnityEngine.QueryTriggerInteraction QPYX_arg6_YXQP = (UnityEngine.QueryTriggerInteraction)ToLua.CheckObject(L_YXQP, 7, typeof(UnityEngine.QueryTriggerInteraction));
				int QPYX_o_YXQP = UnityEngine.Physics.SphereCastNonAlloc(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP, QPYX_arg6_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Physics.SphereCastNonAlloc");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CheckSphere_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				bool QPYX_o_YXQP = UnityEngine.Physics.CheckSphere(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				bool QPYX_o_YXQP = UnityEngine.Physics.CheckSphere(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.QueryTriggerInteraction QPYX_arg3_YXQP = (UnityEngine.QueryTriggerInteraction)ToLua.CheckObject(L_YXQP, 4, typeof(UnityEngine.QueryTriggerInteraction));
				bool QPYX_o_YXQP = UnityEngine.Physics.CheckSphere(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Physics.CheckSphere");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CheckCapsule_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				bool QPYX_o_YXQP = UnityEngine.Physics.CheckCapsule(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				int QPYX_arg3_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				bool QPYX_o_YXQP = UnityEngine.Physics.CheckCapsule(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				int QPYX_arg3_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				UnityEngine.QueryTriggerInteraction QPYX_arg4_YXQP = (UnityEngine.QueryTriggerInteraction)ToLua.CheckObject(L_YXQP, 5, typeof(UnityEngine.QueryTriggerInteraction));
				bool QPYX_o_YXQP = UnityEngine.Physics.CheckCapsule(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Physics.CheckCapsule");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CheckBox_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				bool QPYX_o_YXQP = UnityEngine.Physics.CheckBox(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Quaternion QPYX_arg2_YXQP = ToLua.ToQuaternion(L_YXQP, 3);
				bool QPYX_o_YXQP = UnityEngine.Physics.CheckBox(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Quaternion QPYX_arg2_YXQP = ToLua.ToQuaternion(L_YXQP, 3);
				int QPYX_arg3_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				bool QPYX_o_YXQP = UnityEngine.Physics.CheckBox(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Quaternion QPYX_arg2_YXQP = ToLua.ToQuaternion(L_YXQP, 3);
				int QPYX_arg3_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				UnityEngine.QueryTriggerInteraction QPYX_arg4_YXQP = (UnityEngine.QueryTriggerInteraction)ToLua.CheckObject(L_YXQP, 5, typeof(UnityEngine.QueryTriggerInteraction));
				bool QPYX_o_YXQP = UnityEngine.Physics.CheckBox(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Physics.CheckBox");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OverlapBox_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Collider[] QPYX_o_YXQP = UnityEngine.Physics.OverlapBox(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Quaternion QPYX_arg2_YXQP = ToLua.ToQuaternion(L_YXQP, 3);
				UnityEngine.Collider[] QPYX_o_YXQP = UnityEngine.Physics.OverlapBox(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Quaternion QPYX_arg2_YXQP = ToLua.ToQuaternion(L_YXQP, 3);
				int QPYX_arg3_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				UnityEngine.Collider[] QPYX_o_YXQP = UnityEngine.Physics.OverlapBox(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Quaternion QPYX_arg2_YXQP = ToLua.ToQuaternion(L_YXQP, 3);
				int QPYX_arg3_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				UnityEngine.QueryTriggerInteraction QPYX_arg4_YXQP = (UnityEngine.QueryTriggerInteraction)ToLua.CheckObject(L_YXQP, 5, typeof(UnityEngine.QueryTriggerInteraction));
				UnityEngine.Collider[] QPYX_o_YXQP = UnityEngine.Physics.OverlapBox(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Physics.OverlapBox");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_OverlapBoxNonAlloc_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Collider[] QPYX_arg2_YXQP = ToLua.CheckObjectArray<UnityEngine.Collider>(L_YXQP, 3);
				int QPYX_o_YXQP = UnityEngine.Physics.OverlapBoxNonAlloc(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Collider[] QPYX_arg2_YXQP = ToLua.CheckObjectArray<UnityEngine.Collider>(L_YXQP, 3);
				UnityEngine.Quaternion QPYX_arg3_YXQP = ToLua.ToQuaternion(L_YXQP, 4);
				int QPYX_o_YXQP = UnityEngine.Physics.OverlapBoxNonAlloc(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Collider[] QPYX_arg2_YXQP = ToLua.CheckObjectArray<UnityEngine.Collider>(L_YXQP, 3);
				UnityEngine.Quaternion QPYX_arg3_YXQP = ToLua.ToQuaternion(L_YXQP, 4);
				int QPYX_arg4_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 5);
				int QPYX_o_YXQP = UnityEngine.Physics.OverlapBoxNonAlloc(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 6)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Collider[] QPYX_arg2_YXQP = ToLua.CheckObjectArray<UnityEngine.Collider>(L_YXQP, 3);
				UnityEngine.Quaternion QPYX_arg3_YXQP = ToLua.ToQuaternion(L_YXQP, 4);
				int QPYX_arg4_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 5);
				UnityEngine.QueryTriggerInteraction QPYX_arg5_YXQP = (UnityEngine.QueryTriggerInteraction)ToLua.CheckObject(L_YXQP, 6, typeof(UnityEngine.QueryTriggerInteraction));
				int QPYX_o_YXQP = UnityEngine.Physics.OverlapBoxNonAlloc(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Physics.OverlapBoxNonAlloc");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_BoxCastAll_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg2_YXQP = ToLua.ToVector3(L_YXQP, 3);
				UnityEngine.RaycastHit[] QPYX_o_YXQP = UnityEngine.Physics.BoxCastAll(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg2_YXQP = ToLua.ToVector3(L_YXQP, 3);
				UnityEngine.Quaternion QPYX_arg3_YXQP = ToLua.ToQuaternion(L_YXQP, 4);
				UnityEngine.RaycastHit[] QPYX_o_YXQP = UnityEngine.Physics.BoxCastAll(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg2_YXQP = ToLua.ToVector3(L_YXQP, 3);
				UnityEngine.Quaternion QPYX_arg3_YXQP = ToLua.ToQuaternion(L_YXQP, 4);
				float QPYX_arg4_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 5);
				UnityEngine.RaycastHit[] QPYX_o_YXQP = UnityEngine.Physics.BoxCastAll(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 6)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg2_YXQP = ToLua.ToVector3(L_YXQP, 3);
				UnityEngine.Quaternion QPYX_arg3_YXQP = ToLua.ToQuaternion(L_YXQP, 4);
				float QPYX_arg4_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 5);
				int QPYX_arg5_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 6);
				UnityEngine.RaycastHit[] QPYX_o_YXQP = UnityEngine.Physics.BoxCastAll(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 7)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg2_YXQP = ToLua.ToVector3(L_YXQP, 3);
				UnityEngine.Quaternion QPYX_arg3_YXQP = ToLua.ToQuaternion(L_YXQP, 4);
				float QPYX_arg4_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 5);
				int QPYX_arg5_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 6);
				UnityEngine.QueryTriggerInteraction QPYX_arg6_YXQP = (UnityEngine.QueryTriggerInteraction)ToLua.CheckObject(L_YXQP, 7, typeof(UnityEngine.QueryTriggerInteraction));
				UnityEngine.RaycastHit[] QPYX_o_YXQP = UnityEngine.Physics.BoxCastAll(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP, QPYX_arg6_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Physics.BoxCastAll");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_BoxCastNonAlloc_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg2_YXQP = ToLua.ToVector3(L_YXQP, 3);
				UnityEngine.RaycastHit[] QPYX_arg3_YXQP = ToLua.CheckStructArray<UnityEngine.RaycastHit>(L_YXQP, 4);
				int QPYX_o_YXQP = UnityEngine.Physics.BoxCastNonAlloc(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg2_YXQP = ToLua.ToVector3(L_YXQP, 3);
				UnityEngine.RaycastHit[] QPYX_arg3_YXQP = ToLua.CheckStructArray<UnityEngine.RaycastHit>(L_YXQP, 4);
				UnityEngine.Quaternion QPYX_arg4_YXQP = ToLua.ToQuaternion(L_YXQP, 5);
				int QPYX_o_YXQP = UnityEngine.Physics.BoxCastNonAlloc(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 6)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg2_YXQP = ToLua.ToVector3(L_YXQP, 3);
				UnityEngine.RaycastHit[] QPYX_arg3_YXQP = ToLua.CheckStructArray<UnityEngine.RaycastHit>(L_YXQP, 4);
				UnityEngine.Quaternion QPYX_arg4_YXQP = ToLua.ToQuaternion(L_YXQP, 5);
				float QPYX_arg5_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 6);
				int QPYX_o_YXQP = UnityEngine.Physics.BoxCastNonAlloc(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 7)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg2_YXQP = ToLua.ToVector3(L_YXQP, 3);
				UnityEngine.RaycastHit[] QPYX_arg3_YXQP = ToLua.CheckStructArray<UnityEngine.RaycastHit>(L_YXQP, 4);
				UnityEngine.Quaternion QPYX_arg4_YXQP = ToLua.ToQuaternion(L_YXQP, 5);
				float QPYX_arg5_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 6);
				int QPYX_arg6_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 7);
				int QPYX_o_YXQP = UnityEngine.Physics.BoxCastNonAlloc(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP, QPYX_arg6_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 8)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg2_YXQP = ToLua.ToVector3(L_YXQP, 3);
				UnityEngine.RaycastHit[] QPYX_arg3_YXQP = ToLua.CheckStructArray<UnityEngine.RaycastHit>(L_YXQP, 4);
				UnityEngine.Quaternion QPYX_arg4_YXQP = ToLua.ToQuaternion(L_YXQP, 5);
				float QPYX_arg5_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 6);
				int QPYX_arg6_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 7);
				UnityEngine.QueryTriggerInteraction QPYX_arg7_YXQP = (UnityEngine.QueryTriggerInteraction)ToLua.CheckObject(L_YXQP, 8, typeof(UnityEngine.QueryTriggerInteraction));
				int QPYX_o_YXQP = UnityEngine.Physics.BoxCastNonAlloc(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP, QPYX_arg6_YXQP, QPYX_arg7_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Physics.BoxCastNonAlloc");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_BoxCast_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg2_YXQP = ToLua.ToVector3(L_YXQP, 3);
				bool QPYX_o_YXQP = UnityEngine.Physics.BoxCast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<LuaInterface.LuaOut<UnityEngine.RaycastHit>>(L_YXQP, 4))
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg2_YXQP = ToLua.ToVector3(L_YXQP, 3);
				UnityEngine.RaycastHit QPYX_arg3_YXQP;
				bool QPYX_o_YXQP = UnityEngine.Physics.BoxCast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, out QPYX_arg3_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg3_YXQP);
				return 2;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<UnityEngine.Quaternion>(L_YXQP, 4))
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg2_YXQP = ToLua.ToVector3(L_YXQP, 3);
				UnityEngine.Quaternion QPYX_arg3_YXQP = ToLua.ToQuaternion(L_YXQP, 4);
				bool QPYX_o_YXQP = UnityEngine.Physics.BoxCast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5 && TypeChecker.CheckTypes<UnityEngine.Quaternion, float>(L_YXQP, 4))
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg2_YXQP = ToLua.ToVector3(L_YXQP, 3);
				UnityEngine.Quaternion QPYX_arg3_YXQP = ToLua.ToQuaternion(L_YXQP, 4);
				float QPYX_arg4_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 5);
				bool QPYX_o_YXQP = UnityEngine.Physics.BoxCast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5 && TypeChecker.CheckTypes<LuaInterface.LuaOut<UnityEngine.RaycastHit>, UnityEngine.Quaternion>(L_YXQP, 4))
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg2_YXQP = ToLua.ToVector3(L_YXQP, 3);
				UnityEngine.RaycastHit QPYX_arg3_YXQP;
				UnityEngine.Quaternion QPYX_arg4_YXQP = ToLua.ToQuaternion(L_YXQP, 5);
				bool QPYX_o_YXQP = UnityEngine.Physics.BoxCast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, out QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg3_YXQP);
				return 2;
			}
			else if (QPYX_count_YXQP == 6 && TypeChecker.CheckTypes<LuaInterface.LuaOut<UnityEngine.RaycastHit>, UnityEngine.Quaternion, float>(L_YXQP, 4))
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg2_YXQP = ToLua.ToVector3(L_YXQP, 3);
				UnityEngine.RaycastHit QPYX_arg3_YXQP;
				UnityEngine.Quaternion QPYX_arg4_YXQP = ToLua.ToQuaternion(L_YXQP, 5);
				float QPYX_arg5_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 6);
				bool QPYX_o_YXQP = UnityEngine.Physics.BoxCast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, out QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg3_YXQP);
				return 2;
			}
			else if (QPYX_count_YXQP == 6 && TypeChecker.CheckTypes<UnityEngine.Quaternion, float, int>(L_YXQP, 4))
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg2_YXQP = ToLua.ToVector3(L_YXQP, 3);
				UnityEngine.Quaternion QPYX_arg3_YXQP = ToLua.ToQuaternion(L_YXQP, 4);
				float QPYX_arg4_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 5);
				int QPYX_arg5_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 6);
				bool QPYX_o_YXQP = UnityEngine.Physics.BoxCast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 7 && TypeChecker.CheckTypes<UnityEngine.Quaternion, float, int, UnityEngine.QueryTriggerInteraction>(L_YXQP, 4))
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg2_YXQP = ToLua.ToVector3(L_YXQP, 3);
				UnityEngine.Quaternion QPYX_arg3_YXQP = ToLua.ToQuaternion(L_YXQP, 4);
				float QPYX_arg4_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 5);
				int QPYX_arg5_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 6);
				UnityEngine.QueryTriggerInteraction QPYX_arg6_YXQP = (UnityEngine.QueryTriggerInteraction)ToLua.ToObject(L_YXQP, 7);
				bool QPYX_o_YXQP = UnityEngine.Physics.BoxCast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP, QPYX_arg6_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 7 && TypeChecker.CheckTypes<LuaInterface.LuaOut<UnityEngine.RaycastHit>, UnityEngine.Quaternion, float, int>(L_YXQP, 4))
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg2_YXQP = ToLua.ToVector3(L_YXQP, 3);
				UnityEngine.RaycastHit QPYX_arg3_YXQP;
				UnityEngine.Quaternion QPYX_arg4_YXQP = ToLua.ToQuaternion(L_YXQP, 5);
				float QPYX_arg5_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 6);
				int QPYX_arg6_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 7);
				bool QPYX_o_YXQP = UnityEngine.Physics.BoxCast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, out QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP, QPYX_arg6_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg3_YXQP);
				return 2;
			}
			else if (QPYX_count_YXQP == 8)
			{
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg2_YXQP = ToLua.ToVector3(L_YXQP, 3);
				UnityEngine.RaycastHit QPYX_arg3_YXQP;
				UnityEngine.Quaternion QPYX_arg4_YXQP = ToLua.ToQuaternion(L_YXQP, 5);
				float QPYX_arg5_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 6);
				int QPYX_arg6_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 7);
				UnityEngine.QueryTriggerInteraction QPYX_arg7_YXQP = (UnityEngine.QueryTriggerInteraction)ToLua.CheckObject(L_YXQP, 8, typeof(UnityEngine.QueryTriggerInteraction));
				bool QPYX_o_YXQP = UnityEngine.Physics.BoxCast(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, out QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP, QPYX_arg6_YXQP, QPYX_arg7_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg3_YXQP);
				return 2;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Physics.BoxCast");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IgnoreCollision_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Collider QPYX_arg0_YXQP = (UnityEngine.Collider)ToLua.CheckObject<UnityEngine.Collider>(L_YXQP, 1);
				UnityEngine.Collider QPYX_arg1_YXQP = (UnityEngine.Collider)ToLua.CheckObject<UnityEngine.Collider>(L_YXQP, 2);
				UnityEngine.Physics.IgnoreCollision(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Collider QPYX_arg0_YXQP = (UnityEngine.Collider)ToLua.CheckObject<UnityEngine.Collider>(L_YXQP, 1);
				UnityEngine.Collider QPYX_arg1_YXQP = (UnityEngine.Collider)ToLua.CheckObject<UnityEngine.Collider>(L_YXQP, 2);
				bool QPYX_arg2_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				UnityEngine.Physics.IgnoreCollision(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Physics.IgnoreCollision");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IgnoreLayerCollision_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 1);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.Physics.IgnoreLayerCollision(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3)
			{
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 1);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				bool QPYX_arg2_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				UnityEngine.Physics.IgnoreLayerCollision(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Physics.IgnoreLayerCollision");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetIgnoreLayerCollision_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 1);
			int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			bool QPYX_o_YXQP = UnityEngine.Physics.GetIgnoreLayerCollision(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ComputePenetration_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 8);
			UnityEngine.Collider QPYX_arg0_YXQP = (UnityEngine.Collider)ToLua.CheckObject<UnityEngine.Collider>(L_YXQP, 1);
			UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 2);
			UnityEngine.Quaternion QPYX_arg2_YXQP = ToLua.ToQuaternion(L_YXQP, 3);
			UnityEngine.Collider QPYX_arg3_YXQP = (UnityEngine.Collider)ToLua.CheckObject<UnityEngine.Collider>(L_YXQP, 4);
			UnityEngine.Vector3 QPYX_arg4_YXQP = ToLua.ToVector3(L_YXQP, 5);
			UnityEngine.Quaternion QPYX_arg5_YXQP = ToLua.ToQuaternion(L_YXQP, 6);
			UnityEngine.Vector3 QPYX_arg6_YXQP;
			float QPYX_arg7_YXQP;
			bool QPYX_o_YXQP = UnityEngine.Physics.ComputePenetration(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP, out QPYX_arg6_YXQP, out QPYX_arg7_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			ToLua.Push(L_YXQP, QPYX_arg6_YXQP);
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_arg7_YXQP);
			return 3;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ClosestPoint_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 1);
			UnityEngine.Collider QPYX_arg1_YXQP = (UnityEngine.Collider)ToLua.CheckObject<UnityEngine.Collider>(L_YXQP, 2);
			UnityEngine.Vector3 QPYX_arg2_YXQP = ToLua.ToVector3(L_YXQP, 3);
			UnityEngine.Quaternion QPYX_arg3_YXQP = ToLua.ToQuaternion(L_YXQP, 4);
			UnityEngine.Vector3 QPYX_o_YXQP = UnityEngine.Physics.ClosestPoint(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Simulate_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 1);
			UnityEngine.Physics.Simulate(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SyncTransforms_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 0);
			UnityEngine.Physics.SyncTransforms();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_RebuildBroadphaseRegions_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Bounds QPYX_arg0_YXQP = ToLua.ToBounds(L_YXQP, 1);
			int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.Physics.RebuildBroadphaseRegions(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_gravity_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.Physics.gravity);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_defaultContactOffset_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushnumber(L_YXQP, UnityEngine.Physics.defaultContactOffset);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_bounceThreshold_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushnumber(L_YXQP, UnityEngine.Physics.bounceThreshold);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_defaultSolverIterations_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushinteger(L_YXQP,UnityEngine.Physics.defaultSolverIterations);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_defaultSolverVelocityIterations_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushinteger(L_YXQP,UnityEngine.Physics.defaultSolverVelocityIterations);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_sleepThreshold_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushnumber(L_YXQP, UnityEngine.Physics.sleepThreshold);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_queriesHitTriggers_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushboolean(L_YXQP, UnityEngine.Physics.queriesHitTriggers);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_queriesHitBackfaces_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushboolean(L_YXQP, UnityEngine.Physics.queriesHitBackfaces);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_interCollisionDistance_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushnumber(L_YXQP, UnityEngine.Physics.interCollisionDistance);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_interCollisionStiffness_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushnumber(L_YXQP, UnityEngine.Physics.interCollisionStiffness);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_interCollisionSettingsToggle_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushboolean(L_YXQP, UnityEngine.Physics.interCollisionSettingsToggle);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_autoSimulation_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushboolean(L_YXQP, UnityEngine.Physics.autoSimulation);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_autoSyncTransforms_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushboolean(L_YXQP, UnityEngine.Physics.autoSyncTransforms);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_gravity_YXQP(IntPtr L_YXQP)
	{
		try
		{
			UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
			UnityEngine.Physics.gravity = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_defaultContactOffset_YXQP(IntPtr L_YXQP)
	{
		try
		{
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.Physics.defaultContactOffset = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_bounceThreshold_YXQP(IntPtr L_YXQP)
	{
		try
		{
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.Physics.bounceThreshold = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_defaultSolverIterations_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.Physics.defaultSolverIterations = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_defaultSolverVelocityIterations_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.Physics.defaultSolverVelocityIterations = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_sleepThreshold_YXQP(IntPtr L_YXQP)
	{
		try
		{
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.Physics.sleepThreshold = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_queriesHitTriggers_YXQP(IntPtr L_YXQP)
	{
		try
		{
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			UnityEngine.Physics.queriesHitTriggers = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_queriesHitBackfaces_YXQP(IntPtr L_YXQP)
	{
		try
		{
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			UnityEngine.Physics.queriesHitBackfaces = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_interCollisionDistance_YXQP(IntPtr L_YXQP)
	{
		try
		{
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.Physics.interCollisionDistance = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_interCollisionStiffness_YXQP(IntPtr L_YXQP)
	{
		try
		{
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.Physics.interCollisionStiffness = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_interCollisionSettingsToggle_YXQP(IntPtr L_YXQP)
	{
		try
		{
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			UnityEngine.Physics.interCollisionSettingsToggle = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_autoSimulation_YXQP(IntPtr L_YXQP)
	{
		try
		{
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			UnityEngine.Physics.autoSimulation = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_autoSyncTransforms_YXQP(IntPtr L_YXQP)
	{
		try
		{
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			UnityEngine.Physics.autoSyncTransforms = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}
}

