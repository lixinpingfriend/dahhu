#define USING_DOTWEENING
using System;
using System.Collections.Generic;
using System.IO;
using DG.Tweening;
using DG.Tweening.Plugins.Options;
using GameAsset;
using LuaInterface;
using UGUIExtend;
using UnityEngine;
using UnityEngine.Events;
using AsyncOperation = UnityEngine.AsyncOperation;
using Object = System.Object;
using UnityEngine.EventSystems;
using littlerbird.units;
using littlerbird.UI;
using littlerbird;
using Debugger = LuaInterface.Debugger;
using DG.Tweening.Core;
using UnityEngine.Networking;
using UnityEditor;

public static class CustomSettings
{
    public static string saveDir = Application.dataPath + "/LuaFramework/ToLua/Source/Generate/";
    public static string toluaBaseType = Application.dataPath + "/ToLua/BaseType/";
    public static string baseLuaDir = Application.dataPath + "/Tolua/Lua/";
    public static string injectionFilesPath = Application.dataPath + "/ToLua/Injection/";

    static string customClassNamespace = "LuaBridge";

    //导出时强制做为静态类的类型(注意customTypeList 还要添加这个类型才能导出)
    //unity 有些类作为sealed class, 其实完全等价于静态类
    public static List<Type> staticClassTypes = new List<Type>
    {
        typeof(Application),
        typeof(Time),
        typeof(Mathf),
        typeof(Screen),
        typeof(SleepTimeout),
        typeof(Input),
        typeof(PlayerPrefs),
        typeof(WWWUtil),
        typeof(SecurityUtil),
        typeof(FileUtility),
        typeof(ImageConversion)
    };

    //附加导出委托类型(在导出委托时, customTypeList 中牵扯的委托类型都会导出， 无需写在这里)
    public static DelegateType[] customDelegateList =
    {
        _DT(typeof(Action)),
        _DT(typeof(Action<int>)),
        _DT(typeof(Action<string>)),
        _DT(typeof(Predicate<int>)),
        _DT(typeof(Comparison<int>)),
        //_DT(typeof(UnityEvent)),
        //_DT(typeof(UnityEvent<float>)),


        //游戏自定义导出
        _DT(typeof(UnityAction)),
        _DT(typeof(UnityAction<string>)),
        _DT(typeof(UnityAction<float>)),
        _DT(typeof(UnityAction<bool>)),
        _DT(typeof(UnityAction<int>)),
        _DT(typeof(UnityAction<Vector2>)),
        // _DT(typeof(Action<WWWOperation>)),
        // _DT(typeof(EventTriggerListener.VoidDelegate)),        
#if USING_DOTWEENING
        _DT(typeof(TweenCallback)),
        _DT(typeof(DG.Tweening.Core.DOGetter<float>)),
        _DT(typeof(DG.Tweening.Core.DOSetter<float>)),
#endif
        

    };

