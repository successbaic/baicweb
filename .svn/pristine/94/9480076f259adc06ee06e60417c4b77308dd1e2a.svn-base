<%@page import="com.macrosoft.icms.system.SysUtility"%>
<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<jsp:useBean id="zrxy" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_ZRXY" >
</jsp:useBean>
<jsp:useBean id="gyjz_last" scope="page" 
	class="com.macrosoft.icms.szcp.SZCP_SQ_GYJZ"/>
<jsp:useBean id="gyjzdao" scope="page" 
	class="com.macrosoft.icms.szcp.dao.SZCP_SQ_GYJZDao"/>
<jsp:useBean id="gyjz_next" scope="page" 
	class="com.macrosoft.icms.szcp.SZCP_SQ_GYJZ"/>
<jsp:useBean id="CreateHeaderUtil" scope="page" 
	class="com.macrosoft.icms.szcp.CreateHeaderUtil"/>
	<%
	String CerNO = request.getParameter("CerNO");
	String REGNO = request.getParameter("REG_NO");
	zrxy.setREG_NO(REGNO);
	String YEAR = request.getParameter("EVAL_YEAR");
	zrxy.setEVAL_YEAR(YEAR);
	String REPORT_YEAR1 = request.getParameter("REPORT_YEAR1");
	String REPORT_YEAR2 = request.getParameter("REPORT_YEAR2");
	String LP_ARR_WAGE_FLAG = request.getParameter("LP_ARR_WAGE_FLAG");
	zrxy.setLP_ARR_WAGE_FLAG(LP_ARR_WAGE_FLAG);
	String LP_ALL_CONT_FLAG = request.getParameter("LP_ALL_CONT_FLAG");
	zrxy.setLP_ALL_CONT_FLAG(LP_ALL_CONT_FLAG);
	String LP_SOC_INSRC_FLAG = request.getParameter("LP_SOC_INSRC_FLAG");
	zrxy.setLP_SOC_INSRC_FLAG(LP_SOC_INSRC_FLAG);
	String TAX_VOLITE_FLAG = request.getParameter("TAX_VOLITE_FLAG");
	zrxy.setTAX_VOLITE_FLAG(TAX_VOLITE_FLAG);
	String ECO_OPR_DMG_FLAG = request.getParameter("ECO_OPR_DMG_FLAG");
	zrxy.setECO_OPR_DMG_FLAG(ECO_OPR_DMG_FLAG);
	String ECO_PRO_DMG_FLAG =request.getParameter("ECO_PRO_DMG_FLAG");
	zrxy.setECO_PRO_DMG_FLAG(ECO_PRO_DMG_FLAG);
	String SP_MAJOR_ACC_FLAG = request.getParameter("SP_MAJOR_ACC_FLAG");
	zrxy.setSP_MAJOR_ACC_FLAG(SP_MAJOR_ACC_FLAG);
	String SP_ORG_INVEST_FLAG = request.getParameter("SP_ORG_INVEST_FLAG");
	zrxy.setSP_ORG_INVEST_FLAG(SP_ORG_INVEST_FLAG);
	String QS_INVEST_FLAG = request.getParameter("QS_INVEST_FLAG");
	zrxy.setQS_INVEST_FLAG(QS_INVEST_FLAG);
	String BANK_INVEST_FLAG = request.getParameter("BANK_INVEST_FLAG");
	zrxy.setBANK_INVEST_FLAG(BANK_INVEST_FLAG);
	String CSTM_INVEST_FLAG = request.getParameter("CSTM_INVEST_FLAG");
	zrxy.setCSTM_INVEST_FLAG(CSTM_INVEST_FLAG);
	String OTHER_INVEST_FLAG = request.getParameter("OTHER_INVEST_FLAG");
	zrxy.setOTHER_INVEST_FLAG(OTHER_INVEST_FLAG);
	gyjz_last.setREG_NO(REGNO);
	gyjz_last.setEVAL_YEAR(YEAR);
	gyjz_last.setREPORT_YEAR(REPORT_YEAR1);
	String LAST_COURT_INVEST_QTY_LAST = request.getParameter("LAST_COURT_INVEST_QTY_LAST");
	gyjz_last.setLAST_COURT_INVEST_QTY(Integer.parseInt(LAST_COURT_INVEST_QTY_LAST));
	
	String LAST_ARBIT_INVEST_LAST = request.getParameter("LAST_ARBIT_INVEST_LAST");
	gyjz_last.setLAST_ARBIT_INVEST(Integer.parseInt(LAST_ARBIT_INVEST_LAST));
	
	String LAST_DONT_RMB_W_LAST =  request.getParameter("LAST_DONT_RMB_W_LAST");
	gyjz_last.setLAST_DONT_RMB_W(Float.parseFloat(LAST_DONT_RMB_W_LAST));
	
	boolean flag1 = gyjzdao.executeNextStep(gyjz_last);
	
	gyjz_next.setREG_NO(REGNO);
	gyjz_next.setEVAL_YEAR(YEAR);
	gyjz_next.setREPORT_YEAR(REPORT_YEAR2);
	String LAST_COURT_INVEST_QTY_NEXT = request.getParameter("LAST_COURT_INVEST_QTY_NEXT");
	gyjz_next.setLAST_COURT_INVEST_QTY(Integer.parseInt(LAST_COURT_INVEST_QTY_NEXT));
	
	String LAST_ARBIT_INVEST_NEXT = request.getParameter("LAST_ARBIT_INVEST_NEXT");
	gyjz_next.setLAST_ARBIT_INVEST(Integer.parseInt(LAST_ARBIT_INVEST_NEXT));
	
	String LAST_DONT_RMB_W_NEXT =  request.getParameter("LAST_DONT_RMB_W_NEXT");
	gyjz_next.setLAST_DONT_RMB_W(Float.parseFloat(LAST_DONT_RMB_W_NEXT));
	
	boolean flag2 = gyjzdao.executeNextStep(gyjz_next);
	boolean flag = zrxy.executeNextStep(zrxy);
	if(flag && flag1 && flag2) {
		out.print(CreateHeaderUtil.setAlertGo("","szcp_sq_shry.jsp?REG_NO="+zrxy.getREG_NO()+"&EVAL_YEAR="+zrxy.getEVAL_YEAR()+"&CerNO="+CerNO));
	}else {
		out.print(SysUtility.setAlertScript("系统出错，请稍后再试",""));
	}
%>    
