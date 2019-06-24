using System;
using LuaInterface;

public class ToLua_LuaInterface_EventObject
{
    [NoToLuaAttribute]
    public static string op_AdditionDefined =
@"        try
        {
            EventObject eventObject = (EventObject)ToLua.CheckObject(L, 1, typeof(EventObject));
            eventObject.func = ToLua.CheckDelegate(eventObject.type, L, 2);
            eventObject.op = EventOp.Add;
            ToLua.Push(L, eventObject);
            return 1;
        }
        catch (Exception e)
        {
            return LuaDLL.toluaL_exception(L, e);
        }";

    [NoToLuaAttribute]
    public static string op_SubtractionDefined =
@"        try
        {
            EventObject eventObject = (EventObject)ToLua.CheckObject(L, 1, typeof(EventObject));
            eventObject.func = ToLua.CheckDelegate(eventObject.type, L, 2);
            eventObject.op = EventOp.Sub;
            ToLua.Push(L, eventObject);
            return 1;
        }
        catch (Exception e)
        {
            return LuaDLL.toluaL_exception(L, e);
        }";

    [UseDefinedAttribute]
    public static ToLua_LuaInterface_EventObject operator +(ToLua_LuaInterface_EventObject a, ToLua_LuaInterface_EventObject b)
    {
        return null;
    }

    [UseDefinedAttribute]
    public static ToLua_LuaInterface_EventObject operator -(ToLua_LuaInterface_EventObject a, ToLua_LuaInterface_EventObject b)
    {
        return null;
    }
}
