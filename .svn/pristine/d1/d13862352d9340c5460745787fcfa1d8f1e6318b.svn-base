package com.macrosoft.icms.szcp;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.macrosoft.icms.dbc.DbConnection;

public class RecordNoUtil {

	public synchronized String createRecordNo(String tableName,String evalYear,String localOrgNum) {
		String recordNo = "";
		DbConnection connection= new DbConnection();
		String sql = "select max(substr(RECORD_NO,11,16)) as maxRecordNo  from "+tableName;
		PreparedStatement prsmt = null;
		ResultSet rs = null;
		try {
			prsmt = connection.prepareStatement(sql);
			rs = prsmt.executeQuery();
			if(rs.next()) {
				String maxRecordNo = rs.getString("maxRecordNo");
				if(maxRecordNo == null || "".equals(maxRecordNo)) {
					recordNo = evalYear+localOrgNum+"000001";
				}else {
//					maxRecordNo = maxRecordNo.substring(maxRecordNo.length()-6, maxRecordNo.length());
					int num = Integer.parseInt(maxRecordNo);
					num = num +1;
					if(num > 0 && num < 10) {
						recordNo = evalYear+localOrgNum+"00000"+num;
					}else if(num > 9 && num < 100) {
						recordNo = evalYear+localOrgNum+"0000"+num;
					}else if(num > 99 && num < 1000){
						recordNo = evalYear+localOrgNum+"000"+num;
					}else if(num > 999 && num < 10000) {
						recordNo = evalYear+localOrgNum+"00"+num;
					}else if(num > 9999 && num < 100000) {
						recordNo = evalYear+localOrgNum+"0"+num;
					}else {
						recordNo = evalYear+localOrgNum+num;
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				prsmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return recordNo;
	}
}
