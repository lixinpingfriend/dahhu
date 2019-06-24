

using System.Diagnostics;
using System.IO;


#if UNITY_EDITOR
using UnityEditor;
#endif
using UnityEngine;
using Debug = UnityEngine.Debug;

//To create a hotkey you can use the following special characters: % (ctrl on Windows, cmd on OS X), # (shift), & (alt

public class CustomProjectMenuItem
{
    public static void SvnOperation(string path, bool update = true)
    {
        string svnExePath = EditorPrefs.GetString("SvnExePath", "");
        if (string.IsNullOrEmpty(svnExePath))
        {
            svnExePath = EditorUtility.OpenFilePanel("选择TortoiseProc.exe文件", "", "exe");
            if (svnExePath.Contains("TortoiseProc.exe"))
            {
                EditorPrefs.SetString("SvnExePath", svnExePath);
            }
            else {
                EditorPrefs.SetString("SvnExePath", "");
                EditorUtility.DisplayDialog("路径选择", "路径选择错误！请重新选择。", "确定");
                return;
            }
        }
        Process proSvnExe = new Process();
        proSvnExe.StartInfo.WorkingDirectory = Path.GetDirectoryName(svnExePath);
        proSvnExe.StartInfo.FileName = svnExePath;
        proSvnExe.StartInfo.CreateNoWindow = false;
        if (update)
        {
            proSvnExe.StartInfo.Arguments = "/command:update" + " /path:" + path;
        }
        else {
            proSvnExe.StartInfo.Arguments = "/command:commit" + " /path:" + path;
        }

        proSvnExe.Start();
        proSvnExe.WaitForExit();
    }

    [MenuItem("Tools/OpenUnity")]
    public static void OpenUnity(){           
        Process proc = new System.Diagnostics.Process ();  
        Debug.Log(EditorApplication.applicationPath);
        
        proc.StartInfo.FileName = "/bin/bash";
        proc.StartInfo.Arguments = "-c \" " + "open -na " + EditorApplication.applicationPath + " \""; 
        proc.StartInfo.UseShellExecute = false;  
        proc.StartInfo.RedirectStandardOutput = true;  
        proc.Start ();
    }


    [MenuItem("Tools/文件夹管理/打开PersistentData目录", false, 1)]
    static void OpenPersistenDataDirInIExplorer()
    {
        string path = Application.persistentDataPath;
        EditorUtility.RevealInFinder(path);
    }

    [MenuItem("Tools/文件夹管理/删除PersistentData下所有文件及文件夹", false, 1)]
    static void DeleteFilesInPersistentDataPath()
    {
        string path = Application.persistentDataPath;
        FileUtil.DeleteFileOrDirectory(path);
        Debug.Log(string.Format("成功删除文件夹{0}", path));
    }

    [MenuItem("Tools/文件夹管理/打开TmpPath目录", false, 2)]
    static void OpenTmpDataDirInIExplorer()
    {
        string path = Application.temporaryCachePath;
        EditorUtility.RevealInFinder(path);
    }

    [MenuItem("Tools/文件夹管理/删除TmpPath目录", false, 2)]
    static void DeleteTmpDataDirInIExplorer()
    {
        string path = Application.temporaryCachePath;
        FileUtil.DeleteFileOrDirectory(path);
        Debug.Log(string.Format("成功删除文件夹{0}", path));
    }

    [MenuItem("Tools/文件夹管理/打开ExternalAssetBundles目录")]
    static void OpeExternalAssetBundleDirInIExplorer()
    {
        string path = DataConfigProject.externalAssetBundlePath;
        EditorUtility.RevealInFinder(path);
    }

    [MenuItem("Tools/文件夹管理/复制资源到StreamingAssetsData目录", false, 3)]
    public static void CopyAssetBundlesToStreamingAssetsData()
    {
        FileUtil.DeleteFileOrDirectory(Application.streamingAssetsPath + "/assetsdata");
        Directory.CreateDirectory(Application.streamingAssetsPath + "/assetsdata");

        var source = DataConfigProject.externalAssetBundlePath;
        if (!System.IO.Directory.Exists(source))
            Debug.Log("No assetBundle output folder, try to build the assetBundles first.");

        var destination = System.IO.Path.Combine(Application.streamingAssetsPath, "Data");
        if (System.IO.Directory.Exists(destination))
            FileUtil.DeleteFileOrDirectory(destination);

        FileUtil.CopyFileOrDirectory(source, destination);
        AssetDatabase.Refresh();
    }

