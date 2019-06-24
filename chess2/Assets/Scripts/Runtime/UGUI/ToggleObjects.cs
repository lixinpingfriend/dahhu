using UnityEngine;
using System.Collections.Generic;
using UnityEngine.UI;

/// <summary>
/// 设置物体切换
/// 李传龙 2017.2.20
/// 同ngui中UIToggleObjects原理相同
/// </summary>

[AddComponentMenu("UI/Toggle Objects")]
public class ToggleObjects : MonoBehaviour
{
    public List<GameObject> activeList;//要激活物体列表
    public List<GameObject> deactiveList;//要隐藏物体列表

    void Awake()
    {
#if UNITY_EDITOR
        if (!Application.isPlaying) return;
#endif
        Toggle toggle = GetComponent<Toggle>();
        toggle.onValueChanged.AddListener(OnToggle);

        //根据Toggle开关状态执行一次切换物体状态
        this.OnToggle(toggle.isOn);
    }
    /// <summary>
    /// 点击切换回调
    /// </summary>
    /// <param name="flag"></param>
    public void OnToggle(bool flag)
    {
        if (this.enabled)
        {
            foreach (var active in this.activeList)
            {
                // 设置物体状态
                Set(active, flag);
            }
            foreach (var deactive in this.deactiveList)
            {
                // 设置物体状态
                Set(deactive, !flag);
            }
        }
    }
    /// <summary>
    /// 设置物体状态
    /// </summary>
    /// <param name="go"></param>
    /// <param name="state"></param>
    void Set(GameObject go, bool state)
    {
        if (go != null)
        {
            go.SetActive(state);
        }
    }
}
