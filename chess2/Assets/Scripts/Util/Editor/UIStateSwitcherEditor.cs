using UnityEngine;
using System.Collections;
using UnityEditor;
using System.Collections.Generic;

[CustomEditor(typeof(UIStateSwitcher))]
public class UIStateSwitcherEditor : Editor 
{
	UIStateSwitcher stateSwitcher;
	static bool showTargetObjects;

	void OnEnable()
	{
		stateSwitcher = target as UIStateSwitcher;

		if (stateSwitcher.states == null)
			stateSwitcher.states = new List<UIStateSwitcher.State>();
	}

	public override void OnInspectorGUI ()
	{
		ValidateStateSwitcher();
		
		EditorGUILayout.LabelField("States:", EditorStyles.boldLabel);

		EditorGUI.indentLevel++;
		
		UIStateSwitcher.State deleteState = null;

		if (stateSwitcher.states.Count > 0)
		{
			foreach (UIStateSwitcher.State state in stateSwitcher.states)
			{
				EditorGUILayout.BeginHorizontal();

				if (stateSwitcher.CurrentStateID == state.StateID)
				{
					EditorGUILayout.Toggle(true, EditorStyles.radioButton, GUILayout.Width(15));
				}
				else
				{
					if (EditorGUILayout.Toggle(false, EditorStyles.radioButton, GUILayout.Width(15)))
					{
						stateSwitcher.SwitchState(state);
						PersistChanges();
					}
				}

				state.stateName = EditorGUILayout.TextField(state.stateName);

				if (GUILayout.Button("Revert"))
				{
					state.Revert();
					PersistChanges();
				}

				if (GUILayout.Button("Save"))
				{
					if (state.StateID == stateSwitcher.CurrentStateID || EditorUtility.DisplayDialog("Overwrite state?", 
						"Are you sure you want to overwrite state '" + state.stateName + "' with the current layout?", "Yes", "No"))
					{
						state.Save();
						EditorUtility.SetDirty(target);
					}
				}

				if (GUILayout.Button("Delete") && EditorUtility.DisplayDialog("Delete state?", "Are you sure you want to delete state '" + state.stateName + "'?", "Yes", "No"))
				{
					deleteState = state;
				}

				EditorGUILayout.EndHorizontal();
			}
		}
		else
		{
			EditorGUILayout.HelpBox("No states created yet!", MessageType.Info);
		}

		EditorGUILayout.BeginHorizontal();
		EditorGUILayout.Space();
		if (GUILayout.Button("New"))
		{
			CreateNewState("New state");
		}
		EditorGUILayout.EndHorizontal();
		EditorGUI.indentLevel--;
		
		showTargetObjects = EditorGUILayout.Foldout(showTargetObjects, "Target objects");

		if (showTargetObjects)
		{
			EditorGUI.indentLevel++;

			foreach (GameObject go in stateSwitcher.Targets)
			{
				if (go == null)
					continue;

				if (!RenderTargetObject(go))
					break;
			}
			
			EditorGUILayout.Space();
			
			Object obj = EditorGUILayout.ObjectField("Drop to add", null, typeof(GameObject), true);
			if (obj != null)
				AddTargetObject(obj as GameObject);
			
			EditorGUI.indentLevel--;
		}

		if (deleteState != null)
			DeleteState(deleteState);
	}

	bool RenderTargetObject (GameObject go)
	{
		bool result = true;

		EditorGUILayout.BeginHorizontal();

		EditorGUILayout.LabelField(go.name);

		if (GUILayout.Button("="))
			EditorGUIUtility.PingObject(go);

		if (GUILayout.Button("del"))
		{
			DeleteTarget(go);
			result = false;
		}

		EditorGUILayout.EndHorizontal();

		return result;
	}

	void ValidateStateSwitcher()
	{
		// Check if any targets are null
		bool anyNull = false;

		for (int i = stateSwitcher.Targets.Count - 1; i >= 0; i--)
		{
			if (stateSwitcher.Targets[i] == null)
			{
				anyNull = true;
				stateSwitcher.Targets.RemoveAt(i);
			}
		}

		// If any targets were null, clean up states
		if (anyNull)
		{
			foreach (var state in stateSwitcher.states)
			{
				for (int i = state.targets.Count - 1; i >= 0; i--)
				{
					if (state.targets[i].TargetGO == null)
					{
						state.targets.RemoveAt(i);
					}
				}
			}
		}
	}

	void CreateNewState (string name)
	{
		bool firstState = stateSwitcher.states.Count == 0;

		var state = new UIStateSwitcher.State();

		state.stateName = name;

		// Add existing targets to new state
		for (int i = 0; i < stateSwitcher.Targets.Count; i++) 
			state.AddTarget(stateSwitcher.Targets[i]);

		state.Save();

		// Add new state
		stateSwitcher.states.Add(state);

		// Change to new state if first
		if (firstState)
			stateSwitcher.SwitchState(state);

		EditorUtility.SetDirty(target);
	}

	void AddTargetObject (GameObject go)
	{
		foreach (var state in stateSwitcher.states)
		{
			state.AddTarget(go);
		}

		stateSwitcher.Targets.Add(go);

		stateSwitcher.OnValidate();

		EditorUtility.SetDirty(target);
	}

	void DeleteTarget (GameObject go)
	{
		// Remove target from all states
		for (int i = 0; i < stateSwitcher.states.Count; i++)
			stateSwitcher.states[i].RemoveTarget(go);

		stateSwitcher.Targets.Remove(go);
		stateSwitcher.OnValidate();

		EditorUtility.SetDirty(target);
	}

	void DeleteState (UIStateSwitcher.State state)
	{
		stateSwitcher.states.Remove(state);

		if (stateSwitcher.CurrentStateID == state.StateID && stateSwitcher.states.Count > 0)
			stateSwitcher.SwitchState(stateSwitcher.states[0]);
		
		EditorUtility.SetDirty(target);
	}

	void PersistChanges ()
	{
		foreach (GameObject go in stateSwitcher.Targets)
		{
			EditorUtility.SetDirty(go);
			EditorUtility.SetDirty(go.transform);

			//UIWidget widget = go.GetComponent<UIWidget>();
			//if (widget != null)
			//{
			//	widget.UpdateAnchors();
			//	EditorUtility.SetDirty(widget);
			//}
		}

		stateSwitcher.OnValidate();
	}
}

[InitializeOnLoad]
public class SetUpHierarkiView
{
	static SetUpHierarkiView()
	{
		EditorApplication.hierarchyWindowItemOnGUI += HierarchWindowOnGUI;
	}
	
	static void HierarchWindowOnGUI (int instanceID, Rect selectionRect)
	{
		selectionRect.x += selectionRect.width - 30;
		selectionRect.width = 15;

		// Go through state switchers and draw on targets
		var stateSwitchers = UIStateSwitcher.GetStateSwitchers();

		for (int i = 0; i < stateSwitchers.Count; i++)
		{
			var switcher = stateSwitchers[i];

			for (int j = 0; j < switcher.Targets.Count; j++)
			{
				if (switcher.Targets[j] == null)
					continue;

				if (switcher.Targets[j].GetInstanceID() != instanceID)
					continue;

				// Draw button that will ping the state switcher
				if (GUI.Button(selectionRect, new GUIContent("S", "This GameObject is managed by a UIStateSwitcher"), EditorStyles.label))
				{
					EditorGUIUtility.PingObject(switcher.GetInstanceID());
				}
			}
		}
	}
}