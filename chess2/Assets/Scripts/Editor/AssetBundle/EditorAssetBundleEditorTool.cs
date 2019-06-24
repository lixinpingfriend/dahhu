using System;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
#if UNITY_EDITOR
using UnityEditor;
#endif
using XmlEditor;
using Object = UnityEngine.Object;

public class EditorAssetBundleEditorTool
{
    [MenuItem("Tools/AssetBundles/Build AssetBundles %&b")]
    static public void BuildGameAssetBundles()
    {
        AssetBundleBuildScript.BuildAssetBundles(false);
//        PrintSelectedAbAllAssetsName();
    }

    [MenuItem("Assets/AssetBundleTools/检测AssetBundle的完整性")]
    static void PrintSelectedAbAllAssetsName()
    {
        string fullPath1 = String.Format("{0}{1}", DataConfigProject.externalAssetBundlePathCompression, "asset_bundle_manifest");
        AssetBundle assetBundle = AssetBundle.LoadFromFile(fullPath1);
        AssetBundleManifest manifest = assetBundle.LoadAsset<AssetBundleManifest>("AssetBundleManifest");
        assetBundle.Unload(false);
        List<string> errorAssetBundle = new List<string>();
        bool contain = false;
        foreach (var projectAssetBundle in AssetDatabase.GetAllAssetBundleNames())
        {
            contain = false;
            foreach (var buildAssetBundle in manifest.GetAllAssetBundles())
            {
                if (buildAssetBundle == projectAssetBundle)
                {
                    contain = true;
                }
            }
            if (!contain)
            {
                errorAssetBundle.Add(projectAssetBundle);
            }

        }
        errorAssetBundle.ForEach(Debug.Log);

    }

    [MenuItem("Assets/AssetBundleTools/获取AssetBundleName")]
    static void GetAssetAssetBundle()
    {
        Object[] selectObjs = Selection.objects;
        foreach (var item in selectObjs)
        {
            string itemPath = AssetDatabase.GetAssetPath(item);
            AssetImporter assetImporter = AssetImporter.GetAtPath(itemPath);
            Debug.Log(assetImporter.assetBundleName);
        }
    }

    [MenuItem("Assets/AssetBundleTools/自动命名")]
    static void AutoRenameAssetBundle()
    {
        Object[] selectObjs = Selection.objects;
        foreach (var item in selectObjs)
        {
            string itemPath = AssetDatabase.GetAssetPath(item);
            AutoProcessAsset(itemPath);
        }
        AssetDatabase.Refresh();
    }

    [MenuItem("Assets/AssetBundleTools/重置并自动处理资源")]
    public static void ResetAndAutoRenameAssetBundle()
    {
        Object[] selectObjs = Selection.objects;
        foreach (var item in selectObjs)
        {
            string itemPath = AssetDatabase.GetAssetPath(item);
            TextureImporter textureImporter = AssetImporter.GetAtPath(itemPath) as TextureImporter;
            if (textureImporter != null && textureImporter.textureType == TextureImporterType.Sprite) {
                textureImporter.spritePackingTag = "";
            }
            AutoProcessAsset(itemPath);
        }
        AssetDatabase.Refresh();
    }

    [MenuItem("Assets/打印AssetBundle名字")]
    static void CopyAssetBundleName()
    {
        Object[] selectObjs = Selection.objects;
        foreach (var item in selectObjs)
        {
            string itemPath = AssetDatabase.GetAssetPath(item);
            AssetImporter assetImporter = AssetImporter.GetAtPath(itemPath);
            if (assetImporter != null && assetImporter.assetBundleName != null)
            {
                Debug.LogFormat("AssetBundle名字获取成功----->{0}", assetImporter.assetBundleName);
                return;
            }
        }
        Debug.LogError("AssetBundle名字获取失败");
    }

    [MenuItem("Assets/AssetBundleTools/获取AssetBundleRealName", false, 0)]
    static void GetAssetBundleRealName()
    {
        Object[] selectObjs = Selection.objects;
        foreach (var item in selectObjs)
        {
            string itemPath = AssetDatabase.GetAssetPath(item);
            string realName = "Assets/StreamingAssets/" + FileUtility.DecryptFilePath(itemPath.Replace("Assets/StreamingAssets/", ""));
            Debug.Log(realName);
        }
    }

