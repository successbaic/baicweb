<%@page import="com.macrosoft.icms.system.SysUtility"%>
<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<%@page import="com.macrosoft.icms.szcp.dao.SZCP_SQ_SHRYDao" %>    
<jsp:useBean id="shry" scope="page" class="com.macrosoft.icms.szcp.SZCP_SQ_SHRY" ></jsp:useBean>    

<%
	request.setCharacterEncoding("GBK");
	SZCP_SQ_SHRYDao shryDao = new SZCP_SQ_SHRYDao();
	shry.setREG_NO(request.getParameter("REGNOHIDDEN"));
	shry.setEVAL_YEAR(request.getParameter("EVALHIDDEN"));
	shry.setHONOR_LEVEL_TYPE(request.getParameter("HONOR_LEVEL_TYPE"));
	shry.setCERT_NAME(request.getParameter("CERT_NAME"));
	shry.setCERT_NO(request.getParameter("CERT_NO"));
	shry.setAUTH_ORG_DESC(request.getParameter("AUTH_ORG_DESC"));
	shry.setISSUE_DATE(request.getParameter("ISSUE_DATE"));
	shry.setVALID_TO_DATE(request.getParameter("VALID_TO_DATE"));  
	shry.setHONORDESC(request.getParameter("HONORDESC"));
	boolean flag = shryDao.addSZCP_SQ_SHRY(shry);
	if(flag) {
		out.print("ok");
	}
%>
 