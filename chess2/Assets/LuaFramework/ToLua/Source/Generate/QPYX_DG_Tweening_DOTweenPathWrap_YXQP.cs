using System;
using LuaInterface;

public class QPYX_DG_Tweening_DOTweenPathWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(DG.Tweening.DOTweenPath), typeof(DG.Tweening.Core.ABSAnimationComponent));
		L_YXQP.RegFunction("DOPlay", QPYX_DOPlay_YXQP);
		L_YXQP.RegFunction("DOPlayBackwards", QPYX_DOPlayBackwards_YXQP);
		L_YXQP.RegFunction("DOPlayForward", QPYX_DOPlayForward_YXQP);
		L_YXQP.RegFunction("DOPause", QPYX_DOPause_YXQP);
		L_YXQP.RegFunction("DOTogglePause", QPYX_DOTogglePause_YXQP);
		L_YXQP.RegFunction("DORewind", QPYX_DORewind_YXQP);
		L_YXQP.RegFunction("DORestart", QPYX_DORestart_YXQP);
		L_YXQP.RegFunction("DOComplete", QPYX_DOComplete_YXQP);
		L_YXQP.RegFunction("DOKill", QPYX_DOKill_YXQP);
		L_YXQP.RegFunction("GetTween", QPYX_GetTween_YXQP);
		L_YXQP.RegFunction("GetDrawPoints", QPYX_GetDrawPoints_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("delay", QPYX_get_delay_YXQP, QPYX_set_delay_YXQP);
		L_YXQP.RegVar("duration", QPYX_get_duration_YXQP, QPYX_set_duration_YXQP);
		L_YXQP.RegVar("easeType", QPYX_get_easeType_YXQP, QPYX_set_easeType_YXQP);
		L_YXQP.RegVar("easeCurve", QPYX_get_easeCurve_YXQP, QPYX_set_easeCurve_YXQP);
		L_YXQP.RegVar("loops", QPYX_get_loops_YXQP, QPYX_set_loops_YXQP);
		L_YXQP.RegVar("id", QPYX_get_id_YXQP, QPYX_set_id_YXQP);
		L_YXQP.RegVar("loopType", QPYX_get_loopType_YXQP, QPYX_set_loopType_YXQP);
		L_YXQP.RegVar("orientType", QPYX_get_orientType_YXQP, QPYX_set_orientType_YXQP);
		L_YXQP.RegVar("lookAtTransform", QPYX_get_lookAtTransform_YXQP, QPYX_set_lookAtTransform_YXQP);
		L_YXQP.RegVar("lookAtPosition", QPYX_get_lookAtPosition_YXQP, QPYX_set_lookAtPosition_YXQP);
		L_YXQP.RegVar("lookAhead", QPYX_get_lookAhead_YXQP, QPYX_set_lookAhead_YXQP);
		L_YXQP.RegVar("autoPlay", QPYX_get_autoPlay_YXQP, QPYX_set_autoPlay_YXQP);
		L_YXQP.RegVar("autoKill", QPYX_get_autoKill_YXQP, QPYX_set_autoKill_YXQP);
		L_YXQP.RegVar("relative", QPYX_get_relative_YXQP, QPYX_set_relative_YXQP);
		L_YXQP.RegVar("isLocal", QPYX_get_isLocal_YXQP, QPYX_set_isLocal_YXQP);
		L_YXQP.RegVar("isClosedPath", QPYX_get_isClosedPath_YXQP, QPYX_set_isClosedPath_YXQP);
		L_YXQP.RegVar("pathResolution", QPYX_get_pathResolution_YXQP, QPYX_set_pathResolution_YXQP);
		L_YXQP.RegVar("pathMode", QPYX_get_pathMode_YXQP, QPYX_set_pathMode_YXQP);
		L_YXQP.RegVar("lockRotation", QPYX_get_lockRotation_YXQP, QPYX_set_lockRotation_YXQP);
		L_YXQP.RegVar("assignForwardAndUp", QPYX_get_assignForwardAndUp_YXQP, QPYX_set_assignForwardAndUp_YXQP);
		L_YXQP.RegVar("forwardDirection", QPYX_get_forwardDirection_YXQP, QPYX_set_forwardDirection_YXQP);
		L_YXQP.RegVar("upDirection", QPYX_get_upDirection_YXQP, QPYX_set_upDirection_YXQP);
		L_YXQP.RegVar("tweenRigidbody", QPYX_get_tweenRigidbody_YXQP, QPYX_set_tweenRigidbody_YXQP);
		L_YXQP.RegVar("wps", QPYX_get_wps_YXQP, QPYX_set_wps_YXQP);
		L_YXQP.RegVar("fullWps", QPYX_get_fullWps_YXQP, QPYX_set_fullWps_YXQP);
		L_YXQP.RegVar("path", QPYX_get_path_YXQP, QPYX_set_path_YXQP);
		L_YXQP.RegVar("inspectorMode", QPYX_get_inspectorMode_YXQP, QPYX_set_inspectorMode_YXQP);
		L_YXQP.RegVar("pathType", QPYX_get_pathType_YXQP, QPYX_set_pathType_YXQP);
		L_YXQP.RegVar("handlesType", QPYX_get_handlesType_YXQP, QPYX_set_handlesType_YXQP);
		L_YXQP.RegVar("livePreview", QPYX_get_livePreview_YXQP, QPYX_set_livePreview_YXQP);
		L_YXQP.RegVar("handlesDrawMode", QPYX_get_handlesDrawMode_YXQP, QPYX_set_handlesDrawMode_YXQP);
		L_YXQP.RegVar("perspectiveHandleSize", QPYX_get_perspectiveHandleSize_YXQP, QPYX_set_perspectiveHandleSize_YXQP);
		L_YXQP.RegVar("showIndexes", QPYX_get_showIndexes_YXQP, QPYX_set_showIndexes_YXQP);
		L_YXQP.RegVar("showWpLength", QPYX_get_showWpLength_YXQP, QPYX_set_showWpLength_YXQP);
		L_YXQP.RegVar("pathColor", QPYX_get_pathColor_YXQP, QPYX_set_pathColor_YXQP);
		L_YXQP.RegVar("lastSrcPosition", QPYX_get_lastSrcPosition_YXQP, QPYX_set_lastSrcPosition_YXQP);
		L_YXQP.RegVar("wpsDropdown", QPYX_get_wpsDropdown_YXQP, QPYX_set_wpsDropdown_YXQP);
		L_YXQP.RegVar("dropToFloorOffset", QPYX_get_dropToFloorOffset_YXQP, QPYX_set_dropToFloorOffset_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOPlay_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DG.Tweening.DOTweenPath  QPYX_obj_YXQP  = (DG.Tweening.DOTweenPath)ToLua.CheckObject<DG.Tweening.DOTweenPath>(L_YXQP, 1);
			QPYX_obj_YXQP.DOPlay();
			return 0;
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
			DG.Tweening.DOTweenPath  QPYX_obj_YXQP  = (DG.Tweening.DOTweenPath)ToLua.CheckObject<DG.Tweening.DOTweenPath>(L_YXQP, 1);
			QPYX_obj_YXQP.DOPlayBackwards();
			return 0;
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
			DG.Tweening.DOTweenPath  QPYX_obj_YXQP  = (DG.Tweening.DOTweenPath)ToLua.CheckObject<DG.Tweening.DOTweenPath>(L_YXQP, 1);
			QPYX_obj_YXQP.DOPlayForward();
			return 0;
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
			DG.Tweening.DOTweenPath  QPYX_obj_YXQP  = (DG.Tweening.DOTweenPath)ToLua.CheckObject<DG.Tweening.DOTweenPath>(L_YXQP, 1);
			QPYX_obj_YXQP.DOPause();
			return 0;
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
			DG.Tweening.DOTweenPath  QPYX_obj_YXQP  = (DG.Tweening.DOTweenPath)ToLua.CheckObject<DG.Tweening.DOTweenPath>(L_YXQP, 1);
			QPYX_obj_YXQP.DOTogglePause();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DORewind_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DG.Tweening.DOTweenPath  QPYX_obj_YXQP  = (DG.Tweening.DOTweenPath)ToLua.CheckObject<DG.Tweening.DOTweenPath>(L_YXQP, 1);
			QPYX_obj_YXQP.DORewind();
			return 0;
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
				DG.Tweening.DOTweenPath  QPYX_obj_YXQP  = (DG.Tweening.DOTweenPath)ToLua.CheckObject<DG.Tweening.DOTweenPath>(L_YXQP, 1);
				QPYX_obj_YXQP.DORestart();
				return 0;
			}
			else if (QPYX_count_YXQP == 2)
			{
				DG.Tweening.DOTweenPath  QPYX_obj_YXQP  = (DG.Tweening.DOTweenPath)ToLua.CheckObject<DG.Tweening.DOTweenPath>(L_YXQP, 1);
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				QPYX_obj_YXQP.DORestart(QPYX_arg0_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.DOTweenPath.DORestart");
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
			ToLua.CheckArgsCount(L_YXQP, 1);
			DG.Tweening.DOTweenPath  QPYX_obj_YXQP  = (DG.Tweening.DOTweenPath)ToLua.CheckObject<DG.Tweening.DOTweenPath>(L_YXQP, 1);
			QPYX_obj_YXQP.DOComplete();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOKill_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DG.Tweening.DOTweenPath  QPYX_obj_YXQP  = (DG.Tweening.DOTweenPath)ToLua.CheckObject<DG.Tweening.DOTweenPath>(L_YXQP, 1);
			QPYX_obj_YXQP.DOKill();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetTween_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DG.Tweening.DOTweenPath  QPYX_obj_YXQP  = (DG.Tweening.DOTweenPath)ToLua.CheckObject<DG.Tweening.DOTweenPath>(L_YXQP, 1);
			DG.Tweening.Tween QPYX_o_YXQP = QPYX_obj_YXQP.GetTween();
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetDrawPoints_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DG.Tweening.DOTweenPath  QPYX_obj_YXQP  = (DG.Tweening.DOTweenPath)ToLua.CheckObject<DG.Tweening.DOTweenPath>(L_YXQP, 1);
			UnityEngine.Vector3[] QPYX_o_YXQP = QPYX_obj_YXQP.GetDrawPoints();
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
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
	static int QPYX_get_delay_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.delay;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index delay on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_duration_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.duration;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index duration on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_easeType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			DG.Tweening.Ease QPYX_ret_YXQP = QPYX_obj_YXQP.easeType;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index easeType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_easeCurve_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			UnityEngine.AnimationCurve QPYX_ret_YXQP = QPYX_obj_YXQP.easeCurve;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index easeCurve on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_loops_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.loops;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index loops on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_id_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			string QPYX_ret_YXQP = QPYX_obj_YXQP.id;
			LuaDLL.lua_pushstring(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index id on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_loopType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			DG.Tweening.LoopType QPYX_ret_YXQP = QPYX_obj_YXQP.loopType;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index loopType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_orientType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			DG.Tweening.Plugins.Options.OrientType QPYX_ret_YXQP = QPYX_obj_YXQP.orientType;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index orientType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_lookAtTransform_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			UnityEngine.Transform QPYX_ret_YXQP = QPYX_obj_YXQP.lookAtTransform;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index lookAtTransform on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_lookAtPosition_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_ret_YXQP = QPYX_obj_YXQP.lookAtPosition;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index lookAtPosition on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_lookAhead_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.lookAhead;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index lookAhead on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_autoPlay_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.autoPlay;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index autoPlay on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_autoKill_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.autoKill;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index autoKill on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_relative_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.relative;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index relative on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isLocal_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.isLocal;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isLocal on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isClosedPath_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.isClosedPath;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isClosedPath on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_pathResolution_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.pathResolution;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index pathResolution on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_pathMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			DG.Tweening.PathMode QPYX_ret_YXQP = QPYX_obj_YXQP.pathMode;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index pathMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_lockRotation_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			DG.Tweening.AxisConstraint QPYX_ret_YXQP = QPYX_obj_YXQP.lockRotation;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index lockRotation on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_assignForwardAndUp_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.assignForwardAndUp;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index assignForwardAndUp on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_forwardDirection_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_ret_YXQP = QPYX_obj_YXQP.forwardDirection;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index forwardDirection on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_upDirection_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_ret_YXQP = QPYX_obj_YXQP.upDirection;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index upDirection on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_tweenRigidbody_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.tweenRigidbody;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index tweenRigidbody on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_wps_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			System.Collections.Generic.List<UnityEngine.Vector3> QPYX_ret_YXQP = QPYX_obj_YXQP.wps;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index wps on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_fullWps_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			System.Collections.Generic.List<UnityEngine.Vector3> QPYX_ret_YXQP = QPYX_obj_YXQP.fullWps;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index fullWps on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_path_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			DG.Tweening.Plugins.Core.PathCore.Path QPYX_ret_YXQP = QPYX_obj_YXQP.path;
			ToLua.PushObject(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index path on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_inspectorMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			DG.Tweening.DOTweenInspectorMode QPYX_ret_YXQP = QPYX_obj_YXQP.inspectorMode;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index inspectorMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_pathType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			DG.Tweening.PathType QPYX_ret_YXQP = QPYX_obj_YXQP.pathType;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index pathType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_handlesType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			DG.Tweening.HandlesType QPYX_ret_YXQP = QPYX_obj_YXQP.handlesType;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index handlesType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_livePreview_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.livePreview;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index livePreview on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_handlesDrawMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			DG.Tweening.HandlesDrawMode QPYX_ret_YXQP = QPYX_obj_YXQP.handlesDrawMode;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index handlesDrawMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_perspectiveHandleSize_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.perspectiveHandleSize;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index perspectiveHandleSize on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_showIndexes_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.showIndexes;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index showIndexes on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_showWpLength_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.showWpLength;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index showWpLength on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_pathColor_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			UnityEngine.Color QPYX_ret_YXQP = QPYX_obj_YXQP.pathColor;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index pathColor on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_lastSrcPosition_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_ret_YXQP = QPYX_obj_YXQP.lastSrcPosition;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index lastSrcPosition on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_wpsDropdown_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.wpsDropdown;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index wpsDropdown on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_dropToFloorOffset_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.dropToFloorOffset;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index dropToFloorOffset on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_delay_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.delay = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index delay on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_duration_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.duration = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index duration on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_easeType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			DG.Tweening.Ease QPYX_arg0_YXQP = (DG.Tweening.Ease)ToLua.CheckObject(L_YXQP, 2, typeof(DG.Tweening.Ease));
			QPYX_obj_YXQP.easeType = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index easeType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_easeCurve_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			UnityEngine.AnimationCurve QPYX_arg0_YXQP = (UnityEngine.AnimationCurve)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.AnimationCurve));
			QPYX_obj_YXQP.easeCurve = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index easeCurve on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_loops_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.loops = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index loops on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_id_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.id = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index id on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_loopType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			DG.Tweening.LoopType QPYX_arg0_YXQP = (DG.Tweening.LoopType)ToLua.CheckObject(L_YXQP, 2, typeof(DG.Tweening.LoopType));
			QPYX_obj_YXQP.loopType = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index loopType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_orientType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			DG.Tweening.Plugins.Options.OrientType QPYX_arg0_YXQP = (DG.Tweening.Plugins.Options.OrientType)ToLua.CheckObject(L_YXQP, 2, typeof(DG.Tweening.Plugins.Options.OrientType));
			QPYX_obj_YXQP.orientType = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index orientType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_lookAtTransform_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			UnityEngine.Transform QPYX_arg0_YXQP = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 2);
			QPYX_obj_YXQP.lookAtTransform = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index lookAtTransform on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_lookAtPosition_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
			QPYX_obj_YXQP.lookAtPosition = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index lookAtPosition on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_lookAhead_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.lookAhead = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index lookAhead on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_autoPlay_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.autoPlay = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index autoPlay on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_autoKill_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.autoKill = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index autoKill on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_relative_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.relative = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index relative on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_isLocal_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.isLocal = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isLocal on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_isClosedPath_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.isClosedPath = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isClosedPath on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_pathResolution_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.pathResolution = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index pathResolution on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_pathMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			DG.Tweening.PathMode QPYX_arg0_YXQP = (DG.Tweening.PathMode)ToLua.CheckObject(L_YXQP, 2, typeof(DG.Tweening.PathMode));
			QPYX_obj_YXQP.pathMode = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index pathMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_lockRotation_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			DG.Tweening.AxisConstraint QPYX_arg0_YXQP = (DG.Tweening.AxisConstraint)ToLua.CheckObject(L_YXQP, 2, typeof(DG.Tweening.AxisConstraint));
			QPYX_obj_YXQP.lockRotation = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index lockRotation on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_assignForwardAndUp_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.assignForwardAndUp = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index assignForwardAndUp on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_forwardDirection_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
			QPYX_obj_YXQP.forwardDirection = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index forwardDirection on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_upDirection_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
			QPYX_obj_YXQP.upDirection = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index upDirection on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_tweenRigidbody_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.tweenRigidbody = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index tweenRigidbody on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_wps_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			System.Collections.Generic.List<UnityEngine.Vector3> QPYX_arg0_YXQP = (System.Collections.Generic.List<UnityEngine.Vector3>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<UnityEngine.Vector3>));
			QPYX_obj_YXQP.wps = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index wps on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_fullWps_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			System.Collections.Generic.List<UnityEngine.Vector3> QPYX_arg0_YXQP = (System.Collections.Generic.List<UnityEngine.Vector3>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<UnityEngine.Vector3>));
			QPYX_obj_YXQP.fullWps = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index fullWps on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_path_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			DG.Tweening.Plugins.Core.PathCore.Path QPYX_arg0_YXQP = (DG.Tweening.Plugins.Core.PathCore.Path)ToLua.CheckObject<DG.Tweening.Plugins.Core.PathCore.Path>(L_YXQP, 2);
			QPYX_obj_YXQP.path = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index path on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_inspectorMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			DG.Tweening.DOTweenInspectorMode QPYX_arg0_YXQP = (DG.Tweening.DOTweenInspectorMode)ToLua.CheckObject(L_YXQP, 2, typeof(DG.Tweening.DOTweenInspectorMode));
			QPYX_obj_YXQP.inspectorMode = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index inspectorMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_pathType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			DG.Tweening.PathType QPYX_arg0_YXQP = (DG.Tweening.PathType)ToLua.CheckObject(L_YXQP, 2, typeof(DG.Tweening.PathType));
			QPYX_obj_YXQP.pathType = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index pathType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_handlesType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			DG.Tweening.HandlesType QPYX_arg0_YXQP = (DG.Tweening.HandlesType)ToLua.CheckObject(L_YXQP, 2, typeof(DG.Tweening.HandlesType));
			QPYX_obj_YXQP.handlesType = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index handlesType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_livePreview_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.livePreview = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index livePreview on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_handlesDrawMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			DG.Tweening.HandlesDrawMode QPYX_arg0_YXQP = (DG.Tweening.HandlesDrawMode)ToLua.CheckObject(L_YXQP, 2, typeof(DG.Tweening.HandlesDrawMode));
			QPYX_obj_YXQP.handlesDrawMode = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index handlesDrawMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_perspectiveHandleSize_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.perspectiveHandleSize = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index perspectiveHandleSize on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_showIndexes_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.showIndexes = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index showIndexes on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_showWpLength_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.showWpLength = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index showWpLength on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_pathColor_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			UnityEngine.Color QPYX_arg0_YXQP = ToLua.ToColor(L_YXQP, 2);
			QPYX_obj_YXQP.pathColor = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index pathColor on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_lastSrcPosition_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
			QPYX_obj_YXQP.lastSrcPosition = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index lastSrcPosition on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_wpsDropdown_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.wpsDropdown = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index wpsDropdown on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_dropToFloorOffset_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.DOTweenPath QPYX_obj_YXQP = (DG.Tweening.DOTweenPath)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.dropToFloorOffset = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index dropToFloorOffset on a nil value");
		}
	}
}

