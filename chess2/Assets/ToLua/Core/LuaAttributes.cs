
using System;

namespace LuaInterface
{
    [AttributeUsage(AttributeTargets.Method)]
    public sealed class MonoPInvokeCallbackAttribute : Attribute
    {
        public MonoPInvokeCallbackAttribute(Type type)
        {
        }
    }

    public class NoToLuaAttribute : System.Attribute
    {
        public NoToLuaAttribute()
        {

        }
    }

    public class UseDefinedAttribute : System.Attribute
    {
        public UseDefinedAttribute()
        {

        }
    }

    public class OverrideDefinedAttribute: System.Attribute
    {
        public OverrideDefinedAttribute()
        {

        }
    }
    
    public sealed class LuaByteBufferAttribute : Attribute
    {                
        public LuaByteBufferAttribute()
        {
        }       
    }

    [AttributeUsage(AttributeTargets.Method)]
    public sealed class LuaRenameAttribute : Attribute
    {
        public string Name;
        public LuaRenameAttribute()
        {
        }
    }
}