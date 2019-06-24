
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using System;
using System.IO;
using Aliyun.OSS;
using Aliyun.OSS.Common;
using Aliyun.OSS.Util;
using BestHTTP;
using System.Security.Cryptography;
using System.Text;

namespace ABEditor{
	
public class AbUpLoadMessage{
	public List<AbUpLoadInfo> infos = new List<AbUpLoadInfo>();
}

public class AbUpLoadInfo{
	public string fileName;
	public string filePath;
	public string errormsg;
	public bool isSuccess;
	public int size;
}

public class UploadFileInfo
{
	public string fileNmae;
	public string filePath;
	public UploadFileInfo(string fileNmae, string filePath){
		this.fileNmae = fileNmae;
		this.filePath = filePath;
	}
}

[InitializeOnLoad]
public class AseetBundleUpload {

        static string accessKeyId = GameEditorConfig.ossAccessKeyId;//"LTAIPNuEYMC30imR";
        static string accessKeySecret = GameEditorConfig.ossAccessKeySecret;//"jxkDnZDCUYZ4G0Fz7J1VDp6bOqOuk7";

        static string host = GameEditorConfig.ossHost;//"game.oss.sincebest.com";

	private static int curUpLoadIndex = 0;
	private static List<UploadFileInfo> fileInfos = new List<UploadFileInfo>();
	private static AbUpLoadMessage finishMessage = new AbUpLoadMessage();

	/// <summary> 上传完成回调 </summary>
	private static OnUploadFinishDelegate finishCallBack;

	public delegate void OnUploadFinishDelegate(bool isSuccess, AbUpLoadMessage msg); 

	static bool waitingForUpLoad = false;
	static bool isLock = false;

	static AseetBundleUpload ()  
    {  
        EditorApplication.update += Update;  
    }  
  
    static void Update ()  
    {  
		if(!isLock && EditorApplication.isCompiling && waitingForUpLoad)
		{
			isLock = true;
			EditorApplication.LockReloadAssemblies();
			Debug.Log("Lock Assets");
		}
    }

    public static string getCdnUrl()
    {
        return "http://" + host + "/";
    }
	
	

	/// <summary> 
	/// 全部上传成功回调 
	/// fileList : key -> filename  value -> filepath
	/// callback : 上传完成后回调
	/// </summary>
	public static void UpLoadFiles(List<KeyValuePair<string, string>> fileList, OnUploadFinishDelegate callback = null){

		if(fileList == null) 
		{
			Debug.Log("error: Upload files = null");
			return;
		}
		Clear();
		waitingForUpLoad = true;

		foreach (var element in fileList)
		{
			UploadFileInfo info = new UploadFileInfo(element.Key,element.Value);
			fileInfos.Add(info);
		}

		if(fileInfos.Count > 0)
		{
			finishCallBack = callback;
			UpLoadFile(fileInfos[curUpLoadIndex]);
		}
	}

	private static void UpLoadFile(UploadFileInfo info)
	{
		string key = info.fileNmae;
		string file = info.filePath;

		string bucketFilePath = "/" + key;
		string url = "http://" + host + bucketFilePath;
		Debug.Log("upload url = " + url);
		string contentMD5 =  GetFileMD5(file);
		string contentType = "application/octet-stream";
		string utcGMT = DateTime.UtcNow.ToString("r");
		string canonicalizedOSSHeaders = ""; 
		string canonicalizedResource = GameEditorConfig.ossCanonicalizedResourcePath +key;
		string authorization = GetAuthorization("PUT",contentMD5,contentType,utcGMT,canonicalizedOSSHeaders,canonicalizedResource);
		Debug.Log("autorzation = " + authorization);

		

		HTTPRequest request = new HTTPRequest(new Uri(url), HTTPMethods.Put, true, OnRequestCallBack);
		request.OnUploadProgress = OnUploadProgress;
		request.UploadStream = new FileStream(file, FileMode.Open);

		AbUpLoadInfo upLoadInfo = new AbUpLoadInfo();
		upLoadInfo.fileName = fileInfos[curUpLoadIndex].fileNmae;
		upLoadInfo.size = (int)request.UploadStream.Length;
		upLoadInfo.filePath = url;
		finishMessage.infos.Add(upLoadInfo);

		request.AddHeader("Content-Encoding", "utf-8");
		request.AddHeader("Content-Md5", contentMD5);
		request.AddHeader("Content-Disposition", "attachment;filename=" + key);
		request.AddHeader("Date", utcGMT);
		request.AddHeader("Content-Length", request.UploadStream.Length.ToString());
		request.AddHeader("Host", host);
		request.AddHeader("Authorization", authorization); 
		request.Send();
	}

