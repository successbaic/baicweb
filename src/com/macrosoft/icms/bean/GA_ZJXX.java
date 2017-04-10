package com.macrosoft.icms.bean;

import java.sql.*;
import java.util.*;
import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.*;
import com.macrosoft.icms.system.*;

public class GA_ZJXX {
	String OPENO;
	String ENTNAME;
	String CONSIGNER;
	String TEL;
	String XZZ_GZ;
	float XZZ_FY;
	String CW_GZ;
	float CW_FY;
	String HT_GZ;
	float HT_FY;
	String FP_GZ;
	float FP_FY;
	String FR_GZ;
	float FR_FY;
	String TIME_STAMP;

	public String getOPENO() {
		return doPreProcess(OPENO);
	}

	public void setOPENO(String OPENO) {
		this.OPENO = doPreProcess2(convertCode(OPENO));
	}

	public String getENTNAME() {
		return doPreProcess(ENTNAME);
	}

	public void setENTNAME(String ENTNAME) {
		this.ENTNAME = doPreProcess2(convertCode(ENTNAME));
	}

	public String getCONSIGNER() {
		return doPreProcess(CONSIGNER);
	}

	public void setCONSIGNER(String CONSIGNER) {
		this.CONSIGNER = doPreProcess2(convertCode(CONSIGNER));
	}

	public String getTEL() {
		return doPreProcess(TEL);
	}

	public void setTEL(String TEL) {
		this.TEL = doPreProcess2(convertCode(TEL));
	}

	public String getXZZ_GZ() {
		return doPreProcess(XZZ_GZ);
	}

	public void setXZZ_GZ(String XZZ_GZ) {
		this.XZZ_GZ = doPreProcess2(convertCode(XZZ_GZ));
	}

	public float getXZZ_FY() {
		return XZZ_FY;
	}

	public void setXZZ_FY(float XZZ_FY) {
		this.XZZ_FY = XZZ_FY;
	}

	public String getCW_GZ() {
		return doPreProcess(CW_GZ);
	}

	public void setCW_GZ(String CW_GZ) {
		this.CW_GZ = doPreProcess2(convertCode(CW_GZ));
	}

	public float getCW_FY() {
		return CW_FY;
	}

	public void setCW_FY(float CW_FY) {
		this.CW_FY = CW_FY;
	}

	public String getHT_GZ() {
		return doPreProcess(HT_GZ);
	}

	public void setHT_GZ(String HT_GZ) {
		this.HT_GZ = doPreProcess2(convertCode(HT_GZ));
	}

	public float getHT_FY() {
		return HT_FY;
	}

	public void setHT_FY(float HT_FY) {
		this.HT_FY = HT_FY;
	}

	public String getFP_GZ() {
		return doPreProcess(FP_GZ);
	}

	public void setFP_GZ(String FP_GZ) {
		this.FP_GZ = doPreProcess2(convertCode(FP_GZ));
	}

	public float getFP_FY() {
		return FP_FY;
	}

	public void setFP_FY(float FP_FY) {
		this.FP_FY = FP_FY;
	}

	public String getFR_GZ() {
		return doPreProcess(FR_GZ);
	}

	public void setFR_GZ(String FR_GZ) {
		this.FR_GZ = doPreProcess2(convertCode(FR_GZ));
	}

	public float getFR_FY() {
		return FR_FY;
	}

	public void setFR_FY(float FR_FY) {
		this.FR_FY = FR_FY;
	}

	public String getTIME_STAMP() {
		return doPreProcess(TIME_STAMP);
	}

	public void setTIME_STAMP(String TIME_STAMP) {
		this.TIME_STAMP = doPreProcess2(convertCode(TIME_STAMP));
	}

	public String convertCode(String strvalue) {
		return com.macrosoft.icms.system.SysUtility.convertCode(strvalue);
	}

	public String doPreProcess(String sValue) {
		return com.macrosoft.icms.system.SysUtility.doPreProcess(sValue);
	}

	public String doPreProcess2(String sValue) {
		return com.macrosoft.icms.system.SysUtility.doPreProcess2(sValue);
	}

	public String doPreProcess3(String sValue) {
		return com.macrosoft.icms.system.SysUtility.doPreProcess3(sValue);
	}

	public void doSelect() throws SQLException {
		DbConnection dbc = new DbConnection();
		ResultSet rsSelect;
		String sqlSelect = "SELECT * FROM GA_ZJXX" + " WHERE OPENO='"
				+ doPreProcess(OPENO) + "'";
		rsSelect = dbc.executeQuery(sqlSelect);
		if (rsSelect.next()) {
			doSetData(rsSelect);
		}
		dbc.close();
	}

