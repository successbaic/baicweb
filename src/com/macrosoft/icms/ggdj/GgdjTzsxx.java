package com.macrosoft.icms.ggdj;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.lang.StringUtils;

import com.macrosoft.icms.dbc.DbConnection;
import com.macrosoft.icms.system.SysUtility;

public class GgdjTzsxx {
	// 主键
	private String id;
	// 业务主键
	private String openo;
	// 审核意见
	private String opinion;
	// 提交地址
	private String subAddr;
	// 审核日期
	private String apprDate;
	// 审核人
	private String apprPer;

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

	public String getOpinion() {
		return opinion;
	}

	public void setOpinion(String opinion) {
		this.opinion = opinion;
	}

	public String getSubAddr() {
		return subAddr;
	}

	public void setSubAddr(String subAddr) {
		this.subAddr = subAddr;
	}

	public String getApprDate() {
		return apprDate;
	}

	public void setApprDate(String apprDate) {
		this.apprDate = apprDate;
	}

	public String getApprPer() {
		return apprPer;
	}

	public void setApprPer(String apprPer) {
		this.apprPer = apprPer;
	}

	/**
	 * 通过业务主键加载数据
	 * @throws SQLException 
	 */
	public void loadDataByOpeno() throws SQLException {
		if (StringUtils.isEmpty(this.getOpeno())) {
			return;
		}
		String sql = "SELECT * FROM GGFB_TZSXX WHERE OPENO = " + SysUtility.doPreProcess3(this.getOpeno());
		DbConnection dbc = new DbConnection();
		ResultSet rSelect = dbc.executeQuery(sql) ;
		if(rSelect.next()) {
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
		this.setOpeno(SysUtility.doPreProcess(rSelect.getString("OPENO")));
		this.setOpinion(SysUtility.doPreProcess(rSelect.getString("OPINION")));
		this.setSubAddr(SysUtility.doPreProcess(rSelect.getString("SUB_ADDR")));
		this.setApprDate(SysUtility.doPreProcess(rSelect.getString("APPR_DATE")));
		this.setApprPer(SysUtility.doPreProcess(rSelect.getString("APPR_PER")));
		
	}

}
