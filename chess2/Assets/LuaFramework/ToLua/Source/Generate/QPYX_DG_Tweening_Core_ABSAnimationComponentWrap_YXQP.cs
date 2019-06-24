using System;
using LuaInterface;

public class QPYX_DG_Tweening_Core_ABSAnimationComponentWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(DG.Tweening.Core.ABSAnimationComponent), typeof(UnityEngine.MonoBehaviour));
		L_YXQP.RegFunction("DOPlay", QPYX_DOPlay_YXQP);
		L_YXQP.RegFunction("DOPlayBackwards", QPYX_DOPlayBackwards_YXQP);
		L_YXQP.RegFunction("DOPlayForward", QPYX_DOPlayForward_YXQP);
		L_YXQP.RegFunction("DOPause", QPYX_DOPause_YXQP);
		L_YXQP.RegFunction("DOTogglePause", QPYX_DOTogglePause_YXQP);
		L_YXQP.RegFunction("DORewind", QPYX_DORewind_YXQP);
		L_YXQP.RegFunction("DORestart", QPYX_DORestart_YXQP);
		L_YXQP.RegFunction("DOComplete", QPYX_DOComplete_YXQP);
		L_YXQP.RegFunction("DOKill", QPYX_DOKill_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("updateType", QPYX_get_updateType_YXQP, QPYX_set_updateType_YXQP);
		L_YXQP.RegVar("isSpeedBased", QPYX_get_isSpeedBased_YXQP, QPYX_set_isSpeedBased_YXQP);
		L_YXQP.RegVar("hasOnStart", QPYX_get_hasOnStart_YXQP, QPYX_set_hasOnStart_YXQP);
		L_YXQP.RegVar("hasOnPlay", QPYX_get_hasOnPlay_YXQP, QPYX_set_hasOnPlay_YXQP);
		L_YXQP.RegVar("hasOnUpdate", QPYX_get_hasOnUpdate_YXQP, QPYX_set_hasOnUpdate_YXQP);
		L_YXQP.RegVar("hasOnStepComplete", QPYX_get_hasOnStepComplete_YXQP, QPYX_set_hasOnStepComplete_YXQP);
		L_YXQP.RegVar("hasOnComplete", QPYX_get_hasOnComplete_YXQP, QPYX_set_hasOnComplete_YXQP);
		L_YXQP.RegVar("hasOnTweenCreated", QPYX_get_hasOnTweenCreated_YXQP, QPYX_set_hasOnTweenCreated_YXQP);
		L_YXQP.RegVar("hasOnRewind", QPYX_get_hasOnRewind_YXQP, QPYX_set_hasOnRewind_YXQP);
		L_YXQP.RegVar("onStart", QPYX_get_onStart_YXQP, QPYX_set_onStart_YXQP);
		L_YXQP.RegVar("onPlay", QPYX_get_onPlay_YXQP, QPYX_set_onPlay_YXQP);
		L_YXQP.RegVar("onUpdate", QPYX_get_onUpdate_YXQP, QPYX_set_onUpdate_YXQP);
		L_YXQP.RegVar("onStepComplete", QPYX_get_onStepComplete_YXQP, QPYX_set_onStepComplete_YXQP);
		L_YXQP.RegVar("onComplete", QPYX_get_onComplete_YXQP, QPYX_set_onComplete_YXQP);
		L_YXQP.RegVar("onTweenCreated", QPYX_get_onTweenCreated_YXQP, QPYX_set_onTweenCreated_YXQP);
		L_YXQP.RegVar("onRewind", QPYX_get_onRewind_YXQP, QPYX_set_onRewind_YXQP);
		L_YXQP.RegVar("tween", QPYX_get_tween_YXQP, QPYX_set_tween_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOPlay_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			DG.Tweening.Core.ABSAnimationComponent  QPYX_obj_YXQP  = (DG.Tweening.Core.ABSAnimationComponent)ToLua.CheckObject<DG.Tweening.Core.ABSAnimationComponent>(L_YXQP, 1);
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
			DG.Tweening.Core.ABSAnimationComponent  QPYX_obj_YXQP  = (DG.Tweening.Core.ABSAnimationComponent)ToLua.CheckObject<DG.Tweening.Core.ABSAnimationComponent>(L_YXQP, 1);
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
			DG.Tweening.Core.ABSAnimationComponent  QPYX_obj_YXQP  = (DG.Tweening.Core.ABSAnimationComponent)ToLua.CheckObject<DG.Tweening.Core.ABSAnimationComponent>(L_YXQP, 1);
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
			DG.Tweening.Core.ABSAnimationComponent  QPYX_obj_YXQP  = (DG.Tweening.Core.ABSAnimationComponent)ToLua.CheckObject<DG.Tweening.Core.ABSAnimationComponent>(L_YXQP, 1);
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
			DG.Tweening.Core.ABSAnimationComponent  QPYX_obj_YXQP  = (DG.Tweening.Core.ABSAnimationComponent)ToLua.CheckObject<DG.Tweening.Core.ABSAnimationComponent>(L_YXQP, 1);
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
			DG.Tweening.Core.ABSAnimationComponent  QPYX_obj_YXQP  = (DG.Tweening.Core.ABSAnimationComponent)ToLua.CheckObject<DG.Tweening.Core.ABSAnimationComponent>(L_YXQP, 1);
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
				DG.Tweening.Core.ABSAnimationComponent  QPYX_obj_YXQP  = (DG.Tweening.Core.ABSAnimationComponent)ToLua.CheckObject<DG.Tweening.Core.ABSAnimationComponent>(L_YXQP, 1);
				QPYX_obj_YXQP.DORestart();
				return 0;
			}
			else if (QPYX_count_YXQP == 2)
			{
				DG.Tweening.Core.ABSAnimationComponent  QPYX_obj_YXQP  = (DG.Tweening.Core.ABSAnimationComponent)ToLua.CheckObject<DG.Tweening.Core.ABSAnimationComponent>(L_YXQP, 1);
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				QPYX_obj_YXQP.DORestart(QPYX_arg0_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: DG.Tweening.Core.ABSAnimationComponent.DORestart");
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
			DG.Tweening.Core.ABSAnimationComponent  QPYX_obj_YXQP  = (DG.Tweening.Core.ABSAnimationComponent)ToLua.CheckObject<DG.Tweening.Core.ABSAnimationComponent>(L_YXQP, 1);
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
			DG.Tweening.Core.ABSAnimationComponent  QPYX_obj_YXQP  = (DG.Tweening.Core.ABSAnimationComponent)ToLua.CheckObject<DG.Tweening.Core.ABSAnimationComponent>(L_YXQP, 1);
			QPYX_obj_YXQP.DOKill();
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
	static int QPYX_get_updateType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.ABSAnimationComponent QPYX_obj_YXQP = (DG.Tweening.Core.ABSAnimationComponent)QPYX_o_YXQP;
			DG.Tweening.UpdateType QPYX_ret_YXQP = QPYX_obj_YXQP.updateType;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index updateType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isSpeedBased_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.ABSAnimationComponent QPYX_obj_YXQP = (DG.Tweening.Core.ABSAnimationComponent)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.isSpeedBased;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isSpeedBased on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_hasOnStart_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.ABSAnimationComponent QPYX_obj_YXQP = (DG.Tweening.Core.ABSAnimationComponent)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.hasOnStart;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index hasOnStart on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_hasOnPlay_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.ABSAnimationComponent QPYX_obj_YXQP = (DG.Tweening.Core.ABSAnimationComponent)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.hasOnPlay;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index hasOnPlay on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_hasOnUpdate_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.ABSAnimationComponent QPYX_obj_YXQP = (DG.Tweening.Core.ABSAnimationComponent)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.hasOnUpdate;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index hasOnUpdate on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_hasOnStepComplete_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.ABSAnimationComponent QPYX_obj_YXQP = (DG.Tweening.Core.ABSAnimationComponent)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.hasOnStepComplete;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index hasOnStepComplete on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_hasOnComplete_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.ABSAnimationComponent QPYX_obj_YXQP = (DG.Tweening.Core.ABSAnimationComponent)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.hasOnComplete;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index hasOnComplete on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_hasOnTweenCreated_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.ABSAnimationComponent QPYX_obj_YXQP = (DG.Tweening.Core.ABSAnimationComponent)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.hasOnTweenCreated;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index hasOnTweenCreated on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_hasOnRewind_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.ABSAnimationComponent QPYX_obj_YXQP = (DG.Tweening.Core.ABSAnimationComponent)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.hasOnRewind;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index hasOnRewind on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onStart_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.ABSAnimationComponent QPYX_obj_YXQP = (DG.Tweening.Core.ABSAnimationComponent)QPYX_o_YXQP;
			UnityEngine.Events.UnityEvent QPYX_ret_YXQP = QPYX_obj_YXQP.onStart;
			ToLua.PushObject(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onStart on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onPlay_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.ABSAnimationComponent QPYX_obj_YXQP = (DG.Tweening.Core.ABSAnimationComponent)QPYX_o_YXQP;
			UnityEngine.Events.UnityEvent QPYX_ret_YXQP = QPYX_obj_YXQP.onPlay;
			ToLua.PushObject(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onPlay on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onUpdate_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.ABSAnimationComponent QPYX_obj_YXQP = (DG.Tweening.Core.ABSAnimationComponent)QPYX_o_YXQP;
			UnityEngine.Events.UnityEvent QPYX_ret_YXQP = QPYX_obj_YXQP.onUpdate;
			ToLua.PushObject(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onUpdate on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onStepComplete_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.ABSAnimationComponent QPYX_obj_YXQP = (DG.Tweening.Core.ABSAnimationComponent)QPYX_o_YXQP;
			UnityEngine.Events.UnityEvent QPYX_ret_YXQP = QPYX_obj_YXQP.onStepComplete;
			ToLua.PushObject(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onStepComplete on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onComplete_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.ABSAnimationComponent QPYX_obj_YXQP = (DG.Tweening.Core.ABSAnimationComponent)QPYX_o_YXQP;
			UnityEngine.Events.UnityEvent QPYX_ret_YXQP = QPYX_obj_YXQP.onComplete;
			ToLua.PushObject(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onComplete on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onTweenCreated_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.ABSAnimationComponent QPYX_obj_YXQP = (DG.Tweening.Core.ABSAnimationComponent)QPYX_o_YXQP;
			UnityEngine.Events.UnityEvent QPYX_ret_YXQP = QPYX_obj_YXQP.onTweenCreated;
			ToLua.PushObject(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onTweenCreated on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onRewind_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.ABSAnimationComponent QPYX_obj_YXQP = (DG.Tweening.Core.ABSAnimationComponent)QPYX_o_YXQP;
			UnityEngine.Events.UnityEvent QPYX_ret_YXQP = QPYX_obj_YXQP.onRewind;
			ToLua.PushObject(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onRewind on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_tween_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.ABSAnimationComponent QPYX_obj_YXQP = (DG.Tweening.Core.ABSAnimationComponent)QPYX_o_YXQP;
			DG.Tweening.Tween QPYX_ret_YXQP = QPYX_obj_YXQP.tween;
			ToLua.PushObject(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index tween on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_updateType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.ABSAnimationComponent QPYX_obj_YXQP = (DG.Tweening.Core.ABSAnimationComponent)QPYX_o_YXQP;
			DG.Tweening.UpdateType QPYX_arg0_YXQP = (DG.Tweening.UpdateType)ToLua.CheckObject(L_YXQP, 2, typeof(DG.Tweening.UpdateType));
			QPYX_obj_YXQP.updateType = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index updateType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_isSpeedBased_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.ABSAnimationComponent QPYX_obj_YXQP = (DG.Tweening.Core.ABSAnimationComponent)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.isSpeedBased = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isSpeedBased on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_hasOnStart_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.ABSAnimationComponent QPYX_obj_YXQP = (DG.Tweening.Core.ABSAnimationComponent)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.hasOnStart = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index hasOnStart on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_hasOnPlay_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.ABSAnimationComponent QPYX_obj_YXQP = (DG.Tweening.Core.ABSAnimationComponent)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.hasOnPlay = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index hasOnPlay on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_hasOnUpdate_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.ABSAnimationComponent QPYX_obj_YXQP = (DG.Tweening.Core.ABSAnimationComponent)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.hasOnUpdate = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index hasOnUpdate on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_hasOnStepComplete_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.ABSAnimationComponent QPYX_obj_YXQP = (DG.Tweening.Core.ABSAnimationComponent)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.hasOnStepComplete = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index hasOnStepComplete on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_hasOnComplete_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.ABSAnimationComponent QPYX_obj_YXQP = (DG.Tweening.Core.ABSAnimationComponent)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.hasOnComplete = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index hasOnComplete on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_hasOnTweenCreated_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.ABSAnimationComponent QPYX_obj_YXQP = (DG.Tweening.Core.ABSAnimationComponent)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.hasOnTweenCreated = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index hasOnTweenCreated on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_hasOnRewind_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.ABSAnimationComponent QPYX_obj_YXQP = (DG.Tweening.Core.ABSAnimationComponent)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.hasOnRewind = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index hasOnRewind on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onStart_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.ABSAnimationComponent QPYX_obj_YXQP = (DG.Tweening.Core.ABSAnimationComponent)QPYX_o_YXQP;
			UnityEngine.Events.UnityEvent QPYX_arg0_YXQP = (UnityEngine.Events.UnityEvent)ToLua.CheckObject<UnityEngine.Events.UnityEvent>(L_YXQP, 2);
			QPYX_obj_YXQP.onStart = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onStart on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onPlay_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.ABSAnimationComponent QPYX_obj_YXQP = (DG.Tweening.Core.ABSAnimationComponent)QPYX_o_YXQP;
			UnityEngine.Events.UnityEvent QPYX_arg0_YXQP = (UnityEngine.Events.UnityEvent)ToLua.CheckObject<UnityEngine.Events.UnityEvent>(L_YXQP, 2);
			QPYX_obj_YXQP.onPlay = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onPlay on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onUpdate_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.ABSAnimationComponent QPYX_obj_YXQP = (DG.Tweening.Core.ABSAnimationComponent)QPYX_o_YXQP;
			UnityEngine.Events.UnityEvent QPYX_arg0_YXQP = (UnityEngine.Events.UnityEvent)ToLua.CheckObject<UnityEngine.Events.UnityEvent>(L_YXQP, 2);
			QPYX_obj_YXQP.onUpdate = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onUpdate on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onStepComplete_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.ABSAnimationComponent QPYX_obj_YXQP = (DG.Tweening.Core.ABSAnimationComponent)QPYX_o_YXQP;
			UnityEngine.Events.UnityEvent QPYX_arg0_YXQP = (UnityEngine.Events.UnityEvent)ToLua.CheckObject<UnityEngine.Events.UnityEvent>(L_YXQP, 2);
			QPYX_obj_YXQP.onStepComplete = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onStepComplete on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onComplete_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.ABSAnimationComponent QPYX_obj_YXQP = (DG.Tweening.Core.ABSAnimationComponent)QPYX_o_YXQP;
			UnityEngine.Events.UnityEvent QPYX_arg0_YXQP = (UnityEngine.Events.UnityEvent)ToLua.CheckObject<UnityEngine.Events.UnityEvent>(L_YXQP, 2);
			QPYX_obj_YXQP.onComplete = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onComplete on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onTweenCreated_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.ABSAnimationComponent QPYX_obj_YXQP = (DG.Tweening.Core.ABSAnimationComponent)QPYX_o_YXQP;
			UnityEngine.Events.UnityEvent QPYX_arg0_YXQP = (UnityEngine.Events.UnityEvent)ToLua.CheckObject<UnityEngine.Events.UnityEvent>(L_YXQP, 2);
			QPYX_obj_YXQP.onTweenCreated = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onTweenCreated on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onRewind_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.ABSAnimationComponent QPYX_obj_YXQP = (DG.Tweening.Core.ABSAnimationComponent)QPYX_o_YXQP;
			UnityEngine.Events.UnityEvent QPYX_arg0_YXQP = (UnityEngine.Events.UnityEvent)ToLua.CheckObject<UnityEngine.Events.UnityEvent>(L_YXQP, 2);
			QPYX_obj_YXQP.onRewind = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index onRewind on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_tween_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			DG.Tweening.Core.ABSAnimationComponent QPYX_obj_YXQP = (DG.Tweening.Core.ABSAnimationComponent)QPYX_o_YXQP;
			DG.Tweening.Tween QPYX_arg0_YXQP = (DG.Tweening.Tween)ToLua.CheckObject<DG.Tweening.Tween>(L_YXQP, 2);
			QPYX_obj_YXQP.tween = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index tween on a nil value");
		}
	}
}

