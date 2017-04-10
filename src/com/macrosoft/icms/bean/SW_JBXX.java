package com.macrosoft.icms.bean;

import java.sql.*;
import java.util.*;
import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.*;
import com.macrosoft.icms.system.*;

public class SW_JBXX {
	String OPENO;
	String PRIPID;
	String NSRSBH;
	String PZSLJG;
	String PZSLZM;
	String ZCDLXDH;
	String SCJYDZ;
	String JYDYZBM;
	String JYDLXDH;
	String HSFS;
	int CYRS;
	int WJCYRS;
	String WZWZ;
	String SYKJZD;
	float ZRRTZBL;
	float WZTZBL;
	float GYTZBL;
	String ZJGMC;
	String ZJGSBH;
	String ZJGDZ;
	String ZJGYZBM;
	String ZJGJYFW;
	String ZJGFDDBR;
	String ZJGLXDH;
	String SCJX;
	String LSGX;
	String ZGGSSWJ;
	String ZGGSSWS;
	String ZGDSSWJ;
	String ZGDSSWS;
	String GGH;
	int FBS;
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

	public String getNSRSBH() {
		return doPreProcess(NSRSBH);
	}

	public void setNSRSBH(String NSRSBH) {
		this.NSRSBH = doPreProcess2(convertCode(NSRSBH));
	}

	public String getPZSLJG() {
		return doPreProcess(PZSLJG);
	}

	public void setPZSLJG(String PZSLJG) {
		this.PZSLJG = doPreProcess2(convertCode(PZSLJG));
	}

	public String getPZSLZM() {
		return doPreProcess(PZSLZM);
	}

	public void setPZSLZM(String PZSLZM) {
		this.PZSLZM = doPreProcess2(convertCode(PZSLZM));
	}

	public String getZCDLXDH() {
		return doPreProcess(ZCDLXDH);
	}

	public void setZCDLXDH(String ZCDLXDH) {
		this.ZCDLXDH = doPreProcess2(convertCode(ZCDLXDH));
	}

	public String getSCJYDZ() {
		return doPreProcess(SCJYDZ);
	}

	public void setSCJYDZ(String SCJYDZ) {
		this.SCJYDZ = doPreProcess2(convertCode(SCJYDZ));
	}

	public String getJYDYZBM() {
		return doPreProcess(JYDYZBM);
	}

	public void setJYDYZBM(String JYDYZBM) {
		this.JYDYZBM = doPreProcess2(convertCode(JYDYZBM));
	}

	public String getJYDLXDH() {
		return doPreProcess(JYDLXDH);
	}

	public void setJYDLXDH(String JYDLXDH) {
		this.JYDLXDH = doPreProcess2(convertCode(JYDLXDH));
	}

	public String getHSFS() {
		return doPreProcess(HSFS);
	}

	public void setHSFS(String HSFS) {
		this.HSFS = doPreProcess2(convertCode(HSFS));
	}

	public int getCYRS() {
		return CYRS;
	}

	public void setCYRS(int CYRS) {
		this.CYRS = CYRS;
	}

	public int getWJCYRS() {
		return WJCYRS;
	}

	public void setWJCYRS(int WJCYRS) {
		this.WJCYRS = WJCYRS;
	}

	public String getWZWZ() {
		return doPreProcess(WZWZ);
	}

	public void setWZWZ(String WZWZ) {
		this.WZWZ = doPreProcess2(convertCode(WZWZ));
	}

	public String getSYKJZD() {
		return doPreProcess(SYKJZD);
	}

	public void setSYKJZD(String SYKJZD) {
		this.SYKJZD = doPreProcess2(convertCode(SYKJZD));
	}

	public float getZRRTZBL() {
		return ZRRTZBL;
	}

	public void setZRRTZBL(float ZRRTZBL) {
		this.ZRRTZBL = ZRRTZBL;
	}

	public float getWZTZBL() {
		return WZTZBL;
	}

	public void setWZTZBL(float WZTZBL) {
		this.WZTZBL = WZTZBL;
	}

