using System;
using System.Collections.Generic;
using LuaInterface;

public class DelegateFactory
{
	public delegate Delegate DelegateCreate(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP);
	public static Dictionary<Type, DelegateCreate> _dict = new Dictionary<Type, DelegateCreate>();
	static DelegateFactory QPYX_factory_YXQP = new DelegateFactory();

	public static void Init()
	{
		QPYX_Register_YXQP();
	}

	public static void QPYX_Register_YXQP()
	{
	Dictionary<Type, DelegateCreate> QPYX_dict_YXQP = _dict;
		QPYX_dict_YXQP.Clear();
		QPYX_dict_YXQP.Add(typeof(System.Action), QPYX_factory_YXQP.QPYX_System_Action_YXQP);
		QPYX_dict_YXQP.Add(typeof(System.Action<int>), QPYX_factory_YXQP.QPYX_System_Action_int_YXQP);
		QPYX_dict_YXQP.Add(typeof(System.Action<string>), QPYX_factory_YXQP.QPYX_System_Action_string_YXQP);
		QPYX_dict_YXQP.Add(typeof(System.Predicate<int>), QPYX_factory_YXQP.QPYX_System_Predicate_int_YXQP);
		QPYX_dict_YXQP.Add(typeof(System.Comparison<int>), QPYX_factory_YXQP.QPYX_System_Comparison_int_YXQP);
		QPYX_dict_YXQP.Add(typeof(UnityEngine.Events.UnityAction), QPYX_factory_YXQP.QPYX_UnityEngine_Events_UnityAction_YXQP);
		QPYX_dict_YXQP.Add(typeof(UnityEngine.Events.UnityAction<string>), QPYX_factory_YXQP.QPYX_UnityEngine_Events_UnityAction_string_YXQP);
		QPYX_dict_YXQP.Add(typeof(UnityEngine.Events.UnityAction<float>), QPYX_factory_YXQP.QPYX_UnityEngine_Events_UnityAction_float_YXQP);
		QPYX_dict_YXQP.Add(typeof(UnityEngine.Events.UnityAction<bool>), QPYX_factory_YXQP.QPYX_UnityEngine_Events_UnityAction_bool_YXQP);
		QPYX_dict_YXQP.Add(typeof(UnityEngine.Events.UnityAction<int>), QPYX_factory_YXQP.QPYX_UnityEngine_Events_UnityAction_int_YXQP);
		QPYX_dict_YXQP.Add(typeof(UnityEngine.Events.UnityAction<UnityEngine.Vector2>), QPYX_factory_YXQP.QPYX_UnityEngine_Events_UnityAction_UnityEngine_Vector2_YXQP);
		QPYX_dict_YXQP.Add(typeof(DG.Tweening.TweenCallback), QPYX_factory_YXQP.QPYX_DG_Tweening_TweenCallback_YXQP);
		QPYX_dict_YXQP.Add(typeof(DG.Tweening.Core.DOGetter<float>), QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOGetter_float_YXQP);
		QPYX_dict_YXQP.Add(typeof(DG.Tweening.Core.DOSetter<float>), QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOSetter_float_YXQP);
		QPYX_dict_YXQP.Add(typeof(GameSDKInterface.LoginSucHandler), QPYX_factory_YXQP.QPYX_GameSDKInterface_LoginSucHandler_YXQP);
		QPYX_dict_YXQP.Add(typeof(GameSDKInterface.LogoutHandler), QPYX_factory_YXQP.QPYX_GameSDKInterface_LogoutHandler_YXQP);
		QPYX_dict_YXQP.Add(typeof(System.Action<TimeEvent>), QPYX_factory_YXQP.QPYX_System_Action_TimeEvent_YXQP);
		QPYX_dict_YXQP.Add(typeof(System.Action<UnityEngine.GameObject>), QPYX_factory_YXQP.QPYX_System_Action_UnityEngine_GameObject_YXQP);
		QPYX_dict_YXQP.Add(typeof(System.Action<GameAsset.LoadedAssetBundle>), QPYX_factory_YXQP.QPYX_System_Action_GameAsset_LoadedAssetBundle_YXQP);
		QPYX_dict_YXQP.Add(typeof(System.Action<WWWOperation>), QPYX_factory_YXQP.QPYX_System_Action_WWWOperation_YXQP);
		QPYX_dict_YXQP.Add(typeof(System.Action<BestHttpOperation>), QPYX_factory_YXQP.QPYX_System_Action_BestHttpOperation_YXQP);
		QPYX_dict_YXQP.Add(typeof(System.Action<AudioPlayOperation>), QPYX_factory_YXQP.QPYX_System_Action_AudioPlayOperation_YXQP);
		QPYX_dict_YXQP.Add(typeof(System.Action<float>), QPYX_factory_YXQP.QPYX_System_Action_float_YXQP);
		QPYX_dict_YXQP.Add(typeof(UnityEngine.Canvas.WillRenderCanvases), QPYX_factory_YXQP.QPYX_UnityEngine_Canvas_WillRenderCanvases_YXQP);
		QPYX_dict_YXQP.Add(typeof(LoopScrollView.OnBaseNodeEvent), QPYX_factory_YXQP.QPYX_LoopScrollView_OnBaseNodeEvent_YXQP);
		QPYX_dict_YXQP.Add(typeof(LoopScrollView.OnBaseNodeEvent<bool>), QPYX_factory_YXQP.QPYX_LoopScrollView_OnBaseNodeEvent_bool_YXQP);
		QPYX_dict_YXQP.Add(typeof(UnityEngine.Events.UnityAction<LoopBaseNode>), QPYX_factory_YXQP.QPYX_UnityEngine_Events_UnityAction_LoopBaseNode_YXQP);
		QPYX_dict_YXQP.Add(typeof(UnityEngine.Events.UnityAction<UnityEngine.Vector3>), QPYX_factory_YXQP.QPYX_UnityEngine_Events_UnityAction_UnityEngine_Vector3_YXQP);
		QPYX_dict_YXQP.Add(typeof(System.Action<string,string>), QPYX_factory_YXQP.QPYX_System_Action_string_string_YXQP);
		QPYX_dict_YXQP.Add(typeof(System.Action<int,string,int>), QPYX_factory_YXQP.QPYX_System_Action_int_string_int_YXQP);
		QPYX_dict_YXQP.Add(typeof(gcloud_voice.IGCloudVoice.JoinRoomCompleteHandler), QPYX_factory_YXQP.QPYX_gcloud_voice_IGCloudVoice_JoinRoomCompleteHandler_YXQP);
		QPYX_dict_YXQP.Add(typeof(gcloud_voice.IGCloudVoice.QuitRoomCompleteHandler), QPYX_factory_YXQP.QPYX_gcloud_voice_IGCloudVoice_QuitRoomCompleteHandler_YXQP);
		QPYX_dict_YXQP.Add(typeof(gcloud_voice.IGCloudVoice.MemberVoiceHandler), QPYX_factory_YXQP.QPYX_gcloud_voice_IGCloudVoice_MemberVoiceHandler_YXQP);
		QPYX_dict_YXQP.Add(typeof(gcloud_voice.IGCloudVoice.ApplyMessageKeyCompleteHandler), QPYX_factory_YXQP.QPYX_gcloud_voice_IGCloudVoice_ApplyMessageKeyCompleteHandler_YXQP);
		QPYX_dict_YXQP.Add(typeof(gcloud_voice.IGCloudVoice.UploadReccordFileCompleteHandler), QPYX_factory_YXQP.QPYX_gcloud_voice_IGCloudVoice_UploadReccordFileCompleteHandler_YXQP);
		QPYX_dict_YXQP.Add(typeof(gcloud_voice.IGCloudVoice.DownloadRecordFileCompleteHandler), QPYX_factory_YXQP.QPYX_gcloud_voice_IGCloudVoice_DownloadRecordFileCompleteHandler_YXQP);
		QPYX_dict_YXQP.Add(typeof(gcloud_voice.IGCloudVoice.PlayRecordFilCompleteHandler), QPYX_factory_YXQP.QPYX_gcloud_voice_IGCloudVoice_PlayRecordFilCompleteHandler_YXQP);
		QPYX_dict_YXQP.Add(typeof(gcloud_voice.IGCloudVoice.SpeechToTextHandler), QPYX_factory_YXQP.QPYX_gcloud_voice_IGCloudVoice_SpeechToTextHandler_YXQP);
		QPYX_dict_YXQP.Add(typeof(gcloud_voice.IGCloudVoice.StreamSpeechToTextHandler), QPYX_factory_YXQP.QPYX_gcloud_voice_IGCloudVoice_StreamSpeechToTextHandler_YXQP);
		QPYX_dict_YXQP.Add(typeof(gcloud_voice.IGCloudVoice.StatusUpdateHandler), QPYX_factory_YXQP.QPYX_gcloud_voice_IGCloudVoice_StatusUpdateHandler_YXQP);
		QPYX_dict_YXQP.Add(typeof(gcloud_voice.IGCloudVoice.ChangeRoleCompleteHandler), QPYX_factory_YXQP.QPYX_gcloud_voice_IGCloudVoice_ChangeRoleCompleteHandler_YXQP);
		QPYX_dict_YXQP.Add(typeof(gcloud_voice.IGCloudVoice.RoomMemberVoiceHandler), QPYX_factory_YXQP.QPYX_gcloud_voice_IGCloudVoice_RoomMemberVoiceHandler_YXQP);
		QPYX_dict_YXQP.Add(typeof(gcloud_voice.IGCloudVoice.EventUpdateHandler), QPYX_factory_YXQP.QPYX_gcloud_voice_IGCloudVoice_EventUpdateHandler_YXQP);
		QPYX_dict_YXQP.Add(typeof(gcloud_voice.IGCloudVoice.MuteSwitchResultHandler), QPYX_factory_YXQP.QPYX_gcloud_voice_IGCloudVoice_MuteSwitchResultHandler_YXQP);
		QPYX_dict_YXQP.Add(typeof(littlerbird.UI.QuickGrid.QuickGridItemEvenet), QPYX_factory_YXQP.QPYX_littlerbird_UI_QuickGrid_QuickGridItemEvenet_YXQP);
		QPYX_dict_YXQP.Add(typeof(littlerbird.UI.QuickGrid.ReturnQuickGridItemEvent<bool>), QPYX_factory_YXQP.QPYX_littlerbird_UI_QuickGrid_ReturnQuickGridItemEvent_bool_YXQP);
		QPYX_dict_YXQP.Add(typeof(littlerbird.UI.QuickGrid.ReturnQuickGridItemEvent), QPYX_factory_YXQP.QPYX_littlerbird_UI_QuickGrid_ReturnQuickGridItemEvent_YXQP);
		QPYX_dict_YXQP.Add(typeof(littlerbird.UI.QuickGrid.QuickCallback), QPYX_factory_YXQP.QPYX_littlerbird_UI_QuickGrid_QuickCallback_YXQP);
		QPYX_dict_YXQP.Add(typeof(System.Action<SimpleItemBase>), QPYX_factory_YXQP.QPYX_System_Action_SimpleItemBase_YXQP);
		QPYX_dict_YXQP.Add(typeof(UnityEngine.RectTransform.ReapplyDrivenProperties), QPYX_factory_YXQP.QPYX_UnityEngine_RectTransform_ReapplyDrivenProperties_YXQP);
		QPYX_dict_YXQP.Add(typeof(UnityEngine.UI.InputField.OnValidateInput), QPYX_factory_YXQP.QPYX_UnityEngine_UI_InputField_OnValidateInput_YXQP);
		QPYX_dict_YXQP.Add(typeof(DG.Tweening.Core.DOGetter<double>), QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOGetter_double_YXQP);
		QPYX_dict_YXQP.Add(typeof(DG.Tweening.Core.DOSetter<double>), QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOSetter_double_YXQP);
		QPYX_dict_YXQP.Add(typeof(DG.Tweening.Core.DOGetter<int>), QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOGetter_int_YXQP);
		QPYX_dict_YXQP.Add(typeof(DG.Tweening.Core.DOSetter<int>), QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOSetter_int_YXQP);
		QPYX_dict_YXQP.Add(typeof(DG.Tweening.Core.DOGetter<uint>), QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOGetter_uint_YXQP);
		QPYX_dict_YXQP.Add(typeof(DG.Tweening.Core.DOSetter<uint>), QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOSetter_uint_YXQP);
		QPYX_dict_YXQP.Add(typeof(DG.Tweening.Core.DOGetter<long>), QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOGetter_long_YXQP);
		QPYX_dict_YXQP.Add(typeof(DG.Tweening.Core.DOSetter<long>), QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOSetter_long_YXQP);
		QPYX_dict_YXQP.Add(typeof(DG.Tweening.Core.DOGetter<ulong>), QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOGetter_ulong_YXQP);
		QPYX_dict_YXQP.Add(typeof(DG.Tweening.Core.DOSetter<ulong>), QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOSetter_ulong_YXQP);
		QPYX_dict_YXQP.Add(typeof(DG.Tweening.Core.DOGetter<string>), QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOGetter_string_YXQP);
		QPYX_dict_YXQP.Add(typeof(DG.Tweening.Core.DOSetter<string>), QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOSetter_string_YXQP);
		QPYX_dict_YXQP.Add(typeof(DG.Tweening.Core.DOGetter<UnityEngine.Vector2>), QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Vector2_YXQP);
		QPYX_dict_YXQP.Add(typeof(DG.Tweening.Core.DOSetter<UnityEngine.Vector2>), QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Vector2_YXQP);
		QPYX_dict_YXQP.Add(typeof(DG.Tweening.Core.DOGetter<UnityEngine.Vector3>), QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Vector3_YXQP);
		QPYX_dict_YXQP.Add(typeof(DG.Tweening.Core.DOSetter<UnityEngine.Vector3>), QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Vector3_YXQP);
		QPYX_dict_YXQP.Add(typeof(DG.Tweening.Core.DOGetter<UnityEngine.Vector4>), QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Vector4_YXQP);
		QPYX_dict_YXQP.Add(typeof(DG.Tweening.Core.DOSetter<UnityEngine.Vector4>), QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Vector4_YXQP);
		QPYX_dict_YXQP.Add(typeof(DG.Tweening.Core.DOGetter<UnityEngine.Quaternion>), QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Quaternion_YXQP);
		QPYX_dict_YXQP.Add(typeof(DG.Tweening.Core.DOSetter<UnityEngine.Quaternion>), QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Quaternion_YXQP);
		QPYX_dict_YXQP.Add(typeof(DG.Tweening.Core.DOGetter<UnityEngine.Color>), QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Color_YXQP);
		QPYX_dict_YXQP.Add(typeof(DG.Tweening.Core.DOSetter<UnityEngine.Color>), QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Color_YXQP);
		QPYX_dict_YXQP.Add(typeof(DG.Tweening.Core.DOGetter<UnityEngine.Rect>), QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Rect_YXQP);
		QPYX_dict_YXQP.Add(typeof(DG.Tweening.Core.DOSetter<UnityEngine.Rect>), QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Rect_YXQP);
		QPYX_dict_YXQP.Add(typeof(DG.Tweening.Core.DOGetter<UnityEngine.RectOffset>), QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOGetter_UnityEngine_RectOffset_YXQP);
		QPYX_dict_YXQP.Add(typeof(DG.Tweening.Core.DOSetter<UnityEngine.RectOffset>), QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOSetter_UnityEngine_RectOffset_YXQP);
		QPYX_dict_YXQP.Add(typeof(DG.Tweening.TweenCallback<int>), QPYX_factory_YXQP.QPYX_DG_Tweening_TweenCallback_int_YXQP);
		QPYX_dict_YXQP.Add(typeof(UnityEngine.Camera.CameraCallback), QPYX_factory_YXQP.QPYX_UnityEngine_Camera_CameraCallback_YXQP);
		QPYX_dict_YXQP.Add(typeof(UnityEngine.Application.LowMemoryCallback), QPYX_factory_YXQP.QPYX_UnityEngine_Application_LowMemoryCallback_YXQP);
		QPYX_dict_YXQP.Add(typeof(UnityEngine.Application.AdvertisingIdentifierCallback), QPYX_factory_YXQP.QPYX_UnityEngine_Application_AdvertisingIdentifierCallback_YXQP);
		QPYX_dict_YXQP.Add(typeof(UnityEngine.Application.LogCallback), QPYX_factory_YXQP.QPYX_UnityEngine_Application_LogCallback_YXQP);
		QPYX_dict_YXQP.Add(typeof(BestHTTP.OnUploadProgressDelegate), QPYX_factory_YXQP.QPYX_BestHTTP_OnUploadProgressDelegate_YXQP);
		QPYX_dict_YXQP.Add(typeof(BestHTTP.OnDownloadProgressDelegate), QPYX_factory_YXQP.QPYX_BestHTTP_OnDownloadProgressDelegate_YXQP);
		QPYX_dict_YXQP.Add(typeof(BestHTTP.OnRequestFinishedDelegate), QPYX_factory_YXQP.QPYX_BestHTTP_OnRequestFinishedDelegate_YXQP);
		QPYX_dict_YXQP.Add(typeof(System.Func<BestHTTP.HTTPRequest,System.Security.Cryptography.X509Certificates.X509Certificate,System.Security.Cryptography.X509Certificates.X509Chain,bool>), QPYX_factory_YXQP.QPYX_System_Func_BestHTTP_HTTPRequest_System_Security_Cryptography_X509Certificates_X509Certificate_System_Security_Cryptography_X509Certificates_X509Chain_bool_YXQP);
		QPYX_dict_YXQP.Add(typeof(BestHTTP.OnBeforeRedirectionDelegate), QPYX_factory_YXQP.QPYX_BestHTTP_OnBeforeRedirectionDelegate_YXQP);
		QPYX_dict_YXQP.Add(typeof(BestHTTP.OnBeforeHeaderSendDelegate), QPYX_factory_YXQP.QPYX_BestHTTP_OnBeforeHeaderSendDelegate_YXQP);
		QPYX_dict_YXQP.Add(typeof(BestHTTP.OnHeaderEnumerationDelegate), QPYX_factory_YXQP.QPYX_BestHTTP_OnHeaderEnumerationDelegate_YXQP);
		QPYX_dict_YXQP.Add(typeof(System.Action<UnityEngine.AsyncOperation>), QPYX_factory_YXQP.QPYX_System_Action_UnityEngine_AsyncOperation_YXQP);
		QPYX_dict_YXQP.Add(typeof(UnityEngine.AudioClip.PCMReaderCallback), QPYX_factory_YXQP.QPYX_UnityEngine_AudioClip_PCMReaderCallback_YXQP);
		QPYX_dict_YXQP.Add(typeof(UnityEngine.AudioClip.PCMSetPositionCallback), QPYX_factory_YXQP.QPYX_UnityEngine_AudioClip_PCMSetPositionCallback_YXQP);

		DelegateTraits<System.Action>.Init(QPYX_factory_YXQP.QPYX_System_Action_YXQP);
		DelegateTraits<System.Action<int>>.Init(QPYX_factory_YXQP.QPYX_System_Action_int_YXQP);
		DelegateTraits<System.Action<string>>.Init(QPYX_factory_YXQP.QPYX_System_Action_string_YXQP);
		DelegateTraits<System.Predicate<int>>.Init(QPYX_factory_YXQP.QPYX_System_Predicate_int_YXQP);
		DelegateTraits<System.Comparison<int>>.Init(QPYX_factory_YXQP.QPYX_System_Comparison_int_YXQP);
		DelegateTraits<UnityEngine.Events.UnityAction>.Init(QPYX_factory_YXQP.QPYX_UnityEngine_Events_UnityAction_YXQP);
		DelegateTraits<UnityEngine.Events.UnityAction<string>>.Init(QPYX_factory_YXQP.QPYX_UnityEngine_Events_UnityAction_string_YXQP);
		DelegateTraits<UnityEngine.Events.UnityAction<float>>.Init(QPYX_factory_YXQP.QPYX_UnityEngine_Events_UnityAction_float_YXQP);
		DelegateTraits<UnityEngine.Events.UnityAction<bool>>.Init(QPYX_factory_YXQP.QPYX_UnityEngine_Events_UnityAction_bool_YXQP);
		DelegateTraits<UnityEngine.Events.UnityAction<int>>.Init(QPYX_factory_YXQP.QPYX_UnityEngine_Events_UnityAction_int_YXQP);
		DelegateTraits<UnityEngine.Events.UnityAction<UnityEngine.Vector2>>.Init(QPYX_factory_YXQP.QPYX_UnityEngine_Events_UnityAction_UnityEngine_Vector2_YXQP);
		DelegateTraits<DG.Tweening.TweenCallback>.Init(QPYX_factory_YXQP.QPYX_DG_Tweening_TweenCallback_YXQP);
		DelegateTraits<DG.Tweening.Core.DOGetter<float>>.Init(QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOGetter_float_YXQP);
		DelegateTraits<DG.Tweening.Core.DOSetter<float>>.Init(QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOSetter_float_YXQP);
		DelegateTraits<GameSDKInterface.LoginSucHandler>.Init(QPYX_factory_YXQP.QPYX_GameSDKInterface_LoginSucHandler_YXQP);
		DelegateTraits<GameSDKInterface.LogoutHandler>.Init(QPYX_factory_YXQP.QPYX_GameSDKInterface_LogoutHandler_YXQP);
		DelegateTraits<System.Action<TimeEvent>>.Init(QPYX_factory_YXQP.QPYX_System_Action_TimeEvent_YXQP);
		DelegateTraits<System.Action<UnityEngine.GameObject>>.Init(QPYX_factory_YXQP.QPYX_System_Action_UnityEngine_GameObject_YXQP);
		DelegateTraits<System.Action<GameAsset.LoadedAssetBundle>>.Init(QPYX_factory_YXQP.QPYX_System_Action_GameAsset_LoadedAssetBundle_YXQP);
		DelegateTraits<System.Action<WWWOperation>>.Init(QPYX_factory_YXQP.QPYX_System_Action_WWWOperation_YXQP);
		DelegateTraits<System.Action<BestHttpOperation>>.Init(QPYX_factory_YXQP.QPYX_System_Action_BestHttpOperation_YXQP);
		DelegateTraits<System.Action<AudioPlayOperation>>.Init(QPYX_factory_YXQP.QPYX_System_Action_AudioPlayOperation_YXQP);
		DelegateTraits<System.Action<float>>.Init(QPYX_factory_YXQP.QPYX_System_Action_float_YXQP);
		DelegateTraits<UnityEngine.Canvas.WillRenderCanvases>.Init(QPYX_factory_YXQP.QPYX_UnityEngine_Canvas_WillRenderCanvases_YXQP);
		DelegateTraits<LoopScrollView.OnBaseNodeEvent>.Init(QPYX_factory_YXQP.QPYX_LoopScrollView_OnBaseNodeEvent_YXQP);
		DelegateTraits<LoopScrollView.OnBaseNodeEvent<bool>>.Init(QPYX_factory_YXQP.QPYX_LoopScrollView_OnBaseNodeEvent_bool_YXQP);
		DelegateTraits<UnityEngine.Events.UnityAction<LoopBaseNode>>.Init(QPYX_factory_YXQP.QPYX_UnityEngine_Events_UnityAction_LoopBaseNode_YXQP);
		DelegateTraits<UnityEngine.Events.UnityAction<UnityEngine.Vector3>>.Init(QPYX_factory_YXQP.QPYX_UnityEngine_Events_UnityAction_UnityEngine_Vector3_YXQP);
		DelegateTraits<System.Action<string,string>>.Init(QPYX_factory_YXQP.QPYX_System_Action_string_string_YXQP);
		DelegateTraits<System.Action<int,string,int>>.Init(QPYX_factory_YXQP.QPYX_System_Action_int_string_int_YXQP);
		DelegateTraits<gcloud_voice.IGCloudVoice.JoinRoomCompleteHandler>.Init(QPYX_factory_YXQP.QPYX_gcloud_voice_IGCloudVoice_JoinRoomCompleteHandler_YXQP);
		DelegateTraits<gcloud_voice.IGCloudVoice.QuitRoomCompleteHandler>.Init(QPYX_factory_YXQP.QPYX_gcloud_voice_IGCloudVoice_QuitRoomCompleteHandler_YXQP);
		DelegateTraits<gcloud_voice.IGCloudVoice.MemberVoiceHandler>.Init(QPYX_factory_YXQP.QPYX_gcloud_voice_IGCloudVoice_MemberVoiceHandler_YXQP);
		DelegateTraits<gcloud_voice.IGCloudVoice.ApplyMessageKeyCompleteHandler>.Init(QPYX_factory_YXQP.QPYX_gcloud_voice_IGCloudVoice_ApplyMessageKeyCompleteHandler_YXQP);
		DelegateTraits<gcloud_voice.IGCloudVoice.UploadReccordFileCompleteHandler>.Init(QPYX_factory_YXQP.QPYX_gcloud_voice_IGCloudVoice_UploadReccordFileCompleteHandler_YXQP);
		DelegateTraits<gcloud_voice.IGCloudVoice.DownloadRecordFileCompleteHandler>.Init(QPYX_factory_YXQP.QPYX_gcloud_voice_IGCloudVoice_DownloadRecordFileCompleteHandler_YXQP);
		DelegateTraits<gcloud_voice.IGCloudVoice.PlayRecordFilCompleteHandler>.Init(QPYX_factory_YXQP.QPYX_gcloud_voice_IGCloudVoice_PlayRecordFilCompleteHandler_YXQP);
		DelegateTraits<gcloud_voice.IGCloudVoice.SpeechToTextHandler>.Init(QPYX_factory_YXQP.QPYX_gcloud_voice_IGCloudVoice_SpeechToTextHandler_YXQP);
		DelegateTraits<gcloud_voice.IGCloudVoice.StreamSpeechToTextHandler>.Init(QPYX_factory_YXQP.QPYX_gcloud_voice_IGCloudVoice_StreamSpeechToTextHandler_YXQP);
		DelegateTraits<gcloud_voice.IGCloudVoice.StatusUpdateHandler>.Init(QPYX_factory_YXQP.QPYX_gcloud_voice_IGCloudVoice_StatusUpdateHandler_YXQP);
		DelegateTraits<gcloud_voice.IGCloudVoice.ChangeRoleCompleteHandler>.Init(QPYX_factory_YXQP.QPYX_gcloud_voice_IGCloudVoice_ChangeRoleCompleteHandler_YXQP);
		DelegateTraits<gcloud_voice.IGCloudVoice.RoomMemberVoiceHandler>.Init(QPYX_factory_YXQP.QPYX_gcloud_voice_IGCloudVoice_RoomMemberVoiceHandler_YXQP);
		DelegateTraits<gcloud_voice.IGCloudVoice.EventUpdateHandler>.Init(QPYX_factory_YXQP.QPYX_gcloud_voice_IGCloudVoice_EventUpdateHandler_YXQP);
		DelegateTraits<gcloud_voice.IGCloudVoice.MuteSwitchResultHandler>.Init(QPYX_factory_YXQP.QPYX_gcloud_voice_IGCloudVoice_MuteSwitchResultHandler_YXQP);
		DelegateTraits<littlerbird.UI.QuickGrid.QuickGridItemEvenet>.Init(QPYX_factory_YXQP.QPYX_littlerbird_UI_QuickGrid_QuickGridItemEvenet_YXQP);
		DelegateTraits<littlerbird.UI.QuickGrid.ReturnQuickGridItemEvent<bool>>.Init(QPYX_factory_YXQP.QPYX_littlerbird_UI_QuickGrid_ReturnQuickGridItemEvent_bool_YXQP);
		DelegateTraits<littlerbird.UI.QuickGrid.ReturnQuickGridItemEvent>.Init(QPYX_factory_YXQP.QPYX_littlerbird_UI_QuickGrid_ReturnQuickGridItemEvent_YXQP);
		DelegateTraits<littlerbird.UI.QuickGrid.QuickCallback>.Init(QPYX_factory_YXQP.QPYX_littlerbird_UI_QuickGrid_QuickCallback_YXQP);
		DelegateTraits<System.Action<SimpleItemBase>>.Init(QPYX_factory_YXQP.QPYX_System_Action_SimpleItemBase_YXQP);
		DelegateTraits<UnityEngine.RectTransform.ReapplyDrivenProperties>.Init(QPYX_factory_YXQP.QPYX_UnityEngine_RectTransform_ReapplyDrivenProperties_YXQP);
		DelegateTraits<UnityEngine.UI.InputField.OnValidateInput>.Init(QPYX_factory_YXQP.QPYX_UnityEngine_UI_InputField_OnValidateInput_YXQP);
		DelegateTraits<DG.Tweening.Core.DOGetter<double>>.Init(QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOGetter_double_YXQP);
		DelegateTraits<DG.Tweening.Core.DOSetter<double>>.Init(QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOSetter_double_YXQP);
		DelegateTraits<DG.Tweening.Core.DOGetter<int>>.Init(QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOGetter_int_YXQP);
		DelegateTraits<DG.Tweening.Core.DOSetter<int>>.Init(QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOSetter_int_YXQP);
		DelegateTraits<DG.Tweening.Core.DOGetter<uint>>.Init(QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOGetter_uint_YXQP);
		DelegateTraits<DG.Tweening.Core.DOSetter<uint>>.Init(QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOSetter_uint_YXQP);
		DelegateTraits<DG.Tweening.Core.DOGetter<long>>.Init(QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOGetter_long_YXQP);
		DelegateTraits<DG.Tweening.Core.DOSetter<long>>.Init(QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOSetter_long_YXQP);
		DelegateTraits<DG.Tweening.Core.DOGetter<ulong>>.Init(QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOGetter_ulong_YXQP);
		DelegateTraits<DG.Tweening.Core.DOSetter<ulong>>.Init(QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOSetter_ulong_YXQP);
		DelegateTraits<DG.Tweening.Core.DOGetter<string>>.Init(QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOGetter_string_YXQP);
		DelegateTraits<DG.Tweening.Core.DOSetter<string>>.Init(QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOSetter_string_YXQP);
		DelegateTraits<DG.Tweening.Core.DOGetter<UnityEngine.Vector2>>.Init(QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Vector2_YXQP);
		DelegateTraits<DG.Tweening.Core.DOSetter<UnityEngine.Vector2>>.Init(QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Vector2_YXQP);
		DelegateTraits<DG.Tweening.Core.DOGetter<UnityEngine.Vector3>>.Init(QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Vector3_YXQP);
		DelegateTraits<DG.Tweening.Core.DOSetter<UnityEngine.Vector3>>.Init(QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Vector3_YXQP);
		DelegateTraits<DG.Tweening.Core.DOGetter<UnityEngine.Vector4>>.Init(QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Vector4_YXQP);
		DelegateTraits<DG.Tweening.Core.DOSetter<UnityEngine.Vector4>>.Init(QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Vector4_YXQP);
		DelegateTraits<DG.Tweening.Core.DOGetter<UnityEngine.Quaternion>>.Init(QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Quaternion_YXQP);
		DelegateTraits<DG.Tweening.Core.DOSetter<UnityEngine.Quaternion>>.Init(QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Quaternion_YXQP);
		DelegateTraits<DG.Tweening.Core.DOGetter<UnityEngine.Color>>.Init(QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Color_YXQP);
		DelegateTraits<DG.Tweening.Core.DOSetter<UnityEngine.Color>>.Init(QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Color_YXQP);
		DelegateTraits<DG.Tweening.Core.DOGetter<UnityEngine.Rect>>.Init(QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Rect_YXQP);
		DelegateTraits<DG.Tweening.Core.DOSetter<UnityEngine.Rect>>.Init(QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Rect_YXQP);
		DelegateTraits<DG.Tweening.Core.DOGetter<UnityEngine.RectOffset>>.Init(QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOGetter_UnityEngine_RectOffset_YXQP);
		DelegateTraits<DG.Tweening.Core.DOSetter<UnityEngine.RectOffset>>.Init(QPYX_factory_YXQP.QPYX_DG_Tweening_Core_DOSetter_UnityEngine_RectOffset_YXQP);
		DelegateTraits<DG.Tweening.TweenCallback<int>>.Init(QPYX_factory_YXQP.QPYX_DG_Tweening_TweenCallback_int_YXQP);
		DelegateTraits<UnityEngine.Camera.CameraCallback>.Init(QPYX_factory_YXQP.QPYX_UnityEngine_Camera_CameraCallback_YXQP);
		DelegateTraits<UnityEngine.Application.LowMemoryCallback>.Init(QPYX_factory_YXQP.QPYX_UnityEngine_Application_LowMemoryCallback_YXQP);
		DelegateTraits<UnityEngine.Application.AdvertisingIdentifierCallback>.Init(QPYX_factory_YXQP.QPYX_UnityEngine_Application_AdvertisingIdentifierCallback_YXQP);
		DelegateTraits<UnityEngine.Application.LogCallback>.Init(QPYX_factory_YXQP.QPYX_UnityEngine_Application_LogCallback_YXQP);
		DelegateTraits<BestHTTP.OnUploadProgressDelegate>.Init(QPYX_factory_YXQP.QPYX_BestHTTP_OnUploadProgressDelegate_YXQP);
		DelegateTraits<BestHTTP.OnDownloadProgressDelegate>.Init(QPYX_factory_YXQP.QPYX_BestHTTP_OnDownloadProgressDelegate_YXQP);
		DelegateTraits<BestHTTP.OnRequestFinishedDelegate>.Init(QPYX_factory_YXQP.QPYX_BestHTTP_OnRequestFinishedDelegate_YXQP);
		DelegateTraits<System.Func<BestHTTP.HTTPRequest,System.Security.Cryptography.X509Certificates.X509Certificate,System.Security.Cryptography.X509Certificates.X509Chain,bool>>.Init(QPYX_factory_YXQP.QPYX_System_Func_BestHTTP_HTTPRequest_System_Security_Cryptography_X509Certificates_X509Certificate_System_Security_Cryptography_X509Certificates_X509Chain_bool_YXQP);
		DelegateTraits<BestHTTP.OnBeforeRedirectionDelegate>.Init(QPYX_factory_YXQP.QPYX_BestHTTP_OnBeforeRedirectionDelegate_YXQP);
		DelegateTraits<BestHTTP.OnBeforeHeaderSendDelegate>.Init(QPYX_factory_YXQP.QPYX_BestHTTP_OnBeforeHeaderSendDelegate_YXQP);
		DelegateTraits<BestHTTP.OnHeaderEnumerationDelegate>.Init(QPYX_factory_YXQP.QPYX_BestHTTP_OnHeaderEnumerationDelegate_YXQP);
		DelegateTraits<System.Action<UnityEngine.AsyncOperation>>.Init(QPYX_factory_YXQP.QPYX_System_Action_UnityEngine_AsyncOperation_YXQP);
		DelegateTraits<UnityEngine.AudioClip.PCMReaderCallback>.Init(QPYX_factory_YXQP.QPYX_UnityEngine_AudioClip_PCMReaderCallback_YXQP);
		DelegateTraits<UnityEngine.AudioClip.PCMSetPositionCallback>.Init(QPYX_factory_YXQP.QPYX_UnityEngine_AudioClip_PCMSetPositionCallback_YXQP);

		TypeTraits<System.Action>.Init(QPYX_factory_YXQP.QPYX_Check_System_Action_YXQP);
		TypeTraits<System.Action<int>>.Init(QPYX_factory_YXQP.QPYX_Check_System_Action_int_YXQP);
		TypeTraits<System.Action<string>>.Init(QPYX_factory_YXQP.QPYX_Check_System_Action_string_YXQP);
		TypeTraits<System.Predicate<int>>.Init(QPYX_factory_YXQP.QPYX_Check_System_Predicate_int_YXQP);
		TypeTraits<System.Comparison<int>>.Init(QPYX_factory_YXQP.QPYX_Check_System_Comparison_int_YXQP);
		TypeTraits<UnityEngine.Events.UnityAction>.Init(QPYX_factory_YXQP.QPYX_Check_UnityEngine_Events_UnityAction_YXQP);
		TypeTraits<UnityEngine.Events.UnityAction<string>>.Init(QPYX_factory_YXQP.QPYX_Check_UnityEngine_Events_UnityAction_string_YXQP);
		TypeTraits<UnityEngine.Events.UnityAction<float>>.Init(QPYX_factory_YXQP.QPYX_Check_UnityEngine_Events_UnityAction_float_YXQP);
		TypeTraits<UnityEngine.Events.UnityAction<bool>>.Init(QPYX_factory_YXQP.QPYX_Check_UnityEngine_Events_UnityAction_bool_YXQP);
		TypeTraits<UnityEngine.Events.UnityAction<int>>.Init(QPYX_factory_YXQP.QPYX_Check_UnityEngine_Events_UnityAction_int_YXQP);
		TypeTraits<UnityEngine.Events.UnityAction<UnityEngine.Vector2>>.Init(QPYX_factory_YXQP.QPYX_Check_UnityEngine_Events_UnityAction_UnityEngine_Vector2_YXQP);
		TypeTraits<DG.Tweening.TweenCallback>.Init(QPYX_factory_YXQP.QPYX_Check_DG_Tweening_TweenCallback_YXQP);
		TypeTraits<DG.Tweening.Core.DOGetter<float>>.Init(QPYX_factory_YXQP.QPYX_Check_DG_Tweening_Core_DOGetter_float_YXQP);
		TypeTraits<DG.Tweening.Core.DOSetter<float>>.Init(QPYX_factory_YXQP.QPYX_Check_DG_Tweening_Core_DOSetter_float_YXQP);
		TypeTraits<GameSDKInterface.LoginSucHandler>.Init(QPYX_factory_YXQP.QPYX_Check_GameSDKInterface_LoginSucHandler_YXQP);
		TypeTraits<GameSDKInterface.LogoutHandler>.Init(QPYX_factory_YXQP.QPYX_Check_GameSDKInterface_LogoutHandler_YXQP);
		TypeTraits<System.Action<TimeEvent>>.Init(QPYX_factory_YXQP.QPYX_Check_System_Action_TimeEvent_YXQP);
		TypeTraits<System.Action<UnityEngine.GameObject>>.Init(QPYX_factory_YXQP.QPYX_Check_System_Action_UnityEngine_GameObject_YXQP);
		TypeTraits<System.Action<GameAsset.LoadedAssetBundle>>.Init(QPYX_factory_YXQP.QPYX_Check_System_Action_GameAsset_LoadedAssetBundle_YXQP);
		TypeTraits<System.Action<WWWOperation>>.Init(QPYX_factory_YXQP.QPYX_Check_System_Action_WWWOperation_YXQP);
		TypeTraits<System.Action<BestHttpOperation>>.Init(QPYX_factory_YXQP.QPYX_Check_System_Action_BestHttpOperation_YXQP);
		TypeTraits<System.Action<AudioPlayOperation>>.Init(QPYX_factory_YXQP.QPYX_Check_System_Action_AudioPlayOperation_YXQP);
		TypeTraits<System.Action<float>>.Init(QPYX_factory_YXQP.QPYX_Check_System_Action_float_YXQP);
		TypeTraits<UnityEngine.Canvas.WillRenderCanvases>.Init(QPYX_factory_YXQP.QPYX_Check_UnityEngine_Canvas_WillRenderCanvases_YXQP);
		TypeTraits<LoopScrollView.OnBaseNodeEvent>.Init(QPYX_factory_YXQP.QPYX_Check_LoopScrollView_OnBaseNodeEvent_YXQP);
		TypeTraits<LoopScrollView.OnBaseNodeEvent<bool>>.Init(QPYX_factory_YXQP.QPYX_Check_LoopScrollView_OnBaseNodeEvent_bool_YXQP);
		TypeTraits<UnityEngine.Events.UnityAction<LoopBaseNode>>.Init(QPYX_factory_YXQP.QPYX_Check_UnityEngine_Events_UnityAction_LoopBaseNode_YXQP);
		TypeTraits<UnityEngine.Events.UnityAction<UnityEngine.Vector3>>.Init(QPYX_factory_YXQP.QPYX_Check_UnityEngine_Events_UnityAction_UnityEngine_Vector3_YXQP);
		TypeTraits<System.Action<string,string>>.Init(QPYX_factory_YXQP.QPYX_Check_System_Action_string_string_YXQP);
		TypeTraits<System.Action<int,string,int>>.Init(QPYX_factory_YXQP.QPYX_Check_System_Action_int_string_int_YXQP);
		TypeTraits<gcloud_voice.IGCloudVoice.JoinRoomCompleteHandler>.Init(QPYX_factory_YXQP.QPYX_Check_gcloud_voice_IGCloudVoice_JoinRoomCompleteHandler_YXQP);
		TypeTraits<gcloud_voice.IGCloudVoice.QuitRoomCompleteHandler>.Init(QPYX_factory_YXQP.QPYX_Check_gcloud_voice_IGCloudVoice_QuitRoomCompleteHandler_YXQP);
		TypeTraits<gcloud_voice.IGCloudVoice.MemberVoiceHandler>.Init(QPYX_factory_YXQP.QPYX_Check_gcloud_voice_IGCloudVoice_MemberVoiceHandler_YXQP);
		TypeTraits<gcloud_voice.IGCloudVoice.ApplyMessageKeyCompleteHandler>.Init(QPYX_factory_YXQP.QPYX_Check_gcloud_voice_IGCloudVoice_ApplyMessageKeyCompleteHandler_YXQP);
		TypeTraits<gcloud_voice.IGCloudVoice.UploadReccordFileCompleteHandler>.Init(QPYX_factory_YXQP.QPYX_Check_gcloud_voice_IGCloudVoice_UploadReccordFileCompleteHandler_YXQP);
		TypeTraits<gcloud_voice.IGCloudVoice.DownloadRecordFileCompleteHandler>.Init(QPYX_factory_YXQP.QPYX_Check_gcloud_voice_IGCloudVoice_DownloadRecordFileCompleteHandler_YXQP);
		TypeTraits<gcloud_voice.IGCloudVoice.PlayRecordFilCompleteHandler>.Init(QPYX_factory_YXQP.QPYX_Check_gcloud_voice_IGCloudVoice_PlayRecordFilCompleteHandler_YXQP);
		TypeTraits<gcloud_voice.IGCloudVoice.SpeechToTextHandler>.Init(QPYX_factory_YXQP.QPYX_Check_gcloud_voice_IGCloudVoice_SpeechToTextHandler_YXQP);
		TypeTraits<gcloud_voice.IGCloudVoice.StreamSpeechToTextHandler>.Init(QPYX_factory_YXQP.QPYX_Check_gcloud_voice_IGCloudVoice_StreamSpeechToTextHandler_YXQP);
		TypeTraits<gcloud_voice.IGCloudVoice.StatusUpdateHandler>.Init(QPYX_factory_YXQP.QPYX_Check_gcloud_voice_IGCloudVoice_StatusUpdateHandler_YXQP);
		TypeTraits<gcloud_voice.IGCloudVoice.ChangeRoleCompleteHandler>.Init(QPYX_factory_YXQP.QPYX_Check_gcloud_voice_IGCloudVoice_ChangeRoleCompleteHandler_YXQP);
		TypeTraits<gcloud_voice.IGCloudVoice.RoomMemberVoiceHandler>.Init(QPYX_factory_YXQP.QPYX_Check_gcloud_voice_IGCloudVoice_RoomMemberVoiceHandler_YXQP);
		TypeTraits<gcloud_voice.IGCloudVoice.EventUpdateHandler>.Init(QPYX_factory_YXQP.QPYX_Check_gcloud_voice_IGCloudVoice_EventUpdateHandler_YXQP);
		TypeTraits<gcloud_voice.IGCloudVoice.MuteSwitchResultHandler>.Init(QPYX_factory_YXQP.QPYX_Check_gcloud_voice_IGCloudVoice_MuteSwitchResultHandler_YXQP);
		TypeTraits<littlerbird.UI.QuickGrid.QuickGridItemEvenet>.Init(QPYX_factory_YXQP.QPYX_Check_littlerbird_UI_QuickGrid_QuickGridItemEvenet_YXQP);
		TypeTraits<littlerbird.UI.QuickGrid.ReturnQuickGridItemEvent<bool>>.Init(QPYX_factory_YXQP.QPYX_Check_littlerbird_UI_QuickGrid_ReturnQuickGridItemEvent_bool_YXQP);
		TypeTraits<littlerbird.UI.QuickGrid.ReturnQuickGridItemEvent>.Init(QPYX_factory_YXQP.QPYX_Check_littlerbird_UI_QuickGrid_ReturnQuickGridItemEvent_YXQP);
		TypeTraits<littlerbird.UI.QuickGrid.QuickCallback>.Init(QPYX_factory_YXQP.QPYX_Check_littlerbird_UI_QuickGrid_QuickCallback_YXQP);
		TypeTraits<System.Action<SimpleItemBase>>.Init(QPYX_factory_YXQP.QPYX_Check_System_Action_SimpleItemBase_YXQP);
		TypeTraits<UnityEngine.RectTransform.ReapplyDrivenProperties>.Init(QPYX_factory_YXQP.QPYX_Check_UnityEngine_RectTransform_ReapplyDrivenProperties_YXQP);
		TypeTraits<UnityEngine.UI.InputField.OnValidateInput>.Init(QPYX_factory_YXQP.QPYX_Check_UnityEngine_UI_InputField_OnValidateInput_YXQP);
		TypeTraits<DG.Tweening.Core.DOGetter<double>>.Init(QPYX_factory_YXQP.QPYX_Check_DG_Tweening_Core_DOGetter_double_YXQP);
		TypeTraits<DG.Tweening.Core.DOSetter<double>>.Init(QPYX_factory_YXQP.QPYX_Check_DG_Tweening_Core_DOSetter_double_YXQP);
		TypeTraits<DG.Tweening.Core.DOGetter<int>>.Init(QPYX_factory_YXQP.QPYX_Check_DG_Tweening_Core_DOGetter_int_YXQP);
		TypeTraits<DG.Tweening.Core.DOSetter<int>>.Init(QPYX_factory_YXQP.QPYX_Check_DG_Tweening_Core_DOSetter_int_YXQP);
		TypeTraits<DG.Tweening.Core.DOGetter<uint>>.Init(QPYX_factory_YXQP.QPYX_Check_DG_Tweening_Core_DOGetter_uint_YXQP);
		TypeTraits<DG.Tweening.Core.DOSetter<uint>>.Init(QPYX_factory_YXQP.QPYX_Check_DG_Tweening_Core_DOSetter_uint_YXQP);
		TypeTraits<DG.Tweening.Core.DOGetter<long>>.Init(QPYX_factory_YXQP.QPYX_Check_DG_Tweening_Core_DOGetter_long_YXQP);
		TypeTraits<DG.Tweening.Core.DOSetter<long>>.Init(QPYX_factory_YXQP.QPYX_Check_DG_Tweening_Core_DOSetter_long_YXQP);
		TypeTraits<DG.Tweening.Core.DOGetter<ulong>>.Init(QPYX_factory_YXQP.QPYX_Check_DG_Tweening_Core_DOGetter_ulong_YXQP);
		TypeTraits<DG.Tweening.Core.DOSetter<ulong>>.Init(QPYX_factory_YXQP.QPYX_Check_DG_Tweening_Core_DOSetter_ulong_YXQP);
		TypeTraits<DG.Tweening.Core.DOGetter<string>>.Init(QPYX_factory_YXQP.QPYX_Check_DG_Tweening_Core_DOGetter_string_YXQP);
		TypeTraits<DG.Tweening.Core.DOSetter<string>>.Init(QPYX_factory_YXQP.QPYX_Check_DG_Tweening_Core_DOSetter_string_YXQP);
		TypeTraits<DG.Tweening.Core.DOGetter<UnityEngine.Vector2>>.Init(QPYX_factory_YXQP.QPYX_Check_DG_Tweening_Core_DOGetter_UnityEngine_Vector2_YXQP);
		TypeTraits<DG.Tweening.Core.DOSetter<UnityEngine.Vector2>>.Init(QPYX_factory_YXQP.QPYX_Check_DG_Tweening_Core_DOSetter_UnityEngine_Vector2_YXQP);
		TypeTraits<DG.Tweening.Core.DOGetter<UnityEngine.Vector3>>.Init(QPYX_factory_YXQP.QPYX_Check_DG_Tweening_Core_DOGetter_UnityEngine_Vector3_YXQP);
		TypeTraits<DG.Tweening.Core.DOSetter<UnityEngine.Vector3>>.Init(QPYX_factory_YXQP.QPYX_Check_DG_Tweening_Core_DOSetter_UnityEngine_Vector3_YXQP);
		TypeTraits<DG.Tweening.Core.DOGetter<UnityEngine.Vector4>>.Init(QPYX_factory_YXQP.QPYX_Check_DG_Tweening_Core_DOGetter_UnityEngine_Vector4_YXQP);
		TypeTraits<DG.Tweening.Core.DOSetter<UnityEngine.Vector4>>.Init(QPYX_factory_YXQP.QPYX_Check_DG_Tweening_Core_DOSetter_UnityEngine_Vector4_YXQP);
		TypeTraits<DG.Tweening.Core.DOGetter<UnityEngine.Quaternion>>.Init(QPYX_factory_YXQP.QPYX_Check_DG_Tweening_Core_DOGetter_UnityEngine_Quaternion_YXQP);
		TypeTraits<DG.Tweening.Core.DOSetter<UnityEngine.Quaternion>>.Init(QPYX_factory_YXQP.QPYX_Check_DG_Tweening_Core_DOSetter_UnityEngine_Quaternion_YXQP);
		TypeTraits<DG.Tweening.Core.DOGetter<UnityEngine.Color>>.Init(QPYX_factory_YXQP.QPYX_Check_DG_Tweening_Core_DOGetter_UnityEngine_Color_YXQP);
		TypeTraits<DG.Tweening.Core.DOSetter<UnityEngine.Color>>.Init(QPYX_factory_YXQP.QPYX_Check_DG_Tweening_Core_DOSetter_UnityEngine_Color_YXQP);
		TypeTraits<DG.Tweening.Core.DOGetter<UnityEngine.Rect>>.Init(QPYX_factory_YXQP.QPYX_Check_DG_Tweening_Core_DOGetter_UnityEngine_Rect_YXQP);
		TypeTraits<DG.Tweening.Core.DOSetter<UnityEngine.Rect>>.Init(QPYX_factory_YXQP.QPYX_Check_DG_Tweening_Core_DOSetter_UnityEngine_Rect_YXQP);
		TypeTraits<DG.Tweening.Core.DOGetter<UnityEngine.RectOffset>>.Init(QPYX_factory_YXQP.QPYX_Check_DG_Tweening_Core_DOGetter_UnityEngine_RectOffset_YXQP);
		TypeTraits<DG.Tweening.Core.DOSetter<UnityEngine.RectOffset>>.Init(QPYX_factory_YXQP.QPYX_Check_DG_Tweening_Core_DOSetter_UnityEngine_RectOffset_YXQP);
		TypeTraits<DG.Tweening.TweenCallback<int>>.Init(QPYX_factory_YXQP.QPYX_Check_DG_Tweening_TweenCallback_int_YXQP);
		TypeTraits<UnityEngine.Camera.CameraCallback>.Init(QPYX_factory_YXQP.QPYX_Check_UnityEngine_Camera_CameraCallback_YXQP);
		TypeTraits<UnityEngine.Application.LowMemoryCallback>.Init(QPYX_factory_YXQP.QPYX_Check_UnityEngine_Application_LowMemoryCallback_YXQP);
		TypeTraits<UnityEngine.Application.AdvertisingIdentifierCallback>.Init(QPYX_factory_YXQP.QPYX_Check_UnityEngine_Application_AdvertisingIdentifierCallback_YXQP);
		TypeTraits<UnityEngine.Application.LogCallback>.Init(QPYX_factory_YXQP.QPYX_Check_UnityEngine_Application_LogCallback_YXQP);
		TypeTraits<BestHTTP.OnUploadProgressDelegate>.Init(QPYX_factory_YXQP.QPYX_Check_BestHTTP_OnUploadProgressDelegate_YXQP);
		TypeTraits<BestHTTP.OnDownloadProgressDelegate>.Init(QPYX_factory_YXQP.QPYX_Check_BestHTTP_OnDownloadProgressDelegate_YXQP);
		TypeTraits<BestHTTP.OnRequestFinishedDelegate>.Init(QPYX_factory_YXQP.QPYX_Check_BestHTTP_OnRequestFinishedDelegate_YXQP);
		TypeTraits<System.Func<BestHTTP.HTTPRequest,System.Security.Cryptography.X509Certificates.X509Certificate,System.Security.Cryptography.X509Certificates.X509Chain,bool>>.Init(QPYX_factory_YXQP.QPYX_Check_System_Func_BestHTTP_HTTPRequest_System_Security_Cryptography_X509Certificates_X509Certificate_System_Security_Cryptography_X509Certificates_X509Chain_bool_YXQP);
		TypeTraits<BestHTTP.OnBeforeRedirectionDelegate>.Init(QPYX_factory_YXQP.QPYX_Check_BestHTTP_OnBeforeRedirectionDelegate_YXQP);
		TypeTraits<BestHTTP.OnBeforeHeaderSendDelegate>.Init(QPYX_factory_YXQP.QPYX_Check_BestHTTP_OnBeforeHeaderSendDelegate_YXQP);
		TypeTraits<BestHTTP.OnHeaderEnumerationDelegate>.Init(QPYX_factory_YXQP.QPYX_Check_BestHTTP_OnHeaderEnumerationDelegate_YXQP);
		TypeTraits<System.Action<UnityEngine.AsyncOperation>>.Init(QPYX_factory_YXQP.QPYX_Check_System_Action_UnityEngine_AsyncOperation_YXQP);
		TypeTraits<UnityEngine.AudioClip.PCMReaderCallback>.Init(QPYX_factory_YXQP.QPYX_Check_UnityEngine_AudioClip_PCMReaderCallback_YXQP);
		TypeTraits<UnityEngine.AudioClip.PCMSetPositionCallback>.Init(QPYX_factory_YXQP.QPYX_Check_UnityEngine_AudioClip_PCMSetPositionCallback_YXQP);

		StackTraits<System.Action>.Push = QPYX_factory_YXQP.QPYX_Push_System_Action_YXQP;
		StackTraits<System.Action<int>>.Push = QPYX_factory_YXQP.QPYX_Push_System_Action_int_YXQP;
		StackTraits<System.Action<string>>.Push = QPYX_factory_YXQP.QPYX_Push_System_Action_string_YXQP;
		StackTraits<System.Predicate<int>>.Push = QPYX_factory_YXQP.QPYX_Push_System_Predicate_int_YXQP;
		StackTraits<System.Comparison<int>>.Push = QPYX_factory_YXQP.QPYX_Push_System_Comparison_int_YXQP;
		StackTraits<UnityEngine.Events.UnityAction>.Push = QPYX_factory_YXQP.QPYX_Push_UnityEngine_Events_UnityAction_YXQP;
		StackTraits<UnityEngine.Events.UnityAction<string>>.Push = QPYX_factory_YXQP.QPYX_Push_UnityEngine_Events_UnityAction_string_YXQP;
		StackTraits<UnityEngine.Events.UnityAction<float>>.Push = QPYX_factory_YXQP.QPYX_Push_UnityEngine_Events_UnityAction_float_YXQP;
		StackTraits<UnityEngine.Events.UnityAction<bool>>.Push = QPYX_factory_YXQP.QPYX_Push_UnityEngine_Events_UnityAction_bool_YXQP;
		StackTraits<UnityEngine.Events.UnityAction<int>>.Push = QPYX_factory_YXQP.QPYX_Push_UnityEngine_Events_UnityAction_int_YXQP;
		StackTraits<UnityEngine.Events.UnityAction<UnityEngine.Vector2>>.Push = QPYX_factory_YXQP.QPYX_Push_UnityEngine_Events_UnityAction_UnityEngine_Vector2_YXQP;
		StackTraits<DG.Tweening.TweenCallback>.Push = QPYX_factory_YXQP.QPYX_Push_DG_Tweening_TweenCallback_YXQP;
		StackTraits<DG.Tweening.Core.DOGetter<float>>.Push = QPYX_factory_YXQP.QPYX_Push_DG_Tweening_Core_DOGetter_float_YXQP;
		StackTraits<DG.Tweening.Core.DOSetter<float>>.Push = QPYX_factory_YXQP.QPYX_Push_DG_Tweening_Core_DOSetter_float_YXQP;
		StackTraits<GameSDKInterface.LoginSucHandler>.Push = QPYX_factory_YXQP.QPYX_Push_GameSDKInterface_LoginSucHandler_YXQP;
		StackTraits<GameSDKInterface.LogoutHandler>.Push = QPYX_factory_YXQP.QPYX_Push_GameSDKInterface_LogoutHandler_YXQP;
		StackTraits<System.Action<TimeEvent>>.Push = QPYX_factory_YXQP.QPYX_Push_System_Action_TimeEvent_YXQP;
		StackTraits<System.Action<UnityEngine.GameObject>>.Push = QPYX_factory_YXQP.QPYX_Push_System_Action_UnityEngine_GameObject_YXQP;
		StackTraits<System.Action<GameAsset.LoadedAssetBundle>>.Push = QPYX_factory_YXQP.QPYX_Push_System_Action_GameAsset_LoadedAssetBundle_YXQP;
		StackTraits<System.Action<WWWOperation>>.Push = QPYX_factory_YXQP.QPYX_Push_System_Action_WWWOperation_YXQP;
		StackTraits<System.Action<BestHttpOperation>>.Push = QPYX_factory_YXQP.QPYX_Push_System_Action_BestHttpOperation_YXQP;
		StackTraits<System.Action<AudioPlayOperation>>.Push = QPYX_factory_YXQP.QPYX_Push_System_Action_AudioPlayOperation_YXQP;
		StackTraits<System.Action<float>>.Push = QPYX_factory_YXQP.QPYX_Push_System_Action_float_YXQP;
		StackTraits<UnityEngine.Canvas.WillRenderCanvases>.Push = QPYX_factory_YXQP.QPYX_Push_UnityEngine_Canvas_WillRenderCanvases_YXQP;
		StackTraits<LoopScrollView.OnBaseNodeEvent>.Push = QPYX_factory_YXQP.QPYX_Push_LoopScrollView_OnBaseNodeEvent_YXQP;
		StackTraits<LoopScrollView.OnBaseNodeEvent<bool>>.Push = QPYX_factory_YXQP.QPYX_Push_LoopScrollView_OnBaseNodeEvent_bool_YXQP;
		StackTraits<UnityEngine.Events.UnityAction<LoopBaseNode>>.Push = QPYX_factory_YXQP.QPYX_Push_UnityEngine_Events_UnityAction_LoopBaseNode_YXQP;
		StackTraits<UnityEngine.Events.UnityAction<UnityEngine.Vector3>>.Push = QPYX_factory_YXQP.QPYX_Push_UnityEngine_Events_UnityAction_UnityEngine_Vector3_YXQP;
		StackTraits<System.Action<string,string>>.Push = QPYX_factory_YXQP.QPYX_Push_System_Action_string_string_YXQP;
		StackTraits<System.Action<int,string,int>>.Push = QPYX_factory_YXQP.QPYX_Push_System_Action_int_string_int_YXQP;
		StackTraits<gcloud_voice.IGCloudVoice.JoinRoomCompleteHandler>.Push = QPYX_factory_YXQP.QPYX_Push_gcloud_voice_IGCloudVoice_JoinRoomCompleteHandler_YXQP;
		StackTraits<gcloud_voice.IGCloudVoice.QuitRoomCompleteHandler>.Push = QPYX_factory_YXQP.QPYX_Push_gcloud_voice_IGCloudVoice_QuitRoomCompleteHandler_YXQP;
		StackTraits<gcloud_voice.IGCloudVoice.MemberVoiceHandler>.Push = QPYX_factory_YXQP.QPYX_Push_gcloud_voice_IGCloudVoice_MemberVoiceHandler_YXQP;
		StackTraits<gcloud_voice.IGCloudVoice.ApplyMessageKeyCompleteHandler>.Push = QPYX_factory_YXQP.QPYX_Push_gcloud_voice_IGCloudVoice_ApplyMessageKeyCompleteHandler_YXQP;
		StackTraits<gcloud_voice.IGCloudVoice.UploadReccordFileCompleteHandler>.Push = QPYX_factory_YXQP.QPYX_Push_gcloud_voice_IGCloudVoice_UploadReccordFileCompleteHandler_YXQP;
		StackTraits<gcloud_voice.IGCloudVoice.DownloadRecordFileCompleteHandler>.Push = QPYX_factory_YXQP.QPYX_Push_gcloud_voice_IGCloudVoice_DownloadRecordFileCompleteHandler_YXQP;
		StackTraits<gcloud_voice.IGCloudVoice.PlayRecordFilCompleteHandler>.Push = QPYX_factory_YXQP.QPYX_Push_gcloud_voice_IGCloudVoice_PlayRecordFilCompleteHandler_YXQP;
		StackTraits<gcloud_voice.IGCloudVoice.SpeechToTextHandler>.Push = QPYX_factory_YXQP.QPYX_Push_gcloud_voice_IGCloudVoice_SpeechToTextHandler_YXQP;
		StackTraits<gcloud_voice.IGCloudVoice.StreamSpeechToTextHandler>.Push = QPYX_factory_YXQP.QPYX_Push_gcloud_voice_IGCloudVoice_StreamSpeechToTextHandler_YXQP;
		StackTraits<gcloud_voice.IGCloudVoice.StatusUpdateHandler>.Push = QPYX_factory_YXQP.QPYX_Push_gcloud_voice_IGCloudVoice_StatusUpdateHandler_YXQP;
		StackTraits<gcloud_voice.IGCloudVoice.ChangeRoleCompleteHandler>.Push = QPYX_factory_YXQP.QPYX_Push_gcloud_voice_IGCloudVoice_ChangeRoleCompleteHandler_YXQP;
		StackTraits<gcloud_voice.IGCloudVoice.RoomMemberVoiceHandler>.Push = QPYX_factory_YXQP.QPYX_Push_gcloud_voice_IGCloudVoice_RoomMemberVoiceHandler_YXQP;
		StackTraits<gcloud_voice.IGCloudVoice.EventUpdateHandler>.Push = QPYX_factory_YXQP.QPYX_Push_gcloud_voice_IGCloudVoice_EventUpdateHandler_YXQP;
		StackTraits<gcloud_voice.IGCloudVoice.MuteSwitchResultHandler>.Push = QPYX_factory_YXQP.QPYX_Push_gcloud_voice_IGCloudVoice_MuteSwitchResultHandler_YXQP;
		StackTraits<littlerbird.UI.QuickGrid.QuickGridItemEvenet>.Push = QPYX_factory_YXQP.QPYX_Push_littlerbird_UI_QuickGrid_QuickGridItemEvenet_YXQP;
		StackTraits<littlerbird.UI.QuickGrid.ReturnQuickGridItemEvent<bool>>.Push = QPYX_factory_YXQP.QPYX_Push_littlerbird_UI_QuickGrid_ReturnQuickGridItemEvent_bool_YXQP;
		StackTraits<littlerbird.UI.QuickGrid.ReturnQuickGridItemEvent>.Push = QPYX_factory_YXQP.QPYX_Push_littlerbird_UI_QuickGrid_ReturnQuickGridItemEvent_YXQP;
		StackTraits<littlerbird.UI.QuickGrid.QuickCallback>.Push = QPYX_factory_YXQP.QPYX_Push_littlerbird_UI_QuickGrid_QuickCallback_YXQP;
		StackTraits<System.Action<SimpleItemBase>>.Push = QPYX_factory_YXQP.QPYX_Push_System_Action_SimpleItemBase_YXQP;
		StackTraits<UnityEngine.RectTransform.ReapplyDrivenProperties>.Push = QPYX_factory_YXQP.QPYX_Push_UnityEngine_RectTransform_ReapplyDrivenProperties_YXQP;
		StackTraits<UnityEngine.UI.InputField.OnValidateInput>.Push = QPYX_factory_YXQP.QPYX_Push_UnityEngine_UI_InputField_OnValidateInput_YXQP;
		StackTraits<DG.Tweening.Core.DOGetter<double>>.Push = QPYX_factory_YXQP.QPYX_Push_DG_Tweening_Core_DOGetter_double_YXQP;
		StackTraits<DG.Tweening.Core.DOSetter<double>>.Push = QPYX_factory_YXQP.QPYX_Push_DG_Tweening_Core_DOSetter_double_YXQP;
		StackTraits<DG.Tweening.Core.DOGetter<int>>.Push = QPYX_factory_YXQP.QPYX_Push_DG_Tweening_Core_DOGetter_int_YXQP;
		StackTraits<DG.Tweening.Core.DOSetter<int>>.Push = QPYX_factory_YXQP.QPYX_Push_DG_Tweening_Core_DOSetter_int_YXQP;
		StackTraits<DG.Tweening.Core.DOGetter<uint>>.Push = QPYX_factory_YXQP.QPYX_Push_DG_Tweening_Core_DOGetter_uint_YXQP;
		StackTraits<DG.Tweening.Core.DOSetter<uint>>.Push = QPYX_factory_YXQP.QPYX_Push_DG_Tweening_Core_DOSetter_uint_YXQP;
		StackTraits<DG.Tweening.Core.DOGetter<long>>.Push = QPYX_factory_YXQP.QPYX_Push_DG_Tweening_Core_DOGetter_long_YXQP;
		StackTraits<DG.Tweening.Core.DOSetter<long>>.Push = QPYX_factory_YXQP.QPYX_Push_DG_Tweening_Core_DOSetter_long_YXQP;
		StackTraits<DG.Tweening.Core.DOGetter<ulong>>.Push = QPYX_factory_YXQP.QPYX_Push_DG_Tweening_Core_DOGetter_ulong_YXQP;
		StackTraits<DG.Tweening.Core.DOSetter<ulong>>.Push = QPYX_factory_YXQP.QPYX_Push_DG_Tweening_Core_DOSetter_ulong_YXQP;
		StackTraits<DG.Tweening.Core.DOGetter<string>>.Push = QPYX_factory_YXQP.QPYX_Push_DG_Tweening_Core_DOGetter_string_YXQP;
		StackTraits<DG.Tweening.Core.DOSetter<string>>.Push = QPYX_factory_YXQP.QPYX_Push_DG_Tweening_Core_DOSetter_string_YXQP;
		StackTraits<DG.Tweening.Core.DOGetter<UnityEngine.Vector2>>.Push = QPYX_factory_YXQP.QPYX_Push_DG_Tweening_Core_DOGetter_UnityEngine_Vector2_YXQP;
		StackTraits<DG.Tweening.Core.DOSetter<UnityEngine.Vector2>>.Push = QPYX_factory_YXQP.QPYX_Push_DG_Tweening_Core_DOSetter_UnityEngine_Vector2_YXQP;
		StackTraits<DG.Tweening.Core.DOGetter<UnityEngine.Vector3>>.Push = QPYX_factory_YXQP.QPYX_Push_DG_Tweening_Core_DOGetter_UnityEngine_Vector3_YXQP;
		StackTraits<DG.Tweening.Core.DOSetter<UnityEngine.Vector3>>.Push = QPYX_factory_YXQP.QPYX_Push_DG_Tweening_Core_DOSetter_UnityEngine_Vector3_YXQP;
		StackTraits<DG.Tweening.Core.DOGetter<UnityEngine.Vector4>>.Push = QPYX_factory_YXQP.QPYX_Push_DG_Tweening_Core_DOGetter_UnityEngine_Vector4_YXQP;
		StackTraits<DG.Tweening.Core.DOSetter<UnityEngine.Vector4>>.Push = QPYX_factory_YXQP.QPYX_Push_DG_Tweening_Core_DOSetter_UnityEngine_Vector4_YXQP;
		StackTraits<DG.Tweening.Core.DOGetter<UnityEngine.Quaternion>>.Push = QPYX_factory_YXQP.QPYX_Push_DG_Tweening_Core_DOGetter_UnityEngine_Quaternion_YXQP;
		StackTraits<DG.Tweening.Core.DOSetter<UnityEngine.Quaternion>>.Push = QPYX_factory_YXQP.QPYX_Push_DG_Tweening_Core_DOSetter_UnityEngine_Quaternion_YXQP;
		StackTraits<DG.Tweening.Core.DOGetter<UnityEngine.Color>>.Push = QPYX_factory_YXQP.QPYX_Push_DG_Tweening_Core_DOGetter_UnityEngine_Color_YXQP;
		StackTraits<DG.Tweening.Core.DOSetter<UnityEngine.Color>>.Push = QPYX_factory_YXQP.QPYX_Push_DG_Tweening_Core_DOSetter_UnityEngine_Color_YXQP;
		StackTraits<DG.Tweening.Core.DOGetter<UnityEngine.Rect>>.Push = QPYX_factory_YXQP.QPYX_Push_DG_Tweening_Core_DOGetter_UnityEngine_Rect_YXQP;
		StackTraits<DG.Tweening.Core.DOSetter<UnityEngine.Rect>>.Push = QPYX_factory_YXQP.QPYX_Push_DG_Tweening_Core_DOSetter_UnityEngine_Rect_YXQP;
		StackTraits<DG.Tweening.Core.DOGetter<UnityEngine.RectOffset>>.Push = QPYX_factory_YXQP.QPYX_Push_DG_Tweening_Core_DOGetter_UnityEngine_RectOffset_YXQP;
		StackTraits<DG.Tweening.Core.DOSetter<UnityEngine.RectOffset>>.Push = QPYX_factory_YXQP.QPYX_Push_DG_Tweening_Core_DOSetter_UnityEngine_RectOffset_YXQP;
		StackTraits<DG.Tweening.TweenCallback<int>>.Push = QPYX_factory_YXQP.QPYX_Push_DG_Tweening_TweenCallback_int_YXQP;
		StackTraits<UnityEngine.Camera.CameraCallback>.Push = QPYX_factory_YXQP.QPYX_Push_UnityEngine_Camera_CameraCallback_YXQP;
		StackTraits<UnityEngine.Application.LowMemoryCallback>.Push = QPYX_factory_YXQP.QPYX_Push_UnityEngine_Application_LowMemoryCallback_YXQP;
		StackTraits<UnityEngine.Application.AdvertisingIdentifierCallback>.Push = QPYX_factory_YXQP.QPYX_Push_UnityEngine_Application_AdvertisingIdentifierCallback_YXQP;
		StackTraits<UnityEngine.Application.LogCallback>.Push = QPYX_factory_YXQP.QPYX_Push_UnityEngine_Application_LogCallback_YXQP;
		StackTraits<BestHTTP.OnUploadProgressDelegate>.Push = QPYX_factory_YXQP.QPYX_Push_BestHTTP_OnUploadProgressDelegate_YXQP;
		StackTraits<BestHTTP.OnDownloadProgressDelegate>.Push = QPYX_factory_YXQP.QPYX_Push_BestHTTP_OnDownloadProgressDelegate_YXQP;
		StackTraits<BestHTTP.OnRequestFinishedDelegate>.Push = QPYX_factory_YXQP.QPYX_Push_BestHTTP_OnRequestFinishedDelegate_YXQP;
		StackTraits<System.Func<BestHTTP.HTTPRequest,System.Security.Cryptography.X509Certificates.X509Certificate,System.Security.Cryptography.X509Certificates.X509Chain,bool>>.Push = QPYX_factory_YXQP.QPYX_Push_System_Func_BestHTTP_HTTPRequest_System_Security_Cryptography_X509Certificates_X509Certificate_System_Security_Cryptography_X509Certificates_X509Chain_bool_YXQP;
		StackTraits<BestHTTP.OnBeforeRedirectionDelegate>.Push = QPYX_factory_YXQP.QPYX_Push_BestHTTP_OnBeforeRedirectionDelegate_YXQP;
		StackTraits<BestHTTP.OnBeforeHeaderSendDelegate>.Push = QPYX_factory_YXQP.QPYX_Push_BestHTTP_OnBeforeHeaderSendDelegate_YXQP;
		StackTraits<BestHTTP.OnHeaderEnumerationDelegate>.Push = QPYX_factory_YXQP.QPYX_Push_BestHTTP_OnHeaderEnumerationDelegate_YXQP;
		StackTraits<System.Action<UnityEngine.AsyncOperation>>.Push = QPYX_factory_YXQP.QPYX_Push_System_Action_UnityEngine_AsyncOperation_YXQP;
		StackTraits<UnityEngine.AudioClip.PCMReaderCallback>.Push = QPYX_factory_YXQP.QPYX_Push_UnityEngine_AudioClip_PCMReaderCallback_YXQP;
		StackTraits<UnityEngine.AudioClip.PCMSetPositionCallback>.Push = QPYX_factory_YXQP.QPYX_Push_UnityEngine_AudioClip_PCMSetPositionCallback_YXQP;
	}
    
