package com.macrosoft.icms.szcp.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.macrosoft.icms.dbc.DbConnection;
import com.macrosoft.icms.system.SysUtility;
import com.macrosoft.icms.szcp.SZCP_SQ_HT_XYGL;

/**
 * 
* @Title: SZCP_SQ_HT_XYGL.java 
* @Package com.macrosoft.icms.szcp 
* @Description: 查询数据
* @author yuchengjian 
* @date 2015-3-21 上午10:58:57 
* @version V1.0
 */
public class SZCP_SQ_HT_XYGLDao {
	
	/**
	 * 
	* @Title: isEmptySZCP_SQ_HT_XYGL 
	* @Description: 查询合同信用管理是否存在数据
	* @param @param regNo
	* @param @param year
	* @param @return    设定文件 
	* @return boolean    返回类型 
	* @throws
	 */
	public boolean isEmptySZCP_SQ_HT_XYGL(String regNo,String year) {
		String sql = "select count(*) as xyglCount from  SZCP_SQ_HT_XYGL where REG_NO = "+"'"+regNo+"'"+" and EVAL_YEAR = "+"'"+year+"'";
		DbConnection connection = new DbConnection();
		ResultSet rs = null;
		boolean flag = false;
		try {
			 rs = connection.executeQuery(sql);
			 if(rs.next()) {
				 flag = Integer.parseInt(rs.getString("xyglCount")) < 1?true:false;
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
	* @Title: queryALLPOSTCODENAME 
	* @Description: 查询职位
	* @param @return    设定文件 
	* @return String    返回类型 
	* @throws
	 */
	public String queryALLPOSTCODENAME() {
		DbConnection dbc=new DbConnection();
		String sql = "select t.code, t.content from com_dm t where  t.type = 'POSITION'";
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
	* @Title: queryAllOrgQualLevelType 
	* @Description: 查询所有
	* @param @return    设定文件 
	* @return String    返回类型 
	* @throws
	 */
	public String queryAllOrgQualLevelType() {
		DbConnection dbc=new DbConnection();
		String sql = "select t.code, t.content from com_dm t where  t.type = 'SZCPZYZG'";
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
	* @Title: queryAllQualLevelType 
	* @Description: 查询所有
	* @param @return    设定文件 
	* @return String    返回类型 
	* @throws
	 */
	public String queryAllQualLevelType() {
		DbConnection dbc=new DbConnection();
		String sql = "select t.code, t.content from com_dm t where  t.type = 'SZCPZYZGDJ'";
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
	* @Title: queryQualLevelType 
	* @Description: 查询职业资格
	* @param @return    设定文件 
	* @return String    返回类型 
	* @throws
	 */
	public String queryQualLevelType(String qualLevelType) {
		DbConnection dbc=new DbConnection();
		String sqlOne = "select t.code,t.content from com_dm t where t.code = "+"'"+SysUtility.doPreProcess(qualLevelType) +"'"+" and t.type = 'SZCPZYZGDJ'";
		String sqlTwo = " select t.code, t.content from com_dm t where  t.type = 'SZCPZYZGDJ'";
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
	 * print and expword
	* @Title: queryQualLevelType 
	* @Description: 查询职业资格
	* @param @return    设定文件 
	* @return String    返回类型 
	* @throws
	 */
	public String queryQualLevelType_Print(String qualLevelType,String type) {
		DbConnection dbc=new DbConnection();
		String sqlOne = "select t.code,t.content from com_dm t where t.code = "+"'"+SysUtility.doPreProcess(qualLevelType) +"'"+" and t.type = 'SZCPZYZGDJ'";
		String sqlTwo = " select t.code, t.content from com_dm t where  t.type = 'SZCPZYZGDJ'";
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
						sb.append("√"+tempContent).append("\n");
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
					sb.append("<input value= ").append("'").append(tempCode).append("'").append("checked = 'checked' disabled ='disabled' ").append(" type=").append("'checkbox'")
					.append(">")
					.append(tempContent).append("</input>").append("\n");
				}else {
					sb.append("<input value= ").append("'").append(tempCode).append("'").append(" type=").append("'checkbox'").append("disabled ='disabled'")
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
	* @Title: queryPostQual_Level_Type 
	* @Description: 查询职称
	* @param @param qualLevelType
	* @param @return    设定文件 
	* @return String    返回类型 
	* @throws
	 */
	public String queryOrgQual_Level_Type(String qualLevelType) {
		DbConnection dbc=new DbConnection();
		String sqlOne = "select t.code,t.content from com_dm t where t.code = "+"'"+SysUtility.doPreProcess(qualLevelType) +"'"+" and t.type = 'SZCPZYZG'";
		String sqlTwo = " select t.code, t.content from com_dm t where  t.type = 'SZCPZYZG'";
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
	 * print and expword
	* @Title: queryPostQual_Level_Type 
	* @Description: 查询职称
	* @param @param qualLevelType
	* @param @return    设定文件 
	* @return String    返回类型 
	* @throws
	 */
	public String queryOrgQual_Level_Type_Print(String qualLevelType,String type) {
		DbConnection dbc=new DbConnection();
		String sqlOne = "select t.code,t.content from com_dm t where t.code = "+"'"+SysUtility.doPreProcess(qualLevelType) +"'"+" and t.type = 'SZCPZYZG'";
		String sqlTwo = " select t.code, t.content from com_dm t where  t.type = 'SZCPZYZG'";
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
					sb.append("<input value= ").append("'").append(tempCode).append("'").append("checked = 'checked' disabled ='disabled' ").append(" type=").append("'checkbox'")
					.append(">")
					.append(tempContent).append("</input>").append("\n");
				}else {
					sb.append("<input value= ").append("'").append(tempCode).append("'").append(" type=").append("'checkbox'").append("disabled ='disabled'")
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
	* @Title: queryPostCodeName 
	* @Description: 查询职位
	* @param @param postCode
	* @param @return    设定文件 
	* @return String    返回类型 
	* @throws
	 */
	public String queryPostCodeName(String postCode) {
		DbConnection dbc=new DbConnection();
		String sqlOne = "select t.code,t.content from com_dm t where t.code = "+"'"+SysUtility.doPreProcess(postCode) +"'"+" and t.type = 'POSITION'";
		String sqlTwo = " select t.code, t.content from com_dm t where  t.type = 'POSITION'";
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
	* @Title: queryPostCodeName 
	* @Description: 查询职位
	* @param @param postCode
	* @param @return    设定文件 
	* @return String    返回类型 
	* @throws
	 */
	public String queryPostCodeName_Print(String postCode) {
		DbConnection dbc=new DbConnection();
		String sqlOne = "select t.code,t.content from com_dm t where t.code = "+"'"+SysUtility.doPreProcess(postCode) +"'"+" and t.type = 'POSITION'";
		String sqlTwo = " select t.code, t.content from com_dm t where  t.type = 'POSITION'";
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
					/*sb.append("<option value= ").append("'").append(tempCode).append("'").append("selected = 'selected' ")
					.append(">")*/
					sb.append(tempContent);/*.append("</option>").append("\n");*/
				}/*else {
					sb.append("<option value= ").append("'").append(tempCode).append("'")
					.append(">")
					.append(tempContent).append("</option>").append("\n");
				}*/
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
	* @Title: queryAllMNG_ORG_TYPE 
	* @Description: 查询所有
	* @param @return    设定文件 
	* @return String    返回类型 
	* @throws
	 */
	public String queryAllMNG_ORG_TYPE() {
		DbConnection dbc=new DbConnection();
		String sql = "select t.code, t.content from com_dm t where  t.type = 'SZCPHTXYGLJGLX'";
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
	* @Title: queryMNG_ORG_TYPE 
	* @Description: 查询字典表内的合同信用管理机构
	* @param @param MNG_ORG_TYPE
	* @param @return    设定文件 
	* @return String    返回类型 
	* @throws
	 */
	public String queryMNG_ORG_TYPE(String MNG_ORG_TYPE) {
		DbConnection dbc=new DbConnection();
		String sqlOne = "select t.code, t.content from com_dm t where t.code = "+"'"+SysUtility.doPreProcess(MNG_ORG_TYPE) +"'"+" and t.type = 'SZCPHTXYGLJGLX'";
		String sqlTwo = "select t.code, t.content from com_dm t where  t.type = 'SZCPHTXYGLJGLX'";
		String code = "";
		String content = "";
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
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
		return sb.toString();
	}
	
	/**
	 * 
	 * print
	* @Title: queryMNG_ORG_TYPE 
	* @Description: 查询字典表内的合同信用管理机构
	* @param @param MNG_ORG_TYPE
	* @param @return    设定文件 
	* @return String    返回类型 
	* @throws
	 */
	public String queryMNG_ORG_TYPE_Exp(String MNG_ORG_TYPE) {
		DbConnection dbc=new DbConnection();
		String sqlOne = "select t.code, t.content from com_dm t where t.code = "+"'"+SysUtility.doPreProcess(MNG_ORG_TYPE) +"'"+" and t.type = 'SZCPHTXYGLJGLX'";
		String sqlTwo = "select t.code, t.content from com_dm t where  t.type = 'SZCPHTXYGLJGLX'";
		String code = "";
		String content = "";
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
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
					sb
					.append("□"+tempContent).append("\n");
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
		return sb.toString();
	}
	/**
	 * 
	 * print
	* @Title: queryMNG_ORG_TYPE 
	* @Description: 查询字典表内的合同信用管理机构
	* @param @param MNG_ORG_TYPE
	* @param @return    设定文件 
	* @return String    返回类型 
	* @throws
	 */
	public String queryMNG_ORG_TYPE_Print(String MNG_ORG_TYPE) {
		DbConnection dbc=new DbConnection();
		String sqlOne = "select t.code, t.content from com_dm t where t.code = "+"'"+SysUtility.doPreProcess(MNG_ORG_TYPE) +"'"+" and t.type = 'SZCPHTXYGLJGLX'";
		String sqlTwo = "select t.code, t.content from com_dm t where  t.type = 'SZCPHTXYGLJGLX'";
		String code = "";
		String content = "";
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
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
					.append(tempContent).append("</input>").append("\n");
				}else {
					sb.append("<input value= ").append("'").append(tempCode).append("'").append(" type=").append("'radio'").append("disabled ='disabled'")
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
		return sb.toString();
	}
	
	
	/**
	 * 
	* @Title: querySZCP_SQ_HT_XYGL 
	* @Description:查询所有
	* @param @param regNo
	* @param @param year
	* @param @return    设定文件 
	* @return SZCP_SQ_HT_XYGL    返回类型 
	* @throws
	 */
	public SZCP_SQ_HT_XYGL querySZCP_SQ_HT_XYGL(String regNo,String year) {
		String sql = "select *from SZCP_SQ_HT_XYGL where REG_NO = "+"'"+regNo+"'"+" and EVAL_YEAR = "+"'"+year+"'";
		DbConnection connection = new DbConnection();
		ResultSet rs = null;
		SZCP_SQ_HT_XYGL xygl = new SZCP_SQ_HT_XYGL();
		try {
			 rs = connection.executeQuery(sql);
			 if(rs.next()) {
				 xygl = setValueToSZCP_SQ_HT_XYGL(rs);
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
		return xygl;
	}
	
	
	
	
	
	private SZCP_SQ_HT_XYGL setValueToSZCP_SQ_HT_XYGL(ResultSet rs) {
		SZCP_SQ_HT_XYGL szcp_sq_ht_xygl = new SZCP_SQ_HT_XYGL();
		try {
			szcp_sq_ht_xygl.setREG_NO(rs.getString("REG_NO") == null ?"":rs.getString("REG_NO"));
			szcp_sq_ht_xygl.setEVAL_YEAR(rs.getString("EVAL_YEAR") == null ?"":rs.getString("EVAL_YEAR"));
			szcp_sq_ht_xygl.setMNG_ORG_TYPE(rs.getString("MNG_ORG_TYPE") == null?"":rs.getString("MNG_ORG_TYPE"));
			szcp_sq_ht_xygl.setOTHER_ORG_DESC(rs.getString("OTHER_ORG_DESC") == null ?"":rs.getString("OTHER_ORG_DESC"));
			szcp_sq_ht_xygl.setORG_LEAD_NAME(rs.getString("ORG_LEAD_NAME") == null ?"":rs.getString("ORG_LEAD_NAME") );
			szcp_sq_ht_xygl.setORG_LEAD_POS_TYPE(rs.getString("ORG_LEAD_POS_TYPE") == null ?"":rs.getString("ORG_LEAD_POS_TYPE"));
			szcp_sq_ht_xygl.setORG_LEAD_TEL_NO(rs.getString("ORG_LEAD_TEL_NO") == null ?"":rs.getString("ORG_LEAD_TEL_NO"));
			szcp_sq_ht_xygl.setORG_LEAD_QUAL_TYPE(rs.getString("ORG_LEAD_QUAL_TYPE") == null ?"":rs.getString("ORG_LEAD_QUAL_TYPE"));
			szcp_sq_ht_xygl.setQUAL_LEVEL_TYPE(rs.getString("QUAL_LEVEL_TYPE") == null ?"":rs.getString("QUAL_LEVEL_TYPE"));
			szcp_sq_ht_xygl.setMS_POS_RESP_FLAG(rs.getString("MS_POS_RESP_FLAG") == null ?"":rs.getString("MS_POS_RESP_FLAG"));
			szcp_sq_ht_xygl.setMS_DELEGATE_FLAG(rs.getString("MS_DELEGATE_FLAG") == null ?"":rs.getString("MS_DELEGATE_FLAG"));
			szcp_sq_ht_xygl.setMS_SIGN_REVIEW_FLAG(rs.getString("MS_SIGN_REVIEW_FLAG") == null ?"":rs.getString("MS_SIGN_REVIEW_FLAG"));
			szcp_sq_ht_xygl.setMS_SEAL_FILE_FLAG(rs.getString("MS_SEAL_FILE_FLAG") == null ?"":rs.getString("MS_SEAL_FILE_FLAG"));
			szcp_sq_ht_xygl.setMS_RISK_EMG_FLAG(rs.getString("MS_RISK_EMG_FLAG") == null ?"":rs.getString("MS_RISK_EMG_FLAG"));
			szcp_sq_ht_xygl.setMS_SIGN_CANCEL_FLAG(rs.getString("MS_SIGN_CANCEL_FLAG") == null ?"":rs.getString("MS_SIGN_CANCEL_FLAG"));
			szcp_sq_ht_xygl.setMS_RECV_ACCT_FLAG(rs.getString("MS_RECV_ACCT_FLAG") ==null?"":rs.getString("MS_RECV_ACCT_FLAG"));
			szcp_sq_ht_xygl.setMS_PAY_ACCT_FLAG(rs.getString("MS_PAY_ACCT_FLAG") == null ?"":rs.getString("MS_PAY_ACCT_FLAG"));
			szcp_sq_ht_xygl.setMS_GUEST_FLAG(rs.getString("MS_GUEST_FLAG") == null ?"":rs.getString("MS_GUEST_FLAG"));
			szcp_sq_ht_xygl.setFULLTIME_MNG_QTY(rs.getInt("FULLTIME_MNG_QTY"));
			szcp_sq_ht_xygl.setPARTTIME_MNG_QTY(rs.getInt("PARTTIME_MNG_QTY"));
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return szcp_sq_ht_xygl;
	}
	
}
