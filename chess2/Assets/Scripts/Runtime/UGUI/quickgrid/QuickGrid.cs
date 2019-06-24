using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using LuaInterface;

/// <summary>
/// 列表组件UGUI版
/// 
/// 使用:
///     List<Data> list = new List<Data>();
///     grid.SetData(list);
/// 注意: 上例中grid.dataList != list;因为SetData内部实现为 grid.dataList.Add(list)
/// 
/// 丰富的事件接口,例如要侦听item的OnPressUp事件
/// 1 grid.SetUserData<bool>("OnPressUp", (item, inThis)=>{});
/// 2 继承QuickGridItemBase,重载DoClickDown方法: GetUserEvent<bool>("OnPressUp")(this, inThis);
/// 
/// 
/// 201615/26 合并SetData(List<object>)和SetData<T>(List<T>),m_dataList不会再每次SetData都new一次,
/// 
/// @author 邱洪波

/// </summary>
namespace littlerbird.UI
{
    [RequireComponent(typeof(Image), typeof(Mask))]
    public class QuickGrid : ScrollRect
    {
        public delegate void QuickCallback();
        public delegate void QuickGridItemEvenet(QuickGridItemBase item);
        public delegate void QuickGridItemEvenet<T>(QuickGridItemBase item, T t);
        public delegate bool ReturnQuickGridItemEvent(QuickGridItemBase item);
        public delegate bool ReturnQuickGridItemEvent<T>(QuickGridItemBase item, T t);

        public QuickGridItemEvenet OnItemClick;//item点击事件

        public ReturnQuickGridItemEvent<bool> CanSelectItem;//item能否被选中,只有通过点击更改选中状态才受此规则限制,直接通过grid.SelectXXX不受限制

        public ReturnQuickGridItemEvent CanOpenItemPanel;

        public QuickGridItemEvenet OnItemSelectChange;//item选择状态更改,QuickGridItemBase.OnSelectChange默认调用此方法,在OnItemClick之前触发

        public QuickGridItemEvenet OnItemDataChange;//item数据更改,QuickGridItemBase.OnDataChange默认调用此方法

        public QuickCallback OnMoveFirstOrLast;//移动到最前或最末尾,通过isMoveFirst和isMoveLast判断


        private Dictionary<string, object> otherData;// 自定义委托

        //private Dictionary<int, int>

        #region 属性配置

        //动画类型
        public enum GridTweenType
        {
            None,//无动画
            Line,//按行进行动画
            Row,//按列进行动画
            Cell,//按格子进行动画
            Custom,//自定义
        }

        public enum MoveType
        {
            Horizontal, Vertical,
        }

        public enum SelectType//是否需要选中功能
        {
            None,
            /// <summary>
            /// 单选,再次点击选中的item不可以取消选中
            /// </summary>
            Single,

            /// <summary>
            /// 单选,可以取消
            /// </summary>
            SingleAndCancel,

            /// <summary>
            /// 多选
            /// </summary>
            Multi
        }
        public MoveType movement;
        public MoveType Movement
        {
            get { return this.movement; }
            set {
                base.vertical = false;
                base.horizontal = false;
                if (value == MoveType.Horizontal)
                {
                    base.horizontal = true;
                }
                else
                {
                    base.vertical = true;
                }
            }
        }

        public GridTweenType tweenType = GridTweenType.None;

        public int cellWidth = 100;

        public int cellHeight = 100;
        public int clipWidth;

        public int ClipWidth
        {
            get
            {
                Rect rect = GetComponent<RectTransform>().rect;
                return this.clipWidth = (int)rect.size.x;
            }
            set
            {
                this.clipWidth = value;
            }
        }
        public int clipHeight;

        public int ClipHeight
        {
            get
            {
                Rect rect = GetComponent<RectTransform>().rect;
                return this.clipHeight = (int)rect.size.y;
            }
            set
            {
                this.clipHeight = value;
            }
        }

        public int pageCells;

        public int pageRows;

        public bool needItemEvent = true;//UGUI默认支持事件

        public SelectType selectType = SelectType.None;

        public bool needItemPanel = false;//是否需要item详情

        public bool fixHeightPanel = true;//panel高度是否固定

        public bool needItemPanelMask = false;//是否需要itempanel遮罩

        private QuickGridMask m_itemMask;
        public QuickGridMask itemMask
        {
            get
            {
                if (!m_itemMask)
                {
                    m_itemMask = transform.GetComponentInChildren<QuickGridMask>();
                    m_itemMask.config = this;
                }
                return m_itemMask;
            }
        }

