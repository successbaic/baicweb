<%@ page contentType="text/html;charset=GBK"%>
<%@page import="com.macrosoft.icms.system.SysUtility"%>
<%@page import="java.util.ArrayList"%>
<%@ page errorPage="/error.jsp"%>
<%@page import="com.macrosoft.icms.qydj.QYDJ_BGSX_SQ"%>
<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="dbc" scope="page" class="com.macrosoft.icms.dbc.DbConnection"/>
<jsp:useBean id="gsdbc" scope="page" class="com.macrosoft.icms.gsdbc.GsDbConnection"/>
<jsp:useBean id="sjdbc" scope="page" class="com.macrosoft.icms.gsdbc.SJGsDbConnection"/>
<jsp:useBean id="webuser" scope="session" class="com.macrosoft.icms.qydj.WEB_USER"/>
<%	
webuser.validatePage( request.getRequestURI());//检查用户是否有权限访问该页面
%>
<%
String OPENO=SysUtility.doPreProcess(request.getParameter("OPENO"));
if(!OPENO.equals("")){
	QYDJ_BGSX_SQ bgsx=new QYDJ_BGSX_SQ();
	ArrayList list= bgsx.getList(" WHERE OPENO='"+OPENO+"'");
	String altitem="";
	if(list.size()>0){
		for(int i=0;i<list.size();i++){
			bgsx= (QYDJ_BGSX_SQ)list.get(i);
			altitem+=bgsx.getALTITEM()+"|";
		}
	}
	out.println(altitem);
}
%>