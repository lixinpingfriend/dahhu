using UnityEngine;
using System.Collections;
using UnityEditor;
using System.Collections.Generic;
using UnityEngine.UI;
using System;

using Object = UnityEngine.Object;

[CustomEditor(typeof(ComponentCache))]
public class ComponentCacheEditor : Editor 
{
	ComponentCache m_cache;
	static Dictionary<string, bool> showTargetObjectsDic = new Dictionary<string, bool>();
	static Dictionary<string, int> showTargetCountDic = new Dictionary<string, int>();
	Object m_newObj;
	public static List<Type> m_totalTypeNameList = new List<Type>(){
		typeof(GameObject),
		typeof(Transform),
		typeof(RectTransform),
		typeof(Image),
		typeof(Text),
		typeof(Toggle),
		typeof(Button),
		typeof(Slider),
		typeof(ToggleGroup),
		typeof(InputField),
		typeof(Graphic),
		typeof(ScrollRect),
		typeof(Scrollbar),
		typeof(Dropdown),
		typeof(GridLayoutGroup),
		typeof(RawImage),
		typeof(AudioSource),
		typeof(littlerbird.UI.QuickGrid),
		typeof(SimpleScrollView),
		typeof(Animation),
		typeof(Animator),
		typeof(SpriteAtlas),
		typeof(SpriteHolder),
		typeof(UIStateSwitcher),
		typeof(TextWrap),
		typeof(UIImageAnimation),
		typeof(ComponentCache),
	};
	List<string> m_newObjTypeNameList = new List<string>();
	List<int> m_newObjTypeCanSelectIdList = new List<int>();
	int m_newSelectedId = 0;
	string m_newObjName = string.Empty;
	void OnEnable()
	{
		m_cache = target as ComponentCache;
	}

	private int GetBindedComponentsCount()
	{
		int totalCount = 0;
		if(m_cache == null){
			return 0;
		}
		if(m_cache.gameObjectList != null){
			totalCount += m_cache.gameObjectList.Count; 
		}
		if(m_cache.transformList != null){
			totalCount += m_cache.transformList.Count; 
		}
		if(m_cache.rectTransformList != null){
			totalCount += m_cache.rectTransformList.Count; 
		}
		if(m_cache.imageList != null){
			totalCount += m_cache.imageList.Count; 
		}
		if(m_cache.textList != null){
			totalCount += m_cache.textList.Count; 
		}
		if(m_cache.toggleList != null){
			totalCount += m_cache.toggleList.Count; 
		}
		if(m_cache.toggleEventList != null){
			totalCount += m_cache.toggleEventList.Count; 
		}
		if(m_cache.buttonList != null){
			totalCount += m_cache.buttonList.Count; 
		}
		if(m_cache.sliderList != null){
			totalCount += m_cache.sliderList.Count; 
		}
		if(m_cache.toggleGroupList != null){
			totalCount += m_cache.toggleGroupList.Count; 
		}
		if(m_cache.inputFieldList != null){
			totalCount += m_cache.inputFieldList.Count; 
		}
		if(m_cache.graphicList != null){
			totalCount += m_cache.graphicList.Count; 
		}
		if(m_cache.scrollRectList != null){
			totalCount += m_cache.scrollRectList.Count; 
		}
		if(m_cache.scrollbarList != null){
			totalCount += m_cache.scrollbarList.Count; 
		}
		if(m_cache.dropdownList != null){
			totalCount += m_cache.dropdownList.Count; 
		}
		if(m_cache.gridLayoutGroupList != null){
			totalCount += m_cache.gridLayoutGroupList.Count; 
		}
		if(m_cache.rawImageList != null){
			totalCount += m_cache.rawImageList.Count; 
		}
		if(m_cache.audioSourceList != null){
			totalCount += m_cache.audioSourceList.Count; 
		}
		if(m_cache.animationList != null){
			totalCount += m_cache.animationList.Count; 
		}
		if(m_cache.animatorList != null){
			totalCount += m_cache.animatorList.Count; 
		}
		if(m_cache.spriteAtlasList != null){
			totalCount += m_cache.spriteAtlasList.Count; 
		}
		if(m_cache.spriteHolderList != null){
			totalCount += m_cache.spriteHolderList.Count; 
		}
		if(m_cache.uiStateSwitcherList != null){
			totalCount += m_cache.uiStateSwitcherList.Count; 
		}
		if(m_cache.textWrapList != null){
			totalCount += m_cache.textWrapList.Count; 
		}
		if(m_cache.uiImageAnimList != null){
			totalCount += m_cache.uiImageAnimList.Count; 
		}
		if(m_cache.cacheList != null){
			totalCount += m_cache.cacheList.Count; 
		}

		return totalCount;
	}

