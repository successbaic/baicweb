<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.macrosoft.icms.util.DateUtils"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<%@ page contentType="text/html; charset=GBK"%>
<jsp:useBean id="dbc" scope="page" class="com.macrosoft.icms.dbc.DbConnection"/>
<jsp:useBean id="WEB_USER" scope="page" class="com.macrosoft.icms.qydj.WEB_USER">
	<jsp:setProperty name="WEB_USER" property="*"/>
</jsp:useBean>
<html>
<head>
<title>注册情况</title>
</head>

<%
	String LOGINID=WEB_USER.doPreProcess(request.getParameter("LOGINID"));
	WEB_USER.setLOGINID(LOGINID);
	
	if(WEB_USER.getXZQH().equals("")){
   	 out.print(SysUtility.setAlertScript("行政区划获取失败，请选择行政区划，建议使用IE浏览器!",""));   
   	 return;
   }
   
	if(WEB_USER.doCount(dbc)){
		out.print(SysUtility.setAlertScript("已存在当前注册名!",""));
	}else{
		WEB_USER.setREGDATE(DateUtils.getDateStr(new java.util.Date(),""));
		if(WEB_USER.doAdd(dbc)){
			   String str="<script language='javascript'>";
			         str+="alert('注册成功，请重新登陆！');";
			         str+="parent.window.close();";
			         //str+="parent.window.location.href='../index.jsp'";
			         str+="</script>";
				out.print(str);
			}else{
				out.print(SysUtility.setAlertScript("数据保存失败!",""));
			}	
	}	
%>
</html>
<%
dbc.close();
%>
