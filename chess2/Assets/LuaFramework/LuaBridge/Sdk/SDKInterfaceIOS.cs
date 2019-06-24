#if UNITY_IPHONE || UNITY_EDITOR
using UnityEngine;
using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Net.Sockets;
using System.Text;
using System.Runtime.InteropServices;


public class SDKInterfaceIOS : GameSDKInterface
{
    [DllImport("__Internal")]
    private static extern void IosInit();

    [DllImport("__Internal")]
    private static extern void IosLogin();

    // [DllImport("__Internal")]
    // private static extern void IosPayment(string json);

    [DllImport("__Internal")]
    private static extern string IosGetThirdPlatformName();

    [DllImport("__Internal")]
    private static extern string IosGetIDFA();

    [DllImport("__Internal")]
    private static extern string IosGetIpv6(string ipv4);

    [DllImport("__Internal")]
    private static extern string IosGetDataFromKeychain(string key);

    [DllImport("__Internal")]
    private static extern bool IosSaveDataToKeychain(string key, string data);

    [DllImport("__Internal")]
    private static extern void IosInitWechat(string appid);

    [DllImport("__Internal")]
    private static extern void IosLoginWechat();
    
    [DllImport("__Internal")]
    private static extern void IosInitApp(string json);
    
    [DllImport("__Internal")]
    private static extern void IosLoginApp(string json);

    [DllImport("__Internal")]
    private static extern void IosShareUrl(string json);

    [DllImport("__Internal")]
    private static extern void IosShareText(string json);

    // [DllImport("__Internal")]
    // private static extern void IosSetAlarm(long time ,string json);

    [DllImport("__Internal")]
    private static extern void IosShareImage(string json);

    [DllImport("__Internal")]
    private static extern void IosShareMiniProgram(string json);

    [DllImport("__Internal")]
    private static extern int IosGetCurBatteryLevel();

    [DllImport("__Internal")]
    private static extern string IosGetCurSignalType();

    [DllImport("__Internal")]
    private static extern int IosGetCurSignalStrenth();

    [DllImport("__Internal")]
    private static extern string IosGetCurSignalTypeNew(bool isIphoneX);

    [DllImport("__Internal")]
    private static extern int IosGetCurSignalStrenthNew(bool isIphoneX);

    [DllImport("__Internal")]
    private static extern void IosShakePhone();

    [DllImport("__Internal")]
    private static extern bool IosGetCurChargeState();

    [DllImport("__Internal")]
    private static extern string IosGetIpsByHttpDNS(string url);

    [DllImport("__Internal")]
    private static extern void IosBeginLocation(bool isRegeocode);

    [DllImport("__Internal")]
    private static extern double IosCaculateDistance(double latitude1, double longitude1, double latitude2,
        double longitude2);

    [DllImport("__Internal")]
    private static extern void IosBuyProduct(string productName); //购买商品

    [DllImport("__Internal")]
    private static extern void IosIsUserCloseNetWork(); //是否因为ios10网络权限问题无网络 true:是 弹出解决方案界面

    [DllImport("__Internal")]
    private static extern void IosCopyTextToClipboard(string text);

    [DllImport("__Internal")]
    private static extern string IosGetClipBoardContent();

    [DllImport("__Internal")]
    private static extern float IosGetCurSdCardSize();

    // [DllImport("__Internal")]
    // private static extern float IosCommonRecharge(string json);
    
    [DllImport("__Internal")]
    private static extern bool IosIsAppExist(string packageName);
    [DllImport("__Internal")]
    private static extern void IosStartApp(string packageName);
    [DllImport("__Internal")]
    private static extern void IosSaveImageToGallery(string path);

    [DllImport("__Internal")]
    private static extern string IosCommonRequest(string json);


    /// <summary>
    /// SDK初始化
    /// </summary>
    public override void Init()
    {
        IosInit();
    }

    /// <summary>
    /// 登录
    /// </summary>
    public override void Login()
    {
        IosLogin();
    }


    /// <summary>
    /// 获取本地图片
    /// </summary>
    public override void GetNativeAvatar(int size)
    {
        //IosSubmitGameData(data.dataType, data.roleID, data.roleName, data.roleLevel, data.moneyNum, data.serverID, data.serverName);
    }


    /// <summary>
    /// 获取渠道名
    /// </summary>
    /// <returns></returns>
    public override string GetChannelName()
    {
        return IosGetThirdPlatformName();
    }

    public override string GetIDFA()
    {
        return IosGetIDFA();
    }

