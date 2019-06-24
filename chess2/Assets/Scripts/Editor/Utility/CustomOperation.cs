using System;
using System.Collections;
using System.Linq;
using System.Collections.Generic;


#if UNITY_EDITOR
using UnityEditor;
#endif
using UnityEngine;
using System.Reflection;
using Object = UnityEngine.Object;
using System.IO;
using System.Security.Cryptography;
using System.Text;
//using ICSharpCode.SharpZipLib.Zip;
using XmlEditor;

public static partial class CustomOperation
{

    //[MenuItem("Hierarchy/Position/显示Monster")]
    //static void PositioningShowMonsterParant() {
        
    //}

    #region 将预制件放到指定的场景物体下

    [MenuItem("Assets/快捷移动/移动到UIViewTest下", false, 0)]
    static void MovePrefabToUIViewTest() {


        HelpFunEditor.LoadGameRoot();
        GameObject[] obj = Selection.gameObjects;
        if (obj != null) {
            for (int i = 0; i < obj.Length; i++) {
                GameObject instantiatePrefab = HelpFunEditor.InstantiatePrefab(GameObject.Find("GameRoot/Game/UIRoot/UIWindowParent/Canvas/TestWindow").gameObject, obj[i]);
                Selection.activeGameObject = instantiatePrefab;
                instantiatePrefab.transform.localScale = Vector3.one;
                instantiatePrefab.transform.localPosition = Vector3.zero;
                RectTransform rect = instantiatePrefab.transform.GetComponent<RectTransform>();
                //rect.SetInsetAndSizeFromParentEdge(RectTransform.Edge.Left,0f,0f );
                //rect.SetInsetAndSizeFromParentEdge(RectTransform.Edge.Right, 0f, 0f);
                //rect.SetInsetAndSizeFromParentEdge(RectTransform.Edge.Bottom, 0f, 0f);
                //rect.SetInsetAndSizeFromParentEdge(RectTransform.Edge.Top, 0f, 0f);
                rect.anchorMin = Vector2.zero;
                rect.anchorMax = Vector2.one;
                rect.pivot = new Vector2(0.5f, 0.5f);
                rect.offsetMax = Vector2.zero;
                rect.offsetMin = Vector2.zero;
            }
        }
    }

    public static string getEncryptFileName(string fileName) {
        MD5 md = MD5.Create();
        byte[] bytes = Encoding.ASCII.GetBytes(fileName);
        byte[] buffer2 = md.ComputeHash(bytes);
        StringBuilder builder = new StringBuilder();
        for (int i = 0; i < buffer2.Length; i++) {
            builder.Append(buffer2[i].ToString("X2"));
        }
        return builder.ToString();
    }

    public static string decByteAndConvertToString(byte[] ba) {
        for (int i = 0; i < (ba.Length - 0x15); i += 20) {
            for (int j = 0; j < 10; j++) {
                ba[i + j] = (byte)(ba[i + j] ^ ba[(i + 0x13) - j]);
                ba[i + j] = (byte)(ba[i + j] ^ ba[(i + 0x13) - j]);
                ba[i + j] = (byte)(ba[i + j] ^ ba[(i + 0x13) - j]);
            }
        }
        return Encoding.UTF8.GetString(ba);
    }

    public static byte[] decByte(byte[] ba) {
        for (int i = 0; i < (ba.Length - 0x15); i += 20) {
            for (int j = 0; j < 10; j++) {
                ba[i + j] = (byte)(ba[i + j] ^ ba[(i + 0x13) - j]);
                ba[i + j] = (byte)(ba[i + j] ^ ba[(i + 0x13) - j]);
                ba[i + j] = (byte)(ba[i + j] ^ ba[(i + 0x13) - j]);
            }
        }
        return ba;
    }

