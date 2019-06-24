using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEditor;

namespace PlayModeEditor
{
    public class DrawPlayMode
    {

        private static Vector2 scroll = Vector2.zero;
        private static int editIndex = -1;
        private static string locationName = string.Empty;
        private static string[] tagName = System.Enum.GetNames(typeof(TagEnum));
        private static string[] colorName = System.Enum.GetNames(typeof(ColorEnum));

        private static Object selectionObj = null;
        public static void Draw()
        {
            GUILayout.Space(10);
            EditorGUILayout.BeginVertical();
            EditorGUILayout.BeginHorizontal();
            if (GUILayout.Button("<", GUILayout.Width(20)))
            {
                PlayModeTools.curProvince = -1;
                return;
            }

            EditorGUILayout.LabelField("", GUILayout.Width(400));

            EditorGUILayout.LabelField(PlayModeTools.pData.name + "玩法编辑", GUILayout.Width(450));

            EditorGUILayout.EndHorizontal();
            GUILayout.Space(10);
            HeadState state = HeadState.Nomal;
            scroll = GUILayout.BeginScrollView(scroll);
            for (int i = 0; i < PlayModeTools.pData.configs.Count; i++)
            {
                EditorGUILayout.BeginHorizontal();
                EditorGUILayout.BeginVertical(GUILayout.Width(490));
                if (editIndex == i)
                    state = HeadState.Edit;
                else
                    state = HeadState.Nomal;
                if (DrawItemHeader(PlayModeTools.pData.configs[i], ref state, i))
                {
                    // if(i == 0)
                    // 	Debug.Log(state);
                    switch (state)
                    {
                        case HeadState.Nomal:
                            editIndex = i;
                            locationName = string.Empty;
                            break;
                        default:
                            editIndex = i;
                            if (i < PlayModeTools.pData.configs.Count)
                                DrawItem(PlayModeTools.pData.configs[i]);
                            break;
                    }
                }
                EditorGUILayout.EndVertical();
                EditorGUILayout.EndHorizontal();
            }
            GUILayout.EndScrollView();
            GUILayout.Space(5);
            EditorGUILayout.BeginHorizontal();
            //createLocationName = EditorGUILayout.TextField(createLocationName,GUILayout.Width(200));
            if (GUILayout.Button("+", "OL Titlemid", GUILayout.Width(PlayModeEditorWindow.window.maxSize.x)))
            {
                PlayModeConfig config = new PlayModeConfig();
                config.key = PlayModeTools.pData.GetConfigNextId();
                config.value = "新增的地区";
                PlayModeTools.pData.configs.Add(config);
            }

            EditorGUILayout.EndHorizontal();
            EditorGUILayout.BeginHorizontal("TextArea", GUILayout.MinHeight(100));
            EditorGUILayout.BeginVertical(GUILayout.Width(85));
            EditorGUILayout.LabelField(" ", GUILayout.Width(85));
            EditorGUILayout.EndVertical();
            EditorGUILayout.BeginVertical(GUILayout.Width(100));
            EditorGUILayout.LabelField(" ", GUILayout.Width(5), GUILayout.Height(25));
            if (GUILayout.Button("手动保存", GUILayout.Width(100), GUILayout.Height(50)))
            {
                PlayModeTools.SortData();
                if (EditorUtility.DisplayDialog("提示", "已手动保存！", "知道了")) //显示对话框  
                {

                }
            }
            EditorGUILayout.EndVertical();
            EditorGUILayout.BeginVertical(GUILayout.Width(100));
            EditorGUILayout.LabelField(" ", GUILayout.Width(5), GUILayout.Height(25));
            if (GUILayout.Button("生成Lua配置", GUILayout.Width(100), GUILayout.Height(50)))
            {
                PlayModeTools.ExportLuaScript();
                if (EditorUtility.DisplayDialog("提示", "已生成全国与省份配置！", "确定")) //显示对话框  
                {

                }

            }
            EditorGUILayout.EndVertical();

            EditorGUILayout.BeginVertical(GUILayout.Width(100));
            EditorGUILayout.LabelField(" ", GUILayout.Width(5), GUILayout.Height(25));
            if (GUILayout.Button("生成本省Lua配置", GUILayout.Width(100), GUILayout.Height(50)))
            {
                PlayModeTools.ExportPlayModeLuaScript();
                if (EditorUtility.DisplayDialog("提示", "已导出本省Lua文件至" + PlayModeTools.luaPath, "确定")) //显示对话框  
                {

                }

            }
            EditorGUILayout.EndVertical();

            EditorGUILayout.BeginVertical(GUILayout.Width(75));
            EditorGUILayout.LabelField(" ", GUILayout.Width(75));
            EditorGUILayout.EndVertical();
            EditorGUILayout.EndHorizontal();
            EditorGUILayout.EndVertical();
        }


