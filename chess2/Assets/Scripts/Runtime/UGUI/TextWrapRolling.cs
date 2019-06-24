using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.UI;

/// <summary>
/// text数字动态滚动效果
/// </summary>
public class TextWrapRolling : MonoBehaviour
{
    public float time = 1.2f;
    public int start;
    public int end;
    float  num;
    TextWrap text;
    void Awake()
    {
        text = GetComponent<TextWrap>();
    }

    public void Reset(int i,int j)
    {
        if (i < j)
        {
            if (end > start)
            {
                end = j;
            }
            else
            {
                start = i;
                end = j;
                num = start;
            }
        }
        if (i > j)
        {
            if (end > start)
            {
                start = i;
                end = j;
                num = start;
            }
            else
            {
                end = j;
            }
        }
    }
    void Update()
    {
        if (end > start)
        {
            num += (float)(end - start)* Time.deltaTime / time;            
            if (num < end)
            {
                if (num < 1)
                    text.text = string.Format("l{0}", 1);
                else
                    text.text = string.Format("l{0}", (int)num);
            }
            else
            {
                text.text = string.Format("l{0}", end);
                num = end;
            }
        }
        if (end < start)
        {
            num += (end - start) * Time.deltaTime / time;            
            if (num > end)
            {
                if (num < 1)
                    text.text = string.Format("l{0}", 1);
                else
                    text.text = string.Format("l{0}", (int)num);
            }
            else
            {
                text.text = string.Format("l{0}", end);
                num = end;
            }
        }
    }
}
