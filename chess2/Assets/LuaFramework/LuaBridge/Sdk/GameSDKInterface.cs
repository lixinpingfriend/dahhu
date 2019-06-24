

using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Sockets;
using System.Text;
using UnityEngine;

public abstract class GameSDKInterface
{
    public delegate void LoginSucHandler(string data);
    public delegate void LogoutHandler();

    private static GameSDKInterface _instance;

    public LoginSucHandler onLoginSuc;
    public LogoutHandler onLogout;


    public static GameSDKInterface instance
    {
        get
        {
            if (_instance == null)
            {
#if UNITY_EDITOR || UNITY_STANDLONE
                _instance = new SDKInterfaceDefault();
#elif UNITY_ANDROID
                _instance = new SDKInterfaceAndroid();
#elif UNITY_IPHONE
                _instance = new SDKInterfaceIOS();
#else
                _instance = new SDKInterfaceDefault();
#endif
            }

            return _instance;
        }
    }
    
    public void PauseEditorApplication(bool state)
    {

#if UNITY_EDITOR
        UnityEditor.EditorApplication.isPaused = state;
#endif
    }

    public void BuglySetUserId(string uid) {
        BuglyAgent.SetUserId(uid);
    }

    public void BuglyPrintLog(int logLevel, string log) {
        BuglyAgent.PrintLog((LogSeverity)logLevel, log);
    }
    
    
    public void ReportException(string name, string message, string stackTrace)
    {
        BuglyAgent.ReportException(name, message, stackTrace);
    }

    public void DebugLogError(string text) {
        Debug.LogError(text);
    }

    //获取渠道名
    public abstract string GetChannelName();

    public string GetPlatformName()
    {
        return Application.platform.ToString();
    }

    public abstract string ReadFileFromeAssets(string fileName);

    public abstract bool AssetsFileExistInInternalAssets(string fileName);



    //初始化
    public abstract void Init();

    //登录
    public abstract void Login();

    //登出
    public abstract bool Logout();


    //重启应用
    public abstract bool RestartApplication();

    //获取设备的IDFA
    public abstract string GetIDFA();

    /// <summary>
    /// 获取本地图片
    /// </summary>
    public abstract void GetNativeAvatar(int size);

    public abstract string GetDataFromIosKeychain(string key);

    public abstract bool SaveDataToIosKeychain(string key, string data); 


    //处理IP，因为ios需要支持IPV6
    public abstract bool ProcessIpAndAddressFamily(string ipv4, out string newServerIp, out AddressFamily ipAddressFamily);

    /// <summary>
    /// 获取当前信号强度 0~4
    /// </summary>
    public abstract int GetCurSignalStrenth();
    public abstract int GetCurSignalStrenth(bool isIphoneX);
    /// <summary>
    /// 获取信号类型 none, 2g, 3g, 4g, wifi
    /// </summary>
    public abstract string GetCurSignalType();
    public abstract string GetCurSignalType(bool isIphoneX);
    /// <summary>
    /// 获取当前电量 0-100
    /// </summary>
    public abstract int GetCurBatteryLevel();
    /// <summary>
    /// 手机震动
    /// </summary>
    public abstract void ShakePhone(long ms);
    /// <summary>
    /// 获取当前手机是不是在充电 true, false
    /// </summary>
    public abstract bool GetCurChargeState();


    /// <summary>
    /// 根据appid初始化微信sdk
    /// </summary>
    /// <param name="appid"></param>
    public abstract void InitWechat(string appid);
    
    
    public abstract void InitApp(string json);
    
    public abstract void LoginApp(string json);
    
    //安装apk
    public abstract void InstallApk(string path);

    /// <summary>
    /// 设置闹钟
    /// </summary>
    /// <param name="json">json</param>
    public abstract void SetAlarm(long starttime ,string msg);


    /// <summary>
    /// 登录微信
    /// </summary>
    public abstract void LoginWechat();
    /// <summary>
    /// 分享Url
    /// </summary>
    /// <param name="json">json</param>
    public abstract void ShareUrlToWechat(string json);
    /// <summary>
    /// 分享图片
    /// </summary>
    /// <param name="json">json</param>
    public abstract void ShareImageToWechat(string json);

