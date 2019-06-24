using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using LuaInterface;

public class UIStateSwitcher : MonoBehaviour 
{
	[SerializeField]
	public List<State> states;

	[SerializeField]
	string _currentStateID;

	public List<GameObject> Targets = new List<GameObject>();

	public string CurrentStateID { get { return _currentStateID; } }

	public void SwitchState (string stateName)
	{
		var state = states.Find((s) => s.stateName == stateName);
		if (state != null) {
			SwitchState(state);
		}
	}

	public void SwitchStateUsingID (string stateID)
	{
		var state = states.Find((s) => s.StateID == stateID);

		SwitchState(state);
	}

	[NoToLua]
	public void SwitchState (State state)
	{
		if (state == null)
			return;
		// Apply state by calling revert
		state.Revert();

		_currentStateID = state.StateID;
	}

	#if UNITY_EDITOR
	static List<UIStateSwitcher> _stateSwitchers = new List<UIStateSwitcher>();

	[NoToLua]
	public static List<UIStateSwitcher> GetStateSwitchers()
	{
		return _stateSwitchers;
	}

	[NoToLua]
	public void OnValidate()
	{
		// Add to global switcher list if needed
		if (!_stateSwitchers.Contains(this))
			_stateSwitchers.Add(this);

		// Clean up any deleted state switchers
		_stateSwitchers.RemoveAll((s) => (s == null));
	}
	#endif

	[System.Serializable]
	public class State
	{
		public string stateName;
		public List<GOState> targets = new List<GOState>();

		/// <summary>
		/// The ID of a state is used for switching between active states.
		/// The ID is a simple GUID
		/// </summary>
		public string StateID { get { return _stateID; } }

		[SerializeField]
		string _stateID;

		public State()
		{
			_stateID = System.Guid.NewGuid().ToString();
		}

		public void Save()
		{
			foreach (GOState goState in targets)
			{
				goState.Save();
			}
		}

		public void Revert()
		{
			foreach (GOState goState in targets)
			{
				goState.Apply();
				#if UNITY_EDITOR
				// goState.Apply();
				#endif
				// goState.Apply();
			}
		}

		public void AddTarget(GameObject target)
		{
			var goState = new GOState(target);
			goState.Save();

			targets.Add(goState);
		}

		public void RemoveTarget(GameObject target)
		{
			var index = targets.FindIndex((goState) => goState.TargetGO == target);

			if (index >= 0)
				targets.RemoveAt(index);
		}
	}

	[System.Serializable]
	public class GOState
	{
		[SerializeField]
		GameObject _targetGO;

		[SerializeField]
		bool _savedActiveState;

		[SerializeField]
		STransform _savedTransform;

		//[SerializeField]
		//SWidget _savedWidget;

		//[SerializeField]
		//SSprite _savedSprite;

		public GameObject TargetGO { get { return _targetGO; } }

		public GOState(GameObject targetGO)
		{
			_targetGO = targetGO;

			// We always have a transform
			_savedTransform = new STransform(_targetGO.transform);
		}

		public void Save()
		{
			// Check if any new component were added
			AddNewComponents();

			_savedActiveState = _targetGO.activeSelf;

			_savedTransform.Save();

			//if (_savedWidget != null && _savedWidget.TargetComponent != null)
			//	_savedWidget.Save();

			//if (_savedSprite != null && _savedSprite.TargetComponent != null)
			//	_savedSprite.Save();
		}

		public void Apply()
		{
			RemoveInvalidComponents();

			//NGUITools.SetActive(_targetGO, _savedActiveState);
			if (_targetGO.activeSelf != _savedActiveState) {
            	_targetGO.SetActive(_savedActiveState);
			}
			_savedTransform.Apply();

			//// Skip saved check on widget for legacy reasons
			//if (_savedWidget != null && _savedWidget.TargetComponent != null)
			//	_savedWidget.Apply();

			//if (_savedSprite != null && _savedSprite.TargetComponent != null && _savedSprite.Saved)
			//	_savedSprite.Apply();
		}

