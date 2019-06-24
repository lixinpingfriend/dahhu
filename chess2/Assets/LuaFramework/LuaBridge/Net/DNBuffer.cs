

using UnityEngine;
using System;
using System.IO;
using System.Net;
using System.Net.Sockets;
using System.Threading;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System.Text;
using LuaInterface;

namespace DNet
{
    public class ByteBuffer
    {
        //字节缓存区
        private byte[] buf;
        //读取索引
        private int readIndex = 0;
        //写入索引
        private int writeIndex = 0;
        //读取索引标记
        private int markReadIndex = 0;
        //写入索引标记
        private int markWirteIndex = 0;
        //缓存区字节数组的长度
        private int capacity;

        /**
            * 构造方法
            */
        public ByteBuffer(int capacity)
        {
            buf = new byte[capacity];
            this.capacity = capacity;
        }

        /**
            * 构造方法
            */
        public ByteBuffer(byte[] bytes)
        {
            buf = bytes;
            this.capacity = bytes.Length;
        }

        /**
            * 构建一个capacity长度的字节缓存区ByteBuffer对象
            */
        public static ByteBuffer Allocate(int capacity)
        {
            return new ByteBuffer(capacity);
        }

        /**
            * 构建一个以bytes为字节缓存区的ByteBuffer对象，一般不推荐使用
            */
        public static ByteBuffer Allocate(byte[] bytes)
        {
            return new ByteBuffer(bytes);
        }
        public int length { get { return writeIndex; } }

        /**
            * 根据length长度，确定大于此leng的最近的2次方数，如length=7，则返回值为8
            */
        private int FixLength(int length)
        {
            int n = 2;
            int b = 2;
            while (b < length)
            {
                b = 2 << n;
                n++;
            }
            return b;
        }

        /**
            * 翻转字节数组，如果本地字节序列为低字节序列，则进行翻转以转换为高字节序列
            */
        private byte[] flip(byte[] bytes)
        {
            if (BitConverter.IsLittleEndian)
            {
                Array.Reverse(bytes);
            }
            return bytes;
        }

        /**
            * 确定内部字节缓存数组的大小
            */
        private int FixSizeAndReset(int currLen, int futureLen)
        {
            if (futureLen > currLen)
            {
                //以原大小的2次方数的两倍确定内部字节缓存区大小
                int size = FixLength(currLen) * 2;
                if (futureLen > size)
                {
                    //以将来的大小的2次方的两倍确定内部字节缓存区大小
                    size = FixLength(futureLen) * 2;
                }
                byte[] newbuf = new byte[size];
                Array.Copy(buf, 0, newbuf, 0, currLen);
                buf = newbuf;
                capacity = newbuf.Length;
            }
            return futureLen;
        }

        /**
            * 将bytes字节数组从startIndex开始的length字节写入到此缓存区
            */
        public void WriteBytes(byte[] bytes, int startIndex, int length)
        {
            lock (this)
            {
                int offset = length - startIndex;
                if (offset <= 0) return;
                int total = offset + writeIndex;
                int len = buf.Length;
                FixSizeAndReset(len, total);
                for (int i = writeIndex, j = startIndex; i < total; i++, j++)
                {
                    buf[i] = bytes[j];
                }
                writeIndex = total;
            }
        }

        /**
            * 将字节数组中从0到length的元素写入缓存区
            */
        public void WriteBytes(byte[] bytes, int length)
        {
            WriteBytes(bytes, 0, length);
        }

        /**
            * 将字节数组全部写入缓存区
            */
        public void WriteBytes(byte[] bytes)
        {
            WriteBytes(bytes, bytes.Length);
        }

        /**
            * 将一个ByteBuffer的有效字节区写入此缓存区中
            */
        public void Write(ByteBuffer buffer)
        {
            if (buffer == null) return;
            if (buffer.ReadableBytes() <= 0) return;
            WriteBytes(buffer.ToArray());
        }

        /**
            * 写入一个int16数据
            */
        public void WriteShort(short value)
        {
            WriteBytes(flip(BitConverter.GetBytes(value)));
        }

        /**
            * 写入一个uint16数据
            */
        public void WriteUshort(ushort value)
        {
            WriteBytes(flip(BitConverter.GetBytes(value)));
        }

