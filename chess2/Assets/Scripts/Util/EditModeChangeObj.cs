using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

[ExecuteInEditMode]
public class EditModeChangeObj : MonoBehaviour {

	// Use this for initialization
	void Start () {
		Debug.LogError("--------------ExecuteInEditMode----------------------");
		ModifyAllTextRaycastTarget(gameObject);
	}
	
	// Update is called once per frame
	void Update () {
		
	}

	void ModifyAllTextRaycastTarget(GameObject go){
		Text[] tempTex = go.GetComponentsInChildren<Text>(true);
		foreach(var t in tempTex){
			t.raycastTarget = true;
		}
	}
}
