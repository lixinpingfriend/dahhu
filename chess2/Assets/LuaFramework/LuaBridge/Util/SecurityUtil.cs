

using UnityEngine;
using System.Collections;
using System.IO;
using System;
using System.Security.Cryptography;
using System.Text;

public static class SecurityUtil  {

    public static string GetMd5HashFromFile(string fileName) {
        System.IO.FileStream fileStream = new System.IO.FileStream(fileName, System.IO.FileMode.Open);
        return GetMd5FromStream(fileStream);
    }

    public static string GetMd5HashFromStr(string text) {
        return GetMd5HashFromBytes(System.Text.Encoding.UTF8.GetBytes(text));
    }

    public static string GetMd5HashFromBytes(byte[] data) {
        System.IO.MemoryStream stream = new System.IO.MemoryStream(data);
        return GetMd5FromStream(stream);
    }

    static string GetMd5FromStream(System.IO.Stream stream) {
        MD5 md5 = new MD5CryptoServiceProvider();
        byte[] retVal = md5.ComputeHash(stream);
        stream.Close();

        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        for (int i = 0; i < retVal.Length; i++) {
            sb.Append(retVal[i].ToString("x2"));
        }
        return sb.ToString();
    }

    public static string Getmd5JiaMi(string TimeChuo, string UserID, string salt_a, string salt_b)
    {
        MD5 md5 = new MD5CryptoServiceProvider();
        string s1 = TimeChuo, st2 = UserID;
        byte[] output = md5.ComputeHash(Encoding.UTF8.GetBytes(salt_a + st2));
        string s3 = System.BitConverter.ToString(output).Replace("-", "").ToLower();
        byte[] output2 = md5.ComputeHash(Encoding.UTF8.GetBytes(s1 + s3 + salt_b));
        string s4 = System.BitConverter.ToString(output2).Replace("-", "").ToLower();
        return s4;
	}

    ///<summary><字符串DES加密函数></summary>  
    ///<param name="str"><被加密字符串></param>  
    ///<param name="key"><密钥></param>   
    ///<returns><加密后字符串></returns>     
    public static string DESEncode(string str, string key)
    {
        try
        {
            DESCryptoServiceProvider provider = new DESCryptoServiceProvider();
            provider.Key = Encoding.UTF8.GetBytes(key.Substring(0, 8));
            provider.IV = Encoding.UTF8.GetBytes(key.Substring(0, 8));
            byte[] bytes = Encoding.UTF8.GetBytes(str);
            MemoryStream stream = new MemoryStream();
            CryptoStream stream2 = new CryptoStream(stream, provider.CreateEncryptor(), CryptoStreamMode.Write);
            stream2.Write(bytes, 0, bytes.Length);
            stream2.FlushFinalBlock();
            StringBuilder builder = new StringBuilder();
            foreach (byte num in stream.ToArray()) {
                builder.AppendFormat("{0:X2}", num);
            }
            stream.Close();
            return builder.ToString();
        }
        catch (Exception) { return "xxxx"; }
    }
    ///<summary>字符串DES解密函数></summary>  
    ///<param name="str">被解密字符串</param>  
    ///<param name="key">CDATA[密钥></param>   
    ///<returns><解密后字符串></returns>     
    public static string DESDecode(string str, string key)
    {
        try
        {
            DESCryptoServiceProvider provider = new DESCryptoServiceProvider();
            provider.Key = Encoding.UTF8.GetBytes(key.Substring(0, 8));
            provider.IV = Encoding.UTF8.GetBytes(key.Substring(0, 8));
            byte[] buffer = new byte[str.Length / 2];
            for (int i = 0; i < (str.Length / 2); i++) {
                int num2 = Convert.ToInt32(str.Substring(i * 2, 2), 0x10);
                buffer[i] = (byte)num2;
            }
            // buffer = Convert.FromBase64String(str);
            MemoryStream stream = new MemoryStream();
            CryptoStream stream2 = new CryptoStream(stream, provider.CreateDecryptor(), CryptoStreamMode.Write);
            stream2.Write(buffer, 0, buffer.Length);
            stream2.FlushFinalBlock();
            stream.Close();
            return Encoding.UTF8.GetString(stream.ToArray());
        }
        catch (Exception) { return ""; }
    }
    
    /// <summary>
    /// base64加密
    /// </summary>
    /// <param name="input"></param>
    /// <returns></returns>
    public static string EncryptBase64(string input)
    {
        byte[] inputBytes = Encoding.UTF8.GetBytes(input);
        return Convert.ToBase64String(inputBytes);
    }

    /// <summary>
    /// base64解密
    /// </summary>
    /// <param name="input"></param>
    /// <returns></returns>
    public static string DecryptBase64(string input)
    {
        try
        {
            byte[] inputBytes = Convert.FromBase64String(input);
            return Encoding.UTF8.GetString(inputBytes);
        }
        catch (Exception e)
        {
            return null;

        }
    }
}
