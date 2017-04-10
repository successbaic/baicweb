/**
Name:		SysUser
Function:	ϵͳ�û���Ϣ��Bean��
Date:		2002-2-4
**/
package com.macrosoft.icms.system;
import java.sql.*;
import java.util.*;
import javax.servlet.http.*;
import com.macrosoft.icms.*;
import com.macrosoft.icms.dbc.*;
import javax.naming.*;

public class SysRequest {
Hashtable hMod;
Hashtable hQueryString;

public String getCurrentDate()
{
	java.util.Date date=new java.util.Date();
	String Years	=String.valueOf(date.getYear()+1900);
	String Months	=String.valueOf(date.getMonth()+1);	
	String Days		=String.valueOf(date.getDate());
	if(Months.length()==1)
		Months="0"+Months;
	if(Days.length()==1)
		Days="0"+Days;
	return Years+"-"+Months+"-"+Days;
}


public String convertCode(String strvalue) {
return com.macrosoft.icms.system.SysUtility.convertCode(strvalue);
}

public String doPreProcess(String sValue) {
return com.macrosoft.icms.system.SysUtility.doPreProcess(sValue);
}

public String doPreProcess2(String sValue) {
return com.macrosoft.icms.system.SysUtility.doPreProcess2(sValue);
}

public String doPreProcess3(String sValue) {
return com.macrosoft.icms.system.SysUtility.doPreProcess3(sValue);
}

/**  ��ʼ����ı���  **/
public SysRequest() 
{
	hMod = new Hashtable();
	hQueryString = new Hashtable();
}

/**	�ͷ���ռ�õ���Դ **/
public void finalize() 
{
	hMod = null;
	hQueryString.clear();
	hQueryString = null;
}

/**
����ĳһҳ�浱ǰ��QueryString��Ϊ����������׼��
*/
public void setQueryString(String sPageName, String sQueryString)
{
	if (hQueryString.containsKey(sPageName))
	{ //����ָ��ҳ�����Ϣ
		hQueryString.remove(sPageName);
	}
	if (sQueryString == null)
	{
		sQueryString = "";
	}
	hQueryString.put(sPageName, sQueryString);
}
/**
����ĳһҳ�浱ǰ��QueryString��Ϊ����������׼��
*/
public void setQueryString(HttpServletRequest request )
{
	String QueryString="";
	if (request.getQueryString()!=null)
	{
		setQueryString(request.getRequestURI(), request.getQueryString());
	}
	else
	{
		Enumeration paramNames = request.getParameterNames();  
		while(paramNames.hasMoreElements())
		{  			
			String paramName = com.macrosoft.icms.system.SysUtility.convertCode((String)paramNames.nextElement()); 
			String[] paramValues = request.getParameterValues(paramName);
			
			for (int i=0;i<paramValues.length;i++ )
			{
				if (paramValues[i]!=null&&!paramValues[i].trim().equals(""))
				{
					QueryString += "&" + paramName + "="+com.macrosoft.icms.system.SysUtility.convertCode(paramValues[i]).trim();
				}
				
			}
		}
		setQueryString(request.getRequestURI(), QueryString);
	}
	
}

/**
����ҳ���λ�ã����ԭ�ȴ洢��QueryString
*/
public String getQueryString(String sPageName)
{
	if (hQueryString.containsKey(sPageName))
	{
		return (String) hQueryString.get(sPageName);
	}
	return "";
}

/**
���ݴ����ҳ�棬����ԭ�ȵ��ø�ҳ���URL
*/
public String getReturnPage(String sPageName)
{
	return sPageName + "?" + getQueryString(sPageName);
}


}