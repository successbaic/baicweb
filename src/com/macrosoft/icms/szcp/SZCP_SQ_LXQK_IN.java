package com.macrosoft.icms.szcp;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import oracle.jdbc.driver.DBConversion;

import com.macrosoft.icms.dbc.DbConnection;


public class SZCP_SQ_LXQK_IN {
	
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
	 * 上年书面合同总份数
	 */
	int TOTAL_CONT_QTY;
	/**
	 * 上年书面合同总金额
	 */
	double TOTAL_CONT_RMB_W;
	/**
	 * 当年书面合同份数
	 */
	int LAST_CONT_QTY;
	/**
	 *当年书面合同金额
	 */
	double LAST_CONT_RMB_W;
	/**
	 * 当年应履行合同份数
	 */
	int PLAN_CONT_QTY;
	/**
	 * 当年应履行合同金额
	 */
	double PLAN_CONT_RMB_W;
	/**
	 * 当年实际履行合同份数
	 */
	int REAL_CONT_QTY;
	/**
	 * 当年实际履行合同金额
	 */
	double REAL_CONT_RMB_W;
	/**
	 * 撤销合同份数
	 */
	int  CANCEL_CONT_QTY;
	/**
	 * 撤销合同金额
	 */
	double CANCEL_CONT_RMB_W;
	/**
	 * 协议解除合同份数
	 */
	int COMP_CONT_QTY;
	/**
	 * 协议解除合同金额
	 */
	double COMP_CONT_RMB_W;
	/**
	 * 其他形式解除合同份数
	 */
	int OTHER_CONT_QTY;
	/**
	 * 其他形式解除合同金额
	 */
	double OTHER_CONT_RMB_W;
	/**
	 * 变更合同份数
	 */
	int CHANGE_CONT_QTY;
	/**
	 * 变更合同金额
	 */
	double CHANGE_CONT_RMB_W;
	/**
	 * 到期未履行合同份数
	 */
	int OVERDUE_CONT_QTY;
	/**
	 * 到期未履行合同金额
	 */
	double OVERDUE_CONT_RMB_W;
	/**
	 * 本方违约合同份数
	 */
	int DFT_OUR_QTY;
	/**
	 * 本方违约合同金额
	 */
	double DFT_OUR_RMB_W;
	/**
	 *对方违约合同份数
	 */
	int DFT_THEY_QTY;
	/**
	 * 对方违约合同金额
	 */
	double DFT_THEY_RMB_W;
	/**
	 * 因不可抗力未履行合同份数
	 */
	int DFT_GOD_QTY;
	/**
	 * 因不可抗力未履行合同金额
	 */
	double DFT_GOD_RMB_W;
	/**
	 * 发生争议合同份数
	 */
	int LAST_DISP_CONT_QTY;
	/**
	 * 发生争议合同金额
	 */
	double LAST_DISP_CONT_RMB_W;
	/**
	 * 累计争议合同份数
	 */
	int TOTAL_DISP_CONT_QTY;
	/**
	 * 累计争议合同金额
	 */
	double TOTAL_DISP_CONT_RMB_W;
	/**
	 * 解决争议合同份数
	 */
	int SOLVE_DISP_CONT_QTY;
	/**
	 * 解决争议合同金额
	 */
	double SOLVE_DISP_CONT_RMB_W;
	
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
	
	public int getTOTAL_CONT_QTY() {
		return TOTAL_CONT_QTY;
	}
	
	public void setTOTAL_CONT_QTY(int TOTAL_CONT_QTY) {
		this.TOTAL_CONT_QTY = TOTAL_CONT_QTY;
	}
	
	
	public double getTOTAL_CONT_RMB_W() {
		return TOTAL_CONT_RMB_W;
	}
	
