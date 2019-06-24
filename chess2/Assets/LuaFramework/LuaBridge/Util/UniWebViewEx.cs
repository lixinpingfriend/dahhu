using System;
using LuaInterface;
using UnityEngine;
using System.Collections.Generic;

public class UniWebViewEx : MonoBehaviour
{
    public UniWebView uniWebView;

    public LuaFunction onLoadComplete;
    
    public LuaFunction onReceivedMessage;
    public LuaFunction onEvalJavaScriptFinished;
    public LuaFunction onReceivedKeyCode;

    private int[] mWebViewRect = new int[4];
    

    public void Init()
    {
#if UNITY_IOS || UNITY_ANDROID || UNITY_EDITOR
        uniWebView = gameObject.GetComponent<UniWebView>();
        if(uniWebView == null)
            uniWebView = gameObject.AddComponent<UniWebView>();
        uniWebView.backButtonEnable = false;
        uniWebView.SetBackgroundColor(new Color(0f, 0f, 0f, 0f));
        uniWebView.SetShowSpinnerWhenLoading(false);
        uniWebView.immersiveMode = false;
        uniWebView.OnLoadComplete += (x, y, z) => {
            if (onLoadComplete != null) {
                onLoadComplete.Call(y, z);
            }
        };
        uniWebView.OnReceivedMessage += (x, y) => {
            if (onReceivedMessage != null) {
                onReceivedMessage.Call(y.table);
            }
        };

        uniWebView.OnEvalJavaScriptFinished += (x, y) => {
            if (onEvalJavaScriptFinished != null) {
                onEvalJavaScriptFinished.Call(y);
            }
        };

        uniWebView.OnReceivedKeyCode += (x, y) => {
            if (onReceivedKeyCode != null) {
                onReceivedKeyCode.Call(y);
            }
        };
#endif
    }

    public void SetBackgroundColor(float r, float g, float b, float a) {
#if UNITY_IOS || UNITY_ANDROID || UNITY_EDITOR
        uniWebView.SetBackgroundColor(new Color(0f, 0f, 0f, 0f));
#endif
    }

    public bool zoomEnable {
        get {
#if UNITY_IOS || UNITY_ANDROID || UNITY_EDITOR
            return uniWebView.zoomEnable;
#endif
            return false;
        }
        set {
#if UNITY_IOS || UNITY_ANDROID || UNITY_EDITOR
            uniWebView.zoomEnable = value;
#endif
        }
    }


    public string userAgent {
        get {
#if UNITY_IOS || UNITY_ANDROID || UNITY_EDITOR
            return UniWebViewPlugin.GetUserAgent(gameObject.name);
#endif
            return "";
        }
    }

    public static void SetUserAgent(string value) {
#if UNITY_IOS || UNITY_ANDROID || UNITY_EDITOR
        UniWebViewPlugin.SetUserAgent(value);
#endif
    }

    public void LoadHTMLString(string htmlString, string baseUrl) {
#if UNITY_IOS || UNITY_ANDROID || UNITY_EDITOR
        uniWebView.LoadHTMLString(htmlString, baseUrl);
#endif
    }

    public void EvaluatingJavaScript(string javaScript) {
#if UNITY_IOS || UNITY_ANDROID || UNITY_EDITOR
        uniWebView.EvaluatingJavaScript(javaScript);
#endif
    }


    public void AddJavaScript(string javaScript) {
#if UNITY_IOS || UNITY_ANDROID || UNITY_EDITOR
        uniWebView.AddJavaScript(javaScript);
#endif
    }

    public void CleanCache() {
#if UNITY_IOS || UNITY_ANDROID || UNITY_EDITOR
        uniWebView.CleanCache();
#endif
    }

    public static void SetCookie(string url, string cookie) {
#if UNITY_IOS || UNITY_ANDROID || UNITY_EDITOR
        UniWebViewPlugin.SetCookie(url, cookie);
#endif
    }

    public static string GetCookie(string url, string key) {
#if UNITY_IOS || UNITY_ANDROID || UNITY_EDITOR
        return UniWebViewPlugin.GetCookie(url, key);
#else
        return "";
#endif
    
    }

    public void AddPermissionRequestTrustSite(string url) {
        #if UNITY_ANDROID && !UNITY_EDITOR
        uniWebView.AddPermissionRequestTrustSite(url);
        #endif
    }

    public void AddUrlScheme(string scheme) {
#if UNITY_IOS || UNITY_ANDROID || UNITY_EDITOR
        uniWebView.AddUrlScheme(scheme);
#endif
    }

    public void RemoveUrlScheme(string scheme) {
#if UNITY_IOS || UNITY_ANDROID || UNITY_EDITOR
        uniWebView.RemoveUrlScheme(scheme);
#endif
    }

    public void SetHeaderField(string key, string value) {
#if UNITY_IOS || UNITY_ANDROID || UNITY_EDITOR
        uniWebView.SetHeaderField(key, value);
#endif
    }

    public void SetVerticalScrollBarShow(bool show) {
#if UNITY_IOS || UNITY_ANDROID || UNITY_EDITOR
        uniWebView.SetVerticalScrollBarShow(show);
#endif
    }

    public void SetHorizontalScrollBarShow(bool show) {
#if UNITY_IOS || UNITY_ANDROID || UNITY_EDITOR
        uniWebView.SetHorizontalScrollBarShow(show);
#endif
    }


    public void SetAllowInlinePlay(bool allowed) {
#if UNITY_IOS || UNITY_ANDROID || UNITY_EDITOR
        uniWebView.SetAllowInlinePlay(allowed);
#endif
    }

