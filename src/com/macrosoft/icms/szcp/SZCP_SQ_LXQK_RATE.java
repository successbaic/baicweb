package com.macrosoft.icms.szcp;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import oracle.jdbc.driver.DBConversion;

import com.macrosoft.icms.dbc.DbConnection;


public class SZCP_SQ_LXQK_RATE {
	
	/**
	 * 注册号
	 */
	String REG_NO;
	
	/**
	 * 评价年度
	 */
	String EVAL_YEAR;
	/*
	 * 填报年份
	 * */
	String REPORT_YEAR;
	/**
	 * 当年收入性合同实际履约率
	 */
	double RECV_PRFM_QTY_RATE;
	/**
	 * 当年支出性合同实际履约率
	 */
	double PAY_PRFM_QTY_RATE;
	/**
	 * 期末应收款占收入性合同比例
	 */
	double RECV_AMT_RATE;
	/**
	 * 期末应付款占支出性合同比例
	 */
	double PAY_AMT_RATE;
	/**
	 * 合同撤销率
	 */
	double REVOKE_RATE;
	/**
	 * 协议解除合同率
	 */
	double COMP_RQTE;
	/**
	 * 其他形式解除合同率
	 */
	double OTHER_RATE;
	/**
	 * 合同变更率
	 */
	double CHANGE_RATE;
	/**
	 * 到期未履行合同比率
	 */
	double OVERDUE_RATE;
	/**
	 * 本方违约合同比率
	 */
	double DFT_OUR_RATE;
	/**
	 * 对方违约合同比率
	 */
	double DFT_THEY_RATE;
	/**
	 * 因不可抗力未履行合同比率
	 */
	double GOD_RATE;
	/**
	 * 合同争议率
	 */
	double DISP_RATE;
	/**
	 * 合同争议解决率
	 */
	double SOLVE_RATE;
	
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
	
	public double getRECV_PRFM_QTY_RATE() {
		return RECV_PRFM_QTY_RATE;
	}
	
	public void setRECV_PRFM_QTY_RATE(double RECV_PRFM_QTY_RATE) {
		this.RECV_PRFM_QTY_RATE = RECV_PRFM_QTY_RATE;
	}
	
	
	public double getPAY_PRFM_QTY_RATE() {
		return PAY_PRFM_QTY_RATE;
	}
	
	public void setPAY_PRFM_QTY_RATE(double PAY_PRFM_QTY_RATE) {
		this.PAY_PRFM_QTY_RATE = PAY_PRFM_QTY_RATE;
	}
	
	
	public double getRECV_AMT_RATE() {
		return RECV_AMT_RATE;
	}
	public void setRECV_AMT_RATE(double RECV_AMT_RATE) {
		this.RECV_AMT_RATE = RECV_AMT_RATE;
	}
	
	public double getPAY_AMT_RATE() {
		return PAY_AMT_RATE;
	}
	public void setPAY_AMT_RATE(double PAY_AMT_RATE) {
		this.PAY_AMT_RATE = PAY_AMT_RATE;
	}
	
	public double getREVOKE_RATE() {
		return REVOKE_RATE;
	}
	public void setREVOKE_RATE(double REVOKE_RATE) {
		this.REVOKE_RATE = REVOKE_RATE;
	}
	
	public double getCOMP_RQTE() {
		return COMP_RQTE;
	}
	public void setCOMP_RQTE(double COMP_RQTE) {
		this.COMP_RQTE = COMP_RQTE;
	}
	
	public double getOTHER_RATE() {
		return OTHER_RATE;
	}
	public void setOTHER_RATE(double OTHER_RATE) {
		this.OTHER_RATE = OTHER_RATE;
	}
	
	public double getCHANGE_RATE() {
		return CHANGE_RATE;
	}
	public void setCHANGE_RATE(double CHANGE_RATE) {
		this.CHANGE_RATE = CHANGE_RATE;
	}
	
	
	public double getOVERDUE_RATE() {
		return OVERDUE_RATE;
	}
	public void setOVERDUE_RATE(double OVERDUE_RATE) {
		this.OVERDUE_RATE = OVERDUE_RATE;
	}
	
