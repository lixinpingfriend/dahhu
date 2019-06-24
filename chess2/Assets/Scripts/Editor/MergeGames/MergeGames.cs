
using UnityEngine;
using UnityEditor.Animations;
using System.Collections;
using UnityEditor;
using System.Collections.Generic;
using UnityEngine.UI;
using System.IO;
using MyLitJson;

public class MergeGames {
	[MenuItem("Tools/MergeGames", false, 2000)]
	private static void StartMerge()
	{
        string[] paths = GetCofnig();
        if(paths == null){
            Debug.LogError("未找到配置文件");
            return;
        }
        var path = EditorUtility.OpenFolderPanel("选择目标文件夹", "", "");
        Debug.Log(path);
        if(path == null || path == string.Empty)
        {
            return;
        }
        string dataPath = Application.dataPath.Replace("/Assets", "");
        if(path.Contains(dataPath))
        {
            return;
        }

        string test = System.IO.Path.Combine(path, "Assets");
        if(!FileUtility.DirectoryExists(test))
        {
            Debug.LogWarning("所选文件夹非工程根目录！");
            return;
        }
        int total = paths.Length;
        int index = 0;
        foreach(var p in paths)
        {
            if(p == ""){
                continue;
            }
            index++;
            string tmp = p;
            tmp = tmp.Replace("\r", "");
            tmp = tmp.Replace("\n", "");
            string localPath = Path.Combine(dataPath, tmp).Replace("/", "\\");
            string tmpP = Path.Combine(path, tmp).Replace("/", "\\");
            string desfolderdir = Path.GetDirectoryName(tmpP);
//            Debug.Log(desfolderdir);
            Debug.LogError(localPath);
            Debug.LogError(tmpP);
            if(File.Exists(localPath))
            {
                if (!Directory.Exists(desfolderdir))
                {
                    Directory.CreateDirectory(desfolderdir);
                }
                FileUtility.Copy(localPath, tmpP);
            }
            else if(Directory.Exists(localPath))
            {
                CopyDirectory(localPath, tmpP);
            }
            EditorUtility.DisplayCancelableProgressBar(
                                    "复制文件",
                                    string.Format("正在复制{0}", localPath.Replace("\\", "/")),
                                    (float)(index / total));
        }
        EditorUtility.ClearProgressBar();
        EditorUtility.DisplayDialog("复制完成", string.Format("迁移至{0} 成功", path), "OK");
	}

    private static string[] GetCofnig()
    {
        string path = System.IO.Path.Combine(Application.dataPath, "Scripts/Editor/MergeGames/config.text");
        string text = FileUtility.ReadAllText(path);
        string[] lines = text.Split('\n');
        return lines;
    }

    /// <summary>
    /// 复制文件夹中的所有内容
    /// </summary>
    /// <param name="sourceDirPath">源文件夹目录</param>
    /// <param name="saveDirPath">指定文件夹目录</param>
    public static void CopyDirectory(string sourceDirPath, string saveDirPath)
    {
        if (Directory.Exists(saveDirPath))
        {
            FileUtility.DeleteDirectory(saveDirPath, true);
        }
        Debug.LogWarning(string.Format("创建 {0}", saveDirPath));
        Directory.CreateDirectory(saveDirPath);
        string[] files = Directory.GetFiles(sourceDirPath);
        int total = files.Length;
        int index = 0;
        foreach (string file in files)
        {
            string pFilePath = saveDirPath + "\\" + Path.GetFileName(file);
//                if (File.Exists(pFilePath))
//                    continue;
//                File.Copy(file, pFilePath, true);
            FileUtility.Copy(file, pFilePath);
            Debug.Log(string.Format("copy {0}, {1}", file, pFilePath));
            EditorUtility.DisplayCancelableProgressBar(
                                    "复制文件",
                                    string.Format("正在复制{0}", file.Replace("\\", "/")),
                                    (float)(index / total));
        }

        string[] dirs = Directory.GetDirectories(sourceDirPath);

        foreach (string dir in dirs)
        {
            CopyDirectory(dir, saveDirPath + "\\" + Path.GetFileName(dir));
        }
    }

}