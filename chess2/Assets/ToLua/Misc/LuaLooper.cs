
using System;
using UnityEngine;
using LuaInterface;

public class LuaLooper : MonoBehaviour 
{    
    public LuaBeatEvent UpdateEvent
    {
        get;
        private set;
    }

    public LuaBeatEvent LateUpdateEvent
    {
        get;
        private set;
    }

    public LuaBeatEvent FixedUpdateEvent
    {
        get;
        private set;
    }

    public LuaState luaState = null;

    void Start() 
    {
        try
        {
            UpdateEvent = GetEvent("UpdateBeat");
            LateUpdateEvent = GetEvent("LateUpdateBeat");
            FixedUpdateEvent = GetEvent("FixedUpdateBeat");
        }
        catch (Exception e)
        {
            Destroy(this);
            throw e;
        }        
	}

    LuaBeatEvent GetEvent(string name)
    {
        LuaTable table = luaState.GetTable(name);

        if (table == null)
        {
            throw new LuaException(string.Format("Lua table {0} not exists", name));
        }

        LuaBeatEvent e = new LuaBeatEvent(table);
        table.Dispose();
        table = null;
        return e;
    }

    void ThrowException()
    {
        string error = luaState.LuaToString(-1);
        luaState.LuaPop(2);                
        throw new LuaException(error, LuaException.GetLastError());
    }

    void Update()
    {
#if UNITY_EDITOR
        if (luaState == null)
        {
            return;
        }
#endif
        if (luaState.LuaUpdate(Time.deltaTime, Time.unscaledDeltaTime) != 0)
        {
            ThrowException();
        }

        luaState.LuaPop(1);
        luaState.Collect();
#if UNITY_EDITOR
        luaState.CheckTop();
#endif
    }

    void LateUpdate()
    {
#if UNITY_EDITOR
        if (luaState == null)
        {
            return;
        }
#endif
        if (luaState.LuaLateUpdate() != 0)
        {
            ThrowException();
        }

        luaState.LuaPop(1);
    }

    void FixedUpdate()
    {
#if UNITY_EDITOR
        if (luaState == null)
        {
            return;
        }
#endif
        if (luaState.LuaFixedUpdate(Time.fixedDeltaTime) != 0)
        {
            ThrowException();
        }

        luaState.LuaPop(1);
    }

    public void Destroy()
    {
        if (luaState != null)
        {
            if (UpdateEvent != null)
            {
                UpdateEvent.Dispose();
                UpdateEvent = null;
            }

            if (LateUpdateEvent != null)
            {
                LateUpdateEvent.Dispose();
                LateUpdateEvent = null;
            }

            if (FixedUpdateEvent != null)
            {
                FixedUpdateEvent.Dispose();
                FixedUpdateEvent = null;
            }

            luaState = null;
        }
    }

    void OnDestroy()
    {
        if (luaState != null)
        {
            Destroy();
        }
    }
}
