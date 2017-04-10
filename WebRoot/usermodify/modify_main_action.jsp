<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
response.setHeader("Expires","0");
%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<%@ page errorPage="../error.jsp"%>
<%@ page contentType="text/html; charset=GBK"%>
<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="dbc" scope="page" class="com.macrosoft.icms.dbc.DbConnection"/>
<jsp:useBean id="WEB_USER" scope="page" class="com.macrosoft.icms.qydj.WEB_USER">
	<jsp:setProperty name="WEB_USER" property="*"/>
</jsp:useBean>
<jsp:useBean id="webuser" scope="session" class="com.macrosoft.icms.qydj.WEB_USER"/>
<html>
<head>
<title>修改密码情况</title>
</head>
<%
   String loginid=WEB_USER.convertCode(WEB_USER.doPreProcess(request.getParameter("LOGINID")));
   String loginid2=webuser.getLOGINID();
   if(WEB_USER.getXZQH().equals("")){
   	 out.print(SysUtility.setAlertScript("行政区划获取失败，请选择行政区划，建议使用IE浏览器!",""));   
   	 return;
   }
   if(loginid.equals(loginid2)){
	   if(WEB_USER.doModify(dbc,loginid))
		  out.print(SysUtility.setAlertScript("用户档案信息修改成功!","window.location.href='modify_main.jsp';"));
	   else
		  out.print(SysUtility.setAlertScript("用户档案信息修改失败!",""));   
   }else{
	   out.print(SysUtility.setAlertScript("存在多个用户登录，请关闭所有浏览器后重试!",""));
   }
   	
%>
</html>
<%
dbc.close();
%>
