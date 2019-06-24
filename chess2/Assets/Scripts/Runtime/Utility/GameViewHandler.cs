using UnityEngine;
using UnityEngine.UI;

/// <summary>
/// 检测编辑器分辨率改变后,相应的更改CanvasScaler的match值
/// </summary>
[ExecuteInEditMode]
public class GameViewHandler : MonoBehaviour
{
    #if UNITY_EDITOR
    private CanvasScaler canvaScaler;
    private float lastwidth = 0f;
    private float lastheight = 0f;

    private void OnGUI()
    {
        if (canvaScaler == null) {
            canvaScaler = GameObject.Find("GameRoot/Game/UIRoot/UIWindowParent/Canvas/TestWindow").GetComponent<CanvasScaler>();
        }
        if (lastwidth != Screen.width || lastheight != Screen.height)
        {            
            lastwidth = Screen.width;
            lastheight = Screen.height;

            

            if (Screen.width >= 1920) {
                canvaScaler.referenceResolution = new Vector2(1920, 1080);
            } else {
                canvaScaler.referenceResolution = new Vector2(1280, 720);
            }

            if (UnityEngine.Screen.width * 1.0 / UnityEngine.Screen.height > 1.8) {
                canvaScaler.matchWidthOrHeight = 1;
            } else {
                canvaScaler.matchWidthOrHeight = 0;
            }
        }
    }
    #endif
}