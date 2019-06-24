using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.EventSystems;
using UnityEngine.UI;
using LuaInterface;

public class ComponentCache : MonoBehaviour
{
    public string group;

    [System.Serializable]
    public class Injection<T>
    {
        public string name;
        public T value;
    }
    
    public Dictionary<string, Object> commonObjects;

    [System.Serializable]
    public class GameObject_Injection : Injection<GameObject> { }
    public List<GameObject_Injection> gameObjectList;

    [System.Serializable]
    public class Transform_Injection : Injection<Transform> { }
    public List<Transform_Injection> transformList;

    [System.Serializable]
    public class RectTransform_Injection : Injection<RectTransform> { }
    public List<RectTransform_Injection> rectTransformList;

    [System.Serializable]
    public class Image_Injection : Injection<Image> { }
    public List<Image_Injection> imageList;

    [System.Serializable]
    public class InputField_Injection : Injection<InputField> { }
    public List<InputField_Injection> inputFieldList;

    [System.Serializable]
    public class Text_Injection : Injection<Text> { }
    public List<Text_Injection> textList;

    [System.Serializable]
    public class Toggle_Injection : Injection<Toggle> { }
    public List<Toggle_Injection> toggleList;

    [System.Serializable]
    public class ToggleEvent_Injection : Injection<Toggle.ToggleEvent> { }
    public List<ToggleEvent_Injection> toggleEventList;

    [System.Serializable]
    public class Button_Injection : Injection<Button> { }
    public List<Button_Injection> buttonList;

    [System.Serializable]
    public class Slider_Injection : Injection<Slider> { }
    public List<Slider_Injection> sliderList;

    [System.Serializable]
    public class ToggleGroup_Injection : Injection<ToggleGroup> { }
    public List<ToggleGroup_Injection> toggleGroupList;


    [System.Serializable]
    public class Graphic_Injection : Injection<Graphic> { }
    public List<Graphic_Injection> graphicList;

    [System.Serializable]
    public class ScrollRect_Injection : Injection<ScrollRect> { }
    public List<ScrollRect_Injection> scrollRectList;

    [System.Serializable]
    public class Scrollbar_Injection : Injection<Scrollbar> { }
    public List<Scrollbar_Injection> scrollbarList;

    [System.Serializable]
    public class Dropdown_Injection : Injection<Dropdown> { }
    public List<Dropdown_Injection> dropdownList;

    [System.Serializable]
    public class GridLayoutGroup_Injection : Injection<GridLayoutGroup> { }
    public List<GridLayoutGroup_Injection> gridLayoutGroupList;

    [System.Serializable]
    public class RawImage_Injection : Injection<RawImage> { }
    public List<RawImage_Injection> rawImageList;

    [System.Serializable]
    public class AudioSource_Injection : Injection<AudioSource> { }
    public List<AudioSource_Injection> audioSourceList;


    [System.Serializable]
    public class TweenButton_Injection : Injection<TweenButton> { }
    public List<TweenButton_Injection> tweenButtonScaleList;



    [System.Serializable]
    public class Animation_Injection : Injection<Animation> { }
    public List<Animation_Injection> animationList;


    [System.Serializable]
    public class Animator_Injection : Injection<Animator> { }
    public List<Animator_Injection> animatorList;

    [System.Serializable]
    public class SpriteAtlas_Injection : Injection<SpriteAtlas> { }
    public List<SpriteAtlas_Injection> spriteAtlasList;


    [System.Serializable]
    public class SpriteHolder_Injection : Injection<SpriteHolder> { }
    public List<SpriteHolder_Injection> spriteHolderList;

    [System.Serializable]
    public class UIStateSwitcher_Injection : Injection<UIStateSwitcher> { }
    public List<UIStateSwitcher_Injection> uiStateSwitcherList;

    [System.Serializable]
    public class TextWrap_Injection : Injection<TextWrap> { }
    public List<TextWrap_Injection> textWrapList;

    [System.Serializable]
    public class UIImageAnimation_Injection : Injection<UIImageAnimation> { }
    public List<UIImageAnimation_Injection> uiImageAnimList;

    [System.Serializable]
    public class Canvas_Injection : Injection<Canvas> { }
    public List<Canvas_Injection> canvasList;

    [System.Serializable]
    public class ParticleSystem_Injection : Injection<ParticleSystem> { }
    public List<ParticleSystem_Injection> particleSystemList;

    [System.Serializable]
    public class ParticleSystemRenderer_Injection : Injection<ParticleSystemRenderer> { }
    public List<ParticleSystemRenderer_Injection> particleSystemRendererList;

    [System.Serializable]
    public class ComponentCache_Injection : Injection<ComponentCache> { }
    public List<ComponentCache_Injection> cacheList;

    static List<ComponentCache> _allComponentCaches = new List<ComponentCache>();

    [NoToLua]
    public static List<ComponentCache> GetAllComponentCaches()
    {
        return _allComponentCaches;
    }

