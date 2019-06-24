using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using System;

/// <summary>
/// 
/// @author 邱洪波

/// </summary>
namespace littlerbird.UI
{
    [RequireComponent(typeof(RectTransform))]
    //[RequireComponent(typeof(RepeatClick))]
    public class QuickGridItemBase : MonoBehaviour, IPointerClickHandler
    {
        public QuickGrid config;

        public int index;

        public int line;//当前行数或列数,水平拖是列,垂直拖则是行

        //protected RepeatClick m_btn;

        /// <summary>
        /// 是否被选中
        /// </summary>
        public bool selected
        {
            get { return config.selectList.IndexOf(data) != -1; }
        }

        public object data;

        private Transform tsf;
        public Transform localTsf
        {
            get
            {
                if (!tsf)
                    tsf = transform;
                return tsf;
            }
        }

        private GameObject go;
        public GameObject localGo
        {
            get
            {
                if (!go)
                    go = gameObject;
                return go;
            }
        }

        /// <summary>
        /// 显示在Hierarchy上的name,子类可以重载使用数据中的id或其它命名,便于使用Find
        /// </summary>
        public virtual string itemName
        {
            get { return "item" + index; }
        }

        /// <summary>
        /// 初始化,每个item只触发一次
        /// </summary>
        public virtual void Init()
        {

        }

        protected QuickGrid.QuickGridItemEvenet GetUserEvent(string key)
        {
            return config.GetUserEvent(key);
        }

        protected QuickGrid.QuickGridItemEvenet<T> GetUserEvent<T>(string key)
        {
            return config.GetUserEvent<T>(key);
        }

        public void OnPointerClick(PointerEventData eventData)
        {
            if (config.needItemEvent)
            {
                if (config.selectType == QuickGrid.SelectType.Single)
                    CanSelect(true);
                else if (config.selectType == QuickGrid.SelectType.Multi || config.selectType == QuickGrid.SelectType.SingleAndCancel)
                    CanSelect(!selected);

                OnItemClick();
            }
            if (config.needItemPanel)
            {
                if (CanOpenItemPanel())
                    config.itemPanel.Bind(this);
            }
        }

        private void CanSelect(bool value)
        {
            if (CanSelectItem(value))
                config.SelectIndex(value, index);
        }

        /// <summary>
        /// 是否可以选中
        /// </summary>
        /// <param name="value">要设置的状态</param>
        /// <returns></returns>
        protected virtual bool CanSelectItem(bool value)
        {
            return (config.CanSelectItem == null || config.CanSelectItem(this, value));
        }

        /// <summary>
        /// 是否可以打开panel,需要needItemPanel为true才有效
        /// </summary>
        /// <returns></returns>
        protected virtual bool CanOpenItemPanel()
        {
            return config.CanOpenItemPanel == null || config.CanOpenItemPanel(this);
        }

        /// <summary>
        /// 当前itemtween动画结束时触发
        /// </summary>
        public virtual void OnItemTweenComplete()
        {

        }

        /// <summary>
        /// 所有tween播放完成后触发
        /// </summary>
        public virtual void OnAllTweenComplete()
        {

        }

        /// <summary>
        /// item数据改变时触发
        /// </summary>
        public virtual void OnDataChange()
        {
            if (config.OnItemDataChange != null)
                config.OnItemDataChange(this);
        }

        /// <summary>
        /// 选中状态改变时触发
        /// </summary>
        public virtual void OnSelectChange()
        {
            if (config.OnItemSelectChange != null)
                config.OnItemSelectChange(this);
        }

        /// <summary>
        /// item被点击时触发
        /// </summary>
        public virtual void OnItemClick()
        {
            if (config.OnItemClick != null)
                config.OnItemClick(this);
        }

#if UNITY_EDITOR
        [LuaInterface.NoToLua]
        public virtual void OnDataChangeInEditor()
        {
            if (GetComponentInChildren<Text>())
                GetComponentInChildren<Text>().text = data.ToString();
        }
#endif

        internal void SetActive(bool value)
        {
            localGo.SetActive(value);
        }
    }
}