	private void ShowComponentList<T, U>(string title, List<T> list)where U:UnityEngine.Object
	{
		if(!showTargetObjectsDic.ContainsKey(title)){
			showTargetObjectsDic.Add(title, false);
		}
		if(list != null && list.Count > 0){
		bool showTargetObjects = showTargetObjectsDic[title];
		showTargetObjects = EditorGUILayout.Foldout(showTargetObjects, title);
		showTargetObjectsDic[title] = showTargetObjects;

		if (showTargetObjects)
		{
			EditorGUI.indentLevel++;
			foreach (var item in list)
			{
				var tmp = item as ComponentCache.Injection<U>;
				
				EditorGUILayout.BeginHorizontal();
				string name = EditorGUILayout.TextField(tmp.name);
				tmp.name = name;
				U obj = EditorGUILayout.ObjectField(string.Empty, tmp.value, typeof(U), true) as U;
				if(obj != tmp.value){
					tmp.value = obj;
				}
				if (GUILayout.Button("delete"))
				{
					list.Remove(item);
					break;
				}

				EditorGUILayout.EndHorizontal();
			}
	
			EditorGUI.indentLevel--;
		}


		}

	}

	// private void CalcComponentCount(string title, Type type, List<ComponentCache.Object_Injection> list)
	// {
	// 	if(!showTargetCountDic.ContainsKey(title)){
	// 		showTargetCountDic.Add(title, 0);
	// 	}
	// 	showTargetCountDic[title] = 0;
	// 	foreach (var item in list)
	// 	{
	// 		var tmp = item as ComponentCache.Object_Injection;
	// 		string typeName = tmp.typeName;
			
	// 		if(title != typeName){
	// 			continue;
	// 		}
	// 		showTargetCountDic[title] += 1;
	// 	}
	// }

	// private void CalcAllCompoentCount()
	// {
	// 	for (int i = 0; i < m_totalTypeNameList.Count; i++)
	// 	{
	// 		string typeName = m_totalTypeNameList[i].ToString();
	// 		if(typeName.Contains(".")){
	// 			typeName = typeName.Substring(typeName.LastIndexOf(".") + 1);
	// 		}
	// 		this.CalcComponentCount(typeName, m_totalTypeNameList[i], m_cache.objectList);	
	// 	}
	// }

	// private void RendComponentList(string title, Type type, List<ComponentCache.Object_Injection> list)
	// {

	// 	if(!showTargetObjectsDic.ContainsKey(title)){
	// 		showTargetObjectsDic.Add(title, false);
	// 	}
	// 	if(!showTargetCountDic.ContainsKey(title)){
	// 		showTargetCountDic.Add(title, 0);
	// 	}
	// 	if(list != null && showTargetCountDic[title] > 0){
	// 		bool showTargetObjects = showTargetObjectsDic[title];
	// 		showTargetObjects = EditorGUILayout.Foldout(showTargetObjects, title);
	// 		showTargetObjectsDic[title] = showTargetObjects;

	// 		if (showTargetObjects)
	// 		{
	// 			EditorGUI.indentLevel++;
	// 			foreach (var item in list)
	// 			{
	// 				var tmp = item as ComponentCache.Object_Injection;
	// 				if(tmp.typeName != title){
	// 					continue;
	// 				}
	// 				EditorGUILayout.BeginHorizontal();
	// 				string name = EditorGUILayout.TextField(tmp.name);
	// 				tmp.name = name;
	// 				var obj = EditorGUILayout.ObjectField(string.Empty, tmp.value, type, true);
	// 				if(obj != tmp.value){
	// 					if(obj.GetType() == type){
	// 						tmp.value = obj;
	// 					}else if(type == typeof(Transform) && obj.GetType() == typeof(RectTransform)){
	// 						tmp.value = obj;
	// 					}
						
	// 				}
	// 				if (GUILayout.Button("delete"))
	// 				{
	// 					list.Remove(item);
	// 					break;
	// 				}

	// 				EditorGUILayout.EndHorizontal();
	// 			}
		
	// 			EditorGUI.indentLevel--;
	// 		}


	// 	}

	// }
	Object TryGetComponent(Object obj, Type type){
		GameObject go = obj as GameObject;
		if(go == null){
			return null;
		}
		if(type == typeof(GameObject)){
			return go;
		}
		if(type == typeof(Transform)){
			return go.transform as Transform;
		}
		Object com = go.GetComponent(type);
		return com;
	}


	void CheckCanSelectTypes(){
		if(m_newObjTypeNameList.Count != 0){
			return;
		}
		for (int i = 0; i < m_totalTypeNameList.Count; i++)
		{
			string typeName = m_totalTypeNameList[i].ToString();
			if(typeName.Contains(".")){
				typeName = typeName.Substring(typeName.LastIndexOf(".") + 1);
			}
			m_newObjTypeNameList.Add(typeName);
			m_newObjTypeCanSelectIdList.Add(i);
		}
	}

