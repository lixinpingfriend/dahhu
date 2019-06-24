using UnityEngine;
using System.Collections.Generic;
using System.Collections;

/// <summary>
/// 
/// @author 邱洪波

/// </summary>
namespace littlerbird.UI
{
    [RequireComponent(typeof(RectTransform))]
    public class QuickGridContent : MonoBehaviour
    {

        public List<QuickGridItemBase> items = new List<QuickGridItemBase>();

        public int rowIndex = 0;//当前行数

        private int dataCount = 0;//数据条数

        private bool m_refreshPage = false;//强制刷新当前page

        private QuickGrid m_config;
        public QuickGrid config
        {
            get
            {
                if (!m_config)
                    m_config = tsf.GetComponentInParent<QuickGrid>();
                return m_config;
            }
        }

        private QuickGridItemBase m_itemPrefab;
        public QuickGridItemBase itemPrefab
        {
            get
            {
                if (!m_itemPrefab)
                {
                    if (items.Count > 0)
                        m_itemPrefab = items[0];

                    if (!m_itemPrefab)
                    {
                        m_itemPrefab = transform.GetComponentInChildren<QuickGridItemBase>();
                        items[0] = m_itemPrefab;
                    }
                    m_itemPrefab.config = config;
                    m_itemPrefab.Init();
                }
                return m_itemPrefab;
            }
        }

        private RectTransform _tsf;
        public RectTransform tsf { get { if (!_tsf) _tsf = transform as RectTransform; return _tsf; } }


        #region 运算优化


        public int totalRows;

        public int width;//content总宽

        public int height;//content总高

        public int constOffsetX, constOffsetY, constOffsetW, constOffsetH;
        public int oldPos;

        internal int GetPosX(int x)
        {
            if (config.needItemPanel && config.itemPanel.isShow && config.Movement == QuickGrid.MoveType.Horizontal && config.itemPanel.line < x)
            {
                return x * config.cellWidth + constOffsetX + config.itemPanel.offset;
            }
            else
            {
                return x * config.cellWidth + constOffsetX;
            }
        }

        internal int GetPosY(int y)
        {
            if (config.needItemPanel && config.itemPanel.isShow && config.Movement == QuickGrid.MoveType.Vertical && config.itemPanel.line < y)
            {
                return constOffsetY - y * config.cellHeight - config.itemPanel.offset;
            }
            else
            {
                return constOffsetY - y * config.cellHeight;
            }
        }

        internal int GetRowIndex()
        {
            int offset;
            int index = -1;
            if (config.Movement == QuickGrid.MoveType.Horizontal)
            {
                if (rowIndex == -1 || oldPos != (int)tsf.anchoredPosition.x)//rowIndex=-1表示需要初始化
                {
                    oldPos = (int)tsf.anchoredPosition.x;
                    offset = constOffsetW - oldPos;
                    if (config.needItemPanel && config.itemPanel.isShow && config.itemPanel.line <= (int)(offset / config.cellWidth))//panel下的一行达到临界点时会补位,界面出现空白行,用<=禁止补位
                        offset += config.itemPanel.offset;
                    index = offset / config.cellWidth;
                    if (index < 0)
                        index = 0;
                }
            }
            else
            {
                if (rowIndex == -1 || oldPos != (int)tsf.anchoredPosition.y)
                {
                    oldPos = (int)tsf.anchoredPosition.y;
                    offset = constOffsetH + oldPos;
                    if (config.needItemPanel && config.itemPanel.isShow && config.itemPanel.line <= (int)(offset / config.cellHeight))
                        offset -= config.itemPanel.offset;
                    index = offset / config.cellHeight;
                    if (index < 0)
                        index = 0;
                }
            }
            return index;
        }

        internal Vector2 GetRowIndexPos(int index)
        {
            Vector2 v = Vector2.zero;
            if (config.Movement == QuickGrid.MoveType.Horizontal)
            {
                if (width <= config.ClipWidth)
                    return v;
                v.x = constOffsetW - index * config.cellWidth;
                if (config.needItemPanel && config.itemPanel.isShow && config.itemPanel.line < index)
                    v.x += config.itemPanel.offset;
            }
            else
            {
                if (height <= config.ClipHeight)
                    return v;
                v.y = index * config.cellHeight - constOffsetH;
                if (config.needItemPanel && config.itemPanel.isShow && config.itemPanel.line < index)
                    v.y -= config.itemPanel.offset;
            }
            return v;
        }

