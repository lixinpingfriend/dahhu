

using UnityEngine.UI;
using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using CustomAssetHolder;

public class SpriteAtlas : MonoBehaviour 
{

    public AssetData assetData;
    public List<string> keys = new List<string>();
    public List<Sprite> values = new List<Sprite>();

    public Dictionary<string, Sprite> sprites = new Dictionary<string, Sprite>();


    public void Add(string key,Sprite value)
    {
        if (key == "" || value == null) 
        {
            Debug.LogError("空值无效");
            return;
        }
        if (keys.Contains(key))
        {
            Debug.LogError("相同的key存在");
            return;
        }

        keys.Add(key);
        values.Add(value);
    }

    public Sprite Get(string name) {
        if(assetData != null)
        {
            HolderData hd = assetData.GetAssetByKey(name);
            if(hd != null)
            {
                Sprite sp = hd.asset as Sprite;
                if(sp != null)
                {
                    return sp;
                }
            }
        }
        int index = keys.IndexOf(name);
        if (index >= 0) {
            return values[index];
        }
        return null;
    }

    public void Del(string key)
    {
        int index = keys.IndexOf(key);
        if (index>=0)
        {
            keys.RemoveAt(index);
            values.RemoveAt(index);
        }
    }

    public void Modify(string key,Sprite value)
    {
        int index = keys.IndexOf(key);
        if (index >= 0)
        {
            values[index] = value;
        }
    }
}


