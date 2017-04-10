package com.macrosoft.icms.szcp;

/**
 * 
* @Title: SZCP_SQ_HT_XWGF.java 
* @Package com.macrosoft.icms.szcp 
* @Description: 封装数据 
* @author yuchengjian 
* @date 2015-3-21 上午11:00:12 
* @version V1.0
 */
public class SZCP_SQ_HT_XWGF {
	
	private String REG_NO;
	
	private String EVAL_YEAR;
	
	private String FC_ARCH_FLAG;
	
	private String FC_VIOL_FLAG;
	
	private String MODEL_TEXT_TYPE;
	
	private String DELEG_TYPE;
	
	private String SIGN_APPR_TYPE;
	
	private String SA_QUAL_FLAG;
	
	private String SA_VALID_FLAG;
	
	private String SA_CREDIT_FLAG;
	
	private String SA_PERFORM_FLAG;
	
	private String MNG_ORG_FLAG;
	
	private String MNG_SORT_FLAG;
	
	private String ACCT_FORM_TYPE;
	
	private String ACCT_SERIAL_FLAG;
	
	private String ACCT_GUEST_FLAG;
	
	private String ACCT_WHEN_FLAG;
	
	private String ACCT_UNDLY_FLAG;
	
	private String ACCT_QTY_FLAG;
	
	private String ACCT_CAP_FLAG;
	
	private String ACCT_PLAN_TIME_FLAG;
	
	private String ACCT_REAL_TIME_FLAG;
	
	private String ACCT_PLAN_CAP_FLAG;
	
	private String ACCT_REAL_CAP_FLAG;
	
	private String ACCT_PERFOM_CERT_FLAG;
	
	private String ACCT_CHANGE_FLAG;
	
	private String GUEST_INFO_TYPE;
	
	private String GC_RECORD_FLAG;
	
	private String GC_THIRD_PART_FLAG;
	
	private String GC_RESERCH_FLAG;
	
	private String AM_RECV_AGE_FLAG;
	
	private String AM_OVERDUE_FLAG;
	
	private String AM_SPEC_RECOVER_FLAG;
	
	private String AM_RECV_SUM_FLAG;
	
	private String DFT_OVER_THREE_FLAG;
	
	private int LAST_DFT_OUR_QTY;
	
	private int LAST_DFT_THEY__QTY;
	
	/**
	 *  合同行为管理
	 */
	private String DELEG_TYPEVIEW;
	
	/**
	 * 合同形式
	 */
	private String ACCTFORMTYPEVIEW;
	
	/**
	 * 客户信用信息建立方式
	 */
	private String GUESTINFOTYPEVIEW;
	
	/**
	 * 合同签订审批
	 */
	private String SINGAPPRTYPEVIEW;

	public String getSINGAPPRTYPEVIEW() {
		return SINGAPPRTYPEVIEW;
	}

	public void setSINGAPPRTYPEVIEW(String sINGAPPRTYPEVIEW) {
		SINGAPPRTYPEVIEW = sINGAPPRTYPEVIEW;
	}

	public String getREG_NO() {
		return REG_NO;
	}

	public void setREG_NO(String rEG_NO) {
		REG_NO = rEG_NO;
	}

	public String getEVAL_YEAR() {
		return EVAL_YEAR;
	}

	public void setEVAL_YEAR(String eVAL_YEAR) {
		EVAL_YEAR = eVAL_YEAR;
	}

	public String getFC_ARCH_FLAG() {
		return FC_ARCH_FLAG;
	}

	public void setFC_ARCH_FLAG(String fC_ARCH_FLAG) {
		FC_ARCH_FLAG = fC_ARCH_FLAG;
	}

	public String getFC_VIOL_FLAG() {
		return FC_VIOL_FLAG;
	}

	public void setFC_VIOL_FLAG(String fC_VIOL_FLAG) {
		FC_VIOL_FLAG = fC_VIOL_FLAG;
	}

	public String getMODEL_TEXT_TYPE() {
		return MODEL_TEXT_TYPE;
	}

	public void setMODEL_TEXT_TYPE(String mODEL_TEXT_TYPE) {
		MODEL_TEXT_TYPE = mODEL_TEXT_TYPE;
	}

	public String getDELEG_TYPE() {
		return DELEG_TYPE;
	}

	public void setDELEG_TYPE(String dELEG_TYPE) {
		DELEG_TYPE = dELEG_TYPE;
	}

	public String getSIGN_APPR_TYPE() {
		return SIGN_APPR_TYPE;
	}

	public void setSIGN_APPR_TYPE(String sIGN_APPR_TYPE) {
		SIGN_APPR_TYPE = sIGN_APPR_TYPE;
	}


	public int getLAST_DFT_OUR_QTY() {
		return LAST_DFT_OUR_QTY;
	}

