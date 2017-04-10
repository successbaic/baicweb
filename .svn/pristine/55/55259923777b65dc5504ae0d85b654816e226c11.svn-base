package com.macrosoft.icms.szcp;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.macrosoft.icms.dbc.DbConnection;

import oracle.jdbc.driver.DBConversion;


public class SZCP_SQ_HT_XWGF_SL {
	String REG_NO;
	String EVAL_YEAR;
	String REPORT_YEAR;
	float INC_SIGN_RATE;
	float EXP_SIGN_RATE;
	float MODEL_TEXT_US_RATE;
	int LAST_DFT_OUR_QTY;
	int LAST_DFT_THEY__QTY;
	int DISP_COMP_QTY;
	int DISP_MED_QTY;
	int DISP_ARB_QTY;
	int DISP_LAW_QTY;
	public String getREG_NO() {
		return REG_NO;
	}
	public void setREG_NO(String reg_no) {
		REG_NO = reg_no;
	}
	public String getEVAL_YEAR() {
		return EVAL_YEAR;
	}
	public void setEVAL_YEAR(String eval_year) {
		EVAL_YEAR = eval_year;
	}
	public String getREPORT_YEAR() {
		return REPORT_YEAR;
	}
	public void setREPORT_YEAR(String report_year) {
		REPORT_YEAR = report_year;
	}
	public float getINC_SIGN_RATE() {
		return INC_SIGN_RATE;
	}
	public void setINC_SIGN_RATE(float inc_sign_rate) {
		INC_SIGN_RATE = inc_sign_rate;
	}
	public float getEXP_SIGN_RATE() {
		return EXP_SIGN_RATE;
	}
	public void setEXP_SIGN_RATE(float exp_sign_rate) {
		EXP_SIGN_RATE = exp_sign_rate;
	}
	public float getMODEL_TEXT_US_RATE() {
		return MODEL_TEXT_US_RATE;
	}
	public void setMODEL_TEXT_US_RATE(float model_text_us_rate) {
		MODEL_TEXT_US_RATE = model_text_us_rate;
	}
	public int getLAST_DFT_OUR_QTY() {
		return LAST_DFT_OUR_QTY;
	}
	public void setLAST_DFT_OUR_QTY(int last_dft_our_qty) {
		LAST_DFT_OUR_QTY = last_dft_our_qty;
	}
	public int getLAST_DFT_THEY__QTY() {
		return LAST_DFT_THEY__QTY;
	}
	public void setLAST_DFT_THEY__QTY(int last_dft_they__qty) {
		LAST_DFT_THEY__QTY = last_dft_they__qty;
	}
	public int getDISP_COMP_QTY() {
		return DISP_COMP_QTY;
	}
	public void setDISP_COMP_QTY(int disp_comp_qty) {
		DISP_COMP_QTY = disp_comp_qty;
	}
	public int getDISP_MED_QTY() {
		return DISP_MED_QTY;
	}
	public void setDISP_MED_QTY(int disp_med_qty) {
		DISP_MED_QTY = disp_med_qty;
	}
	public int getDISP_ARB_QTY() {
		return DISP_ARB_QTY;
	}
	public void setDISP_ARB_QTY(int disp_arb_qty) {
		DISP_ARB_QTY = disp_arb_qty;
	}
	public int getDISP_LAW_QTY() {
		return DISP_LAW_QTY;
	}
	public void setDISP_LAW_QTY(int disp_law_qty) {
		DISP_LAW_QTY = disp_law_qty;
	}
	
	
	public String convertCode(String strvalue)
	{	return com.macrosoft.icms.system.SysUtility.convertCode( strvalue );	}

	public String doPreProcess( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess( sValue );	}

	public String doPreProcess2( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess2( sValue );	}

	public String doPreProcess3( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess3( sValue );	}
	
	
	
	public boolean executeNextStep(SZCP_SQ_HT_XWGF_SL sl) {
		// 判断是否存在历史数据
		boolean flag = queryHistoryData(sl);
		// 查询流程
		if(flag) {
			// 执行更新操作
			flag = this.editData(sl);
		}else {
			// 执行插入操作
			flag = this.saveData(sl);
		}
		return flag;
	}

