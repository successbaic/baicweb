<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="../jspheader.inc"%>
<html><head><title>数据保存</title></head>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="QYDJ_SQWT" scope="page" class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ">
	<jsp:setProperty name="QYDJ_SQWT" property="*"/>
</jsp:useBean>
<%
QYDJ_SQWT.setOPENO(request.getParameter("OPENO"));
boolean bl=false;
if(QYDJ_SQWT.doCount()){
	bl=QYDJ_SQWT.doModify();	
}else{
	bl=QYDJ_SQWT.doAdd();
}
if(!bl){
	out.print(SysUtility.setAlertScript("保存失败!","parent.window.location.reload();"));
}else{
	out.print(SysUtility.setAlertScript("保存成功!","parent.window.location.href='mcgl_dotj.jsp';"));	
}
%>