	public static void OnRequestCallBack(HTTPRequest request, HTTPResponse response)
	{	
		AbUpLoadInfo info = finishMessage.infos.Find((a)=>a.fileName == fileInfos[curUpLoadIndex].fileNmae);
		info.isSuccess = response.IsSuccess;
		info.errormsg = response.DataAsText;
		

		Debug.Log("Finish upload " + info.fileName + ", path = "+info.filePath+", size = "+info.size+", isSuccess = " + info.isSuccess);
		Debug.Log("errormsg = " + info.errormsg);

		

		curUpLoadIndex++;
		if(curUpLoadIndex >= fileInfos.Count)
			DoAction();
		else
			UpLoadFile(fileInfos[curUpLoadIndex]);
	}

	public static void OnUploadProgress(HTTPRequest request, long uploaded, long uploadLength)
	{
		string per = String.Format( "{0:N2} ",   ((float)(uploaded + 0.0f) / (float)(uploadLength + 0.0f) * 100f));
		Debug.Log("UpLoad "+ fileInfos[curUpLoadIndex].fileNmae +": " + uploaded + "/" + uploadLength + "     " + per + "%");
	}

	private static string GetAuthorization(
        string method, string contentMD5, string contentType,
        string utcGMT, string canonicalizedOSSHeaders, string canonicalizedResource)
    {
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
	private static string ToHMACSHA1_Base64(string key, string data)
    {
        HMACSHA1 hmacsha1 = new HMACSHA1();
        hmacsha1.Key = Encoding.UTF8.GetBytes(key);
        byte[] dataBuffer = Encoding.UTF8.GetBytes(data);
        byte[] hashBytes = hmacsha1.ComputeHash(dataBuffer);
        string result = Convert.ToBase64String(hashBytes);

        return result;
    }

	private static string GetFileMD5(string filePath)
    {
        FileStream file = new FileStream(filePath, FileMode.Open);
        MD5 md5 = new MD5CryptoServiceProvider();
        byte[] hashBytes = md5.ComputeHash(file);
        file.Close();
        string result = Convert.ToBase64String(hashBytes);

        return result;
    }

	private static void DoAction()
	{
		if(finishCallBack != null)
		{
			bool isFinish = true;
			for(int i = 0; i < finishMessage.infos.Count; i ++)
			{
				if(!finishMessage.infos[i].isSuccess)
				{
					isFinish = false;
					break;
				}
			}
			finishCallBack(isFinish,finishMessage);
		}
		Clear();
	}

	private static void Clear()
	{
		fileInfos = new List<UploadFileInfo>();
		curUpLoadIndex = 0;
		finishCallBack = null;
		finishMessage = new AbUpLoadMessage();
		
	}

	/// <summary> 
	/// UnlockReloadAssemblies 
	/// 在使用此类上传完成后请务必调用Dispose方法解锁资源，不然会一直卡编译
	/// </summary>
	public static void Dispose()
	{
		isLock = false;
		waitingForUpLoad = false;
		EditorApplication.UnlockReloadAssemblies();
		AssetDatabase.SaveAssets();
		AssetDatabase.Refresh();
		Debug.Log("unLock Assets");
		Debug.Log("EditorApplication.isPaused = " + EditorApplication.isPaused);
	}
}
}