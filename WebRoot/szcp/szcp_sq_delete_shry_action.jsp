<%@page import="com.macrosoft.icms.system.SysUtility"%>
<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<%@page import="com.macrosoft.icms.szcp.dao.SZCP_SQ_SHRYDao" %>    
<jsp:useBean id="shry" scope="page" class="com.macrosoft.icms.szcp.SZCP_SQ_SHRY" ></jsp:useBean>    

<%
	request.setCharacterEncoding("GBK");
	SZCP_SQ_SHRYDao shryDao = new SZCP_SQ_SHRYDao();
	shry.setREG_NO(request.getParameter("REG_NO"));
	shry.setEVAL_YEAR(request.getParameter("EVAL_YEAR"));
	shry.setCERT_NAME(request.getParameter("CERT_NAME"));
	boolean flag = shryDao.deleteSZCP_SQ_SHRY(shry);
	if(flag) {
		out.print("ok");
	}
	%>
 