        private QuickGridItemPanelBase m_itemPanel;
        public QuickGridItemPanelBase itemPanel
        {
            get
            {
                if (!m_itemPanel)
                {
                    m_itemPanel = transform.GetComponentInChildren<QuickGridItemPanelBase>();
                    m_itemPanel.config = this;
                    m_itemPanel.tsf.pivot = new Vector2(0, 1);
                }
                return m_itemPanel;
            }
        }

        private List<object> m_dataList = new List<object>();
        public List<object> dataList
        {
            get { return m_dataList; }
            set { SetData(value); }
        }

        private QuickGridContent m_content;
        public new QuickGridContent content
        {
            get
            {
                if (!m_content)
                    m_content = transform.GetComponentInChildren<QuickGridContent>();
                base.content = m_content.tsf;
                return m_content;
            }
        }



        private QuickGridTweenBase m_tween;
        public QuickGridTweenBase tween
        {
            get
            {
                if (!m_tween)
                {
                    m_tween = transform.GetComponent<QuickGridTweenBase>();
                    if (m_tween)
                        m_tween.config = this;
                }
                return m_tween;
            }
        }

        private List<object> m_selectList = new List<object>();
        public List<object> selectList
        {
            get { return m_selectList; }
        }

        public List<QuickGridItemBase> items
        {
            get { return content.items; }
        }

        private bool m_isMoveFirst = false;

        /// <summary> 是否移动到首 </summary>
        public bool isMoveFirst { get { return m_isMoveFirst; } }

        private bool m_isMoveLast = false;
        /// <summary> 是否移动到末尾 </summary>
        public bool isMoveLast { get { return m_isMoveLast; } }

        /// <summary>
        /// 当前移动的行数(横竖都适用)
        /// </summary>
        public int currentRow { get { return content.rowIndex; } }

        #endregion


        protected override void Awake()
        {
            base.Awake();
            Movement = Movement;
            onValueChanged.AddListener(SetMoveFirstOrLast);
            if (Application.isPlaying)
            {
                if (needItemPanel && itemPanel)
                {
                    itemPanel.OnInit();
                    if (itemPanel.index == -1)
                        itemPanel.go.SetActive(false);
                }
                if (content.items.Count == 0)
                {
                    content.items[0] = content.itemPrefab;
                }
               // EventSystem.current.pixelDragThreshold = Mathf.Max(5, Mathf.RoundToInt(5 * Screen.width / 720f));
            }

            //如果没有tween组件则自动去除
            if (tweenType != GridTweenType.None && !tween)
                tweenType = GridTweenType.None;

#if UNITY_EDITOR
            OnEditorInit();
#endif
        }


        public override void OnDrag(PointerEventData eventData)
        {
            if (tweenType != GridTweenType.None && tween.isTweening)
                return;
            base.OnDrag(eventData);
        }

        private void SetMoveFirstOrLast(Vector2 v)
        {
            float pos = Movement == MoveType.Horizontal ? horizontalNormalizedPosition : 1 - verticalNormalizedPosition;
            bool value = pos <= 0.0f;
            bool flag = false;
            if (m_isMoveFirst != value)
            {
                m_isMoveFirst = value;
                flag = true;
            }


            value = pos >= 1.0f;
            if (m_isMoveLast != value)
            {
                m_isMoveLast = value;
                flag = true;
            }

            if (flag && OnMoveFirstOrLast != null)
                OnMoveFirstOrLast();
        }


        #region 公有接口方法

        /// <summary>
        /// 设置自定义参数,可以在item和grid之间传递
        /// </summary>
        /// <param name="key"></param>
        /// <param name="value">可以是数据或者委托</param>
        public void SetUserEvent(string key, QuickGridItemEvenet value)
        {
            SetUserData(key, (object)value);
        }

        public void SetUserEvent<T>(string key, QuickGridItemEvenet<T> value)
        {
            SetUserData(key, (object)value);
        }

        public void SetUserData(string key, object value)
        {
            if (otherData == null)
                otherData = new Dictionary<string, object>();
            otherData[key] = value;
        }

        /// <summary>
        /// 获取设置的自定义参数
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="key"></param>
        /// <returns></returns>
        public QuickGridItemEvenet<T> GetUserEvent<T>(string key)
        {
            return GetUserData<QuickGridItemEvenet<T>>(key);
        }

        public QuickGridItemEvenet GetUserEvent(string key)
        {
            return GetUserData<QuickGridItemEvenet>(key);
        }

        public T GetUserData<T>(string key)
        {
            if (otherData != null && otherData.ContainsKey(key) && otherData[key] is T)
                return (T)otherData[key];
            else
                return default(T);
        }

        /// <summary>
        /// 取消所有选择
        /// </summary>
        public void UnSelect()
        {
            selectList.Clear();
            content.SelectChange();
        }

        public void SelectAll()
        {
            if (selectType == SelectType.Multi)
            {
                selectList.Clear();
                selectList.AddRange(dataList);
                content.SelectChange();
            }
        }