    public static Delegate CreateDelegate(Type t, LuaFunction func = null)
    {
        DelegateCreate Create = null;

        if (!_dict.TryGetValue(t, out Create))
        {
            throw new LuaException(string.Format("Delegate {0} not register", LuaMisc.GetTypeName(t)));            
        }

        if (func != null)
        {
            LuaState state = func.GetLuaState();
            LuaDelegate target = state.GetLuaDelegate(func);
            
            if (target != null)
            {
                return Delegate.CreateDelegate(t, target, target.method);
            }  
            else
            {
                Delegate d = Create(func, null, false);
                target = d.Target as LuaDelegate;
                state.AddLuaDelegate(target, func);
                return d;
            }       
        }

        return Create(null, null, false);        
    }
    
    public static Delegate CreateDelegate(Type t, LuaFunction func, LuaTable self)
    {
        DelegateCreate Create = null;

        if (!_dict.TryGetValue(t, out Create))
        {
            throw new LuaException(string.Format("Delegate {0} not register", LuaMisc.GetTypeName(t)));
        }

        if (func != null)
        {
            LuaState state = func.GetLuaState();
            LuaDelegate target = state.GetLuaDelegate(func, self);

            if (target != null)
            {
                return Delegate.CreateDelegate(t, target, target.method);
            }
            else
            {
                Delegate d = Create(func, self, true);
                target = d.Target as LuaDelegate;
                state.AddLuaDelegate(target, func, self);
                return d;
            }
        }

        return Create(null, null, true);
    }
    