	public float getGYTZBL() {
		return GYTZBL;
	}

	public void setGYTZBL(float GYTZBL) {
		this.GYTZBL = GYTZBL;
	}

	public String getZJGMC() {
		return doPreProcess(ZJGMC);
	}

	public void setZJGMC(String ZJGMC) {
		this.ZJGMC = doPreProcess2(convertCode(ZJGMC));
	}

	public String getZJGSBH() {
		return doPreProcess(ZJGSBH);
	}

	public void setZJGSBH(String ZJGSBH) {
		this.ZJGSBH = doPreProcess2(convertCode(ZJGSBH));
	}

	public String getZJGDZ() {
		return doPreProcess(ZJGDZ);
	}

	public void setZJGDZ(String ZJGDZ) {
		this.ZJGDZ = doPreProcess2(convertCode(ZJGDZ));
	}

	public String getZJGYZBM() {
		return doPreProcess(ZJGYZBM);
	}

	public void setZJGYZBM(String ZJGYZBM) {
		this.ZJGYZBM = doPreProcess2(convertCode(ZJGYZBM));
	}

	public String getZJGJYFW() {
		return doPreProcess(ZJGJYFW);
	}

	public void setZJGJYFW(String ZJGJYFW) {
		this.ZJGJYFW = doPreProcess2(convertCode(ZJGJYFW));
	}

	public String getZJGFDDBR() {
		return doPreProcess(ZJGFDDBR);
	}

	public void setZJGFDDBR(String ZJGFDDBR) {
		this.ZJGFDDBR = doPreProcess2(convertCode(ZJGFDDBR));
	}

	public String getZJGLXDH() {
		return doPreProcess(ZJGLXDH);
	}

	public void setZJGLXDH(String ZJGLXDH) {
		this.ZJGLXDH = doPreProcess2(convertCode(ZJGLXDH));
	}

	public String getSCJX() {
		return doPreProcess(SCJX);
	}

	public void setSCJX(String SCJX) {
		this.SCJX = doPreProcess2(convertCode(SCJX));
	}

	public String getLSGX() {
		return doPreProcess(LSGX);
	}

	public void setLSGX(String LSGX) {
		this.LSGX = doPreProcess2(convertCode(LSGX));
	}

	public String getZGGSSWJ() {
		return doPreProcess(ZGGSSWJ);
	}

	public void setZGGSSWJ(String ZGGSSWJ) {
		this.ZGGSSWJ = doPreProcess2(convertCode(ZGGSSWJ));
	}

	public String getZGGSSWS() {
		return doPreProcess(ZGGSSWS);
	}

	public void setZGGSSWS(String ZGGSSWS) {
		this.ZGGSSWS = doPreProcess2(convertCode(ZGGSSWS));
	}

	public String getZGDSSWJ() {
		return doPreProcess(ZGDSSWJ);
	}

	public void setZGDSSWJ(String ZGDSSWJ) {
		this.ZGDSSWJ = doPreProcess2(convertCode(ZGDSSWJ));
	}

	public String getZGDSSWS() {
		return doPreProcess(ZGDSSWS);
	}

	public void setZGDSSWS(String ZGDSSWS) {
		this.ZGDSSWS = doPreProcess2(convertCode(ZGDSSWS));
	}

	public String getGGH() {
		return doPreProcess(GGH);
	}

	public void setGGH(String GGH) {
		this.GGH = doPreProcess2(convertCode(GGH));
	}

	public int getFBS() {
		return FBS;
	}

