<%@ page contentType="text/html;charset=GBK"%>
<%@ page errorPage="error.jsp"%>

<%	com.macrosoft.icms.qydj.WEB_USER webuser=(com.macrosoft.icms.qydj.WEB_USER)session.getValue( "webuser" );
	String sErrorMsg="�û��Ѿ���ϵͳ�гɹ��˳���";
	webuser.doLogout();
	webuser.finalize();
	session.removeValue("webuser");
	session.invalidate();
%>
<script>
window.parent.location.href="login.jsp";
</script>
