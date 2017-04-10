package com.macrosoft.icms.szcp;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import oracle.jdbc.driver.DBConversion;

import com.macrosoft.icms.dbc.DbConnection;


public class SZCP_SQ_XGZS {
	
	String REG_NO;
	
	String EVAL_YEAR;
	
	String CERT_NAME;
	
	String CERT_NO;
	
	String VALID_TO_DATE;
	
	String AUTH_ORG_DESC;
	
	String ISSUE_DATE;
	
	
	/**
	 *  查询有无历史数据
	 * @param szcp
	 */
	public boolean queryHistoryData(SZCP_SQ_XGZS xgzs) {
		DbConnection dbConnection = new DbConnection();
		ResultSet set = null;
		boolean flag = false;
		String sql = "select count(*) as historycount from szcp_sq_xgzs where REG_NO = "+"'"+xgzs.getREG_NO()+"'"+" and  EVAL_YEAR = "+"'"
			+xgzs.getEVAL_YEAR()+"'";
		try {
			set = dbConnection.executeQuery(sql);
			if(set.next()) {
				String str = set.getString("historycount");
				if(Integer.parseInt(str) > 0) {
					flag = true;
				}else {
					flag = false;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				set.close();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			try {
				dbConnection.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		return flag;
	}
	
	public String getREG_NO() {
		return REG_NO;
	}
	public void setREG_NO(String REG_NO) {
		this.REG_NO = REG_NO;
	}
	
	public String getEVAL_YEAR() {
		return EVAL_YEAR;
	}
	public void setEVAL_YEAR(String EVAL_YEAR) {
		this.EVAL_YEAR = EVAL_YEAR;
	}
	
	public String  getCERT_NAME() {
		return CERT_NAME;
	}
	
	public void setCERT_NAME(String CERT_NAME) {
		this.CERT_NAME = CERT_NAME;
	}
	
	public String  getCERT_NO(){
		return CERT_NO;
	}
	public void setCERT_NO(String CERT_NO){
		this.CERT_NO = CERT_NO;
	}
	
	public String getVALID_TO_DATE(){
		return VALID_TO_DATE;
	}
	public void setVALID_TO_DATE(String VALID_TO_DATE){
		this.VALID_TO_DATE= VALID_TO_DATE;
	}
	public String getAUTH_ORG_DESC(){
		return AUTH_ORG_DESC;
	}
	public void setAUTH_ORG_DESC(String AUTH_ORG_DESC){
		this.AUTH_ORG_DESC = AUTH_ORG_DESC;
	}
	public String getISSUE_DATE(){
		return ISSUE_DATE;
	}
	public void setISSUE_DATE(String ISSUE_DATE){
		this.ISSUE_DATE = ISSUE_DATE;
	}
	
}