        internal void ReCalculateSize()
        {
            Vector3 v = tsf.localPosition;
            if (config.Movement == QuickGrid.MoveType.Horizontal)
            {
                int w = width;
                CalculateSize(dataCount);
            }
            else
            {
                int h = height;
                CalculateSize(dataCount);
                //如果是当前page的最后一行,移动到最后,如果不是,则确保当前行所在位置不变
                v.y -= (height - h) / 2;//确保panel显示后当前行所在位置不变

                if (config.itemPanel.isShow)
                {
                    int line = config.itemPanel.line;
                    if (line == totalRows - 1)
                    {
                        v.y = constOffsetH;//最后一行
                    }
                    else
                    {
                        /**
                        * 显示规则按优先级排序(在clip范围之内)
                        * 1.panel绑定的item必须显示
                        * 2.panel尽量全部显示
                        * 3.paenl尽量在显示下一个item
                        */
                        float clipTop = config.ClipHeight / 2f;
                        float clipBottom = -clipTop;//窗口底部坐标
                        float panelTop = config.content.GetPosY(line) - config.cellHeight / 2;
                        float panelBottom = panelTop - config.itemPanel.height;//panel底部坐标

                        //如果panel底部超过clip则往上移动确保panel底在clip底部
                        if (v.y + panelBottom < clipBottom)
                        {
                            v.y = clipBottom - panelBottom;//v.y += clipBottom - (v.y + panelBottom)
                        }

                        if (v.y + panelBottom - config.cellHeight < clipBottom)
                            v.y = clipBottom - panelBottom + config.cellHeight;

                        //float itemY = panelTop + config.cellHeight;
                        //if (v.y + itemY > clipTop)
                        //{
                        //    v.y = v.y + (v.y + panelTop - config.cellHeight / 2 - clipTop);
                        //}
                        //DOTween.To(() => tsf.localPosition, p => { config.SetMove(p); }, v, 0.1f);
                        //return;
                    }
                }
            }

            config.SetMove(v);
        }


        public void CalculateSize(int count)
        {
            width = config.cellWidth;
            height = config.cellHeight;

            int cells;
            cells = config.pageCells;
            totalRows = count / config.pageCells;
            if (count % config.pageCells != 0)
                totalRows++;

            if (config.Movement == QuickGrid.MoveType.Vertical)
            {
                width *= cells;
                height *= totalRows;

                if (config.needItemPanel && config.itemPanel.isShow)//需要panel则不管是否显示都加上,拖拽允许有误差
                    height += config.itemPanel.height;
            }
            else
            {
                width *= totalRows;
                height *= cells;

                if (config.needItemPanel && config.itemPanel.isShow)
                    width += config.itemPanel.height;
            }

            width = Mathf.Max(width, config.ClipWidth);
            height = Mathf.Max(height, config.ClipHeight);

            //tsf.anchoredPosition = Vector2.zero;
            tsf.sizeDelta = new Vector2(width, height);

            //伪常量
            constOffsetX = -(width - config.cellWidth) / 2;//位置由content决定
            constOffsetY = (height - config.cellHeight) / 2;
            if (config.Movement == QuickGrid.MoveType.Vertical)
            {
                constOffsetW = (Mathf.Min(width, config.cellWidth * config.pageCells)) / 2;
                constOffsetH = (height - config.ClipHeight) / 2;
            }
            else
            {
                constOffsetH = (Mathf.Min(height, config.cellHeight * config.pageCells)) / 2;
                constOffsetW = (width - config.ClipWidth) / 2;
            }
        }
        #endregion


#if UNITY_EDITOR
        //移除预览生成的item
        [LuaInterface.NoToLua]
        public void RevmoeItem()
        {
            QuickGridItemBase[] items = PublicUnits.FindAllComponents<QuickGridItemBase>(tsf);
            this.items.Clear();
            this.items.Add(items[0]);
            for (int i = 1; i < items.Length; i++)
            {
                DestroyImmediate(items[i].localGo);
            }
        }
#endif


#if UNITY_EDITOR
        [LuaInterface.NoToLua]
        public void CullItem()
        {
            int count = config.pageCells * config.pageRows;
            for (int i = items.Count - 1; i >= count; i--)
            {
                DestroyImmediate(items[i].localGo);
                items.RemoveAt(i);
            }

        }
#endif


        /// <summary>
        /// 指定数据的item是否在显示状态,是则返回item,否则返回null
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        public QuickGridItemBase GetShowItem(object data)
        {
            for (int i = 0; i < items.Count; i++)
            {
                if (items[i].data == data)
                    return items[i];
            }
            return null;
        }

        internal void SelectChange()
        {
            int len = Mathf.Min(items.Count, dataCount);
            for (int i = 0; i < len; i++)
            {
                items[i].OnSelectChange();
            }
        }

