//:ErrorCheck.java
/**
	Name:		ErrorCheck
	Funciton:	这个类是用来在客户端生成 JavaScript 代码来校验表单的。
	HowTo:		Use Like follow:
			<%
				ErrorCheck ec = new ErrorCheck();
				ec.setFormName("form1");
				ec.blankCheck("GH","工号不能为空，请输入工号！");
				out.print(ec.ErrorCheckScript());
			%>
	UseFile:	/icms/support/valid.js
**/
package com.macrosoft.icms.system;

import java.io.*;
import java.sql.*;
import com.macrosoft.icms.system.*;

public class ErrorCheck 
{

	/* public: the javascript string */
	String errorCheckStr; 

	/* public: the form name you used */
	public String formName;

	public void setFormName(String formName)
	{
		this.formName = formName;
		this.errorCheckStr ="<!--  错误检查代码开始  //-->" + "\n";
		this.errorCheckStr +="<script language='javascript'>" + "\n"+"<!--" + "\n";
		this.errorCheckStr +="function " + formName + "errorCheck()" + "\n" + "{" + "\n"; 
	}

	public void resetFormName(String formName)
	{
		this.formName = formName;
		this.errorCheckStr ="<!--  错误检查代码开始  //-->" + "\n";
		this.errorCheckStr +="<script language='javascript'>" + "\n"+"<!--" + "\n";
		this.errorCheckStr +="function " + formName + "errorCheck()" + "\n" + "{" + "\n"; 
	}

	/***************************************************************************\
	* public: constructor functions
	* 构造函数
	\***************************************************************************/
	public ErrorCheck()
	{
		errorCheckStr = "";
	}

	/***************************************************************************\
	* public: export javascript script
	* 输出 JAVASCRIPT 脚本
	\***************************************************************************/
	public String ErrorCheckScript() 
	{
		this.errorCheckStr+="return true;" + "\n";
		this.errorCheckStr+="}" + "\n";
		this.errorCheckStr+="document." + formName + ".onsubmit=" + formName + "errorCheck;" + "\n";
		this.errorCheckStr+="//-->" + "\n"+"</script>" + "\n";
		this.errorCheckStr+="<!--   错误检查代码结束  //-->";
		return this.errorCheckStr;
	}
	public void FormErrorCheck()
	{
		this.errorCheckStr+=
			"	if(!funCheckInForm(document."+formName+"))\n" +
			"	{\n" +
			"		return(false);\n"+
			"	}"+"\n\n";
	}
	
	
	/***************************************************************************\
	 *public:check the startingDate and the endingDate order
	 *检查开始时间和结束时间的先后顺序
	\***************************************************************************/
	public void dateOrderCheck(String startingInputName,String endingInputName,String errorMsg)
	{
		this.errorCheckStr+=
			"	if(fucCheckDateOrder(document."+formName+"."+startingInputName+".value,document."+formName+"."+endingInputName+".value)==0)\n" + 
			"	{\n" + 
			"		alert(\""+errorMsg+".\");\n"+
			"		document."+formName+"."+endingInputName+".focus();\n" +
			"		return(false);\n"+
			"	}" + "\n\n";
	}

	/***************************************************************************\
	 *public:check the startingDate and the endingDate order
	 *检查开始时间和结束时间的先后顺序--时间分年度和月份两段;
	\***************************************************************************/
	public void dateOrderCheck(String ND1,String YF1,String ND2,String YF2,String errorMsg)
	{
		this.errorCheckStr+=
			"	if(fucCheckDateOrder1(document."+formName+"."+ND1+".value,document."+formName+"."+YF1+".value,document."+formName+"."+ND2+".value,document."+formName+"."+YF2+".value)==0)\n" + 
			"	{\n" + 
			"		alert(\""+errorMsg+".\");\n"+
			"		document."+formName+"."+ND1+".focus();\n" +
			"		return(false);\n"+
			"	}" + "\n\n";
	}

	/***************************************************************************\
	 *public:check the num1 and the num2 order
	 *检查数字一和数字二的大小
	\***************************************************************************/
	public void numOrderCheck(String InputName1,String InputName2,String errorMsg)
	{
		this.errorCheckStr+=
			"	if(fucCheckNumOrder(document."+formName+"."+InputName1+".value,document."+formName+"."+InputName2+".value)==0)\n" + 
			"	{\n" + 
			"		alert(\""+errorMsg+".\");\n"+
			"		document."+formName+"."+InputName2+".focus();\n" +
			"		return(false);\n"+
			"	}" + "\n\n";
	}
	public void notZeroCheck( String inputName, String errorMessage )
	{
		this.errorCheckStr+=
			"	if(fucCheckNotZero(document."+formName+"."+inputName+".value)==0)\n" +
			"	{\n" +
			"		alert(\""+errorMessage+".\");\n"+
			"		document."+formName+"."+inputName+".focus();\n"+
			"		return(false);\n"+
			"	}"+"\n\n";
	}
	/*********************************************************************\
	* public: check the password
	* 检查录入框值是否是合格的密码口令
	\*********************************************************************/

	public void passwordCheck(String inputName, String errorMsg) 
	{
		this.errorCheckStr +=
			"	if(fucCheckPassword(document."+formName+"."+inputName+".value) == 0)" + "\n" + 
			"	{" + "\n" +
			"		alert(\""+errorMsg+".\");" + "\n" +
			"		document."+formName+"."+inputName+".focus();" + "\n" +
			"		return(false);" + "\n" +
			"	}" + "\n\n"; 
	}
	/**
	*public:check password
	*检查两次输入的密码是否相同
	*/
	public void passwordCheck(String pwdInputName,String pwdAgainInputName,String errorMsg)
	{
		this.errorCheckStr+=
			"	if(document."+formName+"."+pwdInputName+".value!=document."+formName+"."+pwdAgainInputName+".value)" + "\n" + 
			"	{\n" + 
			"		alert(\""+errorMsg+".\");\n" + 
			"		document."+formName+"."+pwdInputName+".focus();" + "\n" +
			"		return(false);" + "\n" +
			"	}" + "\n\n";
	}
	
	/**
	*public:check u_flag
	*检查用户名是否重复
	*/
	public void uflagCheck(String errorMsg)
	{
		this.errorCheckStr+=
			"	if(document.getElementById('u_flag').value=='1')" + "\n" + 
			"	{\n" + 
			"		alert(\""+errorMsg+".\");\n" + 
			"		document.all.item('LOGINID').focus();" + "\n" +
			"		return(false);" + "\n" +
			"	}" + "\n\n";
	}
	
	public void setUserFunction( String fucName )
	{
		this.errorCheckStr +=
			"	if(" + fucName + "==false)\n" + 
			"	{\n" +
			"		return false;\n" + 
			"	}" + "\n\n";
	}
	public void checkedCheck(String paramString1, String paramString2)
	  {
	    this.errorCheckStr = this.errorCheckStr + "\tif(getCheckedValue('document." + this.formName + "." + paramString1 + "')==\"\")" + "\n" + "\t{" + "\n" + "\t\talert(\"" + paramString2 + "\");" + "\n" + "\t\treturn(false);" + "\n" + "\t}" + "\n\n";
	  }
}
///:~
