#if UNITY_EDITOR || UNITY_STANDLONE || UNITY_STANDALONE_OSX || UNITY_STANDALONE_WIN


using System;
using System.IO;
using UnityEngine;
using System.Linq;
using System.Net.Sockets;
using System.Text;
using System.Collections.Generic;

[Serializable]
public class HttpData {
    public string host;
    public string[] ips;
    public int ttl;
    public int origin_ttl;
}

public class SDKInterfaceDefault : GameSDKInterface {

	Dictionary<string, string> ipCache = new Dictionary<string, string>();

	float nextUpdateTime = 0;

    public override void Init() {
        GameSDKCallback.instance.OnInit("success");
    }

    public override void Login() {
        throw new NotImplementedException();
    }
		

    public override void GetNativeAvatar(int size) {
        throw new NotImplementedException();
    }

    public override bool Logout() {
        return true;
    }


    public override string GetIDFA() {
        return SystemInfo.deviceUniqueIdentifier;
    }

    public override bool ProcessIpAndAddressFamily(string ipv4, out string newServerIp, out AddressFamily ipAddressFamily) {
        newServerIp = ipv4;
        ipAddressFamily = AddressFamily.InterNetwork;
        return true;
    }

    public override int GetCurSignalStrenth() {
        return 4;
    }
    public override int GetCurSignalStrenth(bool isIphoneX)
    {
        return 4;
    }
    public override int GetCurBatteryLevel() {
        return 100;
    }

    public override string GetCurSignalType() {
        return "wifi";
    }
    public override string GetCurSignalType(bool isIphoneX)
    {
        return "wifi";
    }
    public override void ShakePhone(long ms) {
        return;
    }

    public override bool GetCurChargeState() {
        return true;
    }

    public override bool RestartApplication() {
        return true;
    }

    public override void InitWechat(string appid) {
    }
    public override void InitApp(string json)
    {
    }
    
    public override void LoginApp(string json)
    {
    }
    public override void LoginWechat() {
    }
    
    public override void InstallApk(string path)
    {
    }
    
    public override void ShareUrlToWechat(string json) {
    }
    public override void SetAlarm(long starttime, string msg)
    {
       
    }
    public override void ShareImageToWechat(string json) {
        
    }
    public override void ShareImage(string json)
    {

    }
    public override void ShareText(string json)
    {

    }
    public override void ShareUrl(string json)
    {

    }
    public override float GetCurSdCardSize()
    {
        return 10086;
    }

    public override string GetChannelName() {
        return "none";
    }

    public override string ReadFileFromeAssets(string fileName) {
        string fileFullPath = Path.Combine(Application.streamingAssetsPath, fileName);
        if (!File.Exists(fileFullPath)) {
            return "";
        }
        return File.ReadAllText(Path.Combine(Application.streamingAssetsPath, fileName));
    }

    public override bool AssetsFileExistInInternalAssets(string fileName) {
        string fileFullPath = Path.Combine(Application.streamingAssetsPath, fileName);
        return File.Exists(fileFullPath);
    }

    public override void WeRech(string jsonData)
    {
        throw new NotImplementedException();
    }

    public override void CommonRecharge(string jsonData){
        throw new NotImplementedException();
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
		if (url.StartsWith("http://")) {
			url = url.Replace("http://", "");
		}
		if (ipCache.ContainsKey(url)) {
			return ipCache[url];
		}
		//181184
		//198540
		WWWUtil.Get("http://203.107.1.1/181184/d?host=" + url).Subscribe(x => {
			if (x.text.StartsWith("{")) {
                HttpData HttpData = JsonUtility.FromJson<HttpData>(x.text);
                // Debug.Log(HttpData.host);
				// Dictionary<string, object> dic = JsonUtility.Deserialize(x.text) as Dictionary<string, object>;
				// if (dic.ContainsKey("host")) {
				// 	var ips = dic["ips"] as List<object>;
                nextUpdateTime = Time.realtimeSinceStartup + HttpData.ttl;
                string ipList = "";
                foreach(var ip in HttpData.ips) {
                    if (!string.IsNullOrEmpty(ipList)) {
                        ipList += ",";
                    }
                    if (!string.IsNullOrEmpty(ip as string)) {
                        ipList += ip as string;
                    }
                }
                string data = JsonUtility.ToJson(new CustomEventData() {
                    eventName = "onGetIpsByHttpDNSResult",
                    data = ipList
                });


                GameSDKCallback.instance.OnSdkCallbackCall(data);

                data = JsonUtility.ToJson(new CustomEventData() {
                    eventName = "onAppstorePaySucess",
                    data = ""
                });
                GameSDKCallback.instance.OnSdkCallbackCall(data);
                if (!string.IsNullOrEmpty(ipList)) {

                    if (ipCache.ContainsKey(url)) {
                        ipCache[url] = ipList;
                    } else {
                        ipCache.Add(url, ipList);
                    }
                }
			}
		}, e => {
			Debug.LogError("GetIpsByHttpDNS:" + e.error);
		});

		return url;
    }
    
    public override void BeginLocation(bool isRegeocode)
    {
        GameSDKCallback.instance.OnGetLocationResult("");
    }

    public override void BeginLocation(bool setNeedAddress, bool setLocationCacheEnable, int amapLocationMode)
    {
        GameSDKCallback.instance.OnGetLocationResult("");
    }


    public override bool IsGpsOpen(bool includeAGPS)
    {
        return false;
    }


    public override void StartActivity(string action)
    {

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
        return -1;
    }

    public override void BuyAppStoreProduct(string productName)
    {

    }

    public override void IsUserCloseNetWork()
    {
        
    }

    public override void StopLocation()
    {

    }

    public override void CopyToClipboard(string text)
    {
        #if UNITY_EDITOR
            TextEditor t = new TextEditor();  
            t.content = new GUIContent(text);  
            t.OnFocus();  
            t.Copy();  
        #endif
    }

    public override string GetTextFromClipboard()
    {
        string str = GUIUtility.systemCopyBuffer;
        return str;
    }

    public override string CopyTextToClipboard()
    {
        string str = GUIUtility.systemCopyBuffer;
        return str;
    }

    public override void StartApp(string packageName)
    {
        
    }

    public override void JPushInit()
    {

    }

    public override void JPushStopPush()
    {

    }

    public override void JPushResumePush()
    {

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

    }

    public override string JPushGetRegistrationId()
    {
        return "";
    }

    public override bool JPushSetTags(string tags)
    {
        return false;
    }

    public override bool JPushSetAlias(string alias)
    {
        return false;
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
        
    }

    public override void JPushStopCrashHandler()
    {

    }

    public override void SetImageSize(int w,int h)
    {
         
    }

    public override void OpenPick(string json)
    {
        
    }
    
    public override void OpenCamera(string json)
    {
        
    }
    
    public override bool SaveImageToGallery(string sourceImagePath, string dcimName, string storeImageName)
    {
        return false;
    }

    public override bool IsAppExist(string packageName)
    {
        return false;
    }

    public override void ShareMiniProgramToWechat(string json)
    {

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
        Debug.Log("json: " + json);
        if(json.Contains("JMessageLoginRequest"))
        {
            //string response = "{\"eventName\": \"JMessageLoginResponse\",\"data\": {\"result\": \"0\",\"success\": \"true\",\"desc\": \"\"}}";
            GameSDKCallback.instance.OnSdkProtoCallback("JMessageLoginResponse&_think_dit_&{\"result\": \"0\",\"success\": \"true\",\"desc\": \"\"}");
        }
    }

    public override string CommonRequest(string json)
    {
        return "";
    }
} 
#endif