    //自动命名AssetBundle
    public static bool AutoProcessAsset(string name)
    {
        bool needRefresh = false;
        if (name.Contains("/PackagingResources/") && name.Contains("."))
        {    //动作特效等
            AssetImporter assetImporter = AssetImporter.GetAtPath(name);
            if (!name.Contains("/Module/") && !name.Contains("/Effect"))
            {
                if (name.Contains("/Shader/"))
                {
                    assetImporter.assetBundleName = "public/game/shaders.bytes";
                }
                else
                {
                    string newAssetBundleName = name.Replace("Assets/Game/PackagingResources/", "");
                    newAssetBundleName = newAssetBundleName.Substring(0, newAssetBundleName.IndexOf(".", StringComparison.Ordinal));
                    assetImporter.assetBundleName = string.Format("{0}.bytes", newAssetBundleName);
                }
            }
            else if (name.Contains("/Module"))
            {
                string newAssetBundleName = "";
                needRefresh = true;
                if (name.EndsWith(".prefab"))
                {    //预制件
                    newAssetBundleName = name.Replace("Assets/Game/PackagingResources/", "");
                }
                else if(name.EndsWith(".asset"))
                {
                    newAssetBundleName = name.Replace("Assets/Game/PackagingResources/", "");
                }
                else if (name.Contains("/Image"))
                {
                    TextureImporter textureImporter = AssetImporter.GetAtPath(name) as TextureImporter;
                    if (textureImporter != null && textureImporter.textureType == TextureImporterType.Sprite)
                    {
                        newAssetBundleName = name.Replace("Assets/Game/PackagingResources/", "");
                        string packageName = newAssetBundleName.Substring(0, newAssetBundleName.IndexOf("/"));
                        // Debug.Log(packageName);
                        int indexStart = newAssetBundleName.IndexOf("Module/") + 7;
                        int indexEnd = newAssetBundleName.IndexOf("/Image");
                        int length = indexEnd - indexStart;
                        string moduleName = newAssetBundleName.Substring(indexStart, length);

                        string spritePackingTag = "";
                        string imageChildName = "";
                        indexStart = name.IndexOf("/Image/") + 7;
                        indexEnd = name.LastIndexOf("/");
                        if (indexStart != indexEnd + 1) { //代表还有子文件夹
                            length = indexEnd - indexStart;
                            imageChildName = name.Substring(indexStart, length);
                            // Debug.Log(imageChildName);
                        }
                        if (!string.IsNullOrEmpty(imageChildName)) {
                            spritePackingTag = string.Format("{0}_{1}{2}", packageName, moduleName, imageChildName);
                        } else {
                            spritePackingTag = string.Format("{0}_{1}", packageName, moduleName);
                        }               

                        // if (name.Contains("/Custom")) {
                        //     needSaveAndReimport = true;
                        // }         

                        bool needSaveAndReimport = false;
                        if (!name.Contains("/Custom/") && spritePackingTag != textureImporter.spritePackingTag ) {   //如果有指定Tag
                            textureImporter.spritePackingTag = spritePackingTag;
                            needSaveAndReimport = true;
                            textureImporter.SaveAndReimport();
                        } 
                        newAssetBundleName = string.Format("{0}/module/{1}/{2}.atlas", packageName, moduleName, textureImporter.spritePackingTag);
                    }
                }
                else if (name.EndsWith(".png") || name.EndsWith(".jpg"))
                {            //贴图
                    TextureImporter textureImporter = AssetImporter.GetAtPath(name) as TextureImporter;
                    if (textureImporter.textureType == TextureImporterType.Sprite)
                    {
                        newAssetBundleName = name.Replace("Assets/Game/PackagingResources/", "");
                        newAssetBundleName = newAssetBundleName.Substring(0, newAssetBundleName.IndexOf(".", StringComparison.Ordinal));
                        newAssetBundleName = string.Format("{0}.atlas", newAssetBundleName);
                    }
                }
                else
                {
//                    needRefresh = false;
                    newAssetBundleName = name.Replace("Assets/Game/PackagingResources/", "");
                }
                assetImporter.assetBundleName = newAssetBundleName;
            } 
            else if (name.Contains("/Effect")) {
                Debug.Log(name);
                string newAssetBundleName = "";
                needRefresh = true;
                if (name.Contains("/Image"))
                {
                    Debug.Log(name);
                    TextureImporter textureImporter = AssetImporter.GetAtPath(name) as TextureImporter;
                    if (textureImporter != null && textureImporter.textureType == TextureImporterType.Sprite)
                    {
                        newAssetBundleName = name.Replace("Assets/Game/PackagingResources/", "");
                        string packageName = newAssetBundleName.Substring(0, newAssetBundleName.IndexOf("/"));
                        // Debug.Log(packageName);
                        int indexStart = newAssetBundleName.IndexOf("Effect/") + 7;
                        int indexEnd = newAssetBundleName.IndexOf("/Image");
                        int length = indexEnd - indexStart;
                        string moduleName = newAssetBundleName.Substring(indexStart, length);

                        string spritePackingTag = "";
                        string imageChildName = "";
                        indexStart = name.IndexOf("/Image/") + 7;
                        indexEnd = name.LastIndexOf("/");
                        if (indexStart != indexEnd + 1) { //代表还有子文件夹
                            length = indexEnd - indexStart;
                            imageChildName = name.Substring(indexStart, length);
                            // Debug.Log(imageChildName);
                        }
                        if (!string.IsNullOrEmpty(imageChildName)) {
                            spritePackingTag = string.Format("{0}_Effect_{1}{2}", packageName, moduleName, imageChildName);
                        } else {
                            spritePackingTag = string.Format("{0}_Effect_{1}", packageName, moduleName);
                        }                        

                        bool needSaveAndReimport = false;
                        if (spritePackingTag != textureImporter.spritePackingTag ) {   //如果有指定Tag
                            textureImporter.spritePackingTag = spritePackingTag;
                            needSaveAndReimport = true;
                            textureImporter.SaveAndReimport();
                        } 
                        newAssetBundleName = string.Format("{0}/effect/{1}/{2}.atlas", packageName, moduleName, textureImporter.spritePackingTag);
                    }
                }
//                else if (name.Contains("Animation/"))
//                {    //预制件
//                    newAssetBundleName = name.Replace("Assets/Game/PackagingResources/", "");
//                    string packageName = newAssetBundleName.Substring(0, newAssetBundleName.IndexOf("/"));
//                    // Debug.Log(packageName);
//                    int indexStart = newAssetBundleName.IndexOf("Effect/") + 7;
//                    int indexEnd = newAssetBundleName.IndexOf("/Animation");
//                    int length = indexEnd - indexStart;
//                    string moduleName = newAssetBundleName.Substring(indexStart, length);
//                    newAssetBundleName = string.Format("{0}/effect/{1}/animation.bytes", packageName, moduleName);
//                    
//                }
//                else if (name.Contains("Material/"))
//                {    //预制件
//                    newAssetBundleName = name.Replace("Assets/Game/PackagingResources/", "");
//                    string packageName = newAssetBundleName.Substring(0, newAssetBundleName.IndexOf("/"));
//                    // Debug.Log(packageName);
//                    int indexStart = newAssetBundleName.IndexOf("Effect/") + 7;
//                    int indexEnd = newAssetBundleName.IndexOf("/Material");
//                    int length = indexEnd - indexStart;
//                    string moduleName = newAssetBundleName.Substring(indexStart, length);
//                    newAssetBundleName = string.Format("{0}/effect/{1}/material.bytes", packageName, moduleName);
//                    
//                }
//                else if (name.EndsWith(".png") || name.EndsWith(".jpg"))
//                {            //贴图
//                    TextureImporter textureImporter = AssetImporter.GetAtPath(name) as TextureImporter;
//                    if (textureImporter.textureType == TextureImporterType.Sprite)
//                    {
//                        newAssetBundleName = name.Replace("Assets/Game/PackagingResources/", "");
//                        newAssetBundleName = newAssetBundleName.Substring(0, newAssetBundleName.IndexOf(".", StringComparison.Ordinal));
//                        newAssetBundleName = string.Format("{0}.atlas", newAssetBundleName);
//                    } else {
//                        newAssetBundleName = name.Replace("Assets/Game/PackagingResources/", "");
//                    }
//                }
                else if (name.EndsWith(".prefab"))
                {    //预制件
                    newAssetBundleName = name.Replace("Assets/Game/PackagingResources/", "");
                }
                else
                {
                    newAssetBundleName = name.Replace("Assets/Game/PackagingResources/", "");
                    newAssetBundleName = Path.GetDirectoryName(newAssetBundleName) + ".bytes";
                }
                assetImporter.assetBundleName = newAssetBundleName;
            }
        }
        else if (!name.StartsWith("Assets/Game/PackagingResources/"))
        {      //如果不在PackagingResources那么需要把AssetBundle名字去掉
            AssetImporter assetImporter = AssetImporter.GetAtPath(name);
            if (!string.IsNullOrEmpty(assetImporter.assetBundleName))
            {
                assetImporter.assetBundleName = "";
                needRefresh = true;
            }
        }
        return needRefresh;
    }
}

public class EditorGitConfig
{
    public static string gitIgnorePath
    {
        get
        {
            return string.Format("{0}.gitignore",Application.dataPath.Replace("Assets",""));
        }
    }
    public static string[] openAbGit = new string[]{
          "/AssetBundles/*/*Version/*/Original/Sources/*/\n",
          "/AssetBundles/*/*Version/*/*/incremental/\n",
          "/AssetBundles/*/*Version/*/*/whole/\n",
          "/AssetBundles/*/*Version/*/*/*pkg\n",
          "/AssetBundles/*/*Version/*/*/asset_bundle_manifest\n",
          "/AssetBundles/*/*Compression/\n",
          "/AssetBundles/Windows/\n",
          "/AssetBundles/OSX/\n",
    };

    public static string closeAbGit = "/AssetBundles/\n";
}
