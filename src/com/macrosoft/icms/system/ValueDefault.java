//:ValueDefault.java
/**
	Name:		ValueDefault
	Funciton:	这个类是用来在客户端生成 JavaScript 代码来设置表单初始值。
	HowTo:		Use Like follow:
				<%
					com.macrosoft.icms.system.ValueDefault vd = new com.macrosoft.icms.system.ValueDefault();
					vd.setFormName("form1");
					vd.setText( "GH", "内资企业登记" );
					vd.setText( "GZDWSM", "内资企业登记模块说明！" );
					vd.setFocus( "GZDWSM" );
					vd.setChecked( "XZJB", "2" );
					vd.setSelected( "DQBH", "370283" );
					vd.disableText( "GH" );
					vd.setUserFunction( "SetDefault" );
					out.print( vd.ValueDefaultScript());
				%>
	UseFile:	/icms/support/value.js
**/
package com.macrosoft.icms.system;

import java.io.*;
import java.sql.*;
import java.util.*;
import javax.servlet.http.*;
import com.macrosoft.icms.system.*;

public class ValueDefault 
{

	/* public: the javascript string */
	String ValueDefaultStr; 

	/* public: the form name you used */
	public String formName;

	String doPreProcess( String sValue )
	{
		if (sValue==null)
		{
			sValue="";
		}
		sValue=sValue.trim();
		return sValue;
	}

	public void setFormName(String formName)
	{
		this.formName = formName;
		this.ValueDefaultStr ="<!--  设置表单缺省值开始  //-->" + "\n";
		this.ValueDefaultStr +="<script language='javascript'>" + "\n"+"<!--" + "\n";
		this.ValueDefaultStr +="function " + formName + "ValueDefault()" + "\n" + "{" + "\n"; 
	}

	public void resetFormName(String formName)
	{
		this.formName = formName;
		this.ValueDefaultStr ="<!--  设置表单缺省值开始  //-->" + "\n";
		this.ValueDefaultStr +="<script language='javascript'>" + "\n"+"<!--" + "\n";
		this.ValueDefaultStr +="function " + formName + "ValueDefault()" + "\n" + "{" + "\n"; 
	}

	/***************************************************************************\
	* public: constructor functions
	* 构造函数
	\***************************************************************************/
	public ValueDefault()
	{
		ValueDefaultStr = "";
	}

	/***************************************************************************\
	* public: export javascript script
	* 输出 JAVASCRIPT 脚本
	\***************************************************************************/
	public String ValueDefaultScript() 
	{
		this.ValueDefaultStr+="}" + "\n";
		this.ValueDefaultStr+="window.onload=" + formName + "ValueDefault;" + "\n";
		this.ValueDefaultStr+="//-->" + "\n"+"</script>" + "\n";
		this.ValueDefaultStr+="<!--   设置表单缺省值结束  //-->";
		return this.ValueDefaultStr;
	}

