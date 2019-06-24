#if UNITY_EDITOR
#define XML_DEBUG_OPEN



using System;
using System.IO;
using System.Text;
using System.Xml;
using UnityEngine;
//using System.Linq;


/// <summary> String类隐式转换成其它类型 </summary>
namespace XmlEditor {
    public class StringConvert {
        string mValue;
        public StringConvert(string str) {
            mValue = str;
        }

        public new string ToString() {
            return mValue;
        }

        //实现隐式转换 -string
        public static implicit operator string(StringConvert xs) {
            if (xs.mValue == "null") {
                return "";
            }
            return xs.mValue;
        }

        public static implicit operator StringConvert(string str) {
            return new StringConvert(str);
        }

        //实现隐式转换 - float
        public static implicit operator float(StringConvert xs) {
            return xs.mValue == "" ? 0 : (float)Convert.ToDouble(xs.mValue);
        }
        public static implicit operator StringConvert(float v) {
            return new StringConvert(v.ToString());
        }

        //实现隐式转换 - int
        public static implicit operator int(StringConvert xs) {
            return xs.mValue == "" ? 0 : (int)Convert.ToDouble(xs.mValue);
        }
        public static implicit operator StringConvert(int v) {
            return new StringConvert(v.ToString());
        }

        //实现隐式转换 - uint
        public static implicit operator uint(StringConvert xs) {
            return xs.mValue == "" ? 0 : (uint)Convert.ToDouble(xs.mValue);
        }
        public static implicit operator StringConvert(uint v) {
            return new StringConvert(v.ToString());
        }

        //实现隐式转换 - int64
        public static implicit operator StringConvert(Int64 v) {
            return new StringConvert(v.ToString());
        }
        public static implicit operator Int64(StringConvert xs) {
            return xs.mValue == "" ? 0 : (Int64)Convert.ToDouble(xs.mValue);
        }

        //实现隐式转换 - bool
        public static implicit operator StringConvert(bool v) {
            return new StringConvert(v.ToString());
        }
        public static implicit operator bool(StringConvert xs) {
            if (xs.mValue == "" || xs.mValue.ToLower() == "false" || xs.mValue == "0")
                return false;
            return true;
        }

        //实现隐式转换 - byte
        public static implicit operator StringConvert(byte v) {
            return new StringConvert(v.ToString());
        }
        public static implicit operator byte(StringConvert xs) {
            return xs.mValue == "" ? (byte)0 : Convert.ToByte(xs.mValue);
        }

        //实现隐式转换 - short
        public static implicit operator StringConvert(short v) {
            return new StringConvert(v.ToString());
        }
        public static implicit operator short(StringConvert xs) {
            return xs.mValue == "" ? (short)0 : Convert.ToInt16(xs.mValue);
        }
    }

    public class XMLNodeEx {
        public XMLNodeEx parent;
        public string xmlFileName;
        string nodeName;
        public string Name {
            get {
                return (node != null) ? node.Name : "";
            }
        }

        protected XmlNode node;
        public AttributeEx attributes;
        public XMLNodeEx() {
            attributes = new AttributeEx(this);
        }
        public XMLNodeEx(XMLNodeEx _parent, string _nodeName) {
            parent = _parent;
            nodeName = _nodeName;
            node = parent.GetChildXmlNode(nodeName);
            attributes = new AttributeEx(this);
        }
        public XMLNodeEx(XMLNodeEx _parent, int _index) {
            xmlFileName = _parent.xmlFileName;
            parent = _parent;
            node = parent.GetChildXmlNode(_index);
            attributes = new AttributeEx(this);
        }
        /// <summary>
        /// 返回该JNode对应的XmlNode
        /// </summary>
        /// <param name="Create"></param>
        /// <returns></returns>
        public XmlNode GetXmlNode(bool Create = false) {
            if (Create && node == null) {
                XmlNode xn = parent.GetXmlNode(true);
                node = xn.AppendChild(xn.OwnerDocument.CreateNode(XmlNodeType.Element, nodeName, null));
            }

            return node;
        }

