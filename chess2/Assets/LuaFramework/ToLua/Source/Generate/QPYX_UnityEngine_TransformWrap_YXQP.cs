using System;
using DG.Tweening;
using LuaInterface;

public class QPYX_UnityEngine_TransformWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.Transform), typeof(UnityEngine.Component));
		L_YXQP.RegFunction("SetParent", QPYX_SetParent_YXQP);
		L_YXQP.RegFunction("SetPositionAndRotation", QPYX_SetPositionAndRotation_YXQP);
		L_YXQP.RegFunction("Translate", QPYX_Translate_YXQP);
		L_YXQP.RegFunction("Rotate", QPYX_Rotate_YXQP);
		L_YXQP.RegFunction("RotateAround", QPYX_RotateAround_YXQP);
		L_YXQP.RegFunction("LookAt", QPYX_LookAt_YXQP);
		L_YXQP.RegFunction("TransformDirection", QPYX_TransformDirection_YXQP);
		L_YXQP.RegFunction("InverseTransformDirection", QPYX_InverseTransformDirection_YXQP);
		L_YXQP.RegFunction("TransformVector", QPYX_TransformVector_YXQP);
		L_YXQP.RegFunction("InverseTransformVector", QPYX_InverseTransformVector_YXQP);
		L_YXQP.RegFunction("TransformPoint", QPYX_TransformPoint_YXQP);
		L_YXQP.RegFunction("InverseTransformPoint", QPYX_InverseTransformPoint_YXQP);
		L_YXQP.RegFunction("DetachChildren", QPYX_DetachChildren_YXQP);
		L_YXQP.RegFunction("SetAsFirstSibling", QPYX_SetAsFirstSibling_YXQP);
		L_YXQP.RegFunction("SetAsLastSibling", QPYX_SetAsLastSibling_YXQP);
		L_YXQP.RegFunction("SetSiblingIndex", QPYX_SetSiblingIndex_YXQP);
		L_YXQP.RegFunction("GetSiblingIndex", QPYX_GetSiblingIndex_YXQP);
		L_YXQP.RegFunction("Find", QPYX_Find_YXQP);
		L_YXQP.RegFunction("IsChildOf", QPYX_IsChildOf_YXQP);
		L_YXQP.RegFunction("GetEnumerator", QPYX_GetEnumerator_YXQP);
		L_YXQP.RegFunction("GetChild", QPYX_GetChild_YXQP);
		L_YXQP.RegFunction("DOTogglePause", QPYX_DOTogglePause_YXQP);
		L_YXQP.RegFunction("DOSmoothRewind", QPYX_DOSmoothRewind_YXQP);
		L_YXQP.RegFunction("DORewind", QPYX_DORewind_YXQP);
		L_YXQP.RegFunction("DORestart", QPYX_DORestart_YXQP);
		L_YXQP.RegFunction("DOPlayForward", QPYX_DOPlayForward_YXQP);
		L_YXQP.RegFunction("DOPlayBackwards", QPYX_DOPlayBackwards_YXQP);
		L_YXQP.RegFunction("DOPlay", QPYX_DOPlay_YXQP);
		L_YXQP.RegFunction("DOPause", QPYX_DOPause_YXQP);
		L_YXQP.RegFunction("DOGoto", QPYX_DOGoto_YXQP);
		L_YXQP.RegFunction("DOFlip", QPYX_DOFlip_YXQP);
		L_YXQP.RegFunction("DOKill", QPYX_DOKill_YXQP);
		L_YXQP.RegFunction("DOComplete", QPYX_DOComplete_YXQP);
		L_YXQP.RegFunction("DOBlendableScaleBy", QPYX_DOBlendableScaleBy_YXQP);
		L_YXQP.RegFunction("DOBlendableLocalRotateBy", QPYX_DOBlendableLocalRotateBy_YXQP);
		L_YXQP.RegFunction("DOBlendableRotateBy", QPYX_DOBlendableRotateBy_YXQP);
		L_YXQP.RegFunction("DOBlendableLocalMoveBy", QPYX_DOBlendableLocalMoveBy_YXQP);
		L_YXQP.RegFunction("DOBlendableMoveBy", QPYX_DOBlendableMoveBy_YXQP);
		L_YXQP.RegFunction("DOLocalPath", QPYX_DOLocalPath_YXQP);
		L_YXQP.RegFunction("DOPath", QPYX_DOPath_YXQP);
		L_YXQP.RegFunction("DOLocalJump", QPYX_DOLocalJump_YXQP);
		L_YXQP.RegFunction("DOJump", QPYX_DOJump_YXQP);
		L_YXQP.RegFunction("DOShakeScale", QPYX_DOShakeScale_YXQP);
		L_YXQP.RegFunction("DOShakeRotation", QPYX_DOShakeRotation_YXQP);
		L_YXQP.RegFunction("DOShakePosition", QPYX_DOShakePosition_YXQP);
		L_YXQP.RegFunction("DOPunchRotation", QPYX_DOPunchRotation_YXQP);
		L_YXQP.RegFunction("DOPunchScale", QPYX_DOPunchScale_YXQP);
		L_YXQP.RegFunction("DOPunchPosition", QPYX_DOPunchPosition_YXQP);
		L_YXQP.RegFunction("DOLookAt", QPYX_DOLookAt_YXQP);
		L_YXQP.RegFunction("DOScaleZ", QPYX_DOScaleZ_YXQP);
		L_YXQP.RegFunction("DOScaleY", QPYX_DOScaleY_YXQP);
		L_YXQP.RegFunction("DOScaleX", QPYX_DOScaleX_YXQP);
		L_YXQP.RegFunction("DOScale", QPYX_DOScale_YXQP);
		L_YXQP.RegFunction("DOLocalRotateQuaternion", QPYX_DOLocalRotateQuaternion_YXQP);
		L_YXQP.RegFunction("DOLocalRotate", QPYX_DOLocalRotate_YXQP);
		L_YXQP.RegFunction("DORotateQuaternion", QPYX_DORotateQuaternion_YXQP);
		L_YXQP.RegFunction("DORotate", QPYX_DORotate_YXQP);
		L_YXQP.RegFunction("DOLocalMoveZ", QPYX_DOLocalMoveZ_YXQP);
		L_YXQP.RegFunction("DOLocalMoveY", QPYX_DOLocalMoveY_YXQP);
		L_YXQP.RegFunction("DOLocalMoveX", QPYX_DOLocalMoveX_YXQP);
		L_YXQP.RegFunction("DOLocalMove", QPYX_DOLocalMove_YXQP);
		L_YXQP.RegFunction("DOMoveZ", QPYX_DOMoveZ_YXQP);
		L_YXQP.RegFunction("DOMoveY", QPYX_DOMoveY_YXQP);
		L_YXQP.RegFunction("DOMoveX", QPYX_DOMoveX_YXQP);
		L_YXQP.RegFunction("DOMove", QPYX_DOMove_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("position", QPYX_get_position_YXQP, QPYX_set_position_YXQP);
		L_YXQP.RegVar("localPosition", QPYX_get_localPosition_YXQP, QPYX_set_localPosition_YXQP);
		L_YXQP.RegVar("eulerAngles", QPYX_get_eulerAngles_YXQP, QPYX_set_eulerAngles_YXQP);
		L_YXQP.RegVar("localEulerAngles", QPYX_get_localEulerAngles_YXQP, QPYX_set_localEulerAngles_YXQP);
		L_YXQP.RegVar("right", QPYX_get_right_YXQP, QPYX_set_right_YXQP);
		L_YXQP.RegVar("up", QPYX_get_up_YXQP, QPYX_set_up_YXQP);
		L_YXQP.RegVar("forward", QPYX_get_forward_YXQP, QPYX_set_forward_YXQP);
		L_YXQP.RegVar("rotation", QPYX_get_rotation_YXQP, QPYX_set_rotation_YXQP);
		L_YXQP.RegVar("localRotation", QPYX_get_localRotation_YXQP, QPYX_set_localRotation_YXQP);
		L_YXQP.RegVar("localScale", QPYX_get_localScale_YXQP, QPYX_set_localScale_YXQP);
		L_YXQP.RegVar("parent", QPYX_get_parent_YXQP, QPYX_set_parent_YXQP);
		L_YXQP.RegVar("worldToLocalMatrix", QPYX_get_worldToLocalMatrix_YXQP, null);
		L_YXQP.RegVar("localToWorldMatrix", QPYX_get_localToWorldMatrix_YXQP, null);
		L_YXQP.RegVar("root", QPYX_get_root_YXQP, null);
		L_YXQP.RegVar("childCount", QPYX_get_childCount_YXQP, null);
		L_YXQP.RegVar("lossyScale", QPYX_get_lossyScale_YXQP, null);
		L_YXQP.RegVar("hasChanged", QPYX_get_hasChanged_YXQP, QPYX_set_hasChanged_YXQP);
		L_YXQP.RegVar("hierarchyCapacity", QPYX_get_hierarchyCapacity_YXQP, QPYX_set_hierarchyCapacity_YXQP);
		L_YXQP.RegVar("hierarchyCount", QPYX_get_hierarchyCount_YXQP, null);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetParent_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Transform QPYX_arg0_YXQP = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 2);
				QPYX_obj_YXQP.SetParent(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Transform QPYX_arg0_YXQP = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				QPYX_obj_YXQP.SetParent(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Transform.SetParent");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetPositionAndRotation_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
			UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
			UnityEngine.Quaternion QPYX_arg1_YXQP = ToLua.ToQuaternion(L_YXQP, 3);
			QPYX_obj_YXQP.SetPositionAndRotation(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Translate_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				QPYX_obj_YXQP.Translate(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<UnityEngine.Transform>(L_YXQP, 3))
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Transform QPYX_arg1_YXQP = (UnityEngine.Transform)ToLua.ToObject(L_YXQP, 3);
				QPYX_obj_YXQP.Translate(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<UnityEngine.Space>(L_YXQP, 3))
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Space QPYX_arg1_YXQP = (UnityEngine.Space)ToLua.ToObject(L_YXQP, 3);
				QPYX_obj_YXQP.Translate(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
				QPYX_obj_YXQP.Translate(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 5 && TypeChecker.CheckTypes<UnityEngine.Transform>(L_YXQP, 5))
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
				UnityEngine.Transform QPYX_arg3_YXQP = (UnityEngine.Transform)ToLua.ToObject(L_YXQP, 5);
				QPYX_obj_YXQP.Translate(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 5 && TypeChecker.CheckTypes<UnityEngine.Space>(L_YXQP, 5))
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
				UnityEngine.Space QPYX_arg3_YXQP = (UnityEngine.Space)ToLua.ToObject(L_YXQP, 5);
				QPYX_obj_YXQP.Translate(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Transform.Translate");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Rotate_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				QPYX_obj_YXQP.Rotate(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<float>(L_YXQP, 3))
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				QPYX_obj_YXQP.Rotate(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<UnityEngine.Space>(L_YXQP, 3))
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Space QPYX_arg1_YXQP = (UnityEngine.Space)ToLua.ToObject(L_YXQP, 3);
				QPYX_obj_YXQP.Rotate(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<UnityEngine.Vector3, float, UnityEngine.Space>(L_YXQP, 2))
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				UnityEngine.Space QPYX_arg2_YXQP = (UnityEngine.Space)ToLua.ToObject(L_YXQP, 4);
				QPYX_obj_YXQP.Rotate(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<float, float, float>(L_YXQP, 2))
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				float QPYX_arg2_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 4);
				QPYX_obj_YXQP.Rotate(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 5)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
				UnityEngine.Space QPYX_arg3_YXQP = (UnityEngine.Space)ToLua.CheckObject(L_YXQP, 5, typeof(UnityEngine.Space));
				QPYX_obj_YXQP.Rotate(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Transform.Rotate");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_RotateAround_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 4);
			UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
			UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
			UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 3);
			float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
			QPYX_obj_YXQP.RotateAround(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LookAt_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<UnityEngine.Vector3>(L_YXQP, 2))
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				QPYX_obj_YXQP.LookAt(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<UnityEngine.Transform>(L_YXQP, 2))
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Transform QPYX_arg0_YXQP = (UnityEngine.Transform)ToLua.ToObject(L_YXQP, 2);
				QPYX_obj_YXQP.LookAt(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<UnityEngine.Vector3, UnityEngine.Vector3>(L_YXQP, 2))
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 3);
				QPYX_obj_YXQP.LookAt(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<UnityEngine.Transform, UnityEngine.Vector3>(L_YXQP, 2))
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Transform QPYX_arg0_YXQP = (UnityEngine.Transform)ToLua.ToObject(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 3);
				QPYX_obj_YXQP.LookAt(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Transform.LookAt");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_TransformDirection_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_o_YXQP = QPYX_obj_YXQP.TransformDirection(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
				UnityEngine.Vector3 QPYX_o_YXQP = QPYX_obj_YXQP.TransformDirection(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Transform.TransformDirection");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_InverseTransformDirection_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_o_YXQP = QPYX_obj_YXQP.InverseTransformDirection(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
				UnityEngine.Vector3 QPYX_o_YXQP = QPYX_obj_YXQP.InverseTransformDirection(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Transform.InverseTransformDirection");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_TransformVector_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_o_YXQP = QPYX_obj_YXQP.TransformVector(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
				UnityEngine.Vector3 QPYX_o_YXQP = QPYX_obj_YXQP.TransformVector(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Transform.TransformVector");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_InverseTransformVector_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_o_YXQP = QPYX_obj_YXQP.InverseTransformVector(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
				UnityEngine.Vector3 QPYX_o_YXQP = QPYX_obj_YXQP.InverseTransformVector(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Transform.InverseTransformVector");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_TransformPoint_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_o_YXQP = QPYX_obj_YXQP.TransformPoint(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
				UnityEngine.Vector3 QPYX_o_YXQP = QPYX_obj_YXQP.TransformPoint(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Transform.TransformPoint");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_InverseTransformPoint_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_o_YXQP = QPYX_obj_YXQP.InverseTransformPoint(QPYX_arg0_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
				UnityEngine.Vector3 QPYX_o_YXQP = QPYX_obj_YXQP.InverseTransformPoint(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.Push(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Transform.InverseTransformPoint");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DetachChildren_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
			QPYX_obj_YXQP.DetachChildren();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetAsFirstSibling_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
			QPYX_obj_YXQP.SetAsFirstSibling();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetAsLastSibling_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
			QPYX_obj_YXQP.SetAsLastSibling();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetSiblingIndex_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.SetSiblingIndex(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetSiblingIndex_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.GetSiblingIndex();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Find_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			UnityEngine.Transform QPYX_o_YXQP = QPYX_obj_YXQP.Find(QPYX_arg0_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IsChildOf_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
			UnityEngine.Transform QPYX_arg0_YXQP = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 2);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.IsChildOf(QPYX_arg0_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetEnumerator_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
			System.Collections.IEnumerator QPYX_o_YXQP = QPYX_obj_YXQP.GetEnumerator();
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetChild_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			UnityEngine.Transform QPYX_o_YXQP = QPYX_obj_YXQP.GetChild(QPYX_arg0_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOTogglePause_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.DOTogglePause();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOSmoothRewind_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.DOSmoothRewind();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DORewind_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				int QPYX_o_YXQP = QPYX_obj_YXQP.DORewind();
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				int QPYX_o_YXQP = QPYX_obj_YXQP.DORewind(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Transform.DORewind");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DORestart_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				int QPYX_o_YXQP = QPYX_obj_YXQP.DORestart();
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				int QPYX_o_YXQP = QPYX_obj_YXQP.DORestart(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Transform.DORestart");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOPlayForward_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.DOPlayForward();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOPlayBackwards_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.DOPlayBackwards();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOPlay_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.DOPlay();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOPause_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.DOPause();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOGoto_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				int QPYX_o_YXQP = QPYX_obj_YXQP.DOGoto(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				int QPYX_o_YXQP = QPYX_obj_YXQP.DOGoto(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Transform.DOGoto");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOFlip_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
			int QPYX_o_YXQP = QPYX_obj_YXQP.DOFlip();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOKill_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				int QPYX_o_YXQP = QPYX_obj_YXQP.DOKill();
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				int QPYX_o_YXQP = QPYX_obj_YXQP.DOKill(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Transform.DOKill");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOComplete_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				int QPYX_o_YXQP = QPYX_obj_YXQP.DOComplete();
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				int QPYX_o_YXQP = QPYX_obj_YXQP.DOComplete(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Transform.DOComplete");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOBlendableScaleBy_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
			UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOBlendableScaleBy(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOBlendableLocalRotateBy_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOBlendableLocalRotateBy(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				DG.Tweening.RotateMode QPYX_arg2_YXQP = (DG.Tweening.RotateMode)ToLua.CheckObject(L_YXQP, 4, typeof(DG.Tweening.RotateMode));
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOBlendableLocalRotateBy(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Transform.DOBlendableLocalRotateBy");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOBlendableRotateBy_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOBlendableRotateBy(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				DG.Tweening.RotateMode QPYX_arg2_YXQP = (DG.Tweening.RotateMode)ToLua.CheckObject(L_YXQP, 4, typeof(DG.Tweening.RotateMode));
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOBlendableRotateBy(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Transform.DOBlendableRotateBy");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOBlendableLocalMoveBy_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOBlendableLocalMoveBy(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				bool QPYX_arg2_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 4);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOBlendableLocalMoveBy(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Transform.DOBlendableLocalMoveBy");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOBlendableMoveBy_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOBlendableMoveBy(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				bool QPYX_arg2_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 4);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOBlendableMoveBy(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Transform.DOBlendableMoveBy");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOLocalPath_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3[] QPYX_arg0_YXQP = ToLua.CheckStructArray<UnityEngine.Vector3>(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				DG.Tweening.Core.TweenerCore<UnityEngine.Vector3,DG.Tweening.Plugins.Core.PathCore.Path,DG.Tweening.Plugins.Options.PathOptions> QPYX_o_YXQP = QPYX_obj_YXQP.DOLocalPath(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3[] QPYX_arg0_YXQP = ToLua.CheckStructArray<UnityEngine.Vector3>(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				DG.Tweening.PathType QPYX_arg2_YXQP = (DG.Tweening.PathType)ToLua.CheckObject(L_YXQP, 4, typeof(DG.Tweening.PathType));
				DG.Tweening.Core.TweenerCore<UnityEngine.Vector3,DG.Tweening.Plugins.Core.PathCore.Path,DG.Tweening.Plugins.Options.PathOptions> QPYX_o_YXQP = QPYX_obj_YXQP.DOLocalPath(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3[] QPYX_arg0_YXQP = ToLua.CheckStructArray<UnityEngine.Vector3>(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				DG.Tweening.PathType QPYX_arg2_YXQP = (DG.Tweening.PathType)ToLua.CheckObject(L_YXQP, 4, typeof(DG.Tweening.PathType));
				DG.Tweening.PathMode QPYX_arg3_YXQP = (DG.Tweening.PathMode)ToLua.CheckObject(L_YXQP, 5, typeof(DG.Tweening.PathMode));
				DG.Tweening.Core.TweenerCore<UnityEngine.Vector3,DG.Tweening.Plugins.Core.PathCore.Path,DG.Tweening.Plugins.Options.PathOptions> QPYX_o_YXQP = QPYX_obj_YXQP.DOLocalPath(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 6)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3[] QPYX_arg0_YXQP = ToLua.CheckStructArray<UnityEngine.Vector3>(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				DG.Tweening.PathType QPYX_arg2_YXQP = (DG.Tweening.PathType)ToLua.CheckObject(L_YXQP, 4, typeof(DG.Tweening.PathType));
				DG.Tweening.PathMode QPYX_arg3_YXQP = (DG.Tweening.PathMode)ToLua.CheckObject(L_YXQP, 5, typeof(DG.Tweening.PathMode));
				int QPYX_arg4_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 6);
				DG.Tweening.Core.TweenerCore<UnityEngine.Vector3,DG.Tweening.Plugins.Core.PathCore.Path,DG.Tweening.Plugins.Options.PathOptions> QPYX_o_YXQP = QPYX_obj_YXQP.DOLocalPath(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 7)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3[] QPYX_arg0_YXQP = ToLua.CheckStructArray<UnityEngine.Vector3>(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				DG.Tweening.PathType QPYX_arg2_YXQP = (DG.Tweening.PathType)ToLua.CheckObject(L_YXQP, 4, typeof(DG.Tweening.PathType));
				DG.Tweening.PathMode QPYX_arg3_YXQP = (DG.Tweening.PathMode)ToLua.CheckObject(L_YXQP, 5, typeof(DG.Tweening.PathMode));
				int QPYX_arg4_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 6);
				System.Nullable<UnityEngine.Color> QPYX_arg5_YXQP = ToLua.CheckNullable<UnityEngine.Color>(L_YXQP, 7);
				DG.Tweening.Core.TweenerCore<UnityEngine.Vector3,DG.Tweening.Plugins.Core.PathCore.Path,DG.Tweening.Plugins.Options.PathOptions> QPYX_o_YXQP = QPYX_obj_YXQP.DOLocalPath(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Transform.DOLocalPath");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOPath_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3[] QPYX_arg0_YXQP = ToLua.CheckStructArray<UnityEngine.Vector3>(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				DG.Tweening.Core.TweenerCore<UnityEngine.Vector3,DG.Tweening.Plugins.Core.PathCore.Path,DG.Tweening.Plugins.Options.PathOptions> QPYX_o_YXQP = QPYX_obj_YXQP.DOPath(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3[] QPYX_arg0_YXQP = ToLua.CheckStructArray<UnityEngine.Vector3>(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				DG.Tweening.PathType QPYX_arg2_YXQP = (DG.Tweening.PathType)ToLua.CheckObject(L_YXQP, 4, typeof(DG.Tweening.PathType));
				DG.Tweening.Core.TweenerCore<UnityEngine.Vector3,DG.Tweening.Plugins.Core.PathCore.Path,DG.Tweening.Plugins.Options.PathOptions> QPYX_o_YXQP = QPYX_obj_YXQP.DOPath(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3[] QPYX_arg0_YXQP = ToLua.CheckStructArray<UnityEngine.Vector3>(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				DG.Tweening.PathType QPYX_arg2_YXQP = (DG.Tweening.PathType)ToLua.CheckObject(L_YXQP, 4, typeof(DG.Tweening.PathType));
				DG.Tweening.PathMode QPYX_arg3_YXQP = (DG.Tweening.PathMode)ToLua.CheckObject(L_YXQP, 5, typeof(DG.Tweening.PathMode));
				DG.Tweening.Core.TweenerCore<UnityEngine.Vector3,DG.Tweening.Plugins.Core.PathCore.Path,DG.Tweening.Plugins.Options.PathOptions> QPYX_o_YXQP = QPYX_obj_YXQP.DOPath(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 6)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3[] QPYX_arg0_YXQP = ToLua.CheckStructArray<UnityEngine.Vector3>(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				DG.Tweening.PathType QPYX_arg2_YXQP = (DG.Tweening.PathType)ToLua.CheckObject(L_YXQP, 4, typeof(DG.Tweening.PathType));
				DG.Tweening.PathMode QPYX_arg3_YXQP = (DG.Tweening.PathMode)ToLua.CheckObject(L_YXQP, 5, typeof(DG.Tweening.PathMode));
				int QPYX_arg4_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 6);
				DG.Tweening.Core.TweenerCore<UnityEngine.Vector3,DG.Tweening.Plugins.Core.PathCore.Path,DG.Tweening.Plugins.Options.PathOptions> QPYX_o_YXQP = QPYX_obj_YXQP.DOPath(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 7)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3[] QPYX_arg0_YXQP = ToLua.CheckStructArray<UnityEngine.Vector3>(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				DG.Tweening.PathType QPYX_arg2_YXQP = (DG.Tweening.PathType)ToLua.CheckObject(L_YXQP, 4, typeof(DG.Tweening.PathType));
				DG.Tweening.PathMode QPYX_arg3_YXQP = (DG.Tweening.PathMode)ToLua.CheckObject(L_YXQP, 5, typeof(DG.Tweening.PathMode));
				int QPYX_arg4_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 6);
				System.Nullable<UnityEngine.Color> QPYX_arg5_YXQP = ToLua.CheckNullable<UnityEngine.Color>(L_YXQP, 7);
				DG.Tweening.Core.TweenerCore<UnityEngine.Vector3,DG.Tweening.Plugins.Core.PathCore.Path,DG.Tweening.Plugins.Options.PathOptions> QPYX_o_YXQP = QPYX_obj_YXQP.DOPath(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Transform.DOPath");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOLocalJump_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 5)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				float QPYX_arg3_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 5);
				DG.Tweening.Sequence QPYX_o_YXQP = QPYX_obj_YXQP.DOLocalJump(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 6)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				float QPYX_arg3_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 5);
				bool QPYX_arg4_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 6);
				DG.Tweening.Sequence QPYX_o_YXQP = QPYX_obj_YXQP.DOLocalJump(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Transform.DOLocalJump");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOJump_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 5)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				float QPYX_arg3_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 5);
				DG.Tweening.Sequence QPYX_o_YXQP = QPYX_obj_YXQP.DOJump(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 6)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				float QPYX_arg3_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 5);
				bool QPYX_arg4_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 6);
				DG.Tweening.Sequence QPYX_o_YXQP = QPYX_obj_YXQP.DOJump(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Transform.DOJump");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOShakeScale_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOShakeScale(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<UnityEngine.Vector3>(L_YXQP, 3))
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOShakeScale(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<float>(L_YXQP, 3))
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOShakeScale(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<float, int>(L_YXQP, 3))
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOShakeScale(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<UnityEngine.Vector3, int>(L_YXQP, 3))
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOShakeScale(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5 && TypeChecker.CheckTypes<float, int, float>(L_YXQP, 3))
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 5);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOShakeScale(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5 && TypeChecker.CheckTypes<UnityEngine.Vector3, int, float>(L_YXQP, 3))
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 5);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOShakeScale(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 6 && TypeChecker.CheckTypes<UnityEngine.Vector3, int, float, bool>(L_YXQP, 3))
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 5);
				bool QPYX_arg4_YXQP = LuaDLL.lua_toboolean(L_YXQP, 6);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOShakeScale(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 6 && TypeChecker.CheckTypes<float, int, float, bool>(L_YXQP, 3))
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 5);
				bool QPYX_arg4_YXQP = LuaDLL.lua_toboolean(L_YXQP, 6);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOShakeScale(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Transform.DOShakeScale");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOShakeRotation_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOShakeRotation(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<UnityEngine.Vector3>(L_YXQP, 3))
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOShakeRotation(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<float>(L_YXQP, 3))
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOShakeRotation(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<float, int>(L_YXQP, 3))
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOShakeRotation(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<UnityEngine.Vector3, int>(L_YXQP, 3))
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOShakeRotation(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5 && TypeChecker.CheckTypes<float, int, float>(L_YXQP, 3))
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 5);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOShakeRotation(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5 && TypeChecker.CheckTypes<UnityEngine.Vector3, int, float>(L_YXQP, 3))
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 5);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOShakeRotation(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 6 && TypeChecker.CheckTypes<UnityEngine.Vector3, int, float, bool>(L_YXQP, 3))
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 5);
				bool QPYX_arg4_YXQP = LuaDLL.lua_toboolean(L_YXQP, 6);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOShakeRotation(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 6 && TypeChecker.CheckTypes<float, int, float, bool>(L_YXQP, 3))
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 5);
				bool QPYX_arg4_YXQP = LuaDLL.lua_toboolean(L_YXQP, 6);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOShakeRotation(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Transform.DOShakeRotation");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOShakePosition_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOShakePosition(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<UnityEngine.Vector3>(L_YXQP, 3))
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOShakePosition(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<float>(L_YXQP, 3))
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOShakePosition(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<float, int>(L_YXQP, 3))
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOShakePosition(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<UnityEngine.Vector3, int>(L_YXQP, 3))
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOShakePosition(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5 && TypeChecker.CheckTypes<float, int, float>(L_YXQP, 3))
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 5);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOShakePosition(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5 && TypeChecker.CheckTypes<UnityEngine.Vector3, int, float>(L_YXQP, 3))
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 5);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOShakePosition(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 6 && TypeChecker.CheckTypes<UnityEngine.Vector3, int, float, bool>(L_YXQP, 3))
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 5);
				bool QPYX_arg4_YXQP = LuaDLL.lua_toboolean(L_YXQP, 6);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOShakePosition(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 6 && TypeChecker.CheckTypes<float, int, float, bool>(L_YXQP, 3))
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 5);
				bool QPYX_arg4_YXQP = LuaDLL.lua_toboolean(L_YXQP, 6);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOShakePosition(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 7 && TypeChecker.CheckTypes<UnityEngine.Vector3, int, float, bool, bool>(L_YXQP, 3))
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 5);
				bool QPYX_arg4_YXQP = LuaDLL.lua_toboolean(L_YXQP, 6);
				bool QPYX_arg5_YXQP = LuaDLL.lua_toboolean(L_YXQP, 7);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOShakePosition(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 7 && TypeChecker.CheckTypes<float, int, float, bool, bool>(L_YXQP, 3))
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 5);
				bool QPYX_arg4_YXQP = LuaDLL.lua_toboolean(L_YXQP, 6);
				bool QPYX_arg5_YXQP = LuaDLL.lua_toboolean(L_YXQP, 7);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOShakePosition(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP, QPYX_arg5_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Transform.DOShakePosition");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOPunchRotation_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOPunchRotation(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOPunchRotation(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				float QPYX_arg3_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 5);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOPunchRotation(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Transform.DOPunchRotation");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOPunchScale_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOPunchScale(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOPunchScale(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				float QPYX_arg3_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 5);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOPunchScale(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Transform.DOPunchScale");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOPunchPosition_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOPunchPosition(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOPunchPosition(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				float QPYX_arg3_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 5);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOPunchPosition(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 6)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				float QPYX_arg3_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 5);
				bool QPYX_arg4_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 6);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOPunchPosition(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Transform.DOPunchPosition");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOLookAt_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOLookAt(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				DG.Tweening.AxisConstraint QPYX_arg2_YXQP = (DG.Tweening.AxisConstraint)ToLua.CheckObject(L_YXQP, 4, typeof(DG.Tweening.AxisConstraint));
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOLookAt(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				DG.Tweening.AxisConstraint QPYX_arg2_YXQP = (DG.Tweening.AxisConstraint)ToLua.CheckObject(L_YXQP, 4, typeof(DG.Tweening.AxisConstraint));
				System.Nullable<UnityEngine.Vector3> QPYX_arg3_YXQP = ToLua.CheckNullable<UnityEngine.Vector3>(L_YXQP, 5);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOLookAt(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Transform.DOLookAt");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOScaleZ_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOScaleZ(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOScaleY_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOScaleY(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOScaleX_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOScaleX(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOScale_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<UnityEngine.Vector3, float>(L_YXQP, 2))
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOScale(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<float, float>(L_YXQP, 2))
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOScale(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Transform.DOScale");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOLocalRotateQuaternion_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
			UnityEngine.Quaternion QPYX_arg0_YXQP = ToLua.ToQuaternion(L_YXQP, 2);
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOLocalRotateQuaternion(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOLocalRotate_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOLocalRotate(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				DG.Tweening.RotateMode QPYX_arg2_YXQP = (DG.Tweening.RotateMode)ToLua.CheckObject(L_YXQP, 4, typeof(DG.Tweening.RotateMode));
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOLocalRotate(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Transform.DOLocalRotate");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DORotateQuaternion_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
			UnityEngine.Quaternion QPYX_arg0_YXQP = ToLua.ToQuaternion(L_YXQP, 2);
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DORotateQuaternion(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DORotate_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DORotate(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				DG.Tweening.RotateMode QPYX_arg2_YXQP = (DG.Tweening.RotateMode)ToLua.CheckObject(L_YXQP, 4, typeof(DG.Tweening.RotateMode));
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DORotate(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Transform.DORotate");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOLocalMoveZ_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOLocalMoveZ(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				bool QPYX_arg2_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 4);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOLocalMoveZ(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Transform.DOLocalMoveZ");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOLocalMoveY_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOLocalMoveY(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				bool QPYX_arg2_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 4);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOLocalMoveY(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Transform.DOLocalMoveY");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOLocalMoveX_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOLocalMoveX(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				bool QPYX_arg2_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 4);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOLocalMoveX(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Transform.DOLocalMoveX");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOLocalMove_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOLocalMove(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				bool QPYX_arg2_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 4);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOLocalMove(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Transform.DOLocalMove");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOMoveZ_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOMoveZ(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				bool QPYX_arg2_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 4);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOMoveZ(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Transform.DOMoveZ");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOMoveY_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOMoveY(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				bool QPYX_arg2_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 4);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOMoveY(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Transform.DOMoveY");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOMoveX_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOMoveX(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				bool QPYX_arg2_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 4);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOMoveX(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Transform.DOMoveX");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOMove_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOMove(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Transform  QPYX_obj_YXQP  = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 1);
				UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				bool QPYX_arg2_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 4);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOMove(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Transform.DOMove");
			}
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
	static int QPYX_get_position_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Transform QPYX_obj_YXQP = (UnityEngine.Transform)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_ret_YXQP = QPYX_obj_YXQP.position;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index position on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_localPosition_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Transform QPYX_obj_YXQP = (UnityEngine.Transform)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_ret_YXQP = QPYX_obj_YXQP.localPosition;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index localPosition on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_eulerAngles_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Transform QPYX_obj_YXQP = (UnityEngine.Transform)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_ret_YXQP = QPYX_obj_YXQP.eulerAngles;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index eulerAngles on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_localEulerAngles_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Transform QPYX_obj_YXQP = (UnityEngine.Transform)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_ret_YXQP = QPYX_obj_YXQP.localEulerAngles;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index localEulerAngles on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_right_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Transform QPYX_obj_YXQP = (UnityEngine.Transform)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_ret_YXQP = QPYX_obj_YXQP.right;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index right on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_up_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Transform QPYX_obj_YXQP = (UnityEngine.Transform)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_ret_YXQP = QPYX_obj_YXQP.up;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index up on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_forward_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Transform QPYX_obj_YXQP = (UnityEngine.Transform)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_ret_YXQP = QPYX_obj_YXQP.forward;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index forward on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_rotation_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Transform QPYX_obj_YXQP = (UnityEngine.Transform)QPYX_o_YXQP;
			UnityEngine.Quaternion QPYX_ret_YXQP = QPYX_obj_YXQP.rotation;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index rotation on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_localRotation_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Transform QPYX_obj_YXQP = (UnityEngine.Transform)QPYX_o_YXQP;
			UnityEngine.Quaternion QPYX_ret_YXQP = QPYX_obj_YXQP.localRotation;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index localRotation on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_localScale_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Transform QPYX_obj_YXQP = (UnityEngine.Transform)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_ret_YXQP = QPYX_obj_YXQP.localScale;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index localScale on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_parent_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Transform QPYX_obj_YXQP = (UnityEngine.Transform)QPYX_o_YXQP;
			UnityEngine.Transform QPYX_ret_YXQP = QPYX_obj_YXQP.parent;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index parent on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_worldToLocalMatrix_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Transform QPYX_obj_YXQP = (UnityEngine.Transform)QPYX_o_YXQP;
			UnityEngine.Matrix4x4 QPYX_ret_YXQP = QPYX_obj_YXQP.worldToLocalMatrix;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index worldToLocalMatrix on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_localToWorldMatrix_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Transform QPYX_obj_YXQP = (UnityEngine.Transform)QPYX_o_YXQP;
			UnityEngine.Matrix4x4 QPYX_ret_YXQP = QPYX_obj_YXQP.localToWorldMatrix;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index localToWorldMatrix on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_root_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Transform QPYX_obj_YXQP = (UnityEngine.Transform)QPYX_o_YXQP;
			UnityEngine.Transform QPYX_ret_YXQP = QPYX_obj_YXQP.root;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index root on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_childCount_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Transform QPYX_obj_YXQP = (UnityEngine.Transform)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.childCount;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index childCount on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_lossyScale_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Transform QPYX_obj_YXQP = (UnityEngine.Transform)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_ret_YXQP = QPYX_obj_YXQP.lossyScale;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index lossyScale on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_hasChanged_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Transform QPYX_obj_YXQP = (UnityEngine.Transform)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.hasChanged;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index hasChanged on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_hierarchyCapacity_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Transform QPYX_obj_YXQP = (UnityEngine.Transform)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.hierarchyCapacity;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index hierarchyCapacity on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_hierarchyCount_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Transform QPYX_obj_YXQP = (UnityEngine.Transform)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.hierarchyCount;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index hierarchyCount on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_position_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Transform QPYX_obj_YXQP = (UnityEngine.Transform)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
			QPYX_obj_YXQP.position = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index position on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_localPosition_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Transform QPYX_obj_YXQP = (UnityEngine.Transform)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
			QPYX_obj_YXQP.localPosition = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index localPosition on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_eulerAngles_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Transform QPYX_obj_YXQP = (UnityEngine.Transform)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
			QPYX_obj_YXQP.eulerAngles = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index eulerAngles on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_localEulerAngles_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Transform QPYX_obj_YXQP = (UnityEngine.Transform)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
			QPYX_obj_YXQP.localEulerAngles = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index localEulerAngles on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_right_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Transform QPYX_obj_YXQP = (UnityEngine.Transform)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
			QPYX_obj_YXQP.right = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index right on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_up_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Transform QPYX_obj_YXQP = (UnityEngine.Transform)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
			QPYX_obj_YXQP.up = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index up on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_forward_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Transform QPYX_obj_YXQP = (UnityEngine.Transform)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
			QPYX_obj_YXQP.forward = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index forward on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_rotation_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Transform QPYX_obj_YXQP = (UnityEngine.Transform)QPYX_o_YXQP;
			UnityEngine.Quaternion QPYX_arg0_YXQP = ToLua.ToQuaternion(L_YXQP, 2);
			QPYX_obj_YXQP.rotation = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index rotation on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_localRotation_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Transform QPYX_obj_YXQP = (UnityEngine.Transform)QPYX_o_YXQP;
			UnityEngine.Quaternion QPYX_arg0_YXQP = ToLua.ToQuaternion(L_YXQP, 2);
			QPYX_obj_YXQP.localRotation = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index localRotation on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_localScale_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Transform QPYX_obj_YXQP = (UnityEngine.Transform)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
			QPYX_obj_YXQP.localScale = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index localScale on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_parent_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Transform QPYX_obj_YXQP = (UnityEngine.Transform)QPYX_o_YXQP;
			UnityEngine.Transform QPYX_arg0_YXQP = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 2);
			QPYX_obj_YXQP.parent = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index parent on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_hasChanged_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Transform QPYX_obj_YXQP = (UnityEngine.Transform)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.hasChanged = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index hasChanged on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_hierarchyCapacity_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Transform QPYX_obj_YXQP = (UnityEngine.Transform)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.hierarchyCapacity = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index hierarchyCapacity on a nil value");
		}
	}
}

