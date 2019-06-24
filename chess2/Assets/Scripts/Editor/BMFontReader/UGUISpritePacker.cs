using System.Collections.Generic;
using UnityEngine;
using UnityEditor;
using System.IO;
using System.Text;

/*
 * @author 戴佳霖
 *
 */

public class UGUISpritePacker
{
    private static int m_maxWidth = 1024;
    private static int m_maxHeight = 1024;
    private static int m_padding = 1;
    private static int m_fontSize = 32;

    private static BitmapFontData m_bitmapFont;
    public static string m_currentPath = "";

    private static bool CombineSpritesHelper(string path, string dpath, string name, int padding)
    {
        string file = dpath + "/" + name + ".png";
        if (System.IO.File.Exists(file))
        {
            System.IO.File.Delete(file);
        }

        string[] paths = AssetDatabase.FindAssets("t:sprite", new string[] { path });
        List<Sprite> spriteList = new List<Sprite>();
        List<Texture2D> texList = new List<Texture2D>();

        foreach (var o in paths)
        {
            Sprite s = AssetDatabase.LoadAssetAtPath(AssetDatabase.GUIDToAssetPath(o), typeof(Sprite)) as Sprite;
            if (null != s)
            {
                spriteList.Add(s);
                texList.Add(s.texture);
            }
        }

        if (texList.Count > 0)
        {
            Texture2D tex = new Texture2D(m_maxWidth, m_maxHeight, TextureFormat.ARGB32, true);
            Rect[] uvs = UITexturePacker.PackTextures(tex, texList.ToArray(), 4, 4, padding, m_maxWidth);
            if (null == uvs)
            {
                EditorUtility.DisplayDialog(path, "图集超过1024，需要分组成多张图集", "点击退出");
                Object.DestroyImmediate(tex);
                tex = null;
                return false;
            }
            else
            {
                List<SpriteMetaData> metaList = new List<SpriteMetaData>();
                for (int i = 0; i < uvs.Length; ++i)
                {
                    SpriteMetaData data = new SpriteMetaData();
                    data.alignment = (int)SpriteAlignment.Center;
                    data.border = spriteList[i].border;
                    data.name = spriteList[i].name;
                    data.pivot = spriteList[i].pivot;

                    float width = UITexturePacker.currentTexSize.x;
                    float height = UITexturePacker.currentTexSize.y;
                    data.rect = new Rect(uvs[i].x * width, uvs[i].y * height, uvs[i].width * width, uvs[i].height * height);
                    //data.rect = new Rect(uvs[i].x * tex.width, uvs[i].y * tex.height, uvs[i].width * tex.width, uvs[i].height * tex.height);
                    metaList.Add(data);
                }

                System.IO.File.WriteAllBytes(file, tex.EncodeToPNG());

                AssetDatabase.ImportAsset(file, ImportAssetOptions.ForceUpdate);
                TextureImporter importer = AssetImporter.GetAtPath(file) as TextureImporter;
                importer.spritesheet = metaList.ToArray();
                importer.spriteImportMode = SpriteImportMode.Multiple;
                importer.textureType = TextureImporterType.Sprite;
                importer.textureCompression = TextureImporterCompression.Uncompressed;
                importer.mipmapEnabled = true;
                importer.isReadable = true;
                importer.mipmapFilter = TextureImporterMipFilter.BoxFilter;
                AssetDatabase.ImportAsset(file);
                AssetDatabase.Refresh();

                m_bitmapFont = new BitmapFontData();
                m_bitmapFont.name = name;
                m_bitmapFont.charCount = metaList.Count;
                m_bitmapFont.height = tex.height;
                m_bitmapFont.width = tex.width;
                m_bitmapFont.size = m_fontSize;
                m_bitmapFont.spriteList = metaList;
                m_bitmapFont.Save();
                m_bitmapFont.CreateFont();
            }
        }
        return true;
    }

    [MenuItem("Assets/生成图片字体", false, 0)]
    public static void CombineSprites()
    {
        string[] guids = Selection.assetGUIDs;
        if (guids.Length != 1)
        {
            Debug.LogError("选中需要合成图集的文件夹即可!");
            return;
        }

        string path = AssetDatabase.GUIDToAssetPath(guids[0]);
        m_currentPath = path;
        if (!Directory.Exists(path))
        {
            Debug.LogError("请选择需要合成图集的文件夹!");
            return;
        }
        DirectoryInfo di = new DirectoryInfo(path);
        string dirName = di.Name;
        CombineSpritesHelper(path, path, dirName, m_padding);
        EditorUtility.ClearProgressBar();
    }

}

public class BitmapFontData
{
    public string name = "";
    public string face = "Arial";
    public int size = 32;
    public int width = 256;
    public int height = 256;
    public int charCount = 10;

    public List<SpriteMetaData> spriteList;

    private string firstLine = "info face=\"{0}\" size={1} bold=0 italic=0 charset=\"\" unicode=1 stretchH=100 smooth=1 aa=1 padding=0,0,0,0 spacing=1,1 outline=0";
    private string secondLine = "common lineHeight={0} base=26 scaleW={1} scaleH={2} pages=1 packed=0 alphaChnl=1 redChnl=0 greenChnl=0 blueChnl=0";
    private string thirdLine = "page id=0 file=\"{0}.png\"";
    private string fourthLine = "chars count={0}";

    private string commonLine = "char id={0}   x={1}    y={2}     width={3}    height={4}    xoffset={5}     yoffset={6}     xadvance={7}    page=0  chnl=15";

    public void Save()
    {
        string filePath = UGUISpritePacker.m_currentPath + "/" + name + ".txt";
        StringBuilder stringBuilder = new StringBuilder();
        string line1 = string.Format(firstLine, face, size);
        string line2 = string.Format(secondLine, size, width, height);
        string line3 = string.Format(thirdLine, name);
        string line4 = string.Format(fourthLine, charCount);
        stringBuilder.AppendLine(line1);
        stringBuilder.AppendLine(line2);
        stringBuilder.AppendLine(line3);
        stringBuilder.AppendLine(line4);
        for (int i = 0; i < charCount; i++)
        {
            SpriteMetaData smd = spriteList[i];
            string temp = string.Format(commonLine, StringToASCII(smd.name), smd.rect.x, smd.rect.y, smd.rect.width, smd.rect.height, 0, 0, smd.rect.width);
            stringBuilder.AppendLine(temp);
        }

        System.IO.StreamWriter writer = null;
        if (!System.IO.File.Exists(filePath))
            writer = System.IO.File.CreateText(filePath);
        else
            writer = new System.IO.StreamWriter(filePath, false, System.Text.Encoding.UTF8);
        writer.Write(stringBuilder.ToString());
        writer.Close();

#if UNITY_EDITOR
        UnityEditor.AssetDatabase.SaveAssets();
        UnityEditor.AssetDatabase.Refresh();
#endif

    }

    private int StringToASCII(string value)
    {
        byte[] array = new byte[1];   //定义一组数组array
        array = System.Text.Encoding.ASCII.GetBytes(value); //string转换的字母
        int asciicode = (short)(array[0]);
        return asciicode;
    }

    public void CreateFont()
    {
        string txtPath = UGUISpritePacker.m_currentPath + "/" + name + ".txt";
        string pngPath = UGUISpritePacker.m_currentPath + "/" + name + ".png";
        FontCreate.BMFontCreate(txtPath, pngPath, name);
    }
}