    /// <summary>
    /// 分享Url
    /// </summary>
    /// <param name="json">json</param>
    public abstract void ShareUrl(string json);
    /// <summary
    /// 分享text
    /// </summary>
    /// <param name="json">json</param>
    public abstract void ShareText(string json);
    /// <summary>
    /// 分享Image
    /// </summary>
    /// <param name="json">json</param>
    public abstract void ShareImage(string json);

    public abstract void ShareMiniProgramToWechat(string json);

    public abstract void WeRech(string jsonData);

    public abstract void CommonRecharge(string jsonData);

    public abstract string GetIpsByHttpDNS(string url);

    //开始定位
    public abstract void BeginLocation(bool setNeedAddress, bool setLocationCacheEnable, int amapLocationMode);
    //开始定位
    public abstract void BeginLocation(bool setNeedAddress);

    public abstract void StopLocation();

    public abstract bool IsGpsOpen(bool includeAGPS);

    public abstract bool AndroidIsRoot();

    public abstract bool AndroidIsSimulator();

    public abstract void StartActivity(string action);
    //计算距离
    public abstract double CaculateDistance(double latitude1, double longitude1, double latitude2, double longitude2);

    //购买AppStore中的商品
    public abstract void BuyAppStoreProduct(string productName);

    //IOS 10 网络权限获取
    public abstract void IsUserCloseNetWork();

    //获取应用安装所在sd卡的剩余空间 单位：MB
    public abstract float GetCurSdCardSize();

    public abstract void CopyToClipboard(string text);

    public abstract string GetTextFromClipboard();

    
    public abstract string CopyTextToClipboard();

    public abstract void StartApp(string packageName);

    public abstract bool IsAppExist(string packageName);
    
    public abstract void JPushInit();

    public abstract void JPushStopPush();

    public abstract void JPushResumePush();

    public abstract bool JPushIsPushStopped();

    public abstract void JPushQuit();

    public abstract void JPushSetDebug(bool enable);

    public abstract string JPushGetRegistrationId();

    public abstract bool JPushSetTags(String tags);

    public abstract bool JPushSetAlias(String alias);

    public abstract bool JPushSetPushTime(String days, int startHour, int endHour);

    public abstract bool JPushSetSilenceTime(int startHour, int startMinute, int endHour, int endMinute);

    public abstract bool JPushSetLatestNotificationNumber(int num);

    public abstract void JPushInitCrashHandler();

    public abstract void JPushStopCrashHandler();

    //------------------------------获取手机相册或者拍照图片----------------------------------------//
    //设置图片的宽高，缩放按照这个比例缩放 最大宽高不超过设置值
    public abstract void SetImageSize(int w,int h);
    //打开相册选择照片
    public abstract void OpenPick(string json); 
    //打开相机拍照选择照片
    public abstract void OpenCamera(string json);
    /// <summary>
    /// 保存图片到相册
    /// </summary>
    /// <param name="sourceImagePath">原始图片的完整路径</param>
    /// <param name="dcimName">保存到相册中的某个文件夹 如 Game</param>
    /// <param name="storeImageName">保存的图片文件名 如game.jpg</param>
    /// <returns></returns>
    public abstract bool SaveImageToGallery(string sourceImagePath, string dcimName, string storeImageName);

    //权限检测
    public abstract bool PermissionCheck(String permission);

    //请求权限
    public abstract void RequestPermission(String permission);

    //获取手机通话状态（包括电话微信qq语音等）-2 不支持获取（ios设备） -1 没有权限 0 空闲  1 来电状态 2 通话状态 3 voip通话中(微信qq语音聊天)
    public abstract int GetTalkingStatus();

    /// <summary>
    /// 通用Unity与SDK通信
    /// </summary>
    /// <param name="json">
    /// {
    /// protoName: string,
    /// protoParams: json
    /// }
    /// </param>
    public abstract void SendRequestToPhone(string json);

    public abstract string CommonRequest(string json);
}
