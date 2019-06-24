using UnityEngine;
using UnityEditor;
using UnityEngine.UI;
using littlerbird.units;

/// <summary>
/// 列表编辑器UGUI版
/// @author 邱洪波

/// </summary>
namespace littlerbird.UI
{
    [CustomEditor(typeof(QuickGrid))]
    public class QuickGridEditor : Editor//UnityEditor.UI.ScrollRectEditor
    {
        #region CreateMenu
        [MenuItem("GameObject/Create Other/QuickGrid")]
        private static void CreateGrid2()
        {
            GameObject parent = Selection.activeGameObject;
            if (!parent)
            {
                Debug.LogError("请选择列表的父对象");
                return;
            }
            GameObject grid = CreateGrid(parent);
            CreateItem(CreateContent(grid).gameObject);
            Selection.activeGameObject = grid;
        }

        private static GameObject CreateGrid(GameObject parent)
        {
            int layer = parent.gameObject.layer;
            GameObject go = new GameObject("QuickGrid");//NGUITools.AddChild(parent, false);
            go.E_SetParentAndReset(parent);
            go.layer = layer;
            QuickGrid grid = go.AddComponent<QuickGrid>();
            go.GetComponent<Mask>().showMaskGraphic = false;
            return go;
        }

        private static QuickGridContent CreateContent(GameObject parent)
        {
            int layer = parent.gameObject.layer;
            GameObject go = new GameObject("Content");
            go.E_SetParentAndReset(parent);
            go.layer = layer;
            QuickGridContent content = go.AddComponent<QuickGridContent>();
            return content;
        }

        private static QuickGridItemBase CreateItem(GameObject parent)
        {
            int layer = parent.gameObject.layer;
            GameObject go = new GameObject("Item");
            go.E_SetParentAndReset(parent);
            go.layer = layer;
            QuickGridItemBase item = go.AddComponent<QuickGridItemBase>();
            return item;
        }

        private static QuickGridItemPanelBase CreateItemPanel(GameObject parent)
        {
            int layer = parent.gameObject.layer;
            GameObject go = new GameObject("ItemPanel");
            go.E_SetParentAndReset(parent);
            go.layer = layer;
            QuickGridItemPanelBase item = go.AddComponent<QuickGridItemPanelBase>();
            return item;
        }
        #endregion

        private QuickGrid grid;
        private QuickGridContent content;
        private QuickGridItemBase item;
        private Transform tsfWidget;
        private Image mask;