	public void setTOTAL_CONT_RMB_W(double TOTAL_CONT_RMB_W) {
		this.TOTAL_CONT_RMB_W = TOTAL_CONT_RMB_W;
	}
	
	
	public int getLAST_CONT_QTY() {
		return LAST_CONT_QTY;
	}
	public void setLAST_CONT_QTY(int LAST_CONT_QTY) {
		this.LAST_CONT_QTY = LAST_CONT_QTY;
	}
	
	public double getLAST_CONT_RMB_W() {
		return LAST_CONT_RMB_W;
	}
	public void setLAST_CONT_RMB_W(double LAST_CONT_RMB_W) {
		this.LAST_CONT_RMB_W = LAST_CONT_RMB_W;
	}
	
	public int getPLAN_CONT_QTY() {
		return PLAN_CONT_QTY;
	}
	public void setPLAN_CONT_QTY(int PLAN_CONT_QTY) {
		this.PLAN_CONT_QTY = PLAN_CONT_QTY;
	}
	
	public double getPLAN_CONT_RMB_W() {
		return PLAN_CONT_RMB_W;
	}
	public void setPLAN_CONT_RMB_W(double PLAN_CONT_RMB_W) {
		this.PLAN_CONT_RMB_W = PLAN_CONT_RMB_W;
	}
	
	public int getREAL_CONT_QTY() {
		return REAL_CONT_QTY;
	}
	public void setREAL_CONT_QTY(int REAL_CONT_QTY) {
		this.REAL_CONT_QTY = REAL_CONT_QTY;
	}
	
	public double getREAL_CONT_RMB_W() {
		return REAL_CONT_RMB_W;
	}
	public void setREAL_CONT_RMB_W(double REAL_CONT_RMB_W) {
		this.REAL_CONT_RMB_W = REAL_CONT_RMB_W;
	}
	
	
	public int getCANCEL_CONT_QTY() {
		return CANCEL_CONT_QTY;
	}
	public void setCANCEL_CONT_QTY(int CANCEL_CONT_QTY) {
		this.CANCEL_CONT_QTY = CANCEL_CONT_QTY;
	}
	
	public double getCANCEL_CONT_RMB_W() {
		return CANCEL_CONT_RMB_W;
	}
	public void setCANCEL_CONT_RMB_W(double CANCEL_CONT_RMB_W) {
		this.CANCEL_CONT_RMB_W = CANCEL_CONT_RMB_W;
	}
	
	public int getCOMP_CONT_QTY() {
		return COMP_CONT_QTY;
	}
	public void setCOMP_CONT_QTY(int COMP_CONT_QTY) {
		this.COMP_CONT_QTY = COMP_CONT_QTY;
	} 
	public double getCOMP_CONT_RMB_W() {
		return COMP_CONT_RMB_W;
	}
	public void setCOMP_CONT_RMB_W(double COMP_CONT_RMB_W) {
		this.COMP_CONT_RMB_W = COMP_CONT_RMB_W;
	} 
	public int getOTHER_CONT_QTY() {
		return OTHER_CONT_QTY;
	}
	public void setOTHER_CONT_QTY(int OTHER_CONT_QTY) {
		this.OTHER_CONT_QTY = OTHER_CONT_QTY;
	} 
	public double getOTHER_CONT_RMB_W() {
		return OTHER_CONT_RMB_W;
	}
	public void setOTHER_CONT_RMB_W(double OTHER_CONT_RMB_W) {
		this.OTHER_CONT_RMB_W = OTHER_CONT_RMB_W;
	} 
	
	
	public int getCHANGE_CONT_QTY() {
		return CHANGE_CONT_QTY;
	}
	public void setCHANGE_CONT_QTY(int CHANGE_CONT_QTY) {
		this.CHANGE_CONT_QTY = CHANGE_CONT_QTY;
	} 
	public double getCHANGE_CONT_RMB_W() {
		return CHANGE_CONT_RMB_W;
	}
	public void setCHANGE_CONT_RMB_W(double CHANGE_CONT_RMB_W) {
		this.CHANGE_CONT_RMB_W = CHANGE_CONT_RMB_W;
	} 
	public int getOVERDUE_CONT_QTY() {
		return OVERDUE_CONT_QTY;
	}
	public void setOVERDUE_CONT_QTY(int OVERDUE_CONT_QTY) {
		this.OVERDUE_CONT_QTY = OVERDUE_CONT_QTY;
	} 
	public double getOVERDUE_CONT_RMB_W() {
		return OVERDUE_CONT_RMB_W;
	}
	public void setOVERDUE_CONT_RMB_W(double OVERDUE_CONT_RMB_W) {
		this.OVERDUE_CONT_RMB_W = OVERDUE_CONT_RMB_W;
	} 
	public int getDFT_OUR_QTY() {
		return DFT_OUR_QTY;
	}
	public void setDFT_OUR_QTY(int DFT_OUR_QTY) {
		this.DFT_OUR_QTY = DFT_OUR_QTY;
	} 
	public double getDFT_OUR_RMB_W() {
		return DFT_OUR_RMB_W;
	}
	public void setDFT_OUR_RMB_W(double DFT_OUR_RMB_W) {
		this.DFT_OUR_RMB_W = DFT_OUR_RMB_W;
	} 
	
