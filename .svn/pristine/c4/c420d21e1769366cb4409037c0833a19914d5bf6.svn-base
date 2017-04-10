<%
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader("Expires",0);
response.setHeader("Expires","0");
%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<%@ page errorPage="error.jsp"%>
<jsp:useBean id="GGGL_USER" scope="session" class="com.macrosoft.icms.ggxkz.GGGL_USER"/>
<jsp:useBean id="GGGL_USER_NW" scope="session" class="com.macrosoft.icms.ggxkz.GGGL_USER_NW"/>
<%
if(GGGL_USER==null || GGGL_USER.getADBULICNO()==null || GGGL_USER.getADBULICNO().equals("")){
if(GGGL_USER_NW==null || GGGL_USER_NW.getUSERID()==null || GGGL_USER_NW.getUSERID().equals("")){
%>
<script language="javascript">
alert("登录时间超时，请重新登录！");
window.location.href='ggxkzlogin.jsp'
</script>
<%
}}
%>
<LINK href="css/icms.css" type="text/css" rel="stylesheet">
<script language="javascript" src="support/list.js"></script>
<script language="javascript" src="support/Calendar.js"></script>
<script language="javascript" src="support/window.js"></script>
<script language="javascript" src="support/value.js"></script>
<script language="javascript" src="support/valid.js"></script>
<script language="javascript" src="support/pubjs.js"></script>