<%@ page contentType="text/html;charset=GBK"%>
<%@page import="com.macrosoft.icms.qydj.WEB_USER_MD"%>
<%@page import="com.macrosoft.icms.system.SysUtility"%>
<%
String ifcome=request.getParameter("ifcome");
if(ifcome!=null && "true".equals(ifcome)){
	WEB_USER_MD md=new WEB_USER_MD();
	String backInfo=md.ModPassMd5();
	out.println(SysUtility.setAlertScript(backInfo,""));	
}
%>