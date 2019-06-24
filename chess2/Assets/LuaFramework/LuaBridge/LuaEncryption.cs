using System.Collections;
using System.Collections.Generic;
using System.Security.Cryptography;
using System.Text;
using System.IO;

public class LuaEncryption  {

	private const string luaPassword = "ThinkDit2017";                                      //lua 密码

	public static string AesEncryptor(string luaText)
    {
		RijndaelManaged aes = new RijndaelManaged();
		MemoryStream msEncrypt = new MemoryStream();
		string result = string.Empty;
		try{
			aes.Key = Encoding.UTF8.GetBytes(PasswordMD5(luaPassword));
        	aes.IV = Encoding.UTF8.GetBytes(PasswordMD5(luaPassword).Substring(8, 16));
			ICryptoTransform ict = aes.CreateEncryptor(aes.Key, aes.IV);
			using (CryptoStream cts = new CryptoStream(msEncrypt, ict, CryptoStreamMode.Write))
			{
				using (StreamWriter sw = new StreamWriter(cts))
				{
					sw.Write(luaText);
				}
			}

			byte[] content = msEncrypt.ToArray();
			result = System.Convert.ToBase64String(content);
		}
		finally{
			aes.Clear();
		}
        
        return result;
    }

    public static string PasswordMD5(string strText)  
    {     
        byte[] data = Encoding.UTF8.GetBytes(strText);
        MD5 md5 = new MD5CryptoServiceProvider();
        byte[] outBytes = md5.ComputeHash(data);
        StringBuilder sb = new StringBuilder();
        for(int i = 0; i < outBytes.Length; i++)
            sb.Append(outBytes[i].ToString("x2"));
        return sb.ToString();
    }  

	public static string AesDecryptor(string enCodeLuaText)
	{
		string result = enCodeLuaText;
		RijndaelManaged aes = new RijndaelManaged();
		try{
			byte[] luabytes = System.Convert.FromBase64String(enCodeLuaText);
			aes.Key = Encoding.UTF8.GetBytes(PasswordMD5(luaPassword));
			aes.IV = Encoding.UTF8.GetBytes(PasswordMD5(luaPassword).Substring(8, 16));
			ICryptoTransform ict = aes.CreateDecryptor(aes.Key, aes.IV );
			 using (MemoryStream ms = new MemoryStream(luabytes))
			{
				using (CryptoStream cs = new CryptoStream(ms, ict, CryptoStreamMode.Read))
				{
					using (StreamReader sr = new StreamReader(cs))
					{
						result = sr.ReadToEnd();
					}
				}
			}

		}
		catch(System.Exception e)
		{
			System.Console.WriteLine(e.Message);
		}
		finally{
			aes.Clear();
		}
		return result;
	}
}