        public XmlNode AddXmlNode(string nodeName) {
            return node.AppendChild(node.OwnerDocument.CreateNode(XmlNodeType.Element, nodeName, null));
        }

        
        public XMLNodeEx AddXmlNodeEx(string nodeName) {
            XMLNodeEx nodeEx = new XMLNodeEx();
            nodeEx.node = AddXmlNode(nodeName);
            nodeEx.parent = this;
            nodeEx.nodeName = nodeName;
            return nodeEx;
        }
        
        public XMLNodeEx RemoveNodeEx(XMLNodeEx nodeEx) {
            nodeEx.node = node.RemoveChild(nodeEx.node);
            return nodeEx;
        }
        
        public void AddAttribute(string name, string value) {
            ((XmlElement)node).SetAttribute(name, value);
        }
        
        public void RemoveAttribute(string name) {
            ((XmlElement)node).RemoveAttribute(name);
        }
        
        public void SetParent(XMLNodeEx node) {
            parent = node;
            node.node.AppendChild(this.node);
        }

        XmlNode GetChildXmlNode(int _index) {
            if (node == null)
                return null;
            return node.ChildNodes[_index];
        }
        XmlNode GetChildXmlNode(string name) {
            if (node == null)
                return null;
            return node.SelectSingleNode(name);
        }
        /// <summary>
        /// 返回子节点的个数
        /// </summary>
        public int Count {
            get {
                return node == null ? 0 : node.ChildNodes.Count;
            }
        }
        public string InnerXml {
            get {
                return node == null ? "" : node.InnerXml;
            }
            set {
                GetXmlNode(true).InnerXml = value;
            }
        }

        public string OuterXml {
            get {
                return node == null ? "" : node.OuterXml;
            }
        }

        public XMLNodeEx this[string NodeName] {
            get {
                return new XMLNodeEx(this, NodeName);
            }
        }

        public XMLNodeEx this[int NodeIndex] {
            get {
                return new XMLNodeEx(this, NodeIndex);
            }
        }
    }

    public class XmlEx : XMLNodeEx {
        XmlDocument xml;
        float mInitTime;

        public XmlEx(string xmlstring, bool hasDocumentElement = true) {
            xml = new XmlDocument();
            xml.LoadXml(xmlstring);
            node = hasDocumentElement ? (XmlNode)xml.DocumentElement : xml;
        }

        /// <summary> 保存文件，保存的是没有带BOM标识UTF-8的文件 </summary>
        public void SaveToFile(string fileName) {
            StreamWriter sw = new StreamWriter(fileName, false, new UTF8Encoding(false));
            xml.Save(sw);
            sw.WriteLine();
            sw.Close();
            //xml.Save(fileName);   //直接用Save是带有BOM标识的

        }

        /// <summary> 读取文件通过文件路径，一般只在Windows或Mac下使用 </summary>
        public void LoadFromFileNoResources(string fileName, bool hasDocumentElement = true) {

            //TextReader stringReader = new StringReader(textAsset.text);
            if (!File.Exists(fileName)) {
                Debug.LogError(string.Format("LoadFromFileNoResources({0})读取的文件不存在!", fileName));
                return;
            }
            xmlFileName = fileName;
            mInitTime = Time.realtimeSinceStartup;
            xml.Load(fileName);
            node = hasDocumentElement ? (XmlNode)xml.DocumentElement : xml;
        }

        /// <summary> 通过字符窜文件,要注意UTF-8不能带BOM标识 </summary>
        public void LoadFromContent(string fileContent, bool hasDocumentElement = true) {
            //TextReader stringReader = new StringReader(textAsset.text);
            //TextReader text = new StringReader(content);
            mInitTime = Time.realtimeSinceStartup;
            //此方法经常出现XmlException: Text node cannot appear in this state.  Line 1, position 1.此异常，目前还没弄清楚是什么问题
            //         System.IO.StringReader stringReader = new System.IO.StringReader(fileContent);
            //         stringReader.Read(); // 跳过 BOM 
            //         xml.Load(stringReader);
            xml.LoadXml(fileContent);
            node = hasDocumentElement ? (XmlNode)xml.DocumentElement : xml;
        }

