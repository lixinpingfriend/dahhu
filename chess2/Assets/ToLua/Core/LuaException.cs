

using System;
using System.Diagnostics;
using System.Reflection;
using System.Text;
using UnityEngine;
using UnityEngine.SceneManagement;

namespace LuaInterface
{
    public class LuaException : Exception
    {
        public static Exception luaStack = null;
        public static string projectFolder = null;
        public static int InstantiateCount = 0;
        public static int SendMsgCount = 0;
        public static IntPtr L = IntPtr.Zero;

        public override string StackTrace
        {
            get
            {
                return _stack;
            }
        }

        protected string _stack = string.Empty;

        public LuaException(string msg, Exception e = null, int skip = 1)
            : base(msg)
        {
            if (e != null)
            {
                if (e is LuaException)
                {
                    _stack = e.StackTrace;
                }
                else
                {
                    StackTrace trace = new StackTrace(e, true);
                    StringBuilder sb = new StringBuilder();
                    ExtractFormattedStackTrace(trace, sb);
                    StackTrace self = new StackTrace(skip, true);
                    ExtractFormattedStackTrace(self, sb, trace);
                    _stack = sb.ToString();
                }
            }
            else
            {
                StackTrace self = new StackTrace(skip, true);
                StringBuilder sb = new StringBuilder();
                ExtractFormattedStackTrace(self, sb);
                _stack = sb.ToString();
            }

            string content = ToString();
            //上报错误信息
            if (!content.IsNullOrEmpty())
            {
                // #if DEBUG
                //     Debugger.LogException(this);
                // #endif
                CustomerUtil.CustomEventCallback("LuaException", content);
                if (!UnityEngine.Application.isEditor && (GameConfigProject.instance.developmentMode || UnityEngine.Application.platform == RuntimePlatform.WindowsPlayer)) {
                    if (ExceptionShow.Instance == null)
                    {
                        ExceptionShow.IsShowExc = true;
                        new GameObject().AddComponent<ExceptionShow>();
                    }
                    if (ExceptionShow.IsShowExc) {
                        ExceptionShow.strException += content;
                    }
                }
                // BuglyAgent.ReportException(this, "LuaException");
                // DCAgent.reportError("LuaException", content);
            }
        }

        public static Exception GetLastError()
        {
            Exception last = luaStack;
            luaStack = null;
            return last;
        }

        public static void ExtractFormattedStackTrace(StackTrace trace, StringBuilder sb, StackTrace skip = null)
        {
            int begin = 0;

            if (skip != null && skip.FrameCount > 0)
            {
                MethodBase m0 = skip.GetFrame(skip.FrameCount - 1).GetMethod();

                for (int i = 0; i < trace.FrameCount; i++)
                {
                    StackFrame frame = trace.GetFrame(i);
                    MethodBase method = frame.GetMethod();

                    if (method == m0)
                    {
                        begin = i + 1;
                        break;
                    }
                }

                sb.AppendLineEx();
            }

            for (int i = begin; i < trace.FrameCount; i++)
            {
                StackFrame frame = trace.GetFrame(i);
                MethodBase method = frame.GetMethod();

                if (method == null || method.DeclaringType == null)
                {
                    continue;
                }

                Type declaringType = method.DeclaringType;
                string str = declaringType.Namespace;

                if ((InstantiateCount == 0 && declaringType == typeof(UnityEngine.Object) && method.Name == "Instantiate") //(method.Name == "Internal_CloneSingle"
                    || (SendMsgCount == 0 && declaringType == typeof(GameObject) && method.Name == "SendMessage"))
                {
                    break;
                }

                if ((str != null) && (str.Length != 0))
                {
                    sb.Append(str);
                    sb.Append(".");
                }

                sb.Append(declaringType.Name);
                sb.Append(":");
                sb.Append(method.Name);
                sb.Append("(");
                int index = 0;
                ParameterInfo[] parameters = method.GetParameters();
                bool flag = true;

                while (index < parameters.Length)
                {
                    if (!flag)
                    {
                        sb.Append(", ");
                    }
                    else
                    {
                        flag = false;
                    }

                    sb.Append(parameters[index].ParameterType.Name);
                    index++;
                }

                sb.Append(")");
                string fileName = frame.GetFileName();

                if (fileName != null)
                {
                    fileName = fileName.Replace('\\', '/');
                    sb.Append(" (at ");

                    if (fileName.StartsWith(projectFolder))
                    {
                        fileName = fileName.Substring(projectFolder.Length, fileName.Length - projectFolder.Length);
                    }

                    sb.Append(fileName);
                    sb.Append(":");
                    sb.Append(frame.GetFileLineNumber().ToString());
                    sb.Append(")");
                }

                if (i != trace.FrameCount - 1)
                {
                    sb.Append("\n");
                }
            }
        }

        public static void Init(IntPtr L0)
        {
            L = L0;
            Type type = typeof(StackTraceUtility);
            FieldInfo field = type.GetField("projectFolder", BindingFlags.Static | BindingFlags.GetField | BindingFlags.NonPublic);
            LuaException.projectFolder = (string)field.GetValue(null);
            projectFolder = projectFolder.Replace('\\', '/');
#if DEVELOPER
            Debugger.Log("projectFolder is {0}", projectFolder);
#endif
        }
    }
}

public class ExceptionShow : MonoBehaviour
{
    public static ExceptionShow Instance;
    public static string strException = string.Empty;
    public static bool IsShowExc = false;

    bool isInit = false;
    GUIStyle guiStye = null;
    void OnGUI()
    {
        if (guiStye == null) {
            guiStye = new GUIStyle();
            guiStye.fontSize = 20;
            guiStye.normal.textColor = Color.red;
        }
        if (IsShowExc) {
            GUI.skin.label.normal.textColor = Color.red;
            GUI.Label(new Rect(10, 110, 1200, 630), strException, guiStye);
        }

    }


    void Start()
    {

        Instance = this;
        GameObject.DontDestroyOnLoad(gameObject);
    }


    void OnSceneLoaded(Scene scene, LoadSceneMode mode)
    {
        strException = "";
    }

}
