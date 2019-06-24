using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using UnityEngine;
using System.Collections;
using LuaInterface;
using UnityEngine.Events;

[Serializable]
public class CustomEventData
{
    public string eventName;
    public string data;
}

/// <summary>
/// 回调 Android和IOS走同样的回调接口，保证接口的统一性
/// </summary>
public class GameSDKCallback : MonoBehaviour
{


    private static string[] splitStr = new string[]{"&_think_dit_&"};
    private static GameSDKCallback _instance;

    public LuaFunction gameSdkCallback;

    public UnityAction<bool> onSdkInitHandler;

    //魔窗的进入ID
    public string mwEnterRoomID = "0";

    //连接打开的参数
    public string urlOpenData = "";
    

    public static GameSDKCallback instance {
        get {
            if (_instance == null) {
                GameObject callback = GameObject.Find("GameSDKCallback");
                if (callback == null) {
                    callback = new GameObject("GameSDKCallback");
                    DontDestroyOnLoad(callback);
                    _instance = callback.AddComponent<GameSDKCallback>();
                } else {
                    _instance = callback.GetComponent<GameSDKCallback>();
                }

            }
            return _instance;
        }
    }

    [NoToLua]
    //SDK初始化状态
    public void OnInit(string state) {
        //一般不需要处理
        Debug.Log("Callback->OnInit:" + state);
        if (onSdkInitHandler != null) {
            onSdkInitHandler(state == "success");
        }
        if (gameSdkCallback != null) {
            gameSdkCallback.Call("onInit", state);
        }
    }
   
    [NoToLua]
    /// <summary>
    /// 微信授权回调
    /// </summary>
    /// <param name="data"></param>
    public void OnLoginWechatResult(string data)
    {
        Debug.Log("Callback->OnLoginWechatResult:" + data);
        if (gameSdkCallback != null) {
            gameSdkCallback.Call("onLoginWechatResult", data);
        }
    }
    /// <summary>
    /// 魔窗进入房间
    /// </summary>
    /// <param name="data"></param>
    [NoToLua]
    public void OnMWEnterRoom(string data)
    {
        mwEnterRoomID = data;
        urlOpenData = data;
        if (gameSdkCallback != null) {
            gameSdkCallback.Call("onMWEnterRoom", data);
            Debug.Log("Callback->OnMWEnterRoom(gameSdkCallback!=null):" + data);
        } else {
            Debug.Log("Callback->OnMWEnterRoom:(gameSdkCallback==null)" + data);
        }
    }

    [NoToLua]
    public void OnWechatRe(string data) {
        if (gameSdkCallback != null) {
            gameSdkCallback.Call("onWechatRe", data);
        }
    }

    //登录成功回调
    [NoToLua]
    public void OnLoginSuc(string jsonData)
    {
        if (gameSdkCallback != null) {
            gameSdkCallback.Call("onLoginSuc", jsonData);
        }
    }

    [NoToLua]
    public void OnDownloadApk(string url)
    {
        Application.OpenURL(url);
    }

    [NoToLua]
    public void OnGetLocationResult(string locationResult)
    {
        if (gameSdkCallback != null) {
            gameSdkCallback.Call("onGetLocationResult", locationResult);
        }
    }

    [NoToLua]
    public void OnSdkCallbackCall(string data)
    {
        //Debug.Log("OnSdkCallbackCall：" + data);
        CustomEventData sDKCallData = JsonUtility.FromJson<CustomEventData>(data);
        //Debug.Log("sDKCallData.eventName = " + sDKCallData.eventName);
        //Debug.Log("sDKCallData.data = " + sDKCallData.data);
        if (sDKCallData != null && gameSdkCallback != null) {
            gameSdkCallback.Call(sDKCallData.eventName, sDKCallData.data);
        }
    }

    [NoToLua]
    public void OnSdkProtoCallback(string data)
    {
        // 收到样例 {"eventName": "JMessageLoginResponse","data": {"result": "0","success": "true","desc": ""}}
        // 建议别用上面那个  上面那个只支持{"eventName":"JMessageLoginResponse","data":"{\"desc\":\"\",\"result\":\"0\",\"success\":\"true\"}"}

        // Debug.Log("收到proto回复:" + data);
        // CustomEventData sDKCallData = JsonUtility.FromJson<CustomEventData>(data);
        // if(sDKCallData.data == string.Empty)
        // {
        //     string str1 = data.Substring(1,data.Length -2);
        //     //Debug.Log("data 1 = " + str1);
        //     string findStr = "\"eventName\":\"" + sDKCallData.eventName + "\"," + "\"data\":";
        //     //Debug.Log("findStr.leng = " + findStr.Length);
        //     string str2 = "";
        //     try{
        //         str2 = str1.Substring(findStr.Length + 1);
        //         Debug.Log("str2.StartsWith({) = " + str2.StartsWith("{"));
        //     }catch(System.Exception e)
        //     {
        //         Debug.LogError("实在无法解析收到的json: " + data);
        //     }
        //     //Debug.Log("处理后的proto的params = " + str2);
        //     sDKCallData.data = str2;
        // }

        // Debug.Log("sDKCallData.eventName = " + sDKCallData.eventName);
        // Debug.Log("sDKCallData.data = " + sDKCallData.data);

        // if (sDKCallData != null && gameSdkCallback != null) {
        //     gameSdkCallback.Call(sDKCallData.eventName, sDKCallData.data);
        // }

        string[] datas = data.Split(splitStr,StringSplitOptions.None);
        if (datas.Length == 2 && gameSdkCallback != null) {
            Debug.Log("eventName = " + datas[0]);
            Debug.Log("data = " + datas[1]);
            gameSdkCallback.Call(datas[0], datas[1]);
        }
    }

    //ios选择图片后获取图片数据
    [NoToLua]
    public void OnShowPhotoCallback(string base64)
    {
        byte[] inputBytes = System.Convert.FromBase64String(base64);
        base64 = "";
        if(gameSdkCallback!=null)
        {
            gameSdkCallback.Call("OnShowPhotoCallback",inputBytes);
        }
    }

    //ios取消选择图片、拍照、没有开启权限等都会返回这个
    [NoToLua]
    public void OnCancelPhotoCallback()
    {
        if(gameSdkCallback!=null)
        {
            gameSdkCallback.Call("OnCancelPhotoCallback");
        }
    }

    //ios获取图片size
    [NoToLua]
    public void OnSendImageSizeCallback(string size)
    {
        string[] tempArray = size.Split(new char[]{'|'});
        int width = int.Parse(tempArray[0]);
        int hight = int.Parse(tempArray[1]);
        if(gameSdkCallback!=null)
        {
            gameSdkCallback.Call("OnSendImageSizeCallback",width,hight);
        }
    }


    //ios取消选择图片、拍照、没有开启权限等都会返回这个
    [NoToLua]
    public void OnRequestPermissionsCallback(string jsonData)
    {
        if (gameSdkCallback != null)
        {
            gameSdkCallback.Call("OnRequestPermissionsCallback", jsonData);
        }
    }
}