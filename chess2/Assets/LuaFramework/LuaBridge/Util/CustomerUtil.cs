using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System;
using System.IO;
using UnityEngine.UI;
using DG.Tweening;
using GameAsset;
using UnityEngine.SceneManagement;
using Object = UnityEngine.Object;
using LuaInterface;
using System.Security.Cryptography;
using System.Text;

public static class CustomerUtil
{
    public static LuaFunction customEventCallback;

    public static LuaFunction emojiEventCallback;

    public static string platform {
        get { return DataConfigProject.platform; }
    }

    public static string deviceModel {
        get { return SystemInfo.deviceModel; }
    }
    
    public static string deviceName {
        get { return SystemInfo.deviceName; }
    }
    
    public static float batteryLevel {
        get { return SystemInfo.batteryLevel; }
    }
    
    public static int batteryStatus {
        get { return (int)SystemInfo.batteryStatus; }
    }

    public static void CustomEventCallback(string eventName, string eventData) {
        if (customEventCallback != null) {
            customEventCallback.Call(eventName, eventData);
        }
    }

    public static object EmojiEventInvoke(string eventName, object eventData)
    {
        if (emojiEventCallback != null)
        {
            return emojiEventCallback.Invoke<string, object, object>(eventName, eventData);
        }
        return null;
    }

    public static void ReloadCurScene() {
        SceneManager.LoadScene(SceneManager.GetActiveScene().name);
        GC.Collect();
        Resources.UnloadUnusedAssets();
    }

    public static void UnloadUnusedAssets() {
        Resources.UnloadUnusedAssets();
    }

    //public static Sprite GetSpriteFromeAssetBundle(string assetBundlePath, string assetName) {
    //    var loadedAssetBundle = AssetBundleManager.instance.LoadAssetBundle(assetBundlePath);
    //    return loadedAssetBundle.GetAsset<Sprite>(assetName, false);
    //}

    public static void ScreenShot(string fullFileName)
    {
        System.IO.File.Delete(fullFileName);
        //Create a texture to pass to encoding
        Texture2D texture = new Texture2D(Screen.width, Screen.height, TextureFormat.RGB24, false);

        //Put buffer into texture
        texture.ReadPixels(new Rect(0, 0, Screen.width, Screen.height), 0, 0); //Unity complains about this line's call being made "while not inside drawing frame", but it works just fine.*
        byte[] bytes = texture.EncodeToPNG();

        //Save our test image (could also upload to WWW)
        System.IO.File.WriteAllBytes(fullFileName, bytes);
    }

    public static Vector2 GetTexture2dSize(Texture2D texture2d)
    {
        return new Vector2(texture2d.width, texture2d.height);
    }

    public static void MirrorCamera(Camera camera, Vector3 vector3)
    {
        Matrix4x4 mat = camera.projectionMatrix;
        mat *= Matrix4x4.Scale(vector3);  
        camera.projectionMatrix = mat;  
    }

    /// <summary>  
    /// 对相机截图。   
    /// </summary>  
    /// <returns>The screenshot2.</returns>
    /// <param name="imageSavePath">保存路径</param>
    /// <param name="camera">Camera.要被截屏的相机</param>
    /// <param name="x"></param>
    /// <param name="y"></param>
    /// <param name="width"></param>
    /// <param name="height"></param>  
    public static bool CaptureCamera(string imageSavePath, Camera camera, float x, float y, float width, float height) {
        // 创建一个RenderTexture对象  
        try {
            Rect rect = new Rect(x, y, width, height);
            RenderTexture rt = new RenderTexture((int)rect.width, (int)rect.height, 0);
            // 临时设置相关相机的targetTexture为rt, 并手动渲染相关相机  
            camera.targetTexture = rt;
            camera.Render();
            //ps: --- 如果这样加上第二个相机，可以实现只截图某几个指定的相机一起看到的图像。
            //ps: camera2.targetTexture = rt;  
            //ps: camera2.Render();  
            //ps: -------------------------------------------------------------------  

            // 激活这个rt, 并从中中读取像素。  
            RenderTexture.active = rt;
            Texture2D screenShot = new Texture2D((int)rect.width, (int)rect.height, TextureFormat.RGB24, false);
            screenShot.ReadPixels(rect, 0, 0);// 注：这个时候，它是从RenderTexture.active中读取像素  
            screenShot.Apply();

            // 重置相关参数，以使用camera继续在屏幕上显示  
            camera.targetTexture = null;
            //ps: camera2.targetTexture = null;  
            RenderTexture.active = null; // JC: added to avoid errors  
            Object.Destroy(rt);
            // 最后将这些纹理数据，成一个png图片文件  
            byte[] bytes = screenShot.EncodeToJPG();
            System.IO.File.WriteAllBytes(imageSavePath, bytes);
            return true;
        } catch (Exception ex) {
            Debug.LogAssertion(ex);
            return false;
        }
    }

