




#if UNITY_EDITORusing UnityEditor;#endif
using UnityEngine;

public class GuiButtonSkinStyleShow : EditorWindow
{

    public static GuiButtonSkinStyleShow instance;

    [MenuItem("Tools/SkinExploer")]
    public static void Init()
    {
        instance = GetWindow<GuiButtonSkinStyleShow>(false, "ButtonSkinStyle", true);
        instance.Show();
    }

    Vector2 scrollPos;

    void OnGUI()
    {
        EditorGUILayout.BeginVertical();
        scrollPos = EditorGUILayout.BeginScrollView(scrollPos);

        for (int i = 0; i != GUI.skin.customStyles.Length; ++i)
        {
            GUIStyle style = GUI.skin.customStyles[i];

            EditorGUILayout.BeginHorizontal();

            GUILayout.Space(200);

            EditorGUILayout.SelectableLabel(style.name, GUILayout.Width(300));

            GUILayout.Button("", style, GUILayout.Width(100), GUILayout.Height(50));

            EditorGUILayout.EndHorizontal();
            
            GUILayout.Space(50);
        }

        EditorGUILayout.EndScrollView();
        EditorGUILayout.EndVertical();
    }
}
