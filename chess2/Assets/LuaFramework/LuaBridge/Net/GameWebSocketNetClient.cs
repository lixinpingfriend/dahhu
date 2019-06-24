using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using BestHTTP;
using BestHTTP.WebSocket;
using BestHTTP.Extensions;
using LuaInterface;

namespace DNet
{
    public enum NetWorkState
    {
        /// <summary> 网络关闭 </summary>
        Closed,
        /// <summary> 网络已经连接 </summary>
        Connected,
        /// <summary> 网络断线，上一次状态为连接状态 </summary>
        Disconnected,
        /// <summary> 网络连接错误 </summary>
        ConnectError,
        /// <summary> 网络连接超时 </summary>
        ConnectTimeOut,
    }

    public class GameWebSocketClient
    {

        #region expose lua Event

        public LuaFunction onEventChangeFn;

        public LuaFunction onReceiveMessageFn;
        public LuaFunction onReceiveTextMessageFn;
        #endregion

        public string clientName;

        public int msgProtocolType = 1;

        WebSocket mWebSocket;

        public bool webSocketOpen
        {
            get
            {
                if (mWebSocket != null && mWebSocket.IsOpen)
                {
                    return true;
                }
                return false;
            }
        }

        public string needDecompressMsgName = "1001";

        public string heartMsgId;

        public TimeSpan PingFrequnecy { get; private set; }

        private CDecompress msgDataDecompresser;

        /// <summary> 最小服务器的有效包,和服务器约定有关</summary>
        public readonly int packetLenMin;

        /// <summary> 包长字段在包头的偏移位置(数组的下标) </summary>
        public readonly int packetHeadLenOffest;

        private Buffer mReceiveBuffer;
        int mExpected;
        int mOffset;

        public delegate void OnReceivePack(Buffer buffer);

        //心跳包发送间隔
        public int heartSendInIntervalTime = 4;
        private float lastHeartSendTime = 0;
        public bool canSendHeartPack;

        public GameWebSocketClient(string clientName, int msgProtocolType)
        {
            this.clientName = clientName;
            this.msgProtocolType = msgProtocolType;

            if (msgProtocolType == 3)
            {
                packetLenMin = 2;
                packetHeadLenOffest = 0;
            }
            else
            {                    //|命令(4)|长度(4)（只有数据长度）|数据块| 和发包不同
                packetLenMin = 8;
                packetHeadLenOffest = 4;
            }
        }

        public void Connect(string address)
        {
            if (mWebSocket != null)
            {
                CloseWebSocket();
            }
            address="ws://127.0.0.1:9815/dhahqp/hzmj/login";
            Debug.Log("address:"+address);
            mWebSocket = new WebSocket(new Uri(address));
#if !BESTHTTP_DISABLE_PROXY && !UNITY_WEBGL
            // if (HTTPManager.Proxy != null)
            // 	webSocket.InternalRequest.Proxy = new HTTPProxy(HTTPManager.Proxy.Address, HTTPManager.Proxy.Credentials, false);
#endif
            mWebSocket.OnOpen = OnOpen;
            mWebSocket.OnMessage = OnMessageReceived;
            mWebSocket.OnBinary = OnBinaryReceived;
            mWebSocket.OnClosed = OnClosed;
            mWebSocket.OnError = OnError;
            mReceiveBuffer = null;
            mExpected = 0;
            mOffset = 0;
            mWebSocket.Open();
        }

        /// <summary>
        /// Called when the web socket is open, and we are ready to send and receive data
        /// </summary>
        void OnOpen(WebSocket ws)
        {
            if (GameConfigProject.instance.netClientStateLogShow)
            {
                Debug.Log(string.Format("<color=#CC99CC>WebSocket【{0}】 Open! </color>", clientName));
            }
            if (msgProtocolType == 2)
            {
                msgDataDecompresser = new CDecompress();
            }
            try
            {
                if (onEventChangeFn != null)
                {
                    onEventChangeFn.Call(NetWorkState.Connected.ToString());
                }
            }
            catch (System.Exception ex)
            {
                // BuglyAgent.ReportException(ex, "WebSocketNetClient OnOpen");
                Debug.LogException(ex);
            }

        }

        //重置MsgData
        public void ResetMsgDataDecompresser()
        {
            msgDataDecompresser = new CDecompress();
        }


