using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

/// <summary>
/// 李传龙 2017.8.1
/// 简单的scrollview工具
/// </summary>
public class SimpleItemBase : MonoBehaviour
{

    #region 私有变量
    private RectTransform rectTrasnform;
    private int cellHeight;
    #endregion

    #region 公共变量
    public object data;

    public int index;

    public string itemName;

    public RectTransform RectTransform
    {
        get
        {
            if (!rectTrasnform)
            {
                rectTrasnform = gameObject.GetComponent<RectTransform>();
            }
            return rectTrasnform;
        }
    }
    /// <summary>
    /// 模板高度
    /// </summary>
    public int CellHeight
    {
        get
        {
            //item里有ContentSizeFitter组件,就使用这个组件的高度,没有则使用item的高度
            ContentSizeFitter fitter = GetComponentInChildren<ContentSizeFitter>(true);
            if (fitter)
            {
                RectTransform rect = fitter.GetComponent<RectTransform>();
                this.cellHeight = (int)rect.rect.height;
            }
            else
            {
                this.cellHeight = (int)this.RectTransform.rect.height;
            }

            return this.cellHeight;
        }
    }


    #endregion
}
