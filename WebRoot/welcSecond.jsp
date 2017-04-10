<%@ page language="java" contentType="text/html; charset=GBK"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="com.macrosoft.icms.util.PropertiesConfigUtil"%>
<jsp:useBean id="webuser" scope="session" class="com.macrosoft.icms.qydj.WEB_USER"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<%	
	webuser.validatePage( request.getRequestURI());//检查用户是否有权限访问该页面
%>
<html>
<head>
<title><%=PropertiesConfigUtil.getValue("deployregorg")%>网上服务平台</title>
<STYLE type="text/css">
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: none;
}
a:active {
	text-decoration: none;
}
area{
	cursor:hand;
}
</STYLE>
<SCRIPT language="javascript">
function doSub(ywlx){	
	document.form1.OPETYPE.value=ywlx;
	document.form1.submit();
}
function doLogout(){
	if (window.confirm("确定退出企业网上工商系统吗?"))
	{
		window.location.href="logout.jsp";
	}
}
</SCRIPT>
</head>
<body>
<%
 //清楚原有的session
 if(session.getAttribute("Page")!=null){
 session.removeAttribute("Page");
 }
 
String CDDL=request.getParameter("CDDL");
String IFBA=request.getParameter("IFBA");
String CJLX=request.getParameter("CJLX");
if(IFBA==null){
	IFBA="";
}
String tp="images/welcome/second1.png";
if(IFBA.equals("N")){
	tp="images/welcome/second2.png";
}
if(CDDL.equals("0")){
	tp="images/welcome/second0.png";
}
if(CDDL.equals("4"))
{
	tp="images/welcome/second3.png";
}
if(CDDL.equals("5"))
{
	tp="images/welcome/second4.png";
}
%>
<table height="100%" align="center"><tr><td align="center" valign="middle">
<table align="center" cellpadding="0" cellspacing="0">
<tr>
<td valign="middle" align="center">
  <img src="<%=tp%>" border="0" usemap="#Map"></td>
</tr>
</table>

<map name="Map">
<area shape="rect" coords="739,13,805,92" href="#" onclick="window.open('usermodify/modify_main.jsp','displayWindow','top=120,left=150,toolbar=yes,width=880,height=480,directories=yes,status=yes,scrollbars=yes,resizable =yes,menubar=yes')" onFocus="this.blur()">
<area shape="rect" coords="811,13,872,92" href="#" onclick="window.open('help/help.jsp','help','top=120,left=150,toolbar=no,width=800,height=600,directories=no,status=no,scrollbars=yes,resize=yes,menubar=no');" onFocus="this.blur()">
<area shape="rect" coords="879,13,941,92" href="#" onclick="window.location.href='content.jsp'" onFocus="this.blur()">
<% 
if(!CDDL.equals("0")){
%>
<area shape="rect" coords="302,90,478,295" href="#" onclick="doSub('20')" onFocus="this.blur()">
<area shape="rect" coords="558,90,732,295" href="#" onclick="doSub('30')" onFocus="this.blur()">
<%}else{ %>
<area shape="rect" coords="302,90,478,295" href="#" onclick="doSub('10')" onFocus="this.blur()">
<area shape="rect" coords="558,90,732,295" href="#" onclick="doSub('11')" onFocus="this.blur()">
<area shape="rect" coords="303,308,478,516" href="#" onclick="doSub('12')" onFocus="this.blur()">
<area shape="rect" coords="555,308,732,516" href="#" onclick="doSub('13')" onFocus="this.blur()">
<%} %>
<%
if(CDDL.equals("5")){

}else{
%>
<area shape="rect" coords="303,308,478,516" href="#" onclick="doSub('50')" onFocus="this.blur()">
<%}%>
<%
if(IFBA.equals("Y")){
%>
<area shape="rect" coords="555,308,732,516" href="#" onclick="doSub('40')" onFocus="this.blur()">
<%}
if(CDDL.equals("4"))//股权出质需要撤销业务
{
%>
<area shape="rect" coords="555,308,732,516" href="#" onclick="doSub('81')" onFocus="this.blur()">
<%}%>
<area shape="rect" coords="800,505,863,576" href="welcome.jsp" onFocus="this.blur()">
<area shape="rect" coords="867,505,926,575" href="#" onclick="doLogout()" onFocus="this.blur()">
</map>
<form name="form1" method="post" action="main.jsp">
<input type="hidden" name="CJLX" value="<%=CJLX%>">
<input type="hidden" name="CDDL" value="<%=CDDL%>">
<input type="hidden" name="OPETYPE">
<input type="hidden" name="SIGN" value="0">
<input type="hidden" name="STEP" value="0">
<input type="hidden" name="OPENO" value="">
</form></td></tr></table>
</body>
</html>