        /**
            * 写入一个int32数据
            */
        public void WriteInt(int value)
        {
            //byte[] array = new byte[4];
            //for (int i = 3; i >= 0; i--)
            //{
            //    array[i] = (byte)(value & 0xff);
            //    value = value >> 8;
            //}
            //Array.Reverse(array);
            //Write(array);
            WriteBytes(flip(BitConverter.GetBytes(value)));
        }

        /**
            * 写入一个uint32数据
            */
        public void WriteUint(uint value)
        {
            WriteBytes(flip(BitConverter.GetBytes(value)));
        }

    /**
        * 写入一个int64数据
        
    public void WriteLong(long value)
    {
        WriteBytes(flip(BitConverter.GetBytes(value)));
    }*/

    /**
        * 写入一个uint64数据
        */
    public void WriteUlong(ulong value)
        {
            WriteBytes(flip(BitConverter.GetBytes(value)));
        }

        /**
            * 写入一个float数据
            */
        public void WriteFloat(float value)
        {
            WriteBytes(flip(BitConverter.GetBytes(value)));
        }

        /**
            * 写入一个byte数据
            */
        public void WriteByte(byte value)
        {
            lock (this)
            {
                int afterLen = writeIndex + 1;
                int len = buf.Length;
                FixSizeAndReset(len, afterLen);
                buf[writeIndex] = value;
                writeIndex = afterLen;
            }
        }

        /**
            * 写入一个double类型数据
            */
        public void WriteDouble(double value)
        {
            WriteBytes(flip(BitConverter.GetBytes(value)));
        }

        /**
            * 读取一个字节
            */
        public byte ReadByte()
        {
            byte b = buf[readIndex];
            readIndex++;
            return b;
        }

        /**
            * 从读取索引位置开始读取len长度的字节数组
            */
        private byte[] Read(int len)
        {
            byte[] bytes = new byte[len];
            Array.Copy(buf, readIndex, bytes, 0, len);
            if (BitConverter.IsLittleEndian)
            {
                Array.Reverse(bytes);
            }
            readIndex += len;
            return bytes;
        }

        /**
            * 读取一个uint16数据
            */
        public ushort ReadUshort()
        {
            return BitConverter.ToUInt16(Read(2), 0);
        }

        /**
            * 读取一个int16数据
            */
        public short ReadShort()
        {
            return BitConverter.ToInt16(Read(2), 0);
        }

        /**
            * 读取一个uint32数据
            */
        public uint ReadUint()
        {
            return BitConverter.ToUInt32(Read(4), 0);
        }

        /**
            * 读取一个int32数据
            */
        public int ReadInt()
        {
            return BitConverter.ToInt32(Read(4), 0);
        }

        /**
            * 读取一个uint64数据
            */
        public ulong ReadUlong()
        {
            return BitConverter.ToUInt64(Read(8), 0);
        }

    /**
        * 读取一个long数据
       
    public long ReadLong()
    {
        return BitConverter.ToInt64(Read(8), 0);
    }
     */

    /**
        * 读取一个float数据
        */
    public float ReadFloat()
        {
            return BitConverter.ToSingle(Read(4), 0);
        }

        /**
            * 读取一个double数据
            */
        public double ReadDouble()
        {
            return BitConverter.ToDouble(Read(8), 0);
        }

        /**
            * 从读取索引位置开始读取len长度的字节到disbytes目标字节数组中
            * @params disstart 目标字节数组的写入索引
            */
        public void ReadBytes(byte[] disbytes, int disstart, int len)
        {
            int size = disstart + len;
            for (int i = disstart; i < size; i++)
            {
                disbytes[i] = this.ReadByte();
            }
        }

        public byte[] ReadBytes(int len)
        {
            byte[] data = new byte[len];
            for (int i = 0; i < data.Length; i++)
            {
                data[i] = this.ReadByte();
            }
            return data;
        }

        /**
            * 清除已读字节并重建缓存区
            */
        public void DiscardReadBytes()
        {
            if (readIndex <= 0) return;
            int len = buf.Length - readIndex;
            byte[] newbuf = new byte[len];
            Array.Copy(buf, readIndex, newbuf, 0, len);
            buf = newbuf;
            writeIndex -= readIndex;
            markReadIndex -= readIndex;
            if (markReadIndex < 0)
            {
                markReadIndex = readIndex;
            }
            markWirteIndex -= readIndex;
            if (markWirteIndex < 0 || markWirteIndex < readIndex || markWirteIndex < markReadIndex)
            {
                markWirteIndex = writeIndex;
            }
            readIndex = 0;
        }

