using System;
using System.Collections.Generic;
using UnityEngine;



public class AssetBundleCRCScriptableObject : ScriptableObject, ISerializationCallbackReceiver
{
    public int version;
    
    public List<string> keys = new List<string>();
    public List<uint> values = new List<uint>();
        
    public Dictionary<string, uint> crcData = new Dictionary<string, uint>();

    public void OnBeforeSerialize()
    {
        keys.Clear();
        values.Clear();
        foreach (var kvp in crcData)
        {
            keys.Add(kvp.Key);
            values.Add(kvp.Value);
        }
    }

    public void OnAfterDeserialize()
    {
        var count = Math.Min(keys.Count, values.Count);
        crcData.Clear();
        for (var i = 0; i < count; ++i)
        {
            crcData.Add(keys[i], values[i]);
        }
    }
}