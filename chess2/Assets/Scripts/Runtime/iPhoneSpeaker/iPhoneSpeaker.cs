using UnityEngine;
using System.Collections;
using System.Runtime.InteropServices;

public class iPhoneSpeaker{

	#if UNITY_IPHONE
	[DllImport("__Internal")]
	private static extern void _forceToSpeaker();
	#endif
	
	public static void ForceToSpeaker() {
		#if UNITY_IPHONE
		if (Application.platform == RuntimePlatform.IPhonePlayer) {
			_forceToSpeaker();
		}
		#endif
	}


}
