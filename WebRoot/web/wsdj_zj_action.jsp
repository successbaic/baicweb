<%@ include file="../jspheader.inc" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="ZJ_ZZJGJBXX" scope="page"
	class="com.macrosoft.icms.bean.ZJ_ZZJGJBXX" >
	<jsp:setProperty name="ZJ_ZZJGJBXX" property="*"/>
</jsp:useBean>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<%
	boolean bl=false;
	if(ZJ_ZZJGJBXX.doCount()){ 
	 bl=ZJ_ZZJGJBXX.doModify();
	}else{
		bl=ZJ_ZZJGJBXX.doAdd();
	}
	if (bl){
		out.print(SysUtility.setAlertScript("保存成功!","parent.window.location.href='../"+Page.getNextPage()[0]+"';"));
	}else{
		out.print(SysUtility.setAlertScript("保存失败!",""));
	}
%>
