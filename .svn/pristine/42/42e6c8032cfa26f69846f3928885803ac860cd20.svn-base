package com.macrosoft.icms.szcp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.macrosoft.icms.dbc.DbConnection;
import com.macrosoft.icms.szcp.SZCP_SQ_LXQK_IN;
import com.macrosoft.icms.szcp.SZCP_SQ_LXQK_OUT;
import com.macrosoft.icms.szcp.SZCP_SQ_LXQK_RATE;

public class SZCP_SQ_LXQKDao {
	
	/**
	 * 
	* @Title: executeNextStep 
	* @Description: ִ����һ��
	* @param @param szcp_sql_lxqk_in
	* @param @param szcp_sq_lxqk_out
	* @param @param szcp_sq_lxqk_rate
	* @param @return    �趨�ļ� 
	* @return boolean    �������� 
	* @throws
	 */
	public boolean executeNextStep(SZCP_SQ_LXQK_IN szcp_sql_lxqk_in,SZCP_SQ_LXQK_OUT szcp_sq_lxqk_out,SZCP_SQ_LXQK_RATE szcp_sq_lxqk_rate) {
		boolean flag = false;
		boolean lxqk_in_Flag = this.querySQ_LXQK_INHistoryData(szcp_sql_lxqk_in);
		boolean lxqk_out_Flag = this.querySQ_LXQK_OUTHistoryData(szcp_sq_lxqk_out);
		boolean lxqk_rate_Flag = this.querySQ_LXQK_RATEHistoryData(szcp_sq_lxqk_rate);
		// �������ִ�и���
		if(lxqk_in_Flag && lxqk_out_Flag && lxqk_rate_Flag) {
			flag = this.executeUpdate(szcp_sql_lxqk_in, szcp_sq_lxqk_out, szcp_sq_lxqk_rate);
		}else {
			// ִ�в���
			flag = this.executeInsert(szcp_sql_lxqk_in, szcp_sq_lxqk_out, szcp_sq_lxqk_rate);
		}
		return flag;
	}
	
