package com.macrosoft.icms.ggdj;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.tomcat.dbcp.dbcp.DbcpException;

import com.macrosoft.icms.dbc.DbConnection;
import com.macrosoft.icms.system.SysUtility;

/**
 * 广告发布变更信息
 * 
 */
public class GgdjbgxxSq {
	// 主键
	private String id;
	// 发布信息主键
	private String sqxxid;
	// 变更前
	private String altbe;
	// 变更后
	private String altaf;
	// 变更日期
	private String altdate;
	// 变更次数
	private String alttime;
	// 受理机关
	private String accorg;
	// 状态
	private String status;
	// 时间戳
	private Timestamp sExtTimestamp;
	// 流程状态
	private String processstate;
	// 变更项：entname;adress;pzwj
	private String altitem;
	// 变更信息ID
	private String bgxxId;
	//媒介变更信息变更信息
	private List<Map<String,String>> mediaBgMapList;
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSqxxid() {
		return sqxxid;
	}

	public void setSqxxid(String sqxxid) {
		this.sqxxid = sqxxid;
	}

	public String getAltbe() {
		return altbe;
	}

	public void setAltbe(String altbe) {
		this.altbe = altbe;
	}

	public String getAltaf() {
		return altaf;
	}

	public void setAltaf(String altaf) {
		this.altaf = altaf;
	}

	public String getAltdate() {
		return altdate;
	}

	public void setAltdate(String altdate) {
		this.altdate = altdate;
	}

	public String getAlttime() {
		return alttime;
	}

	public void setAlttime(String alttime) {
		this.alttime = alttime;
	}

	public String getAccorg() {
		return accorg;
	}