	bool AddToRightList(Object obj){
		Type type = m_totalTypeNameList[m_newSelectedId];
		if(type == typeof(GameObject)){
			GameObject value = obj as GameObject;
			if(value == null){
				return false;
			}
			var injection = new ComponentCache.GameObject_Injection();
			injection.name = m_newObjName;
			injection.value = value;
			if(m_cache.gameObjectList == null){
				m_cache.gameObjectList = new List<ComponentCache.GameObject_Injection>();
			}
			m_cache.gameObjectList.Add(injection);
		}else if(type == typeof(Transform)){
			Transform value = obj as Transform;
			if(value == null){
				return false;
			}
			var injection = new ComponentCache.Transform_Injection();
			injection.name = m_newObjName;
			injection.value = value;
			if(m_cache.transformList == null){
				m_cache.transformList = new List<ComponentCache.Transform_Injection>();
			}
			m_cache.transformList.Add(injection);
		}else if(type == typeof(RectTransform)){
			RectTransform value = obj as RectTransform;
			if(value == null){
				return false;
			}
			var injection = new ComponentCache.RectTransform_Injection();
			injection.name = m_newObjName;
			injection.value = value;
			if(m_cache.rectTransformList == null){
				m_cache.rectTransformList = new List<ComponentCache.RectTransform_Injection>();
			}
			m_cache.rectTransformList.Add(injection);
		}else if(type == typeof(Image)){
			Image value = obj as Image;
			if(value == null){
				return false;
			}
			var injection = new ComponentCache.Image_Injection();
			injection.name = m_newObjName;
			injection.value = value;
			if(m_cache.imageList == null){
				m_cache.imageList = new List<ComponentCache.Image_Injection>();
			}
			m_cache.imageList.Add(injection);
		}else if(type == typeof(Text)){
			Text value = obj as Text;
			if(value == null){
				return false;
			}
			var injection = new ComponentCache.Text_Injection();
			injection.name = m_newObjName;
			injection.value = value;
			if(m_cache.textList == null){
				m_cache.textList = new List<ComponentCache.Text_Injection>();
			}
			m_cache.textList.Add(injection);
		}else if(type == typeof(Toggle)){
			Toggle value = obj as Toggle;
			if(value == null){
				return false;
			}
			var injection = new ComponentCache.Toggle_Injection();
			injection.name = m_newObjName;
			injection.value = value;
			if(m_cache.toggleList == null){
				m_cache.toggleList = new List<ComponentCache.Toggle_Injection>();
			}
			m_cache.toggleList.Add(injection);
		}else if(type == typeof(Button)){
			Button value = obj as Button;
			if(value == null){
				return false;
			}
			var injection = new ComponentCache.Button_Injection();
			injection.name = m_newObjName;
			injection.value = value;
			if(m_cache.buttonList == null){
				m_cache.buttonList = new List<ComponentCache.Button_Injection>();
			}
			m_cache.buttonList.Add(injection);
		}else if(type == typeof(Slider)){
			Slider value = obj as Slider;
			if(value == null){
				return false;
			}
			var injection = new ComponentCache.Slider_Injection();
			injection.name = m_newObjName;
			injection.value = value;
			if(m_cache.sliderList == null){
				m_cache.sliderList = new List<ComponentCache.Slider_Injection>();
			}
			m_cache.sliderList.Add(injection);
		}else if(type == typeof(ToggleGroup)){
			ToggleGroup value = obj as ToggleGroup;
			if(value == null){
				return false;
			}
			var injection = new ComponentCache.ToggleGroup_Injection();
			injection.name = m_newObjName;
			injection.value = value;
			if(m_cache.toggleGroupList == null){
				m_cache.toggleGroupList = new List<ComponentCache.ToggleGroup_Injection>();
			}
			m_cache.toggleGroupList.Add(injection);
		}else if(type == typeof(InputField)){
			InputField value = obj as InputField;
			if(value == null){
				return false;
			}
			var injection = new ComponentCache.InputField_Injection();
			injection.name = m_newObjName;
			injection.value = value;
			if(m_cache.inputFieldList == null){
				m_cache.inputFieldList = new List<ComponentCache.InputField_Injection>();
			}
			m_cache.inputFieldList.Add(injection);
		}else if(type == typeof(Graphic)){
			Graphic value = obj as Graphic;
			if(value == null){
				return false;
			}
			var injection = new ComponentCache.Graphic_Injection();
			injection.name = m_newObjName;
			injection.value = value;
			if(m_cache.graphicList == null){
				m_cache.graphicList = new List<ComponentCache.Graphic_Injection>();
			}
			m_cache.graphicList.Add(injection);
		}else if(type == typeof(ScrollRect)){
			ScrollRect value = obj as ScrollRect;
			if(value == null){
				return false;
			}
			var injection = new ComponentCache.ScrollRect_Injection();
			injection.name = m_newObjName;
			injection.value = value;
			if(m_cache.scrollRectList == null){
				m_cache.scrollRectList = new List<ComponentCache.ScrollRect_Injection>();
			}
			m_cache.scrollRectList.Add(injection);
		}else if(type == typeof(Scrollbar)){
			Scrollbar value = obj as Scrollbar;
			if(value == null){
				return false;
			}
			var injection = new ComponentCache.Scrollbar_Injection();
			injection.name = m_newObjName;
			injection.value = value;
			if(m_cache.scrollbarList == null){
				m_cache.scrollbarList = new List<ComponentCache.Scrollbar_Injection>();
			}
			m_cache.scrollbarList.Add(injection);
		}else if(type == typeof(Dropdown)){
			Dropdown value = obj as Dropdown;
			if(value == null){
				return false;
			}
			var injection = new ComponentCache.Dropdown_Injection();
			injection.name = m_newObjName;
			injection.value = value;
			if(m_cache.dropdownList == null){
				m_cache.dropdownList = new List<ComponentCache.Dropdown_Injection>();
			}
			m_cache.dropdownList.Add(injection);
		}else if(type == typeof(GridLayoutGroup)){
			GridLayoutGroup value = obj as GridLayoutGroup;
			if(value == null){
				return false;
			}
			var injection = new ComponentCache.GridLayoutGroup_Injection();
			injection.name = m_newObjName;
			injection.value = value;
			if(m_cache.gridLayoutGroupList == null){
				m_cache.gridLayoutGroupList = new List<ComponentCache.GridLayoutGroup_Injection>();
			}
			m_cache.gridLayoutGroupList.Add(injection);
		}else if(type == typeof(RawImage)){
			RawImage value = obj as RawImage;
			if(value == null){
				return false;
			}
			var injection = new ComponentCache.RawImage_Injection();
			injection.name = m_newObjName;
			injection.value = value;
			if(m_cache.rawImageList == null){
				m_cache.rawImageList = new List<ComponentCache.RawImage_Injection>();
			}
			m_cache.rawImageList.Add(injection);
		}else if(type == typeof(AudioSource)){
			AudioSource value = obj as AudioSource;
			if(value == null){
				return false;
			}
			var injection = new ComponentCache.AudioSource_Injection();
			injection.name = m_newObjName;
			injection.value = value;
			if(m_cache.audioSourceList == null){
				m_cache.audioSourceList = new List<ComponentCache.AudioSource_Injection>();
			}
			m_cache.audioSourceList.Add(injection);
		}else if(type == typeof(Animation)){
			Animation value = obj as Animation;
			if(value == null){
				return false;
			}
			var injection = new ComponentCache.Animation_Injection();
			injection.name = m_newObjName;
			injection.value = value;
			if(m_cache.animationList == null){
				m_cache.animationList = new List<ComponentCache.Animation_Injection>();
			}
			m_cache.animationList.Add(injection);
		}else if(type == typeof(Animator)){
			Animator value = obj as Animator;
			if(value == null){
				return false;
			}
			var injection = new ComponentCache.Animator_Injection();
			injection.name = m_newObjName;
			injection.value = value;
			if(m_cache.animatorList == null){
				m_cache.animatorList = new List<ComponentCache.Animator_Injection>();
			}
			m_cache.animatorList.Add(injection);
		}else if(type == typeof(SpriteAtlas)){
			SpriteAtlas value = obj as SpriteAtlas;
			if(value == null){
				return false;
			}
			var injection = new ComponentCache.SpriteAtlas_Injection();
			injection.name = m_newObjName;
			injection.value = value;
			if(m_cache.spriteAtlasList == null){
				m_cache.spriteAtlasList = new List<ComponentCache.SpriteAtlas_Injection>();
			}
			m_cache.spriteAtlasList.Add(injection);
		}else if(type == typeof(SpriteHolder)){
			SpriteHolder value = obj as SpriteHolder;
			if(value == null){
				return false;
			}
			var injection = new ComponentCache.SpriteHolder_Injection();
			injection.name = m_newObjName;
			injection.value = value;
			if(m_cache.spriteHolderList == null){
				m_cache.spriteHolderList = new List<ComponentCache.SpriteHolder_Injection>();
			}
			m_cache.spriteHolderList.Add(injection);
		}else if(type == typeof(UIStateSwitcher)){
			UIStateSwitcher value = obj as UIStateSwitcher;
			if(value == null){
				return false;
			}
			var injection = new ComponentCache.UIStateSwitcher_Injection();
			injection.name = m_newObjName;
			injection.value = value;
			if(m_cache.uiStateSwitcherList == null){
				m_cache.uiStateSwitcherList = new List<ComponentCache.UIStateSwitcher_Injection>();
			}
			m_cache.uiStateSwitcherList.Add(injection);
		}else if(type == typeof(TextWrap)){
			TextWrap value = obj as TextWrap;
			if(value == null){
				return false;
			}
			var injection = new ComponentCache.TextWrap_Injection();
			injection.name = m_newObjName;
			injection.value = value;
			if(m_cache.textWrapList == null){
				m_cache.textWrapList = new List<ComponentCache.TextWrap_Injection>();
			}
			m_cache.textWrapList.Add(injection);
		}else if(type == typeof(UIImageAnimation)){
			UIImageAnimation value = obj as UIImageAnimation;
			if(value == null){
				return false;
			}
			var injection = new ComponentCache.UIImageAnimation_Injection();
			injection.name = m_newObjName;
			injection.value = value;
			if(m_cache.uiImageAnimList == null){
				m_cache.uiImageAnimList = new List<ComponentCache.UIImageAnimation_Injection>();
			}
			m_cache.uiImageAnimList.Add(injection);
		}else if(type == typeof(ComponentCache)){
			ComponentCache value = obj as ComponentCache;
			if(value == null){
				return false;
			}
			var injection = new ComponentCache.ComponentCache_Injection();
			injection.name = m_newObjName;
			injection.value = value;
			if(m_cache.cacheList == null){
				m_cache.cacheList = new List<ComponentCache.ComponentCache_Injection>();
			}
			m_cache.cacheList.Add(injection);
		}else{
			return false;
		}
		return true;
	}