    public static Delegate RemoveDelegate(Delegate obj, LuaFunction func)
    {
        LuaState state = func.GetLuaState();
        Delegate[] ds = obj.GetInvocationList();

        for (int i = 0; i < ds.Length; i++)
        {
            LuaDelegate ld = ds[i].Target as LuaDelegate;

            if (ld != null && ld.func == func)
            {
                obj = Delegate.Remove(obj, ds[i]);
                state.DelayDispose(ld.func);
                break;
            }
        }

        return obj;
    }
    
    public static Delegate RemoveDelegate(Delegate obj, Delegate dg)
    {
        LuaDelegate remove = dg.Target as LuaDelegate;

        if (remove == null)
        {
            obj = Delegate.Remove(obj, dg);
            return obj;
        }

        LuaState state = remove.func.GetLuaState();
        Delegate[] ds = obj.GetInvocationList();        

        for (int i = 0; i < ds.Length; i++)
        {
            LuaDelegate ld = ds[i].Target as LuaDelegate;

            if (ld != null && ld == remove)
            {
                obj = Delegate.Remove(obj, ds[i]);
                state.DelayDispose(ld.func);
                state.DelayDispose(ld.self);
                break;
            }
        }

        return obj;
    }

	class QPYX_System_Action_YXQP_Event : LuaDelegate
	{
		public QPYX_System_Action_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_System_Action_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP()
		{
			func.Call();
		}

		public void QPYX_CallWithSelf_YXQP()
		{
			func.BeginPCall();
			func.Push(self);
			func.PCall();
			func.EndPCall();
		}
	}

