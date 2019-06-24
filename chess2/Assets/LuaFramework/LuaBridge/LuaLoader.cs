using System;
using UnityEngine;
using System.Collections;
using UnityEngine;
using LuaInterface;
using System.IO;
using System.Text;
using GameAsset;
using LuaInterface;

public class LuaLoader : LuaFileUtils {


    public LuaLoader() {
        instance = this;
        beZip = false;
    }

    private void Reload() {
        FileUtility.DirectoryDelete(Application.persistentDataPath, true);
        AssetBundleManager.instance.Reset(true);
        CustomerUtil.ReloadCurScene();
    }

    public static bool LuaFileIsLoaded(string luaAssetBundlePath) {
        // foreach (var item in instance.zipMap)
        // {
        //     Debug.Log(item.Key);
        // }
        return instance.zipMap.ContainsKey(luaAssetBundlePath);
    }

    public override byte[] ReadFile(string fileName) {
        //Debug.Log("ReadFile-------------------------------");
        byte[] buffer = null;
        if (GameConfigProject.instance.assetLoadType == 1) {
            buffer = ReadDownLoadFile(fileName);

            if (buffer == null) {
                beZip = true;
                buffer = ReadStreamingAssetsFile(fileName);
            }

            // if (buffer == null) {
            //     buffer = ReadResourceFile(fileName);
            // }
        }

        if (buffer == null) {
            buffer = base.ReadFile(fileName);
        }

        return buffer;
    }

    public override string FindFileError(string fileName) {
        if (Path.IsPathRooted(fileName)) {
            return fileName;
        }

        StringBuilder sb = StringBuilderCache.Acquire();

        if (Path.GetExtension(fileName) == ".lua") {
            fileName = fileName.Substring(0, fileName.Length - 4);
        }

        for (int i = 0; i < searchPaths.Count; i++) {
            sb.AppendFormat("\n\tno file '{0}'", searchPaths[i]);
        }

        sb.AppendFormat("\n\tno file ./Resources/?.lua");
        sb = sb.Replace("?", fileName);
        return StringBuilderCache.GetStringAndRelease(sb);
    }

    //这个是有问题的做法，如果更新了错误的脚本文件
    byte[] ReadStreamingAssetsFile(string fileFullName) {
        StringBuilder sb = StringBuilderCache.Acquire();
        AssetBundle assetBundle = null;
        sb.Append("lua");
        string assetFullName = null;
        string zipName = fileFullName;
        int pos = zipName.LastIndexOf('/');

        if (pos > 0) {
            sb.Append("_");
            sb.Append(zipName.Substring(0, pos).ToLower());        //shit, unity5 assetbund'name must lower
            sb.Replace('/', '_');
            zipName = zipName.Substring(pos + 1);
        }

        if (!zipName.EndsWith(".lua")) {
            zipName += ".lua";
            assetFullName = "assets/temp/lua/" + fileFullName + ".lua.bytes";
        }
        else {
            assetFullName = "assets/temp/lua/" + fileFullName + ".bytes";
        }

        byte[] buffer = null;

        if (!zipMap.TryGetValue(StringBuilderCache.GetStringAndRelease(sb), out assetBundle)) {
            string filePath = null;
#if UNITY_EDITOR
            filePath = string.Format("{0}/AssetDataBytes/AssetBundle/lua/{1}.bytes", DataConfigProject.platform, StringBuilderCache.GetStringAndRelease(sb));
            // Debug.Log(filePath);
            filePath = Path.Combine(Application.streamingAssetsPath, FileUtility.EncryptFilePath(filePath));
#elif UNITY_ANDROID
            filePath = string.Format("Android/AssetDataBytes/AssetBundle/lua/{0}.bytes", StringBuilderCache.GetStringAndRelease(sb));
            filePath = Path.Combine(Application.dataPath + "/assets", FileUtility.EncryptFilePath(filePath));
#else
            filePath = string.Format("{0}/AssetDataBytes/AssetBundle/lua/{1}.bytes", DataConfigProject.platform, StringBuilderCache.GetStringAndRelease(sb));
            filePath = Path.Combine(Application.streamingAssetsPath, FileUtility.EncryptFilePath(filePath));
#endif
            try
            {
                assetBundle = AssetBundle.LoadFromFile(filePath);   //安卓下也可以直接读取
            }
            catch (System.Exception ex)
            {
                BuglyAgent.ReportException(ex, "ReadStreamingAssetsFile没找到Lua脚本");
                //Reload();
            }
            if (assetBundle != null) {
                AddSearchBundle(StringBuilderCache.GetStringAndRelease(sb), assetBundle);
            } else {
                //Reload();
            }
        }

        if (assetBundle != null) {
            var luaCode = assetBundle.LoadAsset<TextAsset>(assetFullName);
            if (luaCode != null) {
                buffer = luaCode.bytes;
                //Debug.Log("Read StreamingAssets File-------------------------------");
                //Debug.Log("loaCode.text = " + luaCode.text);
                /*  屏蔽解密
                    //string decodeScript = LuaEncryption.AesDecryptor(luaCode.text);
                    //Debug.Log("decodeScript = " + decodeScript);
                    //buffer = System.Text.Encoding.UTF8.GetBytes(decodeScript);
                */
                if (GameConfigProject.instance.luaScriptProcess) {
                    FileUtility.TextProcess(buffer, FileUtility.text);
                }
                
                Resources.UnloadAsset(luaCode);
            }
            else {
                Debug.LogError("没找到Lua脚本：" + assetFullName);
            }
        }
        return buffer;
    }

