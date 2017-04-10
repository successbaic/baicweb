<%@ include file="../jspheader.inc" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="QYDJ_SQWT" scope="page" class="com.macrosoft.icms.qydj.QYDJ_SQWT_SQ">
    <jsp:setProperty name="QYDJ_SQWT" property="*"/>
</jsp:useBean>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<%
	String action=request.getParameter("action");
    String date = new SimpleDateFormat("yyyy-MM-dd").format(new java.sql.Date(new java.util.Date().getTime()));  //获取当前系统日期 	
	String OPENO = QYDJ_SQWT.doPreProcess(request.getParameter("OPENO"));
	boolean bl=false;
	QYDJ_SQWT.setOPENO(OPENO);
	if(QYDJ_SQWT.doCount()){ 
	 bl=QYDJ_SQWT.doModify();
	}else{
		bl=QYDJ_SQWT.doAdd();
	}
	if (bl){
		out.print(SysUtility.setAlertScript("保存成功!","parent.window.location.href='"+Page.getNextPage()[0]+"';"));
	}else{
		out.print(SysUtility.setAlertScript("保存失败!",""));
	}
%>
