



using System;
using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using DNet;
using Buffer = DNet.Buffer;

/// <summary> 网络管理单例类(建立连接，收包处理) </summary>
public class NetworkManager : MonoBehaviour {
#if Net_Delay_Simulate
    /// <summary> 网络延迟模拟 </summary>
    public float netDelaySimulateMin = 0.1f;
    public float netDelaySimulateMax = 0.8f;
#endif
    private List<GameWebSocketClient> mGameNetClients = new List<GameWebSocketClient>();

    void Awake() {
        _instance = this;
        // DontDestroyOnLoad(gameObject);
    }

    // public GameNetClient InitGameClient(string clientName, int msgProtocolType = 1) {
    //     foreach (var p in mGameNetClients) {
    //         if (p.clientName == clientName) {
    //             return p;
    //         }
    //     }
    //     GameNetClient client = new GameNetClient(clientName, msgProtocolType);
    //     mGameNetClients.Add(client);
    //     return client;
    // }

    public GameWebSocketClient InitGameClient(string clientName, int msgProtocolType = 1) {
        foreach (var p in mGameNetClients) {
            if (p.clientName == clientName) {
                return p;
            }
        }
        GameWebSocketClient client = new GameWebSocketClient(clientName, msgProtocolType);
        mGameNetClients.Add(client);
        return client;
    }
    
    // void Update() {
    //     //int count = mGameNetClients.Count;
    //     //for (int i = 0; i < count; ++i) {   //防止在ProcessActionAndPackets过程中添加GameNetClient引发异常
    //     //    mGameNetClients[i].ProcessAndHandOutPackets();
    //     //}
    // }

    // void FixedUpdate() {
    //     int count = mGameNetClients.Count;
    //     for (int i = 0; i < count; ++i) {   //防止在ProcessActionAndPackets过程中添加GameNetClient引发异常
    //         mGameNetClients[i].ProcessAndHandOutPackets();
    //     }
    // }

    void OnDestroy() {
        try {
            DisconnectAllGameClient();
        } catch (Exception ex) {
            Debug.Log(ex);
            throw;
        }
    }


    /// <summary> 主动断开所有游戏连接 </summary>
    public void DisconnectAllGameClient() {
        foreach (var data in mGameNetClients) {
            data.CloseWebSocket();
        }
    }

    public void DisconnectGameClient(string name) {
        foreach (var data in mGameNetClients) {
            if (data.clientName == name) {
                data.CloseWebSocket();
            }
        }
    }


    #region static   
    private static NetworkManager _instance;

    public static NetworkManager instance {
        get {
            if (_instance == null) {
                var gam = new GameObject("NetworkManager");
                _instance = gam.AddComponent<NetworkManager>();
            }
            return _instance;
        }
    }
    #endregion

}