    [MenuItem("Tools/文件夹管理/清空StreamingAssetsData目录", false, 3)]
    public static void ClearStreamingAssetsData()
    {
        // var destination = Application.streamingAssetsPath + "/assetsdata";
        // if (System.IO.Directory.Exists(destination))
        // {
        //     FileUtil.DeleteFileOrDirectory(destination);
        //     Directory.CreateDirectory(destination);
        // }
        // AssetDatabase.Refresh();

    // ProcessStartInfo psi = new ProcessStartInfo(); 
    // psi.UseShellExecute = true; 

        // ProcessStartInfo proc = new ProcessStartInfo();
        // proc.FileName = "open";
        // proc.WorkingDirectory = "/users/dred/desktop";
        // proc.Arguments = "version.txt";
        // proc.WindowStyle = ProcessWindowStyle.Minimized;
        // proc.CreateNoWindow = true;
        // Process.Start(proc);
        // UnityEngine.Debug.Log("Halløjsa");


        // Debug.Log(arguments);
        var process = Process.Start(new ProcessStartInfo {
            UseShellExecute = true,
            // CreateNoWindow = false,
            Arguments = "\"a /Users/dred/Workbench/UnityProject/Chess/ChessUnityProject/AssetBundles/Android/AndroidVersion/1703031753/1703040836/incremental/../incremental \"/Users/dred/Workbench/UnityProject/Chess/ChessUnityProject/AssetBundles/Android/AndroidVersion/1703031753/1703040836/incremental/*\" \"/Users/dred/Workbench/UnityProject/Chess/ChessUnityProject/AssetBundles/Android/AndroidVersion/1703031753/1703040836/incremental/../version.txt\"" ,
            FileName = "7za"
            //FileName = Application.dataPath + "/ThirdLibs/7zip/7z.exe"
        });
        if (process != null)
            process.WaitForExit();

    }
    
    [MenuItem("Tools/Android/更新MainSDK.Jar", false, 3)]
    public static void UpdateMainSDKJar()
    {
        string filePath = EditorPrefs.GetString("AndroidMainSDKJarPath", "");
        if (string.IsNullOrEmpty(filePath)) {
            filePath = EditorUtility.OpenFilePanel("选择mainsdk.jar路径", "", "jar");
            if (filePath.Contains("jar")) {
                EditorPrefs.SetString("AndroidMainSDKJarPath", filePath);
            } else {
                EditorPrefs.SetString("AndroidMainSDKJarPath", "");
                EditorUtility.DisplayDialog("路径选择", "路径选择错误！请重新选择。", "确定");
            }
        }
        

        if (File.Exists(filePath))
        {
            string targetFile = Application.dataPath + "/Plugins/Android/libs/mainsdk.jar";
            File.Delete(targetFile);
            FileUtil.CopyFileOrDirectory(filePath, targetFile);
            Debug.Log("更新mainsdk.jar成功");
        }
        else
        {
            Debug.LogError("更新mainsdk.jar失败");
        }
    }
    
    [MenuItem("Tools/Android/更新EntrySdk.Jar", false, 3)]
    public static void UpdateEntryJar()
    {
        string filePath = EditorPrefs.GetString(Application.productName +  "AndroidEntryJarPath", "");
        if (string.IsNullOrEmpty(filePath)) {
            filePath = EditorUtility.OpenFilePanel("选择mainsdk.jar路径", "", "jar");
            if (filePath.Contains("jar")) {
                EditorPrefs.SetString(Application.productName +  "AndroidEntryJarPath", filePath);
            } else {
                EditorPrefs.SetString(Application.productName +  "AndroidEntryJarPath", "");
                EditorUtility.DisplayDialog("路径选择", "路径选择错误！请重新选择。", "确定");
            }
        }
        

        if (File.Exists(filePath))
        {
            string targetFile = Application.dataPath + "/Plugins/Android/libs/entrysdk.jar";
            File.Delete(targetFile);
            FileUtil.CopyFileOrDirectory(filePath, targetFile);
            Debug.Log("更新entrysdk.jar成功");
        }
        else
        {
            Debug.LogError("更新entrysdk.jar失败");
        }
    }

    [MenuItem("Tools/Proto生成/一键生成所有", false, 3)]
    public static void GenAllLuaPbFromProtoForClient()
    {
        string outDirPath;
        string batPath = GenGenCmds(out outDirPath);
        GenLuaPbFromProtoFilesForClient(batPath, outDirPath);
    }

    [MenuItem("Tools/Proto生成/生成指定proto", false, 3)]
    public static void GenLuaPbFromProtoForClient()
    {
        string outDirPath;
        string protoDirPath = System.IO.Path.GetFullPath(System.IO.Path.Combine(Application.dataPath , "../Public/probuff"));
        string protoFilePath = EditorUtility.OpenFilePanel("选择需要生成的proto文件", protoDirPath, "proto");
       if (protoFilePath.Length != 0)
       {
            string batPath = GenGenCmds(out outDirPath, protoFilePath);
            GenLuaPbFromProtoFilesForClient(batPath, outDirPath);
       }
    }

