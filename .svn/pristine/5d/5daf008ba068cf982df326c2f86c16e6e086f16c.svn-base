<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileWriter"%>
<%@page import="com.macrosoft.icms.system.SysUtility"%>
<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<%@page import="com.macrosoft.icms.szcp.dao.SZCP_SQ_XGZSDao" %>
<jsp:useBean id="xgzs" scope="page" class="com.macrosoft.icms.szcp.SZCP_SQ_XGZS" ></jsp:useBean>    

<%
	request.setCharacterEncoding("GBK");
	SZCP_SQ_XGZSDao xgzsDao = new SZCP_SQ_XGZSDao();
	xgzs.setREG_NO(request.getParameter("REGNOHIDDEN"));
	xgzs.setEVAL_YEAR(request.getParameter("EVALHIDDEN"));
	xgzs.setCERT_NAME(request.getParameter("CERT_NAME"));
	xgzs.setCERT_NO(request.getParameter("CERT_NO"));
	xgzs.setAUTH_ORG_DESC(request.getParameter("AUTH_ORG_DESC"));
	xgzs.setISSUE_DATE(request.getParameter("ISSUE_DATE"));
	xgzs.setVALID_TO_DATE(request.getParameter("VALID_TO_DATE"));  
	boolean flag = xgzsDao.addSZCP_SQ_XGZS(xgzs);
	if(flag) {
		out.print("ok");
	}else {
		
	} 
%>
 