        /**
            * 清空此对象
            */
        public void Clear()
        {
            buf = new byte[buf.Length];
            readIndex = 0;
            writeIndex = 0;
            markReadIndex = 0;
            markWirteIndex = 0;
        }

        /**
            * 设置开始读取的索引
            */
        public void SetReaderIndex(int index)
        {
            if (index < 0) return;
            readIndex = index;
        }

        /**
            * 标记读取的索引位置
            */
        public void MarkReaderIndex()
        {
            markReadIndex = readIndex;
        }

        /**
            * 标记写入的索引位置
            */
        public void MarkWriterIndex()
        {
            markWirteIndex = writeIndex;
        }

        /**
            * 将读取的索引位置重置为标记的读取索引位置
            */
        public void ResetReaderIndex()
        {
            readIndex = markReadIndex;
        }

        /**
            * 将写入的索引位置重置为标记的写入索引位置
            */
        public void ResetWriterIndex()
        {
            writeIndex = markWirteIndex;
        }

        /**
            * 可读的有效字节数
            */
        public int ReadableBytes()
        {
            return writeIndex - readIndex;
        }

        /**
            * 获取可读的字节数组
            */
        public byte[] ToArray()
        {
            byte[] bytes = new byte[writeIndex];
            Array.Copy(buf, 0, bytes, 0, bytes.Length);
            return bytes;
        }

        /**
            * 获取缓存区大小
            */
        public int GetCapacity()
        {
            return this.capacity;
        }

        /**
           写字符串
               **/
        public void WriteUTF(string str)
        {
            if (str == null)
            {
                WriteByte(0);
            }
            else
            {
                WriteByte(1);
                byte[] bytesTemp = System.Text.Encoding.UTF8.GetBytes(str);
                WriteInt(bytesTemp.Length);
                WriteBytes(bytesTemp);
            }
        }

        public string ReadUTF()
        {
            string jsonStr = null;
            byte b = ReadByte();
            if (b == 1)
            {
                int length = ReadInt();
                byte[] bytesTemp = ReadBytes(length);
                jsonStr = Encoding.UTF8.GetString(bytesTemp);
            }
            return jsonStr;
        }


        public bool ReadBool()
        {
            byte has = ReadByte();
            if (has != 0)
            {
                return true;
            }
            return false;
        }

        public int[] ReadArray()
        {//读数组
            int size = ReadInt();
            int[] result = new int[size];
            for (int i = 0; i < size; i++)
            {
                result[i] = ReadInt();
            }
            return result;
        }

        public List<int> ReadList()
        {//读数组
            int size = ReadInt();
            List<int> result = new List<int>();
            for (int i = 0; i < size; i++)
            {
                result.Add(ReadInt());
            }
            return result;
        }

        public List<string> ReadListStr()
        {//读数组
            int size = ReadInt();
            List<string> result = new List<string>();
            for (int i = 0; i < size; i++)
            {
                result.Add(ReadUTF());
            }
            return result;
        }
    }

    public class Buffer
    {
        static DNList<Buffer> mPool = new DNList<Buffer>();
        private MemoryStream mStream;
        private BinaryWriter mWriter;
        private BinaryReader mReader;

        private int mCounter = 0;
        private int mSize = 0;
        private bool mWriting = false;
        private bool mInPool = false;

        public string messageName; 


        //协议类型
        public int msgProtolType = 1;

        /// <summary>
        /// 通讯的返回结果果。 小于0代表有错误
        /// </summary>
        public int msgRetCode = 0;

        public ByteBuffer  memberData;

//#if UNITY_IPHONE
//        static PBMessageSerializer serializer = new PBMessageSerializer();
//#endif
        private Buffer()
        {
            mStream = new MemoryStream();
            mWriter = new BinaryWriter(mStream);
            mReader = new BinaryReader(mStream);
        }

        ~Buffer()
        {
            //Console.WriteLine("DISPOSED " + (Packet)PeekByte(4));
            mStream.Dispose();
        }

        /// <summary>
        /// The size of the data present in the buffer.
        /// </summary>