        public void End() {
#if XML_DEBUG_OPEN
            float pastTime = Time.realtimeSinceStartup - mInitTime;
            if (pastTime > 0.1) {   //大于0.1秒的需要提示
                //if (GameConfigProject.instance.debug.warningLogShow) Debug.LogWarning(string.Format("读取解析XML文件【{0}】花费【{1}】", xmlFileName, Time.realtimeSinceStartup - mInitTime));
            }
#endif
        }
    }

    public class AttributeEx {
        XMLNodeEx node;
        public AttributeEx(XMLNodeEx xn) {
            node = xn;
        }

        public int Count {
            get {
                return node.attributes.Count;
            }
        }

        void SetAttribute(string name, string value) {
            XmlNode xn = node.GetXmlNode(true);
            XmlAttribute xa = xn.Attributes[name];
            if (xa == null)
                xa = xn.Attributes.Append(xn.OwnerDocument.CreateAttribute(name));
            xa.Value = value;
        }

        void SetAttribute(int index, string value) {
            XmlNode xn = node.GetXmlNode(true);
            XmlAttribute xa = xn.Attributes[index];
            if (xa == null)
                return;
            xa.Value = value;
        }

        public StringConvert this[string attributeName] {
            get {
                if (node.GetXmlNode(false) == null || node.GetXmlNode(false).Attributes[attributeName] == null) {
                    Debug.LogError(string.Format(@"XML中的属性【{0}】【{1}】没有找到，请检查!", node.xmlFileName, attributeName));
                    return "";
                }
                return node.GetXmlNode(false).Attributes[attributeName].Value;
            }
            set {
                SetAttribute(attributeName, value);
            }
        }

        public StringConvert this[int attributeIndex] {
            get {
                return (node.GetXmlNode(false) == null || node.GetXmlNode(false).Attributes[attributeIndex] == null) ? "" : node.GetXmlNode(false).Attributes[attributeIndex].Value;
            }
            //set { SetAttribute(AttributeIndex, value); }
        }

        public XmlAttribute this[int AttributeIndex, bool returnXmlAttribute] {
            get {
                return node.GetXmlNode(false).Attributes[AttributeIndex];
            }
        }
    }

    public class XmlReaderEx {
        XmlTextReader mXmlReader;
        float mInitTime;
        public string xmlFileName;

        /// <summary> 没有属性字段时是否报错 </summary>
        public bool errorNoAttributeName = true;

        /// <summary> xml文件不存在是否有信息提示 </summary>
        bool xmlInexistencePrompt = true;

        /// <summary>
        /// 判断文件编码格式，文件头开始字节为60，33为不带签名UTF8，文件头为239，187为带签名UTF8
        /// </summary>
        /// <param name="filename"></param>
        /// <returns></returns>
        public Encoding GetFileEncodeType(string filename) {
            Encoding e1 = Encoding.Default;

            FileStream fs = new FileStream(filename, FileMode.Open, FileAccess.Read);
            BinaryReader br = new BinaryReader(fs);
            Byte[] buffer = br.ReadBytes(2);
            if (buffer[0] == 239 && buffer[1] == 187) {
                e1 = Encoding.UTF8;
            } else {
                e1 = Encoding.Default;
            }
            return e1;
        }

        public XmlReaderEx(string fileName, bool xmlInexistencePrompt = true) {
            xmlFileName = fileName;
            this.xmlInexistencePrompt = xmlInexistencePrompt;
            LoadFromFileNoResource(fileName);
        }

        public XmlReaderEx() {
        }

        public XmlTextReader textReader {
            get {
                return mXmlReader;
            }
        }

        /// <summary> 通过文件路径加载 </summary>
        public void ResourcesLoadFromFile(string fileName) {
            mInitTime = Time.realtimeSinceStartup;
            if (fileName.LastIndexOf('.') > 0) {
                fileName = fileName.Substring(0, fileName.LastIndexOf('.'));    //Resource.Load()不需要后缀名 
            }
            TextAsset textAsset = Resources.Load(fileName, typeof(TextAsset)) as TextAsset;
            if (textAsset == null) {
                Debug.LogError(string.Format("未找到名为【{0}】的xml文件", fileName));
                return;
            }

            xmlFileName = fileName;
            TextReader stringReader = new StringReader(textAsset.text);
            mXmlReader = new XmlTextReader(stringReader);
        }

