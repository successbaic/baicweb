package com.macrosoft.icms.szcp;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.macrosoft.icms.dbc.DbConnection;
import com.macrosoft.icms.gsdbc.GsDbConnection;
import com.macrosoft.icms.gsnw.QYDJ_RYXX_ZS;

/**
 * 
 * @author 于成健
 * @desc 企业基本信息 CRUD
 */
public class SZCP_SQ_JBXX {

	/**
	 * PK
	 */
	String RECORD_NO = "";

	/**
	 * 评价年度
	 */
	String EVAL_YEAR = "";
	/**
	 * 注册号
	 */
	String REG_NO = "";
	/**
	 * 企业名称
	 */
	String ENT_NAME = "";
	/**
	 * 网址
	 */
	String WEBSITE_DESC = "";
	/**
	 * 企业类型
	 */
	String ENT_TYPE = "";
	/**
	 * 行政区划
	 */
	String DOM_DISTRICT_CODE = "";
	/**
	 * 管辖机关
	 */
	String LOCAL_ORG_NO = "";
	/**
	 * 企业住所
	 */
	String ADDR_DESC = "";
	/**
	 * 注册资金
	 */
	float REG_CAP_RMB_W;
	/**
	 * 组织机构代码
	 */
	String ORG_CODE = "";
	/**
	 * 成立日期
	 */
	String EST_DATE = "";
	/**
	 * 经营期限至
	 */
	String OPER_TO_DATE = "";
	/**
	 * 法定代表人姓名
	 */
	String LEG_REP_NAME = "";
	/**
	 * 法定代表人证件类型
	 */
	String LEG_REP_CERT_TYPE = "";
	/**
	 * 法定代表人证件号码
	 */
	String LEG_REP_CERT_NO = "";
	/**
	 * 企业固定电话
	 */
	String TEL_NO = "";
	/**
	 * 企业规模
	 */
	String ENT_SCALE_TYPE = "";
	/**
	 * 国民经济行业门类
	 */
	String GB_INDUSTRY_TYPE = "";
	/**
	 * 守重行业分类
	 */
	String LOCAL_INDUSTRY_TYPE = "";
	/**
	 * 经营范围
	 */
	String BUSI_SCOPE_DESC = "";
	/**
	 * 总职工数
	 */
	int TOTAL_STAFF_QTY;
	/**
	 * 管理职工数
	 */
	int MNG_STAFF_QTY;
	/**
	 * 技术职工数
	 */
	int TECH_STAFF_QTY;
	/**
	 * 其他职工数
	 */
	int OTHER_STAFF_QTY;
	/**
	 * 联系人姓名
	 */
	String LIAI_NAME = "";
	/**
	 * 联系人职位代码
	 */
	String LIAI_POS_CODE = "";
	/**
	 * 联系人传真
	 */
	String LIAI_FAX_NO = "";
	/**
	 * 联系人EMAIL
	 */
	String LIAI_EMAIL = "";
	/**
	 * 联系人手机号
	 */
	String LIAI_MOBILE_NO = "";
	/**
	 * 联系人固话
	 */
	String LIAI_TEL_NO = "";
	/*
	 * PRIPID
	 */
	String PRIPID = "";

	String REPORT_ORG_NO="";
	
	/**
	 * 报送号码
	 */
	private String reportOrgNo;
	
	/**
	 * 报送机关
	 */
	private  String reportName;
	
	/**
	 * 登记机关
	 */
	private  String REGORG;
	
	
	public String getReportOrgNo() {
		return reportOrgNo;
	}

	public void setReportOrgNo(String reportOrgNo) {
		this.reportOrgNo = reportOrgNo;
	}

	public String getReportName() {
		return reportName;
	}

	public void setReportName(String reportName) {
		this.reportName = reportName;
	}

	public String doPreProcess(String sValue) {
		return com.macrosoft.icms.system.SysUtility.doPreProcess(sValue);
	}

	/**
	 * 
	 * @Title: commonSql
	 * @Description: 公用sql
	 * @param @param REG_NO
	 * @param @param ENT_NAME
	 * @param @param year
	 * @param @return 设定文件
	 * @return String 返回类型
	 * @throws
	 */
	private String commonSql(String REG_NO, int year) {
		String sql = "select * from szcp_sq_jbxx where REG_NO = " + "'"
				+ doPreProcess(REG_NO) + "'" + " and to_number(EVAL_YEAR) = "
				+ year;
		return sql;
	}

