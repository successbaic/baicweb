package com.macrosoft.icms.bean;

import java.sql.*;
import java.util.*;
import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.*;
import com.macrosoft.icms.system.*;

public class ZJ_ZZJGJBXX {
	String OPENO;
	String PRIPID;
	String XWBZ;
	String SBZT;
	String DMZH;
	String SFFK;
	int ZBSL;
	int FBSL;
	int ZGRS;
	String YXQZ;
	String ZGBMDM;
	String ZGBMMC;
	String ZYCP;
	String SFSM;
	String SMXM;
	String LXDH;
	String HYML94;
	String HYDM94;
	String HYML02;
	String HYDM02;
	String S_EXT_TIMESTAMP;

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

	public String getXWBZ() {
		return doPreProcess(XWBZ);
	}

	public void setXWBZ(String XWBZ) {
		this.XWBZ = doPreProcess2(convertCode(XWBZ));
	}

	public String getSBZT() {
		return doPreProcess(SBZT);
	}

	public void setSBZT(String SBZT) {
		this.SBZT = doPreProcess2(convertCode(SBZT));
	}

	public String getDMZH() {
		return doPreProcess(DMZH);
	}

	public void setDMZH(String DMZH) {
		this.DMZH = doPreProcess2(convertCode(DMZH));
	}

	public String getSFFK() {
		return doPreProcess(SFFK);
	}

	public void setSFFK(String SFFK) {
		this.SFFK = doPreProcess2(convertCode(SFFK));
	}

	public int getZBSL() {
		return ZBSL;
	}

	public void setZBSL(int ZBSL) {
		this.ZBSL = ZBSL;
	}

	public int getFBSL() {
		return FBSL;
	}

	public void setFBSL(int FBSL) {
		this.FBSL = FBSL;
	}

	public int getZGRS() {
		return ZGRS;
	}

	public void setZGRS(int ZGRS) {
		this.ZGRS = ZGRS;
	}

	public String getYXQZ() {
		return doPreProcess(YXQZ);
	}

	public void setYXQZ(String YXQZ) {
		this.YXQZ = doPreProcess2(convertCode(YXQZ));
	}

	public String getZGBMDM() {
		return doPreProcess(ZGBMDM);
	}

	public void setZGBMDM(String ZGBMDM) {
		this.ZGBMDM = doPreProcess2(convertCode(ZGBMDM));
	}

	public String getZGBMMC() {
		return doPreProcess(ZGBMMC);
	}

	public void setZGBMMC(String ZGBMMC) {
		this.ZGBMMC = doPreProcess2(convertCode(ZGBMMC));
	}

	public String getZYCP() {
		return doPreProcess(ZYCP);
	}

	public void setZYCP(String ZYCP) {
		this.ZYCP = doPreProcess2(convertCode(ZYCP));
	}

	public String getSFSM() {
		return doPreProcess(SFSM);
	}

	public void setSFSM(String SFSM) {
		this.SFSM = doPreProcess2(convertCode(SFSM));
	}

	public String getSMXM() {
		return doPreProcess(SMXM);
	}

	public void setSMXM(String SMXM) {
		this.SMXM = doPreProcess2(convertCode(SMXM));
	}

	public String getLXDH() {
		return doPreProcess(LXDH);
	}

	public void setLXDH(String LXDH) {
		this.LXDH = doPreProcess2(convertCode(LXDH));
	}

	public String getHYML94() {
		return doPreProcess(HYML94);
	}

	public void setHYML94(String HYML94) {
		this.HYML94 = doPreProcess2(convertCode(HYML94));
	}

	public String getHYDM94() {
		return doPreProcess(HYDM94);
	}

	public void setHYDM94(String HYDM94) {
		this.HYDM94 = doPreProcess2(convertCode(HYDM94));
	}

	public String getHYML02() {
		return doPreProcess(HYML02);
	}

	public void setHYML02(String HYML02) {
		this.HYML02 = doPreProcess2(convertCode(HYML02));
	}

	public String getHYDM02() {
		return doPreProcess(HYDM02);
	}

	public void setHYDM02(String HYDM02) {
		this.HYDM02 = doPreProcess2(convertCode(HYDM02));
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
		String sqlSelect = "SELECT * FROM ZJ_ZZJGJBXX" + " WHERE OPENO='"
				+ doPreProcess(OPENO) + "'";
		rsSelect = dbc.executeQuery(sqlSelect);
		if (rsSelect.next()) {
			doSetData(rsSelect);
		}
		dbc.close();
	}