	public int getDFT_THEY_QTY() {
		return DFT_THEY_QTY;
	}
	public void setDFT_THEY_QTY(int DFT_THEY_QTY) {
		this.DFT_THEY_QTY = DFT_THEY_QTY;
	} 
	public double getDFT_THEY_RMB_W() {
		return DFT_THEY_RMB_W;
	}
	public void setDFT_THEY_RMB_W(double DFT_THEY_RMB_W) {
		this.DFT_THEY_RMB_W = DFT_THEY_RMB_W;
	} 
	
	public int getDFT_GOD_QTY() {
		return DFT_GOD_QTY;
	}
	public void setDFT_GOD_QTY(int DFT_GOD_QTY) {
		this.DFT_GOD_QTY = DFT_GOD_QTY;
	} 
	public double getDFT_GOD_RMB_W() {
		return DFT_GOD_RMB_W;
	}
	public void setDFT_GOD_RMB_W(double DFT_GOD_RMB_W) {
		this.DFT_GOD_RMB_W = DFT_GOD_RMB_W;
	} 
	
	public int getTOTAL_DISP_CONT_QTY() {
		return TOTAL_DISP_CONT_QTY;
	}
	public void setTOTAL_DISP_CONT_QTY(int TOTAL_DISP_CONT_QTY) {
		this.TOTAL_DISP_CONT_QTY = TOTAL_DISP_CONT_QTY;
	} 
	public double getTOTAL_DISP_CONT_RMB_W() {
		return TOTAL_DISP_CONT_RMB_W;
	}
	public void setTOTAL_DISP_CONT_RMB_W(double TOTAL_DISP_CONT_RMB_W) {
		this.TOTAL_DISP_CONT_RMB_W = TOTAL_DISP_CONT_RMB_W;
	} 
	