	Object ShowNewObj(Object obj)
	{
		Type type = m_totalTypeNameList[m_newSelectedId];
		if(type == typeof(GameObject)){
			return EditorGUILayout.ObjectField("", obj, m_totalTypeNameList[m_newSelectedId], true) as GameObject;
		}else if(type == typeof(Transform)){
			return EditorGUILayout.ObjectField("", obj, m_totalTypeNameList[m_newSelectedId], true) as Transform;
		}else if(type == typeof(RectTransform)){
			return EditorGUILayout.ObjectField("", obj, m_totalTypeNameList[m_newSelectedId], true) as RectTransform;
		}else if(type == typeof(Image)){
			return EditorGUILayout.ObjectField("", obj, m_totalTypeNameList[m_newSelectedId], true) as Image;
		}else if(type == typeof(Text)){
			return EditorGUILayout.ObjectField("", obj, m_totalTypeNameList[m_newSelectedId], true) as Text;
		}else if(type == typeof(Toggle)){
			return EditorGUILayout.ObjectField("", obj, m_totalTypeNameList[m_newSelectedId], true) as Toggle;
		}else if(type == typeof(Button)){
			return EditorGUILayout.ObjectField("", obj, m_totalTypeNameList[m_newSelectedId], true) as Button;
		}else if(type == typeof(Slider)){
			return EditorGUILayout.ObjectField("", obj, m_totalTypeNameList[m_newSelectedId], true) as Slider;
		}else if(type == typeof(ToggleGroup)){
			return EditorGUILayout.ObjectField("", obj, m_totalTypeNameList[m_newSelectedId], true) as ToggleGroup;
		}else if(type == typeof(InputField)){
			return EditorGUILayout.ObjectField("", obj, m_totalTypeNameList[m_newSelectedId], true) as InputField;
		}else if(type == typeof(Graphic)){
			return EditorGUILayout.ObjectField("", obj, m_totalTypeNameList[m_newSelectedId], true) as Graphic;
		}else if(type == typeof(ScrollRect)){
			return EditorGUILayout.ObjectField("", obj, m_totalTypeNameList[m_newSelectedId], true) as ScrollRect;
		}else if(type == typeof(Scrollbar)){
			return EditorGUILayout.ObjectField("", obj, m_totalTypeNameList[m_newSelectedId], true) as Scrollbar;
		}else if(type == typeof(Dropdown)){
			return EditorGUILayout.ObjectField("", obj, m_totalTypeNameList[m_newSelectedId], true) as Dropdown;
		}else if(type == typeof(GridLayoutGroup)){
			return EditorGUILayout.ObjectField("", obj, m_totalTypeNameList[m_newSelectedId], true) as GridLayoutGroup;
		}else if(type == typeof(RawImage)){
			return EditorGUILayout.ObjectField("", obj, m_totalTypeNameList[m_newSelectedId], true) as RawImage;
		}else if(type == typeof(AudioSource)){
			return EditorGUILayout.ObjectField("", obj, m_totalTypeNameList[m_newSelectedId], true) as AudioSource;
		}else if(type == typeof(littlerbird.UI.QuickGrid)){
			return EditorGUILayout.ObjectField("", obj, m_totalTypeNameList[m_newSelectedId], true) as littlerbird.UI.QuickGrid;
		}else if(type == typeof(SimpleScrollView)){
			return EditorGUILayout.ObjectField("", obj, m_totalTypeNameList[m_newSelectedId], true) as SimpleScrollView;
		}else if(type == typeof(Animation)){
			return EditorGUILayout.ObjectField("", obj, m_totalTypeNameList[m_newSelectedId], true) as Animation;
		}else if(type == typeof(Animator)){
			return EditorGUILayout.ObjectField("", obj, m_totalTypeNameList[m_newSelectedId], true) as Animator;
		}else if(type == typeof(SpriteAtlas)){
			return EditorGUILayout.ObjectField("", obj, m_totalTypeNameList[m_newSelectedId], true) as SpriteAtlas;
		}else if(type == typeof(SpriteHolder)){
			return EditorGUILayout.ObjectField("", obj, m_totalTypeNameList[m_newSelectedId], true) as SpriteHolder;
		}else if(type == typeof(UIStateSwitcher)){
			return EditorGUILayout.ObjectField("", obj, m_totalTypeNameList[m_newSelectedId], true) as UIStateSwitcher;
		}else if(type == typeof(TextWrap)){
			return EditorGUILayout.ObjectField("", obj, m_totalTypeNameList[m_newSelectedId], true) as TextWrap;
		}else if(type == typeof(UIImageAnimation)){
			return EditorGUILayout.ObjectField("", obj, m_totalTypeNameList[m_newSelectedId], true) as UIImageAnimation;
		}else if(type == typeof(ComponentCache)){
			return EditorGUILayout.ObjectField("", obj, m_totalTypeNameList[m_newSelectedId], true) as ComponentCache;
		}
		return null;
	}

