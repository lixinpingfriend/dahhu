using System;
using LuaInterface;

public class QPYX_UnityEngine_SkinnedMeshRendererWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.SkinnedMeshRenderer), typeof(UnityEngine.Renderer));
		L_YXQP.RegFunction("GetBlendShapeWeight", QPYX_GetBlendShapeWeight_YXQP);
		L_YXQP.RegFunction("SetBlendShapeWeight", QPYX_SetBlendShapeWeight_YXQP);
		L_YXQP.RegFunction("BakeMesh", QPYX_BakeMesh_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateUnityEngine_SkinnedMeshRenderer_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("bones", QPYX_get_bones_YXQP, QPYX_set_bones_YXQP);
		L_YXQP.RegVar("quality", QPYX_get_quality_YXQP, QPYX_set_quality_YXQP);
		L_YXQP.RegVar("updateWhenOffscreen", QPYX_get_updateWhenOffscreen_YXQP, QPYX_set_updateWhenOffscreen_YXQP);
		L_YXQP.RegVar("rootBone", QPYX_get_rootBone_YXQP, QPYX_set_rootBone_YXQP);
		L_YXQP.RegVar("sharedMesh", QPYX_get_sharedMesh_YXQP, QPYX_set_sharedMesh_YXQP);
		L_YXQP.RegVar("skinnedMotionVectors", QPYX_get_skinnedMotionVectors_YXQP, QPYX_set_skinnedMotionVectors_YXQP);
		L_YXQP.RegVar("localBounds", QPYX_get_localBounds_YXQP, QPYX_set_localBounds_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUnityEngine_SkinnedMeshRenderer_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				UnityEngine.SkinnedMeshRenderer QPYX_obj_YXQP = new UnityEngine.SkinnedMeshRenderer();
				ToLua.Push(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UnityEngine.SkinnedMeshRenderer.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetBlendShapeWeight_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.SkinnedMeshRenderer  QPYX_obj_YXQP  = (UnityEngine.SkinnedMeshRenderer)ToLua.CheckObject<UnityEngine.SkinnedMeshRenderer>(L_YXQP, 1);
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			float QPYX_o_YXQP = QPYX_obj_YXQP.GetBlendShapeWeight(QPYX_arg0_YXQP);
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetBlendShapeWeight_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.SkinnedMeshRenderer  QPYX_obj_YXQP  = (UnityEngine.SkinnedMeshRenderer)ToLua.CheckObject<UnityEngine.SkinnedMeshRenderer>(L_YXQP, 1);
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			QPYX_obj_YXQP.SetBlendShapeWeight(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_BakeMesh_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.SkinnedMeshRenderer  QPYX_obj_YXQP  = (UnityEngine.SkinnedMeshRenderer)ToLua.CheckObject<UnityEngine.SkinnedMeshRenderer>(L_YXQP, 1);
			UnityEngine.Mesh QPYX_arg0_YXQP = (UnityEngine.Mesh)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.Mesh));
			QPYX_obj_YXQP.BakeMesh(QPYX_arg0_YXQP);
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
	static int QPYX_get_bones_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.SkinnedMeshRenderer QPYX_obj_YXQP = (UnityEngine.SkinnedMeshRenderer)QPYX_o_YXQP;
			UnityEngine.Transform[] QPYX_ret_YXQP = QPYX_obj_YXQP.bones;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index bones on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_quality_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.SkinnedMeshRenderer QPYX_obj_YXQP = (UnityEngine.SkinnedMeshRenderer)QPYX_o_YXQP;
			UnityEngine.SkinQuality QPYX_ret_YXQP = QPYX_obj_YXQP.quality;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index quality on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_updateWhenOffscreen_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.SkinnedMeshRenderer QPYX_obj_YXQP = (UnityEngine.SkinnedMeshRenderer)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.updateWhenOffscreen;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index updateWhenOffscreen on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_rootBone_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.SkinnedMeshRenderer QPYX_obj_YXQP = (UnityEngine.SkinnedMeshRenderer)QPYX_o_YXQP;
			UnityEngine.Transform QPYX_ret_YXQP = QPYX_obj_YXQP.rootBone;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index rootBone on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_sharedMesh_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.SkinnedMeshRenderer QPYX_obj_YXQP = (UnityEngine.SkinnedMeshRenderer)QPYX_o_YXQP;
			UnityEngine.Mesh QPYX_ret_YXQP = QPYX_obj_YXQP.sharedMesh;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index sharedMesh on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_skinnedMotionVectors_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.SkinnedMeshRenderer QPYX_obj_YXQP = (UnityEngine.SkinnedMeshRenderer)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.skinnedMotionVectors;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index skinnedMotionVectors on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_localBounds_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.SkinnedMeshRenderer QPYX_obj_YXQP = (UnityEngine.SkinnedMeshRenderer)QPYX_o_YXQP;
			UnityEngine.Bounds QPYX_ret_YXQP = QPYX_obj_YXQP.localBounds;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index localBounds on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_bones_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.SkinnedMeshRenderer QPYX_obj_YXQP = (UnityEngine.SkinnedMeshRenderer)QPYX_o_YXQP;
			UnityEngine.Transform[] QPYX_arg0_YXQP = ToLua.CheckObjectArray<UnityEngine.Transform>(L_YXQP, 2);
			QPYX_obj_YXQP.bones = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index bones on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_quality_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.SkinnedMeshRenderer QPYX_obj_YXQP = (UnityEngine.SkinnedMeshRenderer)QPYX_o_YXQP;
			UnityEngine.SkinQuality QPYX_arg0_YXQP = (UnityEngine.SkinQuality)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.SkinQuality));
			QPYX_obj_YXQP.quality = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index quality on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_updateWhenOffscreen_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.SkinnedMeshRenderer QPYX_obj_YXQP = (UnityEngine.SkinnedMeshRenderer)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.updateWhenOffscreen = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index updateWhenOffscreen on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_rootBone_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.SkinnedMeshRenderer QPYX_obj_YXQP = (UnityEngine.SkinnedMeshRenderer)QPYX_o_YXQP;
			UnityEngine.Transform QPYX_arg0_YXQP = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 2);
			QPYX_obj_YXQP.rootBone = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index rootBone on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_sharedMesh_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.SkinnedMeshRenderer QPYX_obj_YXQP = (UnityEngine.SkinnedMeshRenderer)QPYX_o_YXQP;
			UnityEngine.Mesh QPYX_arg0_YXQP = (UnityEngine.Mesh)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.Mesh));
			QPYX_obj_YXQP.sharedMesh = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index sharedMesh on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_skinnedMotionVectors_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.SkinnedMeshRenderer QPYX_obj_YXQP = (UnityEngine.SkinnedMeshRenderer)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.skinnedMotionVectors = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index skinnedMotionVectors on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_localBounds_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.SkinnedMeshRenderer QPYX_obj_YXQP = (UnityEngine.SkinnedMeshRenderer)QPYX_o_YXQP;
			UnityEngine.Bounds QPYX_arg0_YXQP = ToLua.ToBounds(L_YXQP, 2);
			QPYX_obj_YXQP.localBounds = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index localBounds on a nil value");
		}
	}
}

