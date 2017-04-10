package com.macrosoft.icms.bean;

import java.sql.*;
import java.util.*;
import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.*;
import com.macrosoft.icms.system.*;

public class SW_LXRXX {
	String RECID;
	String OPENO;
	String PRIPID;
	String RYLX;
	String XM;
	String ZJLX;
	String ZJHM;
	String LXDH;
	String DZYX;
	String S_EXT_TIMESTAMP;

	public String getRECID() {
		return doPreProcess(RECID);
	}

	public void setRECID(String RECID) {
		this.RECID = doPreProcess2(convertCode(RECID));
	}

	public String getOPENO() {
		return doPreProcess(OPENO);
	}

	public void setOPENO(String OPENO) {
		this.OPENO = doPreProcess2(convertCode(OPENO));
	}

	public String getPRIPID() {
		return doPreProcess(PRIPID);
	}

	public void setPRIPID(String PRIPID) {
		this.PRIPID = doPreProcess2(convertCode(PRIPID));
	}

	public String getRYLX() {
		return doPreProcess(RYLX);
	}

	public void setRYLX(String RYLX) {
		this.RYLX = doPreProcess2(convertCode(RYLX));
	}

	public String getXM() {
		return doPreProcess(XM);
	}

	public void setXM(String XM) {
		this.XM = doPreProcess2(convertCode(XM));
	}

	public String getZJLX() {
		return doPreProcess(ZJLX);
	}

	public void setZJLX(String ZJLX) {
		this.ZJLX = doPreProcess2(convertCode(ZJLX));
	}

	public String getZJHM() {
		return doPreProcess(ZJHM);
	}

	public void setZJHM(String ZJHM) {
		this.ZJHM = doPreProcess2(convertCode(ZJHM));
	}

	public String getLXDH() {
		return doPreProcess(LXDH);
	}

	public void setLXDH(String LXDH) {
		this.LXDH = doPreProcess2(convertCode(LXDH));
	}

	public String getDZYX() {
		return doPreProcess(DZYX);
	}

	public void setDZYX(String DZYX) {
		this.DZYX = doPreProcess2(convertCode(DZYX));
	}

	public String getS_EXT_TIMESTAMP() {
		return doPreProcess(S_EXT_TIMESTAMP);
	}

	public void setS_EXT_TIMESTAMP(String S_EXT_TIMESTAMP) {
		this.S_EXT_TIMESTAMP = doPreProcess2(convertCode(S_EXT_TIMESTAMP));
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
		String sqlSelect = "SELECT * FROM SW_LXRXX" + " WHERE RECID='"
				+ doPreProcess(RECID) + "'";
		rsSelect = dbc.executeQuery(sqlSelect);
		if (rsSelect.next()) {
			doSetData(rsSelect);
		}
		dbc.close();
	}

	public void doSetData(ResultSet rsSelect) throws SQLException {
		RECID = rsSelect.getString("RECID");
		OPENO = rsSelect.getString("OPENO");
		PRIPID = rsSelect.getString("PRIPID");
		RYLX = rsSelect.getString("RYLX");
		XM = rsSelect.getString("XM");
		ZJLX = rsSelect.getString("ZJLX");
		ZJHM = rsSelect.getString("ZJHM");
		LXDH = rsSelect.getString("LXDH");
		DZYX = rsSelect.getString("DZYX");
		S_EXT_TIMESTAMP = rsSelect.getString("S_EXT_TIMESTAMP");
	}

	public boolean doAdd() throws SQLException {
		DbConnection dbc = new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd = "INSERT INTO SW_LXRXX(RECID,OPENO,PRIPID,RYLX,XM,ZJLX,ZJHM,LXDH,DZYX,S_EXT_TIMESTAMP) VALUES("
				+ doPreProcess3(RECID)
				+ ","
				+ doPreProcess3(OPENO)
				+ ","
				+ doPreProcess3(PRIPID)
				+ ","
				+ doPreProcess3(RYLX)
				+ ","
				+ doPreProcess3(XM)
				+ ","
				+ doPreProcess3(ZJLX)
				+ ","
				+ doPreProcess3(ZJHM)
				+ ","
				+ doPreProcess3(LXDH)
				+ ","
				+ doPreProcess3(DZYX)
				+ ","
				+ "sysdate"
				+ ")";
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
		String sqlCount = "SELECT COUNT(*) FROM SW_LXRXX" + " WHERE RECID='"
				+ doPreProcess(RECID) + "'";
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
		String sqlModify = "UPDATE SW_LXRXX SET RECID=" + doPreProcess3(RECID)
				+ ",OPENO=" + doPreProcess3(OPENO) + ",PRIPID="
				+ doPreProcess3(PRIPID) + ",RYLX=" + doPreProcess3(RYLX)
				+ ",XM=" + doPreProcess3(XM) + ",ZJLX=" + doPreProcess3(ZJLX)
				+ ",ZJHM=" + doPreProcess3(ZJHM) + ",LXDH="
				+ doPreProcess3(LXDH) + ",DZYX=" + doPreProcess3(DZYX)
				+ ",S_EXT_TIMESTAMP=sysdate"
				+ " WHERE RECID='" + doPreProcess(RECID) + "'";
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
		String sqlDelete = "DELETE FROM SW_LXRXX" + " WHERE RECID='"
				+ doPreProcess(RECID) + "'";
		int nRowCount = dbc.executeUpdate(sqlDelete);
		dbc.close();
		if (nRowCount > 0) {
			return true;
		} else
			return false;
	}

	public int getListCount(String sqlWhere) throws SQLException {
		DbConnection dbc = new DbConnection();
		String sqlCount = "SELECT COUNT(*) FROM SW_LXRXX";
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
		String sqlList = "SELECT * FROM SW_LXRXX";
		if (sqlWhere != null && sqlWhere.trim().compareTo("") != 0) {
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")) {
				sqlList += sqlWhere;
			} else {
				sqlList += " WHERE " + sqlWhere;
			}
		}
		ResultSet rsList = dbc.executeQuery(sqlList);
		while (rsList.next()) {
			SW_LXRXX bTable = new SW_LXRXX();
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
		String sqlList = "SELECT * FROM SW_LXRXX";
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
			SW_LXRXX bTable = new SW_LXRXX();
			bTable.doSetData(rsList);
			al.add(bTable);
		}
		rsList.close();
		dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException {
		DbConnection dbc = new DbConnection();
		String sqlArr = "SELECT * FROM SW_LXRXX" + " WHERE RECID='"
				+ doPreProcess(RECID) + "'";
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