        public int size
        {
            get
            {
                return mWriting ? (int)mStream.Position : mSize - (int)mStream.Position;
            }
        }

        /// <summary>
        /// Position within the stream.
        /// </summary>

        public int position { get { return (int)mStream.Position; } set { mStream.Seek(value, SeekOrigin.Begin); } }

        /// <summary>
        /// Get the entire buffer (note that it may be bigger than 'size').
        /// 获取整个Buffer的长度
        /// </summary>

        public byte[] buffer { get { return mStream.GetBuffer(); } }

        private CDecompress msgDataDecompresser;
        private string needDecompressMsgName;

        public void SetMessageName(CDecompress msgDataDecompresser, string needDecompressMsgName) {
                if (msgProtolType == 3) {
                    messageName = System.Text.Encoding.UTF8.GetString(buffer, 4, this.PeekUInt16(2, true));
                } else {
                    this.msgDataDecompresser = msgDataDecompresser;
                    this.needDecompressMsgName = needDecompressMsgName;
                    //命令分组
                    messageName = BitConverter.ToInt32(buffer, 0).ToString();
                }
        }      

        //获取正真的proto数据
        [LuaByteBuffer]
        public byte[] dataBuffer {
            get {
                byte[] data;
                mStream.SetLength(mStream.Position);
                if (msgProtolType == 3) {           //协议2的包头的长度是动态 总长度(2字节)|Pbc的MessageName长度(2字节)|Pbc的MessageName真正数据(动态长度)|Pbc的MessageData长度(2字节)|Pbc的MessageData真正数据(动态长度)
                    int messageNameLength = this.PeekUInt16(2, true);
                    int dataSize = this.PeekUInt16(4 + messageNameLength, true);
                    mStream.Seek(2 + 2 + messageNameLength + 2, SeekOrigin.Begin);
                    data = new byte[dataSize];
                    for (int i = 0; i < data.Length; i++) {
                        data[i] = (byte)mStream.ReadByte();
                    }
                } else {  
                    mStream.Seek(8, SeekOrigin.Begin);
                    data = new byte[mStream.Length - 8];
                    for (int i = 0; i < data.Length; i++) {
                        data[i] = (byte)mStream.ReadByte();
                    }
                    // Debug.Log(data.Length);
                    if (messageName == needDecompressMsgName) {
                        uint Len, use;
                        msgDataDecompresser.PreDecompress(data, out Len, out use);
                        byte[] dcp = new byte[Len];
                        msgDataDecompresser.Decompress(data, ref dcp);
                        data = dcp;
                    }
                }
                return data;
            }
        }

        /// <summary>
        /// Number of buffers in the recycled list.
        /// </summary>

        static public int recycleQueue { get { return mPool.size; } }

        /// <summary>
        /// OnCreate a new buffer, reusing an old one if possible.
        /// </summary>

        static public Buffer Create(int msgProtolType)
        {
            Buffer buffer = Create(true);
            buffer.msgProtolType = msgProtolType;
            return buffer;
        }

        /// <summary>
        /// OnCreate a new buffer, reusing an old one if possible.
        /// </summary>
        [NoToLuaAttribute]
        static public Buffer Create(bool markAsUsed)
        {
            Buffer b = null;
            lock (mPool) {
                if (mPool.size != 0) {
                    b = mPool.Pop();
                    b.mInPool = false;
                } else {
                    b = new Buffer();
                }
            }
            b.mCounter = markAsUsed ? 1 : 0;
            b.mStream.Seek(0, SeekOrigin.Begin);
            b.mSize = 0;
            return b;
        }

        /// <summary>
        /// Release the buffer into the reusable pool.
        /// </summary>

        public bool Recycle()
        {
            return Recycle(true);
        }

        /// <summary>
        /// Release the buffer into the reusable pool.
        /// </summary>
        [NoToLua]
        public bool Recycle(bool checkUsedFlag)
        {
            if (!mInPool && (!checkUsedFlag || MarkAsUnused()))
            {
                mInPool = true;
                lock (mPool)
                {
                    Clear();
                    mPool.Add(this);
                }
                return true;
            }
            return false;
        }

        /// <summary>
        /// Recycle an entire queue of buffers.
        /// </summary>
        [NoToLua]
        static public void Recycle(Queue<Buffer> list)
        {
            lock (mPool)
            {
                while (list.Count != 0)
                {
                    Buffer b = list.Dequeue();
                    b.Clear();
                    mPool.Add(b);
                }
            }
        }

