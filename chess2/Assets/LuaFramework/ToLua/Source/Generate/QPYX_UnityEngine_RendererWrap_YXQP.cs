using System;
using LuaInterface;

public class QPYX_UnityEngine_RendererWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.Renderer), typeof(UnityEngine.Component));
		L_YXQP.RegFunction("SetPropertyBlock", QPYX_SetPropertyBlock_YXQP);
		L_YXQP.RegFunction("GetPropertyBlock", QPYX_GetPropertyBlock_YXQP);
		L_YXQP.RegFunction("GetClosestReflectionProbes", QPYX_GetClosestReflectionProbes_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateUnityEngine_Renderer_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("bounds", QPYX_get_bounds_YXQP, null);
		L_YXQP.RegVar("enabled", QPYX_get_enabled_YXQP, QPYX_set_enabled_YXQP);
		L_YXQP.RegVar("isVisible", QPYX_get_isVisible_YXQP, null);
		L_YXQP.RegVar("shadowCastingMode", QPYX_get_shadowCastingMode_YXQP, QPYX_set_shadowCastingMode_YXQP);
		L_YXQP.RegVar("receiveShadows", QPYX_get_receiveShadows_YXQP, QPYX_set_receiveShadows_YXQP);
		L_YXQP.RegVar("motionVectorGenerationMode", QPYX_get_motionVectorGenerationMode_YXQP, QPYX_set_motionVectorGenerationMode_YXQP);
		L_YXQP.RegVar("lightProbeUsage", QPYX_get_lightProbeUsage_YXQP, QPYX_set_lightProbeUsage_YXQP);
		L_YXQP.RegVar("reflectionProbeUsage", QPYX_get_reflectionProbeUsage_YXQP, QPYX_set_reflectionProbeUsage_YXQP);
		L_YXQP.RegVar("sortingLayerName", QPYX_get_sortingLayerName_YXQP, QPYX_set_sortingLayerName_YXQP);
		L_YXQP.RegVar("sortingLayerID", QPYX_get_sortingLayerID_YXQP, QPYX_set_sortingLayerID_YXQP);
		L_YXQP.RegVar("sortingOrder", QPYX_get_sortingOrder_YXQP, QPYX_set_sortingOrder_YXQP);
		L_YXQP.RegVar("allowOcclusionWhenDynamic", QPYX_get_allowOcclusionWhenDynamic_YXQP, QPYX_set_allowOcclusionWhenDynamic_YXQP);
		L_YXQP.RegVar("isPartOfStaticBatch", QPYX_get_isPartOfStaticBatch_YXQP, null);
		L_YXQP.RegVar("worldToLocalMatrix", QPYX_get_worldToLocalMatrix_YXQP, null);
		L_YXQP.RegVar("localToWorldMatrix", QPYX_get_localToWorldMatrix_YXQP, null);
		L_YXQP.RegVar("lightProbeProxyVolumeOverride", QPYX_get_lightProbeProxyVolumeOverride_YXQP, QPYX_set_lightProbeProxyVolumeOverride_YXQP);
		L_YXQP.RegVar("probeAnchor", QPYX_get_probeAnchor_YXQP, QPYX_set_probeAnchor_YXQP);
		L_YXQP.RegVar("lightmapIndex", QPYX_get_lightmapIndex_YXQP, QPYX_set_lightmapIndex_YXQP);
		L_YXQP.RegVar("realtimeLightmapIndex", QPYX_get_realtimeLightmapIndex_YXQP, QPYX_set_realtimeLightmapIndex_YXQP);
		L_YXQP.RegVar("lightmapScaleOffset", QPYX_get_lightmapScaleOffset_YXQP, QPYX_set_lightmapScaleOffset_YXQP);
		L_YXQP.RegVar("realtimeLightmapScaleOffset", QPYX_get_realtimeLightmapScaleOffset_YXQP, QPYX_set_realtimeLightmapScaleOffset_YXQP);
		L_YXQP.RegVar("material", QPYX_get_material_YXQP, QPYX_set_material_YXQP);
		L_YXQP.RegVar("sharedMaterial", QPYX_get_sharedMaterial_YXQP, QPYX_set_sharedMaterial_YXQP);
		L_YXQP.RegVar("materials", QPYX_get_materials_YXQP, QPYX_set_materials_YXQP);
		L_YXQP.RegVar("sharedMaterials", QPYX_get_sharedMaterials_YXQP, QPYX_set_sharedMaterials_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUnityEngine_Renderer_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				UnityEngine.Renderer QPYX_obj_YXQP = new UnityEngine.Renderer();
				ToLua.Push(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UnityEngine.Renderer.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetPropertyBlock_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Renderer  QPYX_obj_YXQP  = (UnityEngine.Renderer)ToLua.CheckObject<UnityEngine.Renderer>(L_YXQP, 1);
			UnityEngine.MaterialPropertyBlock QPYX_arg0_YXQP = (UnityEngine.MaterialPropertyBlock)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.MaterialPropertyBlock));
			QPYX_obj_YXQP.SetPropertyBlock(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetPropertyBlock_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Renderer  QPYX_obj_YXQP  = (UnityEngine.Renderer)ToLua.CheckObject<UnityEngine.Renderer>(L_YXQP, 1);
			UnityEngine.MaterialPropertyBlock QPYX_arg0_YXQP = (UnityEngine.MaterialPropertyBlock)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.MaterialPropertyBlock));
			QPYX_obj_YXQP.GetPropertyBlock(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetClosestReflectionProbes_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Renderer  QPYX_obj_YXQP  = (UnityEngine.Renderer)ToLua.CheckObject<UnityEngine.Renderer>(L_YXQP, 1);
			System.Collections.Generic.List<UnityEngine.Rendering.ReflectionProbeBlendInfo> QPYX_arg0_YXQP = (System.Collections.Generic.List<UnityEngine.Rendering.ReflectionProbeBlendInfo>)ToLua.CheckObject(L_YXQP, 2, typeof(System.Collections.Generic.List<UnityEngine.Rendering.ReflectionProbeBlendInfo>));
			QPYX_obj_YXQP.GetClosestReflectionProbes(QPYX_arg0_YXQP);
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
	static int QPYX_get_bounds_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			UnityEngine.Bounds QPYX_ret_YXQP = QPYX_obj_YXQP.bounds;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index bounds on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_enabled_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.enabled;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index enabled on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isVisible_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.isVisible;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isVisible on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_shadowCastingMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			UnityEngine.Rendering.ShadowCastingMode QPYX_ret_YXQP = QPYX_obj_YXQP.shadowCastingMode;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index shadowCastingMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_receiveShadows_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.receiveShadows;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index receiveShadows on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_motionVectorGenerationMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			UnityEngine.MotionVectorGenerationMode QPYX_ret_YXQP = QPYX_obj_YXQP.motionVectorGenerationMode;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index motionVectorGenerationMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_lightProbeUsage_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			UnityEngine.Rendering.LightProbeUsage QPYX_ret_YXQP = QPYX_obj_YXQP.lightProbeUsage;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index lightProbeUsage on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_reflectionProbeUsage_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			UnityEngine.Rendering.ReflectionProbeUsage QPYX_ret_YXQP = QPYX_obj_YXQP.reflectionProbeUsage;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index reflectionProbeUsage on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_sortingLayerName_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			string QPYX_ret_YXQP = QPYX_obj_YXQP.sortingLayerName;
			LuaDLL.lua_pushstring(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index sortingLayerName on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_sortingLayerID_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.sortingLayerID;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index sortingLayerID on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_sortingOrder_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.sortingOrder;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index sortingOrder on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_allowOcclusionWhenDynamic_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.allowOcclusionWhenDynamic;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index allowOcclusionWhenDynamic on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_isPartOfStaticBatch_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.isPartOfStaticBatch;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index isPartOfStaticBatch on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_worldToLocalMatrix_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
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
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			UnityEngine.Matrix4x4 QPYX_ret_YXQP = QPYX_obj_YXQP.localToWorldMatrix;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index localToWorldMatrix on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_lightProbeProxyVolumeOverride_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			UnityEngine.GameObject QPYX_ret_YXQP = QPYX_obj_YXQP.lightProbeProxyVolumeOverride;
			ToLua.PushSealed(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index lightProbeProxyVolumeOverride on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_probeAnchor_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			UnityEngine.Transform QPYX_ret_YXQP = QPYX_obj_YXQP.probeAnchor;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index probeAnchor on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_lightmapIndex_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.lightmapIndex;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index lightmapIndex on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_realtimeLightmapIndex_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.realtimeLightmapIndex;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index realtimeLightmapIndex on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_lightmapScaleOffset_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			UnityEngine.Vector4 QPYX_ret_YXQP = QPYX_obj_YXQP.lightmapScaleOffset;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index lightmapScaleOffset on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_realtimeLightmapScaleOffset_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			UnityEngine.Vector4 QPYX_ret_YXQP = QPYX_obj_YXQP.realtimeLightmapScaleOffset;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index realtimeLightmapScaleOffset on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_material_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			UnityEngine.Material QPYX_ret_YXQP = QPYX_obj_YXQP.material;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index material on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_sharedMaterial_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			UnityEngine.Material QPYX_ret_YXQP = QPYX_obj_YXQP.sharedMaterial;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index sharedMaterial on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_materials_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			UnityEngine.Material[] QPYX_ret_YXQP = QPYX_obj_YXQP.materials;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index materials on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_sharedMaterials_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			UnityEngine.Material[] QPYX_ret_YXQP = QPYX_obj_YXQP.sharedMaterials;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index sharedMaterials on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_enabled_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.enabled = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index enabled on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_shadowCastingMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			UnityEngine.Rendering.ShadowCastingMode QPYX_arg0_YXQP = (UnityEngine.Rendering.ShadowCastingMode)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.Rendering.ShadowCastingMode));
			QPYX_obj_YXQP.shadowCastingMode = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index shadowCastingMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_receiveShadows_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.receiveShadows = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index receiveShadows on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_motionVectorGenerationMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			UnityEngine.MotionVectorGenerationMode QPYX_arg0_YXQP = (UnityEngine.MotionVectorGenerationMode)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.MotionVectorGenerationMode));
			QPYX_obj_YXQP.motionVectorGenerationMode = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index motionVectorGenerationMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_lightProbeUsage_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			UnityEngine.Rendering.LightProbeUsage QPYX_arg0_YXQP = (UnityEngine.Rendering.LightProbeUsage)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.Rendering.LightProbeUsage));
			QPYX_obj_YXQP.lightProbeUsage = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index lightProbeUsage on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_reflectionProbeUsage_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			UnityEngine.Rendering.ReflectionProbeUsage QPYX_arg0_YXQP = (UnityEngine.Rendering.ReflectionProbeUsage)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.Rendering.ReflectionProbeUsage));
			QPYX_obj_YXQP.reflectionProbeUsage = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index reflectionProbeUsage on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_sortingLayerName_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			string QPYX_arg0_YXQP = ToLua.CheckString(L_YXQP, 2);
			QPYX_obj_YXQP.sortingLayerName = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index sortingLayerName on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_sortingLayerID_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.sortingLayerID = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index sortingLayerID on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_sortingOrder_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.sortingOrder = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index sortingOrder on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_allowOcclusionWhenDynamic_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.allowOcclusionWhenDynamic = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index allowOcclusionWhenDynamic on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_lightProbeProxyVolumeOverride_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			UnityEngine.GameObject QPYX_arg0_YXQP = (UnityEngine.GameObject)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.GameObject));
			QPYX_obj_YXQP.lightProbeProxyVolumeOverride = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index lightProbeProxyVolumeOverride on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_probeAnchor_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			UnityEngine.Transform QPYX_arg0_YXQP = (UnityEngine.Transform)ToLua.CheckObject<UnityEngine.Transform>(L_YXQP, 2);
			QPYX_obj_YXQP.probeAnchor = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index probeAnchor on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_lightmapIndex_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.lightmapIndex = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index lightmapIndex on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_realtimeLightmapIndex_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.realtimeLightmapIndex = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index realtimeLightmapIndex on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_lightmapScaleOffset_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			UnityEngine.Vector4 QPYX_arg0_YXQP = ToLua.ToVector4(L_YXQP, 2);
			QPYX_obj_YXQP.lightmapScaleOffset = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index lightmapScaleOffset on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_realtimeLightmapScaleOffset_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			UnityEngine.Vector4 QPYX_arg0_YXQP = ToLua.ToVector4(L_YXQP, 2);
			QPYX_obj_YXQP.realtimeLightmapScaleOffset = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index realtimeLightmapScaleOffset on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_material_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			UnityEngine.Material QPYX_arg0_YXQP = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 2);
			QPYX_obj_YXQP.material = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index material on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_sharedMaterial_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			UnityEngine.Material QPYX_arg0_YXQP = (UnityEngine.Material)ToLua.CheckObject<UnityEngine.Material>(L_YXQP, 2);
			QPYX_obj_YXQP.sharedMaterial = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index sharedMaterial on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_materials_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			UnityEngine.Material[] QPYX_arg0_YXQP = ToLua.CheckObjectArray<UnityEngine.Material>(L_YXQP, 2);
			QPYX_obj_YXQP.materials = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index materials on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_sharedMaterials_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Renderer QPYX_obj_YXQP = (UnityEngine.Renderer)QPYX_o_YXQP;
			UnityEngine.Material[] QPYX_arg0_YXQP = ToLua.CheckObjectArray<UnityEngine.Material>(L_YXQP, 2);
			QPYX_obj_YXQP.sharedMaterials = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index sharedMaterials on a nil value");
		}
	}
}