    [NoToLua]
    public void OnValidate()
    {
        // Add to global switcher list if needed
        if (!_allComponentCaches.Contains(this))
            _allComponentCaches.Add(this);

        // Clean up any deleted state switchers
        _allComponentCaches.RemoveAll((s) => (s == null));
    }

    public void SetCommonObject(string key, Object value)
    {
        commonObjects = commonObjects ?? new Dictionary<string, Object>();
        if (commonObjects.ContainsKey(key))
        {
            commonObjects.Add(key, value);
        }
        else
        {
            commonObjects[key] = value;
        }
    }
    
    public void SetCommonObjectToLua(LuaTable table)
    {
        var tableTmp = table;
        if (!string.IsNullOrEmpty(group)) {
            tableTmp = (LuaTable)table[group];
            if (tableTmp == null) {
                table.AddTable(group);
                tableTmp = (LuaTable)table[group];
            }
        }
        
        if (commonObjects != null) {
            foreach (var item in commonObjects) {
                tableTmp[item.Key] = item.Value;
            }
        }
    }

    public void SetCacheToLua(LuaTable table) {
        var tableTmp = table;
        if (!string.IsNullOrEmpty(group)) {
            tableTmp = (LuaTable)table[group];
            if (tableTmp == null) {
                table.AddTable(group);
                tableTmp = (LuaTable)table[group];
            }
        }

        if (gameObjectList != null) {
            foreach (var item in gameObjectList) {
                tableTmp[item.name] = item.value;
            }
        }

        if (transformList != null) {
            foreach (var item in transformList) {
                tableTmp[item.name] = item.value;
            }
        }

        if (rectTransformList != null) {
            foreach (var item in rectTransformList) {
                tableTmp[item.name] = item.value;
            }
        }

        if (imageList != null) {
            foreach (var item in imageList) {
                tableTmp[item.name] = item.value;
            }
        }

        if (inputFieldList != null) {
            foreach (var item in inputFieldList) {
                tableTmp[item.name] = item.value;
            }
        }      

        if (textList != null) {
            foreach (var item in textList) {
                tableTmp[item.name] = item.value;
            }
        }

        if (toggleList != null) {
            foreach (var item in toggleList) {
                tableTmp[item.name] = item.value;
            }
        }

        if (buttonList != null) {
            foreach (var item in buttonList) {
                tableTmp[item.name] = item.value;
            }
        }

        if (sliderList != null) {
            foreach (var item in sliderList) {
                tableTmp[item.name] = item.value;
            }
        }

        if (toggleGroupList != null) {
            foreach (var item in toggleGroupList) {
                tableTmp[item.name] = item.value;
            }
        }

        if (scrollRectList != null) {
            foreach (var item in scrollRectList) {
                tableTmp[item.name] = item.value;
            }
        }

        if (scrollbarList != null) {
            foreach (var item in scrollbarList) {
                tableTmp[item.name] = item.value;
            }
        }

        if (dropdownList != null) {
            foreach (var item in dropdownList) {
                tableTmp[item.name] = item.value;
            }
        }

        if (rawImageList != null) {
            foreach (var item in rawImageList) {
                tableTmp[item.name] = item.value;
            }
        } 

        if (audioSourceList != null) {
            foreach (var item in audioSourceList) {
                tableTmp[item.name] = item.value;
            }
        } 


        if (tweenButtonScaleList != null) {
            foreach (var item in tweenButtonScaleList) {
                tableTmp[item.name] = item.value;
            }
        } 


        if (animationList != null) {
            foreach (var item in animationList) {
                tableTmp[item.name] = item.value;
            }
        } 

        if (animatorList != null) {
            foreach (var item in animatorList) {
                tableTmp[item.name] = item.value;
            }
        }

        if (spriteAtlasList != null) {
            foreach (var item in spriteAtlasList) {
                tableTmp[item.name] = item.value;
            }
        }

        if (spriteHolderList != null) {
            foreach (var item in spriteHolderList) {
                tableTmp[item.name] = item.value;
            }
        }

        if (uiStateSwitcherList != null) {
            foreach (var item in uiStateSwitcherList) {
                tableTmp[item.name] = item.value;
            }
        }

        if (textWrapList != null) {
            foreach (var item in textWrapList) {
                tableTmp[item.name] = item.value;
            }
        }

        if (uiImageAnimList != null) {
            foreach (var item in uiImageAnimList) {
                tableTmp[item.name] = item.value;
            }
        }

        if (canvasList != null) {
            foreach (var item in canvasList) {
                tableTmp[item.name] = item.value;
            }
        }

        if (particleSystemList != null) {
            foreach (var item in particleSystemList) {
                tableTmp[item.name] = item.value;
            }
        }

        if (particleSystemRendererList != null) {
            foreach (var item in particleSystemRendererList) {
                tableTmp[item.name] = item.value;
            }
        }

        if (cacheList != null) {
            foreach (var item in cacheList) {
                tableTmp[item.name] = item.value;
            }
        }
        
        if (commonObjects != null) {
            foreach (var item in commonObjects) {
                tableTmp[item.Key] = item.Value;
            }
        }
    }


}