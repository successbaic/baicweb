package com.macrosoft.icms.system;

import java.util.Enumeration;
import java.util.Hashtable;

import javax.servlet.http.HttpServletRequest;

public class SysUrlForm {
	Hashtable hQueryString; 
	public SysUrlForm() 
	{
		hQueryString = new Hashtable();
	}
	/**
	设置某一页面当前的QueryString，为将来返回做准备
	*/
	public void setQueryString(String sPageName, String sQueryString)
	{
		if (hQueryString.containsKey(sPageName))
		{ //包含指定页面的信息
			hQueryString.remove(sPageName);
		}
		if (sQueryString == null)
		{
			sQueryString = "";
		}
		hQueryString.put(sPageName, sQueryString);
	}
	/**
	设置某一页面当前的QueryString，为将来返回做准备
	*/
	public void setQueryString(HttpServletRequest request )
	{
		String QueryString="";
		System.out.println(request.getRequestURI());
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
	public void setQueryString(String url,HttpServletRequest request )
	{
		String QueryString="";		
		if (request.getQueryString()!=null)
		{
			setQueryString(url, request.getQueryString());
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
			setQueryString(url, QueryString);
		}
		
	}
	/**
	根据页面的位置，或的原先存储的QueryString
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
	根据传入的页面，生成原先调用该页面的URL
	*/
	public String getReturnPage(String sPageName)
	{
		return sPageName + "?" + getQueryString(sPageName);
	}
}
