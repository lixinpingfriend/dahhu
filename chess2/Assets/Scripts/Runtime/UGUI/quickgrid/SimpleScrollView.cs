using LuaInterface;
using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

/// <summary>
/// 李传龙 2017.8.1
/// 简单的scrollview工具
/// </summary>
public class SimpleScrollView : MonoBehaviour
{
    #region 私有变量
    private List<SimpleItemBase> itemList = new List<SimpleItemBase>();//模板列表
    private List<object> dataList = new List<object>();//数据列表
    private GameObject itemPrefab;
    private RectTransform itemRectTransform;
    private Transform itemContent;
    private RectTransform itemContentRectTransform;
    private Vector2 itemContentPosition;//初始位置
    private ScrollRect scrollRect;

    private Vector3 previousItemPosition = Vector3.zero;
    private int clipHeight;//裁切高度
    private int itemToContentOffset;
    #endregion

    #region 公共变量
    //所有显示的item总高度或宽度
    [HideInInspector]
    public int itemTotalHeightOrWidth = 0;
    public Vector2 padding;
    public Action<SimpleItemBase> OnItemDataChange;

    public GameObject ItemPrefab
    {
        get
        {
            if (!this.itemPrefab)
            {
                this.itemPrefab = GetComponentInChildren<SimpleItemBase>().gameObject;
                this.itemPrefab.SetActive(false);
            }
            return this.itemPrefab;
        }

    }

    public Transform ItemContent
    {
        get
        {
            if (!this.itemContent)
            {
                this.itemContent = this.ItemPrefab.transform.parent;
                this.itemContentPosition = this.ItemContentRectTransform.anchoredPosition;
            }
            return this.itemContent;
        }
    }
    public RectTransform ItemContentRectTransform
    {
        get
        {
            if (!this.itemContentRectTransform)
            {
                this.itemContentRectTransform = this.ItemContent.GetComponent<RectTransform>();
            }
            return this.itemContentRectTransform;
        }
    }

    public RectTransform ItemRectTransform
    {
        get
        {
            if (!this.itemRectTransform)
            {
                this.itemRectTransform = this.ItemPrefab.GetComponent<RectTransform>();
            }
            return this.itemRectTransform;
        }
    }
    /// <summary>
    /// 裁切高度
    /// </summary>
    public int ClipHeight
    {
        get
        {
            this.clipHeight = (int)GetComponent<RectTransform>().rect.height;
            return this.clipHeight;
        }
    }

    public ScrollRect ScrollRect
    {
        get
        {
            if (!this.scrollRect)
            {
                this.scrollRect = GetComponent<ScrollRect>();
            }
            return this.scrollRect;
        }
    }
    /// <summary>
    /// item到content偏移距离
    /// </summary>
    public int ItemToContentOffset
    {
        get
        {
            this.itemToContentOffset = -(int)this.ItemRectTransform.anchoredPosition.y;
            return this.itemToContentOffset;
        }
    }
    #endregion
    public void SetData(object data)
    {
        if (data == null)
        {
            Clear();
            return;
        }
        else
        {
            LuaTable table = (LuaTable)data;
            int length = table.Length;
            if (!this.dataList.Equals(table))
            {
                this.dataList.Clear();
                for (int i = 1; i <= length; i++)
                {
                    this.dataList.Add(table[i]);

                    //获取item位置
                    Vector2 itemPosition = GetItemPosition(i - 1);
                    //创建item
                    CreateItem(i - 1, itemPosition);

                    StartCoroutine(DelayDataHandler(i - 1));
                }
            }

            StartCoroutine(ItemHandler());
        }
    }
    public void Clear()
    {
        foreach (var item in this.itemList)
        {
            Destroy(item.gameObject);
        }
        this.itemList.Clear();
        this.dataList.Clear();
        //恢复content初始位置
        this.ItemContentRectTransform.anchoredPosition = this.itemContentPosition;

        this.ScrollRect.StopMovement();
    }
    /// <summary>
    /// 延迟数据处理
    /// </summary>
    /// <returns></returns>
    private IEnumerator DelayDataHandler(int index)
    {
        yield return new WaitForEndOfFrame();

        if (this.OnItemDataChange != null)
        {
            this.OnItemDataChange(this.itemList[index]);
        }
    }
    /// <summary>
    /// 获取item位置
    /// </summary>
    private Vector2 GetItemPosition(int index)
    {
        Vector2 itemPosition = new Vector2();

        itemPosition.x = this.ItemRectTransform.anchoredPosition3D.x;
        itemPosition.y = this.ItemRectTransform.anchoredPosition3D.y - index * this.ItemRectTransform.rect.height;

        return itemPosition;
    }
    //创建item
    private void CreateItem(int index, Vector3 position)
    {
        SimpleItemBase item = (Instantiate(this.ItemPrefab) as GameObject).GetComponent<SimpleItemBase>();
        string itemName = null;
        item.gameObject.SetActive(true);
        item.index = index;
        item.data = this.dataList[index];
        itemName = "item" + index;
        item.itemName = itemName;

        item.gameObject.name = itemName;
        item.gameObject.transform.SetParent(this.ItemContent,false);
        item.gameObject.transform.GetComponent<RectTransform>().anchoredPosition3D = position;

        this.itemList.Add(item);
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
        // 重新刷新所有item位置
        AgainRefreshItemPosition();
        //更改content的尺寸
        ChangeContentSize();
    }
    /// <summary>
    /// 重新刷新所有item位置
    /// </summary>
    private void AgainRefreshItemPosition()
    {
        foreach (var item in this.itemList)
        {
            ContentSizeFitter fitter = item.GetComponentInChildren<ContentSizeFitter>(true);
            if (!fitter)
            {
                return;
            }
            RectTransform rect = fitter.GetComponent<RectTransform>();
            if (previousItemPosition == Vector3.zero)
            {
                previousItemPosition = item.RectTransform.anchoredPosition3D;
            }
            item.RectTransform.anchoredPosition3D = previousItemPosition;
            previousItemPosition = item.RectTransform.anchoredPosition3D - new Vector3(0, rect.rect.height + this.padding.y);
        }
        previousItemPosition = Vector3.zero;
    }
    /// <summary>
    /// 根据所有显示的item判断是否开启移动
    /// </summary>
    private void IsEnableMove()
    {
        this.itemTotalHeightOrWidth = 0;

        this.itemTotalHeightOrWidth = this.ItemToContentOffset;
        foreach (var item in this.itemList)
        {
            this.itemTotalHeightOrWidth += item.CellHeight + (int)this.padding.y;
        }
        if (this.itemTotalHeightOrWidth <= this.ClipHeight)
        {
            this.ScrollRect.vertical = false;
        }
        else
        {
            this.ScrollRect.vertical = true;
        }
        // Debug.Log("显示的item总高度:" + this.itemTotalHeightOrWidth + "总高度:" + this.clipHeight);
    }
    /// <summary>
    /// 更改content的尺寸
    /// </summary>
    private void ChangeContentSize()
    {
        RectTransform contentRect = this.itemContent.GetComponent<RectTransform>();
        contentRect.sizeDelta = new Vector2(contentRect.sizeDelta.x, this.itemTotalHeightOrWidth);
    }
}