	public double getDFT_OUR_RATE() {
		return DFT_OUR_RATE;
	}
	public void setDFT_OUR_RATE(double DFT_OUR_RATE) {
		this.DFT_OUR_RATE = DFT_OUR_RATE;
	}
	
	public double getDFT_THEY_RATE() {
		return DFT_THEY_RATE;
	}
	public void setDFT_THEY_RATE(double DFT_THEY_RATE) {
		this.DFT_THEY_RATE = DFT_THEY_RATE;
	} 
	public double getGOD_RATE() {
		return GOD_RATE;
	}
	public void setGOD_RATE(double GOD_RATE) {
		this.GOD_RATE = GOD_RATE;
	} 
	public double getDISP_RATE() {
		return DISP_RATE;
	}
	public void setDISP_RATE(double DISP_RATE) {
		this.DISP_RATE = DISP_RATE;
	} 
	public double getSOLVE_RATE() {
		return SOLVE_RATE;
	}
	public void setSOLVE_RATE(double SOLVE_RATE) {
		this.SOLVE_RATE = SOLVE_RATE;
	} 
	public String getREPORT_YEAR() {
		return REPORT_YEAR;
	}
	public void setREPORT_YEAR(String report_year) {
		REPORT_YEAR = report_year;
	}
	
	public String convertCode(String strvalue)
	{	return com.macrosoft.icms.system.SysUtility.convertCode( strvalue );	}

	public String doPreProcess( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess( sValue );	}

	public String doPreProcess2( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess2( sValue );	}

	public String doPreProcess3( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess3( sValue );	}
	
