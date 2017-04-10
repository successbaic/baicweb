package com.macrosoft.icms.szcp;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.macrosoft.icms.dbc.DbConnection;
public class SZCP_YSB{
	String PK_PRIID_ID;
	String REG_NO;
	String UNISCID;
	String ENT_NAME;
	String ENT_TYPE;
	String DOM_DISTRICT_CODE;
	String LOCAL_ORG_CODE;
	Date EST_DATE;
	String ADDR_DESC;
	String TEL_NO;
	String LEG_REP_NAME;
	String LEG_REP_CERT_NO;
	String LEG_REP_CERT_TYPE;
	String FST_APPLY_YEAR;
	String ACC_PUBLIC_QTY;
	String STAT_FLAG;
	private String localorgname;
	public String getPK_PRIID_ID(){
		return doPreProcess(PK_PRIID_ID);
	}

	public void setPK_PRIID_ID( String PK_PRIID_ID){
		this.PK_PRIID_ID=doPreProcess2(convertCode(PK_PRIID_ID));
	}
	
	public String getREG_NO(){
		return doPreProcess(REG_NO);
	}

	public void setREG_NO( String REG_NO){
		this.REG_NO=doPreProcess2(convertCode(REG_NO));
	}
	
	public String getUNISCID(){
		return doPreProcess(UNISCID);
	}

	public void setUNISCID( String UNISCID){
		this.UNISCID=doPreProcess2(convertCode(UNISCID));
	}
	
	public String getENT_NAME(){
		return ENT_NAME;
	}

	public void setENT_NAME( String ENT_NAME){
		this.ENT_NAME=ENT_NAME;
	}
	
	public String getENT_TYPE(){
		return doPreProcess(ENT_TYPE);
	}

	public void setENT_TYPE( String ENT_TYPE){
		this.ENT_TYPE=doPreProcess2(convertCode(ENT_TYPE));
	}
	
	public String getDOM_DISTRICT_CODE(){
		return doPreProcess(DOM_DISTRICT_CODE);
	}

	public void setDOM_DISTRICT_CODE( String DOM_DISTRICT_CODEL){
		this.DOM_DISTRICT_CODE=doPreProcess2(convertCode(DOM_DISTRICT_CODE));
	}
	
	

	
	public String getADDR_DESC() {
		return ADDR_DESC;
	}

	public void setADDR_DESC(String aDDR_DESC) {
		ADDR_DESC = aDDR_DESC;
	}

	public String getTEL_NO(){
		return doPreProcess(TEL_NO);
	}

	public void setTEL_NO( String TEL_NO){
		this.TEL_NO=doPreProcess2(convertCode(TEL_NO));
	}
	
	public String getLEG_REP_NAME(){
		return doPreProcess(LEG_REP_NAME);
	}

	public void setLEG_REP_NAME( String LEG_REP_NAME){
		this.LEG_REP_NAME=doPreProcess2(convertCode(LEG_REP_NAME));
	}
	
	public String getLEG_REP_CERT_NO(){
		return doPreProcess(LEG_REP_CERT_NO);
	}

	public void setLEG_REP_CERT_NO(String LEG_REP_CERT_NO){
		this.LEG_REP_CERT_NO=doPreProcess2(convertCode(LEG_REP_CERT_NO));
	}
	
	public String getLEG_REP_CERT_TYPE(){
		return doPreProcess(LEG_REP_CERT_TYPE);
	}

	public void setLEG_REP_CERT_TYPE(String LEG_REP_CERT_TYPE){
		this.LEG_REP_CERT_TYPE=doPreProcess2(convertCode(LEG_REP_CERT_TYPE));
	}
	
	public String getFST_APPLY_YEAR(){
		return doPreProcess(FST_APPLY_YEAR);
	}

	public void setFST_APPLY_YEAR(String FST_APPLY_YEAR){
		this.FST_APPLY_YEAR=doPreProcess2(convertCode(FST_APPLY_YEAR));
	}
	
	public String getACC_PUBLIC_QTY(){
		return doPreProcess(ACC_PUBLIC_QTY);
	}

	public void setACC_PUBLIC_QTY(String ACC_PUBLIC_QTY){
		this.ACC_PUBLIC_QTY=doPreProcess2(convertCode(ACC_PUBLIC_QTY));
	}
	
	public String getSTAT_FLAG(){
		return doPreProcess(STAT_FLAG);
	}

	public void setSTAT_FLAG(String STAT_FLAG){
		this.STAT_FLAG=doPreProcess2(convertCode(STAT_FLAG));
	}
	
	

	public String getLOCAL_ORG_CODE() {
		return LOCAL_ORG_CODE;
	}

	public void setLOCAL_ORG_CODE(String lOCAL_ORG_CODE) {
		LOCAL_ORG_CODE = lOCAL_ORG_CODE;
	}

	public String convertCode(String strvalue)
	{	return com.macrosoft.icms.system.SysUtility.convertCode( strvalue );	}

	public String doPreProcess( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess( sValue );	}

	public String doPreProcess2( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess2( sValue );	}
	
