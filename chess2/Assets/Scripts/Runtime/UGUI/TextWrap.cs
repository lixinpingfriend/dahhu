
using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.UI;

[ExecuteInEditMode]
public class TextWrap : MonoBehaviour 
{ 
    public enum WrapMode
    {
        /// <summary>（x=0为最左端）文本从左到右排列</summary>
        L_R,
        /// <summary>（x=0为最右端）文本从右到左排列</summary>
        R_L,
        /// <summary>（x=0为最中间）文本左右两边散开</summary>
        Center,
    }

    /// <summary>所引用的图集</summary>
    public SpriteAtlas atlas;

    [SerializeField]
    private string mText = "";
    [SerializeField]
    private int mNum = -99;
    [SerializeField]
    private WrapMode mMode = WrapMode.L_R;
    [SerializeField]
    private float mInterval = 0.0f;
    [SerializeField]
    private int numCount = 0;
    [SerializeField]
    private Vector2 mImageSize = new Vector2(0, 0);


    public List<Image> imageList = new List<Image>();

    private BetterList<string> symbolList = new BetterList<string>();

    private string[] symbolAry = new string[10] {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"};

    public int NumCount
    {
        get
        {
            return numCount;
        }
        set
        {
            if (value > numCount)
            {
                for (int i = 0; i < value - numCount; i++)
                {
                    NewObj();
                }
            }
            else if (value < numCount)
            {
                for (int i = 0; i < numCount - value; i++)
                {
                    GameObject object_ = transform.GetChild(0).gameObject;
#if UNITY_EDITOR
                    DestroyImmediate(object_);
#else
                    Destroy(object_);
#endif
                }
            }

            numCount = value;
            return;
        }
    }

    public Vector2 ImageSize 
    {
        get
        {
            return mImageSize;
        }
        set
        {
            if (mImageSize == value) return;
            mImageSize = value;
            TextChange();
        }
    }

    public string text
    {
        get
        {
            return mText;
        }
        set
        {      
            mText = value;
            TextChange();
        }
    }

    public int num
    {
        get
        {
            return mNum;
        }
        set
        {
            mNum = value;
            NumChange();
        }
    } 

    public WrapMode mode
    {
        get 
        {
            return mMode;
        }
        set
        {
            if (mMode != value)
            {
                TextChange();
            }
            mMode = value;
        }
    }

    public float interval
    {
        get 
        {
            return mInterval;
        }
        set
        {
            if(mInterval!=value)
            {
                TextChange();
            }
            mInterval = value;
        }
    }


    Image NewObj()
    {
        GameObject object_ = new GameObject();
        object_.name = "textwrap";
        RectTransform rectTrans = object_.AddComponent<RectTransform>();
        rectTrans.SetParent(transform);
        rectTrans.localRotation = Quaternion.identity;
        rectTrans.localPosition = Vector3.zero;
        rectTrans.localScale = Vector3.one;
        Image image=object_.AddComponent<Image>();
        object_.SetActive(false);
        return image;
    }

    void CheckObjLoaded()
    {
        if (imageList.Count == transform.childCount)
        {
            return;
        }

        imageList.Clear();

        if (transform.childCount == 0)
        {
            for (int i = 0; i < numCount; i++)
            {
                imageList.Add(NewObj());
            }
        }
        else
        {
            for (int i = 0; i < transform.childCount; i++)
            {
                imageList.Add(transform.GetChild(i).gameObject.GetComponent<Image>());
            }
        }
    }
    
    void Awake()
    {
        CheckObjLoaded();
    }

    public void TextChange()
    {
        CheckObjLoaded();

        if(mText.Length > numCount)
        {
            Debug.LogError("TextWrap,图文混排越界！");
            return;
        }

        for (int i = mText.Length; i < numCount; i++)
        {
            imageList[i].gameObject.SetActive(false);
        }

        symbolList.Clear();
        for (int i = 0; i < mText.Length; i++)
        {
            symbolList.Add(mText[i].ToString());
        }

        switch(mMode)
        {
            case WrapMode.L_R:
                {
                    for (int i = 0; i < symbolList.size; i++)
                    {
                        int index = atlas.keys.IndexOf(symbolList[i]);                        
                        if (index>=0)
                        {
                            imageList[i].rectTransform.sizeDelta = mImageSize;
                            SetImage(imageList[i], atlas.values[index], new Vector3(mImageSize.x/2.0f + (mImageSize.x + mInterval) * i, 0, 0));
                        }
                        else
                        {
                            Debug.LogError(string.Format("TextWrap存在未识别的标示符 :{0}!", symbolList.ToArray().JoinToString(" ")));
                            return;
                        }
                    }
                }
                break;
            case WrapMode.R_L:
                {
                    for (int i = symbolList.size - 1; i >= 0; i--) 
                    {
                        int index = atlas.keys.IndexOf(symbolList[i]);
                        if (index >= 0)
                        {
                            imageList[i].rectTransform.sizeDelta=mImageSize;
                            SetImage(imageList[i], atlas.values[index], new Vector3(mImageSize.x / 2.0f - (mImageSize.x + mInterval) * (symbolList.size - 1 - i), 0, 0));
                        }
                        else
                        {
                            Debug.LogError("TextWrap存在未识别的标示符!");
                            return;
                        }
                    }
                }
                break;
            case WrapMode.Center:
                {
                    for (int i = 0; i < symbolList.size; i++)
                    {
                        int index = atlas.keys.IndexOf(symbolList[i]);
                        if (index >= 0)
                        {
                            imageList[i].rectTransform.sizeDelta=mImageSize;
                            SetImage(imageList[i], atlas.values[index], new Vector3(mImageSize.x / 2.0f + (mImageSize.x + mInterval) * (i - (symbolList.size - 1) / 2.0f), 0, 0));
                        }
                        else
                        {
                            Debug.LogError("TextWrap存在未识别的标示符!--->                " + symbolList[i] + "    ----->    " + symbolList.ToArray().JoinToString(" "));
                            return;
                        }
                    }
                }
                break;
        }
    }

    public void NumChange()
    {
        CheckObjLoaded();

        int digit = GetDigit(mNum);
        if (digit > numCount)
        {
            Debug.LogError("TextWrap,图文混排越界！");
            return;
        }

        for (int i = digit; i < numCount; i++)
        {
            imageList[i].gameObject.SetActive(false);
        }

        symbolList.Clear();
        SetDigitStr(symbolList, mNum);

        switch (mMode)
        {
            case WrapMode.L_R:
                {
                    for (int i = 0; i < symbolList.size; i++)
                    {
                        int index = atlas.keys.IndexOf(symbolList[i]);
                        if (index >= 0)
                        {
                            imageList[i].rectTransform.sizeDelta = mImageSize;
                            SetImage(imageList[i], atlas.values[index], new Vector3(mImageSize.x / 2.0f + (mImageSize.x + mInterval) * i, 0, 0));
                        }
                        else
                        {
                            Debug.LogError(string.Format("TextWrap存在未识别的标示符 :{0}!", symbolList.ToArray().JoinToString(" ")));
                            return;
                        }
                    }
                }
                break;
            case WrapMode.R_L:
                {
                    for (int i = symbolList.size - 1; i >= 0; i--)
                    {
                        int index = atlas.keys.IndexOf(symbolList[i]);
                        if (index >= 0)
                        {
                            imageList[i].rectTransform.sizeDelta = mImageSize;
                            SetImage(imageList[i], atlas.values[index], new Vector3(mImageSize.x / 2.0f - (mImageSize.x + mInterval) * (symbolList.size - 1 - i), 0, 0));
                        }
                        else
                        {
                            Debug.LogError("TextWrap存在未识别的标示符!");
                            return;
                        }
                    }
                }
                break;
            case WrapMode.Center:
                {
                    for (int i = 0; i < symbolList.size; i++)
                    {
                        int index = atlas.keys.IndexOf(symbolList[i]);
                        if (index >= 0)
                        {
                            imageList[i].rectTransform.sizeDelta = mImageSize;
                            SetImage(imageList[i], atlas.values[index], new Vector3(mImageSize.x / 2.0f + (mImageSize.x + mInterval) * (i - (symbolList.size - 1) / 2.0f), 0, 0));
                        }
                        else
                        {
                            Debug.LogError("TextWrap存在未识别的标示符!--->                " + symbolList[i] + "    ----->    " + symbolList.ToArray().JoinToString(" "));
                            return;
                        }
                    }
                }
                break;
        }
    }
    
    public void SetImage(Image image,Sprite sprite,Vector3 lposition)
    {
        image.sprite = sprite;
        image.SetNativeSize();
        image.rectTransform.localPosition = lposition;
        image.gameObject.SetActive(true);
    }

    public int GetDigit(int nnn)
    {
        nnn = Mathf.Abs(nnn);
        int sum = 1;
        while(true)
        {
            nnn = nnn / 10;
            if (nnn == 0)
            {
                break;
            }
            else
            {
                sum++;
            }
        }
        return sum;
    }

    public void SetDigitStr(BetterList<string> list,int nnn)
    {
        nnn = Mathf.Abs(nnn);
        while (true)
        {
            int aa = nnn / 10;
            int bb = nnn % 10;
            if (aa == 0)
            {
                list.Insert(0, symbolAry[bb]);
                break;
            }
            else
            {
                list.Insert(0, symbolAry[bb]);
            }
            nnn = aa;
        }
    }
}
