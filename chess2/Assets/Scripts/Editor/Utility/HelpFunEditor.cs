

using System;
using System.Collections.Generic;
using System.IO;


#if UNITY_EDITOR
using UnityEditor;
#endif
using UnityEngine;

/// <summary> 自定义工具辅助类() </summary>
static public class HelpFunEditor
{
    static public GameObject InstantiatePrefab(GameObject parent, GameObject prefab) {
        GameObject go = PrefabUtility.InstantiatePrefab(prefab) as GameObject;

        if (go != null && parent != null) {
            Transform t = go.transform;
            t.SetParent(parent.transform);
            t.localPosition = Vector3.zero;
            t.localRotation = Quaternion.identity;
            t.localScale = Vector3.one;
//            go.layer = parent.layer;
        }
        return go;
    }

    static public GameObject InstantiateGameObject(GameObject parent, GameObject prefab) {
        GameObject go = GameObject.Instantiate(prefab);

        if (go != null && parent != null) {
            Transform t = go.transform;
            t.parent = parent.transform;
            t.localPosition = Vector3.zero;
            t.localRotation = Quaternion.identity;
            t.localScale = Vector3.one;
            go.layer = parent.layer;
        }
        return go;
    }

    public static void LoadGameRoot() {
        if (GameObject.Find("GameRoot") == null) {
            GameObject gameRoot = AssetDatabase.LoadAssetAtPath("Assets/Game/PackagingResources/Public/UI/Init/GameRoot.prefab", typeof(GameObject)) as GameObject;
            PrefabUtility.InstantiatePrefab(gameRoot);
        }
    }

    public static void RenameFile(string sourcesFileName, string newFileName, bool deleteSameNewFileName = true) {
        string projectPath = Application.dataPath.Substring(0, Application.dataPath.LastIndexOf('/')) + "/";

		if (File.Exists(projectPath + sourcesFileName)) {
            if (File.Exists(projectPath + newFileName)) {
                File.Delete(projectPath + newFileName);
            }
			File.Move(projectPath + sourcesFileName, projectPath + newFileName);
		}
    }

    /// <summary>
    /// Returns the hierarchy of the object in a human-readable format.
    /// </summary>

    static public string GetHierarchy(GameObject obj) {
        if (obj == null) return "";
        string path = obj.name;

        while (obj.transform.parent != null) {
            obj = obj.transform.parent.gameObject;
            path = obj.name + "\\" + path;
        }
        return path;
    }

    public static List<float> ChangeStringToFloatList(string str, float divisor = 1.0f) {
        List<float> list = new List<float>();
        if (str == "") return list; 
        str = str.Replace(';', ':');
        string[] strs = str.Split(':');
        for (int i = 0; i != strs.Length; ++i) {
            list.Add(Convert.ToSingle(strs[i]) / divisor);
        }
        return list;
    }
    public static string ChangeFloatListToString(List<float> list, char c = ':')
    {
        string s = "";
        if (list == null) return s;
        for (int index = 0; index < list.Count; index++)
        {
            s += list[index].ToString();
            s += c;
        }
        s = s.Substring(0, s.LastIndexOf(':'));

        return s;
    }

    public static string ChangeVector3ToString(Vector3 vec, char c = ':')
    {
        string str = "";
        str = string.Format("{0}{1}{2}{3}{4}", vec.x, c, vec.y, c, vec.z);

        return str;
    }

    public static Vector3 ChangeStringToVector3(string s)
    {
        Vector3 vec = Vector3.one;
        List<float> f = ChangeStringToFloatList(s);
        if (f.Count < 3)
        {
            return vec;
        }
        vec = new Vector3(f[0], f[1], f[2]);

        return vec;
    }

    public static Vector4 ChangeStringToVector4(string s)
    {
        Vector4 vec = Vector4.one;
        List<float> f = ChangeStringToFloatList(s);
        if (f.Count < 4)
        {
            return vec;
        }
        vec = new Vector4(f[0], f[1], f[2], f[3]);

        return vec;
    }
    public static Vector2 ChangeStringToVector2(string s)
    {
        Vector2 vec = Vector2.one;
        List<float> f = ChangeStringToFloatList(s);
        if (f.Count < 2)
        {
            return vec;
        }
        vec = new Vector2(f[0], f[1]);

        return vec;
    }

    public static List<int> ChangeStringToIntList(string str, char c = ':', float divisor = 1.0f)
    {
        List<int> list = new List<int>();
        if (str == "") return list;
        str = str.Replace(';', c);
        string[] strs = str.Split(c);
        for (int i = 0; i != strs.Length; ++i)
        {
            list.Add(Convert.ToInt32(strs[i]));
        }
        return list;
    }

    public static string ChangeIntListToString(List<int> list, char c = ':')
    {
        string s = "";
        if (list == null) return s;
        for (int index = 0; index < list.Count; index++)
        {
            s += list[index].ToString();
            if (index != list.Count - 1)
            {
                s += c;
            }            
        }
        return s;
    }


    //public static string[] GetAssetInThePath<T>(string path) {
    //    string[] paths = AssetDatabase.GetSubFolders(path);
    //    List<string> filePaths;
    //    foreach (var subFolderPath in paths) {
    //        ;
    //        foreach (var fileName in Directory.GetFiles(subFolderPath)) {
    //            if (AssetDatabase.GetAssetPath(fileName)) {
                    
    //            }
    //        }
    //        GetAssetInThePath(subFolderPath);
    //    }

    //}

    
}
