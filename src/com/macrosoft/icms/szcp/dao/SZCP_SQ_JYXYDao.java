package com.macrosoft.icms.szcp.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.print.attribute.HashAttributeSet;

import org.apache.taglibs.standard.tag.common.core.SetSupport;

import com.macrosoft.icms.dbc.DbConnection;
import com.macrosoft.icms.szcp.SZCP_SQ_JYXY;

public class SZCP_SQ_JYXYDao {

	/**
	 * 
	 * @Title: executeNextStep
	 * @Description: 閹笛嗩攽娑撳绔村銉︽惙娴ｏ拷
	 * @param 鐠佹儳鐣鹃弬鍥
	 *            ︽
	 * @return void 鏉╂柨娲栫猾璇茬�
	 * @throws
	 */
	public boolean executeNextStep(SZCP_SQ_JYXY jyxy, SZCP_SQ_JYXY jyxy1) {
		boolean flag = false;
		// 閺屻儴顕楅張澶嬫￥閺佺増宓佺�妯烘躬
		if (!isEmptySZCP_SQ_JYXY(jyxy.getREG_NO(), jyxy.getEVAL_YEAR())) {
			// 閺堝姘ㄩ弴瀛樻煀
			flag = editData(jyxy, jyxy1);
		} else {
			// 閺冪姴姘ㄩ幓鎺戝弳
			flag = addData(jyxy, jyxy1);
		}
		return flag;
	}

