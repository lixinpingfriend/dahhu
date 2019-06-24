#if UNITY_ANDROID

using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Sockets;
using System.Text;
using UnityEngine;


/// <summary>
/// U8SDK Android平台接口的调用
/// </summary>
public class SDKInterfaceAndroid : GameSDKInterface {

    private AndroidJavaObject jo;

    public SDKInterfaceAndroid()
    {
        using (AndroidJavaClass jc = new AndroidJavaClass("com.unity3d.player.UnityPlayer"))
        {
            jo = jc.GetStatic<AndroidJavaObject>("currentActivity");
            Debug.Log("SDKInterfaceAndroid");
        }
    }

    private T SDKCall<T>(string method, params object[] param)
    {
        try
        {
            return jo.Call<T>(method, param);
        }
        catch (Exception e)
        {
            Debug.LogException(e);
        }
        return default(T);
    }

    private void SDKCall(string method, params object[] param)
    {
        try
        {
            jo.Call(method, param);
        }
        catch (Exception e)
        {
            Debug.LogException(e);
        }
    }


    //这里Android中，在onCreate中直接调用了initSDK，所以这里就不用调用了
    public override void Init()
    {
        //SDKCall("initSDK");        
    }

    public override void Login()
    {
        SDKCall("login");
    }

    public override bool Logout()
    {
        SDKCall("logout");
        return true;
    }


    public override bool RestartApplication() {
        return SDKCall<bool>("restartApplication");
    }

    public override void  GetNativeAvatar(int size)
    {
        SDKCall("getNativeAvatar",size.ToString());
    }


    public override string GetIDFA() {
        return SystemInfo.deviceUniqueIdentifier;
    }

    public override bool ProcessIpAndAddressFamily(string ipv4, out string newServerIp, out AddressFamily ipAddressFamily) {
        newServerIp = ipv4;
        ipAddressFamily = AddressFamily.InterNetwork;
        return true;
    }

    public override float GetCurSdCardSize()
    {
        return SDKCall<float>("getCurSdCardSize");
    }

    public override int GetCurSignalStrenth()
    {
        return SDKCall<int>("getPhoneCurSignalStrenth");
    }
    public override int GetCurSignalStrenth(bool isIphoneX)
    {
        return SDKCall<int>("getPhoneCurSignalStrenth");
    }
    public override int GetCurBatteryLevel()
    {
        return SDKCall<int>("getPhoneBatteryLevel");
    }

    public override string GetCurSignalType()
    {
        return SDKCall<string>("getPhoneCurSignalType");
    }
    public override string GetCurSignalType(bool isIphoneX)
    {
        return SDKCall<string>("getPhoneCurSignalType");
    }
    public override void ShakePhone(long ms)
    {
        SDKCall("vibratorPhone", ms);
    }

    public override bool GetCurChargeState()
    {
        return SDKCall<bool>("getCurBatteryIsCharge");
    }

    public override void InitWechat(string appid)
    {
        SDKCall("InitWechat", appid);
    }
    
    public override void InitApp(string json)
    {
        SDKCall("initApp", json);
    }
    
    public override void LoginApp(string json)
    {
        SDKCall("loginApp", json);
    }
    
    public override void InstallApk(string path)
    {
        SDKCall("installApk", path);
    }

    public override void SetAlarm(long starttime, string msg)
    {
        SDKCall("setAlarm", starttime,msg);
    }
    public override void LoginWechat()
    {
        SDKCall("loginWechat");
    }
    public override void ShareUrlToWechat(string json)
    {   
        SDKCall("shareUrlToWechat", json);
    }

    public override void ShareImageToWechat(string json)
    {
        SDKCall("shareImageToWechat", json);
    }
    
    public override void ShareImage(string json)
    {
        SDKCall("shareImage", json);
    }

    public override void ShareText(string json)
    {
        SDKCall("shareText", json);
    }

    public override void ShareUrl(string json)
    {
        SDKCall("shareUrl", json);
    }

    public override string GetChannelName() {
        return SDKCall<string>("getChannelName");
    }

    public override string ReadFileFromeAssets(string fileName) {
        return SDKCall<string>("readFileFromeAssets", fileName);
    }

    public override bool AssetsFileExistInInternalAssets(string fileName) {
        return SDKCall<bool>("assetsFileExistInInternalAssets", fileName);
    }

    public override void WeRech(string json)
    {
        SDKCall("WeRech", json);
    }

    public override void CommonRecharge(string json)
    {
        SDKCall("commonRecharge", json);
    }

    public override string GetDataFromIosKeychain(string key)
    {
        return "";
    }

    public override bool SaveDataToIosKeychain(string key, string data)
    {
        return false;
    }


    public override string GetIpsByHttpDNS(string url)
    {
		return SDKCall<string>("getIpsByHttpDNS", url);
    }

