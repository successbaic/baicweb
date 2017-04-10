package com.macrosoft.icms.gsnw;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import com.macrosoft.icms.gsdbc.GsDbConnection;
import com.macrosoft.icms.gsdbc.SJGsDbConnection;
import com.macrosoft.icms.system.SysUtility;
public class MCGL_JBXX_ZS
{
	String COUNTY;
	int OPFYEARS;
	String STREET;
	String ROAD;
	String DOORPLATE;
	String NAMEID;
	String PRIPID;
	String NAMETYPE;
	String ENTTRA;
	String TRADPINY;
	String ENTNAME;
	String ENTNAMESPELL;
	String ENTCAT;
	String ENTTYPE;
	String ORGFORM;
	String NAMEDISTRICT;
	String NAMEIND;
	String GRPSHFORM;
	String DOMDISTRICT;
	String DOM;
	String OPLOC;
	String ABUITEMCO;
	String CBUITEM;
	String BUSSCOPE;
	float CONGRO;
	String CONGROCUR;
	float CONGROUSD;
	float FORSUBCONAMUSD;
	double REGCAP;
	String REGCAPCUR;
	float REGCAPUSD;
	int NAMESTATUS;
	String SAVEPERFROM;
	String SAVEPERTO;
	String NAME;
	String TEL;
	String HKSIGN;
	String PREREGORG;
	String LOCALADM;
	String APPRAUTH;
	String APPRDATE;
	String REMARK;
	int ISENTNAMEALT;
	String ENTNAMEBEALT;
	String CONTINENT;
	String COUNTRY;
	String INDUSTRYPHY;
	String INDUSTRYCO;
	String OPSCOTYPE;
	String S_EXT_TIMESTAMP;
	String APPRNO;
	String ISUSED;
	String PROVINCE;
	String CITY;
	public String getCOUNTY()
	{
		return doPreProcess(COUNTY);
	}

	public void setCOUNTY( String COUNTY)
	{
		this.COUNTY=doPreProcess2(convertCode(COUNTY));
	}

	public int getOPFYEARS()
	{
		return OPFYEARS;
	}

	public void setOPFYEARS( int OPFYEARS)
	{
		this.OPFYEARS=OPFYEARS ;
	}

	public String getSTREET()
	{
		return doPreProcess(STREET);
	}

	public void setSTREET( String STREET)
	{
		this.STREET=doPreProcess2(convertCode(STREET));
	}

	public String getROAD()
	{
		return doPreProcess(ROAD);
	}

	public void setROAD( String ROAD)
	{
		this.ROAD=doPreProcess2(convertCode(ROAD));
	}

	public String getDOORPLATE()
	{
		return doPreProcess(DOORPLATE);
	}

	public void setDOORPLATE( String DOORPLATE)
	{
		this.DOORPLATE=doPreProcess2(convertCode(DOORPLATE));
	}

	public String getNAMEID()
	{
		return doPreProcess(NAMEID);
	}

	public void setNAMEID( String NAMEID)
	{
		this.NAMEID=doPreProcess2(convertCode(NAMEID));
	}

	public String getPRIPID()
	{
		return doPreProcess(PRIPID);
	}

	public void setPRIPID( String PRIPID)
	{
		this.PRIPID=doPreProcess2(convertCode(PRIPID));
	}

	public String getNAMETYPE()
	{
		return doPreProcess(NAMETYPE);
	}

	public void setNAMETYPE( String NAMETYPE)
	{
		this.NAMETYPE=doPreProcess2(convertCode(NAMETYPE));
	}

	public String getENTTRA()
	{
		return doPreProcess(ENTTRA);
	}

	public void setENTTRA( String ENTTRA)
	{
		this.ENTTRA=doPreProcess2(convertCode(ENTTRA));
	}

	public String getTRADPINY()
	{
		return doPreProcess(TRADPINY);
	}

	public void setTRADPINY( String TRADPINY)
	{
		this.TRADPINY=doPreProcess2(convertCode(TRADPINY));
	}

	public String getENTNAME()
	{
		return doPreProcess(ENTNAME);
	}