	public void doSetData(ResultSet rsSelect) throws SQLException {
		OPENO = rsSelect.getString("OPENO");
		PRIPID = rsSelect.getString("PRIPID");
		XWBZ = rsSelect.getString("XWBZ");
		SBZT = rsSelect.getString("SBZT");
		DMZH = rsSelect.getString("DMZH");
		SFFK = rsSelect.getString("SFFK");
		ZBSL = rsSelect.getInt("ZBSL");
		FBSL = rsSelect.getInt("FBSL");
		ZGRS = rsSelect.getInt("ZGRS");
		YXQZ = String.valueOf(rsSelect.getDate("YXQZ"));
		ZGBMDM = rsSelect.getString("ZGBMDM");
		ZGBMMC = rsSelect.getString("ZGBMMC");
		ZYCP = rsSelect.getString("ZYCP");
		SFSM = rsSelect.getString("SFSM");
		SMXM = rsSelect.getString("SMXM");
		LXDH = rsSelect.getString("LXDH");
		HYML94 = rsSelect.getString("HYML94");
		HYDM94 = rsSelect.getString("HYDM94");
		HYML02 = rsSelect.getString("HYML02");
		HYDM02 = rsSelect.getString("HYDM02");
		S_EXT_TIMESTAMP = rsSelect.getString("S_EXT_TIMESTAMP");
	}

	public boolean doAdd() throws SQLException {
		DbConnection dbc = new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd = "INSERT INTO ZJ_ZZJGJBXX(OPENO,PRIPID,XWBZ,SBZT,DMZH,SFFK,ZBSL,FBSL,ZGRS,YXQZ,ZGBMDM,ZGBMMC,ZYCP,SFSM,SMXM,LXDH,HYML94,HYDM94,HYML02,HYDM02,S_EXT_TIMESTAMP) VALUES("
				+ doPreProcess3(OPENO)
				+ ","
				+ doPreProcess3(PRIPID)
				+ ","
				+ doPreProcess3(XWBZ)
				+ ","
				+ doPreProcess3(SBZT)
				+ ","
				+ doPreProcess3(DMZH)
				+ ","
				+ doPreProcess3(SFFK)
				+ ","
				+ ZBSL
				+ ","
				+ FBSL
				+ ","
				+ ZGRS
				+ ",to_date("
				+ doPreProcess3(YXQZ)
				+ ",'yyyy-mm-dd'),"
				+ doPreProcess3(ZGBMDM)
				+ ","
				+ doPreProcess3(ZGBMMC)
				+ ","
				+ doPreProcess3(ZYCP)
				+ ","
				+ doPreProcess3(SFSM)
				+ ","
				+ doPreProcess3(SMXM)
				+ ","
				+ doPreProcess3(LXDH)
				+ ","
				+ doPreProcess3(HYML94)
				+ ","
				+ doPreProcess3(HYDM94)
				+ ","
				+ doPreProcess3(HYML02)
				+ ","
				+ doPreProcess3(HYDM02) + ",sysdate)";
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
		String sqlCount = "SELECT COUNT(*) FROM ZJ_ZZJGJBXX" + " WHERE OPENO='"
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
		String sqlModify = "UPDATE ZJ_ZZJGJBXX SET OPENO="
				+ doPreProcess3(OPENO) + ",PRIPID=" + doPreProcess3(PRIPID)
				+ ",XWBZ=" + doPreProcess3(XWBZ) + ",SBZT="
				+ doPreProcess3(SBZT) + ",DMZH=" + doPreProcess3(DMZH)
				+ ",SFFK=" + doPreProcess3(SFFK) + ",ZBSL=" + ZBSL + ",FBSL="
				+ FBSL + ",ZGRS=" + ZGRS + ",YXQZ=to_date("
				+ doPreProcess3(YXQZ) + ",'yyyy-mm-dd'),ZGBMDM="
				+ doPreProcess3(ZGBMDM) + ",ZGBMMC=" + doPreProcess3(ZGBMMC)
				+ ",ZYCP=" + doPreProcess3(ZYCP) + ",SFSM="
				+ doPreProcess3(SFSM) + ",SMXM=" + doPreProcess3(SMXM)
				+ ",LXDH=" + doPreProcess3(LXDH) + ",HYML94="
				+ doPreProcess3(HYML94) + ",HYDM94=" + doPreProcess3(HYDM94)
				+ ",HYML02=" + doPreProcess3(HYML02) + ",HYDM02="
				+ doPreProcess3(HYDM02) + ",S_EXT_TIMESTAMP="
				+ "sysdate" + " WHERE OPENO='"
				+ doPreProcess(OPENO) + "'";
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
		String sqlDelete = "DELETE FROM ZJ_ZZJGJBXX" + " WHERE OPENO='"
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
		String sqlCount = "SELECT COUNT(*) FROM ZJ_ZZJGJBXX";
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
		String sqlList = "SELECT * FROM ZJ_ZZJGJBXX";
		if (sqlWhere != null && sqlWhere.trim().compareTo("") != 0) {
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")) {
				sqlList += sqlWhere;
			} else {
				sqlList += " WHERE " + sqlWhere;
			}
		}
		ResultSet rsList = dbc.executeQuery(sqlList);
		while (rsList.next()) {
			ZJ_ZZJGJBXX bTable = new ZJ_ZZJGJBXX();
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
		String sqlList = "SELECT * FROM ZJ_ZZJGJBXX";
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
			ZJ_ZZJGJBXX bTable = new ZJ_ZZJGJBXX();
			bTable.doSetData(rsList);
			al.add(bTable);
		}
		rsList.close();
		dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException {
		DbConnection dbc = new DbConnection();
		String sqlArr = "SELECT * FROM ZJ_ZZJGJBXX" + " WHERE OPENO='"
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