		void RemoveInvalidComponents()
		{
			// Setting the saved component to null doesn't actually serialize them as such.
			// Since unitys serializer doesn't support serializing a null instance of a custom class
			// it will instead simply serialize a new/empty instance of that class. Thumbs up unity serializer.
			//if (_targetGO.GetComponent<UIWidget>() == null)
			//	_savedWidget = null; 

			//if (_targetGO.GetComponent<UISprite>() == null)
			//	_savedSprite = null;
		}

		void AddNewComponents()
		{
			//CheckForComponent<SWidget>(ref _savedWidget, _targetGO.GetComponent<UIWidget>());
			//CheckForComponent<SSprite>(ref _savedSprite, _targetGO.GetComponent<UISprite>());
		}

		void CheckForComponent<T>(ref T savedComponent, Component targetComponent) where T : SComponent, new()
		{
			if (targetComponent == null)
				return;

			if (savedComponent == null || savedComponent.TargetComponent == null || savedComponent.TargetComponent.GetInstanceID() != targetComponent.GetInstanceID())
			{
				savedComponent = new T();
				savedComponent.SetTargetComponent(targetComponent);
			}
		}

		[System.Serializable]
		public class STransform
		{
			[SerializeField]
			Transform _targetTransform;

			[SerializeField]
			Vector3 _savedLocalPosition;

			[SerializeField]
			Quaternion _savedLocalRotation;

			[SerializeField]
			Vector3 _savedLocalScale;

			[SerializeField]
			Vector2 _savedRectTranSizeDelta;

			[SerializeField]
			bool _hasRectTran = false;

			[SerializeField]
			RectTransform _targetRectTransform;

			public STransform(Transform targetTransform)
			{
				_targetTransform = targetTransform;
				_targetRectTransform = _targetTransform.GetComponent<RectTransform>();
			}

			public void Save()
			{
				_savedLocalPosition = _targetTransform.localPosition;
				_savedLocalRotation = _targetTransform.localRotation;
				_savedLocalScale = _targetTransform.localScale;
				RectTransform rectTran = _targetTransform.GetComponent<RectTransform>();
				if(rectTran != null)
				{					
					_savedRectTranSizeDelta = rectTran.sizeDelta;
				}
			}

			public void Apply()
			{
				if (_targetRectTransform == null) {
					_targetRectTransform = _targetTransform.GetComponent<RectTransform>();
				}
				
				if(_targetRectTransform != null) {					
					_targetRectTransform.sizeDelta = _savedRectTranSizeDelta;
				}
				_targetTransform.localPosition = _savedLocalPosition;
				_targetTransform.localRotation = _savedLocalRotation;
				_targetTransform.localScale = _savedLocalScale;
			}
		}

		[System.Serializable]
		public abstract class SComponent
		{
			[SerializeField]
			bool _saved = false;

			public bool Saved { get { return _saved; } }

			public abstract Component TargetComponent { get; }

			public abstract void SetTargetComponent(Component targetComponent);

			public virtual void Save()
			{
				_saved = true;
			}

			public virtual void Apply()
			{ 
			}
		}

		//[System.Serializable]
		//public class SWidget : SComponent
		//{
		//	[SerializeField]
		//	UIWidget _targetWidget;

		//	[SerializeField]
		//	SAnchor _savedTopAnchor = new SAnchor();

		//	[SerializeField]
		//	SAnchor _savedLeftAnchor = new SAnchor();

		//	[SerializeField]
		//	SAnchor _savedBottomAnchor = new SAnchor();

		//	[SerializeField]
		//	SAnchor _savedRightAnchor = new SAnchor();

		//	[SerializeField]
		//	int _savedWidth;

		//	[SerializeField]
		//	int _savedHeight;

		//	[SerializeField]
		//	Color _savedColor = Color.white;

		//	[SerializeField]
		//	bool _colorSaved = false;

		//	[SerializeField]
		//	int _savedDepth = 0;

		//	[SerializeField]
		//	bool _depthSaved = false;

		//	//TODO XLQ: ADD   records LOCALIZEE KEY
		//	[SerializeField]
		//	UILocalize _targetUILocalize;

		//	//TODO XLQ: ADD   records LOCALIZEE KEY
		//	[SerializeField]
		//	string _savedUILocalizeKey;

		//	public override Component TargetComponent { get { return _targetWidget; } }