    public override bool ProcessIpAndAddressFamily(string ipv4, out string newServerIp,
        out AddressFamily ipAddressFamily)
    {
        string ipv6 = IosGetIpv6(ipv4);
        newServerIp = ipv4;
        ipAddressFamily = AddressFamily.InterNetwork;
        try
        {
            if (!string.IsNullOrEmpty(ipv6))
            {
                string[] m_StrTemp = System.Text.RegularExpressions.Regex.Split(ipv6, "&&");
                if (m_StrTemp != null && m_StrTemp.Length >= 2)
                {
                    string IPType = m_StrTemp[1];
                    if (IPType == "ipv6")
                    {
                        newServerIp = m_StrTemp[0];
                        ipAddressFamily = AddressFamily.InterNetworkV6;
                        return true;
                    }
                    return false;
                }
            }
        }
        catch (Exception e)
        {
            UnityEngine.Debug.LogError("GetIpv6失败:" + e.ToString());
        }
        return false;
    }

    public override float GetCurSdCardSize()
    {
        return IosGetCurSdCardSize();
    }

    public override int GetCurBatteryLevel()
    {
        return IosGetCurBatteryLevel();
    }

    public override string GetCurSignalType()
    {
        return IosGetCurSignalType();
    }

    public override int GetCurSignalStrenth()
    {
        return IosGetCurSignalStrenth();
    }

    public override string GetCurSignalType(bool isIphoneX)
    {
        return IosGetCurSignalTypeNew(isIphoneX);
    }

    public override int GetCurSignalStrenth(bool isIphoneX)
    {
        return IosGetCurSignalStrenthNew(isIphoneX);
    }

    public override void ShakePhone(long ms)
    {
        IosShakePhone();
    }

    public override bool GetCurChargeState()
    {
        return IosGetCurChargeState();
    }

    public override void InitWechat(string appid)
    {
        IosInitWechat(appid);
    }
    public override void InitApp(string json)
    {
        IosInitApp(json);
    }
    
    public override void LoginApp(string json)
    {
        IosLoginApp(json);
    }
    
    public override void InstallApk(string path)
    {
    }

    public override void LoginWechat()
    {
        IosLoginWechat();
    }

    public override void ShareUrlToWechat(string json)
    {
        IosShareUrl(json);
    }
    public override void SetAlarm(long starttime, string msg)
    {
        // IosSetAlarm(starttime,msg);
    }

    public override void ShareImageToWechat(string json)
    {
        IosShareImage(json);
    }

    public override void ShareMiniProgramToWechat(string json)
    {
        IosShareMiniProgram(json);
    }
  public override void ShareImage(string json)
    {
        IosShareImage(json);
    }
  public override void ShareText(string json)
    {
        IosShareText(json);
    }
  public override void ShareUrl(string json)
    {
        IosShareUrl(json);
    }
    public override string ReadFileFromeAssets(string fileName)
    {
        string fileFullPath = Path.Combine(Application.streamingAssetsPath, fileName);
        if (!File.Exists(fileFullPath))
        {
            return "";
        }
        return File.ReadAllText(Path.Combine(Application.streamingAssetsPath, fileName));
    }

    public override bool AssetsFileExistInInternalAssets(string fileName)
    {
        string fileFullPath = Path.Combine(Application.streamingAssetsPath, fileName);
        return File.Exists(fileFullPath);
    }


    public override bool RestartApplication()
    {
        throw new NotImplementedException();
    }

    public override void WeRech(string jsonData)
    {
        // IosPayment(jsonData);
    }

    public override void CommonRecharge(string json)
    {
        // IosCommonRecharge(json);
    }


    public override bool Logout()
    {
        return false;
    }


    public override string GetDataFromIosKeychain(string key)
    {
        throw new NotImplementedException();
    }

    public override bool SaveDataToIosKeychain(string key, string data)
    {
        throw new NotImplementedException();
    }

    public override string GetIpsByHttpDNS(string url)
    {
        return IosGetIpsByHttpDNS(url);
    }

    public override void BeginLocation(bool isRegeocode)
    {
        IosBeginLocation(isRegeocode);
    }

    public override void BeginLocation(bool setNeedAddress, bool setLocationCacheEnable, int amapLocationMode)
    {
        GameSDKCallback.instance.OnGetLocationResult("");
    }

    public override bool IsGpsOpen(bool includeAGPS)
    {
        // throw new NotImplementedException();
        return false;
    }


    public override void StartActivity(string action)
    {
        // throw new NotImplementedException();
    }

    public override bool AndroidIsRoot()
    {
        return false;
    }

    public override bool AndroidIsSimulator()
    {
        return false;
    }

    public override double CaculateDistance(double latitude1, double longitude1, double latitude2, double longitude2)
    {
        return IosCaculateDistance(latitude1, longitude1, latitude2, longitude2);
    }

