<%@ include file="../jspheader.inc" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="SW_JBXX" scope="page"
	class="com.macrosoft.icms.bean.SW_JBXX" >
	<jsp:setProperty name="SW_JBXX" property="*"/>
</jsp:useBean>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<%
	boolean bl=false;
	if(SW_JBXX.doCount()){ 
	 bl=SW_JBXX.doModify();
	}else{
		bl=SW_JBXX.doAdd();
	}
	if (bl){
		out.print(SysUtility.setAlertScript("保存成功!","parent.window.location.reload();"));
	}else{
		out.print(SysUtility.setAlertScript("保存失败!",""));
	}
%>