    public static void GenLuaPbFromProtoFilesForClient(string batPath, string outDirPath)
    {
        GenLuaProto(batPath);
        MoveLuaProtoToClient(outDirPath);
        AssetDatabase.Refresh();
        Debug.Log("生成Proto完成");
    }

    private static string GenGenCmds(out string outDirPath, string path = null)
    {
        string batPath = System.IO.Path.GetFullPath(System.IO.Path.Combine(Application.dataPath , "../Public/client/test.bat"));
        string protoDirPath = System.IO.Path.GetFullPath(System.IO.Path.Combine(Application.dataPath , "../Public/probuff"));
        outDirPath = System.IO.Path.GetFullPath(System.IO.Path.Combine(Application.dataPath, "../Public/out_lua_pb"));
        if(System.IO.Directory.Exists(outDirPath)){
            System.IO.Directory.Delete(outDirPath, true);
        }
        string exePath = System.IO.Path.GetFullPath(System.IO.Path.Combine(Application.dataPath , "../Public/client/protoc-gen-lua/example/protoc.exe"));
        string pluginPath = System.IO.Path.GetFullPath(System.IO.Path.Combine(Application.dataPath , "../Public/client/protoc-gen-lua/plugin/build.bat"));
        string[] filePaths;
        if(path != null && path != string.Empty)
        {
            filePaths = new string[]{path};
        }
        else
        {
            filePaths = System.IO.Directory.GetFiles(protoDirPath, "*.proto", SearchOption.AllDirectories);
        }
        string cmdStr = string.Empty;
        foreach (var item in filePaths)
        {
            string inPath = System.IO.Path.GetFullPath(item);
            string inDirPath = System.IO.Path.GetDirectoryName(inPath);
            string tmpOutDirPath = inDirPath.Replace(protoDirPath, outDirPath);
            if(!System.IO.Directory.Exists(tmpOutDirPath)){
                System.IO.Directory.CreateDirectory(tmpOutDirPath);
            }
            string arguments = GenLuaProtoCmdFormat(exePath, pluginPath, inPath, tmpOutDirPath, inDirPath);
            cmdStr += arguments;
        }
        System.IO.File.WriteAllText(batPath, cmdStr);
        
        return batPath;
    }

    private static void GenLuaProto(string batPath)
    {
        Process process = Process.Start(batPath);
        if (process != null)
        {
            process.WaitForExit();
            process.Close();
        }
    }


    private static string GenLuaProtoCmdFormat(string exePath, string pluginPath, string inPath, string outPath, string inDirPath)
    {
        return string.Format("{0} --proto_path={4}  --plugin=protoc-gen-lua=\"{1}\" --lua_out={3} {2}\n\r", exePath, pluginPath, inPath, outPath, inDirPath);
    }

    private static void MoveLuaProtoToClient(string luaPbDirPath)
    {
        string[] dirs = System.IO.Directory.GetDirectories(luaPbDirPath);
        foreach (var item in dirs)
        {
            string packageName = item.Replace(luaPbDirPath, "").Substring(1);
            //Debug.Log(packageName);
            string[] files = System.IO.Directory.GetFiles(item, "*.lua", SearchOption.AllDirectories);
            foreach (var f in files)
            {
                string relativeDirPath = f.Replace(item, "").Substring(1);
                string modulePath;
                string targetPath = GetLuaProtoTargetPath(packageName, relativeDirPath, out modulePath);
                string [] lines = System.IO.File.ReadAllLines(f);
                lines[2] = string.Format("module(\'{0}\')", modulePath.Replace(".lua", "").Replace("/",".").Replace("\\","."));

                string targetDirPath = System.IO.Path.GetDirectoryName(targetPath);
                if(!System.IO.Directory.Exists(targetDirPath))
                {
                    System.IO.Directory.CreateDirectory(targetDirPath);
                }
                System.IO.File.WriteAllLines(targetPath, lines);
            }
        }
    }

    private static string GetLuaProtoTargetPath(string packagename, string relativeDirPath, out string modulePath)
    {
        string targetDirPath = System.IO.Path.GetFullPath(System.IO.Path.Combine(Application.dataPath , "LuaFramework/Lua"));
        modulePath = string.Format("package/{0}/model/net/protol/{1}",packagename ,relativeDirPath);
        return System.IO.Path.GetFullPath(System.IO.Path.Combine(targetDirPath, modulePath));
    }

    [MenuItem("Tools/Clear playerPrefs", false, 3)]
    public static void ClearPlayerPrefs()
    {
        PlayerPrefs.DeleteAll();
        PlayerPrefs.Save();

    }

}