	void CacheNewComponent()
	{
		EditorGUILayout.LabelField("Cache new Components:", EditorStyles.boldLabel);
		EditorGUI.indentLevel++;
		EditorGUILayout.BeginHorizontal();
		CheckCanSelectTypes();
		if(m_newObjTypeNameList.Count != 0)
			m_newSelectedId = EditorGUILayout.IntPopup(m_newSelectedId,m_newObjTypeNameList.ToArray(), m_newObjTypeCanSelectIdList.ToArray());
		if(m_newObj != null){
			m_newObjName = EditorGUILayout.TextField(m_newObjName);
		}
		Object obj = ShowNewObj(m_newObj);
		//Object obj = EditorGUILayout.ObjectField("", m_newObj, typeof(Object), true);
		if(obj != m_newObj){
			if(m_newObj == null){
				m_newObjName = obj.name;
			}
			m_newObj = obj;
		}
		if(obj != null && m_newObj != obj){
			m_newObj = obj;
			// m_newObjTypeNameList.Clear();
			// m_newObjTypeCanSelectIdList.Clear();
			// for(int i = 0; i < m_totalTypeNameList.Count; i++){
			// 	var result = this.TryGetComponent(obj, m_totalTypeNameList[i]);
			// 	if(result != null){
			// 		string typeName = m_totalTypeNameList[i].ToString();
			// 		if(typeName.Contains(".")){
			// 			typeName = typeName.Substring(typeName.LastIndexOf(".") + 1);
			// 		}
			// 		m_newObjTypeNameList.Add(typeName);
			// 		m_newObjTypeCanSelectIdList.Add(i);
			// 	}
			// }
			
		}



		if (m_newObj != null && GUILayout.Button("Add"))
		{
			// string typeName = m_totalTypeNameList[m_newSelectedId].ToString();
			// if(typeName.Contains(".")){
			// 	typeName = typeName.Substring(typeName.LastIndexOf(".") + 1);
			// }
			// ComponentCache.Object_Injection injection = new ComponentCache.Object_Injection();
			// injection.typeName = typeName;
			// injection.name = m_newObjName;
			// injection.value = this.TryGetComponent(m_newObj, m_totalTypeNameList[m_newSelectedId]);
			// m_cache.objectList.Add(injection);
			if(string.IsNullOrEmpty(m_newObjName)){
				m_newObjName = m_newObj.name;
			}
			this.AddToRightList(m_newObj);
			m_newObjName = string.Empty;
			m_newObj = null;
		}
		if (m_newObj != null && GUILayout.Button("Delete")){
			m_newObjName = string.Empty;
			m_newObj = null;
		}
		EditorGUILayout.EndHorizontal();
		EditorGUI.indentLevel--;
	}

