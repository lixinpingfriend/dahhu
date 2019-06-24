using UnityEngine;
using System.Collections;
using System.Collections.Generic;


#if UNITY_EDITOR
using UnityEditor;
#endif
using UnityEngine.UI;

[CustomEditor(typeof(TextWrap))]
[CanEditMultipleObjects]
public class TextWrapInspector : Editor
{

	public override void OnInspectorGUI()
    {
        TextWrap target_ = (TextWrap)target;

        EditorTools.SetLabelWidth(80);

        target_.text = EditorGUILayout.TextArea(target_.text);
        target_.NumCount = EditorGUILayout.IntField("最大位数", target_.NumCount);
        target_.interval = EditorGUILayout.FloatField("字间间隔", target_.interval);
        target_.mode = (TextWrap.WrapMode)EditorGUILayout.EnumPopup("显示方式", target_.mode);        
        target_.atlas = EditorGUILayout.ObjectField("图集",target_.atlas,typeof(SpriteAtlas), true) as SpriteAtlas;
        target_.ImageSize = EditorGUILayout.Vector2Field("图片尺寸",target_.ImageSize); 
    }
}