	/**
	 * save or update
	 * @param xwgf
	 * @return true
	 * @author zz
	 */
	public boolean saveOrupdateXYGF_SL(SZCP_SQ_HT_XWGF_SL sl){
		DbConnection connection = new DbConnection();
		boolean flag = false;
		ResultSet xwgfRs = null;
		if(sl!=null){
//			查询
			String getSLsql = "select count(*) as historycount from SZCP_SQ_HT_XWGF_SL where REG_NO = "+"'"+sl.getREG_NO()+"'"+" and  EVAL_YEAR = "+"'"
					+sl.getEVAL_YEAR()+"'"+"and REPORT_YEAR = "+"'"+sl.getREPORT_YEAR()+"'";
			try {
				//启动事务
				connection.startTransaction();
				xwgfRs=connection.executeQuery(getSLsql);
				if(xwgfRs.next()){
					if(xwgfRs.getInt("historycount")==0){
						//增加
						StringBuffer addXYGL_SLSql = new StringBuffer();
						addXYGL_SLSql.append("insert into SZCP_SQ_HT_XWGF_SL(REG_NO,EVAL_YEAR,REPORT_YEAR,INC_SIGN_RATE,EXP_SIGN_RATE,MODEL_TEXT_US_RATE,LAST_DFT_OUR_QTY,LAST_DFT_THEY__QTY,DISP_COMP_QTY,DISP_MED_QTY,DISP_ARB_QTY,DISP_LAW_QTY) values(")
						.append("'"+sl.getREG_NO()+"',").append("'"+sl.getEVAL_YEAR()+"',").append("'"+sl.getREPORT_YEAR()+"',").append("'"+sl.getINC_SIGN_RATE()+"',").append("'"+sl.getEXP_SIGN_RATE()+"',")
						.append("'"+sl.getMODEL_TEXT_US_RATE()+"',").append("'"+sl.getLAST_DFT_OUR_QTY()+"',")
						.append("'"+sl.getLAST_DFT_THEY__QTY()+"',").append("'"+sl.getDISP_COMP_QTY()+"',").append("'"+sl.getDISP_MED_QTY()+"',").append("'"+sl.getDISP_ARB_QTY()).append("',")
						.append(sl.getDISP_LAW_QTY()+")");
						connection.addSQL(addXYGL_SLSql.toString());
						flag = connection.endTransaction();
						
					}else{
						//更新
						StringBuffer sb = new StringBuffer();
						sb.append(" update SZCP_SQ_HT_XWGF_SL set ")
						.append(" INC_SIGN_RATE = ").append("'").append(sl.getINC_SIGN_RATE()).append("',").append("EXP_SIGN_RATE = ")
						.append("'").append(sl.getEXP_SIGN_RATE()).append("',").append("MODEL_TEXT_US_RATE = ").append("'").append(sl.getMODEL_TEXT_US_RATE()).append("',")
						.append("LAST_DFT_OUR_QTY = ").append("'").append(sl.getLAST_DFT_OUR_QTY()).append("',").append("LAST_DFT_THEY__QTY = ").append("'").append(sl.getLAST_DFT_THEY__QTY()).append("',")
						.append(" DISP_COMP_QTY = ").append(sl.getDISP_COMP_QTY()).append(",")
						.append(" DISP_MED_QTY = ").append(sl.getDISP_MED_QTY()).append(",")
						.append(" DISP_ARB_QTY = ").append(sl.getDISP_ARB_QTY()).append(",")
						.append(" DISP_LAW_QTY = ").append(sl.getDISP_LAW_QTY())
						.append(" where REG_NO = ").append("'"+sl.getREG_NO()+"' and EVAL_YEAR = ").append("'"+sl.getEVAL_YEAR()+"'")
						.append(" and REPORT_YEAR = ").append("'").append(sl.getREPORT_YEAR()).append("'");
						connection.addSQL(sb.toString());
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
	
	public boolean saveData(SZCP_SQ_HT_XWGF_SL sl) {
		DbConnection dbc=new DbConnection();
		PreparedStatement prsmt = null;
		String sql = "insert into SZCP_SQ_HT_XWGF_SL(REG_NO,EVAL_YEAR,REPORT_YEAR,INC_SIGN_RATE,EXP_SIGN_RATE,MODEL_TEXT_US_RATE,LAST_DFT_OUR_QTY,LAST_DFT_THEY__QTY,DISP_COMP_QTY,DISP_MED_QTY,DISP_ARB_QTY,DISP_LAW_QTY)" +
				"values(?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			prsmt = dbc.prepareStatement(sql);
			prsmt.setString(1, sl.getREG_NO());
			prsmt.setString(2, sl.getEVAL_YEAR());
			prsmt.setString(3, sl.getREPORT_YEAR());
			prsmt.setFloat(4,sl.getINC_SIGN_RATE());
			prsmt.setFloat(5,sl.getEXP_SIGN_RATE());
			prsmt.setFloat(6,sl.getMODEL_TEXT_US_RATE());
			prsmt.setInt(7, sl.getLAST_DFT_OUR_QTY());
			prsmt.setInt(8,sl.getLAST_DFT_THEY__QTY());
			prsmt.setInt(9, sl.getDISP_COMP_QTY());
			prsmt.setInt(10, sl.getDISP_MED_QTY());
			prsmt.setInt(11, sl.getDISP_ARB_QTY());
			prsmt.setInt(12, sl.getDISP_LAW_QTY());
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
	
	
	public boolean editData(SZCP_SQ_HT_XWGF_SL sl) {
		DbConnection dbc=new DbConnection();
		boolean flag = false;
		System.err.println(sl.getREG_NO());
		try {
			dbc.startTransaction();
			StringBuffer sb = new StringBuffer();
			sb.append(" update SZCP_SQ_HT_XWGF_SL set ")
			.append(" INC_SIGN_RATE = ").append("'").append(sl.getINC_SIGN_RATE()).append("',").append("EXP_SIGN_RATE = ")
			.append("'").append(sl.getEXP_SIGN_RATE()).append("',").append("MODEL_TEXT_US_RATE = ").append("'").append(sl.getMODEL_TEXT_US_RATE()).append("',")
			.append("LAST_DFT_OUR_QTY = ").append("'").append(sl.getLAST_DFT_OUR_QTY()).append("',").append("LAST_DFT_THEY__QTY = ").append("'").append(sl.getLAST_DFT_THEY__QTY()).append("',")
			.append(" DISP_COMP_QTY = ").append(sl.getDISP_COMP_QTY()).append(",")
			.append(" DISP_MED_QTY = ").append(sl.getDISP_MED_QTY()).append(",")
			.append(" DISP_ARB_QTY = ").append(sl.getDISP_ARB_QTY()).append(",")
			.append(" DISP_LAW_QTY = ").append(sl.getDISP_LAW_QTY())
			.append(" where REG_NO = ").append("'"+sl.getREG_NO()+"' and EVAL_YEAR = ").append("'"+sl.getEVAL_YEAR()+"'")
			.append(" and REPORT_YEAR = ").append("'").append(sl.getREPORT_YEAR()).append("'");
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
	
	public boolean queryHistoryDataForOne(SZCP_SQ_HT_XWGF_SL  sl) {
		DbConnection dbConnection = new DbConnection();
		ResultSet set = null;
		boolean flag = false;
		String sql = "select count(*) as historycount from SZCP_SQ_HT_XWGF_SL where REG_NO = "+"'"+doPreProcess(sl.getREG_NO())+"'"+" and  EVAL_YEAR = "+"'"
			+doPreProcess(sl.getEVAL_YEAR())+"'"+"and REPORT_YEAR = "+"'"+doPreProcess(sl.getREPORT_YEAR())+"'";
		try {
			set = dbConnection.executeQuery(sql);
			if(set.next()) {
				String str = set.getString("historycount");
				if(Integer.parseInt(str) < 1) {
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
	
	
	
	private boolean queryHistoryData(SZCP_SQ_HT_XWGF_SL  sl) {
		DbConnection dbConnection = new DbConnection();
		ResultSet set = null;
		boolean flag = false;
		String sql = "select count(*) as historycount from SZCP_SQ_HT_XWGF_SL where REG_NO = "+"'"+doPreProcess(sl.getREG_NO())+"'"+" and  EVAL_YEAR = "+"'"
			+doPreProcess(sl.getEVAL_YEAR())+"'"+"and REPORT_YEAR = "+"'"+doPreProcess(sl.getREPORT_YEAR())+"'";
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
	
	public SZCP_SQ_HT_XWGF_SL querySZCP_SQ_HT_XWGF_SL(String regNo,String year,String REPORT_YEAR) {
		String sql = "select *from SZCP_SQ_HT_XWGF_SL where REG_NO = "+"'"+regNo+"'"+" and EVAL_YEAR = "+"'"+year+"'"+" and REPORT_YEAR="+"'"+REPORT_YEAR+"'";
		DbConnection connection = new DbConnection();
		ResultSet rs = null;
		SZCP_SQ_HT_XWGF_SL sl = new SZCP_SQ_HT_XWGF_SL();
		try {
			 rs = connection.executeQuery(sql);
			 if(rs.next()) {
				 sl = setValueToSZCP_SQ_HT_XWGF_SL(rs);
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
		return sl;
	}
	
	private SZCP_SQ_HT_XWGF_SL setValueToSZCP_SQ_HT_XWGF_SL(ResultSet rs) {
		SZCP_SQ_HT_XWGF_SL sl = new SZCP_SQ_HT_XWGF_SL();
		try {
			sl.setREG_NO(rs.getString("REG_NO") == null ?"":rs.getString("REG_NO"));
			sl.setEVAL_YEAR(rs.getString("EVAL_YEAR") == null ?"":rs.getString("EVAL_YEAR"));
			sl.setREPORT_YEAR(rs.getString("REPORT_YEAR"));
			sl.setINC_SIGN_RATE(rs.getFloat("INC_SIGN_RATE"));
			sl.setEXP_SIGN_RATE(rs.getFloat("EXP_SIGN_RATE"));
			sl.setMODEL_TEXT_US_RATE(rs.getFloat("MODEL_TEXT_US_RATE"));
			sl.setLAST_DFT_OUR_QTY(rs.getInt("LAST_DFT_OUR_QTY"));
			sl.setLAST_DFT_THEY__QTY(rs.getInt("LAST_DFT_THEY__QTY"));
			sl.setDISP_COMP_QTY(rs.getInt("DISP_COMP_QTY"));
			sl.setDISP_MED_QTY(rs.getInt("DISP_MED_QTY"));
			sl.setDISP_ARB_QTY(rs.getInt("DISP_ARB_QTY"));
			sl.setDISP_LAW_QTY(rs.getInt("DISP_LAW_QTY"));
		}catch(Exception e) {
			e.printStackTrace();
		}
		return sl;
	}
	
}