	public override void OnInspectorGUI ()
	{
		this.CacheNewComponent();
		EditorGUILayout.LabelField("Cached Components:", EditorStyles.boldLabel);
		EditorGUI.indentLevel++;
		if(this.GetBindedComponentsCount() == 0){
			EditorGUILayout.HelpBox("No components cached yet!", MessageType.Info);
		// if(m_cache.objectList.Count == 0){
		// 	EditorGUILayout.HelpBox("No components cached yet!", MessageType.Info);
		}else{
			// this.CalcAllCompoentCount();
			// for (int i = 0; i < m_totalTypeNameList.Count; i++)
			// {
			// 	string typeName = m_totalTypeNameList[i].ToString();
			// 	if(typeName.Contains(".")){
			// 		typeName = typeName.Substring(typeName.LastIndexOf(".") + 1);
			// 	}
			// 	this.RendComponentList(typeName, m_totalTypeNameList[i], m_cache.objectList);	
			// }
			this.ShowComponentList<ComponentCache.GameObject_Injection, GameObject>("GameObject", m_cache.gameObjectList);
			this.ShowComponentList<ComponentCache.Transform_Injection,Transform>("Transform", m_cache.transformList);
			this.ShowComponentList<ComponentCache.RectTransform_Injection,RectTransform>("RectTransform", m_cache.rectTransformList);
			this.ShowComponentList<ComponentCache.Image_Injection,Image>("Image", m_cache.imageList);
			this.ShowComponentList<ComponentCache.Text_Injection,Text>("Text", m_cache.textList);
			this.ShowComponentList<ComponentCache.Toggle_Injection,Toggle>("Toggle", m_cache.toggleList);
			this.ShowComponentList<ComponentCache.Button_Injection,Button>("Button", m_cache.buttonList);
			this.ShowComponentList<ComponentCache.Slider_Injection,Slider>("Slider", m_cache.sliderList);
			this.ShowComponentList<ComponentCache.ToggleGroup_Injection,ToggleGroup>("ToggleGroup", m_cache.toggleGroupList);
			this.ShowComponentList<ComponentCache.InputField_Injection,InputField>("InputField", m_cache.inputFieldList);
			this.ShowComponentList<ComponentCache.Graphic_Injection,Graphic>("Graphic", m_cache.graphicList);
			this.ShowComponentList<ComponentCache.ScrollRect_Injection,ScrollRect>("ScrollRect", m_cache.scrollRectList);
			this.ShowComponentList<ComponentCache.Scrollbar_Injection,Scrollbar>("Scrollbar", m_cache.scrollbarList);
			this.ShowComponentList<ComponentCache.Dropdown_Injection,Dropdown>("Dropdown", m_cache.dropdownList);
			this.ShowComponentList<ComponentCache.GridLayoutGroup_Injection,GridLayoutGroup>("GridLayoutGroup", m_cache.gridLayoutGroupList);
			this.ShowComponentList<ComponentCache.RawImage_Injection,RawImage>("RawImage", m_cache.rawImageList);
			this.ShowComponentList<ComponentCache.AudioSource_Injection,AudioSource>("AudioSource", m_cache.audioSourceList);
			this.ShowComponentList<ComponentCache.Animation_Injection,Animation>("Animation", m_cache.animationList);
			this.ShowComponentList<ComponentCache.Animator_Injection,Animator>("Animator", m_cache.animatorList);
			this.ShowComponentList<ComponentCache.SpriteAtlas_Injection,SpriteAtlas>("SpriteAtlas", m_cache.spriteAtlasList);
			this.ShowComponentList<ComponentCache.SpriteHolder_Injection,SpriteHolder>("SpriteHolder", m_cache.spriteHolderList);
			this.ShowComponentList<ComponentCache.UIStateSwitcher_Injection,UIStateSwitcher>("UIStateSwitcher", m_cache.uiStateSwitcherList);
			this.ShowComponentList<ComponentCache.TextWrap_Injection,TextWrap>("TextWrap", m_cache.textWrapList);
			this.ShowComponentList<ComponentCache.UIImageAnimation_Injection,UIImageAnimation>("UIImageAnimation", m_cache.uiImageAnimList);
			this.ShowComponentList<ComponentCache.ComponentCache_Injection,ComponentCache>("ComponentCache", m_cache.cacheList);
		}
	}

}


