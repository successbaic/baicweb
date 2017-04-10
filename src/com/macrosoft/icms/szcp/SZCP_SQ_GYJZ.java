package com.macrosoft.icms.szcp;

import java.math.BigDecimal;

/**
 * 
* @Title: SZCP_SQ_GYJZ.java 
* @Package com.macrosoft.icms.szcp 
* @Description:¹«Òæ¾èÔù 
* @author yuchengjian 
* @date 2015-3-26 ÉÏÎç09:08:04 
* @version V1.0
 */
public class SZCP_SQ_GYJZ {
	
	private String REG_NO;
	
	private String EVAL_YEAR;
	
	private String REPORT_YEAR;
	
	private float LAST_DONT_RMB_W;
	
	private int LAST_COURT_INVEST_QTY;
	
	private int LAST_ARBIT_INVEST;

	public String getREPORT_YEAR() {
		return REPORT_YEAR;
	}

	public void setREPORT_YEAR(String report_year) {
		REPORT_YEAR = report_year;
	}

	public int getLAST_COURT_INVEST_QTY() {
		return LAST_COURT_INVEST_QTY;
	}

	public void setLAST_COURT_INVEST_QTY(int last_court_invest_qty) {
		LAST_COURT_INVEST_QTY = last_court_invest_qty;
	}

	public int getLAST_ARBIT_INVEST() {
		return LAST_ARBIT_INVEST;
	}

	public void setLAST_ARBIT_INVEST(int last_arbit_invest) {
		LAST_ARBIT_INVEST = last_arbit_invest;
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

	public float getLAST_DONT_RMB_W() {
		return LAST_DONT_RMB_W;
	}

	public void setLAST_DONT_RMB_W(float lAST_DONT_RMB_W) {
		LAST_DONT_RMB_W = lAST_DONT_RMB_W;
	}
	
	public String doubleToString(double val) {
		BigDecimal decimal = new BigDecimal(val);
		String result = String .format("%.6f",decimal.doubleValue());
	     return result;
	}
	
}
