using UnityEngine;


#if UNITY_EDITOR
using UnityEditor;
#endif
using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine.UI;


public class UGUITools {

    //简单的把PNG图集导出成独立的
    [MenuItem("Tools/UGUI/Sprite/Export SpriteAtlas")]
    static public void ExporteSpriteAtlas() {
        Object[] selectObj = Selection.objects;
        foreach (var element in selectObj) {
            string path = AssetDatabase.GetAssetPath(element);

            var textureImporter = AssetImporter.GetAtPath(path) as TextureImporter;
            if (textureImporter == null) {
                return;
            }
            textureImporter.textureType = TextureImporterType.Default;
            textureImporter.isReadable = true;
            textureImporter.spriteImportMode = SpriteImportMode.Multiple;
            textureImporter.textureCompression = TextureImporterCompression.Uncompressed;
            textureImporter.textureType = TextureImporterType.Default;
            textureImporter.npotScale = TextureImporterNPOTScale.None;
            textureImporter.SaveAndReimport();
            AssetDatabase.Refresh();

            var assets = AssetDatabase.LoadAllAssetsAtPath(path);
            string directoryPath = path.Substring(0, path.LastIndexOf('.'));
            if (!Directory.Exists(directoryPath)) {
                Directory.CreateDirectory(directoryPath);
            }
            foreach (var asset in assets) {
                Sprite sprite = asset as Sprite;
                if (sprite != null) {
                    Texture2D texture = new Texture2D((int)sprite.rect.width, (int)sprite.rect.height);
                    var x = Mathf.FloorToInt(sprite.rect.x);
                    var y = Mathf.FloorToInt(sprite.rect.y);
                    var width = Mathf.FloorToInt(sprite.rect.width);
                    var height = Mathf.FloorToInt(sprite.rect.height);
                    Color[] srcColor32s = sprite.texture.GetPixels(x, y, width, height);
                    texture.SetPixels(srcColor32s);
                    if (texture != null) {
                        File.WriteAllBytes(string.Format("{0}/{1}.png", directoryPath, asset.name), texture.EncodeToPNG());
                    }
                }
            }
        }

        //textureImporter.isReadable = false;
        AssetDatabase.Refresh();
    }

    //智能添加碰撞体
    [MenuItem("Tools/UGUI/Smart Physics2DEvent")]
    public static void SmartPhysics2DEvent() {
        //List<GameObject> findGameObjects = new List<GameObject>();
        //SelectAll<Button>().ForEach(x => findGameObjects.Add(x.gameObject));
        //SelectAll<EventTriggerListener>().ForEach(x => findGameObjects.Add(x.gameObject));
        //for (int i = 0; i < findGameObjects.Count; i++) {
        //    var go = findGameObjects[i];
        //    go.AddUniqueComponent<CanvasRenderer>();
        //    var collider = go.AddUniqueComponent<BoxCollider2D>();
        //    var rectTransform = go.GetComponent<RectTransform>();
        //    if (collider.size.x < 40 || collider.size.y < 40) {
        //        collider.size = new Vector2(Mathf.Max(rectTransform.rect.width, 80f), Mathf.Max(rectTransform.rect.height, 60f));
        //    }
        //}
    }

    static T[] SelectAll<T>() {
        return Resources.FindObjectsOfTypeAll(typeof(T)) as T[];
    }

}
