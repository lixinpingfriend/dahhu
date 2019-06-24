using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RendererSorting : MonoBehaviour
{

    public int initialSortLayer;
    public Renderer renderer;

    public GameModule gameModule;

    void Awake()
    {
        if (renderer == null)
        {
            renderer = GetComponent<Renderer>();
        }
        initialSortLayer = renderer.sortingOrder;

        if (gameModule != null)
        {
            gameModule.AddRendererSorting(this);
        }
    }
}
