using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Text;
using UnityEditor;
using Debug = UnityEngine.Debug;

public static class CustomNetTransform  {

    [MenuItem("Tools/NetMessage/同步ErlangServerMessage", false, 1)]
    static void SynchronizationServerMessage() {
        string protocBatPath = EditorPrefs.GetString(Application.productName + "-LuaTransformProtocBatPath", "");
        if (string.IsNullOrEmpty(protocBatPath)) {
            protocBatPath = EditorUtility.OpenFilePanel("选择路径--(生成)", "", "bat");
            if (protocBatPath.Contains("生成.bat")) {
                EditorPrefs.SetString(Application.productName + "-LuaTransformProtocBatPath", protocBatPath);
            } else {
                EditorPrefs.SetString(Application.productName + "-LuaTransformProtocBatPath", "");
                EditorUtility.DisplayDialog("路径选择", "路径选择错误！请重新选择。", "确定");
                return;
            }
        }

        //CustomProjectMenuItem.SvnOperation(Path.GetDirectoryName(Path.GetDirectoryName(protocBatPath)));

        // Process pro = new Process();
        // FileInfo file = new FileInfo(protocBatPath);
        // pro.StartInfo.WorkingDirectory = file.Directory.FullName;
        // pro.StartInfo.FileName = protocBatPath;
        // pro.StartInfo.CreateNoWindow = false;
        // pro.Start();
        // pro.WaitForExit();

        //string luaProtolDirectory = protocBatPath + "/protol";

        //foreach (var directoryPath in Directory.GetDirectories(luaProtolDirectory)) {
        //    foreach (var filePath in Directory.GetFiles(directoryPath)) {
                
        //    }
        //}



        string targetFile;
        string sourceFile;
        targetFile = Application.dataPath + @"/../ExternalAssets/GameDll/Script/Game/Net/PBMessage.cs";
        sourceFile = Path.GetDirectoryName(protocBatPath) + "/PBMessage/PBMessage.cs";
        if (File.Exists(sourceFile)) {
            if (File.Exists(targetFile)) {
                File.Delete(targetFile);
            }
            //FileUtil.CopyFileOrDirectory(sourceFile, targetFile);

            FileStream fs = new FileStream(sourceFile, FileMode.Open);
            StreamReader read = new StreamReader(fs, Encoding.Default);
            List<string> writeText = new List<string>();
            while (!read.EndOfStream) {
                var lineStr = read.ReadLine();
                writeText.Add(lineStr);
                if (lineStr.StartsWith("// Option:")) {     //添加编译条件
                    writeText.Add("#if !UNITY_IPHONE");
                }
            }
            writeText.Add("#endif");

            StreamWriter write = new StreamWriter(new FileStream(targetFile, FileMode.Create), Encoding.UTF8);
            foreach (string str in writeText) {
                write.WriteLine(str);
            }

            read.Close();
            write.Close();
        }

        sourceFile = Path.GetDirectoryName(protocBatPath) + "/../include/usermessage.h";
        targetFile = Application.dataPath + @"/../ExternalAssets/GameDll/Script/Game/Net/ServerMessageDefine.cs";
        if (File.Exists(sourceFile)) {
            FileStream fs = new FileStream(sourceFile, FileMode.Open);
            StreamReader read = new StreamReader(fs, Encoding.UTF8);
            List<string> writeText = new List<string>();
            while (!read.EndOfStream) {
                var lineStr = read.ReadLine();
                if (lineStr.StartsWith("#")) {
                    continue;
                }
                if (lineStr.StartsWith("enum ")) {
                    lineStr = "public " + lineStr;
                }
                lineStr = lineStr.Replace("::", ".");

                writeText.Add(lineStr);
            }

            StreamWriter write = new StreamWriter(new FileStream(targetFile, FileMode.Create), Encoding.UTF8);
            foreach (string str in writeText) {
                write.WriteLine(str);
            }

            read.Close();
            write.Close();
        }

        //复制GameDll工程中
        string targetDirectory = Application.dataPath + @"/../ExternalAssets/GameDll/ThirdLibrary/";
        Directory.CreateDirectory(targetDirectory);
        if (File.Exists(targetDirectory + "PBMessage.dll")) {
            File.Delete(targetDirectory + "PBMessage.dll");
        }
        if (File.Exists(targetDirectory + "/PBMessageSerializer.dll")) {
            File.Delete(targetDirectory + "/PBMessageSerializer.dll");
        }
        FileUtil.CopyFileOrDirectory(Path.GetDirectoryName(protocBatPath) + "/PBMessage/bin/Release/PBMessage.dll", targetDirectory + "PBMessage.dll");
        FileUtil.CopyFileOrDirectory(Path.GetDirectoryName(protocBatPath) + "/PBMessage/bin/Release/PBMessageSerializer.dll", targetDirectory + "PBMessageSerializer.dll");

        //复制到Unity工程中
        targetDirectory = Application.dataPath + @"/Scripts/External/Runtime/iOS/";
        Directory.CreateDirectory(targetDirectory);

        if (File.Exists(targetDirectory + "PBMessage.dll.bytes")) {
            File.Delete(targetDirectory + "PBMessage.dll.bytes");
        }
        if (File.Exists(targetDirectory + "PBMessageSerializer.dll.bytes")) {
            File.Delete(targetDirectory + "PBMessageSerializer.dll.bytes");
        }
        FileUtil.CopyFileOrDirectory(Path.GetDirectoryName(protocBatPath) + "/PBMessage/bin/Release/PBMessage.dll", targetDirectory + "PBMessage.dll.bytes");
        FileUtil.CopyFileOrDirectory(Path.GetDirectoryName(protocBatPath) + "/PBMessage/bin/Release/PBMessageSerializer.dll", targetDirectory + "PBMessageSerializer.dll.bytes");
        Debug.Log("ServerMessage更新成功");
    }
}
