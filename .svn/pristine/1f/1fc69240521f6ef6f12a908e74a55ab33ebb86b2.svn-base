package com.macrosoft.icms.ggdj;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import org.apache.commons.lang.StringUtils;

import com.macrosoft.icms.dbc.DbConnection;
import com.macrosoft.icms.system.SysUtility;

public class GgdjZxxx {
	// 主键
	private String id;
	// 申请表主键
	private String sqxxId;
	// 注销原因
	private String canRea;
	// 流程状态
	private String processState;
	// 受理日期
	private String slDate;
	// 核准日期
	private String apprDate;
	// 受理机关
	private String accOrg;
	// 时间戳
	private Timestamp s_ext_timestamp;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSqxxId() {
		return sqxxId;
	}

	public void setSqxxId(String sqxxId) {
		this.sqxxId = sqxxId;
	}

	public String getCanRea() {
		return canRea;
	}

	public void setCanRea(String canRea) {
		this.canRea = canRea;
	}

	public String getProcessState() {
		return processState;
	}

	public void setProcessState(String processState) {
		this.processState = processState;
	}

	public String getSlDate() {
		return slDate;
	}

	public void setSlDate(String slDate) {
		this.slDate = slDate;
	}

	public String getApprDate() {
		return apprDate;
	}

	public void setApprDate(String apprDate) {
		this.apprDate = apprDate;
	}

	public String getAccOrg() {
		return accOrg;
	}

	public void setAccOrg(String accOrg) {
		this.accOrg = accOrg;
	}

	public Timestamp getS_ext_timestamp() {
		return s_ext_timestamp;
	}

	public void setS_ext_timestamp(Timestamp s_ext_timestamp) {
		this.s_ext_timestamp = s_ext_timestamp;
	}

	/**
	 * 数据插入
	 * 
	 * @return
	 * @throws SQLException
	 */
	public boolean doInsert() throws SQLException {
		if (StringUtils.isEmpty(this.getId())) {
			return false;
		} else {
			StringBuffer sqlBuffer = new StringBuffer();
			sqlBuffer.append(" INSERT INTO GGFB_ZXXX			");
			sqlBuffer.append("   (ID,					");
			sqlBuffer.append("    SQXXID,					");
			sqlBuffer.append("    CANREA,					");
			sqlBuffer.append("    PROCESSSTATE,				");
			sqlBuffer.append("    SLDATE,					");
			sqlBuffer.append("    APPRDATE,					");
			sqlBuffer.append("    ACCORG,					");
			sqlBuffer.append("    S_EXT_TIMESTAMP)				");
			sqlBuffer.append(" VALUES					");
			sqlBuffer.append("   ('" + SysUtility.doPreProcess(this.getId()) + "', '"
					+ SysUtility.doPreProcess(this.getSqxxId()) + "', '" + SysUtility.doPreProcess(this.getCanRea())
					+ "', '" + SysUtility.doPreProcess(this.getProcessState()) + "', '"
					+ SysUtility.doPreProcess(this.getSlDate()) + "', '" + SysUtility.doPreProcess(this.getApprDate())
					+ "', '" + SysUtility.doPreProcess(this.getAccOrg()) + "', CURRENT_TIMESTAMP(6))		");
			DbConnection dbc = new DbConnection();
			int nRowCount;
			String sql = sqlBuffer.toString();

			nRowCount = dbc.executeUpdate(sql);
			dbc.close();
			if (nRowCount > 0) // 插入成功
				return true;
			else
				return false;

		}
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
		} else {
			StringBuffer sqlBuffer = new StringBuffer();
			sqlBuffer.append(" UPDATE GGFB_ZXXX Z					");
			sqlBuffer.append(
					"    SET Z.SQXXID          = '" + SysUtility.doPreProcess(this.getSqxxId()) + "',			");
			sqlBuffer.append(
					"        Z.CANREA          = '" + SysUtility.doPreProcess(this.getCanRea()) + "',			");
			sqlBuffer.append(
					"        Z.PROCESSSTATE    = '" + SysUtility.doPreProcess(this.getProcessState()) + "',			");
			sqlBuffer.append(
					"        Z.SLDATE          = '" + SysUtility.doPreProcess(this.getSlDate()) + "',			");
			sqlBuffer.append(
					"        Z.APPRDATE        = '" + SysUtility.doPreProcess(this.getApprDate()) + "',			");
			sqlBuffer.append(
					"        Z.ACCORG          = '" + SysUtility.doPreProcess(this.getAccOrg()) + "',			");
			sqlBuffer.append("        Z.S_EXT_TIMESTAMP = CURRENT_TIMESTAMP(6) 	");
			sqlBuffer.append("  WHERE Z.ID = '" + this.getId() + "'					");
			DbConnection dbc = new DbConnection();
			ResultSet rsCount;
			int nRowCount;
			String sql = sqlBuffer.toString();
			nRowCount = dbc.executeUpdate(sql);
			dbc.close();
			if (nRowCount > 0) // 插入成功
				return true;
			else
				return false;
		}
	}

	/**
	 * 加载数据
	 * 
	 * @throws SQLException
	 */
	public void loadData() throws SQLException {
		if (StringUtils.isEmpty(this.getId())) {
			return;
		} else {
			String sql = "SELECT * FROM GGFB_ZXXX WHERE ID = '" + this.getId() + "'";
			DbConnection dbc = new DbConnection();
			ResultSet rsSelect;
			rsSelect = dbc.executeQuery(sql);
			if (rsSelect.next()) {
				this.setData(rsSelect);
			}
			dbc.close();
		}

	}

	/**
	 * 数据注入
	 * 
	 * @param rsSelect
	 * @throws SQLException
	 */
	private void setData(ResultSet rsSelect) throws SQLException {
		if (StringUtils.isEmpty(this.getId())) {
			this.setId(rsSelect.getString("ID"));
		}
		this.setSqxxId(rsSelect.getString("SQXXID"));
		this.setCanRea(rsSelect.getString("CANREA"));
		this.setProcessState(rsSelect.getString("PROCESSSTATE"));
		this.setSlDate(rsSelect.getString("SLDATE"));
		this.setApprDate(rsSelect.getString("APPRDATE"));
		this.setAccOrg(rsSelect.getString("ACCORG"));
		this.setS_ext_timestamp(rsSelect.getTimestamp("S_EXT_TIMESTAMP"));
	}
	
	/**
	 * 查询当前数据库中条数
	 * 
	 * @return
	 * @throws SQLException
	 */
	public boolean doCount() throws SQLException {
		if (StringUtils.isEmpty(this.getId())) {
			return false;
		} else {
			DbConnection dbc = new DbConnection();
			ResultSet rsCount;
			int nRowCount;
			String sql = "SELECT COUNT(*) FROM GGFB_ZXXX WHERE ID = '" + this.getId() + "'";
			rsCount = dbc.executeQuery(sql);
			rsCount.next();
			nRowCount = rsCount.getInt(1);
			dbc.close();
			if (nRowCount > 0) {
				return true;
			} else
				return false;
		}
	}
}
