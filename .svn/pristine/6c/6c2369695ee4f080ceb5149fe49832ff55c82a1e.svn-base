package com.macrosoft.icms.szcp.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.macrosoft.icms.dbc.DbConnection;
import com.macrosoft.icms.system.SysUtility;
import com.macrosoft.icms.szcp.SZCP_SQ_HT_XWGF;
import com.macrosoft.icms.szcp.SZCP_SQ_HT_XYGL;

/**
 * 
* @Title: SZCP_SQ_HT_XWGF.java 
* @Package com.macrosoft.icms.szcp 
* @author yuchengjian 
* @version V1.0
 */
public class SZCP_SQ_HT_XWGFDao {
	
	/**
	 * save or update
	 * @param xwgf
	 * @return true
	 * @author zz
	 */
	public boolean saveOrupdateXWGF(SZCP_SQ_HT_XWGF xwgf){
		DbConnection connection = new DbConnection();
		boolean flag = false;
		ResultSet xwgfRs = null;
		if(xwgf!=null){
//			查询
			String getXWGFsql = "select count(*) as xwgfCount from  SZCP_SQ_HT_XWGF where REG_NO = "+"'"+xwgf.getREG_NO()+"'"+" and EVAL_YEAR = "+"'"+xwgf.getEVAL_YEAR()+"'";
			try {
				//启动事务
				connection.startTransaction();
				xwgfRs=connection.executeQuery(getXWGFsql);
				if(xwgfRs.next()){
					if(xwgfRs.getInt("xwgfCount")==0){
						//增加
						StringBuffer addXWGFSql = new StringBuffer();
						addXWGFSql.append(" insert into SZCP_SQ_HT_XWGF(REG_NO,EVAL_YEAR,FC_ARCH_FLAG,FC_VIOL_FLAG,MODEL_TEXT_TYPE,DELEG_TYPE,SIGN_APPR_TYPE, ")
						.append("SA_QUAL_FLAG,SA_VALID_FLAG,SA_CREDIT_FLAG,SA_PERFORM_FLAG,MNG_ORG_FLAG,MNG_SORT_FLAG,ACCT_FORM_TYPE,ACCT_SERIAL_FLAG,ACCT_GUEST_FLAG,ACCT_WHEN_FLAG,ACCT_UNDLY_FLAG,")
						.append("ACCT_QTY_FLAG,ACCT_CAP_FLAG,ACCT_PLAN_TIME_FLAG,ACCT_REAL_TIME_FLAG,ACCT_PLAN_CAP_FLAG,ACCT_REAL_CAP_FLAG,ACCT_PERFOM_CERT_FLAG,ACCT_CHANGE_FLAG,GUEST_INFO_TYPE,GC_RECORD_FLAG,")
						.append("GC_THIRD_PART_FLAG,GC_RESERCH_FLAG,AM_RECV_AGE_FLAG,AM_OVERDUE_FLAG,AM_SPEC_RECOVER_FLAG,AM_RECV_SUM_FLAG,DFT_OVER_THREE_FLAG) values(")
						.append("'"+xwgf.getREG_NO()+"',").append("'"+xwgf.getEVAL_YEAR()+"',").append(xwgf.getFC_ARCH_FLAG()+",").append(xwgf.getFC_VIOL_FLAG()+",")
						.append("'"+xwgf.getMODEL_TEXT_TYPE()+"',").append("'"+xwgf.getDELEG_TYPE()+"',").append("'"+xwgf.getSIGN_APPR_TYPE()+"',")
						.append("'"+xwgf.getSA_QUAL_FLAG()+"',").append("'"+xwgf.getSA_VALID_FLAG()+"',").append("'"+xwgf.getSA_CREDIT_FLAG()+"',").append("'"+xwgf.getSA_PERFORM_FLAG()+"',").append("'"+xwgf.getMNG_ORG_FLAG()+"',").append("'"+xwgf.getMNG_SORT_FLAG()+"',").append("'"+xwgf.getACCT_FORM_TYPE()+"',")
						.append("'"+xwgf.getACCT_SERIAL_FLAG()+"',").append("'"+xwgf.getACCT_GUEST_FLAG()+"',").append("'"+xwgf.getACCT_WHEN_FLAG()+"',").append("'"+xwgf.getACCT_UNDLY_FLAG()+"',")
						.append("'"+xwgf.getACCT_QTY_FLAG()+"',").append("'"+xwgf.getACCT_CAP_FLAG()+"',").append("'"+xwgf.getACCT_PLAN_TIME_FLAG()+"',").append("'"+xwgf.getACCT_REAL_TIME_FLAG()+"',")
						.append("'"+xwgf.getACCT_PLAN_CAP_FLAG()+"',").append("'"+xwgf.getACCT_REAL_CAP_FLAG()+"',").append("'"+xwgf.getACCT_PERFOM_CERT_FLAG()+"',").append("'"+xwgf.getACCT_CHANGE_FLAG()+"',")
						.append("'"+xwgf.getGUEST_INFO_TYPE()+"',").append("'"+xwgf.getGC_RECORD_FLAG()+"',").append("'"+xwgf.getGC_THIRD_PART_FLAG()+"',").append("'"+xwgf.getGC_RESERCH_FLAG()+"',").append("'"+xwgf.getAM_RECV_AGE_FLAG()+"',")
						.append("'"+xwgf.getAM_OVERDUE_FLAG()+"',").append("'"+xwgf.getAM_SPEC_RECOVER_FLAG()+"',").append("'"+xwgf.getAM_RECV_SUM_FLAG()+"',").append("'"+xwgf.getDFT_OVER_THREE_FLAG()+"')");
						connection.addSQL(addXWGFSql.toString());
						flag = connection.endTransaction();
						
					}else{
						//更新
						StringBuffer updateXWGFsql = new StringBuffer();
						updateXWGFsql.append(" update SZCP_SQ_HT_XWGF set FC_ARCH_FLAG = ").append(xwgf.getFC_ARCH_FLAG()+",")
						.append(" FC_VIOL_FLAG  = ").append(xwgf.getFC_VIOL_FLAG()+",").append(" MODEL_TEXT_TYPE = ").append("'"+xwgf.getMODEL_TEXT_TYPE()+"',")
						.append(" DELEG_TYPE = ").append("'"+xwgf.getDELEG_TYPE()+"',")
						.append(" SIGN_APPR_TYPE = ").append("'"+xwgf.getSIGN_APPR_TYPE()+"',").append(" SA_QUAL_FLAG = ").append("'"+xwgf.getSA_QUAL_FLAG()+"'")
						.append(" ,SA_VALID_FLAG = ").append("'"+xwgf.getSA_VALID_FLAG()+"',").append(" SA_CREDIT_FLAG = ").append("'"+xwgf.getSA_CREDIT_FLAG()+"',")
						.append(" SA_PERFORM_FLAG = ").append("'"+xwgf.getSA_PERFORM_FLAG()+"',").append(" MNG_ORG_FLAG = ").append("'"+xwgf.getMNG_ORG_FLAG()+"',")
						.append(" MNG_SORT_FLAG = ").append("'"+xwgf.getMNG_SORT_FLAG()+"',").append(" ACCT_FORM_TYPE = ").append("'"+xwgf.getACCT_FORM_TYPE()+"',")
						.append(" ACCT_SERIAL_FLAG = ").append("'"+xwgf.getACCT_SERIAL_FLAG()+"',").append(" ACCT_GUEST_FLAG = ").append("'"+xwgf.getACCT_GUEST_FLAG()+"',")
						.append(" ACCT_WHEN_FLAG = ").append("'"+xwgf.getACCT_WHEN_FLAG()+"',").append(" ACCT_UNDLY_FLAG = ").append("'"+xwgf.getACCT_UNDLY_FLAG()+"',")
						.append(" ACCT_QTY_FLAG = ").append("'"+xwgf.getACCT_QTY_FLAG()+"',").append(" ACCT_CAP_FLAG = ").append("'"+xwgf.getACCT_CAP_FLAG()+"',")
						.append(" ACCT_PLAN_TIME_FLAG = ").append("'"+xwgf.getACCT_PLAN_TIME_FLAG()+"',").append(" ACCT_REAL_TIME_FLAG = ").append("'"+xwgf.getACCT_REAL_TIME_FLAG()+"',")
						.append(" ACCT_PLAN_CAP_FLAG = ").append("'"+xwgf.getACCT_PLAN_CAP_FLAG()+"',").append(" ACCT_REAL_CAP_FLAG = ").append("'"+xwgf.getACCT_REAL_CAP_FLAG()+"',")
						.append(" ACCT_PERFOM_CERT_FLAG = ").append("'"+xwgf.getACCT_PERFOM_CERT_FLAG()+"',").append(" ACCT_CHANGE_FLAG = ").append("'"+xwgf.getACCT_CHANGE_FLAG()+"',")
						.append(" GUEST_INFO_TYPE = ").append("'").append(xwgf.getGUEST_INFO_TYPE()).append("',").append(" GC_RECORD_FLAG = ").append("'"+xwgf.getGC_RECORD_FLAG()+"',")
						.append(" GC_THIRD_PART_FLAG = ").append("'"+xwgf.getGC_THIRD_PART_FLAG()).append("',").append(" GC_RESERCH_FLAG  = ").append("'"+xwgf.getGC_RESERCH_FLAG()+"',")
						.append(" AM_RECV_AGE_FLAG = ").append("'"+xwgf.getAM_RECV_AGE_FLAG()+"',").append(" AM_OVERDUE_FLAG = ").append("'"+xwgf.getAM_OVERDUE_FLAG()+"',")
						.append(" AM_SPEC_RECOVER_FLAG = ").append("'"+xwgf.getAM_SPEC_RECOVER_FLAG()+"',").append(" AM_RECV_SUM_FLAG = ").append("'"+xwgf.getAM_RECV_SUM_FLAG()+"',")
						.append(" DFT_OVER_THREE_FLAG = ").append("'"+xwgf.getDFT_OVER_THREE_FLAG()+"'")
						.append(" where REG_NO = ").append("'").append(xwgf.getREG_NO()).append("'").append(" and EVAL_YEAR = ").append("'").append(xwgf.getEVAL_YEAR()).append("'");
						connection.addSQL(updateXWGFsql.toString());
						flag =connection.endTransaction();
					}
				}
			} catch (Exception e) {
				// TODO: handle exception
			}finally{
				try {
					xwgfRs.close();
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return flag;
	}
	
	/**
	 * save or update
	 * @param xwgf
	 * @return true
	 * @author zz
	 */
	public boolean saveOrupdateXYGL(SZCP_SQ_HT_XYGL xygl){
		DbConnection connection = new DbConnection();
		boolean flag = false;
		ResultSet xwgfRs = null;
		if(xygl!=null){
//			查询
			String getXWGFsql = "select count(*) as xyglCount from  SZCP_SQ_HT_XYGL where REG_NO = "+"'"+xygl.getREG_NO()+"'"+" and EVAL_YEAR = "+"'"+xygl.getEVAL_YEAR()+"'";
			try {
				//启动事务
				connection.startTransaction();
				xwgfRs=connection.executeQuery(getXWGFsql);
				if(xwgfRs.next()){
					if(xwgfRs.getInt("xyglCount")==0){
						//增加
						StringBuffer addXYGLSql = new StringBuffer();
						addXYGLSql.append(" insert into SZCP_SQ_HT_XYGL(REG_NO,EVAL_YEAR,MNG_ORG_TYPE,OTHER_ORG_DESC,ORG_LEAD_NAME,ORG_LEAD_POS_TYPE,ORG_LEAD_TEL_NO,ORG_LEAD_QUAL_TYPE,QUAL_LEVEL_TYPE,MS_POS_RESP_FLAG,MS_DELEGATE_FLAG,")
						.append("MS_SIGN_REVIEW_FLAG,MS_SEAL_FILE_FLAG,MS_RISK_EMG_FLAG,MS_SIGN_CANCEL_FLAG,MS_RECV_ACCT_FLAG,MS_PAY_ACCT_FLAG,MS_GUEST_FLAG,FULLTIME_MNG_QTY,PARTTIME_MNG_QTY) values( ")
						.append("'"+xygl.getREG_NO()+"',").append("'"+xygl.getEVAL_YEAR()+"',").append("'"+xygl.getMNG_ORG_TYPE()+"',").append("'"+xygl.getOTHER_ORG_DESC()+"',").append("'"+xygl.getORG_LEAD_NAME()+"',")
						.append("'"+xygl.getORG_LEAD_POS_TYPE()+"',").append("'"+xygl.getORG_LEAD_TEL_NO()+"',").append("'"+xygl.getORG_LEAD_QUAL_TYPE()+"',")
						.append("'"+xygl.getQUAL_LEVEL_TYPE()+"',").append("'"+xygl.getMS_POS_RESP_FLAG()+"',").append("'"+xygl.getMS_DELEGATE_FLAG()+"',").append("'"+xygl.getMS_SIGN_REVIEW_FLAG()).append("',")
						.append("'"+xygl.getMS_SEAL_FILE_FLAG()+"',").append("'"+xygl.getMS_RISK_EMG_FLAG()+"',").append("'"+xygl.getMS_SIGN_CANCEL_FLAG()+"',").append("'"+xygl.getMS_RECV_ACCT_FLAG()+"',").append("'"+xygl.getMS_PAY_ACCT_FLAG()+"',")
						.append("'"+xygl.getMS_GUEST_FLAG()+"',").append(xygl.getFULLTIME_MNG_QTY()+",").append(xygl.getPARTTIME_MNG_QTY()+")");
						connection.addSQL(addXYGLSql.toString());
						flag = connection.endTransaction();
						
					}else{
						//更新
						StringBuffer updateXYGLSql = new StringBuffer();
						updateXYGLSql.append(" update SZCP_SQ_HT_XYGL set MNG_ORG_TYPE = ").append("'").append(xygl.getMNG_ORG_TYPE()).append("',")
						.append(" OTHER_ORG_DESC = ").append("'").append(xygl.getOTHER_ORG_DESC()).append("',").append(" ORG_LEAD_NAME = ").append("'"+xygl.getORG_LEAD_NAME()+"',")
						.append(" ORG_LEAD_POS_TYPE = ").append("'").append(xygl.getORG_LEAD_POS_TYPE()).append("',")
						.append(" ORG_LEAD_TEL_NO = ").append("'").append(xygl.getORG_LEAD_TEL_NO()).append("',")
						.append(" ORG_LEAD_QUAL_TYPE = ").append("'").append(xygl.getORG_LEAD_QUAL_TYPE()).append("',")
						.append(" QUAL_LEVEL_TYPE = ").append("'").append(xygl.getQUAL_LEVEL_TYPE()).append("',")
						.append(" MS_POS_RESP_FLAG = ").append("'"+xygl.getMS_POS_RESP_FLAG()+"'").append(",")
						.append(" MS_DELEGATE_FLAG = ").append("'"+xygl.getMS_DELEGATE_FLAG()+"'").append(",")
						.append(" MS_SIGN_REVIEW_FLAG = ").append("'"+xygl.getMS_SIGN_REVIEW_FLAG()+"'").append(",")
						.append(" MS_SEAL_FILE_FLAG = ").append("'"+xygl.getMS_SEAL_FILE_FLAG()+"'").append(",")
						.append(" MS_RISK_EMG_FLAG = ").append("'"+xygl.getMS_RISK_EMG_FLAG()+"'").append(",")
						.append(" MS_SIGN_CANCEL_FLAG = ").append("'"+xygl.getMS_SIGN_CANCEL_FLAG()+"'").append(",")
						.append(" MS_RECV_ACCT_FLAG = ").append("'"+xygl.getMS_RECV_ACCT_FLAG()+"'").append(",")
						.append(" MS_PAY_ACCT_FLAG = ").append("'"+xygl.getMS_PAY_ACCT_FLAG()+"'").append(",")
						.append(" MS_GUEST_FLAG = ").append("'"+xygl.getMS_GUEST_FLAG()+"'").append(",")
						.append(" FULLTIME_MNG_QTY = ").append(xygl.getFULLTIME_MNG_QTY()).append(",")
						.append(" PARTTIME_MNG_QTY = ").append(xygl.getPARTTIME_MNG_QTY())
						.append(" where REG_NO = ").append("'").append(xygl.getREG_NO()).append("'").append(" and EVAL_YEAR = ").append("'").append(xygl.getEVAL_YEAR()).append("'");
						connection.addSQL(updateXYGLSql.toString());
						flag =connection.endTransaction();
					}
				}
			} catch (Exception e) {
				// TODO: handle exception
			}finally{
				try {
					xwgfRs.close();
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return flag;
	}
	/**
	 * 
	* @Title: addData 
	* @param @param xwgf
	* @throws
	 */
	public boolean addData(SZCP_SQ_HT_XWGF xwgf,SZCP_SQ_HT_XYGL xygl) {
		DbConnection connection = new DbConnection();
		boolean flag = false;
		
		try {
			connection.startTransaction();
			StringBuffer xwgfSql = new StringBuffer();
			xwgfSql.append(" insert into SZCP_SQ_HT_XWGF(REG_NO,EVAL_YEAR,FC_ARCH_FLAG,FC_VIOL_FLAG,MODEL_TEXT_TYPE,DELEG_TYPE,SIGN_APPR_TYPE, ")
			.append("SA_QUAL_FLAG,SA_VALID_FLAG,SA_CREDIT_FLAG,SA_PERFORM_FLAG,MNG_ORG_FLAG,MNG_SORT_FLAG,ACCT_FORM_TYPE,ACCT_SERIAL_FLAG,ACCT_GUEST_FLAG,ACCT_WHEN_FLAG,ACCT_UNDLY_FLAG,")
			.append("ACCT_QTY_FLAG,ACCT_CAP_FLAG,ACCT_PLAN_TIME_FLAG,ACCT_REAL_TIME_FLAG,ACCT_PLAN_CAP_FLAG,ACCT_REAL_CAP_FLAG,ACCT_PERFOM_CERT_FLAG,ACCT_CHANGE_FLAG,GUEST_INFO_TYPE,GC_RECORD_FLAG,")
			.append("GC_THIRD_PART_FLAG,GC_RESERCH_FLAG,AM_RECV_AGE_FLAG,AM_OVERDUE_FLAG,AM_SPEC_RECOVER_FLAG,AM_RECV_SUM_FLAG,DFT_OVER_THREE_FLAG) values(")
			.append("'"+xwgf.getREG_NO()+"',").append("'"+xwgf.getEVAL_YEAR()+"',").append(xwgf.getFC_ARCH_FLAG()+",").append(xwgf.getFC_VIOL_FLAG()+",")
			.append("'"+xwgf.getMODEL_TEXT_TYPE()+"',").append("'"+xwgf.getDELEG_TYPE()+"',").append("'"+xwgf.getSIGN_APPR_TYPE()+"',")
			.append("'"+xwgf.getSA_QUAL_FLAG()+"',").append("'"+xwgf.getSA_VALID_FLAG()+"',").append("'"+xwgf.getSA_CREDIT_FLAG()+"',").append("'"+xwgf.getSA_PERFORM_FLAG()+"',").append("'"+xwgf.getMNG_ORG_FLAG()+"',").append("'"+xwgf.getMNG_SORT_FLAG()+"',").append("'"+xwgf.getACCT_FORM_TYPE()+"',")
			.append("'"+xwgf.getACCT_SERIAL_FLAG()+"',").append("'"+xwgf.getACCT_GUEST_FLAG()+"',").append("'"+xwgf.getACCT_WHEN_FLAG()+"',").append("'"+xwgf.getACCT_UNDLY_FLAG()+"',")
			.append("'"+xwgf.getACCT_QTY_FLAG()+"',").append("'"+xwgf.getACCT_CAP_FLAG()+"',").append("'"+xwgf.getACCT_PLAN_TIME_FLAG()+"',").append("'"+xwgf.getACCT_REAL_TIME_FLAG()+"',")
			.append("'"+xwgf.getACCT_PLAN_CAP_FLAG()+"',").append("'"+xwgf.getACCT_REAL_CAP_FLAG()+"',").append("'"+xwgf.getACCT_PERFOM_CERT_FLAG()+"',").append("'"+xwgf.getACCT_CHANGE_FLAG()+"',")
			.append("'"+xwgf.getGUEST_INFO_TYPE()+"',").append("'"+xwgf.getGC_RECORD_FLAG()+"',").append("'"+xwgf.getGC_THIRD_PART_FLAG()+"',").append("'"+xwgf.getGC_RESERCH_FLAG()+"',").append("'"+xwgf.getAM_RECV_AGE_FLAG()+"',")
			.append("'"+xwgf.getAM_OVERDUE_FLAG()+"',").append("'"+xwgf.getAM_SPEC_RECOVER_FLAG()+"',").append("'"+xwgf.getAM_RECV_SUM_FLAG()+"',").append("'"+xwgf.getDFT_OVER_THREE_FLAG()+"')");
			
			StringBuffer xyglSql = new StringBuffer();
			xyglSql.append(" insert into SZCP_SQ_HT_XYGL(REG_NO,EVAL_YEAR,MNG_ORG_TYPE,OTHER_ORG_DESC,ORG_LEAD_NAME,ORG_LEAD_POS_TYPE,ORG_LEAD_TEL_NO,ORG_LEAD_QUAL_TYPE,QUAL_LEVEL_TYPE,MS_POS_RESP_FLAG,MS_DELEGATE_FLAG,")
			.append("MS_SIGN_REVIEW_FLAG,MS_SEAL_FILE_FLAG,MS_RISK_EMG_FLAG,MS_SIGN_CANCEL_FLAG,MS_RECV_ACCT_FLAG,MS_PAY_ACCT_FLAG,MS_GUEST_FLAG,FULLTIME_MNG_QTY,PARTTIME_MNG_QTY) values( ")
			.append("'"+xygl.getREG_NO()+"',").append("'"+xygl.getEVAL_YEAR()+"',").append("'"+xygl.getMNG_ORG_TYPE()+"',").append("'"+xygl.getOTHER_ORG_DESC()+"',").append("'"+xygl.getORG_LEAD_NAME()+"',")
			.append("'"+xygl.getORG_LEAD_POS_TYPE()+"',").append("'"+xygl.getORG_LEAD_TEL_NO()+"',").append("'"+xygl.getORG_LEAD_QUAL_TYPE()+"',")
			.append("'"+xygl.getQUAL_LEVEL_TYPE()+"',").append("'"+xygl.getMS_POS_RESP_FLAG()+"',").append("'"+xygl.getMS_DELEGATE_FLAG()+"',").append("'"+xygl.getMS_SIGN_REVIEW_FLAG()).append("',")
			.append("'"+xygl.getMS_SEAL_FILE_FLAG()+"',").append("'"+xygl.getMS_RISK_EMG_FLAG()+"',").append("'"+xygl.getMS_SIGN_CANCEL_FLAG()+"',").append("'"+xygl.getMS_RECV_ACCT_FLAG()+"',").append("'"+xygl.getMS_PAY_ACCT_FLAG()+"',")
			.append("'"+xygl.getMS_GUEST_FLAG()+"',").append(xygl.getFULLTIME_MNG_QTY()+",").append(xygl.getPARTTIME_MNG_QTY()+")");
			
			connection.addSQL(xwgfSql.toString());
			connection.addSQL(xyglSql.toString());
			flag =connection.endTransaction();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return flag;
	}
	
	/**
	 * 
	* @Title: editData 
	* @param @param xwgf
	* @throws
	 */
	public boolean editData(SZCP_SQ_HT_XWGF xwgf,SZCP_SQ_HT_XYGL xygl) {
		DbConnection connection = new DbConnection();
		boolean flag = false;
		try {
			connection.startTransaction();
			StringBuffer xwgfSql = new StringBuffer();
			xwgfSql.append(" update SZCP_SQ_HT_XWGF set FC_ARCH_FLAG = ").append(xwgf.getFC_ARCH_FLAG()+",")
			.append(" FC_VIOL_FLAG  = ").append(xwgf.getFC_VIOL_FLAG()+",").append(" MODEL_TEXT_TYPE = ").append("'"+xwgf.getMODEL_TEXT_TYPE()+"',")
			.append(" DELEG_TYPE = ").append("'"+xwgf.getDELEG_TYPE()+"',")
			.append(" SIGN_APPR_TYPE = ").append("'"+xwgf.getSIGN_APPR_TYPE()+"',").append(" SA_QUAL_FLAG = ").append("'"+xwgf.getSA_QUAL_FLAG()+"'")
			.append(" ,SA_VALID_FLAG = ").append("'"+xwgf.getSA_VALID_FLAG()+"',").append(" SA_CREDIT_FLAG = ").append("'"+xwgf.getSA_CREDIT_FLAG()+"',")
			.append(" SA_PERFORM_FLAG = ").append("'"+xwgf.getSA_PERFORM_FLAG()+"',").append(" MNG_ORG_FLAG = ").append("'"+xwgf.getMNG_ORG_FLAG()+"',")
			.append(" MNG_SORT_FLAG = ").append("'"+xwgf.getMNG_SORT_FLAG()+"',").append(" ACCT_FORM_TYPE = ").append("'"+xwgf.getACCT_FORM_TYPE()+"',")
			.append(" ACCT_SERIAL_FLAG = ").append("'"+xwgf.getACCT_SERIAL_FLAG()+"',").append(" ACCT_GUEST_FLAG = ").append("'"+xwgf.getACCT_GUEST_FLAG()+"',")
			.append(" ACCT_WHEN_FLAG = ").append("'"+xwgf.getACCT_WHEN_FLAG()+"',").append(" ACCT_UNDLY_FLAG = ").append("'"+xwgf.getACCT_UNDLY_FLAG()+"',")
			.append(" ACCT_QTY_FLAG = ").append("'"+xwgf.getACCT_QTY_FLAG()+"',").append(" ACCT_CAP_FLAG = ").append("'"+xwgf.getACCT_CAP_FLAG()+"',")
			.append(" ACCT_PLAN_TIME_FLAG = ").append("'"+xwgf.getACCT_PLAN_TIME_FLAG()+"',").append(" ACCT_REAL_TIME_FLAG = ").append("'"+xwgf.getACCT_REAL_TIME_FLAG()+"',")
			.append(" ACCT_PLAN_CAP_FLAG = ").append("'"+xwgf.getACCT_PLAN_CAP_FLAG()+"',").append(" ACCT_REAL_CAP_FLAG = ").append("'"+xwgf.getACCT_REAL_CAP_FLAG()+"',")
			.append(" ACCT_PERFOM_CERT_FLAG = ").append("'"+xwgf.getACCT_PERFOM_CERT_FLAG()+"',").append(" ACCT_CHANGE_FLAG = ").append("'"+xwgf.getACCT_CHANGE_FLAG()+"',")
			.append(" GUEST_INFO_TYPE = ").append("'").append(xwgf.getGUEST_INFO_TYPE()).append("',").append(" GC_RECORD_FLAG = ").append("'"+xwgf.getGC_RECORD_FLAG()+"',")
			.append(" GC_THIRD_PART_FLAG = ").append("'"+xwgf.getGC_THIRD_PART_FLAG()).append("',").append(" GC_RESERCH_FLAG  = ").append("'"+xwgf.getGC_RESERCH_FLAG()+"',")
			.append(" AM_RECV_AGE_FLAG = ").append("'"+xwgf.getAM_RECV_AGE_FLAG()+"',").append(" AM_OVERDUE_FLAG = ").append("'"+xwgf.getAM_OVERDUE_FLAG()+"',")
			.append(" AM_SPEC_RECOVER_FLAG = ").append("'"+xwgf.getAM_SPEC_RECOVER_FLAG()+"',").append(" AM_RECV_SUM_FLAG = ").append("'"+xwgf.getAM_RECV_SUM_FLAG()+"',")
			.append(" DFT_OVER_THREE_FLAG = ").append("'"+xwgf.getDFT_OVER_THREE_FLAG()+"'")
			.append(" where REG_NO = ").append("'").append(xwgf.getREG_NO()).append("'").append(" and EVAL_YEAR = ").append("'").append(xwgf.getEVAL_YEAR()).append("'");
			
			StringBuffer xyglSql = new StringBuffer();
			xyglSql.append(" update SZCP_SQ_HT_XYGL set MNG_ORG_TYPE = ").append("'").append(xygl.getMNG_ORG_TYPE()).append("',")
			.append(" OTHER_ORG_DESC = ").append("'").append(xygl.getOTHER_ORG_DESC()).append("',").append(" ORG_LEAD_NAME = ").append("'"+xygl.getORG_LEAD_NAME()+"',")
			.append(" ORG_LEAD_POS_TYPE = ").append("'").append(xygl.getORG_LEAD_POS_TYPE()).append("',")
			.append(" ORG_LEAD_TEL_NO = ").append("'").append(xygl.getORG_LEAD_TEL_NO()).append("',")
			.append(" ORG_LEAD_QUAL_TYPE = ").append("'").append(xygl.getORG_LEAD_QUAL_TYPE()).append("',")
			.append(" QUAL_LEVEL_TYPE = ").append("'").append(xygl.getQUAL_LEVEL_TYPE()).append("',")
			.append(" MS_POS_RESP_FLAG = ").append("'"+xygl.getMS_POS_RESP_FLAG()+"'").append(",")
			.append(" MS_DELEGATE_FLAG = ").append("'"+xygl.getMS_DELEGATE_FLAG()+"'").append(",")
			.append(" MS_SIGN_REVIEW_FLAG = ").append("'"+xygl.getMS_SIGN_REVIEW_FLAG()+"'").append(",")
			.append(" MS_SEAL_FILE_FLAG = ").append("'"+xygl.getMS_SEAL_FILE_FLAG()+"'").append(",")
			.append(" MS_RISK_EMG_FLAG = ").append("'"+xygl.getMS_RISK_EMG_FLAG()+"'").append(",")
			.append(" MS_SIGN_CANCEL_FLAG = ").append("'"+xygl.getMS_SIGN_CANCEL_FLAG()+"'").append(",")
			.append(" MS_RECV_ACCT_FLAG = ").append("'"+xygl.getMS_RECV_ACCT_FLAG()+"'").append(",")
			.append(" MS_PAY_ACCT_FLAG = ").append("'"+xygl.getMS_PAY_ACCT_FLAG()+"'").append(",")
			.append(" MS_GUEST_FLAG = ").append("'"+xygl.getMS_GUEST_FLAG()+"'").append(",")
			.append(" FULLTIME_MNG_QTY = ").append(xygl.getFULLTIME_MNG_QTY()).append(",")
			.append(" PARTTIME_MNG_QTY = ").append(xygl.getPARTTIME_MNG_QTY())
			.append(" where REG_NO = ").append("'").append(xygl.getREG_NO()).append("'").append(" and EVAL_YEAR = ").append("'").append(xygl.getEVAL_YEAR()).append("'");
			
			connection.addSQL(xwgfSql.toString());
			connection.addSQL(xyglSql.toString());
			flag = connection.endTransaction();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return flag;
	}
	
	/**
	 * 
	* @Title: isEmptySZCP_SQ_HT_XYGL 
	* @param @param regNo
	* @param @param year
	* @throws
	 */
	public boolean isEmptySZCP_SQ_HT_XWGF(String regNo,String year) {
		String sql = "select count(*) as xwgfCount from  SZCP_SQ_HT_XWGF where REG_NO = "+"'"+regNo+"'"+" and EVAL_YEAR = "+"'"+year+"'";
		DbConnection connection = new DbConnection();
		ResultSet rs = null;
		boolean flag = false;
		try {
			 rs = connection.executeQuery(sql);
			 if(rs.next()) {
				 flag = Integer.parseInt(rs.getString("xwgfCount")) < 1?false:true;
			 }
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if(connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return flag;
	}
	
	public boolean emptySZCP_SQ_HT_XWGF(String regNo,String year) {
		String sql = "select count(*) as xwgfCount from  SZCP_SQ_HT_XWGF where REG_NO = "+"'"+regNo+"'"+" and EVAL_YEAR = "+"'"+year+"'";
		DbConnection connection = new DbConnection();
		ResultSet rs = null;
		boolean flag = false;
		try {
			 rs = connection.executeQuery(sql);
			 if(rs.next()) {
				 flag = Integer.parseInt(rs.getString("xwgfCount")) < 1?true:false;
			 }
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				if(connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return flag;
	}
	
	/**
	 * 
	* @Title: querySZCP_SQ_HT_XWGF 
	* @param @param year
	* @throws
	 */
	public SZCP_SQ_HT_XWGF querySZCP_SQ_HT_XWGF(String regNo,String year) {
		String sql = "select *from SZCP_SQ_HT_XWGF where REG_NO = "+"'"+regNo+"'"+" and EVAL_YEAR = "+"'"+year+"'";
		DbConnection connection = new DbConnection();
		ResultSet rs = null;
		SZCP_SQ_HT_XWGF xwgf = new SZCP_SQ_HT_XWGF();
		try {
			 rs = connection.executeQuery(sql);
			 if(rs.next()) {
				 xwgf = setValueToSZCP_SQ_HT_XWGF(rs);
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
		return xwgf;
	}
	
	/**
	 * 
	* @Title: queryAllDELEG_TYPE 
	* @throws
	 */
	public String queryAllDELEG_TYPE() {
		DbConnection dbc=new DbConnection();
		String sql = "select t.code, t.content from com_dm t where  t.type = 'SZCPHTSQWTGL'";
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
		try {
			 rs = dbc.executeQuery(sql);
			while(rs.next()) {
				sb.append("<option value= ").append("'").append(rs.getString("CODE")).append("'").append(">")
				.append(rs.getString("CONTENT").trim()).append("</option>").append("\n");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				dbc.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return sb.toString();
	}
	
	/**
	 * 
	* @Title: queryAllACCTFORMTYPE 
	* @throws
	 */
	public String queryAllACCTFORMTYPE() {
		DbConnection dbc=new DbConnection();
		String sql = "select t.code, t.content from com_dm t where  t.type = 'SZCPTZXYXXGLXS'";
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
		try {
			 rs = dbc.executeQuery(sql);
			while(rs.next()) {
				sb.append("<option value= ").append("'").append(rs.getString("CODE")).append("'").append(">")
				.append(rs.getString("CONTENT").trim()).append("</option>").append("\n");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				dbc.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return sb.toString();
	}
	
	
	
	
	/**
	 * 
	* @Title: queryACCTFORMTYPE 
	* @param @param acctFormType
	* @throws
	 */
	public String queryACCTFORMTYPE(String acctFormType) {
		DbConnection dbc=new DbConnection();
		String sqlOne = "select t.code,t.content from com_dm t where t.code = "+"'"+SysUtility.doPreProcess(acctFormType) +"'"+" and t.type = 'SZCPTZXYXXGLXS'";
		String sqlTwo = " select t.code, t.content from com_dm t where  t.type = 'SZCPTZXYXXGLXS'";
		String code = "";
		String content = " ";
		StringBuffer sb = new StringBuffer();
		ResultSet rs = null;
		try {
			 rs = dbc.executeQuery(sqlOne);
			if(rs.next()) {
				code = rs.getString("code");
				content = rs.getString("content");
			}
			rs = dbc.executeQuery(sqlTwo);
			while(rs.next()) {
				String tempCode = rs.getString("code");
				String tempContent = rs.getString("content");
				if(code.equals(tempCode)&& content.equals(tempContent)) {
					sb.append("<option value= ").append("'").append(tempCode).append("'").append("selected = 'selected' ")
					.append(">")
					.append(tempContent).append("</option>").append("\n");
				}else {
					sb.append("<option value= ").append("'").append(tempCode).append("'")
					.append(">")
					.append(tempContent).append("</option>").append("\n");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				dbc.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return  sb.toString();
	}
	
	/**
	 * 
	 * print
	* @Title: queryACCTFORMTYPE 
	* @param @param acctFormType
	* @throws
	 */
	public String queryACCTFORMTYPE_Print(String acctFormType,String type) {
		DbConnection dbc=new DbConnection();
		String sqlOne = "select t.code,t.content from com_dm t where t.code = "+"'"+SysUtility.doPreProcess(acctFormType) +"'"+" and t.type = 'SZCPTZXYXXGLXS'";
		String sqlTwo = " select t.code, t.content from com_dm t where  t.type = 'SZCPTZXYXXGLXS'";
		String code = "";
		String content = " ";
		StringBuffer sb = new StringBuffer();
		ResultSet rs = null;
		if(type!=null&&type.equals("exp")){
			try {
				 rs = dbc.executeQuery(sqlOne);
				if(rs.next()) {
					code = rs.getString("code");
					content = rs.getString("content");
				}
				rs = dbc.executeQuery(sqlTwo);
				while(rs.next()) {
					String tempCode = rs.getString("code");
					String tempContent = rs.getString("content");
					if(code.equals(tempCode)&& content.equals(tempContent)) {
						sb.append("√"+tempContent).append("\n").append("<br>");
					}else {
						sb
						.append("□"+tempContent).append("\n").append("<br>");
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				try {
					dbc.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return  sb.toString();
		}
		try {
			 rs = dbc.executeQuery(sqlOne);
			if(rs.next()) {
				code = rs.getString("code");
				content = rs.getString("content");
			}
			rs = dbc.executeQuery(sqlTwo);
			while(rs.next()) {
				String tempCode = rs.getString("code");
				String tempContent = rs.getString("content");
				if(code.equals(tempCode)&& content.equals(tempContent)) {
					sb.append("<input value= ").append("'").append(tempCode).append("'").append("checked = 'checked' disabled ='disabled' ").append(" type=").append("'radio'")
					.append(">")
					.append(tempContent).append("</optioinputn>").append("\n").append("<br>");
				}else {
					sb.append("<input value= ").append("'").append(tempCode).append("'").append(" type=").append("'radio'").append("disabled ='disabled'")
					.append(">")
					.append(tempContent).append("</input>").append("\n").append("<br>");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				dbc.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return  sb.toString();
	}
	
	/**
	 * 
	* @Title: querySIGNAPPRTYPE 
	* @param @param singApprType
	* @throws
	 */
	public String querySIGNAPPRTYPE(String singApprType) {
		DbConnection dbc=new DbConnection();
		String sqlOne = "select t.code,t.content from com_dm t where t.code = "+"'"+SysUtility.doPreProcess(singApprType) +"'"+" and t.type = 'SZCPHTQDSP'";
		String sqlTwo = " select t.code, t.content from com_dm t where  t.type = 'SZCPHTQDSP'";
		String code = "";
		String content = " ";
		StringBuffer sb = new StringBuffer();
		ResultSet rs = null;
		try {
			 rs = dbc.executeQuery(sqlOne);
			if(rs.next()) {
				code = rs.getString("code");
				content = rs.getString("content");
			}
			rs = dbc.executeQuery(sqlTwo);
			while(rs.next()) {
				String tempCode = rs.getString("code");
				String tempContent = rs.getString("content");
				if(code.equals(tempCode)&& content.equals(tempContent)) {
					sb.append("<option value= ").append("'").append(tempCode).append("'").append("selected = 'selected' ")
					.append(">")
					.append(tempContent).append("</option>").append("\n");
				}else {
					sb.append("<option value= ").append("'").append(tempCode).append("'")
					.append(">")
					.append(tempContent).append("</option>").append("\n");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				dbc.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return  sb.toString();
	}
	
	/**
	 * 
	 * print
	* @Title: querySIGNAPPRTYPE 
	* @Description: 
	* @param @param singApprType
	* @param @return    
	* @return String    
	* @throws
	 */
	public String querySIGNAPPRTYPE_Print(String singApprType,String type) {
		DbConnection dbc=new DbConnection();
		String sqlOne = "select t.code,t.content from com_dm t where t.code = "+"'"+SysUtility.doPreProcess(singApprType) +"'"+" and t.type = 'SZCPHTQDSP'";
		String sqlTwo = " select t.code, t.content from com_dm t where  t.type = 'SZCPHTQDSP'";
		String code = "";
		String content = " ";
		StringBuffer sb = new StringBuffer();
		ResultSet rs = null;
		if(type!=null&&type.equals("exp")){
			try {
				 rs = dbc.executeQuery(sqlOne);
				if(rs.next()) {
					code = rs.getString("code");
					content = rs.getString("content");
				}
				rs = dbc.executeQuery(sqlTwo);
				while(rs.next()) {
					String tempCode = rs.getString("code");
					String tempContent = rs.getString("content");
					if(code.equals(tempCode)&& content.equals(tempContent)) {
						sb
						.append("√"+tempContent).append("\n").append("<br>");
					}else {
						sb
						.append("□"+tempContent).append("\n").append("<br>");;
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				try {
					dbc.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return  sb.toString();
		}
		try {
			 rs = dbc.executeQuery(sqlOne);
			if(rs.next()) {
				code = rs.getString("code");
				content = rs.getString("content");
			}
			rs = dbc.executeQuery(sqlTwo);
			while(rs.next()) {
				String tempCode = rs.getString("code");
				String tempContent = rs.getString("content");
				if(code.equals(tempCode)&& content.equals(tempContent)) {
					sb.append("<input value= ").append("'").append(tempCode).append("'").append("checked = 'checked' disabled ='disabled' ").append(" type=").append("'checkbox'")
					.append(">")
					.append(tempContent).append("</input>").append("\n").append("<br>");
				}else {
					sb.append("<input value= ").append("'").append(tempCode).append("'").append(" type=").append("'checkbox'").append("disabled ='disabled'")
					.append(">")
					.append(tempContent).append("</input>").append("\n").append("<br>");;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				dbc.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return  sb.toString();
	}
	
	
	
	
	
	/**
	 * 
	* @Title: queryAllSIGNAPPRTYPE 
	* @Description: 
	* @param @return    
	* @return String  
	* @throws
	 */
	public String queryAllSIGNAPPRTYPE() {
		DbConnection dbc=new DbConnection();
		String sql = "select t.code, t.content from com_dm t where  t.type = 'SZCPHTQDSP'";
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
		try {
			 rs = dbc.executeQuery(sql);
			while(rs.next()) {
				sb.append("<option value= ").append("'").append(rs.getString("CODE")).append("'").append(">")
				.append(rs.getString("CONTENT").trim()).append("</option>").append("\n");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				dbc.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return sb.toString();
	}
	
	
	
	/**
	 * 
	* @Title: queryDELEG_TYPE 
	* @Description: 
	* @param @param DELEG_TYPEVIEW
	* @param @return    
	* @return String  
	* @throws
	 */
	public String queryDELEG_TYPE(String DELEG_TYPEVIEW) {
		DbConnection dbc=new DbConnection();
		String sqlOne = "select t.code,t.content from com_dm t where t.code = "+"'"+SysUtility.doPreProcess(DELEG_TYPEVIEW) +"'"+" and t.type = 'SZCPHTSQWTGL'";
		String sqlTwo = " select t.code, t.content from com_dm t where  t.type = 'SZCPHTSQWTGL'";
		String code = "";
		String content = " ";
		StringBuffer sb = new StringBuffer();
		ResultSet rs = null;
		try {
			 rs = dbc.executeQuery(sqlOne);
			if(rs.next()) {
				code = rs.getString("code");
				content = rs.getString("content");
			}
			rs = dbc.executeQuery(sqlTwo);
			while(rs.next()) {
				String tempCode = rs.getString("code");
				String tempContent = rs.getString("content");
				if(code.equals(tempCode)&& content.equals(tempContent)) {
					sb.append("<option value= ").append("'").append(tempCode).append("'").append("selected = 'selected' ")
					.append(">")
					.append(tempContent).append("</option>").append("\n");
				}else {
					sb.append("<option value= ").append("'").append(tempCode).append("'")
					.append(">")
					.append(tempContent).append("</option>").append("\n");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				dbc.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return  sb.toString();
	}
	
	/**
	 * 
	 * print and expWord
	* @Title: queryDELEG_TYPE 
	* @Description: 
	* @param @param DELEG_TYPEVIEW
	* @param @return    
	* @return String    
	* @throws
	 */
	public String queryDELEG_TYPE_Print(String DELEG_TYPEVIEW,String type) {
		DbConnection dbc=new DbConnection();
		String sqlOne = "select t.code,t.content from com_dm t where t.code = "+"'"+SysUtility.doPreProcess(DELEG_TYPEVIEW) +"'"+" and t.type = 'SZCPHTSQWTGL'";
		String sqlTwo = " select t.code, t.content from com_dm t where  t.type = 'SZCPHTSQWTGL'";
		String code = "";
		String content = " ";
		StringBuffer sb = new StringBuffer();
		ResultSet rs = null;
		if(type!=null&&type.equals("exp")){
			try {
				 rs = dbc.executeQuery(sqlOne);
				if(rs.next()) {
					code = rs.getString("code");
					content = rs.getString("content");
				}
				rs = dbc.executeQuery(sqlTwo);
				while(rs.next()) {
					String tempCode = rs.getString("code");
					String tempContent = rs.getString("content");
					if(code.equals(tempCode)&& content.equals(tempContent)) {
						sb
						.append("√"+tempContent).append("\n");
					}else {
						sb.append("□"+tempContent).append("\n");
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				try {
					dbc.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return  sb.toString();
		}
		try {
			 rs = dbc.executeQuery(sqlOne);
			if(rs.next()) {
				code = rs.getString("code");
				content = rs.getString("content");
			}
			rs = dbc.executeQuery(sqlTwo);
			while(rs.next()) {
				String tempCode = rs.getString("code");
				String tempContent = rs.getString("content");
				if(code.equals(tempCode)&& content.equals(tempContent)) {
					sb.append("<input value= ").append("'").append(tempCode).append("'").append("checked = 'checked' ").append(" type=").append("'checkbox'")
					.append(">")
					.append(tempContent).append("</input>").append("\n");
				}else {
					sb.append("<input value= ").append("'").append(tempCode).append("'").append(" type=").append("'checkbox'")
					.append(">")
					.append(tempContent).append("</input>").append("\n");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				dbc.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return  sb.toString();
	}
	
	
	/**
	 * 
	* @Title: setValueToSZCP_SQ_HT_XWGF 
	* @Description
	* @param @param rs   
	* @return void    
	* @throws
	 */
	private SZCP_SQ_HT_XWGF setValueToSZCP_SQ_HT_XWGF(ResultSet rs) {
		SZCP_SQ_HT_XWGF xwgf = new SZCP_SQ_HT_XWGF();
		try {
			xwgf.setREG_NO(rs.getString("REG_NO") == null ?"":rs.getString("REG_NO"));
			xwgf.setEVAL_YEAR(rs.getString("EVAL_YEAR") == null ?"":rs.getString("EVAL_YEAR"));
			xwgf.setFC_ARCH_FLAG(rs.getString("FC_ARCH_FLAG") == null?"":rs.getString("FC_ARCH_FLAG"));
			xwgf.setFC_VIOL_FLAG(rs.getString("FC_VIOL_FLAG") == null?"":rs.getString("FC_VIOL_FLAG"));
			xwgf.setMODEL_TEXT_TYPE(rs.getString("MODEL_TEXT_TYPE") == null ?"":rs.getString("MODEL_TEXT_TYPE"));
			xwgf.setDELEG_TYPE(rs.getString("DELEG_TYPE") == null ?"":rs.getString("DELEG_TYPE"));
			xwgf.setSIGN_APPR_TYPE(rs.getString("SIGN_APPR_TYPE") == null ?"":rs.getString("SIGN_APPR_TYPE"));
			xwgf.setSA_QUAL_FLAG(rs.getString("SA_QUAL_FLAG") == null ?"":rs.getString("SA_QUAL_FLAG"));
			xwgf.setSA_VALID_FLAG(rs.getString("SA_VALID_FLAG") == null ?"":rs.getString("SA_VALID_FLAG"));
			xwgf.setSA_CREDIT_FLAG(rs.getString("SA_CREDIT_FLAG") == null ?"":rs.getString("SA_CREDIT_FLAG"));
			xwgf.setSA_PERFORM_FLAG(rs.getString("SA_PERFORM_FLAG") == null ?"":rs.getString("SA_PERFORM_FLAG"));
			xwgf.setMNG_ORG_FLAG(rs.getString("MNG_ORG_FLAG") == null ?"":rs.getString("MNG_ORG_FLAG"));
			xwgf.setMNG_SORT_FLAG(rs.getString("MNG_SORT_FLAG") == null ?"":rs.getString("MNG_SORT_FLAG"));
			xwgf.setACCT_FORM_TYPE(rs.getString("ACCT_FORM_TYPE") == null ?"":rs.getString("ACCT_FORM_TYPE"));
			xwgf.setACCT_SERIAL_FLAG(rs.getString("ACCT_SERIAL_FLAG") == null ?"":rs.getString("ACCT_SERIAL_FLAG"));
			xwgf.setACCT_GUEST_FLAG(rs.getString("ACCT_GUEST_FLAG") == null ?"":rs.getString("ACCT_GUEST_FLAG"));
			xwgf.setACCT_WHEN_FLAG(rs.getString("ACCT_WHEN_FLAG") == null?"":rs.getString("ACCT_WHEN_FLAG"));
			xwgf.setACCT_UNDLY_FLAG(rs.getString("ACCT_UNDLY_FLAG")== null ?"":rs.getString("ACCT_UNDLY_FLAG"));
			xwgf.setACCT_QTY_FLAG(rs.getString("ACCT_QTY_FLAG")== null ?"":rs.getString("ACCT_QTY_FLAG"));
			xwgf.setACCT_CAP_FLAG(rs.getString("ACCT_CAP_FLAG") == null ?"":rs.getString("ACCT_CAP_FLAG"));
			xwgf.setACCT_PLAN_TIME_FLAG(rs.getString("ACCT_PLAN_TIME_FLAG") == null ?"":rs.getString("ACCT_PLAN_TIME_FLAG"));
			xwgf.setACCT_REAL_TIME_FLAG(rs.getString("ACCT_REAL_TIME_FLAG") == null ?"":rs.getString("ACCT_REAL_TIME_FLAG"));
			xwgf.setACCT_PLAN_CAP_FLAG(rs.getString("ACCT_PLAN_CAP_FLAG") == null ?"":rs.getString("ACCT_PLAN_CAP_FLAG"));
			xwgf.setACCT_REAL_CAP_FLAG(rs.getString("ACCT_REAL_CAP_FLAG") == null ?"":rs.getString("ACCT_REAL_CAP_FLAG"));
			xwgf.setACCT_PERFOM_CERT_FLAG(rs.getString("ACCT_PERFOM_CERT_FLAG") == null ?"":rs.getString("ACCT_PERFOM_CERT_FLAG"));
			xwgf.setACCT_CHANGE_FLAG(rs.getString("ACCT_CHANGE_FLAG") == null?"":rs.getString("ACCT_CHANGE_FLAG"));
			xwgf.setGUEST_INFO_TYPE(rs.getString("GUEST_INFO_TYPE") == null ?"":rs.getString("GUEST_INFO_TYPE"));
			xwgf.setGC_RECORD_FLAG(rs.getString("GC_RECORD_FLAG") == null ?"":rs.getString("GC_RECORD_FLAG") );
			xwgf.setGC_THIRD_PART_FLAG(rs.getString("GC_THIRD_PART_FLAG")== null ?"":rs.getString("GC_THIRD_PART_FLAG"));
			xwgf.setGC_RESERCH_FLAG(rs.getString("GC_RESERCH_FLAG") == null ?"":rs.getString("GC_RESERCH_FLAG"));
			xwgf.setAM_RECV_AGE_FLAG(rs.getString("AM_RECV_AGE_FLAG") == null ?"":rs.getString("AM_RECV_AGE_FLAG"));
			xwgf.setAM_OVERDUE_FLAG(rs.getString("AM_OVERDUE_FLAG") == null ?"":rs.getString("AM_OVERDUE_FLAG"));
			xwgf.setAM_SPEC_RECOVER_FLAG(rs.getString("AM_SPEC_RECOVER_FLAG")== null ?"":rs.getString("AM_SPEC_RECOVER_FLAG"));
			xwgf.setAM_RECV_SUM_FLAG(rs.getString("AM_RECV_SUM_FLAG") == null ?"":rs.getString("AM_RECV_SUM_FLAG"));
			xwgf.setDFT_OVER_THREE_FLAG(rs.getString("DFT_OVER_THREE_FLAG") == null ?"":rs.getString("DFT_OVER_THREE_FLAG"));
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return xwgf;
	}
	
}
