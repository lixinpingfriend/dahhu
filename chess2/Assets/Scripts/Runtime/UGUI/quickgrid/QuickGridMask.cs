using UnityEngine;
using System.Collections;

/// <summary>
/// 表格Item详情操作面板遮罩
/// 
/// @author 邱洪波

/// </summary>
namespace littlerbird.UI
{
    public class QuickGridMask : MonoBehaviour
    {
        public QuickGrid config;

        private GameObject m_go;
        public GameObject go { get { if (!m_go) m_go = gameObject; return m_go; } }

        public bool beforItem = false;

        private Transform m_tsf;
        public Transform tsf { get { if (!m_tsf) m_tsf = transform; return m_tsf; } }

        void Start()
        {
            go.SetActive(false);
        }

        public void Show()
        {
            go.SetActive(true);
        }

        public void Hide()
        {
            go.SetActive(false);
        }

        void Update()
        {
            tsf.position = config.transform.position;
        }

    }
}