	public void setENTNAME( String ENTNAME)
	{
		this.ENTNAME=doPreProcess2(convertCode(ENTNAME));
	}

	public String getENTNAMESPELL()
	{
		return doPreProcess(ENTNAMESPELL);
	}

	public void setENTNAMESPELL( String ENTNAMESPELL)
	{
		this.ENTNAMESPELL=doPreProcess2(convertCode(ENTNAMESPELL));
	}

	public String getENTCAT()
	{
		return doPreProcess(ENTCAT);
	}

	public void setENTCAT( String ENTCAT)
	{
		this.ENTCAT=doPreProcess2(convertCode(ENTCAT));
	}

	public String getENTTYPE()
	{
		return doPreProcess(ENTTYPE);
	}

	public void setENTTYPE( String ENTTYPE)
	{
		this.ENTTYPE=doPreProcess2(convertCode(ENTTYPE));
	}

	public String getORGFORM()
	{
		return doPreProcess(ORGFORM);
	}

	public void setORGFORM( String ORGFORM)
	{
		this.ORGFORM=doPreProcess2(convertCode(ORGFORM));
	}

	public String getNAMEDISTRICT()
	{
		return doPreProcess(NAMEDISTRICT);
	}

	public void setNAMEDISTRICT( String NAMEDISTRICT)
	{
		this.NAMEDISTRICT=doPreProcess2(convertCode(NAMEDISTRICT));
	}

	public String getNAMEIND()
	{
		return doPreProcess(NAMEIND);
	}

	public void setNAMEIND( String NAMEIND)
	{
		this.NAMEIND=doPreProcess2(convertCode(NAMEIND));
	}

	public String getGRPSHFORM()
	{
		return doPreProcess(GRPSHFORM);
	}

	public void setGRPSHFORM( String GRPSHFORM)
	{
		this.GRPSHFORM=doPreProcess2(convertCode(GRPSHFORM));
	}

	public String getDOMDISTRICT()
	{
		return doPreProcess(DOMDISTRICT);
	}

	public void setDOMDISTRICT( String DOMDISTRICT)
	{
		this.DOMDISTRICT=doPreProcess2(convertCode(DOMDISTRICT));
	}

	public String getDOM()
	{
		return doPreProcess(DOM);
	}

	public void setDOM( String DOM)
	{
		this.DOM=doPreProcess2(convertCode(DOM));
	}

	public String getOPLOC()
	{
		return doPreProcess(OPLOC);
	}

	public void setOPLOC( String OPLOC)
	{
		this.OPLOC=doPreProcess2(convertCode(OPLOC));
	}

	public String getABUITEMCO()
	{
		return doPreProcess(ABUITEMCO);
	}

	public void setABUITEMCO( String ABUITEMCO)
	{
		this.ABUITEMCO=doPreProcess2(convertCode(ABUITEMCO));
	}

	public String getCBUITEM()
	{
		return doPreProcess(CBUITEM);
	}

	public void setCBUITEM( String CBUITEM)
	{
		this.CBUITEM=doPreProcess2(convertCode(CBUITEM));
	}

	public String getBUSSCOPE()
	{
		return doPreProcess(BUSSCOPE);
	}

	public void setBUSSCOPE( String BUSSCOPE)
	{
		this.BUSSCOPE=doPreProcess2(convertCode(BUSSCOPE));
	}

	public float getCONGRO()
	{
		return CONGRO;
	}

	public void setCONGRO( float CONGRO)
	{
		this.CONGRO=CONGRO ;
	}

	public String getCONGROCUR()
	{
		return doPreProcess(CONGROCUR);
	}

	public void setCONGROCUR( String CONGROCUR)
	{
		this.CONGROCUR=doPreProcess2(convertCode(CONGROCUR));
	}

	public float getCONGROUSD()
	{
		return CONGROUSD;
	}

	public void setCONGROUSD( float CONGROUSD)
	{
		this.CONGROUSD=CONGROUSD ;
	}

	public float getFORSUBCONAMUSD()
	{
		return FORSUBCONAMUSD;
	}

