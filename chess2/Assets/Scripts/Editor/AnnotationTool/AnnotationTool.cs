
using UnityEngine;
using System.Collections;
using UnityEditor;
using System.Collections.Generic;
using System.IO;
using MyLitJson;
using System;

//需添加[Serializable]序列化
[Serializable]
public class AnnotaionConfigDataList
{
    public List<AnnotaionConfigData> list;
}

//需添加[Serializable]序列化
[Serializable]
public class AnnotaionConfigData
{
    public string name;
    public string extension;
    public string multiLineStartStr;
    public string multiLineEndStr;
    public string singleLineStartStr;
    public List<string> sensitiveWords;
}

public class AnnotationTool {
	[MenuItem("Tools/RemoveAnnotation", false, 2000)]
	private static void StartRemove()
	{
        AnnotaionConfigDataList suffixs = GetCofnig();
        if(suffixs == null){
            Debug.LogError("未找到配置文件");
            return;
        }
        var path = EditorUtility.OpenFolderPanel("选择目标文件夹", "", "");
        Debug.Log(path);
        if(path == null || path == string.Empty)
        {
            return;
        }
        
        foreach(var p in suffixs.list)
        {
            if(p.extension == ""){
                continue;
            }
            
            string tmp = p.extension;
            AnnotationBase annotation = new AnnotationBase(p.multiLineStartStr, p.multiLineEndStr, p.singleLineStartStr, p.sensitiveWords);
            string[] files = System.IO.Directory.GetFiles(path, tmp, System.IO.SearchOption.AllDirectories);
            int total = files.Length;
            int index = 0;
            for (int i = 0; i < files.Length; i++)
            {
                string filePath = files[i];
                index++;
                EditorUtility.DisplayCancelableProgressBar(
                                        "处理文件",
                                        string.Format("正在处理{0}", filePath.Replace("\\", "/")),
                                        (float)(index / total));
                string text = FileUtility.ReadAllText(filePath);
                List<AnnotationBase.AnnotationData> tmpList = annotation.GetAllAnnotationData(text);                
                for (int j = 0; j < tmpList.Count; j++)
                {
                    AnnotationBase.AnnotationData annotationData = tmpList[j];
                    if(annotationData.isBeforeContent || annotationData.containsSensitiveWords)
                    {
                        string needRemoveStr = annotationData.originalText;
                        Debug.Log(needRemoveStr);
                        int startIndex = text.IndexOf(needRemoveStr);                        
                        text = text.Remove(startIndex, needRemoveStr.Length);
                    }
                                     
                }
                FileUtility.SaveFile(filePath, text);
            }
            

        }
        EditorUtility.ClearProgressBar();
        EditorUtility.DisplayDialog("清理完成", string.Format("清理{0}下文件注释成功", path), "OK");
        AssetDatabase.Refresh(ImportAssetOptions.ForceSynchronousImport);
	}

    private static AnnotaionConfigDataList GetCofnig()
    {
        string path = System.IO.Path.Combine(Application.dataPath, "Scripts/Editor/AnnotationTool/config.text");
        string text = FileUtility.ReadAllText(path);
        return JsonUtility.FromJson<AnnotaionConfigDataList>(text);
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