	/**
	 * 
	 * @Title: addData
	 * @Description: 濞ｈ濮為弫鐗堝祦
	 * @param @param jyxy
	 * @param @return 鐠佹儳鐣鹃弬鍥︽
	 * @return boolean 鏉╂柨娲栫猾璇茬�
	 * @throws
	 */
	private boolean addData(SZCP_SQ_JYXY jyxy, SZCP_SQ_JYXY jyxy1) {
		boolean flag = false;
		DbConnection connection = new DbConnection();
		PreparedStatement prsmt = null;
		String sql = " insert into SZCP_SQ_JYXY(REG_NO,EVAL_YEAR,REPORT_YEAR,REVE_GROW_RATE,PRI_GROW_RATE,NET_ASSET_RATE,DEBT_ASSET_RATE,QUICK_ACT_RATE,RECV_TNOV_RATE,RCV_OVERDUE_RATE,PAY_OVERDUE_RATE) values(?,?,?,?,?,?,?,?,?,?,?)";
		String sql2 = " insert into SZCP_SQ_JYXY(REG_NO,EVAL_YEAR,REPORT_YEAR,REVE_GROW_RATE,PRI_GROW_RATE,NET_ASSET_RATE,DEBT_ASSET_RATE,QUICK_ACT_RATE,RECV_TNOV_RATE,RCV_OVERDUE_RATE,PAY_OVERDUE_RATE) values(?,?,?,?,?,?,?,?,?,?,?)";
		try {
			prsmt = connection.prepareStatement(sql);
			prsmt.setString(1, jyxy.getREG_NO());
			prsmt.setString(2, jyxy.getEVAL_YEAR());
			prsmt.setString(3, jyxy.getREPORT_YEAR());
			prsmt.setFloat(4, jyxy.getREVE_GROW_RATE());
			prsmt.setFloat(5, jyxy.getPRI_GROW_RATE());
			prsmt.setFloat(6, jyxy.getNET_ASSET_RATE());
			prsmt.setFloat(7, jyxy.getDEBT_ASSET_RATE());
			prsmt.setFloat(8, jyxy.getQUICK_ACT_RATE());
			prsmt.setFloat(9, jyxy.getRECV_TNOV_RATE());
			prsmt.setFloat(10, jyxy.getRCV_OVERDUE_RATE());
			prsmt.setFloat(11, jyxy.getPAY_OVERDUE_RATE());
			int num = prsmt.executeUpdate();
			
			prsmt = connection.prepareStatement(sql2);
			prsmt.setString(1, jyxy1.getREG_NO());
			prsmt.setString(2, jyxy1.getEVAL_YEAR());
			prsmt.setString(3, jyxy1.getREPORT_YEAR());
			prsmt.setFloat(4, jyxy1.getREVE_GROW_RATE());
			prsmt.setFloat(5, jyxy1.getPRI_GROW_RATE());
			prsmt.setFloat(6, jyxy1.getNET_ASSET_RATE());
			prsmt.setFloat(7, jyxy1.getDEBT_ASSET_RATE());
			prsmt.setFloat(8, jyxy1.getQUICK_ACT_RATE());
			prsmt.setFloat(9, jyxy1.getRECV_TNOV_RATE());
			prsmt.setFloat(10, jyxy1.getRCV_OVERDUE_RATE());
			prsmt.setFloat(11, jyxy1.getPAY_OVERDUE_RATE());
			int num2 = prsmt.executeUpdate();
			if (num > 0 && num2 > 0) {
				flag = true;
			} else {
				flag = false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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

	/**
	 * 
	 * @Title: editData
	 * @Description: 閺囧瓨鏌婇弫鐗堝祦
	 * @param @param jyxy
	 * @param @return 鐠佹儳鐣鹃弬鍥︽
	 * @return boolean 鏉╂柨娲栫猾璇茬�
	 * @throws
	 */
	private boolean editData(SZCP_SQ_JYXY jyxy, SZCP_SQ_JYXY jyxy1) {
		boolean flag = false;
		DbConnection connection = new DbConnection();
		PreparedStatement prsmt = null;
		String sql = " update SZCP_SQ_JYXY set REVE_GROW_RATE = ?,PRI_GROW_RATE = ?,NET_ASSET_RATE = ?,DEBT_ASSET_RATE = ?,QUICK_ACT_RATE = ?,RECV_TNOV_RATE = ?,RCV_OVERDUE_RATE = ?,PAY_OVERDUE_RATE =? where REG_NO = ? and EVAL_YEAR = ? and REPORT_YEAR = ?";
		String sql2 = " update SZCP_SQ_JYXY set REVE_GROW_RATE = ?,PRI_GROW_RATE = ?,NET_ASSET_RATE = ?,DEBT_ASSET_RATE = ?,QUICK_ACT_RATE = ?,RECV_TNOV_RATE = ?,RCV_OVERDUE_RATE = ?,PAY_OVERDUE_RATE =? where REG_NO = ? and EVAL_YEAR = ? and REPORT_YEAR = ?";
		try {
			prsmt = connection.prepareStatement(sql);
			prsmt.setFloat(1, jyxy.getREVE_GROW_RATE());
			prsmt.setFloat(2, jyxy.getPRI_GROW_RATE());
			prsmt.setFloat(3, jyxy.getNET_ASSET_RATE());
			prsmt.setFloat(4, jyxy.getDEBT_ASSET_RATE());
			prsmt.setFloat(5, jyxy.getQUICK_ACT_RATE());
			prsmt.setFloat(6, jyxy.getRECV_TNOV_RATE());
			prsmt.setFloat(7, jyxy.getRCV_OVERDUE_RATE());
			prsmt.setFloat(8, jyxy.getPAY_OVERDUE_RATE());
			prsmt.setString(9, jyxy.getREG_NO());
			prsmt.setString(10, jyxy.getEVAL_YEAR());
			prsmt.setString(11, jyxy.getREPORT_YEAR());
			int num = prsmt.executeUpdate();
			
			prsmt = connection.prepareStatement(sql2);
			prsmt.setFloat(1, jyxy1.getREVE_GROW_RATE());
			prsmt.setFloat(2, jyxy1.getPRI_GROW_RATE());
			prsmt.setFloat(3, jyxy1.getNET_ASSET_RATE());
			prsmt.setFloat(4, jyxy1.getDEBT_ASSET_RATE());
			prsmt.setFloat(5, jyxy1.getQUICK_ACT_RATE());
			prsmt.setFloat(6, jyxy1.getRECV_TNOV_RATE());
			prsmt.setFloat(7, jyxy1.getRCV_OVERDUE_RATE());
			prsmt.setFloat(8, jyxy1.getPAY_OVERDUE_RATE());
			prsmt.setString(9, jyxy1.getREG_NO());
			prsmt.setString(10, jyxy1.getEVAL_YEAR());
			prsmt.setString(11, jyxy1.getREPORT_YEAR());
			int num2 = prsmt.executeUpdate();
			if (num > 0 && num2 > 0) {
				flag = true;
			} else {
				flag = false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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

	public boolean isEmptySZCP_SQ_JYXY(String regNo, String year) {
		String sql = "select count(*) as jyxyCount from  SZCP_SQ_JYXY where REG_NO = "
				+ "'" + regNo + "'" + " and EVAL_YEAR = " + "'" + year + "'";
		DbConnection connection = new DbConnection();
		ResultSet rs = null;
		boolean flag = false;
		try {
			rs = connection.executeQuery(sql);
			if (rs.next()) {
				flag = Integer.parseInt(rs.getString("jyxyCount")) < 1 ? true
						: false;
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
		return flag;
	}

	/**
	 * 
	 * @Title: querySZCP_SQ_JYXY
	 * @Description: 閺屻儴顕楅幍锟芥箒閺佺増宓�
	 * @param @param regNo
	 * @param @param year
	 * @param @return 鐠佹儳鐣鹃弬鍥︽
	 * @return SZCP_SQ_JYXY 鏉╂柨娲栫猾璇茬�
	 * @throws
	 */
	public SZCP_SQ_JYXY querySZCP_SQ_JYXY(String regNo, String year,String REPORT_YEAR) {
		String sql = "select *from SZCP_SQ_JYXY where REG_NO = " + "'" + regNo
				+ "'" + " and EVAL_YEAR = " + "'" + year + "'"+ " and REPORT_YEAR = " + "'" + REPORT_YEAR + "'";
		DbConnection connection = new DbConnection();
		ResultSet rs = null;
		SZCP_SQ_JYXY jyxy = new SZCP_SQ_JYXY();
		try {
			rs = connection.executeQuery(sql);
			if (rs.next()) {
				jyxy = setValueToSZCP_SQ_JYXY(rs);
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
		return jyxy;
	}

	/**
	 * 
	 * @Title: setValueToSZCP_SQ_JYXY
	 * @Description: 鐠у锟�
	 * @param @param rs 鐠佹儳鐣鹃弬鍥︽
	 * @return void 鏉╂柨娲栫猾璇茬�
	 * @throws
	 */
	private SZCP_SQ_JYXY setValueToSZCP_SQ_JYXY(ResultSet rs) {
		SZCP_SQ_JYXY jyxy = new SZCP_SQ_JYXY();
		try {
			jyxy.setREG_NO(rs.getString("REG_NO") == null ? "" : rs
					.getString("REG_NO"));
			jyxy.setEVAL_YEAR(rs.getString("EVAL_YEAR") == null ? "" : rs
					.getString("EVAL_YEAR"));
			jyxy.setREVE_GROW_RATE(rs.getFloat("REVE_GROW_RATE"));
			jyxy.setPRI_GROW_RATE(rs.getFloat("PRI_GROW_RATE"));
			jyxy.setNET_ASSET_RATE(rs.getFloat("NET_ASSET_RATE"));
			jyxy.setDEBT_ASSET_RATE(rs.getFloat("DEBT_ASSET_RATE"));
			jyxy.setQUICK_ACT_RATE(rs.getFloat("QUICK_ACT_RATE"));
			jyxy.setRECV_TNOV_RATE(rs.getFloat("RECV_TNOV_RATE"));
			jyxy.setRCV_OVERDUE_RATE(rs.getFloat("RCV_OVERDUE_RATE"));
			jyxy.setPAY_OVERDUE_RATE(rs.getFloat("PAY_OVERDUE_RATE"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jyxy;
	}
}