    public override void BuyAppStoreProduct(string productName)
    {
        IosBuyProduct(productName);
    }

    public override void IsUserCloseNetWork()
    {
        IosIsUserCloseNetWork();
    }

    public override void StopLocation()
    {
    }

    public override void CopyToClipboard(string text)
    {
        IosCopyTextToClipboard(text);
    }

    public override string CopyTextToClipboard()
    {
        return IosGetClipBoardContent();
    }

    public override string GetTextFromClipboard()
    {
        return IosGetClipBoardContent();
    }

    public override void StartApp(string packageName)
    {
        IosStartApp(packageName);
    }

    public override bool IsAppExist(string packageName)
    {
        return IosIsAppExist(packageName);
    }

    [DllImport("__Internal")]
	public static extern void _registerNetworkDidReceiveMessage();

	[DllImport("__Internal")]
	public static extern void _registerNetworkDidReceivePushNotification();
    public override void JPushInit()
    {
        _registerNetworkDidReceiveMessage();
		_registerNetworkDidReceivePushNotification();
    }

    [DllImport("__Internal")]
    public static extern void _jpushStopPush(String param);
    public override void JPushStopPush()
    {
        _jpushStopPush("1");
    }

    public override void JPushResumePush()
    {
        _jpushStopPush("0");
    }

    public override bool JPushIsPushStopped()
    {
        return false;
    }

    public override void JPushQuit()
    {
    }

    public override void JPushSetDebug(bool enable)
    {
//        if (enable)
//        {
//            _setDebugMode();
//        }
    }

    public override string JPushGetRegistrationId()
    {
//        return _registrationID();
        return "";
    }

    [DllImport("__Internal")]
    public static extern void _setTagsAlias(String tagsWithAlias);

    [DllImport("__Internal")]
    public static extern void _setTags(String tags);

    [DllImport("__Internal")]
    public static extern void _setAlias(String alias);

    [DllImport("__Internal")]
    public static extern void _setBadge(int badge);

    [DllImport("__Internal")]
    public static extern void _resetBadge();

    public override bool JPushSetTags(string tags)
    { 
        if(tags.Contains("_setBadge"))
        {
            int badge = int.Parse(tags.Replace("_setBadge",""));
            _setBadge(badge);
            return false;
        }
        if(tags.Contains("_resetBadge"))
        {
            _resetBadge();
            return false;
        }


        _setTags(tags);
        return false;
    }

    public override bool JPushSetAlias(string alias)
    {
        _setAlias(alias);
        return true;
    }


    public override bool JPushSetPushTime(string days, int startHour, int endHour)
    {
        return false;
    }

    public override bool JPushSetSilenceTime(int startHour, int startMinute, int endHour, int endMinute)
    {
        return false;
    }

    public override bool JPushSetLatestNotificationNumber(int num)
    { 
        return false;
    }

    public override void JPushInitCrashHandler()
    {
//        _crashLogON();
    }

    public override void JPushStopCrashHandler()
    {
//        _setLogOFF();
    }

    //------------------------------获取手机相册或者拍照图片----------------------------------------//
    //IOS打开照相机或者相册
    [DllImport("__Internal")]
    private static extern void _GetPhotoControl(int index);
	[DllImport("__Internal")]
	private static extern void _SetImageSize(int w,int h);
    //设置图片的宽高，缩放按照这个比例缩放 最大宽高不超过设置值
    public override void SetImageSize(int w,int h)
    {
        _SetImageSize(w, h);
    }
    //打开相册选择照片
    public override void OpenPick(string json)
    {
        _GetPhotoControl(1);
    }
    //打开相机拍照选择照片
    public override void OpenCamera(string json)
    {
        _GetPhotoControl(0);
    }
    
    public override bool SaveImageToGallery(string sourceImagePath, string dcimName, string storeImageName)
    {
        IosSaveImageToGallery(sourceImagePath);
        return true;
    }

    //权限检测
    public override bool PermissionCheck(string permission)
    {
        return true;
    }

    //请求权限
    public override void RequestPermission(string permission)
    {

    }

    //获取手机通话状态（包括电话微信qq语音等） -1 没有权限 0 空闲  1 来电状态 2 通话状态 3 voip通话中(微信qq语音聊天)
    public override int GetTalkingStatus()
    {
        return -2;
    }

    [DllImport("__Internal")]
    public static extern void IosSendRequestToPhone(string json);

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
        IosSendRequestToPhone(json);
    }

    public override string CommonRequest(string json)
    {
        return IosCommonRequest(json);
    }
}
#endif