	public void setAccorg(String accorg) {
		this.accorg = accorg;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Timestamp getsExtTimestamp() {
		return sExtTimestamp;
	}

	public void setsExtTimestamp(Timestamp sExtTimestamp) {
		this.sExtTimestamp = sExtTimestamp;
	}

	public String getProcessstate() {
		return processstate;
	}

	public void setProcessstate(String processstate) {
		this.processstate = processstate;
	}

	public String getAltitem() {
		return altitem;
	}

	public void setAltitem(String altitem) {
		this.altitem = altitem;
	}

	public String getBgxxId() {
		return bgxxId;
	}

	public void setBgxxId(String bgxxId) {
		this.bgxxId = bgxxId;
	}
	
	
	
	public List<Map<String, String>> getMediaBgMapList() {
		return mediaBgMapList;
	}

	public void setMediaBgMapList(List<Map<String, String>> mediaBgMapList) {
		this.mediaBgMapList = mediaBgMapList;
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

	public ArrayList getList(String sqlWhere) throws SQLException {
		DbConnection dbc = new DbConnection();
		ArrayList al = new ArrayList();
		String sqlList = "SELECT * FROM GGFB_BGXX";
		if (sqlWhere != null && sqlWhere.trim().compareTo("") != 0) {
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")) {
				sqlList += sqlWhere;
			} else {
				sqlList += " WHERE " + sqlWhere;
			}
		}
		ResultSet rsList = dbc.executeQuery(sqlList);
		while (rsList.next()) {
			GgdjbgxxSq bTable = new GgdjbgxxSq();
			bTable.doSetData(rsList);
			al.add(bTable);
		}
		rsList.close();
		dbc.close();
		return al;

	}

	public void doSetData(ResultSet rsSelect) throws SQLException {
		id = rsSelect.getString("ID");
		sqxxid = rsSelect.getString("SQXXID");
		altbe = rsSelect.getString("ALTBE");
		altaf = rsSelect.getString("ALTAF");
		altdate = String.valueOf(rsSelect.getDate("ALTDATE"));
		alttime = rsSelect.getString("ALTTIME");
		accorg = rsSelect.getString("ACCORG");
		status = rsSelect.getString("STATUS");
		processstate = rsSelect.getString("PROCESSSTATE");
		altitem = rsSelect.getString("ALTITEM");
		bgxxId = rsSelect.getString("BGXXID");

	}

	boolean mediaChange;

	public boolean getMediaChange() {
		return this.mediaChange;
	}

	public void setMediaChange(String ALTITEM) {
		if (ALTITEM.equals("03")) {
			mediaChange = true;
		}
	}

	public boolean doDeleteAll() throws SQLException {
		DbConnection dbc = new DbConnection();
		String sqlDelete = "DELETE FROM GGFB_BGXX" + " WHERE ID='" + doPreProcess(id) + "'";
		int nRowCount = dbc.executeUpdate(sqlDelete);
		dbc.close();
		if (nRowCount > 0) {
			return true;
		} else
			return false;
	}

	public boolean doDelete() throws SQLException {
		DbConnection dbc = new DbConnection();
		String sqlDelete = "DELETE FROM GGFB_BGXX WHERE SQXXID='" + doPreProcess(sqxxid) + "' AND ALTTIME='"
				+ doPreProcess(alttime) + "'";
		int nRowCount = dbc.executeUpdate(sqlDelete);
		dbc.close();
		if (nRowCount > 0) {
			return true;
		} else
			return false;
	}

	/**
	 * 通过变更信息ID删除
	 * 
	 * @return
	 * @throws SQLException
	 */
	public boolean doDeleteByBgxxId() throws SQLException {
		if (StringUtils.isEmpty(this.getBgxxId())) {
			return false;
		} else {
			String sql = "DELETE FROM GGFB_BGXX WHERE BGXXID = " + doPreProcess3(bgxxId);
			DbConnection dbc = new DbConnection();
			int nRowCount = dbc.executeUpdate(sql);
			dbc.close();
			if (nRowCount > 0) {
				return true;
			} else
				return false;
		}
	}

	public boolean doAdd() throws SQLException {
		DbConnection dbc = new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd = "INSERT INTO GGFB_BGXX(ID,SQXXID,ALTBE,ALTAF,ALTITEM,ALTTIME,BGXXID) VALUES("
				+ doPreProcess3(id) + "," + doPreProcess3(sqxxid) + "," + doPreProcess3(altbe) + ","
				+ doPreProcess3(altaf) + "," + doPreProcess3(altitem) + "," + doPreProcess3(alttime) + ","
				+ doPreProcess3(bgxxId) + ")";
		{
			nRowCount = dbc.executeUpdate(sqlAdd);
			dbc.close();
			if (nRowCount > 0) // 插入成功
				return true;
			else
				return false;
		}
	}

	public String doModifyJbxx(String sALTITEM, String sALTAF) throws SQLException {
		String sqlModify = "";
		if (sALTITEM.equals("01")) {
			sqlModify = " ENTNAME= " + doPreProcess3(sALTAF);// 申请单位名称
		} else if (sALTITEM.equals("02")) {
			sqlModify = " ADRESS= " + doPreProcess3(sALTAF);// 单位实际经营地址
		}
		return sqlModify;
	}

	/**
	 * 加载数据
	 * 
	 * @throws SQLException
	 */
	public void loadData() throws SQLException {
		DbConnection dbc = new DbConnection();
		ResultSet rsSelect;
		String sqlSelect = "SELECT * FROM GGFB_BGXX" + " WHERE SQXXID =" + doPreProcess3(sqxxid) + "  AND ALTTIME ="
				+ doPreProcess3(alttime) + "  AND ALTITEM =" + doPreProcess3(altitem);
		rsSelect = dbc.executeQuery(sqlSelect);
		if (rsSelect.next()) {
			this.setData(rsSelect);
		}
		dbc.close();

	}

	/**
	 * 通过变更信息ID和变更事项加载相应数据
	 * 
	 * @throws SQLException
	 */
	public void loadDataByBgxxId() throws SQLException {
		if (StringUtils.isEmpty(bgxxId) || StringUtils.isEmpty(altitem)) {
			return;
		} else {
			DbConnection dbc = new DbConnection();
			ResultSet rsSelect;
			String sqlSelect = "SELECT * FROM GGFB_BGXX" + " WHERE ALTITEM =" + doPreProcess3(altitem)
					+ "  AND BGXXID =" + doPreProcess3(bgxxId);
			rsSelect = dbc.executeQuery(sqlSelect);
			if (rsSelect.next()) {
				this.setData(rsSelect);
			}
			dbc.close();
		}
	}

	/**
	 * 查询变更次数
	 * 
	 * @throws SQLException
	 */
	public void queryAlttime() throws SQLException {
		DbConnection dbc = new DbConnection();
		ResultSet rsSelect;
		String sqlSelect = "SELECT COUNT(*)+1||'' ALTTIME FROM ( SELECT distinct(B.ALTTIME) FROM GGFB_BGXX B WHERE B.SQXXID = '"
				+ this.getSqxxid() + "')";
		rsSelect = dbc.executeQuery(sqlSelect);
		if (rsSelect.next()) {
			this.setAlttime(rsSelect.getString("ALTTIME"));
		}
		dbc.close();

	}

	private void setData(ResultSet rsSelect) throws SQLException {
		this.setId(rsSelect.getString("ID"));
		this.setSqxxid(rsSelect.getString("SQXXID"));
		this.setAltbe(rsSelect.getString("ALTBE"));
		this.setAltaf(rsSelect.getString("ALTAF"));
		this.setAltdate(rsSelect.getString("ALTDATE"));
		this.setAlttime(rsSelect.getString("ALTTIME"));
		this.setAccorg(rsSelect.getString("ACCORG"));
		this.setStatus(rsSelect.getString("STATUS"));
		this.setsExtTimestamp(rsSelect.getTimestamp("S_EXT_TIMESTAMP"));
	}

	public boolean doModifyBySql(String Sql) throws SQLException {
		DbConnection dbc = new DbConnection();
		int nRowCount = dbc.executeUpdate(Sql);
		dbc.close();
		if (nRowCount > 0) {
			return true;
		} else {
			return false;
		}
	}
	/**
	 * 加载媒介材料变更信息列表
	 * @return
	 * @throws SQLException
	 */
	public List<Map<String,String>> queryMediaMapList() throws SQLException{
		List<Map<String,String>> mediaMapList= new ArrayList<Map<String,String>>();
		if(!StringUtils.isEmpty(bgxxId)) {
			String sql = "SELECT * FROM GGFB_BGXX B WHERE B.ALTITEM = '03' AND B.BGXXID = "+doPreProcess3(this.getBgxxId());
			DbConnection dbc = new DbConnection();
			ResultSet rsSelect;
			rsSelect = dbc.executeQuery(sql);
			while(rsSelect.next()) {
				Map mediaMap = new HashMap<String,String>();
				mediaMap.put("altbe", SysUtility.doPreProcess(rsSelect.getString("ALTBE")));
				mediaMap.put("altaf", SysUtility.doPreProcess(rsSelect.getString("ALTAF")));
				mediaMapList.add(mediaMap);
			}
			dbc.close();
		}
		this.setMediaBgMapList(mediaMapList);
		return mediaMapList;
	}
}