package com.macrosoft.icms.szcp;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import oracle.jdbc.driver.DBConversion;

import com.macrosoft.icms.dbc.DbConnection;


public class SZCP_SQ_ZRXY {
	
	/**
	 * 注册号
	 */
	String REG_NO;
	
	/**
	 * 评价年度
	 */
	String EVAL_YEAR;
	/**
	 * 拖欠员工工资
	 */
	String LP_ARR_WAGE_FLAG;
	/**
	 * 与员工签订劳动合同
	 */
	String LP_ALL_CONT_FLAG;
	/**
	 *办理社会保险
	 */
	String  LP_SOC_INSRC_FLAG;
	/**
	 * 涉税违法
	 */
	String TAX_VOLITE_FLAG;
	/**
	 * 生产经营违反环保法律法规
	 */
	String ECO_OPR_DMG_FLAG;
	/**
	 * 产品服务违反环保规定
	 */
	String ECO_PRO_DMG_FLAG;
	/**
	 * 重大安全事故
	 */
	String  SP_MAJOR_ACC_FLAG;
	/**
	 * 被安监部门查处
	 */
	String SP_ORG_INVEST_FLAG;
	/**
	 * 产品质量违法行为
	 */
	String QS_INVEST_FLAG;
	/**
	 * 逾期银行贷款
	 */
	String BANK_INVEST_FLAG;
	/**
	 * 进出口违法行为
	 */
	String CSTM_INVEST_FLAG;
	/**
	 * 其他违法违规行为
	 */
	String OTHER_INVEST_FLAG;
	
	
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
	
	public String getLP_ARR_WAGE_FLAG() {
		return LP_ARR_WAGE_FLAG;
	}
	
	public void setLP_ARR_WAGE_FLAG(String LP_ARR_WAGE_FLAG) {
		this.LP_ARR_WAGE_FLAG = LP_ARR_WAGE_FLAG;
	}
	
	
	public String getLP_ALL_CONT_FLAG() {
		return LP_ALL_CONT_FLAG;
	}
	
	public void setLP_ALL_CONT_FLAG(String LP_ALL_CONT_FLAG) {
		this.LP_ALL_CONT_FLAG = LP_ALL_CONT_FLAG;
	}
	
	
	public String getLP_SOC_INSRC_FLAG() {
		return LP_SOC_INSRC_FLAG;
	}
	public void setLP_SOC_INSRC_FLAG(String LP_SOC_INSRC_FLAG) {
		this.LP_SOC_INSRC_FLAG = LP_SOC_INSRC_FLAG;
	}
	
	public String getTAX_VOLITE_FLAG() {
		return TAX_VOLITE_FLAG;
	}
	public void setTAX_VOLITE_FLAG(String TAX_VOLITE_FLAG) {
		this.TAX_VOLITE_FLAG = TAX_VOLITE_FLAG;
	}
	
	public String getECO_OPR_DMG_FLAG() {
		return ECO_OPR_DMG_FLAG;
	}
	public void setECO_OPR_DMG_FLAG(String ECO_OPR_DMG_FLAG) {
		this.ECO_OPR_DMG_FLAG = ECO_OPR_DMG_FLAG;
	}
	
	public String getECO_PRO_DMG_FLAG() {
		return ECO_PRO_DMG_FLAG;
	}
	public void setECO_PRO_DMG_FLAG(String ECO_PRO_DMG_FLAG) {
		this.ECO_PRO_DMG_FLAG = ECO_PRO_DMG_FLAG;
	}
	
	
	public String getSP_MAJOR_ACC_FLAG() {
		return SP_MAJOR_ACC_FLAG;
	}
	public void setSP_MAJOR_ACC_FLAG(String SP_MAJOR_ACC_FLAG) {
		this.SP_MAJOR_ACC_FLAG = SP_MAJOR_ACC_FLAG;
	} 
	
	public String getSP_ORG_INVEST_FLAG() {
		return SP_ORG_INVEST_FLAG;
	}
	public void setSP_ORG_INVEST_FLAG(String SP_ORG_INVEST_FLAG) {
		this.SP_ORG_INVEST_FLAG = SP_ORG_INVEST_FLAG;
	} 
	
	public String getQS_INVEST_FLAG() {
		return QS_INVEST_FLAG;
	}
	public void setQS_INVEST_FLAG(String QS_INVEST_FLAG) {
		this.QS_INVEST_FLAG = QS_INVEST_FLAG;
	} 
	
	public String getBANK_INVEST_FLAG() {
		return BANK_INVEST_FLAG;
	}
	public void setBANK_INVEST_FLAG(String BANK_INVEST_FLAG) {
		this.BANK_INVEST_FLAG = BANK_INVEST_FLAG;
	} 
	
	public String getCSTM_INVEST_FLAG() {
		return CSTM_INVEST_FLAG;
	}
	public void setCSTM_INVEST_FLAG(String CSTM_INVEST_FLAG) {
		this.CSTM_INVEST_FLAG = CSTM_INVEST_FLAG;
	} 
	
