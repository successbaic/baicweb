package com.macrosoft.icms.szcp;

import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import oracle.jdbc.driver.DBConversion;

import com.macrosoft.icms.dbc.DbConnection;


public class SZCP_SQ_JYGL_XS {
	/*注册号*/
	String REG_NO;
	/*评价年度*/
	String EVAL_YEAR;
	/*填报年份*/
	String REPORT_YEAR;
	/*上年资产总额*/
	double LAST_ASSET_RMB_W;
	/*上年销售总额*/
	double LAST_SALE_RMB_W;
	/*境内销售*/
	double HOME_SALE_RMB_W;
	/*覆盖省份数*/
	int COVER_PROV_QTY;
	/*外贸出口*/
	double OUT_SALE_USD_W;
	/*出口国家/地区数*/
	int COVER_AREA_QTY;
	
	
	
	
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

	public double getLAST_ASSET_RMB_W() {
		return LAST_ASSET_RMB_W;
	}

	public void setLAST_ASSET_RMB_W(double last_asset_rmb_w) {
		LAST_ASSET_RMB_W = last_asset_rmb_w;
	}

	public double getLAST_SALE_RMB_W() {
		return LAST_SALE_RMB_W;
	}

	public void setLAST_SALE_RMB_W(double last_sale_rmb_w) {
		LAST_SALE_RMB_W = last_sale_rmb_w;
	}

	public double getHOME_SALE_RMB_W() {
		return HOME_SALE_RMB_W;
	}

	public void setHOME_SALE_RMB_W(double home_sale_rmb_w) {
		HOME_SALE_RMB_W = home_sale_rmb_w;
	}

	public int getCOVER_PROV_QTY() {
		return COVER_PROV_QTY;
	}

	public void setCOVER_PROV_QTY(int cover_prov_qty) {
		COVER_PROV_QTY = cover_prov_qty;
	}

	public double getOUT_SALE_USD_W() {
		return OUT_SALE_USD_W;
	}

	public void setOUT_SALE_USD_W(double out_sale_usd_w) {
		OUT_SALE_USD_W = out_sale_usd_w;
	}

	public int getCOVER_AREA_QTY() {
		return COVER_AREA_QTY;
	}

	public void setCOVER_AREA_QTY(int cover_area_qty) {
		COVER_AREA_QTY = cover_area_qty;
	}

	public String convertCode(String strvalue)
	{	return com.macrosoft.icms.system.SysUtility.convertCode( strvalue );	}

	public String doPreProcess( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess( sValue );	}

	public String doPreProcess2( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess2( sValue );	}

	public String doPreProcess3( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess3( sValue );	}
	
	
	