    byte[] ReadDownLoadFile(string fileFullName) {
        StringBuilder sb = StringBuilderCache.Acquire();
        AssetBundle assetBundle = null;
        sb.Append("lua");
        string assetFullName = null;
        string zipName = fileFullName;
        int pos = zipName.LastIndexOf('/');

        if (pos > 0) {
            sb.Append("_");
            sb.Append(zipName.Substring(0, pos).ToLower());        //shit, unity5 assetbund'name must lower
            sb.Replace('/', '_');
            zipName = zipName.Substring(pos + 1);
        }

        if (!zipName.EndsWith(".lua")) {
            assetFullName = "assets/temp/lua/" + fileFullName + ".lua.bytes";
        } else {
            assetFullName = "assets/temp/lua/" + fileFullName + ".bytes";
        }

        byte[] buffer = null;

        if (!zipMap.TryGetValue(StringBuilderCache.GetStringAndRelease(sb), out assetBundle)) {
            string filePath = string.Format("{0}/assetsdata/lua/{1}.bytes", Application.persistentDataPath, StringBuilderCache.GetStringAndRelease(sb));
            if (File.Exists(filePath)) {
                try
                {
                    assetBundle = AssetBundle.LoadFromFile(filePath);
                }
                catch (System.Exception ex)
                {
                    BuglyAgent.ReportException(ex, "ReadDownLoadFile没找到Lua脚本");
                    //Reload();
                }

                if (assetBundle != null) {
                    AddSearchBundle(StringBuilderCache.GetStringAndRelease(sb), assetBundle);
                } else {
                    // BuglyAgent.ReportException(new Exception("ReadDownLoadFile没找到Lua脚本"));
                    //Reload();
                }
            }
        }

        if (assetBundle != null) {
            var luaCode = assetBundle.LoadAsset<TextAsset>(assetFullName);
            if (luaCode != null) {
                //Debug.Log("Read DownLoad File-------------------------------");
                //Debug.Log("loaCode.text = " + luaCode.text);
                buffer = luaCode.bytes;
                /* 屏蔽解密
                    string decodeScript = LuaEncryption.AesDecryptor(luaCode.text);
                    //Debug.Log("decodeScript = " + decodeScript);
                    buffer = System.Text.Encoding.UTF8.GetBytes(decodeScript);
                 */
                if (GameConfigProject.instance.luaScriptProcess) {
                    FileUtility.TextProcess(buffer, FileUtility.text);
                }                
                Resources.UnloadAsset(luaCode);
            } else {
                Debug.LogError("没找到Lua脚本：" + assetFullName);
            }
        }
        return buffer;
    }


}
