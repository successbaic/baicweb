package com.macrosoft.icms.szcp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.macrosoft.icms.dbc.DbConnection;
import com.macrosoft.icms.szcp.SZCP_SQ_HT_XWGF;
import com.macrosoft.icms.szcp.SZCP_SQ_SHRY;

/**
 * 
* @Title: SZCP_SQ_SHRYDao.java 
* @Package com.macrosoft.icms.szcp.dao 
* @Description: 社会荣誉
* @author yuchengjian 
* @date 2015-3-26 上午09:09:50 
* @version V1.0
 */
public class SZCP_SQ_SHRYDao {
	
	/**
	 * 
	* @Title: deleteSZCP_SQ_SHRY 
	* @Description: TODO(这里用一句话描述这个方法的作用) 
	* @param @param shry
	* @param @return    设定文件 
	* @return boolean    返回类型 
	* @throws
	 */
	public boolean deleteSZCP_SQ_SHRY(SZCP_SQ_SHRY shry) {
		boolean flag = false;
		String sql = "delete  from SZCP_SQ_SHRY where REG_NO = ? and EVAL_YEAR = ? and CERT_NAME = ?";
		DbConnection dbConnection = new DbConnection();
		PreparedStatement prsmt = null;
		try {
			prsmt = dbConnection.prepareStatement(sql);
			prsmt.setString(1, shry.getREG_NO());
			prsmt.setString(2, shry.getEVAL_YEAR());
			prsmt.setString(3,unescape(shry.getCERT_NAME()));
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
	
	
	
	
	
	public boolean editSZCP_SQ_SHRY(SZCP_SQ_SHRY shry) {
		StringBuffer sql = new StringBuffer();
		DbConnection connection = new DbConnection();
		sql.append(" update SZCP_SQ_SHRY set CERT_NO = ").append("'"+this.unescape(shry.getCERT_NO())+"',")
		.append(" VALID_TO_DATE = ").append("to_date('"+shry.getVALID_TO_DATE()+"',"+"'yyyy/MM/dd'),")
		.append(" AUTH_ORG_DESC = ").append("'"+this.unescape(shry.getAUTH_ORG_DESC())+"',").append("ISSUE_DATE = ")
		.append(" to_date('"+shry.getISSUE_DATE()+"','yyyy/MM/dd'),").append(" HONOR_LEVEL_TYPE = ").append("'"+shry.getHONOR_LEVEL_TYPE()+"',")
		.append(" HONORDESC = ").append("'").append(this.unescape(shry.getHONORDESC())+"'").append(" where REG_NO = ").append("'"+shry.getREG_NO()+"'"+" and EVAL_YEAR = ")
		.append("'"+shry.getEVAL_YEAR()+"' and CERT_NAME = "+"'"+this.unescape(shry.getCERT_NAME())+"'");
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
	
	
	
	
	/**
	 * 
	* @Title: addSZCP_SQ_SHRY 
	* @Description: 添加社会荣誉
	* @param @param shry
	* @param @return    设定文件 
	* @return boolean    返回类型 
	* @throws
	 */
	public boolean addSZCP_SQ_SHRY(SZCP_SQ_SHRY shry) {
		StringBuffer sql = new StringBuffer();
		DbConnection connection = new DbConnection();
		sql.append(" insert into SZCP_SQ_SHRY(REG_NO,EVAL_YEAR,CERT_NAME,CERT_NO,VALID_TO_DATE,AUTH_ORG_DESC,ISSUE_DATE,HONOR_LEVEL_TYPE,HONORDESC) values( ") ;
		sql.append("'"+shry.getREG_NO()+"',").append("'"+shry.getEVAL_YEAR()+"',").append("'"+this.unescape(shry.getCERT_NAME())+"',").append("'"+this.unescape(shry.getCERT_NO())+"',")
		.append("to_date('"+shry.getVALID_TO_DATE()+"',"+"'yyyy/MM/dd'),").append("'"+this.unescape(shry.getAUTH_ORG_DESC())+"',").append("to_date('"+shry.getISSUE_DATE()+"','yyyy/MM/dd'),")
		.append("'"+shry.getHONOR_LEVEL_TYPE()+"',").append("'"+this.unescape(shry.getHONORDESC())+"')");
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
	
	
	
	
	
	
	/*public String queryAllSZCP_SQ_SHRY(){
		StringBuffer sb = new StringBuffer();
		String sql = "select *from SZCP_SQ_SHRY ";
		DbConnection connection = new DbConnection();
		ResultSet rs = null;
		List<SZCP_SQ_SHRY> list = new ArrayList<SZCP_SQ_SHRY>();
		try {
			 rs = connection.executeQuery(sql);
			 while(rs.next()) {
				SZCP_SQ_SHRY shry = new SZCP_SQ_SHRY();
				shry.setREG_NO(rs.getString("REG_NO") == null ?"":rs.getString("REG_NO") );
				shry.setEVAL_YEAR(rs.getString("EVAL_YEAR") == null ?"":rs.getString("EVAL_YEAR"));
				shry.setCERT_NAME(rs.getString("CERT_NAME") == null ?"":rs.getString("CERT_NAME"));
				shry.setCERT_NO(rs.getString("CERT_NO") == null ?"":rs.getString("CERT_NO"));
				shry.setVALID_TO_DATE(String.valueOf(rs.getDate("VALID_TO_DATE") == null ?"":rs.getDate("VALID_TO_DATE")));
				shry.setAUTH_ORG_DESC(rs.getString("AUTH_ORG_DESC") == null ?"":rs.getString("AUTH_ORG_DESC"));
				shry.setISSUE_DATE(String.valueOf(rs.getDate("ISSUE_DATE") == null ?"":rs.getDate("ISSUE_DATE")));
				shry.setHONOR_LEVEL_TYPE(rs.getString("HONOR_LEVEL_TYPE") == null ?"":rs.getString("HONOR_LEVEL_TYPE"));
				shry.setHONORDESC(rs.getString("HONORDESC") == null ?"":rs.getString("HONORDESC"));
				shry.setHONOR_LEVEL_TYPE_VIEW(rs.getString("HONOR_LEVEL_TYPE") == null ?"":queryHonor_Level_Type(rs.getString("HONOR_LEVEL_TYPE"),connection));
				list.add(shry);
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
		
		for (SZCP_SQ_SHRY szcp_SQ_SHRY : list) {
			sb.append("<tr>").append("<td>").append(szcp_SQ_SHRY.getHONOR_LEVEL_TYPE_VIEW()).append("</td>");
			sb.append("<td>").append(szcp_SQ_SHRY.getCERT_NAME()).append("</td>");
			sb.append("<td>").append(szcp_SQ_SHRY.getCERT_NO()).append("</td>");
			sb.append("<td>").append(szcp_SQ_SHRY.getAUTH_ORG_DESC()).append("</td>");
			sb.append("<td>").append(szcp_SQ_SHRY.getISSUE_DATE()).append("</td>");
			sb.append("<td>").append(szcp_SQ_SHRY.getVALID_TO_DATE()).append("</td>");
			sb.append("<td>").append(szcp_SQ_SHRY.getHONORDESC()).append("</td>").append("<tr>");
		}
		return sb.toString();
	}*/
	/**
	 * 
	* @Title: queryHonor_Level_Type 
	* @Description: 查询类型对应的名称
	* @param @param string
	* @param @param connection
	* @param @return    设定文件 
	* @return String    返回类型 
	* @throws
	 */
	private String queryHonor_Level_Type(String code,DbConnection connection) {
		String sql = "select t.content from com_dm t where t.code = "+"'"+code +"'"+" and t.type = 'SZCPRYJB'";
		String name = "";
		ResultSet rs = null;
		try {
			 rs = connection.executeQuery(sql);
			if(rs.next()) {
				name = rs.getString("content");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return name;
	}


	public  List<SZCP_SQ_SHRY> querySZCP_SQ_SHRY(String regNo,String year) {
		String sql = "select *from SZCP_SQ_SHRY where REG_NO = ? and EVAL_YEAR = ?";
		DbConnection connection = new DbConnection();
		ResultSet rs = null;
		PreparedStatement prsmt = null;
		List<SZCP_SQ_SHRY> list = new ArrayList<SZCP_SQ_SHRY>();
		try {
			 prsmt = connection.prepareStatement(sql);
			 prsmt.setString(1, regNo);
			 prsmt.setString(2, year);
			 rs = prsmt.executeQuery();
			 while(rs.next()) {
				SZCP_SQ_SHRY shry = new SZCP_SQ_SHRY();
				shry.setREG_NO(rs.getString("REG_NO") == null ?"":rs.getString("REG_NO") );
				shry.setEVAL_YEAR(rs.getString("EVAL_YEAR") == null ?"":rs.getString("EVAL_YEAR"));
				shry.setCERT_NAME(rs.getString("CERT_NAME") == null ?"":rs.getString("CERT_NAME"));
				shry.setCERT_NO(rs.getString("CERT_NO") == null ?"":rs.getString("CERT_NO"));
				shry.setVALID_TO_DATE(String.valueOf(rs.getDate("VALID_TO_DATE") == null ?"":rs.getDate("VALID_TO_DATE")));
				shry.setAUTH_ORG_DESC(rs.getString("AUTH_ORG_DESC") == null ?"":rs.getString("AUTH_ORG_DESC"));
				shry.setISSUE_DATE(String.valueOf(rs.getDate("ISSUE_DATE") == null ?"":rs.getDate("ISSUE_DATE")));
				shry.setHONOR_LEVEL_TYPE(rs.getString("HONOR_LEVEL_TYPE") == null ?"":rs.getString("HONOR_LEVEL_TYPE"));
				shry.setHONOR_LEVEL_TYPE_VIEW(rs.getString("HONOR_LEVEL_TYPE") == null ?"":queryHonor_Level_Type(rs.getString("HONOR_LEVEL_TYPE"),connection));
				shry.setHONORDESC(rs.getString("HONORDESC") == null?"":rs.getString("HONORDESC"));
				list.add(shry);
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
	
	public SZCP_SQ_SHRY querySZCP_SQ_SHRY(String regNo,String year,String cerName) {
		cerName = unescape(cerName);
		String sql = "select *from SZCP_SQ_SHRY where REG_NO = ? and EVAL_YEAR = ? and CERT_NAME = ?";
		DbConnection connection = new DbConnection();
		ResultSet rs = null;
		PreparedStatement prsmt = null;
		SZCP_SQ_SHRY shry = new SZCP_SQ_SHRY();
		try {
			 prsmt = connection.prepareStatement(sql);
			 prsmt.setString(1, regNo);
			 prsmt.setString(2, year);
			 prsmt.setString(3, cerName);
			 rs = prsmt.executeQuery();
			 if(rs.next()) {
				shry.setREG_NO(rs.getString("REG_NO") == null ?"":rs.getString("REG_NO") );
				shry.setEVAL_YEAR(rs.getString("EVAL_YEAR") == null ?"":rs.getString("EVAL_YEAR"));
				shry.setCERT_NAME(rs.getString("CERT_NAME") == null ?"":rs.getString("CERT_NAME"));
				shry.setCERT_NO(rs.getString("CERT_NO") == null ?"":rs.getString("CERT_NO"));
				shry.setVALID_TO_DATE(String.valueOf(rs.getDate("VALID_TO_DATE") == null ?"":rs.getDate("VALID_TO_DATE")));
				shry.setAUTH_ORG_DESC(rs.getString("AUTH_ORG_DESC") == null ?"":rs.getString("AUTH_ORG_DESC"));
				shry.setISSUE_DATE(String.valueOf(rs.getDate("ISSUE_DATE") == null ?"":rs.getDate("ISSUE_DATE")));
				shry.setHONOR_LEVEL_TYPE(rs.getString("HONOR_LEVEL_TYPE") == null ?"":rs.getString("HONOR_LEVEL_TYPE"));
				shry.setHONOR_LEVEL_TYPE_VIEW(rs.getString("HONOR_LEVEL_TYPE") == null ?"":queryHonor_Level_Type(rs.getString("HONOR_LEVEL_TYPE"),connection));
				shry.setHONORDESC(rs.getString("HONORDESC") == null?"":rs.getString("HONORDESC"));
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
		return shry;
	}
	
	
	
	
	/**
	 * 
	* @Title: setValueToSZCP_SQ_SHRY 
	* @Description: 赋值
	* @param @param rs
	* @param @param shry    设定文件 
	* @return void    返回类型 
	* @throws
	 */
/*	private void setValueToSZCP_SQ_SHRY(ResultSet rs, SZCP_SQ_SHRY shry) {
		try {
			shry.setREG_NO(rs.getString("REG_NO") == null ?"":rs.getString("REG_NO") );
			shry.setEVAL_YEAR(rs.getString("EVAL_YEAR") == null ?"":rs.getString("EVAL_YEAR"));
			shry.setCERT_NAME(rs.getString("CERT_NAME") == null ?"":rs.getString("CERT_NAME"));
			shry.setCERT_NO(rs.getString("CERT_NO") == null ?"":rs.getString("CERT_NO"));
			shry.setVALID_TO_DATE(String.valueOf(rs.getDate("VALID_TO_DATE") == null ?"":rs.getDate("VALID_TO_DATE")));
			shry.setAUTH_ORG_DESC(rs.getString("AUTH_ORG_DESC") == null ?"":rs.getString("AUTH_ORG_DESC"));
			shry.setISSUE_DATE(String.valueOf(rs.getDate("ISSUE_DATE") == null ?"":rs.getDate("ISSUE_DATE")));
			shry.setHONOR_LEVEL_TYPE(rs.getString("HONOR_LEVEL_TYPE") == null ?"":rs.getString("HONOR_LEVEL_TYPE"));
		}catch(Exception e ) {
			e.printStackTrace();
		}
	}*/
	
	
}