	public System.Action QPYX_System_Action_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			System.Action fn_YXQP = delegate() { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_System_Action_YXQP_Event QPYX_target = new QPYX_System_Action_YXQP_Event(func_YXQP);
			System.Action QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_System_Action_YXQP_Event QPYX_target = new QPYX_System_Action_YXQP_Event(func_YXQP, self_YXQP);
			System.Action QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_System_Action_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(System.Action), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_System_Action_YXQP(IntPtr L_YXQP, System.Action o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_System_Action_int_YXQP_Event : LuaDelegate
	{
		public QPYX_System_Action_int_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_System_Action_int_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(int QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(int QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}
	}

	public System.Action<int> QPYX_System_Action_int_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			System.Action<int> fn_YXQP = delegate(int QPYX_param_YXQP0) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_System_Action_int_YXQP_Event QPYX_target = new QPYX_System_Action_int_YXQP_Event(func_YXQP);
			System.Action<int> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_System_Action_int_YXQP_Event QPYX_target = new QPYX_System_Action_int_YXQP_Event(func_YXQP, self_YXQP);
			System.Action<int> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_System_Action_int_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(System.Action<int>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_System_Action_int_YXQP(IntPtr L_YXQP, System.Action<int> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_System_Action_string_YXQP_Event : LuaDelegate
	{
		public QPYX_System_Action_string_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_System_Action_string_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(string QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(string QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}
	}

	public System.Action<string> QPYX_System_Action_string_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			System.Action<string> fn_YXQP = delegate(string QPYX_param_YXQP0) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_System_Action_string_YXQP_Event QPYX_target = new QPYX_System_Action_string_YXQP_Event(func_YXQP);
			System.Action<string> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_System_Action_string_YXQP_Event QPYX_target = new QPYX_System_Action_string_YXQP_Event(func_YXQP, self_YXQP);
			System.Action<string> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_System_Action_string_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(System.Action<string>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_System_Action_string_YXQP(IntPtr L_YXQP, System.Action<string> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_System_Predicate_int_YXQP_Event : LuaDelegate
	{
		public QPYX_System_Predicate_int_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_System_Predicate_int_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public bool QPYX_Call_YXQP(int QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			bool ret = func.CheckBoolean();
			func.EndPCall();
			return ret;
		}

		public bool QPYX_CallWithSelf_YXQP(int QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			bool ret = func.CheckBoolean();
			func.EndPCall();
			return ret;
		}
	}

	public System.Predicate<int> QPYX_System_Predicate_int_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			System.Predicate<int> fn_YXQP = delegate(int QPYX_param_YXQP0) { return false; };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_System_Predicate_int_YXQP_Event QPYX_target = new QPYX_System_Predicate_int_YXQP_Event(func_YXQP);
			System.Predicate<int> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_System_Predicate_int_YXQP_Event QPYX_target = new QPYX_System_Predicate_int_YXQP_Event(func_YXQP, self_YXQP);
			System.Predicate<int> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_System_Predicate_int_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(System.Predicate<int>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_System_Predicate_int_YXQP(IntPtr L_YXQP, System.Predicate<int> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_System_Comparison_int_YXQP_Event : LuaDelegate
	{
		public QPYX_System_Comparison_int_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_System_Comparison_int_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public int QPYX_Call_YXQP(int QPYX_param_YXQP0, int QPYX_param_YXQP1)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.PCall();
			int ret = (int)func.CheckNumber();
			func.EndPCall();
			return ret;
		}

		public int QPYX_CallWithSelf_YXQP(int QPYX_param_YXQP0, int QPYX_param_YXQP1)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.PCall();
			int ret = (int)func.CheckNumber();
			func.EndPCall();
			return ret;
		}
	}

	public System.Comparison<int> QPYX_System_Comparison_int_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			System.Comparison<int> fn_YXQP = delegate(int QPYX_param_YXQP0, int QPYX_param_YXQP1) { return 0; };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_System_Comparison_int_YXQP_Event QPYX_target = new QPYX_System_Comparison_int_YXQP_Event(func_YXQP);
			System.Comparison<int> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_System_Comparison_int_YXQP_Event QPYX_target = new QPYX_System_Comparison_int_YXQP_Event(func_YXQP, self_YXQP);
			System.Comparison<int> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_System_Comparison_int_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(System.Comparison<int>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_System_Comparison_int_YXQP(IntPtr L_YXQP, System.Comparison<int> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_UnityEngine_Events_UnityAction_YXQP_Event : LuaDelegate
	{
		public QPYX_UnityEngine_Events_UnityAction_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_UnityEngine_Events_UnityAction_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP()
		{
			func.Call();
		}

		public void QPYX_CallWithSelf_YXQP()
		{
			func.BeginPCall();
			func.Push(self);
			func.PCall();
			func.EndPCall();
		}
	}

	public UnityEngine.Events.UnityAction QPYX_UnityEngine_Events_UnityAction_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			UnityEngine.Events.UnityAction fn_YXQP = delegate() { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_UnityEngine_Events_UnityAction_YXQP_Event QPYX_target = new QPYX_UnityEngine_Events_UnityAction_YXQP_Event(func_YXQP);
			UnityEngine.Events.UnityAction QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_UnityEngine_Events_UnityAction_YXQP_Event QPYX_target = new QPYX_UnityEngine_Events_UnityAction_YXQP_Event(func_YXQP, self_YXQP);
			UnityEngine.Events.UnityAction QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_UnityEngine_Events_UnityAction_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(UnityEngine.Events.UnityAction), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_UnityEngine_Events_UnityAction_YXQP(IntPtr L_YXQP, UnityEngine.Events.UnityAction o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_UnityEngine_Events_UnityAction_string_YXQP_Event : LuaDelegate
	{
		public QPYX_UnityEngine_Events_UnityAction_string_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_UnityEngine_Events_UnityAction_string_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(string QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(string QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}
	}

	public UnityEngine.Events.UnityAction<string> QPYX_UnityEngine_Events_UnityAction_string_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			UnityEngine.Events.UnityAction<string> fn_YXQP = delegate(string QPYX_param_YXQP0) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_UnityEngine_Events_UnityAction_string_YXQP_Event QPYX_target = new QPYX_UnityEngine_Events_UnityAction_string_YXQP_Event(func_YXQP);
			UnityEngine.Events.UnityAction<string> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_UnityEngine_Events_UnityAction_string_YXQP_Event QPYX_target = new QPYX_UnityEngine_Events_UnityAction_string_YXQP_Event(func_YXQP, self_YXQP);
			UnityEngine.Events.UnityAction<string> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_UnityEngine_Events_UnityAction_string_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(UnityEngine.Events.UnityAction<string>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_UnityEngine_Events_UnityAction_string_YXQP(IntPtr L_YXQP, UnityEngine.Events.UnityAction<string> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_UnityEngine_Events_UnityAction_float_YXQP_Event : LuaDelegate
	{
		public QPYX_UnityEngine_Events_UnityAction_float_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_UnityEngine_Events_UnityAction_float_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(float QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(float QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}
	}

	public UnityEngine.Events.UnityAction<float> QPYX_UnityEngine_Events_UnityAction_float_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			UnityEngine.Events.UnityAction<float> fn_YXQP = delegate(float QPYX_param_YXQP0) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_UnityEngine_Events_UnityAction_float_YXQP_Event QPYX_target = new QPYX_UnityEngine_Events_UnityAction_float_YXQP_Event(func_YXQP);
			UnityEngine.Events.UnityAction<float> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_UnityEngine_Events_UnityAction_float_YXQP_Event QPYX_target = new QPYX_UnityEngine_Events_UnityAction_float_YXQP_Event(func_YXQP, self_YXQP);
			UnityEngine.Events.UnityAction<float> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_UnityEngine_Events_UnityAction_float_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(UnityEngine.Events.UnityAction<float>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_UnityEngine_Events_UnityAction_float_YXQP(IntPtr L_YXQP, UnityEngine.Events.UnityAction<float> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_UnityEngine_Events_UnityAction_bool_YXQP_Event : LuaDelegate
	{
		public QPYX_UnityEngine_Events_UnityAction_bool_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_UnityEngine_Events_UnityAction_bool_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(bool QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(bool QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}
	}

	public UnityEngine.Events.UnityAction<bool> QPYX_UnityEngine_Events_UnityAction_bool_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			UnityEngine.Events.UnityAction<bool> fn_YXQP = delegate(bool QPYX_param_YXQP0) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_UnityEngine_Events_UnityAction_bool_YXQP_Event QPYX_target = new QPYX_UnityEngine_Events_UnityAction_bool_YXQP_Event(func_YXQP);
			UnityEngine.Events.UnityAction<bool> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_UnityEngine_Events_UnityAction_bool_YXQP_Event QPYX_target = new QPYX_UnityEngine_Events_UnityAction_bool_YXQP_Event(func_YXQP, self_YXQP);
			UnityEngine.Events.UnityAction<bool> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_UnityEngine_Events_UnityAction_bool_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(UnityEngine.Events.UnityAction<bool>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_UnityEngine_Events_UnityAction_bool_YXQP(IntPtr L_YXQP, UnityEngine.Events.UnityAction<bool> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_UnityEngine_Events_UnityAction_int_YXQP_Event : LuaDelegate
	{
		public QPYX_UnityEngine_Events_UnityAction_int_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_UnityEngine_Events_UnityAction_int_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(int QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(int QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}
	}

	public UnityEngine.Events.UnityAction<int> QPYX_UnityEngine_Events_UnityAction_int_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			UnityEngine.Events.UnityAction<int> fn_YXQP = delegate(int QPYX_param_YXQP0) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_UnityEngine_Events_UnityAction_int_YXQP_Event QPYX_target = new QPYX_UnityEngine_Events_UnityAction_int_YXQP_Event(func_YXQP);
			UnityEngine.Events.UnityAction<int> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_UnityEngine_Events_UnityAction_int_YXQP_Event QPYX_target = new QPYX_UnityEngine_Events_UnityAction_int_YXQP_Event(func_YXQP, self_YXQP);
			UnityEngine.Events.UnityAction<int> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_UnityEngine_Events_UnityAction_int_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(UnityEngine.Events.UnityAction<int>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_UnityEngine_Events_UnityAction_int_YXQP(IntPtr L_YXQP, UnityEngine.Events.UnityAction<int> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_UnityEngine_Events_UnityAction_UnityEngine_Vector2_YXQP_Event : LuaDelegate
	{
		public QPYX_UnityEngine_Events_UnityAction_UnityEngine_Vector2_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_UnityEngine_Events_UnityAction_UnityEngine_Vector2_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(UnityEngine.Vector2 QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(UnityEngine.Vector2 QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}
	}

	public UnityEngine.Events.UnityAction<UnityEngine.Vector2> QPYX_UnityEngine_Events_UnityAction_UnityEngine_Vector2_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			UnityEngine.Events.UnityAction<UnityEngine.Vector2> fn_YXQP = delegate(UnityEngine.Vector2 QPYX_param_YXQP0) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_UnityEngine_Events_UnityAction_UnityEngine_Vector2_YXQP_Event QPYX_target = new QPYX_UnityEngine_Events_UnityAction_UnityEngine_Vector2_YXQP_Event(func_YXQP);
			UnityEngine.Events.UnityAction<UnityEngine.Vector2> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_UnityEngine_Events_UnityAction_UnityEngine_Vector2_YXQP_Event QPYX_target = new QPYX_UnityEngine_Events_UnityAction_UnityEngine_Vector2_YXQP_Event(func_YXQP, self_YXQP);
			UnityEngine.Events.UnityAction<UnityEngine.Vector2> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_UnityEngine_Events_UnityAction_UnityEngine_Vector2_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(UnityEngine.Events.UnityAction<UnityEngine.Vector2>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_UnityEngine_Events_UnityAction_UnityEngine_Vector2_YXQP(IntPtr L_YXQP, UnityEngine.Events.UnityAction<UnityEngine.Vector2> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_DG_Tweening_TweenCallback_YXQP_Event : LuaDelegate
	{
		public QPYX_DG_Tweening_TweenCallback_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_DG_Tweening_TweenCallback_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP()
		{
			func.Call();
		}

		public void QPYX_CallWithSelf_YXQP()
		{
			func.BeginPCall();
			func.Push(self);
			func.PCall();
			func.EndPCall();
		}
	}

	public DG.Tweening.TweenCallback QPYX_DG_Tweening_TweenCallback_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			DG.Tweening.TweenCallback fn_YXQP = delegate() { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_DG_Tweening_TweenCallback_YXQP_Event QPYX_target = new QPYX_DG_Tweening_TweenCallback_YXQP_Event(func_YXQP);
			DG.Tweening.TweenCallback QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_DG_Tweening_TweenCallback_YXQP_Event QPYX_target = new QPYX_DG_Tweening_TweenCallback_YXQP_Event(func_YXQP, self_YXQP);
			DG.Tweening.TweenCallback QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_DG_Tweening_TweenCallback_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(DG.Tweening.TweenCallback), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_DG_Tweening_TweenCallback_YXQP(IntPtr L_YXQP, DG.Tweening.TweenCallback o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_DG_Tweening_Core_DOGetter_float_YXQP_Event : LuaDelegate
	{
		public QPYX_DG_Tweening_Core_DOGetter_float_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_DG_Tweening_Core_DOGetter_float_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public float QPYX_Call_YXQP()
		{
			func.BeginPCall();
			func.PCall();
			float ret = (float)func.CheckNumber();
			func.EndPCall();
			return ret;
		}

		public float QPYX_CallWithSelf_YXQP()
		{
			func.BeginPCall();
			func.Push(self);
			func.PCall();
			float ret = (float)func.CheckNumber();
			func.EndPCall();
			return ret;
		}
	}

	public DG.Tweening.Core.DOGetter<float> QPYX_DG_Tweening_Core_DOGetter_float_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			DG.Tweening.Core.DOGetter<float> fn_YXQP = delegate() { return 0; };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_DG_Tweening_Core_DOGetter_float_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOGetter_float_YXQP_Event(func_YXQP);
			DG.Tweening.Core.DOGetter<float> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_DG_Tweening_Core_DOGetter_float_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOGetter_float_YXQP_Event(func_YXQP, self_YXQP);
			DG.Tweening.Core.DOGetter<float> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_DG_Tweening_Core_DOGetter_float_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(DG.Tweening.Core.DOGetter<float>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_DG_Tweening_Core_DOGetter_float_YXQP(IntPtr L_YXQP, DG.Tweening.Core.DOGetter<float> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_DG_Tweening_Core_DOSetter_float_YXQP_Event : LuaDelegate
	{
		public QPYX_DG_Tweening_Core_DOSetter_float_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_DG_Tweening_Core_DOSetter_float_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(float QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(float QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}
	}

	public DG.Tweening.Core.DOSetter<float> QPYX_DG_Tweening_Core_DOSetter_float_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			DG.Tweening.Core.DOSetter<float> fn_YXQP = delegate(float QPYX_param_YXQP0) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_DG_Tweening_Core_DOSetter_float_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOSetter_float_YXQP_Event(func_YXQP);
			DG.Tweening.Core.DOSetter<float> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_DG_Tweening_Core_DOSetter_float_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOSetter_float_YXQP_Event(func_YXQP, self_YXQP);
			DG.Tweening.Core.DOSetter<float> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_DG_Tweening_Core_DOSetter_float_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(DG.Tweening.Core.DOSetter<float>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_DG_Tweening_Core_DOSetter_float_YXQP(IntPtr L_YXQP, DG.Tweening.Core.DOSetter<float> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_GameSDKInterface_LoginSucHandler_YXQP_Event : LuaDelegate
	{
		public QPYX_GameSDKInterface_LoginSucHandler_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_GameSDKInterface_LoginSucHandler_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(string QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(string QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}
	}

	public GameSDKInterface.LoginSucHandler QPYX_GameSDKInterface_LoginSucHandler_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			GameSDKInterface.LoginSucHandler fn_YXQP = delegate(string QPYX_param_YXQP0) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_GameSDKInterface_LoginSucHandler_YXQP_Event QPYX_target = new QPYX_GameSDKInterface_LoginSucHandler_YXQP_Event(func_YXQP);
			GameSDKInterface.LoginSucHandler QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_GameSDKInterface_LoginSucHandler_YXQP_Event QPYX_target = new QPYX_GameSDKInterface_LoginSucHandler_YXQP_Event(func_YXQP, self_YXQP);
			GameSDKInterface.LoginSucHandler QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_GameSDKInterface_LoginSucHandler_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(GameSDKInterface.LoginSucHandler), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_GameSDKInterface_LoginSucHandler_YXQP(IntPtr L_YXQP, GameSDKInterface.LoginSucHandler o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_GameSDKInterface_LogoutHandler_YXQP_Event : LuaDelegate
	{
		public QPYX_GameSDKInterface_LogoutHandler_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_GameSDKInterface_LogoutHandler_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP()
		{
			func.Call();
		}

		public void QPYX_CallWithSelf_YXQP()
		{
			func.BeginPCall();
			func.Push(self);
			func.PCall();
			func.EndPCall();
		}
	}

	public GameSDKInterface.LogoutHandler QPYX_GameSDKInterface_LogoutHandler_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			GameSDKInterface.LogoutHandler fn_YXQP = delegate() { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_GameSDKInterface_LogoutHandler_YXQP_Event QPYX_target = new QPYX_GameSDKInterface_LogoutHandler_YXQP_Event(func_YXQP);
			GameSDKInterface.LogoutHandler QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_GameSDKInterface_LogoutHandler_YXQP_Event QPYX_target = new QPYX_GameSDKInterface_LogoutHandler_YXQP_Event(func_YXQP, self_YXQP);
			GameSDKInterface.LogoutHandler QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_GameSDKInterface_LogoutHandler_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(GameSDKInterface.LogoutHandler), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_GameSDKInterface_LogoutHandler_YXQP(IntPtr L_YXQP, GameSDKInterface.LogoutHandler o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_System_Action_TimeEvent_YXQP_Event : LuaDelegate
	{
		public QPYX_System_Action_TimeEvent_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_System_Action_TimeEvent_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(TimeEvent QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.PushObject(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(TimeEvent QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.PushObject(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}
	}

	public System.Action<TimeEvent> QPYX_System_Action_TimeEvent_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			System.Action<TimeEvent> fn_YXQP = delegate(TimeEvent QPYX_param_YXQP0) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_System_Action_TimeEvent_YXQP_Event QPYX_target = new QPYX_System_Action_TimeEvent_YXQP_Event(func_YXQP);
			System.Action<TimeEvent> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_System_Action_TimeEvent_YXQP_Event QPYX_target = new QPYX_System_Action_TimeEvent_YXQP_Event(func_YXQP, self_YXQP);
			System.Action<TimeEvent> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_System_Action_TimeEvent_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(System.Action<TimeEvent>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_System_Action_TimeEvent_YXQP(IntPtr L_YXQP, System.Action<TimeEvent> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_System_Action_UnityEngine_GameObject_YXQP_Event : LuaDelegate
	{
		public QPYX_System_Action_UnityEngine_GameObject_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_System_Action_UnityEngine_GameObject_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(UnityEngine.GameObject QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.PushSealed(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(UnityEngine.GameObject QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.PushSealed(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}
	}

	public System.Action<UnityEngine.GameObject> QPYX_System_Action_UnityEngine_GameObject_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			System.Action<UnityEngine.GameObject> fn_YXQP = delegate(UnityEngine.GameObject QPYX_param_YXQP0) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_System_Action_UnityEngine_GameObject_YXQP_Event QPYX_target = new QPYX_System_Action_UnityEngine_GameObject_YXQP_Event(func_YXQP);
			System.Action<UnityEngine.GameObject> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_System_Action_UnityEngine_GameObject_YXQP_Event QPYX_target = new QPYX_System_Action_UnityEngine_GameObject_YXQP_Event(func_YXQP, self_YXQP);
			System.Action<UnityEngine.GameObject> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_System_Action_UnityEngine_GameObject_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(System.Action<UnityEngine.GameObject>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_System_Action_UnityEngine_GameObject_YXQP(IntPtr L_YXQP, System.Action<UnityEngine.GameObject> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_System_Action_GameAsset_LoadedAssetBundle_YXQP_Event : LuaDelegate
	{
		public QPYX_System_Action_GameAsset_LoadedAssetBundle_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_System_Action_GameAsset_LoadedAssetBundle_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(GameAsset.LoadedAssetBundle QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.PushObject(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(GameAsset.LoadedAssetBundle QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.PushObject(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}
	}

	public System.Action<GameAsset.LoadedAssetBundle> QPYX_System_Action_GameAsset_LoadedAssetBundle_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			System.Action<GameAsset.LoadedAssetBundle> fn_YXQP = delegate(GameAsset.LoadedAssetBundle QPYX_param_YXQP0) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_System_Action_GameAsset_LoadedAssetBundle_YXQP_Event QPYX_target = new QPYX_System_Action_GameAsset_LoadedAssetBundle_YXQP_Event(func_YXQP);
			System.Action<GameAsset.LoadedAssetBundle> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_System_Action_GameAsset_LoadedAssetBundle_YXQP_Event QPYX_target = new QPYX_System_Action_GameAsset_LoadedAssetBundle_YXQP_Event(func_YXQP, self_YXQP);
			System.Action<GameAsset.LoadedAssetBundle> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_System_Action_GameAsset_LoadedAssetBundle_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(System.Action<GameAsset.LoadedAssetBundle>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_System_Action_GameAsset_LoadedAssetBundle_YXQP(IntPtr L_YXQP, System.Action<GameAsset.LoadedAssetBundle> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_System_Action_WWWOperation_YXQP_Event : LuaDelegate
	{
		public QPYX_System_Action_WWWOperation_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_System_Action_WWWOperation_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(WWWOperation QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.PushObject(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(WWWOperation QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.PushObject(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}
	}

	public System.Action<WWWOperation> QPYX_System_Action_WWWOperation_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			System.Action<WWWOperation> fn_YXQP = delegate(WWWOperation QPYX_param_YXQP0) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_System_Action_WWWOperation_YXQP_Event QPYX_target = new QPYX_System_Action_WWWOperation_YXQP_Event(func_YXQP);
			System.Action<WWWOperation> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_System_Action_WWWOperation_YXQP_Event QPYX_target = new QPYX_System_Action_WWWOperation_YXQP_Event(func_YXQP, self_YXQP);
			System.Action<WWWOperation> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_System_Action_WWWOperation_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(System.Action<WWWOperation>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_System_Action_WWWOperation_YXQP(IntPtr L_YXQP, System.Action<WWWOperation> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_System_Action_BestHttpOperation_YXQP_Event : LuaDelegate
	{
		public QPYX_System_Action_BestHttpOperation_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_System_Action_BestHttpOperation_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(BestHttpOperation QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.PushObject(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(BestHttpOperation QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.PushObject(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}
	}

	public System.Action<BestHttpOperation> QPYX_System_Action_BestHttpOperation_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			System.Action<BestHttpOperation> fn_YXQP = delegate(BestHttpOperation QPYX_param_YXQP0) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_System_Action_BestHttpOperation_YXQP_Event QPYX_target = new QPYX_System_Action_BestHttpOperation_YXQP_Event(func_YXQP);
			System.Action<BestHttpOperation> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_System_Action_BestHttpOperation_YXQP_Event QPYX_target = new QPYX_System_Action_BestHttpOperation_YXQP_Event(func_YXQP, self_YXQP);
			System.Action<BestHttpOperation> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_System_Action_BestHttpOperation_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(System.Action<BestHttpOperation>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_System_Action_BestHttpOperation_YXQP(IntPtr L_YXQP, System.Action<BestHttpOperation> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_System_Action_AudioPlayOperation_YXQP_Event : LuaDelegate
	{
		public QPYX_System_Action_AudioPlayOperation_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_System_Action_AudioPlayOperation_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(AudioPlayOperation QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.PushObject(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(AudioPlayOperation QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.PushObject(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}
	}

	public System.Action<AudioPlayOperation> QPYX_System_Action_AudioPlayOperation_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			System.Action<AudioPlayOperation> fn_YXQP = delegate(AudioPlayOperation QPYX_param_YXQP0) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_System_Action_AudioPlayOperation_YXQP_Event QPYX_target = new QPYX_System_Action_AudioPlayOperation_YXQP_Event(func_YXQP);
			System.Action<AudioPlayOperation> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_System_Action_AudioPlayOperation_YXQP_Event QPYX_target = new QPYX_System_Action_AudioPlayOperation_YXQP_Event(func_YXQP, self_YXQP);
			System.Action<AudioPlayOperation> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_System_Action_AudioPlayOperation_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(System.Action<AudioPlayOperation>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_System_Action_AudioPlayOperation_YXQP(IntPtr L_YXQP, System.Action<AudioPlayOperation> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_System_Action_float_YXQP_Event : LuaDelegate
	{
		public QPYX_System_Action_float_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_System_Action_float_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(float QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(float QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}
	}

	public System.Action<float> QPYX_System_Action_float_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			System.Action<float> fn_YXQP = delegate(float QPYX_param_YXQP0) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_System_Action_float_YXQP_Event QPYX_target = new QPYX_System_Action_float_YXQP_Event(func_YXQP);
			System.Action<float> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_System_Action_float_YXQP_Event QPYX_target = new QPYX_System_Action_float_YXQP_Event(func_YXQP, self_YXQP);
			System.Action<float> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_System_Action_float_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(System.Action<float>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_System_Action_float_YXQP(IntPtr L_YXQP, System.Action<float> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_UnityEngine_Canvas_WillRenderCanvases_YXQP_Event : LuaDelegate
	{
		public QPYX_UnityEngine_Canvas_WillRenderCanvases_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_UnityEngine_Canvas_WillRenderCanvases_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP()
		{
			func.Call();
		}

		public void QPYX_CallWithSelf_YXQP()
		{
			func.BeginPCall();
			func.Push(self);
			func.PCall();
			func.EndPCall();
		}
	}

	public UnityEngine.Canvas.WillRenderCanvases QPYX_UnityEngine_Canvas_WillRenderCanvases_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			UnityEngine.Canvas.WillRenderCanvases fn_YXQP = delegate() { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_UnityEngine_Canvas_WillRenderCanvases_YXQP_Event QPYX_target = new QPYX_UnityEngine_Canvas_WillRenderCanvases_YXQP_Event(func_YXQP);
			UnityEngine.Canvas.WillRenderCanvases QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_UnityEngine_Canvas_WillRenderCanvases_YXQP_Event QPYX_target = new QPYX_UnityEngine_Canvas_WillRenderCanvases_YXQP_Event(func_YXQP, self_YXQP);
			UnityEngine.Canvas.WillRenderCanvases QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_UnityEngine_Canvas_WillRenderCanvases_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(UnityEngine.Canvas.WillRenderCanvases), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_UnityEngine_Canvas_WillRenderCanvases_YXQP(IntPtr L_YXQP, UnityEngine.Canvas.WillRenderCanvases o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_LoopScrollView_OnBaseNodeEvent_YXQP_Event : LuaDelegate
	{
		public QPYX_LoopScrollView_OnBaseNodeEvent_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_LoopScrollView_OnBaseNodeEvent_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(LoopBaseNode QPYX_param_YXQP0, UnityEngine.EventSystems.PointerEventData QPYX_param_YXQP1)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.PushObject(QPYX_param_YXQP1);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(LoopBaseNode QPYX_param_YXQP0, UnityEngine.EventSystems.PointerEventData QPYX_param_YXQP1)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.PushObject(QPYX_param_YXQP1);
			func.PCall();
			func.EndPCall();
		}
	}

	public LoopScrollView.OnBaseNodeEvent QPYX_LoopScrollView_OnBaseNodeEvent_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			LoopScrollView.OnBaseNodeEvent fn_YXQP = delegate(LoopBaseNode QPYX_param_YXQP0, UnityEngine.EventSystems.PointerEventData QPYX_param_YXQP1) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_LoopScrollView_OnBaseNodeEvent_YXQP_Event QPYX_target = new QPYX_LoopScrollView_OnBaseNodeEvent_YXQP_Event(func_YXQP);
			LoopScrollView.OnBaseNodeEvent QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_LoopScrollView_OnBaseNodeEvent_YXQP_Event QPYX_target = new QPYX_LoopScrollView_OnBaseNodeEvent_YXQP_Event(func_YXQP, self_YXQP);
			LoopScrollView.OnBaseNodeEvent QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_LoopScrollView_OnBaseNodeEvent_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(LoopScrollView.OnBaseNodeEvent), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_LoopScrollView_OnBaseNodeEvent_YXQP(IntPtr L_YXQP, LoopScrollView.OnBaseNodeEvent o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_LoopScrollView_OnBaseNodeEvent_bool_YXQP_Event : LuaDelegate
	{
		public QPYX_LoopScrollView_OnBaseNodeEvent_bool_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_LoopScrollView_OnBaseNodeEvent_bool_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(LoopBaseNode QPYX_param_YXQP0, bool QPYX_param_YXQP1, UnityEngine.EventSystems.PointerEventData QPYX_param_YXQP2)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.PushObject(QPYX_param_YXQP2);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(LoopBaseNode QPYX_param_YXQP0, bool QPYX_param_YXQP1, UnityEngine.EventSystems.PointerEventData QPYX_param_YXQP2)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.PushObject(QPYX_param_YXQP2);
			func.PCall();
			func.EndPCall();
		}
	}

	public LoopScrollView.OnBaseNodeEvent<bool> QPYX_LoopScrollView_OnBaseNodeEvent_bool_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			LoopScrollView.OnBaseNodeEvent<bool> fn_YXQP = delegate(LoopBaseNode QPYX_param_YXQP0, bool QPYX_param_YXQP1, UnityEngine.EventSystems.PointerEventData QPYX_param_YXQP2) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_LoopScrollView_OnBaseNodeEvent_bool_YXQP_Event QPYX_target = new QPYX_LoopScrollView_OnBaseNodeEvent_bool_YXQP_Event(func_YXQP);
			LoopScrollView.OnBaseNodeEvent<bool> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_LoopScrollView_OnBaseNodeEvent_bool_YXQP_Event QPYX_target = new QPYX_LoopScrollView_OnBaseNodeEvent_bool_YXQP_Event(func_YXQP, self_YXQP);
			LoopScrollView.OnBaseNodeEvent<bool> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_LoopScrollView_OnBaseNodeEvent_bool_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(LoopScrollView.OnBaseNodeEvent<bool>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_LoopScrollView_OnBaseNodeEvent_bool_YXQP(IntPtr L_YXQP, LoopScrollView.OnBaseNodeEvent<bool> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_UnityEngine_Events_UnityAction_LoopBaseNode_YXQP_Event : LuaDelegate
	{
		public QPYX_UnityEngine_Events_UnityAction_LoopBaseNode_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_UnityEngine_Events_UnityAction_LoopBaseNode_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(LoopBaseNode QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(LoopBaseNode QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}
	}

	public UnityEngine.Events.UnityAction<LoopBaseNode> QPYX_UnityEngine_Events_UnityAction_LoopBaseNode_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			UnityEngine.Events.UnityAction<LoopBaseNode> fn_YXQP = delegate(LoopBaseNode QPYX_param_YXQP0) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_UnityEngine_Events_UnityAction_LoopBaseNode_YXQP_Event QPYX_target = new QPYX_UnityEngine_Events_UnityAction_LoopBaseNode_YXQP_Event(func_YXQP);
			UnityEngine.Events.UnityAction<LoopBaseNode> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_UnityEngine_Events_UnityAction_LoopBaseNode_YXQP_Event QPYX_target = new QPYX_UnityEngine_Events_UnityAction_LoopBaseNode_YXQP_Event(func_YXQP, self_YXQP);
			UnityEngine.Events.UnityAction<LoopBaseNode> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_UnityEngine_Events_UnityAction_LoopBaseNode_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(UnityEngine.Events.UnityAction<LoopBaseNode>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_UnityEngine_Events_UnityAction_LoopBaseNode_YXQP(IntPtr L_YXQP, UnityEngine.Events.UnityAction<LoopBaseNode> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_UnityEngine_Events_UnityAction_UnityEngine_Vector3_YXQP_Event : LuaDelegate
	{
		public QPYX_UnityEngine_Events_UnityAction_UnityEngine_Vector3_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_UnityEngine_Events_UnityAction_UnityEngine_Vector3_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(UnityEngine.Vector3 QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(UnityEngine.Vector3 QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}
	}

	public UnityEngine.Events.UnityAction<UnityEngine.Vector3> QPYX_UnityEngine_Events_UnityAction_UnityEngine_Vector3_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			UnityEngine.Events.UnityAction<UnityEngine.Vector3> fn_YXQP = delegate(UnityEngine.Vector3 QPYX_param_YXQP0) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_UnityEngine_Events_UnityAction_UnityEngine_Vector3_YXQP_Event QPYX_target = new QPYX_UnityEngine_Events_UnityAction_UnityEngine_Vector3_YXQP_Event(func_YXQP);
			UnityEngine.Events.UnityAction<UnityEngine.Vector3> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_UnityEngine_Events_UnityAction_UnityEngine_Vector3_YXQP_Event QPYX_target = new QPYX_UnityEngine_Events_UnityAction_UnityEngine_Vector3_YXQP_Event(func_YXQP, self_YXQP);
			UnityEngine.Events.UnityAction<UnityEngine.Vector3> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_UnityEngine_Events_UnityAction_UnityEngine_Vector3_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(UnityEngine.Events.UnityAction<UnityEngine.Vector3>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_UnityEngine_Events_UnityAction_UnityEngine_Vector3_YXQP(IntPtr L_YXQP, UnityEngine.Events.UnityAction<UnityEngine.Vector3> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_System_Action_string_string_YXQP_Event : LuaDelegate
	{
		public QPYX_System_Action_string_string_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_System_Action_string_string_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(string QPYX_param_YXQP0, string QPYX_param_YXQP1)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(string QPYX_param_YXQP0, string QPYX_param_YXQP1)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.PCall();
			func.EndPCall();
		}
	}

	public System.Action<string,string> QPYX_System_Action_string_string_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			System.Action<string,string> fn_YXQP = delegate(string QPYX_param_YXQP0, string QPYX_param_YXQP1) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_System_Action_string_string_YXQP_Event QPYX_target = new QPYX_System_Action_string_string_YXQP_Event(func_YXQP);
			System.Action<string,string> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_System_Action_string_string_YXQP_Event QPYX_target = new QPYX_System_Action_string_string_YXQP_Event(func_YXQP, self_YXQP);
			System.Action<string,string> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_System_Action_string_string_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(System.Action<string,string>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_System_Action_string_string_YXQP(IntPtr L_YXQP, System.Action<string,string> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_System_Action_int_string_int_YXQP_Event : LuaDelegate
	{
		public QPYX_System_Action_int_string_int_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_System_Action_int_string_int_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(int QPYX_param_YXQP0, string QPYX_param_YXQP1, int QPYX_param_YXQP2)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.Push(QPYX_param_YXQP2);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(int QPYX_param_YXQP0, string QPYX_param_YXQP1, int QPYX_param_YXQP2)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.Push(QPYX_param_YXQP2);
			func.PCall();
			func.EndPCall();
		}
	}

	public System.Action<int,string,int> QPYX_System_Action_int_string_int_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			System.Action<int,string,int> fn_YXQP = delegate(int QPYX_param_YXQP0, string QPYX_param_YXQP1, int QPYX_param_YXQP2) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_System_Action_int_string_int_YXQP_Event QPYX_target = new QPYX_System_Action_int_string_int_YXQP_Event(func_YXQP);
			System.Action<int,string,int> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_System_Action_int_string_int_YXQP_Event QPYX_target = new QPYX_System_Action_int_string_int_YXQP_Event(func_YXQP, self_YXQP);
			System.Action<int,string,int> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_System_Action_int_string_int_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(System.Action<int,string,int>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_System_Action_int_string_int_YXQP(IntPtr L_YXQP, System.Action<int,string,int> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_gcloud_voice_IGCloudVoice_JoinRoomCompleteHandler_YXQP_Event : LuaDelegate
	{
		public QPYX_gcloud_voice_IGCloudVoice_JoinRoomCompleteHandler_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_gcloud_voice_IGCloudVoice_JoinRoomCompleteHandler_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode QPYX_param_YXQP0, string QPYX_param_YXQP1, int QPYX_param_YXQP2)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.Push(QPYX_param_YXQP2);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode QPYX_param_YXQP0, string QPYX_param_YXQP1, int QPYX_param_YXQP2)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.Push(QPYX_param_YXQP2);
			func.PCall();
			func.EndPCall();
		}
	}

	public gcloud_voice.IGCloudVoice.JoinRoomCompleteHandler QPYX_gcloud_voice_IGCloudVoice_JoinRoomCompleteHandler_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			gcloud_voice.IGCloudVoice.JoinRoomCompleteHandler fn_YXQP = delegate(gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode QPYX_param_YXQP0, string QPYX_param_YXQP1, int QPYX_param_YXQP2) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_gcloud_voice_IGCloudVoice_JoinRoomCompleteHandler_YXQP_Event QPYX_target = new QPYX_gcloud_voice_IGCloudVoice_JoinRoomCompleteHandler_YXQP_Event(func_YXQP);
			gcloud_voice.IGCloudVoice.JoinRoomCompleteHandler QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_gcloud_voice_IGCloudVoice_JoinRoomCompleteHandler_YXQP_Event QPYX_target = new QPYX_gcloud_voice_IGCloudVoice_JoinRoomCompleteHandler_YXQP_Event(func_YXQP, self_YXQP);
			gcloud_voice.IGCloudVoice.JoinRoomCompleteHandler QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_gcloud_voice_IGCloudVoice_JoinRoomCompleteHandler_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(gcloud_voice.IGCloudVoice.JoinRoomCompleteHandler), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_gcloud_voice_IGCloudVoice_JoinRoomCompleteHandler_YXQP(IntPtr L_YXQP, gcloud_voice.IGCloudVoice.JoinRoomCompleteHandler o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_gcloud_voice_IGCloudVoice_QuitRoomCompleteHandler_YXQP_Event : LuaDelegate
	{
		public QPYX_gcloud_voice_IGCloudVoice_QuitRoomCompleteHandler_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_gcloud_voice_IGCloudVoice_QuitRoomCompleteHandler_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode QPYX_param_YXQP0, string QPYX_param_YXQP1, int QPYX_param_YXQP2)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.Push(QPYX_param_YXQP2);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode QPYX_param_YXQP0, string QPYX_param_YXQP1, int QPYX_param_YXQP2)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.Push(QPYX_param_YXQP2);
			func.PCall();
			func.EndPCall();
		}
	}

	public gcloud_voice.IGCloudVoice.QuitRoomCompleteHandler QPYX_gcloud_voice_IGCloudVoice_QuitRoomCompleteHandler_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			gcloud_voice.IGCloudVoice.QuitRoomCompleteHandler fn_YXQP = delegate(gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode QPYX_param_YXQP0, string QPYX_param_YXQP1, int QPYX_param_YXQP2) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_gcloud_voice_IGCloudVoice_QuitRoomCompleteHandler_YXQP_Event QPYX_target = new QPYX_gcloud_voice_IGCloudVoice_QuitRoomCompleteHandler_YXQP_Event(func_YXQP);
			gcloud_voice.IGCloudVoice.QuitRoomCompleteHandler QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_gcloud_voice_IGCloudVoice_QuitRoomCompleteHandler_YXQP_Event QPYX_target = new QPYX_gcloud_voice_IGCloudVoice_QuitRoomCompleteHandler_YXQP_Event(func_YXQP, self_YXQP);
			gcloud_voice.IGCloudVoice.QuitRoomCompleteHandler QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_gcloud_voice_IGCloudVoice_QuitRoomCompleteHandler_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(gcloud_voice.IGCloudVoice.QuitRoomCompleteHandler), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_gcloud_voice_IGCloudVoice_QuitRoomCompleteHandler_YXQP(IntPtr L_YXQP, gcloud_voice.IGCloudVoice.QuitRoomCompleteHandler o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_gcloud_voice_IGCloudVoice_MemberVoiceHandler_YXQP_Event : LuaDelegate
	{
		public QPYX_gcloud_voice_IGCloudVoice_MemberVoiceHandler_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_gcloud_voice_IGCloudVoice_MemberVoiceHandler_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(int[] QPYX_param_YXQP0, int QPYX_param_YXQP1)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(int[] QPYX_param_YXQP0, int QPYX_param_YXQP1)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.PCall();
			func.EndPCall();
		}
	}

	public gcloud_voice.IGCloudVoice.MemberVoiceHandler QPYX_gcloud_voice_IGCloudVoice_MemberVoiceHandler_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			gcloud_voice.IGCloudVoice.MemberVoiceHandler fn_YXQP = delegate(int[] QPYX_param_YXQP0, int QPYX_param_YXQP1) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_gcloud_voice_IGCloudVoice_MemberVoiceHandler_YXQP_Event QPYX_target = new QPYX_gcloud_voice_IGCloudVoice_MemberVoiceHandler_YXQP_Event(func_YXQP);
			gcloud_voice.IGCloudVoice.MemberVoiceHandler QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_gcloud_voice_IGCloudVoice_MemberVoiceHandler_YXQP_Event QPYX_target = new QPYX_gcloud_voice_IGCloudVoice_MemberVoiceHandler_YXQP_Event(func_YXQP, self_YXQP);
			gcloud_voice.IGCloudVoice.MemberVoiceHandler QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_gcloud_voice_IGCloudVoice_MemberVoiceHandler_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(gcloud_voice.IGCloudVoice.MemberVoiceHandler), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_gcloud_voice_IGCloudVoice_MemberVoiceHandler_YXQP(IntPtr L_YXQP, gcloud_voice.IGCloudVoice.MemberVoiceHandler o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_gcloud_voice_IGCloudVoice_ApplyMessageKeyCompleteHandler_YXQP_Event : LuaDelegate
	{
		public QPYX_gcloud_voice_IGCloudVoice_ApplyMessageKeyCompleteHandler_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_gcloud_voice_IGCloudVoice_ApplyMessageKeyCompleteHandler_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}
	}

	public gcloud_voice.IGCloudVoice.ApplyMessageKeyCompleteHandler QPYX_gcloud_voice_IGCloudVoice_ApplyMessageKeyCompleteHandler_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			gcloud_voice.IGCloudVoice.ApplyMessageKeyCompleteHandler fn_YXQP = delegate(gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode QPYX_param_YXQP0) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_gcloud_voice_IGCloudVoice_ApplyMessageKeyCompleteHandler_YXQP_Event QPYX_target = new QPYX_gcloud_voice_IGCloudVoice_ApplyMessageKeyCompleteHandler_YXQP_Event(func_YXQP);
			gcloud_voice.IGCloudVoice.ApplyMessageKeyCompleteHandler QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_gcloud_voice_IGCloudVoice_ApplyMessageKeyCompleteHandler_YXQP_Event QPYX_target = new QPYX_gcloud_voice_IGCloudVoice_ApplyMessageKeyCompleteHandler_YXQP_Event(func_YXQP, self_YXQP);
			gcloud_voice.IGCloudVoice.ApplyMessageKeyCompleteHandler QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_gcloud_voice_IGCloudVoice_ApplyMessageKeyCompleteHandler_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(gcloud_voice.IGCloudVoice.ApplyMessageKeyCompleteHandler), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_gcloud_voice_IGCloudVoice_ApplyMessageKeyCompleteHandler_YXQP(IntPtr L_YXQP, gcloud_voice.IGCloudVoice.ApplyMessageKeyCompleteHandler o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_gcloud_voice_IGCloudVoice_UploadReccordFileCompleteHandler_YXQP_Event : LuaDelegate
	{
		public QPYX_gcloud_voice_IGCloudVoice_UploadReccordFileCompleteHandler_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_gcloud_voice_IGCloudVoice_UploadReccordFileCompleteHandler_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode QPYX_param_YXQP0, string QPYX_param_YXQP1, string QPYX_param_YXQP2)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.Push(QPYX_param_YXQP2);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode QPYX_param_YXQP0, string QPYX_param_YXQP1, string QPYX_param_YXQP2)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.Push(QPYX_param_YXQP2);
			func.PCall();
			func.EndPCall();
		}
	}

	public gcloud_voice.IGCloudVoice.UploadReccordFileCompleteHandler QPYX_gcloud_voice_IGCloudVoice_UploadReccordFileCompleteHandler_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			gcloud_voice.IGCloudVoice.UploadReccordFileCompleteHandler fn_YXQP = delegate(gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode QPYX_param_YXQP0, string QPYX_param_YXQP1, string QPYX_param_YXQP2) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_gcloud_voice_IGCloudVoice_UploadReccordFileCompleteHandler_YXQP_Event QPYX_target = new QPYX_gcloud_voice_IGCloudVoice_UploadReccordFileCompleteHandler_YXQP_Event(func_YXQP);
			gcloud_voice.IGCloudVoice.UploadReccordFileCompleteHandler QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_gcloud_voice_IGCloudVoice_UploadReccordFileCompleteHandler_YXQP_Event QPYX_target = new QPYX_gcloud_voice_IGCloudVoice_UploadReccordFileCompleteHandler_YXQP_Event(func_YXQP, self_YXQP);
			gcloud_voice.IGCloudVoice.UploadReccordFileCompleteHandler QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_gcloud_voice_IGCloudVoice_UploadReccordFileCompleteHandler_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(gcloud_voice.IGCloudVoice.UploadReccordFileCompleteHandler), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_gcloud_voice_IGCloudVoice_UploadReccordFileCompleteHandler_YXQP(IntPtr L_YXQP, gcloud_voice.IGCloudVoice.UploadReccordFileCompleteHandler o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_gcloud_voice_IGCloudVoice_DownloadRecordFileCompleteHandler_YXQP_Event : LuaDelegate
	{
		public QPYX_gcloud_voice_IGCloudVoice_DownloadRecordFileCompleteHandler_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_gcloud_voice_IGCloudVoice_DownloadRecordFileCompleteHandler_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode QPYX_param_YXQP0, string QPYX_param_YXQP1, string QPYX_param_YXQP2)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.Push(QPYX_param_YXQP2);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode QPYX_param_YXQP0, string QPYX_param_YXQP1, string QPYX_param_YXQP2)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.Push(QPYX_param_YXQP2);
			func.PCall();
			func.EndPCall();
		}
	}

	public gcloud_voice.IGCloudVoice.DownloadRecordFileCompleteHandler QPYX_gcloud_voice_IGCloudVoice_DownloadRecordFileCompleteHandler_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			gcloud_voice.IGCloudVoice.DownloadRecordFileCompleteHandler fn_YXQP = delegate(gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode QPYX_param_YXQP0, string QPYX_param_YXQP1, string QPYX_param_YXQP2) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_gcloud_voice_IGCloudVoice_DownloadRecordFileCompleteHandler_YXQP_Event QPYX_target = new QPYX_gcloud_voice_IGCloudVoice_DownloadRecordFileCompleteHandler_YXQP_Event(func_YXQP);
			gcloud_voice.IGCloudVoice.DownloadRecordFileCompleteHandler QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_gcloud_voice_IGCloudVoice_DownloadRecordFileCompleteHandler_YXQP_Event QPYX_target = new QPYX_gcloud_voice_IGCloudVoice_DownloadRecordFileCompleteHandler_YXQP_Event(func_YXQP, self_YXQP);
			gcloud_voice.IGCloudVoice.DownloadRecordFileCompleteHandler QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_gcloud_voice_IGCloudVoice_DownloadRecordFileCompleteHandler_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(gcloud_voice.IGCloudVoice.DownloadRecordFileCompleteHandler), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_gcloud_voice_IGCloudVoice_DownloadRecordFileCompleteHandler_YXQP(IntPtr L_YXQP, gcloud_voice.IGCloudVoice.DownloadRecordFileCompleteHandler o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_gcloud_voice_IGCloudVoice_PlayRecordFilCompleteHandler_YXQP_Event : LuaDelegate
	{
		public QPYX_gcloud_voice_IGCloudVoice_PlayRecordFilCompleteHandler_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_gcloud_voice_IGCloudVoice_PlayRecordFilCompleteHandler_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode QPYX_param_YXQP0, string QPYX_param_YXQP1)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode QPYX_param_YXQP0, string QPYX_param_YXQP1)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.PCall();
			func.EndPCall();
		}
	}

	public gcloud_voice.IGCloudVoice.PlayRecordFilCompleteHandler QPYX_gcloud_voice_IGCloudVoice_PlayRecordFilCompleteHandler_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			gcloud_voice.IGCloudVoice.PlayRecordFilCompleteHandler fn_YXQP = delegate(gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode QPYX_param_YXQP0, string QPYX_param_YXQP1) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_gcloud_voice_IGCloudVoice_PlayRecordFilCompleteHandler_YXQP_Event QPYX_target = new QPYX_gcloud_voice_IGCloudVoice_PlayRecordFilCompleteHandler_YXQP_Event(func_YXQP);
			gcloud_voice.IGCloudVoice.PlayRecordFilCompleteHandler QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_gcloud_voice_IGCloudVoice_PlayRecordFilCompleteHandler_YXQP_Event QPYX_target = new QPYX_gcloud_voice_IGCloudVoice_PlayRecordFilCompleteHandler_YXQP_Event(func_YXQP, self_YXQP);
			gcloud_voice.IGCloudVoice.PlayRecordFilCompleteHandler QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_gcloud_voice_IGCloudVoice_PlayRecordFilCompleteHandler_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(gcloud_voice.IGCloudVoice.PlayRecordFilCompleteHandler), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_gcloud_voice_IGCloudVoice_PlayRecordFilCompleteHandler_YXQP(IntPtr L_YXQP, gcloud_voice.IGCloudVoice.PlayRecordFilCompleteHandler o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_gcloud_voice_IGCloudVoice_SpeechToTextHandler_YXQP_Event : LuaDelegate
	{
		public QPYX_gcloud_voice_IGCloudVoice_SpeechToTextHandler_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_gcloud_voice_IGCloudVoice_SpeechToTextHandler_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode QPYX_param_YXQP0, string QPYX_param_YXQP1, string QPYX_param_YXQP2)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.Push(QPYX_param_YXQP2);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode QPYX_param_YXQP0, string QPYX_param_YXQP1, string QPYX_param_YXQP2)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.Push(QPYX_param_YXQP2);
			func.PCall();
			func.EndPCall();
		}
	}

	public gcloud_voice.IGCloudVoice.SpeechToTextHandler QPYX_gcloud_voice_IGCloudVoice_SpeechToTextHandler_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			gcloud_voice.IGCloudVoice.SpeechToTextHandler fn_YXQP = delegate(gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode QPYX_param_YXQP0, string QPYX_param_YXQP1, string QPYX_param_YXQP2) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_gcloud_voice_IGCloudVoice_SpeechToTextHandler_YXQP_Event QPYX_target = new QPYX_gcloud_voice_IGCloudVoice_SpeechToTextHandler_YXQP_Event(func_YXQP);
			gcloud_voice.IGCloudVoice.SpeechToTextHandler QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_gcloud_voice_IGCloudVoice_SpeechToTextHandler_YXQP_Event QPYX_target = new QPYX_gcloud_voice_IGCloudVoice_SpeechToTextHandler_YXQP_Event(func_YXQP, self_YXQP);
			gcloud_voice.IGCloudVoice.SpeechToTextHandler QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_gcloud_voice_IGCloudVoice_SpeechToTextHandler_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(gcloud_voice.IGCloudVoice.SpeechToTextHandler), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_gcloud_voice_IGCloudVoice_SpeechToTextHandler_YXQP(IntPtr L_YXQP, gcloud_voice.IGCloudVoice.SpeechToTextHandler o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_gcloud_voice_IGCloudVoice_StreamSpeechToTextHandler_YXQP_Event : LuaDelegate
	{
		public QPYX_gcloud_voice_IGCloudVoice_StreamSpeechToTextHandler_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_gcloud_voice_IGCloudVoice_StreamSpeechToTextHandler_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode QPYX_param_YXQP0, int QPYX_param_YXQP1, string QPYX_param_YXQP2, string QPYX_param_YXQP3)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.Push(QPYX_param_YXQP2);
			func.Push(QPYX_param_YXQP3);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode QPYX_param_YXQP0, int QPYX_param_YXQP1, string QPYX_param_YXQP2, string QPYX_param_YXQP3)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.Push(QPYX_param_YXQP2);
			func.Push(QPYX_param_YXQP3);
			func.PCall();
			func.EndPCall();
		}
	}

	public gcloud_voice.IGCloudVoice.StreamSpeechToTextHandler QPYX_gcloud_voice_IGCloudVoice_StreamSpeechToTextHandler_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			gcloud_voice.IGCloudVoice.StreamSpeechToTextHandler fn_YXQP = delegate(gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode QPYX_param_YXQP0, int QPYX_param_YXQP1, string QPYX_param_YXQP2, string QPYX_param_YXQP3) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_gcloud_voice_IGCloudVoice_StreamSpeechToTextHandler_YXQP_Event QPYX_target = new QPYX_gcloud_voice_IGCloudVoice_StreamSpeechToTextHandler_YXQP_Event(func_YXQP);
			gcloud_voice.IGCloudVoice.StreamSpeechToTextHandler QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_gcloud_voice_IGCloudVoice_StreamSpeechToTextHandler_YXQP_Event QPYX_target = new QPYX_gcloud_voice_IGCloudVoice_StreamSpeechToTextHandler_YXQP_Event(func_YXQP, self_YXQP);
			gcloud_voice.IGCloudVoice.StreamSpeechToTextHandler QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_gcloud_voice_IGCloudVoice_StreamSpeechToTextHandler_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(gcloud_voice.IGCloudVoice.StreamSpeechToTextHandler), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_gcloud_voice_IGCloudVoice_StreamSpeechToTextHandler_YXQP(IntPtr L_YXQP, gcloud_voice.IGCloudVoice.StreamSpeechToTextHandler o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_gcloud_voice_IGCloudVoice_StatusUpdateHandler_YXQP_Event : LuaDelegate
	{
		public QPYX_gcloud_voice_IGCloudVoice_StatusUpdateHandler_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_gcloud_voice_IGCloudVoice_StatusUpdateHandler_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode QPYX_param_YXQP0, string QPYX_param_YXQP1, int QPYX_param_YXQP2)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.Push(QPYX_param_YXQP2);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode QPYX_param_YXQP0, string QPYX_param_YXQP1, int QPYX_param_YXQP2)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.Push(QPYX_param_YXQP2);
			func.PCall();
			func.EndPCall();
		}
	}

	public gcloud_voice.IGCloudVoice.StatusUpdateHandler QPYX_gcloud_voice_IGCloudVoice_StatusUpdateHandler_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			gcloud_voice.IGCloudVoice.StatusUpdateHandler fn_YXQP = delegate(gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode QPYX_param_YXQP0, string QPYX_param_YXQP1, int QPYX_param_YXQP2) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_gcloud_voice_IGCloudVoice_StatusUpdateHandler_YXQP_Event QPYX_target = new QPYX_gcloud_voice_IGCloudVoice_StatusUpdateHandler_YXQP_Event(func_YXQP);
			gcloud_voice.IGCloudVoice.StatusUpdateHandler QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_gcloud_voice_IGCloudVoice_StatusUpdateHandler_YXQP_Event QPYX_target = new QPYX_gcloud_voice_IGCloudVoice_StatusUpdateHandler_YXQP_Event(func_YXQP, self_YXQP);
			gcloud_voice.IGCloudVoice.StatusUpdateHandler QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_gcloud_voice_IGCloudVoice_StatusUpdateHandler_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(gcloud_voice.IGCloudVoice.StatusUpdateHandler), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_gcloud_voice_IGCloudVoice_StatusUpdateHandler_YXQP(IntPtr L_YXQP, gcloud_voice.IGCloudVoice.StatusUpdateHandler o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_gcloud_voice_IGCloudVoice_ChangeRoleCompleteHandler_YXQP_Event : LuaDelegate
	{
		public QPYX_gcloud_voice_IGCloudVoice_ChangeRoleCompleteHandler_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_gcloud_voice_IGCloudVoice_ChangeRoleCompleteHandler_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode QPYX_param_YXQP0, string QPYX_param_YXQP1, int QPYX_param_YXQP2, int QPYX_param_YXQP3)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.Push(QPYX_param_YXQP2);
			func.Push(QPYX_param_YXQP3);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode QPYX_param_YXQP0, string QPYX_param_YXQP1, int QPYX_param_YXQP2, int QPYX_param_YXQP3)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.Push(QPYX_param_YXQP2);
			func.Push(QPYX_param_YXQP3);
			func.PCall();
			func.EndPCall();
		}
	}

	public gcloud_voice.IGCloudVoice.ChangeRoleCompleteHandler QPYX_gcloud_voice_IGCloudVoice_ChangeRoleCompleteHandler_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			gcloud_voice.IGCloudVoice.ChangeRoleCompleteHandler fn_YXQP = delegate(gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode QPYX_param_YXQP0, string QPYX_param_YXQP1, int QPYX_param_YXQP2, int QPYX_param_YXQP3) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_gcloud_voice_IGCloudVoice_ChangeRoleCompleteHandler_YXQP_Event QPYX_target = new QPYX_gcloud_voice_IGCloudVoice_ChangeRoleCompleteHandler_YXQP_Event(func_YXQP);
			gcloud_voice.IGCloudVoice.ChangeRoleCompleteHandler QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_gcloud_voice_IGCloudVoice_ChangeRoleCompleteHandler_YXQP_Event QPYX_target = new QPYX_gcloud_voice_IGCloudVoice_ChangeRoleCompleteHandler_YXQP_Event(func_YXQP, self_YXQP);
			gcloud_voice.IGCloudVoice.ChangeRoleCompleteHandler QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_gcloud_voice_IGCloudVoice_ChangeRoleCompleteHandler_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(gcloud_voice.IGCloudVoice.ChangeRoleCompleteHandler), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_gcloud_voice_IGCloudVoice_ChangeRoleCompleteHandler_YXQP(IntPtr L_YXQP, gcloud_voice.IGCloudVoice.ChangeRoleCompleteHandler o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_gcloud_voice_IGCloudVoice_RoomMemberVoiceHandler_YXQP_Event : LuaDelegate
	{
		public QPYX_gcloud_voice_IGCloudVoice_RoomMemberVoiceHandler_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_gcloud_voice_IGCloudVoice_RoomMemberVoiceHandler_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(string QPYX_param_YXQP0, int QPYX_param_YXQP1, int QPYX_param_YXQP2)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.Push(QPYX_param_YXQP2);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(string QPYX_param_YXQP0, int QPYX_param_YXQP1, int QPYX_param_YXQP2)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.Push(QPYX_param_YXQP2);
			func.PCall();
			func.EndPCall();
		}
	}

	public gcloud_voice.IGCloudVoice.RoomMemberVoiceHandler QPYX_gcloud_voice_IGCloudVoice_RoomMemberVoiceHandler_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			gcloud_voice.IGCloudVoice.RoomMemberVoiceHandler fn_YXQP = delegate(string QPYX_param_YXQP0, int QPYX_param_YXQP1, int QPYX_param_YXQP2) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_gcloud_voice_IGCloudVoice_RoomMemberVoiceHandler_YXQP_Event QPYX_target = new QPYX_gcloud_voice_IGCloudVoice_RoomMemberVoiceHandler_YXQP_Event(func_YXQP);
			gcloud_voice.IGCloudVoice.RoomMemberVoiceHandler QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_gcloud_voice_IGCloudVoice_RoomMemberVoiceHandler_YXQP_Event QPYX_target = new QPYX_gcloud_voice_IGCloudVoice_RoomMemberVoiceHandler_YXQP_Event(func_YXQP, self_YXQP);
			gcloud_voice.IGCloudVoice.RoomMemberVoiceHandler QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_gcloud_voice_IGCloudVoice_RoomMemberVoiceHandler_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(gcloud_voice.IGCloudVoice.RoomMemberVoiceHandler), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_gcloud_voice_IGCloudVoice_RoomMemberVoiceHandler_YXQP(IntPtr L_YXQP, gcloud_voice.IGCloudVoice.RoomMemberVoiceHandler o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_gcloud_voice_IGCloudVoice_EventUpdateHandler_YXQP_Event : LuaDelegate
	{
		public QPYX_gcloud_voice_IGCloudVoice_EventUpdateHandler_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_gcloud_voice_IGCloudVoice_EventUpdateHandler_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(gcloud_voice.GCloudVoiceEvent QPYX_param_YXQP0, string QPYX_param_YXQP1)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(gcloud_voice.GCloudVoiceEvent QPYX_param_YXQP0, string QPYX_param_YXQP1)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.PCall();
			func.EndPCall();
		}
	}

	public gcloud_voice.IGCloudVoice.EventUpdateHandler QPYX_gcloud_voice_IGCloudVoice_EventUpdateHandler_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			gcloud_voice.IGCloudVoice.EventUpdateHandler fn_YXQP = delegate(gcloud_voice.GCloudVoiceEvent QPYX_param_YXQP0, string QPYX_param_YXQP1) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_gcloud_voice_IGCloudVoice_EventUpdateHandler_YXQP_Event QPYX_target = new QPYX_gcloud_voice_IGCloudVoice_EventUpdateHandler_YXQP_Event(func_YXQP);
			gcloud_voice.IGCloudVoice.EventUpdateHandler QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_gcloud_voice_IGCloudVoice_EventUpdateHandler_YXQP_Event QPYX_target = new QPYX_gcloud_voice_IGCloudVoice_EventUpdateHandler_YXQP_Event(func_YXQP, self_YXQP);
			gcloud_voice.IGCloudVoice.EventUpdateHandler QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_gcloud_voice_IGCloudVoice_EventUpdateHandler_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(gcloud_voice.IGCloudVoice.EventUpdateHandler), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_gcloud_voice_IGCloudVoice_EventUpdateHandler_YXQP(IntPtr L_YXQP, gcloud_voice.IGCloudVoice.EventUpdateHandler o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_gcloud_voice_IGCloudVoice_MuteSwitchResultHandler_YXQP_Event : LuaDelegate
	{
		public QPYX_gcloud_voice_IGCloudVoice_MuteSwitchResultHandler_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_gcloud_voice_IGCloudVoice_MuteSwitchResultHandler_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(int QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(int QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}
	}

	public gcloud_voice.IGCloudVoice.MuteSwitchResultHandler QPYX_gcloud_voice_IGCloudVoice_MuteSwitchResultHandler_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			gcloud_voice.IGCloudVoice.MuteSwitchResultHandler fn_YXQP = delegate(int QPYX_param_YXQP0) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_gcloud_voice_IGCloudVoice_MuteSwitchResultHandler_YXQP_Event QPYX_target = new QPYX_gcloud_voice_IGCloudVoice_MuteSwitchResultHandler_YXQP_Event(func_YXQP);
			gcloud_voice.IGCloudVoice.MuteSwitchResultHandler QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_gcloud_voice_IGCloudVoice_MuteSwitchResultHandler_YXQP_Event QPYX_target = new QPYX_gcloud_voice_IGCloudVoice_MuteSwitchResultHandler_YXQP_Event(func_YXQP, self_YXQP);
			gcloud_voice.IGCloudVoice.MuteSwitchResultHandler QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_gcloud_voice_IGCloudVoice_MuteSwitchResultHandler_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(gcloud_voice.IGCloudVoice.MuteSwitchResultHandler), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_gcloud_voice_IGCloudVoice_MuteSwitchResultHandler_YXQP(IntPtr L_YXQP, gcloud_voice.IGCloudVoice.MuteSwitchResultHandler o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_littlerbird_UI_QuickGrid_QuickGridItemEvenet_YXQP_Event : LuaDelegate
	{
		public QPYX_littlerbird_UI_QuickGrid_QuickGridItemEvenet_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_littlerbird_UI_QuickGrid_QuickGridItemEvenet_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(littlerbird.UI.QuickGridItemBase QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(littlerbird.UI.QuickGridItemBase QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}
	}

	public littlerbird.UI.QuickGrid.QuickGridItemEvenet QPYX_littlerbird_UI_QuickGrid_QuickGridItemEvenet_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			littlerbird.UI.QuickGrid.QuickGridItemEvenet fn_YXQP = delegate(littlerbird.UI.QuickGridItemBase QPYX_param_YXQP0) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_littlerbird_UI_QuickGrid_QuickGridItemEvenet_YXQP_Event QPYX_target = new QPYX_littlerbird_UI_QuickGrid_QuickGridItemEvenet_YXQP_Event(func_YXQP);
			littlerbird.UI.QuickGrid.QuickGridItemEvenet QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_littlerbird_UI_QuickGrid_QuickGridItemEvenet_YXQP_Event QPYX_target = new QPYX_littlerbird_UI_QuickGrid_QuickGridItemEvenet_YXQP_Event(func_YXQP, self_YXQP);
			littlerbird.UI.QuickGrid.QuickGridItemEvenet QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_littlerbird_UI_QuickGrid_QuickGridItemEvenet_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(littlerbird.UI.QuickGrid.QuickGridItemEvenet), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_littlerbird_UI_QuickGrid_QuickGridItemEvenet_YXQP(IntPtr L_YXQP, littlerbird.UI.QuickGrid.QuickGridItemEvenet o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_littlerbird_UI_QuickGrid_ReturnQuickGridItemEvent_bool_YXQP_Event : LuaDelegate
	{
		public QPYX_littlerbird_UI_QuickGrid_ReturnQuickGridItemEvent_bool_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_littlerbird_UI_QuickGrid_ReturnQuickGridItemEvent_bool_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public bool QPYX_Call_YXQP(littlerbird.UI.QuickGridItemBase QPYX_param_YXQP0, bool QPYX_param_YXQP1)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.PCall();
			bool ret = func.CheckBoolean();
			func.EndPCall();
			return ret;
		}

		public bool QPYX_CallWithSelf_YXQP(littlerbird.UI.QuickGridItemBase QPYX_param_YXQP0, bool QPYX_param_YXQP1)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.PCall();
			bool ret = func.CheckBoolean();
			func.EndPCall();
			return ret;
		}
	}

	public littlerbird.UI.QuickGrid.ReturnQuickGridItemEvent<bool> QPYX_littlerbird_UI_QuickGrid_ReturnQuickGridItemEvent_bool_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			littlerbird.UI.QuickGrid.ReturnQuickGridItemEvent<bool> fn_YXQP = delegate(littlerbird.UI.QuickGridItemBase QPYX_param_YXQP0, bool QPYX_param_YXQP1) { return false; };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_littlerbird_UI_QuickGrid_ReturnQuickGridItemEvent_bool_YXQP_Event QPYX_target = new QPYX_littlerbird_UI_QuickGrid_ReturnQuickGridItemEvent_bool_YXQP_Event(func_YXQP);
			littlerbird.UI.QuickGrid.ReturnQuickGridItemEvent<bool> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_littlerbird_UI_QuickGrid_ReturnQuickGridItemEvent_bool_YXQP_Event QPYX_target = new QPYX_littlerbird_UI_QuickGrid_ReturnQuickGridItemEvent_bool_YXQP_Event(func_YXQP, self_YXQP);
			littlerbird.UI.QuickGrid.ReturnQuickGridItemEvent<bool> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_littlerbird_UI_QuickGrid_ReturnQuickGridItemEvent_bool_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(littlerbird.UI.QuickGrid.ReturnQuickGridItemEvent<bool>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_littlerbird_UI_QuickGrid_ReturnQuickGridItemEvent_bool_YXQP(IntPtr L_YXQP, littlerbird.UI.QuickGrid.ReturnQuickGridItemEvent<bool> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_littlerbird_UI_QuickGrid_ReturnQuickGridItemEvent_YXQP_Event : LuaDelegate
	{
		public QPYX_littlerbird_UI_QuickGrid_ReturnQuickGridItemEvent_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_littlerbird_UI_QuickGrid_ReturnQuickGridItemEvent_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public bool QPYX_Call_YXQP(littlerbird.UI.QuickGridItemBase QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			bool ret = func.CheckBoolean();
			func.EndPCall();
			return ret;
		}

		public bool QPYX_CallWithSelf_YXQP(littlerbird.UI.QuickGridItemBase QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			bool ret = func.CheckBoolean();
			func.EndPCall();
			return ret;
		}
	}

	public littlerbird.UI.QuickGrid.ReturnQuickGridItemEvent QPYX_littlerbird_UI_QuickGrid_ReturnQuickGridItemEvent_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			littlerbird.UI.QuickGrid.ReturnQuickGridItemEvent fn_YXQP = delegate(littlerbird.UI.QuickGridItemBase QPYX_param_YXQP0) { return false; };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_littlerbird_UI_QuickGrid_ReturnQuickGridItemEvent_YXQP_Event QPYX_target = new QPYX_littlerbird_UI_QuickGrid_ReturnQuickGridItemEvent_YXQP_Event(func_YXQP);
			littlerbird.UI.QuickGrid.ReturnQuickGridItemEvent QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_littlerbird_UI_QuickGrid_ReturnQuickGridItemEvent_YXQP_Event QPYX_target = new QPYX_littlerbird_UI_QuickGrid_ReturnQuickGridItemEvent_YXQP_Event(func_YXQP, self_YXQP);
			littlerbird.UI.QuickGrid.ReturnQuickGridItemEvent QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_littlerbird_UI_QuickGrid_ReturnQuickGridItemEvent_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(littlerbird.UI.QuickGrid.ReturnQuickGridItemEvent), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_littlerbird_UI_QuickGrid_ReturnQuickGridItemEvent_YXQP(IntPtr L_YXQP, littlerbird.UI.QuickGrid.ReturnQuickGridItemEvent o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_littlerbird_UI_QuickGrid_QuickCallback_YXQP_Event : LuaDelegate
	{
		public QPYX_littlerbird_UI_QuickGrid_QuickCallback_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_littlerbird_UI_QuickGrid_QuickCallback_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP()
		{
			func.Call();
		}

		public void QPYX_CallWithSelf_YXQP()
		{
			func.BeginPCall();
			func.Push(self);
			func.PCall();
			func.EndPCall();
		}
	}

	public littlerbird.UI.QuickGrid.QuickCallback QPYX_littlerbird_UI_QuickGrid_QuickCallback_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			littlerbird.UI.QuickGrid.QuickCallback fn_YXQP = delegate() { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_littlerbird_UI_QuickGrid_QuickCallback_YXQP_Event QPYX_target = new QPYX_littlerbird_UI_QuickGrid_QuickCallback_YXQP_Event(func_YXQP);
			littlerbird.UI.QuickGrid.QuickCallback QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_littlerbird_UI_QuickGrid_QuickCallback_YXQP_Event QPYX_target = new QPYX_littlerbird_UI_QuickGrid_QuickCallback_YXQP_Event(func_YXQP, self_YXQP);
			littlerbird.UI.QuickGrid.QuickCallback QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_littlerbird_UI_QuickGrid_QuickCallback_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(littlerbird.UI.QuickGrid.QuickCallback), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_littlerbird_UI_QuickGrid_QuickCallback_YXQP(IntPtr L_YXQP, littlerbird.UI.QuickGrid.QuickCallback o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_System_Action_SimpleItemBase_YXQP_Event : LuaDelegate
	{
		public QPYX_System_Action_SimpleItemBase_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_System_Action_SimpleItemBase_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(SimpleItemBase QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(SimpleItemBase QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}
	}

	public System.Action<SimpleItemBase> QPYX_System_Action_SimpleItemBase_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			System.Action<SimpleItemBase> fn_YXQP = delegate(SimpleItemBase QPYX_param_YXQP0) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_System_Action_SimpleItemBase_YXQP_Event QPYX_target = new QPYX_System_Action_SimpleItemBase_YXQP_Event(func_YXQP);
			System.Action<SimpleItemBase> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_System_Action_SimpleItemBase_YXQP_Event QPYX_target = new QPYX_System_Action_SimpleItemBase_YXQP_Event(func_YXQP, self_YXQP);
			System.Action<SimpleItemBase> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_System_Action_SimpleItemBase_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(System.Action<SimpleItemBase>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_System_Action_SimpleItemBase_YXQP(IntPtr L_YXQP, System.Action<SimpleItemBase> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_UnityEngine_RectTransform_ReapplyDrivenProperties_YXQP_Event : LuaDelegate
	{
		public QPYX_UnityEngine_RectTransform_ReapplyDrivenProperties_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_UnityEngine_RectTransform_ReapplyDrivenProperties_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(UnityEngine.RectTransform QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.PushSealed(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(UnityEngine.RectTransform QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.PushSealed(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}
	}

	public UnityEngine.RectTransform.ReapplyDrivenProperties QPYX_UnityEngine_RectTransform_ReapplyDrivenProperties_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			UnityEngine.RectTransform.ReapplyDrivenProperties fn_YXQP = delegate(UnityEngine.RectTransform QPYX_param_YXQP0) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_UnityEngine_RectTransform_ReapplyDrivenProperties_YXQP_Event QPYX_target = new QPYX_UnityEngine_RectTransform_ReapplyDrivenProperties_YXQP_Event(func_YXQP);
			UnityEngine.RectTransform.ReapplyDrivenProperties QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_UnityEngine_RectTransform_ReapplyDrivenProperties_YXQP_Event QPYX_target = new QPYX_UnityEngine_RectTransform_ReapplyDrivenProperties_YXQP_Event(func_YXQP, self_YXQP);
			UnityEngine.RectTransform.ReapplyDrivenProperties QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_UnityEngine_RectTransform_ReapplyDrivenProperties_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(UnityEngine.RectTransform.ReapplyDrivenProperties), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_UnityEngine_RectTransform_ReapplyDrivenProperties_YXQP(IntPtr L_YXQP, UnityEngine.RectTransform.ReapplyDrivenProperties o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_UnityEngine_UI_InputField_OnValidateInput_YXQP_Event : LuaDelegate
	{
		public QPYX_UnityEngine_UI_InputField_OnValidateInput_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_UnityEngine_UI_InputField_OnValidateInput_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public char QPYX_Call_YXQP(string QPYX_param_YXQP0, int QPYX_param_YXQP1, char QPYX_param_YXQP2)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.Push(QPYX_param_YXQP2);
			func.PCall();
			char ret = (char)func.CheckNumber();
			func.EndPCall();
			return ret;
		}

		public char QPYX_CallWithSelf_YXQP(string QPYX_param_YXQP0, int QPYX_param_YXQP1, char QPYX_param_YXQP2)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.Push(QPYX_param_YXQP2);
			func.PCall();
			char ret = (char)func.CheckNumber();
			func.EndPCall();
			return ret;
		}
	}

	public UnityEngine.UI.InputField.OnValidateInput QPYX_UnityEngine_UI_InputField_OnValidateInput_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			UnityEngine.UI.InputField.OnValidateInput fn_YXQP = delegate(string QPYX_param_YXQP0, int QPYX_param_YXQP1, char QPYX_param_YXQP2) { return '\0'; };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_UnityEngine_UI_InputField_OnValidateInput_YXQP_Event QPYX_target = new QPYX_UnityEngine_UI_InputField_OnValidateInput_YXQP_Event(func_YXQP);
			UnityEngine.UI.InputField.OnValidateInput QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_UnityEngine_UI_InputField_OnValidateInput_YXQP_Event QPYX_target = new QPYX_UnityEngine_UI_InputField_OnValidateInput_YXQP_Event(func_YXQP, self_YXQP);
			UnityEngine.UI.InputField.OnValidateInput QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_UnityEngine_UI_InputField_OnValidateInput_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(UnityEngine.UI.InputField.OnValidateInput), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_UnityEngine_UI_InputField_OnValidateInput_YXQP(IntPtr L_YXQP, UnityEngine.UI.InputField.OnValidateInput o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_DG_Tweening_Core_DOGetter_double_YXQP_Event : LuaDelegate
	{
		public QPYX_DG_Tweening_Core_DOGetter_double_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_DG_Tweening_Core_DOGetter_double_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public double QPYX_Call_YXQP()
		{
			func.BeginPCall();
			func.PCall();
			double ret = (double)func.CheckNumber();
			func.EndPCall();
			return ret;
		}

		public double QPYX_CallWithSelf_YXQP()
		{
			func.BeginPCall();
			func.Push(self);
			func.PCall();
			double ret = (double)func.CheckNumber();
			func.EndPCall();
			return ret;
		}
	}

	public DG.Tweening.Core.DOGetter<double> QPYX_DG_Tweening_Core_DOGetter_double_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			DG.Tweening.Core.DOGetter<double> fn_YXQP = delegate() { return 0; };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_DG_Tweening_Core_DOGetter_double_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOGetter_double_YXQP_Event(func_YXQP);
			DG.Tweening.Core.DOGetter<double> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_DG_Tweening_Core_DOGetter_double_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOGetter_double_YXQP_Event(func_YXQP, self_YXQP);
			DG.Tweening.Core.DOGetter<double> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_DG_Tweening_Core_DOGetter_double_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(DG.Tweening.Core.DOGetter<double>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_DG_Tweening_Core_DOGetter_double_YXQP(IntPtr L_YXQP, DG.Tweening.Core.DOGetter<double> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_DG_Tweening_Core_DOSetter_double_YXQP_Event : LuaDelegate
	{
		public QPYX_DG_Tweening_Core_DOSetter_double_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_DG_Tweening_Core_DOSetter_double_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(double QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(double QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}
	}

	public DG.Tweening.Core.DOSetter<double> QPYX_DG_Tweening_Core_DOSetter_double_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			DG.Tweening.Core.DOSetter<double> fn_YXQP = delegate(double QPYX_param_YXQP0) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_DG_Tweening_Core_DOSetter_double_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOSetter_double_YXQP_Event(func_YXQP);
			DG.Tweening.Core.DOSetter<double> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_DG_Tweening_Core_DOSetter_double_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOSetter_double_YXQP_Event(func_YXQP, self_YXQP);
			DG.Tweening.Core.DOSetter<double> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_DG_Tweening_Core_DOSetter_double_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(DG.Tweening.Core.DOSetter<double>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_DG_Tweening_Core_DOSetter_double_YXQP(IntPtr L_YXQP, DG.Tweening.Core.DOSetter<double> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_DG_Tweening_Core_DOGetter_int_YXQP_Event : LuaDelegate
	{
		public QPYX_DG_Tweening_Core_DOGetter_int_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_DG_Tweening_Core_DOGetter_int_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public int QPYX_Call_YXQP()
		{
			func.BeginPCall();
			func.PCall();
			int ret = (int)func.CheckNumber();
			func.EndPCall();
			return ret;
		}

		public int QPYX_CallWithSelf_YXQP()
		{
			func.BeginPCall();
			func.Push(self);
			func.PCall();
			int ret = (int)func.CheckNumber();
			func.EndPCall();
			return ret;
		}
	}

	public DG.Tweening.Core.DOGetter<int> QPYX_DG_Tweening_Core_DOGetter_int_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			DG.Tweening.Core.DOGetter<int> fn_YXQP = delegate() { return 0; };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_DG_Tweening_Core_DOGetter_int_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOGetter_int_YXQP_Event(func_YXQP);
			DG.Tweening.Core.DOGetter<int> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_DG_Tweening_Core_DOGetter_int_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOGetter_int_YXQP_Event(func_YXQP, self_YXQP);
			DG.Tweening.Core.DOGetter<int> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_DG_Tweening_Core_DOGetter_int_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(DG.Tweening.Core.DOGetter<int>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_DG_Tweening_Core_DOGetter_int_YXQP(IntPtr L_YXQP, DG.Tweening.Core.DOGetter<int> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_DG_Tweening_Core_DOSetter_int_YXQP_Event : LuaDelegate
	{
		public QPYX_DG_Tweening_Core_DOSetter_int_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_DG_Tweening_Core_DOSetter_int_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(int QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(int QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}
	}

	public DG.Tweening.Core.DOSetter<int> QPYX_DG_Tweening_Core_DOSetter_int_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			DG.Tweening.Core.DOSetter<int> fn_YXQP = delegate(int QPYX_param_YXQP0) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_DG_Tweening_Core_DOSetter_int_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOSetter_int_YXQP_Event(func_YXQP);
			DG.Tweening.Core.DOSetter<int> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_DG_Tweening_Core_DOSetter_int_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOSetter_int_YXQP_Event(func_YXQP, self_YXQP);
			DG.Tweening.Core.DOSetter<int> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_DG_Tweening_Core_DOSetter_int_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(DG.Tweening.Core.DOSetter<int>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_DG_Tweening_Core_DOSetter_int_YXQP(IntPtr L_YXQP, DG.Tweening.Core.DOSetter<int> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_DG_Tweening_Core_DOGetter_uint_YXQP_Event : LuaDelegate
	{
		public QPYX_DG_Tweening_Core_DOGetter_uint_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_DG_Tweening_Core_DOGetter_uint_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public uint QPYX_Call_YXQP()
		{
			func.BeginPCall();
			func.PCall();
			uint ret = (uint)func.CheckNumber();
			func.EndPCall();
			return ret;
		}

		public uint QPYX_CallWithSelf_YXQP()
		{
			func.BeginPCall();
			func.Push(self);
			func.PCall();
			uint ret = (uint)func.CheckNumber();
			func.EndPCall();
			return ret;
		}
	}

	public DG.Tweening.Core.DOGetter<uint> QPYX_DG_Tweening_Core_DOGetter_uint_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			DG.Tweening.Core.DOGetter<uint> fn_YXQP = delegate() { return 0; };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_DG_Tweening_Core_DOGetter_uint_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOGetter_uint_YXQP_Event(func_YXQP);
			DG.Tweening.Core.DOGetter<uint> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_DG_Tweening_Core_DOGetter_uint_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOGetter_uint_YXQP_Event(func_YXQP, self_YXQP);
			DG.Tweening.Core.DOGetter<uint> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_DG_Tweening_Core_DOGetter_uint_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(DG.Tweening.Core.DOGetter<uint>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_DG_Tweening_Core_DOGetter_uint_YXQP(IntPtr L_YXQP, DG.Tweening.Core.DOGetter<uint> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_DG_Tweening_Core_DOSetter_uint_YXQP_Event : LuaDelegate
	{
		public QPYX_DG_Tweening_Core_DOSetter_uint_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_DG_Tweening_Core_DOSetter_uint_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(uint QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(uint QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}
	}

	public DG.Tweening.Core.DOSetter<uint> QPYX_DG_Tweening_Core_DOSetter_uint_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			DG.Tweening.Core.DOSetter<uint> fn_YXQP = delegate(uint QPYX_param_YXQP0) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_DG_Tweening_Core_DOSetter_uint_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOSetter_uint_YXQP_Event(func_YXQP);
			DG.Tweening.Core.DOSetter<uint> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_DG_Tweening_Core_DOSetter_uint_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOSetter_uint_YXQP_Event(func_YXQP, self_YXQP);
			DG.Tweening.Core.DOSetter<uint> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_DG_Tweening_Core_DOSetter_uint_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(DG.Tweening.Core.DOSetter<uint>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_DG_Tweening_Core_DOSetter_uint_YXQP(IntPtr L_YXQP, DG.Tweening.Core.DOSetter<uint> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_DG_Tweening_Core_DOGetter_long_YXQP_Event : LuaDelegate
	{
		public QPYX_DG_Tweening_Core_DOGetter_long_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_DG_Tweening_Core_DOGetter_long_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public long QPYX_Call_YXQP()
		{
			func.BeginPCall();
			func.PCall();
			long ret = func.CheckLong();
			func.EndPCall();
			return ret;
		}

		public long QPYX_CallWithSelf_YXQP()
		{
			func.BeginPCall();
			func.Push(self);
			func.PCall();
			long ret = func.CheckLong();
			func.EndPCall();
			return ret;
		}
	}

	public DG.Tweening.Core.DOGetter<long> QPYX_DG_Tweening_Core_DOGetter_long_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			DG.Tweening.Core.DOGetter<long> fn_YXQP = delegate() { return 0; };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_DG_Tweening_Core_DOGetter_long_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOGetter_long_YXQP_Event(func_YXQP);
			DG.Tweening.Core.DOGetter<long> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_DG_Tweening_Core_DOGetter_long_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOGetter_long_YXQP_Event(func_YXQP, self_YXQP);
			DG.Tweening.Core.DOGetter<long> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_DG_Tweening_Core_DOGetter_long_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(DG.Tweening.Core.DOGetter<long>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_DG_Tweening_Core_DOGetter_long_YXQP(IntPtr L_YXQP, DG.Tweening.Core.DOGetter<long> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_DG_Tweening_Core_DOSetter_long_YXQP_Event : LuaDelegate
	{
		public QPYX_DG_Tweening_Core_DOSetter_long_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_DG_Tweening_Core_DOSetter_long_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(long QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(long QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}
	}

	public DG.Tweening.Core.DOSetter<long> QPYX_DG_Tweening_Core_DOSetter_long_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			DG.Tweening.Core.DOSetter<long> fn_YXQP = delegate(long QPYX_param_YXQP0) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_DG_Tweening_Core_DOSetter_long_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOSetter_long_YXQP_Event(func_YXQP);
			DG.Tweening.Core.DOSetter<long> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_DG_Tweening_Core_DOSetter_long_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOSetter_long_YXQP_Event(func_YXQP, self_YXQP);
			DG.Tweening.Core.DOSetter<long> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_DG_Tweening_Core_DOSetter_long_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(DG.Tweening.Core.DOSetter<long>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_DG_Tweening_Core_DOSetter_long_YXQP(IntPtr L_YXQP, DG.Tweening.Core.DOSetter<long> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_DG_Tweening_Core_DOGetter_ulong_YXQP_Event : LuaDelegate
	{
		public QPYX_DG_Tweening_Core_DOGetter_ulong_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_DG_Tweening_Core_DOGetter_ulong_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public ulong QPYX_Call_YXQP()
		{
			func.BeginPCall();
			func.PCall();
			ulong ret = func.CheckULong();
			func.EndPCall();
			return ret;
		}

		public ulong QPYX_CallWithSelf_YXQP()
		{
			func.BeginPCall();
			func.Push(self);
			func.PCall();
			ulong ret = func.CheckULong();
			func.EndPCall();
			return ret;
		}
	}

	public DG.Tweening.Core.DOGetter<ulong> QPYX_DG_Tweening_Core_DOGetter_ulong_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			DG.Tweening.Core.DOGetter<ulong> fn_YXQP = delegate() { return 0; };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_DG_Tweening_Core_DOGetter_ulong_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOGetter_ulong_YXQP_Event(func_YXQP);
			DG.Tweening.Core.DOGetter<ulong> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_DG_Tweening_Core_DOGetter_ulong_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOGetter_ulong_YXQP_Event(func_YXQP, self_YXQP);
			DG.Tweening.Core.DOGetter<ulong> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_DG_Tweening_Core_DOGetter_ulong_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(DG.Tweening.Core.DOGetter<ulong>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_DG_Tweening_Core_DOGetter_ulong_YXQP(IntPtr L_YXQP, DG.Tweening.Core.DOGetter<ulong> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_DG_Tweening_Core_DOSetter_ulong_YXQP_Event : LuaDelegate
	{
		public QPYX_DG_Tweening_Core_DOSetter_ulong_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_DG_Tweening_Core_DOSetter_ulong_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(ulong QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(ulong QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}
	}

	public DG.Tweening.Core.DOSetter<ulong> QPYX_DG_Tweening_Core_DOSetter_ulong_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			DG.Tweening.Core.DOSetter<ulong> fn_YXQP = delegate(ulong QPYX_param_YXQP0) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_DG_Tweening_Core_DOSetter_ulong_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOSetter_ulong_YXQP_Event(func_YXQP);
			DG.Tweening.Core.DOSetter<ulong> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_DG_Tweening_Core_DOSetter_ulong_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOSetter_ulong_YXQP_Event(func_YXQP, self_YXQP);
			DG.Tweening.Core.DOSetter<ulong> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_DG_Tweening_Core_DOSetter_ulong_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(DG.Tweening.Core.DOSetter<ulong>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_DG_Tweening_Core_DOSetter_ulong_YXQP(IntPtr L_YXQP, DG.Tweening.Core.DOSetter<ulong> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_DG_Tweening_Core_DOGetter_string_YXQP_Event : LuaDelegate
	{
		public QPYX_DG_Tweening_Core_DOGetter_string_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_DG_Tweening_Core_DOGetter_string_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public string QPYX_Call_YXQP()
		{
			func.BeginPCall();
			func.PCall();
			string ret = func.CheckString();
			func.EndPCall();
			return ret;
		}

		public string QPYX_CallWithSelf_YXQP()
		{
			func.BeginPCall();
			func.Push(self);
			func.PCall();
			string ret = func.CheckString();
			func.EndPCall();
			return ret;
		}
	}

	public DG.Tweening.Core.DOGetter<string> QPYX_DG_Tweening_Core_DOGetter_string_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			DG.Tweening.Core.DOGetter<string> fn_YXQP = delegate() { return null; };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_DG_Tweening_Core_DOGetter_string_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOGetter_string_YXQP_Event(func_YXQP);
			DG.Tweening.Core.DOGetter<string> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_DG_Tweening_Core_DOGetter_string_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOGetter_string_YXQP_Event(func_YXQP, self_YXQP);
			DG.Tweening.Core.DOGetter<string> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_DG_Tweening_Core_DOGetter_string_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(DG.Tweening.Core.DOGetter<string>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_DG_Tweening_Core_DOGetter_string_YXQP(IntPtr L_YXQP, DG.Tweening.Core.DOGetter<string> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_DG_Tweening_Core_DOSetter_string_YXQP_Event : LuaDelegate
	{
		public QPYX_DG_Tweening_Core_DOSetter_string_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_DG_Tweening_Core_DOSetter_string_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(string QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(string QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}
	}

	public DG.Tweening.Core.DOSetter<string> QPYX_DG_Tweening_Core_DOSetter_string_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			DG.Tweening.Core.DOSetter<string> fn_YXQP = delegate(string QPYX_param_YXQP0) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_DG_Tweening_Core_DOSetter_string_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOSetter_string_YXQP_Event(func_YXQP);
			DG.Tweening.Core.DOSetter<string> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_DG_Tweening_Core_DOSetter_string_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOSetter_string_YXQP_Event(func_YXQP, self_YXQP);
			DG.Tweening.Core.DOSetter<string> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_DG_Tweening_Core_DOSetter_string_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(DG.Tweening.Core.DOSetter<string>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_DG_Tweening_Core_DOSetter_string_YXQP(IntPtr L_YXQP, DG.Tweening.Core.DOSetter<string> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Vector2_YXQP_Event : LuaDelegate
	{
		public QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Vector2_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Vector2_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public UnityEngine.Vector2 QPYX_Call_YXQP()
		{
			func.BeginPCall();
			func.PCall();
			UnityEngine.Vector2 ret = func.CheckVector2();
			func.EndPCall();
			return ret;
		}

		public UnityEngine.Vector2 QPYX_CallWithSelf_YXQP()
		{
			func.BeginPCall();
			func.Push(self);
			func.PCall();
			UnityEngine.Vector2 ret = func.CheckVector2();
			func.EndPCall();
			return ret;
		}
	}

	public DG.Tweening.Core.DOGetter<UnityEngine.Vector2> QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Vector2_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			DG.Tweening.Core.DOGetter<UnityEngine.Vector2> fn_YXQP = delegate() { return default(UnityEngine.Vector2); };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Vector2_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Vector2_YXQP_Event(func_YXQP);
			DG.Tweening.Core.DOGetter<UnityEngine.Vector2> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Vector2_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Vector2_YXQP_Event(func_YXQP, self_YXQP);
			DG.Tweening.Core.DOGetter<UnityEngine.Vector2> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_DG_Tweening_Core_DOGetter_UnityEngine_Vector2_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(DG.Tweening.Core.DOGetter<UnityEngine.Vector2>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_DG_Tweening_Core_DOGetter_UnityEngine_Vector2_YXQP(IntPtr L_YXQP, DG.Tweening.Core.DOGetter<UnityEngine.Vector2> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Vector2_YXQP_Event : LuaDelegate
	{
		public QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Vector2_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Vector2_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(UnityEngine.Vector2 QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(UnityEngine.Vector2 QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}
	}

	public DG.Tweening.Core.DOSetter<UnityEngine.Vector2> QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Vector2_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			DG.Tweening.Core.DOSetter<UnityEngine.Vector2> fn_YXQP = delegate(UnityEngine.Vector2 QPYX_param_YXQP0) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Vector2_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Vector2_YXQP_Event(func_YXQP);
			DG.Tweening.Core.DOSetter<UnityEngine.Vector2> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Vector2_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Vector2_YXQP_Event(func_YXQP, self_YXQP);
			DG.Tweening.Core.DOSetter<UnityEngine.Vector2> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_DG_Tweening_Core_DOSetter_UnityEngine_Vector2_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(DG.Tweening.Core.DOSetter<UnityEngine.Vector2>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_DG_Tweening_Core_DOSetter_UnityEngine_Vector2_YXQP(IntPtr L_YXQP, DG.Tweening.Core.DOSetter<UnityEngine.Vector2> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Vector3_YXQP_Event : LuaDelegate
	{
		public QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Vector3_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Vector3_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public UnityEngine.Vector3 QPYX_Call_YXQP()
		{
			func.BeginPCall();
			func.PCall();
			UnityEngine.Vector3 ret = func.CheckVector3();
			func.EndPCall();
			return ret;
		}

		public UnityEngine.Vector3 QPYX_CallWithSelf_YXQP()
		{
			func.BeginPCall();
			func.Push(self);
			func.PCall();
			UnityEngine.Vector3 ret = func.CheckVector3();
			func.EndPCall();
			return ret;
		}
	}

	public DG.Tweening.Core.DOGetter<UnityEngine.Vector3> QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Vector3_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			DG.Tweening.Core.DOGetter<UnityEngine.Vector3> fn_YXQP = delegate() { return default(UnityEngine.Vector3); };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Vector3_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Vector3_YXQP_Event(func_YXQP);
			DG.Tweening.Core.DOGetter<UnityEngine.Vector3> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Vector3_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Vector3_YXQP_Event(func_YXQP, self_YXQP);
			DG.Tweening.Core.DOGetter<UnityEngine.Vector3> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_DG_Tweening_Core_DOGetter_UnityEngine_Vector3_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(DG.Tweening.Core.DOGetter<UnityEngine.Vector3>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_DG_Tweening_Core_DOGetter_UnityEngine_Vector3_YXQP(IntPtr L_YXQP, DG.Tweening.Core.DOGetter<UnityEngine.Vector3> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Vector3_YXQP_Event : LuaDelegate
	{
		public QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Vector3_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Vector3_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(UnityEngine.Vector3 QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(UnityEngine.Vector3 QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}
	}

	public DG.Tweening.Core.DOSetter<UnityEngine.Vector3> QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Vector3_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			DG.Tweening.Core.DOSetter<UnityEngine.Vector3> fn_YXQP = delegate(UnityEngine.Vector3 QPYX_param_YXQP0) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Vector3_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Vector3_YXQP_Event(func_YXQP);
			DG.Tweening.Core.DOSetter<UnityEngine.Vector3> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Vector3_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Vector3_YXQP_Event(func_YXQP, self_YXQP);
			DG.Tweening.Core.DOSetter<UnityEngine.Vector3> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_DG_Tweening_Core_DOSetter_UnityEngine_Vector3_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(DG.Tweening.Core.DOSetter<UnityEngine.Vector3>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_DG_Tweening_Core_DOSetter_UnityEngine_Vector3_YXQP(IntPtr L_YXQP, DG.Tweening.Core.DOSetter<UnityEngine.Vector3> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Vector4_YXQP_Event : LuaDelegate
	{
		public QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Vector4_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Vector4_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public UnityEngine.Vector4 QPYX_Call_YXQP()
		{
			func.BeginPCall();
			func.PCall();
			UnityEngine.Vector4 ret = func.CheckVector4();
			func.EndPCall();
			return ret;
		}

		public UnityEngine.Vector4 QPYX_CallWithSelf_YXQP()
		{
			func.BeginPCall();
			func.Push(self);
			func.PCall();
			UnityEngine.Vector4 ret = func.CheckVector4();
			func.EndPCall();
			return ret;
		}
	}

	public DG.Tweening.Core.DOGetter<UnityEngine.Vector4> QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Vector4_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			DG.Tweening.Core.DOGetter<UnityEngine.Vector4> fn_YXQP = delegate() { return default(UnityEngine.Vector4); };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Vector4_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Vector4_YXQP_Event(func_YXQP);
			DG.Tweening.Core.DOGetter<UnityEngine.Vector4> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Vector4_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Vector4_YXQP_Event(func_YXQP, self_YXQP);
			DG.Tweening.Core.DOGetter<UnityEngine.Vector4> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_DG_Tweening_Core_DOGetter_UnityEngine_Vector4_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(DG.Tweening.Core.DOGetter<UnityEngine.Vector4>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_DG_Tweening_Core_DOGetter_UnityEngine_Vector4_YXQP(IntPtr L_YXQP, DG.Tweening.Core.DOGetter<UnityEngine.Vector4> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Vector4_YXQP_Event : LuaDelegate
	{
		public QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Vector4_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Vector4_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(UnityEngine.Vector4 QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(UnityEngine.Vector4 QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}
	}

	public DG.Tweening.Core.DOSetter<UnityEngine.Vector4> QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Vector4_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			DG.Tweening.Core.DOSetter<UnityEngine.Vector4> fn_YXQP = delegate(UnityEngine.Vector4 QPYX_param_YXQP0) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Vector4_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Vector4_YXQP_Event(func_YXQP);
			DG.Tweening.Core.DOSetter<UnityEngine.Vector4> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Vector4_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Vector4_YXQP_Event(func_YXQP, self_YXQP);
			DG.Tweening.Core.DOSetter<UnityEngine.Vector4> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_DG_Tweening_Core_DOSetter_UnityEngine_Vector4_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(DG.Tweening.Core.DOSetter<UnityEngine.Vector4>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_DG_Tweening_Core_DOSetter_UnityEngine_Vector4_YXQP(IntPtr L_YXQP, DG.Tweening.Core.DOSetter<UnityEngine.Vector4> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Quaternion_YXQP_Event : LuaDelegate
	{
		public QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Quaternion_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Quaternion_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public UnityEngine.Quaternion QPYX_Call_YXQP()
		{
			func.BeginPCall();
			func.PCall();
			UnityEngine.Quaternion ret = func.CheckQuaternion();
			func.EndPCall();
			return ret;
		}

		public UnityEngine.Quaternion QPYX_CallWithSelf_YXQP()
		{
			func.BeginPCall();
			func.Push(self);
			func.PCall();
			UnityEngine.Quaternion ret = func.CheckQuaternion();
			func.EndPCall();
			return ret;
		}
	}

	public DG.Tweening.Core.DOGetter<UnityEngine.Quaternion> QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Quaternion_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			DG.Tweening.Core.DOGetter<UnityEngine.Quaternion> fn_YXQP = delegate() { return default(UnityEngine.Quaternion); };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Quaternion_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Quaternion_YXQP_Event(func_YXQP);
			DG.Tweening.Core.DOGetter<UnityEngine.Quaternion> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Quaternion_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Quaternion_YXQP_Event(func_YXQP, self_YXQP);
			DG.Tweening.Core.DOGetter<UnityEngine.Quaternion> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_DG_Tweening_Core_DOGetter_UnityEngine_Quaternion_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(DG.Tweening.Core.DOGetter<UnityEngine.Quaternion>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_DG_Tweening_Core_DOGetter_UnityEngine_Quaternion_YXQP(IntPtr L_YXQP, DG.Tweening.Core.DOGetter<UnityEngine.Quaternion> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Quaternion_YXQP_Event : LuaDelegate
	{
		public QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Quaternion_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Quaternion_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(UnityEngine.Quaternion QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(UnityEngine.Quaternion QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}
	}

	public DG.Tweening.Core.DOSetter<UnityEngine.Quaternion> QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Quaternion_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			DG.Tweening.Core.DOSetter<UnityEngine.Quaternion> fn_YXQP = delegate(UnityEngine.Quaternion QPYX_param_YXQP0) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Quaternion_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Quaternion_YXQP_Event(func_YXQP);
			DG.Tweening.Core.DOSetter<UnityEngine.Quaternion> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Quaternion_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Quaternion_YXQP_Event(func_YXQP, self_YXQP);
			DG.Tweening.Core.DOSetter<UnityEngine.Quaternion> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_DG_Tweening_Core_DOSetter_UnityEngine_Quaternion_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(DG.Tweening.Core.DOSetter<UnityEngine.Quaternion>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_DG_Tweening_Core_DOSetter_UnityEngine_Quaternion_YXQP(IntPtr L_YXQP, DG.Tweening.Core.DOSetter<UnityEngine.Quaternion> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Color_YXQP_Event : LuaDelegate
	{
		public QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Color_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Color_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public UnityEngine.Color QPYX_Call_YXQP()
		{
			func.BeginPCall();
			func.PCall();
			UnityEngine.Color ret = func.CheckColor();
			func.EndPCall();
			return ret;
		}

		public UnityEngine.Color QPYX_CallWithSelf_YXQP()
		{
			func.BeginPCall();
			func.Push(self);
			func.PCall();
			UnityEngine.Color ret = func.CheckColor();
			func.EndPCall();
			return ret;
		}
	}

	public DG.Tweening.Core.DOGetter<UnityEngine.Color> QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Color_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			DG.Tweening.Core.DOGetter<UnityEngine.Color> fn_YXQP = delegate() { return default(UnityEngine.Color); };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Color_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Color_YXQP_Event(func_YXQP);
			DG.Tweening.Core.DOGetter<UnityEngine.Color> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Color_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Color_YXQP_Event(func_YXQP, self_YXQP);
			DG.Tweening.Core.DOGetter<UnityEngine.Color> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_DG_Tweening_Core_DOGetter_UnityEngine_Color_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(DG.Tweening.Core.DOGetter<UnityEngine.Color>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_DG_Tweening_Core_DOGetter_UnityEngine_Color_YXQP(IntPtr L_YXQP, DG.Tweening.Core.DOGetter<UnityEngine.Color> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Color_YXQP_Event : LuaDelegate
	{
		public QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Color_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Color_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(UnityEngine.Color QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(UnityEngine.Color QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}
	}

	public DG.Tweening.Core.DOSetter<UnityEngine.Color> QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Color_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			DG.Tweening.Core.DOSetter<UnityEngine.Color> fn_YXQP = delegate(UnityEngine.Color QPYX_param_YXQP0) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Color_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Color_YXQP_Event(func_YXQP);
			DG.Tweening.Core.DOSetter<UnityEngine.Color> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Color_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Color_YXQP_Event(func_YXQP, self_YXQP);
			DG.Tweening.Core.DOSetter<UnityEngine.Color> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_DG_Tweening_Core_DOSetter_UnityEngine_Color_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(DG.Tweening.Core.DOSetter<UnityEngine.Color>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_DG_Tweening_Core_DOSetter_UnityEngine_Color_YXQP(IntPtr L_YXQP, DG.Tweening.Core.DOSetter<UnityEngine.Color> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Rect_YXQP_Event : LuaDelegate
	{
		public QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Rect_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Rect_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public UnityEngine.Rect QPYX_Call_YXQP()
		{
			func.BeginPCall();
			func.PCall();
			UnityEngine.Rect ret = (UnityEngine.Rect)func.CheckObject(typeof(UnityEngine.Rect));
			func.EndPCall();
			return ret;
		}

		public UnityEngine.Rect QPYX_CallWithSelf_YXQP()
		{
			func.BeginPCall();
			func.Push(self);
			func.PCall();
			UnityEngine.Rect ret = (UnityEngine.Rect)func.CheckObject(typeof(UnityEngine.Rect));
			func.EndPCall();
			return ret;
		}
	}

	public DG.Tweening.Core.DOGetter<UnityEngine.Rect> QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Rect_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			DG.Tweening.Core.DOGetter<UnityEngine.Rect> fn_YXQP = delegate() { return default(UnityEngine.Rect); };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Rect_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Rect_YXQP_Event(func_YXQP);
			DG.Tweening.Core.DOGetter<UnityEngine.Rect> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Rect_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOGetter_UnityEngine_Rect_YXQP_Event(func_YXQP, self_YXQP);
			DG.Tweening.Core.DOGetter<UnityEngine.Rect> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_DG_Tweening_Core_DOGetter_UnityEngine_Rect_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(DG.Tweening.Core.DOGetter<UnityEngine.Rect>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_DG_Tweening_Core_DOGetter_UnityEngine_Rect_YXQP(IntPtr L_YXQP, DG.Tweening.Core.DOGetter<UnityEngine.Rect> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Rect_YXQP_Event : LuaDelegate
	{
		public QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Rect_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Rect_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(UnityEngine.Rect QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.PushValue(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(UnityEngine.Rect QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.PushValue(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}
	}

	public DG.Tweening.Core.DOSetter<UnityEngine.Rect> QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Rect_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			DG.Tweening.Core.DOSetter<UnityEngine.Rect> fn_YXQP = delegate(UnityEngine.Rect QPYX_param_YXQP0) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Rect_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Rect_YXQP_Event(func_YXQP);
			DG.Tweening.Core.DOSetter<UnityEngine.Rect> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Rect_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOSetter_UnityEngine_Rect_YXQP_Event(func_YXQP, self_YXQP);
			DG.Tweening.Core.DOSetter<UnityEngine.Rect> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_DG_Tweening_Core_DOSetter_UnityEngine_Rect_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(DG.Tweening.Core.DOSetter<UnityEngine.Rect>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_DG_Tweening_Core_DOSetter_UnityEngine_Rect_YXQP(IntPtr L_YXQP, DG.Tweening.Core.DOSetter<UnityEngine.Rect> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_DG_Tweening_Core_DOGetter_UnityEngine_RectOffset_YXQP_Event : LuaDelegate
	{
		public QPYX_DG_Tweening_Core_DOGetter_UnityEngine_RectOffset_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_DG_Tweening_Core_DOGetter_UnityEngine_RectOffset_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public UnityEngine.RectOffset QPYX_Call_YXQP()
		{
			func.BeginPCall();
			func.PCall();
			UnityEngine.RectOffset ret = (UnityEngine.RectOffset)func.CheckObject(typeof(UnityEngine.RectOffset));
			func.EndPCall();
			return ret;
		}

		public UnityEngine.RectOffset QPYX_CallWithSelf_YXQP()
		{
			func.BeginPCall();
			func.Push(self);
			func.PCall();
			UnityEngine.RectOffset ret = (UnityEngine.RectOffset)func.CheckObject(typeof(UnityEngine.RectOffset));
			func.EndPCall();
			return ret;
		}
	}

	public DG.Tweening.Core.DOGetter<UnityEngine.RectOffset> QPYX_DG_Tweening_Core_DOGetter_UnityEngine_RectOffset_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			DG.Tweening.Core.DOGetter<UnityEngine.RectOffset> fn_YXQP = delegate() { return null; };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_DG_Tweening_Core_DOGetter_UnityEngine_RectOffset_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOGetter_UnityEngine_RectOffset_YXQP_Event(func_YXQP);
			DG.Tweening.Core.DOGetter<UnityEngine.RectOffset> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_DG_Tweening_Core_DOGetter_UnityEngine_RectOffset_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOGetter_UnityEngine_RectOffset_YXQP_Event(func_YXQP, self_YXQP);
			DG.Tweening.Core.DOGetter<UnityEngine.RectOffset> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_DG_Tweening_Core_DOGetter_UnityEngine_RectOffset_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(DG.Tweening.Core.DOGetter<UnityEngine.RectOffset>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_DG_Tweening_Core_DOGetter_UnityEngine_RectOffset_YXQP(IntPtr L_YXQP, DG.Tweening.Core.DOGetter<UnityEngine.RectOffset> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_DG_Tweening_Core_DOSetter_UnityEngine_RectOffset_YXQP_Event : LuaDelegate
	{
		public QPYX_DG_Tweening_Core_DOSetter_UnityEngine_RectOffset_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_DG_Tweening_Core_DOSetter_UnityEngine_RectOffset_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(UnityEngine.RectOffset QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.PushSealed(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(UnityEngine.RectOffset QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.PushSealed(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}
	}

	public DG.Tweening.Core.DOSetter<UnityEngine.RectOffset> QPYX_DG_Tweening_Core_DOSetter_UnityEngine_RectOffset_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			DG.Tweening.Core.DOSetter<UnityEngine.RectOffset> fn_YXQP = delegate(UnityEngine.RectOffset QPYX_param_YXQP0) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_DG_Tweening_Core_DOSetter_UnityEngine_RectOffset_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOSetter_UnityEngine_RectOffset_YXQP_Event(func_YXQP);
			DG.Tweening.Core.DOSetter<UnityEngine.RectOffset> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_DG_Tweening_Core_DOSetter_UnityEngine_RectOffset_YXQP_Event QPYX_target = new QPYX_DG_Tweening_Core_DOSetter_UnityEngine_RectOffset_YXQP_Event(func_YXQP, self_YXQP);
			DG.Tweening.Core.DOSetter<UnityEngine.RectOffset> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_DG_Tweening_Core_DOSetter_UnityEngine_RectOffset_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(DG.Tweening.Core.DOSetter<UnityEngine.RectOffset>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_DG_Tweening_Core_DOSetter_UnityEngine_RectOffset_YXQP(IntPtr L_YXQP, DG.Tweening.Core.DOSetter<UnityEngine.RectOffset> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_DG_Tweening_TweenCallback_int_YXQP_Event : LuaDelegate
	{
		public QPYX_DG_Tweening_TweenCallback_int_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_DG_Tweening_TweenCallback_int_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(int QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(int QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}
	}

	public DG.Tweening.TweenCallback<int> QPYX_DG_Tweening_TweenCallback_int_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			DG.Tweening.TweenCallback<int> fn_YXQP = delegate(int QPYX_param_YXQP0) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_DG_Tweening_TweenCallback_int_YXQP_Event QPYX_target = new QPYX_DG_Tweening_TweenCallback_int_YXQP_Event(func_YXQP);
			DG.Tweening.TweenCallback<int> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_DG_Tweening_TweenCallback_int_YXQP_Event QPYX_target = new QPYX_DG_Tweening_TweenCallback_int_YXQP_Event(func_YXQP, self_YXQP);
			DG.Tweening.TweenCallback<int> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_DG_Tweening_TweenCallback_int_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(DG.Tweening.TweenCallback<int>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_DG_Tweening_TweenCallback_int_YXQP(IntPtr L_YXQP, DG.Tweening.TweenCallback<int> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_UnityEngine_Camera_CameraCallback_YXQP_Event : LuaDelegate
	{
		public QPYX_UnityEngine_Camera_CameraCallback_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_UnityEngine_Camera_CameraCallback_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(UnityEngine.Camera QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.PushSealed(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(UnityEngine.Camera QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.PushSealed(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}
	}

	public UnityEngine.Camera.CameraCallback QPYX_UnityEngine_Camera_CameraCallback_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			UnityEngine.Camera.CameraCallback fn_YXQP = delegate(UnityEngine.Camera QPYX_param_YXQP0) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_UnityEngine_Camera_CameraCallback_YXQP_Event QPYX_target = new QPYX_UnityEngine_Camera_CameraCallback_YXQP_Event(func_YXQP);
			UnityEngine.Camera.CameraCallback QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_UnityEngine_Camera_CameraCallback_YXQP_Event QPYX_target = new QPYX_UnityEngine_Camera_CameraCallback_YXQP_Event(func_YXQP, self_YXQP);
			UnityEngine.Camera.CameraCallback QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_UnityEngine_Camera_CameraCallback_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(UnityEngine.Camera.CameraCallback), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_UnityEngine_Camera_CameraCallback_YXQP(IntPtr L_YXQP, UnityEngine.Camera.CameraCallback o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_UnityEngine_Application_LowMemoryCallback_YXQP_Event : LuaDelegate
	{
		public QPYX_UnityEngine_Application_LowMemoryCallback_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_UnityEngine_Application_LowMemoryCallback_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP()
		{
			func.Call();
		}

		public void QPYX_CallWithSelf_YXQP()
		{
			func.BeginPCall();
			func.Push(self);
			func.PCall();
			func.EndPCall();
		}
	}

	public UnityEngine.Application.LowMemoryCallback QPYX_UnityEngine_Application_LowMemoryCallback_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			UnityEngine.Application.LowMemoryCallback fn_YXQP = delegate() { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_UnityEngine_Application_LowMemoryCallback_YXQP_Event QPYX_target = new QPYX_UnityEngine_Application_LowMemoryCallback_YXQP_Event(func_YXQP);
			UnityEngine.Application.LowMemoryCallback QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_UnityEngine_Application_LowMemoryCallback_YXQP_Event QPYX_target = new QPYX_UnityEngine_Application_LowMemoryCallback_YXQP_Event(func_YXQP, self_YXQP);
			UnityEngine.Application.LowMemoryCallback QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_UnityEngine_Application_LowMemoryCallback_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(UnityEngine.Application.LowMemoryCallback), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_UnityEngine_Application_LowMemoryCallback_YXQP(IntPtr L_YXQP, UnityEngine.Application.LowMemoryCallback o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_UnityEngine_Application_AdvertisingIdentifierCallback_YXQP_Event : LuaDelegate
	{
		public QPYX_UnityEngine_Application_AdvertisingIdentifierCallback_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_UnityEngine_Application_AdvertisingIdentifierCallback_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(string QPYX_param_YXQP0, bool QPYX_param_YXQP1, string QPYX_param_YXQP2)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.Push(QPYX_param_YXQP2);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(string QPYX_param_YXQP0, bool QPYX_param_YXQP1, string QPYX_param_YXQP2)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.Push(QPYX_param_YXQP2);
			func.PCall();
			func.EndPCall();
		}
	}

	public UnityEngine.Application.AdvertisingIdentifierCallback QPYX_UnityEngine_Application_AdvertisingIdentifierCallback_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			UnityEngine.Application.AdvertisingIdentifierCallback fn_YXQP = delegate(string QPYX_param_YXQP0, bool QPYX_param_YXQP1, string QPYX_param_YXQP2) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_UnityEngine_Application_AdvertisingIdentifierCallback_YXQP_Event QPYX_target = new QPYX_UnityEngine_Application_AdvertisingIdentifierCallback_YXQP_Event(func_YXQP);
			UnityEngine.Application.AdvertisingIdentifierCallback QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_UnityEngine_Application_AdvertisingIdentifierCallback_YXQP_Event QPYX_target = new QPYX_UnityEngine_Application_AdvertisingIdentifierCallback_YXQP_Event(func_YXQP, self_YXQP);
			UnityEngine.Application.AdvertisingIdentifierCallback QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_UnityEngine_Application_AdvertisingIdentifierCallback_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(UnityEngine.Application.AdvertisingIdentifierCallback), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_UnityEngine_Application_AdvertisingIdentifierCallback_YXQP(IntPtr L_YXQP, UnityEngine.Application.AdvertisingIdentifierCallback o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_UnityEngine_Application_LogCallback_YXQP_Event : LuaDelegate
	{
		public QPYX_UnityEngine_Application_LogCallback_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_UnityEngine_Application_LogCallback_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(string QPYX_param_YXQP0, string QPYX_param_YXQP1, UnityEngine.LogType QPYX_param_YXQP2)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.Push(QPYX_param_YXQP2);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(string QPYX_param_YXQP0, string QPYX_param_YXQP1, UnityEngine.LogType QPYX_param_YXQP2)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.Push(QPYX_param_YXQP2);
			func.PCall();
			func.EndPCall();
		}
	}

	public UnityEngine.Application.LogCallback QPYX_UnityEngine_Application_LogCallback_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			UnityEngine.Application.LogCallback fn_YXQP = delegate(string QPYX_param_YXQP0, string QPYX_param_YXQP1, UnityEngine.LogType QPYX_param_YXQP2) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_UnityEngine_Application_LogCallback_YXQP_Event QPYX_target = new QPYX_UnityEngine_Application_LogCallback_YXQP_Event(func_YXQP);
			UnityEngine.Application.LogCallback QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_UnityEngine_Application_LogCallback_YXQP_Event QPYX_target = new QPYX_UnityEngine_Application_LogCallback_YXQP_Event(func_YXQP, self_YXQP);
			UnityEngine.Application.LogCallback QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_UnityEngine_Application_LogCallback_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(UnityEngine.Application.LogCallback), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_UnityEngine_Application_LogCallback_YXQP(IntPtr L_YXQP, UnityEngine.Application.LogCallback o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_BestHTTP_OnUploadProgressDelegate_YXQP_Event : LuaDelegate
	{
		public QPYX_BestHTTP_OnUploadProgressDelegate_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_BestHTTP_OnUploadProgressDelegate_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(BestHTTP.HTTPRequest QPYX_param_YXQP0, long QPYX_param_YXQP1, long QPYX_param_YXQP2)
		{
			func.BeginPCall();
			func.PushSealed(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.Push(QPYX_param_YXQP2);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(BestHTTP.HTTPRequest QPYX_param_YXQP0, long QPYX_param_YXQP1, long QPYX_param_YXQP2)
		{
			func.BeginPCall();
			func.Push(self);
			func.PushSealed(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.Push(QPYX_param_YXQP2);
			func.PCall();
			func.EndPCall();
		}
	}

	public BestHTTP.OnUploadProgressDelegate QPYX_BestHTTP_OnUploadProgressDelegate_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			BestHTTP.OnUploadProgressDelegate fn_YXQP = delegate(BestHTTP.HTTPRequest QPYX_param_YXQP0, long QPYX_param_YXQP1, long QPYX_param_YXQP2) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_BestHTTP_OnUploadProgressDelegate_YXQP_Event QPYX_target = new QPYX_BestHTTP_OnUploadProgressDelegate_YXQP_Event(func_YXQP);
			BestHTTP.OnUploadProgressDelegate QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_BestHTTP_OnUploadProgressDelegate_YXQP_Event QPYX_target = new QPYX_BestHTTP_OnUploadProgressDelegate_YXQP_Event(func_YXQP, self_YXQP);
			BestHTTP.OnUploadProgressDelegate QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_BestHTTP_OnUploadProgressDelegate_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(BestHTTP.OnUploadProgressDelegate), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_BestHTTP_OnUploadProgressDelegate_YXQP(IntPtr L_YXQP, BestHTTP.OnUploadProgressDelegate o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_BestHTTP_OnDownloadProgressDelegate_YXQP_Event : LuaDelegate
	{
		public QPYX_BestHTTP_OnDownloadProgressDelegate_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_BestHTTP_OnDownloadProgressDelegate_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(BestHTTP.HTTPRequest QPYX_param_YXQP0, int QPYX_param_YXQP1, int QPYX_param_YXQP2)
		{
			func.BeginPCall();
			func.PushSealed(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.Push(QPYX_param_YXQP2);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(BestHTTP.HTTPRequest QPYX_param_YXQP0, int QPYX_param_YXQP1, int QPYX_param_YXQP2)
		{
			func.BeginPCall();
			func.Push(self);
			func.PushSealed(QPYX_param_YXQP0);
			func.Push(QPYX_param_YXQP1);
			func.Push(QPYX_param_YXQP2);
			func.PCall();
			func.EndPCall();
		}
	}

	public BestHTTP.OnDownloadProgressDelegate QPYX_BestHTTP_OnDownloadProgressDelegate_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			BestHTTP.OnDownloadProgressDelegate fn_YXQP = delegate(BestHTTP.HTTPRequest QPYX_param_YXQP0, int QPYX_param_YXQP1, int QPYX_param_YXQP2) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_BestHTTP_OnDownloadProgressDelegate_YXQP_Event QPYX_target = new QPYX_BestHTTP_OnDownloadProgressDelegate_YXQP_Event(func_YXQP);
			BestHTTP.OnDownloadProgressDelegate QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_BestHTTP_OnDownloadProgressDelegate_YXQP_Event QPYX_target = new QPYX_BestHTTP_OnDownloadProgressDelegate_YXQP_Event(func_YXQP, self_YXQP);
			BestHTTP.OnDownloadProgressDelegate QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_BestHTTP_OnDownloadProgressDelegate_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(BestHTTP.OnDownloadProgressDelegate), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_BestHTTP_OnDownloadProgressDelegate_YXQP(IntPtr L_YXQP, BestHTTP.OnDownloadProgressDelegate o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_BestHTTP_OnRequestFinishedDelegate_YXQP_Event : LuaDelegate
	{
		public QPYX_BestHTTP_OnRequestFinishedDelegate_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_BestHTTP_OnRequestFinishedDelegate_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(BestHTTP.HTTPRequest QPYX_param_YXQP0, BestHTTP.HTTPResponse QPYX_param_YXQP1)
		{
			func.BeginPCall();
			func.PushSealed(QPYX_param_YXQP0);
			func.PushObject(QPYX_param_YXQP1);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(BestHTTP.HTTPRequest QPYX_param_YXQP0, BestHTTP.HTTPResponse QPYX_param_YXQP1)
		{
			func.BeginPCall();
			func.Push(self);
			func.PushSealed(QPYX_param_YXQP0);
			func.PushObject(QPYX_param_YXQP1);
			func.PCall();
			func.EndPCall();
		}
	}

	public BestHTTP.OnRequestFinishedDelegate QPYX_BestHTTP_OnRequestFinishedDelegate_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			BestHTTP.OnRequestFinishedDelegate fn_YXQP = delegate(BestHTTP.HTTPRequest QPYX_param_YXQP0, BestHTTP.HTTPResponse QPYX_param_YXQP1) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_BestHTTP_OnRequestFinishedDelegate_YXQP_Event QPYX_target = new QPYX_BestHTTP_OnRequestFinishedDelegate_YXQP_Event(func_YXQP);
			BestHTTP.OnRequestFinishedDelegate QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_BestHTTP_OnRequestFinishedDelegate_YXQP_Event QPYX_target = new QPYX_BestHTTP_OnRequestFinishedDelegate_YXQP_Event(func_YXQP, self_YXQP);
			BestHTTP.OnRequestFinishedDelegate QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_BestHTTP_OnRequestFinishedDelegate_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(BestHTTP.OnRequestFinishedDelegate), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_BestHTTP_OnRequestFinishedDelegate_YXQP(IntPtr L_YXQP, BestHTTP.OnRequestFinishedDelegate o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_System_Func_BestHTTP_HTTPRequest_System_Security_Cryptography_X509Certificates_X509Certificate_System_Security_Cryptography_X509Certificates_X509Chain_bool_YXQP_Event : LuaDelegate
	{
		public QPYX_System_Func_BestHTTP_HTTPRequest_System_Security_Cryptography_X509Certificates_X509Certificate_System_Security_Cryptography_X509Certificates_X509Chain_bool_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_System_Func_BestHTTP_HTTPRequest_System_Security_Cryptography_X509Certificates_X509Certificate_System_Security_Cryptography_X509Certificates_X509Chain_bool_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public bool QPYX_Call_YXQP(BestHTTP.HTTPRequest QPYX_param_YXQP0, System.Security.Cryptography.X509Certificates.X509Certificate QPYX_param_YXQP1, System.Security.Cryptography.X509Certificates.X509Chain QPYX_param_YXQP2)
		{
			func.BeginPCall();
			func.PushSealed(QPYX_param_YXQP0);
			func.PushObject(QPYX_param_YXQP1);
			func.PushObject(QPYX_param_YXQP2);
			func.PCall();
			bool ret = func.CheckBoolean();
			func.EndPCall();
			return ret;
		}

		public bool QPYX_CallWithSelf_YXQP(BestHTTP.HTTPRequest QPYX_param_YXQP0, System.Security.Cryptography.X509Certificates.X509Certificate QPYX_param_YXQP1, System.Security.Cryptography.X509Certificates.X509Chain QPYX_param_YXQP2)
		{
			func.BeginPCall();
			func.Push(self);
			func.PushSealed(QPYX_param_YXQP0);
			func.PushObject(QPYX_param_YXQP1);
			func.PushObject(QPYX_param_YXQP2);
			func.PCall();
			bool ret = func.CheckBoolean();
			func.EndPCall();
			return ret;
		}
	}

	public System.Func<BestHTTP.HTTPRequest,System.Security.Cryptography.X509Certificates.X509Certificate,System.Security.Cryptography.X509Certificates.X509Chain,bool> QPYX_System_Func_BestHTTP_HTTPRequest_System_Security_Cryptography_X509Certificates_X509Certificate_System_Security_Cryptography_X509Certificates_X509Chain_bool_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			System.Func<BestHTTP.HTTPRequest,System.Security.Cryptography.X509Certificates.X509Certificate,System.Security.Cryptography.X509Certificates.X509Chain,bool> fn_YXQP = delegate(BestHTTP.HTTPRequest QPYX_param_YXQP0, System.Security.Cryptography.X509Certificates.X509Certificate QPYX_param_YXQP1, System.Security.Cryptography.X509Certificates.X509Chain QPYX_param_YXQP2) { return false; };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_System_Func_BestHTTP_HTTPRequest_System_Security_Cryptography_X509Certificates_X509Certificate_System_Security_Cryptography_X509Certificates_X509Chain_bool_YXQP_Event QPYX_target = new QPYX_System_Func_BestHTTP_HTTPRequest_System_Security_Cryptography_X509Certificates_X509Certificate_System_Security_Cryptography_X509Certificates_X509Chain_bool_YXQP_Event(func_YXQP);
			System.Func<BestHTTP.HTTPRequest,System.Security.Cryptography.X509Certificates.X509Certificate,System.Security.Cryptography.X509Certificates.X509Chain,bool> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_System_Func_BestHTTP_HTTPRequest_System_Security_Cryptography_X509Certificates_X509Certificate_System_Security_Cryptography_X509Certificates_X509Chain_bool_YXQP_Event QPYX_target = new QPYX_System_Func_BestHTTP_HTTPRequest_System_Security_Cryptography_X509Certificates_X509Certificate_System_Security_Cryptography_X509Certificates_X509Chain_bool_YXQP_Event(func_YXQP, self_YXQP);
			System.Func<BestHTTP.HTTPRequest,System.Security.Cryptography.X509Certificates.X509Certificate,System.Security.Cryptography.X509Certificates.X509Chain,bool> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_System_Func_BestHTTP_HTTPRequest_System_Security_Cryptography_X509Certificates_X509Certificate_System_Security_Cryptography_X509Certificates_X509Chain_bool_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(System.Func<BestHTTP.HTTPRequest,System.Security.Cryptography.X509Certificates.X509Certificate,System.Security.Cryptography.X509Certificates.X509Chain,bool>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_System_Func_BestHTTP_HTTPRequest_System_Security_Cryptography_X509Certificates_X509Certificate_System_Security_Cryptography_X509Certificates_X509Chain_bool_YXQP(IntPtr L_YXQP, System.Func<BestHTTP.HTTPRequest,System.Security.Cryptography.X509Certificates.X509Certificate,System.Security.Cryptography.X509Certificates.X509Chain,bool> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_BestHTTP_OnBeforeRedirectionDelegate_YXQP_Event : LuaDelegate
	{
		public QPYX_BestHTTP_OnBeforeRedirectionDelegate_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_BestHTTP_OnBeforeRedirectionDelegate_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public bool QPYX_Call_YXQP(BestHTTP.HTTPRequest QPYX_param_YXQP0, BestHTTP.HTTPResponse QPYX_param_YXQP1, System.Uri QPYX_param_YXQP2)
		{
			func.BeginPCall();
			func.PushSealed(QPYX_param_YXQP0);
			func.PushObject(QPYX_param_YXQP1);
			func.PushObject(QPYX_param_YXQP2);
			func.PCall();
			bool ret = func.CheckBoolean();
			func.EndPCall();
			return ret;
		}

		public bool QPYX_CallWithSelf_YXQP(BestHTTP.HTTPRequest QPYX_param_YXQP0, BestHTTP.HTTPResponse QPYX_param_YXQP1, System.Uri QPYX_param_YXQP2)
		{
			func.BeginPCall();
			func.Push(self);
			func.PushSealed(QPYX_param_YXQP0);
			func.PushObject(QPYX_param_YXQP1);
			func.PushObject(QPYX_param_YXQP2);
			func.PCall();
			bool ret = func.CheckBoolean();
			func.EndPCall();
			return ret;
		}
	}

	public BestHTTP.OnBeforeRedirectionDelegate QPYX_BestHTTP_OnBeforeRedirectionDelegate_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			BestHTTP.OnBeforeRedirectionDelegate fn_YXQP = delegate(BestHTTP.HTTPRequest QPYX_param_YXQP0, BestHTTP.HTTPResponse QPYX_param_YXQP1, System.Uri QPYX_param_YXQP2) { return false; };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_BestHTTP_OnBeforeRedirectionDelegate_YXQP_Event QPYX_target = new QPYX_BestHTTP_OnBeforeRedirectionDelegate_YXQP_Event(func_YXQP);
			BestHTTP.OnBeforeRedirectionDelegate QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_BestHTTP_OnBeforeRedirectionDelegate_YXQP_Event QPYX_target = new QPYX_BestHTTP_OnBeforeRedirectionDelegate_YXQP_Event(func_YXQP, self_YXQP);
			BestHTTP.OnBeforeRedirectionDelegate QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_BestHTTP_OnBeforeRedirectionDelegate_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(BestHTTP.OnBeforeRedirectionDelegate), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_BestHTTP_OnBeforeRedirectionDelegate_YXQP(IntPtr L_YXQP, BestHTTP.OnBeforeRedirectionDelegate o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_BestHTTP_OnBeforeHeaderSendDelegate_YXQP_Event : LuaDelegate
	{
		public QPYX_BestHTTP_OnBeforeHeaderSendDelegate_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_BestHTTP_OnBeforeHeaderSendDelegate_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(BestHTTP.HTTPRequest QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.PushSealed(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(BestHTTP.HTTPRequest QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.PushSealed(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}
	}

	public BestHTTP.OnBeforeHeaderSendDelegate QPYX_BestHTTP_OnBeforeHeaderSendDelegate_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			BestHTTP.OnBeforeHeaderSendDelegate fn_YXQP = delegate(BestHTTP.HTTPRequest QPYX_param_YXQP0) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_BestHTTP_OnBeforeHeaderSendDelegate_YXQP_Event QPYX_target = new QPYX_BestHTTP_OnBeforeHeaderSendDelegate_YXQP_Event(func_YXQP);
			BestHTTP.OnBeforeHeaderSendDelegate QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_BestHTTP_OnBeforeHeaderSendDelegate_YXQP_Event QPYX_target = new QPYX_BestHTTP_OnBeforeHeaderSendDelegate_YXQP_Event(func_YXQP, self_YXQP);
			BestHTTP.OnBeforeHeaderSendDelegate QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_BestHTTP_OnBeforeHeaderSendDelegate_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(BestHTTP.OnBeforeHeaderSendDelegate), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_BestHTTP_OnBeforeHeaderSendDelegate_YXQP(IntPtr L_YXQP, BestHTTP.OnBeforeHeaderSendDelegate o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_BestHTTP_OnHeaderEnumerationDelegate_YXQP_Event : LuaDelegate
	{
		public QPYX_BestHTTP_OnHeaderEnumerationDelegate_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_BestHTTP_OnHeaderEnumerationDelegate_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(string QPYX_param_YXQP0, System.Collections.Generic.List<string> QPYX_param_YXQP1)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.PushSealed(QPYX_param_YXQP1);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(string QPYX_param_YXQP0, System.Collections.Generic.List<string> QPYX_param_YXQP1)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.PushSealed(QPYX_param_YXQP1);
			func.PCall();
			func.EndPCall();
		}
	}

	public BestHTTP.OnHeaderEnumerationDelegate QPYX_BestHTTP_OnHeaderEnumerationDelegate_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			BestHTTP.OnHeaderEnumerationDelegate fn_YXQP = delegate(string QPYX_param_YXQP0, System.Collections.Generic.List<string> QPYX_param_YXQP1) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_BestHTTP_OnHeaderEnumerationDelegate_YXQP_Event QPYX_target = new QPYX_BestHTTP_OnHeaderEnumerationDelegate_YXQP_Event(func_YXQP);
			BestHTTP.OnHeaderEnumerationDelegate QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_BestHTTP_OnHeaderEnumerationDelegate_YXQP_Event QPYX_target = new QPYX_BestHTTP_OnHeaderEnumerationDelegate_YXQP_Event(func_YXQP, self_YXQP);
			BestHTTP.OnHeaderEnumerationDelegate QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_BestHTTP_OnHeaderEnumerationDelegate_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(BestHTTP.OnHeaderEnumerationDelegate), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_BestHTTP_OnHeaderEnumerationDelegate_YXQP(IntPtr L_YXQP, BestHTTP.OnHeaderEnumerationDelegate o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_System_Action_UnityEngine_AsyncOperation_YXQP_Event : LuaDelegate
	{
		public QPYX_System_Action_UnityEngine_AsyncOperation_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_System_Action_UnityEngine_AsyncOperation_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(UnityEngine.AsyncOperation QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.PushObject(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(UnityEngine.AsyncOperation QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.PushObject(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}
	}

	public System.Action<UnityEngine.AsyncOperation> QPYX_System_Action_UnityEngine_AsyncOperation_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			System.Action<UnityEngine.AsyncOperation> fn_YXQP = delegate(UnityEngine.AsyncOperation QPYX_param_YXQP0) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_System_Action_UnityEngine_AsyncOperation_YXQP_Event QPYX_target = new QPYX_System_Action_UnityEngine_AsyncOperation_YXQP_Event(func_YXQP);
			System.Action<UnityEngine.AsyncOperation> QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_System_Action_UnityEngine_AsyncOperation_YXQP_Event QPYX_target = new QPYX_System_Action_UnityEngine_AsyncOperation_YXQP_Event(func_YXQP, self_YXQP);
			System.Action<UnityEngine.AsyncOperation> QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_System_Action_UnityEngine_AsyncOperation_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(System.Action<UnityEngine.AsyncOperation>), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_System_Action_UnityEngine_AsyncOperation_YXQP(IntPtr L_YXQP, System.Action<UnityEngine.AsyncOperation> o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_UnityEngine_AudioClip_PCMReaderCallback_YXQP_Event : LuaDelegate
	{
		public QPYX_UnityEngine_AudioClip_PCMReaderCallback_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_UnityEngine_AudioClip_PCMReaderCallback_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(float[] QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(float[] QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}
	}

	public UnityEngine.AudioClip.PCMReaderCallback QPYX_UnityEngine_AudioClip_PCMReaderCallback_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			UnityEngine.AudioClip.PCMReaderCallback fn_YXQP = delegate(float[] QPYX_param_YXQP0) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_UnityEngine_AudioClip_PCMReaderCallback_YXQP_Event QPYX_target = new QPYX_UnityEngine_AudioClip_PCMReaderCallback_YXQP_Event(func_YXQP);
			UnityEngine.AudioClip.PCMReaderCallback QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_UnityEngine_AudioClip_PCMReaderCallback_YXQP_Event QPYX_target = new QPYX_UnityEngine_AudioClip_PCMReaderCallback_YXQP_Event(func_YXQP, self_YXQP);
			UnityEngine.AudioClip.PCMReaderCallback QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_UnityEngine_AudioClip_PCMReaderCallback_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(UnityEngine.AudioClip.PCMReaderCallback), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_UnityEngine_AudioClip_PCMReaderCallback_YXQP(IntPtr L_YXQP, UnityEngine.AudioClip.PCMReaderCallback o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

	class QPYX_UnityEngine_AudioClip_PCMSetPositionCallback_YXQP_Event : LuaDelegate
	{
		public QPYX_UnityEngine_AudioClip_PCMSetPositionCallback_YXQP_Event(LuaFunction func_YXQP) : base(func_YXQP) { }
		public QPYX_UnityEngine_AudioClip_PCMSetPositionCallback_YXQP_Event(LuaFunction func_YXQP, LuaTable self_YXQP) : base(func_YXQP, self_YXQP) { }

		public void QPYX_Call_YXQP(int QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}

		public void QPYX_CallWithSelf_YXQP(int QPYX_param_YXQP0)
		{
			func.BeginPCall();
			func.Push(self);
			func.Push(QPYX_param_YXQP0);
			func.PCall();
			func.EndPCall();
		}
	}

	public UnityEngine.AudioClip.PCMSetPositionCallback QPYX_UnityEngine_AudioClip_PCMSetPositionCallback_YXQP(LuaFunction func_YXQP, LuaTable self_YXQP, bool flag_YXQP)
	{
		if (func_YXQP == null)
		{
			UnityEngine.AudioClip.PCMSetPositionCallback fn_YXQP = delegate(int QPYX_param_YXQP0) { };
			return fn_YXQP;
		}

		if(!flag_YXQP)
		{
			QPYX_UnityEngine_AudioClip_PCMSetPositionCallback_YXQP_Event QPYX_target = new QPYX_UnityEngine_AudioClip_PCMSetPositionCallback_YXQP_Event(func_YXQP);
			UnityEngine.AudioClip.PCMSetPositionCallback QPYX_d = QPYX_target.QPYX_Call_YXQP;
			QPYX_target.method = QPYX_d.Method;
			return QPYX_d;		}
		else
		{
			QPYX_UnityEngine_AudioClip_PCMSetPositionCallback_YXQP_Event QPYX_target = new QPYX_UnityEngine_AudioClip_PCMSetPositionCallback_YXQP_Event(func_YXQP, self_YXQP);
			UnityEngine.AudioClip.PCMSetPositionCallback QPYX_d = QPYX_target.QPYX_CallWithSelf_YXQP;
			QPYX_target.method = QPYX_d.Method;			return QPYX_d;		}
	}

	bool QPYX_Check_UnityEngine_AudioClip_PCMSetPositionCallback_YXQP(IntPtr L_YXQP, int pos_YXQP)
	{
		return TypeChecker.CheckDelegateType(typeof(UnityEngine.AudioClip.PCMSetPositionCallback), L_YXQP, pos_YXQP);
	}

	void QPYX_Push_UnityEngine_AudioClip_PCMSetPositionCallback_YXQP(IntPtr L_YXQP, UnityEngine.AudioClip.PCMSetPositionCallback o_YXQP)
	{
		ToLua.Push(L_YXQP, o_YXQP);	}

}