    public static bool ScreenShotScale(string imageSavePath, int quality)
    {
        try{
            TextureFormat format = TextureFormat.RGB24;
            Texture2D screenShot = new Texture2D(Screen.width,Screen.height,format,true);
            screenShot.ReadPixels(new Rect(0,0,Screen.width,Screen.height),0,0,true);
            screenShot.Apply();
            float miniSize = Mathf.Max (screenShot.width, screenShot.height);
            float scale = 1200.0f / miniSize;
            if (scale > 1.0f) {
                scale = 1.0f;
            }
            Texture2D temp = ScaleTexture (screenShot, (int)(screenShot.width * scale), (int)(screenShot.height * scale));
            byte[] bytes = ImageConversion.EncodeToJPG(temp,quality);
            FileUtility.SaveFile(imageSavePath,bytes);
            Object.Destroy (screenShot);
            Object.Destroy (temp);
            return true;
        }catch (Exception ex) {
            Debug.LogAssertion(ex);
            return false;
        }
    }

    public static Texture2D ScaleTexture (Texture2D source, int targetWidth, int targetHeight)
    {
        Texture2D result = new Texture2D (targetWidth, targetHeight, source.format, true);
        Color[] rpixels = result.GetPixels (0);
        float incX = ((float)1 / source.width) * ((float)source.width / targetWidth);
        float incY = ((float)1 / source.height) * ((float)source.height / targetHeight);
        for (int px = 0; px < rpixels.Length; px++) {
            rpixels [px] = source.GetPixelBilinear (incX * ((float)px % targetWidth), incY * ((float)Mathf.Floor (px / targetWidth)));
        }
        result.SetPixels (rpixels, 0);
        result.Apply ();
        return result;
    }

    public static TextureFormat GetTextureFormat(int format)
    {
        return (TextureFormat)format;
    }

    public static RenderTextureFormat GetRenderTextureFormat(int format)
    {
        return (RenderTextureFormat)format;
    }


    public static Sprite CreateSpriteFromTexture(Texture2D tex, int width = 0, int height = 0)
    {
        if(width == 0 || height == 0)
        {
            width = tex.width;
            height = tex.height;
        }
        Sprite sprite = Sprite.Create(tex, new Rect(0, 0, width, height), new Vector2(0.5f, 0.5f));
        return sprite;
    }

    public static void AttachTexture2Image(Image img, Texture2D tex)
    {
        img.sprite = CreateSpriteFromTexture(tex);        
    }

    public static void SetPos(GameObject obj, float x, float y, float z)
    {
        obj.transform.position = new Vector3(x, y, z);
    }

    public static void SetLocalPos(GameObject obj, float x, float y, float z)
    {
        obj.transform.localPosition = new Vector3(x, y, z);
    }

    public static void SetScale(GameObject obj, float x, float y, float z)
    {
        obj.transform.localScale = new Vector3(x, y, z);
    }

    public static void SetAlpha(Image img, float a)
    {
        img.color = new Color(img.color.r, img.color.g, img.color.b, a);
    }

    public static GameObject Instantiate(GameObject obj, Transform parent)
    {
        GameObject go = GameObject.Instantiate(obj, parent) as GameObject;
        return go;
    }

    public static void StartCoroutineToWaitOneFrame(MonoBehaviour mono, Action callback)
    {
        if (mono)
        {
            mono.StartCoroutine(WaitOneFrame(callback));
        }
        else
        {
            Debug.Log("StartCoroutine error--------------");
        }
    }
    private static IEnumerator WaitOneFrame(Action callback)
    {
        yield return new WaitForEndOfFrame();
        if (callback != null)
        {
            callback();
        }
    }

    public static Sequence SetAlphaYoyo(this Image img, float a, float t)
    {
        Sequence seq = DOTween.Sequence();
        Tween tw = DOTween.To(() => img.color.a, (x) => img.color = new Color(img.color.r, img.color.g, img.color.b, x), a, t);
        seq.Append(tw);
        seq.SetAutoKill(false);
        seq.SetLoops(1000000, LoopType.Yoyo);
        return seq;
    }

    public static Tween FadeAlpha(this Image img, float a, float t)
    {
        return DOTween.To(() => img.color.a, (x) => img.color = new Color(img.color.r, img.color.g, img.color.b, x), a, t);
    }

    public static Tween ToGeterSeterFloat(DG.Tweening.Core.DOGetter<float> getter, DG.Tweening.Core.DOSetter<float> setter, float endVal, float duration)
    {
         return DOTween.To(getter, setter, endVal, duration);
    }

    public static Vector2 ConvertVector2(float x, float y)
    {
        return new Vector2(x, y);
    }

    public static Vector3 ConvertVector3(float x, float y, float z)
    {
        return new Vector3(x, y, z);
    }

    public static RectOffset ConvertRectOffset(int left, int right, int top, int bottom) {
        return new RectOffset(left, right, top, bottom);
    }