	public String getOTHER_INVEST_FLAG() {
		return OTHER_INVEST_FLAG;
	}
	public void setOTHER_INVEST_FLAG(String OTHER_INVEST_FLAG) {
		this.OTHER_INVEST_FLAG = OTHER_INVEST_FLAG;
	} 
	
	
	public String convertCode(String strvalue)
	{	return com.macrosoft.icms.system.SysUtility.convertCode( strvalue );	}

	public String doPreProcess( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess( sValue );	}

	public String doPreProcess2( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess2( sValue );	}

	public String doPreProcess3( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess3( sValue );	}
	
	private void doSetZRXY(ResultSet rs) {
		try {
			REG_NO = rs.getString("REG_NO");
			EVAL_YEAR = rs.getString("EVAL_YEAR");
			LP_ARR_WAGE_FLAG = rs.getString("LP_ARR_WAGE_FLAG");
			LP_ALL_CONT_FLAG = rs.getString("LP_ALL_CONT_FLAG");
			LP_SOC_INSRC_FLAG = rs.getString("LP_SOC_INSRC_FLAG");
			TAX_VOLITE_FLAG = rs.getString("TAX_VOLITE_FLAG");
			ECO_OPR_DMG_FLAG = rs.getString("ECO_OPR_DMG_FLAG");
			ECO_PRO_DMG_FLAG = rs.getString("ECO_PRO_DMG_FLAG");
			SP_MAJOR_ACC_FLAG = rs.getString("SP_MAJOR_ACC_FLAG");
			SP_ORG_INVEST_FLAG = rs.getString("SP_ORG_INVEST_FLAG");
			QS_INVEST_FLAG = rs.getString("QS_INVEST_FLAG");
			BANK_INVEST_FLAG = rs.getString("BANK_INVEST_FLAG");
			CSTM_INVEST_FLAG = rs.getString("CSTM_INVEST_FLAG");
			OTHER_INVEST_FLAG = rs.getString("OTHER_INVEST_FLAG");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	/**
	 *  保存数据
	 * @param szcp_SQ_lxqk_in
	 * @return
	 */
	public boolean saveData(SZCP_SQ_ZRXY zrxy) {
		DbConnection dbc=new DbConnection();
		PreparedStatement prsmt = null;
		String sql = "insert into szcp_sq_zrxy(REG_NO,EVAL_YEAR,LP_ARR_WAGE_FLAG,LP_ALL_CONT_FLAG,LP_SOC_INSRC_FLAG,TAX_VOLITE_FLAG,ECO_OPR_DMG_FLAG,ECO_PRO_DMG_FLAG,SP_MAJOR_ACC_FLAG," +
				"SP_ORG_INVEST_FLAG,QS_INVEST_FLAG,BANK_INVEST_FLAG,CSTM_INVEST_FLAG,OTHER_INVEST_FLAG" +
				" )values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			prsmt = dbc.prepareStatement(sql);
			prsmt.setString(1,zrxy.getREG_NO());
			prsmt.setString(2,zrxy.getEVAL_YEAR());
			prsmt.setString(3,zrxy.getLP_ARR_WAGE_FLAG());
			prsmt.setString(4, zrxy.getLP_ALL_CONT_FLAG());
			prsmt.setString(5, zrxy.getLP_SOC_INSRC_FLAG());
			prsmt.setString(6,zrxy.getTAX_VOLITE_FLAG());
			prsmt.setString(7, zrxy.getECO_OPR_DMG_FLAG());
			prsmt.setString(8, zrxy.getECO_PRO_DMG_FLAG());
			prsmt.setString(9, zrxy.getSP_MAJOR_ACC_FLAG());
			prsmt.setString(10, zrxy.getSP_ORG_INVEST_FLAG());
			prsmt.setString(11, zrxy.getQS_INVEST_FLAG());
			prsmt.setString(12, zrxy.getBANK_INVEST_FLAG());
			prsmt.setString(13, zrxy.getCSTM_INVEST_FLAG());
			prsmt.setString(14, zrxy.getOTHER_INVEST_FLAG());
			int row = prsmt.executeUpdate();
			if(row > 0) {
				return true;
			}else {
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
	public boolean queryHistoryData(SZCP_SQ_ZRXY zrxy) {
		DbConnection dbConnection = new DbConnection();
		ResultSet set = null;
		boolean flag = false;
		String sql = "select count(*) as historycount from szcp_sq_zrxy where REG_NO = "+"'"+doPreProcess(zrxy.getREG_NO())+"'"+" and  EVAL_YEAR = "+"'"
			+doPreProcess(zrxy.getEVAL_YEAR())+"'";
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
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		return flag;
	}
	
	public boolean executeNextStep(SZCP_SQ_ZRXY zrxy) {
		// 判断是否存在历史数据
		boolean flag = queryHistoryData(zrxy);
		// 查询流程
		if(flag) {
			// 执行更新操作
			flag = this.editData(zrxy);
		}else {
			// 执行插入操作
			flag = this.saveData(zrxy);
		}
		return flag;
	}
	
	public SZCP_SQ_ZRXY querySZCP_SQ_ZRXY(String regNo,String year) {
		String sql = "select *from SZCP_SQ_ZRXY where REG_NO = "+"'"+regNo+"'"+" and EVAL_YEAR = "+"'"+year+"'";
		DbConnection connection = new DbConnection();
		ResultSet rs = null;
		SZCP_SQ_ZRXY zrxy = new SZCP_SQ_ZRXY();
		try {
			 rs = connection.executeQuery(sql);
			 if(rs.next()) {
				 zrxy = setValueToSZCP_SQ_ZRXY(rs);
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
		return zrxy;
	}
	private SZCP_SQ_ZRXY setValueToSZCP_SQ_ZRXY(ResultSet rs) {
		SZCP_SQ_ZRXY zrxy = new SZCP_SQ_ZRXY();
		try {
			zrxy.setREG_NO(rs.getString("REG_NO") == null ?"":rs.getString("REG_NO"));
			zrxy.setEVAL_YEAR(rs.getString("EVAL_YEAR") == null ?"":rs.getString("EVAL_YEAR"));
			zrxy.setLP_ARR_WAGE_FLAG(rs.getString("LP_ARR_WAGE_FLAG")==null?"":rs.getString("LP_ARR_WAGE_FLAG"));
			zrxy.setLP_ALL_CONT_FLAG(rs.getString("LP_ALL_CONT_FLAG")==null?"":rs.getString("LP_ALL_CONT_FLAG"));
			zrxy.setLP_SOC_INSRC_FLAG(rs.getString("LP_SOC_INSRC_FLAG")==null?"":rs.getString("LP_SOC_INSRC_FLAG"));
			zrxy.setTAX_VOLITE_FLAG(rs.getString("TAX_VOLITE_FLAG")==null?"":rs.getString("TAX_VOLITE_FLAG"));
			zrxy.setECO_OPR_DMG_FLAG(rs.getString("ECO_OPR_DMG_FLAG")==null?"":rs.getString("ECO_OPR_DMG_FLAG"));
			zrxy.setECO_PRO_DMG_FLAG(rs.getString("ECO_PRO_DMG_FLAG")==null?"":rs.getString("ECO_PRO_DMG_FLAG"));
			zrxy.setSP_MAJOR_ACC_FLAG(rs.getString("SP_MAJOR_ACC_FLAG")==null?"":rs.getString("SP_MAJOR_ACC_FLAG"));
			zrxy.setSP_ORG_INVEST_FLAG(rs.getString("SP_ORG_INVEST_FLAG")==null?"":rs.getString("SP_ORG_INVEST_FLAG"));
			zrxy.setQS_INVEST_FLAG(rs.getString("QS_INVEST_FLAG")==null?"":rs.getString("QS_INVEST_FLAG"));
			zrxy.setBANK_INVEST_FLAG(rs.getString("BANK_INVEST_FLAG")==null?"":rs.getString("BANK_INVEST_FLAG"));
			zrxy.setCSTM_INVEST_FLAG(rs.getString("CSTM_INVEST_FLAG")==null?"":rs.getString("CSTM_INVEST_FLAG"));
			zrxy.setOTHER_INVEST_FLAG(rs.getString("OTHER_INVEST_FLAG")==null?"":rs.getString("OTHER_INVEST_FLAG"));
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return zrxy;
	}
	
	
	private boolean editData(SZCP_SQ_ZRXY zrxy) {
		DbConnection dbc=new DbConnection();
		boolean flag = false;
		try {
			dbc.startTransaction();
			StringBuffer sb = new StringBuffer();
			sb.append(" update szcp_sq_zrxy set LP_ARR_WAGE_FLAG = ").append("'").append(zrxy.getLP_ARR_WAGE_FLAG()).append("',").append("LP_ALL_CONT_FLAG = ")
			.append("'").append(zrxy.getLP_ALL_CONT_FLAG()).append("',").append("LP_SOC_INSRC_FLAG = ").append("'").append(zrxy.getLP_SOC_INSRC_FLAG())
			.append("',").append("TAX_VOLITE_FLAG= '").append(zrxy.getTAX_VOLITE_FLAG()).append("', ECO_OPR_DMG_FLAG = '").append(zrxy.getECO_OPR_DMG_FLAG()).append("',")
			.append(" ECO_PRO_DMG_FLAG = '").append(zrxy.getECO_PRO_DMG_FLAG()).append("',SP_MAJOR_ACC_FLAG='").append(zrxy.getSP_MAJOR_ACC_FLAG()).append("',SP_ORG_INVEST_FLAG='").append(zrxy.getSP_ORG_INVEST_FLAG()).append("',QS_INVEST_FLAG='").append(zrxy.getQS_INVEST_FLAG()).append("',BANK_INVEST_FLAG='").append(zrxy.getBANK_INVEST_FLAG()).append("',CSTM_INVEST_FLAG='").append(zrxy.getCSTM_INVEST_FLAG())
			.append("' ,OTHER_INVEST_FLAG = ").append("'").append(zrxy.getOTHER_INVEST_FLAG()).append("'")
			.append(" where REG_NO = ").append("'"+zrxy.getREG_NO()+"' and EVAL_YEAR = ").append("'"+zrxy.getEVAL_YEAR()+"'");
			
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
	
	
}
