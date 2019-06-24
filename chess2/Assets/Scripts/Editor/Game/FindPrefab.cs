

#if UNITY_EDITOR
using System.IO;
using UnityEngine;


#if UNITY_EDITOR
using UnityEditor;
#endif
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Text;
using UnityEngine.UI;

public class FindPrefab : EditorWindow
{

    public static FindPrefab window = null;
    List<Text> labelLiset = new List<Text>();
    List<string> textLiset = new List<string>();
    List<string> textBackupLiset = new List<string>();
    Dictionary<GameObject,string> pathsave = new Dictionary<GameObject,string>();
    private bool showLabel = false;
    


    [MenuItem("Tools/FindPrefab")]
    public static void LabelText()
    {
        //buildTarget = BuildTarget.;
        CreateWindow();
    }
    

    static void CreateWindow()
    {
        if (null == window)
        {
            window = GetWindow(typeof(FindPrefab)) as FindPrefab;
        }
        window.Show();
    }

    void OnGUI()
    {
        scrollPosition = GUILayout.BeginScrollView(scrollPosition, true, true, GUILayout.ExpandWidth(true), GUILayout.ExpandHeight(true));
        

        

        if (GUI.Button(new Rect(10, 20, 200, 50), "查找预制件中的text"))
        {
            FindText();


        }
        GUILayout.Space(90);
        showLabel = EditorGUILayout.Foldout(showLabel, "Text列表");
        if (showLabel)
        {
            for (int i = 0; i < labelLiset.Count; i++)
            {
                GUILayout.BeginHorizontal();
                labelLiset[i] = EditorGUILayout.ObjectField(labelLiset[i].text, labelLiset[i], typeof(Text), true, GUILayout.Width(350)) as Text;
                textLiset[i] = EditorGUILayout.TextField(textLiset[i], GUILayout.Width(200));
                labelLiset[i].text = textLiset[i];
                if (GUILayout.Button("保存", GUILayout.Width(80)))
                {
                    //textLiset[i] = textBackupLiset[i];
                    //labelLiset[i].text = textBackupLiset[i];
                    //EditorUtility.SetDirty(objList[i]);
                  
                    GameObject obs= PrefabUtility.FindPrefabRoot( labelLiset[i].gameObject);
                    Object prefab = PrefabUtility.CreateEmptyPrefab(pathsave[obs]);
                    PrefabUtility.ReplacePrefab(obs, prefab, ReplacePrefabOptions.ConnectToPrefab);
                    AssetDatabase.SaveAssets();
                    Debug.Log("保存成功");
                }
                if (GUILayout.Button("清除修改", GUILayout.Width(80)))
                {
                    textLiset[i] = textBackupLiset[i];
                    labelLiset[i].text = textBackupLiset[i];
                }
                GUILayout.EndHorizontal();
            }
            if (GUI.Button(new Rect(220, 50, 200, 50), "删除加载的预制件"))
            {
                if (objList.Count > 0)
                {
                    for (int i = objList.Count - 1; i >= 0; i--)
                    {
                        DestroyImmediate(objList[i]);
                    }
                    objList.Clear();
                }
                labelLiset.Clear();
                textLiset.Clear();
                textBackupLiset.Clear();
            }
            if (GUI.Button(new Rect(420, 50, 200, 50), "保存所有预制件"))
            {
                for (int i = 0; i < objList.Count; i++)
                {
                    //EditorUtility.SetDirty(objList[i]);
                    Object prefab = PrefabUtility.CreateEmptyPrefab(pathsave[objList[i]]);
                    PrefabUtility.ReplacePrefab(objList[i], prefab, ReplacePrefabOptions.ConnectToPrefab);
                    AssetDatabase.SaveAssets();
                }
                Debug.Log("保存成功");
            }
            if (GUI.Button(new Rect(620, 50, 200, 50), "清除所有修改"))
            {
                for (int i = 0; i < objList.Count; i++)
                {
                    textLiset[i] = textBackupLiset[i];
                    labelLiset[i].text = textBackupLiset[i];
                }
            }
        }
        GUILayout.EndScrollView();
        //scrollPosition = GUILayout.BeginScrollView(scrollPosition, false, false, GUILayout.ExpandWidth(true), GUILayout.ExpandHeight(true));
    }


    List<GameObject> objList = new List<GameObject>();
    Vector2 scrollPosition = new Vector2(0, 0);
    void FindText()
    {
        //Object[] objs = AssetDatabase.LoadAllAssetsAtPath("Assets/Resources/Res/Prefabs/Activity/GroupMsg.prefab");
        string[] strs = AssetDatabase.FindAssets("t:Prefab");
        string[] paths = new string[strs.Length];
        pathsave.Clear();
        for (int i = 0; i < strs.Length; i++)
        {
            paths[i] = AssetDatabase.GUIDToAssetPath(strs[i]);
            
        }
        labelLiset.Clear();
        textLiset.Clear();
        textBackupLiset.Clear();
        for (int i = 0; i < paths.Length; i++)
        {
            GameObject obj = (GameObject)PrefabUtility.InstantiatePrefab(AssetDatabase.LoadAssetAtPath(paths[i], typeof(Object)));
            objList.Add(obj);
            pathsave.Add(obj,paths[i]);
            Text[] text = obj.transform.GetComponentsInChildren<Text>();
            bool need = false;
            if (text.Length > 0)
            {
                for (int j = 0; j < text.Length; j++)
                {
                    if (HasChinese(text[j].text))
                    {
                        labelLiset.Add(text[j]);
                        textLiset.Add(text[j].text);
                        textBackupLiset.Add(text[j].text);
                        
                        //Debug.Log(text[j].text);
                        need = true;
                    }
                }
                if (!need)
                {
                    DestroyImmediate(obj);
                    objList.Remove(obj);
                }
            }
            else
            {
                DestroyImmediate(obj);
                objList.Remove(obj);
            }
        }

        // PrefabUtility
    }

    void DrawLabel(Text label, int depth)
    {
        GUILayout.BeginVertical();
        GUILayout.Space(depth * 16f);
        //Text tt = EditorGUILayout.ObjectField(label, typeof(Text), true, GUILayout.Width(100f)) as Text;
        GUILayout.Label(label.text, GUILayout.Width(50f));
        GUILayout.EndHorizontal();
    }

    public static bool HasChinese(string str)
    {
        return Regex.IsMatch(str, @"[\u4e00-\u9fa5]");
    }

}
#endif