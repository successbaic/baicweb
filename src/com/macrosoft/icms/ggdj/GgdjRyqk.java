package com.macrosoft.icms.ggdj;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.lang.StringUtils;

import com.macrosoft.icms.dbc.DbConnection;
import com.macrosoft.icms.system.SysUtility;

public class GgdjRyqk {
	// 主键
	private String id;
	// 姓名
	private String name;
	// 人员类型
	private String personType;
	// 证件类型
	private String cerType;
	// 证件号码
	private String cerno;
	// 主表id
	private String sqxxid;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPersonType() {
		return personType;
	}

	public void setPersonType(String personType) {
		this.personType = personType;
	}

	public String getCerType() {
		return cerType;
	}

	public void setCerType(String cerType) {
		this.cerType = cerType;
	}

	public String getCerno() {
		return cerno;
	}

	public void setCerno(String cerno) {
		this.cerno = cerno;
	}

	public String getSqxxid() {
		return sqxxid;
	}

	public void setSqxxid(String sqxxid) {
		this.sqxxid = sqxxid;
	}

	/**
	 * 数据插入
	 * 
	 * @return
	 * @throws SQLException
	 */
	public boolean doInsert() throws SQLException {

		if (StringUtils.isEmpty(this.getSqxxid())) {// 主表ID为不能为空
			return false;
		} else {
			DbConnection dbc = new DbConnection();
			int nRowCount;
			StringBuffer sqlBuffer = new StringBuffer();
			sqlBuffer.append("  insert into GGFB_RYQK					");
			sqlBuffer.append("    (ID, NAME, PERSONTYPE, CERTYPE, CERNO, SQXXID)		");
			sqlBuffer.append("  values							");
			sqlBuffer.append("    ('" + SysUtility.doPreProcess(this.getId()) + "', '"
					+ SysUtility.doPreProcess(this.getName()) + "', '" + SysUtility.doPreProcess(this.getPersonType())
					+ "', '" + SysUtility.doPreProcess(this.getCerType()) + "', '"
					+ SysUtility.doPreProcess(this.getCerno()) + "', '" + this.getSqxxid() + "')					");
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
			DbConnection dbc = new DbConnection();
			ResultSet rsSelect;
			String sqlSelect = "SELECT * FROM GGFB_RYQK" + " WHERE ID ='" + this.getId() + "'";
			rsSelect = dbc.executeQuery(sqlSelect);
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
		this.setName(rsSelect.getString("NAME"));
		this.setPersonType(rsSelect.getString("PERSONTYPE"));
		this.setCerType(rsSelect.getString("CERTYPE"));
		this.setCerno(rsSelect.getString("CERNO"));
		this.setSqxxid(rsSelect.getString("SQXXID"));

	}

	/**
	 * 根据主表ID查询数据
	 * 
	 * @return
	 * @throws SQLException
	 */
	public List<Map> queryDataByMtbId() throws SQLException {
		List list = new ArrayList<Map>();
		if (StringUtils.isEmpty(this.getSqxxid())) {
			return list;
		} else {
			DbConnection dbc = new DbConnection();
			ResultSet rsSelect;
			String sqlSelect = "SELECT * FROM GGFB_RYQK" + " WHERE SQXXID ='" + this.getSqxxid() + "'";
			rsSelect = dbc.executeQuery(sqlSelect);
			ResultSetMetaData md = rsSelect.getMetaData(); // 获得结果集结构信息,元数据
			int columnCount = md.getColumnCount(); // 获得列数
			while (rsSelect.next()) {
				Map<String, Object> rowData = new HashMap<String, Object>();
				for (int i = 1; i <= columnCount; i++) {
					rowData.put(md.getColumnName(i), rsSelect.getObject(i));
				}
				list.add(rowData);
			}
			dbc.close();
			return list;
		}

	}

	/**
	 * 根据主键修改数据
	 * 
	 * @return
	 * @throws SQLException
	 */
	public boolean doUpdate() throws SQLException {
		if (StringUtils.isEmpty(this.getId())) {
			return false;
		} else {
			DbConnection dbc = new DbConnection();
			ResultSet rsCount;
			int nRowCount;
			StringBuffer sqlSb = new StringBuffer();
			sqlSb.append(" UPDATE GGFB_RYQK R	      ");
			sqlSb.append("    SET R.NAME       = '" + this.getName() + "',      ");
			sqlSb.append("        R.PERSONTYPE = '" + this.getPersonType() + "',      ");
			sqlSb.append("        R.CERTYPE    = '" + SysUtility.doPreProcess(this.getCerType()) + "',      ");
			sqlSb.append("        R.CERNO      = '" + SysUtility.doPreProcess(this.getCerno()) + "',      ");
			sqlSb.append("        R.SQXXID     = '" + SysUtility.doPreProcess(this.getSqxxid()) + "'	      ");
			sqlSb.append("  WHERE R.ID = '" + this.getId() + "'		      ");
			String sql = sqlSb.toString();
			nRowCount = dbc.executeUpdate(sql);
			dbc.close();
			if (nRowCount > 0) // 插入成功
				return true;
			else
				return false;

		}
	}

	/**
	 * 查询当前数据库是否有
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
			String sql = "SELECT COUNT(*) FROM GGFB_RYQK WHERE ID = '" + this.getId() + "'";
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
	 * 数据删除
	 * 
	 * @return
	 * @throws SQLException
	 */
	public boolean doDelete() throws SQLException {
		if (StringUtils.isEmpty(this.getId())) {
			return false;
		} else {
			DbConnection dbc = new DbConnection();
			String sqlDelete = "DELETE FROM GGFB_RYQK" + " WHERE ID = '" + this.getId() + "'";
			int nRowCount = dbc.executeUpdate(sqlDelete);
			dbc.close();
			if (nRowCount > 0) {
				return true;
			} else
				return false;
		}
	}

}
