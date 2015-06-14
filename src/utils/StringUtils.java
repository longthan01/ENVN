package utils;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class StringUtils 
{
	public static String md5(String plantext)
	{
		try {
			MessageDigest md = java.security.MessageDigest.getInstance("MD5");
			byte[] array = md.digest(plantext.getBytes(Charset.forName("UTF-8")));
			StringBuffer sb = new StringBuffer();
			for(int i=0; i<array.length; ++i)
			{
				sb.append(Integer.toHexString((array[i] & 0xFF | 0x100)).substring(1,3));
			}
			return sb.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// upper first character of user fullname
	public static String upperFirstCase (String text)
	{
		String result = null;
		
		try
		{
			if (!text.isEmpty())
			{
				char[] stringArray = text.trim().toCharArray();
				stringArray[0] = Character.toUpperCase(stringArray[0]);
				result = new String(stringArray);
			}
		} catch (Exception e)
		{
			System.out.println("ENVN log:\nException: utils.StringUtils.upperFirstCase(String)");
			e.printStackTrace();
		}
		
		return result;
	}
}
