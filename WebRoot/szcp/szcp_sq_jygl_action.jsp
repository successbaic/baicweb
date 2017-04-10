<%@page import="com.macrosoft.icms.system.SysUtility"%>
<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<jsp:useBean id="jygl" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_JYGL" >
</jsp:useBean> 
<jsp:useBean id="jyglxs" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_JYGL_XS" >
</jsp:useBean> 
<jsp:useBean id="jyglxs2" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_JYGL_XS" >
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
	double LAST_ASSET_RMB_W = Double.parseDouble(request.getParameter("LAST_ASSET_RMB_W"));
	double LAST_ASSET_RMB_W_TIME = Double.parseDouble(request.getParameter("LAST_ASSET_RMB_W_TIME"));
	double LAST_SALE_RMB_W = Double.parseDouble(request.getParameter("LAST_SALE_RMB_W"));
	double LAST_SALE_RMB_W_TIME = Double.parseDouble(request.getParameter("LAST_SALE_RMB_W_TIME"));
	double HOME_SALE_RMB_W = Double.parseDouble(request.getParameter("HOME_SALE_RMB_W"));
	double HOME_SALE_RMB_W_TIME = Double.parseDouble(request.getParameter("HOME_SALE_RMB_W_TIME"));
	int COVER_PROV_QTY = Integer.parseInt(request.getParameter("COVER_PROV_QTY"));
	int COVER_PROV_QTY_TIME = Integer.parseInt(request.getParameter("COVER_PROV_QTY_TIME"));
	double OUT_SALE_USD_W = Double.parseDouble(request.getParameter("OUT_SALE_USD_W"));
	double OUT_SALE_USD_W_TIME = Double.parseDouble(request.getParameter("OUT_SALE_USD_W_TIME"));
	int COVER_AREA_QTY = Integer.parseInt(request.getParameter("COVER_AREA_QTY"));
	int COVER_AREA_QTY_TIME = Integer.parseInt(request.getParameter("COVER_AREA_QTY_TIME"));
	String QC_FLAG  =request.getParameter("QC_FLAG");
	String EC_FLAG  =request.getParameter("EC_FLAG");
	String PC_FLAG  =request.getParameter("PC_FLAG");
	String OC_FLAG  =request.getParameter("OC_FLAG");
	int INV_PATE_QTY = Integer.parseInt(request.getParameter("INV_PATE_QTY"));
	int UTI_PATE_QTY = Integer.parseInt(request.getParameter("UTI_PATE_QTY"));
	int DES_PATE_QTY = Integer.parseInt(request.getParameter("DES_PATE_QTY"));
	int REG_MARK_QTY = Integer.parseInt(request.getParameter("REG_MARK_QTY"));
	int WEL_MARK_QTY = Integer.parseInt(request.getParameter("WEL_MARK_QTY"));
	int FMS_MARK_QTY = Integer.parseInt(request.getParameter("FMS_MARK_QTY"));
	int CPRT_QTY = Integer.parseInt(request.getParameter("CPRT_QTY"));
	String IND_QUAL_FLAG  =request.getParameter("IND_QUAL_FLAG");
	String ENT_QUAL_FLAG  =request.getParameter("ENT_QUAL_FLAG");
	String QUAL_LEVEL_FLAG  =request.getParameter("QUAL_LEVEL_FLAG");
	String ENT_QUAL_LEVEL_TYPE  =request.getParameter("ENT_QUAL_LEVEL_TYPE");
	
	jygl.setREG_NO(REGNO.trim());
	jygl.setEVAL_YEAR(YEAR);
	jygl.setQC_FLAG(QC_FLAG);
	jygl.setEC_FLAG(EC_FLAG);
	jygl.setPC_FLAG(PC_FLAG);
	jygl.setOC_FLAG(OC_FLAG);
	jygl.setINV_PATE_QTY(INV_PATE_QTY);
	jygl.setUTI_PATE_QTY(UTI_PATE_QTY);
	jygl.setDES_PATE_QTY(DES_PATE_QTY);
	jygl.setREG_MARK_QTY(REG_MARK_QTY);
	jygl.setWEL_MARK_QTY(WEL_MARK_QTY);
	jygl.setFMS_MARK_QTY(FMS_MARK_QTY);
	jygl.setCPRT_QTY(CPRT_QTY);
	jygl.setIND_QUAL_FLAG(IND_QUAL_FLAG);
	jygl.setENT_QUAL_FLAG(ENT_QUAL_FLAG);
	jygl.setQUAL_LEVEL_FLAG(QUAL_LEVEL_FLAG);
	jygl.setENT_QUAL_LEVEL_TYPE(ENT_QUAL_LEVEL_TYPE);
	
	jyglxs.setREG_NO(REGNO.trim());
	jyglxs.setEVAL_YEAR(YEAR);
	jyglxs.setREPORT_YEAR(REPORT_YEAR1);
	jyglxs.setLAST_ASSET_RMB_W(LAST_ASSET_RMB_W);
	jyglxs.setLAST_SALE_RMB_W(LAST_SALE_RMB_W);
	jyglxs.setHOME_SALE_RMB_W(HOME_SALE_RMB_W);
	jyglxs.setCOVER_PROV_QTY(COVER_PROV_QTY);
	jyglxs.setOUT_SALE_USD_W(OUT_SALE_USD_W);
	jyglxs.setCOVER_AREA_QTY(COVER_AREA_QTY);
	
	jyglxs2.setREG_NO(REGNO);
	jyglxs2.setEVAL_YEAR(YEAR);
	jyglxs2.setREPORT_YEAR(REPORT_YEAR2);
	jyglxs2.setLAST_ASSET_RMB_W(LAST_ASSET_RMB_W_TIME);
	jyglxs2.setLAST_SALE_RMB_W(LAST_SALE_RMB_W_TIME);
	jyglxs2.setHOME_SALE_RMB_W(HOME_SALE_RMB_W_TIME);
	jyglxs2.setCOVER_PROV_QTY(COVER_PROV_QTY_TIME);
	jyglxs2.setOUT_SALE_USD_W(OUT_SALE_USD_W_TIME);
	jyglxs2.setCOVER_AREA_QTY(COVER_AREA_QTY_TIME);
	
	boolean  b = jyglxs.executeNextStep(jyglxs);
	boolean  b2 = jyglxs2.executeNextStep(jyglxs2);
	boolean flag = jygl.executeNextStep(jygl);
	if(flag && b && b2) {
		out.print(CreateHeaderUtil.setAlertGo("","szcp_sq_htgl.jsp?REG_NO="+jygl.getREG_NO()+"&EVAL_YEAR="+jygl.getEVAL_YEAR()+"&CerNO="+CerNO));
	}else {
		out.print(SysUtility.setAlertScript("系统出错，请稍后再试",""));
	}
%>    