        private static void DrawItem(PlayModeConfig config)
        {
            DrawLocationInfo(config);

            for (int i = 0; i < config.playModeList.Count; i++)
            {
                if (i < config.playModeList.Count)
                {
                    GUILayout.Space(5);
                    BeginContent();
                    GUILayout.Space(5);
                    GUI.backgroundColor = new Color(0.8f, 0.8f, 0.8f);
                    DrawPlayModeList(config.playModeList[i], config);
                    GUI.backgroundColor = Color.white;
                    EndContent();
                }
            }
        }

        private static void DrawPlayModeList(PlayModeInfo info, PlayModeConfig config)
        {
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("玩法:", GUILayout.Width(70));
            info.name = EditorGUILayout.TextField(info.name, GUILayout.Width(100));
            EditorGUILayout.LabelField("gameId:" + info.gameId, GUILayout.Width(100));
            EditorGUILayout.LabelField("location:" + info.location, GUILayout.Width(100));
            //EditorGUILayout.LabelField("", GUILayout.Width(300));
            string copyBtnName = PlayModeTools.copyData == null ? "C" : "P";
            GUI.backgroundColor = PlayModeTools.copyData == null ? Color.cyan : Color.yellow;
            if (GUILayout.Button(copyBtnName, GUILayout.Width(20)))
            {
                PlayModeTools.copyOrPasteInfo(info);
            }
            GUI.backgroundColor = Color.white;
            if (GUILayout.Button("↑", GUILayout.Width(20)))
            {
                int infoIndex = config.playModeList.IndexOf(info);
                if (infoIndex != 0)
                {
                    var temp = config.playModeList[infoIndex];
                    config.playModeList[infoIndex] = config.playModeList[infoIndex - 1];
                    config.playModeList[infoIndex - 1] = temp;
                    PlayModeTools.SortData();
                }
            }
            if (GUILayout.Button("↓", GUILayout.Width(20)))
            {
                int infoIndex = config.playModeList.IndexOf(info);
                if (infoIndex != config.playModeList.Count - 1)
                {
                    var temp = config.playModeList[infoIndex];
                    config.playModeList[infoIndex] = config.playModeList[infoIndex + 1];
                    config.playModeList[infoIndex + 1] = temp;
                    PlayModeTools.SortData();
                }
            }

            GUI.backgroundColor = Color.red;
            if (GUILayout.Button("DEL", GUILayout.Width(30)))
            {
                config.playModeList.Remove(info);
                return;
            }
            GUI.backgroundColor = new Color(0.8f, 0.8f, 0.8f);
            EditorGUILayout.EndHorizontal();

            GUILayout.Space(10);
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("GameName:", GUILayout.Width(70));
            info.gameName = EditorGUILayout.TextField(info.gameName, GUILayout.Width(100));
            EditorGUILayout.LabelField("包名:", GUILayout.Width(50));
            info.package = EditorGUILayout.TextField(info.package, GUILayout.Width(100));
            EditorGUILayout.LabelField("皮肤:", GUILayout.Width(50));
            info.cardTheame = EditorGUILayout.TextField(info.cardTheame, GUILayout.Width(100));
            EditorGUILayout.EndHorizontal();

            GUILayout.Space(10);
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("玩法Type:", GUILayout.Width(70));
            info.wanfaType = EditorGUILayout.TextField(info.wanfaType, GUILayout.Width(100));
            EditorGUILayout.LabelField("附加字段:", GUILayout.Width(50));
            info.tips = EditorGUILayout.TextField(info.tips, GUILayout.Width(100));
            EditorGUILayout.LabelField("创建名:", GUILayout.Width(50));
            info.createName = EditorGUILayout.TextField(info.createName, GUILayout.Width(200));
            EditorGUILayout.EndHorizontal();

            GUILayout.Space(5);
            EditorGUILayout.BeginHorizontal();

            EditorGUILayout.LabelField("金币场:", GUILayout.Width(70));
            info.isOpenGold = EditorGUILayout.Toggle(info.isOpenGold);
            EditorGUILayout.LabelField("比赛场:", GUILayout.Width(50));
            info.isOpenMatch = EditorGUILayout.Toggle(info.isOpenMatch);
            EditorGUILayout.LabelField("是否开启:", GUILayout.Width(50));
            info.isOpen = EditorGUILayout.Toggle(info.isOpen);
            EditorGUILayout.EndHorizontal();
            GUILayout.Space(5);
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("playType:", GUILayout.Width(70));
            info.playTypeName = EditorGUILayout.TextField(info.playTypeName, GUILayout.Width(100));
            EditorGUILayout.LabelField("金币场标签", GUILayout.Width(70));
            info.goldRoomName = EditorGUILayout.TextField(info.goldRoomName, GUILayout.Width(100));
            EditorGUILayout.EndHorizontal();

            GUILayout.Space(5);
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("标签:", GUILayout.Width(70));
            info.tag = (TagEnum)EditorGUILayout.EnumPopup(info.tag, GUILayout.Width(100));

            EditorGUILayout.EndHorizontal();



            GUILayout.Space(5);
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("玩法Icon:", GUILayout.Width(60));
            EditorGUI.BeginDisabledGroup(true);
            string[] strs = info.img.Split(',');
            string str = "";
            for (int i = 0; i < strs.Length; i++)
            {
                str += strs[i];
                str += "\n";
            }
            Rect headrect = EditorGUILayout.GetControlRect(GUILayout.Width(280), GUILayout.Height(30));
            EditorGUI.TextField(headrect, str);
            EditorGUI.EndDisabledGroup();
            Texture iconObj = (Texture)EditorGUILayout.ObjectField(null, typeof(Texture), true, GUILayout.Width(120));
            if (iconObj != null)
            {
                string path = AssetDatabase.GetAssetPath(iconObj);
                if (path != "")
                {
                    AssetImporter assetImporter = AssetImporter.GetAtPath(path);
                    if (assetImporter != null && assetImporter.assetBundleName != null)
                    {
                        info.img = assetImporter.assetBundleName + "," + System.IO.Path.GetFileNameWithoutExtension(path);
                    }
                    else
                    {
                        Debug.LogError(System.IO.Path.GetFileNameWithoutExtension(path) + " 未设置AssetBundle Paking Tag 请设置后再使用！");
                    }
                }
            }
            EditorGUILayout.EndHorizontal();

            GUILayout.Space(5);
            EditorGUILayout.BeginHorizontal();
            EditorGUILayout.LabelField("推荐icon:", GUILayout.Width(60));
            EditorGUI.BeginDisabledGroup(true);
            strs = info.headIcon.Split(',');
            str = "";
            for (int i = 0; i < strs.Length; i++)
            {
                str += strs[i];
                str += "\n";
            }
            headrect = EditorGUILayout.GetControlRect(GUILayout.Width(280), GUILayout.Height(30));
            EditorGUI.TextField(headrect, str);
            EditorGUI.EndDisabledGroup();
            iconObj = (Texture)EditorGUILayout.ObjectField(null, typeof(Texture), true, GUILayout.Width(120));
            if (iconObj != null)
            {
                string path = AssetDatabase.GetAssetPath(iconObj);
                if (path != "")
                {
                    AssetImporter assetImporter = AssetImporter.GetAtPath(path);
                    if (assetImporter != null && assetImporter.assetBundleName != null)
                    {
                        info.headIcon = assetImporter.assetBundleName + "," + System.IO.Path.GetFileNameWithoutExtension(path);
                    }
                    else
                    {
                        Debug.LogError(System.IO.Path.GetFileNameWithoutExtension(path) + " 未设置AssetBundle Paking Tag 请设置后再使用！");
                    }
                }
            }
            EditorGUILayout.EndHorizontal();
        }

