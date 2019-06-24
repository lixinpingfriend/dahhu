using System;
using System.Collections.Generic;


#if UNITY_EDITOR
using UnityEditor;
#endif
using UnityEngine;
using Object = UnityEngine.Object;

public static class EditorTools
{
    /// <summary>set label width</summary>
    public static void SetLabelWidth(float width) {
        EditorGUIUtility.labelWidth = width;
    }

    /// <summary>Draw Header</summary>
    public static bool DrawHeader(string text) {
        return DrawHeader(text, text);
    }

    /// <summary>Draw a distinctly different looking header label</summary>
    public static bool DrawHeader(string text, string key) {
        bool state = EditorPrefs.GetBool(key, true);

        GUILayout.Space(3f);
        if (!state) {
            GUI.backgroundColor = new Color(0.8f, 0.8f, 0.8f);
        }

        GUILayout.BeginHorizontal();
        GUI.changed = false;

        text = "<b><i><size=11><color=#00ff00ff>" + text + "</color></size></i></b>";
        text = (state ? "\u25BC " : "\u25BA ") + text;

        if (!GUILayout.Toggle(true, text, "dragtab", GUILayout.MinWidth(20f))) {
            state = !state;
        }

        if (GUI.changed) {
            EditorPrefs.SetBool(key, state);
        }

        GUILayout.Space(2f);
        GUILayout.EndHorizontal();
        GUI.backgroundColor = Color.white;

        if (!state) {
            GUILayout.Space(3f);
        }

        return state;
    }


    /// <summary>Begin drawing the content area.</summary>
    public static void BeginContents() {
        GUILayout.BeginHorizontal();
        EditorGUILayout.BeginHorizontal("TextArea", GUILayout.MinHeight(10f));
        GUILayout.BeginVertical();
        GUILayout.Space(2f);
    }

    /// <summary>End drawing the content area.</summary>
    public static void EndContents() {
        GUILayout.Space(3f);
        GUILayout.EndVertical();
        EditorGUILayout.EndHorizontal();
        GUILayout.Space(3f);
        GUILayout.EndHorizontal();
        GUILayout.Space(3f);
    }


    /// <summary>Display a warning box in the current GUI layout.This is expanded to fit the current GUILayout rect.</summary>
    public static void InfoBox(string message, MessageType type) {
        EditorGUILayout.HelpBox(message, type);
    }

    public static T LoadAsset<T>(string path) where T : Object {
        Object obj = AssetDatabase.LoadAssetAtPath(path, typeof(T));
        return obj as T;
    }

    /// <summary>Helper function that returns the folder where the current selection resides.</summary>
    static public string GetSelectionFolder() {
        if (Selection.activeObject != null) {
            string path = AssetDatabase.GetAssetPath(Selection.activeObject.GetInstanceID());

            if (!string.IsNullOrEmpty(path)) {
                int dot = path.LastIndexOf('.');
                int slash = Mathf.Max(path.LastIndexOf('/'), path.LastIndexOf('\\'));
                if (slash > 0) return (dot > slash) ? path.Substring(0, slash + 1) : path + "/";
            }
        }
        return "Assets/";
    }

    /// <summary>Create an undo point for the specified objects.</summary>

    static public void RegisterUndo(string name, params Object[] objects) {
        if (objects != null && objects.Length > 0) {
            Undo.RecordObjects(objects, name);

            foreach (Object obj in objects) {
                if (obj == null) continue;
                EditorUtility.SetDirty(obj);
            }
        }
    }

    /// <summary>编辑器模式下保存和获取颜色</summary>
    public static void SaveColor(string key, Color color) {
        EditorPrefs.SetString(key, string.Format("{0};{1};{2};{3}", color.r, color.g, color.b, color.a));
    }

    public static Color GetColor(string key) {
        List<float> colorstr = HelpFunEditor.ChangeStringToFloatList(EditorPrefs.GetString(key, "1;1;1;1"));
        return new Color(colorstr[0], colorstr[1], colorstr[2], colorstr[3]);
    }


    /// <summary>获取某个字符串中包含指定的字符串的数量</summary>
    public static int StrContainStr(string sourcestr, string findstr) {
        int findcount = 0;
        int startposition = 0;

        while (startposition < sourcestr.Length) {
            int searchstr = sourcestr.IndexOf(findstr, startposition);
            if (searchstr != -1) {
                findcount = findcount + 1;
                startposition = searchstr + findstr.Length;
            } else {
                break;
            }
        }
        return findcount;
    }

    /// <summary>验证是否是整数</summary>
    public static bool VorifyInt(string str, out int result)
    {
        result = -1;   //result 定义为out 用来输出值  
        try
        {
            result = Convert.ToInt32(str);
            return true;
        }
        catch
        {
            return false;
        }
    }

    /// <summary>验证是否是整数</summary>
    public static bool VorifyLong(string str, out long result)
    {
        result = -1;   //result 定义为out 用来输出值  
        try
        {
            result = Convert.ToInt64(str);
            return true;
        }
        catch
        {
            return false;
        }
    }

    /// <summary>验证是否是单精度浮点数</summary>
    public static bool VorifyFloat(string str, out float result) {
        result = -9999999.0f;   //result 定义为out 用来输出值  
        try {
            result = Convert.ToSingle(str);
            return true;
        } catch {
            return false;
        }
    }

    /// <summary>验证是否是float 3 用: ;隔开的</summary>
    public static bool VorifyFloat3(string str) {
        if (str == null || str == "") {
            return false;
        }

        str = str.Replace(';', ':');
        string[] strs = str.Split(':');
        if (strs.Length != 3) {
            return false;
        }

        float ff;
        return VorifyFloat(strs[0], out ff) && VorifyFloat(strs[1], out ff) && VorifyFloat(strs[2], out ff);
    }
}
