using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using LuaInterface;
using UnityEngine.Events;

public class LoopScrollView : MonoBehaviour
{
    public class OnDataChangeEvent : UnityEvent<LoopBaseNode>
    {
            public OnDataChangeEvent(){

            }
    }
    public class OnContentPosChangeEvent : UnityEvent<Vector3>
    {
            public OnContentPosChangeEvent(){

            }
    }
    public enum Direction
    {
        Horizontal,
        Vertical
    }
    [SerializeField]
    private RectTransform m_cell;
    [SerializeField]
    private Vector2 m_page;
    [SerializeField]
    Direction m_direction = Direction.Horizontal;
    public bool item2Item = false;


    [SerializeField, Range(1, 10)]
    private int m_bufferNo;
    public delegate void OnBaseNodeEvent(LoopBaseNode item, PointerEventData data);
    public delegate void OnBaseNodeEvent<T>(LoopBaseNode item, T t, PointerEventData data);
    
    public OnBaseNodeEvent OnItemClick;
    public OnBaseNodeEvent<bool> OnItemPress;
    public OnDataChangeEvent OnDataChange = new OnDataChangeEvent();
    public OnContentPosChangeEvent onValueChanged = new OnContentPosChangeEvent();
    public bool needItemEvent;
    public bool needCenter;
    public Vector2 m_cellRect;
    public int m_currentIndex;
    public bool allowDrag = false;
    private List<RectTransform> m_instantiateItems = new List<RectTransform>();
    private IList m_datas;
    private int m_dataCount = 0;
    private float m_prevPos = 0;
    private int m_realPerPageCount = 0;
    private List<Vector3> m_staticPosList = new List<Vector3>();
    private ScrollRect m_scrollRect;
    private RectTransform m_scrollRectTrans;
    private RectTransform m_contentRect;
    private Vector2 m_instantiateSize = Vector2.zero;
    private Vector3 m_initialContentSize;
    private string m_lastCellPath = string.Empty;
    private const int kDefaultCount = 100;//使用MoveIndex后 需要重新设置数据，刷新次数最多一百次
    public float cellScale { get { return m_direction == Direction.Horizontal ? m_cellRect.x : m_cellRect.y; } }
    public float directionPos { get { return m_direction == Direction.Horizontal ? m_contentRect.anchoredPosition.x : m_contentRect.anchoredPosition.y; } }
    public float scale { get { return m_direction == Direction.Horizontal ? 1f : -1f; } }
    public int pageCount { get { return (int)m_page.x * (int)m_page.y; } }
    public int pageScale { get { return m_direction == Direction.Horizontal ? (int)m_page.x : (int)m_page.y; } }
    public int instantiateCount { get { return (int)instantiateSize.x * (int)instantiateSize.y; } }
    public bool canDrag { get { return allowDrag || m_dataCount > m_realPerPageCount; } }
    public List<RectTransform> instantiateItems
    {
        get
        {
            return m_instantiateItems;
        }
    }
    public Vector2 instantiateSize
    {
        get
        {
            if (m_instantiateSize == Vector2.zero)
            {
                float rows, cols;
                if (m_direction == Direction.Horizontal)
                {
                    rows = m_page.x;
                    cols = m_page.y + (float)m_bufferNo;
                }
                else
                {
                    rows = m_page.x + (float)m_bufferNo;
                    cols = m_page.y;
                }
                m_instantiateSize = new Vector2(rows, cols);
            }
            return m_instantiateSize;
        }
        private set { }
    }
    public float maxPrevPos
    {
        get
        {
            float result;
            Vector2 max = GetRectByNum(m_datas.Count);
            if (m_direction == Direction.Horizontal)
            {
                result = max.y - m_page.y - m_bufferNo;
            }
            else
            {
                result = max.x - m_page.x - m_bufferNo;
            }
            return result * cellScale;
        }
        private set { }
    }
    void Awake()
    {
        m_scrollRect = GetComponentInParent<ScrollRect>();
        m_scrollRect.onValueChanged.AddListener(OnValueChanged);
        m_scrollRectTrans = GetComponentInParent<RectTransform>();
        m_scrollRect.horizontal = m_direction == Direction.Horizontal;
        m_scrollRect.vertical = m_direction == Direction.Vertical;
        m_contentRect = m_scrollRect.content.GetComponent<RectTransform>();
        m_initialContentSize = m_contentRect.transform.localPosition;
        if (m_cell != null)
        {
            m_cell.gameObject.SetActive(false);
        }
    }

