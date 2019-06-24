using System;
using LuaInterface;

public class QPYX_UnityEngine_AnimatorWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.Animator), typeof(UnityEngine.Behaviour));
		L_YXQP.RegFunction("GetFloat", QPYX_GetFloat_YXQP);
		L_YXQP.RegFunction("SetFloat", QPYX_SetFloat_YXQP);
		L_YXQP.RegFunction("GetBool", QPYX_GetBool_YXQP);
		L_YXQP.RegFunction("SetBool", QPYX_SetBool_YXQP);
		L_YXQP.RegFunction("GetInteger", QPYX_GetInteger_YXQP);
		L_YXQP.RegFunction("SetInteger", QPYX_SetInteger_YXQP);
		L_YXQP.RegFunction("SetTrigger", QPYX_SetTrigger_YXQP);
		L_YXQP.RegFunction("ResetTrigger", QPYX_ResetTrigger_YXQP);
		L_YXQP.RegFunction("IsParameterControlledByCurve", QPYX_IsParameterControlledByCurve_YXQP);
		L_YXQP.RegFunction("GetIKPosition", QPYX_GetIKPosition_YXQP);
		L_YXQP.RegFunction("SetIKPosition", QPYX_SetIKPosition_YXQP);
		L_YXQP.RegFunction("GetIKRotation", QPYX_GetIKRotation_YXQP);
		L_YXQP.RegFunction("SetIKRotation", QPYX_SetIKRotation_YXQP);
		L_YXQP.RegFunction("GetIKPositionWeight", QPYX_GetIKPositionWeight_YXQP);
		L_YXQP.RegFunction("SetIKPositionWeight", QPYX_SetIKPositionWeight_YXQP);
		L_YXQP.RegFunction("GetIKRotationWeight", QPYX_GetIKRotationWeight_YXQP);
		L_YXQP.RegFunction("SetIKRotationWeight", QPYX_SetIKRotationWeight_YXQP);
		L_YXQP.RegFunction("GetIKHintPosition", QPYX_GetIKHintPosition_YXQP);
		L_YXQP.RegFunction("SetIKHintPosition", QPYX_SetIKHintPosition_YXQP);
		L_YXQP.RegFunction("GetIKHintPositionWeight", QPYX_GetIKHintPositionWeight_YXQP);
		L_YXQP.RegFunction("SetIKHintPositionWeight", QPYX_SetIKHintPositionWeight_YXQP);
		L_YXQP.RegFunction("SetLookAtPosition", QPYX_SetLookAtPosition_YXQP);
		L_YXQP.RegFunction("SetLookAtWeight", QPYX_SetLookAtWeight_YXQP);
		L_YXQP.RegFunction("SetBoneLocalRotation", QPYX_SetBoneLocalRotation_YXQP);
		L_YXQP.RegFunction("GetBehaviours", QPYX_GetBehaviours_YXQP);
		L_YXQP.RegFunction("GetLayerName", QPYX_GetLayerName_YXQP);
		L_YXQP.RegFunction("GetLayerIndex", QPYX_GetLayerIndex_YXQP);
		L_YXQP.RegFunction("GetLayerWeight", QPYX_GetLayerWeight_YXQP);
		L_YXQP.RegFunction("SetLayerWeight", QPYX_SetLayerWeight_YXQP);
		L_YXQP.RegFunction("GetCurrentAnimatorStateInfo", QPYX_GetCurrentAnimatorStateInfo_YXQP);
		L_YXQP.RegFunction("GetNextAnimatorStateInfo", QPYX_GetNextAnimatorStateInfo_YXQP);
		L_YXQP.RegFunction("GetAnimatorTransitionInfo", QPYX_GetAnimatorTransitionInfo_YXQP);
		L_YXQP.RegFunction("GetCurrentAnimatorClipInfoCount", QPYX_GetCurrentAnimatorClipInfoCount_YXQP);
		L_YXQP.RegFunction("GetCurrentAnimatorClipInfo", QPYX_GetCurrentAnimatorClipInfo_YXQP);
		L_YXQP.RegFunction("GetNextAnimatorClipInfoCount", QPYX_GetNextAnimatorClipInfoCount_YXQP);
		L_YXQP.RegFunction("GetNextAnimatorClipInfo", QPYX_GetNextAnimatorClipInfo_YXQP);
		L_YXQP.RegFunction("IsInTransition", QPYX_IsInTransition_YXQP);
		L_YXQP.RegFunction("GetParameter", QPYX_GetParameter_YXQP);
		L_YXQP.RegFunction("MatchTarget", QPYX_MatchTarget_YXQP);
		L_YXQP.RegFunction("InterruptMatchTarget", QPYX_InterruptMatchTarget_YXQP);
		L_YXQP.RegFunction("CrossFadeInFixedTime", QPYX_CrossFadeInFixedTime_YXQP);
		L_YXQP.RegFunction("CrossFade", QPYX_CrossFade_YXQP);
		L_YXQP.RegFunction("PlayInFixedTime", QPYX_PlayInFixedTime_YXQP);
		L_YXQP.RegFunction("Play", QPYX_Play_YXQP);
		L_YXQP.RegFunction("SetTarget", QPYX_SetTarget_YXQP);
		L_YXQP.RegFunction("GetBoneTransform", QPYX_GetBoneTransform_YXQP);
		L_YXQP.RegFunction("StartPlayback", QPYX_StartPlayback_YXQP);
		L_YXQP.RegFunction("StopPlayback", QPYX_StopPlayback_YXQP);
		L_YXQP.RegFunction("StartRecording", QPYX_StartRecording_YXQP);
		L_YXQP.RegFunction("StopRecording", QPYX_StopRecording_YXQP);
		L_YXQP.RegFunction("HasState", QPYX_HasState_YXQP);
		L_YXQP.RegFunction("StringToHash", QPYX_StringToHash_YXQP);
		L_YXQP.RegFunction("Update", QPYX_Update_YXQP);
		L_YXQP.RegFunction("Rebind", QPYX_Rebind_YXQP);
		L_YXQP.RegFunction("ApplyBuiltinRootMotion", QPYX_ApplyBuiltinRootMotion_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateUnityEngine_Animator_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("isOptimizable", QPYX_get_isOptimizable_YXQP, null);
		L_YXQP.RegVar("isHuman", QPYX_get_isHuman_YXQP, null);
		L_YXQP.RegVar("hasRootMotion", QPYX_get_hasRootMotion_YXQP, null);
		L_YXQP.RegVar("humanScale", QPYX_get_humanScale_YXQP, null);
		L_YXQP.RegVar("isInitialized", QPYX_get_isInitialized_YXQP, null);
		L_YXQP.RegVar("deltaPosition", QPYX_get_deltaPosition_YXQP, null);
		L_YXQP.RegVar("deltaRotation", QPYX_get_deltaRotation_YXQP, null);
		L_YXQP.RegVar("velocity", QPYX_get_velocity_YXQP, null);
		L_YXQP.RegVar("angularVelocity", QPYX_get_angularVelocity_YXQP, null);
		L_YXQP.RegVar("rootPosition", QPYX_get_rootPosition_YXQP, QPYX_set_rootPosition_YXQP);
		L_YXQP.RegVar("rootRotation", QPYX_get_rootRotation_YXQP, QPYX_set_rootRotation_YXQP);
		L_YXQP.RegVar("applyRootMotion", QPYX_get_applyRootMotion_YXQP, QPYX_set_applyRootMotion_YXQP);
		L_YXQP.RegVar("linearVelocityBlending", QPYX_get_linearVelocityBlending_YXQP, QPYX_set_linearVelocityBlending_YXQP);
		L_YXQP.RegVar("updateMode", QPYX_get_updateMode_YXQP, QPYX_set_updateMode_YXQP);
		L_YXQP.RegVar("hasTransformHierarchy", QPYX_get_hasTransformHierarchy_YXQP, null);
		L_YXQP.RegVar("gravityWeight", QPYX_get_gravityWeight_YXQP, null);
		L_YXQP.RegVar("bodyPosition", QPYX_get_bodyPosition_YXQP, QPYX_set_bodyPosition_YXQP);
		L_YXQP.RegVar("bodyRotation", QPYX_get_bodyRotation_YXQP, QPYX_set_bodyRotation_YXQP);
		L_YXQP.RegVar("stabilizeFeet", QPYX_get_stabilizeFeet_YXQP, QPYX_set_stabilizeFeet_YXQP);
		L_YXQP.RegVar("layerCount", QPYX_get_layerCount_YXQP, null);
		L_YXQP.RegVar("parameters", QPYX_get_parameters_YXQP, null);
		L_YXQP.RegVar("parameterCount", QPYX_get_parameterCount_YXQP, null);
		L_YXQP.RegVar("feetPivotActive", QPYX_get_feetPivotActive_YXQP, QPYX_set_feetPivotActive_YXQP);
		L_YXQP.RegVar("pivotWeight", QPYX_get_pivotWeight_YXQP, null);
		L_YXQP.RegVar("pivotPosition", QPYX_get_pivotPosition_YXQP, null);
		L_YXQP.RegVar("isMatchingTarget", QPYX_get_isMatchingTarget_YXQP, null);
		L_YXQP.RegVar("speed", QPYX_get_speed_YXQP, QPYX_set_speed_YXQP);
		L_YXQP.RegVar("targetPosition", QPYX_get_targetPosition_YXQP, null);
		L_YXQP.RegVar("targetRotation", QPYX_get_targetRotation_YXQP, null);
		L_YXQP.RegVar("cullingMode", QPYX_get_cullingMode_YXQP, QPYX_set_cullingMode_YXQP);
		L_YXQP.RegVar("playbackTime", QPYX_get_playbackTime_YXQP, QPYX_set_playbackTime_YXQP);
		L_YXQP.RegVar("recorderStartTime", QPYX_get_recorderStartTime_YXQP, QPYX_set_recorderStartTime_YXQP);
		L_YXQP.RegVar("recorderStopTime", QPYX_get_recorderStopTime_YXQP, QPYX_set_recorderStopTime_YXQP);
		L_YXQP.RegVar("recorderMode", QPYX_get_recorderMode_YXQP, null);
		L_YXQP.RegVar("runtimeAnimatorController", QPYX_get_runtimeAnimatorController_YXQP, QPYX_set_runtimeAnimatorController_YXQP);
		L_YXQP.RegVar("hasBoundPlayables", QPYX_get_hasBoundPlayables_YXQP, null);
		L_YXQP.RegVar("avatar", QPYX_get_avatar_YXQP, QPYX_set_avatar_YXQP);
		L_YXQP.RegVar("playableGraph", QPYX_get_playableGraph_YXQP, null);
		L_YXQP.RegVar("layersAffectMassCenter", QPYX_get_layersAffectMassCenter_YXQP, QPYX_set_layersAffectMassCenter_YXQP);
		L_YXQP.RegVar("leftFeetBottomHeight", QPYX_get_leftFeetBottomHeight_YXQP, null);
		L_YXQP.RegVar("rightFeetBottomHeight", QPYX_get_rightFeetBottomHeight_YXQP, null);
		L_YXQP.RegVar("logWarnings", QPYX_get_logWarnings_YXQP, QPYX_set_logWarnings_YXQP);
		L_YXQP.RegVar("fireEvents", QPYX_get_fireEvents_YXQP, QPYX_set_fireEvents_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUnityEngine_Animator_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				UnityEngine.Animator QPYX_obj_YXQP = new UnityEngine.Animator();
				ToLua.PushSealed(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UnityEngine.Animator.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetFloat_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<int>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				float QPYX_o_YXQP = QPYX_obj_YXQP.GetFloat(QPYX_arg0_YXQP);
				LuaDLL.lua_pushnumber(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<string>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				float QPYX_o_YXQP = QPYX_obj_YXQP.GetFloat(QPYX_arg0_YXQP);
				LuaDLL.lua_pushnumber(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Animator.GetFloat");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetFloat_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<int, float>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				QPYX_obj_YXQP.SetFloat(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<string, float>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				QPYX_obj_YXQP.SetFloat(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 5 && TypeChecker.CheckTypes<int, float, float, float>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				float QPYX_arg2_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 4);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 5);
				QPYX_obj_YXQP.SetFloat(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 5 && TypeChecker.CheckTypes<string, float, float, float>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				float QPYX_arg2_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 4);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 5);
				QPYX_obj_YXQP.SetFloat(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Animator.SetFloat");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetBool_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<int>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				bool QPYX_o_YXQP = QPYX_obj_YXQP.GetBool(QPYX_arg0_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<string>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				bool QPYX_o_YXQP = QPYX_obj_YXQP.GetBool(QPYX_arg0_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Animator.GetBool");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetBool_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<int, bool>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.lua_toboolean(L_YXQP, 3);
				QPYX_obj_YXQP.SetBool(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<string, bool>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.lua_toboolean(L_YXQP, 3);
				QPYX_obj_YXQP.SetBool(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Animator.SetBool");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetInteger_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<int>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				int QPYX_o_YXQP = QPYX_obj_YXQP.GetInteger(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<string>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				int QPYX_o_YXQP = QPYX_obj_YXQP.GetInteger(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Animator.GetInteger");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetInteger_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<int, int>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 3);
				QPYX_obj_YXQP.SetInteger(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<string, int>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 3);
				QPYX_obj_YXQP.SetInteger(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Animator.SetInteger");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetTrigger_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<int>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				QPYX_obj_YXQP.SetTrigger(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<string>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				QPYX_obj_YXQP.SetTrigger(QPYX_arg0_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Animator.SetTrigger");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ResetTrigger_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<int>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				QPYX_obj_YXQP.ResetTrigger(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<string>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				QPYX_obj_YXQP.ResetTrigger(QPYX_arg0_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Animator.ResetTrigger");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IsParameterControlledByCurve_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<int>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				bool QPYX_o_YXQP = QPYX_obj_YXQP.IsParameterControlledByCurve(QPYX_arg0_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<string>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				bool QPYX_o_YXQP = QPYX_obj_YXQP.IsParameterControlledByCurve(QPYX_arg0_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Animator.IsParameterControlledByCurve");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetIKPosition_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
			UnityEngine.AvatarIKGoal QPYX_arg0_YXQP = (UnityEngine.AvatarIKGoal)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.AvatarIKGoal));
			UnityEngine.Vector3 QPYX_o_YXQP = QPYX_obj_YXQP.GetIKPosition(QPYX_arg0_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetIKPosition_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
			UnityEngine.AvatarIKGoal QPYX_arg0_YXQP = (UnityEngine.AvatarIKGoal)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.AvatarIKGoal));
			UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 3);
			QPYX_obj_YXQP.SetIKPosition(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetIKRotation_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
			UnityEngine.AvatarIKGoal QPYX_arg0_YXQP = (UnityEngine.AvatarIKGoal)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.AvatarIKGoal));
			UnityEngine.Quaternion QPYX_o_YXQP = QPYX_obj_YXQP.GetIKRotation(QPYX_arg0_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetIKRotation_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
			UnityEngine.AvatarIKGoal QPYX_arg0_YXQP = (UnityEngine.AvatarIKGoal)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.AvatarIKGoal));
			UnityEngine.Quaternion QPYX_arg1_YXQP = ToLua.ToQuaternion(L_YXQP, 3);
			QPYX_obj_YXQP.SetIKRotation(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetIKPositionWeight_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
			UnityEngine.AvatarIKGoal QPYX_arg0_YXQP = (UnityEngine.AvatarIKGoal)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.AvatarIKGoal));
			float QPYX_o_YXQP = QPYX_obj_YXQP.GetIKPositionWeight(QPYX_arg0_YXQP);
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetIKPositionWeight_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
			UnityEngine.AvatarIKGoal QPYX_arg0_YXQP = (UnityEngine.AvatarIKGoal)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.AvatarIKGoal));
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			QPYX_obj_YXQP.SetIKPositionWeight(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetIKRotationWeight_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
			UnityEngine.AvatarIKGoal QPYX_arg0_YXQP = (UnityEngine.AvatarIKGoal)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.AvatarIKGoal));
			float QPYX_o_YXQP = QPYX_obj_YXQP.GetIKRotationWeight(QPYX_arg0_YXQP);
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetIKRotationWeight_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
			UnityEngine.AvatarIKGoal QPYX_arg0_YXQP = (UnityEngine.AvatarIKGoal)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.AvatarIKGoal));
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			QPYX_obj_YXQP.SetIKRotationWeight(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetIKHintPosition_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
			UnityEngine.AvatarIKHint QPYX_arg0_YXQP = (UnityEngine.AvatarIKHint)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.AvatarIKHint));
			UnityEngine.Vector3 QPYX_o_YXQP = QPYX_obj_YXQP.GetIKHintPosition(QPYX_arg0_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetIKHintPosition_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
			UnityEngine.AvatarIKHint QPYX_arg0_YXQP = (UnityEngine.AvatarIKHint)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.AvatarIKHint));
			UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 3);
			QPYX_obj_YXQP.SetIKHintPosition(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetIKHintPositionWeight_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
			UnityEngine.AvatarIKHint QPYX_arg0_YXQP = (UnityEngine.AvatarIKHint)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.AvatarIKHint));
			float QPYX_o_YXQP = QPYX_obj_YXQP.GetIKHintPositionWeight(QPYX_arg0_YXQP);
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetIKHintPositionWeight_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
			UnityEngine.AvatarIKHint QPYX_arg0_YXQP = (UnityEngine.AvatarIKHint)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.AvatarIKHint));
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			QPYX_obj_YXQP.SetIKHintPositionWeight(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetLookAtPosition_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
			UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
			QPYX_obj_YXQP.SetLookAtPosition(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetLookAtWeight_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				QPYX_obj_YXQP.SetLookAtWeight(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				QPYX_obj_YXQP.SetLookAtWeight(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
				QPYX_obj_YXQP.SetLookAtWeight(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 5)
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
				float QPYX_arg3_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 5);
				QPYX_obj_YXQP.SetLookAtWeight(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 6)
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
				float QPYX_arg3_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 5);
				float QPYX_arg4_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 6);
				QPYX_obj_YXQP.SetLookAtWeight(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Animator.SetLookAtWeight");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetBoneLocalRotation_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
			UnityEngine.HumanBodyBones QPYX_arg0_YXQP = (UnityEngine.HumanBodyBones)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.HumanBodyBones));
			UnityEngine.Quaternion QPYX_arg1_YXQP = ToLua.ToQuaternion(L_YXQP, 3);
			QPYX_obj_YXQP.SetBoneLocalRotation(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetBehaviours_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
			UnityEngine.StateMachineBehaviour[] QPYX_o_YXQP = QPYX_obj_YXQP.GetBehaviours(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetLayerName_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			string QPYX_o_YXQP = QPYX_obj_YXQP.GetLayerName(QPYX_arg0_YXQP);
			LuaDLL.lua_pushstring(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetLayerIndex_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			int QPYX_o_YXQP = QPYX_obj_YXQP.GetLayerIndex(QPYX_arg0_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetLayerWeight_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			float QPYX_o_YXQP = QPYX_obj_YXQP.GetLayerWeight(QPYX_arg0_YXQP);
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetLayerWeight_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			QPYX_obj_YXQP.SetLayerWeight(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetCurrentAnimatorStateInfo_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.AnimatorStateInfo QPYX_o_YXQP = QPYX_obj_YXQP.GetCurrentAnimatorStateInfo(QPYX_arg0_YXQP);
			ToLua.PushValue(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetNextAnimatorStateInfo_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.AnimatorStateInfo QPYX_o_YXQP = QPYX_obj_YXQP.GetNextAnimatorStateInfo(QPYX_arg0_YXQP);
			ToLua.PushValue(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetAnimatorTransitionInfo_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.AnimatorTransitionInfo QPYX_o_YXQP = QPYX_obj_YXQP.GetAnimatorTransitionInfo(QPYX_arg0_YXQP);
			ToLua.PushValue(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetCurrentAnimatorClipInfoCount_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			int QPYX_o_YXQP = QPYX_obj_YXQP.GetCurrentAnimatorClipInfoCount(QPYX_arg0_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetCurrentAnimatorClipInfo_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.AnimatorClipInfo[] QPYX_o_YXQP = QPYX_obj_YXQP.GetCurrentAnimatorClipInfo(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				System.Collections.Generic.List<UnityEngine.AnimatorClipInfo> QPYX_arg1_YXQP = (System.Collections.Generic.List<UnityEngine.AnimatorClipInfo>)ToLua.CheckObject(L_YXQP, 3, typeof(System.Collections.Generic.List<UnityEngine.AnimatorClipInfo>));
				QPYX_obj_YXQP.GetCurrentAnimatorClipInfo(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Animator.GetCurrentAnimatorClipInfo");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetNextAnimatorClipInfoCount_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			int QPYX_o_YXQP = QPYX_obj_YXQP.GetNextAnimatorClipInfoCount(QPYX_arg0_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetNextAnimatorClipInfo_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.AnimatorClipInfo[] QPYX_o_YXQP = QPYX_obj_YXQP.GetNextAnimatorClipInfo(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
				System.Collections.Generic.List<UnityEngine.AnimatorClipInfo> QPYX_arg1_YXQP = (System.Collections.Generic.List<UnityEngine.AnimatorClipInfo>)ToLua.CheckObject(L_YXQP, 3, typeof(System.Collections.Generic.List<UnityEngine.AnimatorClipInfo>));
				QPYX_obj_YXQP.GetNextAnimatorClipInfo(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Animator.GetNextAnimatorClipInfo");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IsInTransition_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.IsInTransition(QPYX_arg0_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetParameter_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.AnimatorControllerParameter QPYX_o_YXQP = QPYX_obj_YXQP.GetParameter(QPYX_arg0_YXQP);
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_MatchTarget_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 6)
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Quaternion QPYX_arg1_YXQP = ToLua.ToQuaternion(L_YXQP, 3);
				UnityEngine.AvatarTarget QPYX_arg2_YXQP = (UnityEngine.AvatarTarget)ToLua.CheckObject(L_YXQP, 4, typeof(UnityEngine.AvatarTarget));
				UnityEngine.MatchTargetWeightMask QPYX_arg3_YXQP = StackTraits<UnityEngine.MatchTargetWeightMask>.Check(L_YXQP, 5);
				float QPYX_arg4_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 6);
				QPYX_obj_YXQP.MatchTarget(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 7)
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Quaternion QPYX_arg1_YXQP = ToLua.ToQuaternion(L_YXQP, 3);
				UnityEngine.AvatarTarget QPYX_arg2_YXQP = (UnityEngine.AvatarTarget)ToLua.CheckObject(L_YXQP, 4, typeof(UnityEngine.AvatarTarget));
				UnityEngine.MatchTargetWeightMask QPYX_arg3_YXQP = StackTraits<UnityEngine.MatchTargetWeightMask>.Check(L_YXQP, 5);
				float QPYX_arg4_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 6);
				float QPYX_arg5_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 7);
				QPYX_obj_YXQP.MatchTarget(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Animator.MatchTarget");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_InterruptMatchTarget_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				QPYX_obj_YXQP.InterruptMatchTarget();
				return 0;
			}
			else if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				QPYX_obj_YXQP.InterruptMatchTarget(QPYX_arg0_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Animator.InterruptMatchTarget");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CrossFadeInFixedTime_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<string, float>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				QPYX_obj_YXQP.CrossFadeInFixedTime(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<int, float>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				QPYX_obj_YXQP.CrossFadeInFixedTime(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<int, float, int>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				QPYX_obj_YXQP.CrossFadeInFixedTime(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<string, float, int>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				QPYX_obj_YXQP.CrossFadeInFixedTime(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 5 && TypeChecker.CheckTypes<int, float, int, float>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 5);
				QPYX_obj_YXQP.CrossFadeInFixedTime(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 5 && TypeChecker.CheckTypes<string, float, int, float>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 5);
				QPYX_obj_YXQP.CrossFadeInFixedTime(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 6 && TypeChecker.CheckTypes<string, float, int, float, float>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 5);
				float QPYX_arg4_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 6);
				QPYX_obj_YXQP.CrossFadeInFixedTime(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 6 && TypeChecker.CheckTypes<int, float, int, float, float>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 5);
				float QPYX_arg4_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 6);
				QPYX_obj_YXQP.CrossFadeInFixedTime(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Animator.CrossFadeInFixedTime");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CrossFade_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<string, float>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				QPYX_obj_YXQP.CrossFade(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<int, float>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				QPYX_obj_YXQP.CrossFade(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<int, float, int>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				QPYX_obj_YXQP.CrossFade(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<string, float, int>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				QPYX_obj_YXQP.CrossFade(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 5 && TypeChecker.CheckTypes<int, float, int, float>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 5);
				QPYX_obj_YXQP.CrossFade(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 5 && TypeChecker.CheckTypes<string, float, int, float>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 5);
				QPYX_obj_YXQP.CrossFade(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 6 && TypeChecker.CheckTypes<string, float, int, float, float>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 5);
				float QPYX_arg4_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 6);
				QPYX_obj_YXQP.CrossFade(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 6 && TypeChecker.CheckTypes<int, float, int, float, float>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 5);
				float QPYX_arg4_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 6);
				QPYX_obj_YXQP.CrossFade(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Animator.CrossFade");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_PlayInFixedTime_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<int>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				QPYX_obj_YXQP.PlayInFixedTime(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<string>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				QPYX_obj_YXQP.PlayInFixedTime(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<int, int>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 3);
				QPYX_obj_YXQP.PlayInFixedTime(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<string, int>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 3);
				QPYX_obj_YXQP.PlayInFixedTime(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<string, int, float>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 3);
				float QPYX_arg2_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 4);
				QPYX_obj_YXQP.PlayInFixedTime(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<int, int, float>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 3);
				float QPYX_arg2_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 4);
				QPYX_obj_YXQP.PlayInFixedTime(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Animator.PlayInFixedTime");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Play_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<int>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				QPYX_obj_YXQP.Play(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<string>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				QPYX_obj_YXQP.Play(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<int, int>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 3);
				QPYX_obj_YXQP.Play(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<string, int>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 3);
				QPYX_obj_YXQP.Play(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<string, int, float>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 3);
				float QPYX_arg2_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 4);
				QPYX_obj_YXQP.Play(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<int, int, float>(L_YXQP, 2))
			{
				UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
				int QPYX_arg0_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 3);
				float QPYX_arg2_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 4);
				QPYX_obj_YXQP.Play(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Animator.Play");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetTarget_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
			UnityEngine.AvatarTarget QPYX_arg0_YXQP = (UnityEngine.AvatarTarget)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.AvatarTarget));
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			QPYX_obj_YXQP.SetTarget(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetBoneTransform_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
			UnityEngine.HumanBodyBones QPYX_arg0_YXQP = (UnityEngine.HumanBodyBones)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.HumanBodyBones));
			UnityEngine.Transform QPYX_o_YXQP = QPYX_obj_YXQP.GetBoneTransform(QPYX_arg0_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_StartPlayback_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
			QPYX_obj_YXQP.StartPlayback();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_StopPlayback_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
			QPYX_obj_YXQP.StopPlayback();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_StartRecording_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.StartRecording(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_StopRecording_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
			QPYX_obj_YXQP.StopRecording();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_HasState_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.HasState(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_StringToHash_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 1);
			int QPYX_o_YXQP = UnityEngine.Animator.StringToHash(QPYX_arg0_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Update_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.Update(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Rebind_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
			QPYX_obj_YXQP.Rebind();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ApplyBuiltinRootMotion_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Animator  QPYX_obj_YXQP  = (UnityEngine.Animator)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animator));
			QPYX_obj_YXQP.ApplyBuiltinRootMotion();
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
	static int QPYX_get_isOptimizable_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.isOptimizable;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isOptimizable on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isHuman_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.isHuman;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isHuman on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_hasRootMotion_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.hasRootMotion;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index hasRootMotion on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_humanScale_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.humanScale;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index humanScale on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isInitialized_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.isInitialized;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isInitialized on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_deltaPosition_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_ret_YXQP = QPYX_obj_YXQP.deltaPosition;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index deltaPosition on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_deltaRotation_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			UnityEngine.Quaternion QPYX_ret_YXQP = QPYX_obj_YXQP.deltaRotation;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index deltaRotation on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_velocity_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_ret_YXQP = QPYX_obj_YXQP.velocity;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index velocity on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_angularVelocity_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_ret_YXQP = QPYX_obj_YXQP.angularVelocity;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index angularVelocity on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_rootPosition_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_ret_YXQP = QPYX_obj_YXQP.rootPosition;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index rootPosition on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_rootRotation_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			UnityEngine.Quaternion QPYX_ret_YXQP = QPYX_obj_YXQP.rootRotation;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index rootRotation on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_applyRootMotion_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.applyRootMotion;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index applyRootMotion on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_linearVelocityBlending_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.linearVelocityBlending;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index linearVelocityBlending on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_updateMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			UnityEngine.AnimatorUpdateMode QPYX_ret_YXQP = QPYX_obj_YXQP.updateMode;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index updateMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_hasTransformHierarchy_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.hasTransformHierarchy;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index hasTransformHierarchy on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_gravityWeight_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.gravityWeight;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index gravityWeight on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_bodyPosition_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_ret_YXQP = QPYX_obj_YXQP.bodyPosition;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index bodyPosition on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_bodyRotation_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			UnityEngine.Quaternion QPYX_ret_YXQP = QPYX_obj_YXQP.bodyRotation;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index bodyRotation on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_stabilizeFeet_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.stabilizeFeet;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index stabilizeFeet on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_layerCount_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.layerCount;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index layerCount on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_parameters_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			UnityEngine.AnimatorControllerParameter[] QPYX_ret_YXQP = QPYX_obj_YXQP.parameters;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index parameters on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_parameterCount_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.parameterCount;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index parameterCount on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_feetPivotActive_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.feetPivotActive;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index feetPivotActive on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_pivotWeight_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.pivotWeight;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index pivotWeight on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_pivotPosition_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_ret_YXQP = QPYX_obj_YXQP.pivotPosition;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index pivotPosition on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isMatchingTarget_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.isMatchingTarget;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isMatchingTarget on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_speed_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.speed;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index speed on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_targetPosition_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_ret_YXQP = QPYX_obj_YXQP.targetPosition;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index targetPosition on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_targetRotation_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			UnityEngine.Quaternion QPYX_ret_YXQP = QPYX_obj_YXQP.targetRotation;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index targetRotation on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_cullingMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			UnityEngine.AnimatorCullingMode QPYX_ret_YXQP = QPYX_obj_YXQP.cullingMode;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index cullingMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_playbackTime_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.playbackTime;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index playbackTime on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_recorderStartTime_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.recorderStartTime;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index recorderStartTime on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_recorderStopTime_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.recorderStopTime;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index recorderStopTime on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_recorderMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			UnityEngine.AnimatorRecorderMode QPYX_ret_YXQP = QPYX_obj_YXQP.recorderMode;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index recorderMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_runtimeAnimatorController_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			UnityEngine.RuntimeAnimatorController QPYX_ret_YXQP = QPYX_obj_YXQP.runtimeAnimatorController;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index runtimeAnimatorController on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_hasBoundPlayables_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.hasBoundPlayables;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index hasBoundPlayables on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_avatar_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			UnityEngine.Avatar QPYX_ret_YXQP = QPYX_obj_YXQP.avatar;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index avatar on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_playableGraph_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			UnityEngine.Playables.PlayableGraph QPYX_ret_YXQP = QPYX_obj_YXQP.playableGraph;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index playableGraph on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_layersAffectMassCenter_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.layersAffectMassCenter;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index layersAffectMassCenter on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_leftFeetBottomHeight_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.leftFeetBottomHeight;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index leftFeetBottomHeight on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_rightFeetBottomHeight_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.rightFeetBottomHeight;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index rightFeetBottomHeight on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_logWarnings_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.logWarnings;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index logWarnings on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_fireEvents_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.fireEvents;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index fireEvents on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_rootPosition_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
			QPYX_obj_YXQP.rootPosition = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index rootPosition on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_rootRotation_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			UnityEngine.Quaternion QPYX_arg0_YXQP = ToLua.ToQuaternion(L_YXQP, 2);
			QPYX_obj_YXQP.rootRotation = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index rootRotation on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_applyRootMotion_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.applyRootMotion = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index applyRootMotion on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_linearVelocityBlending_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.linearVelocityBlending = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index linearVelocityBlending on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_updateMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			UnityEngine.AnimatorUpdateMode QPYX_arg0_YXQP = (UnityEngine.AnimatorUpdateMode)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.AnimatorUpdateMode));
			QPYX_obj_YXQP.updateMode = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index updateMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_bodyPosition_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
			QPYX_obj_YXQP.bodyPosition = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index bodyPosition on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_bodyRotation_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			UnityEngine.Quaternion QPYX_arg0_YXQP = ToLua.ToQuaternion(L_YXQP, 2);
			QPYX_obj_YXQP.bodyRotation = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index bodyRotation on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_stabilizeFeet_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.stabilizeFeet = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index stabilizeFeet on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_feetPivotActive_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.feetPivotActive = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index feetPivotActive on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_speed_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.speed = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index speed on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_cullingMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			UnityEngine.AnimatorCullingMode QPYX_arg0_YXQP = (UnityEngine.AnimatorCullingMode)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.AnimatorCullingMode));
			QPYX_obj_YXQP.cullingMode = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index cullingMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_playbackTime_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.playbackTime = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index playbackTime on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_recorderStartTime_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.recorderStartTime = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index recorderStartTime on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_recorderStopTime_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.recorderStopTime = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index recorderStopTime on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_runtimeAnimatorController_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			UnityEngine.RuntimeAnimatorController QPYX_arg0_YXQP = (UnityEngine.RuntimeAnimatorController)ToLua.CheckObject<UnityEngine.RuntimeAnimatorController>(L_YXQP, 2);
			QPYX_obj_YXQP.runtimeAnimatorController = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index runtimeAnimatorController on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_avatar_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			UnityEngine.Avatar QPYX_arg0_YXQP = (UnityEngine.Avatar)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.Avatar));
			QPYX_obj_YXQP.avatar = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index avatar on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_layersAffectMassCenter_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.layersAffectMassCenter = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index layersAffectMassCenter on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_logWarnings_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.logWarnings = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index logWarnings on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_fireEvents_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animator QPYX_obj_YXQP = (UnityEngine.Animator)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.fireEvents = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index fireEvents on a nil value");
		}
	}
}