	public void doSetData(ResultSet rsSelect) throws SQLException {
		OPENO = rsSelect.getString("OPENO");
		ENTNAME = rsSelect.getString("ENTNAME");
		CONSIGNER = rsSelect.getString("CONSIGNER");
		TEL = rsSelect.getString("TEL");
		XZZ_GZ = rsSelect.getString("XZZ_GZ");
		XZZ_FY = rsSelect.getFloat("XZZ_FY");
		CW_GZ = rsSelect.getString("CW_GZ");
		CW_FY = rsSelect.getFloat("CW_FY");
		HT_GZ = rsSelect.getString("HT_GZ");
		HT_FY = rsSelect.getFloat("HT_FY");
		FP_GZ = rsSelect.getString("FP_GZ");
		FP_FY = rsSelect.getFloat("FP_FY");
		FR_GZ = rsSelect.getString("FR_GZ");
		FR_FY = rsSelect.getFloat("FR_FY");
		TIME_STAMP = rsSelect.getString("TIME_STAMP");
	}

	public boolean doAdd() throws SQLException {
		DbConnection dbc = new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd = "INSERT INTO GA_ZJXX(OPENO,ENTNAME,CONSIGNER,TEL,XZZ_GZ,XZZ_FY,CW_GZ,CW_FY,HT_GZ,HT_FY,FP_GZ,FP_FY,FR_GZ,FR_FY,TIME_STAMP) VALUES("
				+ doPreProcess3(OPENO)
				+ ","
				+ doPreProcess3(ENTNAME)
				+ ","
				+ doPreProcess3(CONSIGNER)
				+ ","
				+ doPreProcess3(TEL)
				+ ","
				+ doPreProcess3(XZZ_GZ)
				+ ","
				+ XZZ_FY
				+ ","
				+ doPreProcess3(CW_GZ)
				+ ","
				+ CW_FY
				+ ","
				+ doPreProcess3(HT_GZ)
				+ ","
				+ HT_FY
				+ ","
				+ doPreProcess3(FP_GZ)
				+ ","
				+ FP_FY
				+ ","
				+ doPreProcess3(FR_GZ)
				+ ","
				+ FR_FY
				+ ","
				+ "sysdate)";
		{
			nRowCount = dbc.executeUpdate(sqlAdd);
			dbc.close();
			if (nRowCount > 0) // 插入成功
				return true;
			else
				return false;
		}
	}

	public boolean doCount() throws SQLException {
		DbConnection dbc = new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlCount = "SELECT COUNT(*) FROM GA_ZJXX" + " WHERE OPENO='"
				+ doPreProcess(OPENO) + "'";
		rsCount = dbc.executeQuery(sqlCount);
		rsCount.next();
		nRowCount = rsCount.getInt(1);

		dbc.close();
		if (nRowCount > 0) {
			return true;
		} else
			return false;
	}

	public boolean doModify() throws SQLException {
		DbConnection dbc = new DbConnection();
		String sqlModify = "UPDATE GA_ZJXX SET OPENO=" + doPreProcess3(OPENO)
				+ ",ENTNAME=" + doPreProcess3(ENTNAME) + ",CONSIGNER="
				+ doPreProcess3(CONSIGNER) + ",TEL=" + doPreProcess3(TEL)
				+ ",XZZ_GZ=" + doPreProcess3(XZZ_GZ) + ",XZZ_FY=" + XZZ_FY
				+ ",CW_GZ=" + doPreProcess3(CW_GZ) + ",CW_FY=" + CW_FY
				+ ",HT_GZ=" + doPreProcess3(HT_GZ) + ",HT_FY=" + HT_FY
				+ ",FP_GZ=" + doPreProcess3(FP_GZ) + ",FP_FY=" + FP_FY
				+ ",FR_GZ=" + doPreProcess3(FR_GZ) + ",FR_FY=" + FR_FY
				+ ",TIME_STAMP=sysdate"
				+ " WHERE OPENO='" + doPreProcess(OPENO) + "'";
		int nRowCount = dbc.executeUpdate(sqlModify);
		dbc.close();
		if (nRowCount > 0) // 修改成功
		{
			return true;
		} else
			return false;
	}

	public boolean doDelete() throws SQLException {
		DbConnection dbc = new DbConnection();
		String sqlDelete = "DELETE FROM GA_ZJXX" + " WHERE OPENO='"
				+ doPreProcess(OPENO) + "'";
		int nRowCount = dbc.executeUpdate(sqlDelete);
		dbc.close();
		if (nRowCount > 0) {
			return true;
		} else
			return false;
	}

