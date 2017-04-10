<%@ page contentType="text/html;charset=GBK"%>
<%@ page errorPage="error.jsp"%>

<%	com.macrosoft.icms.qydj.WEB_USER webuser=(com.macrosoft.icms.qydj.WEB_USER)session.getValue( "webuser" );
	String sErrorMsg="用户已经从系统中成功退出！";
	webuser.doLogout();
	webuser.finalize();
	session.removeValue("webuser");
	session.invalidate();
%>
<script>
window.parent.location.href="login.jsp";
</script>