        protected void OnEnable()
        {
            grid = target as QuickGrid;
            grid.needItemEvent = true;
            grid.needItemPanelMask = false;
            mask = grid.GetComponent<Image>();
            //sv = GetAndAdd<ScrollRect>(grid);

            content = FindComponentInChildren<QuickGridContent>(grid.transform); //grid.GetComponentInChildren<QuickGridContent>();
            if (!content)
                content = CreateContent(grid.gameObject);
            tsfWidget = content.transform;

            item = FindComponentInChildren<QuickGridItemBase>(tsfWidget);// content.GetComponentInChildren<QuickGirdItemConfig>();
            if (!item)
                item = CreateItem(content.gameObject);
        }
        public override void OnInspectorGUI()
        {
            //base.OnInspectorGUI();
            //return;
            EditorGUI.BeginChangeCheck();

            GUILayout.BeginVertical();
            QuickGrid.MoveType mm = (QuickGrid.MoveType)EditorGUILayout.EnumPopup("拖拽方向", grid.movement);
            if (mm != grid.movement)
            {
                grid.movement = mm;
                grid.content.CalculateSize(grid.debugDataCount);
                //grid.CalculateSize(grid.debugDataCount);
            }

            grid.needItemPanel = EditorGUILayout.ToggleLeft("ItemPanel", grid.needItemPanel);
            if (grid.needItemPanel && grid.itemPanel)
                grid.itemPanel.offset = grid.itemPanel.height;

            grid.selectType = (QuickGrid.SelectType)EditorGUILayout.EnumPopup("选择类型", grid.selectType);

            GUILayout.BeginHorizontal();
            grid.tweenType = (QuickGrid.GridTweenType)EditorGUILayout.EnumPopup("动画类型", grid.tweenType);
            if (grid.tweenType == QuickGrid.GridTweenType.None)
            {
                if (grid.tween)
                    DestroyImmediate(grid.tween);
            }
            else
            {
                if (!grid.tween)
                    grid.gameObject.AddComponent<QuickGridTweenBase>();
                if (Application.isPlaying && GUILayout.Button("play"))
                {
                    //DOTween.KillAll(true);
                    grid.tween.StopTween();
                    grid.SetData(grid.dataList);
                }
            }
            GUILayout.EndHorizontal();
            //grid.needItemEvent = GUILayout.Toggle(grid.needItemEvent, "Item是否需要接受Event");
            //if (grid.needItemEvent)
            //{
            //    BoxCollider box = AddRemoveComponent(item, content);
            //    if (box)
            //        box.size = new Vector3(grid.cellWidth, grid.cellHeight, 0);
            //}
            //else
            //{
            //    AddRemoveComponent(content, item);
            //}

            Vector2 cell = EditorGUILayout.Vector2Field("格子大小", new Vector2(grid.cellWidth, grid.cellHeight), GUILayout.MinWidth(20f));
            if (cell.x <= 0)
                cell.x = 1;
            if (cell.y <= 0)
                cell.y = 1;
            grid.cellWidth = (int)cell.x;
            grid.cellHeight = (int)cell.y;
            (item.localTsf as RectTransform).sizeDelta = cell;

            //panel.clipping = UIDrawCall.Clipping.SoftClip;
            Vector2 v = mask.rectTransform.rect.size;
            //v.z -= panel.clipSoftness.x * 2;
            //v.w -= panel.clipSoftness.y * 2;

            GUILayout.Label("显示区域");

            if (grid.movement == QuickGrid.MoveType.Vertical)
            {
                GUILayout.BeginHorizontal();
                GUILayout.Space(20f);
                grid.lockClipWidth = GUILayout.Toggle(grid.lockClipWidth, "自动宽(格子宽*格子列数)");
                if (grid.lockClipWidth)
                {
                    grid.clipWidth = grid.cellWidth * grid.pageCells;
                    GUILayout.Label("" + grid.clipWidth);
                    GUILayout.EndHorizontal();
                }
                else
                {
                    grid.clipWidth = (int)v.x;
                    grid.clipWidth = EditorGUILayout.IntField(grid.clipWidth);
                    if (grid.clipWidth < 1)
                        grid.cellWidth = 1;
                    GUILayout.EndHorizontal();
                }

                GUILayout.BeginHorizontal();
                GUILayout.Space(20f);
                GUILayout.Label("格子数/行");
                grid.pageCells = EditorGUILayout.IntSlider(grid.pageCells, 1, (grid.clipWidth / grid.cellWidth + 2));
                GUILayout.EndHorizontal();
                if (grid.pageCells == (grid.clipWidth / grid.cellWidth + 2))
                {
                    EditorGUILayout.HelpBox("每行最大格子数量为(可视区宽/格子宽+2),如果需要显示更多格子,请先调整可视区宽度", MessageType.Info);
                }


                GUILayout.BeginHorizontal();
                GUILayout.Space(20f);
                grid.lockClipHeight = GUILayout.Toggle(grid.lockClipHeight, "自动高(格子高*格子行数)");
                if (grid.lockClipHeight)
                {
                    grid.clipHeight = grid.cellHeight * (grid.pageRows - 1);
                    GUILayout.Label("" + grid.clipHeight);
                    GUILayout.EndHorizontal();

                    GUILayout.BeginHorizontal();
                    GUILayout.Space(20f);
                    GUILayout.Label("格子数/列");
                    grid.pageRows = EditorGUILayout.IntSlider(grid.pageRows - 1, 1, (grid.clipHeight / grid.cellHeight + 2));
                    grid.pageRows++;
                    GUILayout.EndHorizontal();
                }
                else
                {
                    grid.clipHeight = (int)v.y;
                    grid.clipHeight = EditorGUILayout.IntField(grid.clipHeight);
                    if (grid.clipHeight < 1)
                        grid.clipHeight = 1;
                    GUILayout.EndHorizontal();

                    GUILayout.BeginHorizontal();
                    GUILayout.Space(20f);
                    grid.CalculateRows();
                    GUILayout.Label("每屏显示" + (grid.pageRows - 1) + (grid.movement == QuickGrid.MoveType.Horizontal ? "列" : "行") + "(显示区域宽/格子宽)");//实际生成会+1,供替换使用
                    GUILayout.EndHorizontal();
                }
            }
            else
            {
                GUILayout.BeginHorizontal();
                GUILayout.Space(20f);
                grid.lockClipWidth = GUILayout.Toggle(grid.lockClipWidth, "自动宽(格子宽*格子列数)");
                if (grid.lockClipWidth)
                {
                    grid.clipWidth = grid.cellWidth * (grid.pageRows - 1);
                    GUILayout.Label("" + grid.clipWidth);
                    GUILayout.EndHorizontal();

                    GUILayout.BeginHorizontal();
                    GUILayout.Space(20f);
                    GUILayout.Label("格子数/行");
                    grid.pageRows = EditorGUILayout.IntSlider(grid.pageRows - 1, 1, (grid.clipWidth / grid.cellWidth + 2));
                    grid.pageRows++;
                    GUILayout.EndHorizontal();
                }
                else
                {
                    grid.clipWidth = (int)v.x;
                    grid.clipWidth = EditorGUILayout.IntField(grid.clipWidth);
                    if (grid.clipWidth < 1)
                        grid.cellWidth = 1;
                    GUILayout.EndHorizontal();

                    GUILayout.BeginHorizontal();
                    GUILayout.Space(20f);
                    grid.CalculateRows();
                    GUILayout.Label("每屏显示" + (grid.pageRows - 1) + (grid.movement == QuickGrid.MoveType.Horizontal ? "列" : "行") + "(显示区域宽/格子宽)");//实际生成会+1,供替换使用
                    GUILayout.EndHorizontal();
                }


                GUILayout.BeginHorizontal();
                GUILayout.Space(20f);
                grid.lockClipHeight = GUILayout.Toggle(grid.lockClipHeight, "自动高(格子高*格子行数)");
                if (grid.lockClipHeight)
                {
                    grid.clipHeight = grid.cellHeight * grid.pageCells;
                    GUILayout.Label("" + grid.clipHeight);
                    GUILayout.EndHorizontal();

                }
                else
                {
                    grid.clipHeight = (int)v.y;
                    grid.clipHeight = EditorGUILayout.IntField(grid.clipHeight);
                    if (grid.clipHeight < 1)
                        grid.clipHeight = 1;
                    GUILayout.EndHorizontal();
                }

                GUILayout.BeginHorizontal();
                GUILayout.Space(20f);
                GUILayout.Label("格子数/列");
                grid.pageCells = EditorGUILayout.IntSlider(grid.pageCells, 1, (grid.clipHeight / grid.cellHeight + 2));
                GUILayout.EndHorizontal();

                if (grid.pageCells == (grid.clipHeight / grid.cellHeight + 2))
                {
                    EditorGUILayout.HelpBox("每列最大格子数量为(可视区高/格子高+2),如果需要显示更多格子,请先调整可视区高度", MessageType.Info);
                }
            }

            //v.x = 0;
            //v.y = 0;
            //v.z = grid.clipWidth;
            //v.w = grid.clipHeight;
            //v.z += panel.clipSoftness.x * 2;
            //v.w += panel.clipSoftness.y * 2;
            //panel.baseClipRegion = v;
            v.Set(grid.clipWidth, grid.clipHeight);
            mask.rectTransform.SetSizeWithCurrentAnchors(RectTransform.Axis.Horizontal, v.x);
            mask.rectTransform.SetSizeWithCurrentAnchors(RectTransform.Axis.Vertical, v.y);


            if (Application.isPlaying == false)
            {
                //NGUIEditorTools.DrawPadding();
                grid.isDesignPreview = GUILayout.Toggle(grid.isDesignPreview, "是否开启调试");
                if (grid.isDesignPreview)
                {
                    grid.debugDataCount = EditorGUILayout.IntField("测试数据条数", grid.debugDataCount);
                    if (grid.debugDataCount < 0)
                        grid.debugDataCount = 0;
                    //grid.preview = GUILayout.Toggle(grid.preview, "事实预览");
                    grid.CallDebug();
                }
                else
                {
                    grid.RemovePreview();
                }
            }
            else
            {
                if (GUILayout.Button("重新生成预览视图"))
                    grid.CallDebug();

                //GUILayout.Label(grid.DebugRunLog());
            }


            GUILayout.EndVertical();

            if (EditorGUI.EndChangeCheck())
                EditorUtility.SetDirty(grid);
        }

