using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using CustomAssetHolder;


public class SpriteHolder : MonoBehaviour {

	[System.Serializable]
	public class Injection
	{
   		public string name;
    	public Sprite value;		
	}

    public AssetData assetData;
	public bool useAssetName = false;
	public List<Injection> injections;

	#if UNITY_EDITOR

		void Start() {
			for (int i = 0; i < injections.Count; i++)
			{
				if (injections[i].value == null) {
					UnityEditor.Selection.activeGameObject = this.gameObject;
					Debug.LogError("Sprite特图丢失：" + injections[i].name);
				}
			}
		}
	#endif

	public Sprite FindSpriteByName(string name)
	{
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
		for(int i = 0, len = injections.Count; i < len; i++)
		{
			if(useAssetName)
			{
				if(string.Equals(name, injections[i].value.name))
				{
					return injections[i].value;
				}
			}
			else
			{
				if(string.Equals(name, injections[i].name))
				{
					return injections[i].value;
				}
			}			
		}
		return null;
	}

}
