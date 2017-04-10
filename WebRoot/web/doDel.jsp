<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.system.SysUtility" %>
<%@ page import="com.macrosoft.icms.dbc.DbConnection" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Types" %>
<jsp:useBean id="webuser" scope="session" class="com.macrosoft.icms.qydj.WEB_USER"/>
<%
String CDDL=SysUtility.doPreProcess(request.getParameter("CDDL"));
String OPENO=SysUtility.doPreProcess(request.getParameter("OPENO"));
String YW=SysUtility.doPreProcess(request.getParameter("YW"));
String loginid=webuser.getLOGINID();
DbConnection dbc=new DbConnection();
ArrayList list=new ArrayList();
list.add(OPENO);
String stpv="{ ?=call STP_DEL_QYSQ(?)}";
if(CDDL.equals("0")){
	stpv="{ ?=call STP_DEL_MCSQ(?)}";
}else if(CDDL.equals("2")){
	stpv="{ ?=call STP_DEL_GTSQ(?)}";
}
int res=((Integer)dbc.executeStp(stpv, list,Types.INTEGER)).intValue();
boolean bl=false;
if(res==1){
	if(dbc.executeUpdate("UPDATE QYDJ_YWSB_SQ_LS SET LINKMAN='"+loginid+"' WHERE OPENO='"+OPENO+"'")>0){
		bl=true;
	}
}
dbc.close();
String url="../content.jsp";
if(bl){
	out.println("<script language='javascript'>alert('É¾³ý³É¹¦£¡');window.location.href='"+url+"'</script>");
}else{
	out.println("<script language='javascript'>alert('É¾³ýÊ§°Ü£¡');window.location.href='"+url+"'</script>");
}
%>
