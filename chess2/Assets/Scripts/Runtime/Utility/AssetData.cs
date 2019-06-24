using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Text;
using System.IO;

namespace CustomAssetHolder
{
    [System.Serializable]
    public class HolderData
    {
        public string key;
        public Object asset;
    }
	[System.Serializable]
	public class AssetData : ScriptableObject
	{
        public bool useAssetName = false;
        public List<HolderData> assetList = new List<HolderData>();

        public HolderData GetAssetByKey(string key)
        {
            for(int i = 0; i < assetList.Count; i++)
            {
                HolderData data = assetList[i];
                if(!useAssetName)
                {
                    if(key == data.key)
                    {
                        return data;
                    }
                }
                else
                {
                    if(key == data.asset.name)
                    {
                        return data;
                    }
                }

            }
            return null;
        }

        public void AddAssetByKey(string key, Object obj)
        {
            HolderData hd = GetAssetByKey(key);
            if(hd == null)
            {
                hd = new HolderData();
                assetList.Add(hd);
            }
            hd.key = key;
            hd.asset = obj;
        }
    }
}