	public void setFBS(int FBS) {
		this.FBS = FBS;
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
		String sqlSelect = "SELECT * FROM SW_JBXX" + " WHERE OPENO='"
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
		NSRSBH = rsSelect.getString("NSRSBH");
		PZSLJG = rsSelect.getString("PZSLJG");
		PZSLZM = rsSelect.getString("PZSLZM");
		ZCDLXDH = rsSelect.getString("ZCDLXDH");
		SCJYDZ = rsSelect.getString("SCJYDZ");
		JYDYZBM = rsSelect.getString("JYDYZBM");
		JYDLXDH = rsSelect.getString("JYDLXDH");
		HSFS = rsSelect.getString("HSFS");
		CYRS = rsSelect.getInt("CYRS");
		WJCYRS = rsSelect.getInt("WJCYRS");
		WZWZ = rsSelect.getString("WZWZ");
		SYKJZD = rsSelect.getString("SYKJZD");
		ZRRTZBL = rsSelect.getFloat("ZRRTZBL");
		WZTZBL = rsSelect.getFloat("WZTZBL");
		GYTZBL = rsSelect.getFloat("GYTZBL");
		ZJGMC = rsSelect.getString("ZJGMC");
		ZJGSBH = rsSelect.getString("ZJGSBH");
		ZJGDZ = rsSelect.getString("ZJGDZ");
		ZJGYZBM = rsSelect.getString("ZJGYZBM");
		ZJGJYFW = rsSelect.getString("ZJGJYFW");
		ZJGFDDBR = rsSelect.getString("ZJGFDDBR");
		ZJGLXDH = rsSelect.getString("ZJGLXDH");
		SCJX = rsSelect.getString("SCJX");
		LSGX = rsSelect.getString("LSGX");
		ZGGSSWJ = rsSelect.getString("ZGGSSWJ");
		ZGGSSWS = rsSelect.getString("ZGGSSWS");
		ZGDSSWJ = rsSelect.getString("ZGDSSWJ");
		ZGDSSWS = rsSelect.getString("ZGDSSWS");
		GGH = rsSelect.getString("GGH");
		FBS = rsSelect.getInt("FBS");
		S_EXT_TIMESTAMP = rsSelect.getString("S_EXT_TIMESTAMP");
	}