    //在这里添加你要导出注册到lua的类型列表
    public static ToLuaMenu.BindType[] customTypeList =
    {                
        //------------------------为例子导出--------------------------------
        //_GT(typeof(TestEventListener)),
        //_GT(typeof(TestProtol)),
        //_GT(typeof(TestAccount)),
        //_GT(typeof(Dictionary<int, TestAccount>)).SetLibName("AccountMap"),
        //_GT(typeof(KeyValuePair<int, TestAccount>)),    
        //_GT(typeof(TestExport)),
        //_GT(typeof(TestExport.Space)),
        //-------------------------------------------------------------------      
        
        //--------------------- 游戏自定义导入 -
        _GT(typeof(WebViewObject)),
        _GT(typeof(TextAsset)),
        _GT(typeof(ThreadPriority)),
        // _GT(typeof(AssetBundleManifest)),
        _GT(typeof(GameSDKInterface)).SetNameSpace(customClassNamespace),
        _GT(typeof(GameSDKCallback)).SetNameSpace(customClassNamespace),
        _GT(typeof(GameConfigProject)).SetNameSpace(customClassNamespace),
        _GT(typeof(MonoSingletonProject<GameConfigProject>)),
        _GT(typeof(GameUGUIEventDispatcher)),
        _GT(typeof(NetworkManager)).SetNameSpace(customClassNamespace),
        _GT(typeof(SmartTimer)).SetNameSpace(customClassNamespace),
        _GT(typeof(TimeEvent)).SetNameSpace(customClassNamespace),
        _GT(typeof(DNet.GameWebSocketClient)).SetNameSpace(customClassNamespace),
        _GT(typeof(DNet.Buffer)).SetNameSpace(customClassNamespace),
        _GT(typeof(DNet.VideoData)).SetNameSpace(customClassNamespace),
        _GT(typeof(DNet.VideoFrameData)).SetNameSpace(customClassNamespace),
        _GT(typeof(ViewUtil)).SetNameSpace(customClassNamespace),
        _GT(typeof(SingletonProject<AssetBundleManager>)),
        _GT(typeof(AssetBundleManager)).SetNameSpace(customClassNamespace),
        _GT(typeof(SimulateLoadedAssetBundle)).SetNameSpace(customClassNamespace),
        _GT(typeof(LoadedAssetBundle)).SetNameSpace(customClassNamespace),
        _GT(typeof(LuaHelper)).SetNameSpace(customClassNamespace),
        _GT(typeof(ComponentUtil)).SetNameSpace(customClassNamespace),
        _GT(typeof(TransformUtil)).SetNameSpace(customClassNamespace),
        _GT(typeof(CustomerUtil)).SetNameSpace(customClassNamespace),
        _GT(typeof(GameEventCollector)).SetNameSpace(customClassNamespace),
        _GT(typeof(GameModule)).SetNameSpace(customClassNamespace),
        _GT(typeof(GameEventTriggerClickListener)).SetNameSpace(customClassNamespace),
        _GT(typeof(CanvasData)).SetNameSpace(customClassNamespace),
        
        // _GT(typeof(EventTriggerListener)).SetNameSpace(customClassNamespace),
        _GT(typeof(PointerEventData)).SetNameSpace(customClassNamespace),
        _GT(typeof(DynamicPrefable)),

        _GT(typeof(WWWOperation)).SetNameSpace(customClassNamespace),
        //_GT(typeof(VoiceChatManager)).SetNameSpace(customClassNamespace),
        //--------------------------------------
        _GT(typeof(WWWUtil)).SetNameSpace(customClassNamespace),
        _GT(typeof(BestHttpOperation)).SetNameSpace(customClassNamespace),
        _GT(typeof(BestHttpUtil)).SetNameSpace(customClassNamespace),
        _GT(typeof(AudioPlayOperation)).SetNameSpace(customClassNamespace),
        _GT(typeof(AudioPlayUtil)).SetNameSpace(customClassNamespace),
        _GT(typeof(WavUtility)).SetNameSpace(customClassNamespace),
        _GT(typeof(AsyncFileOperationData)).SetNameSpace(customClassNamespace),
        _GT(typeof(AsyncFileUtil)).SetNameSpace(customClassNamespace),
        _GT(typeof(SecurityUtil)).SetNameSpace(customClassNamespace),
        _GT(typeof(FileUtility)).SetNameSpace(customClassNamespace),
        _GT(typeof(EmojiUtil)).SetNameSpace(customClassNamespace),
        // _GT(typeof(UniWebView)),
        _GT(typeof(UniWebViewEx)),
        _GT(typeof(UniWebViewMessage)),

        _GT(typeof(PlayerPrefs)),
        _GT(typeof(Canvas)),
        _GT(typeof(CanvasGroup)).AddExtendType(typeof(ShortcutExtensions46)),

        _GT(typeof(UnityEvent)),
        _GT(typeof(UnityEvent<float>)),

        _GT(typeof(TextWrapEx)),
        _GT(typeof(TextWrap)),
        _GT(typeof(RenderSettings)),
        _GT(typeof(QualitySettings)),

        _GT(typeof(TextureScaler)).SetNameSpace(customClassNamespace),

        _GT(typeof(ComponentCache)),
        _GT(typeof(ComponentCache.GameObject_Injection)),
        _GT(typeof(ComponentCache.Transform_Injection)),
        _GT(typeof(ComponentCache.RectTransform_Injection)),
        _GT(typeof(ComponentCache.Image_Injection)),
        _GT(typeof(ComponentCache.Text_Injection)),
        _GT(typeof(ComponentCache.Toggle_Injection)),
        _GT(typeof(ComponentCache.ToggleEvent_Injection)),
        _GT(typeof(ComponentCache.Button_Injection)),
        _GT(typeof(ComponentCache.Slider_Injection)),
        _GT(typeof(ComponentCache.ToggleGroup_Injection)),
        _GT(typeof(ComponentCache.InputField_Injection)),
        _GT(typeof(ComponentCache.Graphic_Injection)),
        _GT(typeof(ComponentCache.ScrollRect_Injection)),
        _GT(typeof(ComponentCache.Scrollbar_Injection)),
        _GT(typeof(ComponentCache.Dropdown_Injection)),
        _GT(typeof(ComponentCache.GridLayoutGroup_Injection)),
        _GT(typeof(ComponentCache.RawImage_Injection)),
        _GT(typeof(ComponentCache.AudioSource_Injection)),
        _GT(typeof(ComponentCache.Animation_Injection)),
        _GT(typeof(ComponentCache.Animator_Injection)),
        _GT(typeof(ComponentCache.SpriteAtlas_Injection)),
        _GT(typeof(ComponentCache.SpriteHolder_Injection)),
        _GT(typeof(ComponentCache.UIStateSwitcher_Injection)),
        _GT(typeof(ComponentCache.TextWrap_Injection)),
        _GT(typeof(ComponentCache.UIImageAnimation_Injection)),
        _GT(typeof(ComponentCache.ComponentCache_Injection)),

        _GT(typeof(LoopScrollView)).SetNameSpace(customClassNamespace),
        _GT(typeof(LoopBaseNode)).SetNameSpace(customClassNamespace),
        _GT(typeof(LoopScrollView.OnDataChangeEvent)).SetNameSpace(customClassNamespace),
        _GT(typeof(LoopScrollView.OnContentPosChangeEvent)).SetNameSpace(customClassNamespace),
        _GT(typeof(GVoiceManager)).SetNameSpace(customClassNamespace),
        // _GT(typeof(GVoiceStatus)).SetNameSpace(customClassNamespace),
        _GT(typeof(gcloud_voice.GCloudVoice)),
        _GT(typeof(gcloud_voice.IGCloudVoice)),
        _GT(typeof(gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode)),
        _GT(typeof(gcloud_voice.GCloudVoiceEvent)),
        _GT(typeof(ScrollMove)).SetNameSpace(customClassNamespace),
        _GT(typeof(UIStateSwitcher)),
        _GT(typeof(ToggleCtrl)),
        _GT(typeof(SpriteHolder)),
        _GT(typeof(UIImageAnimation)),

        //导入quickGrid
        _GT(typeof(QuickGrid)),
        _GT(typeof(QuickGridItemBase)),

        _GT(typeof(TweenButton)),

          //导入simpleScrollview
        _GT(typeof(SimpleScrollView)),
        _GT(typeof(SimpleItemBase)),
        //-----------------------导入UGUI-------------
        _GT(typeof(RectTransform)),
        _GT(typeof(Rect)),
        _GT(typeof(Sprite)),
        _GT(typeof(RectOffset)),
        _GT(typeof(UnityEngine.UI.Text)),
        _GT(typeof(UnityEngine.UI.Toggle)),
        _GT(typeof(UnityEngine.UI.Toggle.ToggleEvent)),
        _GT(typeof(UnityEngine.UI.Image)).AddExtendType(typeof(DG.Tweening.ShortcutExtensions46)),
        _GT(typeof(UnityEngine.UI.Button)),
        _GT(typeof(UnityEngine.UI.Slider)),
        _GT(typeof(UnityEngine.UI.ToggleGroup)),
        _GT(typeof(UnityEngine.UI.InputField)),
        // _GT(typeof(UnityEngine.UI.InputField.OnValidateInput)),
        _GT(typeof(UnityEngine.UI.InputField.OnChangeEvent)),
        _GT(typeof(UnityEngine.UI.Graphic)),
        _GT(typeof(UnityEngine.UI.ScrollRect)),
        _GT(typeof(UnityEngine.UI.Scrollbar)),
        _GT(typeof(UnityEngine.UI.Dropdown)),
        _GT(typeof(UnityEngine.UI.Dropdown.OptionData)),
        _GT(typeof(UnityEngine.UI.Dropdown.OptionDataList)),
        _GT(typeof(UnityEngine.UI.Dropdown.DropdownEvent)),
        _GT(typeof(UnityEngine.TextAnchor)),
        _GT(typeof(UnityEngine.UI.GridLayoutGroup)),
        _GT(typeof(UnityEngine.UI.RawImage)),
        _GT(typeof(UnityEngine.UI.ContentSizeFitter)),
        _GT(typeof(UnityEngine.UI.ContentSizeFitter.FitMode)),
        _GT(typeof(UnityEngine.UI.LayoutRebuilder)),
        _GT(typeof(UnityEngine.UI.ScrollRect.ScrollRectEvent)),
        _GT(typeof(UnityEngine.UI.Outline)),
        _GT(typeof(UnityEngine.UI.LayoutElement)),
        _GT(typeof(UnityEngine.UI.VerticalLayoutGroup)),
        _GT(typeof(UnityEngine.UI.HorizontalLayoutGroup)),
        _GT(typeof(UnityEngine.UI.Button.ButtonClickedEvent)),
        _GT(typeof(EmojiText)),
        //----------------------------------------------------------

        // _GT(typeof(UGUITextBackgroundAdaptiveSacle)),

        _GT(typeof(Debugger)).SetNameSpace(null),       

#if USING_DOTWEENING
        _GT(typeof(DOTween)),
        _GT(typeof(Tween)).SetBaseType(typeof(Object)).AddExtendType(typeof(TweenExtensions)),
        _GT(typeof(Sequence)).AddExtendType(typeof(TweenSettingsExtensions)),
        _GT(typeof(Tweener)).AddExtendType(typeof(TweenSettingsExtensions)),
        _GT(typeof(LoopType)),
        _GT(typeof(PathMode)),
        _GT(typeof(PathType)),
        _GT(typeof(RotateMode)),
        _GT(typeof(Component)).AddExtendType(typeof(DG.Tweening.ShortcutExtensions)),
        _GT(typeof(Transform)).AddExtendType(typeof(DG.Tweening.ShortcutExtensions)),
        // _GT(typeof(Light)).AddExtendType(typeof(DG.Tweening.ShortcutExtensions)),
        // _GT(typeof(Material)).AddExtendType(typeof(DG.Tweening.ShortcutExtensions)),
        // _GT(typeof(Rigidbody)).AddExtendType(typeof(DG.Tweening.ShortcutExtensions)),
        _GT(typeof(Camera)).AddExtendType(typeof(DG.Tweening.ShortcutExtensions)),
        _GT(typeof(AudioSource)).AddExtendType(typeof(DG.Tweening.ShortcutExtensions)),
        _GT(typeof(DG.Tweening.Core.TweenerCore<float, float, FloatOptions>)),
        _GT(typeof(DG.Tweening.Core.TweenerCore<Quaternion, Vector3, PathOptions>)),
        _GT(typeof(DG.Tweening.Core.TweenerCore<Vector3, DG.Tweening.Plugins.Core.PathCore.Path, QuaternionOptions>)),
        _GT(typeof(DG.Tweening.Core.TweenerCore<Vector3, Vector3, VectorOptions>)).SetWrapName("TweenerCoreV3V3VO").SetLibName("TweenerCoreV3V3VO"),
        //_GT(typeof(LineRenderer)).AddExtendType(typeof(DG.Tweening.ShortcutExtensions)),
        //_GT(typeof(TrailRenderer)).AddExtendType(typeof(DG.Tweening.ShortcutExtensions)),    
        _GT(typeof(Ease)),
        _GT(typeof(DOTweenAnimation)),
        _GT(typeof(DOTweenPath)),
#else
                                         
        _GT(typeof(Component)),
        _GT(typeof(Transform)),
        // _GT(typeof(Material)),
        // _GT(typeof(Light)),
        // _GT(typeof(Rigidbody)),
        _GT(typeof(Camera)),
        _GT(typeof(AudioSource)),
        //_GT(typeof(LineRenderer))
        //_GT(typeof(TrailRenderer))
#endif
      
        _GT(typeof(Behaviour)),
        _GT(typeof(MonoBehaviour)),
        _GT(typeof(GameObject)),
        // _GT(typeof(TrackedReference)),
        _GT(typeof(Application)),
        _GT(typeof(ImageConversion)),
        _GT(typeof(Physics)),
        _GT(typeof(Collider)),
        _GT(typeof(Time)),
		_GT(typeof(Debug)),

        _GT(typeof(Texture)),
        _GT(typeof(Texture2D)).SetBaseType(typeof(Texture)),

        // _GT(typeof(TextureFormat)),
        // _GT(typeof(Shader)),        
        // _GT(typeof(Renderer)),
        _GT(typeof(WWW)),
        _GT(typeof(WWWForm)),

        _GT(typeof(BestHTTP.HTTPRequest)),
        _GT(typeof(BestHTTP.HTTPResponse)),

        _GT(typeof(UnityWebRequest)),
        _GT(typeof(UnityWebRequestAsyncOperation)),
        _GT(typeof(UnityWebRequestTexture)),
        _GT(typeof(UploadHandler)),
        _GT(typeof(DownloadHandler)),
        _GT(typeof(DownloadHandlerTexture)),
        _GT(typeof(DownloadHandlerFile)),
        _GT(typeof(DownloadHandlerAssetBundle)),
        _GT(typeof(DownloadHandlerBuffer)),
        _GT(typeof(DownloadHandlerAudioClip)),
        _GT(typeof(Screen)),
        _GT(typeof(ScreenOrientation)),
        _GT(typeof(CameraClearFlags)),
        _GT(typeof(AudioClip)),
        _GT(typeof(Microphone)),
        _GT(typeof(iPhoneSpeaker)),
        _GT(typeof(AssetBundle)),
        _GT(typeof(ParticleSystem)),
        _GT(typeof(ParticleSystemRenderer)),
        _GT(typeof(AsyncOperation)).SetBaseType(typeof(Object)),        
        // _GT(typeof(LightType)),
        _GT(typeof(SleepTimeout)),
        _GT(typeof(Animator)),
        _GT(typeof(Input)),
        _GT(typeof(KeyCode)),
        _GT(typeof(SkinnedMeshRenderer)),
        // _GT(typeof(Space)),      

        _GT(typeof(MeshRenderer)),            
             
        //暂时没用到   
        _GT(typeof(BoxCollider)),
        _GT(typeof(PolygonCollider2D)),
        //_GT(typeof(MeshCollider)),
        //_GT(typeof(SphereCollider)),        
        //_GT(typeof(CharacterController)),
        //_GT(typeof(CapsuleCollider)),
        
        _GT(typeof(Animation)),
        _GT(typeof(AnimationClip)).SetBaseType(typeof(UnityEngine.Object)),
        _GT(typeof(AnimationState)),
        _GT(typeof(AnimationBlendMode)),
        _GT(typeof(QueueMode)),
        _GT(typeof(PlayMode)),
        _GT(typeof(WrapMode)),

        _GT(typeof(RenderTexture)),
        _GT(typeof(RenderTextureFormat)),
        _GT(typeof(Material)),

    };

