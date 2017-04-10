<%@page import="com.macrosoft.icms.system.SysUtility"%>
<%@page import="com.macrosoft.icms.szcp.dao.SZCP_SQ_LXQKDao"%>
<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<jsp:useBean id="lxqkDao_LAST" scope="page" 
	class="com.macrosoft.icms.szcp.dao.SZCP_SQ_LXQKDao">
</jsp:useBean>

<jsp:useBean id="lxqkDao_NEXT" scope="page" 
	class="com.macrosoft.icms.szcp.dao.SZCP_SQ_LXQKDao">
</jsp:useBean>

<jsp:useBean id="SZCP_SQ_LXQK_IN_LAST" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_LXQK_IN" > 
</jsp:useBean>
<jsp:useBean id="SZCP_SQ_LXQK_IN_NEXT" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_LXQK_IN" > 
</jsp:useBean>
<jsp:useBean id="SZCP_SQ_LXQK_OUT_LAST" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_LXQK_OUT" > 
</jsp:useBean>
<jsp:useBean id="SZCP_SQ_LXQK_OUT_NEXT" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_LXQK_OUT" > 
</jsp:useBean>
<jsp:useBean id="SZCP_SQ_LXQK_RATE_LAST" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_LXQK_RATE" > 
</jsp:useBean>	
<jsp:useBean id="SZCP_SQ_LXQK_RATE_NEXT" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_LXQK_RATE" > 
</jsp:useBean>
<jsp:useBean id="CreateHeaderUtil" scope="page"
	class="com.macrosoft.icms.szcp.CreateHeaderUtil" > 
