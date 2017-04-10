<%@page import="com.macrosoft.icms.szcp.dao.SZCP_SQ_HT_XYGLDao"%>
<%@page import="com.macrosoft.icms.szcp.SZCP_SQ_HT_XYGL"%>
<%@page import="com.macrosoft.icms.system.SysUtility"%>
<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<%@page import="com.macrosoft.icms.szcp.dao.SZCP_SQ_HT_XWGFDao" %>    
<jsp:useBean id="xwgf" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_HT_XWGF" >
</jsp:useBean> 
<jsp:useBean id="xygl" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_HT_XYGL" >
</jsp:useBean> 
<jsp:useBean id="sl1" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_HT_XWGF_SL" >
</jsp:useBean> 
<jsp:useBean id="sl2" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_HT_XWGF_SL" >
</jsp:useBean> 
<jsp:useBean id="CreateHeaderUtil" scope="page"
	class="com.macrosoft.icms.szcp.CreateHeaderUtil" />

<%
	String REGNO = request.getParameter("REG_NO");
	String YEAR = request.getParameter("EVAL_YEAR");
	String CerNO = request.getParameter("CerNO");	
	xygl.setOTHER_ORG_DESC(request.getParameter("OTHER_ORG_DESC"));
	String MNG_ORG_TYPE = request.getParameter("MNG_ORG_TYPE");
	xygl.setMNG_ORG_TYPE(MNG_ORG_TYPE);
	String SING_APPR_TYPE = request.getParameter("SING_APPR_TYPE");
	xwgf.setSIGN_APPR_TYPE(SING_APPR_TYPE);
	String saCheck1 = request.getParameter("SACheckBox1");
	if(saCheck1 == null || "".equals(saCheck1)) {
		xwgf.setSA_QUAL_FLAG("0");
	}else {
		xwgf.setSA_QUAL_FLAG("1");
	}

	String saCheck2 = request.getParameter("SACheckBox2");
	if(saCheck2 == null || "".equals(saCheck2)) {
		xwgf.setSA_VALID_FLAG("0");
	}else {
		xwgf.setSA_VALID_FLAG("1");
	}
	
	String saCheck3 = request.getParameter("SACheckBox3");
	if(saCheck3 == null || "".equals(saCheck3)) {
		xwgf.setSA_CREDIT_FLAG("0");
	}else {
		xwgf.setSA_CREDIT_FLAG("1");
	}
	
	String saCheck4 = request.getParameter("SACheckBox4");
	if(saCheck4 == null || "".equals(saCheck4)) {
		xwgf.setSA_PERFORM_FLAG("0");
	}else {
		xwgf.setSA_PERFORM_FLAG("1");
	}


	xwgf.setREG_NO(request.getParameter("REGNOHIDDEN"));
	xwgf.setEVAL_YEAR(request.getParameter("EVALYEAREHIDDEN"));
	xygl.setREG_NO(request.getParameter("REGNOHIDDEN"));
	xygl.setEVAL_YEAR(request.getParameter("EVALYEAREHIDDEN"));
	sl1.setREG_NO(request.getParameter("REGNOHIDDEN"));
	sl2.setREG_NO(request.getParameter("REGNOHIDDEN"));
	sl1.setEVAL_YEAR(request.getParameter("EVALYEAREHIDDEN"));
	sl2.setEVAL_YEAR(request.getParameter("EVALYEAREHIDDEN"));
	sl1.setREPORT_YEAR(request.getParameter("REPORT_YEAR1"));
	sl2.setREPORT_YEAR(request.getParameter("REPORT_YEAR2"));
	String ORG_LEAD_NAME = request.getParameter("ORG_LEAD_NAME");
	xygl.setORG_LEAD_NAME(SysUtility.convertCode(ORG_LEAD_NAME));
	String ORG_LEAD_POS = request.getParameter("ORG_LEAD_POS");
	xygl.setORG_LEAD_POS_TYPE(ORG_LEAD_POS);
	String ORG_LEAD_TEL_NO = request.getParameter("ORG_LEAD_TEL_NO");
	xygl.setORG_LEAD_TEL_NO(ORG_LEAD_TEL_NO);
	String ORG_LEAD_QUAL_TYPE = request.getParameter("ORG_LEAD_QUAL_TYPE");
	xygl.setORG_LEAD_QUAL_TYPE(ORG_LEAD_QUAL_TYPE);
	String QUAL_LEVEL_TYPE = request.getParameter("QUAL_LEVEL_TYPE");
	xygl.setQUAL_LEVEL_TYPE(QUAL_LEVEL_TYPE);
	
	
	String msCheck1 = request.getParameter("MSCheckBox1");
	if(msCheck1 == null || "".equals(msCheck1)) {
		xygl.setMS_POS_RESP_FLAG("0");
	}else {
		xygl.setMS_POS_RESP_FLAG("1");
	}
	
	String msCheck2 = request.getParameter("MSCheckBox2");
	if(msCheck2 == null || "".equals(msCheck2)) {
		xygl.setMS_DELEGATE_FLAG("0");
	}else {
		xygl.setMS_DELEGATE_FLAG("1");
	}
	
	String msCheck3 = request.getParameter("MSCheckBox3");
	if(msCheck3 == null || "".equals(msCheck3)) {
		xygl.setMS_SIGN_REVIEW_FLAG("0");
	}else {
		xygl.setMS_SIGN_REVIEW_FLAG("1");
	}
	
	String msCheck4 = request.getParameter("MSCheckBox4");
	if(msCheck4 == null || "".equals(msCheck4)) {
		xygl.setMS_SEAL_FILE_FLAG("0");
	}else {
		xygl.setMS_SEAL_FILE_FLAG("1");
	}
	
	String msCheck5 = request.getParameter("MSCheckBox5");
	if(msCheck5 == null || "".equals(msCheck5)) {
		xygl.setMS_RISK_EMG_FLAG("0");
	}else {
		xygl.setMS_RISK_EMG_FLAG("1");
	}
	
	String msCheck6 = request.getParameter("MSCheckBox6");
	if(msCheck6 == null || "".equals(msCheck6)) {
		xygl.setMS_SIGN_CANCEL_FLAG("0");
	}else {
		xygl.setMS_SIGN_CANCEL_FLAG("1");
	}
	
	String msCheck7 = request.getParameter("MSCheckBox7");
	if(msCheck7 == null || "".equals(msCheck7)) {
		xygl.setMS_RECV_ACCT_FLAG("0");
	}else {
		xygl.setMS_RECV_ACCT_FLAG("1");
	}
	
	String msCheck8 = request.getParameter("MSCheckBox8");
	if(msCheck8 == null || "".equals(msCheck8)) {
		xygl.setMS_PAY_ACCT_FLAG("0");
	}else {
		xygl.setMS_PAY_ACCT_FLAG("1");
	}
	
	String msCheck9 = request.getParameter("MSCheckBox9");
	if(msCheck9 == null || "".equals(msCheck9)) {
		xygl.setMS_GUEST_FLAG("0");
	}else {
		xygl.setMS_GUEST_FLAG("1");
	}
	
	xygl.setFULLTIME_MNG_QTY(Integer.parseInt(request.getParameter("FULLTIME_MNG_QTY")));
	xygl.setPARTTIME_MNG_QTY(Integer.parseInt(request.getParameter("PARTTIME_MNG_QTY")));
	
	String FC_ARCH_FLAG = request.getParameter("FC_ARCH_FLAG");
	xwgf.setFC_ARCH_FLAG(FC_ARCH_FLAG);
	String FC_VIOL_FLAG = request.getParameter("FC_VIOL_FLAG");
	xwgf.setFC_VIOL_FLAG(FC_VIOL_FLAG);
	xwgf.setMODEL_TEXT_TYPE(request.getParameter("MODEL_TEXT_TYPE"));
	sl1.setINC_SIGN_RATE(Float.parseFloat(request.getParameter("INC_SIGN_RATE")));
	sl2.setINC_SIGN_RATE(Float.parseFloat(request.getParameter("INC_SIGN_RATE_TIME")));
	sl1.setEXP_SIGN_RATE(Float.parseFloat(request.getParameter("EXP_SIGN_RATE")));
	sl2.setEXP_SIGN_RATE(Float.parseFloat(request.getParameter("EXP_SIGN_RATE_TIME")));
	sl1.setMODEL_TEXT_US_RATE(Float.parseFloat(request.getParameter("MODEL_TEXT_US_RATE")));
	sl2.setMODEL_TEXT_US_RATE(Float.parseFloat(request.getParameter("MODEL_TEXT_US_RATE_TIME")));
	xwgf.setDELEG_TYPE(request.getParameter("DELEGTYPE"));
	
	xwgf.setMNG_ORG_FLAG(request.getParameter("MNG_ORG_FLAG"));
	xwgf.setACCT_FORM_TYPE(request.getParameter("ACCT_FORM_TYPE"));
	xwgf.setSIGN_APPR_TYPE(request.getParameter("sign_appr_type"));
	
	String acctCheck1 = request.getParameter("ACCTCheckBox1");
	if(acctCheck1 == null || "".equals(acctCheck1)) {
		xwgf.setACCT_SERIAL_FLAG("0");
	}else {
		xwgf.setACCT_SERIAL_FLAG("1");
	}
	
	String acctCheck2 = request.getParameter("ACCTCheckBox2");
	if(acctCheck2 == null || "".equals(acctCheck2)) {
		xwgf.setACCT_GUEST_FLAG("0");
	}else {
		xwgf.setACCT_GUEST_FLAG("1");
	}
	
	String acctCheck3 = request.getParameter("ACCTCheckBox3");
	if(acctCheck3 == null || "".equals(acctCheck3)) {
		xwgf.setACCT_WHEN_FLAG("0");
	}else {
		xwgf.setACCT_WHEN_FLAG("1");
	}
	
	String acctCheck4 = request.getParameter("ACCTCheckBox4");
	if(acctCheck4 == null || "".equals(acctCheck4)) {
		xwgf.setACCT_UNDLY_FLAG("0");
	}else {
		xwgf.setACCT_UNDLY_FLAG("1");
	}
	
	String acctCheck5 = request.getParameter("ACCTCheckBox5");
	if(acctCheck5 == null || "".equals(acctCheck5)) {
		xwgf.setACCT_QTY_FLAG("0");
	}else {
		xwgf.setACCT_QTY_FLAG("1");
	}
	
	String acctCheck6 = request.getParameter("ACCTCheckBox6");
	if(acctCheck6 == null || "".equals(acctCheck6)) {
		xwgf.setACCT_CAP_FLAG("0");
	}else {
		xwgf.setACCT_CAP_FLAG("1");
	}
	
	String acctCheck7 = request.getParameter("ACCTCheckBox7");
	if(acctCheck7 == null || "".equals(acctCheck7)) {
		xwgf.setACCT_PLAN_TIME_FLAG("0");
	}else {
		xwgf.setACCT_PLAN_TIME_FLAG("1");
	}
	
	String acctCheck8 = request.getParameter("ACCTCheckBox8");
	if(acctCheck8 == null || "".equals(acctCheck8)) {
		xwgf.setACCT_REAL_TIME_FLAG("0");
	}else {
		xwgf.setACCT_REAL_TIME_FLAG("1");
	}
	
	String acctCheck9 = request.getParameter("ACCTCheckBox9");
	if(acctCheck9 == null || "".equals(acctCheck9)) {
		xwgf.setACCT_PLAN_CAP_FLAG("0");
	}else {
		xwgf.setACCT_PLAN_CAP_FLAG("1");
	}
	
	String acctCheck10 = request.getParameter("ACCTCheckBox10");
	if(acctCheck10 == null || "".equals(acctCheck10)) {
		xwgf.setACCT_REAL_CAP_FLAG("0");
	}else {
		xwgf.setACCT_REAL_CAP_FLAG("1");
	}
	
	String acctCheck11 = request.getParameter("ACCTCheckBox11");
	if(acctCheck11 == null || "".equals(acctCheck11)) {
		xwgf.setACCT_PERFOM_CERT_FLAG("0");
	}else {
		xwgf.setACCT_PERFOM_CERT_FLAG("1");
	}
	
	String acctCheck12 = request.getParameter("ACCTCheckBox12");
	if(acctCheck12 == null || "".equals(acctCheck12)) {
		xwgf.setACCT_CHANGE_FLAG("0");
	}else {
		xwgf.setACCT_CHANGE_FLAG("1");
	}
	
	xwgf.setGUEST_INFO_TYPE(request.getParameter("GUEST_INFO_TYPE"));
	String gcCheck1 = request.getParameter("GCTCheckBox1");
	if(gcCheck1 == null || "".equals(gcCheck1)) {
		xwgf.setGC_RECORD_FLAG("0");
	}else {
		xwgf.setGC_RECORD_FLAG("1");
	}
	
	String gcCheck2 = request.getParameter("GCTCheckBox2");
	if(gcCheck2 == null || "".equals(gcCheck2)) {
		xwgf.setGC_THIRD_PART_FLAG("0");
	}else {
		xwgf.setGC_THIRD_PART_FLAG("1");
	}
	
	String gcCheck3 = request.getParameter("GCTCheckBox3");
	if(gcCheck3 == null || "".equals(gcCheck3)) {
		xwgf.setGC_RESERCH_FLAG("0");
	}else {
		xwgf.setGC_RESERCH_FLAG("1");
	}
	
	String amCheck1 = request.getParameter("AMCheckBox1");
	if(amCheck1 == null || "".equals(amCheck1)) {
		xwgf.setAM_RECV_AGE_FLAG("0");
	}else {
		xwgf.setAM_RECV_AGE_FLAG("1");
	}
	
	String amCheck2 = request.getParameter("AMCheckBox2");
	if(amCheck2 == null || "".equals(amCheck2)) {
		xwgf.setAM_OVERDUE_FLAG("0");
	}else {
		xwgf.setAM_OVERDUE_FLAG("1");
	}
	
	String amCheck3 = request.getParameter("AMCheckBox3");
	if(amCheck3 == null || "".equals(amCheck3)) {
		xwgf.setAM_SPEC_RECOVER_FLAG("0");
	}else {
		xwgf.setAM_SPEC_RECOVER_FLAG("1");
	}
	
	String amCheck4 = request.getParameter("AMCheckBox4");
	if(amCheck4 == null || "".equals(amCheck4)) {
		xwgf.setAM_RECV_SUM_FLAG("0");
	}else {
		xwgf.setAM_RECV_SUM_FLAG("1");
	}
	
	sl1.setLAST_DFT_OUR_QTY(Integer.parseInt(request.getParameter("LAST_DFT_OUR_QTY")));
	sl2.setLAST_DFT_OUR_QTY(Integer.parseInt(request.getParameter("LAST_DFT_OUR_QTY_TIME")));
	sl1.setLAST_DFT_THEY__QTY(Integer.parseInt(request.getParameter("LAST_DFT_THEY_QTY")));
	sl2.setLAST_DFT_THEY__QTY(Integer.parseInt(request.getParameter("LAST_DFT_THEY_QTY_TIME")));
	sl1.setDISP_COMP_QTY(Integer.parseInt(request.getParameter("DISP_COMP_QTY")));
	sl2.setDISP_COMP_QTY(Integer.parseInt(request.getParameter("DISP_COMP_QTY_TIME")));
	sl1.setDISP_MED_QTY(Integer.parseInt(request.getParameter("DISP_MED_QTY")));
	sl2.setDISP_MED_QTY(Integer.parseInt(request.getParameter("DISP_MED_QTY_TIME")));
	sl1.setDISP_ARB_QTY(Integer.parseInt(request.getParameter("DISP_ARB_QTY")));
	sl2.setDISP_ARB_QTY(Integer.parseInt(request.getParameter("DISP_ARB_QTY_TIME")));
	sl1.setDISP_LAW_QTY(Integer.parseInt(request.getParameter("DISP_LAW_QTY")));
	sl2.setDISP_LAW_QTY(Integer.parseInt(request.getParameter("DISP_LAW_QTY_TIME")));
	// 档案合同是否分类归档
	xwgf.setMNG_SORT_FLAG("1");
	//是否有三年以上违约纠纷
	xwgf.setDFT_OVER_THREE_FLAG("0");
 	
	SZCP_SQ_HT_XYGLDao szcp_SQ_HT_XYGLDao = new SZCP_SQ_HT_XYGLDao();
	SZCP_SQ_HT_XWGFDao szcp_SQ_HT_XWGFDao = new SZCP_SQ_HT_XWGFDao();
	/*
	boolean flag1 = szcp_SQ_HT_XWGFDao.emptySZCP_SQ_HT_XWGF(xwgf.getREG_NO(),xwgf.getEVAL_YEAR());
	boolean flag2 = szcp_SQ_HT_XYGLDao.isEmptySZCP_SQ_HT_XYGL(xygl.getREG_NO(),xygl.getEVAL_YEAR());
	boolean flag3 = sl1.queryHistoryDataForOne(sl1);
	boolean flag4 = sl1.queryHistoryDataForOne(sl2);
	if(flag1 && flag2 && flag3 && flag4) {
		boolean flag5 = szcp_SQ_HT_XWGFDao.addData(xwgf,xygl);
		boolean flag6 = sl1.saveData(sl1);
		boolean flag7 = sl1.saveData(sl2);
		if(flag5&&flag6&&flag7) {
			out.print(CreateHeaderUtil.setAlertGo("保存成功!","szcp_sq_lxqk.jsp?REG_NO="+xwgf.getREG_NO()+"&EVAL_YEAR="+xwgf.getEVAL_YEAR()+"&CerNO="+CerNO));
		}else {
			
		}
	}else {
		boolean flag5 = szcp_SQ_HT_XWGFDao.editData(xwgf,xygl);
		boolean flag6 = sl1.editData(sl1);
		boolean flag7 = sl1.editData(sl2);
		if(flag5 && flag6 && flag7) {
			out.print(CreateHeaderUtil.setAlertGo("保存成功!","szcp_sq_lxqk.jsp?REG_NO="+xwgf.getREG_NO()+"&EVAL_YEAR="+xwgf.getEVAL_YEAR()+"&CerNO="+CerNO));
		}else {
			
		}
	} */
	boolean flag5 = szcp_SQ_HT_XWGFDao.saveOrupdateXWGF(xwgf);
	boolean flag6 = szcp_SQ_HT_XWGFDao.saveOrupdateXYGL(xygl);
	boolean flag7 = sl1.saveOrupdateXYGF_SL(sl1);
	boolean flag8 = sl1.saveOrupdateXYGF_SL(sl2);
	if(flag5&&flag6&flag7&&flag8) {
		out.print(CreateHeaderUtil.setAlertGo("保存成功!","szcp_sq_lxqk.jsp?REG_NO="+xwgf.getREG_NO()+"&EVAL_YEAR="+xwgf.getEVAL_YEAR()+"&CerNO="+CerNO));
	}
%>