	public void setFORSUBCONAMUSD( float FORSUBCONAMUSD)
	{
		this.FORSUBCONAMUSD=FORSUBCONAMUSD ;
	}

	public double getREGCAP()
	{
		return REGCAP;
	}

	public void setREGCAP( double REGCAP)
	{
		this.REGCAP=REGCAP ;
	}

	public String getREGCAPCUR()
	{
		return doPreProcess(REGCAPCUR);
	}

	public void setREGCAPCUR( String REGCAPCUR)
	{
		this.REGCAPCUR=doPreProcess2(convertCode(REGCAPCUR));
	}

	public float getREGCAPUSD()
	{
		return REGCAPUSD;
	}

	public void setREGCAPUSD( float REGCAPUSD)
	{
		this.REGCAPUSD=REGCAPUSD ;
	}

	public int getNAMESTATUS()
	{
		return NAMESTATUS;
	}

	public void setNAMESTATUS( int NAMESTATUS)
	{
		this.NAMESTATUS=NAMESTATUS ;
	}

	public String getSAVEPERFROM()
	{
		return doPreProcess(SAVEPERFROM);
	}

	public void setSAVEPERFROM( String SAVEPERFROM)
	{
		this.SAVEPERFROM=doPreProcess2(convertCode(SAVEPERFROM));
	}

	public String getSAVEPERTO()
	{
		return doPreProcess(SAVEPERTO);
	}

	public void setSAVEPERTO( String SAVEPERTO)
	{
		this.SAVEPERTO=doPreProcess2(convertCode(SAVEPERTO));
	}

	public String getNAME()
	{
		return doPreProcess(NAME);
	}

	public void setNAME( String NAME)
	{
		this.NAME=doPreProcess2(convertCode(NAME));
	}

	public String getTEL()
	{
		return doPreProcess(TEL);
	}

	public void setTEL( String TEL)
	{
		this.TEL=doPreProcess2(convertCode(TEL));
	}

	public String getHKSIGN()
	{
		return doPreProcess(HKSIGN);
	}

	public void setHKSIGN( String HKSIGN)
	{
		this.HKSIGN=doPreProcess2(convertCode(HKSIGN));
	}

	public String getPREREGORG()
	{
		return doPreProcess(PREREGORG);
	}

	public void setPREREGORG( String PREREGORG)
	{
		this.PREREGORG=doPreProcess2(convertCode(PREREGORG));
	}

	public String getLOCALADM()
	{
		return doPreProcess(LOCALADM);
	}

	public void setLOCALADM( String LOCALADM)
	{
		this.LOCALADM=doPreProcess2(convertCode(LOCALADM));
	}

	public String getAPPRAUTH()
	{
		return doPreProcess(APPRAUTH);
	}

	public void setAPPRAUTH( String APPRAUTH)
	{
		this.APPRAUTH=doPreProcess2(convertCode(APPRAUTH));
	}

	public String getAPPRDATE()
	{
		return doPreProcess(APPRDATE);
	}

	public void setAPPRDATE( String APPRDATE)
	{
		this.APPRDATE=doPreProcess2(convertCode(APPRDATE));
	}

	public String getREMARK()
	{
		return doPreProcess(REMARK);
	}

	public void setREMARK( String REMARK)
	{
		this.REMARK=doPreProcess2(convertCode(REMARK));
	}

	public int getISENTNAMEALT()
	{
		return ISENTNAMEALT;
	}

	public void setISENTNAMEALT( int ISENTNAMEALT)
	{
		this.ISENTNAMEALT=ISENTNAMEALT ;
	}

	public String getENTNAMEBEALT()
	{
		return doPreProcess(ENTNAMEBEALT);
	}

	public void setENTNAMEBEALT( String ENTNAMEBEALT)
	{
		this.ENTNAMEBEALT=doPreProcess2(convertCode(ENTNAMEBEALT));
	}

	public String getCONTINENT()
	{
		return doPreProcess(CONTINENT);
	}

	public void setCONTINENT( String CONTINENT)
	{
		this.CONTINENT=doPreProcess2(convertCode(CONTINENT));
	}