	private void doSetrate(ResultSet rs) {
		try {
			REG_NO = rs.getString("REG_NO");
			EVAL_YEAR = rs.getString("EVAL_YEAR");
			REPORT_YEAR = rs.getString("REPORT_YEAR");
			RECV_PRFM_QTY_RATE = Double.parseDouble(rs.getString("RECV_PRFM_QTY_RATE"));
			PAY_PRFM_QTY_RATE = Double.parseDouble(rs.getString("PAY_PRFM_QTY_RATE"));
			RECV_AMT_RATE = Double.parseDouble(rs.getString("RECV_AMT_RATE"));
			PAY_AMT_RATE = Double.parseDouble(rs.getString("PAY_AMT_RATE"));
			REVOKE_RATE = Double.parseDouble(rs.getString("REVOKE_RATE"));
			COMP_RQTE = Double.parseDouble(rs.getString("COMP_RQTE"));			
			OTHER_RATE = Double.parseDouble(rs.getString("OTHER_RATE"));
			CHANGE_RATE = Double.parseDouble(rs.getString("CHANGE_RATE"));
			OVERDUE_RATE = Double.parseDouble(rs.getString("OVERDUE_RATE"));
			DFT_OUR_RATE = Double.parseDouble(rs.getString("DFT_OUR_RATE"));
			DFT_THEY_RATE = Double.parseDouble(rs.getString("DFT_THEY_RATE"));
			GOD_RATE = Double.parseDouble(rs.getString("GOD_RATE"));
			DISP_RATE = Double.parseDouble(rs.getString("DISP_RATE"));
			SOLVE_RATE = Double.parseDouble(rs.getString("SOLVE_RATE"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	/**
	 *  保存数据
	 * @param szcp_SQ_rate
	 * @return
	 */
	public boolean saveData(SZCP_SQ_LXQK_RATE rate) {
		boolean flag = false;
		DbConnection dbc=new DbConnection();
		PreparedStatement prsmt = null;
		String sql = "insert into szcp_sq_lxqk_rate(REG_NO,EVAL_YEAR,REPORT_YEAR,RECV_PRFM_QTY_RATE,PAY_PRFM_QTY_RATE,RECV_AMT_RATE,PAY_AMT_RATE,REVOKE_RATE," +
				"COMP_RQTE,OTHER_RATE,CHANGE_RATE,OVERDUE_RATE,DFT_OUR_RATE,DFT_THEY_RATE,GOD_RATE,DISP_RATE," +
				"SOLVE_RATE )values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			prsmt = dbc.prepareStatement(sql);
			prsmt.setString(1, rate.getREG_NO());
			prsmt.setString(2, rate.getEVAL_YEAR());
			prsmt.setString(3, rate.getREPORT_YEAR());
			prsmt.setDouble(4,rate.getRECV_PRFM_QTY_RATE());
			prsmt.setDouble(5,rate.getPAY_PRFM_QTY_RATE());
			prsmt.setDouble(6,rate.getRECV_AMT_RATE());
			prsmt.setDouble(7,rate.getPAY_AMT_RATE());
			prsmt.setDouble(8,rate.getREVOKE_RATE());
			prsmt.setDouble(9,rate.getCOMP_RQTE());
			prsmt.setDouble(10,rate.getOTHER_RATE());
			prsmt.setDouble(11,rate.getCHANGE_RATE());
			prsmt.setDouble(12,rate.getOVERDUE_RATE());
			prsmt.setDouble(13,rate.getDFT_OUR_RATE());
			prsmt.setDouble(14,rate.getDFT_THEY_RATE());
			prsmt.setDouble(15,rate.getGOD_RATE());
			prsmt.setDouble(16,rate.getDISP_RATE());
			prsmt.setDouble(17,rate.getSOLVE_RATE());
			int row = prsmt.executeUpdate();
			if(row>0){
				flag = true;
			}else{
				flag = false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	
	/**
	 *  查询有无历史数据
	 * @param szcp
	 */
	private boolean queryHistoryData(SZCP_SQ_LXQK_RATE rate) {
		DbConnection dbConnection = new DbConnection();
		ResultSet set = null;
		boolean flag = false;
		String sql = "select count(*) as historycount from szcp_sq_lxqk_rate where REG_NO = "+"'"+doPreProcess(rate.getREG_NO())+"'"+" and  EVAL_YEAR = "+"'"
			+doPreProcess(rate.getEVAL_YEAR())+"'"+" and REPORT_YEAR = "+"'"+doPreProcess(rate.getREPORT_YEAR())+"";
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
	/**
	 *  查询有无历史数据
	 * @param szcp
	 */
	public boolean queryHistoryDataTab(SZCP_SQ_LXQK_RATE rate) {
		DbConnection dbConnection = new DbConnection();
		ResultSet set = null;
		boolean flag = false;
		String sql = "select count(*) as historycount from szcp_sq_lxqk_rate where REG_NO = "+"'"+doPreProcess(rate.getREG_NO())+"'"+" and  EVAL_YEAR = "+"'"
			+doPreProcess(rate.getEVAL_YEAR())+"'";
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
	
	public boolean executeNextStep(SZCP_SQ_LXQK_RATE rate) {
		// 判断是否存在历史数据
		boolean flag = queryHistoryData(rate);
		// 查询流程
		if(flag) {
			// 执行更新操作
			flag = this.editData(rate);
		}else {
			// 执行插入操作
			flag = this.saveData(rate);
		}
		return flag;
	}
	
	private boolean editData(SZCP_SQ_LXQK_RATE rate) {
		DbConnection dbc=new DbConnection();
		boolean flag = false;
		try {
			dbc.startTransaction();
			StringBuffer sb = new StringBuffer();
			sb.append(" update SZCP_SQ_LXQK_RATE set ")
			.append(" RECV_PRFM_QTY_RATE = ").append("'").append(rate.getRECV_PRFM_QTY_RATE()).append("',").append("PAY_PRFM_QTY_RATE = ")
			.append("'").append(rate.getPAY_PRFM_QTY_RATE()).append("',").append("RECV_AMT_RATE = ").append("'").append(rate.getRECV_AMT_RATE()).append("',")
			.append("PAY_AMT_RATE = ").append("'").append(rate.getPAY_AMT_RATE()).append("',").append("REVOKE_RATE = ").append("'").append(rate.getREVOKE_RATE()).append("',")
			.append(" COMP_RQTE = ").append(rate.getCOMP_RQTE())
			.append(", OTHER_RATE = ").append("'").append(rate.getOTHER_RATE()).append("',")
			.append(" CHANGE_RATE = ").append("'").append(rate.getCHANGE_RATE()).append("',")
			.append(" OVERDUE_RATE = ").append("'").append(rate.getOVERDUE_RATE()).append("',")
			.append(" DFT_OUR_RATE = ").append("'").append(rate.getDFT_OUR_RATE()).append("',")
			.append(" DFT_THEY_RATE = ").append("'").append(rate.getDFT_THEY_RATE()).append("',")
			.append(" GOD_RATE = ").append("'").append(rate.getGOD_RATE()).append("',")
			.append(" DISP_RATE = ").append("'").append(rate.getDISP_RATE()).append("',")
			.append(" SOLVE_RATE = ").append("'").append(rate.getSOLVE_RATE()).append("'")
			.append(" where  EVAL_YEAR =  ").append("'").append(rate.getEVAL_YEAR()).append("' and REG_NO = ")
			.append("'").append(rate.getREG_NO()).append("'").append(" and REPORT_YEAR = ").append("'").append(rate.getREPORT_YEAR()).append("'");
			
			
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
	
	public SZCP_SQ_LXQK_RATE querySZCP_SQ_LXQK_RATE(String regNo,String year,String REPORT_YEAR) {
		String sql = "select *from SZCP_SQ_LXQK_RATE where REG_NO = "+"'"+regNo+"'"+" and EVAL_YEAR = "+"'"+year+"'"+" and REPORT_YEAR = "+"'"+REPORT_YEAR+"'";
		DbConnection connection = new DbConnection();
		ResultSet rs = null;
		SZCP_SQ_LXQK_RATE rate = new SZCP_SQ_LXQK_RATE();
		try {
			 rs = connection.executeQuery(sql);
			 if(rs.next()) {
				 rate = setValueToSZCP_SQ_LXQK_RATE(rs);
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
		return rate;
	}
	
	private SZCP_SQ_LXQK_RATE setValueToSZCP_SQ_LXQK_RATE(ResultSet rs) {
		SZCP_SQ_LXQK_RATE rate = new SZCP_SQ_LXQK_RATE();
		try {
			rate.setREG_NO(rs.getString("REG_NO") == null ?"":rs.getString("REG_NO"));
			rate.setEVAL_YEAR(rs.getString("EVAL_YEAR") == null ?"":rs.getString("EVAL_YEAR"));
			rate.setREPORT_YEAR(rs.getString("REPORT_YEAR")== null?"":rs.getString("REPORT_YEAR"));
			rate.setRECV_PRFM_QTY_RATE(rs.getDouble("RECV_PRFM_QTY_RATE"));
			rate.setPAY_PRFM_QTY_RATE(rs.getDouble("PAY_PRFM_QTY_RATE"));
			rate.setRECV_AMT_RATE(rs.getDouble("RECV_AMT_RATE"));
			rate.setPAY_AMT_RATE(rs.getDouble("PAY_AMT_RATE"));
			rate.setREVOKE_RATE(rs.getDouble("REVOKE_RATE"));
			rate.setCOMP_RQTE(rs.getDouble("COMP_RQTE"));
			rate.setOTHER_RATE(rs.getDouble("OTHER_RATE"));
			rate.setCHANGE_RATE(rs.getDouble("CHANGE_RATE"));
			rate.setOVERDUE_RATE(rs.getDouble("OVERDUE_RATE"));
			rate.setDFT_OUR_RATE(rs.getDouble("DFT_OUR_RATE"));
			rate.setDFT_THEY_RATE(rs.getDouble("DFT_THEY_RATE"));
			rate.setGOD_RATE(rs.getDouble("GOD_RATE"));
			rate.setDISP_RATE(rs.getDouble("DISP_RATE"));
			rate.setSOLVE_RATE(rs.getDouble("SOLVE_RATE"));
		}catch(Exception e) {
			e.printStackTrace();
		}
		return rate;
	}
}
