
using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.UI;
using WrapMode = TextWrap.WrapMode;

[ExecuteInEditMode]
public class TextWrapEx : MonoBehaviour 
{
    /// <summary>所引用的图集</summary>
    [SerializeField]
    private SpriteAtlas mAtlas;
    public SpriteAtlas atlas
    {
        get
        {
            return mAtlas;
        }
        set
        {
            mAtlas = value;                        
            TextChange();
        }
    } 

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


    public BetterList<Image> imageList = new BetterList<Image>();
    public BetterList<Transform> transList = new BetterList<Transform>();
    public BetterList<RectTransform> rectTransList = new BetterList<RectTransform>();

    private BetterList<string> symbolList = new BetterList<string>();

    private string[] symbolAry = new string[10] {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"};

    private bool completion;
    private int completionBytes;

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
        }
    }

    public Vector2 imageSize 
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
            if (mText == value) return;            
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
            if (mNum == value) return;
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

    private float sizeScale=1.0f;
    private float intervalScale = 1.0f;


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
        image.maskable = false;
        object_.SetActive(false);
        return image;
    }

    void CheckObjLoaded()
    {
        if (imageList.size == transform.childCount && imageList.size == transList.size && imageList.size == rectTransList.size)
        {
            return;
        }

        imageList.Clear();
        transList.Clear();
        rectTransList.Clear();

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

        for (int i = 0; i < imageList.size; i++)
        {
            transList.Add(imageList[i].transform);
        }

        for (int i = 0; i < imageList.size; i++)
        {
            rectTransList.Add(imageList[i].rectTransform);
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
            Debug.LogError("TextWrapEx,图文混排越界！");
            return;
        }

        for (int i = mText.Length; i < numCount; i++)
        {
            transList[i].gameObject.SetActive(false);
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
                            rectTransList[i].sizeDelta = mImageSize;
                            SetImage(i, atlas.values[index], new Vector3(mImageSize.x/2.0f + (mImageSize.x + mInterval) * i, 0, 0));
                        }
                        else
                        {
                            Debug.LogError(string.Format("TextWrapEx存在未识别的标示符 :{0}!", symbolList.ToArray().JoinToString(" ")));
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
                            rectTransList[i].sizeDelta=mImageSize;
                            SetImage(i, atlas.values[index], new Vector3(mImageSize.x / 2.0f - (mImageSize.x + mInterval) * (symbolList.size - 1 - i), 0, 0));
                        }
                        else
                        {
                            Debug.LogError("TextWrapEx存在未识别的标示符!");
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
                            rectTransList[i].sizeDelta=mImageSize;
                            SetImage(i, atlas.values[index], new Vector3(mImageSize.x / 2.0f + (mImageSize.x + mInterval) * (i - (symbolList.size - 1) / 2.0f), 0, 0));
                        }
                        else
                        {
                            Debug.LogError("TextWrapEx存在未识别的标示符!--->                " + symbolList[i] + "    ----->    " + symbolList.ToArray().JoinToString(" "));
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
            Debug.LogError("TextWrapEx,图文混排越界！");
            return;
        }

        for (int i = digit; i < numCount; i++)
        {
            SetTransFormActive(i,false);
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
                            rectTransList[i].sizeDelta = mImageSize;
                            SetImage(i, atlas.values[index], new Vector3(mImageSize.x / 2.0f + (mImageSize.x + mInterval) * i, 0, 0));
                        }
                        else
                        {
                            Debug.LogError(string.Format("TextWrapEx存在未识别的标示符 :{0}!", symbolList.ToArray().JoinToString(" ")));
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
                            rectTransList[i].sizeDelta = mImageSize;
                            SetImage(i, atlas.values[index], new Vector3(mImageSize.x / 2.0f - (mImageSize.x + mInterval) * (symbolList.size - 1 - i), 0, 0));
                        }
                        else
                        {
                            Debug.LogError("TextWrapEx存在未识别的标示符!");
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
                            rectTransList[i].sizeDelta = mImageSize;
                            SetImage(i, atlas.values[index], new Vector3(mImageSize.x / 2.0f + (mImageSize.x + mInterval) * (i - (symbolList.size - 1) / 2.0f), 0, 0));
                        }
                        else
                        {
                            Debug.LogError("TextWrapEx存在未识别的标示符!--->                " + symbolList[i] + "    ----->    " + symbolList.ToArray().JoinToString(" "));
                            return;
                        }
                    }
                }
                break;
        }
    }
    
    public void SetImage(int index,Sprite sprite,Vector3 lposition)
    {
        imageList[index].sprite = sprite;
        imageList[index].maskable = false;
        imageList[index].SetNativeSize();
        rectTransList[index].localPosition = Vector3.Scale(new Vector3(intervalScale,1,1), lposition);
        SetTransFormActive(index,true);
    }

    public void SetSizeScale(float scale)
    {
        this.sizeScale = scale;
        for(int i = 0; i < transList.size; ++i)
        {
            transList[i].localScale = scale * Vector3.one;
        }
    }

    public void SetIntervalScale(float scale)
    {
        this.intervalScale = scale;
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
                if(completion)
                {
                    if(list.size<completionBytes)
                    {
                        list.Insert(0, symbolAry[bb]);
                    }
                }
                else
                {
                    list.Insert(0, symbolAry[bb]);
                }                
                break;
            }
            else
            {
                if (completion)
                {
                    if (list.size < completionBytes)
                    {
                        list.Insert(0, symbolAry[bb]);
                    }
                }
                else
                {
                    list.Insert(0, symbolAry[bb]);
                }
            }
            nnn = aa;
        }

        if(completion && list.size<completionBytes)
        {
            int kk = completionBytes - list.size;
            for (int i=0;i<kk;++i)
            {
                list.Insert(0, "0");
            }
        }
    }

    public void SetTransFormActive(int index,bool active)
    {
        transList[index].gameObject.SetActive(active);
        //transList[index].localScale = active ? this.scale * Vector3.one : Vector3.zero;
    }

    public void SetCompletion(int completionBytes)
    {
        this.completion=true;
        this.completionBytes=completionBytes;
    }
}
