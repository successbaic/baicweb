package com.macrosoft.icms.util;
import java.sql.*;
import com.macrosoft.icms.dbc.*;
public class WSDJ_LOG_RECORD
{
	String LOGID;
	String LINKNAME;
	String USERID;
	String OPENO;
	String USERIP;
	String S_EXT_TIMESTAMP;
	String ENTNAME;
	String OPERNAME;
	String IFELEC;
	
	public String getLOGID() {
		return LOGID;
	}

	public void setLOGID(String lOGID) {
		LOGID = lOGID;
	}

	public String getLINKNAME() {
		return LINKNAME;
	}

	public void setLINKNAME(String lINKNAME) {
		LINKNAME = lINKNAME;
	}

	public String getUSERID() {
		return USERID;
	}

	public void setUSERID(String uSERID) {
		USERID = uSERID;
	}

	public String getOPENO() {
		return OPENO;
	}

	public void setOPENO(String oPENO) {
		OPENO = oPENO;
	}

	public String getUSERIP() {
		return USERIP;
	}

	public void setUSERIP(String uSERIP) {
		USERIP = uSERIP;
	}

	public String getS_EXT_TIMESTAMP() {
		return S_EXT_TIMESTAMP;
	}

	public void setS_EXT_TIMESTAMP(String s_EXT_TIMESTAMP) {
		S_EXT_TIMESTAMP = s_EXT_TIMESTAMP;
	}

	public String getENTNAME() {
		return ENTNAME;
	}

	public void setENTNAME(String eNTNAME) {
		ENTNAME = eNTNAME;
	}

	public String getOPERNAME() {
		return OPERNAME;
	}

	public void setOPERNAME(String oPERNAME) {
		OPERNAME = oPERNAME;
	}

	public String getIFELEC() {
		return IFELEC;
	}

	public void setIFELEC(String iFELEC) {
		IFELEC = iFELEC;
	}

	public String convertCode(String strvalue)
	{	
		return com.macrosoft.icms.system.SysUtility.convertCode( strvalue );	
	}

	public String doPreProcess3( String sValue )
	{	
		return com.macrosoft.icms.system.SysUtility.doPreProcess3( sValue );
	}


	public boolean doAdd() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd="INSERT INTO WSDJ_LOG_RECORD(LOGID,LINKNAME,USERID,OPENO,USERIP,S_EXT_TIMESTAMP,ENTNAME,OPERNAME,IFELEC) VALUES("+ doPreProcess3(LOGID)+","+doPreProcess3(LINKNAME)+","+ doPreProcess3(USERID)+","+ doPreProcess3(OPENO)+","+ doPreProcess3(USERIP)+",sysdate,"+ doPreProcess3(ENTNAME)+","+doPreProcess3(OPERNAME)+","+doPreProcess3(IFELEC)+")";
		{							
			nRowCount=dbc.executeUpdate( sqlAdd );
			dbc.close();
			if (nRowCount>0)	//²åÈë³É¹¦
				return true;
			else
				return false;
		}
	}

}