        //可以查找隐藏状态的组件
        private T FindComponentInChildren<T>(Transform tsf) where T : MonoBehaviour
        {
            T t;
            for (int i = 0; i < tsf.childCount; i++)
            {
                t = tsf.GetChild(i).GetComponent<T>();
                if (t)
                    return t;
            }
            return null;
        }


        private T GetAndAdd<T>(MonoBehaviour obj) where T : MonoBehaviour
        {
            T t = obj.GetComponent<T>();
            if (!t)
                t = obj.gameObject.AddComponent<T>();
            return t;
        }
    }

    //[CustomEditor(typeof(QuickGridItemBase))]
    //public class QuickGridItemEditor : Editor
    //{
    //    private QuickGridItemBase m_item;
    //    private QuickGrid m_grid;
    //    private UIHead m_ui;
    //    private string m_path;

    //    protected void OnEnable()
    //    {
    //        m_item = target as QuickGridItemBase;
    //        QuickGridItemBase[] ms = m_item.transform.GetComponents<QuickGridItemBase>();
    //        if (ms.Length > 1)
    //        {
    //            GameObject go = m_item.gameObject;
    //            DestroyImmediate(m_item);
    //            Selection.activeGameObject = null;
    //            Selection.activeGameObject = go;
    //            return;
    //        }

