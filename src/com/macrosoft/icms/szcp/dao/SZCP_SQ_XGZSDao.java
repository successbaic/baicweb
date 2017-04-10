package com.macrosoft.icms.szcp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.macrosoft.icms.dbc.DbConnection;
import com.macrosoft.icms.szcp.SZCP_LCZT;
import com.macrosoft.icms.szcp.SZCP_SQ_HT_XWGF;
import com.macrosoft.icms.szcp.SZCP_SQ_SHRY;
import com.macrosoft.icms.szcp.SZCP_SQ_XGZS;


public class SZCP_SQ_XGZSDao {
	
	public boolean deleteSZCP_SQ_XGZS(SZCP_SQ_XGZS xgzs) {
		boolean flag = false;
		String sql = "delete  from SZCP_SQ_XGZS where REG_NO = ? and EVAL_YEAR = ? and CERT_NAME = ?";
		DbConnection dbConnection = new DbConnection();
		PreparedStatement prsmt = null;
		try {
			prsmt = dbConnection.prepareStatement(sql);
			prsmt.setString(1, xgzs.getREG_NO());
			prsmt.setString(2, xgzs.getEVAL_YEAR());
			prsmt.setString(3,unescape(xgzs.getCERT_NAME()));
			flag = prsmt.executeUpdate() > 0 ? true:false;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				prsmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
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
	* @Title: queryLcztStatus 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param regno
	* @param @param evalYear
	* @param @return    设定文件 
	* @return String    返回类型 
	* @throws
	 */
	public SZCP_LCZT queryLcztStatus(String regno,String evalYear) {
		SZCP_LCZT lczt = new SZCP_LCZT();
		String sql = "select EVAL_YEAR, REG_NO,APPR_STAT_FLAG,PRO_STAT_FLAG from SZCP_LCZT where REG_NO = ? and EVAL_YEAR = ?";
		DbConnection connection = new DbConnection();
		PreparedStatement prsmt = null;
		ResultSet resultSet = null;
		try {
			prsmt = connection.prepareStatement(sql);
			prsmt.setString(1, regno);
			prsmt.setString(2, evalYear);
			resultSet = prsmt.executeQuery();
			if(resultSet.next()) {
				lczt.setEVAL_YEAR(resultSet.getString(1) == null ? "":resultSet.getString(1));
				lczt.setREG_NO(resultSet.getString(2) == null ?"":resultSet.getString(2));
				lczt.setAPPR_STAT_FLAG(resultSet.getString(3) == null ?"":resultSet.getString(3));
				lczt.setPRO_STAT_FLAG(resultSet.getString(4) == null ?"":resultSet.getString(4));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				resultSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
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
		
		return lczt;
	}
	
	
	
	
	
	
	
	public boolean editSZCP_SQ_XGZS(SZCP_SQ_XGZS xgzs) {
		StringBuffer sql = new StringBuffer();
		DbConnection connection = new DbConnection();
		sql.append(" update SZCP_SQ_XGZS set CERT_NO = ").append("'"+this.unescape(xgzs.getCERT_NO())+"',")
		.append(" VALID_TO_DATE = ").append("to_date('"+xgzs.getVALID_TO_DATE()+"',"+"'yyyy/MM/dd'),")
		.append(" AUTH_ORG_DESC = ").append("'"+this.unescape(xgzs.getAUTH_ORG_DESC())+"',").append("ISSUE_DATE = ")
		.append(" to_date('"+xgzs.getISSUE_DATE()+"','yyyy/MM/dd')")
		.append(" where REG_NO = ").append("'"+xgzs.getREG_NO()+"'"+" and EVAL_YEAR = ")
		.append("'"+xgzs.getEVAL_YEAR()+"' and CERT_NAME = "+"'"+this.unescape(xgzs.getCERT_NAME())+"'");
		boolean flag = false;
		try {
			int num = connection.executeUpdate(sql.toString());
			if(num > 0 ){
				flag =  true;
			}else {
				flag=  false;
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
	

	public boolean addSZCP_SQ_XGZS(SZCP_SQ_XGZS xgzs) {
		StringBuffer sql = new StringBuffer();
		DbConnection connection = new DbConnection();
		sql.append(" insert into SZCP_SQ_XGZS(REG_NO,EVAL_YEAR,CERT_NAME,CERT_NO,VALID_TO_DATE,AUTH_ORG_DESC,ISSUE_DATE) values( ") ;
		sql.append("'"+xgzs.getREG_NO()+"',").append("'"+xgzs.getEVAL_YEAR()+"',").append("'"+this.unescape(xgzs.getCERT_NAME())+"',").append("'"+this.unescape(xgzs.getCERT_NO())+"',")
		.append("to_date('"+xgzs.getVALID_TO_DATE()+"',"+"'yyyy/MM/dd'),").append("'"+this.unescape(xgzs.getAUTH_ORG_DESC())+"',").append("to_date('"+xgzs.getISSUE_DATE()+"','yyyy/MM/dd'))");
		boolean flag = false;
		
		try {
			int num = connection.executeUpdate(sql.toString());
			if(num > 0 ){
				flag =  true;
			}else {
				flag=  false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			flag=  false;
		}finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return flag;
	}
	
	
	public boolean isEmptySZCP_SQ_XGZS(String regNo,String year) {
		String sql = "select count(*) as gyjzCount from  SZCP_SQ_XGZS where REG_NO = "+"'"+regNo+"'"+" and EVAL_YEAR = "+"'"+year+"'";
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
	
	public  String unescape (String src)
	 {
	    StringBuffer tmp = new StringBuffer();
	    tmp.ensureCapacity(src.length());
	    int lastPos=0,pos=0;
	    char ch;
	    while (lastPos<src.length())
	    {
	     pos = src.indexOf("%",lastPos);
	     if (pos == lastPos)
	      {
	      if (src.charAt(pos+1)=='u')
	       {
	       ch = (char)Integer.parseInt(src.substring(pos+2,pos+6),16);
	       tmp.append(ch);
	       lastPos = pos+6;
	       }
	      else
	       {
	       ch = (char)Integer.parseInt(src.substring(pos+1,pos+3),16);
	       tmp.append(ch);
	       lastPos = pos+3;
	       }
	      }
	     else
	      {
	      if (pos == -1)
	       {
	       tmp.append(src.substring(lastPos));
	       lastPos=src.length();
	       }
	      else
	       {
	       tmp.append(src.substring(lastPos,pos));
	       lastPos=pos;
	       }
	      }
	    }
	    return tmp.toString();
	 }
	

	public  List<SZCP_SQ_XGZS> querySZCP_SQ_XGZS(String regNo,String year) {
		String sql = "select *from SZCP_SQ_XGZS where REG_NO = ? and EVAL_YEAR = ?";
		DbConnection connection = new DbConnection();
		ResultSet rs = null;
		PreparedStatement prsmt = null;
		List<SZCP_SQ_XGZS> list = new ArrayList<SZCP_SQ_XGZS>();
		try {
			 prsmt = connection.prepareStatement(sql);
			 prsmt.setString(1, regNo);
			 prsmt.setString(2, year);
			 rs = prsmt.executeQuery();
			 while(rs.next()) {
				 SZCP_SQ_XGZS xgzs = new SZCP_SQ_XGZS();
				 xgzs.setREG_NO(rs.getString("REG_NO") == null ?"":rs.getString("REG_NO") );
				 xgzs.setEVAL_YEAR(rs.getString("EVAL_YEAR") == null ?"":rs.getString("EVAL_YEAR"));
				 xgzs.setCERT_NAME(rs.getString("CERT_NAME") == null ?"":rs.getString("CERT_NAME"));
				 xgzs.setCERT_NO(rs.getString("CERT_NO") == null ?"":rs.getString("CERT_NO"));
				 xgzs.setVALID_TO_DATE(String.valueOf(rs.getDate("VALID_TO_DATE") == null ?"":rs.getDate("VALID_TO_DATE")));
				 xgzs.setAUTH_ORG_DESC(rs.getString("AUTH_ORG_DESC") == null ?"":rs.getString("AUTH_ORG_DESC"));
				 xgzs.setISSUE_DATE(String.valueOf(rs.getDate("ISSUE_DATE") == null ?"":rs.getDate("ISSUE_DATE")));
				list.add(xgzs);
			 }
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				prsmt.close();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
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
		return list;
	}
	
	public SZCP_SQ_XGZS querySZCP_SQ_XGZS(String regNo,String year,String cerName) {
		String sql = "select *from SZCP_SQ_XGZS where REG_NO = ? and EVAL_YEAR = ? and CERT_NAME = ?";
		DbConnection connection = new DbConnection();
		ResultSet rs = null;
		PreparedStatement prsmt = null;
		SZCP_SQ_XGZS xgzs = new SZCP_SQ_XGZS();
		try {
			 cerName = unescape(cerName);
			 prsmt = connection.prepareStatement(sql);
			 prsmt.setString(1, regNo);
			 prsmt.setString(2, year);
			 prsmt.setString(3, cerName);
			 rs = prsmt.executeQuery();
			 if(rs.next()) {
				 xgzs.setREG_NO(rs.getString("REG_NO") == null ?"":rs.getString("REG_NO") );
				 xgzs.setEVAL_YEAR(rs.getString("EVAL_YEAR") == null ?"":rs.getString("EVAL_YEAR"));
				 xgzs.setCERT_NAME(rs.getString("CERT_NAME") == null ?"":rs.getString("CERT_NAME"));
				 xgzs.setCERT_NO(rs.getString("CERT_NO") == null ?"":rs.getString("CERT_NO"));
				 xgzs.setVALID_TO_DATE(String.valueOf(rs.getDate("VALID_TO_DATE") == null ?"":rs.getDate("VALID_TO_DATE")));
				 xgzs.setAUTH_ORG_DESC(rs.getString("AUTH_ORG_DESC") == null ?"":rs.getString("AUTH_ORG_DESC"));
				 xgzs.setISSUE_DATE(String.valueOf(rs.getDate("ISSUE_DATE") == null ?"":rs.getDate("ISSUE_DATE")));
			 }
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				prsmt.close();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
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
		return xgzs;
	}
	
}