using UnityEditor;
using UnityEngine;
using System.IO;
using System.Collections.Generic;
/*
* @author 戴佳霖
*
*/

public class FontEditorWindow : EditorWindow
{
    private Vector2 m_scrollVector = Vector2.zero;

    private static string m_currentPath;
    private static string m_fontPath;
    private static Font m_font;

    private static List<int> m_charList;
    private static List<string> m_textureList;
    private const int kCellHeight = 30;

    [MenuItem("Assets/编辑字体标记", false, 0)]
    public static void BMFontEditor()
    {
        string[] guids = Selection.assetGUIDs;
        if (guids.Length != 1)
        {
            Debug.LogError("请选图片字体文件!");
            return;
        }
        string path = AssetDatabase.GUIDToAssetPath(guids[0]);
        if (!path.Contains(".fontsettings"))
        {
            Debug.LogError("请选图片字体文件!");
            return;
        }
        int index = path.LastIndexOf("/");
        string mPath = path.Substring(0, index);
        ShowWindow(mPath);
    }

    public static void ShowWindow(string path)
    {
        m_currentPath = path;
        FontEditorWindow window = (FontEditorWindow)EditorWindow.GetWindow(typeof(FontEditorWindow));
        window.name = "FontEditorWindow";
        window.Show(false);
        m_textureList = new List<string>();
        DirectoryInfo dir = new DirectoryInfo(path);
        string fileName = dir.Name;
        FileInfo[] files = dir.GetFiles();
        int length = files.Length;

        m_fontPath = m_currentPath + "/" + fileName + ".fontsettings";
        m_font = (Font)AssetDatabase.LoadAssetAtPath(m_fontPath, typeof(Font));

        string pngName = fileName + ".png";
        for (int i = 0; i < length; i++)
        {
            if (files[i].Extension == ".png" && files[i].Name != pngName)
            {
                string tPath = m_currentPath + "/" + files[i].Name;
                m_textureList.Add(tPath);
            }
        }

        m_charList = new List<int>();
        length = m_font.characterInfo.Length;
        for (int i = 0; i < length; i++)
        {
            m_charList.Add(m_font.characterInfo[i].index);
        }
    }

    void OnGUI()
    {
        if (m_font == null)
        {
            Close();
        }
        ShowTitle();
        ShowContent();
    }


    private void ShowTitle()
    {
        GUILayout.BeginHorizontal("AS TextArea", GUILayout.Height(kCellHeight));
        GUILayout.Space(5);
        GUILayout.Label("修改图片字体标记值", GUILayout.Width(200));
        GUILayout.Space(10);
        if (GUILayout.Button("保存"))
        {
            int count = m_font.characterInfo.Length;
            CharacterInfo[] charaterArrary = new CharacterInfo[count];
            for (int i = 0; i < count; i++)
            {
                CharacterInfo ci = new CharacterInfo();
                ci.index = m_charList[i];
                ci.uvBottomLeft = m_font.characterInfo[i].uvBottomLeft;
                ci.uvBottomRight = m_font.characterInfo[i].uvBottomRight;
                ci.uvTopLeft = m_font.characterInfo[i].uvTopLeft;
                ci.uvTopRight = m_font.characterInfo[i].uvTopRight;
                ci.minX = m_font.characterInfo[i].minX;
                ci.minY = m_font.characterInfo[i].minY;
                ci.maxX = m_font.characterInfo[i].maxX;
                ci.maxY = m_font.characterInfo[i].maxY;
                ci.advance = m_font.characterInfo[i].advance;
                charaterArrary[i] = ci;
            }
            m_font.characterInfo = charaterArrary;
            string matPath = m_currentPath + "/" + m_font.name + ".mat";
            Material m = AssetDatabase.LoadAssetAtPath<Material>(matPath);
            m_font.material = m;
            string tempFontPath = string.Format("Assets/{0}.fontsettings", m_font.name);
            Font f = CloneFont(m_font);
            AssetDatabase.CreateAsset(f, tempFontPath);
            File.Copy(Application.dataPath.Replace("Assets", tempFontPath), Application.dataPath.Replace("Assets", m_fontPath), true);
            AssetDatabase.DeleteAsset(tempFontPath);
            AssetDatabase.Refresh();
        }
        GUILayout.EndHorizontal();
    }

    private Font CloneFont(Font font)
    {
        Font f = new Font();
        f.name = font.name;
        CharacterInfo[] characterInfo = new CharacterInfo[font.characterInfo.Length];
        for (int i = 0; i < font.characterInfo.Length; i++)
        {
            CharacterInfo info = new CharacterInfo();
            info.uvBottomLeft = font.characterInfo[i].uvBottomLeft;
            info.uvBottomRight = font.characterInfo[i].uvBottomRight;
            info.uvTopLeft = font.characterInfo[i].uvTopLeft;
            info.uvTopRight = font.characterInfo[i].uvTopRight;
            info.minX = font.characterInfo[i].minX;
            info.minY = font.characterInfo[i].minY;
            info.maxX = font.characterInfo[i].maxX;
            info.maxY = font.characterInfo[i].maxY;
            info.index = font.characterInfo[i].index;
            info.advance = font.characterInfo[i].advance;
            characterInfo[i] = info;
        }
        f.characterInfo = characterInfo;
        f.material = font.material;
        return f;
    }

    private void ShowContent()
    {
        if (m_textureList == null || m_font == null)
        {
            return;
        }
        m_scrollVector = GUILayout.BeginScrollView(m_scrollVector);
        int count = m_textureList.Count;
        for (int i = 0; i < count; i++)
        {
            GUILayout.BeginHorizontal();
            m_charList[i] = StringToASCII(GUILayout.TextField(((char)m_charList[i]).ToString()));
            GUILayout.Space(50);
            Texture tex = (Texture)AssetDatabase.LoadAssetAtPath(m_textureList[i], typeof(Texture));
            EditorGUILayout.ObjectField(tex, typeof(Texture), false);
            GUILayout.EndHorizontal();
        }
        GUILayout.EndScrollView();
    }

    private int StringToASCII(string value)
    {
        byte[] array = new byte[1];   //定义一组数组array
        array = System.Text.Encoding.ASCII.GetBytes(value); //string转换的字母
        int asciicode = (short)(array[0]);
        return asciicode;
    }

}