    //        m_grid = PublicUnits.FindComponentInParent<QuickGrid>(m_item.transform);
    //        m_ui = PublicUnits.FindComponentInParent<UIHead>(m_item.transform);
    //        if (m_ui)
    //            m_path = string.Format("{0}{1}/", UIConst.Script_Path, m_ui.UName);


    //    }
    //    public override void OnInspectorGUI()
    //    {
    //        if (Application.isPlaying)
    //        {
    //            return;
    //        }

    //        if (m_ui)
    //        {
    //            if (GUILayout.Button("CreateScript"))
    //            {
    //                InputDialog.Show("输入文件名称", (name) =>
    //                {
    //                    if (string.IsNullOrEmpty(name))
    //                        return "名称不能为空";
    //                    string path = string.Format("{0}{1}.cs", m_path, name);
    //                    //if (File.Exists(path))//AssetDatabase.LoadAssetAtPath(path, typeof(TextAsset)))
    //                    //{
    //                    //    return "文件已经存在";
    //                    //}
    //                    string code = UIConst.QuickGrid_Item_Code.Replace("${root}", m_ui.UName);
    //                    code = code.Replace("${name}", name);

    //                    GameObject go = m_item.gameObject;
    //                    if (EditorTools.AddComponent(go, code, path))
    //                        Selection.activeGameObject = null;//脚本生成完成后会显示成不支持多选,再点击一次可恢复正常
    //                    DestroyImmediate(m_item);
    //                    EditorUtility.SetDirty(go);
    //                    return null;
    //                });
    //            }
    //        }
    //        else
    //        {
    //            EditorGUILayout.LabelField("QuickGrid必须设置在UIPrefab内才能编辑");
    //        }
    //    }
    //}
}