        public void SelectIndex(bool selected, int index)
        {
            SelectData(selected, dataList[index]);
        }

        /// <summary>
        /// 设置选择的数据,只有多选模式有效
        /// </summary>
        /// <param name="data"></param>
        public void SetSelectData(params object[] data)
        {
            if (selectType == SelectType.Multi)
            {
                selectList.Clear();
                if (data != null)
                    for (int i = 0; i < data.Length; i++)
                    {
                        selectList.Add(data[i]);
                    }
                content.SelectChange();
            }
        }

        /// <summary>
        /// 选择或取消选择item,可以设置多个,如果data为null或者空,则不做任何操作
        /// </summary>
        /// <param name="selected"></param>
        /// <param name="data"></param>
        public void SelectData(bool selected, params object[] data)
        {
            if (data == null || data.Length == 0)
            {
                return;
            }
            else
            {
                if (selectType == SelectType.Multi)
                {
                    for (int i = 0; i < data.Length; i++)
                    {
                        if (selected)
                        {
                            if (selectList.IndexOf(data[i]) == -1)
                                selectList.Add(data[i]);
                        }
                        else
                        {
                            selectList.Remove(data[i]);
                        }
                    }
                }
                else
                {
#if UNITY_EDITOR
                    if (data.Length > 1)
                    {
                        Debug.LogWarning("单选模式设置多选择多个数据只选择第一项");
                    }
#endif
                    selectList.Clear();
                    if (selected)
                    {
                        selectList.Add(data[0]);
                    }
                }
            }
            content.SelectChange();
        }

        /// <summary>
        /// 刷新item
        /// </summary>
        /// <param name="data"></param>
        public void RefreshItem(object data)
        {
            QuickGridItemBase item = content.GetShowItem(data);
            if (item)
            {
                item.OnDataChange();
                item.OnSelectChange();
            }
            if (needItemPanel && itemPanel.data == data && itemPanel.isShow)
                itemPanel.Refresh();
        }

        /// <summary>
        /// 刷新列表,直接对数据更改后可以调用此方法刷新视图
        /// </summary>
        public void Refresh()
        {
            content.Refresh();
        }

        /// <summary>
        /// TODO:将指定序号的item移动到可视区域
        /// </summary>
        /// <param name="index"></param>
        public void MoveIndex(int index)
        {
            if (index < 0)
                index = 0;
            int ri = index / pageCells;
            //if (index % pageCells == 0)//显示位置要比实际位置多一行才能在当前屏第一条展示出来
            //    ri--;
            if (content.totalRows - ri < pageRows)//超出最后一屏则显示最后一屏
                ri = content.totalRows - pageRows + 1;

            Vector2 v = content.GetRowIndexPos(ri);

            if (dataList.Count - index - 1 < pageCells)
            {
                if (Movement == MoveType.Vertical && ClipHeight % cellHeight != 0
                    && ClipHeight / cellHeight * pageCells < index + 1)
                    v = v + new Vector2(0f, cellHeight - viewRect.sizeDelta.y % cellHeight);
                else if (Movement == MoveType.Horizontal && ClipWidth % cellWidth != 0
                         && ClipWidth / cellWidth * pageCells < index + 1)
                    v = v - new Vector2(cellWidth - viewRect.sizeDelta.x % cellWidth, 0f);
            }

            SetMove(v);
        }

        internal void SetMove(Vector2 v)
        {
            StopMovement();
            SetContentAnchoredPosition(v);
        }

        public void MoveByData(object data)
        {
            MoveIndex(dataList.IndexOf(data));
        }

        public void ShowItemPanel(object data)
        {
            if (!needItemPanel || m_dataList.IndexOf(data) == -1)
                return;

            var item = content.GetShowItem(data);
            if (!item)
            {
                itemPanel.SetData(data);
            }
            else
            {
                MoveByData(data);
                itemPanel.Bind(item);
            }

        }

        public void ShowItemPanel(int index)
        {
            if (!needItemPanel || index < 0 || index >= m_dataList.Count)
                return;

            ShowItemPanel(m_dataList[index]);
        }

        public void HideItemPanel(bool useEffect = false)
        {
            if (needItemPanel)
            {
                if (useEffect)
                    itemPanel.Hide();
                else
                    itemPanel.RealHide();
            }
        }

        ///// <summary>
        ///// 设置列表数据
        ///// </summary>
        ///// <param name="data"></param>
        //public void SetData(List<object> data, bool autoMove)
        //{
        //    if (data == null)
        //    {
        //        content.HideItems();
        //        return;
        //    }

        //    m_dataList = data;
        //    content.CalculateSize(data.Count);
        //    content.SetData();
        //    if(autoMove)
        //        MoveIndex(0);
        //}

