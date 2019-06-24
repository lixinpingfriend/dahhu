using UnityEngine;
using UGUIExtend;
using UnityEngine.UI;
#if UNITY_EDITOR
using UnityEditor;
#endif

public class CustomHierarchyMenu
{
    [MenuItem("GameObject/UI快捷方式/快速跳到TestCanvas下", false, -50)]
    public static void JumpToTestCanvas()
    {
        GameObject go = GameObject.Find(@"GameRoot\Game\UIRoot\UIWindowParent\Canvas\TestWindow");
        if (go != null) {
            Selection.activeObject = go;
        }
    }

    [MenuItem("GameObject/UI快捷方式/复制UI相对路径", false, -100)]
    public static void CopyWindowUIRelativePath()
    {
        string path = HelpFunEditor.GetHierarchy(Selection.activeGameObject);
        path = path.Replace(@"GameRoot\Game\UIRoot\UIWindowParent\Canvas\TestWindow\", "");

        int index = path.IndexOf(@"\") + 1;
        path = path.Replace(@"\", "/");
        path = path.Substring(index, path.Length - index);
        EditorGUIUtility.systemCopyBuffer = "\"" + path + "\"";
    }

    [MenuItem("GameObject/UI快捷方式/添加UI面板", false, -200)]
    public static void AddPanel()
    {
        GameObject obj = (GameObject)PrefabUtility.InstantiatePrefab(AssetDatabase.LoadAssetAtPath("Assets/Game/PackagingResources/UI/Public/UIPanelBase.prefab", typeof(Object)));
        obj.name = "Panel";
        obj.transform.SetParent(Selection.activeGameObject.transform);
        obj.transform.localScale = Vector3.one;
        obj.transform.localPosition = Vector3.zero;
        RectTransform rect = obj.transform.GetComponent<RectTransform>();
        rect.anchorMin = Vector2.zero;
        rect.anchorMax = Vector2.one;
        rect.pivot = new Vector2(0.5f, 0.5f);
        rect.offsetMax = Vector2.zero;
        rect.offsetMin = Vector2.zero;
    }


    [MenuItem("GameObject/UI工具/快速绑定Button事件", false, -200)]
    public static void BindButtonClickEvent() {
        GameEventCollector eventCollector;
        foreach (var go in Selection.gameObjects) {
            eventCollector = go.GetComponentInParent<GameEventCollector>();
            Button button = go.GetComponent<Button>();
            if (button != null && eventCollector != null ) {
                button.gameObject.AddUniqueComponent<GameEventTriggerClickListener>().gameEventCollector = eventCollector;
            }
        }
    }

    [MenuItem("GameObject/UI工具/一键绑定所有Button事件", false, -201)]
    public static void OneKeyBindButtonClickEvent()
    {
        GameEventCollector eventCollector = Selection.activeTransform.GetComponentInParent<GameEventCollector>();
        
        if (eventCollector)
        {
            Button[] btns = eventCollector.transform.GetComponentsInChildren<Button>(true);

            foreach (var item in btns)
            {
                item.gameObject.AddUniqueComponent<GameEventTriggerClickListener>().gameEventCollector = eventCollector;
            }
        }
        else
        {
            Debug.Log("-------------------------");
        }
    }
}
