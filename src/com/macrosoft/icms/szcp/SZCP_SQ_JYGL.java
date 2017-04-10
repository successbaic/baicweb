package com.macrosoft.icms.szcp;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import oracle.jdbc.driver.DBConversion;

import com.macrosoft.icms.dbc.DbConnection;


public class SZCP_SQ_JYGL {
	
	/**
	 * 注册号
	 */
	String REG_NO;
	
	/**
	 * 评价年度
	 */
	String EVAL_YEAR;
	
	/**
	 * 质量认证
	 */
	String QC_FLAG;
	/**
	 * 环保认证
	 */
	String EC_FLAG;
	/**
	 * 产品认证
	 */
	String PC_FLAG;
	/**
	 * 其他认证
	 */
	String OC_FLAG;
	/**
	 * 发明专利数
	 */
	int INV_PATE_QTY;
	/**
	 * 实用新型专利数
	 */
	int UTI_PATE_QTY;
	/**
	 * 外观设计专利数
	 */
	int DES_PATE_QTY;
	/**
	 * 注册商标数
	 */
	int REG_MARK_QTY;
	/**
	 * 驰名商标数
	 */
	int WEL_MARK_QTY;
	/**
	 * 注明商标数
	 */
	int FMS_MARK_QTY;
	/**
	 * 著作权数
	 */
	int CPRT_QTY;
	/**
	 * 所处行业是否要求特许资质和
	 */
	String IND_QUAL_FLAG;
	/**
	 * 本企业是否具有特许资质
	 */
	String ENT_QUAL_FLAG;
	/**
	 * 所处行业是否划分经营资质等级
	 */
	String QUAL_LEVEL_FLAG;
	/**
	 * 本企业资质等级水平
	 */
	String ENT_QUAL_LEVEL_TYPE;
	
	public String getREG_NO() {
		return REG_NO;
	}
	public void setREG_NO(String REG_NO) {
		this.REG_NO = REG_NO;
	}
	
	public String getEVAL_YEAR() {
		return EVAL_YEAR;
	}
	public void setEVAL_YEAR(String EVAL_YEAR) {
		this.EVAL_YEAR = EVAL_YEAR;
	}
	
	public String getQC_FLAG() {
		return QC_FLAG;
	}
	public void setQC_FLAG(String QC_FLAG) {
		this.QC_FLAG = QC_FLAG;
	}
	
	public String getEC_FLAG() {
		return EC_FLAG;
	}
	public void setEC_FLAG(String EC_FLAG) {
		this.EC_FLAG = EC_FLAG;
	}
	
	public String getPC_FLAG() {
		return PC_FLAG;
	}
	public void setPC_FLAG(String PC_FLAG) {
		this.PC_FLAG = PC_FLAG;
	}
	
	public String getOC_FLAG() {
		return OC_FLAG;
	}
	public void setOC_FLAG(String OC_FLAG) {
		this.OC_FLAG = OC_FLAG;
	}
	
	public int getINV_PATE_QTY() {
		return INV_PATE_QTY;
	}
	public void setINV_PATE_QTY(int INV_PATE_QTY) {
		this.INV_PATE_QTY = INV_PATE_QTY;
	}
	
	public int getUTI_PATE_QTY() {
		return UTI_PATE_QTY;
	}
	public void setUTI_PATE_QTY(int UTI_PATE_QTY) {
		this.UTI_PATE_QTY = UTI_PATE_QTY;
	}
	
	public int getDES_PATE_QTY() {
		return DES_PATE_QTY;
	}
	public void setDES_PATE_QTY(int DES_PATE_QTY) {
		this.DES_PATE_QTY = DES_PATE_QTY;
	}
	
	public int getREG_MARK_QTY() {
		return REG_MARK_QTY;
	}
	public void setREG_MARK_QTY(int REG_MARK_QTY) {
		this.REG_MARK_QTY = REG_MARK_QTY;
	}
	
	public int getWEL_MARK_QTY() {
		return WEL_MARK_QTY;
	}
	public void setWEL_MARK_QTY(int WEL_MARK_QTY) {
		this.WEL_MARK_QTY = WEL_MARK_QTY;
	}
	