[InitializeOnLoad]
public class ComponentCacheHierarkiView
{
	static ComponentCacheHierarkiView()
	{
		EditorApplication.hierarchyWindowItemOnGUI += HierarchWindowOnGUI;
	}
	
	static void HierarchWindowOnGUI (int instanceID, Rect selectionRect)
	{
		selectionRect.x += selectionRect.width - 30;
		selectionRect.width = 15;

		// Go through state switchers and draw on targets
		var allComponentCaches = ComponentCache.GetAllComponentCaches();

		for (int i = 0; i < allComponentCaches.Count; i++)
		{
			var componentCache = allComponentCaches[i];
			// foreach (var item in ComponentCacheEditor.m_totalTypeNameList)
			// {
			// 	string typeName = item.ToString();
			// 	if(typeName.Contains(".")){
			// 		typeName = typeName.Substring(typeName.LastIndexOf(".") + 1);
			// 	}
			// 	RenderObjectInjection(instanceID, selectionRect, componentCache, typeName, componentCache.objectList);
			// }
			RenderInjection<ComponentCache.GameObject_Injection,GameObject>(instanceID, selectionRect, componentCache, "GameObject", componentCache.gameObjectList);
			RenderInjection<ComponentCache.Transform_Injection,Transform>(instanceID, selectionRect, componentCache, "Transform", componentCache.transformList);
			RenderInjection<ComponentCache.RectTransform_Injection,RectTransform>(instanceID, selectionRect, componentCache, "RectTransform", componentCache.rectTransformList);
			RenderInjection<ComponentCache.Image_Injection,Image>(instanceID, selectionRect, componentCache, "Image", componentCache.imageList);
			RenderInjection<ComponentCache.Text_Injection,Text>(instanceID, selectionRect, componentCache, "Text", componentCache.textList);
			RenderInjection<ComponentCache.Toggle_Injection,Toggle>(instanceID, selectionRect, componentCache, "Toggle", componentCache.toggleList);
			RenderInjection<ComponentCache.Button_Injection,Button>(instanceID, selectionRect, componentCache, "Button", componentCache.buttonList);
			RenderInjection<ComponentCache.Slider_Injection,Slider>(instanceID, selectionRect, componentCache, "Slider", componentCache.sliderList);
			RenderInjection<ComponentCache.ToggleGroup_Injection,ToggleGroup>(instanceID, selectionRect, componentCache, "ToggleGroup", componentCache.toggleGroupList);
			RenderInjection<ComponentCache.InputField_Injection,InputField>(instanceID, selectionRect, componentCache, "InputField", componentCache.inputFieldList);
			RenderInjection<ComponentCache.Graphic_Injection,Graphic>(instanceID, selectionRect, componentCache, "Graphic", componentCache.graphicList);
			RenderInjection<ComponentCache.ScrollRect_Injection,ScrollRect>(instanceID, selectionRect, componentCache, "ScrollRect", componentCache.scrollRectList);
			RenderInjection<ComponentCache.Scrollbar_Injection,Scrollbar>(instanceID, selectionRect, componentCache, "Scrollbar", componentCache.scrollbarList);
			RenderInjection<ComponentCache.Dropdown_Injection,Dropdown>(instanceID, selectionRect, componentCache, "Dropdown", componentCache.dropdownList);
			RenderInjection<ComponentCache.GridLayoutGroup_Injection,GridLayoutGroup>(instanceID, selectionRect, componentCache, "GridLayoutGroup", componentCache.gridLayoutGroupList);
			RenderInjection<ComponentCache.RawImage_Injection,RawImage>(instanceID, selectionRect, componentCache, "RawImage", componentCache.rawImageList);
			RenderInjection<ComponentCache.AudioSource_Injection,AudioSource>(instanceID, selectionRect, componentCache, "AudioSource", componentCache.audioSourceList);
			RenderInjection<ComponentCache.Animation_Injection,Animation>(instanceID, selectionRect, componentCache, "Animation", componentCache.animationList);
			RenderInjection<ComponentCache.Animator_Injection,Animator>(instanceID, selectionRect, componentCache, "Animator", componentCache.animatorList);
			RenderInjection<ComponentCache.SpriteAtlas_Injection,SpriteAtlas>(instanceID, selectionRect, componentCache, "SpriteAtlas", componentCache.spriteAtlasList);
			RenderInjection<ComponentCache.SpriteHolder_Injection,SpriteHolder>(instanceID, selectionRect, componentCache, "SpriteHolder", componentCache.spriteHolderList);
			RenderInjection<ComponentCache.UIStateSwitcher_Injection,UIStateSwitcher>(instanceID, selectionRect, componentCache, "UIStateSwitcher", componentCache.uiStateSwitcherList);
			RenderInjection<ComponentCache.TextWrap_Injection,TextWrap>(instanceID, selectionRect, componentCache, "TextWrap", componentCache.textWrapList);
			RenderInjection<ComponentCache.UIImageAnimation_Injection,UIImageAnimation>(instanceID, selectionRect, componentCache, "UIImageAnimation", componentCache.uiImageAnimList);
			RenderInjection<ComponentCache.ComponentCache_Injection,ComponentCache>(instanceID, selectionRect, componentCache, "ComponentCache", componentCache.cacheList);
		}
	}