	/**
	 * 
	* @Title: executeInsert 
	* @Description: ִ�в������
	* @param @param szcp_sql_lxqk_in
	* @param @param szcp_sq_lxqk_out
	* @param @param szcp_sq_lxqk_rate
	* @param @return    �趨�ļ� 
	* @return boolean    �������� 
	* @throws
	 */
	public boolean executeInsert(SZCP_SQ_LXQK_IN lxqk_in,
			SZCP_SQ_LXQK_OUT lxqk_out,
			SZCP_SQ_LXQK_RATE rate) {
		boolean flag = false;
		DbConnection dbc=new DbConnection();
		Connection conn = dbc.getConn();
		PreparedStatement prsmt = null;
		int row1 = 0;
		int row2 = 0;
		int row3 = 0;
		try {
			// ��������  ����������ύ��ʽΪ���Զ��ύ
			conn.setAutoCommit(false);
			String sql = "insert into SZCP_SQ_LXQK_OUT(REG_NO,EVAL_YEAR,REPORT_YEAR,TOTAL_CONT_QTY,TOTAL_CONT_RMB_W,LAST_CONT_QTY,LAST_CONT_RMB_W,PLAN_CONT_QTY,PLAN_CONT_RMB_W,REAL_CONT_QTY,REAL_CONT_RMB_W,CANCEL_CONT_QTY,CANCEL_CONT_RMB_W," +
					"COMP_CONT_QTY,COMP_CONT_RMB_W,OTHER_CONT_QTY,OTHER_CONT_RMB_W,CHANGE_CONT_QTY,CHANGE_CONT_RMB_W,OVERDUE_CONT_QTY,OVERDUE_CONT_RMB_W,DFT_OUR_QTY,DFT_OUR_RMB_W,DFT_THEY_QTY,DFT_THEY_RMB_W,DFT_GOD_QTY,DFT_GOD_RMB_W,LAST_DISP_CONT_QTY,LAST_DISP_CONT_RMB_W," +
					"TOTAL_DISP_CONT_QTY,TOTAL_DISP_CONT_RMB_W,SOLVE_DISP_CONT_QTY,SOLVE_DISP_CONT_RMB_W) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				prsmt = conn.prepareStatement(sql);
				prsmt.setString(1, lxqk_out.getREG_NO());
				prsmt.setString(2, lxqk_out.getEVAL_YEAR());
				prsmt.setString(3, lxqk_out.getREPORT_YEAR());
				prsmt.setInt(4, lxqk_out.getTOTAL_CONT_QTY());
				prsmt.setDouble(5,lxqk_out.getTOTAL_CONT_RMB_W());
				prsmt.setInt(6, lxqk_out.getLAST_CONT_QTY());
				prsmt.setDouble(7, lxqk_out.getLAST_CONT_RMB_W());
				prsmt.setInt(8, lxqk_out.getPLAN_CONT_QTY());
				prsmt.setDouble(9, lxqk_out.getPLAN_CONT_RMB_W());
				prsmt.setInt(10, lxqk_out.getREAL_CONT_QTY());
				prsmt.setDouble(11, lxqk_out.getREAL_CONT_RMB_W());
				prsmt.setInt(12, lxqk_out.getCANCEL_CONT_QTY());
				prsmt.setDouble(13, lxqk_out.getCANCEL_CONT_RMB_W());
				prsmt.setInt(14, lxqk_out.getCOMP_CONT_QTY());
				prsmt.setDouble(15, lxqk_out.getCOMP_CONT_RMB_W());
				prsmt.setInt(16, lxqk_out.getOTHER_CONT_QTY());
				prsmt.setDouble(17, lxqk_out.getOTHER_CONT_RMB_W());
				prsmt.setInt(18, lxqk_out.getCHANGE_CONT_QTY());
				prsmt.setDouble(19, lxqk_out.getCHANGE_CONT_RMB_W());
				prsmt.setInt(20, lxqk_out.getOVERDUE_CONT_QTY());
				prsmt.setDouble(21, lxqk_out.getOVERDUE_CONT_RMB_W());
				prsmt.setInt(22, lxqk_out.getDFT_OUR_QTY());
				prsmt.setDouble(23, lxqk_out.getDFT_OUR_RMB_W());
				prsmt.setInt(24, lxqk_out.getDFT_THEY_QTY());
				prsmt.setDouble(25, lxqk_out.getDFT_THEY_RMB_W());
				prsmt.setInt(26, lxqk_out.getDFT_GOD_QTY());
				prsmt.setDouble(27, lxqk_out.getDFT_GOD_RMB_W());
				prsmt.setInt(28, lxqk_out.getLAST_DISP_CONT_QTY());
				prsmt.setDouble(29, lxqk_out.getLAST_DISP_CONT_RMB_W());
				prsmt.setInt(30, lxqk_out.getTOTAL_DISP_CONT_QTY());
				prsmt.setDouble(31, lxqk_out.getTOTAL_DISP_CONT_RMB_W());
				prsmt.setInt(32, lxqk_out.getSOLVE_DISP_CONT_QTY());
				prsmt.setDouble(33, lxqk_out.getSOLVE_DISP_CONT_RMB_W());
				 row1 = prsmt.executeUpdate();
				
				
				String sql1 = "insert into szcp_sq_lxqk_in(REG_NO,EVAL_YEAR,REPORT_YEAR,TOTAL_CONT_QTY,TOTAL_CONT_RMB_W,LAST_CONT_QTY,LAST_CONT_RMB_W,PLAN_CONT_QTY,PLAN_CONT_RMB_W,REAL_CONT_QTY,REAL_CONT_RMB_W,CANCEL_CONT_QTY,CANCEL_CONT_RMB_W," +
						"COMP_CONT_QTY,COMP_CONT_RMB_W,OTHER_CONT_QTY,OTHER_CONT_RMB_W,CHANGE_CONT_QTY,CHANGE_CONT_RMB_W,OVERDUE_CONT_QTY,OVERDUE_CONT_RMB_W,DFT_OUR_QTY,DFT_OUR_RMB_W,DFT_THEY_QTY,DFT_THEY_RMB_W,DFT_GOD_QTY,DFT_GOD_RMB_W,LAST_DISP_CONT_QTY,LAST_DISP_CONT_RMB_W," +
						"TOTAL_DISP_CONT_QTY,TOTAL_DISP_CONT_RMB_W,SOLVE_DISP_CONT_QTY,SOLVE_DISP_CONT_RMB_W) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
					prsmt = conn.prepareStatement(sql1);
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
					 row2 = prsmt.executeUpdate();
				
					String sql3 = "insert into szcp_sq_lxqk_rate(REG_NO,EVAL_YEAR,REPORT_YEAR,RECV_PRFM_QTY_RATE,PAY_PRFM_QTY_RATE,RECV_AMT_RATE,PAY_AMT_RATE,REVOKE_RATE," +
					"COMP_RQTE,OTHER_RATE,CHANGE_RATE,OVERDUE_RATE,DFT_OUR_RATE,DFT_THEY_RATE,GOD_RATE,DISP_RATE," +
					"SOLVE_RATE )values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				prsmt = conn.prepareStatement(sql3);
				prsmt.setString(1, rate.getREG_NO());
				prsmt.setString(2, rate.getEVAL_YEAR());
				prsmt.setString(3,rate.getREPORT_YEAR());
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
				 row3 = prsmt.executeUpdate();
				// �ύ
				conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			if(conn != null) {
				try {
					conn.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
		}finally {
			if(conn != null) {
				try {
					conn.setAutoCommit(true);
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
			if(prsmt != null) {
				try {
					prsmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(row1 > 0 && row2 > 0 && row3 > 0) {
				flag = true;
			}else {
				flag = false;
			}
		}
		return flag;
	}

	
	/**
	 * 
	* @Title: executeUpdate 
	* @Description: ִ�и��·���
	* @param @param lxqk_in
	* @param @param lxqk_out
	* @param @param rate
	* @param @return    �趨�ļ� 
	* @return boolean    �������� 
	* @throws
	 */
	public boolean executeUpdate(SZCP_SQ_LXQK_IN lxqk_in,SZCP_SQ_LXQK_OUT lxqk_out,SZCP_SQ_LXQK_RATE rate) {
		boolean flag = false;
		DbConnection dbc=new DbConnection();
		try {
			dbc.startTransaction();
			StringBuffer sb = new StringBuffer();
			sb.append(" update SZCP_SQ_LXQK_OUT set ")
			.append(" TOTAL_CONT_QTY = ").append("'").append(lxqk_out.getTOTAL_CONT_QTY()).append("',").append("TOTAL_CONT_RMB_W = ")
			.append("'").append(lxqk_out.getTOTAL_CONT_RMB_W()).append("',").append("LAST_CONT_QTY = ").append("'").append(lxqk_out.getLAST_CONT_QTY()).append("',").append("LAST_CONT_RMB_W= '").append(lxqk_out.getLAST_CONT_RMB_W()).append("', PLAN_CONT_QTY = '").append(lxqk_out.getPLAN_CONT_QTY()).append("',")
			.append("PLAN_CONT_RMB_W = ").append("'").append(lxqk_out.getPLAN_CONT_RMB_W()).append("',").append("REAL_CONT_QTY = ").append("'").append(lxqk_out.getREAL_CONT_QTY()).append("',").append("REAL_CONT_RMB_W = '").append(lxqk_out.getREAL_CONT_RMB_W()).append("', CANCEL_CONT_QTY='").append(lxqk_out.getCANCEL_CONT_QTY()).append("',CANCEL_CONT_RMB_W='").append(lxqk_out.getCANCEL_CONT_RMB_W()).append("',")
			.append(" COMP_CONT_QTY = '").append(lxqk_out.getCOMP_CONT_QTY()).append("',COMP_CONT_RMB_W='").append(lxqk_out.getCOMP_CONT_RMB_W()).append("',OTHER_CONT_QTY='").append(lxqk_out.getOTHER_CONT_QTY()).append("',OTHER_CONT_RMB_W='").append(lxqk_out.getOTHER_CONT_RMB_W()).append("',CHANGE_CONT_QTY='").append(lxqk_out.getCHANGE_CONT_QTY()).append("',CHANGE_CONT_RMB_W='").append(lxqk_out.getCHANGE_CONT_RMB_W()).append("',OVERDUE_CONT_QTY='").append(lxqk_out.getOVERDUE_CONT_QTY()).append("',")
			.append(" OVERDUE_CONT_RMB_W = ").append("'").append(lxqk_out.getOVERDUE_CONT_RMB_W()).append("',")
			.append(" DFT_OUR_QTY = ").append("'").append(lxqk_out.getDFT_OUR_QTY()).append("',")
			.append(" DFT_OUR_RMB_W = ").append("'").append(lxqk_out.getDFT_OUR_RMB_W()).append("',")
			.append(" DFT_THEY_QTY = ").append("'").append(lxqk_out.getDFT_THEY_QTY()).append("',")
			.append(" DFT_THEY_RMB_W = ").append("'").append(lxqk_out.getDFT_THEY_RMB_W()).append("',")
			.append(" DFT_GOD_QTY = ").append("'").append(lxqk_out.getDFT_GOD_QTY()).append("',")
			.append(" DFT_GOD_RMB_W = ").append("'").append(lxqk_out.getDFT_GOD_RMB_W()).append("',")
			.append(" LAST_DISP_CONT_QTY = ").append("'").append(lxqk_out.getLAST_DISP_CONT_QTY()).append("',")
			.append(" LAST_DISP_CONT_RMB_W = ").append("'").append(lxqk_out.getLAST_DISP_CONT_RMB_W()).append("',")
			.append(" TOTAL_DISP_CONT_QTY = ").append("'").append(lxqk_out.getTOTAL_DISP_CONT_QTY()).append("',")
			.append(" TOTAL_DISP_CONT_RMB_W = ").append("'").append(lxqk_out.getTOTAL_DISP_CONT_RMB_W()).append("',")
			.append(" SOLVE_DISP_CONT_QTY = ").append("'").append(lxqk_out.getSOLVE_DISP_CONT_QTY()).append("',")
			.append(" SOLVE_DISP_CONT_RMB_W = ").append("'").append(lxqk_out.getSOLVE_DISP_CONT_RMB_W()).append("'")
			.append(" where EVAL_YEAR = ").append("'").append(lxqk_out.getEVAL_YEAR()).append("'").append(" and REG_NO = ")
			.append("'").append(lxqk_out.getREG_NO()).append("'").append(" and REPORT_YEAR = ").append("'").
			append(lxqk_out.getREPORT_YEAR()).append("'");
			
			
			StringBuffer rateSql = new StringBuffer();
			rateSql.append(" update SZCP_SQ_LXQK_RATE set ")
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
			.append("'").append(rate.getREG_NO()).append("'").append(" and REPORT_YEAR = ").append("'").
			append(rate.getREPORT_YEAR()).append("'");
			
			
			StringBuffer lxqkSql = new StringBuffer();
			lxqkSql.append(" update szcp_sq_lxqk_in set ")
			.append(" TOTAL_CONT_QTY = ").append("'").append(lxqk_in.getTOTAL_CONT_QTY()).append("',").append("TOTAL_CONT_RMB_W = ")
			.append("'").append(lxqk_in.getTOTAL_CONT_RMB_W()).append("',").append("LAST_CONT_QTY = ").append("'").append(lxqk_in.getLAST_CONT_QTY()).append("',").append("LAST_CONT_RMB_W= '").append(lxqk_in.getLAST_CONT_RMB_W()).append("', PLAN_CONT_QTY = '").append(lxqk_in.getPLAN_CONT_QTY()).append("',")
			.append("PLAN_CONT_RMB_W = ").append("'").append(lxqk_in.getPLAN_CONT_RMB_W()).append("',").append("REAL_CONT_QTY = ").append("'").append(lxqk_in.getREAL_CONT_QTY()).append("',").append("REAL_CONT_RMB_W = '").append(lxqk_in.getREAL_CONT_RMB_W()).append("', CANCEL_CONT_QTY='").append(lxqk_in.getCANCEL_CONT_QTY()).append("',CANCEL_CONT_RMB_W='").append(lxqk_in.getCANCEL_CONT_RMB_W()).append("',")
			.append(" COMP_CONT_QTY = '").append(lxqk_in.getCOMP_CONT_QTY()).append("',COMP_CONT_RMB_W='").append(lxqk_in.getCOMP_CONT_RMB_W()).append("',OTHER_CONT_QTY='").append(lxqk_in.getOTHER_CONT_QTY()).append("',OTHER_CONT_RMB_W='").append(lxqk_in.getOTHER_CONT_RMB_W()).append("',CHANGE_CONT_QTY='").append(lxqk_in.getCHANGE_CONT_QTY()).append("',CHANGE_CONT_RMB_W='").append(lxqk_in.getCHANGE_CONT_RMB_W()).append("',OVERDUE_CONT_QTY='").append(lxqk_in.getOVERDUE_CONT_QTY()).append("',")
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
			.append(" and REG_NO = ").append("'").append(lxqk_in.getREG_NO()).append("'").append(" and REPORT_YEAR = ").append("'").
			append(lxqk_in.getREPORT_YEAR()).append("'");
			
			dbc.addSQL(sb.toString());
			dbc.addSQL(rateSql.toString());
			dbc.addSQL(lxqkSql.toString());
			
			flag = dbc.endTransaction();
		} catch (SQLException e) {
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


	private boolean querySQ_LXQK_RATEHistoryData(SZCP_SQ_LXQK_RATE rate) {
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
	
	
	/**
	 * 
	* @Title: querySQ_LXQK_OUTHistoryData 
	* @Description: TODO(������һ�仰��������������) 
	* @param @param lxqk_out
	* @param @return    �趨�ļ� 
	* @return boolean    �������� 
	* @throws
	 */
	private boolean querySQ_LXQK_OUTHistoryData(SZCP_SQ_LXQK_OUT lxqk_out) {
		DbConnection dbConnection = new DbConnection();
		ResultSet set = null;
		boolean flag = false;
		String sql = "select count(*) as historycount from SZCP_SQ_LXQK_OUT where REG_NO = "+"'"+doPreProcess(lxqk_out.getREG_NO())+"'"+" and  EVAL_YEAR = "+"'"
			+doPreProcess(lxqk_out.getEVAL_YEAR())+"'";
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
	 * 
	* @Title: querySQ_LXQK_INHistoryData 
	* @Description: ��ѯ��ʷ
	* @param @param lxqk_in
	* @param @return    �趨�ļ� 
	* @return boolean    �������� 
	* @throws
	 */
	private boolean querySQ_LXQK_INHistoryData(SZCP_SQ_LXQK_IN lxqk_in) {
		DbConnection dbConnection = new DbConnection();
		ResultSet set = null;
		boolean flag = false;
		String sql = "select count(*) as historycount from szcp_sq_lxqk_in where REG_NO = "+"'"+doPreProcess(lxqk_in.getREG_NO())+"'"+" and  EVAL_YEAR = "+"'"
			+doPreProcess(lxqk_in.getEVAL_YEAR())+"'";
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
	 * 
	* @Title: queryHistoryData 
	* @param @param szcp_sql_lxqk_in
	* @param @param szcp_sq_lxqk_out
	* @param @param szcp_sq_lxqk_rate
	* @param @return    设定文件 
	* @return boolean    返回类型 
	* @throws
	 */
	public boolean queryHistoryData(SZCP_SQ_LXQK_IN szcp_sql_lxqk_in,SZCP_SQ_LXQK_OUT szcp_sq_lxqk_out,SZCP_SQ_LXQK_RATE szcp_sq_lxqk_rate) {
		boolean flag = false;
		boolean lxqk_in_Flag = this.querySQ_LXQK_INHistoryData(szcp_sql_lxqk_in);
		boolean lxqk_out_Flag = this.querySQ_LXQK_OUTHistoryData(szcp_sq_lxqk_out);
		boolean lxqk_rate_Flag = this.querySQ_LXQK_RATEHistoryData(szcp_sq_lxqk_rate);
		if(lxqk_in_Flag&&lxqk_out_Flag&&lxqk_rate_Flag) {
			flag = true;
			return flag;
		}else {
			return flag;
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public String doPreProcess( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess( sValue );	}
}
