using System.Collections;
using System.Collections.Generic;
using UnityEngine;

//等待转圈,例如网络等待时转圈
public class WaitWhirl : MonoBehaviour
{
    public bool isEnableReset = true;//OnEnable重置
    public float intervalTime = 0.12f;//转动频率的时间
    private float pauseTime;
    public float angle = -45;//转动角度

    void OnEnable()
    {
        if(isEnableReset)
        {
            gameObject.transform.localEulerAngles = Vector3.zero;
        }
    }

    void Update()
    {
        pauseTime += Time.deltaTime;
        if (pauseTime > intervalTime)
        {
            Vector3 v = gameObject.transform.localEulerAngles;
            v.z += angle;
            gameObject.transform.localEulerAngles = v;
            pauseTime = 0;
        }
    }
}
