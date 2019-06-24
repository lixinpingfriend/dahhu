

using System;
using System.Collections.Generic;
using LuaInterface;
using UnityEngine;
using LuaInterface;

public enum Channel {
    //官方渠道
    Official,
    //好彩麻将渠道包
    HAOCAI,
}

[Serializable]
public class GameConfigNet {

    public enum IPAdress {
        Userdefined,
        Test,
        Production,
        End
    }

    #if UNITY_EDITOR
    //只用于测试
    public readonly string[] ipAdressTypeName = new string[] 
    {   "自定义", 
        "测试服", "正式服"
    };
    #endif

    public Dictionary<IPAdress, string> httpIpDatas = new Dictionary<IPAdress, string>();
    public GameConfigNet() {
        httpIpDatas.Add(IPAdress.Test, "test");
        httpIpDatas.Add(IPAdress.Production, "api");
    }

    public IPAdress ipAdressType = IPAdress.Userdefined;

    public string httpApiUrl;


}


public class GameConfigProject : MonoSingletonProject<GameConfigProject> {
#if UNITY_EDITOR
    public enum LoadType {
        /// <summary> 编辑器模拟 </summary>
        SimulateEditor = 0,
        /// <summary> 从App应中加载 </summary>
        FromAppAssets = 1,
        /// <summary> 从外部资源文件夹中加载 </summary>
        FromAppAssetsExcludeLua = 2
    }
#endif

    /// <summary> 网络连接状态显示 </summary>
    public bool netClientStateLogShow = false;
    /// <summary> 网络包显示 </summary>
    public bool netLogSendServerShow = false;
    /// <summary> 网络包收包内容显示 </summary>
    public bool netTransferDataShow = false;

    /// <summary> 普通Log </summary>
    public bool commonLogShow = false;
    /// <summary> 普通警告 </summary>
    public bool warningLogShow = false;
    /// <summary> 普通错误 </summary>
    public bool errorLogShow = false;

    public GameConfigNet net = new GameConfigNet();

    //是否处于开发模式中，可以设置由服务器控制
    public bool developmentMode = false;

    public bool testView;

    //ios 企业版本
    public bool isIosEnterprise = false;

    public string channel = "";

    public string showPackage = "all";

    public string customData = "";

    /// <summary> AssetBundle路径是否加密 </summary>
    public bool assetBundleFilePathEncrypt = true;

    public bool luaScriptProcess = false;

//    public string loginServerIp {
//        get { return net.loginServerIp; }
//    }
//
//    public int loginServerPort {
//        get { return net.loginPort; }
//    }
//
    public string httpApiUrl {
        get {return net.httpApiUrl;}
    }

    public int ipAdressType {
        get {return (int)net.ipAdressType;}
    }

    //0:编辑器模拟 1:FromAppAssets 2:FromAppAssetsExcludeLua
    public int assetLoadType;

    public LuaFunction asyncFileOperationCallback;

    protected override void OnAwake() {
        SetIPAdress(net.ipAdressType);
    }

    [NoToLua]
    public void SetIPAdress(GameConfigNet.IPAdress ipTypeAdress) {
        if (net.httpIpDatas.TryGetValue(ipTypeAdress, out net.httpApiUrl)) {

        }
        net.ipAdressType = ipTypeAdress;
    }

    [NoToLua]
    void OnApplicationQuit()
    {
        AsyncFileUtil.EndFileOperationTread();
    }

    [NoToLua]
    void Update()
    {
        var operationData = AsyncFileUtil.GetFinishedAsyncFileOperationData();
        if(operationData != null)
        {
            if(asyncFileOperationCallback != null)
            {
                asyncFileOperationCallback.Call(operationData);
            }
        }
    }

}
