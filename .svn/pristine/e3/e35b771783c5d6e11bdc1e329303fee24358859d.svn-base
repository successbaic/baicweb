<%@page import="com.macrosoft.icms.system.SysUtility"%>
<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
 <%@page import="com.macrosoft.icms.szcp.dao.SZCP_SQ_XGZSDao" %>
<jsp:useBean id="xgzs" scope="page" class="com.macrosoft.icms.szcp.SZCP_SQ_XGZS" ></jsp:useBean>    

<%
	request.setCharacterEncoding("GBK");
	SZCP_SQ_XGZSDao xgzsDao = new SZCP_SQ_XGZSDao();
	xgzs.setREG_NO(request.getParameter("REG_NO"));
	xgzs.setEVAL_YEAR(request.getParameter("EVAL_YEAR"));
	xgzs.setCERT_NAME(request.getParameter("CERT_NAME"));
	boolean flag = xgzsDao.deleteSZCP_SQ_XGZS(xgzs);
	if(flag) {
		out.print("ok");
	}
%>
 