	String getridofEnter(String x)
	{	
		return x.replaceAll("[\\n\\r]"," "); 
	}
	/***************************************************************************\
	* public:	SetFormData
	* function:	设置一个默认缺省值
	* parameter:
	*			数组中的对象为二维数组 objarr 0 对象名 1值
	\***************************************************************************/
	public void setData( ArrayList al  )
	{		
		if (al!=null)
		{		
			String[] ay = new String[2];
			for (int i=0;i<al.size();i++ )
			{
				ay=(String[])al.get(i);
				this.ValueDefaultStr +=
				"	funSetFormData(\""+ay[0].toUpperCase()+"\",\""+getridofEnter(ay[1].trim())+"\");\n";
			}
		}
	}
	public void setOldData( ArrayList al  )
	{		
		if (al!=null)
		{		
			String[] ay = new String[2];
			for (int i=0;i<al.size();i++ )
			{
				ay=(String[])al.get(i);
				this.ValueDefaultStr +=
				"	funSetFormOldData(\""+ay[0].toUpperCase()+"\",\""+getridofEnter(ay[1].trim())+"\");\n";
			}
		}
	}
	public void setData( HttpServletRequest request )
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
					this.ValueDefaultStr +=
				"	funSetFormData(\""+paramName.toUpperCase()+"\",\""+com.macrosoft.icms.system.SysUtility.convertCode(paramValues[i]).trim()+"\");\n";

				}
				
			}
		}
	}

	/***************************************************************************\
	* public:	setFormData
	* function:	设置一个缺省值
	* parameter:
	*			Name:	输入框的名字
	*			sValue:		缺省值
	\***************************************************************************/
	public void setFormData( String sName, String sValue )
	{
		sValue=doPreProcess( sValue );
		sValue=com.macrosoft.icms.system.SysUtility.replace( sValue, "\r\n", "\\n" );
		sValue=com.macrosoft.icms.system.SysUtility.replace( sValue, "\n", "\\n" );
		sValue=com.macrosoft.icms.system.SysUtility.replace( sValue, "\r", "\\n" );
		this.ValueDefaultStr +=
			"	funSetFormData(\""+sName+"\",\"" + sValue + "\");\n";
	}

	public void setFormData( String sName, double nValue )
	{	setFormData( sName, Double.toString( nValue ) );	}

	public void setFormData( String sName, int nValue )
	{	setFormData( sName, Integer.toString( nValue ) );	}
	/***************************************************************************\
	* public:	setInnerText
	* function:	设置一个HTML元素的缺省值
	* parameter:
	*			inputName:	元素的ID
	*			sValue:		缺省值
	\***************************************************************************/
	public void setInnerText( String inputName, String sValue )
	{
		sValue=doPreProcess( sValue );
		sValue=com.macrosoft.icms.system.SysUtility.replace( sValue, "\r\n", "\\n" );
		sValue=com.macrosoft.icms.system.SysUtility.replace( sValue, "\n", "\\n" );
		sValue=com.macrosoft.icms.system.SysUtility.replace( sValue, "\r", "\\n" );
		this.ValueDefaultStr +=
//			"	fucSetInnerText(document."+formName+"."+inputName+",'" + sValue + "');\n";
			"	fucSetInnerText( "+inputName+",'" + sValue + "');\n";
	}

	public void setInnerText( String inputName, double nValue )
	{	setInnerText( inputName, Double.toString( nValue ) );	}

	public void setInnerText( String inputName, int nValue )
	{	setInnerText( inputName, Integer.toString( nValue ) );	}

	/***************************************************************************\
	* public:	setInnerHtml
	* function:	设置一个HTML元素的缺省值
	* parameter:
	*			inputName:	元素的ID
	*			sValue:		缺省值
	\***************************************************************************/
	public void setInnerHtml( String inputName, String sValue )
	{
		sValue=doPreProcess( sValue );
		sValue=com.macrosoft.icms.system.SysUtility.replace( sValue, "\r\n", "\\n" );
		sValue=com.macrosoft.icms.system.SysUtility.replace( sValue, "\n", "\\n" );
		sValue=com.macrosoft.icms.system.SysUtility.replace( sValue, "\r", "\\n" );
		this.ValueDefaultStr +=
			"	fucSetInnerHtml("+inputName+",'" + sValue + "');\n";
	}

	public void setInnerHtml( String inputName, double nValue )
	{	setInnerHtml( inputName, Double.toString( nValue ) );	}

	public void setInnerHtml( String inputName, int nValue )
	{	setInnerHtml( inputName, Integer.toString( nValue ) );	}

	
	/***************************************************************************\
	* public:	disableText
	* function:	设置文本框的ReadOnly属性为true，禁止修改其中的数据
	* parameter:
	*			inputName:	输入框的名字
	\***************************************************************************/
	public void disableText( String inputName )
	{
		this.ValueDefaultStr +=
			"	fucDisableText(document."+formName+"."+inputName+");\n";
	}

	/***************************************************************************\
	* public:	enableText
	* function:	设置文本框的ReadOnly属性为false，允许修改其中的数据
	* parameter:
	*			inputName:	输入框的名字
	\***************************************************************************/
	public void enableText( String inputName )
	{
		this.ValueDefaultStr +=
			"	fucEnableText(document."+formName+"."+inputName+");\n";
	}
	
	/***************************************************************************\
	* public:	setFocus
	* function:	将焦点设置到一个控件中
	* parameter:
	*			inputName:	输入框的名字
	*			sValue:		缺省值
	\***************************************************************************/
	public void setFocus( String inputName )
	{
		this.ValueDefaultStr +=
			"	fucSetFocus(document."+formName+"."+inputName+");\n";
	}

	public void setUserFunction( String fucName )
	{
		this.ValueDefaultStr +=
			"	" + fucName + ";\n";
	}
}
///:~
