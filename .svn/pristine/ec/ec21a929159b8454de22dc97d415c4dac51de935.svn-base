<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="DCDY_JBXX" scope="page" class="com.macrosoft.icms.htgl.DCDY_JBXX_SQ"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<%@ page import="com.macrosoft.icms.util.CHECK_INFO" %>
<html>
<head>
<title></title>
</head>
<body>
<%
	String MORREGCNO=SysUtility.doPreProcess(SysUtility.convertCode(request.getParameter("MORREGCNO")));	
	String MORTGAGO=SysUtility.doPreProcess(SysUtility.convertCode(request.getParameter("MORTGAGO")));	
	String REGORUN=SysUtility.doPreProcess(SysUtility.convertCode(request.getParameter("REGORUN")));	
	DCDY_JBXX.doSelectBySql(" SELECT * FROM DCDY_JBXX_SQ WHERE MORREGCNO='"+MORREGCNO+"' AND REGORUN='"+REGORUN+"' AND MORTGAGO='"+MORTGAGO+"' AND MORTGAGORTYPE='1' AND STATUS='2'");
	if(DCDY_JBXX.getOPENO().equals("")){
		out.print(SysUtility.setAlertScript("不存在该动产抵押登记信息活动产抵押信息不匹配！",""));
	    return;
	}
	Page.setOPENO(DCDY_JBXX.getOPENO());
	Page.setENTTYPE("DCDY");
	Page.setPRIPID("");
	Page.setENTNAME(MORTGAGO);
	Page.setREGNO(MORREGCNO);
	Page.setXGBH(REGORUN);
	out.print("<script language='javascript'>parent.window.location.href='../dcdy_xgcl_gt.jsp'</script>");	
%>
</body>
</html>