        [NoToLua]
        /// <summary>
        /// Recycle an entire list of buffers.
        /// </summary>

        static public void Recycle(DNList<Buffer> list)
        {
            lock (mPool)
            {
                for (int i = 0; i < list.size; ++i)
                {
                    Buffer b = list[i];
                    b.Clear();
                    mPool.Add(b);
                }
                list.Clear();
            }
        }

        /// <summary>
        /// Mark the buffer as being in use.
        /// </summary>

        private void MarkAsUsed()
        {
            Interlocked.Increment(ref mCounter);
        }

        /// <summary>
        /// Mark the buffer as no longer being in use. Return 'true' if no one is using the buffer.
        /// </summary>

        private bool MarkAsUnused()
        {
            if (Interlocked.Decrement(ref mCounter) > 0) return false;
            mSize = 0;
            mStream.Seek(0, SeekOrigin.Begin);
            mWriting = true;
            return true;
        }

        /// <summary>
        /// Clear the buffer.
        /// </summary>

        public void Clear()
        {
            mCounter = 0;
            mSize = 0;
            mStream.Seek(0, SeekOrigin.Begin);
            mWriting = true;
        }

        /// <summary>
        /// Dispose of the allocated memory.
        /// </summary>

        [NoToLua]
        public void Dispose()
        {
            mStream.Dispose();
        }

        public void WriteUShort(ushort value) {
            mWriter.Write(value);
        }
        
        public void WriteUInt(uint value) {
            mWriter.Write(value);
            Debug.Log(position);
        }

        public void WriteInt(int value) {
            mWriter.Write(value);
        }

        public void WriteLong(long value) {
            mWriter.Write(value);
        }

        public void WriteString(string value) {
            byte[] bytes = System.Text.Encoding.UTF8.GetBytes(value);
            mWriter.Write(bytes);
        }

        public void WriteByte(byte value) {
            mWriter.Write(value);
        }

        public void WriteBytes(byte[] value) {
            mWriter.Write(value);
        }

        public void EndWrite() {
            mSize = position;
            mStream.Seek(0, SeekOrigin.Begin);
            mWriting = false;
        }

        //据说Lua直接传bytes效率会有损失
        public void WriteBufferMsgProtolType1(byte[] bytes, string messageName, int tagHeadUserData) {
            mWriting = true;
            mSize = 0;
            mStream.Seek(0, SeekOrigin.Begin);
            this.messageName = messageName;
            //mWriter.Write(int.Parse(messageName));
            //if (bytes != null) {
            //    mWriter.Write(bytes.Length);
            //    mStream.Write(bytes, 0, bytes.Length);
           // } else {
           //     mWriter.Write(0);
            //}
            int headLen = 2;
            if (bytes != null) {
                headLen = 2 + bytes.Length;
            }
            memberData = new ByteBuffer(0);
            memberData.WriteInt(headLen);
            memberData.WriteShort(short.Parse(messageName));
            memberData.WriteBytes(bytes);
             
            //mWriter.Write(data.ToArray().Length);
            //mStream.Write(data.ToArray(), 0, data.ToArray().Length);
           // mSize = position;
            //mStream.Seek(0, SeekOrigin.Begin);
           // mWriting = false;

        }

        //据说Lua直接传bytes效率会有损失
        public void WriteBufferMsgProtolType2(byte[] bytes, string messageName, int tagHeadUserData) {
            mWriting = true;
            mSize = 0;
            mStream.Seek(0, SeekOrigin.Begin);
            this.messageName = messageName;
            mWriter.Write(int.Parse(messageName));
            if (bytes != null) {
                mWriter.Write(bytes.Length);
            } else {
                mWriter.Write(0);
            }
            mWriter.Write(tagHeadUserData);
            if (bytes != null) {
                mStream.Write(bytes, 0, bytes.Length);
            }
            mSize = position;
            mStream.Seek(0, SeekOrigin.Begin);
            mWriting = false;
        }


