

using UnityEngine;
using System.Collections;
using UnityEngine.UI;

[ExecuteInEditMode]
public class ImageReverseActive : MonoBehaviour {
    private Image mImage;

    void Awake() {
        mImage = GetComponent<Image>();
    }

    public void SetReverseActive(bool toggleState) {
        if (mImage != null) {
            mImage.enabled = !toggleState;
        }
    }
}