        internal void Refresh()
        {
            int len = Mathf.Min(items.Count, dataCount);
            for (int i = 0; i < len; i++)
            {
                if (items[i].localGo.activeSelf)
                {
                    items[i].OnDataChange();
                    items[i].OnSelectChange();
                }
            }
            if (config.needItemPanel && config.itemPanel.isShow)
                config.itemPanel.Refresh();
        }

        internal void HideItems()
        {
            int len = items.Count;
            for (int i = 0; i < len; i++)
            {
                items[i].SetActive(false);
            }
        }

        //在数据条目=0时刷新下dataCount
        internal void SetDataCount()
        {
            dataCount = config.dataList.Count;
        }

        //刷新列表数据
        internal void SetData()
        {
            dataCount = config.dataList.Count;
            if (!itemPrefab)
                throw new System.Exception("找不到Item");

            int index = 0;
            int rows = Mathf.Min(totalRows, config.pageRows);
            Vector2 temp = Vector2.zero;

            int line = 0;//同一行的高度或位置
            if (config.Movement == QuickGrid.MoveType.Vertical)
            {
                for (int y = 0; y < config.pageRows; y++)
                {
                    line = GetPosY(y);
                    for (int x = 0; x < config.pageCells; x++)
                    {
                        temp.Set(GetPosX(x), line);
                        CreateItem(index++, temp);
                    }
                }
            }
            else
            {
                for (int x = 0; x < config.pageRows; x++)
                {
                    line = GetPosX(x);
                    for (int y = 0; y < config.pageCells; y++)
                    {
                        temp.Set(line, GetPosY(y));
                        CreateItem(index++, temp);
                    }
                }
            }

            //赋值
            rowIndex = -1;
            SetPageData(true);

            //调整面板显示层级
            if (config.needItemPanel)
            {
                if (config.needItemPanelMask)
                    config.itemMask.transform.SetAsLastSibling();
                config.itemPanel.transform.SetAsLastSibling();
            }

            StartCoroutine(ItemHandler());
        }
        /// <summary>
        /// item处理器
        /// </summary>
        /// <returns></returns>
        private IEnumerator ItemHandler()
        {
            yield return new WaitForEndOfFrame();

            yield return new WaitForEndOfFrame();

            // 根据所有显示的item判断是否开启移动
            /// </summary>
            IsEnableMove();
        }
        public int itemTotalHeightOrWidth = 0;
        /// <summary>
        /// 根据所有显示的item判断是否开启移动
        /// </summary>
        private void IsEnableMove()
        {
            this.itemTotalHeightOrWidth = 0;

            if (config.Movement == QuickGrid.MoveType.Horizontal)
            {
                foreach (var item in this.items)
                {
                    if (item.isActiveAndEnabled)
                    {
                        this.itemTotalHeightOrWidth += config.cellWidth;
                    }
                }
                if (this.itemTotalHeightOrWidth <= config.ClipWidth)
                {
                    config.horizontal = false;
                }
                else
                {
                    config.horizontal = true;
                }
            }
            else
            {
                foreach (var item in this.items)
                {
                    if (item.isActiveAndEnabled)
                    {
                        this.itemTotalHeightOrWidth += config.cellHeight;
                    }
                }
                if (this.itemTotalHeightOrWidth <= config.ClipHeight)
                {
                    config.vertical = false;
                }
                else
                {
                    config.vertical = true;
                }
            }
           
            // Debug.Log("显示的item总高度:" + this.itemTotalHeightOrWidth + "总高度:" + this.clipHeight);
        }

        private void SetPanel()
        {
            int firstRow = rowIndex % config.pageRows;
            int dataIndex = config.pageCells * rowIndex;
            int firstIndex = firstRow * config.pageCells;
            int len = items.Count;

            int temp;
            Vector3 v;
            QuickGridItemBase item;
            for (int i = 0; i < len; i++)
            {
                temp = dataIndex - firstIndex;
                if (i < firstIndex)//移动到后排的数据
                    temp += items.Count;

                item = items[i];
                if (temp >= dataCount)
                {
                    //item.SetActive(false);
                }
                else
                {
                    //item.SetActive(true);
                    v = item.localTsf.localPosition;
                    if (config.Movement == QuickGrid.MoveType.Vertical)
                    {
                        v.y = GetPosY(item.line);
                    }
                    else
                    {
                        v.x = GetPosX(item.line);
                    }
                    item.localTsf.localPosition = v;
                }
                dataIndex++;
            }
        }