	public String getCOUNTRY()
	{
		return doPreProcess(COUNTRY);
	}

	public void setCOUNTRY( String COUNTRY)
	{
		this.COUNTRY=doPreProcess2(convertCode(COUNTRY));
	}

	public String getINDUSTRYPHY()
	{
		return doPreProcess(INDUSTRYPHY);
	}

	public void setINDUSTRYPHY( String INDUSTRYPHY)
	{
		this.INDUSTRYPHY=doPreProcess2(convertCode(INDUSTRYPHY));
	}

	public String getINDUSTRYCO()
	{
		return doPreProcess(INDUSTRYCO);
	}

	public void setINDUSTRYCO( String INDUSTRYCO)
	{
		this.INDUSTRYCO=doPreProcess2(convertCode(INDUSTRYCO));
	}

	public String getOPSCOTYPE()
	{
		return doPreProcess(OPSCOTYPE);
	}

	public void setOPSCOTYPE( String OPSCOTYPE)
	{
		this.OPSCOTYPE=doPreProcess2(convertCode(OPSCOTYPE));
	}

	public String getS_EXT_TIMESTAMP()
	{
		return doPreProcess(S_EXT_TIMESTAMP);
	}

	public void setS_EXT_TIMESTAMP( String S_EXT_TIMESTAMP)
	{
		this.S_EXT_TIMESTAMP=doPreProcess2(convertCode(S_EXT_TIMESTAMP));
	}

	public String getAPPRNO()
	{
		return doPreProcess(APPRNO);
	}

	public void setAPPRNO( String APPRNO)
	{
		this.APPRNO=doPreProcess2(convertCode(APPRNO));
	}

	public String getISUSED()
	{
		return doPreProcess(ISUSED);
	}

	public void setISUSED( String ISUSED)
	{
		this.ISUSED=doPreProcess2(convertCode(ISUSED));
	}

	public String getPROVINCE()
	{
		return doPreProcess(PROVINCE);
	}

	public void setPROVINCE( String PROVINCE)
	{
		this.PROVINCE=doPreProcess2(convertCode(PROVINCE));
	}

	public String getCITY()
	{
		return doPreProcess(CITY);
	}

	public void setCITY( String CITY)
	{
		this.CITY=doPreProcess2(convertCode(CITY));
	}

	public String convertCode(String strvalue)
	{	return com.macrosoft.icms.system.SysUtility.convertCode( strvalue );	}

	public String doPreProcess( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess( sValue );	}

	public String doPreProcess2( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess2( sValue );	}

	public String doPreProcess3( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess3( sValue );	}
	//查地市库
	public void doSelectBySql(String sqlSelect) throws SQLException
	{
		
			GsDbConnection dbc=new GsDbConnection();
			ResultSet rsSelect;
			rsSelect=dbc.executeQuery(sqlSelect);
			if(rsSelect.next())
			{
				doSetData( rsSelect );
			}
			dbc.close();
	}
	//地市查省局库
	public void doSelectBySqlSJ(String sqlSelect) throws SQLException
	{
			//地市查省局库
			SJGsDbConnection dbc=new SJGsDbConnection();
			ResultSet rsSelect;
			rsSelect=dbc.executeQuery(sqlSelect);
			if(rsSelect.next())
			{
				doSetData( rsSelect );
			}
			dbc.close();
	}
	
	public void doSelect() throws SQLException
	{
		GsDbConnection dbc=new GsDbConnection();
		ResultSet rsSelect;
		String sqlSelect="SELECT * FROM MCGL_JBXX_ZS"+" WHERE NAMEID='"+doPreProcess(NAMEID)+"'";
		rsSelect=dbc.executeQuery(sqlSelect);
		if(rsSelect.next())
		{
			doSetData( rsSelect );
		}
		dbc.close();
	}

