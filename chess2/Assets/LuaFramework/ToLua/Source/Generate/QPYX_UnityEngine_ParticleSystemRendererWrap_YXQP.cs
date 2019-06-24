using System;
using LuaInterface;

public class QPYX_UnityEngine_ParticleSystemRendererWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.ParticleSystemRenderer), typeof(UnityEngine.Renderer));
		L_YXQP.RegFunction("GetMeshes", QPYX_GetMeshes_YXQP);
		L_YXQP.RegFunction("SetMeshes", QPYX_SetMeshes_YXQP);
		L_YXQP.RegFunction("SetActiveVertexStreams", QPYX_SetActiveVertexStreams_YXQP);
		L_YXQP.RegFunction("GetActiveVertexStreams", QPYX_GetActiveVertexStreams_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateUnityEngine_ParticleSystemRenderer_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("renderMode", QPYX_get_renderMode_YXQP, QPYX_set_renderMode_YXQP);
		L_YXQP.RegVar("lengthScale", QPYX_get_lengthScale_YXQP, QPYX_set_lengthScale_YXQP);
		L_YXQP.RegVar("velocityScale", QPYX_get_velocityScale_YXQP, QPYX_set_velocityScale_YXQP);
		L_YXQP.RegVar("cameraVelocityScale", QPYX_get_cameraVelocityScale_YXQP, QPYX_set_cameraVelocityScale_YXQP);
		L_YXQP.RegVar("normalDirection", QPYX_get_normalDirection_YXQP, QPYX_set_normalDirection_YXQP);
		L_YXQP.RegVar("alignment", QPYX_get_alignment_YXQP, QPYX_set_alignment_YXQP);
		L_YXQP.RegVar("pivot", QPYX_get_pivot_YXQP, QPYX_set_pivot_YXQP);
		L_YXQP.RegVar("sortMode", QPYX_get_sortMode_YXQP, QPYX_set_sortMode_YXQP);
		L_YXQP.RegVar("sortingFudge", QPYX_get_sortingFudge_YXQP, QPYX_set_sortingFudge_YXQP);
		L_YXQP.RegVar("minParticleSize", QPYX_get_minParticleSize_YXQP, QPYX_set_minParticleSize_YXQP);
		L_YXQP.RegVar("maxParticleSize", QPYX_get_maxParticleSize_YXQP, QPYX_set_maxParticleSize_YXQP);
		L_YXQP.RegVar("mesh", QPYX_get_mesh_YXQP, QPYX_set_mesh_YXQP);
		L_YXQP.RegVar("meshCount", QPYX_get_meshCount_YXQP, null);
		L_YXQP.RegVar("trailMaterial", QPYX_get_trailMaterial_YXQP, QPYX_set_trailMaterial_YXQP);
		L_YXQP.RegVar("activeVertexStreamsCount", QPYX_get_activeVertexStreamsCount_YXQP, null);
		L_YXQP.RegVar("maskInteraction", QPYX_get_maskInteraction_YXQP, QPYX_set_maskInteraction_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUnityEngine_ParticleSystemRenderer_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				UnityEngine.ParticleSystemRenderer QPYX_obj_YXQP = new UnityEngine.ParticleSystemRenderer();
				ToLua.PushSealed(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UnityEngine.ParticleSystemRenderer.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetMeshes_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.ParticleSystemRenderer  QPYX_obj_YXQP  = (UnityEngine.ParticleSystemRenderer)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.ParticleSystemRenderer));
			UnityEngine.Mesh[] QPYX_arg0_YXQP = ToLua.CheckObjectArray<UnityEngine.Mesh>(L_YXQP, 2);
			int QPYX_o_YXQP = QPYX_obj_YXQP.GetMeshes(QPYX_arg0_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetMeshes_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2)
			{
				UnityEngine.ParticleSystemRenderer  QPYX_obj_YXQP  = (UnityEngine.ParticleSystemRenderer)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.ParticleSystemRenderer));
				UnityEngine.Mesh[] QPYX_arg0_YXQP = ToLua.CheckObjectArray<UnityEngine.Mesh>(L_YXQP, 2);
				QPYX_obj_YXQP.SetMeshes(QPYX_arg0_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.ParticleSystemRenderer  QPYX_obj_YXQP  = (UnityEngine.ParticleSystemRenderer)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.ParticleSystemRenderer));
				UnityEngine.Mesh[] QPYX_arg0_YXQP = ToLua.CheckObjectArray<UnityEngine.Mesh>(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 3);
				QPYX_obj_YXQP.SetMeshes(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.ParticleSystemRenderer.SetMeshes");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetActiveVertexStreams_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.ParticleSystemRenderer  QPYX_obj_YXQP  = (UnityEngine.ParticleSystemRenderer)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.ParticleSystemRenderer));
			System.Collections.Generic.List<UnityEngine.ParticleSystemVertexStream> QPYX_arg0_YXQP = (System.Collections.Generic.List<UnityEngine.ParticleSystemVertexStream>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<UnityEngine.ParticleSystemVertexStream>));
			QPYX_obj_YXQP.SetActiveVertexStreams(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetActiveVertexStreams_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.ParticleSystemRenderer  QPYX_obj_YXQP  = (UnityEngine.ParticleSystemRenderer)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.ParticleSystemRenderer));
			System.Collections.Generic.List<UnityEngine.ParticleSystemVertexStream> QPYX_arg0_YXQP = (System.Collections.Generic.List<UnityEngine.ParticleSystemVertexStream>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<UnityEngine.ParticleSystemVertexStream>));
			QPYX_obj_YXQP.GetActiveVertexStreams(QPYX_arg0_YXQP);
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
	static int QPYX_get_renderMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystemRenderer QPYX_obj_YXQP = (UnityEngine.ParticleSystemRenderer)QPYX_o_YXQP;
			UnityEngine.ParticleSystemRenderMode QPYX_ret_YXQP = QPYX_obj_YXQP.renderMode;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index renderMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_lengthScale_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystemRenderer QPYX_obj_YXQP = (UnityEngine.ParticleSystemRenderer)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.lengthScale;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index lengthScale on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_velocityScale_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystemRenderer QPYX_obj_YXQP = (UnityEngine.ParticleSystemRenderer)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.velocityScale;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index velocityScale on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_cameraVelocityScale_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystemRenderer QPYX_obj_YXQP = (UnityEngine.ParticleSystemRenderer)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.cameraVelocityScale;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index cameraVelocityScale on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_normalDirection_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystemRenderer QPYX_obj_YXQP = (UnityEngine.ParticleSystemRenderer)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.normalDirection;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index normalDirection on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_alignment_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystemRenderer QPYX_obj_YXQP = (UnityEngine.ParticleSystemRenderer)QPYX_o_YXQP;
			UnityEngine.ParticleSystemRenderSpace QPYX_ret_YXQP = QPYX_obj_YXQP.alignment;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index alignment on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_pivot_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystemRenderer QPYX_obj_YXQP = (UnityEngine.ParticleSystemRenderer)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_ret_YXQP = QPYX_obj_YXQP.pivot;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index pivot on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_sortMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystemRenderer QPYX_obj_YXQP = (UnityEngine.ParticleSystemRenderer)QPYX_o_YXQP;
			UnityEngine.ParticleSystemSortMode QPYX_ret_YXQP = QPYX_obj_YXQP.sortMode;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index sortMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_sortingFudge_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystemRenderer QPYX_obj_YXQP = (UnityEngine.ParticleSystemRenderer)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.sortingFudge;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index sortingFudge on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_minParticleSize_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystemRenderer QPYX_obj_YXQP = (UnityEngine.ParticleSystemRenderer)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.minParticleSize;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index minParticleSize on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_maxParticleSize_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystemRenderer QPYX_obj_YXQP = (UnityEngine.ParticleSystemRenderer)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.maxParticleSize;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index maxParticleSize on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_mesh_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystemRenderer QPYX_obj_YXQP = (UnityEngine.ParticleSystemRenderer)QPYX_o_YXQP;
			UnityEngine.Mesh QPYX_ret_YXQP = QPYX_obj_YXQP.mesh;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index mesh on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_meshCount_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystemRenderer QPYX_obj_YXQP = (UnityEngine.ParticleSystemRenderer)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.meshCount;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index meshCount on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_trailMaterial_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystemRenderer QPYX_obj_YXQP = (UnityEngine.ParticleSystemRenderer)QPYX_o_YXQP;
			UnityEngine.Material QPYX_ret_YXQP = QPYX_obj_YXQP.trailMaterial;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index trailMaterial on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_activeVertexStreamsCount_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystemRenderer QPYX_obj_YXQP = (UnityEngine.ParticleSystemRenderer)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.activeVertexStreamsCount;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index activeVertexStreamsCount on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_maskInteraction_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystemRenderer QPYX_obj_YXQP = (UnityEngine.ParticleSystemRenderer)QPYX_o_YXQP;
			UnityEngine.SpriteMaskInteraction QPYX_ret_YXQP = QPYX_obj_YXQP.maskInteraction;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index maskInteraction on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_renderMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystemRenderer QPYX_obj_YXQP = (UnityEngine.ParticleSystemRenderer)QPYX_o_YXQP;
			UnityEngine.ParticleSystemRenderMode QPYX_arg0_YXQP = (UnityEngine.ParticleSystemRenderMode)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.ParticleSystemRenderMode));
			QPYX_obj_YXQP.renderMode = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index renderMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_lengthScale_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystemRenderer QPYX_obj_YXQP = (UnityEngine.ParticleSystemRenderer)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.lengthScale = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index lengthScale on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_velocityScale_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystemRenderer QPYX_obj_YXQP = (UnityEngine.ParticleSystemRenderer)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.velocityScale = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index velocityScale on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_cameraVelocityScale_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystemRenderer QPYX_obj_YXQP = (UnityEngine.ParticleSystemRenderer)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.cameraVelocityScale = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index cameraVelocityScale on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_normalDirection_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystemRenderer QPYX_obj_YXQP = (UnityEngine.ParticleSystemRenderer)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.normalDirection = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index normalDirection on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_alignment_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystemRenderer QPYX_obj_YXQP = (UnityEngine.ParticleSystemRenderer)QPYX_o_YXQP;
			UnityEngine.ParticleSystemRenderSpace QPYX_arg0_YXQP = (UnityEngine.ParticleSystemRenderSpace)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.ParticleSystemRenderSpace));
			QPYX_obj_YXQP.alignment = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index alignment on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_pivot_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystemRenderer QPYX_obj_YXQP = (UnityEngine.ParticleSystemRenderer)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
			QPYX_obj_YXQP.pivot = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index pivot on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_sortMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystemRenderer QPYX_obj_YXQP = (UnityEngine.ParticleSystemRenderer)QPYX_o_YXQP;
			UnityEngine.ParticleSystemSortMode QPYX_arg0_YXQP = (UnityEngine.ParticleSystemSortMode)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.ParticleSystemSortMode));
			QPYX_obj_YXQP.sortMode = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index sortMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_sortingFudge_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystemRenderer QPYX_obj_YXQP = (UnityEngine.ParticleSystemRenderer)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.sortingFudge = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index sortingFudge on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_minParticleSize_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystemRenderer QPYX_obj_YXQP = (UnityEngine.ParticleSystemRenderer)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.minParticleSize = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index minParticleSize on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_maxParticleSize_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystemRenderer QPYX_obj_YXQP = (UnityEngine.ParticleSystemRenderer)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.maxParticleSize = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index maxParticleSize on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_mesh_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystemRenderer QPYX_obj_YXQP = (UnityEngine.ParticleSystemRenderer)QPYX_o_YXQP;
			UnityEngine.Mesh QPYX_arg0_YXQP = (UnityEngine.Mesh)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.Mesh));
			QPYX_obj_YXQP.mesh = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index mesh on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_trailMaterial_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystemRenderer QPYX_obj_YXQP = (UnityEngine.ParticleSystemRenderer)QPYX_o_YXQP;
			UnityEngine.Material QPYX_arg0_YXQP = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 2);
			QPYX_obj_YXQP.trailMaterial = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index trailMaterial on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_maskInteraction_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.ParticleSystemRenderer QPYX_obj_YXQP = (UnityEngine.ParticleSystemRenderer)QPYX_o_YXQP;
			UnityEngine.SpriteMaskInteraction QPYX_arg0_YXQP = (UnityEngine.SpriteMaskInteraction)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.SpriteMaskInteraction));
			QPYX_obj_YXQP.maskInteraction = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index maskInteraction on a nil value");
		}
	}
}