        //设置当前屏数据
        private void SetPageData(bool needTween)
        {
            int firstRow = rowIndex % config.pageRows;
            int dataIndex = config.pageCells * rowIndex;
            int firstIndex = firstRow * config.pageCells;
            int len = items.Count;

            int temp;
            Vector3 v;
            QuickGridItemBase item;

            for (int i = 0; i < len; i++)
            {
                temp = dataIndex - firstIndex;
                if (i < firstIndex)//移动到后排的数据
                    temp += items.Count;

                item = items[i];
                if (temp >= dataCount)
                {
                    item.SetActive(false);
                }
                else
                {
                    item.SetActive(true);
                    try
                    {
                        item.index = temp;
                        item.data = config.dataList[temp];
                        item.name = item.itemName;
                        item.line = temp / config.pageCells;

                        v = item.localTsf.localPosition;
                        if (config.Movement == QuickGrid.MoveType.Vertical)
                        {
                            v.y = GetPosY(item.line);
                        }
                        else
                        {
                            v.x = GetPosX(item.line);
                        }

                        item.localTsf.localPosition = v;

#if UNITY_EDITOR
                        if (Application.isPlaying)
                        {

#endif
                            item.OnDataChange();
#if UNITY_EDITOR
                        }
                        else
                            item.OnDataChangeInEditor();
#endif

                        item.OnSelectChange();

                        if (needTween && config.tweenType != QuickGrid.GridTweenType.None && Application.isPlaying)
                        {
                            config.tween.Play(i, item, v, (i == len - 1 | temp == dataCount - 1));
                        }
                    }
                    catch (System.Exception e)
                    {
#if UNITY_EDITOR
                        Debug.LogException(e);
#endif
                    }
                }
                dataIndex++;
            }

            if (config.needItemPanel)
            {
                //通过ShowItemPanel设置开启panel
                if (config.itemPanel.line == -1)
                {
                    item = GetShowItem(config.itemPanel.data);
                    if (item)
                    {
                        config.itemPanel.data = null;
                        config.itemPanel.Bind(item);
                    }
                }

                //panel绑定的data不在可显然的列表中,即item被移出显示范围
                if (config.needItemPanelMask && config.itemPanel.isShow)
                {
                    item = GetShowItem(config.itemPanel.data);
                    if (item)
                    {
                        config.itemMask.Show();
                        config.itemMask.tsf.SetAsLastSibling();
                        item.localTsf.SetAsLastSibling();
                        config.itemPanel.tsf.SetAsLastSibling();
                    }
                    else
                    {
                        config.itemMask.tsf.SetSiblingIndex(config.itemPanel.tsf.GetSiblingIndex() - 1);
                        config.itemMask.beforItem = false;
                    }
                }
            }
        }

        private void CreateItem(int index, Vector2 pos)
        {
            //Transform parent = transform;
            Transform itemTsf;
            QuickGridItemBase item;
            if (items.Count <= index)
            {
                if (items.Count == 0)
                    item = itemPrefab;
                else
                {
                    item = (Instantiate(itemPrefab.gameObject) as GameObject).GetComponent<QuickGridItemBase>();
                    item.Init();
                }

                itemTsf = item.transform;
                items.Add(item);
                //if(config.OnItemCreate!=null)
                //    config.OnItemCreate(item);
            }
            else if (!items[index])//可能被销毁了
            {
                item = (Instantiate(itemPrefab.gameObject) as GameObject).GetComponent<QuickGridItemBase>();
                itemTsf = item.transform;
                items[index] = item;
                item.Init();
                //if (config.OnItemCreate != null)
                //    config.OnItemCreate(item);
            }
            else
            {
                item = items[index];
                itemTsf = item.localTsf;
            }
            itemTsf.SetParent(this.tsf,false);
         //   itemTsf.localScale = Vector3.one;
            itemTsf.localPosition = pos;
        }

        #region unity3d native


        void LateUpdate()
        {
            //TODO 数据小于可以显示的内容,而不是items.Count,计算clip面积可以显示的内容,即无法拖拽
            //if (dataCount <= items.Count)
            //    return;

            if (config.tweenType != QuickGrid.GridTweenType.None && config.tween.isTweening)
            {
                return;
            }

            if (config.needItemPanel && config.itemPanel.needRefresh)
            {
                //只计算位置,不用重置数据和item
                SetPanel();
                return;
            }

            //计算rowIndex,判断是否和原rowIndex相等
            int rIndex = GetRowIndex();
            //if (rIndex==-1 || rIndex == rowIndex || rIndex < 0 || rIndex > totalRows)
            //    return;

            if (m_refreshPage || ((rIndex != -1 && rIndex != rowIndex && rIndex >= 0 && rIndex <= totalRows)))
            {
                m_refreshPage = false;
                rowIndex = rIndex;
                SetPageData(false);
            }
        }

        //void Awake()
        //{
        //    itemPrefab.SetActive(false);
        //}
        #endregion
    }
}