	public int getListCount(String sqlWhere) throws SQLException {
		DbConnection dbc = new DbConnection();
		String sqlCount = "SELECT COUNT(*) FROM GA_ZJXX";
		if (sqlWhere != null && sqlWhere.trim().compareTo("") != 0) {
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")) {
				sqlCount += sqlWhere;
			} else {
				sqlCount += " WHERE " + sqlWhere;
			}
		}
		ResultSet rsCount = dbc.executeQuery(sqlCount);
		rsCount.next();
		int nRowCount = rsCount.getInt(1);
		dbc.close();
		return nRowCount;

	}

	public ArrayList getList(String sqlWhere) throws SQLException {
		DbConnection dbc = new DbConnection();
		ArrayList al = new ArrayList();
		String sqlList = "SELECT * FROM GA_ZJXX";
		if (sqlWhere != null && sqlWhere.trim().compareTo("") != 0) {
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")) {
				sqlList += sqlWhere;
			} else {
				sqlList += " WHERE " + sqlWhere;
			}
		}
		ResultSet rsList = dbc.executeQuery(sqlList);
		while (rsList.next()) {
			GA_ZJXX bTable = new GA_ZJXX();
			bTable.doSetData(rsList);
			al.add(bTable);
		}
		rsList.close();
		dbc.close();
		return al;

	}

	public Iterator getItList(String sqlWhere, String startRow)
			throws SQLException {
		if (SysUtility.isNumeric(startRow))
			return getList(sqlWhere, Integer.parseInt(startRow)).iterator();
		else
			return getList(sqlWhere, 0).iterator();
	}

	public ArrayList getList(String sqlWhere, String startRow)
			throws SQLException {
		if (SysUtility.isNumeric(startRow))
			return getList(sqlWhere, Integer.parseInt(startRow), 10);
		else
			return getList(sqlWhere, 0, 10);
	}

	public ArrayList getList(String sqlWhere, String startRow, int PageSize)
			throws SQLException {
		if (SysUtility.isNumeric(startRow))
			return getList(sqlWhere, Integer.parseInt(startRow), PageSize);
		else
			return getList(sqlWhere, 0, PageSize);
	}

	public ArrayList getList(String sqlWhere, int startRow) throws SQLException {
		return getList(sqlWhere, startRow, 10);
	}

	// //////reload function getlist
	public ArrayList getList(String sqlWhere, int startRow, int PageSize)
			throws SQLException {
		DbConnection dbc = new DbConnection();
		ArrayList al = new ArrayList();
		String sqlList = "SELECT * FROM GA_ZJXX";
		if (sqlWhere != null && sqlWhere.trim().compareTo("") != 0) {
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")) {
				sqlList += sqlWhere;
			} else {
				sqlList += " WHERE " + sqlWhere;
			}
		}
		sqlList += " AND ROWNUM<=" + (startRow + PageSize);// start+pagesize
		ResultSet rsList = dbc.executeQuery(sqlList);
		// 过掉所有已经显示的列
		int nDispRows = 0;
		do {
			nDispRows++;
			if (nDispRows > startRow)
				break;
		} while (rsList.next());
		while (rsList.next()) {
			GA_ZJXX bTable = new GA_ZJXX();
			bTable.doSetData(rsList);
			al.add(bTable);
		}
		rsList.close();
		dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException {
		DbConnection dbc = new DbConnection();
		String sqlArr = "SELECT * FROM GA_ZJXX" + " WHERE OPENO='"
				+ doPreProcess(OPENO) + "'";
		ResultSet rsArr = dbc.executeQuery(sqlArr);
		ArrayList al = new ArrayList();
		String[] ay = null;
		if (rsArr.next()) {
			doSetData(rsArr);
			ResultSetMetaData rsmd = rsArr.getMetaData();
			for (int k = 1; k <= rsmd.getColumnCount(); k++) {
				ay = new String[2];
				ay[0] = rsmd.getColumnName(k);
				if (rsmd.getColumnTypeName(k).equalsIgnoreCase("DATETIME")
						|| rsmd.getColumnTypeName(k).equalsIgnoreCase("DATE"))
					ay[1] = String.valueOf(rsArr.getDate(ay[0]));
				else
					ay[1] = String.valueOf(rsArr.getObject(ay[0]));
				if (!ay[1].trim().equals("null") && !ay[1].trim().equals("")) {
					ay[1] = SysUtility.pre(ay[1]);
					al.add(ay);
				}
			}
		}
		dbc.close();
		return al;

	}
}
