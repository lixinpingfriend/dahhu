using UnityEngine;
using System.Collections;
namespace UnityEngine.UI
{
    public class InvisibleImage : MaskableGraphic
    {
        protected InvisibleImage()
    	{
            useLegacyMeshGeneration = false;
		}
		
        protected override void OnPopulateMesh(VertexHelper toFill)
        {
            toFill.Clear();
		}
	}
} 