	public void doSetData( ResultSet rsSelect ) throws SQLException
	{
		PK_PRIID_ID=rsSelect.getString("PK_PRIID_ID");
		REG_NO=rsSelect.getString("REG_NO");
		UNISCID=rsSelect.getString("UNISCID");
		ENT_NAME=rsSelect.getString("ENT_NAME");
		ENT_TYPE=rsSelect.getString("ENT_TYPE");
		DOM_DISTRICT_CODE=rsSelect.getString("DOM_DISTRICT_CODE");
		LOCAL_ORG_CODE=rsSelect.getString("LOCAL_ORG_CODE");
		EST_DATE=rsSelect.getDate("EST_DATE");
		ADDR_DESC=rsSelect.getString("ADDR_DESC");
		TEL_NO=rsSelect.getString("TEL_NO");
		LEG_REP_NAME=rsSelect.getString("LEG_REP_NAME");
		LEG_REP_CERT_NO=rsSelect.getString("LEG_REP_CERT_NO");
		LEG_REP_CERT_TYPE=rsSelect.getString("LEG_REP_CERT_TYPE");
		FST_APPLY_YEAR=rsSelect.getString("FST_APPLY_YEAR");
		ACC_PUBLIC_QTY=rsSelect.getString("ACC_PUBLIC_QTY");
		STAT_FLAG = rsSelect.getString("STAT_FLAG");
	}
	
	public void doSelectBySql(String sqlSelect) throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsSelect;
		rsSelect=dbc.executeQuery(sqlSelect);
		if(rsSelect.next())
		{
			doSetData( rsSelect );
		}
		dbc.close();
	}
	
	
	public List<SZCP_YSB> queryinfo(String regno,String cerno){
		String sql = "select ysb.REG_NO,ysb.UNISCID, ysb.ENT_NAME,ysb.ADDR_DESC,"
				+ " (select t.content from com_dm t where t.code =ysb.lOCAL_ORG_CODE and t.type = 'DISTRICT') as localorgname  "
				+ " from SZCP_YSB ysb where (ysb.REG_NO = ? or ysb.UNISCID= ?)  and ysb.LEG_REP_CERT_NO = ? ";
		
		DbConnection connection = new DbConnection();
		ResultSet rsSelect = null;
		PreparedStatement prsmt = null;
		List<SZCP_YSB> list = new ArrayList<SZCP_YSB>();
		try {
			 prsmt = connection.prepareStatement(sql);
			 prsmt.setString(1, regno);
			 prsmt.setString(2, regno);
			 prsmt.setString(3, cerno);
			 rsSelect = prsmt.executeQuery();
			 while(rsSelect.next()) {
				 SZCP_YSB ysb  = new SZCP_YSB();
				 ysb.setREG_NO(rsSelect.getString("REG_NO"));
				 ysb.setUNISCID(rsSelect.getString("UNISCID"));
				 ysb.setENT_NAME(rsSelect.getString("ENT_NAME"));
				 ysb.setADDR_DESC(rsSelect.getString("ADDR_DESC").trim());
 				 ysb.setLocalorgname(rsSelect.getString("localorgname"));
				list.add(ysb);
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

	public Date getEST_DATE() {
		return EST_DATE;
	}

	public void setEST_DATE(Date eST_DATE) {
		EST_DATE = eST_DATE;
	}

	public String getLocalorgname() {
		return localorgname;
	}

	public void setLocalorgname(String localorgname) {
		this.localorgname = localorgname;
	}
	
	
	public SZCP_YSB queryIsYsb(String regNo,String cerNo){
		String sql = "SELECT * FROM SZCP_YSB WHERE (REG_NO= ?  OR UNISCID = ?)  AND LEG_REP_CERT_NO =  ? ";
		DbConnection connection = new DbConnection();
		ResultSet rsSelect = null;
		PreparedStatement prsmt = null;
		SZCP_YSB ysb = null;
		try {
			 prsmt = connection.prepareStatement(sql);
			 prsmt.setString(1, regNo);
			 prsmt.setString(2, regNo);
			 prsmt.setString(3, cerNo);
			 rsSelect = prsmt.executeQuery();
			 if(rsSelect.next()) {
				 ysb = new SZCP_YSB();
				 ysb.setREG_NO(rsSelect.getString("REG_NO"));
				 ysb.setUNISCID(rsSelect.getString("UNISCID")); 
				 ysb.setLEG_REP_CERT_NO(rsSelect.getString("LEG_REP_CERT_NO"));
				 ysb.setSTAT_FLAG(rsSelect.getString("STAT_FLAG"));
			 }
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			try {
				rsSelect.close();
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
		return ysb;
	}
	
	public boolean queryIsDjQy(String REGNO) {
		String sql = "SELECT COUNT(*) FROM QYDJ_JBXX_ZS WHERE  REGNO= ?";
		DbConnection connection = new DbConnection();
		ResultSet rsSelect = null;
		PreparedStatement prsmt = null;
		boolean flag = false;
		try {
			 prsmt = connection.prepareStatement(sql);
			 prsmt.setString(1, REGNO);
			 rsSelect = prsmt.executeQuery();
			 if(rsSelect.next()) {
				flag = true;
			 }else {
				 flag = false;
			 }
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			try {
				rsSelect.close();
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
		return flag;
	}
	
	
	
}


  	
