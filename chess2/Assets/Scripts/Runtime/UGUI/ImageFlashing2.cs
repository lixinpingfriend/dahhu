using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
//图片闪烁:渐渐消失,再渐渐出现
public class ImageFlashing2 : MonoBehaviour
{
    [SerializeField]Image image;
    bool isAdd = false;
    [SerializeField]float flashingFrequency = 2f;
    void Start()
    {
        if (image == null) image = gameObject.GetComponent<Image>();
        Reset();
    }

    void OnEnable()
    {
        if (image == null) return;
        Reset();
    }

    private void Update()
    {
        if (image == null) return;
        float al = image.color.a;
        if (al <= 0.01f)
        {
            isAdd = true;
        }
        else if (al >= 0.99f)
        {
            isAdd = false;
        }
        if (isAdd)
        {
            al += Time.deltaTime * flashingFrequency;
        }
        else
        {
            al -= Time.deltaTime * flashingFrequency;
        }

        Color color = image.color;
        color.a = al;
        image.color = color;
    }

    private void Reset()
    {
        if (image == null) return;
        Color color = image.color;
        color.a = 0;
        image.color = color;
    }
}
