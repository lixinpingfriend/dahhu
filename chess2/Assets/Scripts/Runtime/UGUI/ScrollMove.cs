using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.EventSystems;
using System;

[RequireComponent(typeof(RectTransform))]
public class ScrollMove : UIBehaviour, IInitializePotentialDragHandler, IBeginDragHandler, IEndDragHandler, IDragHandler, IScrollHandler {

	[SerializeField]
    private float m_ScrollSensitivity = 1.0f;
    public float scrollSensitivity { get { return m_ScrollSensitivity; } set { m_ScrollSensitivity = value; } }
	private Vector2 m_Velocity;
    public Vector2 velocity { get { return m_Velocity; } set { m_Velocity = value; } }
	private bool m_Dragging;
	private RectTransform m_ViewRect;

	protected RectTransform viewRect
	{
		get
		{
			if (m_ViewRect == null)
				m_ViewRect = (RectTransform)transform;
			return m_ViewRect;
		}
	}
	private Vector2 m_PointerStartLocalCursor = Vector2.zero;
    private Vector2 m_ContentStartPosition = Vector2.zero;
	[SerializeField]
	private float m_DecelerationRate = 0.135f; // Only used when inertia is enabled
	public float decelerationRate { get { return m_DecelerationRate; } set { m_DecelerationRate = value; } }
	public bool m_Inertia;
	private Vector2 m_PrevPosition = Vector2.zero;

	public virtual void OnScroll(PointerEventData data)
	{
		Vector2 delta = data.scrollDelta;
		// Down is positive for scroll events, while in UI system up is positive.
		delta.y *= -1;

		Vector2 position = viewRect.anchoredPosition;
		position += delta * m_ScrollSensitivity;
		viewRect.anchoredPosition = position;
	}

	protected override void OnDisable()
	{
		m_Velocity = Vector2.zero;
		base.OnDisable();
	}

	public virtual void StopMovement()
	{
		m_Velocity = Vector2.zero;
	}

	public virtual void OnInitializePotentialDrag(PointerEventData eventData)
	{
		if (Input.touchCount == 0 && eventData.button != PointerEventData.InputButton.Left)
			return;
	
		m_Velocity = Vector2.zero;
	}

	public virtual void OnBeginDrag(PointerEventData eventData)
	{
		if (Input.touchCount == 0 && eventData.button != PointerEventData.InputButton.Left)
			return;
		if (!IsActive())
            return;
		Vector2 inputPos = eventData.position;
		m_PointerStartLocalCursor = Vector2.zero;
		RectTransformUtility.ScreenPointToLocalPointInRectangle((RectTransform)viewRect.transform.parent, inputPos, eventData.pressEventCamera, out m_PointerStartLocalCursor);
		m_ContentStartPosition = viewRect.anchoredPosition;
		m_Dragging = true;
	}

	public virtual void OnEndDrag(PointerEventData eventData)
	{
		if (Input.touchCount == 0 && eventData.button != PointerEventData.InputButton.Left)
			return;
		m_Dragging = false;
	}

	public virtual void OnDrag(PointerEventData eventData)
	{
		if (Input.touchCount == 0 && eventData.button != PointerEventData.InputButton.Left)
			return;

		if (!IsActive())
			return;
		Vector2 inputPos = eventData.position;
		Vector2 localCursor;
		if (!RectTransformUtility.ScreenPointToLocalPointInRectangle((RectTransform)viewRect.transform.parent, inputPos, eventData.pressEventCamera, out localCursor))
			return;

		var pointerDelta = localCursor - m_PointerStartLocalCursor;
		Vector2 position = m_ContentStartPosition + pointerDelta;

		viewRect.anchoredPosition = position;
	}

	protected virtual void LateUpdate()
	{
		float deltaTime = Time.unscaledDeltaTime;
		if (!m_Dragging && (m_Velocity != Vector2.zero))
		{
			Vector2 position = viewRect.anchoredPosition;
			for (int axis = 0; axis < 2; axis++)
			{
				// Apply spring physics if movement is elastic and content has an offset from the view.
				if (m_Inertia)
				{
					m_Velocity[axis] *= Mathf.Pow(m_DecelerationRate, deltaTime);
					if (Mathf.Abs(m_Velocity[axis]) < 1)
						m_Velocity[axis] = 0;
					position[axis] += m_Velocity[axis] * deltaTime;
				}
				// If we have neither elaticity or friction, there shouldn't be any velocity.
				else
				{
					m_Velocity[axis] = 0;
				}
			}

			if (m_Velocity != Vector2.zero)
			{
				viewRect.anchoredPosition = position;
			}
		}

		if (m_Dragging && m_Inertia)
		{
			Vector3 newVelocity = (viewRect.anchoredPosition - m_PrevPosition) / deltaTime;
			m_Velocity = Vector3.Lerp(m_Velocity, newVelocity, deltaTime * 10);
		}
		if (viewRect.anchoredPosition != m_PrevPosition)
		{
			UpdatePrevData();
		}
	}

	private void UpdatePrevData()
	{
		if (viewRect == null)
			m_PrevPosition = Vector2.zero;
		else
			m_PrevPosition = viewRect.anchoredPosition;
	}
}
