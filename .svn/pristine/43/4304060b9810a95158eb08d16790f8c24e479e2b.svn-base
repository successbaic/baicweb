package com.macrosoft.icms.szcp;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.macrosoft.icms.dbc.DbConnection;

/**
 * 
* @Title: SZCP_SQ_SHRY.java 
* @Package com.macrosoft.icms.szcp 
* @Description: 社会荣誉
* @author yuchengjian 
* @date 2015-3-26 上午09:07:27 
* @version V1.0
 */
public class SZCP_SQ_SHRY {

	private String REG_NO;
	
	private String EVAL_YEAR;
	
	private String CERT_NAME;
	
	private String CERT_NO;
	
	private String VALID_TO_DATE;
	
	private String AUTH_ORG_DESC;
	
	private String ISSUE_DATE;
	
	private String HONOR_LEVEL_TYPE;
	
	private String HONORDESC;
	
	/**
	 *  查询有无历史数据
	 * @param szcp
	 */
	public boolean queryHistoryData(SZCP_SQ_SHRY shry) {
		DbConnection dbConnection = new DbConnection();
		ResultSet set = null;
		boolean flag = false;
		String sql = "select count(*) as historycount from szcp_sq_shry where REG_NO = "+"'"+shry.getREG_NO()+"'"+" and  EVAL_YEAR = "+"'"
			+shry.getEVAL_YEAR()+"'";
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
	
	
	/**
	 * 页面显示用
	 */
	private String HONOR_LEVEL_TYPE_VIEW;

	public String getHONORDESC() {
		return HONORDESC;
	}

	public void setHONORDESC(String hONORDESC) {
		HONORDESC = hONORDESC;
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

	public String getCERT_NAME() {
		return CERT_NAME;
	}

	public void setCERT_NAME(String cERT_NAME) {
		CERT_NAME = cERT_NAME;
	}

	public String getCERT_NO() {
		return CERT_NO;
	}

	public void setCERT_NO(String cERT_NO) {
		CERT_NO = cERT_NO;
	}

	public String getVALID_TO_DATE() {
		return VALID_TO_DATE;
	}

	public void setVALID_TO_DATE(String vALID_TO_DATE) {
		VALID_TO_DATE = vALID_TO_DATE;
	}

	public String getAUTH_ORG_DESC() {
		return AUTH_ORG_DESC;
	}

	public void setAUTH_ORG_DESC(String aUTH_ORG_DESC) {
		AUTH_ORG_DESC = aUTH_ORG_DESC;
	}

	public String getISSUE_DATE() {
		return ISSUE_DATE;
	}

	public void setISSUE_DATE(String iSSUE_DATE) {
		ISSUE_DATE = iSSUE_DATE;
	}

	public String getHONOR_LEVEL_TYPE() {
		return HONOR_LEVEL_TYPE;
	}

	public void setHONOR_LEVEL_TYPE(String hONOR_LEVEL_TYPE) {
		HONOR_LEVEL_TYPE = hONOR_LEVEL_TYPE;
	}

	public String getHONOR_LEVEL_TYPE_VIEW() {
		return HONOR_LEVEL_TYPE_VIEW;
	}

	public void setHONOR_LEVEL_TYPE_VIEW(String hONOR_LEVEL_TYPE_VIEW) {
		HONOR_LEVEL_TYPE_VIEW = hONOR_LEVEL_TYPE_VIEW;
	}
	
}