	public void doSetData( ResultSet rsSelect ) throws SQLException
	{
	COUNTY=rsSelect.getString("COUNTY");
	OPFYEARS=rsSelect.getInt("OPFYEARS");
	STREET=rsSelect.getString("STREET");
	ROAD=rsSelect.getString("ROAD");
	DOORPLATE=rsSelect.getString("DOORPLATE");
	NAMEID=rsSelect.getString("NAMEID");
	PRIPID=rsSelect.getString("PRIPID");
	NAMETYPE=rsSelect.getString("NAMETYPE");
	ENTTRA=rsSelect.getString("ENTTRA");
	TRADPINY=rsSelect.getString("TRADPINY");
	ENTNAME=rsSelect.getString("ENTNAME");
	ENTNAMESPELL=rsSelect.getString("ENTNAMESPELL");
	ENTCAT=rsSelect.getString("ENTCAT");
	ENTTYPE=rsSelect.getString("ENTTYPE");
	ORGFORM=rsSelect.getString("ORGFORM");
	NAMEDISTRICT=rsSelect.getString("NAMEDISTRICT");
	NAMEIND=rsSelect.getString("NAMEIND");
	GRPSHFORM=rsSelect.getString("GRPSHFORM");
	DOMDISTRICT=rsSelect.getString("DOMDISTRICT");
	DOM=rsSelect.getString("DOM");
	OPLOC=rsSelect.getString("OPLOC");
	ABUITEMCO=rsSelect.getString("ABUITEMCO");
	CBUITEM=rsSelect.getString("CBUITEM");
	BUSSCOPE=rsSelect.getString("BUSSCOPE");
	CONGRO=rsSelect.getFloat("CONGRO");
	CONGROCUR=rsSelect.getString("CONGROCUR");
	CONGROUSD=rsSelect.getFloat("CONGROUSD");
	FORSUBCONAMUSD=rsSelect.getFloat("FORSUBCONAMUSD");
	REGCAP=rsSelect.getDouble("REGCAP");
	REGCAPCUR=rsSelect.getString("REGCAPCUR");
	REGCAPUSD=rsSelect.getFloat("REGCAPUSD");
	NAMESTATUS=rsSelect.getInt("NAMESTATUS");
	SAVEPERFROM=String.valueOf(rsSelect.getDate("SAVEPERFROM"));
	SAVEPERTO=String.valueOf(rsSelect.getDate("SAVEPERTO"));
	NAME=rsSelect.getString("NAME");
	TEL=rsSelect.getString("TEL");
	HKSIGN=rsSelect.getString("HKSIGN");
	PREREGORG=rsSelect.getString("PREREGORG");
	LOCALADM=rsSelect.getString("LOCALADM");
	APPRAUTH=rsSelect.getString("APPRAUTH");
	APPRDATE=String.valueOf(rsSelect.getDate("APPRDATE"));
	REMARK=rsSelect.getString("REMARK");
	ISENTNAMEALT=rsSelect.getInt("ISENTNAMEALT");
	ENTNAMEBEALT=rsSelect.getString("ENTNAMEBEALT");
	CONTINENT=rsSelect.getString("CONTINENT");
	COUNTRY=rsSelect.getString("COUNTRY");
	INDUSTRYPHY=rsSelect.getString("INDUSTRYPHY");
	INDUSTRYCO=rsSelect.getString("INDUSTRYCO");
	OPSCOTYPE=rsSelect.getString("OPSCOTYPE");
	S_EXT_TIMESTAMP=rsSelect.getString("S_EXT_TIMESTAMP");
	APPRNO=rsSelect.getString("APPRNO");
	ISUSED=rsSelect.getString("ISUSED");
	PROVINCE=rsSelect.getString("PROVINCE");
	CITY=rsSelect.getString("CITY");
	}

