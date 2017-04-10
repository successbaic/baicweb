<%@ include file="../jspheader.inc" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="GA_ZJXX" scope="page"
	class="com.macrosoft.icms.bean.GA_ZJXX" >
	<jsp:setProperty name="GA_ZJXX" property="*"/>
</jsp:useBean>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<%
	boolean bl=false;
	if(GA_ZJXX.doCount()){ 
	 bl=GA_ZJXX.doModify();
	}else{
		bl=GA_ZJXX.doAdd();
	}
	if (bl){
		out.print(SysUtility.setAlertScript("保存成功!","parent.window.location.href='../"+Page.getNextPage()[0]+"';"));
	}else{
		out.print(SysUtility.setAlertScript("保存失败!",""));
	}
%>
