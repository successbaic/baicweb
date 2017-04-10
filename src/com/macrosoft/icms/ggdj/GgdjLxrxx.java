package com.macrosoft.icms.ggdj;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.lang.StringUtils;

import com.macrosoft.icms.dbc.DBConnectionManager;
import com.macrosoft.icms.dbc.DbConnection;
import com.macrosoft.icms.system.SysUtility;
import com.sun.org.apache.bcel.internal.generic.DDIV;

/**
 * 申请人信息
 * 
 * @author lihsh
 *
 */
public class GgdjLxrxx {
	// 主键
	private String id;
	// 业务表ID
	private String openo;
	// 单位名称
	private String comName;
	// 申请日期
	private String appTime;
	// 联系人
	private String linkMan;
	// 联系方式
	private String linkType;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOpeno() {
		return openo;
	}

	public void setOpeno(String openo) {
		this.openo = openo;
	}

	public String getComName() {
		return comName;
	}

	public void setComName(String comName) {
		this.comName = comName;
	}

	public String getAppTime() {
		return appTime;
	}

	public void setAppTime(String appTime) {
		this.appTime = appTime;
	}

	public String getLinkMan() {
		return linkMan;
	}

	public void setLinkMan(String linkMan) {
		this.linkMan = linkMan;
	}

	public String getLinkType() {
		return linkType;
	}

	public void setLinkType(String linkType) {
		this.linkType = linkType;
	}

	/**
	 * 查询当前数据库是否已有数据
	 * 
	 * @return
	 * @throws SQLException
	 */
	public boolean doCount() throws SQLException {
		if (StringUtils.isEmpty(this.getOpeno())) {
			return false;
		}

		String sql = "SELECT COUNT(*) FROM GGFB_LXRXX WHERE YWID = " + SysUtility.doPreProcess3(this.getOpeno());
		DbConnection dbc = new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		rsCount = dbc.executeQuery(sql);
		if (rsCount.next()) {
			nRowCount = rsCount.getInt(1);
			dbc.close();
			if (nRowCount > 0) {
				return true;
			}
		}
		dbc.close();
		return false;
	}

	/**
	 * 插入数据
	 * 
	 * @return
	 * @throws SQLException
	 */
	public boolean doInsert() throws SQLException {
		if (StringUtils.isEmpty(this.getId())) {
			return false;
		}

		StringBuffer sqlBuffer = new StringBuffer();
		sqlBuffer.append(" INSERT INTO GGFB_LXRXX			");
		sqlBuffer.append("   (ID, YWID, DWMC, SQRQ, NAME, LXFS)	");
		sqlBuffer.append(" VALUES					");
		sqlBuffer.append("   (" + SysUtility.doPreProcess3(this.getId()) + ", "
				+ SysUtility.doPreProcess3(this.getOpeno()) + ", " + SysUtility.doPreProcess3(this.getComName()) + ", "
				+ SysUtility.doPreProcess3(this.getAppTime()) + ", " + SysUtility.doPreProcess3(this.getLinkMan())
				+ ", " + SysUtility.doPreProcess3(this.getLinkType()) + ")			");
		DbConnection dbc = new DbConnection();
		int nRowCount;
		String sql = sqlBuffer.toString();
		nRowCount = dbc.executeUpdate(sql);
		dbc.close();
		if (nRowCount > 0) {
			return true;
		}

		return false;
	}

	/**
	 * 数据修改
	 * 
	 * @return
	 * @throws SQLException
	 */
	public boolean doUpdate() throws SQLException {
		if (StringUtils.isEmpty(this.getId())) {
			return false;
		}

		StringBuffer sqlBuffer = new StringBuffer();
		sqlBuffer.append(" UPDATE GGFB_LXRXX L							");
		sqlBuffer.append("    SET L.DWMC = " + SysUtility.doPreProcess3(this.getComName()) + ", L.SQRQ = "
				+ SysUtility.doPreProcess3(this.getAppTime()) + ", L.NAME = "
				+ SysUtility.doPreProcess3(this.getLinkMan()) + ", L.LXFS = "
				+ SysUtility.doPreProcess3(this.getLinkType()));
		sqlBuffer.append("  WHERE ID = " + SysUtility.doPreProcess3(this.getId()) + "						");
		DbConnection dbc = new DbConnection();
		int nRowCount;
		String sql = sqlBuffer.toString();
		nRowCount = dbc.executeUpdate(sql);
		dbc.close();
		if (nRowCount > 0) {
			return true;
		}

		return false;
	}

	/**
	 * 加载数据
	 * 
	 * @throws SQLException
	 */
	public void loadDataByOpeno() throws SQLException {
		if (StringUtils.isEmpty(this.getOpeno())) {
			return;
		}

		String sql = "SELECT * FROM GGFB_LXRXX WHERE YWID = " + SysUtility.doPreProcess3(this.getOpeno());
		DbConnection dbc = new DbConnection();
		ResultSet rSelect = dbc.executeQuery(sql);
		if (rSelect.next()) {
			this.setData(rSelect);
		}
		dbc.close();
	}
	/**
	 * 数据注入
	 * @param rSelect
	 * @throws SQLException
	 */
	private void setData(ResultSet rSelect) throws SQLException {
		this.setId(SysUtility.doPreProcess(rSelect.getString("ID")));
		this.setOpeno(SysUtility.doPreProcess(rSelect.getString("YWID")));
		this.setComName(SysUtility.doPreProcess(rSelect.getString("DWMC")));
		this.setAppTime(SysUtility.doPreProcess(rSelect.getString("SQRQ")));
		this.setLinkMan(SysUtility.doPreProcess(rSelect.getString("NAME")));
		this.setLinkType(SysUtility.doPreProcess(rSelect.getString("LXFS")));
	}

}
