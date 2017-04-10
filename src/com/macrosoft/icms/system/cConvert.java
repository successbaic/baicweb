package com.macrosoft.icms.system;
import java.sql.*;
import java.text.*;
import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.*;
public class cConvert
{
	public static String getStrings(ResultSet rs, int columnIndex)
	{
		byte bb[]=null;
		try
		{
			bb=rs.getBytes(columnIndex);
		}
		catch (Exception ex){return "";}
		if (bb==null)
		{
			return "";
		}
		//return new String(bb).trim();

		String ss=null;
		try
		{
			ss=rs.getString(columnIndex);
		}
		catch (Exception ex){return "";}
		if (ss==null)
		{
			return "";
		}
		return ss;
	}


	public static String getStrings(ResultSet rs, String columnName)
	{
		byte bb[]=null;
		try
		{
			bb=rs.getBytes(columnName);
		}
		catch (Exception ex){return "";}
		if (bb==null)
		{
			return "";
		}
		//return new String(bb).trim();
		String ss=null;
		try
		{
			ss=rs.getString(columnName);
		}
		catch (Exception ex){return "";}
		if (ss==null)
		{
			return "";
		}
		return ss;
	}
	public static String htmlencode(String str,boolean derection )
	{
		String ret="";
		if (derection)
		{
			str=str.replaceAll("'","''");
			str=str.replaceAll("&lt;","<");
			str=str.replaceAll("&gt;",">");
			str=str.replaceAll(" ","&nbsp;");
			str=str.replaceAll("\r\n","<br>");
			str=str.replaceAll("&amp;","&");
			try
			{
				ret=new String(str.getBytes("ISO8859-1"));
			}
			catch(Exception e)
			{
				ret=str;
			}
		}
		else
		{
			str=str.replaceAll("<br>","\r\n");
			str=str.replaceAll("<","&lt;");
			str=str.replaceAll(">","&gt;");
			str=str.replaceAll("&nbsp;"," ");
			str=str.replaceAll("&;","&amp");
			ret=str;
		}
		return ret;
	}

	public static String DoubleFormat( double x) 
	{
		DecimalFormat df = new DecimalFormat("###########0.000000");
		return df.format(x);
	}

	public static String DoubleFormat6( double x) 
	{
		DecimalFormat df = new DecimalFormat("###########0.000000");
		return df.format(x);
	}
	//上传文件转换中文
	public static String convertUTF8(String src)     
	{    
		try{   
			byte[] b = src.getBytes();   
			char[] c = new char[b.length];   
			for (int i = 0; i < b.length; i++)     
			{   
			c[i] = (char)(b[i]&0x00FF);   
			}   
			return new String(c);   
			  }   
			  catch (Exception e)     
			  {   
			System.out.println(e.toString());   
			return src;   
		  }   
	}  
}

