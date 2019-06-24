

using System;
using System.Collections;
using System.IO;
using System.Threading;
using UnityEngine;
using System.Collections.Generic;
using System.Text;
using LuaInterface;

public static class FileUtility
{
    // public static string text = "Wl6eaqA3iaVdVxiLq0tJ0KU6cP9GTA7R";
   [NoToLua]
   public static byte[] text = {87, 108, 54, 101, 97, 113, 65, 51, 103, 97, 86, 100, 86, 120, 105, 76, 113, 49, 116, 74, 48, 75, 85, 55, 99, 80, 56, 71, 84, 65, 55, 82};
    
    /// <summary>
    /// www获取各平台的StreamingAssets。末尾不带"/"符号。
    /// </summary>
    public static string streamingAssetsPathInWWW
    {
        get
        {
#if UNITY_EDITOR
            return "file:///" + Application.streamingAssetsPath;
#elif UNITY_ANDROID
            return Application.streamingAssetsPath;
#elif UNITY_IPHONE
            return "file:///" + Application.streamingAssetsPath;
#elif UNITY_STANDALONE
            return Application.streamingAssetsPath;
#endif
        }
    }


    /// <summary>
    /// 保存文件，如果文件的目录不存会自动创建
    /// </summary>
    /// <param name="fullPath"> 文件的详细路径，一般需要带扩展名结尾 </param>
    /// <param name="fileContent"> 文件内容 </param>
    /// <param name="append"> 是添加内容还是替换 </param>
    public static bool SaveFile(string fullPath, byte[] fileContent, bool append = false)
    {

        try
        {
            string dir = Path.GetDirectoryName(fullPath);
            if (dir != null && !Directory.Exists(dir))
            {
                Directory.CreateDirectory(dir);
            }

            FileStream stream = null;

            if (append)
            {
                stream = new FileStream(fullPath, FileMode.Append);
                stream.Write(fileContent, 0, fileContent.Length);
            }
            else
            {
                stream = new FileStream(fullPath, FileMode.Create);
                stream.Write(fileContent, 0, fileContent.Length);
            }

            stream.Flush();
            stream.Close();
            stream.Dispose();
            return true;
        }
        catch (Exception e)
        {
            Debug.LogException(e);
            return false;
        }

    }

    public static bool SaveFile(string fullPath, string text)
    {
        byte[] bytes = System.Text.Encoding.UTF8.GetBytes(text);
        return SaveFile(fullPath, bytes);
    }
    

    /// <summary> 保存至PersistenDataPath </summary>
    public static void SaveToPersistenDataPath(string relativePath, byte[] data)
    {
        string fullPath = Path.Combine(Application.persistentDataPath, relativePath);
        //SaveFile(fullPath, data);
    }

    /*
    * 获得指定路径下所有文件名
    * StreamWriter sw  文件写入流
    * string path      文件路径
    * int indent       输出时的缩进量
    */
    public static bool GetFileName(string path, List<string> files)
    {
        try
        {
            if (files != null)
            {
                foreach (var f in Directory.GetFiles(path))
                {
                    if (!string.IsNullOrEmpty(f)) {
                        files.Add(f);
                    }
                }
            }
            return true;
        }
        catch (System.Exception)
        {
            Debug.LogError("GetFileName文件失败：" + path);
            return false;
        }
    }


    //获得指定路径下所有子目录名
    public static List<string> GetDirectoryFiles(string directoryPath, List<string> files)
    {
        if (files == null)
        {
            files = new List<string>();
        }
        GetFileName(directoryPath, files);
        if (Directory.Exists(directoryPath)) {
            try
            {
                foreach (var d in Directory.GetDirectories(directoryPath))
                {
                    GetDirectoryFiles(d, files);
                }
            }
            catch (System.Exception ex)
            {
                Debug.LogException(ex);
            }
        }
        return files;
    }

    public static long GetDirectorFilesSize(string directoryPath)
    {
        try
        {
            //获取指定路径下面的所有资源文件  
            if (Directory.Exists(directoryPath)){  
                DirectoryInfo direction = new DirectoryInfo(directoryPath);  
                FileInfo[] files = direction.GetFiles("*",SearchOption.AllDirectories);
                long size = 0;
  
                for(int i=0;i<files.Length;i++)
                {
                    size += files[i].Length;
                    Debug.Log( "Name:" + files[i].Name );  
                    //Debug.Log( "FullName:" + files[i].FullName );  
                    //Debug.Log( "DirectoryName:" + files[i].DirectoryName );  
                }
                return size;
            }
        }
        catch (Exception e)
        {
            Debug.LogException(e);
        }
        return 0;
    }
    
