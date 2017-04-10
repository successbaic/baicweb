package com.macrosoft.icms.szcp;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.HashMap;

import com.macrosoft.icms.dbc.DbConnection;

public class SZCP_SXSZ {
	String EVAL_YEAR;
	Date APL_END_DATE;
	Date RCM_END_DATE;
	Date PUB_END_DATE;
	String REPORT_YEAR1;
	String REPORT_YEAR2;
	public String getREPORT_YEAR1() {
		return REPORT_YEAR1;
	}

	
	
	
	
	public void setREPORT_YEAR1(String report_year1) {
		REPORT_YEAR1 = report_year1;
	}

	public String getREPORT_YEAR2() {
		return REPORT_YEAR2;
	}

	public void setREPORT_YEAR2(String report_year2) {
		REPORT_YEAR2 = report_year2;
	}

	public String getEVAL_YEAR() {
		return EVAL_YEAR;
	}

	public void setEVAL_YEAR(String eVAL_YEAR) {
		EVAL_YEAR = eVAL_YEAR;
	}

	public Date getAPL_END_DATE() {
		return APL_END_DATE;
	}

	public void setAPL_END_DATE(Date aPL_END_DATE) {
		APL_END_DATE = aPL_END_DATE;
	}

	public Date getRCM_END_DATE() {
		return RCM_END_DATE;
	}

	public void setRCM_END_DATE(Date rCM_END_DATE) {
		RCM_END_DATE = rCM_END_DATE;
	}

	public Date getPUB_END_DATE() {
		return PUB_END_DATE;
	}

	public void setPUB_END_DATE(Date pUB_END_DATE) {
		PUB_END_DATE = pUB_END_DATE;
	}

	public void doSelectBySql(String sqlSelect) throws SQLException {
		DbConnection dbc = new DbConnection();
		ResultSet rsSelect;
		rsSelect = dbc.executeQuery(sqlSelect);
		if (rsSelect.next()) {
			doSetData(rsSelect);
		}
		dbc.close();
	}

	public void doSetData(ResultSet rsSelect) throws SQLException {
		EVAL_YEAR = rsSelect.getString("EVAL_YEAR");
		APL_END_DATE = rsSelect.getDate("APL_END_DATE");
		RCM_END_DATE = rsSelect.getDate("RCM_END_DATE");
		PUB_END_DATE = rsSelect.getDate("PUB_END_DATE");
		REPORT_YEAR1 = rsSelect.getString("REPORT_YEAR1");
		REPORT_YEAR2 = rsSelect.getString("REPORT_YEAR2");
	}

	public boolean validateEndDate(HashMap<String, String> map) {
		boolean flag = false;
		DbConnection dbc = new DbConnection();
		
		Calendar calendar = Calendar.getInstance();
		int year = calendar.get(Calendar.YEAR);
		Date curDate = new Date(calendar.getTimeInMillis());

		String sql = "select * from SZCP_SXSZ t where t.eval_year = ? and t.apl_end_date >= ?";
		try {
			PreparedStatement prsmt = dbc.prepareStatement(sql);
			prsmt.setString(1, String.valueOf(year));
			prsmt.setDate(2, curDate);
			ResultSet rs = prsmt.executeQuery();
			
			if (rs.next()) {
				flag = true;
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try{
				dbc.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return flag;
	}
	
	public SZCP_SXSZ querySZCP_SXSZ(String year) {
		String sql = "select *from SZCP_SXSZ where EVAL_YEAR = "+"'"+year+"'";
		DbConnection connection = new DbConnection();
		ResultSet rs = null;
		SZCP_SXSZ szsz = new SZCP_SXSZ();
		try {
			 rs = connection.executeQuery(sql);
			 if(rs.next()) {
				 szsz = setValueToSZCP_SXSZ(rs);
			 }
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return szsz;
	}
	
	private SZCP_SXSZ setValueToSZCP_SXSZ(ResultSet rs) {
		SZCP_SXSZ sxsz = new SZCP_SXSZ();
		try {
			sxsz.setEVAL_YEAR(rs.getString("EVAL_YEAR") == null ?"":rs.getString("EVAL_YEAR"));
			sxsz.setAPL_END_DATE(rs.getDate("APL_END_DATE"));
			sxsz.setRCM_END_DATE(rs.getDate("RCM_END_DATE"));
			sxsz.setPUB_END_DATE(rs.getDate("PUB_END_DATE"));
			sxsz.setREPORT_YEAR1(rs.getString("REPORT_YEAR1") == null?"":rs.getString("REPORT_YEAR1"));
			sxsz.setREPORT_YEAR2(rs.getString("REPORT_YEAR2") == null?"":rs.getString("REPORT_YEAR2"));
		}catch(Exception e) {
			e.printStackTrace();
		}
		return sxsz;
	}
	
	
}