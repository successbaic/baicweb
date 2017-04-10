//:ValueDefault.java
/**
	Name:		ValueDefault
	Funciton:	������������ڿͻ������� JavaScript ���������ñ���ʼֵ��
	HowTo:		Use Like follow:
				<%
					com.macrosoft.icms.system.ValueDefault vd = new com.macrosoft.icms.system.ValueDefault();
					vd.setFormName("form1");
					vd.setText( "GH", "������ҵ�Ǽ�" );
					vd.setText( "GZDWSM", "������ҵ�Ǽ�ģ��˵����" );
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
		this.ValueDefaultStr ="<!--  ���ñ�ȱʡֵ��ʼ  //-->" + "\n";
		this.ValueDefaultStr +="<script language='javascript'>" + "\n"+"<!--" + "\n";
		this.ValueDefaultStr +="function " + formName + "ValueDefault()" + "\n" + "{" + "\n"; 
	}

	public void resetFormName(String formName)
	{
		this.formName = formName;
		this.ValueDefaultStr ="<!--  ���ñ�ȱʡֵ��ʼ  //-->" + "\n";
		this.ValueDefaultStr +="<script language='javascript'>" + "\n"+"<!--" + "\n";
		this.ValueDefaultStr +="function " + formName + "ValueDefault()" + "\n" + "{" + "\n"; 
	}

	/***************************************************************************\
	* public: constructor functions
	* ���캯��
	\***************************************************************************/
	public ValueDefault()
	{
		ValueDefaultStr = "";
	}

	/***************************************************************************\
	* public: export javascript script
	* ��� JAVASCRIPT �ű�
	\***************************************************************************/
	public String ValueDefaultScript() 
	{
		this.ValueDefaultStr+="}" + "\n";
		this.ValueDefaultStr+="window.onload=" + formName + "ValueDefault;" + "\n";
		this.ValueDefaultStr+="//-->" + "\n"+"</script>" + "\n";
		this.ValueDefaultStr+="<!--   ���ñ�ȱʡֵ����  //-->";
		return this.ValueDefaultStr;
	}

	String getridofEnter(String x)
	{	
		return x.replaceAll("[\\n\\r]"," "); 
	}
	/***************************************************************************\
	* public:	SetFormData
	* function:	����һ��Ĭ��ȱʡֵ
	* parameter:
	*			�����еĶ���Ϊ��ά���� objarr 0 ������ 1ֵ
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
	* function:	����һ��ȱʡֵ
	* parameter:
	*			Name:	����������
	*			sValue:		ȱʡֵ
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
	* function:	����һ��HTMLԪ�ص�ȱʡֵ
	* parameter:
	*			inputName:	Ԫ�ص�ID
	*			sValue:		ȱʡֵ
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
	* function:	����һ��HTMLԪ�ص�ȱʡֵ
	* parameter:
	*			inputName:	Ԫ�ص�ID
	*			sValue:		ȱʡֵ
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
	* function:	�����ı����ReadOnly����Ϊtrue����ֹ�޸����е�����
	* parameter:
	*			inputName:	����������
	\***************************************************************************/
	public void disableText( String inputName )
	{
		this.ValueDefaultStr +=
			"	fucDisableText(document."+formName+"."+inputName+");\n";
	}

	/***************************************************************************\
	* public:	enableText
	* function:	�����ı����ReadOnly����Ϊfalse�������޸����е�����
	* parameter:
	*			inputName:	����������
	\***************************************************************************/
	public void enableText( String inputName )
	{
		this.ValueDefaultStr +=
			"	fucEnableText(document."+formName+"."+inputName+");\n";
	}
	
	/***************************************************************************\
	* public:	setFocus
	* function:	���������õ�һ���ؼ���
	* parameter:
	*			inputName:	����������
	*			sValue:		ȱʡֵ
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