        public void WriteBufferMsgProtolType3(byte[] bytes, string messageName) {
            byte[] messageNameBytes = System.Text.Encoding.ASCII.GetBytes(messageName);
            mWriting = true;
            mSize = 0;
            mStream.Seek(0, SeekOrigin.Begin);
            this.messageName = messageName;
            //整个包的总长度
            //C# 默认是小端，服务器数据传输为大端
            mWriter.Write(IPAddress.NetworkToHostOrder((short)(4 + messageNameBytes.Length + bytes.Length)));
            mWriter.Write(IPAddress.NetworkToHostOrder((short)messageNameBytes.Length));
            mWriter.Write(messageNameBytes);
            mWriter.Write(IPAddress.NetworkToHostOrder((short)bytes.Length));
            // bytes = new byte[29]{0 ,27, 0, 14, 76, 111, 103, 105, 110, 46, 76, 111, 103, 105, 110, 82, 101, 113, 0, 9, 18, 0, 10, 5, 49, 50, 51, 52, 53};
            if (bytes != null) {
                mStream.Write(bytes, 0, bytes.Length);
            }
            mSize = position;
            mStream.Seek(0, SeekOrigin.Begin);
            mWriting = false;
        }

        /// <summary>
        /// Begin the writing process.
        /// </summary>
        public BinaryWriter BeginWriting(bool append)
        {
            if (!append || !mWriting)
            {
                mStream.Seek(0, SeekOrigin.Begin);
                mSize = 0;
            }
            mWriting = true;
            return mWriter;
        }

        /// <summary>
        /// Begin the reading process.
        /// </summary>
        public BinaryReader BeginReading()
        {
            if (mWriting)
            {
                mWriting = false;
                mSize = (int)mStream.Position;
                mStream.Seek(0, SeekOrigin.Begin);
            }
            return mReader;
        }


        /// <summary>
        /// Peek at the first byte at the specified offset.
        /// </summary>
        public int PeekByte(int offset)
        {
            long pos = mStream.Position;
            if (offset + 1 > pos) {
                Debug.LogError("PeekByte offset + 1 > pos");
                return -1;
            }
            mStream.Seek(offset, SeekOrigin.Begin);
            int val = mReader.ReadByte();
            mStream.Seek(pos, SeekOrigin.Begin);
            return val;
        }

        /// <summary>
        /// Peek at the first byte at the specified offset.
        /// </summary>
        public int PeekInt16(int offset, bool hostToNetworkOrder = false)
        {
            long pos = mStream.Position;
            if (offset + 2 > pos)  {
                Debug.LogError("PeekInt16 erro offset + 2 > pos");
                return -1;
            }
            mStream.Seek(offset, SeekOrigin.Begin);
            int val = mReader.ReadInt16();
            if (hostToNetworkOrder) {
                val = IPAddress.HostToNetworkOrder((short)val);
            }
            mStream.Seek(pos, SeekOrigin.Begin);
            return val;
        }

        public int ReadInt(int offset, bool hostToNetworkOrder = false)
        {
            long pos = mStream.Position;
            if (offset + 4 > pos)  {
                Debug.LogError("ReadInt erro offset + 4> pos");
                return -1;
            }
            mStream.Seek(offset, SeekOrigin.Begin);
            int val =BitConverter.ToInt32(mReader.ReadBytes(4), 0);// mReader.ReadInt16();
            mStream.Seek(pos, SeekOrigin.Begin);
            return val;
        }

         public short ReadShort(int offset, bool hostToNetworkOrder = false)
        {
            long pos = mStream.Position;
            if (offset + 2 > pos)  {
                Debug.LogError("ReadShort erro offset + 4> pos");
                return -1;
            }
            mStream.Seek(offset, SeekOrigin.Begin);
            short val =BitConverter.ToInt16(mReader.ReadBytes(2), 0);// mReader.ReadInt16();
            mStream.Seek(pos, SeekOrigin.Begin);
            return val;
        }

        public UInt16 PeekUInt16(int offset, bool hostToNetworkOrder = false)
        {
            long pos = mStream.Position;
            if (offset + 2 > pos) {
                Debug.LogError("PeekUInt16 erro offset + 2 > pos");
                return 0;
            }
            mStream.Seek(offset, SeekOrigin.Begin);
            int val = mReader.ReadUInt16();
            if (hostToNetworkOrder) {
                val = IPAddress.HostToNetworkOrder((short)val);
            }
            mStream.Seek(pos, SeekOrigin.Begin);
            return (UInt16)val;
        }

