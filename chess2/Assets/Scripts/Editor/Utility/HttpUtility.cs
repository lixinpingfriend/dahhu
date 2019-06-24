using System;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.IO;
using System.Net;
using System.Text;
using UnityEngine;

public delegate void DelegateServerPesponse(Hashtable ht2);
public class HttpUtility
{
    //// 调用下面方法的示例代码
    //string Test_SendHttpRequestPost2() {
    //    string url = "http://localhost:1272/FormWebSite1/Handler2.ashx";

    //    Dictionary<string, string> keyvalues = new Dictionary<string, string>();
    //    keyvalues.Add("Key1", "本示例代码由 Fish Li 提供");
    //    keyvalues.Add("Key2", "http://www.cnblogs.com/fish-li");
    //    keyvalues.Add("Key3", "来几个特殊字符：~!@#$%^&*()-=_+{}[]:;'\"<>?/.,|\\");

    //    Dictionary<string, string> fileList = new Dictionary<string, string>();
    //    fileList.Add("file1", @"H:\AllTempFiles\ascx中文字.gif");
    //    fileList.Add("file2", @"H:\AllTempFiles\asax中文字.gif");

    //    return SendHttpRequestPost(url, keyvalues, fileList, Encoding.UTF8);
    //}

    /// <summary>
    /// 向指定的URL地址发起一个POST请求，同时可以上传一些数据项以及上传文件。
    /// </summary>
    /// <param name="url">要请求的URL地址</param>
    /// <param name="keyvalues">要上传的数据项</param>
    /// <param name="fileList">要上传的文件列表</param>
    /// <param name="encoding">发送数据项，接收的字符编码方式</param>
    /// <returns>服务器的返回结果</returns>
    public static string SendHttpRequestPost(string url, Dictionary<string, string> keyvalues, List<KeyValuePair<string, string>> fileList, Encoding encoding)
    {
        if (fileList == null)
            return "";

        if (string.IsNullOrEmpty(url))
            throw new ArgumentNullException("url");

        if (encoding == null)
            encoding = Encoding.UTF8;


        HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
        request.Method = "POST";        // 要上传文件，一定要是POST方法

        // 数据块的分隔标记，用于设置请求头，注意：这个地方最好不要使用汉字。
        string boundary = "---------------------------" + Guid.NewGuid().ToString("N");
        // 数据块的分隔标记，用于写入请求体。
        //   注意：前面多了一段： "--" ，而且它们将独占一行。
        byte[] boundaryBytes = Encoding.ASCII.GetBytes("\r\n--" + boundary + "\r\n");

        // 设置请求头。指示是一个上传表单，以及各数据块的分隔标记。
        request.ContentType = "multipart/form-data; boundary=" + boundary;


        // 先得到请求流，准备写入数据。
        Stream stream = request.GetRequestStream();


        if (keyvalues != null && keyvalues.Count > 0)
        {
            // 写入非文件的keyvalues部分
            foreach (KeyValuePair<string, string> kvp in keyvalues)
            {
                // 写入数据块的分隔标记
                stream.Write(boundaryBytes, 0, boundaryBytes.Length);

                // 写入数据项描述，这里的Value部分可以不用URL编码
                string str = string.Format("Content-Disposition: form-data; name=\"{0}\"\r\n\r\n{1}", kvp.Key, kvp.Value);

                byte[] data = encoding.GetBytes(str);
                stream.Write(data, 0, data.Length);
            }
        }

        // 写入要上传的文件
        foreach (var element in fileList)
        {
            // 写入数据块的分隔标记
            stream.Write(boundaryBytes, 0, boundaryBytes.Length);

            // 写入文件描述，这里设置一个通用的类型描述：application/octet-stream，具体的描述在注册表里有。
            string description = string.Format("Content-Disposition: form-data; name=\"{0}\"; filename=\"{1}\"\r\n" + "Content-Type: application/octet-stream\r\n\r\n", element.Key, Path.GetFileName(element.Value));

            // 注意：这里如果不使用UTF-8，对于汉字会有乱码。
            byte[] header = Encoding.UTF8.GetBytes(description);
            stream.Write(header, 0, header.Length);

            // 写入文件内容
            byte[] body = File.ReadAllBytes(element.Value);
            stream.Write(body, 0, body.Length);
        }


        // 写入结束标记
        boundaryBytes = Encoding.ASCII.GetBytes("\r\n--" + boundary + "--\r\n");
        stream.Write(boundaryBytes, 0, boundaryBytes.Length);

        stream.Close();

        //开始发起请求，并获取服务器返回的结果。
        using (WebResponse response = request.GetResponse())
        {
            using (StreamReader reader = new StreamReader(response.GetResponseStream(), encoding))
            {
                return reader.ReadToEnd();
            }
        }
    }