	public void setLAST_DFT_OUR_QTY(int lAST_DFT_OUR_QTY) {
		LAST_DFT_OUR_QTY = lAST_DFT_OUR_QTY;
	}

	public int getLAST_DFT_THEY__QTY() {
		return LAST_DFT_THEY__QTY;
	}

	public void setLAST_DFT_THEY__QTY(int lAST_DFT_THEY__QTY) {
		LAST_DFT_THEY__QTY = lAST_DFT_THEY__QTY;
	}

	public String getDELEG_TYPEVIEW() {
		return DELEG_TYPEVIEW;
	}

	public void setDELEG_TYPEVIEW(String dELEG_TYPEVIEW) {
		DELEG_TYPEVIEW = dELEG_TYPEVIEW;
	}

	public String getACCTFORMTYPEVIEW() {
		return ACCTFORMTYPEVIEW;
	}

	public void setACCTFORMTYPEVIEW(String aCCTFORMTYPEVIEW) {
		ACCTFORMTYPEVIEW = aCCTFORMTYPEVIEW;
	}

	public String getGUESTINFOTYPEVIEW() {
		return GUESTINFOTYPEVIEW;
	}

	public void setGUESTINFOTYPEVIEW(String gUESTINFOTYPEVIEW) {
		GUESTINFOTYPEVIEW = gUESTINFOTYPEVIEW;
	}

	public String getSA_QUAL_FLAG() {
		return SA_QUAL_FLAG;
	}

	public void setSA_QUAL_FLAG(String sA_QUAL_FLAG) {
		SA_QUAL_FLAG = sA_QUAL_FLAG;
	}

	public String getSA_VALID_FLAG() {
		return SA_VALID_FLAG;
	}

	public void setSA_VALID_FLAG(String sA_VALID_FLAG) {
		SA_VALID_FLAG = sA_VALID_FLAG;
	}

	public String getSA_CREDIT_FLAG() {
		return SA_CREDIT_FLAG;
	}

	public void setSA_CREDIT_FLAG(String sA_CREDIT_FLAG) {
		SA_CREDIT_FLAG = sA_CREDIT_FLAG;
	}

	public String getSA_PERFORM_FLAG() {
		return SA_PERFORM_FLAG;
	}

	public void setSA_PERFORM_FLAG(String sA_PERFORM_FLAG) {
		SA_PERFORM_FLAG = sA_PERFORM_FLAG;
	}

	public String getMNG_ORG_FLAG() {
		return MNG_ORG_FLAG;
	}

	public void setMNG_ORG_FLAG(String mNG_ORG_FLAG) {
		MNG_ORG_FLAG = mNG_ORG_FLAG;
	}

	public String getMNG_SORT_FLAG() {
		return MNG_SORT_FLAG;
	}

	public void setMNG_SORT_FLAG(String mNG_SORT_FLAG) {
		MNG_SORT_FLAG = mNG_SORT_FLAG;
	}

	public String getACCT_FORM_TYPE() {
		return ACCT_FORM_TYPE;
	}

	public void setACCT_FORM_TYPE(String aCCT_FORM_TYPE) {
		ACCT_FORM_TYPE = aCCT_FORM_TYPE;
	}

	public String getACCT_SERIAL_FLAG() {
		return ACCT_SERIAL_FLAG;
	}

	public void setACCT_SERIAL_FLAG(String aCCT_SERIAL_FLAG) {
		ACCT_SERIAL_FLAG = aCCT_SERIAL_FLAG;
	}

	public String getACCT_GUEST_FLAG() {
		return ACCT_GUEST_FLAG;
	}

	public void setACCT_GUEST_FLAG(String aCCT_GUEST_FLAG) {
		ACCT_GUEST_FLAG = aCCT_GUEST_FLAG;
	}

	public String getACCT_WHEN_FLAG() {
		return ACCT_WHEN_FLAG;
	}

	public void setACCT_WHEN_FLAG(String aCCT_WHEN_FLAG) {
		ACCT_WHEN_FLAG = aCCT_WHEN_FLAG;
	}

	public String getACCT_UNDLY_FLAG() {
		return ACCT_UNDLY_FLAG;
	}

	public void setACCT_UNDLY_FLAG(String aCCT_UNDLY_FLAG) {
		ACCT_UNDLY_FLAG = aCCT_UNDLY_FLAG;
	}

	public String getACCT_QTY_FLAG() {
		return ACCT_QTY_FLAG;
	}

	public void setACCT_QTY_FLAG(String aCCT_QTY_FLAG) {
		ACCT_QTY_FLAG = aCCT_QTY_FLAG;
	}

	public String getACCT_CAP_FLAG() {
		return ACCT_CAP_FLAG;
	}

