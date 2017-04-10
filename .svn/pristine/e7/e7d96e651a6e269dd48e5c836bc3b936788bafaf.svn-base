package com.macrosoft.icms.commAjax.action;

import java.net.URLDecoder;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.macrosoft.icms.gsdbc.GsDbConnection;
import com.macrosoft.icms.gsdbc.SJGsDbConnection;

public class TqdwAction {
	public String tqdw(HttpServletRequest request, HttpServletResponse response) {
		GsDbConnection db = null;
		ResultSet rs = null;
		String sql = "";
		SJGsDbConnection sjDb = null;
		JSONObject jsonObj = new JSONObject();
		try {
			String SUPREGNO = URLDecoder.decode(request
					.getParameter("SUPREGNO"), "GBK");
			db = new GsDbConnection();
			sql = "SELECT t.entname AS SUPENTNAME," 
					+ "        t.regorg,"
					+ "        dm.content AS SUPREGORG,"
					+ "        t.enttype AS ECOCHR,"
					+ "        TO_CHAR(t.opfrom,'yyyy-MM-dd') AS FORENTOPFROM,"
					+ "        TO_CHAR(t.opto,'yyyy-MM-dd') AS FORENTOPTO" 
					+ "   FROM qydj_jbxx_zs t"
					+ "   LEFT JOIN com_dm dm" 
					+ "     ON t.regorg = dm.code"
					+ "    AND dm.type = 'CASEFIAUTH'" 
					+ " WHERE t.regno = '"
					+ SUPREGNO + "'";
			rs = db.executeQuery(sql);
			if (rs.next()) {
				/*
				 * String SUPENTNAME = rs.getString("SUPENTNAME"); String
				 * SUPREGORG = rs.getString("SUPREGORG"); String ECOCHR =
				 * rs.getString("ECOCHR"); String FORENTOPFROM =
				 * rs.getString("FORENTOPFROM"); String FORENTOPTO =
				 * rs.getString("FORENTOPTO"); jsonObj.put("SUPENTNAME",
				 * SUPENTNAME); jsonObj.put("SUPREGORG", SUPREGORG);
				 * jsonObj.put("ECOCHR", ECOCHR); jsonObj.put("FORENTOPFROM",
				 * FORENTOPFROM); jsonObj.put("FORENTOPTO", FORENTOPTO);
				 */
				jsonObj = getJsonValue(rs);
				return jsonObj.toString();
			} else {
				sjDb = new SJGsDbConnection();
				rs = db.executeQuery(sql);
				if (rs.next()) {
					jsonObj = getJsonValue(rs);
					return jsonObj.toString();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (db != null) {
				try {
					db.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (sjDb != null) {
				try {
					sjDb.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}

	private JSONObject getJsonValue(ResultSet rs) throws SQLException {
		JSONObject resObj = new JSONObject();
		String SUPENTNAME = rs.getString("SUPENTNAME");
		String SUPREGORG = rs.getString("SUPREGORG");
		String ECOCHR = rs.getString("ECOCHR");
		String FORENTOPFROM = rs.getString("FORENTOPFROM");
		String FORENTOPTO = rs.getString("FORENTOPTO");
		resObj.put("SUPENTNAME", SUPENTNAME);
		resObj.put("SUPREGORG", SUPREGORG);
		resObj.put("ECOCHR", ECOCHR);
		resObj.put("FORENTOPFROM", FORENTOPFROM);
		resObj.put("FORENTOPTO", FORENTOPTO);
		return resObj;
	}
}
