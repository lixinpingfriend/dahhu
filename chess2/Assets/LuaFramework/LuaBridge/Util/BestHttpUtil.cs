using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using LuaInterface;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.Networking;
using BestHTTP;
using System.IO;

public static class BestHttpUtil {
    //带有超时机制的请求
    public static BestHttpOperation Create(string url, string method, Dictionary<string, string> headers, float overTime) {
        var bestHttpOperation = new BestHttpOperation(url, method, headers, true, true, overTime);
        MonoBehaviourDispatcher.instance.AddCoroutine(bestHttpOperation);
        return bestHttpOperation;
    }
}



public class BestHttpOperation : IEnumerator{

    private float mRequestTime;
    private float mOverTime;

    private Action<BestHttpOperation> mOnComplete;
    private Action<BestHttpOperation> mOnProgress;
    private Action<string> mOnError;

    private bool mIsFinish;
    private bool mIsAbort;
    private string mUrl;
    private HTTPMethods mHTTPMethods;
    private bool mIsKeepAlive;
    private bool mDisableCache;
    private Dictionary<string, string> mHeadersDic;

    private HTTPRequest m_httpReq;
    private HTTPResponse m_httpRsp;

    public HTTPRequest httpReq{
        get{ return m_httpReq;}
    }

    public HTTPResponse httpRsp{
        get{ return m_httpRsp;}
    }

     [NoToLua]
    public BestHttpOperation(string url, string method, Dictionary<string, string> headers, bool isKeepAlive, bool disableCache, float timeOut)
    {
        this.mUrl = url;
        this.mHTTPMethods = (HTTPMethods)Enum.Parse(typeof(HTTPMethods), method);
        this.mIsKeepAlive = isKeepAlive;
        this.mDisableCache = disableCache;
        this.mHeadersDic = headers;
        mRequestTime = 0;
        mOverTime = timeOut;
        this.m_httpReq = new HTTPRequest(new Uri(this.mUrl), this.mHTTPMethods, this.mIsKeepAlive, this.mDisableCache, this.OnRequestFinished);
        this.m_httpReq.OnUploadProgress = this.OnUploadProgress;
        if(this.mHeadersDic != null){
            foreach (KeyValuePair<string, string> item in this.mHeadersDic) {
                this.httpReq.AddHeader(item.Key, item.Value);
            }
        }
    }

    [NoToLua]
    public object Current {
        get { return null; }
    }

    [NoToLua]
    public bool MoveNext() {
        if(mIsFinish){
            return false;
        }
        if(mIsAbort){
            return false;
        }
        if (mRequestTime > 0 && mOverTime > 0.1f && Time.realtimeSinceStartup - mRequestTime >= mOverTime) {
            string error = "Network Timeout";
            if (mOnError != null) {
                mOnError(error);
            }
            #if DEBUG
                Debug.LogError("Network Timeout! url = " + this.mUrl);
            #endif
            //停止请求
            this.Abort();
            return false;
        }
        return true;
    }

    [NoToLua]
    public void Reset() {

    }

    [NoToLua]
    private void OnRequestFinished(HTTPRequest request, HTTPResponse response) {
        this.m_httpRsp = response;
        mIsFinish = true;
        if(mOnComplete != null){
            mOnComplete(this);
        }
    }

    [NoToLua]
    private void OnUploadProgress(HTTPRequest request, long uploaded, long total)
	{
        if(mOnProgress != null){
            mOnProgress(this);
        }
	}

    public BestHttpOperation Subscribe(Action<BestHttpOperation> onComplete, Action<BestHttpOperation> onProgress = null, Action<string> onError = null) {
        mOnComplete = onComplete;
        mOnProgress = onProgress;
        mOnError = onError;
        return this;
    }

    public BestHttpOperation AddBinaryData(string fieldName, byte[] content, string fileName)
    {
        this.m_httpReq.AddBinaryData(fieldName, content, fileName);
        return this;
    }

    public BestHttpOperation AddField(string fieldName, string value)
    {
        this.m_httpReq.AddField(fieldName, value);
        return this;
    }

    public BestHttpOperation SetUploadStream(string filePath)
    {
        this.m_httpReq.UploadStream = new FileStream(filePath, FileMode.Open);
        return this;
    }

    public BestHttpOperation SetStreamData(byte[] bytes)
    {
        this.m_httpReq.UploadStream = new MemoryStream(bytes);
        return this;
    }

    public BestHttpOperation Start()
    {
        this.m_httpReq.Send();
        mRequestTime = Time.realtimeSinceStartup;
        return this;
    }

    public BestHttpOperation Abort()
    {
        this.mIsAbort = true;
        this.m_httpReq.Abort();
        return this;
    }
}