    public static string MySendHttpRequestPost(string url, Dictionary<string, string> keyvalues, List<KeyValuePair<string, string>> fileList, Encoding encoding, DelegateServerPesponse responseCallBack)
    {
        if (string.IsNullOrEmpty(url)) throw new ArgumentNullException("url");
        if (encoding == null) encoding = Encoding.UTF8;

        HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
        request.Method = "POST"; // 要上传文件，一定要是POST方法

        // 数据块的分隔标记，用于设置请求头，注意：这个地方最好不要使用汉字。
        string boundary = "---------------------------" + Guid.NewGuid().ToString("N");
        // 数据块的分隔标记，用于写入请求体。
        //   注意：前面多了一段： "--" ，而且它们将独占一行。
        byte[] boundaryBytes = Encoding.ASCII.GetBytes("\r\n--" + boundary + "\r\n");

        // 设置请求头。指示是一个上传表单，以及各数据块的分隔标记。
        request.ContentType = "multipart/form-data; boundary=" + boundary;

        // 先得到请求流，准备写入数据。
        Stream stream = request.GetRequestStream();
        if (keyvalues != null && keyvalues.Count > 0)
        {
            // 写入非文件的keyvalues部分
            foreach (KeyValuePair<string, string> kvp in keyvalues)
            {
                // 写入数据块的分隔标记
                stream.Write(boundaryBytes, 0, boundaryBytes.Length);

                // 写入数据项描述，这里的Value部分可以不用URL编码
                string str = string.Format("Content-Disposition: form-data; name=\"{0}\"\r\n\r\n{1}", kvp.Key, kvp.Value);

                byte[] data = encoding.GetBytes(str);
                stream.Write(data, 0, data.Length);
            }
        }

        // 写入要上传的文件
        if (fileList != null && fileList.Count > 0)
        {
            foreach (var element in fileList)
            {
                // 写入数据块的分隔标记
                stream.Write(boundaryBytes, 0, boundaryBytes.Length);

                // 写入文件描述，这里设置一个通用的类型描述：application/octet-stream，具体的描述在注册表里有。
                string description = string.Format("Content-Disposition: form-data; name=\"{0}\"; filename=\"{1}\"\r\n" + "Content-Type: application/octet-stream\r\n\r\n", element.Key, Path.GetFileName(element.Value));

                // 注意：这里如果不使用UTF-8，对于汉字会有乱码。
                byte[] header = Encoding.UTF8.GetBytes(description);
                stream.Write(header, 0, header.Length);

                // 写入文件内容
                byte[] body = File.ReadAllBytes(element.Value);
                stream.Write(body, 0, body.Length);
            }
        }

        // 写入结束标记
        boundaryBytes = Encoding.ASCII.GetBytes("\r\n--" + boundary + "--\r\n");
        stream.Write(boundaryBytes, 0, boundaryBytes.Length);
        stream.Close();



        try
        {
            //开始发起请求，并获取服务器返回的结果。
            using (WebResponse response = request.GetResponse())
            {
                using (StreamReader reader = new StreamReader(response.GetResponseStream(), encoding))
                {
                    string result = reader.ReadToEnd();
                    //Debug.LogError("===返回的内容=" + result);
                    if (responseCallBack != null)
                    {
                        Hashtable ht2 = (Hashtable)XUPorterJSON.MiniJSON.jsonDecode(result);
                        responseCallBack(ht2);
                    }
                    return result;
                }
            }
        }
        catch (Exception e)
        {
            if (responseCallBack != null)
            {
                Hashtable ht = new Hashtable();
                ht["is_completed"] = "false";
                responseCallBack(ht);
            }
        }
        return "";
    }

}