    //一定注意staticClassTypes 中定义的类不能使用dynamic动态加载
    public static List<Type> dynamicList = new List<Type> {
        typeof(WebViewObject),
        typeof(TextAsset),
        typeof(ThreadPriority),
        
        typeof(DynamicPrefable),
        typeof(TextureScaler),
        
        // typeof(ShareSDK),
        // typeof(ShareContent),

        typeof(RectOffset),

        typeof(GVoiceManager),
        typeof(gcloud_voice.GCloudVoice),
        typeof(gcloud_voice.IGCloudVoice),
        typeof(gcloud_voice.IGCloudVoice.GCloudVoiceCompleteCode),
        typeof(gcloud_voice.GCloudVoiceEvent),
        
        typeof(RenderSettings),
        typeof(QualitySettings),

        typeof(MeshRenderer),
        typeof(ParticleSystem),
        typeof(ParticleSystemRenderer),

        typeof(QuickGrid),
        typeof(QuickGridItemBase),
        
        typeof(TweenButton),
        typeof(UnityEngine.TextAnchor),

        typeof(GameEventCollector),
        typeof(GameModule),
        typeof(CanvasData),
        //暂时没用到   
        typeof(Physics),
        typeof(Collider),
        typeof(BoxCollider),
        typeof(GameEventTriggerClickListener),
        typeof(PolygonCollider2D),
        //typeof(MeshCollider),
        //typeof(SphereCollider),
        //typeof(CharacterController),
        //typeof(CapsuleCollider),
        // typeof(UniWebView),
        typeof(UniWebViewEx),
        typeof(UniWebViewMessage),

        typeof(iPhoneSpeaker),

        typeof(EmojiText),

        // typeof(TrackedReference),
        // typeof(Collider),


        //导入simpleScrollview
        typeof(SimpleScrollView),
        typeof(SimpleItemBase),
        
        typeof(BestHTTP.HTTPRequest),
        typeof(BestHTTP.HTTPResponse),

        typeof(UnityWebRequest),
        typeof(UnityWebRequestAsyncOperation),
        typeof(UnityWebRequestTexture),
        typeof(UploadHandler),
        typeof(DownloadHandler),
        typeof(DownloadHandlerTexture),
        typeof(DownloadHandlerFile),
        typeof(DownloadHandlerAssetBundle),
        typeof(DownloadHandlerBuffer),
        typeof(DownloadHandlerAudioClip),
        typeof(ScreenOrientation),

        typeof(Texture),
        typeof(Material),
        typeof(Texture2D),
        // typeof(TextureFormat),
        // typeof(Shader),
        // typeof(Renderer),
        typeof(CameraClearFlags),
        typeof(AsyncOperation),
        // typeof(LightType),

        typeof(Animator),
        typeof(KeyCode),
        typeof(SkinnedMeshRenderer),
        // typeof(Space),

        typeof(Animation),
        typeof(AnimationClip),
        typeof(AnimationState),
        typeof(AnimationBlendMode),
        typeof(QueueMode),
        typeof(PlayMode),
        typeof(WrapMode),
        
        typeof(ABSAnimationComponent),
        typeof(DOTweenAnimation),
        typeof(DOTweenPath),

        // typeof(BlendWeights),
        typeof(RenderTexture),
        typeof(RenderTextureFormat),
        // typeof(Rigidbody),
        // typeof(AssetBundleManifest),
        typeof(SimulateLoadedAssetBundle),

        typeof(UnityEngine.UI.LayoutElement),
        typeof(UnityEngine.UI.VerticalLayoutGroup),
        typeof(UnityEngine.UI.HorizontalLayoutGroup),
        
        typeof(ComponentCache),
        typeof(ComponentCache.GameObject_Injection),
        typeof(ComponentCache.Transform_Injection),
        typeof(ComponentCache.RectTransform_Injection),
        typeof(ComponentCache.Image_Injection),
        typeof(ComponentCache.Text_Injection),
        typeof(ComponentCache.Toggle_Injection),
        typeof(ComponentCache.ToggleEvent_Injection),
        typeof(ComponentCache.Button_Injection),
        typeof(ComponentCache.Slider_Injection),
        typeof(ComponentCache.ToggleGroup_Injection),
        typeof(ComponentCache.InputField_Injection),
        typeof(ComponentCache.Graphic_Injection),
        typeof(ComponentCache.ScrollRect_Injection),
        typeof(ComponentCache.Scrollbar_Injection),
        typeof(ComponentCache.Dropdown_Injection),
        typeof(ComponentCache.GridLayoutGroup_Injection),
        typeof(ComponentCache.RawImage_Injection),
        typeof(ComponentCache.AudioSource_Injection),
        typeof(ComponentCache.Animation_Injection),
        typeof(ComponentCache.Animator_Injection),
        typeof(ComponentCache.SpriteAtlas_Injection),
        typeof(ComponentCache.SpriteHolder_Injection),
        typeof(ComponentCache.UIStateSwitcher_Injection),
        typeof(ComponentCache.TextWrap_Injection),
        typeof(ComponentCache.UIImageAnimation_Injection),
        typeof(ComponentCache.ComponentCache_Injection)
    };
    

