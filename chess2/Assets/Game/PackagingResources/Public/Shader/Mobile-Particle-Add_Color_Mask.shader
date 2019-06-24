
Shader "Mobile/Particles/Additive_Color_mask" {
Properties {
	_TintColor ("_TintColor", Color) = (0.5,0.5,0.5,0.5)
	_MainTex ("_MainTex", 2D) = "white" {}
	_Mask("Mask", 2D) = "white" {}
}

Category {
	Tags { "Queue"="Transparent" "IgnoreProjector"="True" "RenderType"="Transparent" }
	Blend SrcAlpha One
	Cull Off Lighting Off ZWrite Off Fog {Mode Off  Color (0,0,0,0) }
	
	BindChannels {
		Bind "Color", color
		Bind "Vertex", vertex
		Bind "TexCoord", texcoord
	}
	
	SubShader {
		Pass {
		ColorMaterial AmbientAndDiffuse	
			SetTexture[_Mask]{ combine texture *  primary,texture }
			SetTexture [_MainTex] {
				constantColor [_TintColor]
				combine previous * constant//* primary
			}
			//SetTexture[_Mask]{ combine texture *  previous }
			SetTexture[_MainTex]{
				combine texture * previous//* primary
			}
		}
	}
}
}