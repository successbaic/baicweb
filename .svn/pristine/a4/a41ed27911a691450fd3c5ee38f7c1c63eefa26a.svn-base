package com.macrosoft.icms.szcp;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.macrosoft.icms.dbc.DbConnection;
import com.macrosoft.icms.gsdbc.GsDbConnection;
import com.macrosoft.icms.gsnw.QYDJ_RYXX_ZS;

public class SZCP_LCZT {
	String RECORD_NO;
	String EVAL_YEAR;
	String DOM_DISTRICT_CODE;
	String LOCAL_ORG_NO;
	String REG_NO;
	String UNISCID;
	String ENT_NAME;
	String LOCAL_INDUSTRY_TYPE;
	String ENT_SACLE_TYPE;
	String LEG_REP_NAME;
	String EST_DATE;
	String ORG_CODE;
	String ADDR_DESC;
	String LIAI_NAME;
	String LIAI_POSE_CODE;
	String LIAI_TEL;
	String LIAI_MOBILE;
	String LIAI_EMAIL;
	String WEBSITE_DESC;
	String APPR_STAT_FLAG;
	
	String REPORT_ORG_NO;

	String PRO_STAT_FLAG;
	String APPLY_DATE;
	String FST_APPLY_YEAR;
	int ACC_PUBLIC_QTY;
	String LOGIN_ID;
	
	private String localOrgName;
	

	public String getLocalOrgName() {
		return localOrgName;
	}

	public void setLocalOrgName(String localOrgName) {
		this.localOrgName = localOrgName;
	}

	public String getRECORD_NO() {
		return RECORD_NO;
	}

	public void setRECORD_NO(String record_no) {
		RECORD_NO = record_no;
	}

	public String getEVAL_YEAR() {
		return EVAL_YEAR;
	}

	public void setEVAL_YEAR(String eval_year) {
		EVAL_YEAR = eval_year;
	}

	public String getDOM_DISTRICT_CODE() {
		return DOM_DISTRICT_CODE;
	}

	public void setDOM_DISTRICT_CODE(String dom_district_code) {
		DOM_DISTRICT_CODE = dom_district_code;
	}

	public String getLOCAL_ORG_NO() {
		return LOCAL_ORG_NO;
	}

	public void setLOCAL_ORG_NO(String local_org_no) {
		LOCAL_ORG_NO = local_org_no;
	}

	public String getREG_NO() {
		return doPreProcess(REG_NO);
	}

	public void setREG_NO(String REG_NO) {
		this.REG_NO = doPreProcess2(convertCode(REG_NO));
	}

	public String getUNISCID() {
		return doPreProcess(UNISCID);
	}

	public void setUNISCID(String UNISCID) {
		this.UNISCID = doPreProcess2(convertCode(UNISCID));
	}
	
	public String getENT_NAME() {
		return ENT_NAME;
	}

	public void setENT_NAME(String ent_name) {
		ENT_NAME = ent_name;
	}

	public String getLOCAL_INDUSTRY_TYPE() {
		return LOCAL_INDUSTRY_TYPE;
	}

	public void setLOCAL_INDUSTRY_TYPE(String local_industry_type) {
		LOCAL_INDUSTRY_TYPE = local_industry_type;
	}

	public String getENT_SACLE_TYPE() {
		return ENT_SACLE_TYPE;
	}

	public void setENT_SACLE_TYPE(String ent_sacle_type) {
		ENT_SACLE_TYPE = ent_sacle_type;
	}

	public String getLEG_REP_NAME() {
		return LEG_REP_NAME;
	}

	public void setLEG_REP_NAME(String leg_rep_name) {
		LEG_REP_NAME = leg_rep_name;
	}

	public String getEST_DATE() {
		return EST_DATE;
	}

	public void setEST_DATE(String est_date) {
		EST_DATE = est_date;
	}

	public String getORG_CODE() {
		return ORG_CODE;
	}

