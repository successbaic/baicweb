<%@page import="com.macrosoft.icms.system.SysUtility"%>
<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
 <%@ page import="com.macrosoft.icms.szcp.dao.SZCP_SQ_GYJZDao"%>          
<jsp:useBean id="gyjz" scope="page" class="com.macrosoft.icms.szcp.SZCP_SQ_GYJZ" ></jsp:useBean> 
<jsp:useBean id="CreateHeaderUtil" scope="page" class="com.macrosoft.icms.szcp.CreateHeaderUtil" ></jsp:useBean>    
<%
	String CerNO = request.getParameter("CerNO");	
	SZCP_SQ_GYJZDao  gyjzDao = new SZCP_SQ_GYJZDao();
	gyjz.setREG_NO(request.getParameter("REG_NO"));
	gyjz.setEVAL_YEAR(request.getParameter("EVAL_YEAR"));
	gyjz.setLAST_DONT_RMB_W(Float.parseFloat(request.getParameter("LAST_DONT_RMB_W")));
	boolean flag = gyjzDao.executeNextStep(gyjz);
	if(flag) {
		out.print(CreateHeaderUtil.setAlertGo("","szcp_sq_xgzs.jsp?REG_NO="+gyjz.getREG_NO()+"&EVAL_YEAR="+gyjz.getEVAL_YEAR()+"&CerNO="+CerNO));
	}else {
		out.print(SysUtility.setAlertScript("系统出错，请稍后再试",""));
	}
%>