        /// <summary>
        /// Called when we received a text message from the server
        /// </summary>
        void OnMessageReceived(WebSocket ws, string message)
        {
            if (GameConfigProject.instance.netLogSendServerShow)
            {
                Debug.LogFormat("<color=#CC99CC>WebSocket Message received{0}</color>", message);
            }
            try
            {
                if (onReceiveTextMessageFn != null)
                {
                    onReceiveTextMessageFn.Call(message);
                }
            }
            catch (System.Exception ex)
            {
                // BuglyAgent.ReportException(ex, "WebSocketNetClient OnMessageReceived");
                Debug.LogException(ex);
            }

        }

        /// <summary>
        /// Called when we received a text message from the server，也需要做黏包处理
        /// </summary>
        void OnBinaryReceived(WebSocket webSocket, byte[] data)
        {
            ProcessBuffer(data);
        }

        private void ProcessBuffer(byte[] data)
        {
            if (mReceiveBuffer == null)
            {
                mReceiveBuffer = Buffer.Create(msgProtocolType);
                mReceiveBuffer.BeginWriting(false).Write(data);
            }
            else
            {
                mReceiveBuffer.BeginWriting(true).Write(data);      //如果之前的包没处理完全，则继续添加
            }
            //首先判断是否收满了一个完整包的最小长度
            for (int available = mReceiveBuffer.size - mOffset; available >= packetLenMin;)
            {
                //计算一个完整包的长度，包括包头和包尾
                if (mExpected == 0)
                {
                    if (msgProtocolType == 1 || msgProtocolType == 2)
                    {
                        mExpected = (int)mReceiveBuffer.PeekUInt32(mOffset + packetHeadLenOffest) + packetLenMin;    //收到的包第3-7个字节为包的长度             
                        // Debug.LogWarning(string.Format("cmd: {3}  -- mExpected大小：{0}  --  available大小：{1} -- packetLenMin{2}", mExpected, available,  packetLenMin, mReceiveBuffer.PeekUInt32(0)));
                    }
                    else
                    {
                        mExpected = mReceiveBuffer.PeekUInt16(mOffset + packetHeadLenOffest, true) + packetLenMin;               //收到的包第0-1个字节为整个包包的长度
                        // Debug.LogFormat("bytes={0} expected={1}", bytes,  mExpected);
                    }
                }

                //正好是一个完整包
                if (available == mExpected)
                {
                    if (mOffset > 0)
                    {  //如果是多个包的最后一个包
                        mReceiveBuffer.BeginWriting(false).Write(mReceiveBuffer.buffer, mOffset, (int)mExpected);
                    }
                    EnqueuePacker(mReceiveBuffer);
                    mReceiveBuffer = null;
                    mExpected = 0;
                    mOffset = 0;
                    break;
                }
                if (available > mExpected)     //收到大于一个包
                {
                    int realSize = mExpected;
                    Buffer temp = Buffer.Create(msgProtocolType);

                    temp.BeginWriting(false).Write(mReceiveBuffer.buffer, mOffset, realSize);
                    EnqueuePacker(temp);

                    temp = null;
                    available -= mExpected;
                    mOffset += realSize;
                    mExpected = 0;
                }
                else
                {
                    break;
                }
            }
        }

        void EnqueuePacker(Buffer buffer)
        {
            buffer.SetMessageName(msgDataDecompresser, needDecompressMsgName);
            if (GameConfigProject.instance.netLogSendServerShow)
            {
                Debug.LogFormat("<color=#CC99CC>WebSocket 收到服务器包：【{0}] -命令组:{1} -包长:{2} -ret:{3}</color>", clientName, buffer.messageName, buffer.size, buffer.msgRetCode);
            }
            try
            {
                if (onReceiveMessageFn != null)
                {
                    onReceiveMessageFn.Call(buffer);
                }
            }
            catch (System.Exception ex)
            {
                // throw new LuaException("OnReceiveMessage Call Lua Exception", ex);
                // BuglyAgent.ReportException(ex, "WebSocketNetClient OnReceiveMessage");
                Debug.LogException(ex);
            }
        }


        /// <summary>
        /// Called when the web socket closed
        /// </summary>
        void OnClosed(WebSocket ws, UInt16 code, string message)
        {
            if (GameConfigProject.instance.netClientStateLogShow)
            {
                Debug.Log(string.Format("<color=#CC99CC>WebSocket【{0}】 closed! Code: {1} Message: {2}</color>\n", clientName, code, message));
            }

            try
            {
                if (onEventChangeFn != null)
                {
                    onEventChangeFn.Call(NetWorkState.Closed.ToString(), code, message);
                }
            }
            catch (System.Exception ex)
            {
                // BuglyAgent.ReportException(ex, "WebSocketNetClient OnClosed");
                Debug.LogException(ex);
            }

            mWebSocket = null;
        }


