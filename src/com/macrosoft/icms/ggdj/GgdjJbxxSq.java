package com.macrosoft.icms.ggdj;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.macrosoft.icms.dbc.DbConnection;
import com.macrosoft.icms.system.SysUtility;

/**
 * 广告发布登记信息
 * 
 * @author lihsh
 *
 */
public class GgdjJbxxSq {
	
	private Log logger = LogFactory.getLog(GgdjJbxxSq.class);	
	// 主键
	private String id;
	// 单位名称
	private String entName;
	// 法人姓名
	private String lerep;
	// 地址
	private String address;
	// 单位类型
	private String entType;
	// 法定代表人证件类型
	private String cerType;
	// 法定代表人证件号码
	private String cerno;
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
	// 广告状态1：正常2：注销3吊销4驳回
	private String status;
	// 单位性质
	private String entProp;
	// 媒体级别
	private String mediaLevel;
	// 有效期自
	private String opfrom;
	// 有效期至
	private String opto;
	// 许可证号
	private String certNo;

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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEntType() {
		return entType;
	}

	public void setEntType(String entType) {
		this.entType = entType;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getEntProp() {
		return entProp;
	}

	public void setEntProp(String entProp) {
		this.entProp = entProp;
	}

	public String getMediaLevel() {
		return mediaLevel;
	}

	public void setMediaLevel(String mediaLevel) {
		this.mediaLevel = mediaLevel;
	}

	public String getOpfrom() {
		return opfrom;
	}

	public void setOpfrom(String opfrom) {
		this.opfrom = opfrom;
	}

	public String getOpto() {
		return opto;
	}

	public void setOpto(String opto) {
		this.opto = opto;
	}

	public String getCertNo() {
		return certNo;
	}

	public void setCertNo(String certNo) {
		this.certNo = certNo;
	}

	/**
	 * 数据插入
	 */
	public boolean doInsert() throws SQLException {
		DbConnection dbc = new DbConnection();
		int nRowCount;
		StringBuffer sqlBuffer = new StringBuffer();
		sqlBuffer.append("   insert into GGFB_SQXX                       	 ");
		sqlBuffer.append("     (ID,									     	 ");
		sqlBuffer.append("      ENTNAME,								     ");
		sqlBuffer.append("      LEREP,									     ");
		sqlBuffer.append("      ADRESS,									     ");
		sqlBuffer.append("      ENTTYPE,									 ");
		sqlBuffer.append("      CERTYPE,								     ");
		sqlBuffer.append("      CERNO,									     ");
		sqlBuffer.append("      PROCESSSTATE,								 ");
		sqlBuffer.append("      SLDATE,									     ");
		sqlBuffer.append("      APPRDATE,								     ");
		sqlBuffer.append("      ACCORG,									     ");
		sqlBuffer.append("      DWXZ,							 			 ");
		sqlBuffer.append("      MTJB,							 			 ");
		sqlBuffer.append("      OPFROM,										 ");
		sqlBuffer.append("      OPTO,										 ");
		sqlBuffer.append("      S_EXT_TIMESTAMP,							 ");
		sqlBuffer.append("      CERTNO,										 ");
		sqlBuffer.append("      STATUS)									     ");
		sqlBuffer.append("   values									     ");
		sqlBuffer.append(
				" ('" + SysUtility.doPreProcess(this.getId()) + "', '" + SysUtility.doPreProcess(this.getEntName())
						+ "', '" + SysUtility.doPreProcess(this.getLerep()) + "', '");
		sqlBuffer.append(SysUtility.doPreProcess(this.getAddress()) + "', '"
				+ SysUtility.doPreProcess(this.getEntType()) + "', '" + SysUtility.doPreProcess(this.getCerType())
				+ "', '" + SysUtility.doPreProcess(this.getCerno()));
		sqlBuffer.append("', '" + SysUtility.doPreProcess(this.getProcessState()) + "', '"
				+ SysUtility.doPreProcess(this.getSlDate()) + "', '");
		sqlBuffer.append(SysUtility.doPreProcess(this.getApprDate()) + "', '"
				+ SysUtility.doPreProcess(this.getAccOrg()) + "','" + SysUtility.doPreProcess(this.getEntProp()) + "','"
				+ SysUtility.doPreProcess(this.getMediaLevel()) + "','" + SysUtility.doPreProcess(this.getOpfrom())
				+ "','" + SysUtility.doPreProcess(this.getOpto()) + "', CURRENT_TIMESTAMP(6), '"
				+ SysUtility.doPreProcess(this.getCertNo()) + "','");
		sqlBuffer.append(SysUtility.doPreProcess(this.getStatus()) + "')");
		String sql = sqlBuffer.toString();

		nRowCount = dbc.executeUpdate(sql);
		dbc.close();
		if (nRowCount > 0) // 插入成功
			return true;
		else
			return false;

	}

	/**
	 * 修改数据库中
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
			sqlSb.append("  update GGFB_SQXX G					");
			sqlSb.append(
					"     SET G.ENTNAME         = '" + SysUtility.doPreProcess(this.getEntName()) + "',				");
			sqlSb.append(
					"         G.LEREP           = '" + SysUtility.doPreProcess(this.getLerep()) + "',				");
			sqlSb.append(
					"         G.ADRESS          = '" + SysUtility.doPreProcess(this.getAddress()) + "',				");
			sqlSb.append(
					"         G.ENTTYPE         = '" + SysUtility.doPreProcess(this.getEntType()) + "',				");
			sqlSb.append(
					"         G.CERTYPE         = '" + SysUtility.doPreProcess(this.getCerType()) + "',				");
			sqlSb.append(
					"         G.CERNO           = '" + SysUtility.doPreProcess(this.getCerno()) + "',				");
			sqlSb.append("         G.PROCESSSTATE    = '" + SysUtility.doPreProcess(this.getProcessState())
					+ "',				");
			sqlSb.append(
					"         G.SLDATE          = '" + SysUtility.doPreProcess(this.getSlDate()) + "',				");
			sqlSb.append("         G.APPRDATE        = '" + SysUtility.doPreProcess(this.getApprDate())
					+ "',				");
			sqlSb.append(
					"         G.ACCORG          = '" + SysUtility.doPreProcess(this.getAccOrg()) + "',				");
			sqlSb.append(
					"         G.DWXZ          = '" + SysUtility.doPreProcess(this.getEntProp()) + "',				");
			sqlSb.append("         G.MTJB          = '" + SysUtility.doPreProcess(this.getMediaLevel())
					+ "',				");
			sqlSb.append(
					"         G.OPFROM          = '" + SysUtility.doPreProcess(this.getOpfrom()) + "',				");
			sqlSb.append("         G.OPTO          = '" + SysUtility.doPreProcess(this.getOpto()) + "',				");
			sqlSb.append("         G.S_EXT_TIMESTAMP = CURRENT_TIMESTAMP(6),	");
			sqlSb.append(
					"         G.STATUS          = '" + SysUtility.doPreProcess(this.getStatus()) + "'				");
			sqlSb.append("   where G.ID = '" + SysUtility.doPreProcess(this.getId()) + "'					");
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
			String sql = "SELECT COUNT(*) FROM GGFB_SQXX WHERE ID = '" + this.getId() + "'";
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
			String sqlSelect = "SELECT * FROM GGFB_SQXX" + " WHERE ID ='" + this.getId() + "'";
			rsSelect = dbc.executeQuery(sqlSelect);
			if (rsSelect.next()) {
				this.setData(rsSelect);
			}
			dbc.close();
		}

	}
	/**
	 * 加载正式库数据
	 * @throws SQLException 
	 */
	public void loadDataFromDb() throws SQLException  {
		if (StringUtils.isEmpty(this.getId())) {
			return;
		} else {
			DbConnection dbc = null;
			ResultSet rsSelect = null;
			try {
				dbc = new DbConnection();
				String sqlSelect = "SELECT * FROM GGFB_SQXX_ZS" + " WHERE ID ='" + this.getId() + "'";
				rsSelect = dbc.executeQuery(sqlSelect);
				if (rsSelect.next()) {
					this.setData(rsSelect);
				}
			}catch(Exception e) {
				logger.error(e.getMessage(), e);
			}finally{
				if(dbc != null) {
					dbc.close();
				}
				if(rsSelect != null) {
					rsSelect.close();
				}
			}
		}
	}

	/**
	 * 注入信息
	 * 
	 * @param rsSelect
	 * @throws SQLException
	 */
	private void setData(ResultSet rsSelect) throws SQLException {
		if (StringUtils.isEmpty(this.getId())) {
			this.setId(rsSelect.getString("ID"));
		}
		this.setEntName(rsSelect.getString("ENTNAME"));
		this.setLerep(rsSelect.getString("LEREP"));
		this.setAddress(rsSelect.getString("ADRESS"));
		this.setEntType(rsSelect.getString("ENTTYPE"));
		this.setCerType(rsSelect.getString("CERTYPE"));
		this.setCerno(rsSelect.getString("CERNO"));
		this.setProcessState(rsSelect.getString("PROCESSSTATE"));
		this.setSlDate(rsSelect.getString("SLDATE"));
		this.setApprDate(rsSelect.getString("APPRDATE"));
		this.setAccOrg(rsSelect.getString("ACCORG"));
		this.setS_ext_timestamp(rsSelect.getTimestamp("S_EXT_TIMESTAMP"));
		this.setStatus(rsSelect.getString("STATUS"));
		this.setEntProp(rsSelect.getString("DWXZ"));
		this.setMediaLevel(rsSelect.getString("MTJB"));
		this.setOpfrom(rsSelect.getString("OPFROM"));
		this.setOpto(rsSelect.getString("OPTO"));
		this.setCertNo(rsSelect.getString("CERTNO"));
	}

	/**
	 * 根据单位名称和法人姓名从正式库查询信息
	 * 
	 * @throws SQLException
	 */
	public void loadDataByEntNameAndLerep() throws SQLException {
		if (StringUtils.isEmpty(this.getEntName()) || StringUtils.isEmpty(this.getLerep())) {
			return;
		} else {
			DbConnection dbc = new DbConnection();
			ResultSet rsSelect;
			String sqlSelect = "SELECT * FROM GGFB_SQXX_ZS" + " WHERE ENTNAME = '"
					+ SysUtility.doPreProcess(this.getEntName()) + "' AND LEREP = '"
					+ SysUtility.doPreProcess(this.getLerep()) + "'";
			rsSelect = dbc.executeQuery(sqlSelect);
			if (rsSelect.next()) {
				this.setData(rsSelect);
			}
			dbc.close();
		}
	}
	
}