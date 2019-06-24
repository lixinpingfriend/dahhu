using UnityEngine;
using System.Collections;

public static class TransformUtil  {

    public static void SetX(this Transform transform, float x, bool setLocalPosition = true)
    {
        if (setLocalPosition)
        {
            transform.localPosition = new Vector3(x, transform.localPosition.y, transform.localPosition.z);
        }
        else
        {
            transform.position = new Vector3(x, transform.position.y, transform.position.z);
        }
    }

    public static void SetY(this Transform transform, float y, bool setLocalPosition = true)
    {
        if (setLocalPosition) {
            transform.localPosition = new Vector3(transform.localPosition.x, y, transform.localPosition.z);
        } else {
            transform.position = new Vector3(transform.position.x, y, transform.position.z);
        }
    }

    public static void SetZ(this Transform transform, float z, bool setLocalPosition = true) {
        if (setLocalPosition) {
            transform.localPosition = new Vector3(transform.localPosition.x, transform.localPosition.y, z);
        } else {
            transform.position = new Vector3(transform.position.x, transform.position.y, z);
        }
    }

    public static void AddX(this Transform transform, float x, bool setLocalPosition = true) {
        if (setLocalPosition) {
            transform.localPosition = new Vector3(transform.localPosition.x + x, transform.localPosition.y, transform.localPosition.z);
        } else {
            transform.position = new Vector3(transform.position.x + x, transform.position.y, transform.position.z);
        }
    }

    public static void AddY(this Transform transform, float y, bool setLocalPosition = true) {
        if (setLocalPosition) {
            transform.localPosition = new Vector3(transform.localPosition.x, transform.localPosition.y + y, transform.localPosition.z);
        } else {
            transform.position = new Vector3(transform.position.x, transform.position.y + y, transform.position.z);
        }
    }

    public static void AddZ(this Transform transform, float z, bool setLocalPosition = true) {
        if (setLocalPosition) {
            transform.localPosition = new Vector3(transform.localPosition.x, transform.localPosition.y, transform.localPosition.z + z);
        } else {
            transform.position = new Vector3(transform.position.x, transform.position.y, transform.position.z + z);
        }
    }

    public static void SetAnchoredPositionX(Transform transform, float x) {
        RectTransform rectTransform = transform as RectTransform;
        rectTransform.anchoredPosition = new Vector2(x, rectTransform.anchoredPosition.y);
    }

    public static void SetAnchoredPositionY(Transform transform, float y) {
        RectTransform rectTransform = transform as RectTransform;
        rectTransform.anchoredPosition = new Vector2(rectTransform.anchoredPosition.x, y);
    }

    public static void SetAnchoredPosition(Transform transform, float x, float y) {
        RectTransform rectTransform = transform as RectTransform;
        rectTransform.anchoredPosition = new Vector2(x, y);
    }

    public static void SetSizeDeltaX(this Transform transform, float x) {
        RectTransform rectTransform = transform as RectTransform;
        rectTransform.sizeDelta = new Vector2(x, rectTransform.sizeDelta.y);
    }

    public static void SetSizeDeltaY(this Transform transform, float y) {
        RectTransform rectTransform = transform as RectTransform;
        rectTransform.sizeDelta = new Vector2(rectTransform.sizeDelta.x, y);
    }

    public static void SetSizeDelta(this Transform transform, float x, float y) {
        RectTransform rectTransform = transform as RectTransform;
        rectTransform.sizeDelta = new Vector2(x, y);
    }
}