    [MenuItem("Assets/快捷移动/移动到Scene中的PokerTable下", false, 0)]
    static void MovePrefabToSceneMonsterParant()
    {
        HelpFunEditor.LoadGameRoot();
        GameObject[] obj = Selection.gameObjects;
        if (obj != null) {
            for (int i = 0; i < obj.Length; i++) {
                GameObject instantiatePrefab = HelpFunEditor.InstantiatePrefab(GameObject.Find("GameRoot/SceneRoot/Group/TableTest").gameObject, obj[i]);
                var rectTrans = instantiatePrefab.transform as RectTransform;
                if (rectTrans != null) {
                    rectTrans.anchoredPosition = Vector2.zero;
                    rectTrans.sizeDelta = Vector2.zero;
                } else {
                    instantiatePrefab.transform.localPosition = new UnityEngine.Vector3(0, 0, 0);
                }

                Selection.activeGameObject = instantiatePrefab;
            }
        }
    }

    [MenuItem("Assets/资源处理/设置Texture为PVRTC_RGBA4", false, 0)]
    static void SetAssetsTextureImporterFormat_PVRTC_RGBA4()
    {
        Object[] selectObjs = Selection.objects;
        foreach (var item in selectObjs)
        {
            List<string> itemLabels = AssetDatabase.GetLabels(item).ToList();
            itemLabels.Add("TextureImporterFormat_PVRTC_RGBA4");
            AssetDatabase.SetLabels(item, itemLabels.ToArray());
        }
        AssetDatabase.SaveAssets();
        AssetDatabase.Refresh();
        EditorAssetBundleEditorTool.ResetAndAutoRenameAssetBundle();
    }

    [MenuItem("Assets/资源处理/设置Texture为CustomSetting", false, 0)]
    static void SetAssetsTextureImporterFormatCustomSetting()
    {
        Object[] selectObjs = Selection.objects;
        foreach (var item in selectObjs)
        {
            List<string> itemLabels = AssetDatabase.GetLabels(item).ToList();
            itemLabels.Add("TextureImporterFormatCustomSetting");
            AssetDatabase.SetLabels(item, itemLabels.ToArray());
        }
        AssetDatabase.SaveAssets();
        AssetDatabase.Refresh();
        EditorAssetBundleEditorTool.ResetAndAutoRenameAssetBundle();
    }

    [MenuItem("Assets/资源处理/设置Texture为默认设置", false, 0)]
    static void SetAssetsTextureImporterFormatDefault()
    {
        Object[] selectObjs = Selection.objects;
        foreach (var item in selectObjs)
        {
            List<string> itemLabels = AssetDatabase.GetLabels(item).ToList();
            itemLabels.Remove("TextureImporterFormat_PVRTC_RGBA4");
            AssetDatabase.SetLabels(item, itemLabels.ToArray());
        }
        AssetDatabase.SaveAssets();
        AssetDatabase.Refresh();
        EditorAssetBundleEditorTool.ResetAndAutoRenameAssetBundle();
    }

    [MenuItem("Assets/Tools/设置高清字体", false, 0)]
    static void SetAssetsHDVFont()
    {
        Object[] selectObjs = Selection.objects;
        foreach (var item in selectObjs)
        {
            GameObject itemObj = item as GameObject;
            UnityEngine.UI.Text[] texts = itemObj.transform.GetComponentsInChildren<UnityEngine.UI.Text>(true);
            for (int i = 0; i < texts.Length; i++)
            {   
                UnityEngine.UI.Text text = texts[i];
                text.fontSize = (int)(text.fontSize * 1.5f);
                text.transform.localScale = text.transform.localScale / 1.5f;
                text.rectTransform.SetSizeDeltaY(text.rectTransform.sizeDelta.y * 1.5f);
                if(text.horizontalOverflow == HorizontalWrapMode.Wrap){
                    text.rectTransform.SetSizeDeltaX(text.rectTransform.sizeDelta.x * 1.5f);
                }
            }
            PrefabUtility.SetPropertyModifications(item, PrefabUtility.GetPropertyModifications(item));
        }
        AssetDatabase.SaveAssets();
        AssetDatabase.Refresh();
    }


    #endregion

}
