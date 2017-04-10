<%@page import="com.macrosoft.icms.system.SysUtility"%>
<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<jsp:useBean id="SZCP_SQ_JBXX" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_JBXX"></jsp:useBean>
<jsp:useBean id="CreateHeaderUtil" scope="page"
	class="com.macrosoft.icms.szcp.CreateHeaderUtil"></jsp:useBean>	
<jsp:useBean id="SZCP_LCZT" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_LCZT"></jsp:useBean>	
	
	
	
<%
	String legRepNo= request.getParameter("LEGREPCERTNOHIDDEN");
	SZCP_SQ_JBXX.setLEG_REP_CERT_NO(legRepNo);
	String legrepcertType = request.getParameter("LEGREPCERTTYPEHIDDEN");
	SZCP_SQ_JBXX.setLEG_REP_CERT_TYPE(legrepcertType);
	String domDistricCode = request.getParameter("DOMDISTRICTCODEHIDDEN");
	SZCP_SQ_JBXX.setDOM_DISTRICT_CODE(domDistricCode);
	String localOrg = request.getParameter("LOCALORGNOHIDDEN");
	SZCP_SQ_JBXX.setLOCAL_ORG_NO(localOrg);
	String eavlYear = request.getParameter("EVALYEARHIDDEN");
	SZCP_SQ_JBXX.setEVAL_YEAR(eavlYear);
	String entName = request.getParameter("ENT_NAME");
	SZCP_SQ_JBXX.setENT_NAME(SysUtility.convertCode(entName));
	String entType = request.getParameter("ENT_TYPE");
	SZCP_SQ_JBXX.setENT_TYPE(SysUtility.convertCode(entType));
	String localOrgNo = request.getParameter("LOCALORGNOHIDDEN");
	SZCP_SQ_JBXX.setLOCAL_ORG_NO(SysUtility.convertCode(localOrgNo));
	String address = request.getParameter("ADDR_DESC");
	SZCP_SQ_JBXX.setADDR_DESC(SysUtility.convertCode(address));
	String regCapRmbW = request.getParameter("REG_CAP_RMB_W");
	SZCP_SQ_JBXX.setREG_CAP_RMB_W(Float.parseFloat(SysUtility.convertCode(regCapRmbW)));
	String regNo = request.getParameter("REG_NO");
	SZCP_SQ_JBXX.setREG_NO(SysUtility.convertCode(regNo));
	String estDate = request.getParameter("EST_DATE");
	SZCP_SQ_JBXX.setEST_DATE(SysUtility.convertCode(estDate));
	String operToDate = request.getParameter("OPER_TO_DATE");
	SZCP_SQ_JBXX.setOPER_TO_DATE(SysUtility.convertCode(operToDate));
	String legRepName = request.getParameter("LEG_REP_NAME");
	SZCP_SQ_JBXX.setLEG_REP_NAME(SysUtility.convertCode(legRepName));
	String telNo = request.getParameter("TEL_NO");
	SZCP_SQ_JBXX.setTEL_NO(telNo);
	String gbIndustryType = request.getParameter("GBINDUSTRYTYPEHIDDEN");
	SZCP_SQ_JBXX.setGB_INDUSTRY_TYPE(gbIndustryType);
	String busiScopeDesc = request.getParameter("BUSI_SCOPE_DESC");
	SZCP_SQ_JBXX.setBUSI_SCOPE_DESC(SysUtility.convertCode(busiScopeDesc));
	String webSite = request.getParameter("WEBSITE_DESC");
	if(webSite == null) {
		SZCP_SQ_JBXX.setWEBSITE_DESC("");  
	}else {
		webSite = SysUtility.convertCode(webSite);
		SZCP_SQ_JBXX.setWEBSITE_DESC(webSite);  
	}
	String orgCode = request.getParameter("ORG_CODE");
	SZCP_SQ_JBXX.setORG_CODE(SysUtility.convertCode(orgCode));
	String  entScaleType = request.getParameter("ENT_SCALE_TYPE");
	SZCP_SQ_JBXX.setENT_SCALE_TYPE(SysUtility.convertCode(entScaleType));
	String localIndustryType = request.getParameter("LOCAL_INDUSTRY_TYPE");
	SZCP_SQ_JBXX.setLOCAL_INDUSTRY_TYPE(SysUtility.convertCode(localIndustryType));
	String totalStaffQty = request.getParameter("TOTAL_STAFF_QTY");
	SZCP_SQ_JBXX.setTOTAL_STAFF_QTY(Integer.parseInt(totalStaffQty));
	String mngStaffQty = request.getParameter("MNG_STAFF_QTY");
	SZCP_SQ_JBXX.setMNG_STAFF_QTY(Integer.parseInt(mngStaffQty));
	String techStaffQty = request.getParameter("TECH_STAFF_QTY");
	SZCP_SQ_JBXX.setTECH_STAFF_QTY(Integer.parseInt(techStaffQty));
	String otherStaffQty = request.getParameter("OTHER_STAFF_QTY");
	SZCP_SQ_JBXX.setOTHER_STAFF_QTY(Integer.parseInt(otherStaffQty));
	String liaiName = request.getParameter("LIAI_NAME");
	SZCP_SQ_JBXX.setLIAI_NAME(SysUtility.convertCode(liaiName));
	String liaiPostCode = request.getParameter("LIAI_POS_CODE");
	SZCP_SQ_JBXX.setLIAI_POS_CODE(SysUtility.convertCode(liaiPostCode));
	String liaiFaxNo = request.getParameter("LIAI_FAX_NO");
	SZCP_SQ_JBXX.setLIAI_FAX_NO(liaiFaxNo);
	String liaiEmail = request.getParameter("LIAI_EMAIL");
	SZCP_SQ_JBXX.setLIAI_EMAIL(liaiEmail);
	String liaiMobileNo = request.getParameter("LIAI_MOBILE_NO");
	SZCP_SQ_JBXX.setLIAI_MOBILE_NO(liaiMobileNo);
	String liaiTelNo = request.getParameter("LIAI_TEL_NO");
	SZCP_SQ_JBXX.setLIAI_TEL_NO(liaiTelNo);
	String report_org_no = request.getParameter("REPORT_ORG_NO");
	SZCP_SQ_JBXX.setReportOrgNo(report_org_no);
	String regorg = request.getParameter("REGORGHIDDEN");
	SZCP_SQ_JBXX.setREGORG(regorg);
	
	String cerNo = request.getParameter("CERNOHIDDEN");
	
	boolean flag = SZCP_SQ_JBXX.executeNextStep(SZCP_SQ_JBXX);
	
	if(flag) {
		out.print(CreateHeaderUtil.setAlertGo("","szcp_sq_jygl.jsp?REG_NO="+SZCP_SQ_JBXX.getREG_NO()+"&EVAL_YEAR="+SZCP_SQ_JBXX.getEVAL_YEAR()+"&CerNO="+cerNo));
	}else {
		out.print(SysUtility.setAlertScript("系统出错，请稍后再试",""));
	}
%>