    private void OnValueChanged(Vector2 value)
    {
        if(onValueChanged != null){
            onValueChanged.Invoke(value);
        }
    }

    private void Init()
    {
        maxPrevPos = 0;
        m_currentIndex = 0;
        m_datas = null;
        m_prevPos = 0;
        m_lastDirectionPos = 0;
    }

    public void SetData(object data, int defaultIndex = 0)
    {
        Init();
        LuaTable tmpTable = (LuaTable)data;
        m_datas = new List<object>();
        for(int i = 1; i <= tmpTable.Length; i++){
            m_datas.Add(tmpTable[i]);
        }
        m_dataCount = m_datas.Count;
        if (m_datas.Count > pageCount)
        {
            SetBound(GetRectByNum(m_datas.Count));
        }
        else
        {
            SetBound(m_page);
        }
        if (m_dataCount > instantiateCount)
        {
            while (m_instantiateItems.Count < instantiateCount)
            {
                CreateItem(m_instantiateItems.Count);
            }
        }
        else
        {
            while (m_instantiateItems.Count > m_dataCount)
            {
                RemoveItem(m_instantiateItems.Count - 1);
            }
            while (m_instantiateItems.Count < m_dataCount)
            {
                CreateItem(m_instantiateItems.Count);
            }
        }
        SetRealPerPageCount();
        InitItemsPosition();
        MoveToIndex(defaultIndex);
    }
    private void SetRealPerPageCount()
    {
        if (m_direction == Direction.Horizontal)
        {
            float totalSize = m_scrollRectTrans.sizeDelta.x;
            float divSize = m_cell.sizeDelta.x;
            int perPageCount = Mathf.FloorToInt(totalSize / divSize);
            perPageCount *= int.Parse(m_page.x.ToString());
            m_realPerPageCount = perPageCount;
        }
        else
        {
            float totalSize = m_scrollRectTrans.sizeDelta.y;
            float divSize = m_cell.sizeDelta.y;
            int perPageCount = Mathf.FloorToInt(totalSize / divSize);
            perPageCount *= int.Parse(m_page.y.ToString());
            m_realPerPageCount = perPageCount;
        }
        if (!canDrag)
        {
            m_staticPosList.Clear();
            for (int i = 0; i < m_dataCount; i++)
            {
                m_staticPosList.Add(GetStaticPosition(i));
            }
            m_staticPosList.Sort(delegate (Vector3 a, Vector3 b) { return a.x.CompareTo(b.x); });
        }
    }
    public LoopBaseNode GetBaseNodeByIndex(int index)
    {
        int count = m_instantiateItems.Count;
        for (int i = 0; i < count; i++)
        {
            LoopBaseNode baseNode = m_instantiateItems[i].GetComponent<LoopBaseNode>();
            if (baseNode.index == index)
            {
                return baseNode;
            }
        }
        return null;
    }
    private void InitItemsPosition()
    {
        LoopBaseNode baseNode = null;
        RectTransform rectTrans = null;
        int count = m_instantiateItems.Count;
        for (int i = 0; i < count; i++)
        {
            baseNode = m_instantiateItems[i].GetComponent<LoopBaseNode>();
            baseNode.index = i;
            baseNode.data = m_datas[i];
            baseNode.OnDataChange();
            if(OnDataChange != null)
            {
                OnDataChange.Invoke(baseNode);
            }
            rectTrans = m_instantiateItems[i].GetComponent<RectTransform>();
            rectTrans.anchoredPosition = GetCenterPosByIndex(i);
        }
    }
    public void MoveToIndex(int index)
    {
        if (m_direction == Direction.Horizontal)
        {
            int rowIndex = Mathf.FloorToInt(index / m_page.x);
            //rowIndex = rowIndex - m_bufferNo;
            m_contentRect.transform.localPosition = new Vector3(m_initialContentSize.x - rowIndex * m_cellRect.x, m_initialContentSize.y, m_initialContentSize.z);
            
        }
        else
        {
            int rowIndex = Mathf.FloorToInt(index / m_page.y);
            //rowIndex = rowIndex - m_bufferNo;
            m_contentRect.transform.localPosition = new Vector3(m_initialContentSize.x, m_initialContentSize.y + rowIndex * m_cellRect.y, m_initialContentSize.z);
            //Debug.Log(string.Format("index={0}, m_page.y={1}, m_bufferNo={2}, rowIndex={3}, pos={4}", index, m_page.y, m_bufferNo, rowIndex, m_contentRect.transform.localPosition) );
        }
        for (int i = 0; i < kDefaultCount; i++)
        {
            if (GetBaseNodeByIndex(index) == null)
            {
                Update();
            }
            else
            {
                break;
            }
        }
    }
    private void CreateItem(int index)
    {
        RectTransform item = GameObject.Instantiate(m_cell);
        item.SetParent(m_contentRect.transform, false);
        //SetItemTopLeft(item);
        item.name = "item" + index;
        m_instantiateItems.Add(item);
        item.gameObject.SetActive(true);
    }
    private void SetItemTopLeft(RectTransform item)
    {
        item.anchorMax = Vector2.up;//set top left
        item.anchorMin = Vector2.up;
        item.pivot = Vector2.up;
    }
    private void RemoveItem(int index)
    {
        RectTransform item = m_instantiateItems[index];
        m_instantiateItems.Remove(item);
        RectTransform.Destroy(item.gameObject);
    }
    private Vector2 GetRectByNum(int num)
    {
        return m_direction == Direction.Horizontal ?
            new Vector2(m_page.x, Mathf.CeilToInt(num / m_page.x)) :
            new Vector2(Mathf.CeilToInt(num / m_page.y), m_page.y);
    }
    private void SetBound(Vector2 bound)
    {
        if (m_direction == Direction.Horizontal)
            m_contentRect.sizeDelta = new Vector2(bound.y * m_cellRect.x, m_scrollRectTrans.sizeDelta.y);
        else
            m_contentRect.sizeDelta = new Vector2(m_scrollRectTrans.sizeDelta.x, bound.x * m_cellRect.y);
            Debug.Log(m_contentRect.transform.localPosition);
    }
    float m_lastDirectionPos = 0;
    void Update()
    {
        ScrollViewCanDrag();
        if(m_lastDirectionPos == directionPos)
        {
            return;
        }
        m_lastDirectionPos = directionPos;
        if (scale * directionPos - m_prevPos < -cellScale * m_bufferNo)
        {
            if (m_prevPos <= -maxPrevPos) return;
            List<RectTransform> range = m_instantiateItems.GetRange(0, pageScale);
            m_instantiateItems.RemoveRange(0, pageScale);
            m_instantiateItems.AddRange(range);
            for (int i = 0; i < range.Count; i++)
            {
                int itemIndex = m_currentIndex * pageScale + m_instantiateItems.Count + i;
                if (itemIndex < m_datas.Count)
                    MoveItemToIndex(m_currentIndex * pageScale + m_instantiateItems.Count + i, range[i]);
            }
            m_prevPos -= cellScale;
            m_currentIndex++;
        }
        if (scale * directionPos - m_prevPos > -cellScale * m_bufferNo)
        {
            if (Mathf.RoundToInt(m_prevPos) >= 0) return;
            m_prevPos += cellScale;
            m_currentIndex--;
            if (m_currentIndex < 0) return;
            List<RectTransform> range = m_instantiateItems.GetRange(m_instantiateItems.Count - pageScale, pageScale);
            m_instantiateItems.RemoveRange(m_instantiateItems.Count - pageScale, pageScale);
            m_instantiateItems.InsertRange(0, range);
            for (int i = 0; i < range.Count; i++)
            {
                MoveItemToIndex(m_currentIndex * pageScale + i, range[i]);
            }
        }
    }
    /// <summary>
    /// 当数据不够显示一页时页面不能拖动
    /// </summary>
    private void ScrollViewCanDrag()
    {
        if (m_datas == null || m_cell == null || m_contentRect == null || m_scrollRectTrans == null)
            return;
        if (!canDrag)
        {
            if (m_direction == Direction.Horizontal)
                m_contentRect.transform.localPosition = new Vector3(0, m_initialContentSize.y, m_initialContentSize.z);
            else
                m_contentRect.transform.localPosition = new Vector3(m_initialContentSize.x, 0, m_initialContentSize.z);
        }
    }
    private void MoveItemToIndex(int index, RectTransform item)
    {
        item.anchoredPosition = GetCenterPosByIndex(index);
        UpdateItem(index, item.gameObject);
    }
    /// <summary>
    /// Items居中对齐时使用
    /// </summary>
    private Vector2 GetCenterPosByIndex(int index)
    {
        if (!canDrag && needCenter)
        {
            m_contentRect.sizeDelta = m_scrollRectTrans.sizeDelta;
            return m_staticPosList[index];
        }
        float x = -m_contentRect.sizeDelta.x / 2;
        float y = m_contentRect.sizeDelta.y / 2;
        float offsetX = m_cellRect.x / 2;
        float offsetY = m_cellRect.y / 2;
        int pageX = (int)m_page.x;
        int pageY = (int)m_page.y;
        int row = 0;//行数
        int col = 0;//列数
        if (m_direction == Direction.Horizontal)
        {
            row = index % pageX;
            col = index / pageX;
        }
        else
        {
            row = index / pageY;
            col = index % pageY;
        }
        return new Vector3(x + offsetX + m_cellRect.x * col, y - offsetY - m_cellRect.y * row, 0);
    }
    /// <summary>
    /// 当每页显示不足时可居中显示Items
    /// </summary>
    private Vector3 GetStaticPosition(int index)
    {
        if (m_direction == Direction.Horizontal)
        {
            return new Vector3(GetStaticVecParam(index, m_cellRect.x), 0, 0);
        }
        else
        {
            return new Vector3(0, GetStaticVecParam(index, m_cellRect.y), 0);
        }
    }
    private float GetStaticVecParam(int index, float calculat)
    {
        if (m_dataCount % 2 != 0)//单数
        {
            int symbol = index % 2 == 0 ? 1 : -1;
            if (index == 0)
            {
                return 0;
            }
            else
            {
                float temp = ((index + 1) / 2) * symbol;
                return calculat * temp;
            }
        }
        else
        {
            int symbol = index % 2 == 0 ? -1 : 1;
            float temp = (index / 2 + 0.5f) * symbol;
            return calculat * temp;
        }
    }
    /// <summary>
    /// Items左对齐时使用
    /// </summary>
    private Vector2 GetTopLeftPosByIndex(int index)
    {
        float x, y;
        if (m_direction == Direction.Horizontal)
        {
            x = index % m_page.x;
            y = Mathf.FloorToInt(index / m_page.x);
        }
        else
        {
            x = Mathf.FloorToInt(index / m_page.y);
            y = index % m_page.y;
        }
        return new Vector2(y * m_cellRect.x, -x * m_cellRect.y);
    }
    private void UpdateItem(int index, GameObject item)
    {
        item.SetActive(index < m_datas.Count);
        if (item.activeSelf)
        {
            item.name = "item"+index;//TODO 更新name 我们现在取列表数据都是通过name来的
            LoopBaseNode baseNode = item.GetComponent<LoopBaseNode>();
            baseNode.index = index;
            baseNode.data = m_datas[index];
            baseNode.OnDataChange();
            if(OnDataChange != null)
            {
                OnDataChange.Invoke(baseNode);
            }
        }
    }
}