    public override void BeginLocation(bool setNeedAddress, bool setLocationCacheEnable, int amapLocationMode)
    {
        SDKCall("startLocation", setNeedAddress, setLocationCacheEnable, amapLocationMode);
    }

    public override void BeginLocation(bool setNeedAddress)
    {
        SDKCall("startLocation", setNeedAddress, true, 3);
    }


    public override void StopLocation()
    {
        SDKCall("stopLocation");
    }


    public override bool IsGpsOpen(bool includeAGPS)
    {
        return SDKCall<bool>("isGpsOpen", includeAGPS);
    }


    public override void StartActivity(string action)
    {
        SDKCall("startActivity", action);
    }

    public override bool AndroidIsRoot()
    {
        return SDKCall<bool>("isRoot");
    }

    public override bool AndroidIsSimulator()
    {
        return SDKCall<bool>("isSimulator");
    }

    public override double CaculateDistance(double latitude1, double longitude1, double latitude2, double longitude2)
    {
        return SDKCall<double>("caculateDistance", latitude1, longitude1, longitude2, longitude2);
    }

    public override void BuyAppStoreProduct(string productName)
    {

    }

    public override void IsUserCloseNetWork()
    {
        
    }

    public override void CopyToClipboard(string text)
    {
        SDKCall("copyTextToClipboard", text);
    }

    public override string GetTextFromClipboard()
    {
        return SDKCall<string>("getTextFromClipboard");
    }

    public override string CopyTextToClipboard()
    {
        return SDKCall<string>("getTextFromClipboard");
    }

    public override void StartApp(string packageName)
    {
        SDKCall("startApp", packageName);
    }

    public override bool IsAppExist(string packageName)
    {
        return SDKCall<bool>("isAppExist", packageName);
    }
    
    public override void JPushInit()
    {
        SDKCall("jpushInit");
    }

    public override void JPushStopPush()
    {
        SDKCall("jpushStopPush");
    }

    public override void JPushResumePush()
    {
        SDKCall("jpushResumePush");
    }

    public override bool JPushIsPushStopped()
    {
        return SDKCall<bool>("jpushIsPushStopped");
    }

    public override void JPushQuit()
    {
        SDKCall("jpushQuit");
    }

    public override void JPushSetDebug(bool enable)
    {
        SDKCall("jpushSetDebug", enable);
    }

    public override string JPushGetRegistrationId()
    {
        return SDKCall<string>("jpushGetRegistrationId");
    }

    public override bool JPushSetTags(string tags)
    {
        return SDKCall<bool>("jpushSetTags", tags);
    }

    public override bool JPushSetAlias(string alias)
    {
        return SDKCall<bool>("jpushSetAlias", alias);
    }

    public override bool JPushSetPushTime(string days, int startHour, int endHour)
    {
        return SDKCall<bool>("jpushSetPushTime", days, startHour, endHour);
    }

    public override bool JPushSetSilenceTime(int startHour, int startMinute, int endHour, int endMinute)
    {
        return SDKCall<bool>("jpushSetSilenceTime", startHour, startMinute, endHour, endMinute);
    }

    public override bool JPushSetLatestNotificationNumber(int num)
    {
        return SDKCall<bool>("jpushSetLatestNotificationNumber", num);
    }

    public override void JPushInitCrashHandler()
    {
        SDKCall("jpushInitCrashHandler");
    }

    public override void JPushStopCrashHandler()
    {
        SDKCall("jpushStopCrashHandler");
    }

    public override void SetImageSize(int w,int h)
    {
         
    }

    public override void OpenPick(string json)
    {
        SDKCall("OpenPick", json);
    }
    
    public override void OpenCamera(string json)
    {
        SDKCall("OpenPhoto", json);
    }
    
    public override bool SaveImageToGallery(string sourceImagePath, string dcimName, string storeImageName)
    {
        return SDKCall<bool>("saveImageToGallery", sourceImagePath, dcimName, storeImageName);
    }

    public override void ShareMiniProgramToWechat(string json)
    {
        SDKCall("shareMiniProgram",json);
    }

    //权限检测
    public override bool PermissionCheck(string permission)
    {
        return SDKCall<bool>("PermissionCheck", permission);
    }

    //请求权限
    public override void RequestPermission(string permission)
    {
        SDKCall("RequestPermission", permission);
    }

    //获取手机通话状态（包括电话微信qq语音等） -1 没有权限 0 空闲  1 来电状态 2 通话状态 3 voip通话中(微信qq语音聊天)
    public override int GetTalkingStatus()
    {
        return SDKCall<int>("GetTalkingStatus");
    }
    /// <summary>
    /// 通用Unity与SDK通信
    /// </summary>
    /// <param name="json">
    /// {
    /// protoName: string,
    /// protoParams: json
    /// }
    /// </param>
    public override void SendRequestToPhone(string json)
    {
        SDKCall("sendRequestToPhone",json);
    }

    public override string CommonRequest(string json)
    {
        return SDKCall<string>("commonRequest",json);
    }
}

#endif