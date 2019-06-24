

using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class SimpleAnimControl : MonoBehaviour
{

    public int childcount;
    public bool play;
    GameObject[] animObj;
    public float timer = 0;
    public float rate = 0.3f;
    public float delay = 0f;
    public float start = 0f;
    int count = 0;
    public bool control = true;
    // Use this for initialization
    void Start()
    {
        childcount = this.transform.childCount;
        animObj = new GameObject[childcount];
        for (int i = 1; i <= childcount; i++)
        {
            animObj[i - 1] = this.transform.Find(string.Format("{0}", i)).gameObject;
        }
    }

    // Update is called once per frame
    void Update()
    {
        if (delay > 0)
        {
            start += Time.deltaTime;
            if (start < delay)
            {
                return;
            }
            else
            {
                delay = 0;
            }
        }
        if (play)
        {
            if (timer > rate)
            {
                timer = 0;
                if (count < 0)
                {
                    count = 0;
                }

                if (count < animObj.Length)
                {
                    animObj[count].SetActive(true);
                    count++;
                }
                else
                {
                    foreach (GameObject go in animObj)
                    {
                        go.SetActive(false);
                    }
                    count = 0;
                    if (control)
                    {
                        animObj[count].SetActive(true);
                    }
                   
                }
            }
            timer += Time.deltaTime;
        }
    }
}