		//	public override void SetTargetComponent (Component targetComponent)
		//	{
		//		_targetWidget = (UIWidget) targetComponent;

		//		_targetUILocalize = targetComponent.gameObject.GetComponent<UILocalize>();//TODO XLQ: ADD   records LOCALIZEE KEY
		//	}

		//	public override void Save()
		//	{
		//		base.Save();

		//		_savedWidth = _targetWidget.width;
		//		_savedHeight = _targetWidget.height;

		//		_savedTopAnchor.Save(_targetWidget.topAnchor);
		//		_savedLeftAnchor.Save(_targetWidget.leftAnchor);
		//		_savedBottomAnchor.Save(_targetWidget.bottomAnchor);
		//		_savedRightAnchor.Save(_targetWidget.rightAnchor);

		//		_savedColor = _targetWidget.color;
		//		_colorSaved = true;

		//		_savedDepth = _targetWidget.depth;
		//		_depthSaved = true;

		//		//TODO XLQ: ADD   records LOCALIZEE KEY
		//		if(_targetUILocalize){
		//			_savedUILocalizeKey = _targetUILocalize.key;
		//			_targetUILocalize.OnLocalize ();
		//		}
		//	}

		//	public override void Apply()
		//	{
		//		base.Apply();

		//		_savedTopAnchor.Apply(ref _targetWidget.topAnchor);
		//		_savedLeftAnchor.Apply(ref _targetWidget.leftAnchor);
		//		_savedBottomAnchor.Apply(ref _targetWidget.bottomAnchor);
		//		_savedRightAnchor.Apply(ref _targetWidget.rightAnchor);

		//		if (!_targetWidget.isAnchoredHorizontally)
		//			_targetWidget.width = _savedWidth;

		//		if (!_targetWidget.isAnchoredVertically)
		//			_targetWidget.height = _savedHeight;

		//		if (_colorSaved)
		//			_targetWidget.color = _savedColor;

		//		if (_depthSaved)
		//			_targetWidget.depth = _savedDepth;

		//		_targetWidget.UpdateAnchors();

		//		//TODO XLQ: ADD   records LOCALIZEE KEY
		//		if(_targetUILocalize){
		//			_targetUILocalize.key = _savedUILocalizeKey;
		//			_targetUILocalize.OnLocalize ();
		//		}
		//	}

		//	[System.Serializable]
		//	class SAnchor
		//	{
		//		[SerializeField]
		//		Transform _savedTarget;

		//		[SerializeField]
		//		float _savedRelative;

		//		[SerializeField]
		//		int _savedAbsolute;

		//		public void Save(UIRect.AnchorPoint targetAnchorPoint)
		//		{
		//			_savedTarget = targetAnchorPoint.target;
		//			_savedRelative = targetAnchorPoint.relative;
		//			_savedAbsolute = targetAnchorPoint.absolute;
		//		}

		//		public void Apply(ref UIRect.AnchorPoint targetAnchorPoint)
		//		{
		//			targetAnchorPoint.target = _savedTarget;
		//			targetAnchorPoint.Set(_savedRelative, _savedAbsolute);
		//		}
		//	}
		//}

		//[System.Serializable]
		//public class SSprite : SComponent
		//{
		//	[SerializeField]
		//	UISprite _targetSprite;

		//	[SerializeField]
		//	UIAtlas _savedAtlas;

		//	[SerializeField]
		//	string _savedSprite;

		//	[SerializeField]
		//	UISprite.Flip _savedFlip;

		//	public override Component TargetComponent { get { return _targetSprite; } }

		//	public override void SetTargetComponent (Component targetComponent)
		//	{
		//		_targetSprite = (UISprite) targetComponent;
		//	}

		//	public override void Save()
		//	{
		//		base.Save();

		//		_savedAtlas = _targetSprite.atlas;
		//		_savedSprite = _targetSprite.spriteName;

		//		_savedFlip = _targetSprite.flip;
		//	}

		//	public override void Apply()
		//	{
		//		base.Apply();

		//		_targetSprite.atlas = _savedAtlas;
		//		_targetSprite.spriteName = _savedSprite;

		//		_targetSprite.flip = _savedFlip;
		//	}
		//}
	}
}