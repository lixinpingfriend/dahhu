using UnityEngine;
using System.Collections;
using UnityEditor;
using System.IO;

/*
 * @author 戴佳霖
 * 一键创建图片字体
 */
public class FontCreate : Editor
{
    public static void BMFontCreate(string txtPath, string pngPath, string tempName)
    {
        TextAsset mText = (TextAsset)AssetDatabase.LoadAssetAtPath(txtPath, typeof(TextAsset));
        TextureImporter texImport = AssetImporter.GetAtPath(pngPath) as TextureImporter;
        texImport.textureCompression = TextureImporterCompression.Uncompressed;
        texImport.textureType = TextureImporterType.Default;
        texImport.wrapMode = TextureWrapMode.Clamp;
        texImport.mipmapEnabled = false;
        texImport.isReadable = false;
        AssetDatabase.ImportAsset(pngPath);
        Material material = new Material(Shader.Find("GUI/Text Shader"));
        material.mainTexture = (Texture)AssetDatabase.LoadAssetAtPath(pngPath, typeof(Texture));
        Font mFont = new Font();

        if (mText == null || material == null)
            return;

        mFont.name = mText.name;
        material.name = mText.name;
        BMFont mbFont = new BMFont();
        BMFontReader.Load(mbFont, mText.name, mText.bytes);
        CharacterInfo[] characterInfo = new CharacterInfo[mbFont.glyphs.Count];
        for (int j = 0; j < mbFont.glyphs.Count; j++)
        {
            BMGlyph bmInfo = mbFont.glyphs[j];
            CharacterInfo info = new CharacterInfo();
            info.index = bmInfo.index;
            info.uv.x = (float)bmInfo.x / (float)mbFont.texWidth;
            info.uv.y = 1 - (float)bmInfo.y / (float)mbFont.texHeight;
            info.uv.width = (float)bmInfo.width / (float)mbFont.texWidth;
            info.uv.height = -1f * (float)bmInfo.height / (float)mbFont.texHeight;
            info.vert.x = (float)bmInfo.offsetX;
            info.vert.y = 0f;
            info.vert.width = (float)bmInfo.width;
            info.vert.height = (float)bmInfo.height;
            info.width = (float)bmInfo.advance;
            //此处使用新版生成图片字导致文字间隔增大，可以将Tracking属性调为负，但是会导致输入图片字的坐标显示错乱
            //否则只能修改图片 所以这里不做修改 忽略上面的警告信息
            //float uvX = (float)bmInfo.x / (float)mbFont.texWidth;
            //float uvY = 1 - (float)bmInfo.y / (float)mbFont.texHeight;
            //float uvWidth = (float)bmInfo.width / (float)mbFont.texWidth;
            //float uvHeight = -1f * (float)bmInfo.height / (float)mbFont.texHeight;
            //info.uvBottomLeft = new Vector2(uvX, uvY);
            //info.uvBottomRight = new Vector2(uvX + uvWidth, uvY);
            //info.uvTopLeft = new Vector2(uvX, uvY + uvHeight);
            //info.uvTopRight = new Vector2(uvX + uvWidth, uvY + uvHeight);
            //info.minX = bmInfo.x;
            //info.maxX = bmInfo.x + bmInfo.width;
            //info.minY = bmInfo.y + bmInfo.height;
            //info.maxY = bmInfo.y;
            //info.advance = bmInfo.advance;
            characterInfo[j] = info;
        }
        mFont.characterInfo = characterInfo;
        mFont.material = material;
        string newFontPath = txtPath.Replace("txt", "fontsettings");
        string newMatrilPath = txtPath.Replace("txt", "mat");

        string tempFontPath = string.Format("Assets/{0}.fontsettings", tempName);
        string tempMatPath = string.Format("Assets/{0}.mat", tempName);

        AssetDatabase.CreateAsset(material, tempMatPath);
        AssetDatabase.CreateAsset(mFont, tempFontPath);

        File.Copy(Application.dataPath.Replace("Assets", tempFontPath), Application.dataPath.Replace("Assets", newFontPath), true);
        File.Copy(Application.dataPath.Replace("Assets", tempMatPath), Application.dataPath.Replace("Assets", newMatrilPath), true);
        AssetDatabase.DeleteAsset(tempFontPath);
        AssetDatabase.DeleteAsset(tempMatPath);
        AssetDatabase.Refresh();

        Font f = AssetDatabase.LoadAssetAtPath<Font>(newFontPath);
        Material m = AssetDatabase.LoadAssetAtPath<Material>(newMatrilPath);
        f.material = m;
        AssetDatabase.Refresh();
    }


}