using UnityEngine;
using UnityEngine.EventSystems;

public class LoopBaseNode : MonoBehaviour, IPointerDownHandler, IPointerUpHandler, IPointerClickHandler
{
    private Transform m_trans;
    public Transform localTrans
    {
        get
        {
            if (!m_trans)
                m_trans = transform;
            return m_trans;
        }
    }
    public LoopScrollView loopScrollView
    {
        get
        {
            if (m_loopScrollView != null)
                return m_loopScrollView;
            else
                FindLoopScrollView(localTrans);
            return m_loopScrollView;
        }
    }
    private LoopScrollView m_loopScrollView;
    private float m_pressDownTime = 0;
    private PointerEventData m_eventData;
    private const float kPressLastTime = 0.8f;
    [HideInInspector]
    public int index;
    public object data;

    public LoopScrollView.OnDataChangeEvent onDataChange;
    protected virtual void OnDisable()
    {
        CancelInvoke("InvokePressTime");
    }
    protected virtual void OnDestory()
    {
        CancelInvoke("InvokePressTime");
    }
    public virtual void OnDataChange()
    {
        if(onDataChange != null){
            onDataChange.Invoke(this);
        }
    }
    public void OnPointerClick(PointerEventData eventData)
    {
        if (loopScrollView.needItemEvent && loopScrollView.OnItemClick != null)
        {
            loopScrollView.OnItemClick(this, eventData);
        }
    }
    public void OnPointerDown(PointerEventData eventData)
    {
        if (loopScrollView.needItemEvent && loopScrollView.OnItemClick != null && loopScrollView.OnItemPress != null)
        {
            m_pressDownTime = Time.time;
            m_eventData = eventData;
            CancelInvoke("InvokePressTime");
            Invoke("InvokePressTime", kPressLastTime);                     
        }
    }
    private void InvokePressTime()
    {
        loopScrollView.OnItemPress(this, true, m_eventData);
    }
    public void OnPointerUp(PointerEventData eventData)
    {
        CancelInvoke("InvokePressTime");
        if (loopScrollView.needItemEvent && loopScrollView.OnItemClick != null && loopScrollView.OnItemPress != null)
        {
            if (Time.time - m_pressDownTime < kPressLastTime)
            {
                //OnPointerClick(eventData);
            }
            else
            {
                loopScrollView.OnItemPress(this, false, eventData);
            }
        }
        else if (loopScrollView.needItemEvent && loopScrollView.OnItemPress != null)
        {
            loopScrollView.OnItemPress(this, false, eventData);
        }
    }
    private void FindLoopScrollView(Transform trans)
    {
        m_loopScrollView = trans.GetComponent<LoopScrollView>();
        if (m_loopScrollView == null)
        {
            trans = trans.parent;
            FindLoopScrollView(trans);
        }
    }
}