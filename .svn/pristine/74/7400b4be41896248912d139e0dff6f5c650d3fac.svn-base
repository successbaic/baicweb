package com.macrosoft.icms.commAjax.action;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.macrosoft.icms.gsdbc.GsDbConnection;
import com.macrosoft.icms.gsdbc.SJGsDbConnection;

public class GetNameFromApprnoAction {
	public String getNameFromApprno(String apprno){
		GsDbConnection gsdbc = new GsDbConnection();
		ResultSet rs = null;
		String bgEntname = "";
		String sql = "SELECT * FROM mcgl_jbxx_zs t " 
				 	+" WHERE (t.apprno = '"+apprno+"' OR INSTR(t.apprno,'µÚ"+apprno+"ºÅ') > 0)"
				 	+" AND t.isentnamealt = '1'"
				 	+" AND t.namestatus = '2'";
		try {
			rs = gsdbc.executeQuery(sql);
			if(rs.next()){
				bgEntname = rs.getString("ENTNAME");
			}else{
				SJGsDbConnection sjdbc = new SJGsDbConnection();
				rs = sjdbc.executeQuery(sql);
				if(rs.next()){
					bgEntname = rs.getString("ENTNAME");
				}
				sjdbc.close();
			}
			if(rs != null){
			 	rs.close();
			}	
			gsdbc.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	 	return bgEntname;
	}
}