	public void setORG_CODE(String org_code) {
		ORG_CODE = org_code;
	}

	public String getADDR_DESC() {
		return ADDR_DESC;
	}

	public void setADDR_DESC(String addr_desc) {
		ADDR_DESC = addr_desc;
	}

	public String getLIAI_NAME() {
		return LIAI_NAME;
	}

	public void setLIAI_NAME(String liai_name) {
		LIAI_NAME = liai_name;
	}

	public String getLIAI_POSE_CODE() {
		return LIAI_POSE_CODE;
	}

	public void setLIAI_POSE_CODE(String liai_pose_code) {
		LIAI_POSE_CODE = liai_pose_code;
	}

	public String getLIAI_TEL() {
		return LIAI_TEL;
	}

	public void setLIAI_TEL(String liai_tel) {
		LIAI_TEL = liai_tel;
	}

	public String getLIAI_MOBILE() {
		return LIAI_MOBILE;
	}

	public void setLIAI_MOBILE(String liai_mobile) {
		LIAI_MOBILE = liai_mobile;
	}

	public String getLIAI_EMAIL() {
		return LIAI_EMAIL;
	}

	public void setLIAI_EMAIL(String liai_email) {
		LIAI_EMAIL = liai_email;
	}

	public String getWEBSITE_DESC() {
		return WEBSITE_DESC;
	}

	public void setWEBSITE_DESC(String website_desc) {
		WEBSITE_DESC = website_desc;
	}

	public String getAPPR_STAT_FLAG() {
		return APPR_STAT_FLAG;
	}

	public void setAPPR_STAT_FLAG(String appr_stat_flag) {
		APPR_STAT_FLAG = appr_stat_flag;
	}

	public String getPRO_STAT_FLAG() {
		return PRO_STAT_FLAG;
	}

	public void setPRO_STAT_FLAG(String pro_stat_flag) {
		PRO_STAT_FLAG = pro_stat_flag;
	}

	public String getAPPLY_DATE() {
		return APPLY_DATE;
	}

	public void setAPPLY_DATE(String apply_date) {
		APPLY_DATE = apply_date;
	}

	public String getFST_APPLY_YEAR() {
		return FST_APPLY_YEAR;
	}

	public void setFST_APPLY_YEAR(String fst_apply_year) {
		FST_APPLY_YEAR = fst_apply_year;
	}

	public int getACC_PUBLIC_QTY() {
		return ACC_PUBLIC_QTY;
	}

	public void setACC_PUBLIC_QTY(int acc_public_qty) {
		ACC_PUBLIC_QTY = acc_public_qty;
	}

	public String getLOGIN_ID() {
		return LOGIN_ID;
	}

	public void setLOGIN_ID(String login_id) {
		LOGIN_ID = login_id;
	}

	public String convertCode(String strvalue) {
		return com.macrosoft.icms.system.SysUtility.convertCode(strvalue);
	}

	public String doPreProcess(String sValue) {
		return com.macrosoft.icms.system.SysUtility.doPreProcess(sValue);
	}

	public String doPreProcess2(String sValue) {
		return com.macrosoft.icms.system.SysUtility.doPreProcess2(sValue);
	}

	public String doPreProcess3(String sValue) {
		return com.macrosoft.icms.system.SysUtility.doPreProcess3(sValue);
	}

	public void doSelectBySql(String sqlSelect) throws SQLException {
		DbConnection dbc = new DbConnection();
		ResultSet rsSelect;
		rsSelect = dbc.executeQuery(sqlSelect);
		if (rsSelect.next()) {
			doSetData(rsSelect);
		}
		dbc.close();
	}