        public uint PeekUInt32(int offset, bool hostToNetworkOrder = false) {
            long pos = mStream.Position;
            if (offset + 4 > pos) {
                Debug.LogError("PeekUInt32 erro offset + 4 > pos");
                return 0;
            }
            mStream.Seek(offset, SeekOrigin.Begin);
            uint val = mReader.ReadUInt32();
            if (hostToNetworkOrder) {
                val = (uint)IPAddress.HostToNetworkOrder((int)val);
            }
            mStream.Seek(pos, SeekOrigin.Begin);
            return val;
        }

        /// <summary>
        /// Peek at the first integer at the specified offset.
        /// </summary>

        public int PeekInt(int offset, bool hostToNetworkOrder = false)
        {
            long pos = mStream.Position;
            if (offset + 4 > pos) {
                Debug.LogError("PeekInt erro offset + 4 > pos");
                return -1;
            }
            mStream.Seek(offset, SeekOrigin.Begin);
            int val = mReader.ReadInt32();
            if (hostToNetworkOrder) {
                val = IPAddress.HostToNetworkOrder(val);
            }
            mStream.Seek(pos, SeekOrigin.Begin);
            return val;
        }


        private VideoData videoData;
        public VideoData GetPlayBackInfo(byte[] Buffer_)
        {
            videoData = new VideoData();
            int offSet = 0;
            //游戏版本号
            byte[] versionByte = new byte[4];
            versionByte[0] = Buffer_[offSet];
            versionByte[1] = Buffer_[offSet + 1];
            versionByte[2] = Buffer_[offSet + 2];
            versionByte[3] = Buffer_[offSet + 3];
            uint version = BitConverter.ToUInt32(versionByte, 0);
            byte[] gzLengthByte = new byte[2];
            uint gzLength = 0;
            if (version != 1)
            {
                gzLengthByte[0] = Buffer_[offSet];
                gzLengthByte[1] = Buffer_[offSet + 1];
                gzLength = BitConverter.ToUInt16(gzLengthByte, 0);
                byte[] headData = new byte[gzLength];
                Array.Copy(Buffer_, offSet + 2, headData, 0, gzLength);
                videoData.headData = headData;
            }
            else
            {
                offSet += 4;
                gzLengthByte[0] = Buffer_[offSet];
                gzLengthByte[1] = Buffer_[offSet + 1];
                gzLength = BitConverter.ToUInt16(gzLengthByte, 0);
                //规则，如人数、等等
                byte[] gzStrByte = new byte[gzLength];
                Array.Copy(Buffer_, offSet + 2, gzStrByte, 0, gzLength);
                videoData.rule = System.Text.Encoding.UTF8.GetString(gzStrByte);
            }

            offSet += (int)gzLength + 2;
            CDecompress cd = new CDecompress();
            while (true)
            {
                byte[] HeadByte = new byte[2];
                HeadByte[0] = Buffer_[offSet];
                HeadByte[1] = Buffer_[offSet + 1];
                ushort length_ = BitConverter.ToUInt16(HeadByte, 0);
                byte[] BodyByte = new byte[length_];
                Array.Copy(Buffer_, offSet += 2, BodyByte, 0, length_);
                offSet += length_;
                uint length__ = 0;
                uint jbz = 0;
                cd.PreDecompress(BodyByte, out length__, out jbz);
                byte[] GS = new byte[length__];
                cd.Decompress(BodyByte, ref GS);
                videoData.frames.Add(new VideoFrameData(GS));
                if (offSet == Buffer_.Length)
                {
                    break;
                }
                else if (offSet >= Buffer_.Length)
                {
                    Debug.Log("解析出问题了 offSet: " + offSet + " Buffer_.Length: " + Buffer_.Length);
                    break;
                }
            }
            return videoData;
        }
    }

    public class VideoData
    {
        public List<VideoFrameData> frames = new List<VideoFrameData>();
        [LuaByteBuffer]
        public byte[] headData
        {
            get
            {
                return mHeadData;
            }
            set
            {
                mHeadData = value;
            }
        }
        private byte[] mHeadData;
        public string rule;
    }

    public class VideoFrameData
    {
        [LuaByteBuffer]
        public byte[] buffer
        {
            get
            {
                return m_buffer;
            }
        }
        private byte[] m_buffer;
        public VideoFrameData(byte[] data)
        {
            m_buffer = data;
        }
    }
}