	public int getFMS_MARK_QTY() {
		return FMS_MARK_QTY;
	}
	public void setFMS_MARK_QTY(int FMS_MARK_QTY) {
		this.FMS_MARK_QTY = FMS_MARK_QTY;
	}
	
	public int getCPRT_QTY() {
		return CPRT_QTY;
	}
	public void setCPRT_QTY(int CPRT_QTY) {
		this.CPRT_QTY = CPRT_QTY;
	}
	
	public String getIND_QUAL_FLAG() {
		return IND_QUAL_FLAG;
	}
	public void setIND_QUAL_FLAG(String IND_QUAL_FLAG) {
		this.IND_QUAL_FLAG = IND_QUAL_FLAG;
	}
	
	public String getENT_QUAL_FLAG() {
		return ENT_QUAL_FLAG;
	}
	public void setENT_QUAL_FLAG(String ENT_QUAL_FLAG) {
		this.ENT_QUAL_FLAG = ENT_QUAL_FLAG;
	}
	
	public String getQUAL_LEVEL_FLAG() {
		return QUAL_LEVEL_FLAG;
	}
	public void setQUAL_LEVEL_FLAG(String QUAL_LEVEL_FLAG) {
		this.QUAL_LEVEL_FLAG = QUAL_LEVEL_FLAG;
	} 
	public void setENT_QUAL_LEVEL_TYPE(String ENT_QUAL_LEVEL_TYPE){
		this.ENT_QUAL_LEVEL_TYPE =ENT_QUAL_LEVEL_TYPE;
	}
	public String getENT_QUAL_LEVEL_TYPE(){
		return ENT_QUAL_LEVEL_TYPE;
	}
	
	
	
	
	public String convertCode(String strvalue)
	{	return com.macrosoft.icms.system.SysUtility.convertCode( strvalue );	}

	public String doPreProcess( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess( sValue );	}

	public String doPreProcess2( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess2( sValue );	}

	public String doPreProcess3( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess3( sValue );	}
	
