
using UnityEngine;
using UnityEditor.Animations;
using System.Collections;
using UnityEditor;
using System.Collections.Generic;
using UnityEngine.UI;
using System.IO;
using CustomAssetHolder;

public class ReplaceAssetDataTool {

    [MenuItem("Assets/AssetDataTools/自动生成AssetData替换文件夹下SpriteHolder&spriteAtlas", false, 0)]
    private static void FindFoldSpriteHolder()
    {
        string[] guids = Selection.assetGUIDs;
        if (guids.Length != 1)
        {
            return;
        }
        string path = AssetDatabase.GUIDToAssetPath(guids[0]);
        bool isFolder = AssetDatabase.IsValidFolder(path);
        if(isFolder)
        {
            string fullPath = Path.GetFullPath(path);
//            Debug.Log(fullPath);
            string[] prefabPaths = Directory.GetFiles(fullPath, "*.prefab", SearchOption.AllDirectories);
            int len = prefabPaths.Length;
            for(var i = 0; i < len; i++)
            {
                string prefabPath = prefabPaths[i];
                prefabPath = prefabPath.Replace("\\", "/");
                prefabPath = prefabPath.Replace(Application.dataPath, "Assets");
                GameObject go = AssetDatabase.LoadAssetAtPath(prefabPath, typeof(GameObject)) as GameObject;
                FindSpriteHolder(go);
                Debug.Log(prefabPath);
                EditorUtility.DisplayCancelableProgressBar(
                                    "处理Prefab",
                                    string.Format("正在处理{0}", prefabPath),
                                    (float)(i + 1 / len));

            }
            EditorUtility.ClearProgressBar();
            EditorUtility.DisplayDialog("处理Prefab完成", string.Format("处理{0}个Prefab成功", len), "OK");
        }
    }

    [MenuItem("Assets/AssetDataTools/自动生成AssetData替换SpriteHolder&spriteAtlas", false, 0)]
    private static void FindSpriteHolder()
    {
        var go = Selection.activeGameObject;
        FindSpriteHolder(go);
    }
	private static void FindSpriteHolder(GameObject go)
	{
		if(go != null)
		{
		    string path = AssetDatabase.GetAssetPath(go);
		    Debug.Log(path);
            foreach (var spriteHolder in go.transform.GetComponentsInChildren<SpriteHolder>(true))
            {
                string savePath = path.Replace(".prefab", "_");
                string realSavePath;
                AssetData assetData;
                bool isNew = CreateAssetData(savePath, spriteHolder, 0, out assetData, out realSavePath);
                if(isNew)
                {
                    foreach (var data in spriteHolder.injections)
                    {
                        assetData.AddAssetByKey(data.name, data.value);
                    }

                    spriteHolder.assetData = assetData;
                    SaveAssets(assetData);
                }
                else
                {
                    spriteHolder.assetData = assetData;
                }
                spriteHolder.injections.Clear();
//                Debug.Log(spriteHolder.name);
            }
            foreach (var spriteAtlas in go.transform.GetComponentsInChildren<SpriteAtlas>(true))
            {
                string savePath = path.Replace(".prefab", "_");
                string realSavePath;
                AssetData assetData;
                bool isNew = CreateAssetData(savePath, spriteAtlas, 0, out assetData, out realSavePath);
                if(isNew)
                {
                    for(int i = 0; i < spriteAtlas.keys.Count; i++)
                    {
                        string key = spriteAtlas.keys[i];
                        Sprite value = spriteAtlas.values[i];
                        assetData.AddAssetByKey(key, value);
                    }
                    spriteAtlas.assetData = assetData;
                    SaveAssets(assetData);
                }
                else
                {
                    spriteAtlas.assetData = assetData;
                }
                spriteAtlas.keys.Clear();
                spriteAtlas.values.Clear();
//                Debug.Log(spriteAtlas.name);
            }
            SaveAssets(go);
		}


	}

