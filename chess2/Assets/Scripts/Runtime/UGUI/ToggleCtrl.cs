using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

[RequireComponent(typeof(Toggle)),RequireComponent(typeof(UIStateSwitcher))]
public class ToggleCtrl : MonoBehaviour
{
    private Toggle m_toggle;
    private UIStateSwitcher m_uiStateSwitcher;
    
    private void Awake()
    {
        m_toggle = GetComponent<Toggle>();
        m_uiStateSwitcher = GetComponent<UIStateSwitcher>();
        m_toggle.onValueChanged.AddListener(OnValueChanged);
    }

    private void Start()
    {
        this.OnValueChanged(m_toggle.isOn);
    }

    private void OnValueChanged(bool isOn)
    {
        if(!m_toggle.enabled){
            m_uiStateSwitcher.SwitchState("disable");
        }
        else if(isOn){
            m_uiStateSwitcher.SwitchState("isOn");
        }
        else{
            m_uiStateSwitcher.SwitchState("isOff");
        }
    }

    public void SetEnable(bool enable)
    {
        m_toggle.enabled = enable;
        this.OnValueChanged(m_toggle.isOn);
    }

    public void SetIsOn(bool isOn)
    {
        m_toggle.isOn = isOn;
        this.OnValueChanged(m_toggle.isOn);
    }

}
