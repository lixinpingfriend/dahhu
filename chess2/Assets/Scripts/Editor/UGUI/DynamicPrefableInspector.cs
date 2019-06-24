

using UnityEngine;


#if UNITY_EDITOR
using UnityEditor;
#endif
using System.Collections.Generic;

[CustomEditor(typeof(DynamicPrefable))]
public class DynamicPrefableInspector : Editor
{
    DynamicPrefable mTarget;


    GameObject tmpGameObject = null;

    //private readonly string[] mIpAdressTypeName = new string[]{"自定义", "内网测试", "外网测试", "安卓正式", "AppStore", "周望远", "杨泽浪"};

    //private readonly string[] mIpAdressTypeName = new string[] { "自定义", "内网测试", "外网测试", "安卓正式", "AppStore", "周望远", "杨泽浪" };

    void OnEnable()
    {
        mTarget = target as DynamicPrefable;

        if (!string.IsNullOrEmpty(mTarget.assetBundlePath)) {
            var mainPath = AssetDatabase.GetAssetPathsFromAssetBundle(mTarget.assetBundlePath)[0];
            var go = AssetDatabase.LoadMainAssetAtPath(mainPath) as GameObject;
            tmpGameObject = go;
            AssetImporter assetImporter = AssetImporter.GetAtPath(mainPath);
            
            mTarget.assetBundlePath = assetImporter.assetBundleName;
            mTarget.prefableName = go.name;
        }

        // while(mTarget.transform.childCount >0){
		// 	GameObject.DestroyImmediate (mTarget.transform.GetChild (0).gameObject);
		// }

        // mTarget.Prview();
    }
    
    public override void OnInspectorGUI()
    {
        GameObject go = (GameObject)EditorGUILayout.ObjectField(tmpGameObject, typeof(GameObject), true, GUILayout.Height(25));
        if (go != tmpGameObject) {
            AssetImporter assetImporter = AssetImporter.GetAtPath(AssetDatabase.GetAssetPath(go));
            mTarget.assetBundlePath = assetImporter.assetBundleName;
            mTarget.prefableName = go.name;
        }
        tmpGameObject = go;
        GUI.enabled = false;
        EditorGUILayout.TextField("AssetBundlePath", mTarget.assetBundlePath);
        EditorGUILayout.TextField("PrefableName", mTarget.prefableName);
        GUI.enabled = true;
        mTarget.awakeLoad = EditorGUILayout.Toggle("Awake初始化", mTarget.awakeLoad);
        mTarget.delayLoadTime = EditorGUILayout.FloatField("延迟加载时间", mTarget.delayLoadTime);
        mTarget.asyncLoad = EditorGUILayout.Toggle("异步加载", mTarget.asyncLoad);

        if (GUILayout.Button("Prview"))
        {
            mTarget.Prview();
        }
        GUILayout.Space(2);

        if (GUILayout.Button("Clear"))
        {
            while(mTarget.transform.childCount > 0){
            	GameObject.DestroyImmediate (mTarget.transform.GetChild(0).gameObject);
            }
        }
        GUILayout.Space(2);

        if (GUILayout.Button("Editor"))
        {
            foreach (Transform t in mTarget.gameObject.GetComponentsInChildren<Transform>(true)) {
                t.gameObject.hideFlags = HideFlags.None;
            }

            mTarget.targetGameObject.name = mTarget.targetGameObject.name.Replace("(clone)", "");
            PrefabUtility.ConnectGameObjectToPrefab(mTarget.targetGameObject, mTarget.originGameObject);
            Selection.activeGameObject = mTarget.targetGameObject;
        }
    }

}

[InitializeOnLoad]
class DynamicPrefableView
{
	static DynamicPrefableView()
	{
		// EditorApplication.hierarchyWindowItemOnGUI += HierarchWindowOnGUI;
        PrefabUtility.prefabInstanceUpdated = delegate(GameObject instance) 
		{
			//prefab保存的路径
			Debug.Log(AssetDatabase.GetAssetPath(PrefabUtility.GetPrefabParent(instance)));
		};
	}
	
	// static void HierarchWindowOnGUI (int instanceID, Rect selectionRect)
	// {
	// 	selectionRect.x += selectionRect.width - 30;
	// 	selectionRect.width = 15;

	// 	// Go through state switchers and draw on targets
	// 	var stateSwitchers = UIStateSwitcher.GetStateSwitchers();

	// 	for (int i = 0; i < stateSwitchers.Count; i++)
	// 	{
	// 		var switcher = stateSwitchers[i];

	// 		for (int j = 0; j < switcher.Targets.Count; j++)
	// 		{
	// 			if (switcher.Targets[j] == null)
	// 				continue;

	// 			if (switcher.Targets[j].GetInstanceID() != instanceID)
	// 				continue;

	// 			// Draw button that will ping the state switcher
	// 			if (GUI.Button(selectionRect, new GUIContent("S", "This GameObject is managed by a UIStateSwitcher"), EditorStyles.label))
	// 			{
	// 				EditorGUIUtility.PingObject(switcher.GetInstanceID());
	// 			}
	// 		}
	// 	}
	// }
}