        /// <summary>
        /// 清空表格
        /// </summary>
        public void Clear()
        {
            if (tweenType != QuickGrid.GridTweenType.None && Application.isPlaying)
                tween.Stop();

            m_dataList.Clear();
            content.SetDataCount();
            content.HideItems();
            HideItemPanel();
        }
        public void SetData(object data, int moveIndex)
        {
            if (data == null)
            {
                Clear();
                return;
            }
            else
            {
                if (tweenType != QuickGrid.GridTweenType.None && Application.isPlaying)
                    tween.Stop();
                LuaTable table = (LuaTable)data;
                int len = table.Length;
                if (!m_dataList.Equals(table))
                {
                    m_dataList.Clear();
                    for (int i = 1; i <= len; i++)
                        m_dataList.Add(table[i]);
                }
                content.CalculateSize(len);
                content.SetData();
                if (moveIndex >= 0)
                    MoveIndex(moveIndex);
            }
        }
        /// <summary>
        /// 设置数据并移动到指定行,如果行数小于0则不移动
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="data"></param>
        /// <param name="moveIndex"></param>
        public void SetData<T>(List<T> data, int moveIndex)
        {
            if (data == null || data.Count == 0)
            {
                Clear();
                return;
            }
            else
            {
                if (tweenType != QuickGrid.GridTweenType.None && Application.isPlaying)
                    tween.Stop();
                int len = data.Count;
                if (!m_dataList.Equals(data))
                {
                    m_dataList.Clear();
                    for (int i = 0; i < len; i++)
                        m_dataList.Add(data[i]);
                }
                content.CalculateSize(len);
                content.SetData();
                if (moveIndex >= 0)
                    MoveIndex(moveIndex);
            }
        }

        public void SetData<T>(T[] data, int moveIndex)
        {
            if (data == null || data.Length == 0)
            {
                Clear();
                return;
            }
            else
            {
                if (tweenType != QuickGrid.GridTweenType.None && Application.isPlaying)
                    tween.Stop();
                int len = data.Length;
                m_dataList.Clear();
                for (int i = 0; i < len; i++)
                    m_dataList.Add(data[i]);

                content.CalculateSize(len);
                content.SetData();
                if (moveIndex >= 0)
                    MoveIndex(moveIndex);
            }
        }

        public void SetData<T>(List<T> data)
        {
            SetData<T>(data, 0);
        }

        public void SetData<T>(T[] data)
        {
            SetData<T>(data, 0);
        }

        public void CalculateRows()
        {
            if (Movement == QuickGrid.MoveType.Vertical)
            {
                pageRows = ClipHeight / cellHeight;
                if (ClipHeight % cellHeight != 0)
                    pageRows++;
                pageRows++;//增加冗余替换的选项
            }
            else
            {
                pageRows = ClipWidth / cellWidth;
                if (ClipWidth % cellWidth != 0)
                    pageRows++;
                pageRows++;
            }
        }
        #endregion

        #region 编辑器相关

#if UNITY_EDITOR
        [NoToLua]
        public bool lockClipWidth, lockClipHeight;
        [NoToLua]
        public bool isDesignPreview;
        [NoToLua]
        public int debugDataCount;

        [NoToLua]
        public string DebugRunLog()
        {
            StringBuilder b = new StringBuilder();
            //b.Append("ConstOffsetX:");
            //b.Append(constOffsetX);
            //b.Append("  ConstOffsetY:");
            //b.Append(constOffsetY);
            //b.Append("\n");
            //b.Append("ConstOffsetW:");
            //b.Append(constOffsetW);
            //b.Append("  ConstOffsetH:");
            //b.Append(constOffsetH);
            //b.Append("\n");
            //b.Append("width:");
            //b.Append(width);
            //b.Append("  height:");
            //b.Append(height);
            //b.Append("\n");
            //b.Append("TotalRows:");
            //b.Append(totalRows);
            //b.Append("\n");
            return b.ToString();
        }
        [NoToLua]
        public void CallDebug()
        {
            if (!content)
                return;
            content.CullItem();
            if (Application.isPlaying)
            {
                SetData(dataList);
            }
            else if (isDesignPreview)
            {
                dataList = new List<object>();
                for (int i = 1; i <= debugDataCount; i++)
                {
                    dataList.Add(i);
                }
                SetData(dataList);
            }
        }
        [NoToLua]
        public void RemovePreview()
        {
            if (!content)
                return;
            content.RevmoeItem();
        }

        private void OnEditorInit()
        {
            if (isDesignPreview)
            {
                dataList = new List<object>();
                for (int i = 1; i <= debugDataCount; i++)
                {
                    dataList.Add(i);
                }
                SetData(dataList);
            }
        }
#endif
        #endregion

    }
}