	public boolean saveData(SZCP_SQ_JYGL_XS jyglxs) {
		DbConnection dbc=new DbConnection();
		PreparedStatement prsmt = null;
		String sql = "insert into szcp_sq_jygl_xs(REG_NO,EVAL_YEAR,REPORT_YEAR,LAST_ASSET_RMB_W,LAST_SALE_RMB_W,HOME_SALE_RMB_W,COVER_PROV_QTY,OUT_SALE_USD_W,COVER_AREA_QTY)" +
				"values(?,?,?,?,?,?,?,?,?)";
		try {
			prsmt = dbc.prepareStatement(sql);
			prsmt.setString(1, jyglxs.getREG_NO());
			prsmt.setString(2, jyglxs.getEVAL_YEAR());
			prsmt.setString(3, jyglxs.getREPORT_YEAR());
			prsmt.setDouble(4,jyglxs.getLAST_ASSET_RMB_W());
			prsmt.setDouble(5,jyglxs.getLAST_SALE_RMB_W());
			prsmt.setDouble(6,jyglxs.getHOME_SALE_RMB_W());
			prsmt.setInt(7, jyglxs.getCOVER_PROV_QTY());
			prsmt.setDouble(8,jyglxs.getOUT_SALE_USD_W());
			prsmt.setInt(9, jyglxs.getCOVER_AREA_QTY());
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
	
	
	private boolean queryHistoryData(SZCP_SQ_JYGL_XS jyglxs) {
		DbConnection dbConnection = new DbConnection();
		ResultSet set = null;
		boolean flag = false;
		String sql = "select count(*) as historycount from szcp_sq_jygl_xs where REG_NO = "+"'"+doPreProcess(jyglxs.getREG_NO())+"'"+" and  EVAL_YEAR = "+"'"
			+doPreProcess(jyglxs.getEVAL_YEAR())+"'"+"and REPORT_YEAR = "+"'"+doPreProcess(jyglxs.getREPORT_YEAR())+"'";
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
	
	
	public boolean executeNextStep(SZCP_SQ_JYGL_XS jyglxs) {
		// 判断是否存在历史数据
		boolean flag = queryHistoryData(jyglxs);
		// 查询流程
		if(flag) {
			// 执行更新操作
			flag = this.editData(jyglxs);
		}else {
			// 执行插入操作
			flag = this.saveData(jyglxs);
		}
		return flag;
	}
	
	private boolean editData(SZCP_SQ_JYGL_XS jyglxs) {
		DbConnection dbc=new DbConnection();
		boolean flag = false;
		try {
			dbc.startTransaction();
			StringBuffer sb = new StringBuffer();
			sb.append(" update szcp_sq_jygl_xs set ")
			.append(" LAST_ASSET_RMB_W = ").append("'").append(jyglxs.getLAST_ASSET_RMB_W()).append("',").append("LAST_SALE_RMB_W = ")
			.append("'").append(jyglxs.getLAST_SALE_RMB_W()).append("',").append("HOME_SALE_RMB_W = ").append("'").append(jyglxs.getHOME_SALE_RMB_W()).append("',")
			.append("COVER_PROV_QTY = ").append("'").append(jyglxs.getCOVER_PROV_QTY()).append("',").append("OUT_SALE_USD_W = ").append("'").append(jyglxs.getOUT_SALE_USD_W()).append("',")
			.append(" COVER_AREA_QTY = ").append(jyglxs.getCOVER_AREA_QTY())
			.append(" where REG_NO = ").append("'"+jyglxs.getREG_NO()+"' and EVAL_YEAR = ").append("'"+jyglxs.getEVAL_YEAR()+"'")
			.append(" and REPORT_YEAR =").append("'"+jyglxs.getREPORT_YEAR()+"'");
			
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
	
	public SZCP_SQ_JYGL_XS querySZCP_SQ_JYGL_XS(String regNo,String year,String REPORT_YEAR) {
		String sql = "select *from SZCP_SQ_JYGL_XS where REG_NO = "+"'"+regNo+"'"+" and EVAL_YEAR = "+"'"+year+"'"+" and REPORT_YEAR="+"'"+REPORT_YEAR+"'";
		DbConnection connection = new DbConnection();
		ResultSet rs = null;
		SZCP_SQ_JYGL_XS jyglxs = new SZCP_SQ_JYGL_XS();
		try {
			 rs = connection.executeQuery(sql);
			 if(rs.next()) {
				 jyglxs = setValueToSZCP_SQ_JYGL_XS(rs);
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
		return jyglxs;
	}
	
	
	private SZCP_SQ_JYGL_XS setValueToSZCP_SQ_JYGL_XS(ResultSet rs) {
		SZCP_SQ_JYGL_XS jyglxs = new SZCP_SQ_JYGL_XS();
		try {
			jyglxs.setREG_NO(rs.getString("REG_NO") == null ?"":rs.getString("REG_NO"));
			jyglxs.setEVAL_YEAR(rs.getString("EVAL_YEAR") == null ?"":rs.getString("EVAL_YEAR"));
			jyglxs.setREPORT_YEAR(rs.getString("REPORT_YEAR"));
			jyglxs.setLAST_ASSET_RMB_W(rs.getBigDecimal("LAST_ASSET_RMB_W") == null ? 0: rs.getBigDecimal("LAST_ASSET_RMB_W").doubleValue());
			jyglxs.setLAST_SALE_RMB_W(rs.getBigDecimal("LAST_SALE_RMB_W") == null ? 0: rs.getBigDecimal("LAST_SALE_RMB_W").doubleValue());
			jyglxs.setHOME_SALE_RMB_W(rs.getBigDecimal("HOME_SALE_RMB_W") == null ? 0: rs.getBigDecimal("HOME_SALE_RMB_W").doubleValue());
			jyglxs.setCOVER_PROV_QTY(rs.getBigDecimal("COVER_PROV_QTY") == null ? 0: rs.getBigDecimal("COVER_PROV_QTY").intValue());
			jyglxs.setOUT_SALE_USD_W(rs.getBigDecimal("OUT_SALE_USD_W") == null ? 0: rs.getBigDecimal("OUT_SALE_USD_W").doubleValue());
			jyglxs.setCOVER_AREA_QTY(rs.getBigDecimal("COVER_AREA_QTY") == null ? 0: rs.getBigDecimal("COVER_AREA_QTY").intValue());
		}catch(Exception e) {
			e.printStackTrace();
		}
		return jyglxs;
	}
	
	public String doubleToString(double val) {
		 BigDecimal bigDecimal = new BigDecimal(val);  
//	     String result = bigDecimal.toString();  
	     String result = String .format("%.6f",bigDecimal.doubleValue());
	     return result;
	}
	
	

}
