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
<title>ע�����</title>
</head>

<%
	String LOGINID=WEB_USER.doPreProcess(request.getParameter("LOGINID"));
	WEB_USER.setLOGINID(LOGINID);
	
	if(WEB_USER.getXZQH().equals("")){
   	 out.print(SysUtility.setAlertScript("����������ȡʧ�ܣ���ѡ����������������ʹ��IE�����!",""));   
   	 return;
   }
   
	if(WEB_USER.doCount(dbc)){
		out.print(SysUtility.setAlertScript("�Ѵ��ڵ�ǰע����!",""));
	}else{
		WEB_USER.setREGDATE(DateUtils.getDateStr(new java.util.Date(),""));
		if(WEB_USER.doAdd(dbc)){
			   String str="<script language='javascript'>";
			         str+="alert('ע��ɹ��������µ�½��');";
			         str+="parent.window.close();";
			         //str+="parent.window.location.href='../index.jsp'";
			         str+="</script>";
				out.print(str);
			}else{
				out.print(SysUtility.setAlertScript("���ݱ���ʧ��!",""));
			}	
	}	
%>
</html>
<%
dbc.close();
%>
