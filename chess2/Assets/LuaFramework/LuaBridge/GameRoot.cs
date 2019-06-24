using UnityEngine;
using System.Collections;
using UnityEngine.EventSystems;
using UnityEngine.UI;


public class GameRoot : MonoSingletonProject<GameRoot> {
    /// <summary> UI物体 </summary>
    public class UI {
        public Transform root { get; set; }

        public Camera uiCamera { get; set; }

        public Transform windowParent { get; set; }

        public Transform windowTestParent { get; set; }

        public Canvas canvasBaseOther { get; set; }

        public Transform canvasRoot { get; set; }
        public Transform canvasLow { get; set; }
        public Transform canvasMiddle { get; set; }
        public Transform canvasHigh { get; set; }
        public Transform canvasHighest { get; set; }

        /// <summary> poolParent的父物体 </summary>
        public Transform poolParent { get; set; }

        public Vector2 canvasSizeDelta {
            get { return canvasRoot.GetComponent<RectTransform>().sizeDelta; }
        }
    }

    public UI ui;

    const int ReferenceResolutionWidth = 1280;
    //需要适配的高度
    const int ReferenceResolutionHeight = 720;


    // The log base doesn't have any influence on the results whatsoever, as long as the same base is used everywhere.
    private const float kLogBase = 2;

    [Tooltip("Determines if the scaling is using the width or height as reference, or a mix in between.")]
    [Range(0, 1)]
    protected float m_MatchWidthOrHeight = 0;


    protected override void OnAwake() {
        ui = new UI();
        Init();
        CanvasScaler canvasScaler;
    }

    void Init() {
        Transform gameRoot = transform;
        ui.windowTestParent = gameRoot.Find("Game/UIRoot/UIWindowParent/Canvas/TestWindow");
        ui.uiCamera = gameRoot.Find("Game/UIRoot/UICamera").GetComponent<Camera>();

        ui.root = gameRoot.Find("Game/UIRoot");
        ui.windowParent = ui.root.Find("UIWindowParent");
        ui.canvasBaseOther = ui.root.Find("UIWindowParent/CanvasOther").GetComponent<Canvas>();
        ui.canvasBaseOther.enabled = false;
        ui.poolParent = ui.root.Find("UIWindowParent/Pool");

        ui.canvasRoot = ui.root.Find("UIWindowParent/Canvas");
        ui.canvasLow = ui.root.Find("UIWindowParent/Canvas/Low");
        ui.canvasMiddle = ui.root.Find("UIWindowParent/Canvas/Middle");
        ui.canvasHigh = ui.root.Find("UIWindowParent/Canvas/High");
        ui.canvasHighest = ui.root.Find("UIWindowParent/Canvas/Highest");

#if UNITY_EDITOR
        if (!GameConfigProject.instance.testView)
        {
            ScreenSmartScaleWidth();
        }
        UnityEditor.Selection.activeGameObject = ui.canvasRoot.gameObject;
#else
        ScreenSmartScaleWidth();
#endif

    }

    //屏幕适配
    public void ScreenSmartScale() {
        //0.0015625
        var rectTransform = ui.canvasRoot as RectTransform;
        float scale = 2f / ReferenceResolutionWidth;

        float radio = Screen.width / (float)Screen.height;
        rectTransform.sizeDelta = new Vector2(ReferenceResolutionHeight * radio, ReferenceResolutionHeight);
        rectTransform.localScale = new Vector3(scale, scale, scale);
        rectTransform.anchoredPosition = Vector2.zero;
    }

    public void ScreenSmartScaleWidth() {
        var rectTransform = ui.canvasRoot as RectTransform;
        float radio = (float)Screen.height / Screen.width;
        float scale = HandleScaleWithScreenSize();

        rectTransform.sizeDelta = new Vector2(ReferenceResolutionWidth, ReferenceResolutionWidth * radio);
        rectTransform.localScale = new Vector3(scale, scale, scale);
        rectTransform.anchoredPosition = Vector2.zero;
    }

    protected virtual float HandleScaleWithScreenSize() {
        Vector2 screenSize = new Vector2(Screen.width, Screen.height);
        float scaleFactor = 0;
        // We take the log of the relative width and height before taking the average.
        // Then we transform it back in the original space.
        // the reason to transform in and out of logarithmic space is to have better behavior.
        // If one axis has twice resolution and the other has half, it should even out if widthOrHeight value is at 0.5.
        // In normal space the average would be (0.5 + 2) / 2 = 1.25
        // In logarithmic space the average is (-1 + 1) / 2 = 0
        float logWidth = Mathf.Log(screenSize.x / ReferenceResolutionWidth, kLogBase);
        float logHeight = Mathf.Log(screenSize.y / ReferenceResolutionHeight, kLogBase);
        float logWeightedAverage = Mathf.Lerp(logWidth, logHeight, m_MatchWidthOrHeight);
        scaleFactor = Mathf.Pow(kLogBase, logWeightedAverage);
        return scaleFactor * 2 / screenSize.y;
    }

#if UNITY_EDITOR
    private CanvasScaler canvaScaler;
    private float lastwidth = 0f;
    private float lastheight = 0f;

    private void OnGUI()
    {
        if (canvaScaler == null) {
            canvaScaler = transform.Find("Game/UIRoot/UIWindowParent/Canvas/TestWindow").GetComponent<CanvasScaler>();
        }
        if (lastwidth != Screen.width || lastheight != Screen.height)
        {            
            lastwidth = Screen.width;
            lastheight = Screen.height;

            

            if (Screen.width >= 1920) {
                canvaScaler.referenceResolution = new Vector2(1920, 1080);
            } else {
                canvaScaler.referenceResolution = new Vector2(1280, 720);
            }

            if (UnityEngine.Screen.width * 1.0 / UnityEngine.Screen.height > 1.8) {
                canvaScaler.matchWidthOrHeight = 1;
            } else {
                canvaScaler.matchWidthOrHeight = 0;
            }
        }
    }
#endif
}
