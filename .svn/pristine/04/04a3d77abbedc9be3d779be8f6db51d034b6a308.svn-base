<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
response.setHeader("Expires","0");
%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<%@ page errorPage="/error.jsp"%>

<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="dbc" scope="page" class="com.macrosoft.icms.dbc.DbConnection"/>
<jsp:useBean id="gsdbc" scope="page" class="com.macrosoft.icms.gsdbc.GsDbConnection"/>
<jsp:useBean id="sjdbc" scope="page" class="com.macrosoft.icms.gsdbc.SJGsDbConnection"/>
<jsp:useBean id="webuser" scope="session" class="com.macrosoft.icms.qydj.WEB_USER"/>
<%	
	
webuser.validatePage( request.getRequestURI());//检查用户是否有权限访问该页面
String webPath = request.getContextPath() ;
String sanZheng = icms.getSanZheng(webuser.getXZQH());
boolean isSanZheng = false;

sanZheng = "0";

if("1".equals(sanZheng)){
	isSanZheng = true;
}
%>
<%
%>
<LINK href="<%=request.getContextPath() %>/css/icms.css" type="text/css" rel="stylesheet">
<script language="javascript" src="<%=request.getContextPath() %>/support/jquery-1.8.3.js"></script>
<script language="javascript" src="<%=request.getContextPath() %>/support/list.js"></script>
<script language="javascript" src="<%=request.getContextPath() %>/support/Calendar.js"></script>
<script language="javascript" src="<%=request.getContextPath() %>/support/window.js"></script>
<script language="javascript" src="<%=request.getContextPath() %>/support/value.js"></script>
<script language="javascript" src="<%=request.getContextPath() %>/support/valid.js"></script>
<script language="javascript" src="<%=request.getContextPath() %>/support/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	webPath = "<%=webPath %>";	
</script>