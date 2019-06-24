using System;
using UnityEngine;
using System.Collections;
using GameAsset;
using UnityEngine.UI;
using Object = UnityEngine.Object;

public static class ViewUtil
{

    public static Sprite GetSpriteFromeAssetBundle(string assetBundlePath, string assetName)
    {
        var loadedAssetBundle = AssetBundleManager.instance.LoadAssetBundle(assetBundlePath);
        if (loadedAssetBundle == null)
        {
            return null;
        }
        Sprite sprite = null;
        try
        {
            sprite = loadedAssetBundle.GetAsset<Sprite>(assetName, false);
        }
        catch (System.Exception ex)
        {
            Debug.LogException(ex);
        }
        return sprite;
    }

    public static GameObject InitViewGameObject(string assetBundlePath, string assetName, int showLayer)
    {
        var loadedAssetBundle = AssetBundleManager.instance.LoadAssetBundle(assetBundlePath);
        GameObject go = Object.Instantiate(loadedAssetBundle.GetAsset<GameObject>(assetName, false));

        InitCanvas(go, showLayer);
    #if UNITY_EDITOR
        UnityEditor.Selection.activeGameObject = go;
    #endif
        return go;
    }
    
    public static void InitViewGameObjectAsync(string assetBundlePath, string assetName, int showLayer, Action<GameObject> initedCallback)
    {   
        AssetBundleManager.instance.LoadAssetBundleAsync(assetBundlePath, assetName, x =>
        {
            x.GetAssetAsync<GameObject>(assetName, false, y =>
            {
                GameObject go = Object.Instantiate(y);
                InitCanvas(go, showLayer);
#if UNITY_EDITOR
                UnityEditor.Selection.activeGameObject = go;
#endif
                if (initedCallback != null){
                    initedCallback(go);
                }
            });

        });
    }
    
    
    public static GameObject InitGameObject(string assetBundlePath, string assetName, GameObject parent)
    {
        var loadedAssetBundle = AssetBundleManager.instance.LoadAssetBundle(assetBundlePath);
        GameObject go = Object.Instantiate(loadedAssetBundle.GetAsset<GameObject>(assetName, false));

        if (!go)
        {
            Debug.LogError("实例化的物体为空");
            return null;
        }
        go.transform.SetParent(parent.transform, false);
        go.transform.localPosition = Vector3.zero;
#if UNITY_EDITOR
        UnityEditor.Selection.activeGameObject = go;
#endif
        //go.transform.localScale = Vector3.one;
        //go.transform.localEulerAngles = Vector3.zero;

        return go;
    }

    //初始化牌桌
    public static GameObject InitTable(string assetBundlePath, string assetName)
    {
        var loadedAssetBundle = AssetBundleManager.instance.LoadAssetBundle(assetBundlePath);
        GameObject go = Object.Instantiate(loadedAssetBundle.GetAsset<GameObject>(assetName, false));
#if UNITY_EDITOR
        UnityEditor.Selection.activeGameObject = go;
#endif
        return go;
    }

    public static void InitCanvas(GameObject viewGameObject, int showLayer)
    {
        string sortingLayerName = "";
        Transform parent = null;
        if (showLayer == 0)
        {
            sortingLayerName = "UILow";
            parent = GameRoot.instance.ui.canvasLow;
        }
        else if (showLayer == 1)
        {
            sortingLayerName = "UIMiddle";
            parent = GameRoot.instance.ui.canvasMiddle;
        }
        else if (showLayer == 2)
        {
            sortingLayerName = "UIHigh";
            parent = GameRoot.instance.ui.canvasHigh;
        }
        else if (showLayer == 3)
        {
            sortingLayerName = "UIHighest";
            parent = GameRoot.instance.ui.canvasHighest;
        }
        //DeviceManager.instance.ScreenSmartScaleWidth();
        RectTransform rectTransform = viewGameObject.GetComponent<RectTransform>();
        rectTransform.SetParentAndNormalize(parent);
        var canvas = viewGameObject.AddUniqueComponent<Canvas>();   //需要添加Canvas
        SetCanvasData(viewGameObject.transform, canvas);
        canvas.sortingLayerName = sortingLayerName;
        canvas.renderMode = RenderMode.WorldSpace;
        canvas.worldCamera = GameRoot.instance.ui.uiCamera;
        canvas.additionalShaderChannels = AdditionalCanvasShaderChannels.TexCoord1;//为了显示emoji表情,这里不能为none

        rectTransform.sizeDelta = GameRoot.instance.ui.canvasSizeDelta;
        viewGameObject.AddUniqueComponent<GraphicRaycaster>();
    }

    public static void SetCanvasData(Transform viewTransform, Canvas canvas)
    {
        int index = viewTransform.GetSiblingIndex();

        while (index > 0)
        {
            //不直接使用SiblingIndex是因为前面的View有可能会销毁，打乱了Canvas的排序
            var canvasTmp = viewTransform.parent.GetChild(--index).GetComponent<Canvas>();
            if (canvasTmp != null && canvasTmp.gameObject.activeSelf)
            {
                canvas.sortingOrder = canvasTmp.sortingOrder + 10;
                viewTransform.GetComponent<RectTransform>().transform.SetZ(canvas.sortingOrder * 20);
                return;
            }
        }
        canvas.sortingOrder = 0;
    }

    public static void ShowTop(GameObject viewGameObject)
    {
        viewGameObject.transform.SetAsLastSibling();
        SetCanvasData(viewGameObject.transform, viewGameObject.GetComponent<Canvas>());
        if (!viewGameObject.activeSelf) {
            viewGameObject.SetActive(true);
        }
    }

    //重新设置Canvas的排序和粒子效果的排序
    static void BaseOverrideSortingCanvas()
    {

    }


}