	//
	public int getLAST_DISP_CONT_QTY() {
		return LAST_DISP_CONT_QTY;
	}
	public void setLAST_DISP_CONT_QTY(int LAST_DISP_CONT_QTY) {
		this.LAST_DISP_CONT_QTY = LAST_DISP_CONT_QTY;
	} 
	public double getLAST_DISP_CONT_RMB_W() {
		return LAST_DISP_CONT_RMB_W;
	}
	public void setLAST_DISP_CONT_RMB_W(double LAST_DISP_CONT_RMB_W) {
		this.LAST_DISP_CONT_RMB_W = LAST_DISP_CONT_RMB_W;
	} 
	//
	public int getSOLVE_DISP_CONT_QTY() {
		return SOLVE_DISP_CONT_QTY;
	}
	public void setSOLVE_DISP_CONT_QTY(int SOLVE_DISP_CONT_QTY) {
		this.SOLVE_DISP_CONT_QTY = SOLVE_DISP_CONT_QTY;
	} 
	public double getSOLVE_DISP_CONT_RMB_W() {
		return SOLVE_DISP_CONT_RMB_W;
	}
	public void setSOLVE_DISP_CONT_RMB_W(double SOLVE_DISP_CONT_RMB_W) {
		this.SOLVE_DISP_CONT_RMB_W = SOLVE_DISP_CONT_RMB_W;
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
	
	private void doSetlxqk_in(ResultSet rs) {
		try {
			REG_NO = rs.getString("REG_NO");
			EVAL_YEAR = rs.getString("EVAL_YEAR");
			REPORT_YEAR = rs.getString("REPORT_YEAR");
			TOTAL_CONT_QTY = Integer.parseInt(rs.getString("TOTAL_CONT_QTY"));
			TOTAL_CONT_RMB_W = Double.parseDouble(rs.getString("TOTAL_CONT_RMB_W"));
			LAST_CONT_QTY = Integer.parseInt(rs.getString("LAST_CONT_QTY"));
			LAST_CONT_RMB_W = Double.parseDouble(rs.getString("LAST_CONT_RMB_W"));
			PLAN_CONT_QTY = Integer.parseInt(rs.getString("PLAN_CONT_QTY"));
			PLAN_CONT_RMB_W = Double.parseDouble(rs.getString("PLAN_CONT_RMB_W"));
			REAL_CONT_QTY = Integer.parseInt(rs.getString("REAL_CONT_QTY"));
			REAL_CONT_RMB_W = Double.parseDouble(rs.getString("REAL_CONT_RMB_W"));
			CANCEL_CONT_QTY = Integer.parseInt(rs.getString("CANCEL_CONT_QTY"));
			CANCEL_CONT_RMB_W = Double.parseDouble(rs.getString("CANCEL_CONT_RMB_W"));
			COMP_CONT_QTY = Integer.parseInt(rs.getString("COMP_CONT_QTY"));
			COMP_CONT_RMB_W = Double.parseDouble(rs.getString("COMP_CONT_RMB_W"));
			OTHER_CONT_QTY = Integer.parseInt(rs.getString("OTHER_CONT_QTY"));
			OTHER_CONT_RMB_W = Double.parseDouble(rs.getString("OTHER_CONT_RMB_W"));
			CHANGE_CONT_QTY = Integer.parseInt(rs.getString("CHANGE_CONT_QTY"));
			CHANGE_CONT_RMB_W = Double.parseDouble(rs.getString("CHANGE_CONT_RMB_W"));
			OVERDUE_CONT_QTY = Integer.parseInt(rs.getString("OVERDUE_CONT_QTY"));
			OVERDUE_CONT_RMB_W = Double.parseDouble(rs.getString("OVERDUE_CONT_RMB_W"));
			DFT_OUR_QTY = Integer.parseInt(rs.getString("DFT_OUR_QTY"));
			DFT_OUR_RMB_W = Double.parseDouble(rs.getString("DFT_OUR_RMB_W"));
			DFT_THEY_QTY = Integer.parseInt(rs.getString("DFT_THEY_QTY"));
			DFT_THEY_RMB_W = Double.parseDouble(rs.getString("DFT_THEY_RMB_W"));
			DFT_GOD_QTY = Integer.parseInt(rs.getString("DFT_GOD_QTY"));
			DFT_GOD_RMB_W = Double.parseDouble(rs.getString("DFT_GOD_RMB_W"));
			
			LAST_DISP_CONT_QTY = Integer.parseInt(rs.getString("LAST_DISP_CONT_QTY"));
			LAST_DISP_CONT_RMB_W = Double.parseDouble(rs.getString("LAST_DISP_CONT_RMB_W"));
			TOTAL_DISP_CONT_QTY = Integer.parseInt(rs.getString("TOTAL_DISP_CONT_QTY"));
			TOTAL_DISP_CONT_RMB_W = Double.parseDouble(rs.getString("TOTAL_DISP_CONT_RMB_W"));
			SOLVE_DISP_CONT_QTY = Integer.parseInt(rs.getString("SOLVE_DISP_CONT_QTY"));
			SOLVE_DISP_CONT_RMB_W = Double.parseDouble(rs.getString("SOLVE_DISP_CONT_RMB_W"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	/**
	 *  保存数据
	 * @param szcp_SQ_lxqk_in
	 * @return
	 */
	public boolean saveData(SZCP_SQ_LXQK_IN lxqk_in) {
		boolean flag = false;
		DbConnection dbc=new DbConnection();
		PreparedStatement prsmt = null;
		String sql = "insert into szcp_sq_lxqk_in(REG_NO,EVAL_YEAR,REPORT_YEAR,TOTAL_CONT_QTY,TOTAL_CONT_RMB_W,LAST_CONT_QTY,LAST_CONT_RMB_W,PLAN_CONT_QTY,PLAN_CONT_RMB_W,REAL_CONT_QTY,REAL_CONT_RMB_W,CANCEL_CONT_QTY,CANCEL_CONT_RMB_W," +
				"COMP_CONT_QTY,COMP_CONT_RMB_W,OTHER_CONT_QTY,OTHER_CONT_RMB_W,CHANGE_CONT_QTY,CHANGE_CONT_RMB_W,OVERDUE_CONT_QTY,OVERDUE_CONT_RMB_W,DFT_OUR_QTY,DFT_OUR_RMB_W,DFT_THEY_QTY,DFT_THEY_RMB_W,DFT_GOD_QTY,DFT_GOD_RMB_W,LAST_DISP_CONT_QTY,LAST_DISP_CONT_RMB_W," +
				"TOTAL_DISP_CONT_QTY,TOTAL_DISP_CONT_RMB_W,SOLVE_DISP_CONT_QTY,SOLVE_DISP_CONT_RMB_W) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			prsmt = dbc.prepareStatement(sql);
			prsmt.setString(1, lxqk_in.getREG_NO());
			prsmt.setString(2, lxqk_in.getEVAL_YEAR());
			prsmt.setString(3,lxqk_in.getREPORT_YEAR());
			prsmt.setInt(4, lxqk_in.getTOTAL_CONT_QTY());
			prsmt.setDouble(5,lxqk_in.getTOTAL_CONT_RMB_W());
			prsmt.setInt(6, lxqk_in.getLAST_CONT_QTY());
			prsmt.setDouble(7, lxqk_in.getLAST_CONT_RMB_W());
			prsmt.setInt(8, lxqk_in.getPLAN_CONT_QTY());
			prsmt.setDouble(9, lxqk_in.getPLAN_CONT_RMB_W());
			prsmt.setInt(10, lxqk_in.getREAL_CONT_QTY());
			prsmt.setDouble(11, lxqk_in.getREAL_CONT_RMB_W());
			prsmt.setInt(12, lxqk_in.getCANCEL_CONT_QTY());
			prsmt.setDouble(13, lxqk_in.getCANCEL_CONT_RMB_W());
			prsmt.setInt(14, lxqk_in.getCOMP_CONT_QTY());
			prsmt.setDouble(15, lxqk_in.getCOMP_CONT_RMB_W());
			prsmt.setInt(16, lxqk_in.getOTHER_CONT_QTY());
			prsmt.setDouble(17, lxqk_in.getOTHER_CONT_RMB_W());
			prsmt.setInt(18, lxqk_in.getCHANGE_CONT_QTY());
			prsmt.setDouble(19, lxqk_in.getCHANGE_CONT_RMB_W());
			prsmt.setInt(20, lxqk_in.getOVERDUE_CONT_QTY());
			prsmt.setDouble(21, lxqk_in.getOVERDUE_CONT_RMB_W());
			prsmt.setInt(22, lxqk_in.getDFT_OUR_QTY());
			prsmt.setDouble(23, lxqk_in.getDFT_OUR_RMB_W());
			prsmt.setInt(24, lxqk_in.getDFT_THEY_QTY());
			prsmt.setDouble(25, lxqk_in.getDFT_THEY_RMB_W());
			prsmt.setInt(26, lxqk_in.getDFT_GOD_QTY());
			prsmt.setDouble(27, lxqk_in.getDFT_GOD_RMB_W());
			prsmt.setInt(28, lxqk_in.getLAST_DISP_CONT_QTY());
			prsmt.setDouble(29, lxqk_in.getLAST_DISP_CONT_RMB_W());
			prsmt.setInt(30, lxqk_in.getTOTAL_DISP_CONT_QTY());
			prsmt.setDouble(31, lxqk_in.getTOTAL_DISP_CONT_RMB_W());
			prsmt.setInt(32, lxqk_in.getSOLVE_DISP_CONT_QTY());
			prsmt.setDouble(33, lxqk_in.getSOLVE_DISP_CONT_RMB_W());
			int row = prsmt.executeUpdate();
			if(row > 0) {
				flag = true;
			}else {
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
	private boolean queryHistoryData(SZCP_SQ_LXQK_IN lxqk_in) {
		DbConnection dbConnection = new DbConnection();
		ResultSet set = null;
		boolean flag = false;
		String sql = "select count(*) as historycount from szcp_sq_lxqk_in where REG_NO = "+"'"+doPreProcess(lxqk_in.getREG_NO())+"'"+" and  EVAL_YEAR = "+"'"
			+doPreProcess(lxqk_in.getEVAL_YEAR())+"'"+"REPORT_YEAR = "+doPreProcess(lxqk_in.getREPORT_YEAR())+"'";
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
	
	public boolean executeNextStep(SZCP_SQ_LXQK_IN lxqk_in) {
		// 判断是否存在历史数据
		boolean flag = queryHistoryData(lxqk_in);
		// 查询流程
		if(flag) {
			// 执行更新操作
			flag = this.editData(lxqk_in);
		}else {
			// 执行插入操作
			flag = this.saveData(lxqk_in);
		}
		return flag;
	}
	
	private boolean editData(SZCP_SQ_LXQK_IN lxqk_in) {
		DbConnection dbc=new DbConnection();
		boolean flag = false;
		try {
			dbc.startTransaction();
			StringBuffer sb = new StringBuffer();
			sb.append(" update szcp_sq_lxqk_in set ")
			.append(" TOTAL_CONT_QTY = ").append("'").append(lxqk_in.getTOTAL_CONT_QTY()).append("',").append("TOTAL_CONT_RMB_W = ")
			.append("'").append(lxqk_in.getTOTAL_CONT_RMB_W()).append("',").append("LAST_CONT_QTY = ").append("'").append(lxqk_in.getLAST_CONT_QTY()).append("',").append("LAST_CONT_RMB_W= '").append(lxqk_in.getLAST_CONT_RMB_W()).append("', PLAN_CONT_QTY = '").append(lxqk_in.getPLAN_CONT_QTY()).append("',")
			.append("PLAN_CONT_RMB_W = ").append("'").append(lxqk_in.getPLAN_CONT_RMB_W()).append("',").append("REAL_CONT_QTY = ").append("'").append(lxqk_in.getREAL_CONT_QTY()).append("',").append("REAL_CONT_RMB_W = '").append(lxqk_in.getREAL_CONT_RMB_W()).append("', CANCEL_CONT_QTY='").append(lxqk_in.getCANCEL_CONT_QTY()).append("',CANCEL_CONT_RMB_W='").append(lxqk_in.getCANCEL_CONT_RMB_W()).append("',")
			.append(" COMP_CONT_QTY = '").append(lxqk_in.getCOMP_CONT_QTY()).append("',COMP_CONT_RMB_W='").append(lxqk_in.getCOMP_CONT_RMB_W()).append("',OTHER_CONT_QTY='").append(lxqk_in.getOTHER_CONT_QTY()).append("',OTHER_CONT_RMB_W='").append(lxqk_in.getOTHER_CONT_RMB_W()).append("',CHANGE_CONT_QTY='").append(lxqk_in.getOTHER_CONT_RMB_W()).append("',CHANGE_CONT_RMB_W='").append(lxqk_in.getCHANGE_CONT_RMB_W()).append("',OVERDUE_CONT_QTY='").append(lxqk_in.getOVERDUE_CONT_QTY()).append("',")
			.append(" OVERDUE_CONT_RMB_W = ").append("'").append(lxqk_in.getOVERDUE_CONT_RMB_W()).append("',")
			.append(" DFT_OUR_QTY = ").append("'").append(lxqk_in.getDFT_OUR_QTY()).append("',")
			.append(" DFT_OUR_RMB_W = ").append("'").append(lxqk_in.getDFT_OUR_RMB_W()).append("',")
			.append(" DFT_THEY_QTY = ").append("'").append(lxqk_in.getDFT_THEY_QTY()).append("',")
			.append(" DFT_THEY_RMB_W = ").append("'").append(lxqk_in.getDFT_THEY_RMB_W()).append("',")
			.append(" DFT_GOD_QTY = ").append("'").append(lxqk_in.getDFT_GOD_QTY()).append("',")
			.append(" DFT_GOD_RMB_W = ").append("'").append(lxqk_in.getDFT_GOD_RMB_W()).append("',")
			.append(" LAST_DISP_CONT_QTY = ").append("'").append(lxqk_in.getLAST_DISP_CONT_QTY()).append("',")
			.append(" LAST_DISP_CONT_RMB_W = ").append("'").append(lxqk_in.getLAST_DISP_CONT_RMB_W()).append("',")
			.append(" TOTAL_DISP_CONT_QTY = ").append("'").append(lxqk_in.getTOTAL_DISP_CONT_QTY()).append("',")
			.append(" TOTAL_DISP_CONT_RMB_W = ").append("'").append(lxqk_in.getTOTAL_DISP_CONT_RMB_W()).append("',")
			.append(" SOLVE_DISP_CONT_QTY = ").append("'").append(lxqk_in.getSOLVE_DISP_CONT_QTY()).append("',")
			.append(" SOLVE_DISP_CONT_RMB_W = ").append("'").append(lxqk_in.getSOLVE_DISP_CONT_RMB_W()).append("'")
			.append(" where EVAL_YEAR = ").append("'").append(lxqk_in.getEVAL_YEAR()).append("'")
			.append(" and REG_NO = ").append("'").append(lxqk_in.getREG_NO()).append("'").append(" and REPORT_YEAR = ").append(lxqk_in.getREPORT_YEAR()).append("'");
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
	
	public SZCP_SQ_LXQK_IN querySZCP_SQ_LXQK_IN(String regNo,String year,String REPORT_YEAR) {
		String sql = "select *from SZCP_SQ_LXQK_IN where REG_NO = "+"'"+regNo+"'"+" and EVAL_YEAR = "+"'"+year+"'"+" and REPORT_YEAR = "+"'"+REPORT_YEAR+"'";
		DbConnection connection = new DbConnection();
		ResultSet rs = null;
		SZCP_SQ_LXQK_IN lxqk_in = new SZCP_SQ_LXQK_IN();
		try {
			 rs = connection.executeQuery(sql);
			 if(rs.next()) {
				 lxqk_in = setValueToSZCP_SQ_LXQK_IN(rs);
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
		return lxqk_in;
	}
	
	private SZCP_SQ_LXQK_IN setValueToSZCP_SQ_LXQK_IN(ResultSet rs) {
		SZCP_SQ_LXQK_IN lxqk_in = new SZCP_SQ_LXQK_IN();
		try {
			lxqk_in.setREG_NO(rs.getString("REG_NO") == null ?"":rs.getString("REG_NO"));
			lxqk_in.setEVAL_YEAR(rs.getString("EVAL_YEAR") == null ?"":rs.getString("EVAL_YEAR"));
			lxqk_in.setREPORT_YEAR(rs.getString("REPORT_YEAR")==null?"":rs.getString("REPORT_YEAR"));
			lxqk_in.setTOTAL_CONT_QTY(rs.getInt("TOTAL_CONT_QTY"));
			lxqk_in.setTOTAL_CONT_RMB_W(rs.getDouble("TOTAL_CONT_RMB_W"));
			lxqk_in.setLAST_CONT_QTY(rs.getInt("LAST_CONT_QTY"));
			lxqk_in.setLAST_CONT_RMB_W(rs.getDouble("LAST_CONT_RMB_W"));
			lxqk_in.setPLAN_CONT_QTY(rs.getInt("PLAN_CONT_QTY"));
			lxqk_in.setPLAN_CONT_RMB_W(rs.getDouble("PLAN_CONT_RMB_W"));
			lxqk_in.setREAL_CONT_QTY(rs.getInt("REAL_CONT_QTY"));
			lxqk_in.setREAL_CONT_RMB_W(rs.getDouble("REAL_CONT_RMB_W"));
			lxqk_in.setCANCEL_CONT_QTY(rs.getInt("CANCEL_CONT_QTY"));
			lxqk_in.setCANCEL_CONT_RMB_W(rs.getDouble("CANCEL_CONT_RMB_W"));
			lxqk_in.setCOMP_CONT_QTY(rs.getInt("COMP_CONT_QTY"));
			lxqk_in.setCOMP_CONT_RMB_W(rs.getDouble("COMP_CONT_RMB_W"));
			lxqk_in.setOTHER_CONT_QTY(rs.getInt("OTHER_CONT_QTY"));
			lxqk_in.setOTHER_CONT_RMB_W(rs.getDouble("OTHER_CONT_RMB_W"));
			lxqk_in.setCHANGE_CONT_QTY(rs.getInt("CHANGE_CONT_QTY"));
			lxqk_in.setCHANGE_CONT_RMB_W(rs.getDouble("CHANGE_CONT_RMB_W"));
			lxqk_in.setOVERDUE_CONT_QTY(rs.getInt("OVERDUE_CONT_QTY"));
			lxqk_in.setOVERDUE_CONT_RMB_W(rs.getDouble("OVERDUE_CONT_RMB_W"));
			lxqk_in.setDFT_OUR_QTY(rs.getInt("DFT_OUR_QTY"));
			lxqk_in.setDFT_OUR_RMB_W(rs.getDouble("DFT_OUR_RMB_W"));
			lxqk_in.setDFT_THEY_QTY(rs.getInt("DFT_THEY_QTY"));
			lxqk_in.setDFT_THEY_RMB_W(rs.getDouble("DFT_THEY_RMB_W"));
			lxqk_in.setDFT_GOD_QTY(rs.getInt("DFT_GOD_QTY"));
			lxqk_in.setDFT_GOD_RMB_W(rs.getDouble("DFT_GOD_RMB_W"));
			lxqk_in.setLAST_DISP_CONT_QTY(rs.getInt("LAST_DISP_CONT_QTY"));
			lxqk_in.setLAST_DISP_CONT_RMB_W(rs.getDouble("LAST_DISP_CONT_RMB_W"));
			lxqk_in.setTOTAL_DISP_CONT_QTY(rs.getInt("TOTAL_DISP_CONT_QTY"));
			lxqk_in.setTOTAL_DISP_CONT_RMB_W(rs.getDouble("TOTAL_DISP_CONT_RMB_W"));
			lxqk_in.setSOLVE_DISP_CONT_QTY(rs.getInt("SOLVE_DISP_CONT_QTY"));
			lxqk_in.setSOLVE_DISP_CONT_RMB_W(rs.getDouble("SOLVE_DISP_CONT_RMB_W"));
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return lxqk_in;
	}
}
