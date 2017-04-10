package com.macrosoft.icms.szcp.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.macrosoft.icms.dbc.DbConnection;
import com.macrosoft.icms.szcp.SZCP_SQ_GYJZ;

/**
 * 
* @Title: SZCP_SQ_GYJZDao.java 
* @Package com.macrosoft.icms.szcp.dao 
* @Description: 公益捐赠dao 
* @author yuchengjian 
* @date 2015-3-26 上午09:09:01 
* @version V1.0
 */
public class SZCP_SQ_GYJZDao {
	
	
	/**
	 * 
	* @Title: executeNextStep 
	* @Description: 执行下一步操作
	* @param     设定文件 
	* @return void    返回类型 
	* @throws
	 */
	public boolean  executeNextStep(SZCP_SQ_GYJZ gyjz) {
		boolean flag = false;
		if(isEmptySZCP_SQ_GYJZ(gyjz.getREG_NO(),gyjz.getEVAL_YEAR(),gyjz.getREPORT_YEAR())){
			// 插入
			flag = addSZCP_SQ_GYJZ(gyjz);
		}else {
			// 更新
			flag = editSZCP_SQ_GYJZ(gyjz);
		}
		return flag;
	}
	
	/**
	 * 
	* @Title: addSZCP_SQ_GYJZ 
	* @Description: 插入
	* @param @param gyjz
	* @param @return    设定文件 
	* @return boolean    返回类型 
	* @throws
	 */
	private boolean addSZCP_SQ_GYJZ(SZCP_SQ_GYJZ gyjz) {
		DbConnection connection = new DbConnection();
		String sql = "insert into SZCP_SQ_GYJZ(REG_NO,EVAL_YEAR,REPORT_YEAR,LAST_DONT_RMB_W,LAST_COURT_INVEST_QTY,LAST_ARBIT_INVEST) values(?,?,?,?,?,?)";
		PreparedStatement prsmt = null;
		boolean flag = false;
		try {
			prsmt = connection.prepareStatement(sql);
			prsmt.setString(1, gyjz.getREG_NO());
			prsmt.setString(2, gyjz.getEVAL_YEAR());
			prsmt.setString(3,gyjz.getREPORT_YEAR());
			prsmt.setFloat(4,gyjz.getLAST_DONT_RMB_W());
			prsmt.setInt(5, gyjz.getLAST_COURT_INVEST_QTY());
			prsmt.setInt(6, gyjz.getLAST_ARBIT_INVEST());
			int row = prsmt.executeUpdate();
			if(row > 0) {
				flag = true;
			}else {
				flag = false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				prsmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return flag;
	}
	
	
	private boolean editSZCP_SQ_GYJZ(SZCP_SQ_GYJZ gyjz) {
		StringBuffer sql = new StringBuffer();
		DbConnection connection = new DbConnection();
		sql.append("update SZCP_SQ_GYJZ  set LAST_DONT_RMB_W =").append("'"+gyjz.getLAST_DONT_RMB_W()+"'"+",LAST_COURT_INVEST_QTY = ")
		.append("'"+gyjz.getLAST_COURT_INVEST_QTY()+"'"+",LAST_ARBIT_INVEST = ").append("'"+gyjz.getLAST_ARBIT_INVEST()+"'")
		.append(" where REG_NO = ").append("'"+gyjz.getREG_NO()+"'").append(" and EVAL_YEAR = ").append("'"+gyjz.getEVAL_YEAR()+"'")
		.append(" and REPORT_YEAR = ").append("'"+gyjz.getREPORT_YEAR()+"'");
		boolean flag = false;
		try {
			int row = connection.executeUpdate(sql.toString());
			if(row > 0) {
				flag = true;
			}else {
				flag = false;
			}
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
	* @Title: isEmptySZCP_SQ_GYJZ 
	* @Description: 查询有无
	* @param @param regNo
	* @param @param year
	* @param @return    设定文件 
	* @return boolean    返回类型 
	* @throws
	 */
	public boolean isEmptySZCP_SQ_GYJZ(String regNo,String year,String report_year) {
		String sql = "select count(*) as gyjzCount from  SZCP_SQ_GYJZ where REG_NO = "+"'"+regNo+"'"+" and EVAL_YEAR = "+"'"+year+"'"+" and REPORT_YEAR = "+"'"+report_year+"'";
		DbConnection connection = new DbConnection();
		ResultSet rs = null;
		boolean flag = false;
		try {
			 rs = connection.executeQuery(sql);
			 if(rs.next()) {
				 flag = Integer.parseInt(rs.getString("gyjzCount")) < 1?true:false;
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
	* @Title: querySZCP_SQ_GYJZ 
	* @Description: 查询 SZCP_SQ_GYJZ
	* @param @param regno
	* @param @param year
	* @param @return    设定文件 
	* @return SZCP_SQ_GYJZ    返回类型 
	* @throws
	 */
	public SZCP_SQ_GYJZ querySZCP_SQ_GYJZ(String regno,String year,String report_year) {
		String sql = "select *from SZCP_SQ_GYJZ where REG_NO = "+"'"+regno+"'"+" and EVAL_YEAR = "+"'"+year+"'"+" and REPORT_YEAR = "+"'"+report_year+"'";
		DbConnection connection = new DbConnection();
		ResultSet rs = null;
		SZCP_SQ_GYJZ gyjz = new SZCP_SQ_GYJZ();
		try {
			 rs = connection.executeQuery(sql);
			 if(rs.next()) {
				setValueToSZCP_SQ_GYJZ(rs,gyjz);
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
		return gyjz;
	}
	
	/**
	 * 
	* @Title: setValueToSZCP_SQ_GYJZ 
	* @Description: 赋值
	* @param @param rs
	* @param @param gyjz    设定文件 
	* @return void    返回类型 
	* @throws
	 */
	private void setValueToSZCP_SQ_GYJZ(ResultSet rs, SZCP_SQ_GYJZ gyjz) {
		try {
			gyjz.setREG_NO(rs.getString("REG_NO") == null ?"":rs.getString("REG_NO") );
			gyjz.setEVAL_YEAR(rs.getString("EVAL_YEAR") == null ?"":rs.getString("EVAL_YEAR"));
			gyjz.setLAST_DONT_RMB_W(rs.getFloat("LAST_DONT_RMB_W"));
			gyjz.setREPORT_YEAR(rs.getString("REPORT_YEAR")== null ?"":rs.getString("REPORT_YEAR"));
			gyjz.setLAST_COURT_INVEST_QTY(rs.getInt("LAST_COURT_INVEST_QTY"));
			gyjz.setLAST_ARBIT_INVEST(rs.getInt("LAST_ARBIT_INVEST"));
		}catch(Exception e ) {
			e.printStackTrace();
		}
	}
}