	private void doSetJYGL(ResultSet rs) {
		try {
			REG_NO = rs.getString("REG_NO");
			EVAL_YEAR = rs.getString("EVAL_YEAR");
			QC_FLAG = rs.getString("QC_FLAG");
			EC_FLAG = rs.getString("EC_FLAG");			
			PC_FLAG = rs.getString("PC_FLAG");
			OC_FLAG = rs.getString("OC_FLAG");
			INV_PATE_QTY = Integer.parseInt(rs.getString("INV_PATE_QTY"));
			UTI_PATE_QTY =Integer.parseInt(rs.getString("UTI_PATE_QTY"));
			DES_PATE_QTY = Integer.parseInt(rs.getString("DES_PATE_QTY"));
			REG_MARK_QTY = Integer.parseInt(rs.getString("REG_MARK_QTY"));
			WEL_MARK_QTY = Integer.parseInt(rs.getString("WEL_MARK_QTY"));
			FMS_MARK_QTY = Integer.parseInt(rs.getString("FMS_MARK_QTY"));
			CPRT_QTY  = Integer.parseInt(rs.getString("CPRT_QTY "));
			IND_QUAL_FLAG = rs.getString("IND_QUAL_FLAG");
			ENT_QUAL_FLAG = rs.getString("ENT_QUAL_FLAG");
			QUAL_LEVEL_FLAG = rs.getString("QUAL_LEVEL_FLAG");
			ENT_QUAL_LEVEL_TYPE = rs.getString("ENT_QUAL_LEVEL_TYPE");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	/**
	 *  保存数据
	 * @param szcp_SQ_JYGL
	 * @return
	 */
	public boolean saveData(SZCP_SQ_JYGL jygl) {
		DbConnection dbc=new DbConnection();
		PreparedStatement prsmt = null;
		String sql = "insert into szcp_sq_jygl(REG_NO,EVAL_YEAR,QC_FLAG,EC_FLAG,PC_FLAG,OC_FLAG,INV_PATE_QTY,UTI_PATE_QTY,DES_PATE_QTY," +
				"REG_MARK_QTY,WEL_MARK_QTY,FMS_MARK_QTY,CPRT_QTY,IND_QUAL_FLAG,ENT_QUAL_FLAG,QUAL_LEVEL_FLAG,ENT_QUAL_LEVEL_TYPE)" +
				"values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			prsmt = dbc.prepareStatement(sql);
			prsmt.setString(1, jygl.getREG_NO());
			prsmt.setString(2, jygl.getEVAL_YEAR());
			prsmt.setString(3, jygl.getQC_FLAG());
			prsmt.setString(4, jygl.getEC_FLAG());
			prsmt.setString(5, jygl.getPC_FLAG());
			prsmt.setString(6, jygl.getOC_FLAG());
			prsmt.setInt(7, jygl.getINV_PATE_QTY());
			prsmt.setInt(8, jygl.getUTI_PATE_QTY());
			prsmt.setInt(9, jygl.getDES_PATE_QTY());
			prsmt.setInt(10, jygl.getREG_MARK_QTY());
			prsmt.setInt(11, jygl.getWEL_MARK_QTY());
			prsmt.setInt(12, jygl.getFMS_MARK_QTY());
			prsmt.setInt(13, jygl.getCPRT_QTY());
			prsmt.setString(14, jygl.getIND_QUAL_FLAG());
			prsmt.setString(15, jygl.getENT_QUAL_FLAG());
			prsmt.setString(16, jygl.getQUAL_LEVEL_FLAG());
			prsmt.setString(17, jygl.getENT_QUAL_LEVEL_TYPE());
			int row = prsmt.executeUpdate();
			if(row>0){
				return true;
			}else{
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return true;
	}
	
	
	/**
	 *  查询有无历史数据
	 * @param szcp
	 */
	public boolean queryHistoryData(SZCP_SQ_JYGL jygl) {
		DbConnection dbConnection = new DbConnection();
		ResultSet set = null;
		boolean flag = false;
		String sql = "select count(*) as historycount from szcp_sq_jygl where REG_NO = "+"'"+doPreProcess(jygl.getREG_NO())+"'"+" and  EVAL_YEAR = "+"'"
			+doPreProcess(jygl.getEVAL_YEAR())+"'";
		try {
			set = dbConnection.executeQuery(sql);
			if(set.next()) {
				String str = set.getString("historycount");
				if(Integer.parseInt(str) > 0) {
					flag = true;
				}else {
					flag = false;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				set.close();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			try {
				dbConnection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return flag;
	}
	
	public boolean executeNextStep(SZCP_SQ_JYGL jygl) {
		// 判断是否存在历史数据
		boolean flag = queryHistoryData(jygl);
		// 查询流程
		if(flag) {
			// 执行更新操作
			flag = this.editData(jygl);
		}else {
			// 执行插入操作
			flag = this.saveData(jygl);
		}
		return flag;
	}
	
	private boolean editData(SZCP_SQ_JYGL jygl) {
		DbConnection dbc=new DbConnection();
		boolean flag = false;
		try {
			dbc.startTransaction();
			StringBuffer sb = new StringBuffer();
			sb.append(" update szcp_sq_jygl set ")
			.append(" QC_FLAG = ").append("'").append(jygl.getQC_FLAG()).append("',")
			.append(" EC_FLAG = ").append("'").append(jygl.getEC_FLAG()).append("',")
			.append(" PC_FLAG = ").append("'").append(jygl.getPC_FLAG()).append("',")
			.append(" OC_FLAG = ").append("'").append(jygl.getOC_FLAG()).append("',")
			.append(" INV_PATE_QTY = ").append("'").append(jygl.getINV_PATE_QTY()).append("',")
			.append(" UTI_PATE_QTY = ").append("'").append(jygl.getUTI_PATE_QTY()).append("',")
			.append(" DES_PATE_QTY = ").append("'").append(jygl.getDES_PATE_QTY()).append("',")
			.append(" REG_MARK_QTY = ").append("'").append(jygl.getREG_MARK_QTY()).append("',")
			.append(" WEL_MARK_QTY = ").append("'").append(jygl.getWEL_MARK_QTY()).append("',")
			.append(" FMS_MARK_QTY = ").append(jygl.getFMS_MARK_QTY()).append(",")
			.append(" CPRT_QTY = ").append(jygl.getCPRT_QTY()).append(",")
			.append(" IND_QUAL_FLAG = ").append(jygl.getIND_QUAL_FLAG()).append(",")
			.append(" ENT_QUAL_FLAG = ").append(jygl.getENT_QUAL_FLAG()).append(",")
			.append(" QUAL_LEVEL_FLAG = ").append("'").append(jygl.getQUAL_LEVEL_FLAG()).append("',")
			.append(" ENT_QUAL_LEVEL_TYPE = ").append("'").append(jygl.getENT_QUAL_LEVEL_TYPE()).append("'")
			.append(" where REG_NO = ").append("'"+jygl.getREG_NO()+"' and EVAL_YEAR = ").append("'"+jygl.getEVAL_YEAR()+"'");
			
			dbc.addSQL(sb.toString());
			flag = dbc.endTransaction();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				dbc.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return flag;
	}
	
	public SZCP_SQ_JYGL querySZCP_SQ_JYGL(String regNo,String year) {
		String sql = "select *from SZCP_SQ_JYGL where REG_NO = "+"'"+regNo+"'"+" and EVAL_YEAR = "+"'"+year+"'";
		DbConnection connection = new DbConnection();
		ResultSet rs = null;
		SZCP_SQ_JYGL jygl = new SZCP_SQ_JYGL();
		try {
			 rs = connection.executeQuery(sql);
			 if(rs.next()) {
				 jygl = setValueToSZCP_SQ_JYGL(rs);
			 }
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return jygl;
	}
	
	private SZCP_SQ_JYGL setValueToSZCP_SQ_JYGL(ResultSet rs) {
		SZCP_SQ_JYGL jygl = new SZCP_SQ_JYGL();
		try {
			jygl.setREG_NO(rs.getString("REG_NO") == null ?"":rs.getString("REG_NO"));
			jygl.setEVAL_YEAR(rs.getString("EVAL_YEAR") == null ?"":rs.getString("EVAL_YEAR"));
			jygl.setQC_FLAG(rs.getString("QC_FLAG")==null?"":rs.getString("QC_FLAG"));
			jygl.setEC_FLAG(rs.getString("EC_FLAG")==null?"":rs.getString("EC_FLAG"));
			jygl.setPC_FLAG(rs.getString("PC_FLAG")==null?"":rs.getString("PC_FLAG"));
			jygl.setOC_FLAG(rs.getString("OC_FLAG")==null?"":rs.getString("OC_FLAG"));
			jygl.setINV_PATE_QTY(rs.getInt("INV_PATE_QTY"));
			jygl.setUTI_PATE_QTY(rs.getInt("UTI_PATE_QTY"));
			jygl.setDES_PATE_QTY(rs.getInt("DES_PATE_QTY"));
			jygl.setREG_MARK_QTY(rs.getInt("REG_MARK_QTY"));
			jygl.setWEL_MARK_QTY(rs.getInt("WEL_MARK_QTY"));
			jygl.setFMS_MARK_QTY(rs.getInt("FMS_MARK_QTY"));
			jygl.setCPRT_QTY(rs.getInt("CPRT_QTY"));
			jygl.setIND_QUAL_FLAG(rs.getString("IND_QUAL_FLAG")==null?"":rs.getString("IND_QUAL_FLAG"));
			jygl.setENT_QUAL_FLAG(rs.getString("ENT_QUAL_FLAG")==null?"":rs.getString("ENT_QUAL_FLAG"));
			jygl.setQUAL_LEVEL_FLAG(rs.getString("QUAL_LEVEL_FLAG")==null?"":rs.getString("QUAL_LEVEL_FLAG"));
			jygl.setENT_QUAL_LEVEL_TYPE(rs.getString("ENT_QUAL_LEVEL_TYPE")==null?"":rs.getString("ENT_QUAL_LEVEL_TYPE"));
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return jygl;
	}
	
}
