<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="HD0403" scope="page" class="com.macrosoft.icms.gsnw.HD0403"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<%@ page import="com.macrosoft.icms.util.CHECK_INFO" %>
<html>
<head>
<title></title>
</head>
<body>
<%
	String ADNAME=SysUtility.doPreProcess(SysUtility.convertCode(request.getParameter("ADNAME")));	
	String ADREGCNO=SysUtility.doPreProcess(SysUtility.convertCode(request.getParameter("ADREGCNO")));	
	HD0403.doSelectBySql(" SELECT * FROM HD0403 WHERE HD04035='"+ADNAME+"' AND HD04023='"+ADREGCNO+"'");
	if(HD0403.getHD04001().equals("")){
		out.print(SysUtility.setAlertScript("不存在该户外广告或户外广告名称与登记号不匹配！",""));
	    return;
	}
	Page.setENTTYPE("HWGG");
	Page.setPRIPID(HD0403.getHD04001());
	Page.setENTNAME(ADNAME);
	Page.setREGNO(ADREGCNO);

	out.print("<script language='javascript'>parent.window.location.href='../hwgg_xgcl.jsp'</script>");	
%>
</body>
</html>