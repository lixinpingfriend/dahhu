using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using System.IO;


public static class mj3dTools
{
    public const string outPutPath = "Assets/Game/PackagingResources/MaJiang3D/Module/Table3D/mj3dskin";

    public static bool OnPostprocessMj3dSkinAssets(string name)
    {
        bool needRefresh = false;
        string path = name;
        if (path.Contains(outPutPath) && path.Contains("."))
        {
            AssetImporter assetImporter = AssetImporter.GetAtPath(path);
            string assetBundleName = path.Replace("Assets/Game/PackagingResources/", "");
            assetBundleName = assetBundleName.Replace("/" + Path.GetFileName(path), "");
            assetImporter.assetBundleName = assetBundleName;
            needRefresh = true;
        }
        return needRefresh;
    }

    //[MenuItem("Tools/3D麻将工具/创建皮肤预制")]
    //public static void CreateMjPrefab()
    //{
    //    string nPath = "majian_n";
    //    string hPath = "majian_h";
    //    string outlinePath = "majian_outline";
    //    string grayPath = "majian_gray";

    //    string ouTpath = "Assets/Game/PackagingResources/MaJiang3D/Module/Table3D/mj/";

    //    GameObject go = Selection.activeGameObject;
    //    for (int i = 0; i < go.transform.childCount; ++i)
    //    {
    //        Transform child = go.transform.GetChild(i);

    //        Transform nT = child.Find("majian/" + nPath);
    //        Transform hT = child.Find("majian/" + hPath);
    //        Transform outlineT = child.Find("majian/" + outlinePath);
    //        Transform grayT = child.Find("majian/" + grayPath);

    //        string stylePath_n = child.name + "/" + nPath;
    //        string stylePath_h = child.name + "/" + hPath;
    //        string stylePath_outline = child.name + "/" + outlinePath;
    //        string stylePath_gray = child.name + "/" + grayPath;

    //        for (int j = 0; j < 3; ++j)
    //        {
    //            string name = "Style_" + (j + 1).ToString();
    //            string savePath = ouTpath + stylePath_n + "/" + name + ".prefab";
    //            Object tempPrefab = PrefabUtility.CreateEmptyPrefab(savePath);
    //            GameObject obj = nT.Find(name).gameObject;
    //            tempPrefab = PrefabUtility.ReplacePrefab(obj, tempPrefab);
    //        }
    //        for (int j = 0; j < 3; ++j)
    //        {
    //            string name = "Style_" + (j + 1).ToString();
    //            string savePath = ouTpath + stylePath_h + "/" + name + ".prefab";
    //            Object tempPrefab = PrefabUtility.CreateEmptyPrefab(savePath);
    //            GameObject obj = hT.Find(name).gameObject;
    //            tempPrefab = PrefabUtility.ReplacePrefab(obj, tempPrefab);
    //        }
    //        for (int j = 0; j < 3; ++j)
    //        {
    //            string name = "Style_" + (j + 1).ToString();
    //            string savePath = ouTpath + stylePath_outline + "/" + name + ".prefab";
    //            Object tempPrefab = PrefabUtility.CreateEmptyPrefab(savePath);
    //            GameObject obj = outlineT.Find(name).gameObject;
    //            tempPrefab = PrefabUtility.ReplacePrefab(obj, tempPrefab);
    //        }
    //        for (int j = 0; j < 3; ++j)
    //        {
    //            string name = "Style_" + (j + 1).ToString();
    //            string savePath = ouTpath + stylePath_gray + "/" + name + ".prefab";
    //            Object tempPrefab = PrefabUtility.CreateEmptyPrefab(savePath);
    //            GameObject obj = grayT.Find(name).gameObject;
    //            tempPrefab = PrefabUtility.ReplacePrefab(obj, tempPrefab);
    //        }

    //    }

    //}


    //private struct SkinData
    //{
    //    public string skinType;
    //    public string path;
    //    public string mjName;
    //    public string stateName;
    //}

    //[MenuItem("Tools/3D麻将工具/啦啦啦啦德玛西亚")]
    //public static void Clear()
    //{
    //    string outPutPath = "Assets/Game/PackagingResources/MaJiang3D/Module/Table3D/mj3dskin";
    //    string intPutPath = "Assets/Game/PackagingResources/MaJiang3D/Module/Table3D/mj/";

    //    List<SkinData> skinDatas = new List<SkinData>();

    //    string[] allPaths = AssetDatabase.GetAllAssetPaths();

    //    List<string> skinPaths = new List<string>();

    //    for (int i = 0; i < allPaths.Length; ++i)
    //    {
    //        string path = allPaths[i];
    //        if(path.Contains(intPutPath) && Path.HasExtension(path))
    //        {
    //            skinPaths.Add(path);
    //        }
    //    }

    //    for (int i = 1; i <= 3; ++i)
    //    {
    //        string skinType = "Style_" + i.ToString();
    //        for (int j = 0; j < skinPaths.Count; ++j)
    //        {
    //            string path = skinPaths[j];
    //            if (skinType == Path.GetFileNameWithoutExtension(path))
    //            {
    //                string dirName = Path.GetDirectoryName(path);
    //                string[] dirs = dirName.Split('/');
    //                string stateName = dirs[dirs.Length - 1];
    //                string mjName = dirs[dirs.Length - 2];

    //                skinDatas.Add(new SkinData()
    //                {
    //                    skinType = skinType,
    //                    path = path,
    //                    mjName = mjName,
    //                    stateName = stateName,
    //                });
    //            }
    //        }
    //        AssetDatabase.CreateFolder(outPutPath, skinType);
    //    }


    //    for (int i = 0; i < skinDatas.Count; ++i)
    //    {
    //        SkinData data = skinDatas[i];
    //        string savePath = outPutPath + "/" + data.skinType;
    //        savePath = savePath + "/" + data.mjName + "_" + data.stateName + ".prefab";
    //        AssetDatabase.CopyAsset(data.path, savePath);
    //    }

    //}
}