	public boolean doAdd() throws SQLException
	{
		GsDbConnection dbc=new GsDbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd="INSERT INTO MCGL_JBXX_ZS(COUNTY,OPFYEARS,STREET,ROAD,DOORPLATE,NAMEID,PRIPID,NAMETYPE,ENTTRA,TRADPINY,ENTNAME,ENTNAMESPELL,ENTCAT,ENTTYPE,ORGFORM,NAMEDISTRICT,NAMEIND,GRPSHFORM,DOMDISTRICT,DOM,OPLOC,ABUITEMCO,CBUITEM,BUSSCOPE,CONGRO,CONGROCUR,CONGROUSD,FORSUBCONAMUSD,REGCAP,REGCAPCUR,REGCAPUSD,NAMESTATUS,SAVEPERFROM,SAVEPERTO,NAME,TEL,HKSIGN,PREREGORG,LOCALADM,APPRAUTH,APPRDATE,REMARK,ISENTNAMEALT,ENTNAMEBEALT,CONTINENT,COUNTRY,INDUSTRYPHY,INDUSTRYCO,OPSCOTYPE,S_EXT_TIMESTAMP,APPRNO,ISUSED,PROVINCE,CITY) VALUES("+ doPreProcess3(COUNTY)+","+OPFYEARS+","+ doPreProcess3(STREET)+","+ doPreProcess3(ROAD)+","+ doPreProcess3(DOORPLATE)+","+ doPreProcess3(NAMEID)+","+ doPreProcess3(PRIPID)+","+ doPreProcess3(NAMETYPE)+","+ doPreProcess3(ENTTRA)+","+ doPreProcess3(TRADPINY)+","+ doPreProcess3(ENTNAME)+","+ doPreProcess3(ENTNAMESPELL)+","+ doPreProcess3(ENTCAT)+","+ doPreProcess3(ENTTYPE)+","+ doPreProcess3(ORGFORM)+","+ doPreProcess3(NAMEDISTRICT)+","+ doPreProcess3(NAMEIND)+","+ doPreProcess3(GRPSHFORM)+","+ doPreProcess3(DOMDISTRICT)+","+ doPreProcess3(DOM)+","+ doPreProcess3(OPLOC)+","+ doPreProcess3(ABUITEMCO)+","+ doPreProcess3(CBUITEM)+","+ doPreProcess3(BUSSCOPE)+","+CONGRO+","+ doPreProcess3(CONGROCUR)+","+CONGROUSD+","+FORSUBCONAMUSD+","+REGCAP+","+ doPreProcess3(REGCAPCUR)+","+REGCAPUSD+","+NAMESTATUS+",to_date("+doPreProcess3(SAVEPERFROM)+",'yyyy-mm-dd'),to_date("+doPreProcess3(SAVEPERTO)+",'yyyy-mm-dd'),"+ doPreProcess3(NAME)+","+ doPreProcess3(TEL)+","+ doPreProcess3(HKSIGN)+","+ doPreProcess3(PREREGORG)+","+ doPreProcess3(LOCALADM)+","+ doPreProcess3(APPRAUTH)+",to_date("+doPreProcess3(APPRDATE)+",'yyyy-mm-dd'),"+ doPreProcess3(REMARK)+","+ISENTNAMEALT+","+ doPreProcess3(ENTNAMEBEALT)+","+ doPreProcess3(CONTINENT)+","+ doPreProcess3(COUNTRY)+","+ doPreProcess3(INDUSTRYPHY)+","+ doPreProcess3(INDUSTRYCO)+","+ doPreProcess3(OPSCOTYPE)+","+ doPreProcess3(S_EXT_TIMESTAMP)+","+ doPreProcess3(APPRNO)+","+ doPreProcess3(ISUSED)+","+ doPreProcess3(PROVINCE)+","+ doPreProcess3(CITY)+")";
		{							
			nRowCount=dbc.executeUpdate( sqlAdd );
			dbc.close();
			if (nRowCount>0)	//插入成功
				return true;
			else
				return false;
		}
	}

	public boolean doCount() throws SQLException
	{
		GsDbConnection dbc=new GsDbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlCount="SELECT COUNT(*) FROM MCGL_JBXX_ZS"+" WHERE NAMEID='"+doPreProcess(NAMEID)+"'";
		rsCount=dbc.executeQuery( sqlCount );
		rsCount.next();
		nRowCount=rsCount.getInt( 1 );

		dbc.close();
		if (nRowCount>0)
		{
			return true;
		}
		else
			return false;
	}