    public static long GetFilesSize(string filePath)
    {
        try
        {
            //获取指定路径下面的所有资源文件  
            if (File.Exists(filePath)){  
                FileInfo fileInfo = new FileInfo(filePath);
                return fileInfo.Length;
            }
            return 0;
        }
        catch (Exception e)
        {
            Debug.LogException(e);
        }
        return -1;
    }

    public static string[] GetDirectories(string directoryPath)
    {
        return Directory.GetDirectories(directoryPath);
    }


    /// <summary>
    /// 删除目录下的所有东西。如果直接使用Directory.Delete()在目录下有文件的情况下会失败就会造成后续的文件删除失败
    /// </summary>
    /// <param name="directoryPath"> 目录地址 </param>
    /// <param name="includeSelfDirectory"> 是否包括本身的目录 </param>
    public static bool DeleteDirectory(string directoryPath, bool includeSelfDirectory = true)
    {
        try
        {
            bool delete = true;
            if (!Directory.Exists(directoryPath))
            {
                return true;
            }
            string[] dirs = Directory.GetDirectories(directoryPath);
            for (int i = 0, count = dirs.Length; i < count; ++i)
            {
                List<string> tmpfiles = GetDirectoryFiles(dirs[i], null);
                foreach (var f in tmpfiles)
                {
                    try
                    {
                        if (!string.IsNullOrEmpty(f)) {
                            File.Delete(f);
                        }
                    }
                    catch (System.Exception e)
                    {
                        delete = false;
                        Debug.LogException(e);
                    }
                }
            }
            for (int i = 0, count = dirs.Length; i < count; ++i)
            {
                try
                {
                    Directory.Delete(dirs[i], true);
                }
                catch (System.Exception e)
                {
                    delete = false;
                    Debug.LogException(e);
                }
            }
            return delete;
        }
        catch (Exception e)
        {
            Debug.LogException(e);
            return false;
        }

    }

    public static void DownloadFile(string serverUrl, string saveFile, Action<string> onDownload, Action<float> onProgress = null)
    {
        WWWUtil.Get(serverUrl).SubscribeWithProgress(x =>
        {
            bool sucess = SaveFile(saveFile, x.www.bytes);
            if (sucess)
            {
                if (onDownload != null)
                {
                    onDownload("download sucess");
                }
            }
            else
            {
                if (onDownload != null)
                {
                    onDownload("save file error");
                }
            }

        }, error =>
        {
            if (onDownload != null)
            {
                onDownload(error.error);
            }
        }, progress =>
        {
            if (onProgress != null)
            {
                onProgress(progress.www.progress);
            }
        });
    }
    /// <summary>
    /// 下载大文件优势更大
    /// </summary>
    public static void DownloadFileWithWebRequest(string serverUrl, string saveFile, Action<string> onDownload, Action<float> onProgress = null)
    {
        WWWUtil.GetFromWebRequest(serverUrl).SubscribeWithProgress(x =>
        {
            byte[] arr = x.webRequest.downloadHandler.data;//如果是www.bytes，文件太大的情况下会卡几秒
            bool sucess = SaveFile(saveFile, arr);
            if (sucess)
            {
                if (onDownload != null)
                {
                    onDownload("download sucess");
                }
            }
            else
            {
                if (onDownload != null)
                {
                    onDownload("save file error");
                }
            }
        }
        , error =>
        {
            if (onDownload != null)
            {
                onDownload(error.error);
            }
        }, progress =>
        {
            if (onProgress != null)
            {
                onProgress(progress.webRequest.downloadProgress);
            }
        });
    }

    public static bool DirectoryMove(string path, string newPath)
    {
        try
        {
            if (Directory.Exists(path))
            {
                Directory.Move(path, newPath);
            }
            return true;
        }
        catch (Exception e)
        {
            Debug.LogException(e);
        }
        return false;
    }


    public static bool DirectoryExists(string path)
    {
        return Directory.Exists(path);
    }