        /// <summary>
        /// Called when an error occured on client side，连接失败，或者网络断开连接
        /// </summary>
        void OnError(WebSocket ws, Exception ex)
        {
            string errorMsg = string.Empty;
            int statusCode = -1;
            string errorOriginalMessage = "";
            if (ws.InternalRequest.Response != null)
            {
                errorMsg = string.Format("Status Code from Server: {0} and Message: {1}", ws.InternalRequest.Response.StatusCode, ws.InternalRequest.Response.Message);
                errorOriginalMessage = ws.InternalRequest.Response.Message;
                statusCode = ws.InternalRequest.Response.StatusCode;
            }
            if (GameConfigProject.instance.netClientStateLogShow)
            {
                Debug.Log(string.Format("<color=#CC99CC>WebSocket【{0}】 An error occured: {1}</color>\n", clientName, (ex != null ? ex.Message : "Unknown Error " + errorMsg)));
            }
            try
            {
                if (onEventChangeFn != null)
                {
                    onEventChangeFn.Call(NetWorkState.ConnectError.ToString(), statusCode, errorOriginalMessage);
                }
            }
            catch (System.Exception exe)
            {
                // BuglyAgent.ReportException(exe, "WebSocketNetClient OnError");
                Debug.LogException(exe);
            }

            CloseWebSocket();
        }

        public void SendBuffer(DNet.Buffer sendBuffer, bool recycle)
        {
            if (mWebSocket != null && mWebSocket.IsOpen && sendBuffer != null)
            {
                if (GameConfigProject.instance.netLogSendServerShow && sendBuffer.messageName != heartMsgId)
                {
                    Debug.Log(string.Format("<color=#CC99CC>WebSocket 给【{0}】服务器发包【{1}】【{2}】</color>", clientName, sendBuffer.messageName, sendBuffer.size));
                }
                mWebSocket.Send(sendBuffer.buffer, (ulong)sendBuffer.position, (ulong)sendBuffer.size);
                if (recycle)
                {
                    sendBuffer.Recycle();
                }
            }
        }

        public void SendMessage(string message)
        {
            if (mWebSocket != null && mWebSocket.IsOpen)
            {
                mWebSocket.Send(message);
            }
        }

        public void SendBinary(byte[] buffer)
        {
            if (mWebSocket != null && mWebSocket.IsOpen)
            {
                mWebSocket.Send(buffer);
            }
        }

        public void Dispose()
        {
            CloseWebSocket();
        }


        public void Disconnect()
        {
#if DEBUG
            Debug.Log("主动断开连接：" + clientName);
#endif
            CloseWebSocket();
            try
            {
                if (onEventChangeFn != null)
                {
                    onEventChangeFn.Call(NetWorkState.ConnectError.ToString());
                }
            }
            catch (System.Exception ex)
            {
                // BuglyAgent.ReportException(ex, "WebSocketNetClient Disconnect");
                Debug.LogException(ex);
            }

        }

        //客户端强制断开连接

        public void ForceDisconnect(bool triggerErrorEvent)
        {
            //主动断开连接也会触发error，所以要先把事件清空
#if DEBUG
            Debug.Log("强制断开连接：" + clientName);
#endif
            if (triggerErrorEvent)
            {
                try
                {
                    if (onEventChangeFn != null)
                    {
                        onEventChangeFn.Call(NetWorkState.ConnectError.ToString());
                    }
                }
                catch (System.Exception ex)
                {
                    // BuglyAgent.ReportException(ex, "WebSocketNetClient ForceDisconnect");
                    Debug.LogException(ex);
                }

            }
            CloseWebSocket();
        }

        //https://www.web-tinker.com/article/20310.html
        //总之，客户端直接调用close方法并不会关闭连接，而是发送请求到服务器请求对方。服务器接收请求后可以断开连接。
        //这会触发客户端的close事件。当然，在断开之前也可以发送个同样的断连请求，并包含状态码和原因描述。
        public void CloseWebSocket()
        {

            if (mWebSocket != null)
            {
#if DEBUG
                Debug.Log("主动关闭连接（清空了所有回调事件）：" + clientName);
#endif
                mWebSocket.OnOpen = null;
                mWebSocket.OnMessage = null;
                mWebSocket.OnBinary = null;
                mWebSocket.OnClosed = null;
                mWebSocket.OnError = null;
                mWebSocket.Close();
            }
            mWebSocket = null;
        }

        public void CloseWebSocketWithMsg(UInt16 code, string msg)
        {
            if (mWebSocket != null)
            {
                mWebSocket.Close(code, msg);
            }
        }


    }

}