	public boolean doModify() throws SQLException
	{
		GsDbConnection dbc=new GsDbConnection();
		String sqlModify="UPDATE MCGL_JBXX_ZS SET COUNTY="+ doPreProcess3(COUNTY)+",OPFYEARS="+OPFYEARS+",STREET="+ doPreProcess3(STREET)+",ROAD="+ doPreProcess3(ROAD)+",DOORPLATE="+ doPreProcess3(DOORPLATE)+",NAMEID="+ doPreProcess3(NAMEID)+",PRIPID="+ doPreProcess3(PRIPID)+",NAMETYPE="+ doPreProcess3(NAMETYPE)+",ENTTRA="+ doPreProcess3(ENTTRA)+",TRADPINY="+ doPreProcess3(TRADPINY)+",ENTNAME="+ doPreProcess3(ENTNAME)+",ENTNAMESPELL="+ doPreProcess3(ENTNAMESPELL)+",ENTCAT="+ doPreProcess3(ENTCAT)+",ENTTYPE="+ doPreProcess3(ENTTYPE)+",ORGFORM="+ doPreProcess3(ORGFORM)+",NAMEDISTRICT="+ doPreProcess3(NAMEDISTRICT)+",NAMEIND="+ doPreProcess3(NAMEIND)+",GRPSHFORM="+ doPreProcess3(GRPSHFORM)+",DOMDISTRICT="+ doPreProcess3(DOMDISTRICT)+",DOM="+ doPreProcess3(DOM)+",OPLOC="+ doPreProcess3(OPLOC)+",ABUITEMCO="+ doPreProcess3(ABUITEMCO)+",CBUITEM="+ doPreProcess3(CBUITEM)+",BUSSCOPE="+ doPreProcess3(BUSSCOPE)+",CONGRO="+CONGRO+",CONGROCUR="+ doPreProcess3(CONGROCUR)+",CONGROUSD="+CONGROUSD+",FORSUBCONAMUSD="+FORSUBCONAMUSD+",REGCAP="+REGCAP+",REGCAPCUR="+ doPreProcess3(REGCAPCUR)+",REGCAPUSD="+REGCAPUSD+",NAMESTATUS="+NAMESTATUS+",SAVEPERFROM=to_date("+doPreProcess3(SAVEPERFROM)+",'yyyy-mm-dd'),SAVEPERTO=to_date("+doPreProcess3(SAVEPERTO)+",'yyyy-mm-dd'),NAME="+ doPreProcess3(NAME)+",TEL="+ doPreProcess3(TEL)+",HKSIGN="+ doPreProcess3(HKSIGN)+",PREREGORG="+ doPreProcess3(PREREGORG)+",LOCALADM="+ doPreProcess3(LOCALADM)+",APPRAUTH="+ doPreProcess3(APPRAUTH)+",APPRDATE=to_date("+doPreProcess3(APPRDATE)+",'yyyy-mm-dd'),REMARK="+ doPreProcess3(REMARK)+",ISENTNAMEALT="+ISENTNAMEALT+",ENTNAMEBEALT="+ doPreProcess3(ENTNAMEBEALT)+",CONTINENT="+ doPreProcess3(CONTINENT)+",COUNTRY="+ doPreProcess3(COUNTRY)+",INDUSTRYPHY="+ doPreProcess3(INDUSTRYPHY)+",INDUSTRYCO="+ doPreProcess3(INDUSTRYCO)+",OPSCOTYPE="+ doPreProcess3(OPSCOTYPE)+",S_EXT_TIMESTAMP="+ doPreProcess3(S_EXT_TIMESTAMP)+",APPRNO="+ doPreProcess3(APPRNO)+",ISUSED="+ doPreProcess3(ISUSED)+",PROVINCE="+ doPreProcess3(PROVINCE)+",CITY="+ doPreProcess3(CITY)+""+" WHERE NAMEID='"+doPreProcess(NAMEID)+"'";
		int nRowCount=dbc.executeUpdate( sqlModify );
		dbc.close();
		if (nRowCount>0)	//修改成功
		{
			return true;
		}
		else
			return false;
	}

