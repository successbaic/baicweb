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
<title>�޸��������</title>
</head>
<%
   String loginid=WEB_USER.convertCode(WEB_USER.doPreProcess(request.getParameter("LOGINID")));
   String loginid2=webuser.getLOGINID();
   if(WEB_USER.getXZQH().equals("")){
   	 out.print(SysUtility.setAlertScript("����������ȡʧ�ܣ���ѡ����������������ʹ��IE�����!",""));   
   	 return;
   }
   if(loginid.equals(loginid2)){
	   if(WEB_USER.doModify(dbc,loginid))
		  out.print(SysUtility.setAlertScript("�û�������Ϣ�޸ĳɹ�!","window.location.href='modify_main.jsp';"));
	   else
		  out.print(SysUtility.setAlertScript("�û�������Ϣ�޸�ʧ��!",""));   
   }else{
	   out.print(SysUtility.setAlertScript("���ڶ���û���¼����ر����������������!",""));
   }
   	
%>
</html>
<%
dbc.close();
%>
