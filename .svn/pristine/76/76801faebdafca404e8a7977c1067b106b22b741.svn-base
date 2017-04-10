package com.macrosoft.icms.mcgl;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import com.macrosoft.icms.dbc.DbConnection;
import com.macrosoft.icms.system.SysUtility;

public class QYLXDESC {
	String PRIPID;
	String CODE;
	String CONTENT;
	String DESCRIPTION;
	String CZRS;
	String BZ;
	String REMARK;

	public String getPRIPID() {
		return doPreProcess(PRIPID);
	}

	public void setPRIPID(String PRIPID) {
		this.PRIPID = doPreProcess2(convertCode(PRIPID));
	}

	public String getCODE() {
		return doPreProcess(CODE);
	}

	public void setCODE(String CODE) {
		this.CODE = doPreProcess2(convertCode(CODE));
	}

	public String getCONTENT() {
		return doPreProcess(CONTENT);
	}

	public void setCONTENT(String CONTENT) {
		this.CONTENT = doPreProcess2(convertCode(CONTENT));
	}

	public String getDESCRIPTION() {
		return doPreProcess(DESCRIPTION);
	}

	public void setDESCRIPTION(String DESCRIPTION) {
		this.DESCRIPTION = doPreProcess2(convertCode(DESCRIPTION));
	}

	public String getCZRS() {
		return doPreProcess(CZRS);
	}

	public void setCZRS(String CZRS) {
		this.CZRS = doPreProcess2(convertCode(CZRS));
	}

	public String getBZ() {
		return doPreProcess(BZ);
	}

	public void setBZ(String BZ) {
		this.BZ = doPreProcess2(convertCode(BZ));
	}

	public String getREMARK() {
		return doPreProcess(REMARK);
	}

	public void setREMARK(String REMARK) {
		this.REMARK = doPreProcess2(convertCode(REMARK));
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
		String sqlSelect = "SELECT * FROM QYLXDESC" + " WHERE PRIPID='"
				+ doPreProcess(PRIPID) + "'";
		rsSelect = dbc.executeQuery(sqlSelect);
		if (rsSelect.next()) {
			doSetData(rsSelect);
		}
		dbc.close();
	}

	public void doSetData(ResultSet rsSelect) throws SQLException {
		PRIPID = rsSelect.getString("PRIPID");
		CODE = rsSelect.getString("CODE");
		CONTENT = rsSelect.getString("CONTENT");
		DESCRIPTION = rsSelect.getString("DESCRIPTION");
		CZRS = rsSelect.getString("CZRS");
		BZ = rsSelect.getString("BZ");
		REMARK = rsSelect.getString("REMARK");
	}

	public boolean doAdd() throws SQLException {
		DbConnection dbc = new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd = "INSERT INTO QYLXDESC(PRIPID,CODE,CONTENT,DESCRIPTION,CZRS,BZ,REMARK) VALUES("
				+ doPreProcess3(PRIPID)
				+ ","
				+ doPreProcess3(CODE)
				+ ","
				+ doPreProcess3(CONTENT)
				+ ","
				+ doPreProcess3(DESCRIPTION)
				+ ","
				+ doPreProcess3(CZRS)
				+ ","
				+ doPreProcess3(BZ)
				+ ","
				+ doPreProcess3(REMARK) + ")";
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
		String sqlCount = "SELECT COUNT(*) FROM QYLXDESC" + " WHERE PRIPID='"
				+ doPreProcess(PRIPID) + "'";
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
		String sqlModify = "UPDATE QYLXDESC SET PRIPID="
				+ doPreProcess3(PRIPID) + ",CODE=" + doPreProcess3(CODE)
				+ ",CONTENT=" + doPreProcess3(CONTENT) + ",DESCRIPTION="
				+ doPreProcess3(DESCRIPTION) + ",CZRS=" + doPreProcess3(CZRS)
				+ ",BZ=" + doPreProcess3(BZ) + ",REMARK="
				+ doPreProcess3(REMARK) + "" + " WHERE PRIPID='"
				+ doPreProcess(PRIPID) + "'";
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
		String sqlDelete = "DELETE FROM QYLXDESC" + " WHERE PRIPID='"
				+ doPreProcess(PRIPID) + "'";
		int nRowCount = dbc.executeUpdate(sqlDelete);
		dbc.close();
		if (nRowCount > 0) {
			return true;
		} else
			return false;
	}

	public int getListCount(String sqlWhere) throws SQLException {
		DbConnection dbc = new DbConnection();
		String sqlCount = "SELECT COUNT(*) FROM QYLXDESC";
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

	public ArrayList<QYLXDESC> getList(String sqlWhere) throws SQLException {
		DbConnection dbc = new DbConnection();
		ArrayList<QYLXDESC> al = new ArrayList<QYLXDESC>();
		String sqlList = "SELECT * FROM QYLXDESC";
		if (sqlWhere != null && sqlWhere.trim().compareTo("") != 0) {
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")) {
				sqlList += sqlWhere;
			} else {
				sqlList += " WHERE " + sqlWhere;
			}
		}
		ResultSet rsList = dbc.executeQuery(sqlList);
		while (rsList.next()) {
			QYLXDESC bTable = new QYLXDESC();
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

	public ArrayList<QYLXDESC> getList(String sqlWhere, String startRow)
			throws SQLException {
		if (SysUtility.isNumeric(startRow))
			return getList(sqlWhere, Integer.parseInt(startRow), 10);
		else
			return getList(sqlWhere, 0, 10);
	}

	public ArrayList<QYLXDESC> getList(String sqlWhere, String startRow, int PageSize)
			throws SQLException {
		if (SysUtility.isNumeric(startRow))
			return getList(sqlWhere, Integer.parseInt(startRow), PageSize);
		else
			return getList(sqlWhere, 0, PageSize);
	}

	public ArrayList<QYLXDESC> getList(String sqlWhere, int startRow) throws SQLException {
		return getList(sqlWhere, startRow, 10);
	}

	// //////reload function getlist
	public ArrayList<QYLXDESC> getList(String sqlWhere, int startRow, int PageSize)
			throws SQLException {
		DbConnection dbc = new DbConnection();
		ArrayList<QYLXDESC> al = new ArrayList<QYLXDESC>();
		String sqlList = "SELECT * FROM QYLXDESC";
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
			QYLXDESC bTable = new QYLXDESC();
			bTable.doSetData(rsList);
			al.add(bTable);
		}
		rsList.close();
		dbc.close();
		return al;

	}

	public ArrayList<String[]> getData() throws SQLException {
		DbConnection dbc = new DbConnection();
		String sqlArr = "SELECT * FROM QYLXDESC" + " WHERE PRIPID='"
				+ doPreProcess(PRIPID) + "'";
		ResultSet rsArr = dbc.executeQuery(sqlArr);
		ArrayList<String[]> al = new ArrayList<String[]>();
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
