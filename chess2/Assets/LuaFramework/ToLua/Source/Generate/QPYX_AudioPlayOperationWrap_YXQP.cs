using System;
using LuaInterface;

public class QPYX_AudioPlayOperationWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(AudioPlayOperation), typeof(System.Object));
		L_YXQP.RegFunction("Subscribe", QPYX_Subscribe_YXQP);
		L_YXQP.RegFunction("Play", QPYX_Play_YXQP);
		L_YXQP.RegFunction("Stop", QPYX_Stop_YXQP);
		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("clip", QPYX_get_clip_YXQP, null);
		L_YXQP.RegVar("audioSource", QPYX_get_audioSource_YXQP, null);
		L_YXQP.RegVar("isFinish", QPYX_get_isFinish_YXQP, null);
		L_YXQP.RegVar("isStop", QPYX_get_isStop_YXQP, null);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Subscribe_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			AudioPlayOperation  QPYX_obj_YXQP  = (AudioPlayOperation)ToLua.CheckObject<AudioPlayOperation>(L_YXQP, 1);
			System.Action<AudioPlayOperation> QPYX_arg0_YXQP = (System.Action<AudioPlayOperation>)ToLua.CheckDelegate<System.Action<AudioPlayOperation>>(L_YXQP, 2);
			AudioPlayOperation QPYX_o_YXQP = QPYX_obj_YXQP.Subscribe(QPYX_arg0_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Play_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			AudioPlayOperation  QPYX_obj_YXQP  = (AudioPlayOperation)ToLua.CheckObject<AudioPlayOperation>(L_YXQP, 1);
			AudioPlayOperation QPYX_o_YXQP = QPYX_obj_YXQP.Play();
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Stop_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			AudioPlayOperation  QPYX_obj_YXQP  = (AudioPlayOperation)ToLua.CheckObject<AudioPlayOperation>(L_YXQP, 1);
			AudioPlayOperation QPYX_o_YXQP = QPYX_obj_YXQP.Stop();
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_clip_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			AudioPlayOperation QPYX_obj_YXQP = (AudioPlayOperation)QPYX_o_YXQP;
			UnityEngine.AudioClip QPYX_ret_YXQP = QPYX_obj_YXQP.clip;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index clip on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_audioSource_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			AudioPlayOperation QPYX_obj_YXQP = (AudioPlayOperation)QPYX_o_YXQP;
			UnityEngine.AudioSource QPYX_ret_YXQP = QPYX_obj_YXQP.audioSource;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index audioSource on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isFinish_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			AudioPlayOperation QPYX_obj_YXQP = (AudioPlayOperation)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.isFinish;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isFinish on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isStop_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			AudioPlayOperation QPYX_obj_YXQP = (AudioPlayOperation)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.isStop;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isStop on a nil value");
		}
	}
}