	public boolean doAdd() throws SQLException {
		DbConnection dbc = new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd = "INSERT INTO SW_JBXX(OPENO,PRIPID,NSRSBH,PZSLJG,PZSLZM,ZCDLXDH,SCJYDZ,JYDYZBM,JYDLXDH,HSFS,CYRS,WJCYRS,WZWZ,SYKJZD,ZRRTZBL,WZTZBL,GYTZBL,ZJGMC,ZJGSBH,ZJGDZ,ZJGYZBM,ZJGJYFW,ZJGFDDBR,ZJGLXDH,SCJX,LSGX,ZGGSSWJ,ZGGSSWS,ZGDSSWJ,ZGDSSWS,GGH,FBS,S_EXT_TIMESTAMP) VALUES("
				+ doPreProcess3(OPENO)
				+ ","
				+ doPreProcess3(PRIPID)
				+ ","
				+ doPreProcess3(NSRSBH)
				+ ","
				+ doPreProcess3(PZSLJG)
				+ ","
				+ doPreProcess3(PZSLZM)
				+ ","
				+ doPreProcess3(ZCDLXDH)
				+ ","
				+ doPreProcess3(SCJYDZ)
				+ ","
				+ doPreProcess3(JYDYZBM)
				+ ","
				+ doPreProcess3(JYDLXDH)
				+ ","
				+ doPreProcess3(HSFS)
				+ ","
				+ CYRS
				+ ","
				+ WJCYRS
				+ ","
				+ doPreProcess3(WZWZ)
				+ ","
				+ doPreProcess3(SYKJZD)
				+ ","
				+ ZRRTZBL
				+ ","
				+ WZTZBL
				+ ","
				+ GYTZBL
				+ ","
				+ doPreProcess3(ZJGMC)
				+ ","
				+ doPreProcess3(ZJGSBH)
				+ ","
				+ doPreProcess3(ZJGDZ)
				+ ","
				+ doPreProcess3(ZJGYZBM)
				+ ","
				+ doPreProcess3(ZJGJYFW)
				+ ","
				+ doPreProcess3(ZJGFDDBR)
				+ ","
				+ doPreProcess3(ZJGLXDH)
				+ ","
				+ doPreProcess3(SCJX)
				+ ","
				+ doPreProcess3(LSGX)
				+ ","
				+ doPreProcess3(ZGGSSWJ)
				+ ","
				+ doPreProcess3(ZGGSSWS)
				+ ","
				+ doPreProcess3(ZGDSSWJ)
				+ ","
				+ doPreProcess3(ZGDSSWS)
				+ ","
				+ doPreProcess3(GGH)
				+ ","
				+ FBS
				+ ",sysdate )";
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
		String sqlCount = "SELECT COUNT(*) FROM SW_JBXX" + " WHERE OPENO='"
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
		String sqlModify = "UPDATE SW_JBXX SET OPENO=" + doPreProcess3(OPENO)
				+ ",PRIPID=" + doPreProcess3(PRIPID) + ",NSRSBH="
				+ doPreProcess3(NSRSBH) + ",PZSLJG=" + doPreProcess3(PZSLJG)
				+ ",PZSLZM=" + doPreProcess3(PZSLZM) + ",ZCDLXDH="
				+ doPreProcess3(ZCDLXDH) + ",SCJYDZ=" + doPreProcess3(SCJYDZ)
				+ ",JYDYZBM=" + doPreProcess3(JYDYZBM) + ",JYDLXDH="
				+ doPreProcess3(JYDLXDH) + ",HSFS=" + doPreProcess3(HSFS)
				+ ",CYRS=" + CYRS + ",WJCYRS=" + WJCYRS + ",WZWZ="
				+ doPreProcess3(WZWZ) + ",SYKJZD=" + doPreProcess3(SYKJZD)
				+ ",ZRRTZBL=" + ZRRTZBL + ",WZTZBL=" + WZTZBL + ",GYTZBL="
				+ GYTZBL + ",ZJGMC=" + doPreProcess3(ZJGMC) + ",ZJGSBH="
				+ doPreProcess3(ZJGSBH) + ",ZJGDZ=" + doPreProcess3(ZJGDZ)
				+ ",ZJGYZBM=" + doPreProcess3(ZJGYZBM) + ",ZJGJYFW="
				+ doPreProcess3(ZJGJYFW) + ",ZJGFDDBR="
				+ doPreProcess3(ZJGFDDBR) + ",ZJGLXDH="
				+ doPreProcess3(ZJGLXDH) + ",SCJX=" + doPreProcess3(SCJX)
				+ ",LSGX=" + doPreProcess3(LSGX) + ",ZGGSSWJ="
				+ doPreProcess3(ZGGSSWJ) + ",ZGGSSWS=" + doPreProcess3(ZGGSSWS)
				+ ",ZGDSSWJ=" + doPreProcess3(ZGDSSWJ) + ",ZGDSSWS="
				+ doPreProcess3(ZGDSSWS) + ",GGH=" + doPreProcess3(GGH)
				+ ",FBS=" + FBS + ",S_EXT_TIMESTAMP=sysdate" + " WHERE OPENO='"
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
		String sqlDelete = "DELETE FROM SW_JBXX" + " WHERE OPENO='"
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
		String sqlCount = "SELECT COUNT(*) FROM SW_JBXX";
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
		String sqlList = "SELECT * FROM SW_JBXX";
		if (sqlWhere != null && sqlWhere.trim().compareTo("") != 0) {
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")) {
				sqlList += sqlWhere;
			} else {
				sqlList += " WHERE " + sqlWhere;
			}
		}
		ResultSet rsList = dbc.executeQuery(sqlList);
		while (rsList.next()) {
			SW_JBXX bTable = new SW_JBXX();
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
		String sqlList = "SELECT * FROM SW_JBXX";
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
			SW_JBXX bTable = new SW_JBXX();
			bTable.doSetData(rsList);
			al.add(bTable);
		}
		rsList.close();
		dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException {
		DbConnection dbc = new DbConnection();
		String sqlArr = "SELECT * FROM SW_JBXX" + " WHERE OPENO='"
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
