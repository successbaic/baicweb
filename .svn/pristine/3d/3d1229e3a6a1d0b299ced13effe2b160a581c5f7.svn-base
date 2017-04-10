<%@page import="com.macrosoft.icms.system.SysUtility"%>
<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<jsp:useBean id="lczt" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_LCZT" />
<jsp:useBean id="CreateHeaderUtil" scope="page"
	class="com.macrosoft.icms.szcp.CreateHeaderUtil" >
</jsp:useBean>
	<%
		String REG_NO = request.getParameter("REG_NO");
		String EVAL_YEAR = request.getParameter("EVAL_YEAR");
		String CerNO = request.getParameter("CerNO");
		String APPR_STAT_FLAG = request.getParameter("APPR_STAT_FLAG");
		String PRO_STAT_FLAG = request.getParameter("PRO_STAT_FLAG");
		lczt.setREG_NO(REG_NO);
		lczt.setEVAL_YEAR(EVAL_YEAR);
		lczt.setAPPR_STAT_FLAG(APPR_STAT_FLAG);
		lczt.setPRO_STAT_FLAG(PRO_STAT_FLAG);
		boolean flag = lczt.updateSzcpLczt(lczt);
		if(flag) {
			out.print(CreateHeaderUtil.setAlertGo("","szcp_jdcx.jsp?REG_NO="+REG_NO+"&EVAL_YEAR="+EVAL_YEAR+"&CERNO="+CerNO));
		}
	%>    