	static void RenderInjection<T, U>(int instanceID, Rect selectionRect, ComponentCache cache, string title, List<T> list)where U:UnityEngine.Object
	{
		if(cache == null || list == null){
			return;
		}
		for (int j = 0; j < list.Count; j++)
		{
			var injection = list[j] as ComponentCache.Injection<U>;
			if (injection == null || injection.value == null)
				continue;

			if (injection.value.GetInstanceID() != instanceID){
				var com = injection.value as Component;
				if(com == null){
					continue;
				}
				var go = com.gameObject;
				if(go == null){
					continue;
				}
				if(go.GetInstanceID() != instanceID){
					continue;
				}
			}
				

			// Draw button that will ping the state switcher
			if (GUI.Button(selectionRect, new GUIContent("cc", string.Format("cached for {0}",title)), EditorStyles.label))
			{
				//EditorGUIUtility.PingObject(injection.value.GetInstanceID());
				EditorGUIUtility.PingObject(cache.GetInstanceID());
			}
		}
	}

	// static void RenderObjectInjection(int instanceID, Rect selectionRect, ComponentCache cache, string title, List<ComponentCache.Object_Injection> list)
	// {
	// 	for (int j = 0; j < list.Count; j++)
	// 	{
	// 		var injection = list[j];
	// 		if (injection == null || injection.value == null)
	// 			continue;
	// 		if (injection.value.GetInstanceID() != instanceID)
	// 			continue;

	// 		// Draw button that will ping the state switcher
	// 		if (GUI.Button(selectionRect, new GUIContent("cc", string.Format("cached for {0}",title)), EditorStyles.label))
	// 		{
	// 			//EditorGUIUtility.PingObject(injection.value.GetInstanceID());
	// 			EditorGUIUtility.PingObject(cache.GetInstanceID());
	// 		}
	// 	}
	// }
}