	public void setACCT_CAP_FLAG(String aCCT_CAP_FLAG) {
		ACCT_CAP_FLAG = aCCT_CAP_FLAG;
	}

	public String getACCT_PLAN_TIME_FLAG() {
		return ACCT_PLAN_TIME_FLAG;
	}

	public void setACCT_PLAN_TIME_FLAG(String aCCT_PLAN_TIME_FLAG) {
		ACCT_PLAN_TIME_FLAG = aCCT_PLAN_TIME_FLAG;
	}

	public String getACCT_REAL_TIME_FLAG() {
		return ACCT_REAL_TIME_FLAG;
	}

	public void setACCT_REAL_TIME_FLAG(String aCCT_REAL_TIME_FLAG) {
		ACCT_REAL_TIME_FLAG = aCCT_REAL_TIME_FLAG;
	}

	public String getACCT_PLAN_CAP_FLAG() {
		return ACCT_PLAN_CAP_FLAG;
	}

	public void setACCT_PLAN_CAP_FLAG(String aCCT_PLAN_CAP_FLAG) {
		ACCT_PLAN_CAP_FLAG = aCCT_PLAN_CAP_FLAG;
	}

	public String getACCT_REAL_CAP_FLAG() {
		return ACCT_REAL_CAP_FLAG;
	}

	public void setACCT_REAL_CAP_FLAG(String aCCT_REAL_CAP_FLAG) {
		ACCT_REAL_CAP_FLAG = aCCT_REAL_CAP_FLAG;
	}

	public String getACCT_PERFOM_CERT_FLAG() {
		return ACCT_PERFOM_CERT_FLAG;
	}

	public void setACCT_PERFOM_CERT_FLAG(String aCCT_PERFOM_CERT_FLAG) {
		ACCT_PERFOM_CERT_FLAG = aCCT_PERFOM_CERT_FLAG;
	}

	public String getACCT_CHANGE_FLAG() {
		return ACCT_CHANGE_FLAG;
	}

	public void setACCT_CHANGE_FLAG(String aCCT_CHANGE_FLAG) {
		ACCT_CHANGE_FLAG = aCCT_CHANGE_FLAG;
	}

	public String getGUEST_INFO_TYPE() {
		return GUEST_INFO_TYPE;
	}

	public void setGUEST_INFO_TYPE(String gUEST_INFO_TYPE) {
		GUEST_INFO_TYPE = gUEST_INFO_TYPE;
	}

	public String getGC_RECORD_FLAG() {
		return GC_RECORD_FLAG;
	}

	public void setGC_RECORD_FLAG(String gC_RECORD_FLAG) {
		GC_RECORD_FLAG = gC_RECORD_FLAG;
	}

	public String getGC_THIRD_PART_FLAG() {
		return GC_THIRD_PART_FLAG;
	}

	public void setGC_THIRD_PART_FLAG(String gC_THIRD_PART_FLAG) {
		GC_THIRD_PART_FLAG = gC_THIRD_PART_FLAG;
	}

	public String getGC_RESERCH_FLAG() {
		return GC_RESERCH_FLAG;
	}

	public void setGC_RESERCH_FLAG(String gC_RESERCH_FLAG) {
		GC_RESERCH_FLAG = gC_RESERCH_FLAG;
	}

	public String getAM_RECV_AGE_FLAG() {
		return AM_RECV_AGE_FLAG;
	}

	public void setAM_RECV_AGE_FLAG(String aM_RECV_AGE_FLAG) {
		AM_RECV_AGE_FLAG = aM_RECV_AGE_FLAG;
	}

	public String getAM_OVERDUE_FLAG() {
		return AM_OVERDUE_FLAG;
	}

	public void setAM_OVERDUE_FLAG(String aM_OVERDUE_FLAG) {
		AM_OVERDUE_FLAG = aM_OVERDUE_FLAG;
	}

	public String getAM_SPEC_RECOVER_FLAG() {
		return AM_SPEC_RECOVER_FLAG;
	}

	public void setAM_SPEC_RECOVER_FLAG(String aM_SPEC_RECOVER_FLAG) {
		AM_SPEC_RECOVER_FLAG = aM_SPEC_RECOVER_FLAG;
	}

	public String getAM_RECV_SUM_FLAG() {
		return AM_RECV_SUM_FLAG;
	}

	public void setAM_RECV_SUM_FLAG(String aM_RECV_SUM_FLAG) {
		AM_RECV_SUM_FLAG = aM_RECV_SUM_FLAG;
	}

	public String getDFT_OVER_THREE_FLAG() {
		return DFT_OVER_THREE_FLAG;
	}

	public void setDFT_OVER_THREE_FLAG(String dFT_OVER_THREE_FLAG) {
		DFT_OVER_THREE_FLAG = dFT_OVER_THREE_FLAG;
	}
	
}