    public void SetAllowAutoPlay(bool allowed) {
#if UNITY_IOS || UNITY_ANDROID || UNITY_EDITOR
        uniWebView.SetAllowAutoPlay(allowed);
#endif
    }

    public void Stop() {
#if UNITY_IOS || UNITY_ANDROID || UNITY_EDITOR
        uniWebView.Stop();
#endif
    }

    public void Reload() {
#if UNITY_IOS || UNITY_ANDROID || UNITY_EDITOR
        uniWebView.Reload();
#endif
    }

    public bool CanGoBack() {
#if UNITY_IOS || UNITY_ANDROID || UNITY_EDITOR
        return uniWebView.CanGoBack();
#else
        return false;
#endif
    }
    public bool CanGoForward() {
#if UNITY_IOS || UNITY_ANDROID || UNITY_EDITOR
        return uniWebView.CanGoForward();
#else
        return false;
#endif
    }


    public void GoBack() {
#if UNITY_IOS || UNITY_ANDROID || UNITY_EDITOR
        uniWebView.GoBack();
#endif
    }

    public void GoForward() {
#if UNITY_IOS || UNITY_ANDROID || UNITY_EDITOR
        uniWebView.GoForward();
#endif
    }

    public void Load(string url)
    {
#if UNITY_IOS || UNITY_ANDROID || UNITY_EDITOR
        uniWebView.Load(url);
#endif
    }

    public void Show()
    {
#if UNITY_IOS || UNITY_ANDROID || UNITY_EDITOR
        uniWebView.Show();
#endif
    }

    public void Show(bool fade, int uniWebViewTransitionEdge, float duration, Action finishAction)
    {
#if UNITY_IOS || UNITY_ANDROID || UNITY_EDITOR
        uniWebView.Show(fade, (UniWebViewTransitionEdge)uniWebViewTransitionEdge, duration, finishAction);
#endif
    }

    public void Hide()
    {
#if UNITY_IOS || UNITY_ANDROID || UNITY_EDITOR
        uniWebView.Hide();
#endif
    }

    public void Hide(bool fade, int uniWebViewTransitionEdge, float duration, Action finishAction)
    {
#if UNITY_IOS || UNITY_ANDROID || UNITY_EDITOR
        uniWebView.Hide(fade, (UniWebViewTransitionEdge)uniWebViewTransitionEdge, duration, finishAction);
#endif
    }


    public void SetEdgeInsets(Camera camera, GameObject leftTop, GameObject rightBottom)
    {
#if UNITY_IOS || UNITY_ANDROID || UNITY_EDITOR
        Vector3 ltSp = camera.WorldToScreenPoint(leftTop.transform.position);
        Vector3 rbSp = camera.WorldToScreenPoint(rightBottom.transform.position);

        mWebViewRect[0] = ConvertPixelToPoint(Screen.height - (int)ltSp.y, false);
        mWebViewRect[1] = ConvertPixelToPoint((int)ltSp.x, true);
        mWebViewRect[2] = ConvertPixelToPoint((int)rbSp.y, false);
        mWebViewRect[3] = ConvertPixelToPoint(Screen.width - (int)rbSp.x, true);

        uniWebView.insets = new UniWebViewEdgeInsets(mWebViewRect[0], mWebViewRect[1], mWebViewRect[2], mWebViewRect[3]);
#endif
    }

    public void SetMargins(int top, int bottom, int left, int right)
    {
#if UNITY_IOS || UNITY_ANDROID || UNITY_EDITOR
		mWebViewRect[0] = top;
        mWebViewRect[1] = bottom;
        mWebViewRect[2] = left;
        mWebViewRect[3] = right;
        uniWebView.insets = new UniWebViewEdgeInsets(mWebViewRect[0], mWebViewRect[1], mWebViewRect[2], mWebViewRect[3]);
#endif
	}

	public static int ConvertPixelToPoint(float pixel, bool width)
    {
#if UNITY_IOS && !UNITY_EDITOR
        float scale = 0;        
        if (width) {            
            scale = 1f * screenWidth / Screen.width;
        } else {            
            scale = 1f * screenHeight / Screen.height;       
        }        
        return (int)(pixel * scale);
#endif
        return (int)pixel;
    }

    /// <summary>
    /// Get the height of the screen.
    /// </summary>
    /// <value>
    /// The height of screen.
    /// </value>
    /// <description>
    /// In iOS devices, it will always return the screen width in "point", 
    /// instead of "pixel". It would be useful to use this value to calculate webview size.
    /// On other platforms, it will just return Unity's Screen.height.
    /// For example, a portrait iPhone 5 will return 320 and a landscape one 568. You should 
    /// always use this value to do screen-size-based insets calculation.
    /// </description>
    public static int screenWidth
    {
        get
        {
#if UNITY_IOS && !UNITY_EDITOR
            return UniWebViewPlugin.ScreenWidth();
#else
            return Screen.width;
#endif
        }
    }

    /// <summary>
    /// Get the height of the screen.
    /// </summary>
    /// <value>
    /// The height of screen.
    /// </value>
    /// <description>
    /// In iOS devices, it will always return the screen width in "point", 
    /// instead of "pixel". It would be useful to use this value to calculate webview size.
    /// On other platforms, it will just return Unity's Screen.height.
    /// For example, a portrait iPhone 5 will return 320 and a landscape one 568. You should 
    /// always use this value to do screen-size-based insets calculation.
    /// </description>
    static int screenHeight
    {
        get
        {
#if UNITY_IOS && !UNITY_EDITOR
            return UniWebViewPlugin.ScreenHeight();
#else
            return Screen.height;
#endif
        }
    }
}
