/**
 * 
 */
package com.macrosoft.icms.ggdj;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import org.apache.commons.lang.StringUtils;

import com.macrosoft.icms.dbc.DbConnection;
import com.macrosoft.icms.system.SysUtility;

/**
 * @author lihsh
 *
 */
public class GgdjBgMtb {
	// 主键
	private String id;
	// 单位名称
	private String entName;
	// 法人名称
	private String lerep;
	// 申请信息表ID
	private String sqxxId;
	// 业务主键
	private String openo;
	// 流程状态1受理2核准3归档4办结,
	private String processState;
	// 受理日期
	private String slDate;
	// 核准日期
	private String apprDate;
	// 受理机关
	private String accOrg;
	// 时间戳
	private Timestamp s_ext_timestamp;
	// 变更次数
	private String altTime;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEntName() {
		return entName;
	}

	public void setEntName(String entName) {
		this.entName = entName;
	}

	public String getLerep() {
		return lerep;
	}

	public void setLerep(String lerep) {
		this.lerep = lerep;
	}

	public String getSqxxId() {
		return sqxxId;
	}

	public void setSqxxId(String sqxxId) {
		this.sqxxId = sqxxId;
	}

	public String getOpeno() {
		return openo;
	}

	public void setOpeno(String openo) {
		this.openo = openo;
	}

	public Timestamp getS_ext_timestamp() {
		return s_ext_timestamp;
	}

	public void setS_ext_timestamp(Timestamp s_ext_timestamp) {
		this.s_ext_timestamp = s_ext_timestamp;
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

	public String getAltTime() {
		return altTime;
	}

	public void setAltTime(String altTime) {
		this.altTime = altTime;
	}

	/**
	 * 根据业务主键查询条数
	 * 
	 * @return
	 * @throws SQLException
	 */
	public boolean doCountByOpeno() throws SQLException {
		if (StringUtils.isEmpty(this.getOpeno())) {
			return false;
		} else {
			DbConnection dbc = new DbConnection();
			ResultSet rsCount;
			int nRowCount;
			String sql = "SELECT COUNT(*) FROM GGFB_BG_MTB WHERE OPENO = '" + this.getOpeno() + "'";
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

	/**
	 * 查询业务条数
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
			String sql = "SELECT COUNT(*) FROM GGFB_BG_MTB WHERE ID = '" + this.getId() + "'";
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

	/**
	 * 插入数据
	 * 
	 * @return
	 * @throws SQLException
	 */
	public boolean doInsert() throws SQLException {
		if (StringUtils.isEmpty(this.getId())) {
			return false;
		} else {
			StringBuffer sqlBuffer = new StringBuffer();
			sqlBuffer.append(" INSERT INTO GGFB_BG_MTB			");
			sqlBuffer.append(
					"   (ID, ENTNAME, LEREP, SQXXID, OPENO, S_EXT_TIMESTAMP,PROCESSSTATE,SLDATE,APPRDATE,ACCORG,ALTTIME)	");
			sqlBuffer.append(" VALUES					");
			sqlBuffer.append("   ('" + SysUtility.doPreProcess(this.getId()) + "', '"
					+ SysUtility.doPreProcess(this.getEntName()) + "', '" + SysUtility.doPreProcess(this.getLerep())
					+ "', '" + SysUtility.doPreProcess(this.getSqxxId()) + "', '"
					+ SysUtility.doPreProcess(this.getOpeno()) + "',CURRENT_TIMESTAMP(6),'"
					+ SysUtility.doPreProcess(this.getProcessState()) + "','"
					+ SysUtility.doPreProcess(this.getSlDate()) + "','" + SysUtility.doPreProcess(this.getApprDate())
					+ "','" + SysUtility.doPreProcess(this.getAccOrg()) + "','"
					+ SysUtility.doPreProcess(this.getAltTime()) + "' )			");

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
	 * 根据ID修改数据库中的数据
	 * 
	 * @return
	 * @throws SQLException
	 */
	public boolean doUpdate() throws SQLException {
		if (StringUtils.isEmpty(this.getId())) {
			return false;
		} else {
			StringBuffer sqlBuffer = new StringBuffer();
			sqlBuffer.append("UPDATE GGFB_BG_MTB SET ENTNAME = '" + SysUtility.doPreProcess(this.getEntName())
					+ "', LEREP = '" + SysUtility.doPreProcess(this.getLerep()) + "', ACCORG = " + "'"
					+ SysUtility.doPreProcess(this.getAccOrg()) + "'");
			if (!StringUtils.isEmpty(SysUtility.doPreProcess(this.getOpeno()))) {
				sqlBuffer.append(", OPENO = '" + SysUtility.doPreProcess(this.getOpeno()) + "'");
			}
			if (!StringUtils.isEmpty(SysUtility.doPreProcess(this.getSqxxId()))) {
				sqlBuffer.append(", SQXXID = '" + SysUtility.doPreProcess(this.getSqxxId()) + "'");
			}
			sqlBuffer.append(", S_EXT_TIMESTAMP = CURRENT_TIMESTAMP(6) ) ");
			sqlBuffer.append("WHERE ID = '" + this.getId() + "'");
			DbConnection dbc = new DbConnection();
			int nRowCount;
			String sql = sqlBuffer.toString();

			nRowCount = dbc.executeUpdate(sql);
			dbc.close();
			if (nRowCount > 0) // 修改数据成功
				return true;
			else
				return false;

		}
	}

	/**
	 * 根据业务主键加载数据
	 * 
	 * @throws SQLException
	 */
	public void loadDataByOpeno() throws SQLException {
		if (StringUtils.isEmpty(this.getOpeno())) {
			return;
		} else {
			String sql = "SELECT * FROM GGFB_BG_MTB WHERE OPENO = " + SysUtility.doPreProcess3(this.getOpeno());
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
		if (StringUtils.isEmpty(openo)) {
			this.setOpeno(rsSelect.getString("OPENO"));
		}
		this.setEntName(rsSelect.getString("ENTNAME"));
		this.setLerep(rsSelect.getString("LEREP"));
		this.setS_ext_timestamp(rsSelect.getTimestamp("S_EXT_TIMESTAMP"));
		this.setProcessState(rsSelect.getString("PROCESSSTATE"));
		this.setSlDate(rsSelect.getString("SLDATE"));
		this.setApprDate(rsSelect.getString("APPRDATE"));
		this.setAccOrg(rsSelect.getString("ACCORG"));
		this.setAltTime(rsSelect.getString("ALTTIME"));
        this.setSqxxId(rsSelect.getString("SQXXID"));
	}

}