</jsp:useBean>
	<%
		String REGNO = request.getParameter("REG_NO");
		String YEAR = request.getParameter("EVAL_YEAR");
		String CerNO = request.getParameter("CerNO");
		String REPORT_YEAR1 = request.getParameter("REPORT_YEAR1");	
		String REPORT_YEAR2 = request.getParameter("REPORT_YEAR2");
		
		String TOTAL_CONT_QTY_IN_LAST= request.getParameter("TOTAL_CONT_QTY_IN_LAST");
		SZCP_SQ_LXQK_IN_LAST.setTOTAL_CONT_QTY(Integer.parseInt(TOTAL_CONT_QTY_IN_LAST));
		String TOTAL_CONT_QTY_IN_NEXT= request.getParameter("TOTAL_CONT_QTY_IN_NEXT");
		SZCP_SQ_LXQK_IN_NEXT.setTOTAL_CONT_QTY(Integer.parseInt(TOTAL_CONT_QTY_IN_NEXT));
		
		String TOTAL_CONT_QTY_OUT_LAST= request.getParameter("TOTAL_CONT_QTY_OUT_LAST");
		SZCP_SQ_LXQK_OUT_LAST.setTOTAL_CONT_QTY(Integer.parseInt(TOTAL_CONT_QTY_OUT_LAST));
		String TOTAL_CONT_QTY_OUT_NEXT= request.getParameter("TOTAL_CONT_QTY_OUT_NEXT");
		SZCP_SQ_LXQK_OUT_NEXT.setTOTAL_CONT_QTY(Integer.parseInt(TOTAL_CONT_QTY_OUT_NEXT));
		
		String TOTAL_CONT_RMB_W_IN_LAST= request.getParameter("TOTAL_CONT_RMB_W_IN_LAST");
		SZCP_SQ_LXQK_IN_LAST.setTOTAL_CONT_RMB_W(Double.parseDouble(TOTAL_CONT_RMB_W_IN_LAST));
		String TOTAL_CONT_RMB_W_IN_NEXT= request.getParameter("TOTAL_CONT_RMB_W_IN_NEXT");
		SZCP_SQ_LXQK_IN_NEXT.setTOTAL_CONT_RMB_W(Double.parseDouble(TOTAL_CONT_RMB_W_IN_NEXT));
		
		String TOTAL_CONT_RMB_W_OUT_LAST= request.getParameter("TOTAL_CONT_RMB_W_OUT_LAST");
		SZCP_SQ_LXQK_OUT_LAST.setTOTAL_CONT_RMB_W(Double.parseDouble(TOTAL_CONT_RMB_W_OUT_LAST));
		String TOTAL_CONT_RMB_W_OUT_NEXT= request.getParameter("TOTAL_CONT_RMB_W_OUT_NEXT");
		SZCP_SQ_LXQK_OUT_NEXT.setTOTAL_CONT_RMB_W(Double.parseDouble(TOTAL_CONT_RMB_W_OUT_NEXT));
		
		String LAST_CONT_QTY_IN_LAST= request.getParameter("LAST_CONT_QTY_IN_LAST");
		SZCP_SQ_LXQK_IN_LAST.setLAST_CONT_QTY(Integer.parseInt(LAST_CONT_QTY_IN_LAST));
		String LAST_CONT_QTY_IN_NEXT= request.getParameter("LAST_CONT_QTY_IN_NEXT");
		SZCP_SQ_LXQK_IN_NEXT.setLAST_CONT_QTY(Integer.parseInt(LAST_CONT_QTY_IN_NEXT));
		
		String LAST_CONT_QTY_OUT_LAST= request.getParameter("LAST_CONT_QTY_OUT_LAST");
		SZCP_SQ_LXQK_OUT_LAST.setLAST_CONT_QTY(Integer.parseInt(LAST_CONT_QTY_OUT_LAST));
		String LAST_CONT_QTY_OUT_NEXT= request.getParameter("LAST_CONT_QTY_OUT_NEXT");
		SZCP_SQ_LXQK_OUT_NEXT.setLAST_CONT_QTY(Integer.parseInt(LAST_CONT_QTY_OUT_NEXT));
		
		String LAST_CONT_RMB_W_IN_LAST= request.getParameter("LAST_CONT_RMB_W_IN_LAST");
		SZCP_SQ_LXQK_IN_LAST.setLAST_CONT_RMB_W(Double.parseDouble(LAST_CONT_RMB_W_IN_LAST));
		String LAST_CONT_RMB_W_IN_NEXT= request.getParameter("LAST_CONT_RMB_W_IN_NEXT");
		SZCP_SQ_LXQK_IN_NEXT.setLAST_CONT_RMB_W(Double.parseDouble(LAST_CONT_RMB_W_IN_NEXT));
		
		String LAST_CONT_RMB_W_OUT_LAST= request.getParameter("LAST_CONT_RMB_W_OUT_LAST");
		SZCP_SQ_LXQK_OUT_LAST.setLAST_CONT_RMB_W(Double.parseDouble(LAST_CONT_RMB_W_OUT_LAST));
		String LAST_CONT_RMB_W_OUT_NEXT= request.getParameter("LAST_CONT_RMB_W_OUT_NEXT");
		SZCP_SQ_LXQK_OUT_NEXT.setLAST_CONT_RMB_W(Double.parseDouble(LAST_CONT_RMB_W_OUT_NEXT));
		
		String PLAN_CONT_QTY_IN_LAST= request.getParameter("PLAN_CONT_QTY_IN_LAST");
		SZCP_SQ_LXQK_IN_LAST.setPLAN_CONT_QTY(Integer.parseInt(PLAN_CONT_QTY_IN_LAST));
		String PLAN_CONT_QTY_IN_NEXT= request.getParameter("PLAN_CONT_QTY_IN_NEXT");
		SZCP_SQ_LXQK_IN_NEXT.setPLAN_CONT_QTY(Integer.parseInt(PLAN_CONT_QTY_IN_NEXT));
		
		String PLAN_CONT_QTY_OUT_LAST= request.getParameter("PLAN_CONT_QTY_OUT_LAST");
		SZCP_SQ_LXQK_OUT_LAST.setPLAN_CONT_QTY(Integer.parseInt(PLAN_CONT_QTY_OUT_LAST));
		String PLAN_CONT_QTY_OUT_NEXT= request.getParameter("PLAN_CONT_QTY_OUT_NEXT");
		SZCP_SQ_LXQK_OUT_NEXT.setPLAN_CONT_QTY(Integer.parseInt(PLAN_CONT_QTY_OUT_NEXT));
		
		String PLAN_CONT_RMB_W_IN_LAST= request.getParameter("PLAN_CONT_RMB_W_IN_LAST");
		SZCP_SQ_LXQK_IN_LAST.setPLAN_CONT_RMB_W(Double.parseDouble(PLAN_CONT_RMB_W_IN_LAST));
		String PLAN_CONT_RMB_W_IN_NEXT= request.getParameter("PLAN_CONT_RMB_W_IN_NEXT");
		SZCP_SQ_LXQK_IN_NEXT.setPLAN_CONT_RMB_W(Double.parseDouble(PLAN_CONT_RMB_W_IN_NEXT));
		
		String PLAN_CONT_RMB_W_OUT_LAST= request.getParameter("PLAN_CONT_RMB_W_OUT_LAST");
		SZCP_SQ_LXQK_OUT_LAST.setPLAN_CONT_RMB_W(Double.parseDouble(PLAN_CONT_RMB_W_OUT_LAST));
		String PLAN_CONT_RMB_W_OUT_NEXT= request.getParameter("PLAN_CONT_RMB_W_OUT_NEXT");
		SZCP_SQ_LXQK_OUT_NEXT.setPLAN_CONT_RMB_W(Double.parseDouble(PLAN_CONT_RMB_W_OUT_NEXT));
		
		String REAL_CONT_QTY_IN_LAST= request.getParameter("REAL_CONT_QTY_IN_LAST");
		SZCP_SQ_LXQK_IN_LAST.setREAL_CONT_QTY(Integer.parseInt(REAL_CONT_QTY_IN_LAST));
		String REAL_CONT_QTY_IN_NEXT= request.getParameter("REAL_CONT_QTY_IN_NEXT");
		SZCP_SQ_LXQK_IN_NEXT.setREAL_CONT_QTY(Integer.parseInt(REAL_CONT_QTY_IN_NEXT));
		
		String REAL_CONT_QTY_OUT_LAST= request.getParameter("REAL_CONT_QTY_OUT_LAST");
		SZCP_SQ_LXQK_OUT_LAST.setREAL_CONT_QTY(Integer.parseInt(REAL_CONT_QTY_OUT_LAST));
		String REAL_CONT_QTY_OUT_NEXT= request.getParameter("REAL_CONT_QTY_OUT_NEXT");
		SZCP_SQ_LXQK_OUT_NEXT.setREAL_CONT_QTY(Integer.parseInt(REAL_CONT_QTY_OUT_NEXT));
		
		String REAL_CONT_RMB_W_IN_LAST = request.getParameter("REAL_CONT_RMB_W_IN_LAST");
		SZCP_SQ_LXQK_IN_LAST.setREAL_CONT_RMB_W(Double.parseDouble(REAL_CONT_RMB_W_IN_LAST));
		String REAL_CONT_RMB_W_IN_NEXT = request.getParameter("REAL_CONT_RMB_W_IN_NEXT");
		SZCP_SQ_LXQK_IN_NEXT.setREAL_CONT_RMB_W(Double.parseDouble(REAL_CONT_RMB_W_IN_NEXT));
		
		String REAL_CONT_RMB_W_OUT_LAST = request.getParameter("REAL_CONT_RMB_W_OUT_LAST");
		SZCP_SQ_LXQK_OUT_LAST.setREAL_CONT_RMB_W(Double.parseDouble(REAL_CONT_RMB_W_OUT_LAST));
		String REAL_CONT_RMB_W_OUT_NEXT = request.getParameter("REAL_CONT_RMB_W_OUT_NEXT");
		SZCP_SQ_LXQK_OUT_NEXT.setREAL_CONT_RMB_W(Double.parseDouble(REAL_CONT_RMB_W_OUT_NEXT));
		
		String CANCEL_CONT_QTY_IN_LAST =  request.getParameter("CANCEL_CONT_QTY_IN_LAST");
		SZCP_SQ_LXQK_IN_LAST.setCANCEL_CONT_QTY(Integer.parseInt(CANCEL_CONT_QTY_IN_LAST));
		String CANCEL_CONT_QTY_IN_NEXT =  request.getParameter("CANCEL_CONT_QTY_IN_NEXT");
		SZCP_SQ_LXQK_IN_NEXT.setCANCEL_CONT_QTY(Integer.parseInt(CANCEL_CONT_QTY_IN_NEXT));
		
		String CANCEL_CONT_QTY_OUT_LAST = request.getParameter("CANCEL_CONT_QTY_OUT_LAST");
		SZCP_SQ_LXQK_OUT_LAST.setCANCEL_CONT_QTY(Integer.parseInt(CANCEL_CONT_QTY_OUT_LAST));
		String CANCEL_CONT_QTY_OUT_NEXT = request.getParameter("CANCEL_CONT_QTY_OUT_NEXT");
		SZCP_SQ_LXQK_OUT_NEXT.setCANCEL_CONT_QTY(Integer.parseInt(CANCEL_CONT_QTY_OUT_NEXT));
		
		String CANCEL_CONT_RMB_W_IN_LAST = request.getParameter("CANCEL_CONT_RMB_W_IN_LAST");
		SZCP_SQ_LXQK_IN_LAST.setCANCEL_CONT_RMB_W(Double.parseDouble(CANCEL_CONT_RMB_W_IN_LAST));
		String CANCEL_CONT_RMB_W_IN_NEXT = request.getParameter("CANCEL_CONT_RMB_W_IN_NEXT");
		SZCP_SQ_LXQK_IN_NEXT.setCANCEL_CONT_RMB_W(Double.parseDouble(CANCEL_CONT_RMB_W_IN_NEXT));
		
		String CANCEL_CONT_RMB_W_OUT_LAST = request.getParameter("CANCEL_CONT_RMB_W_OUT_LAST");
		SZCP_SQ_LXQK_OUT_LAST.setCANCEL_CONT_RMB_W(Double.parseDouble(CANCEL_CONT_RMB_W_OUT_LAST));
		String CANCEL_CONT_RMB_W_OUT_NEXT = request.getParameter("CANCEL_CONT_RMB_W_OUT_NEXT");
		SZCP_SQ_LXQK_OUT_NEXT.setCANCEL_CONT_RMB_W(Double.parseDouble(CANCEL_CONT_RMB_W_OUT_NEXT));
		
		String COMP_CONT_QTY_IN_LAST = request.getParameter("COMP_CONT_QTY_IN_LAST");
		SZCP_SQ_LXQK_IN_LAST.setCOMP_CONT_QTY(Integer.parseInt(COMP_CONT_QTY_IN_LAST));
		String COMP_CONT_QTY_IN_NEXT = request.getParameter("COMP_CONT_QTY_IN_NEXT");
		SZCP_SQ_LXQK_IN_NEXT.setCOMP_CONT_QTY(Integer.parseInt(COMP_CONT_QTY_IN_NEXT));
		
		String COMP_CONT_QTY_OUT_LAST = request.getParameter("COMP_CONT_QTY_OUT_LAST");
		SZCP_SQ_LXQK_OUT_LAST.setCOMP_CONT_QTY(Integer.parseInt(COMP_CONT_QTY_OUT_LAST));
		String COMP_CONT_QTY_OUT_NEXT = request.getParameter("COMP_CONT_QTY_OUT_NEXT");
		SZCP_SQ_LXQK_OUT_NEXT.setCOMP_CONT_QTY(Integer.parseInt(COMP_CONT_QTY_OUT_NEXT));
		
		String COMP_CONT_RMB_W_IN_LAST = request.getParameter("COMP_CONT_RMB_W_IN_LAST");
		SZCP_SQ_LXQK_IN_LAST.setCOMP_CONT_RMB_W(Double.parseDouble(COMP_CONT_RMB_W_IN_LAST));
		String COMP_CONT_RMB_W_IN_NEXT = request.getParameter("COMP_CONT_RMB_W_IN_NEXT");
		SZCP_SQ_LXQK_IN_NEXT.setCOMP_CONT_RMB_W(Double.parseDouble(COMP_CONT_RMB_W_IN_NEXT));
		
		String COMP_CONT_RMB_W_OUT_LAST = request.getParameter("COMP_CONT_RMB_W_OUT_LAST");
		SZCP_SQ_LXQK_OUT_LAST.setCOMP_CONT_RMB_W(Double.parseDouble(COMP_CONT_RMB_W_OUT_LAST));
		String COMP_CONT_RMB_W_OUT_NEXT = request.getParameter("COMP_CONT_RMB_W_OUT_NEXT");
		SZCP_SQ_LXQK_OUT_NEXT.setCOMP_CONT_RMB_W(Double.parseDouble(COMP_CONT_RMB_W_OUT_NEXT));
		
		String OTHER_CONT_QTY_IN_LAST = request.getParameter("OTHER_CONT_QTY_IN_LAST"); 
		SZCP_SQ_LXQK_IN_LAST.setOTHER_CONT_QTY(Integer.parseInt(OTHER_CONT_QTY_IN_LAST));
		String OTHER_CONT_QTY_IN_NEXT = request.getParameter("OTHER_CONT_QTY_IN_NEXT"); 
		SZCP_SQ_LXQK_IN_NEXT.setOTHER_CONT_QTY(Integer.parseInt(OTHER_CONT_QTY_IN_NEXT));
		
		String OTHER_CONT_QTY_OUT_LAST = request.getParameter("OTHER_CONT_QTY_OUT_LAST");
		SZCP_SQ_LXQK_OUT_LAST.setOTHER_CONT_QTY(Integer.parseInt(OTHER_CONT_QTY_OUT_LAST));
		String OTHER_CONT_QTY_OUT_NEXT = request.getParameter("OTHER_CONT_QTY_OUT_NEXT");
		SZCP_SQ_LXQK_OUT_NEXT.setOTHER_CONT_QTY(Integer.parseInt(OTHER_CONT_QTY_OUT_NEXT));
		
		String OTHER_CONT_RMB_W_IN_LAST = request.getParameter("OTHER_CONT_RMB_W_IN_LAST");
		SZCP_SQ_LXQK_IN_LAST.setOTHER_CONT_RMB_W(Double.parseDouble(OTHER_CONT_RMB_W_IN_LAST));
		String OTHER_CONT_RMB_W_IN_NEXT = request.getParameter("OTHER_CONT_RMB_W_IN_NEXT");
		SZCP_SQ_LXQK_IN_NEXT.setOTHER_CONT_RMB_W(Double.parseDouble(OTHER_CONT_RMB_W_IN_NEXT));
		
		String OTHER_CONT_RMB_W_OUT_LAST = request.getParameter("OTHER_CONT_RMB_W_OUT_LAST");
		SZCP_SQ_LXQK_OUT_LAST.setOTHER_CONT_RMB_W(Double.parseDouble(OTHER_CONT_RMB_W_OUT_LAST));
		String OTHER_CONT_RMB_W_OUT_NEXT = request.getParameter("OTHER_CONT_RMB_W_OUT_NEXT");
		SZCP_SQ_LXQK_OUT_NEXT.setOTHER_CONT_RMB_W(Double.parseDouble(OTHER_CONT_RMB_W_OUT_NEXT));
		
		String CHANGE_CONT_QTY_IN_LAST = request.getParameter("CHANGE_CONT_QTY_IN_LAST");
		SZCP_SQ_LXQK_IN_LAST.setCHANGE_CONT_QTY(Integer.parseInt(CHANGE_CONT_QTY_IN_LAST));
		String CHANGE_CONT_QTY_IN_NEXT = request.getParameter("CHANGE_CONT_QTY_IN_NEXT");
		SZCP_SQ_LXQK_IN_NEXT.setCHANGE_CONT_QTY(Integer.parseInt(CHANGE_CONT_QTY_IN_NEXT));
		
		String CHANGE_CONT_QTY_OUT_LAST = request.getParameter("CHANGE_CONT_QTY_OUT_LAST");
		SZCP_SQ_LXQK_OUT_LAST.setCHANGE_CONT_QTY(Integer.parseInt(CHANGE_CONT_QTY_OUT_LAST));
		String CHANGE_CONT_QTY_OUT_NEXT = request.getParameter("CHANGE_CONT_QTY_OUT_NEXT");
		SZCP_SQ_LXQK_OUT_NEXT.setCHANGE_CONT_QTY(Integer.parseInt(CHANGE_CONT_QTY_OUT_NEXT));
		
		String CHANGE_CONT_RMB_W_IN_LAST = request.getParameter("CHANGE_CONT_RMB_W_IN_LAST");
		SZCP_SQ_LXQK_IN_LAST.setCHANGE_CONT_RMB_W(Double.parseDouble(CHANGE_CONT_RMB_W_IN_LAST));
		String CHANGE_CONT_RMB_W_IN_NEXT = request.getParameter("CHANGE_CONT_RMB_W_IN_NEXT");
		SZCP_SQ_LXQK_IN_NEXT.setCHANGE_CONT_RMB_W(Double.parseDouble(CHANGE_CONT_RMB_W_IN_NEXT));
		
		String CHANGE_CONT_RMB_W_OUT_LAST = request.getParameter("CHANGE_CONT_RMB_W_OUT_LAST");
		SZCP_SQ_LXQK_OUT_LAST.setCHANGE_CONT_RMB_W(Double.parseDouble(CHANGE_CONT_RMB_W_OUT_LAST));
		String CHANGE_CONT_RMB_W_OUT_NEXT = request.getParameter("CHANGE_CONT_RMB_W_OUT_NEXT");
		SZCP_SQ_LXQK_OUT_NEXT.setCHANGE_CONT_RMB_W(Double.parseDouble(CHANGE_CONT_RMB_W_OUT_NEXT));
		
		String OVERDUE_CONT_QTY_IN_LAST  = request.getParameter("OVERDUE_CONT_QTY_IN_LAST");
		SZCP_SQ_LXQK_IN_LAST.setOVERDUE_CONT_QTY(Integer.parseInt(OVERDUE_CONT_QTY_IN_LAST));
		String OVERDUE_CONT_QTY_IN_NEXT  = request.getParameter("OVERDUE_CONT_QTY_IN_NEXT");
		SZCP_SQ_LXQK_IN_NEXT.setOVERDUE_CONT_QTY(Integer.parseInt(OVERDUE_CONT_QTY_IN_NEXT));
		
		String OVERDUE_CONT_QTY_OUT_LAST = request.getParameter("OVERDUE_CONT_QTY_OUT_LAST");
		SZCP_SQ_LXQK_OUT_LAST.setOVERDUE_CONT_QTY(Integer.parseInt(OVERDUE_CONT_QTY_OUT_LAST));
		String OVERDUE_CONT_QTY_OUT_NEXT = request.getParameter("OVERDUE_CONT_QTY_OUT_NEXT");
		SZCP_SQ_LXQK_OUT_NEXT.setOVERDUE_CONT_QTY(Integer.parseInt(OVERDUE_CONT_QTY_OUT_NEXT));
		
		String OVERDUE_CONT_RMB_W_IN_LAST = request.getParameter("OVERDUE_CONT_RMB_W_IN_LAST");
		SZCP_SQ_LXQK_IN_LAST.setOVERDUE_CONT_RMB_W(Double.parseDouble(OVERDUE_CONT_RMB_W_IN_LAST));
		String OVERDUE_CONT_RMB_W_IN_NEXT = request.getParameter("OVERDUE_CONT_RMB_W_IN_NEXT");
		SZCP_SQ_LXQK_IN_NEXT.setOVERDUE_CONT_RMB_W(Double.parseDouble(OVERDUE_CONT_RMB_W_IN_NEXT));
		
		String OVERDUE_CONT_RMB_W_OUT_LAST = request.getParameter("OVERDUE_CONT_RMB_W_OUT_LAST");
		SZCP_SQ_LXQK_OUT_LAST.setOVERDUE_CONT_RMB_W(Double.parseDouble(OVERDUE_CONT_RMB_W_OUT_LAST));
		String OVERDUE_CONT_RMB_W_OUT_NEXT = request.getParameter("OVERDUE_CONT_RMB_W_OUT_NEXT");
		SZCP_SQ_LXQK_OUT_NEXT.setOVERDUE_CONT_RMB_W(Double.parseDouble(OVERDUE_CONT_RMB_W_OUT_NEXT));
		
		String DFT_OUR_QTY_IN_LAST = request.getParameter("DFT_OUR_QTY_IN_LAST");
		SZCP_SQ_LXQK_IN_LAST.setDFT_OUR_QTY(Integer.parseInt(DFT_OUR_QTY_IN_LAST));
		String DFT_OUR_QTY_IN_NEXT = request.getParameter("DFT_OUR_QTY_IN_NEXT");
		SZCP_SQ_LXQK_IN_NEXT.setDFT_OUR_QTY(Integer.parseInt(DFT_OUR_QTY_IN_NEXT));
		
		String DFT_OUR_QTY_OUT_LAST = request.getParameter("DFT_OUR_QTY_OUT_LAST");
		SZCP_SQ_LXQK_OUT_LAST.setDFT_OUR_QTY(Integer.parseInt(DFT_OUR_QTY_OUT_LAST));
		String DFT_OUR_QTY_OUT_NEXT = request.getParameter("DFT_OUR_QTY_OUT_NEXT");
		SZCP_SQ_LXQK_OUT_NEXT.setDFT_OUR_QTY(Integer.parseInt(DFT_OUR_QTY_OUT_NEXT));
		
		String DFT_OUR_RMB_W_IN_LAST = request.getParameter("DFT_OUR_RMB_W_IN_LAST");
		SZCP_SQ_LXQK_IN_LAST.setDFT_OUR_RMB_W(Double.parseDouble(DFT_OUR_RMB_W_IN_LAST));
		String DFT_OUR_RMB_W_IN_NEXT = request.getParameter("DFT_OUR_RMB_W_IN_NEXT");
		SZCP_SQ_LXQK_IN_NEXT.setDFT_OUR_RMB_W(Double.parseDouble(DFT_OUR_RMB_W_IN_NEXT));
		
		String DFT_OUR_RMB_W_OUT_LAST = request.getParameter("DFT_OUR_RMB_W_OUT_LAST");
		SZCP_SQ_LXQK_OUT_LAST.setDFT_OUR_RMB_W(Double.parseDouble(DFT_OUR_RMB_W_OUT_LAST));
		String DFT_OUR_RMB_W_OUT_NEXT = request.getParameter("DFT_OUR_RMB_W_OUT_NEXT");
		SZCP_SQ_LXQK_OUT_NEXT.setDFT_OUR_RMB_W(Double.parseDouble(DFT_OUR_RMB_W_OUT_NEXT));
		
		String DFT_THEY_QTY_IN_LAST = request.getParameter("DFT_THEY_QTY_IN_LAST");
		SZCP_SQ_LXQK_IN_LAST.setDFT_THEY_QTY(Integer.parseInt(DFT_THEY_QTY_IN_LAST));
		String DFT_THEY_QTY_IN_NEXT = request.getParameter("DFT_THEY_QTY_IN_NEXT");
		SZCP_SQ_LXQK_IN_NEXT.setDFT_THEY_QTY(Integer.parseInt(DFT_THEY_QTY_IN_NEXT));
		
		String DFT_THEY_QTY_OUT_LAST = request.getParameter("DFT_THEY_QTY_OUT_LAST");
		SZCP_SQ_LXQK_OUT_LAST.setDFT_THEY_QTY(Integer.parseInt(DFT_THEY_QTY_OUT_LAST));
		String DFT_THEY_QTY_OUT_NEXT = request.getParameter("DFT_THEY_QTY_OUT_NEXT");
		SZCP_SQ_LXQK_OUT_NEXT.setDFT_THEY_QTY(Integer.parseInt(DFT_THEY_QTY_OUT_NEXT));
		
		String DFT_THEY_RMB_W_IN_LAST = request.getParameter("DFT_THEY_RMB_W_IN_LAST");
		SZCP_SQ_LXQK_IN_LAST.setDFT_THEY_RMB_W(Double.parseDouble(DFT_THEY_RMB_W_IN_LAST));
		String DFT_THEY_RMB_W_IN_NEXT = request.getParameter("DFT_THEY_RMB_W_IN_NEXT");
		SZCP_SQ_LXQK_IN_NEXT.setDFT_THEY_RMB_W(Double.parseDouble(DFT_THEY_RMB_W_IN_NEXT));
		
		String DFT_THEY_RMB_W_OUT_LAST = request.getParameter("DFT_THEY_RMB_W_OUT_LAST");
		SZCP_SQ_LXQK_OUT_LAST.setDFT_THEY_RMB_W(Double.parseDouble(DFT_THEY_RMB_W_OUT_LAST));
		String DFT_THEY_RMB_W_OUT_NEXT = request.getParameter("DFT_THEY_RMB_W_OUT_NEXT");
		SZCP_SQ_LXQK_OUT_NEXT.setDFT_THEY_RMB_W(Double.parseDouble(DFT_THEY_RMB_W_OUT_NEXT));
		
		String DFT_GOD_QTY_IN_LAST = request.getParameter("DFT_GOD_QTY_IN_LAST");
		SZCP_SQ_LXQK_IN_LAST.setDFT_GOD_QTY(Integer.parseInt(DFT_GOD_QTY_IN_LAST));
		String DFT_GOD_QTY_IN_NEXT = request.getParameter("DFT_GOD_QTY_IN_NEXT");
		SZCP_SQ_LXQK_IN_NEXT.setDFT_GOD_QTY(Integer.parseInt(DFT_GOD_QTY_IN_NEXT));
		
		String DFT_GOD_QTY_OUT_LAST = request.getParameter("DFT_GOD_QTY_OUT_LAST");
		SZCP_SQ_LXQK_OUT_LAST.setDFT_GOD_QTY(Integer.parseInt(DFT_GOD_QTY_OUT_LAST));
		String DFT_GOD_QTY_OUT_NEXT = request.getParameter("DFT_GOD_QTY_OUT_NEXT");
		SZCP_SQ_LXQK_OUT_NEXT.setDFT_GOD_QTY(Integer.parseInt(DFT_GOD_QTY_OUT_NEXT));
		
		String DFT_GOD_RMB_W_IN_LAST = request.getParameter("DFT_GOD_RMB_W_IN_LAST");
		SZCP_SQ_LXQK_IN_LAST.setDFT_GOD_RMB_W(Double.parseDouble(DFT_GOD_RMB_W_IN_LAST));
		String DFT_GOD_RMB_W_IN_NEXT = request.getParameter("DFT_GOD_RMB_W_IN_NEXT");
		SZCP_SQ_LXQK_IN_NEXT.setDFT_GOD_RMB_W(Double.parseDouble(DFT_GOD_RMB_W_IN_NEXT));
		
		String DFT_GOD_RMB_W_OUT_LAST = request.getParameter("DFT_GOD_RMB_W_OUT_LAST");
		SZCP_SQ_LXQK_OUT_LAST.setDFT_GOD_RMB_W(Double.parseDouble(DFT_GOD_RMB_W_OUT_LAST));
		String DFT_GOD_RMB_W_OUT_NEXT = request.getParameter("DFT_GOD_RMB_W_OUT_NEXT");
		SZCP_SQ_LXQK_OUT_NEXT.setDFT_GOD_RMB_W(Double.parseDouble(DFT_GOD_RMB_W_OUT_NEXT));
		
		String LAST_DISP_CONT_QTY_IN_LAST = request.getParameter("LAST_DISP_CONT_QTY_IN_LAST");
		SZCP_SQ_LXQK_IN_LAST.setLAST_DISP_CONT_QTY(Integer.parseInt(LAST_DISP_CONT_QTY_IN_LAST));
		String LAST_DISP_CONT_QTY_IN_NEXT = request.getParameter("LAST_DISP_CONT_QTY_IN_NEXT");
		SZCP_SQ_LXQK_IN_NEXT.setLAST_DISP_CONT_QTY(Integer.parseInt(LAST_DISP_CONT_QTY_IN_NEXT));
		
		String LAST_DISP_CONT_QTY_OUT_LAST = request.getParameter("LAST_DISP_CONT_QTY_OUT_LAST");
		SZCP_SQ_LXQK_OUT_LAST.setLAST_DISP_CONT_QTY(Integer.parseInt(LAST_DISP_CONT_QTY_OUT_LAST));
		String LAST_DISP_CONT_QTY_OUT_NEXT = request.getParameter("LAST_DISP_CONT_QTY_OUT_NEXT");
		SZCP_SQ_LXQK_OUT_NEXT.setLAST_DISP_CONT_QTY(Integer.parseInt(LAST_DISP_CONT_QTY_OUT_NEXT));
		
		String LAST_DISP_CONT_RMB_W_IN_LAST = request.getParameter("LAST_DISP_CONT_RMB_W_IN_LAST");
		SZCP_SQ_LXQK_IN_LAST.setLAST_DISP_CONT_RMB_W(Double.parseDouble(LAST_DISP_CONT_RMB_W_IN_LAST));
		String LAST_DISP_CONT_RMB_W_IN_NEXT = request.getParameter("LAST_DISP_CONT_RMB_W_IN_NEXT");
		SZCP_SQ_LXQK_IN_NEXT.setLAST_DISP_CONT_RMB_W(Double.parseDouble(LAST_DISP_CONT_RMB_W_IN_NEXT));
		
		String LAST_DISP_CONT_RMB_W_OUT_LAST = request.getParameter("LAST_DISP_CONT_RMB_W_OUT_LAST");
		SZCP_SQ_LXQK_OUT_LAST.setLAST_DISP_CONT_RMB_W(Double.parseDouble(LAST_DISP_CONT_RMB_W_OUT_LAST));
		String LAST_DISP_CONT_RMB_W_OUT_NEXT = request.getParameter("LAST_DISP_CONT_RMB_W_OUT_NEXT");
		SZCP_SQ_LXQK_OUT_NEXT.setLAST_DISP_CONT_RMB_W(Double.parseDouble(LAST_DISP_CONT_RMB_W_OUT_NEXT));
		
		String TOTAL_DISP_CONT_QTY_IN_LAST = request.getParameter("TOTAL_DISP_CONT_QTY_IN_LAST");
		SZCP_SQ_LXQK_IN_LAST.setTOTAL_DISP_CONT_QTY(Integer.parseInt(TOTAL_DISP_CONT_QTY_IN_LAST));
		String TOTAL_DISP_CONT_QTY_IN_NEXT = request.getParameter("TOTAL_DISP_CONT_QTY_IN_NEXT");
		SZCP_SQ_LXQK_IN_NEXT.setTOTAL_DISP_CONT_QTY(Integer.parseInt(TOTAL_DISP_CONT_QTY_IN_NEXT));
		
		String TOTAL_DISP_CONT_QTY_OUT_LAST = request.getParameter("TOTAL_DISP_CONT_QTY_OUT_LAST");
		SZCP_SQ_LXQK_OUT_LAST.setTOTAL_DISP_CONT_QTY(Integer.parseInt(TOTAL_DISP_CONT_QTY_OUT_LAST));
		String TOTAL_DISP_CONT_QTY_OUT_NEXT = request.getParameter("TOTAL_DISP_CONT_QTY_OUT_NEXT");
		SZCP_SQ_LXQK_OUT_NEXT.setTOTAL_DISP_CONT_QTY(Integer.parseInt(TOTAL_DISP_CONT_QTY_OUT_NEXT));
		
		String TOTAL_DISP_CONT_RMB_W_IN_LAST = request.getParameter("TOTAL_DISP_CONT_RMB_W_IN_LAST");
		SZCP_SQ_LXQK_IN_LAST.setTOTAL_DISP_CONT_RMB_W(Double.parseDouble(TOTAL_DISP_CONT_RMB_W_IN_LAST));
		String TOTAL_DISP_CONT_RMB_W_IN_NEXT = request.getParameter("TOTAL_DISP_CONT_RMB_W_IN_NEXT");
		SZCP_SQ_LXQK_IN_NEXT.setTOTAL_DISP_CONT_RMB_W(Double.parseDouble(TOTAL_DISP_CONT_RMB_W_IN_NEXT));
		
		String TOTAL_DISP_CONT_RMB_W_OUT_LAST = request.getParameter("TOTAL_DISP_CONT_RMB_W_OUT_LAST");
		SZCP_SQ_LXQK_OUT_LAST.setTOTAL_DISP_CONT_RMB_W(Double.parseDouble(TOTAL_DISP_CONT_RMB_W_OUT_LAST));
		String TOTAL_DISP_CONT_RMB_W_OUT_NEXT = request.getParameter("TOTAL_DISP_CONT_RMB_W_OUT_NEXT");
		SZCP_SQ_LXQK_OUT_NEXT.setTOTAL_DISP_CONT_RMB_W(Double.parseDouble(TOTAL_DISP_CONT_RMB_W_OUT_NEXT));
		
		String SOLVE_DISP_CONT_QTY_IN_LAST = request.getParameter("SOLVE_DISP_CONT_QTY_IN_LAST");
		SZCP_SQ_LXQK_IN_LAST.setSOLVE_DISP_CONT_QTY(Integer.parseInt(SOLVE_DISP_CONT_QTY_IN_LAST));
		String SOLVE_DISP_CONT_QTY_IN_NEXT = request.getParameter("SOLVE_DISP_CONT_QTY_IN_NEXT");
		SZCP_SQ_LXQK_IN_NEXT.setSOLVE_DISP_CONT_QTY(Integer.parseInt(SOLVE_DISP_CONT_QTY_IN_NEXT));
		
		String SOLVE_DISP_CONT_QTY_OUT_LAST = request.getParameter("SOLVE_DISP_CONT_QTY_OUT_LAST");
		SZCP_SQ_LXQK_OUT_LAST.setSOLVE_DISP_CONT_QTY(Integer.parseInt(SOLVE_DISP_CONT_QTY_OUT_LAST));
		String SOLVE_DISP_CONT_QTY_OUT_NEXT = request.getParameter("SOLVE_DISP_CONT_QTY_OUT_NEXT");
		SZCP_SQ_LXQK_OUT_NEXT.setSOLVE_DISP_CONT_QTY(Integer.parseInt(SOLVE_DISP_CONT_QTY_OUT_NEXT));
		
		String SOLVE_DISP_CONT_RMB_W_IN_LAST = request.getParameter("SOLVE_DISP_CONT_RMB_W_IN_LAST");
		SZCP_SQ_LXQK_IN_LAST.setSOLVE_DISP_CONT_RMB_W(Double.parseDouble(SOLVE_DISP_CONT_RMB_W_IN_LAST));
		String SOLVE_DISP_CONT_RMB_W_IN_NEXT = request.getParameter("SOLVE_DISP_CONT_RMB_W_IN_NEXT");
		SZCP_SQ_LXQK_IN_NEXT.setSOLVE_DISP_CONT_RMB_W(Double.parseDouble(SOLVE_DISP_CONT_RMB_W_IN_NEXT));
		
		String SOLVE_DISP_CONT_RMB_W_OUT_LAST = request.getParameter("SOLVE_DISP_CONT_RMB_W_OUT_LAST");
		SZCP_SQ_LXQK_OUT_LAST.setSOLVE_DISP_CONT_RMB_W(Double.parseDouble(SOLVE_DISP_CONT_RMB_W_OUT_LAST));
		String SOLVE_DISP_CONT_RMB_W_OUT_NEXT = request.getParameter("SOLVE_DISP_CONT_RMB_W_OUT_NEXT");
		SZCP_SQ_LXQK_OUT_NEXT.setSOLVE_DISP_CONT_RMB_W(Double.parseDouble(SOLVE_DISP_CONT_RMB_W_OUT_NEXT));
		
		String RECV_PRFM_QTY_RATE_LAST = request.getParameter("RECV_PRFM_QTY_RATE_LAST");
		String RECV_PRFM_QTY_RATE_NEXT = request.getParameter("RECV_PRFM_QTY_RATE_NEXT");
		
		SZCP_SQ_LXQK_RATE_LAST.setRECV_PRFM_QTY_RATE(Double.parseDouble(RECV_PRFM_QTY_RATE_LAST));
		SZCP_SQ_LXQK_RATE_NEXT.setRECV_PRFM_QTY_RATE(Double.parseDouble(RECV_PRFM_QTY_RATE_NEXT));
		
		String PAY_PRFM_QTY_RATE_OUT_LAST = request.getParameter("PAY_PRFM_QTY_RATE_OUT_LAST");
		String PAY_PRFM_QTY_RATE_OUT_NEXT = request.getParameter("PAY_PRFM_QTY_RATE_OUT_NEXT");
		
		SZCP_SQ_LXQK_RATE_LAST.setPAY_PRFM_QTY_RATE(Double.parseDouble(PAY_PRFM_QTY_RATE_OUT_LAST));
		SZCP_SQ_LXQK_RATE_NEXT.setPAY_PRFM_QTY_RATE(Double.parseDouble(PAY_PRFM_QTY_RATE_OUT_NEXT));
		
		String RECV_AMT_RATE_LAST = request.getParameter("RECV_AMT_RATE_IN_LAST");
		String RECV_AMT_RATE_NEXT = request.getParameter("RECV_AMT_RATE_IN_NEXT");
		
		SZCP_SQ_LXQK_RATE_LAST.setRECV_AMT_RATE(Double.parseDouble(RECV_AMT_RATE_LAST));
		SZCP_SQ_LXQK_RATE_NEXT.setRECV_AMT_RATE(Double.parseDouble(RECV_AMT_RATE_NEXT));
		
		String PAY_AMT_RATE_LAST = request.getParameter("PAY_AMT_RATE_IN_LAST");
		String PAY_AMT_RATE_NEXT = request.getParameter("PAY_AMT_RATE_IN_NEXT");
		
		SZCP_SQ_LXQK_RATE_LAST.setPAY_AMT_RATE(Double.parseDouble(PAY_AMT_RATE_LAST));
		SZCP_SQ_LXQK_RATE_NEXT.setPAY_AMT_RATE(Double.parseDouble(PAY_AMT_RATE_NEXT));
		
		String REVOKE_RATE_LAST = request.getParameter("REVOKE_RATE_IN_LAST");
		String REVOKE_RATE_NEXT = request.getParameter("REVOKE_RATE_IN_NEXT");
		SZCP_SQ_LXQK_RATE_LAST.setREVOKE_RATE(Double.parseDouble(REVOKE_RATE_LAST));
		SZCP_SQ_LXQK_RATE_NEXT.setREVOKE_RATE(Double.parseDouble(REVOKE_RATE_NEXT));
		
		String COMP_RQTE_LAST = request.getParameter("COMP_RQTE_IN_LAST");
		String COMP_RQTE_NEXT = request.getParameter("COMP_RQTE_IN_NEXT");
		SZCP_SQ_LXQK_RATE_LAST.setCOMP_RQTE(Double.parseDouble(COMP_RQTE_LAST));
		SZCP_SQ_LXQK_RATE_NEXT.setCOMP_RQTE(Double.parseDouble(COMP_RQTE_NEXT));
		
		String OTHER_RATE_LAST = request.getParameter("OTHER_RATE_IN_LAST");
		String OTHER_RATE_NEXT = request.getParameter("OTHER_RATE_IN_NEXT");
		SZCP_SQ_LXQK_RATE_LAST.setOTHER_RATE(Double.parseDouble(OTHER_RATE_LAST));
		SZCP_SQ_LXQK_RATE_NEXT.setOTHER_RATE(Double.parseDouble(OTHER_RATE_NEXT));
		
		String CHANGE_RATE_LAST = request.getParameter("CHANGE_RATE_IN_LAST");
		String CHANGE_RATE_NEXT = request.getParameter("CHANGE_RATE_IN_NEXT");
		SZCP_SQ_LXQK_RATE_LAST.setCHANGE_RATE(Double.parseDouble(CHANGE_RATE_LAST));
		SZCP_SQ_LXQK_RATE_NEXT.setCHANGE_RATE(Double.parseDouble(CHANGE_RATE_NEXT));
		
		String OVERDUE_RATE_LAST = request.getParameter("OVERDUE_RATE_IN_LAST");
		String OVERDUE_RATE_NEXT = request.getParameter("OVERDUE_RATE_IN_NEXT");
		SZCP_SQ_LXQK_RATE_LAST.setOVERDUE_RATE(Double.parseDouble(OVERDUE_RATE_LAST));
		SZCP_SQ_LXQK_RATE_NEXT.setOVERDUE_RATE(Double.parseDouble(OVERDUE_RATE_NEXT));
		
		String DFT_OUR_RATE_LAST = request.getParameter("DFT_OUR_RATE_IN_LAST");
		String DFT_OUR_RATE_NEXT = request.getParameter("DFT_OUR_RATE_IN_NEXT");
		SZCP_SQ_LXQK_RATE_LAST.setDFT_OUR_RATE(Double.parseDouble(DFT_OUR_RATE_LAST));
		SZCP_SQ_LXQK_RATE_NEXT.setDFT_OUR_RATE(Double.parseDouble(DFT_OUR_RATE_NEXT));
		
		String DFT_THEY_RATE_LAST = request.getParameter("DFT_THEY_RATE_IN_LAST");
		String DFT_THEY_RATE_NEXT = request.getParameter("DFT_THEY_RATE_IN_NEXT");
		SZCP_SQ_LXQK_RATE_LAST.setDFT_THEY_RATE(Double.parseDouble(DFT_THEY_RATE_LAST));
		SZCP_SQ_LXQK_RATE_NEXT.setDFT_THEY_RATE(Double.parseDouble(DFT_THEY_RATE_NEXT));
		
		String GOD_RATE_LAST = request.getParameter("GOD_RATE_IN_LAST");
		String GOD_RATE_NEXT = request.getParameter("GOD_RATE_IN_NEXT");
		SZCP_SQ_LXQK_RATE_LAST.setGOD_RATE(Double.parseDouble(GOD_RATE_LAST));
		SZCP_SQ_LXQK_RATE_NEXT.setGOD_RATE(Double.parseDouble(GOD_RATE_NEXT));
		
		String DISP_RATE_LAST = request.getParameter("DISP_RATE_IN_LAST");
		String DISP_RATE_NEXT = request.getParameter("DISP_RATE_IN_NEXT");
		SZCP_SQ_LXQK_RATE_LAST.setDISP_RATE(Double.parseDouble(DISP_RATE_LAST));
		SZCP_SQ_LXQK_RATE_NEXT.setDISP_RATE(Double.parseDouble(DISP_RATE_NEXT));
		
		String SOLVE_RATE_LAST = request.getParameter("SOLVE_RATE_IN_LAST");
		String SOLVE_RATE_NEXT = request.getParameter("SOLVE_RATE_IN_NEXT");
		SZCP_SQ_LXQK_RATE_LAST.setSOLVE_RATE(Double.parseDouble(SOLVE_RATE_LAST));
		SZCP_SQ_LXQK_RATE_NEXT.setSOLVE_RATE(Double.parseDouble(SOLVE_RATE_NEXT));
		
		SZCP_SQ_LXQK_IN_LAST.setREG_NO(REGNO);
		SZCP_SQ_LXQK_OUT_LAST.setREG_NO(REGNO);
		SZCP_SQ_LXQK_RATE_LAST.setREG_NO(REGNO);
		
		SZCP_SQ_LXQK_IN_LAST.setEVAL_YEAR(YEAR);
		SZCP_SQ_LXQK_OUT_LAST.setEVAL_YEAR(YEAR);
		SZCP_SQ_LXQK_RATE_LAST.setEVAL_YEAR(YEAR);
		
		SZCP_SQ_LXQK_IN_LAST.setREPORT_YEAR(REPORT_YEAR1);
		SZCP_SQ_LXQK_OUT_LAST.setREPORT_YEAR(REPORT_YEAR1);
		SZCP_SQ_LXQK_RATE_LAST.setREPORT_YEAR(REPORT_YEAR1);
		
		
		SZCP_SQ_LXQK_IN_NEXT.setREG_NO(REGNO);
		SZCP_SQ_LXQK_OUT_NEXT.setREG_NO(REGNO);
		SZCP_SQ_LXQK_RATE_NEXT.setREG_NO(REGNO);
		
		SZCP_SQ_LXQK_IN_NEXT.setEVAL_YEAR(YEAR);
		SZCP_SQ_LXQK_OUT_NEXT.setEVAL_YEAR(YEAR);
		SZCP_SQ_LXQK_RATE_NEXT.setEVAL_YEAR(YEAR);
		
		SZCP_SQ_LXQK_IN_NEXT.setREPORT_YEAR(REPORT_YEAR2);
		SZCP_SQ_LXQK_OUT_NEXT.setREPORT_YEAR(REPORT_YEAR2);
		SZCP_SQ_LXQK_RATE_NEXT.setREPORT_YEAR(REPORT_YEAR2);
		
		boolean executeFlag1 = false;
		boolean executeFlag2 = false;
		// query data history
		boolean dataFlag = lxqkDao_LAST.queryHistoryData(SZCP_SQ_LXQK_IN_LAST,SZCP_SQ_LXQK_OUT_LAST,SZCP_SQ_LXQK_RATE_LAST);
		if(dataFlag) {
			executeFlag1 = lxqkDao_LAST.executeUpdate(SZCP_SQ_LXQK_IN_LAST,SZCP_SQ_LXQK_OUT_LAST,SZCP_SQ_LXQK_RATE_LAST);
			executeFlag2 = lxqkDao_NEXT.executeUpdate(SZCP_SQ_LXQK_IN_NEXT,SZCP_SQ_LXQK_OUT_NEXT,SZCP_SQ_LXQK_RATE_NEXT);
		}else {
			executeFlag1 = lxqkDao_LAST.executeInsert(SZCP_SQ_LXQK_IN_LAST,SZCP_SQ_LXQK_OUT_LAST,SZCP_SQ_LXQK_RATE_LAST);
			executeFlag2 = lxqkDao_LAST.executeInsert(SZCP_SQ_LXQK_IN_NEXT,SZCP_SQ_LXQK_OUT_NEXT,SZCP_SQ_LXQK_RATE_NEXT);
		}
		if(executeFlag1 && executeFlag2) {
			out.print(CreateHeaderUtil.setAlertGo("","szcp_sq_jyxy.jsp?REG_NO="+SZCP_SQ_LXQK_IN_LAST.getREG_NO()+"&EVAL_YEAR="+SZCP_SQ_LXQK_IN_LAST.getEVAL_YEAR()+"&CerNO="+CerNO));
		}else {
			out.print(SysUtility.setAlertScript("系统出错，请稍后再试",""));
		}
%>