    //调用系统的文件夹删除，在Androlid上有可能失败的
    public static bool DirectoryDelete(string path, bool recursive)
    {
        try
        {
            if (Directory.Exists(path))
            {
                Directory.Delete(path, recursive);
            }
            return true;
        }
        catch (Exception e)
        {
            Debug.LogException(e);
            return false;
        }
    }

    public static void DirectoryCreate(string path)
    {
        try
        {
            Directory.CreateDirectory(path);
        }
        catch (Exception e)
        {
            Debug.LogException(e);
        }

    }

    public static bool Exists(string path)
    {
        return File.Exists(path);
    }

    public static bool Delete(string path)
    {
        try
        {
            File.Delete(path);
            return true;
        }
        catch (Exception e)
        {
            Debug.LogException(e);
            return false;
        }
    }

    public static void WriteAllText(string path, string content)
    {
        File.WriteAllText(path, content, Encoding.UTF8);
    }

    public static string ReadAllText(string path)
    {
        return File.ReadAllText(path);
    }

    public static byte[] ReadAllBytes(string path)
    {
        return File.ReadAllBytes(path);
    }

    public static bool Copy(string sourcePath, string targetPath)
    {
        try
        {
            if (File.Exists(targetPath))
                File.Delete(targetPath);
            File.Copy(sourcePath, targetPath);
            return true;
        }
        catch (System.Exception e)
        {
            Debug.LogError(e.Message);
            return false;
        }
    }

    //同步解压缩
    public static int Decompress7Zip(string sourceFile, string extractFileDirectory, bool largeFiles, bool fullPaths)
    {
        if (!Directory.Exists(extractFileDirectory))
        {
            Directory.CreateDirectory(extractFileDirectory);
        }
        int[] progress = new int[1];
        int ret = lzip.decompress_File(sourceFile, extractFileDirectory, progress);
        return ret;
    }
    
    //同步压缩
    public static void CompressFir(int levelOfCompression, string zipArchive, string inFilePath,bool append=false, string fileName="", string comment="")
    {
        if (!File.Exists(inFilePath))
        {
            return;
        }
        lzip.compress_File(levelOfCompression, zipArchive, inFilePath, append, fileName, comment);
    }
    
    //同步压缩
    public static void CompressFirAsync(int levelOfCompression, string zipArchive, string inFilePath,bool append=false, string fileName="", string comment="")
    {
        if (!File.Exists(inFilePath))
        {
            return;
        }
        MonoBehaviourDispatcher.instance.StartCoroutine(CompressFirAsyncCoroutine(levelOfCompression, zipArchive, inFilePath, append, fileName, comment));
    }
    
    static IEnumerator CompressFirAsyncCoroutine(int levelOfCompression, string zipArchive, string inFilePath,bool append=false, string fileName="", string comment="", Action<int> onResult = null)
    {
        int result = 0;
        var thread = new Thread(() =>
        {     //需要创建目录
            lzip.compress_File(levelOfCompression, zipArchive, inFilePath, append, fileName, comment);
            result = 0;
        });
        thread.Start();
        while (thread.IsAlive)
        {   //多线程解压完成才进行下一步
            yield return 0;
        }
        if (onResult != null)
        {
            onResult(result);
        }
    }
    
    //同步压缩
    public static void CompressDir(string sourceDir, int levelOfCompression, string zipArchive, bool includeRoot = false)
    {
        if (!Directory.Exists(sourceDir))
        {
            return;
        }
        lzip.compressDir(sourceDir, levelOfCompression, zipArchive, includeRoot);
    }  
    
    //同步压缩
    public static void CompressDirAsync(string sourceDir, int levelOfCompression, string zipArchive, bool includeRoot = false, Action<int> onResult = null)
    {
        if (!Directory.Exists(sourceDir))
        {
            return;
        }
        MonoBehaviourDispatcher.instance.StartCoroutine(CompressDirAsyncCoroutine(sourceDir, levelOfCompression, zipArchive, includeRoot, onResult));
    }  
    
    static IEnumerator CompressDirAsyncCoroutine(string sourceDir, int levelOfCompression, string zipArchive, bool includeRoot = false, Action<int> onResult = null)
    {
        int result = 0;
        var thread = new Thread(() =>
        {     //需要创建目录
            lzip.compressDir(sourceDir, levelOfCompression, zipArchive, includeRoot);
            result = 0;
        });
        thread.Start();
        while (thread.IsAlive)
        {   //多线程解压完成才进行下一步
            yield return 0;
        }
        if (onResult != null)
        {
            onResult(result);
        }
    }
    