    /// <summary>
    /// 转换成TargetRectTransform的物体坐标
    /// </summary>
    /// <param name="camera">摄像机</param>
    /// <param name="source">需要转换的RectTransform</param>
    /// <param name="target">目标的坐标地址</param>
    /// <returns></returns>
    public static Vector2 ConverToTargetRectTransformChildPos(Camera camera, RectTransform source, RectTransform target) {

        Vector2 local;
        if (!RectTransformUtility.ScreenPointToLocalPointInRectangle(source, RectTransformUtility.WorldToScreenPoint(camera, target.position), camera, out local)) {
            //EditorApplication.isPaused = true;
            Debug.Log(String.Format("坐标转换失败，{0}", local));
        }
        return local;
    }

    public static bool VersionCompare(string sourceVersion, string targetVersion) {
        bool sourceVersionIsNew = true;
        string[] appVersionArray = sourceVersion.Split('.');
        string[] serverVersionArray = targetVersion.Split('.');
        // string[] appVersionArray = "1.3.3".Split('.');
        // string[] serverVersionArray = "1.3.2".Split('.');
        int maxLengthVersion = appVersionArray.Length > serverVersionArray.Length ? appVersionArray.Length : serverVersionArray.Length;

        for (int i = 0; i < maxLengthVersion; i++) {    //补齐版本位数
            int tempAppVersion = 0, tmpServerVersion = 0;
            if (i < appVersionArray.Length) {
                tempAppVersion = int.Parse(appVersionArray[i]);
            }

            if (i < serverVersionArray.Length) {
                tmpServerVersion = int.Parse(serverVersionArray[i]);
            }

            if (tempAppVersion < tmpServerVersion) {
                sourceVersionIsNew = false;
                break;
            } else if(tempAppVersion > tmpServerVersion) {
                sourceVersionIsNew = true;
                break;
            }
        }
        return sourceVersionIsNew;
    }

    //public static Vector2 ConverToTargetRectTransformChildPosWithScreenPoint(Camera camera, Vector2 screenPos, RectTransform target) {

    //    Vector2 local;
    //    if (!RectTransformUtility.ScreenPointToLocalPointInRectangle(source, RectTransformUtility.WorldToScreenPoint(camera, target.position), camera, out local)) {
    //        //EditorApplication.isPaused = true;
    //        Debug.Log(String.Format("坐标转换失败，{0}", local));
    //    }
    //    return local;
    //}

    public static LuaFunction logCallback;

    public static void RegisterLogCallback()
    {
        Application.logMessageReceived += HandleLog;
    }

    public static void UnRegisterLogCallback()
    {
        Application.logMessageReceived -= HandleLog;
    }

    public static void HandleLog(string logString, string stackTrace, LogType type)
    {
        if(logCallback != null)
        {
            logCallback.Call(type.ToString(), logString, stackTrace);
        }
    }

    public static void FileLog(string logString)
    {
        HandleLog(logString, string.Empty, LogType.Log);
    }

    public static Dictionary<string, string> GenerateEmptyStringStringDic()
    {
        return new Dictionary<string, string>();
    }

    public static string GetAuthorization(
            string method, string contentMD5, string contentType,
            string utcGMT, string canonicalizedOSSHeaders, string canonicalizedResource,
            string accessKeySecret, string accessKeyId)
    {
        if(utcGMT == null)
        {
            utcGMT = DateTime.UtcNow.ToString("r");
        }
        string data = method + "\n"
            + contentMD5 + "\n"
            + contentType + "\n"
            + utcGMT + "\n"
            + canonicalizedOSSHeaders
            + canonicalizedResource;

        string signature = ToHMACSHA1_Base64(accessKeySecret, data);
        string authorization = "OSS " + accessKeyId + ":" + signature;

        return authorization;
    }
    public static string ToHMACSHA1_Base64(string key, string data)
    {
        HMACSHA1 hmacsha1 = new HMACSHA1();
        hmacsha1.Key = Encoding.UTF8.GetBytes(key);
        byte[] dataBuffer = Encoding.UTF8.GetBytes(data);
        byte[] hashBytes = hmacsha1.ComputeHash(dataBuffer);
        string result = Convert.ToBase64String(hashBytes);

        return result;
    }

    public static string GetFileMD5(string filePath)
    {
        FileStream file = new FileStream(filePath, FileMode.Open);
        MD5 md5 = new MD5CryptoServiceProvider();
        byte[] hashBytes = md5.ComputeHash(file);
        file.Close();
        string result = Convert.ToBase64String(hashBytes);

        return result;
    }

    public static string GetBytesMD5(byte[] bytes)
    {
        MD5 md5 = new MD5CryptoServiceProvider();
        byte[] hashBytes = md5.ComputeHash(bytes);
        string result = Convert.ToBase64String(hashBytes);
        return result;
    }

    public static string GetUtcGMT()
    {
        return DateTime.UtcNow.ToString("r");
    }
}