        public static void BeginContent()
        {
            EditorGUILayout.BeginHorizontal("TextArea", GUILayout.Width(500));
            EditorGUILayout.BeginVertical();
        }

        public static void EndContent()
        {
            EditorGUILayout.EndVertical();
            EditorGUILayout.EndHorizontal();
        }

        private static void DrawLocationInfo(PlayModeConfig config)
        {
            if (locationName == string.Empty)
                locationName = config.value;
            EditorGUILayout.BeginHorizontal("TextArea", GUILayout.Width(500), GUILayout.Height(25));
            GUILayout.Space(5);
            EditorGUILayout.BeginVertical(GUILayout.Width(50));
            GUILayout.Space(5);
            EditorGUILayout.LabelField("是否开启：", GUILayout.Width(50));
            EditorGUILayout.EndVertical();
            EditorGUILayout.BeginVertical(GUILayout.Width(30));
            GUILayout.Space(3);
            config.isOpen = EditorGUILayout.Toggle(config.isOpen);
            EditorGUILayout.EndVertical();
            EditorGUILayout.BeginVertical(GUILayout.Width(50));
            GUILayout.Space(5);
            EditorGUILayout.LabelField("地区名：", GUILayout.Width(50));
            EditorGUILayout.EndVertical();
            EditorGUILayout.BeginVertical(GUILayout.Width(210));
            GUILayout.Space(5);
            locationName = EditorGUILayout.TextField(locationName, GUILayout.Width(200));
            EditorGUILayout.EndVertical();

            EditorGUILayout.BeginVertical(GUILayout.Width(40));
            GUILayout.Space(2);
            if (GUILayout.Button("修改", GUILayout.Width(40)))
            {
                config.value = locationName;
                locationName = string.Empty;
            }
            EditorGUILayout.EndVertical();
            EditorGUILayout.BeginVertical(GUILayout.Width(80));
            GUILayout.Space(2);
            if (GUILayout.Button("新增玩法", GUILayout.Width(80)))
            {
                PlayModeInfo info = new PlayModeInfo();
                info.gameId = config.GetInfoNextId();
                info.location = config.key;
                info.name = "新增的玩法";
                config.playModeList.Add(info);
            }
            EditorGUILayout.EndVertical();

            EditorGUILayout.EndHorizontal();
        }