    private static bool CreateAssetData(string path, SpriteHolder spriteHolder, int index, out AssetData assetData, out string realSavePath)
    {
        string savePath = path + spriteHolder.name + index + ".asset";
        AssetData ad = LoadPlayAssetDataFromPath(savePath);
        if(ad != null)
        {
            bool isSame = CheckAssetDataIsMatchSpriteHolder(ad, spriteHolder);
            if(isSame)
            {
                assetData = ad;
                realSavePath = savePath;
                return false;
            }
            else
            {
                return CreateAssetData(path, spriteHolder, index + 1, out assetData, out realSavePath);
            }
        }
        else
        {
            realSavePath = savePath;
            ad = CreateAssetDataAssetsWithPath(savePath);
            assetData = ad;
            return true;
        }
    }

    private static bool CreateAssetData(string path, SpriteAtlas spriteAtlas, int index, out AssetData assetData, out string realSavePath)
    {
        string savePath = path + spriteAtlas.name + index + ".asset";
        AssetData ad = LoadPlayAssetDataFromPath(savePath);
        if(ad != null)
        {
            bool isSame = CheckAssetDataIsMatchSpriteAtlas(ad, spriteAtlas);
            if(isSame)
            {
                assetData = ad;
                realSavePath = savePath;
                return false;
            }
            else
            {
                return CreateAssetData(path, spriteAtlas, index + 1, out assetData, out realSavePath);
            }
        }
        else
        {
            realSavePath = savePath;
            ad = CreateAssetDataAssetsWithPath(savePath);
            assetData = ad;
            return true;
        }
    }

    private static bool CheckAssetDataIsMatchSpriteHolder(AssetData assetData, SpriteHolder spriteHolder)
    {
        bool isSame = true;
        foreach(var data in spriteHolder.injections)
        {
            string key = data.name;
            HolderData hd = assetData.GetAssetByKey(key);
            if(hd == null)
            {
                return false;
            }
            if(((Object)data.value) != hd.asset)
            {
                return false;
            }
        }
        return isSame;
    }

    private static bool CheckAssetDataIsMatchSpriteAtlas(AssetData assetData, SpriteAtlas spriteAtlas)
    {
        bool isSame = true;
        if(spriteAtlas.keys != null)
        {

        }
        for(int i = 0; i < spriteAtlas.keys.Count; i++)
        {
            string key = spriteAtlas.keys[i];
            Sprite value = spriteAtlas.values[i];
            HolderData hd = assetData.GetAssetByKey(key);
            if(hd == null)
            {
                return false;
            }
            if(((Object)value) != hd.asset)
            {
                return false;
            }
        }
        return isSame;
    }

    ///创建AssetData资源</summary>
    [MenuItem("Tools/CreateAssetData", false, 1)]
    public static void CreateAssetDataAssets()
    {
        string savePath = EditorUtility.SaveFilePanelInProject("保存路径", "NewAssetData", "asset", "创建AssetData");
        CreateAssetDataAssetsWithPath(savePath);
    }

    [MenuItem("Assets/AssetDataTools/CreateAssetData", false, 0)]
    public static void CreateAssetDataAssetsAtSelectPath()
    {
        string[] guids = Selection.assetGUIDs;
        if (guids.Length != 1)
        {
            return;
        }

        string path = AssetDatabase.GUIDToAssetPath(guids[0]);
        string assetDataPath = path + "/NewAssetData.asset";
        CreateAssetDataAssetsWithPath(assetDataPath);
    }

    public static CustomAssetHolder.AssetData CreateAssetDataAssetsWithPath(string savePath)
    {
        CustomAssetHolder.AssetData assetData = ScriptableObject.CreateInstance<CustomAssetHolder.AssetData>();
        UnityEditor.AssetDatabase.CreateAsset(assetData, savePath);
        UnityEditor.AssetDatabase.SaveAssets();
        UnityEditor.AssetDatabase.Refresh();
        return assetData;
    }

    public static CustomAssetHolder.AssetData LoadPlayAssetDataFromPath(string path)
    {
        CustomAssetHolder.AssetData assetData = UnityEditor.AssetDatabase.LoadAssetAtPath<CustomAssetHolder.AssetData>(path);
        return assetData;
    }

    public static void SaveAssets(Object obj)
    {
        UnityEditor.EditorUtility.SetDirty(obj);
        UnityEditor.AssetDatabase.SaveAssets();
        UnityEditor.AssetDatabase.Refresh();
    }
}