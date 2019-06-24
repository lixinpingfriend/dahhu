using System;
using LuaInterface;

public class QPYX_UnityEngine_AnimationWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.Animation), typeof(UnityEngine.Behaviour));
		L_YXQP.RegFunction("Stop", QPYX_Stop_YXQP);
		L_YXQP.RegFunction("Rewind", QPYX_Rewind_YXQP);
		L_YXQP.RegFunction("Sample", QPYX_Sample_YXQP);
		L_YXQP.RegFunction("IsPlaying", QPYX_IsPlaying_YXQP);
		L_YXQP.RegFunction("get_Item", QPYX_get_Item_YXQP);
		L_YXQP.RegFunction("Play", QPYX_Play_YXQP);
		L_YXQP.RegFunction("CrossFade", QPYX_CrossFade_YXQP);
		L_YXQP.RegFunction("Blend", QPYX_Blend_YXQP);
		L_YXQP.RegFunction("CrossFadeQueued", QPYX_CrossFadeQueued_YXQP);
		L_YXQP.RegFunction("PlayQueued", QPYX_PlayQueued_YXQP);
		L_YXQP.RegFunction("AddClip", QPYX_AddClip_YXQP);
		L_YXQP.RegFunction("RemoveClip", QPYX_RemoveClip_YXQP);
		L_YXQP.RegFunction("GetClipCount", QPYX_GetClipCount_YXQP);
		L_YXQP.RegFunction("SyncLayer", QPYX_SyncLayer_YXQP);
		L_YXQP.RegFunction("GetEnumerator", QPYX_GetEnumerator_YXQP);
		L_YXQP.RegFunction("GetClip", QPYX_GetClip_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateUnityEngine_Animation_YXQP);
		L_YXQP.RegVar("this", QPYX__this_YXQP, null);		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("clip", QPYX_get_clip_YXQP, QPYX_set_clip_YXQP);
		L_YXQP.RegVar("playAutomatically", QPYX_get_playAutomatically_YXQP, QPYX_set_playAutomatically_YXQP);
		L_YXQP.RegVar("wrapMode", QPYX_get_wrapMode_YXQP, QPYX_set_wrapMode_YXQP);
		L_YXQP.RegVar("isPlaying", QPYX_get_isPlaying_YXQP, null);
		L_YXQP.RegVar("animatePhysics", QPYX_get_animatePhysics_YXQP, QPYX_set_animatePhysics_YXQP);
		L_YXQP.RegVar("cullingType", QPYX_get_cullingType_YXQP, QPYX_set_cullingType_YXQP);
		L_YXQP.RegVar("localBounds", QPYX_get_localBounds_YXQP, QPYX_set_localBounds_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUnityEngine_Animation_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				UnityEngine.Animation QPYX_obj_YXQP = new UnityEngine.Animation();
				ToLua.PushSealed(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UnityEngine.Animation.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int _get_this(IntPtr L_YXQP)	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Animation  QPYX_obj_YXQP  = (UnityEngine.Animation)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animation));
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			UnityEngine.AnimationState QPYX_o_YXQP = QPYX_obj_YXQP[QPYX_arg0_YXQP];
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
			return 1;

		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__this_YXQP(IntPtr L_YXQP)	{
		try
		{
			LuaDLL.lua_pushvalue(L_YXQP, 1);			LuaDLL.tolua_bindthis(L_YXQP, _get_this, null);
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
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				UnityEngine.Animation  QPYX_obj_YXQP  = (UnityEngine.Animation)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animation));
				QPYX_obj_YXQP.Stop();
				return 0;
			}
			else if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Animation  QPYX_obj_YXQP  = (UnityEngine.Animation)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animation));
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				QPYX_obj_YXQP.Stop(QPYX_arg0_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Animation.Stop");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Rewind_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				UnityEngine.Animation  QPYX_obj_YXQP  = (UnityEngine.Animation)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animation));
				QPYX_obj_YXQP.Rewind();
				return 0;
			}
			else if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Animation  QPYX_obj_YXQP  = (UnityEngine.Animation)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animation));
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				QPYX_obj_YXQP.Rewind(QPYX_arg0_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Animation.Rewind");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Sample_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Animation  QPYX_obj_YXQP  = (UnityEngine.Animation)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animation));
			QPYX_obj_YXQP.Sample();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_IsPlaying_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Animation  QPYX_obj_YXQP  = (UnityEngine.Animation)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animation));
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			bool QPYX_o_YXQP = QPYX_obj_YXQP.IsPlaying(QPYX_arg0_YXQP);
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_Item_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Animation  QPYX_obj_YXQP  = (UnityEngine.Animation)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animation));
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			UnityEngine.AnimationState QPYX_o_YXQP = QPYX_obj_YXQP[QPYX_arg0_YXQP];
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
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
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 1)
			{
				UnityEngine.Animation  QPYX_obj_YXQP  = (UnityEngine.Animation)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animation));
				bool QPYX_o_YXQP = QPYX_obj_YXQP.Play();
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<string>(L_YXQP, 2))
			{
				UnityEngine.Animation  QPYX_obj_YXQP  = (UnityEngine.Animation)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animation));
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				bool QPYX_o_YXQP = QPYX_obj_YXQP.Play(QPYX_arg0_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<UnityEngine.PlayMode>(L_YXQP, 2))
			{
				UnityEngine.Animation  QPYX_obj_YXQP  = (UnityEngine.Animation)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animation));
				UnityEngine.PlayMode QPYX_arg0_YXQP = (UnityEngine.PlayMode)ToLua.ToObject(L_YXQP, 2);
				bool QPYX_o_YXQP = QPYX_obj_YXQP.Play(QPYX_arg0_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Animation  QPYX_obj_YXQP  = (UnityEngine.Animation)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animation));
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				UnityEngine.PlayMode QPYX_arg1_YXQP = (UnityEngine.PlayMode)ToLua.CheckObject(L_YXQP, 3, typeof(UnityEngine.PlayMode));
				bool QPYX_o_YXQP = QPYX_obj_YXQP.Play(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Animation.Play");
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
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Animation  QPYX_obj_YXQP  = (UnityEngine.Animation)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animation));
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				QPYX_obj_YXQP.CrossFade(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Animation  QPYX_obj_YXQP  = (UnityEngine.Animation)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animation));
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				QPYX_obj_YXQP.CrossFade(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Animation  QPYX_obj_YXQP  = (UnityEngine.Animation)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animation));
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.PlayMode QPYX_arg2_YXQP = (UnityEngine.PlayMode)ToLua.CheckObject(L_YXQP, 4, typeof(UnityEngine.PlayMode));
				QPYX_obj_YXQP.CrossFade(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Animation.CrossFade");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Blend_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Animation  QPYX_obj_YXQP  = (UnityEngine.Animation)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animation));
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				QPYX_obj_YXQP.Blend(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Animation  QPYX_obj_YXQP  = (UnityEngine.Animation)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animation));
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				QPYX_obj_YXQP.Blend(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Animation  QPYX_obj_YXQP  = (UnityEngine.Animation)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animation));
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				float QPYX_arg2_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 4);
				QPYX_obj_YXQP.Blend(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Animation.Blend");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CrossFadeQueued_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Animation  QPYX_obj_YXQP  = (UnityEngine.Animation)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animation));
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				UnityEngine.AnimationState QPYX_o_YXQP = QPYX_obj_YXQP.CrossFadeQueued(QPYX_arg0_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Animation  QPYX_obj_YXQP  = (UnityEngine.Animation)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animation));
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.AnimationState QPYX_o_YXQP = QPYX_obj_YXQP.CrossFadeQueued(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Animation  QPYX_obj_YXQP  = (UnityEngine.Animation)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animation));
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.QueueMode QPYX_arg2_YXQP = (UnityEngine.QueueMode)ToLua.CheckObject(L_YXQP, 4, typeof(UnityEngine.QueueMode));
				UnityEngine.AnimationState QPYX_o_YXQP = QPYX_obj_YXQP.CrossFadeQueued(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5)
			{
				UnityEngine.Animation  QPYX_obj_YXQP  = (UnityEngine.Animation)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animation));
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
				UnityEngine.QueueMode QPYX_arg2_YXQP = (UnityEngine.QueueMode)ToLua.CheckObject(L_YXQP, 4, typeof(UnityEngine.QueueMode));
				UnityEngine.PlayMode QPYX_arg3_YXQP = (UnityEngine.PlayMode)ToLua.CheckObject(L_YXQP, 5, typeof(UnityEngine.PlayMode));
				UnityEngine.AnimationState QPYX_o_YXQP = QPYX_obj_YXQP.CrossFadeQueued(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Animation.CrossFadeQueued");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_PlayQueued_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Animation  QPYX_obj_YXQP  = (UnityEngine.Animation)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animation));
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				UnityEngine.AnimationState QPYX_o_YXQP = QPYX_obj_YXQP.PlayQueued(QPYX_arg0_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Animation  QPYX_obj_YXQP  = (UnityEngine.Animation)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animation));
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				UnityEngine.QueueMode QPYX_arg1_YXQP = (UnityEngine.QueueMode)ToLua.CheckObject(L_YXQP, 3, typeof(UnityEngine.QueueMode));
				UnityEngine.AnimationState QPYX_o_YXQP = QPYX_obj_YXQP.PlayQueued(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4)
			{
				UnityEngine.Animation  QPYX_obj_YXQP  = (UnityEngine.Animation)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animation));
				string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
				UnityEngine.QueueMode QPYX_arg1_YXQP = (UnityEngine.QueueMode)ToLua.CheckObject(L_YXQP, 3, typeof(UnityEngine.QueueMode));
				UnityEngine.PlayMode QPYX_arg2_YXQP = (UnityEngine.PlayMode)ToLua.CheckObject(L_YXQP, 4, typeof(UnityEngine.PlayMode));
				UnityEngine.AnimationState QPYX_o_YXQP = QPYX_obj_YXQP.PlayQueued(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Animation.PlayQueued");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_AddClip_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Animation  QPYX_obj_YXQP  = (UnityEngine.Animation)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animation));
				UnityEngine.AnimationClip QPYX_arg0_YXQP = (UnityEngine.AnimationClip)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.AnimationClip));
				string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 3);
				QPYX_obj_YXQP.AddClip(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 5)
			{
				UnityEngine.Animation  QPYX_obj_YXQP  = (UnityEngine.Animation)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animation));
				UnityEngine.AnimationClip QPYX_arg0_YXQP = (UnityEngine.AnimationClip)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.AnimationClip));
				string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				int QPYX_arg3_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 5);
				QPYX_obj_YXQP.AddClip(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 6)
			{
				UnityEngine.Animation  QPYX_obj_YXQP  = (UnityEngine.Animation)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animation));
				UnityEngine.AnimationClip QPYX_arg0_YXQP = (UnityEngine.AnimationClip)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.AnimationClip));
				string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 4);
				int QPYX_arg3_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 5);
				bool QPYX_arg4_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 6);
				QPYX_obj_YXQP.AddClip(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Animation.AddClip");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_RemoveClip_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<string>(L_YXQP, 2))
			{
				UnityEngine.Animation  QPYX_obj_YXQP  = (UnityEngine.Animation)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animation));
				string QPYX_arg0_YXQP = ToLua.ToString(L_YXQP, 2);
				QPYX_obj_YXQP.RemoveClip(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<UnityEngine.AnimationClip>(L_YXQP, 2))
			{
				UnityEngine.Animation  QPYX_obj_YXQP  = (UnityEngine.Animation)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animation));
				UnityEngine.AnimationClip QPYX_arg0_YXQP = (UnityEngine.AnimationClip)ToLua.ToObject(L_YXQP, 2);
				QPYX_obj_YXQP.RemoveClip(QPYX_arg0_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Animation.RemoveClip");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetClipCount_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Animation  QPYX_obj_YXQP  = (UnityEngine.Animation)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animation));
			int QPYX_o_YXQP = QPYX_obj_YXQP.GetClipCount();
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SyncLayer_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Animation  QPYX_obj_YXQP  = (UnityEngine.Animation)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animation));
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.SyncLayer(QPYX_arg0_YXQP);
			return 0;
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
			UnityEngine.Animation  QPYX_obj_YXQP  = (UnityEngine.Animation)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animation));
			System.Collections.IEnumerator QPYX_o_YXQP = QPYX_obj_YXQP.GetEnumerator();
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetClip_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Animation  QPYX_obj_YXQP  = (UnityEngine.Animation)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Animation));
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			UnityEngine.AnimationClip QPYX_o_YXQP = QPYX_obj_YXQP.GetClip(QPYX_arg0_YXQP);
			ToLua.PushSealed(L_YXQP, QPYX_o_YXQP);
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
	static int QPYX_get_clip_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animation QPYX_obj_YXQP = (UnityEngine.Animation)QPYX_o_YXQP;
			UnityEngine.AnimationClip QPYX_ret_YXQP = QPYX_obj_YXQP.clip;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index clip on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_playAutomatically_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animation QPYX_obj_YXQP = (UnityEngine.Animation)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.playAutomatically;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index playAutomatically on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_wrapMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animation QPYX_obj_YXQP = (UnityEngine.Animation)QPYX_o_YXQP;
			UnityEngine.WrapMode QPYX_ret_YXQP = QPYX_obj_YXQP.wrapMode;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index wrapMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isPlaying_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animation QPYX_obj_YXQP = (UnityEngine.Animation)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.isPlaying;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isPlaying on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_animatePhysics_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animation QPYX_obj_YXQP = (UnityEngine.Animation)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.animatePhysics;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index animatePhysics on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_cullingType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animation QPYX_obj_YXQP = (UnityEngine.Animation)QPYX_o_YXQP;
			UnityEngine.AnimationCullingType QPYX_ret_YXQP = QPYX_obj_YXQP.cullingType;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index cullingType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_localBounds_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animation QPYX_obj_YXQP = (UnityEngine.Animation)QPYX_o_YXQP;
			UnityEngine.Bounds QPYX_ret_YXQP = QPYX_obj_YXQP.localBounds;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index localBounds on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_clip_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animation QPYX_obj_YXQP = (UnityEngine.Animation)QPYX_o_YXQP;
			UnityEngine.AnimationClip QPYX_arg0_YXQP = (UnityEngine.AnimationClip)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.AnimationClip));
			QPYX_obj_YXQP.clip = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index clip on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_playAutomatically_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animation QPYX_obj_YXQP = (UnityEngine.Animation)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.playAutomatically = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index playAutomatically on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_wrapMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animation QPYX_obj_YXQP = (UnityEngine.Animation)QPYX_o_YXQP;
			UnityEngine.WrapMode QPYX_arg0_YXQP = (UnityEngine.WrapMode)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.WrapMode));
			QPYX_obj_YXQP.wrapMode = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index wrapMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_animatePhysics_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animation QPYX_obj_YXQP = (UnityEngine.Animation)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.animatePhysics = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index animatePhysics on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_cullingType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animation QPYX_obj_YXQP = (UnityEngine.Animation)QPYX_o_YXQP;
			UnityEngine.AnimationCullingType QPYX_arg0_YXQP = (UnityEngine.AnimationCullingType)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.AnimationCullingType));
			QPYX_obj_YXQP.cullingType = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index cullingType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_localBounds_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Animation QPYX_obj_YXQP = (UnityEngine.Animation)QPYX_o_YXQP;
			UnityEngine.Bounds QPYX_arg0_YXQP = ToLua.ToBounds(L_YXQP, 2);
			QPYX_obj_YXQP.localBounds = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index localBounds on a nil value");
		}
	}
}

