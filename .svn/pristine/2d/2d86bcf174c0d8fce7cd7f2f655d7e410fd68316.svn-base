<%@ include file="../jspheader.inc"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html;charset=GBK"%> 
<html><head><title>经营者信息</title></head>
<jsp:useBean id="GTDJ_JYZXX" scope="page" class="com.macrosoft.icms.qydj.GTDJ_JYZXX_SQ">
	<jsp:setProperty name="GTDJ_JYZXX" property="*"/>
</jsp:useBean>
<jsp:useBean id="GTDJ_JBXX" scope="page" class="com.macrosoft.icms.qydj.GTDJ_JBXX_SQ"/>
<jsp:useBean id="QYDJ_YWSB_SQ" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<body>
<%
	String OPENO = GTDJ_JYZXX.doPreProcess(request.getParameter("OPENO"));
	GTDJ_JYZXX.setOPENO(OPENO);
	boolean bl=false;
	if(GTDJ_JYZXX.doCount())//修改
	{
		bl=GTDJ_JYZXX.doModify();		
	}else{//新增  	    		
		bl=GTDJ_JYZXX.doAdd();		
	}
	if(!bl){
		out.print(SysUtility.setAlertScript("数据保存失败!","parent.window.location.reload();"));
	}
	GTDJ_JBXX.setOPENO(OPENO);
	GTDJ_JBXX.setOPERNAME(GTDJ_JBXX.doPreProcess(request.getParameter("NAME")));
	QYDJ_YWSB_SQ.setOPENO(OPENO);
	QYDJ_YWSB_SQ.doSelect();
	QYDJ_YWSB_SQ.setLEREP(QYDJ_YWSB_SQ.doPreProcess(request.getParameter("NAME")));
	if(GTDJ_JBXX.doModByJyz()&&QYDJ_YWSB_SQ.doModify()){
		//String[] next=Page.getNextPage();
		out.print(SysUtility.setAlertScript("数据保存成功!","parent.window.location.href='../"+Page.getNextPage()[0]+"'"));
	}else{
		out.print(SysUtility.setAlertScript("数据保存失败!","parent.window.location.reload();"));
	}
%>
</body></html>
 
