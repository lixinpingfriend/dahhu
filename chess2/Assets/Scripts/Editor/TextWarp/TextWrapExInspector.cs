using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine.UI;

[CustomEditor(typeof(TextWrapEx))]
[CanEditMultipleObjects]
public class TextWrapExInspector : Editor
{

	public override void OnInspectorGUI()
    {
        TextWrapEx target_ = (TextWrapEx)target;

        EditorTools.SetLabelWidth(80);

        if (Application.isPlaying)
        {
            EditorGUILayout.IntField(target_.num);
        }
        else
        {
            target_.num=EditorGUILayout.IntField(target_.num);
        }        
        target_.NumCount = EditorGUILayout.IntField("最大位数", target_.NumCount);
        target_.interval = EditorGUILayout.FloatField("字间间隔", target_.interval);
        target_.mode = (TextWrap.WrapMode)EditorGUILayout.EnumPopup("显示方式", target_.mode);        
        target_.atlas = EditorGUILayout.ObjectField("图集",target_.atlas,typeof(SpriteAtlas), true) as SpriteAtlas;
        target_.imageSize = EditorGUILayout.Vector2Field("图片尺寸",target_.imageSize); 
    }
}