	/**
	 * 查询基本信息
	 */
	public void doSelect(String REG_NO, String Year, String CerNO) {
		DbConnection dbc = new DbConnection();
		GsDbConnection gsdbs = new GsDbConnection();
		ResultSet rs = null;
		try {
			int year = Integer.parseInt(doPreProcess(Year));
			// 首先查询有无今年数据
			String sql = commonSql(REG_NO, year);
			rs = dbc.executeQuery(sql);
			// 存在赋值
			if (rs.next()) {
				doSetJBXX(rs);
			} else {
				// 查询往年数据
				String lastSql = commonSql(REG_NO, year - 1);
				rs = dbc.executeQuery(lastSql);
				// 存在赋值
				if (rs.next()) {
					doSetJBXX(rs);
				} else {
					//先查询是否是省局注册企业
					String YsbSql = "select * from SZCP_YSB where REG_NO="
						+"'"+doPreProcess(REG_NO)+"'";
					rs = dbc.executeQuery(YsbSql);
					if(rs.next()){
						if(rs.getString("REG_ORG").equals("370000")){
							doSetYsbValueToJbxx(rs,Year);
						}else{
							// 不存在 从对应的表中取
							// 查询lczt表
							String lcztSql = "select * from SZCP_LCZT where REG_NO = "
									+ "'" + doPreProcess(REG_NO) + "'"
									+ " and EVAL_YEAR = " + "'" + doPreProcess(Year)
									+ "'";
							rs = dbc.executeQuery(lcztSql);
							if (rs.next()) {
								// 赋值
								doSetLCZTValueToJBXX(rs);
							}
							// 查询QYDJ_JBXX_ZS 企业登记基本信息表
							String QYDJ_JBXX_ZSl = " SELECT * FROM QYDJ_JBXX_ZS WHERE "
									+ " REGNO = " + "'" + doPreProcess(REG_NO) + "'";
							rs = gsdbs.executeQuery(QYDJ_JBXX_ZSl);
							if (rs.next()) {
								// 赋值
								doSetQYDJ_JBXX_ZSValueToJBXX(rs);
							}
							// 查询QYDJ_RYXX_ZS表
							String QYDJ_RYXX_ZSl = " select * from QYDJ_RYXX_ZS where cerno = "
									+ "'" + doPreProcess(CerNO) + "'";
							rs = gsdbs.executeQuery(QYDJ_RYXX_ZSl);
							if (rs.next()) {
								// 赋值
								doSetQYDJ_RYXX_ZSLQuery(rs);
							}
							// 查询企业法人
							QYDJ_RYXX_ZS qydjRyxxZs = new QYDJ_RYXX_ZS();
							qydjRyxxZs.setPRIPID(this.PRIPID);
							qydjRyxxZs.doSelectByLEREPSIGN();
							this.LEG_REP_NAME = qydjRyxxZs.getNAME();
						}
					}
					
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			try {
				dbc.close();
				gsdbs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	private void doSetYsbValueToJbxx(ResultSet rs,String year){
		try{
			OPER_TO_DATE = String.valueOf(rs.getDate("OPER_TO_DATE")== null ?"":rs.getDate("OPER_TO_DATE"));
			LEG_REP_NAME = rs.getString("LEG_REP_NAME") == null ? "" : rs.getString("LEG_REP_NAME");
			TEL_NO = rs.getString("TEL_NO") == null ? "" :rs.getString("TEL_NO");
			BUSI_SCOPE_DESC = rs.getString("BUSI_SCOPE_DESC") == null ? "" :rs.getString("BUSI_SCOPE_DESC");
			GB_INDUSTRY_TYPE = rs.getString("LOCAL_INDUSTRY_TYPE") == null ? "" :rs.getString("LOCAL_INDUSTRY_TYPE");
			EST_DATE = String.valueOf(rs.getDate("EST_DATE") == null ? "" : rs.getDate("EST_DATE"));
			REG_CAP_RMB_W = Float.parseFloat(rs.getString("REG_CAP_RMB_W") == null ? "0.0" : rs.getString("REG_CAP_RMB_W"));
			ENT_TYPE = rs.getString("ENT_TYPE") == null ? "" : rs.getString("ENT_TYPE");
			GB_INDUSTRY_TYPE = rs.getString("LOCAL_INDUSTRY_TYPE") == null ? "" : rs.getString("LOCAL_INDUSTRY_TYPE");
			LEG_REP_CERT_TYPE = rs.getString("LEG_REP_CERT_TYPE") == null ? "" : rs.getString("LEG_REP_CERT_TYPE");
			LEG_REP_CERT_NO = rs.getString("LEG_REP_CERT_NO") == null ? "" : rs.getString("LEG_REP_CERT_NO");
			EVAL_YEAR = doPreProcess(year);
			REG_NO = rs.getString("REG_NO") == null ? "" : rs.getString("REG_NO");
			ENT_NAME = rs.getString("ENT_NAME") == null ? "" : rs.getString("ENT_NAME");
			DOM_DISTRICT_CODE = rs.getString("DOM_DISTRICT_CODE") == null ? "": rs.getString("DOM_DISTRICT_CODE");
			LOCAL_ORG_NO = rs.getString("REG_ORG") == null ? "" : rs.getString("REG_ORG");
			ADDR_DESC = rs.getString("ADDR_DESC") == null ? "" : rs.getString("ADDR_DESC");
			REGORG = rs.getString("REG_ORG") == null ? "" : rs.getString("REG_ORG");
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	/**
	 * 
	 * 查询QYDJ_RYXX_ZS表 设置到JBXX
	 */
	private void doSetQYDJ_RYXX_ZSLQuery(ResultSet rs) {
		try {
			LEG_REP_CERT_TYPE = rs.getString("CERTYPE") == null ? "" : rs
					.getString("CERTYPE");
			LEG_REP_CERT_NO = rs.getString("CERNO") == null ? "" : rs
					.getString("CERNO");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 导出word
	 * 根据企业类型编号，查询出对应的企业类型名称，方便页面显示
	 */
	public String queryENT_TYPE_Name(String ENT_TYPE_CODE) {
		DbConnection dbc = new DbConnection();
		String sql = "select t.content,t.code from com_dm t where t.code = " + "'"
				+ doPreProcess(ENT_TYPE_CODE) + "'" + " and t.type = 'ENTCAT'";
		String sql2 =  "select t.content,t.code from com_dm t where t.type = 'ENTCAT'";
		String code = "";
		String content = "";
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
		try {
			rs = dbc.executeQuery(sql);
			if (rs.next()) {
				code = rs.getString("code");
				content = rs.getString("content");
			}
			rs= dbc.executeQuery(sql2);
			while(rs.next()){
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
		} finally {
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
	 * 查询所有的企业类型规模
	 */
	public String queryALLENT_SCALE_TYPE() {
		DbConnection dbc = new DbConnection();
		String sql = "select t.code, t.content from com_dm t where  t.type = 'SZCPGMDM'";
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
		try {
			rs = dbc.executeQuery(sql);
			while (rs.next()) {
				sb.append("<option value= ").append("'")
						.append(rs.getString("CODE")).append("'").append(">")
						.append(rs.getString("CONTENT").trim())
						.append("</option>").append("\n");
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
				dbc.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return sb.toString();
	}

	/**
	 * 
	 * 根据REPORT_ORG_NO查询报送机关
	 */
	public String queryREPORT_ORG_NO(String REG_NO, String YEAR) {
		DbConnection dbc = new DbConnection();
		String sql = "select REPORT_ORG_NO from SZCP_LCZT where REG_NO = ? and EVAL_YEAR = ?";
		String sql2 = "select * from com_dm where type = 'DISTRICT' and code like '3701%'";
		ResultSet rs = null;
		PreparedStatement ps = null;
		String code = "";
		StringBuffer sb = new StringBuffer();
		try {
			ps = dbc.prepareStatement(sql);
			ps.setString(1, REG_NO);
			ps.setString(2, YEAR);
			rs = ps.executeQuery();
			while (rs.next()) {

				if (rs.getString("REPORT_ORG_NO") != null) {
					code = rs.getString("REPORT_ORG_NO");
				}
				rs = dbc.executeQuery(sql2);
				while (rs.next()) {
					String tempCode = rs.getString("code");
					String tempContent = rs.getString("content");
					if (code.equals(tempCode)) {
						sb.append("<option value= ").append("'").append(tempCode)
								.append("'").append("selected = 'selected' ")
								.append(">").append(tempContent)
								.append("</option>").append("\n");
					} else {
						sb.append("<option value= ").append("'").append(tempCode)
								.append("'").append(">").append(tempContent)
								.append("</option>").append("\n");
					}
				}
				
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
				dbc.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return sb.toString();
	}
	
	/**
	 * 
	* @Title: queryReportOrgNo 
	* @Description: 查询报送机关
	* @param @return    设定文件 
	* @return String    返回类型 
	* @throws
	 */
	public void queryReportOrgNo(String regNo,String evalYear) {
		DbConnection dbc = new DbConnection();
		String sql = "SELECT YSB_ORG, (SELECT CONTENT FROM COM_DM WHERE CODE = T.YSB_ORG AND TYPE = 'CASEFIAUTH' )  AS REPORTORGNO FROM SZCP_YSB T WHERE T.REG_NO = ? ";
		ResultSet rs = null;
		PreparedStatement ps = null;
		try {
			ps = dbc.prepareStatement(sql);
			ps.setString(1, regNo.trim());
			rs = ps.executeQuery();
			if (rs.next()) {
				this.setReportOrgNo(rs.getString("YSB_ORG"));
				this.setReportName(rs.getString("REPORTORGNO"));
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
				dbc.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	
	
	/**
	 * print
	 * 根据REPORT_ORG_NO查询报送机关
	 */
	public String queryREPORT_ORG_NO_Print(String REG_NO, String YEAR) {
		DbConnection dbc = new DbConnection();
		String sql = "select REPORT_ORG_NO from SZCP_LCZT where REG_NO = ? and EVAL_YEAR = ?";
		String sql2 = "select * from com_dm where type = 'DISTRICT' and code like '3701%'";
		ResultSet rs = null;
		PreparedStatement ps = null;
		String code = "";
		StringBuffer sb = new StringBuffer();
		try {
			ps = dbc.prepareStatement(sql);
			ps.setString(1, REG_NO);
			ps.setString(2, YEAR);
			rs = ps.executeQuery();
			while (rs.next()) {

				if (rs.getString("REPORT_ORG_NO") != null) {
					code = rs.getString("REPORT_ORG_NO");
				}
				rs = dbc.executeQuery(sql2);
				while (rs.next()) {
					String tempCode = rs.getString("code");
					String tempContent = rs.getString("content");
					if (code.equals(tempCode)) {
						/*sb.append("<option value= ").append("'").append(tempCode)
								.append("'").append("selected = 'selected' ")
								.append(">")*/
						sb.append(tempContent);
								/*.append("</option>").append("\n");*/
					} /*else {
						sb.append("<option value= ").append("'").append(tempCode)
								.append("'").append(">").append(tempContent)
								.append("</option>").append("\n");*/
					}
				
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
				dbc.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return sb.toString();
	}

	/**
	 * 
	 * 把QYDJ_JBXX_ZS信息设置到 JBXX表
	 */
	private void doSetQYDJ_JBXX_ZSValueToJBXX(ResultSet rs) {
		try {
			ENT_TYPE = rs.getString("ENTTYPE") == null ? "" : rs
					.getString("ENTTYPE");
			ORG_CODE = rs.getString("ORGCODE") == null ? "" : rs
					.getString("ORGCODE");
			EST_DATE = String.valueOf(rs.getDate("ESTDATE") == null ? "" : rs
					.getDate("ESTDATE"));
			REG_CAP_RMB_W = Float
					.parseFloat(rs.getString("REGCAP") == null ? "0.0" : rs
							.getString("REGCAP"));
			OPER_TO_DATE = String.valueOf(rs.getDate("OPTO") == null ? "" : rs
					.getDate("OPTO"));
			TEL_NO = rs.getString("TEL") == null ? "" : rs.getString("TEL");
			GB_INDUSTRY_TYPE = rs.getString("INDUSTRYPHY") == null ? "" : rs
					.getString("INDUSTRYPHY");
			BUSI_SCOPE_DESC = rs.getString("BUSSCOPE") == null ? "" : rs
					.getString("BUSSCOPE");
			PRIPID = rs.getString("PRIPID") == null ? "" : rs
					.getString("PRIPID");
			REGORG = rs.getString("REGORG") == null ? "" : rs
					.getString("REGORG");
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	/**
	 * 把lczt的值赋给JBXX表
	 */
	private void doSetLCZTValueToJBXX(ResultSet rs) {
		try {
			EVAL_YEAR = rs.getString("EVAL_YEAR") == null ? "" : rs
					.getString("EVAL_YEAR");
			REG_NO = rs.getString("REG_NO") == null ? "" : rs
					.getString("REG_NO");
			ENT_NAME = rs.getString("ENT_NAME") == null ? "" : rs
					.getString("ENT_NAME");
			DOM_DISTRICT_CODE = rs.getString("DOM_DISTRICT_CODE") == null ? ""
					: rs.getString("DOM_DISTRICT_CODE");
			LOCAL_ORG_NO = rs.getString("LOCAL_ORG_NO") == null ? "" : rs
					.getString("LOCAL_ORG_NO");
			ADDR_DESC = rs.getString("ADDR_DESC") == null ? "" : rs
					.getString("ADDR_DESC");
			EST_DATE = String.valueOf(rs.getDate("EST_DATE") == null ? "" : rs
					.getDate("EST_DATE"));
			LEG_REP_NAME = rs.getString("LEG_REP_NAME") == null ? "" : rs
					.getString("LEG_REP_NAME");
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	/**
	 * 
	 * 赋值
	 */
	private void doSetJBXX(ResultSet rs) {
		try {
			RECORD_NO = rs.getString("RECORD_NO") == null ? "" : rs
					.getString("RECORD_NO");
			EVAL_YEAR = rs.getString("EVAL_YEAR") == null ? "" : rs
					.getString("EVAL_YEAR");
			REG_NO = rs.getString("REG_NO") == null ? "" : rs
					.getString("REG_NO");
			ENT_NAME = rs.getString("ENT_NAME") == null ? "" : rs
					.getString("ENT_NAME");
			WEBSITE_DESC = rs.getString("WEBSITE_DESC") == null ? "" : rs
					.getString("WEBSITE_DESC");
			ENT_TYPE = rs.getString("ENT_TYPE") == null ? "" : rs
					.getString("ENT_TYPE");
			DOM_DISTRICT_CODE = rs.getString("DOM_DISTRICT_CODE") == null ? ""
					: rs.getString("DOM_DISTRICT_CODE");
			LOCAL_ORG_NO = rs.getString("LOCAL_ORG_NO") == null ? "" : rs
					.getString("LOCAL_ORG_NO");
			ADDR_DESC = rs.getString("ADDR_DESC") == null ? "" : rs
					.getString("ADDR_DESC");
			REG_CAP_RMB_W = Float
					.parseFloat(rs.getString("REG_CAP_RMB_W") == null ? "0.0"
							: rs.getString("REG_CAP_RMB_W"));
			ORG_CODE = rs.getString("ORG_CODE") == null ? "" : rs
					.getString("ORG_CODE");
			EST_DATE = String.valueOf(rs.getDate("EST_DATE") == null ? "" : rs
					.getDate("EST_DATE"));
			OPER_TO_DATE = String
					.valueOf(rs.getDate("OPER_TO_DATE") == null ? "" : rs
							.getDate("OPER_TO_DATE"));
			LEG_REP_NAME = rs.getString("LEG_REP_NAME") == null ? "" : rs
					.getString("LEG_REP_NAME");
			LEG_REP_CERT_TYPE = rs.getString("LEG_REP_CERT_TYPE") == null ? ""
					: rs.getString("LEG_REP_CERT_TYPE");
			LEG_REP_CERT_NO = rs.getString("LEG_REP_CERT_NO") == null ? "" : rs
					.getString("LEG_REP_CERT_NO");
			TEL_NO = rs.getString("TEL_NO") == null ? "" : rs
					.getString("TEL_NO");
			ENT_SCALE_TYPE = rs.getString("ENT_SCALE_TYPE") == null ? "" : rs
					.getString("ENT_SCALE_TYPE");
			GB_INDUSTRY_TYPE = rs.getString("GB_INDUSTRY_TYPE") == null ? ""
					: rs.getString("GB_INDUSTRY_TYPE");
			LOCAL_INDUSTRY_TYPE = rs.getString("LOCAL_INDUSTRY_TYPE") == null ? ""
					: rs.getString("LOCAL_INDUSTRY_TYPE");
			BUSI_SCOPE_DESC = rs.getString("BUSI_SCOPE_DESC") == null ? "" : rs
					.getString("BUSI_SCOPE_DESC");
			TOTAL_STAFF_QTY = rs.getInt("TOTAL_STAFF_QTY");
			MNG_STAFF_QTY = rs.getInt("MNG_STAFF_QTY");
			TECH_STAFF_QTY = rs.getInt("TECH_STAFF_QTY");
			OTHER_STAFF_QTY = rs.getInt("OTHER_STAFF_QTY");
			LIAI_NAME = rs.getString("LIAI_NAME") == null ? "" : rs
					.getString("LIAI_NAME");
			LIAI_POS_CODE = rs.getString("LIAI_POS_CODE") == null ? "" : rs
					.getString("LIAI_POS_CODE");
			LIAI_FAX_NO = rs.getString("LIAI_FAX_NO") == null ? "" : rs
					.getString("LIAI_FAX_NO");
			LIAI_EMAIL = rs.getString("LIAI_EMAIL") == null ? "" : rs
					.getString("LIAI_EMAIL");
			LIAI_MOBILE_NO = rs.getString("LIAI_MOBILE_NO") == null ? "" : rs
					.getString("LIAI_MOBILE_NO");
			LIAI_TEL_NO = rs.getString("LIAI_TEL_NO") == null ? "" : rs
					.getString("LIAI_TEL_NO");
			REGORG = rs.getString("REGORG") == null ? "" : rs
					.getString("REGORG");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 
	 * 通过LOCAL_ORG_NO 号码查询对应的名称
	 * 
	 */
	public String queryLOCAL_ORG_NAME(String LOCAL_ORG_NO) {
		DbConnection dbc = new DbConnection();
		String sql = "select t.content from com_dm t where t.code = " + "'"
				+ doPreProcess(LOCAL_ORG_NO) + "'"
				+ " and t.type = 'CASEFIAUTH'";
		String name = "";
		ResultSet rs = null;
		try {
			rs = dbc.executeQuery(sql);
			if (rs.next()) {
				name = rs.getString("content");
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
				dbc.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return name;
	}

	/**
	 * 
	 * 查询主营业务所属行业code对应的name
	 * 
	 */
	public String queryINDUSTRY_TYPE_CODE_Name(String INDUSTRY_TYPE_CODE) {
		DbConnection dbc = new DbConnection();
		String sql = "select t.content from com_dm t where t.code = " + "'"
				+ doPreProcess(INDUSTRY_TYPE_CODE) + "'"
				+ " and t.type = 'INDUSTRYPHY'";
		String name = "";
		ResultSet rs = null;
		try {
			rs = dbc.executeQuery(sql);
			if (rs.next()) {
				name = rs.getString("content");
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
				dbc.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return name;
	}

	/**
	 * 根据ENT_SCALE_TYPE 编号查询对应的名称
	 */
	public String queryENT_SCALE_TYPE_Name(String ENT_SCALE_TYPE) {
		DbConnection dbc = new DbConnection();
		String sqlOne = "select t.code, t.content from com_dm t where t.code = "
				+ "'"
				+ doPreProcess(ENT_SCALE_TYPE)
				+ "'"
				+ " and t.type = 'SZCPGMDM'";
		String sqlTwo = "select t.code, t.content from com_dm t where  t.type = 'SZCPGMDM'";
		String code = "";
		String content = "";
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
		try {
			rs = dbc.executeQuery(sqlOne);
			if (rs.next()) {
				code = rs.getString("code");
				content = rs.getString("content");
			}
			rs = dbc.executeQuery(sqlTwo);
			while (rs.next()) {
				String tempCode = rs.getString("code");
				String tempContent = rs.getString("content");
				if (code.equals(tempCode) && content.equals(tempContent)) {
					sb.append("<input type='radio'  value= ").append("'")
							.append(tempCode).append("'")
							.append(" checked = 'checked'").append(">")
							// <input type="radio" name="group1" value="Butter"
							// checked> Butter<br>
							.append(tempContent).append("\n");
				} else {
					sb.append("<input type='radio'  value= ").append("'")
							.append(tempCode).append("'").append(">")
							.append(tempContent).append("\n");
				}
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
				dbc.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return sb.toString();

	}

	/**
	 * print 根据ENT_SCALE_TYPE 编号查询对应的名称
	 */
	public String queryENT_SCALE_TYPE_Name_Print(String ENT_SCALE_TYPE) {
		DbConnection dbc = new DbConnection();
		String sqlOne = "select t.code, t.content from com_dm t where t.code = "
				+ "'"
				+ doPreProcess(ENT_SCALE_TYPE)
				+ "'"
				+ " and t.type = 'SZCPGMDM'";
		String sqlTwo = "select t.code, t.content from com_dm t where  t.type = 'SZCPGMDM'";
		String code = "";
		String content = "";
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
		try {
			rs = dbc.executeQuery(sqlOne);
			if (rs.next()) {
				code = rs.getString("code");
				content = rs.getString("content");
			}
			rs = dbc.executeQuery(sqlTwo);
			while (rs.next()) {
				String tempCode = rs.getString("code");
				String tempContent = rs.getString("content");
				if (code.equals(tempCode) && content.equals(tempContent)) {
					sb.append("<input value= ").append("'").append(tempCode)
							.append("'").append("checked = 'checked' disabled ='disabled' ")
							.append(" type=").append("'checkbox'").append(">")
							.append(tempContent).append("</input>")
							.append("\n");
				} else {
					sb.append("<input value= ").append("'").append(tempCode)
							.append("'").append(" type=").append("'checkbox' disabled ='disabled'")
							.append(">").append(tempContent).append("</input>")
							.append("\n");
				}
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
				dbc.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return sb.toString();

	}
	
	/**
	 * expword
	 *  根据ENT_SCALE_TYPE 编号查询对应的名称
	 */
	public String queryENT_SCALE_TYPE_Name_Exp(String ENT_SCALE_TYPE) {
		DbConnection dbc = new DbConnection();
		String sqlOne = "select t.code, t.content from com_dm t where t.code = "
				+ "'"
				+ doPreProcess(ENT_SCALE_TYPE)
				+ "'"
				+ " and t.type = 'SZCPGMDM'";
		String sqlTwo = "select t.code, t.content from com_dm t where  t.type = 'SZCPGMDM'";
		String code = "";
		String content = "";
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
		try {
			rs = dbc.executeQuery(sqlOne);
			if (rs.next()) {
				code = rs.getString("code");
				content = rs.getString("content");
			}
			rs = dbc.executeQuery(sqlTwo);
			while (rs.next()) {
				String tempCode = rs.getString("code");
				String tempContent = rs.getString("content");
				if (code.equals(tempCode) && content.equals(tempContent)) {
					sb.append("√"+tempContent).append("\n");
				} else {
					sb.append("□"+tempContent).append("\n");
				}
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
				dbc.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return sb.toString();

	}

	/**
	 * 根据postCode 编号查询对应的名称
	 */
	public String queryPostCodeName(String postCode) {
		DbConnection dbc = new DbConnection();
		String sqlOne = "select t.code,t.content from com_dm t where t.code = "
				+ "'" + doPreProcess(postCode) + "'"
				+ " and t.type = 'POSITION'";
		String sqlTwo = " select t.code, t.content from com_dm t where  t.type = 'POSITION'";
		String code = "";
		String content = " ";
		StringBuffer sb = new StringBuffer();
		ResultSet rs = null;
		try {
			rs = dbc.executeQuery(sqlOne);
			if (rs.next()) {
				code = rs.getString("code");
				content = rs.getString("content");
			}
			rs = dbc.executeQuery(sqlTwo);
			while (rs.next()) {
				String tempCode = rs.getString("code");
				String tempContent = rs.getString("content");
				if (code.equals(tempCode) && content.equals(tempContent)) {
					sb.append("<option value= ").append("'").append(tempCode)
							.append("'").append("selected = 'selected' ")
							.append(">").append(tempContent)
							.append("</option>").append("\n");
				} else {
					sb.append("<option value= ").append("'").append(tempCode)
							.append("'").append(">").append(tempContent)
							.append("</option>").append("\n");
				}
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
				dbc.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return sb.toString();
	}

	/**
	 * print 根据postCode 编号查询对应的名称
	 */
	public String queryPostCodeName_Print(String postCode) {
		DbConnection dbc = new DbConnection();
		String sqlOne = "select t.code,t.content from com_dm t where t.code = "
				+ "'" + doPreProcess(postCode) + "'"
				+ " and t.type = 'POSITION'";
		String sqlTwo = " select t.code, t.content from com_dm t where  t.type = 'POSITION'";
		String code = "";
		String content = " ";
		StringBuffer sb = new StringBuffer();
		ResultSet rs = null;
		try {
			rs = dbc.executeQuery(sqlOne);
			if (rs.next()) {
				code = rs.getString("code");
				content = rs.getString("content");
			}
			rs = dbc.executeQuery(sqlTwo);
			while (rs.next()) {
				String tempCode = rs.getString("code");
				String tempContent = rs.getString("content");
				if (code.equals(tempCode) && content.equals(tempContent)) {
					/*
					 * sb.append("<input value= ").append("'").append(tempCode).
					 * append
					 * ("'").append("checked = 'checked' ").append(" type="
					 * ).append("'checkbox'") .append(">")
					 */
					sb.append(tempContent);/* .append("</input>").append("\n"); */
				}/*
				 * else {
				 * sb.append("<input value= ").append("'").append(tempCode
				 * ).append("'").append(" type=").append("'checkbox'")
				 * .append(">")
				 * .append(tempContent).append("</input>").append("\n"); }
				 */
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
				dbc.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return sb.toString();
	}

	/**
	 * 
	 * 查询所有的职位代码
	 */
	public String queryALLPOSTCODENAME() {
		DbConnection dbc = new DbConnection();
		String sql = "select t.code, t.content from com_dm t where  t.type = 'POSITION'";
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
		try {
			rs = dbc.executeQuery(sql);
			while (rs.next()) {
				sb.append("<option value= ").append("'")
						.append(rs.getString("CODE")).append("'").append(">")
						.append(rs.getString("CONTENT").trim())
						.append("</option>").append("\n");
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
				dbc.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return sb.toString();
	}

	/**
	 * 执行下一步操作
	 */
	public boolean executeNextStep(SZCP_SQ_JBXX szcp) {
		// 判断是否存在历史数据
		boolean flag = queryHistoryData(szcp);
		// 查询流程
		if (flag) {
			// 执行更新操作
			flag = this.editData(szcp);
		} else {
			// 执行插入操作
			flag = this.saveData(szcp);
		}
		return flag;
	}

	/**
	 * 
	 * 执行更新操作
	 */
	private boolean editData(SZCP_SQ_JBXX szcp) {
		DbConnection dbc = new DbConnection();
		boolean flag = false;
		try {
			dbc.startTransaction();
			StringBuffer sb = new StringBuffer();
			sb.append(" update szcp_sq_jbxx set EVAL_YEAR = ").append("'")
					.append(szcp.getEVAL_YEAR()).append("',")
					.append(" WEBSITE_DESC = ").append("'")
					.append(szcp.getWEBSITE_DESC()).append("',")
					.append("ENT_TYPE = ").append("'")
					.append(szcp.getENT_TYPE()).append("',")
					.append("DOM_DISTRICT_CODE = ").append("'")
					.append(szcp.getDOM_DISTRICT_CODE()).append("',")
					.append("LOCAL_ORG_NO = ").append("'")
					.append(szcp.getLOCAL_ORG_NO()).append("',")
					.append("ADDR_DESC = ").append("'")
					.append(szcp.getADDR_DESC()).append("',")
					.append(" REG_CAP_RMB_W = ")
					.append(szcp.getREG_CAP_RMB_W()).append(", ORG_CODE = ")
					.append("'").append(szcp.getORG_CODE()).append("',")
					.append(" EST_DATE = ").append("to_date(").append("'")
					.append(szcp.getEST_DATE()).append("'")
					.append(",'yyyy/MM/dd'),").append(" OPER_TO_DATE = ")
					.append("to_date(").append("'")
					.append(szcp.getOPER_TO_DATE()).append("'")
					.append(",'yyyy/MM/dd'),").append(" LEG_REP_NAME = ")
					.append("'").append(szcp.getLEG_REP_NAME()).append("',")
					.append(" LEG_REP_CERT_TYPE = ").append("'")
					.append(szcp.getLEG_REP_CERT_TYPE()).append("',")
					.append(" LEG_REP_CERT_NO = ").append("'")
					.append(szcp.getLEG_REP_CERT_NO()).append("',")
					.append(" TEL_NO = ").append("'").append(szcp.getTEL_NO())
					.append("',").append(" ENT_SCALE_TYPE = ").append("'")
					.append(szcp.getENT_SCALE_TYPE()).append("',")
					.append(" GB_INDUSTRY_TYPE = ").append("'")
					.append(szcp.getGB_INDUSTRY_TYPE()).append("',")
					.append(" LOCAL_INDUSTRY_TYPE = ").append("'")
					.append(szcp.getLOCAL_INDUSTRY_TYPE()).append("',")
					.append(" BUSI_SCOPE_DESC = ").append("'")
					.append(szcp.getBUSI_SCOPE_DESC()).append("',")
					.append(" TOTAL_STAFF_QTY = ")
					.append(szcp.getTOTAL_STAFF_QTY()).append(",")
					.append(" MNG_STAFF_QTY = ")
					.append(szcp.getMNG_STAFF_QTY()).append(",")
					.append(" TECH_STAFF_QTY = ")
					.append(szcp.getTECH_STAFF_QTY()).append(",")
					.append(" OTHER_STAFF_QTY = ")
					.append(szcp.getOTHER_STAFF_QTY()).append(",")
					.append(" LIAI_NAME = ").append("'")
					.append(szcp.getLIAI_NAME()).append("',")
					.append(" LIAI_POS_CODE = ").append("'")
					.append(szcp.getLIAI_POS_CODE()).append("',")
					.append(" LIAI_FAX_NO = ").append("'")
					.append(szcp.getLIAI_FAX_NO()).append("',")
					.append(" LIAI_EMAIL = ").append("'")
					.append(szcp.getLIAI_EMAIL()).append("',")
					.append(" LIAI_MOBILE_NO = ").append("'")
					.append(szcp.getLIAI_MOBILE_NO()).append("',")
					.append(" LIAI_TEL_NO = ").append("'")
					.append(szcp.getLIAI_TEL_NO()).append("',")
					.append(" REGORG = ").append("'")
					.append(szcp.getREGORG()).append("'")
					.append(" where REG_NO = ").append("'")
					.append(szcp.getREG_NO()).append("' and ENT_NAME = ")
					.append("'").append(szcp.getENT_NAME()).append("'")
					.append(" and EVAL_YEAR = ").append("'")
					.append(szcp.getEVAL_YEAR()).append("'");

			String lczpSql = " update SZCP_LCZT  set LOCAL_INDUSTRY_TYPE =  "
					+ "'"
					+ szcp.getLOCAL_INDUSTRY_TYPE()
					+ "',"
					+ "ENT_SACLE_TYPE = "
					+ "'"
					+ szcp.getENT_SCALE_TYPE()
					+ "'"
					+ ", ORG_CODE = "
					+ "'"
					+ szcp.getORG_CODE()
					+ "',"
					+ "LIAI_NAME = "
					+ "'"
					+ szcp.getLIAI_NAME()
					+ "'"
					+ ", LIAI_POSE_CODE= "
					+ "'"
					+ szcp.getLIAI_POS_CODE()
					+ "',"
					+ " LIAI_TEL = "
					+ "'" 
					+ szcp.getLIAI_TEL_NO()
					+ "',"
					+ "LIAI_MOBILE = "
					+ "'"
					+ szcp.getLIAI_MOBILE_NO()
					+ "',"
					+ "LIAI_EMAIL= "
					+ "'"
					+ szcp.getLIAI_EMAIL()
					+ "',"
					+ " WEBSITE_DESC = "
					+ "'"
					+ szcp.getWEBSITE_DESC()
					+ "',"
					+ " REPORT_ORG_NO = "
					+ "'"
					+ szcp.getReportOrgNo()
					+ "',"
					+" LEG_REP_NAME = "
					+"'"+szcp.getLEG_REP_NAME()+"'"
					+ " where REG_NO = "
					+ "'"
					+ szcp.getREG_NO()
					+ "'"
					+ "  and ENT_NAME = "
					+ "'"
					+ szcp.getENT_NAME()
					+ "'"
					+ " and EVAL_YEAR = " + "'" + szcp.getEVAL_YEAR() + "'";

			dbc.addSQL(sb.toString());
			dbc.addSQL(lczpSql);
			flag = dbc.endTransaction();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				dbc.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return flag;
	}

	/**
	 * 查询有无历史数据
	 * 
	 * @param szcp
	 */
	public boolean queryHistoryData(SZCP_SQ_JBXX szcp) {
		DbConnection dbConnection = new DbConnection();
		ResultSet set = null;
		boolean flag = false;
		String sql = "select count(*) as historycount from szcp_sq_jbxx where REG_NO = "
				+ "'"
				+ doPreProcess(szcp.getREG_NO())
				+ "'"
				+ " and  ENT_NAME = "
				+ "'"
				+ doPreProcess(szcp.getENT_NAME())
				+ "'"
				+ " and to_number(EVAL_YEAR) = "
				+ Integer.parseInt(szcp.getEVAL_YEAR());
		try {
			set = dbConnection.executeQuery(sql);
			if (set.next()) {
				String str = set.getString("historycount");
				if (Integer.parseInt(str) > 0) {
					flag = true;
				} else {
					flag = false;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
	 * 查询有无历史数据
	 * 
	 * @param szcp
	 */
	public boolean queryHistoryDataTab(SZCP_SQ_JBXX szcp) {
		DbConnection dbConnection = new DbConnection();
		ResultSet set = null;
		boolean flag = false;
		String sql = "select count(*) as historycount from szcp_sq_jbxx where REG_NO = "
				+ "'"
				+ doPreProcess(szcp.getREG_NO())
				+ "'"
				+ " and to_number(EVAL_YEAR) = "
				+ Integer.parseInt(szcp.getEVAL_YEAR());
		try {
			set = dbConnection.executeQuery(sql);
			if (set.next()) {
				String str = set.getString("historycount");
				if (Integer.parseInt(str) > 0) {
					flag = true;
				} else {
					flag = false;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
	 * 保存数据
	 * 
	 * @param szcp_SQ_JBXX
	 * @return
	 */
	public boolean saveData(SZCP_SQ_JBXX szcp) {
		RecordNoUtil util = new RecordNoUtil();
		DbConnection dbc = new DbConnection();
		boolean flag = false;
		try {
			dbc.startTransaction();
			String sql = "insert into szcp_sq_jbxx(RECORD_NO,EVAL_YEAR,REG_NO,ENT_NAME,WEBSITE_DESC,ENT_TYPE,DOM_DISTRICT_CODE,"
					+ "LOCAL_ORG_NO,ADDR_DESC,REG_CAP_RMB_W,ORG_CODE,EST_DATE,OPER_TO_DATE,LEG_REP_NAME,LEG_REP_CERT_TYPE,"
					+ "LEG_REP_CERT_NO,TEL_NO,ENT_SCALE_TYPE,GB_INDUSTRY_TYPE,LOCAL_INDUSTRY_TYPE,BUSI_SCOPE_DESC,TOTAL_STAFF_QTY,"
					+ "MNG_STAFF_QTY,TECH_STAFF_QTY,OTHER_STAFF_QTY,LIAI_NAME,LIAI_POS_CODE,LIAI_FAX_NO,LIAI_EMAIL,LIAI_MOBILE_NO,"
					+ "LIAI_TEL_NO,REGORG) " + "values(" + "'"
					+ util.createRecordNo("szcp_sq_jbxx", szcp.getEVAL_YEAR(),
							szcp.getLOCAL_ORG_NO())
					+ "',"
					+ "'"
					+ szcp.getEVAL_YEAR()
					+ "',"
					+ "'"
					+ szcp.getREG_NO()
					+ "',"
					+ "'"
					+ szcp.getENT_NAME()
					+ "',"
					+ "'"
					+ szcp.getWEBSITE_DESC()
					+ "',"
					+ "'"
					+ szcp.getENT_TYPE()
					+ "',"
					+ "'"
					+ szcp.getDOM_DISTRICT_CODE()
					+ "',"
					+ "'"
					+ szcp.getLOCAL_ORG_NO()
					+ "',"
					+ "'"
					+ szcp.getADDR_DESC()
					+ "',"
					+ szcp.getREG_CAP_RMB_W()
					+ ",'"
					+ szcp.getORG_CODE()
					+ "',"
					+ "to_date("
					+ "'"
					+ szcp.getEST_DATE()
					+ "'"
					+ ",'yyyy/MM/dd'),"
					+ "to_date("
					+ "'"
					+ szcp.getOPER_TO_DATE()
					+ "'"
					+ ",'yyyy/MM/dd'),"
					+ "'"
					+ szcp.getLEG_REP_NAME()
					+ "',"
					+ "'"
					+ szcp.getLEG_REP_CERT_TYPE()
					+ "',"
					+ "'"
					+ szcp.getLEG_REP_CERT_NO()
					+ "',"
					+ "'"
					+ szcp.getTEL_NO()
					+ "',"
					+ "'"
					+ szcp.getENT_SCALE_TYPE()
					+ "',"
					+ "'"
					+ szcp.getGB_INDUSTRY_TYPE()
					+ "',"
					+ "'"
					+ szcp.getLOCAL_INDUSTRY_TYPE()
					+ "',"
					+ "'"
					+ szcp.getBUSI_SCOPE_DESC()
					+ "',"
					+ szcp.getTOTAL_STAFF_QTY()
					+ ","
					+ szcp.getMNG_STAFF_QTY()
					+ ","
					+ szcp.getTECH_STAFF_QTY()
					+ ","
					+ szcp.getOTHER_STAFF_QTY()
					+ ","
					+ "'"
					+ szcp.getLIAI_NAME()
					+ "',"
					+ "'"
					+ szcp.getLIAI_POS_CODE()
					+ "',"
					+ "'"
					+ szcp.getLIAI_FAX_NO()
					+ "',"
					+ "'"
					+ szcp.getLIAI_EMAIL()
					+ "',"
					+ "'"
					+ szcp.getLIAI_MOBILE_NO()
					+ "',"
					+ "'"
					+ szcp.getLIAI_TEL_NO()
					+ "',"
					+ "'"
					+ szcp.getREGORG()
					+ "'"
					+ ")";

			String lczpSql = " update SZCP_LCZT  set LOCAL_INDUSTRY_TYPE =  "
					+ "'"
					+ szcp.getLOCAL_INDUSTRY_TYPE()
					+ "',"
					+ "ENT_SACLE_TYPE = "
					+ "'"
					+ szcp.getENT_SCALE_TYPE()
					+ "'"
					+ ", ORG_CODE = "
					+ "'"
					+ szcp.getORG_CODE()
					+ "',"
					+ "LIAI_NAME = "
					+ "'"
					+ szcp.getLIAI_NAME()
					+ "'"
					+ ", LIAI_POSE_CODE= "
					+ "'"
					+ szcp.getLIAI_POS_CODE()
					+ "',"
					+ " LIAI_TEL = "
					+ "'"
					+ szcp.getLIAI_TEL_NO()
					+ "',"
					+ "LIAI_MOBILE = "
					+ "'"
					+ szcp.getLIAI_MOBILE_NO()
					+ "',"
					+ "LIAI_EMAIL= "
					+ "'"
					+ szcp.getLIAI_EMAIL()
					+ "',"
					+ " WEBSITE_DESC = "
					+ "'"
					+ szcp.getWEBSITE_DESC()
					+ "',"
					+ " REPORT_ORG_NO = "
					+ "'"
					+ szcp.getReportOrgNo()
					+ "',"
					+" LEG_REP_NAME = "
					+"'"+szcp.getLEG_REP_NAME()+"'"
					+ " where REG_NO = "
					+ "'"
					+ szcp.getREG_NO()
					+ "'"
					+ "  and ENT_NAME = "
					+ "'"
					+ szcp.getENT_NAME()
					+ "'"
					+ " and EVAL_YEAR = " + "'" + szcp.getEVAL_YEAR() + "'";

			dbc.addSQL(sql);
			dbc.addSQL(lczpSql);
			flag = dbc.endTransaction();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				dbc.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return flag;
	}

	/**
	 * 
	 * 根据LOCAL_INDUSTRY_TYPE查询对应的姓名 查询首重行业对应的名称
	 */
	public String queryLOCAL_INDUSTRY_TYPE_NAME(String LOCAL_INDUSTRY_TYPE) {
		DbConnection dbc = new DbConnection();
		String sqlOne = "select t.code, t.content from com_dm t where t.code = "
				+ "'"
				+ doPreProcess(LOCAL_INDUSTRY_TYPE)
				+ "'"
				+ " and t.type = 'SZCPHYDM'";
		String sqlTwo = "select t.code, t.content from com_dm t where  t.type = 'SZCPHYDM'";
		String code = "";
		String content = "";
		StringBuffer sb = new StringBuffer();
		ResultSet rs = null;
		try {
			rs = dbc.executeQuery(sqlOne);
			if (rs.next()) {
				code = rs.getString("code");
				content = rs.getString("content");
			}
			rs = dbc.executeQuery(sqlTwo);
			while (rs.next()) {
				String tempCode = rs.getString("code");
				String tempContent = rs.getString("content");
				if (code.equals(tempCode) && content.equals(tempContent)) {
					sb.append("<option value= ").append("'").append(tempCode)
							.append("'").append("selected = 'selected' ")
							.append(">").append(tempContent)
							.append("</option>").append("\n");
				} else {
					sb.append("<option value= ").append("'").append(tempCode)
							.append("'").append(">").append(tempContent)
							.append("</option>").append("\n");
				}
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
				dbc.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return sb.toString();
	}

	/**
	 * print 根据LOCAL_INDUSTRY_TYPE查询对应的姓名 查询首重行业对应的名称
	 */
	public String queryLOCAL_INDUSTRY_TYPE_NAME_Print(String LOCAL_INDUSTRY_TYPE) {
		DbConnection dbc = new DbConnection();
		String sqlOne = "select t.code, t.content from com_dm t where t.code = "
				+ "'"
				+ doPreProcess(LOCAL_INDUSTRY_TYPE)
				+ "'"
				+ " and t.type = 'SZCPHYDM'";
		String sqlTwo = "select t.code, t.content from com_dm t where  t.type = 'SZCPHYDM'";
		String code = "";
		String content = "";
		StringBuffer sb = new StringBuffer();
		ResultSet rs = null;
		try {
			rs = dbc.executeQuery(sqlOne);
			if (rs.next()) {
				code = rs.getString("code");
				content = rs.getString("content");
			}
			rs = dbc.executeQuery(sqlTwo);
			while (rs.next()) {
				String tempCode = rs.getString("code");
				String tempContent = rs.getString("content");
				if (code.equals(tempCode) && content.equals(tempContent)) {
					/*
					 * sb.append("<input type='checkbox' value= ").append("'").
					 * append
					 * (tempCode).append("'").append("checked = 'checked' ")
					 * .append(">")
					 */
					sb.append(tempContent);/* .append("</input>").append("\n"); */
				}/*
				 * else {
				 * sb.append("<input type='checkbox' value= ").append("'")
				 * .append(tempCode).append("'") .append(">")
				 * .append(tempContent).append("</input>").append("\n"); }
				 */
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
				dbc.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return sb.toString();
	}

	/**
	 * 
	 * 查询所有首重行业的名称
	 */
	public String queryALLLOCAL_INDUSTRY_TYPE_NAME() {
		DbConnection dbc = new DbConnection();
		String sql = "select t.code, t.content from com_dm t where  t.type = 'SZCPHYDM'";
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
		try {
			rs = dbc.executeQuery(sql);
			while (rs.next()) {
				sb.append("<option value= ").append("'")
						.append(rs.getString("CODE")).append("'").append(">")
						.append(rs.getString("CONTENT").trim())
						.append("</option>").append("\n");
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
				dbc.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return sb.toString();
	}

	/**
	 * print 查询所有首重行业的名称
	 */
	public String queryALLLOCAL_INDUSTRY_TYPE_NAME_Print() {
		DbConnection dbc = new DbConnection();
		String sql = "select t.code, t.content from com_dm t where  t.type = 'SZCPHYDM'";
		ResultSet rs = null;
		StringBuffer sb = new StringBuffer();
		try {
			rs = dbc.executeQuery(sql);
			while (rs.next()) {
				sb.append("<input type='checkbox' value= ").append("'")
						.append(rs.getString("CODE")).append("'").append(">")
						.append(rs.getString("CONTENT").trim())
						.append("</input>").append("\n");
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
				dbc.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return sb.toString();
	}

	public String getRECORD_NO() {
		return RECORD_NO;
	}

	public void setRECORD_NO(String rECORD_NO) {
		RECORD_NO = rECORD_NO;
	}

	public String getEVAL_YEAR() {
		return EVAL_YEAR;
	}

	public void setEVAL_YEAR(String eVAL_YEAR) {
		EVAL_YEAR = eVAL_YEAR;
	}

	public String getREG_NO() {
		return REG_NO;
	}

	public void setREG_NO(String rEG_NO) {
		REG_NO = rEG_NO;
	}

	public String getENT_NAME() {
		return ENT_NAME;
	}

	public void setENT_NAME(String eNT_NAME) {
		ENT_NAME = eNT_NAME;
	}

	public String getWEBSITE_DESC() {
		return WEBSITE_DESC;
	}

	public void setWEBSITE_DESC(String wEBSITE_DESC) {
		WEBSITE_DESC = wEBSITE_DESC;
	}

	public String getENT_TYPE() {
		return ENT_TYPE;
	}

	public void setENT_TYPE(String eNT_TYPE) {
		ENT_TYPE = eNT_TYPE;
	}

	public String getDOM_DISTRICT_CODE() {
		return DOM_DISTRICT_CODE;
	}

	public void setDOM_DISTRICT_CODE(String dOM_DISTRICT_CODE) {
		DOM_DISTRICT_CODE = dOM_DISTRICT_CODE;
	}

	public String getLOCAL_ORG_NO() {
		return LOCAL_ORG_NO;
	}

	public void setLOCAL_ORG_NO(String lOCAL_ORG_NO) {
		LOCAL_ORG_NO = lOCAL_ORG_NO;
	}

	public String getADDR_DESC() {
		return ADDR_DESC;
	}

	public void setADDR_DESC(String aDDR_DESC) {
		ADDR_DESC = aDDR_DESC;
	}

	public double getREG_CAP_RMB_W() {
		return REG_CAP_RMB_W;
	}

	public void setREG_CAP_RMB_W(float rEG_CAP_RMB_W) {
		REG_CAP_RMB_W = rEG_CAP_RMB_W;
	}

	public String getORG_CODE() {
		return ORG_CODE;
	}

	public void setORG_CODE(String oRG_CODE) {
		ORG_CODE = oRG_CODE;
	}

	public String getEST_DATE() {
		return EST_DATE;
	}

	public void setEST_DATE(String eST_DATE) {
		EST_DATE = eST_DATE;
	}

	public String getOPER_TO_DATE() {
		return OPER_TO_DATE;
	}

	public void setOPER_TO_DATE(String oPER_TO_DATE) {
		OPER_TO_DATE = oPER_TO_DATE;
	}

	public String getLEG_REP_NAME() {
		return LEG_REP_NAME;
	}

	public void setLEG_REP_NAME(String lEG_REP_NAME) {
		LEG_REP_NAME = lEG_REP_NAME;
	}

	public String getLEG_REP_CERT_TYPE() {
		return LEG_REP_CERT_TYPE;
	}

	public void setLEG_REP_CERT_TYPE(String lEG_REP_CERT_TYPE) {
		LEG_REP_CERT_TYPE = lEG_REP_CERT_TYPE;
	}

	public String getLEG_REP_CERT_NO() {
		return LEG_REP_CERT_NO;
	}

	public void setLEG_REP_CERT_NO(String lEG_REP_CERT_NO) {
		LEG_REP_CERT_NO = lEG_REP_CERT_NO;
	}

	public String getTEL_NO() {
		return TEL_NO;
	}

	public void setTEL_NO(String tEL_NO) {
		TEL_NO = tEL_NO;
	}

	public String getENT_SCALE_TYPE() {
		return ENT_SCALE_TYPE;
	}

	public void setENT_SCALE_TYPE(String eNT_SCALE_TYPE) {
		ENT_SCALE_TYPE = eNT_SCALE_TYPE;
	}

	public String getGB_INDUSTRY_TYPE() {
		return GB_INDUSTRY_TYPE;
	}

	public void setGB_INDUSTRY_TYPE(String gB_INDUSTRY_TYPE) {
		GB_INDUSTRY_TYPE = gB_INDUSTRY_TYPE;
	}

	public String getLOCAL_INDUSTRY_TYPE() {
		return LOCAL_INDUSTRY_TYPE;
	}

	public void setLOCAL_INDUSTRY_TYPE(String lOCAL_INDUSTRY_TYPE) {
		LOCAL_INDUSTRY_TYPE = lOCAL_INDUSTRY_TYPE;
	}

	public String getBUSI_SCOPE_DESC() {
		return BUSI_SCOPE_DESC;
	}

	public void setBUSI_SCOPE_DESC(String bUSI_SCOPE_DESC) {
		BUSI_SCOPE_DESC = bUSI_SCOPE_DESC;
	}

	public int getTOTAL_STAFF_QTY() {
		return TOTAL_STAFF_QTY;
	}

	public void setTOTAL_STAFF_QTY(int tOTAL_STAFF_QTY) {
		TOTAL_STAFF_QTY = tOTAL_STAFF_QTY;
	}

	public int getMNG_STAFF_QTY() {
		return MNG_STAFF_QTY;
	}

	public void setMNG_STAFF_QTY(int mNG_STAFF_QTY) {
		MNG_STAFF_QTY = mNG_STAFF_QTY;
	}

	public int getTECH_STAFF_QTY() {
		return TECH_STAFF_QTY;
	}

	public void setTECH_STAFF_QTY(int tECH_STAFF_QTY) {
		TECH_STAFF_QTY = tECH_STAFF_QTY;
	}

	public int getOTHER_STAFF_QTY() {
		return OTHER_STAFF_QTY;
	}

	public void setOTHER_STAFF_QTY(int oTHER_STAFF_QTY) {
		OTHER_STAFF_QTY = oTHER_STAFF_QTY;
	}

	public String getLIAI_NAME() {
		return LIAI_NAME;
	}

	public void setLIAI_NAME(String lIAI_NAME) {
		LIAI_NAME = lIAI_NAME;
	}

	public String getLIAI_POS_CODE() {
		return LIAI_POS_CODE;
	}

	public void setLIAI_POS_CODE(String lIAI_POS_CODE) {
		LIAI_POS_CODE = lIAI_POS_CODE;
	}

	public String getLIAI_FAX_NO() {
		return LIAI_FAX_NO;
	}

	public void setLIAI_FAX_NO(String lIAI_FAX_NO) {
		LIAI_FAX_NO = lIAI_FAX_NO;
	}

	public String getLIAI_EMAIL() {
		return LIAI_EMAIL;
	}

	public void setLIAI_EMAIL(String lIAI_EMAIL) {
		LIAI_EMAIL = lIAI_EMAIL;
	}

	public String getLIAI_MOBILE_NO() {
		return LIAI_MOBILE_NO;
	}

	public void setLIAI_MOBILE_NO(String lIAI_MOBILE_NO) {
		LIAI_MOBILE_NO = lIAI_MOBILE_NO;
	}

	public String getLIAI_TEL_NO() {
		return LIAI_TEL_NO;
	}

	public void setLIAI_TEL_NO(String lIAI_TEL_NO) {
		LIAI_TEL_NO = lIAI_TEL_NO;
	}

	public String getREPORT_ORG_NO() {
		return REPORT_ORG_NO;
	}

	public void setREPORT_ORG_NO(String rEPORT_ORG_NO) {
		REPORT_ORG_NO = rEPORT_ORG_NO;
	}

	public String getREGORG() {
		return REGORG;
	}

	public void setREGORG(String regorg) {
		REGORG = regorg;
	}

}
