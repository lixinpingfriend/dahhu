using System;
using UnityEngine;
using LuaInterface;

public static class LuaBinder
{
	public static void Bind(LuaState L_YXQP)	{
		float QPYX_t_YXQP = Time.realtimeSinceStartup;		L_YXQP.BeginModule(null);		QPYX_MonoSingletonProject_GameConfigProjectWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_SingletonProject_GameAsset_AssetBundleManagerWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_TextWrapExWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_TextWrapWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UIStateSwitcherWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_ToggleCtrlWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_SpriteHolderWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UIImageAnimationWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_LuaInterface_DebuggerWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		L_YXQP.BeginModule("UnityEngine");
		QPYX_UnityEngine_PlayerPrefsWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_CanvasWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_CanvasGroupWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_RectTransformWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_RectWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_SpriteWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_ComponentWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_TransformWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_CameraWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_AudioSourceWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_BehaviourWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_MonoBehaviourWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_GameObjectWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_ApplicationWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_ImageConversionWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_TimeWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_DebugWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_WWWWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_WWWFormWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_ScreenWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_AudioClipWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_MicrophoneWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_AssetBundleWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_SleepTimeoutWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_InputWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_RendererWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_Collider2DWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_TrackedReferenceWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		L_YXQP.BeginModule("Events");
		QPYX_UnityEngine_Events_UnityEventWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_Events_UnityEvent_floatWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_Events_UnityEventBaseWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_Events_UnityEvent_LoopBaseNodeWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_Events_UnityEvent_UnityEngine_Vector3Wrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_Events_UnityEvent_boolWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_Events_UnityEvent_stringWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_Events_UnityEvent_intWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_Events_UnityEvent_UnityEngine_Vector2Wrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		L_YXQP.RegFunction("UnityAction", QPYX_UnityEngine_Events_UnityAction_YXQP);
		L_YXQP.RegFunction("UnityAction_string", QPYX_UnityEngine_Events_UnityAction_string_YXQP);
		L_YXQP.RegFunction("UnityAction_float", QPYX_UnityEngine_Events_UnityAction_float_YXQP);
		L_YXQP.RegFunction("UnityAction_bool", QPYX_UnityEngine_Events_UnityAction_bool_YXQP);
		L_YXQP.RegFunction("UnityAction_int", QPYX_UnityEngine_Events_UnityAction_int_YXQP);
		L_YXQP.RegFunction("UnityAction_UnityEngine_Vector2", QPYX_UnityEngine_Events_UnityAction_UnityEngine_Vector2_YXQP);
		L_YXQP.RegFunction("UnityAction_LoopBaseNode", QPYX_UnityEngine_Events_UnityAction_LoopBaseNode_YXQP);
		L_YXQP.RegFunction("UnityAction_UnityEngine_Vector3", QPYX_UnityEngine_Events_UnityAction_UnityEngine_Vector3_YXQP);
		L_YXQP.EndModule();		L_YXQP.BeginModule("UI");
		QPYX_UnityEngine_UI_TextWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_UI_ToggleWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_UI_ImageWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_UI_ButtonWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_UI_SliderWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_UI_ToggleGroupWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_UI_InputFieldWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_UI_GraphicWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_UI_ScrollRectWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_UI_ScrollbarWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_UI_DropdownWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_UI_GridLayoutGroupWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_UI_RawImageWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_UI_ContentSizeFitterWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_UI_LayoutRebuilderWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_UI_OutlineWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_UI_MaskableGraphicWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_UI_SelectableWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_UI_LayoutGroupWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_UI_ShadowWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_UI_BaseMeshEffectWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_UI_HorizontalOrVerticalLayoutGroupWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		L_YXQP.BeginModule("Toggle");
		QPYX_UnityEngine_UI_Toggle_ToggleEventWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		L_YXQP.EndModule();		L_YXQP.BeginModule("InputField");
		QPYX_UnityEngine_UI_InputField_OnChangeEventWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		L_YXQP.RegFunction("OnValidateInput", QPYX_UnityEngine_UI_InputField_OnValidateInput_YXQP);
		L_YXQP.EndModule();		L_YXQP.BeginModule("Dropdown");
		QPYX_UnityEngine_UI_Dropdown_OptionDataWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_UI_Dropdown_OptionDataListWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_UI_Dropdown_DropdownEventWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		L_YXQP.EndModule();		L_YXQP.BeginModule("ContentSizeFitter");
		QPYX_UnityEngine_UI_ContentSizeFitter_FitModeWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		L_YXQP.EndModule();		L_YXQP.BeginModule("ScrollRect");
		QPYX_UnityEngine_UI_ScrollRect_ScrollRectEventWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		L_YXQP.EndModule();		L_YXQP.BeginModule("Button");
		QPYX_UnityEngine_UI_Button_ButtonClickedEventWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		L_YXQP.EndModule();		L_YXQP.EndModule();		L_YXQP.BeginModule("Networking");
		L_YXQP.EndModule();		L_YXQP.BeginModule("EventSystems");
		QPYX_UnityEngine_EventSystems_BaseEventDataWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_EventSystems_AbstractEventDataWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_EventSystems_UIBehaviourWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		L_YXQP.EndModule();		L_YXQP.BeginModule("Canvas");
		L_YXQP.RegFunction("WillRenderCanvases", QPYX_UnityEngine_Canvas_WillRenderCanvases_YXQP);
		L_YXQP.EndModule();		L_YXQP.BeginModule("RectTransform");
		L_YXQP.RegFunction("ReapplyDrivenProperties", QPYX_UnityEngine_RectTransform_ReapplyDrivenProperties_YXQP);
		L_YXQP.EndModule();		L_YXQP.BeginModule("Camera");
		L_YXQP.RegFunction("CameraCallback", QPYX_UnityEngine_Camera_CameraCallback_YXQP);
		L_YXQP.EndModule();		L_YXQP.BeginModule("Application");
		L_YXQP.RegFunction("LowMemoryCallback", QPYX_UnityEngine_Application_LowMemoryCallback_YXQP);
		L_YXQP.RegFunction("AdvertisingIdentifierCallback", QPYX_UnityEngine_Application_AdvertisingIdentifierCallback_YXQP);
		L_YXQP.RegFunction("LogCallback", QPYX_UnityEngine_Application_LogCallback_YXQP);
		L_YXQP.EndModule();		L_YXQP.BeginModule("AudioClip");
		L_YXQP.RegFunction("PCMReaderCallback", QPYX_UnityEngine_AudioClip_PCMReaderCallback_YXQP);
		L_YXQP.RegFunction("PCMSetPositionCallback", QPYX_UnityEngine_AudioClip_PCMSetPositionCallback_YXQP);
		L_YXQP.EndModule();		L_YXQP.EndModule();		L_YXQP.BeginModule("LuaBridge");
		QPYX_GameSDKInterfaceWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_GameSDKCallbackWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_GameConfigProjectWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_NetworkManagerWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_SmartTimerWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_TimeEventWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_DNet_GameWebSocketClientWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_DNet_BufferWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_DNet_VideoDataWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_DNet_VideoFrameDataWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_ViewUtilWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_GameAsset_AssetBundleManagerWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_GameAsset_LoadedAssetBundleWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_LuaHelperWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_ComponentUtilWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_TransformUtilWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_CustomerUtilWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_UnityEngine_EventSystems_PointerEventDataWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_WWWOperationWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_WWWUtilWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_BestHttpOperationWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_BestHttpUtilWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_AudioPlayOperationWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_AudioPlayUtilWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_WavUtilityWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_AsyncFileOperationDataWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_AsyncFileUtilWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_SecurityUtilWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_FileUtilityWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_EmojiUtilWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_LoopScrollViewWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_LoopBaseNodeWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_LoopScrollView_OnDataChangeEventWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_LoopScrollView_OnContentPosChangeEventWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_ScrollMoveWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		L_YXQP.EndModule();		L_YXQP.BeginModule("UGUIExtend");
		QPYX_UGUIExtend_GameUGUIEventDispatcherWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		L_YXQP.EndModule();		L_YXQP.BeginModule("ComponentCache");
		QPYX_ComponentCache_Injection_UnityEngine_GameObjectWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_ComponentCache_Injection_UnityEngine_TransformWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_ComponentCache_Injection_UnityEngine_RectTransformWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_ComponentCache_Injection_UnityEngine_UI_ImageWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_ComponentCache_Injection_UnityEngine_UI_TextWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_ComponentCache_Injection_UnityEngine_UI_ToggleWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_ComponentCache_Injection_UnityEngine_UI_Toggle_ToggleEventWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_ComponentCache_Injection_UnityEngine_UI_ButtonWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_ComponentCache_Injection_UnityEngine_UI_SliderWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_ComponentCache_Injection_UnityEngine_UI_ToggleGroupWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_ComponentCache_Injection_UnityEngine_UI_InputFieldWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_ComponentCache_Injection_UnityEngine_UI_GraphicWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_ComponentCache_Injection_UnityEngine_UI_ScrollRectWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_ComponentCache_Injection_UnityEngine_UI_ScrollbarWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_ComponentCache_Injection_UnityEngine_UI_DropdownWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_ComponentCache_Injection_UnityEngine_UI_GridLayoutGroupWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_ComponentCache_Injection_UnityEngine_UI_RawImageWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_ComponentCache_Injection_UnityEngine_AudioSourceWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_ComponentCache_Injection_UnityEngine_AnimationWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_ComponentCache_Injection_UnityEngine_AnimatorWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_ComponentCache_Injection_SpriteAtlasWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_ComponentCache_Injection_SpriteHolderWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_ComponentCache_Injection_UIStateSwitcherWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_ComponentCache_Injection_TextWrapWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_ComponentCache_Injection_UIImageAnimationWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_ComponentCache_Injection_ComponentCacheWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		L_YXQP.EndModule();		L_YXQP.BeginModule("gcloud_voice");
		L_YXQP.BeginModule("IGCloudVoice");
		L_YXQP.RegFunction("JoinRoomCompleteHandler", QPYX_gcloud_voice_IGCloudVoice_JoinRoomCompleteHandler_YXQP);
		L_YXQP.RegFunction("QuitRoomCompleteHandler", QPYX_gcloud_voice_IGCloudVoice_QuitRoomCompleteHandler_YXQP);
		L_YXQP.RegFunction("MemberVoiceHandler", QPYX_gcloud_voice_IGCloudVoice_MemberVoiceHandler_YXQP);
		L_YXQP.RegFunction("ApplyMessageKeyCompleteHandler", QPYX_gcloud_voice_IGCloudVoice_ApplyMessageKeyCompleteHandler_YXQP);
		L_YXQP.RegFunction("UploadReccordFileCompleteHandler", QPYX_gcloud_voice_IGCloudVoice_UploadReccordFileCompleteHandler_YXQP);
		L_YXQP.RegFunction("DownloadRecordFileCompleteHandler", QPYX_gcloud_voice_IGCloudVoice_DownloadRecordFileCompleteHandler_YXQP);
		L_YXQP.RegFunction("PlayRecordFilCompleteHandler", QPYX_gcloud_voice_IGCloudVoice_PlayRecordFilCompleteHandler_YXQP);
		L_YXQP.RegFunction("SpeechToTextHandler", QPYX_gcloud_voice_IGCloudVoice_SpeechToTextHandler_YXQP);
		L_YXQP.RegFunction("StreamSpeechToTextHandler", QPYX_gcloud_voice_IGCloudVoice_StreamSpeechToTextHandler_YXQP);
		L_YXQP.RegFunction("StatusUpdateHandler", QPYX_gcloud_voice_IGCloudVoice_StatusUpdateHandler_YXQP);
		L_YXQP.RegFunction("ChangeRoleCompleteHandler", QPYX_gcloud_voice_IGCloudVoice_ChangeRoleCompleteHandler_YXQP);
		L_YXQP.RegFunction("RoomMemberVoiceHandler", QPYX_gcloud_voice_IGCloudVoice_RoomMemberVoiceHandler_YXQP);
		L_YXQP.RegFunction("EventUpdateHandler", QPYX_gcloud_voice_IGCloudVoice_EventUpdateHandler_YXQP);
		L_YXQP.RegFunction("MuteSwitchResultHandler", QPYX_gcloud_voice_IGCloudVoice_MuteSwitchResultHandler_YXQP);
		L_YXQP.EndModule();		L_YXQP.EndModule();		L_YXQP.BeginModule("littlerbird");
		L_YXQP.BeginModule("UI");
		L_YXQP.BeginModule("QuickGrid");
		L_YXQP.RegFunction("QuickGridItemEvenet", QPYX_littlerbird_UI_QuickGrid_QuickGridItemEvenet_YXQP);
		L_YXQP.RegFunction("ReturnQuickGridItemEvent_bool", QPYX_littlerbird_UI_QuickGrid_ReturnQuickGridItemEvent_bool_YXQP);
		L_YXQP.RegFunction("ReturnQuickGridItemEvent", QPYX_littlerbird_UI_QuickGrid_ReturnQuickGridItemEvent_YXQP);
		L_YXQP.RegFunction("QuickCallback", QPYX_littlerbird_UI_QuickGrid_QuickCallback_YXQP);
		L_YXQP.EndModule();		L_YXQP.EndModule();		L_YXQP.EndModule();		L_YXQP.BeginModule("DG");
		L_YXQP.BeginModule("Tweening");
		QPYX_DG_Tweening_DOTweenWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_DG_Tweening_TweenWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_DG_Tweening_SequenceWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_DG_Tweening_TweenerWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_DG_Tweening_LoopTypeWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_DG_Tweening_PathModeWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_DG_Tweening_PathTypeWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_DG_Tweening_RotateModeWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_DG_Tweening_EaseWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		L_YXQP.RegFunction("TweenCallback", QPYX_DG_Tweening_TweenCallback_YXQP);
		L_YXQP.RegFunction("TweenCallback_int", QPYX_DG_Tweening_TweenCallback_int_YXQP);
		L_YXQP.BeginModule("Core");
		QPYX_DG_Tweening_Core_TweenerCore_float_float_DG_Tweening_Plugins_Options_FloatOptionsWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_DG_Tweening_Core_TweenerCore_UnityEngine_Quaternion_UnityEngine_Vector3_DG_Tweening_Plugins_Options_PathOptionsWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_DG_Tweening_Core_TweenerCore_UnityEngine_Vector3_DG_Tweening_Plugins_Core_PathCore_Path_DG_Tweening_Plugins_Options_QuaternionOptionsWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		QPYX_TweenerCoreV3V3VOWrap_YXQP.QPYX_Register_YXQP(L_YXQP);
		L_YXQP.RegFunction("DOGetter_float", QPYX_DG_Tweening_Core_DOGetter_float_YXQP);
		L_YXQP.RegFunction("DOSetter_float", QPYX_DG_Tweening_Core_DOSetter_float_YXQP);
		L_YXQP.RegFunction("DOGetter_double", QPYX_DG_Tweening_Core_DOGetter_double_YXQP);
		L_YXQP.RegFunction("DOSetter_double", QPYX_DG_Tweening_Core_DOSetter_double_YXQP);
		L_YXQP.RegFunction("DOGetter_int", QPYX_DG_Tweening_Core_DOGetter_int_YXQP);
		L_YXQP.RegFunction("DOSetter_int", QPYX_DG_Tweening_Core_DOSetter_int_YXQP);
		L_YXQP.RegFunction("DOGetter_uint", QPYX_DG_Tweening_Core_DOGetter_uint_YXQP);
		L_YXQP.RegFunction("DOSetter_uint", QPYX_DG_Tweening_Core_DOSetter_uint_YXQP);
		L_YXQP.RegFunction("DOGetter_long", QPYX_DG_Tweening_Core_DOGetter_long_YXQP);
		L_YXQP.RegFunction("DOSetter_long", QPYX_DG_Tweening_Core_DOSetter_long_YXQP);
		L_YXQP.RegFunction("DOGetter_ulong", QPYX_DG_Tweening_Core_DOGetter_ulong_YXQP);
		L_YXQP.RegFunction("DOSetter_ulong", QPYX_DG_Tweening_Core_DOSetter_ulong_YXQP);
		L_YXQP.RegFunction("DOGetter_string", QPYX_DG_Tweening_Core_DOGetter_string_YXQP);
		L_YXQP.RegFunction("DOSetter_string", QPYX_DG_Tweening_Core_DOSetter_string_YXQP);
		L_YXQP.RegFunction("DOGetter_UnityEngine_Vector2", QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Vector2_YXQP);
		L_YXQP.RegFunction("DOSetter_UnityEngine_Vector2", QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Vector2_YXQP);
		L_YXQP.RegFunction("DOGetter_UnityEngine_Vector3", QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Vector3_YXQP);
		L_YXQP.RegFunction("DOSetter_UnityEngine_Vector3", QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Vector3_YXQP);
		L_YXQP.RegFunction("DOGetter_UnityEngine_Vector4", QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Vector4_YXQP);
		L_YXQP.RegFunction("DOSetter_UnityEngine_Vector4", QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Vector4_YXQP);
		L_YXQP.RegFunction("DOGetter_UnityEngine_Quaternion", QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Quaternion_YXQP);
		L_YXQP.RegFunction("DOSetter_UnityEngine_Quaternion", QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Quaternion_YXQP);
		L_YXQP.RegFunction("DOGetter_UnityEngine_Color", QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Color_YXQP);
		L_YXQP.RegFunction("DOSetter_UnityEngine_Color", QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Color_YXQP);
		L_YXQP.RegFunction("DOGetter_UnityEngine_Rect", QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Rect_YXQP);
		L_YXQP.RegFunction("DOSetter_UnityEngine_Rect", QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Rect_YXQP);
		L_YXQP.RegFunction("DOGetter_UnityEngine_RectOffset", QPYX_DG_Tweening_Core_DOGetter_UnityEngine_RectOffset_YXQP);
		L_YXQP.RegFunction("DOSetter_UnityEngine_RectOffset", QPYX_DG_Tweening_Core_DOSetter_UnityEngine_RectOffset_YXQP);
		L_YXQP.EndModule();		L_YXQP.EndModule();		L_YXQP.EndModule();		L_YXQP.BeginModule("BestHTTP");
		L_YXQP.RegFunction("OnUploadProgressDelegate", QPYX_BestHTTP_OnUploadProgressDelegate_YXQP);
		L_YXQP.RegFunction("OnDownloadProgressDelegate", QPYX_BestHTTP_OnDownloadProgressDelegate_YXQP);
		L_YXQP.RegFunction("OnRequestFinishedDelegate", QPYX_BestHTTP_OnRequestFinishedDelegate_YXQP);
		L_YXQP.RegFunction("OnBeforeRedirectionDelegate", QPYX_BestHTTP_OnBeforeRedirectionDelegate_YXQP);
		L_YXQP.RegFunction("OnBeforeHeaderSendDelegate", QPYX_BestHTTP_OnBeforeHeaderSendDelegate_YXQP);
		L_YXQP.RegFunction("OnHeaderEnumerationDelegate", QPYX_BestHTTP_OnHeaderEnumerationDelegate_YXQP);
		L_YXQP.EndModule();		L_YXQP.BeginModule("System");
		L_YXQP.RegFunction("Action", QPYX_System_Action_YXQP);
		L_YXQP.RegFunction("Action_int", QPYX_System_Action_int_YXQP);
		L_YXQP.RegFunction("Action_string", QPYX_System_Action_string_YXQP);
		L_YXQP.RegFunction("Predicate_int", QPYX_System_Predicate_int_YXQP);
		L_YXQP.RegFunction("Comparison_int", QPYX_System_Comparison_int_YXQP);
		L_YXQP.RegFunction("Action_TimeEvent", QPYX_System_Action_TimeEvent_YXQP);
		L_YXQP.RegFunction("Action_UnityEngine_GameObject", QPYX_System_Action_UnityEngine_GameObject_YXQP);
		L_YXQP.RegFunction("Action_GameAsset_LoadedAssetBundle", QPYX_System_Action_GameAsset_LoadedAssetBundle_YXQP);
		L_YXQP.RegFunction("Action_WWWOperation", QPYX_System_Action_WWWOperation_YXQP);
		L_YXQP.RegFunction("Action_BestHttpOperation", QPYX_System_Action_BestHttpOperation_YXQP);
		L_YXQP.RegFunction("Action_AudioPlayOperation", QPYX_System_Action_AudioPlayOperation_YXQP);
		L_YXQP.RegFunction("Action_float", QPYX_System_Action_float_YXQP);
		L_YXQP.RegFunction("Action_string_string", QPYX_System_Action_string_string_YXQP);
		L_YXQP.RegFunction("Action_int_string_int", QPYX_System_Action_int_string_int_YXQP);
		L_YXQP.RegFunction("Action_SimpleItemBase", QPYX_System_Action_SimpleItemBase_YXQP);
		L_YXQP.RegFunction("Func_BestHTTP_HTTPRequest_System_Security_Cryptography_X509Certificates_X509Certificate_System_Security_Cryptography_X509Certificates_X509Chain_bool", QPYX_System_Func_BestHTTP_HTTPRequest_System_Security_Cryptography_X509Certificates_X509Certificate_System_Security_Cryptography_X509Certificates_X509Chain_bool_YXQP);
		L_YXQP.RegFunction("Action_UnityEngine_AsyncOperation", QPYX_System_Action_UnityEngine_AsyncOperation_YXQP);
		L_YXQP.EndModule();		L_YXQP.BeginModule("GameSDKInterface");
		L_YXQP.RegFunction("LoginSucHandler", QPYX_GameSDKInterface_LoginSucHandler_YXQP);
		L_YXQP.RegFunction("LogoutHandler", QPYX_GameSDKInterface_LogoutHandler_YXQP);
		L_YXQP.EndModule();		L_YXQP.BeginModule("LoopScrollView");
		L_YXQP.RegFunction("OnBaseNodeEvent", QPYX_LoopScrollView_OnBaseNodeEvent_YXQP);
		L_YXQP.RegFunction("OnBaseNodeEvent_bool", QPYX_LoopScrollView_OnBaseNodeEvent_bool_YXQP);
		L_YXQP.EndModule();		L_YXQP.EndModule();		L_YXQP.BeginPreLoad();		L_YXQP.AddPreLoad("WebViewObject",QPYX_LuaOpen_WebViewObject_YXQP, typeof(WebViewObject));
		L_YXQP.AddPreLoad("UnityEngine.TextAsset",QPYX_LuaOpen_UnityEngine_TextAsset_YXQP, typeof(UnityEngine.TextAsset));
		L_YXQP.AddPreLoad("UnityEngine.ThreadPriority",QPYX_LuaOpen_UnityEngine_ThreadPriority_YXQP, typeof(UnityEngine.ThreadPriority));
		L_YXQP.AddPreLoad("DynamicPrefable",QPYX_LuaOpen_DynamicPrefable_YXQP, typeof(DynamicPrefable));
		L_YXQP.AddPreLoad("TextureScaler",QPYX_LuaOpen_TextureScaler_YXQP, typeof(TextureScaler));
		L_YXQP.AddPreLoad("UnityEngine.RectOffset",QPYX_LuaOpen_UnityEngine_RectOffset_YXQP, typeof(UnityEngine.RectOffset));
		L_YXQP.AddPreLoad("GVoiceManager",QPYX_LuaOpen_GVoiceManager_YXQP, typeof(GVoiceManager));
		L_YXQP.AddPreLoad("gcloud_voice.GCloudVoice",QPYX_LuaOpen_gcloud_voice_GCloudVoice_YXQP, typeof(gcloud_voice.GCloudVoice));
		L_YXQP.AddPreLoad("gcloud_voice.IGCloudVoice",QPYX_LuaOpen_gcloud_voice_IGCloudVoice_YXQP, typeof(gcloud_voice.IGCloudVoice));
		L_YXQP.AddPreLoad("gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode",QPYX_LuaOpen_gcloud_voice_IGCloudVoice_GCloudVoiceCompleteCode_YXQP, typeof(gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode));
		L_YXQP.AddPreLoad("gcloud_voice.GCloudVoiceEvent",QPYX_LuaOpen_gcloud_voice_GCloudVoiceEvent_YXQP, typeof(gcloud_voice.GCloudVoiceEvent));
		L_YXQP.AddPreLoad("UnityEngine.RenderSettings",QPYX_LuaOpen_UnityEngine_RenderSettings_YXQP, typeof(UnityEngine.RenderSettings));
		L_YXQP.AddPreLoad("UnityEngine.QualitySettings",QPYX_LuaOpen_UnityEngine_QualitySettings_YXQP, typeof(UnityEngine.QualitySettings));
		L_YXQP.AddPreLoad("UnityEngine.MeshRenderer",QPYX_LuaOpen_UnityEngine_MeshRenderer_YXQP, typeof(UnityEngine.MeshRenderer));
		L_YXQP.AddPreLoad("UnityEngine.ParticleSystem",QPYX_LuaOpen_UnityEngine_ParticleSystem_YXQP, typeof(UnityEngine.ParticleSystem));
		L_YXQP.AddPreLoad("UnityEngine.ParticleSystemRenderer",QPYX_LuaOpen_UnityEngine_ParticleSystemRenderer_YXQP, typeof(UnityEngine.ParticleSystemRenderer));
		L_YXQP.AddPreLoad("littlerbird.UI.QuickGrid",QPYX_LuaOpen_littlerbird_UI_QuickGrid_YXQP, typeof(littlerbird.UI.QuickGrid));
		L_YXQP.AddPreLoad("littlerbird.UI.QuickGridItemBase",QPYX_LuaOpen_littlerbird_UI_QuickGridItemBase_YXQP, typeof(littlerbird.UI.QuickGridItemBase));
		L_YXQP.AddPreLoad("TweenButton",QPYX_LuaOpen_TweenButton_YXQP, typeof(TweenButton));
		L_YXQP.AddPreLoad("UnityEngine.TextAnchor",QPYX_LuaOpen_UnityEngine_TextAnchor_YXQP, typeof(UnityEngine.TextAnchor));
		L_YXQP.AddPreLoad("UGUIExtend.GameEventCollector",QPYX_LuaOpen_UGUIExtend_GameEventCollector_YXQP, typeof(UGUIExtend.GameEventCollector));
		L_YXQP.AddPreLoad("GameModule",QPYX_LuaOpen_GameModule_YXQP, typeof(GameModule));
		L_YXQP.AddPreLoad("CanvasData",QPYX_LuaOpen_CanvasData_YXQP, typeof(CanvasData));
		L_YXQP.AddPreLoad("UnityEngine.Physics",QPYX_LuaOpen_UnityEngine_Physics_YXQP, typeof(UnityEngine.Physics));
		L_YXQP.AddPreLoad("UnityEngine.Collider",QPYX_LuaOpen_UnityEngine_Collider_YXQP, typeof(UnityEngine.Collider));
		L_YXQP.AddPreLoad("UnityEngine.BoxCollider",QPYX_LuaOpen_UnityEngine_BoxCollider_YXQP, typeof(UnityEngine.BoxCollider));
		L_YXQP.AddPreLoad("GameEventTriggerClickListener",QPYX_LuaOpen_GameEventTriggerClickListener_YXQP, typeof(GameEventTriggerClickListener));
		L_YXQP.AddPreLoad("UnityEngine.PolygonCollider2D",QPYX_LuaOpen_UnityEngine_PolygonCollider2D_YXQP, typeof(UnityEngine.PolygonCollider2D));
		L_YXQP.AddPreLoad("UniWebViewEx",QPYX_LuaOpen_UniWebViewEx_YXQP, typeof(UniWebViewEx));
		L_YXQP.AddPreLoad("UniWebViewMessage",QPYX_LuaOpen_UniWebViewMessage_YXQP, typeof(UniWebViewMessage));
		L_YXQP.AddPreLoad("iPhoneSpeaker",QPYX_LuaOpen_iPhoneSpeaker_YXQP, typeof(iPhoneSpeaker));
		L_YXQP.AddPreLoad("EmojiText",QPYX_LuaOpen_EmojiText_YXQP, typeof(EmojiText));
		L_YXQP.AddPreLoad("SimpleScrollView",QPYX_LuaOpen_SimpleScrollView_YXQP, typeof(SimpleScrollView));
		L_YXQP.AddPreLoad("SimpleItemBase",QPYX_LuaOpen_SimpleItemBase_YXQP, typeof(SimpleItemBase));
		L_YXQP.AddPreLoad("BestHTTP.HTTPRequest",QPYX_LuaOpen_BestHTTP_HTTPRequest_YXQP, typeof(BestHTTP.HTTPRequest));
		L_YXQP.AddPreLoad("BestHTTP.HTTPResponse",QPYX_LuaOpen_BestHTTP_HTTPResponse_YXQP, typeof(BestHTTP.HTTPResponse));
		L_YXQP.AddPreLoad("UnityEngine.Networking.UnityWebRequest",QPYX_LuaOpen_UnityEngine_Networking_UnityWebRequest_YXQP, typeof(UnityEngine.Networking.UnityWebRequest));
		L_YXQP.AddPreLoad("UnityEngine.Networking.UnityWebRequestAsyncOperation",QPYX_LuaOpen_UnityEngine_Networking_UnityWebRequestAsyncOperation_YXQP, typeof(UnityEngine.Networking.UnityWebRequestAsyncOperation));
		L_YXQP.AddPreLoad("UnityEngine.Networking.UnityWebRequestTexture",QPYX_LuaOpen_UnityEngine_Networking_UnityWebRequestTexture_YXQP, typeof(UnityEngine.Networking.UnityWebRequestTexture));
		L_YXQP.AddPreLoad("UnityEngine.Networking.UploadHandler",QPYX_LuaOpen_UnityEngine_Networking_UploadHandler_YXQP, typeof(UnityEngine.Networking.UploadHandler));
		L_YXQP.AddPreLoad("UnityEngine.Networking.DownloadHandler",QPYX_LuaOpen_UnityEngine_Networking_DownloadHandler_YXQP, typeof(UnityEngine.Networking.DownloadHandler));
		L_YXQP.AddPreLoad("UnityEngine.Networking.DownloadHandlerTexture",QPYX_LuaOpen_UnityEngine_Networking_DownloadHandlerTexture_YXQP, typeof(UnityEngine.Networking.DownloadHandlerTexture));
		L_YXQP.AddPreLoad("UnityEngine.Networking.DownloadHandlerFile",QPYX_LuaOpen_UnityEngine_Networking_DownloadHandlerFile_YXQP, typeof(UnityEngine.Networking.DownloadHandlerFile));
		L_YXQP.AddPreLoad("UnityEngine.Networking.DownloadHandlerAssetBundle",QPYX_LuaOpen_UnityEngine_Networking_DownloadHandlerAssetBundle_YXQP, typeof(UnityEngine.Networking.DownloadHandlerAssetBundle));
		L_YXQP.AddPreLoad("UnityEngine.Networking.DownloadHandlerBuffer",QPYX_LuaOpen_UnityEngine_Networking_DownloadHandlerBuffer_YXQP, typeof(UnityEngine.Networking.DownloadHandlerBuffer));
		L_YXQP.AddPreLoad("UnityEngine.Networking.DownloadHandlerAudioClip",QPYX_LuaOpen_UnityEngine_Networking_DownloadHandlerAudioClip_YXQP, typeof(UnityEngine.Networking.DownloadHandlerAudioClip));
		L_YXQP.AddPreLoad("UnityEngine.ScreenOrientation",QPYX_LuaOpen_UnityEngine_ScreenOrientation_YXQP, typeof(UnityEngine.ScreenOrientation));
		L_YXQP.AddPreLoad("UnityEngine.Texture",QPYX_LuaOpen_UnityEngine_Texture_YXQP, typeof(UnityEngine.Texture));
		L_YXQP.AddPreLoad("UnityEngine.Material",QPYX_LuaOpen_UnityEngine_Material_YXQP, typeof(UnityEngine.Material));
		L_YXQP.AddPreLoad("UnityEngine.Texture2D",QPYX_LuaOpen_UnityEngine_Texture2D_YXQP, typeof(UnityEngine.Texture2D));
		L_YXQP.AddPreLoad("UnityEngine.CameraClearFlags",QPYX_LuaOpen_UnityEngine_CameraClearFlags_YXQP, typeof(UnityEngine.CameraClearFlags));
		L_YXQP.AddPreLoad("UnityEngine.AsyncOperation",QPYX_LuaOpen_UnityEngine_AsyncOperation_YXQP, typeof(UnityEngine.AsyncOperation));
		L_YXQP.AddPreLoad("UnityEngine.Animator",QPYX_LuaOpen_UnityEngine_Animator_YXQP, typeof(UnityEngine.Animator));
		L_YXQP.AddPreLoad("UnityEngine.KeyCode",QPYX_LuaOpen_UnityEngine_KeyCode_YXQP, typeof(UnityEngine.KeyCode));
		L_YXQP.AddPreLoad("UnityEngine.SkinnedMeshRenderer",QPYX_LuaOpen_UnityEngine_SkinnedMeshRenderer_YXQP, typeof(UnityEngine.SkinnedMeshRenderer));
		L_YXQP.AddPreLoad("UnityEngine.Animation",QPYX_LuaOpen_UnityEngine_Animation_YXQP, typeof(UnityEngine.Animation));
		L_YXQP.AddPreLoad("UnityEngine.AnimationClip",QPYX_LuaOpen_UnityEngine_AnimationClip_YXQP, typeof(UnityEngine.AnimationClip));
		L_YXQP.AddPreLoad("UnityEngine.AnimationState",QPYX_LuaOpen_UnityEngine_AnimationState_YXQP, typeof(UnityEngine.AnimationState));
		L_YXQP.AddPreLoad("UnityEngine.AnimationBlendMode",QPYX_LuaOpen_UnityEngine_AnimationBlendMode_YXQP, typeof(UnityEngine.AnimationBlendMode));
		L_YXQP.AddPreLoad("UnityEngine.QueueMode",QPYX_LuaOpen_UnityEngine_QueueMode_YXQP, typeof(UnityEngine.QueueMode));
		L_YXQP.AddPreLoad("UnityEngine.PlayMode",QPYX_LuaOpen_UnityEngine_PlayMode_YXQP, typeof(UnityEngine.PlayMode));
		L_YXQP.AddPreLoad("UnityEngine.WrapMode",QPYX_LuaOpen_UnityEngine_WrapMode_YXQP, typeof(UnityEngine.WrapMode));
		L_YXQP.AddPreLoad("DG.Tweening.Core.ABSAnimationComponent",QPYX_LuaOpen_DG_Tweening_Core_ABSAnimationComponent_YXQP, typeof(DG.Tweening.Core.ABSAnimationComponent));
		L_YXQP.AddPreLoad("DG.Tweening.DOTweenAnimation",QPYX_LuaOpen_DG_Tweening_DOTweenAnimation_YXQP, typeof(DG.Tweening.DOTweenAnimation));
		L_YXQP.AddPreLoad("DG.Tweening.DOTweenPath",QPYX_LuaOpen_DG_Tweening_DOTweenPath_YXQP, typeof(DG.Tweening.DOTweenPath));
		L_YXQP.AddPreLoad("UnityEngine.RenderTexture",QPYX_LuaOpen_UnityEngine_RenderTexture_YXQP, typeof(UnityEngine.RenderTexture));
		L_YXQP.AddPreLoad("UnityEngine.RenderTextureFormat",QPYX_LuaOpen_UnityEngine_RenderTextureFormat_YXQP, typeof(UnityEngine.RenderTextureFormat));
		L_YXQP.AddPreLoad("GameAsset.SimulateLoadedAssetBundle",QPYX_LuaOpen_GameAsset_SimulateLoadedAssetBundle_YXQP, typeof(GameAsset.SimulateLoadedAssetBundle));
		L_YXQP.AddPreLoad("UnityEngine.UI.LayoutElement",QPYX_LuaOpen_UnityEngine_UI_LayoutElement_YXQP, typeof(UnityEngine.UI.LayoutElement));
		L_YXQP.AddPreLoad("UnityEngine.UI.VerticalLayoutGroup",QPYX_LuaOpen_UnityEngine_UI_VerticalLayoutGroup_YXQP, typeof(UnityEngine.UI.VerticalLayoutGroup));
		L_YXQP.AddPreLoad("UnityEngine.UI.HorizontalLayoutGroup",QPYX_LuaOpen_UnityEngine_UI_HorizontalLayoutGroup_YXQP, typeof(UnityEngine.UI.HorizontalLayoutGroup));
		L_YXQP.AddPreLoad("ComponentCache",QPYX_LuaOpen_ComponentCache_YXQP, typeof(ComponentCache));
		L_YXQP.AddPreLoad("ComponentCache.GameObject_Injection",QPYX_LuaOpen_ComponentCache_GameObject_Injection_YXQP, typeof(ComponentCache.GameObject_Injection));
		L_YXQP.AddPreLoad("ComponentCache.Transform_Injection",QPYX_LuaOpen_ComponentCache_Transform_Injection_YXQP, typeof(ComponentCache.Transform_Injection));
		L_YXQP.AddPreLoad("ComponentCache.RectTransform_Injection",QPYX_LuaOpen_ComponentCache_RectTransform_Injection_YXQP, typeof(ComponentCache.RectTransform_Injection));
		L_YXQP.AddPreLoad("ComponentCache.Image_Injection",QPYX_LuaOpen_ComponentCache_Image_Injection_YXQP, typeof(ComponentCache.Image_Injection));
		L_YXQP.AddPreLoad("ComponentCache.Text_Injection",QPYX_LuaOpen_ComponentCache_Text_Injection_YXQP, typeof(ComponentCache.Text_Injection));
		L_YXQP.AddPreLoad("ComponentCache.Toggle_Injection",QPYX_LuaOpen_ComponentCache_Toggle_Injection_YXQP, typeof(ComponentCache.Toggle_Injection));
		L_YXQP.AddPreLoad("ComponentCache.ToggleEvent_Injection",QPYX_LuaOpen_ComponentCache_ToggleEvent_Injection_YXQP, typeof(ComponentCache.ToggleEvent_Injection));
		L_YXQP.AddPreLoad("ComponentCache.Button_Injection",QPYX_LuaOpen_ComponentCache_Button_Injection_YXQP, typeof(ComponentCache.Button_Injection));
		L_YXQP.AddPreLoad("ComponentCache.Slider_Injection",QPYX_LuaOpen_ComponentCache_Slider_Injection_YXQP, typeof(ComponentCache.Slider_Injection));
		L_YXQP.AddPreLoad("ComponentCache.ToggleGroup_Injection",QPYX_LuaOpen_ComponentCache_ToggleGroup_Injection_YXQP, typeof(ComponentCache.ToggleGroup_Injection));
		L_YXQP.AddPreLoad("ComponentCache.InputField_Injection",QPYX_LuaOpen_ComponentCache_InputField_Injection_YXQP, typeof(ComponentCache.InputField_Injection));
		L_YXQP.AddPreLoad("ComponentCache.Graphic_Injection",QPYX_LuaOpen_ComponentCache_Graphic_Injection_YXQP, typeof(ComponentCache.Graphic_Injection));
		L_YXQP.AddPreLoad("ComponentCache.ScrollRect_Injection",QPYX_LuaOpen_ComponentCache_ScrollRect_Injection_YXQP, typeof(ComponentCache.ScrollRect_Injection));
		L_YXQP.AddPreLoad("ComponentCache.Scrollbar_Injection",QPYX_LuaOpen_ComponentCache_Scrollbar_Injection_YXQP, typeof(ComponentCache.Scrollbar_Injection));
		L_YXQP.AddPreLoad("ComponentCache.Dropdown_Injection",QPYX_LuaOpen_ComponentCache_Dropdown_Injection_YXQP, typeof(ComponentCache.Dropdown_Injection));
		L_YXQP.AddPreLoad("ComponentCache.GridLayoutGroup_Injection",QPYX_LuaOpen_ComponentCache_GridLayoutGroup_Injection_YXQP, typeof(ComponentCache.GridLayoutGroup_Injection));
		L_YXQP.AddPreLoad("ComponentCache.RawImage_Injection",QPYX_LuaOpen_ComponentCache_RawImage_Injection_YXQP, typeof(ComponentCache.RawImage_Injection));
		L_YXQP.AddPreLoad("ComponentCache.AudioSource_Injection",QPYX_LuaOpen_ComponentCache_AudioSource_Injection_YXQP, typeof(ComponentCache.AudioSource_Injection));
		L_YXQP.AddPreLoad("ComponentCache.Animation_Injection",QPYX_LuaOpen_ComponentCache_Animation_Injection_YXQP, typeof(ComponentCache.Animation_Injection));
		L_YXQP.AddPreLoad("ComponentCache.Animator_Injection",QPYX_LuaOpen_ComponentCache_Animator_Injection_YXQP, typeof(ComponentCache.Animator_Injection));
		L_YXQP.AddPreLoad("ComponentCache.SpriteAtlas_Injection",QPYX_LuaOpen_ComponentCache_SpriteAtlas_Injection_YXQP, typeof(ComponentCache.SpriteAtlas_Injection));
		L_YXQP.AddPreLoad("ComponentCache.SpriteHolder_Injection",QPYX_LuaOpen_ComponentCache_SpriteHolder_Injection_YXQP, typeof(ComponentCache.SpriteHolder_Injection));
		L_YXQP.AddPreLoad("ComponentCache.UIStateSwitcher_Injection",QPYX_LuaOpen_ComponentCache_UIStateSwitcher_Injection_YXQP, typeof(ComponentCache.UIStateSwitcher_Injection));
		L_YXQP.AddPreLoad("ComponentCache.TextWrap_Injection",QPYX_LuaOpen_ComponentCache_TextWrap_Injection_YXQP, typeof(ComponentCache.TextWrap_Injection));
		L_YXQP.AddPreLoad("ComponentCache.UIImageAnimation_Injection",QPYX_LuaOpen_ComponentCache_UIImageAnimation_Injection_YXQP, typeof(ComponentCache.UIImageAnimation_Injection));
		L_YXQP.AddPreLoad("ComponentCache.ComponentCache_Injection",QPYX_LuaOpen_ComponentCache_ComponentCache_Injection_YXQP, typeof(ComponentCache.ComponentCache_Injection));
		L_YXQP.EndPreLoad();		Debugger.Log("Register lua type cost time: {0}", Time.realtimeSinceStartup - QPYX_t_YXQP);	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UnityEngine_Events_UnityAction_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.Events.UnityAction>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.Events.UnityAction>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UnityEngine_Events_UnityAction_string_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.Events.UnityAction<string>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.Events.UnityAction<string>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UnityEngine_Events_UnityAction_float_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.Events.UnityAction<float>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.Events.UnityAction<float>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UnityEngine_Events_UnityAction_bool_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.Events.UnityAction<bool>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.Events.UnityAction<bool>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UnityEngine_Events_UnityAction_int_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.Events.UnityAction<int>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.Events.UnityAction<int>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UnityEngine_Events_UnityAction_UnityEngine_Vector2_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.Events.UnityAction<UnityEngine.Vector2>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.Events.UnityAction<UnityEngine.Vector2>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UnityEngine_Events_UnityAction_LoopBaseNode_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.Events.UnityAction<LoopBaseNode>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.Events.UnityAction<LoopBaseNode>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UnityEngine_Events_UnityAction_UnityEngine_Vector3_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.Events.UnityAction<UnityEngine.Vector3>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.Events.UnityAction<UnityEngine.Vector3>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UnityEngine_UI_InputField_OnValidateInput_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.UI.InputField.OnValidateInput>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.UI.InputField.OnValidateInput>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UnityEngine_Canvas_WillRenderCanvases_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.Canvas.WillRenderCanvases>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.Canvas.WillRenderCanvases>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UnityEngine_RectTransform_ReapplyDrivenProperties_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.RectTransform.ReapplyDrivenProperties>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.RectTransform.ReapplyDrivenProperties>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
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

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UnityEngine_Application_LowMemoryCallback_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.Application.LowMemoryCallback>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.Application.LowMemoryCallback>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UnityEngine_Application_AdvertisingIdentifierCallback_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.Application.AdvertisingIdentifierCallback>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.Application.AdvertisingIdentifierCallback>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UnityEngine_Application_LogCallback_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.Application.LogCallback>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.Application.LogCallback>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UnityEngine_AudioClip_PCMReaderCallback_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.AudioClip.PCMReaderCallback>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.AudioClip.PCMReaderCallback>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_UnityEngine_AudioClip_PCMSetPositionCallback_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.AudioClip.PCMSetPositionCallback>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<UnityEngine.AudioClip.PCMSetPositionCallback>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_gcloud_voice_IGCloudVoice_JoinRoomCompleteHandler_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.JoinRoomCompleteHandler>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.JoinRoomCompleteHandler>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_gcloud_voice_IGCloudVoice_QuitRoomCompleteHandler_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.QuitRoomCompleteHandler>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.QuitRoomCompleteHandler>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_gcloud_voice_IGCloudVoice_MemberVoiceHandler_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.MemberVoiceHandler>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.MemberVoiceHandler>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_gcloud_voice_IGCloudVoice_ApplyMessageKeyCompleteHandler_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.ApplyMessageKeyCompleteHandler>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.ApplyMessageKeyCompleteHandler>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_gcloud_voice_IGCloudVoice_UploadReccordFileCompleteHandler_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.UploadReccordFileCompleteHandler>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.UploadReccordFileCompleteHandler>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_gcloud_voice_IGCloudVoice_DownloadRecordFileCompleteHandler_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.DownloadRecordFileCompleteHandler>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.DownloadRecordFileCompleteHandler>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_gcloud_voice_IGCloudVoice_PlayRecordFilCompleteHandler_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.PlayRecordFilCompleteHandler>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.PlayRecordFilCompleteHandler>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_gcloud_voice_IGCloudVoice_SpeechToTextHandler_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.SpeechToTextHandler>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.SpeechToTextHandler>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_gcloud_voice_IGCloudVoice_StreamSpeechToTextHandler_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.StreamSpeechToTextHandler>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.StreamSpeechToTextHandler>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_gcloud_voice_IGCloudVoice_StatusUpdateHandler_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.StatusUpdateHandler>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.StatusUpdateHandler>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_gcloud_voice_IGCloudVoice_ChangeRoleCompleteHandler_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.ChangeRoleCompleteHandler>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.ChangeRoleCompleteHandler>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_gcloud_voice_IGCloudVoice_RoomMemberVoiceHandler_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.RoomMemberVoiceHandler>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.RoomMemberVoiceHandler>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_gcloud_voice_IGCloudVoice_EventUpdateHandler_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.EventUpdateHandler>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.EventUpdateHandler>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_gcloud_voice_IGCloudVoice_MuteSwitchResultHandler_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.MuteSwitchResultHandler>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<gcloud_voice.IGCloudVoice.MuteSwitchResultHandler>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_littlerbird_UI_QuickGrid_QuickGridItemEvenet_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<littlerbird.UI.QuickGrid.QuickGridItemEvenet>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<littlerbird.UI.QuickGrid.QuickGridItemEvenet>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_littlerbird_UI_QuickGrid_ReturnQuickGridItemEvent_bool_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<littlerbird.UI.QuickGrid.ReturnQuickGridItemEvent<bool>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<littlerbird.UI.QuickGrid.ReturnQuickGridItemEvent<bool>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_littlerbird_UI_QuickGrid_ReturnQuickGridItemEvent_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<littlerbird.UI.QuickGrid.ReturnQuickGridItemEvent>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<littlerbird.UI.QuickGrid.ReturnQuickGridItemEvent>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_littlerbird_UI_QuickGrid_QuickCallback_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<littlerbird.UI.QuickGrid.QuickCallback>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<littlerbird.UI.QuickGrid.QuickCallback>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DG_Tweening_TweenCallback_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.TweenCallback>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.TweenCallback>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DG_Tweening_TweenCallback_int_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.TweenCallback<int>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.TweenCallback<int>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DG_Tweening_Core_DOGetter_float_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOGetter<float>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOGetter<float>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DG_Tweening_Core_DOSetter_float_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOSetter<float>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOSetter<float>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DG_Tweening_Core_DOGetter_double_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOGetter<double>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOGetter<double>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DG_Tweening_Core_DOSetter_double_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOSetter<double>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOSetter<double>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DG_Tweening_Core_DOGetter_int_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOGetter<int>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOGetter<int>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DG_Tweening_Core_DOSetter_int_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOSetter<int>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOSetter<int>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DG_Tweening_Core_DOGetter_uint_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOGetter<uint>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOGetter<uint>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DG_Tweening_Core_DOSetter_uint_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOSetter<uint>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOSetter<uint>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DG_Tweening_Core_DOGetter_long_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOGetter<long>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOGetter<long>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DG_Tweening_Core_DOSetter_long_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOSetter<long>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOSetter<long>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DG_Tweening_Core_DOGetter_ulong_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOGetter<ulong>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOGetter<ulong>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DG_Tweening_Core_DOSetter_ulong_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOSetter<ulong>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOSetter<ulong>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DG_Tweening_Core_DOGetter_string_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOGetter<string>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOGetter<string>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DG_Tweening_Core_DOSetter_string_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOSetter<string>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOSetter<string>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Vector2_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOGetter<UnityEngine.Vector2>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOGetter<UnityEngine.Vector2>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Vector2_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOSetter<UnityEngine.Vector2>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOSetter<UnityEngine.Vector2>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Vector3_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOGetter<UnityEngine.Vector3>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOGetter<UnityEngine.Vector3>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Vector3_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOSetter<UnityEngine.Vector3>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOSetter<UnityEngine.Vector3>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Vector4_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOGetter<UnityEngine.Vector4>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOGetter<UnityEngine.Vector4>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Vector4_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOSetter<UnityEngine.Vector4>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOSetter<UnityEngine.Vector4>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Quaternion_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOGetter<UnityEngine.Quaternion>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOGetter<UnityEngine.Quaternion>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Quaternion_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOSetter<UnityEngine.Quaternion>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOSetter<UnityEngine.Quaternion>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Color_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOGetter<UnityEngine.Color>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOGetter<UnityEngine.Color>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Color_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOSetter<UnityEngine.Color>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOSetter<UnityEngine.Color>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Rect_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOGetter<UnityEngine.Rect>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOGetter<UnityEngine.Rect>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Rect_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOSetter<UnityEngine.Rect>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOSetter<UnityEngine.Rect>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DG_Tweening_Core_DOGetter_UnityEngine_RectOffset_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOGetter<UnityEngine.RectOffset>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOGetter<UnityEngine.RectOffset>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_DG_Tweening_Core_DOSetter_UnityEngine_RectOffset_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOSetter<UnityEngine.RectOffset>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<DG.Tweening.Core.DOSetter<UnityEngine.RectOffset>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_BestHTTP_OnUploadProgressDelegate_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<BestHTTP.OnUploadProgressDelegate>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<BestHTTP.OnUploadProgressDelegate>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_BestHTTP_OnDownloadProgressDelegate_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<BestHTTP.OnDownloadProgressDelegate>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<BestHTTP.OnDownloadProgressDelegate>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_BestHTTP_OnRequestFinishedDelegate_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<BestHTTP.OnRequestFinishedDelegate>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<BestHTTP.OnRequestFinishedDelegate>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_BestHTTP_OnBeforeRedirectionDelegate_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<BestHTTP.OnBeforeRedirectionDelegate>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<BestHTTP.OnBeforeRedirectionDelegate>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_BestHTTP_OnBeforeHeaderSendDelegate_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<BestHTTP.OnBeforeHeaderSendDelegate>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<BestHTTP.OnBeforeHeaderSendDelegate>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_BestHTTP_OnHeaderEnumerationDelegate_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<BestHTTP.OnHeaderEnumerationDelegate>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<BestHTTP.OnHeaderEnumerationDelegate>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_System_Action_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<System.Action>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<System.Action>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_System_Action_int_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<System.Action<int>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<System.Action<int>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_System_Action_string_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<System.Action<string>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<System.Action<string>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_System_Predicate_int_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<System.Predicate<int>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<System.Predicate<int>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_System_Comparison_int_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<System.Comparison<int>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<System.Comparison<int>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_System_Action_TimeEvent_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<System.Action<TimeEvent>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<System.Action<TimeEvent>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_System_Action_UnityEngine_GameObject_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<System.Action<UnityEngine.GameObject>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<System.Action<UnityEngine.GameObject>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_System_Action_GameAsset_LoadedAssetBundle_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<System.Action<GameAsset.LoadedAssetBundle>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<System.Action<GameAsset.LoadedAssetBundle>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_System_Action_WWWOperation_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<System.Action<WWWOperation>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<System.Action<WWWOperation>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_System_Action_BestHttpOperation_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<System.Action<BestHttpOperation>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<System.Action<BestHttpOperation>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_System_Action_AudioPlayOperation_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<System.Action<AudioPlayOperation>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<System.Action<AudioPlayOperation>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_System_Action_float_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<System.Action<float>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<System.Action<float>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_System_Action_string_string_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<System.Action<string,string>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<System.Action<string,string>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_System_Action_int_string_int_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<System.Action<int,string,int>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<System.Action<int,string,int>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_System_Action_SimpleItemBase_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<System.Action<SimpleItemBase>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<System.Action<SimpleItemBase>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_System_Func_BestHTTP_HTTPRequest_System_Security_Cryptography_X509Certificates_X509Certificate_System_Security_Cryptography_X509Certificates_X509Chain_bool_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<System.Func<BestHTTP.HTTPRequest,System.Security.Cryptography.X509Certificates.X509Certificate,System.Security.Cryptography.X509Certificates.X509Chain,bool>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<System.Func<BestHTTP.HTTPRequest,System.Security.Cryptography.X509Certificates.X509Certificate,System.Security.Cryptography.X509Certificates.X509Chain,bool>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_System_Action_UnityEngine_AsyncOperation_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<System.Action<UnityEngine.AsyncOperation>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<System.Action<UnityEngine.AsyncOperation>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GameSDKInterface_LoginSucHandler_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<GameSDKInterface.LoginSucHandler>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<GameSDKInterface.LoginSucHandler>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_GameSDKInterface_LogoutHandler_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<GameSDKInterface.LogoutHandler>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<GameSDKInterface.LogoutHandler>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LoopScrollView_OnBaseNodeEvent_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<LoopScrollView.OnBaseNodeEvent>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<LoopScrollView.OnBaseNodeEvent>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LoopScrollView_OnBaseNodeEvent_bool_YXQP(IntPtr L_YXQP)
	{
		try
		{
			int QPYX_count_YXQP = LuaDLL.lua_gettop(L_YXQP);			LuaFunction QPYX_func_YXQP = ToLua.CheckLuaFunction(L_YXQP, 1);
			if (QPYX_count_YXQP == 1)			{
				Delegate QPYX_arg1_YXQP = DelegateTraits<LoopScrollView.OnBaseNodeEvent<bool>>.Create(QPYX_func_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);			}
			else
			{
				LuaTable QPYX_self_YXQP = ToLua.CheckLuaTable(L_YXQP, 2);				Delegate QPYX_arg1_YXQP = DelegateTraits<LoopScrollView.OnBaseNodeEvent<bool>>.Create(QPYX_func_YXQP, QPYX_self_YXQP);
				ToLua.Push(L_YXQP, QPYX_arg1_YXQP);
			}
			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_WebViewObject_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("");
			QPYX_WebViewObjectWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(WebViewObject));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_TextAsset_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine");
			QPYX_UnityEngine_TextAssetWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.TextAsset));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_ThreadPriority_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine");
			QPYX_UnityEngine_ThreadPriorityWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.ThreadPriority));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_DynamicPrefable_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("");
			QPYX_DynamicPrefableWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(DynamicPrefable));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_TextureScaler_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("LuaBridge");
			QPYX_TextureScalerWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(TextureScaler));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_RectOffset_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine");
			QPYX_UnityEngine_RectOffsetWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.RectOffset));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_GVoiceManager_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("LuaBridge");
			QPYX_GVoiceManagerWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(GVoiceManager));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_gcloud_voice_GCloudVoice_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("gcloud_voice");
			QPYX_gcloud_voice_GCloudVoiceWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(gcloud_voice.GCloudVoice));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_gcloud_voice_IGCloudVoice_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("gcloud_voice");
			QPYX_gcloud_voice_IGCloudVoiceWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(gcloud_voice.IGCloudVoice));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_gcloud_voice_IGCloudVoice_GCloudVoiceCompleteCode_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("gcloud_voice.IGCloudVoice");
			QPYX_gcloud_voice_IGCloudVoice_GCloudVoiceCompleteCodeWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_gcloud_voice_GCloudVoiceEvent_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("gcloud_voice");
			QPYX_gcloud_voice_GCloudVoiceEventWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(gcloud_voice.GCloudVoiceEvent));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_RenderSettings_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine");
			QPYX_UnityEngine_RenderSettingsWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.RenderSettings));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_QualitySettings_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine");
			QPYX_UnityEngine_QualitySettingsWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.QualitySettings));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_MeshRenderer_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine");
			QPYX_UnityEngine_MeshRendererWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.MeshRenderer));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_ParticleSystem_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine");
			QPYX_UnityEngine_ParticleSystemWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.ParticleSystem));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_ParticleSystemRenderer_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine");
			QPYX_UnityEngine_ParticleSystemRendererWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.ParticleSystemRenderer));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_littlerbird_UI_QuickGrid_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("littlerbird.UI");
			QPYX_littlerbird_UI_QuickGridWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(littlerbird.UI.QuickGrid));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_littlerbird_UI_QuickGridItemBase_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("littlerbird.UI");
			QPYX_littlerbird_UI_QuickGridItemBaseWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(littlerbird.UI.QuickGridItemBase));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_TweenButton_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("");
			QPYX_TweenButtonWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(TweenButton));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_TextAnchor_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine");
			QPYX_UnityEngine_TextAnchorWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.TextAnchor));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UGUIExtend_GameEventCollector_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("LuaBridge");
			QPYX_UGUIExtend_GameEventCollectorWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UGUIExtend.GameEventCollector));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_GameModule_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("LuaBridge");
			QPYX_GameModuleWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(GameModule));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_CanvasData_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("LuaBridge");
			QPYX_CanvasDataWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(CanvasData));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_Physics_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine");
			QPYX_UnityEngine_PhysicsWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.Physics));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_Collider_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine");
			QPYX_UnityEngine_ColliderWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.Collider));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_BoxCollider_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine");
			QPYX_UnityEngine_BoxColliderWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.BoxCollider));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_GameEventTriggerClickListener_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("LuaBridge");
			QPYX_GameEventTriggerClickListenerWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(GameEventTriggerClickListener));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_PolygonCollider2D_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine");
			QPYX_UnityEngine_PolygonCollider2DWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.PolygonCollider2D));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UniWebViewEx_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("");
			QPYX_UniWebViewExWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UniWebViewEx));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UniWebViewMessage_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("");
			QPYX_UniWebViewMessageWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UniWebViewMessage));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_iPhoneSpeaker_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("");
			QPYX_iPhoneSpeakerWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(iPhoneSpeaker));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_EmojiText_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("");
			QPYX_EmojiTextWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(EmojiText));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_SimpleScrollView_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("");
			QPYX_SimpleScrollViewWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(SimpleScrollView));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_SimpleItemBase_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("");
			QPYX_SimpleItemBaseWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(SimpleItemBase));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_BestHTTP_HTTPRequest_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("BestHTTP");
			QPYX_BestHTTP_HTTPRequestWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(BestHTTP.HTTPRequest));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_BestHTTP_HTTPResponse_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("BestHTTP");
			QPYX_BestHTTP_HTTPResponseWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(BestHTTP.HTTPResponse));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_Networking_UnityWebRequest_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine.Networking");
			QPYX_UnityEngine_Networking_UnityWebRequestWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.Networking.UnityWebRequest));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_Networking_UnityWebRequestAsyncOperation_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine.Networking");
			QPYX_UnityEngine_Networking_UnityWebRequestAsyncOperationWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.Networking.UnityWebRequestAsyncOperation));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_Networking_UnityWebRequestTexture_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine.Networking");
			QPYX_UnityEngine_Networking_UnityWebRequestTextureWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.Networking.UnityWebRequestTexture));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_Networking_UploadHandler_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine.Networking");
			QPYX_UnityEngine_Networking_UploadHandlerWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.Networking.UploadHandler));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_Networking_DownloadHandler_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine.Networking");
			QPYX_UnityEngine_Networking_DownloadHandlerWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.Networking.DownloadHandler));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_Networking_DownloadHandlerTexture_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine.Networking");
			QPYX_UnityEngine_Networking_DownloadHandlerTextureWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.Networking.DownloadHandlerTexture));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_Networking_DownloadHandlerFile_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine.Networking");
			QPYX_UnityEngine_Networking_DownloadHandlerFileWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.Networking.DownloadHandlerFile));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_Networking_DownloadHandlerAssetBundle_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine.Networking");
			QPYX_UnityEngine_Networking_DownloadHandlerAssetBundleWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.Networking.DownloadHandlerAssetBundle));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_Networking_DownloadHandlerBuffer_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine.Networking");
			QPYX_UnityEngine_Networking_DownloadHandlerBufferWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.Networking.DownloadHandlerBuffer));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_Networking_DownloadHandlerAudioClip_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine.Networking");
			QPYX_UnityEngine_Networking_DownloadHandlerAudioClipWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.Networking.DownloadHandlerAudioClip));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_ScreenOrientation_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine");
			QPYX_UnityEngine_ScreenOrientationWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.ScreenOrientation));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_Texture_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine");
			QPYX_UnityEngine_TextureWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.Texture));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_Material_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine");
			QPYX_UnityEngine_MaterialWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.Material));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_Texture2D_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine");
			QPYX_UnityEngine_Texture2DWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.Texture2D));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_CameraClearFlags_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine");
			QPYX_UnityEngine_CameraClearFlagsWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.CameraClearFlags));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_AsyncOperation_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine");
			QPYX_UnityEngine_AsyncOperationWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.AsyncOperation));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_Animator_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine");
			QPYX_UnityEngine_AnimatorWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.Animator));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_KeyCode_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine");
			QPYX_UnityEngine_KeyCodeWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.KeyCode));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_SkinnedMeshRenderer_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine");
			QPYX_UnityEngine_SkinnedMeshRendererWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.SkinnedMeshRenderer));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_Animation_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine");
			QPYX_UnityEngine_AnimationWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.Animation));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_AnimationClip_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine");
			QPYX_UnityEngine_AnimationClipWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.AnimationClip));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_AnimationState_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine");
			QPYX_UnityEngine_AnimationStateWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.AnimationState));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_AnimationBlendMode_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine");
			QPYX_UnityEngine_AnimationBlendModeWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.AnimationBlendMode));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_QueueMode_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine");
			QPYX_UnityEngine_QueueModeWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.QueueMode));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_PlayMode_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine");
			QPYX_UnityEngine_PlayModeWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.PlayMode));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_WrapMode_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine");
			QPYX_UnityEngine_WrapModeWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.WrapMode));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_DG_Tweening_Core_ABSAnimationComponent_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("DG.Tweening.Core");
			QPYX_DG_Tweening_Core_ABSAnimationComponentWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(DG.Tweening.Core.ABSAnimationComponent));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_DG_Tweening_DOTweenAnimation_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("DG.Tweening");
			QPYX_DG_Tweening_DOTweenAnimationWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(DG.Tweening.DOTweenAnimation));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_DG_Tweening_DOTweenPath_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("DG.Tweening");
			QPYX_DG_Tweening_DOTweenPathWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(DG.Tweening.DOTweenPath));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_RenderTexture_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine");
			QPYX_UnityEngine_RenderTextureWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.RenderTexture));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_RenderTextureFormat_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine");
			QPYX_UnityEngine_RenderTextureFormatWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.RenderTextureFormat));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_GameAsset_SimulateLoadedAssetBundle_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("LuaBridge");
			QPYX_GameAsset_SimulateLoadedAssetBundleWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(GameAsset.SimulateLoadedAssetBundle));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_UI_LayoutElement_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine.UI");
			QPYX_UnityEngine_UI_LayoutElementWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.UI.LayoutElement));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_UI_VerticalLayoutGroup_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine.UI");
			QPYX_UnityEngine_UI_VerticalLayoutGroupWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.UI.VerticalLayoutGroup));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_UnityEngine_UI_HorizontalLayoutGroup_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("UnityEngine.UI");
			QPYX_UnityEngine_UI_HorizontalLayoutGroupWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(UnityEngine.UI.HorizontalLayoutGroup));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_ComponentCache_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("");
			QPYX_ComponentCacheWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(ComponentCache));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_ComponentCache_GameObject_Injection_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("ComponentCache");
			QPYX_ComponentCache_GameObject_InjectionWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(ComponentCache.GameObject_Injection));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_ComponentCache_Transform_Injection_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("ComponentCache");
			QPYX_ComponentCache_Transform_InjectionWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(ComponentCache.Transform_Injection));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_ComponentCache_RectTransform_Injection_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("ComponentCache");
			QPYX_ComponentCache_RectTransform_InjectionWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(ComponentCache.RectTransform_Injection));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_ComponentCache_Image_Injection_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("ComponentCache");
			QPYX_ComponentCache_Image_InjectionWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(ComponentCache.Image_Injection));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_ComponentCache_Text_Injection_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("ComponentCache");
			QPYX_ComponentCache_Text_InjectionWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(ComponentCache.Text_Injection));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_ComponentCache_Toggle_Injection_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("ComponentCache");
			QPYX_ComponentCache_Toggle_InjectionWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(ComponentCache.Toggle_Injection));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_ComponentCache_ToggleEvent_Injection_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("ComponentCache");
			QPYX_ComponentCache_ToggleEvent_InjectionWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(ComponentCache.ToggleEvent_Injection));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_ComponentCache_Button_Injection_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("ComponentCache");
			QPYX_ComponentCache_Button_InjectionWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(ComponentCache.Button_Injection));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_ComponentCache_Slider_Injection_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("ComponentCache");
			QPYX_ComponentCache_Slider_InjectionWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(ComponentCache.Slider_Injection));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_ComponentCache_ToggleGroup_Injection_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("ComponentCache");
			QPYX_ComponentCache_ToggleGroup_InjectionWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(ComponentCache.ToggleGroup_Injection));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_ComponentCache_InputField_Injection_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("ComponentCache");
			QPYX_ComponentCache_InputField_InjectionWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(ComponentCache.InputField_Injection));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_ComponentCache_Graphic_Injection_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("ComponentCache");
			QPYX_ComponentCache_Graphic_InjectionWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(ComponentCache.Graphic_Injection));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_ComponentCache_ScrollRect_Injection_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("ComponentCache");
			QPYX_ComponentCache_ScrollRect_InjectionWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(ComponentCache.ScrollRect_Injection));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_ComponentCache_Scrollbar_Injection_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("ComponentCache");
			QPYX_ComponentCache_Scrollbar_InjectionWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(ComponentCache.Scrollbar_Injection));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_ComponentCache_Dropdown_Injection_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("ComponentCache");
			QPYX_ComponentCache_Dropdown_InjectionWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(ComponentCache.Dropdown_Injection));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_ComponentCache_GridLayoutGroup_Injection_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("ComponentCache");
			QPYX_ComponentCache_GridLayoutGroup_InjectionWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(ComponentCache.GridLayoutGroup_Injection));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_ComponentCache_RawImage_Injection_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("ComponentCache");
			QPYX_ComponentCache_RawImage_InjectionWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(ComponentCache.RawImage_Injection));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_ComponentCache_AudioSource_Injection_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("ComponentCache");
			QPYX_ComponentCache_AudioSource_InjectionWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(ComponentCache.AudioSource_Injection));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_ComponentCache_Animation_Injection_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("ComponentCache");
			QPYX_ComponentCache_Animation_InjectionWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(ComponentCache.Animation_Injection));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_ComponentCache_Animator_Injection_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("ComponentCache");
			QPYX_ComponentCache_Animator_InjectionWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(ComponentCache.Animator_Injection));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_ComponentCache_SpriteAtlas_Injection_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("ComponentCache");
			QPYX_ComponentCache_SpriteAtlas_InjectionWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(ComponentCache.SpriteAtlas_Injection));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_ComponentCache_SpriteHolder_Injection_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("ComponentCache");
			QPYX_ComponentCache_SpriteHolder_InjectionWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(ComponentCache.SpriteHolder_Injection));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_ComponentCache_UIStateSwitcher_Injection_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("ComponentCache");
			QPYX_ComponentCache_UIStateSwitcher_InjectionWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(ComponentCache.UIStateSwitcher_Injection));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_ComponentCache_TextWrap_Injection_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("ComponentCache");
			QPYX_ComponentCache_TextWrap_InjectionWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(ComponentCache.TextWrap_Injection));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_ComponentCache_UIImageAnimation_Injection_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("ComponentCache");
			QPYX_ComponentCache_UIImageAnimation_InjectionWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(ComponentCache.UIImageAnimation_Injection));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}

	[MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	static int QPYX_LuaOpen_ComponentCache_ComponentCache_Injection_YXQP(IntPtr L_YXQP)
	{
		try
		{
			LuaState QPYX_state_YXQP = LuaState.Get(L_YXQP);			QPYX_state_YXQP.BeginPreModule("ComponentCache");
			QPYX_ComponentCache_ComponentCache_InjectionWrap_YXQP.QPYX_Register_YXQP(QPYX_state_YXQP);
			int QPYX_reference_YXQP = QPYX_state_YXQP.GetMetaReference(typeof(ComponentCache.ComponentCache_Injection));
			QPYX_state_YXQP.EndPreModule(L_YXQP, QPYX_reference_YXQP);			return 1;
		}
		catch(Exception QPYX_e_YXQP)		{
			return LuaDLL.toluaL_exception(L_YXQP, QPYX_e_YXQP);		}
	}
}