    //重载函数，相同参数个数，相同位置out参数匹配出问题时, 需要强制匹配解决
    //使用方法参见例子14
    public static List<Type> outList = new List<Type>();

    //ngui优化，下面的类没有派生类，可以作为sealed class
    public static List<Type> sealedList = new List<Type>()
    {
        /*typeof(Transform),
        typeof(UIRoot),
        typeof(UICamera),
        typeof(UIViewport),
        typeof(UIPanel),
        typeof(UILabel),
        typeof(UIAnchor),
        typeof(UIAtlas),
        typeof(UIFont),
        typeof(UITexture),
        typeof(UISprite),
        typeof(UIGrid),
        typeof(UITable),
        typeof(UIWrapGrid),
        typeof(UIInput),
        typeof(UIScrollView),
        typeof(UIEventListener),
        typeof(UIScrollBar),
        typeof(UICenterOnChild),
        typeof(UIScrollView),        
        typeof(UIButton),
        typeof(UITextList),
        typeof(UIPlayTween),
        typeof(UIDragScrollView),
        typeof(UISpriteAnimation),
        typeof(UIWrapContent),
        typeof(TweenWidth),
        typeof(TweenAlpha),
        typeof(TweenColor),
        typeof(TweenRotation),
        typeof(TweenPosition),
        typeof(TweenScale),
        typeof(TweenHeight),
        typeof(TypewriterEffect),
        typeof(UIToggle),
        typeof(Localization),*/
    };

    public static ToLuaMenu.BindType _GT(Type t)
    {
        return new ToLuaMenu.BindType(t);
    }

    public static DelegateType _DT(Type t)
    {
        return new DelegateType(t);
    }

    [MenuItem("Lua/Attach Profiler", false, 151)]
    static void AttachProfiler()
    {
        if (!Application.isPlaying)
        {
            EditorUtility.DisplayDialog("警告", "请在运行时执行此功能", "确定");
            return;
        }

        LuaClient.Instance.AttachProfiler();
    }

    [MenuItem("Lua/Detach Profiler", false, 152)]
    static void DetachProfiler()
    {
        if (!Application.isPlaying)
        {            
            return;
        }

        LuaClient.Instance.DetachProfiler();
    }
}