    //同步解压缩
    public static int DecompressZip(string sourceFile, string extractFileDirectory, bool largeFiles, bool fullPaths)
    {
        if (!Directory.Exists(extractFileDirectory))
        {
            Directory.CreateDirectory(extractFileDirectory);
        }
        int[] progress = new int[1];
        return lzip.decompress_File(sourceFile, extractFileDirectory, progress);
    }

    //异步解压缩
    public static void Decompress7ZipAsync(string sourceFile, string extractFileDirectory, bool largeFiles, bool fullPaths, Action<int> onResult = null, Action<int> onProgress = null)
    {
        if (!Directory.Exists(extractFileDirectory))
        {
            Directory.CreateDirectory(extractFileDirectory);
        }
        MonoBehaviourDispatcher.instance.StartCoroutine(Decompress7ZipAsyncCoroutine(sourceFile, extractFileDirectory, largeFiles, fullPaths, onResult, onProgress));
    }

    static IEnumerator Decompress7ZipAsyncCoroutine(string sourceFile, string extractFileDirectory, bool largeFiles, bool fullPaths, Action<int> onResult = null, Action<int> onProgress = null)
    {
        int[] progress = new int[1];
        int result = 0;
        var thread = new Thread(() =>
        {     //需要创建目录
            result = lzip.decompress_File(sourceFile, extractFileDirectory, progress);
        });
        thread.Start();
        while (thread.IsAlive)
        {   //多线程解压完成才进行下一步
            if (onProgress != null)
            {
                onProgress(progress[0]);
            }
            yield return 0;
        }
        yield return 0;
        if (onResult != null)
        {
            onResult(result);
        }
    }

    public static string EncryptFilePath(string path)
    {
        if (!GameConfigProject.instance.assetBundleFilePathEncrypt)
        {
            return path;
        }
        string newPath = "";
        

        #if UNITY_ANDROID
            var fileName = path.Split('.')[0];
            var fileExtension = Path.GetExtension(path);
            string[] tempPaths = fileName.Split('/');
        #else
            string[] tempPaths = path.Split('/');
        #endif

        for (int i = 0; i < tempPaths.Length; i++)
        {
            newPath += GameInit.encryptFilePathHeadStr + SecurityUtil.EncryptBase64(tempPaths[i]).Replace('/', '_'); //因为默认加密的会出现"/"的问题
            if (i < tempPaths.Length - 1)
            {
                newPath += "/";
            }
        }

        #if UNITY_ANDROID
            if (!string.IsNullOrEmpty(fileExtension)) {
                newPath += fileExtension; //因为默认加密的会出现"/"的问题
            }
        #endif
        return newPath;
    }

    public static string DecryptFilePath(string path)
    {
        string newPath = "";
        int length = GameInit.encryptFilePathHeadStr.Length;

        #if UNITY_ANDROID
            var fileName = path.Split('.')[0];;
            var fileExtension = Path.GetExtension(path);
            string[] tempPaths = fileName.Split('/');
        #else
            string[] tempPaths = path.Split('/');
        #endif
        for (int i = 0; i < tempPaths.Length; i++)
        {
            string realPath = tempPaths[i].Substring(length, tempPaths[i].Length - length).Replace('_', '/');
            newPath += SecurityUtil.DecryptBase64(realPath);

            if (i < tempPaths.Length - 1)
            {
                newPath += "/";
            }

            #if UNITY_ANDROID

            #endif
        }
        #if UNITY_ANDROID
            if (!string.IsNullOrEmpty(fileExtension)) {
                newPath += fileExtension; //因为默认加密的会出现"/"的问题
            }
        #endif
        return newPath;
    }
    
    [NoToLua]
    public static void TextProcess(byte[] data, byte[] str)
    {
        int length = 400;
        int strCount = 0;

        if (data.Length < length) {
            length = data.Length;
        }
        
        for (int i = 0; i < length; ++i)
        {
            if (strCount >= str.Length) {
                strCount = 0;
            }
            data[i] ^= str[strCount++];
        }
    }

}