        /// <summary> 从字符窜内容加载 </summary>
        public void LoadFromContent(string text) {
            TextReader stringReader = new StringReader(text);
            //stringReader.Read();
            mXmlReader = new XmlTextReader(stringReader);
        }


        /// <summary> 不通过Resource方式加载 </summary>
        public void LoadFromFileNoResource(string fileName) {
            mInitTime = Time.realtimeSinceStartup;
            if (!File.Exists(fileName)) {
                if (xmlInexistencePrompt) {
                    Debug.LogError(string.Format("LoadFromFileNoResources({0})读取的文件不存在!", fileName));
                }

                return;
            }
            Stream inStream = new FileStream(fileName, FileMode.Open, FileAccess.Read, FileShare.Read);
            TextReader txtReader = new StreamReader(inStream, Encoding.UTF8);
            //txtReader.Read(); // 跳过 BOM 
            mXmlReader = new XmlTextReader(txtReader);
            xmlFileName = fileName;
        }

        public bool Read() {
            return mXmlReader.Read();
        }

        public StringConvert this[string attributeName] {
            get {
                string attribute = mXmlReader.GetAttribute(attributeName);
                if (attribute == null) {
                    if (errorNoAttributeName) {
                        Debug.LogError(string.Format(@"XML中的属性【{0}】【{1}】没有找到，请检查!", xmlFileName, attributeName));
                    }
                    return "";
                }
                return attribute;
            }
            //set { SetAttribute(attributeName, value); }
        }

        public void End() {
            mXmlReader.Close();
#if XML_DEBUG_OPEN
            float pastTime = Time.realtimeSinceStartup - mInitTime;
            if (pastTime > 0.05) {   //大于0.1秒的需要提示
                //if (GameConfigProject.instance.debug.warningLogShow) Debug.LogWarning(string.Format("读取解析XML文件【{0}】花费【{1}】", xmlFileName, Time.realtimeSinceStartup - mInitTime));
            }
#endif
        }

    }

    public class TextAssetEx {
        public TextAsset textAsset;

        public TextAssetEx(string fileName) {
            textAsset = LoadFromFile(fileName);
        }

        /// <summary> 通过文件路径加载 </summary>
        public TextAsset LoadFromFile(string fileName) {
            TextAsset textAsset = Resources.Load(fileName, typeof(TextAsset)) as TextAsset;
            if (textAsset == null) {
                Debug.LogError(string.Format("未找到名为【{0}】的xml文件", fileName));

            }
            return textAsset;
        }
    }
}

#region 使用方法
//比如有如下的XML表
//<?xml version="1.0" encoding="UTF-8"?>
//<basenode>
//	<node NpcId="80001" Npc名="孙悟空" X轴="40" Y轴="30"/>
//	<node NpcId="80002" Npc名="唐三藏" X轴="65" Y轴="30"/>
//	<node NpcId="80003" Npc名="龙王" X轴="90" Y轴="30"/>
//	<node NpcId="80004" Npc名="猪八戒" X轴="115" Y轴="30"/>
//	<node NpcId="80005" Npc名="沙悟净" X轴="140" Y轴="30"/>
//	<node NpcId="80006" Npc名="太上老君" X轴="165" Y轴="30"/>
//</basenode>

///读取
//XmlEx xml = new XmlEx("<basenode></basenode>");
//xml.LoadFromFile(fileName);
//int npcId = xml["node"].attributes["NpcId"];
//string npcName = xml["node"].attributes["Npc名"];


//XmlEx xml = new XmlEx("<basequests></basequests>");
//xml.LoadFromFile(fileName);
//xml["settings"].Attributes["PlayerName"] = "someone";
//xml["settings"].Attributes["Hp"] = 200;
//int ServerPort = xml["settings"]["server"].Attributes["port"];
//string ServerIP = xml["settings"]["server"].Attributes["ip"];
//string msg = xml["chat"]["msg"].InnerXml;
////读取玩家所有的好友信息
//for (int i = 0; i < xml["friends"].Count; i++)
//{
//     int id = xml["friends"][i].Attributes["Id"];
//     string name = xml["friends"][i].Attributes["Name"];
//}
//xml.SaveToFile(fileName);
#endregion  
#endif