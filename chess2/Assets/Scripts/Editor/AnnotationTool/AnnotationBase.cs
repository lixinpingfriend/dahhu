
using UnityEngine;
using System.Collections;
using UnityEditor;
using System.Collections.Generic;
using System.IO;
using MyLitJson;
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Text;


public class AnnotationBase {
    public class AnnotationData
    {
        public string originalText;
        public string text;
        public int startIndex;
        public int endIndex;
        public string startStr;
        public string endStr;
        public bool isBeforeContent;
        public bool containsSensitiveWords;
    }

    string _multiLineStartStr;
    string _multiLineEndStr;
    string _singleLineStartStr;
    List<string> _sensitiveWords;

    public AnnotationBase(string multiLineStartStr, string multiLineEndStr, string singleLineStartStr, List<string> sensitiveWords)
    {
        _multiLineStartStr = multiLineStartStr;
        _multiLineEndStr = multiLineEndStr;
        _singleLineStartStr = singleLineStartStr;
        _sensitiveWords = sensitiveWords;
    }

    const string WHITE_SPACE = " \t\n\r";     
    const string ENTER_SPACE = "\n";
    StringReader reader;
    public List<AnnotationData> GetAllAnnotationData(string content)
    {
        List<AnnotationData> list = new List<AnnotationData>();
        int len = content.Length;
        bool isSingleLine = false;
        bool isMultiLine = false;
        AnnotationData data = null;
        StringBuilder textBuilder = null;
        bool isBeforeContent = true;
        for (int i = 0; i < len; i++)
        {
            Char c = content[i];            
            while ( WHITE_SPACE.IndexOf( c ) != -1 )
            {
                if(ENTER_SPACE.IndexOf(c) != -1)
                {
                    if(isSingleLine)
                    {
                        data.text = textBuilder.ToString();
                        data.originalText = data.startStr + data.text + data.endStr;
                        data.endIndex = i - 1;
                        data.isBeforeContent = isBeforeContent;
                        data.containsSensitiveWords = IsContainWords(data.originalText, _sensitiveWords);
                        list.Add(data);
                    }
                    isSingleLine = false;
                }
                if(isMultiLine || isSingleLine)
                {
                    textBuilder.Append(c);
                }    
                // Debug.LogFormat("i={0}, c={1}", i, c.ToString());

                if(i + 1 >= len){
                    break;
                }
                i++;
                c = content[i];
            }                  

            if(!isSingleLine && !isMultiLine)
            {
                if(IsAnnotationStart(content, i))
                {                    
                    isMultiLine = true;
                    data = new AnnotationData(); 
                    data.startIndex = i;
                    data.startStr = GetAnnotationStartStr();
                    data.endStr = GetAnnotationEndStr();
                    textBuilder = new StringBuilder();
                    i = i + GetMultiLineAnnotationStartStrLen() - 1;
                    continue;
                }
                else if(IsSingleLineAnnotationStart(content, i))
                {
                    isSingleLine = true;
                    data = new AnnotationData();
                    data.startIndex = i;
                    data.startStr = GetAnnotationStartStr(true);
                    data.endStr = GetAnnotationEndStr(true);
                    textBuilder = new StringBuilder();
                    i = i + GetSingleLineAnnotationStartStrLen() - 1;
                    continue;
                }
            }else if(isMultiLine)
            {
                if(IsAnnotationEnd(content, i))
                {
                    i = i + GetMultiLineAnnotationEndStrLen() - 1;
                    data.text = textBuilder.ToString();
                    data.originalText = data.startStr + data.text + data.endStr;
                    data.endIndex = i;
                    data.isBeforeContent = isBeforeContent;
                    data.containsSensitiveWords = IsContainWords(data.originalText, _sensitiveWords);
                    list.Add(data);
                    isMultiLine = false;
                    continue;
                }
            }

            if(isMultiLine || isSingleLine)
            {
                textBuilder.Append(c);
            }else{
                isBeforeContent = false;
            }

            if(i + 1 >= len){
                if(isSingleLine)
                {
                    data.text = textBuilder.ToString();
                    data.endIndex = i;
                    data.originalText = data.startStr + data.text + data.endStr;
                    data.isBeforeContent = isBeforeContent;
                    data.containsSensitiveWords = IsContainWords(data.originalText, _sensitiveWords);
                    list.Add(data);
                }
                break;
            }               
        }
        return list;
    }

    protected virtual string GetAnnotationEndStr(bool singleLine = false)
    {
        if(singleLine)
        {
            return "";
        }
        return _multiLineEndStr;
    }

    protected virtual string GetAnnotationStartStr(bool singleLine = false)
    {
        if(singleLine)
        {
            return _singleLineStartStr;
        }        
        return _multiLineStartStr;
    }    

    protected virtual bool IsAnnotationEnd(String content, int start)
    {
        StringBuilder word = new StringBuilder();
        string annotationEndStr = GetAnnotationEndStr();
        int index = 0;
        while(index < GetMultiLineAnnotationEndStrLen() && content.Length > start + index)
        {
            Char c = content[start + index];
            if(annotationEndStr.IndexOf( c ) == -1 )
            {
                break;
            }
            word.Append(c);
            index++;
        }
        return word.ToString() == annotationEndStr;  
    }

    protected virtual bool IsAnnotationStart(string content, int start)
    {
        StringBuilder word = new StringBuilder();
        string annotationStartStr = GetAnnotationStartStr();
        int index = 0;
        while(index < GetMultiLineAnnotationStartStrLen() && content.Length > start + index)
        {
            Char c = content[start + index];
            if(annotationStartStr.IndexOf( c ) == -1 )
            {
                break;
            }
            word.Append(c);
            index++;
        }        
        return word.ToString() == annotationStartStr;     
    }   

    protected virtual bool IsSingleLineAnnotationStart(String content, int start)
    {
        StringBuilder word = new StringBuilder();
        string annotationStartStr = GetAnnotationStartStr(true);
        int index = 0;
        while(index < GetSingleLineAnnotationStartStrLen() && content.Length > start + index)
        {
            Char c = content[start + index];
            if(annotationStartStr.IndexOf( c ) == -1 )
            {
                break;
            }
            word.Append(c);
            index++;
        }
        // Debug.LogFormat("{0},{3},{1},{2}", word, start, index, annotationStartStr);
        return word.ToString() == annotationStartStr;     
    }        

    protected virtual int GetSingleLineAnnotationStartStrLen()
    {
        return _singleLineStartStr.Length;
    }

    protected virtual int GetMultiLineAnnotationStartStrLen()
    {
        return _multiLineStartStr.Length;
    }

    protected virtual int GetMultiLineAnnotationEndStrLen()
    {
        return _multiLineEndStr.Length;
    }

    protected bool IsContainWords(string content, List<string> words)
    {
        for (int i = 0; i < words.Count; i++)
        {
            string word = words[i];
            if(content.IndexOf(word) != -1)
            {
                return true;
            }
        }
        return false;
    }
}