        private static bool isHideHead = true;
        // NGUI 的标签头
        static public bool DrawItemHeader(PlayModeConfig config, ref HeadState state, int index)
        {
            string text = config.value + "        id = " + config.key;
            GUILayout.Space(3f);
            switch (state)
            {
                case HeadState.Edit:
                    GUI.backgroundColor = new Color(1f, 1f, 1f);
                    text = "\u25BC " + text;
                    break;
                default:
                    GUI.backgroundColor = (index % 2 == 0 ? new Color(0.7f, 0.8f, 0.8f) : new Color(0.8f, 0.8f, 0.8f));
                    text = "\u25BA " + text;
                    break;
            }
            GUILayout.BeginHorizontal();
            GUI.changed = false;

            bool result;
            EditorGUILayout.BeginVertical(GUILayout.Width(415));
            if (state == HeadState.Edit)
            {
                result = true;
                isHideHead = GUILayout.Toggle(isHideHead, text, "dragtab", GUILayout.Width(415));
                if (!isHideHead)
                {
                    state = HeadState.Nomal;
                    editIndex = -1;
                    Debug.Log("Hide");
                    isHideHead = true;
                    result = false;
                }
            }
            else
                result = !GUILayout.Toggle(true, text, "dragtab", GUILayout.Width(415));
            EditorGUILayout.EndVertical();
            GUI.backgroundColor = Color.white;
            EditorGUILayout.BeginVertical(GUILayout.Width(20));
            if (GUILayout.Button("↑", GUILayout.Width(20)))
            {
                int configIndex = PlayModeTools.pData.configs.IndexOf(config);
                if (configIndex != 0)
                {
                    var temp = PlayModeTools.pData.configs[configIndex];
                    PlayModeTools.pData.configs[configIndex] = PlayModeTools.pData.configs[configIndex - 1];
                    PlayModeTools.pData.configs[configIndex - 1] = temp;
                    PlayModeTools.SortData();
                }
            }
            EditorGUILayout.EndVertical();
            EditorGUILayout.BeginVertical(GUILayout.Width(20));
            if (GUILayout.Button("↓", GUILayout.Width(20)))
            {
                int configIndex = PlayModeTools.pData.configs.IndexOf(config);
                if (configIndex != PlayModeTools.pData.configs.Count - 1)
                {
                    var temp = PlayModeTools.pData.configs[configIndex];
                    PlayModeTools.pData.configs[configIndex] = PlayModeTools.pData.configs[configIndex + 1];
                    PlayModeTools.pData.configs[configIndex + 1] = temp;
                    PlayModeTools.SortData();
                }
            }
            EditorGUILayout.EndVertical();
            GUI.backgroundColor = Color.red;
            EditorGUILayout.BeginVertical(GUILayout.Width(20));
            if (GUILayout.Button("x", GUILayout.Width(20)))
            {
                int configIndex = PlayModeTools.pData.configs.IndexOf(config);
                PlayModeTools.pData.configs.RemoveAt(configIndex);
                PlayModeTools.SortData();
            }
            EditorGUILayout.EndVertical();

            GUILayout.EndHorizontal();
            GUI.backgroundColor = Color.white;
            //if (!state) GUILayout.Space(3f);
            return result;
        }

    }
}
