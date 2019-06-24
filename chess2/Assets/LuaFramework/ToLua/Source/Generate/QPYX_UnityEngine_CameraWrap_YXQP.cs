using System;
using DG.Tweening;
using LuaInterface;

public class QPYX_UnityEngine_CameraWrap_YXQP
{
	public static void QPYX_Register_YXQP(LuaState L_YXQP)	{
		L_YXQP.BeginClass(typeof(UnityEngine.Camera), typeof(UnityEngine.Behaviour));
		L_YXQP.RegFunction("SetTargetBuffers", QPYX_SetTargetBuffers_YXQP);
		L_YXQP.RegFunction("ResetWorldToCameraMatrix", QPYX_ResetWorldToCameraMatrix_YXQP);
		L_YXQP.RegFunction("ResetProjectionMatrix", QPYX_ResetProjectionMatrix_YXQP);
		L_YXQP.RegFunction("ResetAspect", QPYX_ResetAspect_YXQP);
		L_YXQP.RegFunction("GetStereoViewMatrix", QPYX_GetStereoViewMatrix_YXQP);
		L_YXQP.RegFunction("SetStereoViewMatrix", QPYX_SetStereoViewMatrix_YXQP);
		L_YXQP.RegFunction("ResetStereoViewMatrices", QPYX_ResetStereoViewMatrices_YXQP);
		L_YXQP.RegFunction("GetStereoProjectionMatrix", QPYX_GetStereoProjectionMatrix_YXQP);
		L_YXQP.RegFunction("SetStereoProjectionMatrix", QPYX_SetStereoProjectionMatrix_YXQP);
		L_YXQP.RegFunction("CalculateFrustumCorners", QPYX_CalculateFrustumCorners_YXQP);
		L_YXQP.RegFunction("ResetStereoProjectionMatrices", QPYX_ResetStereoProjectionMatrices_YXQP);
		L_YXQP.RegFunction("ResetTransparencySortSettings", QPYX_ResetTransparencySortSettings_YXQP);
		L_YXQP.RegFunction("WorldToScreenPoint", QPYX_WorldToScreenPoint_YXQP);
		L_YXQP.RegFunction("WorldToViewportPoint", QPYX_WorldToViewportPoint_YXQP);
		L_YXQP.RegFunction("ViewportToWorldPoint", QPYX_ViewportToWorldPoint_YXQP);
		L_YXQP.RegFunction("ScreenToWorldPoint", QPYX_ScreenToWorldPoint_YXQP);
		L_YXQP.RegFunction("ScreenToViewportPoint", QPYX_ScreenToViewportPoint_YXQP);
		L_YXQP.RegFunction("ViewportToScreenPoint", QPYX_ViewportToScreenPoint_YXQP);
		L_YXQP.RegFunction("ViewportPointToRay", QPYX_ViewportPointToRay_YXQP);
		L_YXQP.RegFunction("ScreenPointToRay", QPYX_ScreenPointToRay_YXQP);
		L_YXQP.RegFunction("GetAllCameras", QPYX_GetAllCameras_YXQP);
		L_YXQP.RegFunction("Render", QPYX_Render_YXQP);
		L_YXQP.RegFunction("RenderWithShader", QPYX_RenderWithShader_YXQP);
		L_YXQP.RegFunction("SetReplacementShader", QPYX_SetReplacementShader_YXQP);
		L_YXQP.RegFunction("ResetReplacementShader", QPYX_ResetReplacementShader_YXQP);
		L_YXQP.RegFunction("ResetCullingMatrix", QPYX_ResetCullingMatrix_YXQP);
		L_YXQP.RegFunction("RenderDontRestore", QPYX_RenderDontRestore_YXQP);
		L_YXQP.RegFunction("SetupCurrent", QPYX_SetupCurrent_YXQP);
		L_YXQP.RegFunction("RenderToCubemap", QPYX_RenderToCubemap_YXQP);
		L_YXQP.RegFunction("CopyFrom", QPYX_CopyFrom_YXQP);
		L_YXQP.RegFunction("AddCommandBuffer", QPYX_AddCommandBuffer_YXQP);
		L_YXQP.RegFunction("RemoveCommandBuffer", QPYX_RemoveCommandBuffer_YXQP);
		L_YXQP.RegFunction("RemoveCommandBuffers", QPYX_RemoveCommandBuffers_YXQP);
		L_YXQP.RegFunction("RemoveAllCommandBuffers", QPYX_RemoveAllCommandBuffers_YXQP);
		L_YXQP.RegFunction("GetCommandBuffers", QPYX_GetCommandBuffers_YXQP);
		L_YXQP.RegFunction("CalculateObliqueMatrix", QPYX_CalculateObliqueMatrix_YXQP);
		L_YXQP.RegFunction("GetStereoNonJitteredProjectionMatrix", QPYX_GetStereoNonJitteredProjectionMatrix_YXQP);
		L_YXQP.RegFunction("CopyStereoDeviceProjectionMatrixToNonJittered", QPYX_CopyStereoDeviceProjectionMatrixToNonJittered_YXQP);
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
		L_YXQP.RegFunction("DOShakeRotation", QPYX_DOShakeRotation_YXQP);
		L_YXQP.RegFunction("DOShakePosition", QPYX_DOShakePosition_YXQP);
		L_YXQP.RegFunction("DORect", QPYX_DORect_YXQP);
		L_YXQP.RegFunction("DOPixelRect", QPYX_DOPixelRect_YXQP);
		L_YXQP.RegFunction("DOOrthoSize", QPYX_DOOrthoSize_YXQP);
		L_YXQP.RegFunction("DONearClipPlane", QPYX_DONearClipPlane_YXQP);
		L_YXQP.RegFunction("DOFieldOfView", QPYX_DOFieldOfView_YXQP);
		L_YXQP.RegFunction("DOFarClipPlane", QPYX_DOFarClipPlane_YXQP);
		L_YXQP.RegFunction("DOColor", QPYX_DOColor_YXQP);
		L_YXQP.RegFunction("DOAspect", QPYX_DOAspect_YXQP);
		L_YXQP.RegFunction("New", QPYX__CreateUnityEngine_Camera_YXQP);
		L_YXQP.RegFunction("__eq", QPYX_op_Equality_YXQP);		L_YXQP.RegFunction("__tostring", ToLua.op_ToString);		L_YXQP.RegVar("onPreCull", QPYX_get_onPreCull_YXQP, QPYX_set_onPreCull_YXQP);
		L_YXQP.RegVar("onPreRender", QPYX_get_onPreRender_YXQP, QPYX_set_onPreRender_YXQP);
		L_YXQP.RegVar("onPostRender", QPYX_get_onPostRender_YXQP, QPYX_set_onPostRender_YXQP);
		L_YXQP.RegVar("fieldOfView", QPYX_get_fieldOfView_YXQP, QPYX_set_fieldOfView_YXQP);
		L_YXQP.RegVar("nearClipPlane", QPYX_get_nearClipPlane_YXQP, QPYX_set_nearClipPlane_YXQP);
		L_YXQP.RegVar("farClipPlane", QPYX_get_farClipPlane_YXQP, QPYX_set_farClipPlane_YXQP);
		L_YXQP.RegVar("renderingPath", QPYX_get_renderingPath_YXQP, QPYX_set_renderingPath_YXQP);
		L_YXQP.RegVar("actualRenderingPath", QPYX_get_actualRenderingPath_YXQP, null);
		L_YXQP.RegVar("allowHDR", QPYX_get_allowHDR_YXQP, QPYX_set_allowHDR_YXQP);
		L_YXQP.RegVar("forceIntoRenderTexture", QPYX_get_forceIntoRenderTexture_YXQP, QPYX_set_forceIntoRenderTexture_YXQP);
		L_YXQP.RegVar("allowMSAA", QPYX_get_allowMSAA_YXQP, QPYX_set_allowMSAA_YXQP);
		L_YXQP.RegVar("allowDynamicResolution", QPYX_get_allowDynamicResolution_YXQP, QPYX_set_allowDynamicResolution_YXQP);
		L_YXQP.RegVar("orthographicSize", QPYX_get_orthographicSize_YXQP, QPYX_set_orthographicSize_YXQP);
		L_YXQP.RegVar("orthographic", QPYX_get_orthographic_YXQP, QPYX_set_orthographic_YXQP);
		L_YXQP.RegVar("opaqueSortMode", QPYX_get_opaqueSortMode_YXQP, QPYX_set_opaqueSortMode_YXQP);
		L_YXQP.RegVar("transparencySortMode", QPYX_get_transparencySortMode_YXQP, QPYX_set_transparencySortMode_YXQP);
		L_YXQP.RegVar("transparencySortAxis", QPYX_get_transparencySortAxis_YXQP, QPYX_set_transparencySortAxis_YXQP);
		L_YXQP.RegVar("depth", QPYX_get_depth_YXQP, QPYX_set_depth_YXQP);
		L_YXQP.RegVar("aspect", QPYX_get_aspect_YXQP, QPYX_set_aspect_YXQP);
		L_YXQP.RegVar("cullingMask", QPYX_get_cullingMask_YXQP, QPYX_set_cullingMask_YXQP);
		L_YXQP.RegVar("scene", QPYX_get_scene_YXQP, QPYX_set_scene_YXQP);
		L_YXQP.RegVar("eventMask", QPYX_get_eventMask_YXQP, QPYX_set_eventMask_YXQP);
		L_YXQP.RegVar("backgroundColor", QPYX_get_backgroundColor_YXQP, QPYX_set_backgroundColor_YXQP);
		L_YXQP.RegVar("rect", QPYX_get_rect_YXQP, QPYX_set_rect_YXQP);
		L_YXQP.RegVar("pixelRect", QPYX_get_pixelRect_YXQP, QPYX_set_pixelRect_YXQP);
		L_YXQP.RegVar("targetTexture", QPYX_get_targetTexture_YXQP, QPYX_set_targetTexture_YXQP);
		L_YXQP.RegVar("activeTexture", QPYX_get_activeTexture_YXQP, null);
		L_YXQP.RegVar("pixelWidth", QPYX_get_pixelWidth_YXQP, null);
		L_YXQP.RegVar("pixelHeight", QPYX_get_pixelHeight_YXQP, null);
		L_YXQP.RegVar("scaledPixelWidth", QPYX_get_scaledPixelWidth_YXQP, null);
		L_YXQP.RegVar("scaledPixelHeight", QPYX_get_scaledPixelHeight_YXQP, null);
		L_YXQP.RegVar("cameraToWorldMatrix", QPYX_get_cameraToWorldMatrix_YXQP, null);
		L_YXQP.RegVar("worldToCameraMatrix", QPYX_get_worldToCameraMatrix_YXQP, QPYX_set_worldToCameraMatrix_YXQP);
		L_YXQP.RegVar("projectionMatrix", QPYX_get_projectionMatrix_YXQP, QPYX_set_projectionMatrix_YXQP);
		L_YXQP.RegVar("nonJitteredProjectionMatrix", QPYX_get_nonJitteredProjectionMatrix_YXQP, QPYX_set_nonJitteredProjectionMatrix_YXQP);
		L_YXQP.RegVar("useJitteredProjectionMatrixForTransparentRendering", QPYX_get_useJitteredProjectionMatrixForTransparentRendering_YXQP, QPYX_set_useJitteredProjectionMatrixForTransparentRendering_YXQP);
		L_YXQP.RegVar("previousViewProjectionMatrix", QPYX_get_previousViewProjectionMatrix_YXQP, null);
		L_YXQP.RegVar("velocity", QPYX_get_velocity_YXQP, null);
		L_YXQP.RegVar("clearFlags", QPYX_get_clearFlags_YXQP, QPYX_set_clearFlags_YXQP);
		L_YXQP.RegVar("stereoEnabled", QPYX_get_stereoEnabled_YXQP, null);
		L_YXQP.RegVar("stereoSeparation", QPYX_get_stereoSeparation_YXQP, QPYX_set_stereoSeparation_YXQP);
		L_YXQP.RegVar("stereoConvergence", QPYX_get_stereoConvergence_YXQP, QPYX_set_stereoConvergence_YXQP);
		L_YXQP.RegVar("cameraType", QPYX_get_cameraType_YXQP, QPYX_set_cameraType_YXQP);
		L_YXQP.RegVar("stereoTargetEye", QPYX_get_stereoTargetEye_YXQP, QPYX_set_stereoTargetEye_YXQP);
		L_YXQP.RegVar("areVRStereoViewMatricesWithinSingleCullTolerance", QPYX_get_areVRStereoViewMatricesWithinSingleCullTolerance_YXQP, null);
		L_YXQP.RegVar("stereoActiveEye", QPYX_get_stereoActiveEye_YXQP, null);
		L_YXQP.RegVar("targetDisplay", QPYX_get_targetDisplay_YXQP, QPYX_set_targetDisplay_YXQP);
		L_YXQP.RegVar("main", QPYX_get_main_YXQP, null);
		L_YXQP.RegVar("current", QPYX_get_current_YXQP, null);
		L_YXQP.RegVar("allCameras", QPYX_get_allCameras_YXQP, null);
		L_YXQP.RegVar("allCamerasCount", QPYX_get_allCamerasCount_YXQP, null);
		L_YXQP.RegVar("useOcclusionCulling", QPYX_get_useOcclusionCulling_YXQP, QPYX_set_useOcclusionCulling_YXQP);
		L_YXQP.RegVar("cullingMatrix", QPYX_get_cullingMatrix_YXQP, QPYX_set_cullingMatrix_YXQP);
		L_YXQP.RegVar("layerCullDistances", QPYX_get_layerCullDistances_YXQP, QPYX_set_layerCullDistances_YXQP);
		L_YXQP.RegVar("layerCullSpherical", QPYX_get_layerCullSpherical_YXQP, QPYX_set_layerCullSpherical_YXQP);
		L_YXQP.RegVar("depthTextureMode", QPYX_get_depthTextureMode_YXQP, QPYX_set_depthTextureMode_YXQP);
		L_YXQP.RegVar("clearStencilAfterLightingPass", QPYX_get_clearStencilAfterLightingPass_YXQP, QPYX_set_clearStencilAfterLightingPass_YXQP);
		L_YXQP.RegVar("commandBufferCount", QPYX_get_commandBufferCount_YXQP, null);
		L_YXQP.RegFunction("CameraCallback", QPYX_UnityEngine_Camera_CameraCallback_YXQP);
		L_YXQP.EndClass();
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX__CreateUnityEngine_Camera_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 0)
			{
				UnityEngine.Camera QPYX_obj_YXQP = new UnityEngine.Camera();
				ToLua.PushSealed(L_YXQP, QPYX_obj_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to ctor method: UnityEngine.Camera.New");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetTargetBuffers_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<UnityEngine.RenderBuffer[], UnityEngine.RenderBuffer>(L_YXQP, 2))
			{
				UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
				UnityEngine.RenderBuffer[] QPYX_arg0_YXQP = ToLua.ToStructArray<UnityEngine.RenderBuffer>(L_YXQP, 2);
				UnityEngine.RenderBuffer QPYX_arg1_YXQP = StackTraits<UnityEngine.RenderBuffer>.To(L_YXQP, 3);
				QPYX_obj_YXQP.SetTargetBuffers(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<UnityEngine.RenderBuffer, UnityEngine.RenderBuffer>(L_YXQP, 2))
			{
				UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
				UnityEngine.RenderBuffer QPYX_arg0_YXQP = StackTraits<UnityEngine.RenderBuffer>.To(L_YXQP, 2);
				UnityEngine.RenderBuffer QPYX_arg1_YXQP = StackTraits<UnityEngine.RenderBuffer>.To(L_YXQP, 3);
				QPYX_obj_YXQP.SetTargetBuffers(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				return 0;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Camera.SetTargetBuffers");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ResetWorldToCameraMatrix_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			QPYX_obj_YXQP.ResetWorldToCameraMatrix();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ResetProjectionMatrix_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			QPYX_obj_YXQP.ResetProjectionMatrix();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ResetAspect_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			QPYX_obj_YXQP.ResetAspect();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetStereoViewMatrix_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			UnityEngine.Camera.StereoscopicEye QPYX_arg0_YXQP = (UnityEngine.Camera.StereoscopicEye)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.Camera.StereoscopicEye));
			UnityEngine.Matrix4x4 QPYX_o_YXQP = QPYX_obj_YXQP.GetStereoViewMatrix(QPYX_arg0_YXQP);
			ToLua.PushValue(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetStereoViewMatrix_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			UnityEngine.Camera.StereoscopicEye QPYX_arg0_YXQP = (UnityEngine.Camera.StereoscopicEye)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.Camera.StereoscopicEye));
			UnityEngine.Matrix4x4 QPYX_arg1_YXQP = StackTraits<UnityEngine.Matrix4x4>.Check(L_YXQP, 3);
			QPYX_obj_YXQP.SetStereoViewMatrix(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ResetStereoViewMatrices_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			QPYX_obj_YXQP.ResetStereoViewMatrices();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetStereoProjectionMatrix_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			UnityEngine.Camera.StereoscopicEye QPYX_arg0_YXQP = (UnityEngine.Camera.StereoscopicEye)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.Camera.StereoscopicEye));
			UnityEngine.Matrix4x4 QPYX_o_YXQP = QPYX_obj_YXQP.GetStereoProjectionMatrix(QPYX_arg0_YXQP);
			ToLua.PushValue(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetStereoProjectionMatrix_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			UnityEngine.Camera.StereoscopicEye QPYX_arg0_YXQP = (UnityEngine.Camera.StereoscopicEye)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.Camera.StereoscopicEye));
			UnityEngine.Matrix4x4 QPYX_arg1_YXQP = StackTraits<UnityEngine.Matrix4x4>.Check(L_YXQP, 3);
			QPYX_obj_YXQP.SetStereoProjectionMatrix(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CalculateFrustumCorners_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 5);
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			UnityEngine.Rect QPYX_arg0_YXQP = StackTraits<UnityEngine.Rect>.Check(L_YXQP, 2);
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			UnityEngine.Camera.MonoOrStereoscopicEye QPYX_arg2_YXQP = (UnityEngine.Camera.MonoOrStereoscopicEye)ToLua.CheckObject(L_YXQP, 4, typeof(UnityEngine.Camera.MonoOrStereoscopicEye));
			UnityEngine.Vector3[] QPYX_arg3_YXQP = ToLua.CheckStructArray<UnityEngine.Vector3>(L_YXQP, 5);
			QPYX_obj_YXQP.CalculateFrustumCorners(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ResetStereoProjectionMatrices_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			QPYX_obj_YXQP.ResetStereoProjectionMatrices();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ResetTransparencySortSettings_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			QPYX_obj_YXQP.ResetTransparencySortSettings();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_WorldToScreenPoint_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
			UnityEngine.Vector3 QPYX_o_YXQP = QPYX_obj_YXQP.WorldToScreenPoint(QPYX_arg0_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_WorldToViewportPoint_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
			UnityEngine.Vector3 QPYX_o_YXQP = QPYX_obj_YXQP.WorldToViewportPoint(QPYX_arg0_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ViewportToWorldPoint_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
			UnityEngine.Vector3 QPYX_o_YXQP = QPYX_obj_YXQP.ViewportToWorldPoint(QPYX_arg0_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ScreenToWorldPoint_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
			UnityEngine.Vector3 QPYX_o_YXQP = QPYX_obj_YXQP.ScreenToWorldPoint(QPYX_arg0_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ScreenToViewportPoint_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
			UnityEngine.Vector3 QPYX_o_YXQP = QPYX_obj_YXQP.ScreenToViewportPoint(QPYX_arg0_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ViewportToScreenPoint_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
			UnityEngine.Vector3 QPYX_o_YXQP = QPYX_obj_YXQP.ViewportToScreenPoint(QPYX_arg0_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ViewportPointToRay_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
			UnityEngine.Ray QPYX_o_YXQP = QPYX_obj_YXQP.ViewportPointToRay(QPYX_arg0_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ScreenPointToRay_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
			UnityEngine.Ray QPYX_o_YXQP = QPYX_obj_YXQP.ScreenPointToRay(QPYX_arg0_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetAllCameras_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Camera[] QPYX_arg0_YXQP = ToLua.CheckObjectArray<UnityEngine.Camera>(L_YXQP, 1);
			int QPYX_o_YXQP = UnityEngine.Camera.GetAllCameras(QPYX_arg0_YXQP);
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_Render_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			QPYX_obj_YXQP.Render();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_RenderWithShader_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			UnityEngine.Shader QPYX_arg0_YXQP = (UnityEngine.Shader)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.Shader));
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 3);
			QPYX_obj_YXQP.RenderWithShader(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetReplacementShader_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			UnityEngine.Shader QPYX_arg0_YXQP = (UnityEngine.Shader)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.Shader));
			string QPYX_arg1_YXQP = ToLua.CheckString(L_YXQP, 3);
			QPYX_obj_YXQP.SetReplacementShader(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ResetReplacementShader_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			QPYX_obj_YXQP.ResetReplacementShader();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_ResetCullingMatrix_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			QPYX_obj_YXQP.ResetCullingMatrix();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_RenderDontRestore_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			QPYX_obj_YXQP.RenderDontRestore();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_SetupCurrent_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Camera QPYX_arg0_YXQP = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			UnityEngine.Camera.SetupCurrent(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_RenderToCubemap_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);
			if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<UnityEngine.RenderTexture>(L_YXQP, 2))
			{
				UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
				UnityEngine.RenderTexture QPYX_arg0_YXQP = (UnityEngine.RenderTexture)ToLua.ToObject(L_YXQP, 2);
				bool QPYX_o_YXQP = QPYX_obj_YXQP.RenderToCubemap(QPYX_arg0_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2 && TypeChecker.CheckTypes<UnityEngine.Cubemap>(L_YXQP, 2))
			{
				UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
				UnityEngine.Cubemap QPYX_arg0_YXQP = (UnityEngine.Cubemap)ToLua.ToObject(L_YXQP, 2);
				bool QPYX_o_YXQP = QPYX_obj_YXQP.RenderToCubemap(QPYX_arg0_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<UnityEngine.RenderTexture, int>(L_YXQP, 2))
			{
				UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
				UnityEngine.RenderTexture QPYX_arg0_YXQP = (UnityEngine.RenderTexture)ToLua.ToObject(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 3);
				bool QPYX_o_YXQP = QPYX_obj_YXQP.RenderToCubemap(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<UnityEngine.Cubemap, int>(L_YXQP, 2))
			{
				UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
				UnityEngine.Cubemap QPYX_arg0_YXQP = (UnityEngine.Cubemap)ToLua.ToObject(L_YXQP, 2);
				int QPYX_arg1_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 3);
				bool QPYX_o_YXQP = QPYX_obj_YXQP.RenderToCubemap(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushboolean(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Camera.RenderToCubemap");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CopyFrom_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			UnityEngine.Camera QPYX_arg0_YXQP = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.Camera));
			QPYX_obj_YXQP.CopyFrom(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_AddCommandBuffer_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			UnityEngine.Rendering.CameraEvent QPYX_arg0_YXQP = (UnityEngine.Rendering.CameraEvent)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.Rendering.CameraEvent));
			UnityEngine.Rendering.CommandBuffer QPYX_arg1_YXQP = (UnityEngine.Rendering.CommandBuffer)ToLua.CheckObject(L_YXQP, 3, typeof(UnityEngine.Rendering.CommandBuffer));
			QPYX_obj_YXQP.AddCommandBuffer(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_RemoveCommandBuffer_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			UnityEngine.Rendering.CameraEvent QPYX_arg0_YXQP = (UnityEngine.Rendering.CameraEvent)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.Rendering.CameraEvent));
			UnityEngine.Rendering.CommandBuffer QPYX_arg1_YXQP = (UnityEngine.Rendering.CommandBuffer)ToLua.CheckObject(L_YXQP, 3, typeof(UnityEngine.Rendering.CommandBuffer));
			QPYX_obj_YXQP.RemoveCommandBuffer(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_RemoveCommandBuffers_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			UnityEngine.Rendering.CameraEvent QPYX_arg0_YXQP = (UnityEngine.Rendering.CameraEvent)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.Rendering.CameraEvent));
			QPYX_obj_YXQP.RemoveCommandBuffers(QPYX_arg0_YXQP);
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_RemoveAllCommandBuffers_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 1);
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			QPYX_obj_YXQP.RemoveAllCommandBuffers();
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetCommandBuffers_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			UnityEngine.Rendering.CameraEvent QPYX_arg0_YXQP = (UnityEngine.Rendering.CameraEvent)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.Rendering.CameraEvent));
			UnityEngine.Rendering.CommandBuffer[] QPYX_o_YXQP = QPYX_obj_YXQP.GetCommandBuffers(QPYX_arg0_YXQP);
			ToLua.Push(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CalculateObliqueMatrix_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			UnityEngine.Vector4 QPYX_arg0_YXQP = ToLua.ToVector4(L_YXQP, 2);
			UnityEngine.Matrix4x4 QPYX_o_YXQP = QPYX_obj_YXQP.CalculateObliqueMatrix(QPYX_arg0_YXQP);
			ToLua.PushValue(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GetStereoNonJitteredProjectionMatrix_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			UnityEngine.Camera.StereoscopicEye QPYX_arg0_YXQP = (UnityEngine.Camera.StereoscopicEye)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.Camera.StereoscopicEye));
			UnityEngine.Matrix4x4 QPYX_o_YXQP = QPYX_obj_YXQP.GetStereoNonJitteredProjectionMatrix(QPYX_arg0_YXQP);
			ToLua.PushValue(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_CopyStereoDeviceProjectionMatrixToNonJittered_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 2);
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			UnityEngine.Camera.StereoscopicEye QPYX_arg0_YXQP = (UnityEngine.Camera.StereoscopicEye)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.Camera.StereoscopicEye));
			QPYX_obj_YXQP.CopyStereoDeviceProjectionMatrixToNonJittered(QPYX_arg0_YXQP);
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
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
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
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
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
				UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
				int QPYX_o_YXQP = QPYX_obj_YXQP.DORewind();
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				int QPYX_o_YXQP = QPYX_obj_YXQP.DORewind(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Camera.DORewind");
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
				UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
				int QPYX_o_YXQP = QPYX_obj_YXQP.DORestart();
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				int QPYX_o_YXQP = QPYX_obj_YXQP.DORestart(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Camera.DORestart");
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
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
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
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
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
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
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
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
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
				UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				int QPYX_o_YXQP = QPYX_obj_YXQP.DOGoto(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3)
			{
				UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				bool QPYX_arg1_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 3);
				int QPYX_o_YXQP = QPYX_obj_YXQP.DOGoto(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Camera.DOGoto");
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
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
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
				UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
				int QPYX_o_YXQP = QPYX_obj_YXQP.DOKill();
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				int QPYX_o_YXQP = QPYX_obj_YXQP.DOKill(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Camera.DOKill");
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
				UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
				int QPYX_o_YXQP = QPYX_obj_YXQP.DOComplete();
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 2)
			{
				UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
				bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
				int QPYX_o_YXQP = QPYX_obj_YXQP.DOComplete(QPYX_arg0_YXQP);
				LuaDLL.lua_pushinteger(L_YXQP,QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Camera.DOComplete");
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
				UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOShakeRotation(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<UnityEngine.Vector3>(L_YXQP, 3))
			{
				UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOShakeRotation(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<float>(L_YXQP, 3))
			{
				UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOShakeRotation(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<float, int>(L_YXQP, 3))
			{
				UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOShakeRotation(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<UnityEngine.Vector3, int>(L_YXQP, 3))
			{
				UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOShakeRotation(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5 && TypeChecker.CheckTypes<float, int, float>(L_YXQP, 3))
			{
				UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
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
				UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
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
				UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
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
				UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
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
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Camera.DOShakeRotation");
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
				UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOShakePosition(QPYX_arg0_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<UnityEngine.Vector3>(L_YXQP, 3))
			{
				UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOShakePosition(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 3 && TypeChecker.CheckTypes<float>(L_YXQP, 3))
			{
				UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOShakePosition(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<float, int>(L_YXQP, 3))
			{
				UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOShakePosition(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 4 && TypeChecker.CheckTypes<UnityEngine.Vector3, int>(L_YXQP, 3))
			{
				UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				UnityEngine.Vector3 QPYX_arg1_YXQP = ToLua.ToVector3(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOShakePosition(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else if (QPYX_count_YXQP == 5 && TypeChecker.CheckTypes<float, int, float>(L_YXQP, 3))
			{
				UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
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
				UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
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
				UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
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
				UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
				float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
				float QPYX_arg1_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 3);
				int QPYX_arg2_YXQP = (int)LuaDLL.lua_tonumber(L_YXQP, 4);
				float QPYX_arg3_YXQP = (float)LuaDLL.lua_tonumber(L_YXQP, 5);
				bool QPYX_arg4_YXQP = LuaDLL.lua_toboolean(L_YXQP, 6);
				DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOShakePosition(QPYX_arg0_YXQP, QPYX_arg1_YXQP, QPYX_arg2_YXQP, QPYX_arg3_YXQP, QPYX_arg4_YXQP);
				ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
				return 1;
			}
			else
			{
				return LuaDLL.luaL_throw(L_YXQP, "invalid arguments to method: UnityEngine.Camera.DOShakePosition");
			}
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DORect_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			UnityEngine.Rect QPYX_arg0_YXQP = StackTraits<UnityEngine.Rect>.Check(L_YXQP, 2);
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DORect(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOPixelRect_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			UnityEngine.Rect QPYX_arg0_YXQP = StackTraits<UnityEngine.Rect>.Check(L_YXQP, 2);
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOPixelRect(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOOrthoSize_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOOrthoSize(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DONearClipPlane_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DONearClipPlane(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOFieldOfView_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOFieldOfView(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOFarClipPlane_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOFarClipPlane(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOColor_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			UnityEngine.Color QPYX_arg0_YXQP = ToLua.ToColor(L_YXQP, 2);
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOColor(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DOAspect_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.CheckArgsCount(L_YXQP, 3);
			UnityEngine.Camera  QPYX_obj_YXQP  = (UnityEngine.Camera)ToLua.CheckObject(L_YXQP, 1, typeof(UnityEngine.Camera));
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			float QPYX_arg1_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 3);
			DG.Tweening.Tweener QPYX_o_YXQP = QPYX_obj_YXQP.DOAspect(QPYX_arg0_YXQP, QPYX_arg1_YXQP);
			ToLua.PushObject(L_YXQP, QPYX_o_YXQP);
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
	static int QPYX_get_onPreCull_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.Camera.onPreCull);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onPreRender_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.Camera.onPreRender);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_onPostRender_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.Camera.onPostRender);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_fieldOfView_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.fieldOfView;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index fieldOfView on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_nearClipPlane_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.nearClipPlane;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index nearClipPlane on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_farClipPlane_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.farClipPlane;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index farClipPlane on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_renderingPath_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			UnityEngine.RenderingPath QPYX_ret_YXQP = QPYX_obj_YXQP.renderingPath;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index renderingPath on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_actualRenderingPath_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			UnityEngine.RenderingPath QPYX_ret_YXQP = QPYX_obj_YXQP.actualRenderingPath;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index actualRenderingPath on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_allowHDR_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.allowHDR;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index allowHDR on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_forceIntoRenderTexture_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.forceIntoRenderTexture;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index forceIntoRenderTexture on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_allowMSAA_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.allowMSAA;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index allowMSAA on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_allowDynamicResolution_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.allowDynamicResolution;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index allowDynamicResolution on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_orthographicSize_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.orthographicSize;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index orthographicSize on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_orthographic_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.orthographic;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index orthographic on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_opaqueSortMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			UnityEngine.Rendering.OpaqueSortMode QPYX_ret_YXQP = QPYX_obj_YXQP.opaqueSortMode;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index opaqueSortMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_transparencySortMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			UnityEngine.TransparencySortMode QPYX_ret_YXQP = QPYX_obj_YXQP.transparencySortMode;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index transparencySortMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_transparencySortAxis_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_ret_YXQP = QPYX_obj_YXQP.transparencySortAxis;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index transparencySortAxis on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_depth_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.depth;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index depth on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_aspect_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.aspect;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index aspect on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_cullingMask_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.cullingMask;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index cullingMask on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_scene_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			UnityEngine.SceneManagement.Scene QPYX_ret_YXQP = QPYX_obj_YXQP.scene;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index scene on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_eventMask_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.eventMask;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index eventMask on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_backgroundColor_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			UnityEngine.Color QPYX_ret_YXQP = QPYX_obj_YXQP.backgroundColor;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index backgroundColor on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_rect_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			UnityEngine.Rect QPYX_ret_YXQP = QPYX_obj_YXQP.rect;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index rect on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_pixelRect_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			UnityEngine.Rect QPYX_ret_YXQP = QPYX_obj_YXQP.pixelRect;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index pixelRect on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_targetTexture_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			UnityEngine.RenderTexture QPYX_ret_YXQP = QPYX_obj_YXQP.targetTexture;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index targetTexture on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_activeTexture_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			UnityEngine.RenderTexture QPYX_ret_YXQP = QPYX_obj_YXQP.activeTexture;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index activeTexture on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_pixelWidth_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.pixelWidth;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index pixelWidth on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_pixelHeight_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.pixelHeight;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index pixelHeight on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_scaledPixelWidth_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.scaledPixelWidth;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index scaledPixelWidth on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_scaledPixelHeight_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.scaledPixelHeight;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index scaledPixelHeight on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_cameraToWorldMatrix_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			UnityEngine.Matrix4x4 QPYX_ret_YXQP = QPYX_obj_YXQP.cameraToWorldMatrix;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index cameraToWorldMatrix on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_worldToCameraMatrix_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			UnityEngine.Matrix4x4 QPYX_ret_YXQP = QPYX_obj_YXQP.worldToCameraMatrix;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index worldToCameraMatrix on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_projectionMatrix_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			UnityEngine.Matrix4x4 QPYX_ret_YXQP = QPYX_obj_YXQP.projectionMatrix;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index projectionMatrix on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_nonJitteredProjectionMatrix_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			UnityEngine.Matrix4x4 QPYX_ret_YXQP = QPYX_obj_YXQP.nonJitteredProjectionMatrix;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index nonJitteredProjectionMatrix on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_useJitteredProjectionMatrixForTransparentRendering_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.useJitteredProjectionMatrixForTransparentRendering;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index useJitteredProjectionMatrixForTransparentRendering on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_previousViewProjectionMatrix_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			UnityEngine.Matrix4x4 QPYX_ret_YXQP = QPYX_obj_YXQP.previousViewProjectionMatrix;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index previousViewProjectionMatrix on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_velocity_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_ret_YXQP = QPYX_obj_YXQP.velocity;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index velocity on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_clearFlags_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			UnityEngine.CameraClearFlags QPYX_ret_YXQP = QPYX_obj_YXQP.clearFlags;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index clearFlags on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_stereoEnabled_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.stereoEnabled;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index stereoEnabled on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_stereoSeparation_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.stereoSeparation;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index stereoSeparation on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_stereoConvergence_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			float QPYX_ret_YXQP = QPYX_obj_YXQP.stereoConvergence;
			LuaDLL.lua_pushnumber(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index stereoConvergence on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_cameraType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			UnityEngine.CameraType QPYX_ret_YXQP = QPYX_obj_YXQP.cameraType;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index cameraType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_stereoTargetEye_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			UnityEngine.StereoTargetEyeMask QPYX_ret_YXQP = QPYX_obj_YXQP.stereoTargetEye;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index stereoTargetEye on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_areVRStereoViewMatricesWithinSingleCullTolerance_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.areVRStereoViewMatricesWithinSingleCullTolerance;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index areVRStereoViewMatricesWithinSingleCullTolerance on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_stereoActiveEye_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			UnityEngine.Camera.MonoOrStereoscopicEye QPYX_ret_YXQP = QPYX_obj_YXQP.stereoActiveEye;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index stereoActiveEye on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_targetDisplay_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.targetDisplay;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index targetDisplay on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_main_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.PushSealed(L_YXQP, UnityEngine.Camera.main);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_current_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.PushSealed(L_YXQP, UnityEngine.Camera.current);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_allCameras_YXQP(IntPtr L_YXQP)
	{
		try
		{
			ToLua.Push(L_YXQP, UnityEngine.Camera.allCameras);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_allCamerasCount_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaDLL.lua_pushinteger(L_YXQP,UnityEngine.Camera.allCamerasCount);
			return 1;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_useOcclusionCulling_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.useOcclusionCulling;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index useOcclusionCulling on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_cullingMatrix_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			UnityEngine.Matrix4x4 QPYX_ret_YXQP = QPYX_obj_YXQP.cullingMatrix;
			ToLua.PushValue(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index cullingMatrix on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_layerCullDistances_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			float[] QPYX_ret_YXQP = QPYX_obj_YXQP.layerCullDistances;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index layerCullDistances on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_layerCullSpherical_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.layerCullSpherical;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index layerCullSpherical on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_depthTextureMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			UnityEngine.DepthTextureMode QPYX_ret_YXQP = QPYX_obj_YXQP.depthTextureMode;
			ToLua.Push(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index depthTextureMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_clearStencilAfterLightingPass_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			bool QPYX_ret_YXQP = QPYX_obj_YXQP.clearStencilAfterLightingPass;
			LuaDLL.lua_pushboolean(L_YXQP, QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index clearStencilAfterLightingPass on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_get_commandBufferCount_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			int QPYX_ret_YXQP = QPYX_obj_YXQP.commandBufferCount;
			LuaDLL.lua_pushinteger(L_YXQP,QPYX_ret_YXQP);
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index commandBufferCount on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onPreCull_YXQP(IntPtr L_YXQP)
	{
		try
		{
			UnityEngine.Camera.CameraCallback QPYX_arg0_YXQP = (UnityEngine.Camera.CameraCallback)ToLua.CheckDelegate<UnityEngine.Camera.CameraCallback>(L_YXQP, 2);
			UnityEngine.Camera.onPreCull = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onPreRender_YXQP(IntPtr L_YXQP)
	{
		try
		{
			UnityEngine.Camera.CameraCallback QPYX_arg0_YXQP = (UnityEngine.Camera.CameraCallback)ToLua.CheckDelegate<UnityEngine.Camera.CameraCallback>(L_YXQP, 2);
			UnityEngine.Camera.onPreRender = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_onPostRender_YXQP(IntPtr L_YXQP)
	{
		try
		{
			UnityEngine.Camera.CameraCallback QPYX_arg0_YXQP = (UnityEngine.Camera.CameraCallback)ToLua.CheckDelegate<UnityEngine.Camera.CameraCallback>(L_YXQP, 2);
			UnityEngine.Camera.onPostRender = QPYX_arg0_YXQP;
			return 0;
		}
		catch (Exception e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_fieldOfView_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.fieldOfView = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index fieldOfView on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_nearClipPlane_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.nearClipPlane = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index nearClipPlane on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_farClipPlane_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.farClipPlane = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index farClipPlane on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_renderingPath_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			UnityEngine.RenderingPath QPYX_arg0_YXQP = (UnityEngine.RenderingPath)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.RenderingPath));
			QPYX_obj_YXQP.renderingPath = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index renderingPath on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_allowHDR_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.allowHDR = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index allowHDR on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_forceIntoRenderTexture_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.forceIntoRenderTexture = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index forceIntoRenderTexture on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_allowMSAA_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.allowMSAA = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index allowMSAA on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_allowDynamicResolution_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.allowDynamicResolution = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index allowDynamicResolution on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_orthographicSize_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.orthographicSize = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index orthographicSize on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_orthographic_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.orthographic = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index orthographic on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_opaqueSortMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			UnityEngine.Rendering.OpaqueSortMode QPYX_arg0_YXQP = (UnityEngine.Rendering.OpaqueSortMode)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.Rendering.OpaqueSortMode));
			QPYX_obj_YXQP.opaqueSortMode = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index opaqueSortMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_transparencySortMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			UnityEngine.TransparencySortMode QPYX_arg0_YXQP = (UnityEngine.TransparencySortMode)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.TransparencySortMode));
			QPYX_obj_YXQP.transparencySortMode = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index transparencySortMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_transparencySortAxis_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			UnityEngine.Vector3 QPYX_arg0_YXQP = ToLua.ToVector3(L_YXQP, 2);
			QPYX_obj_YXQP.transparencySortAxis = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index transparencySortAxis on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_depth_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.depth = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index depth on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_aspect_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.aspect = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index aspect on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_cullingMask_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.cullingMask = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index cullingMask on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_scene_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			UnityEngine.SceneManagement.Scene QPYX_arg0_YXQP = StackTraits<UnityEngine.SceneManagement.Scene>.Check(L_YXQP, 2);
			QPYX_obj_YXQP.scene = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index scene on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_eventMask_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.eventMask = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index eventMask on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_backgroundColor_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			UnityEngine.Color QPYX_arg0_YXQP = ToLua.ToColor(L_YXQP, 2);
			QPYX_obj_YXQP.backgroundColor = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index backgroundColor on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_rect_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			UnityEngine.Rect QPYX_arg0_YXQP = StackTraits<UnityEngine.Rect>.Check(L_YXQP, 2);
			QPYX_obj_YXQP.rect = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index rect on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_pixelRect_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			UnityEngine.Rect QPYX_arg0_YXQP = StackTraits<UnityEngine.Rect>.Check(L_YXQP, 2);
			QPYX_obj_YXQP.pixelRect = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index pixelRect on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_targetTexture_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			UnityEngine.RenderTexture QPYX_arg0_YXQP = (UnityEngine.RenderTexture)ToLua.CheckObject<UnityEngine.RenderTexture>(L_YXQP, 2);
			QPYX_obj_YXQP.targetTexture = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index targetTexture on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_worldToCameraMatrix_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			UnityEngine.Matrix4x4 QPYX_arg0_YXQP = StackTraits<UnityEngine.Matrix4x4>.Check(L_YXQP, 2);
			QPYX_obj_YXQP.worldToCameraMatrix = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index worldToCameraMatrix on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_projectionMatrix_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			UnityEngine.Matrix4x4 QPYX_arg0_YXQP = StackTraits<UnityEngine.Matrix4x4>.Check(L_YXQP, 2);
			QPYX_obj_YXQP.projectionMatrix = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index projectionMatrix on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_nonJitteredProjectionMatrix_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			UnityEngine.Matrix4x4 QPYX_arg0_YXQP = StackTraits<UnityEngine.Matrix4x4>.Check(L_YXQP, 2);
			QPYX_obj_YXQP.nonJitteredProjectionMatrix = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index nonJitteredProjectionMatrix on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_useJitteredProjectionMatrixForTransparentRendering_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.useJitteredProjectionMatrixForTransparentRendering = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index useJitteredProjectionMatrixForTransparentRendering on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_clearFlags_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			UnityEngine.CameraClearFlags QPYX_arg0_YXQP = (UnityEngine.CameraClearFlags)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.CameraClearFlags));
			QPYX_obj_YXQP.clearFlags = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index clearFlags on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_stereoSeparation_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.stereoSeparation = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index stereoSeparation on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_stereoConvergence_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			float QPYX_arg0_YXQP = (float)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.stereoConvergence = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index stereoConvergence on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_cameraType_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			UnityEngine.CameraType QPYX_arg0_YXQP = (UnityEngine.CameraType)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.CameraType));
			QPYX_obj_YXQP.cameraType = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index cameraType on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_stereoTargetEye_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			UnityEngine.StereoTargetEyeMask QPYX_arg0_YXQP = (UnityEngine.StereoTargetEyeMask)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.StereoTargetEyeMask));
			QPYX_obj_YXQP.stereoTargetEye = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index stereoTargetEye on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_targetDisplay_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			int QPYX_arg0_YXQP = (int)LuaDLL.luaL_checknumber(L_YXQP, 2);
			QPYX_obj_YXQP.targetDisplay = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index targetDisplay on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_useOcclusionCulling_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.useOcclusionCulling = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index useOcclusionCulling on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_cullingMatrix_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			UnityEngine.Matrix4x4 QPYX_arg0_YXQP = StackTraits<UnityEngine.Matrix4x4>.Check(L_YXQP, 2);
			QPYX_obj_YXQP.cullingMatrix = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index cullingMatrix on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_layerCullDistances_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			float[] QPYX_arg0_YXQP = ToLua.CheckNumberArray<float>(L_YXQP, 2);
			QPYX_obj_YXQP.layerCullDistances = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index layerCullDistances on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_layerCullSpherical_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.layerCullSpherical = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index layerCullSpherical on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_depthTextureMode_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			UnityEngine.DepthTextureMode QPYX_arg0_YXQP = (UnityEngine.DepthTextureMode)ToLua.CheckObject(L_YXQP, 2, typeof(UnityEngine.DepthTextureMode));
			QPYX_obj_YXQP.depthTextureMode = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index depthTextureMode on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_set_clearStencilAfterLightingPass_YXQP(IntPtr L_YXQP)
	{
		object QPYX_o_YXQP = null;
		try
		{
			QPYX_o_YXQP = ToLua.ToObject(L_YXQP, 1);			UnityEngine.Camera QPYX_obj_YXQP = (UnityEngine.Camera)QPYX_o_YXQP;
			bool QPYX_arg0_YXQP = LuaDLL.luaL_checkboolean(L_YXQP, 2);
			QPYX_obj_YXQP.clearStencilAfterLightingPass = QPYX_arg0_YXQP;
			return 0;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP, QPYX_o_YXQP, "attempt to index clearStencilAfterLightingPass on a nil value");
		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UnityEngine_Camera_CameraCallback_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.Camera.CameraCallback>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.Camera.CameraCallback>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}
}