	public boolean doDelete() throws SQLException
	{
		GsDbConnection dbc=new GsDbConnection();
		String sqlDelete="DELETE FROM MCGL_JBXX_ZS"+" WHERE NAMEID='"+doPreProcess(NAMEID)+"'";
		int nRowCount=dbc.executeUpdate( sqlDelete );
		dbc.close();
		if (nRowCount>0)
		{
			return true;
		}
		else
			return false;
	}

	public int getListCount(String sqlWhere ) throws SQLException
	{
		GsDbConnection dbc=new GsDbConnection();
		String sqlCount="SELECT COUNT(*) FROM MCGL_JBXX_ZS";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlCount+=sqlWhere;}
			else {
				sqlCount+=" WHERE "+sqlWhere;}
		}
		ResultSet rsCount=dbc.executeQuery( sqlCount );
		rsCount.next();
		int nRowCount=rsCount.getInt( 1 );
		dbc.close();
		return nRowCount;

	}

	public ArrayList getList( String sqlWhere ) throws SQLException
	{
		GsDbConnection dbc=new GsDbConnection();
		ArrayList al= new ArrayList();
		String sqlList="SELECT * FROM MCGL_JBXX_ZS";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			MCGL_JBXX_ZS bTable=new MCGL_JBXX_ZS();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}

	public Iterator getItList( String sqlWhere,String startRow ) throws SQLException
	{
		if (SysUtility.isNumeric(startRow))		
			return getList(sqlWhere,Integer.parseInt(startRow)).iterator();
		else		
			return getList(sqlWhere,0).iterator();
	}
	public ArrayList getList( String sqlWhere,String startRow ) throws SQLException
	{
		if (SysUtility.isNumeric(startRow))		
			return getList( sqlWhere,Integer.parseInt(startRow),10);
		else		
			return getList( sqlWhere,0,10);
	}
	public ArrayList getList( String sqlWhere,String startRow,int PageSize ) throws SQLException
	{
		if (SysUtility.isNumeric(startRow))		
			return getList( sqlWhere,Integer.parseInt(startRow),PageSize);
		else		
			return getList( sqlWhere,0,PageSize);
	}
	public ArrayList getList( String sqlWhere,int startRow ) throws SQLException
	{
			return getList( sqlWhere,startRow,10);
	}
	////////reload function getlist
	public ArrayList getList( String sqlWhere,int startRow,int PageSize) throws SQLException
	{
		GsDbConnection dbc=new GsDbConnection();
		ArrayList al= new ArrayList();
		String sqlList="SELECT * FROM MCGL_JBXX_ZS";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		sqlList+=" AND ROWNUM<="+(startRow+PageSize);//start+pagesize 
		ResultSet rsList=dbc.executeQuery( sqlList);
		//过掉所有已经显示的列
		int	nDispRows=0;
		do
		{
			nDispRows++;
			if (nDispRows>startRow)	break;
		}
		while (rsList.next());
		while(rsList.next()) {
			MCGL_JBXX_ZS bTable=new MCGL_JBXX_ZS();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException
	{
		GsDbConnection dbc=new GsDbConnection();
		String sqlArr="SELECT * FROM MCGL_JBXX_ZS"+" WHERE NAMEID='"+doPreProcess(NAMEID)+"'";
		ResultSet rsArr=dbc.executeQuery(sqlArr);
		ArrayList al= new ArrayList();
		String[] ay = null;
		if (rsArr.next()){	
			doSetData( rsArr );
			ResultSetMetaData rsmd = rsArr.getMetaData();
			for (int k=1;k<=rsmd.getColumnCount(); k++)	{
				ay = new String[2];
				ay[0]=rsmd.getColumnName(k);
				if (rsmd.getColumnTypeName(k).equalsIgnoreCase("DATETIME")||rsmd.getColumnTypeName(k).equalsIgnoreCase("DATE"))
					ay[1]=String.valueOf(rsArr.getDate(ay[0]));
				else
					ay[1]=String.valueOf(rsArr.getObject(ay[0]));
				if (!ay[1].trim().equals("null")&&!ay[1].trim().equals(""))
					{ay[1]=SysUtility.pre(ay[1]); al.add(ay);}
			}
		}
		dbc.close();
		return al;

	}
}
