using UnityEngine;
using System.Collections;
using DG.Tweening;


/// <summary>
/// 表格Item详情操作面板
/// @author 邱洪波

/// </summary>
namespace littlerbird.UI
{
    public class QuickGridItemPanelBase : MonoBehaviour
    {
        private GameObject m_go;
        public GameObject go { get { if (!m_go) m_go = gameObject; return m_go; } }

        private RectTransform m_tsf;
        public RectTransform tsf { get { if (!m_tsf) m_tsf = GetComponent<RectTransform>(); return m_tsf; } }

        public QuickGrid config;

        public QuickGridItemBase curItem { get { return config.content.GetShowItem(data); } }

        private int m_oldIndex;

        private bool m_useEffect = true;

        private float m_effectTime = 0.1f;

        private int m_index = -1;
        public int index { get { return m_index; } }

        public int offset = 200;//panel的长或宽,可以渐变实现动画效果,如果动画,需要在动画结束时调用CalculateSize重新计算content

        public virtual int height
        {
            get { return (int)(config.Movement == QuickGrid.MoveType.Horizontal ? tsf.rect.width : tsf.rect.height); }
        }

        public int line;

        public object data;

        public bool isShow
        {
            get { return go.activeSelf; }
        }

        private bool m_needRefresh = true;
        public bool needRefresh
        {
            get
            {
                if (m_needRefresh) { m_needRefresh = false; return true; }
                return false;
            }
        }


        public void Bind(QuickGridItemBase item)
        {
            if (index == item.index)
            {
                Hide();
            }
            else
            {
                this.data = item.data;
                m_index = item.index;
                line = item.line;
                Refresh(true);
            }
        }

        public void Refresh()
        {
            Refresh(!config.fixHeightPanel);
        }

        public void Refresh(bool needCalculateSize)
        {
            if (data == null)
                return;

            OnDataChange();
            if (needCalculateSize)
            {
                _Show();
                config.content.ReCalculateSize();

                Vector3 v = Vector3.zero;
                if (config.Movement == QuickGrid.MoveType.Horizontal)
                {
                    v.x = config.content.GetPosX(line) + config.cellWidth / 2;// - offset / 2;
                    v.y = tsf.sizeDelta.y / 2;
                }
                else
                {
                    v.x = -tsf.sizeDelta.x / 2;
                    v.y = config.content.GetPosY(line) - config.cellHeight / 2;//实际应该是cellHeight/2+this.height/2
                }
                tsf.localPosition = v;
            }
        }

        public void SetData(object data)
        {
            if (this.data != data)
            {
                this.data = data;
                line = -1;
            }
            else
            {
                this.data = null;
            }
        }

        public virtual void OnInit() { }

        public virtual void OnDataChange() { }


        public virtual void Hide()
        {
            if (m_useEffect)
            {
                if (config.needItemPanelMask)
                    config.itemMask.Hide();
                Tweener tweener;
                float temp = height;
                if (config.Movement == QuickGrid.MoveType.Horizontal)
                {
                    tweener = tsf.DOScaleX(0, m_effectTime).OnUpdate(() =>
                    {
                        m_needRefresh = true;
                        offset = Mathf.RoundToInt(temp * tsf.localScale.x);
                    });
                }
                else
                {
                    tweener = tsf.DOScaleY(0, m_effectTime).OnUpdate(() =>
                    {
                        m_needRefresh = true;
                        offset = Mathf.RoundToInt(temp * tsf.localScale.y);
                    });
                }
                tweener.OnComplete(() =>
                {
                    RealHide();
                    offset = (int)temp;
                });
            }
            else
            {
                if (config.needItemPanelMask)
                    config.itemMask.Hide();
                RealHide();
            }
        }

        public void RealHide()
        {
            m_index = -1;
            data = null;
            go.SetActive(false);
            config.content.ReCalculateSize();
            m_needRefresh = true;
        }

        private void _Show()
        {
            m_needRefresh = true;
            if (isShow)
            {
                offset = height;
                return;
            }

            go.SetActive(true);

            if (m_useEffect)
            {
                if (config.needItemPanelMask)
                {
                    //TODO 遮罩渐隐显示
                }

                float temp = height;
                if (config.Movement == QuickGrid.MoveType.Horizontal)
                {
                    tsf.localScale = new Vector3(0, 1, 0);
                    tsf.DOScaleX(1, m_effectTime).OnUpdate(() =>
                    {
                        m_needRefresh = true;
                        offset = Mathf.RoundToInt(temp * tsf.localScale.x);
                    }).SetDelay(0.01f);
                }
                else
                {
                    tsf.localScale = new Vector3(1, 0, 0);
                    tsf.DOScaleY(1, m_effectTime).OnUpdate(() =>
                    {
                        m_needRefresh = true;
                        offset = Mathf.RoundToInt(temp * tsf.localScale.y);
                    }).SetDelay(0.01f);
                }
            }
            else
            {
                offset = height;
            }
        }
    }
}