	public boolean updateSzcpLczt(SZCP_LCZT lczt) {
		Calendar calendar = Calendar.getInstance();
		int year = calendar.get(Calendar.YEAR);
		boolean flag = false;
		//
		String sql = "update szcp_lczt set APPR_STAT_FLAG = ?,PRO_STAT_FLAG = ?,FST_APPLY_YEAR = ?, APPLY_DATE = ?  where REG_NO = ?  and EVAL_YEAR = ?";
		DbConnection connection = new DbConnection();
		PreparedStatement prsmt = null;
		try {
			prsmt = connection.prepareStatement(sql);
			prsmt.setString(1, "4");//
			prsmt.setString(2, "2");//
			prsmt.setString(3, String.valueOf(year));
			Date date = new Date();
			Timestamp timestamp = new Timestamp(date.getTime());
			prsmt.setTimestamp(4, timestamp);
			prsmt.setString(5, lczt.getREG_NO());
			prsmt.setString(6, lczt.getEVAL_YEAR());
			int row = prsmt.executeUpdate();
			if (row > 0) {
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
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return flag;
	}

	public void doSetData(ResultSet rsSelect) throws SQLException {
		RECORD_NO = rsSelect.getString("RECORD_NO");
		EVAL_YEAR = rsSelect.getString("EVAL_YEAR");
		DOM_DISTRICT_CODE = rsSelect.getString("DOM_DISTRICT_CODE");
		LOCAL_ORG_NO = rsSelect.getString("LOCAL_ORG_NO");
		EST_DATE = String.valueOf(rsSelect.getDate("EST_DATE"));
		ENT_NAME = rsSelect.getString("ENT_NAME");
		LOCAL_INDUSTRY_TYPE = rsSelect.getString("LOCAL_INDUSTRY_TYPE");
		ENT_SACLE_TYPE = rsSelect.getString("ENT_SACLE_TYPE");
		LEG_REP_NAME = rsSelect.getString("LEG_REP_NAME");
		REG_NO = rsSelect.getString("REG_NO");
		UNISCID = rsSelect.getString("UNISCID");
		ORG_CODE = rsSelect.getString("ORG_CODE");
		ADDR_DESC = rsSelect.getString("ADDR_DESC");
		LIAI_POSE_CODE = rsSelect.getString("LIAI_POSE_CODE");
		LIAI_MOBILE = rsSelect.getString("LIAI_MOBILE");
		LIAI_EMAIL = rsSelect.getString("LIAI_EMAIL");
		WEBSITE_DESC = rsSelect.getString("WEBSITE_DESC");
		APPR_STAT_FLAG = rsSelect.getString("APPR_STAT_FLAG");
	}

	public boolean doAdd(HashMap<String, Object> map) {
		boolean flag = false;
		DbConnection dbc = new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		Calendar cal = Calendar.getInstance();
		int year = cal.get(cal.YEAR);

		RecordNoUtil ru = new RecordNoUtil();

		// String year = String.valueOf(cal.YEAR);
		// String
		// sqlAdd="INSERT INTO SZCP_LCZT(RECORD_NO,EVAL_YEAR,DOM_DISTRICT_CODE,LOCAL_ORG_NO,REG_NO,ENT_NAME,LOCAL_INDUSTRY_TYPE,ENT_SACLE_TYPE,LEG_REP_NAME,EST_DATE,ORG_CODE,ADDR_DESC,LIAI_POSE_CODE,LIAI_MOBILE,LIAI_EMAIL,WEBSITE_DESC,APPR_STAT_FLAG,PRO_STAT_FLAG,APPLY_DATE,FST_APPLY_YEAR,ACC_PUBLIC_QTY,LOGIN_ID) VALUES("+doPreProcess3(sczp.getRECORD_NO())+","+doPreProcess3(sczp.getEVAL_YEAR())+","+
		// doPreProcess3(sczp.getDOM_DISTRICT_CODE())+","+
		// doPreProcess3(sczp.getLOCAL_ORG_NO())+","+doPreProcess3(sczp.getREG_NO())+","+doPreProcess3(sczp.getENT_NAME())+","+doPreProcess3(sczp.getLOCAL_INDUSTRY_TYPE())+","+doPreProcess3(sczp.getENT_SACLE_TYPE())+","+doPreProcess3(sczp.getLEG_REP_NAME())+","+doPreProcess3("EST_DATE")+","+doPreProcess3(ORG_CODE)+","+doPreProcess3(ADDR_DESC)+","+doPreProcess3(LIAI_POSE_CODE)+","+doPreProcess3(LIAI_MOBILE)+","+doPreProcess3(LIAI_EMAIL)+","+doPreProcess3(WEBSITE_DESC)+","+doPreProcess3(APPR_STAT_FLAG)+","+doPreProcess3(PRO_STAT_FLAG)+","+doPreProcess3(APPLY_DATE)+","+doPreProcess3(FST_APPLY_YEAR)+","+doPreProcess3(ACC_PUBLIC_QTY)+","+doPreProcess3(LOGIN_ID)+")";
		String sqlAdd = "INSERT INTO SZCP_LCZT(RECORD_NO,EVAL_YEAR,LOCAL_ORG_NO,REG_NO,ENT_NAME,ADDR_DESC,LOGIN_ID,APPR_STAT_FLAG,PRO_STAT_FLAG,DOM_DISTRICT_CODE,EST_DATE,UNISCID) values(?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement prsmt = dbc.prepareStatement(sqlAdd);
			prsmt.setString(
					1,
					ru.createRecordNo("SZCP_LCZT", year + "",
							(String)map.get("LOCAL_ORG_NO")));
			prsmt.setString(2, year + "");
			prsmt.setString(3, (String)map.get("LOCAL_ORG_NO"));
			prsmt.setString(4, (String)map.get("REGNO"));
			prsmt.setString(5, (String)map.get("ENT_NAME"));
			prsmt.setString(6,  (String)map.get("ADDR_DESC"));
			prsmt.setString(7,  (String)map.get("LOGIN_ID"));
			prsmt.setString(8,  (String)map.get("APPR_STAT_FLAG"));
			prsmt.setString(9,  (String)map.get("PRO_STAT_FLAG"));
			prsmt.setString(10, (String)map.get("DOM_DISTRICT_CODE"));
			Date estDate = (Date) map.get("ESTDATE");
			if(estDate != null) {
				Timestamp timestamp = new Timestamp(estDate.getTime());
				prsmt.setTimestamp(11, timestamp);
			}
			prsmt.setString(12, (String)map.get("UNISCID"));
			nRowCount = prsmt.executeUpdate();
			dbc.close();
			if (nRowCount > 0) {
				flag = true;
			} else {
				flag = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;

	}
	
	public Map<String,QYDJ_RYXX_ZS> queryByPripid(String PRIPID){
		Map<String,QYDJ_RYXX_ZS> map = new HashMap<String,QYDJ_RYXX_ZS>();
		/*String sqlSelect="SELECT * FROM QYDJ_RYXX_ZS"+" WHERE PRIPID='"+doPreProcess(PRIPID)+"'";*/
		String sqlSelect="SELECT * FROM QYDJ_RYXX_ZS"+" WHERE PRIPID='"+doPreProcess(PRIPID)+"'"+" AND LEREPSIGN='1'";
		GsDbConnection dbc=new GsDbConnection();
		//DbConnection dbc = new DbConnection();
		ResultSet rsSelect;
		try {
			rsSelect = dbc.executeQuery(sqlSelect);
			while(rsSelect.next()) {
				QYDJ_RYXX_ZS ryxx_zs = new QYDJ_RYXX_ZS();
				ryxx_zs.setRECID(rsSelect.getString("RECID"));
				ryxx_zs.setPRIPID(rsSelect.getString("PRIPID"));
				ryxx_zs.setNAME(rsSelect.getString("NAME"));
				ryxx_zs.setSEX(rsSelect.getString("SEX"));
				ryxx_zs.setNATDATE(String.valueOf(rsSelect.getDate("NATDATE")));
				ryxx_zs.setCERTYPE(rsSelect.getString("CERTYPE"));
				ryxx_zs.setCERNO(rsSelect.getString("CERNO"));
				ryxx_zs.setPOSITION(rsSelect.getString("POSITION"));
				ryxx_zs.setOFFHFROM(String.valueOf(rsSelect.getDate("OFFHFROM")));
				ryxx_zs.setOFFHTO(String.valueOf(rsSelect.getDate("OFFHTO")));
				ryxx_zs.setPOSBRFORM(rsSelect.getString("POSBRFORM"));
				ryxx_zs.setLEREPSIGN(rsSelect.getString("LEREPSIGN"));
				ryxx_zs.setAPPOUNIT(rsSelect.getString("APPOUNIT"));
				ryxx_zs.setOFFSIGN(rsSelect.getString("OFFSIGN"));
				ryxx_zs.setTEL(rsSelect.getString("TEL"));
				ryxx_zs.setPOSTALCODE(rsSelect.getString("POSTALCODE"));
				ryxx_zs.setHOUSEADD(rsSelect.getString("HOUSEADD"));
				ryxx_zs.setCOUNTRY(rsSelect.getString("COUNTRY"));
				ryxx_zs.setACCDSIDE(rsSelect.getString("ACCDSIDE"));
				ryxx_zs.setCERISSDATE(String.valueOf(rsSelect.getDate("CERISSDATE")));
				ryxx_zs.setCERVALPER(String.valueOf(rsSelect.getDate("CERVALPER")));
				ryxx_zs.setARRCHDATE(String.valueOf(rsSelect.getDate("ARRCHDATE")));
				ryxx_zs.setHOUSEADDINCHINA(rsSelect.getString("HOUSEADDINCHINA"));
				ryxx_zs.setCHIOFTHEDESIGN(rsSelect.getString("CHIOFTHEDESIGN"));
				ryxx_zs.setOCCSTBEAPP(rsSelect.getString("OCCSTBEAPP"));
				ryxx_zs.setLITEDEG(rsSelect.getString("LITEDEG"));
				ryxx_zs.setPOLSTAND(rsSelect.getString("POLSTAND"));
				ryxx_zs.setNATION(rsSelect.getString("NATION"));
				ryxx_zs.setIFUNEMP(rsSelect.getString("IFUNEMP"));
				ryxx_zs.setIFUNIVERSAL(rsSelect.getString("IFUNIVERSAL"));
				ryxx_zs.setS_EXT_TIMESTAMP(rsSelect.getString("S_EXT_TIMESTAMP"));
				map.put(rsSelect.getString("CERNO"), ryxx_zs);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return map;
	}

	/**
	 * 
	 * 
	 * @param red_no
	 * @param year
	 * @return
	 * @throws SQLException
	 */
	public SZCP_LCZT selectSZCP_LCZT(String reg_no, String year)
			throws SQLException {
		SZCP_LCZT lczt = null;
		PreparedStatement ps = null;
		DbConnection conn = new DbConnection();
		ResultSet rs = null;
		String sql = "select APPLY_DATE from SZCP_LCZT where REG_NO=? and EVAL_YEAR=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, reg_no);
			ps.setString(2, year);
			rs = ps.executeQuery();
			while (rs.next()) {
				if(rs.getString("APPLY_DATE")!=null){
					lczt = new SZCP_LCZT();
					StringBuffer sb = new StringBuffer();
					
					String date = rs.getString("APPLY_DATE");
					sb.append(date.substring(0,4)).append("Äê").append(date.substring(5,7)).append("ÔÂ").append(date.substring(8,10)).append("ÈÕ");
					
					lczt.setAPPLY_DATE(sb.toString());
				}
			}

		} catch (SQLException e) {

			e.printStackTrace();

		} finally {
			rs.close();
			ps.close();
			conn.close();
		}
		return lczt;

	}
	
	public SZCP_LCZT querySZCP_LCZT(String regNo){
		String sql = "select *from SZCP_LCZT where REG_NO = "+"'"+regNo+"'";
		DbConnection connection = new DbConnection();
		ResultSet rs = null;
		SZCP_LCZT lczt = new SZCP_LCZT();
		try {
			 rs = connection.executeQuery(sql);
			 if(rs.next()) {
				 lczt = setValueToSZCP_LCZT(rs);
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
		return lczt;
	}
	public SZCP_LCZT setValueToSZCP_LCZT(ResultSet rsSelect){
		SZCP_LCZT lczt = new SZCP_LCZT();
		try{
			lczt.setRECORD_NO(rsSelect.getString("RECORD_NO")== null?"":rsSelect.getString("RECORD_NO"));
			lczt.setEVAL_YEAR(rsSelect.getString("EVAL_YEAR")== null?"":rsSelect.getString("EVAL_YEAR"));
			lczt.setDOM_DISTRICT_CODE(rsSelect.getString("DOM_DISTRICT_CODE") == null?"":rsSelect.getString("DOM_DISTRICT_CODE"));
			lczt.setLOCAL_ORG_NO(rsSelect.getString("LOCAL_ORG_NO")== null?"":rsSelect.getString("LOCAL_ORG_NO"));
			lczt.setEST_DATE(String.valueOf(rsSelect.getDate("EST_DATE")));
			lczt.setENT_NAME(rsSelect.getString("ENT_NAME") == null?"":rsSelect.getString("ENT_NAME"));
			lczt.setLOCAL_INDUSTRY_TYPE(rsSelect.getString("LOCAL_INDUSTRY_TYPE") == null?"":rsSelect.getString("LOCAL_INDUSTRY_TYPE"));
			lczt.setENT_SACLE_TYPE(rsSelect.getString("ENT_SACLE_TYPE")== null?"":rsSelect.getString("ENT_SACLE_TYPE"));
			lczt.setLEG_REP_NAME(rsSelect.getString("LEG_REP_NAME")==null?"":rsSelect.getString("LEG_REP_NAME"));
			lczt.setREG_NO(rsSelect.getString("REG_NO")==null?"":rsSelect.getString("REG_NO"));
			lczt.setUNISCID(rsSelect.getString("UNISCID")==null?"":rsSelect.getString("UNISCID"));
			lczt.setORG_CODE(rsSelect.getString("ORG_CODE") == null?"":rsSelect.getString("ORG_CODE"));
			lczt.setADDR_DESC(rsSelect.getString("ADDR_DESC") == null?"":rsSelect.getString("ADDR_DESC"));
			lczt.setLIAI_NAME(rsSelect.getString("LIAI_NAME") == null?"":rsSelect.getString("LIAI_NAME"));
			lczt.setLIAI_TEL(rsSelect.getString("LIAI_TEL") == null?"":rsSelect.getString("LIAI_TEL"));
			lczt.setLIAI_POSE_CODE(rsSelect.getString("LIAI_POSE_CODE") == null?"":rsSelect.getString("LIAI_POSE_CODE"));
			lczt.setLIAI_MOBILE(rsSelect.getString("LIAI_MOBILE") == null?"":rsSelect.getString("LIAI_MOBILE"));
			lczt.setLIAI_EMAIL(rsSelect.getString("LIAI_EMAIL")== null?"":rsSelect.getString("LIAI_EMAIL"));
			lczt.setWEBSITE_DESC(rsSelect.getString("WEBSITE_DESC") == null?"":rsSelect.getString("WEBSITE_DESC"));
			lczt.setAPPR_STAT_FLAG(rsSelect.getString("APPR_STAT_FLAG") == null?"":rsSelect.getString("APPR_STAT_FLAG"));
			lczt.setPRO_STAT_FLAG(rsSelect.getString("PRO_STAT_FLAG") == null?"":rsSelect.getString("PRO_STAT_FLAG"));
			lczt.setAPPLY_DATE(String.valueOf(rsSelect.getDate("APPLY_DATE")));
			lczt.setFST_APPLY_YEAR(rsSelect.getString("FST_APPLY_YEAR") == null?"":rsSelect.getString("FST_APPLY_YEAR"));
			lczt.setACC_PUBLIC_QTY(rsSelect.getInt("ACC_PUBLIC_QTY"));
			lczt.setLOGIN_ID(rsSelect.getString("LOGIN_ID") == null?"":rsSelect.getString("LOGIN_ID"));
		}catch(Exception e ){
			e.printStackTrace();
		}
		return lczt;
	}
	
	public List<SZCP_LCZT> queryinfo(String regno,String eval_year){
		String sql = "select *from SZCP_LCZT where REG_NO = ? and EVAL_YEAR = ?";
		DbConnection connection = new DbConnection();
		ResultSet rsSelect = null;
		PreparedStatement prsmt = null;
		List<SZCP_LCZT> list = new ArrayList<SZCP_LCZT>();
		try {
			 prsmt = connection.prepareStatement(sql);
			 prsmt.setString(1, regno);
			 prsmt.setString(2, eval_year);
			 rsSelect = prsmt.executeQuery();
			 while(rsSelect.next()) {
				 SZCP_LCZT lczt  = new SZCP_LCZT();
				 lczt.setRECORD_NO(rsSelect.getString("RECORD_NO")== null?"":rsSelect.getString("RECORD_NO"));
				lczt.setEVAL_YEAR(rsSelect.getString("EVAL_YEAR")== null?"":rsSelect.getString("EVAL_YEAR"));
				lczt.setDOM_DISTRICT_CODE(rsSelect.getString("DOM_DISTRICT_CODE") == null?"":rsSelect.getString("DOM_DISTRICT_CODE"));
				lczt.setLOCAL_ORG_NO(rsSelect.getString("LOCAL_ORG_NO")== null?"":rsSelect.getString("LOCAL_ORG_NO"));
				lczt.setEST_DATE(String.valueOf(rsSelect.getDate("EST_DATE")));
				lczt.setENT_NAME(rsSelect.getString("ENT_NAME") == null?"":rsSelect.getString("ENT_NAME"));
				lczt.setLOCAL_INDUSTRY_TYPE(rsSelect.getString("LOCAL_INDUSTRY_TYPE") == null?"":rsSelect.getString("LOCAL_INDUSTRY_TYPE"));
				lczt.setENT_SACLE_TYPE(rsSelect.getString("ENT_SACLE_TYPE")== null?"":rsSelect.getString("ENT_SACLE_TYPE"));
				lczt.setLEG_REP_NAME(rsSelect.getString("LEG_REP_NAME")==null?"":rsSelect.getString("LEG_REP_NAME"));
				lczt.setREG_NO(rsSelect.getString("REG_NO")==null?"":rsSelect.getString("REG_NO"));
				lczt.setUNISCID(rsSelect.getString("UNISCID")==null?"":rsSelect.getString("UNISCID"));
				lczt.setORG_CODE(rsSelect.getString("ORG_CODE") == null?"":rsSelect.getString("ORG_CODE"));
				lczt.setADDR_DESC(rsSelect.getString("ADDR_DESC") == null?"":rsSelect.getString("ADDR_DESC"));
				lczt.setLIAI_NAME(rsSelect.getString("LIAI_NAME") == null?"":rsSelect.getString("LIAI_NAME"));
				lczt.setLIAI_TEL(rsSelect.getString("LIAI_TEL") == null?"":rsSelect.getString("LIAI_TEL"));
				lczt.setLIAI_POSE_CODE(rsSelect.getString("LIAI_POSE_CODE") == null?"":rsSelect.getString("LIAI_POSE_CODE"));
				lczt.setLIAI_MOBILE(rsSelect.getString("LIAI_MOBILE") == null?"":rsSelect.getString("LIAI_MOBILE"));
				lczt.setLIAI_EMAIL(rsSelect.getString("LIAI_EMAIL")== null?"":rsSelect.getString("LIAI_EMAIL"));
				lczt.setWEBSITE_DESC(rsSelect.getString("WEBSITE_DESC") == null?"":rsSelect.getString("WEBSITE_DESC"));
				lczt.setAPPR_STAT_FLAG(rsSelect.getString("APPR_STAT_FLAG") == null?"":rsSelect.getString("APPR_STAT_FLAG"));
				lczt.setPRO_STAT_FLAG(rsSelect.getString("PRO_STAT_FLAG") == null?"":rsSelect.getString("PRO_STAT_FLAG"));
				lczt.setAPPLY_DATE(String.valueOf(rsSelect.getDate("APPLY_DATE")));
				lczt.setFST_APPLY_YEAR(rsSelect.getString("FST_APPLY_YEAR") == null?"":rsSelect.getString("FST_APPLY_YEAR"));
				lczt.setACC_PUBLIC_QTY(rsSelect.getInt("ACC_PUBLIC_QTY"));
				lczt.setLOGIN_ID(rsSelect.getString("LOGIN_ID") == null?"":rsSelect.getString("LOGIN_ID"));
				list.add(lczt);
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
				rsSelect.close();
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
	public int queryCount(String usernum){
		int i = 0;
		String sql = "select count(*) as num from SZCP_LCZT  t  where t.login_id = "+"'"+usernum+"'";
		DbConnection connection = new DbConnection();
		PreparedStatement prsmt = null;
		ResultSet rsSelect = null;
		try{
			prsmt = connection.prepareStatement(sql);
			rsSelect = prsmt.executeQuery();
			if(rsSelect.next()){
				i = Integer.parseInt(rsSelect.getString("num"));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return i;
	}
	public List<SZCP_LCZT> queryAll(String loginid){
		String sql = "select t.REG_NO,t.UNISCID,t.ENT_NAME,t.ADDR_DESC,t.APPLY_DATE,(select d.content from com_dm d where d.code =t.LOCAL_ORG_NO and d.type = 'DISTRICT') as local_org_no,t.APPR_STAT_FLAG,t.EVAL_YEAR from SZCP_LCZT  t  where t.login_id = "+"'"+loginid+"'"+" order by t.apply_date desc";
		DbConnection connection = new DbConnection();
		ResultSet rsSelect = null;
		PreparedStatement prsmt = null;
		List<SZCP_LCZT> list = new ArrayList<SZCP_LCZT>();
		try {
			 prsmt = connection.prepareStatement(sql);
			 rsSelect = prsmt.executeQuery();
			 while(rsSelect.next()) {
				 SZCP_LCZT lczt  = new SZCP_LCZT();
				 lczt.setEVAL_YEAR(rsSelect.getString("EVAL_YEAR")== null?"":rsSelect.getString("EVAL_YEAR"));
				 lczt.setLocalOrgName(rsSelect.getString("local_org_no")== null?"":rsSelect.getString("local_org_no"));
				lczt.setENT_NAME(rsSelect.getString("ENT_NAME") == null?"":rsSelect.getString("ENT_NAME"));
				lczt.setREG_NO(rsSelect.getString("REG_NO")==null?"":rsSelect.getString("REG_NO"));
				lczt.setUNISCID(rsSelect.getString("UNISCID")==null?"":rsSelect.getString("UNISCID"));
				lczt.setADDR_DESC(rsSelect.getString("ADDR_DESC") == null?"":rsSelect.getString("ADDR_DESC"));
				lczt.setAPPR_STAT_FLAG(rsSelect.getString("APPR_STAT_FLAG") == null?"":rsSelect.getString("APPR_STAT_FLAG"));
				lczt.setAPPLY_DATE(String.valueOf(rsSelect.getDate("APPLY_DATE")));
				list.add(lczt);
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
				rsSelect.close();
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

	public String getREPORT_ORG_NO() {
		return REPORT_ORG_NO;
	}

	public void setREPORT_ORG_NO(String report_org_no) {
		REPORT_ORG_NO = report_org_no;
	}
	

}
