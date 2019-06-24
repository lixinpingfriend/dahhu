using UnityEngine;
using UnityEditor;
using System.Collections.Generic;

[CustomEditor(typeof(GameModule))]
public class GameModuleEditor : Editor
{
 	private GameModule m_gameModule;
    private SortOrderType type = SortOrderType.canvas;

    void OnEnable()
    {
        m_gameModule = target as GameModule;
    }

    [InitializeOnLoadMethod]
    static void StartInitializeOnLoadMethod()
    {
        PrefabUtility.prefabInstanceUpdated = delegate (GameObject instance)
        {
            if (instance.GetComponent<GameModule>() != null)
            {
                instance.GetComponent<GameModule>().SetLayers();
            }
        };
    }

    public override void OnInspectorGUI()
    {
        base.OnInspectorGUI();
        DrawInspector();
    }

    private void DrawInspector()
    {
        if (m_gameModule == null)
        {
            return;
        }
        GUILayout.BeginHorizontal();
        if (GUILayout.Button("Show"))
        {
            m_gameModule.SetLayers();
        }
        type = (SortOrderType)EditorGUILayout.EnumPopup(type,GUILayout.Width(60));
        if (GUILayout.Button("Add"))
        {
            if (m_gameModule.m_canvasList == null)
            {
                m_gameModule.m_canvasList = new List<CanvasData>();
            }
            CanvasData cd = new CanvasData();
            cd.type = type;
            m_gameModule.m_canvasList.Add(cd);
        }
        GUILayout.EndHorizontal();
        if (m_gameModule.m_canvasList == null || m_gameModule.m_canvasList.Count == 0)
        {
            return;
        }

        for (int i = 0; i < m_gameModule.m_canvasList.Count; i++)
        {
            GUILayout.BeginHorizontal();
            switch(m_gameModule.m_canvasList[i].type)
            {
                case SortOrderType.canvas:
                    ShowCanvasInspect(i);
                    break;
                case SortOrderType.renderer:
                    ShowParticleInspect(i);
                    break;
            }

            if (GUILayout.Button("-", GUILayout.Width(30)))
            {
                m_gameModule.m_canvasList.RemoveAt(i);
            }
            GUILayout.EndHorizontal();
        }
    }

    private void ShowCanvasInspect(int i)   
    {
        m_gameModule.m_canvasList[i].canvas = EditorGUILayout.ObjectField(m_gameModule.m_canvasList[i].canvas, typeof(Canvas), true, GUILayout.MinWidth(100)) as Canvas;
        GUILayout.Label("RelativeSort", GUILayout.Width(70));
        m_gameModule.m_canvasList[i].sortLayer = EditorGUILayout.IntField(m_gameModule.m_canvasList[i].sortLayer, GUILayout.Width(30));
        GUILayout.Space(2);
        if (m_gameModule.m_canvasList[i].canvas != null)
        {
            GUILayout.Label("Cur:" + m_gameModule.m_canvasList[i].canvas.sortingOrder, GUILayout.Width(50));
        }
    }
    private void ShowParticleInspect(int i)   
    {
        m_gameModule.m_canvasList[i].renderer = EditorGUILayout.ObjectField(m_gameModule.m_canvasList[i].renderer, typeof(Renderer), true, GUILayout.MinWidth(100)) as Renderer;
        GUILayout.Label("RelativeSort", GUILayout.Width(70));
        m_gameModule.m_canvasList[i].sortLayer = EditorGUILayout.IntField(m_gameModule.m_canvasList[i].sortLayer, GUILayout.Width(30));
        GUILayout.Space(2);
        if (m_gameModule.m_canvasList[i].renderer != null)
        {
            GUILayout.Label("Cur:" + m_gameModule.m_canvasList[i].renderer.sortingOrder, GUILayout.Width(50));
        }
    }

	
}
