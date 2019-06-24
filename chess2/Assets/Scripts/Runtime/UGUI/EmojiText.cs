using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text.RegularExpressions;
using System.Text;
using System;
using System.Globalization;

public class EmojiText : Text {

	private const bool EMOJI_LARGE = true;
	private Dictionary<string,EmojiInfo> EmojiIndex = null;

    readonly UIVertex[] m_TempVerts = new UIVertex[4];
	protected override void OnPopulateMesh(VertexHelper toFill)
	{
		if (font == null)
		    return;
		if (EmojiIndex == null) {
            EmojiIndex = EmojiUtil.EmojiIndex;
		}
        if(EmojiIndex == null || EmojiIndex.Count == 0)
        {
            base.OnPopulateMesh(toFill);
            return;
        }
        Dictionary<int,EmojiInfo> emojiDic = new Dictionary<int, EmojiInfo> ();
        string resultText = string.Empty;
        if (supportRichText)
        {
            List<EmojiElement> emojiList = EmojiUtil.getEmojiList(text,out resultText);
            //Debug.Log("resultText:"+ resultText+",len:"+ resultText.Length);
            //Debug.Log("emojiList:"+ emojiList.Count);
            for (int i = 0, length= emojiList.Count; i < length; i++)
            {
                EmojiElement element = emojiList[i];
                if (element.isEmoji)
                {
                    EmojiInfo info;
                    string unicodeValue = element.unicode;
                    //Debug.Log("unicodeValue:" + unicodeValue + ",i:" + i);
                    if (EmojiIndex.TryGetValue(unicodeValue, out info))
                    {
                        //Debug.Log("1 unicodeValue:" + unicodeValue);
                        info.len = 1;
                        emojiDic.Add(i, info);
                    }
                }
            }
		}

		// We don't care if we the font Texture changes while we are doing our Update.
		// The end result of cachedTextGenerator will be valid for this instance.
		// Otherwise we can get issues like Case 619238.
		m_DisableFontTextureRebuiltCallback = true;

		Vector2 extents = rectTransform.rect.size;

		var settings = GetGenerationSettings(extents);
        if (supportRichText && !string.IsNullOrEmpty(resultText))
        {
            cachedTextGenerator.Populate(resultText, settings);
        }
        else
        {
            cachedTextGenerator.Populate(text, settings);
        }

		Rect inputRect = rectTransform.rect;

		// get the text alignment anchor point for the text in local space
		Vector2 textAnchorPivot = GetTextAnchorPivot(alignment);
		Vector2 refPoint = Vector2.zero;
		refPoint.x = Mathf.Lerp(inputRect.xMin, inputRect.xMax, textAnchorPivot.x);
		refPoint.y = Mathf.Lerp(inputRect.yMin, inputRect.yMax, textAnchorPivot.y);

		// Determine fraction of pixel to offset text mesh.
		Vector2 roundingOffset = PixelAdjustPoint(refPoint) - refPoint;

		// Apply the offset to the vertices
		IList<UIVertex> verts = cachedTextGenerator.verts;
		float unitsPerPixel = 1 / pixelsPerUnit;
		//Last 4 verts are always a new line...
		int vertCount = verts.Count - 4;
        //Debug.Log("verts:" + verts.Count);
		toFill.Clear();
		if (roundingOffset != Vector2.zero)
		{
		    for (int i = 0; i < vertCount; ++i)
		    {
		        int tempVertsIndex = i & 3;
		        m_TempVerts[tempVertsIndex] = verts[i];
		        m_TempVerts[tempVertsIndex].position *= unitsPerPixel;
		        m_TempVerts[tempVertsIndex].position.x += roundingOffset.x;
		        m_TempVerts[tempVertsIndex].position.y += roundingOffset.y;
		        if (tempVertsIndex == 3)
		            toFill.AddUIVertexQuad(m_TempVerts);
		    }
		}
		else
		{
            float repairDistance = 0;
			float repairDistanceHalf = 0;
			float repairY = 0;
			if (vertCount > 0) {
				repairY = verts [3].position.y;
			}
			for (int i = 0; i < vertCount; ++i) {
				EmojiInfo info;
				int index = i / 4;
                if (emojiDic.TryGetValue (index, out info)) {
					//compute the distance of '[' and get the distance of emoji 
					float charDis = (verts [i + 1].position.x - verts [i].position.x) * 3;
					m_TempVerts [3] = verts [i];//1
					m_TempVerts [2] = verts [i + 1];//2
					m_TempVerts [1] = verts [i + 2];//3
					m_TempVerts [0] = verts [i + 3];//4

					//the real distance of an emoji
					m_TempVerts [2].position += new Vector3 (charDis, 0, 0);
					m_TempVerts [1].position += new Vector3 (charDis, 0, 0);

					//make emoji has equal width and height
					float fixValue = (m_TempVerts [2].position.x - m_TempVerts [3].position.x - (m_TempVerts [2].position.y - m_TempVerts [1].position.y));
					m_TempVerts [2].position -= new Vector3 (fixValue, 0, 0);
					m_TempVerts [1].position -= new Vector3 (fixValue, 0, 0);

					float curRepairDis = 0;
					if (verts [i].position.y < repairY) {// to judge current char in the same line or not
						repairDistance = repairDistanceHalf;
						repairDistanceHalf = 0;
						repairY = verts [i + 3].position.y;
					} 
					curRepairDis = repairDistance;
					int dot = 0;//repair next line distance
					for (int j = info.len - 1; j > 0; j--) {
						if (verts [i + j * 4 + 3].position.y >= verts [i + 3].position.y) {
							repairDistance += verts [i + j * 4 + 1].position.x - m_TempVerts [2].position.x;
							break;
						} else {
							dot = i + 4 * j;

						}
					}
					if (dot > 0) {
						int nextChar = i + info.len * 4;
						if (nextChar < verts.Count) {
							repairDistanceHalf = verts [nextChar].position.x - verts [dot].position.x;
						}
					}

					//repair its distance
					for (int j = 0; j < 4; j++) {
						m_TempVerts [j].position -= new Vector3 (curRepairDis, 0, 0);
					}

					m_TempVerts [0].position *= unitsPerPixel;
					m_TempVerts [1].position *= unitsPerPixel;
					m_TempVerts [2].position *= unitsPerPixel;
					m_TempVerts [3].position *= unitsPerPixel;

					float pixelOffset = emojiDic [index].size / 32 / 2;
					m_TempVerts [0].uv1 = new Vector2 (emojiDic [index].x + pixelOffset, emojiDic [index].y + pixelOffset);
					m_TempVerts [1].uv1 = new Vector2 (emojiDic [index].x - pixelOffset + emojiDic [index].size, emojiDic [index].y + pixelOffset);
					m_TempVerts [2].uv1 = new Vector2 (emojiDic [index].x - pixelOffset + emojiDic [index].size, emojiDic [index].y - pixelOffset + emojiDic [index].size);
					m_TempVerts [3].uv1 = new Vector2 (emojiDic [index].x + pixelOffset, emojiDic [index].y - pixelOffset + emojiDic [index].size);

					toFill.AddUIVertexQuad (m_TempVerts);

					i += 4 * info.len - 1;
				} else {
					int tempVertsIndex = i & 3;
					if (tempVertsIndex == 0 && verts [i].position.y < repairY) {
						repairY = verts [i + 3].position.y;
						repairDistance = repairDistanceHalf;
						repairDistanceHalf = 0;
					}
					m_TempVerts [tempVertsIndex] = verts [i];
					m_TempVerts [tempVertsIndex].position -= new Vector3 (repairDistance, 0, 0);
					m_TempVerts [tempVertsIndex].position *= unitsPerPixel;
					if (tempVertsIndex == 3)
						toFill.AddUIVertexQuad (m_TempVerts);
				}
			}

		}
		m_DisableFontTextureRebuiltCallback = false;
	}
}
