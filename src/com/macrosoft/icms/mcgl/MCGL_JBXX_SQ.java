package com.macrosoft.icms.mcgl;
import java.sql.*;
import java.util.*;
import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.*;
import com.macrosoft.icms.system.*;
public class MCGL_JBXX_SQ
{
	String OPETYPE;
	String OPENO;
	String PRIPID;
	//不操作
	String NAMEID;
	String ENTNAME;
	String ENTNAMEPINY;
	String SPANAME1;
	String SPANAME2;
	String SPANAME3;
	String SPANAME4;
	String NAMETYPE;
	String ENTTRA;
	String TRADPINY;
	String SAVEPERFROM;
	String SAVEPERTO;
	String ENTCLASS;
	String ENTTYPE;
	String DOM;
	String DOMDISTRICT;
	String INDUSTRYPHY;
	String INDUSTRYCO;
	String ABUITEMCO;
	String CBUITEM;
	String BUSSCOPE;
	double CONGRO;
	String CONGROCUR;
	double CONGROUSD;
	double REGCAP;
	String REGCAPCUR;
	double REGCAPUSD;
	String PREREGORG;
	String LOCALADM;
	String CONTINENT;
	String COUNTRY;
	String ACCDEPT;
	String ACCDATE;
	String APPRAUTH;
	String APPRDATE;
	int ISENTNAMEALT;
	String ENTNAMEBEALT;
	String LOGINID;
	String NAMESTATUS;
	String APDATE;
	String REMARK;
	String TRADPINY1;
	String TRADPINY2;
	String TRADPINY3;
	String ENTNAME1;
	String ENTNAME2;
	String ENTNAME3;
	String NAMEIND;
	String APPRNO;
	String TRAMARK;
	String OWNERNAME;
	String OWNERTEL;
	String PLAYTIMELIMIT;
	String TRADPINY4;
	String ENTNAME4;
	String PROVINCE;
	String CITY;
	String COUNTY;
	String S_EXT_TIMESTAMP;
	String TOWN;
	String VILLAGE;
	String HOUSENUMBER;
	String SPANAME;
	String OPDATETO;
	String CERNO;
	
	public String getCERNO() {
		return doPreProcess(CERNO);
	}

	public void setCERNO(String CERNO) {
		this.CERNO=doPreProcess2(convertCode(CERNO));
	}

	public String getNAMEID()
	{
		return doPreProcess(NAMEID);
	}

	public void setNAMEID( String NAMEID)
	{
		this.NAMEID=doPreProcess2(NAMEID);
	}
	
	public String getOPDATETO()
	{
		return doPreProcess(OPDATETO);
	}

	public void setOPDATETO( String OPDATETO)
	{
		this.OPDATETO=doPreProcess2(convertCode(OPDATETO));
	}
	
	public String getOPETYPE()
	{
		return doPreProcess(OPETYPE);
	}

	public void setOPETYPE( String OPETYPE)
	{
		this.OPETYPE=doPreProcess2(convertCode(OPETYPE));
	}

	public String getOPENO()
	{
		return doPreProcess(OPENO);
	}

	public void setOPENO( String OPENO)
	{
		this.OPENO=doPreProcess2(convertCode(OPENO));
	}

	public String getPRIPID()
	{
		return doPreProcess(PRIPID);
	}

	public void setPRIPID( String PRIPID)
	{
		this.PRIPID=doPreProcess2(convertCode(PRIPID));
	}

	public String getENTNAME()
	{
		return doPreProcess(ENTNAME);
	}

	public void setENTNAME( String ENTNAME)
	{
		this.ENTNAME=doPreProcess2(convertCode(ENTNAME));
	}

	public String getENTNAMEPINY()
	{
		return doPreProcess(ENTNAMEPINY);
	}

	public void setENTNAMEPINY( String ENTNAMEPINY)
	{
		this.ENTNAMEPINY=doPreProcess2(convertCode(ENTNAMEPINY));
	}

	public String getSPANAME1()
	{
		return doPreProcess(SPANAME1);
	}

	public void setSPANAME1( String SPANAME1)
	{
		this.SPANAME1=doPreProcess2(convertCode(SPANAME1));
	}

	public String getSPANAME2()
	{
		return doPreProcess(SPANAME2);
	}

	public void setSPANAME2( String SPANAME2)
	{
		this.SPANAME2=doPreProcess2(convertCode(SPANAME2));
	}

	public String getSPANAME3()
	{
		return doPreProcess(SPANAME3);
	}

	public void setSPANAME3( String SPANAME3)
	{
		this.SPANAME3=doPreProcess2(convertCode(SPANAME3));
	}

	public String getSPANAME4()
	{
		return doPreProcess(SPANAME4);
	}

	public void setSPANAME4( String SPANAME4)
	{
		this.SPANAME4=doPreProcess2(convertCode(SPANAME4));
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

	public String getENTCLASS()
	{
		return doPreProcess(ENTCLASS);
	}

	public void setENTCLASS( String ENTCLASS)
	{
		this.ENTCLASS=doPreProcess2(convertCode(ENTCLASS));
	}

	public String getENTTYPE()
	{
		return doPreProcess(ENTTYPE);
	}

	public void setENTTYPE( String ENTTYPE)
	{
		this.ENTTYPE=doPreProcess2(convertCode(ENTTYPE));
	}

	public String getDOM()
	{
		return doPreProcess(DOM);
	}

	public void setDOM( String DOM)
	{
		this.DOM=doPreProcess2(convertCode(DOM));
	}

	public String getDOMDISTRICT()
	{
		return doPreProcess(DOMDISTRICT);
	}

	public void setDOMDISTRICT( String DOMDISTRICT)
	{
		this.DOMDISTRICT=doPreProcess2(convertCode(DOMDISTRICT));
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

	public double getCONGRO()
	{
		return CONGRO;
	}

	public void setCONGRO( double CONGRO)
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

	public double getCONGROUSD()
	{
		return CONGROUSD;
	}

	public void setCONGROUSD( double CONGROUSD)
	{
		this.CONGROUSD=CONGROUSD ;
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

	public double getREGCAPUSD()
	{
		return REGCAPUSD;
	}

	public void setREGCAPUSD( double REGCAPUSD)
	{
		this.REGCAPUSD=REGCAPUSD ;
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

	public String getACCDEPT()
	{
		return doPreProcess(ACCDEPT);
	}

	public void setACCDEPT( String ACCDEPT)
	{
		this.ACCDEPT=doPreProcess2(convertCode(ACCDEPT));
	}

	public String getACCDATE()
	{
		return doPreProcess(ACCDATE);
	}

	public void setACCDATE( String ACCDATE)
	{
		this.ACCDATE=doPreProcess2(convertCode(ACCDATE));
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

	public String getLOGINID()
	{
		return doPreProcess(LOGINID);
	}

	public void setLOGINID( String LOGINID)
	{
		this.LOGINID=doPreProcess2(convertCode(LOGINID));
	}

	public String getNAMESTATUS()
	{
		return doPreProcess(NAMESTATUS);
	}

	public void setNAMESTATUS( String NAMESTATUS)
	{
		this.NAMESTATUS=doPreProcess2(convertCode(NAMESTATUS));
	}

	public String getAPDATE()
	{
		return doPreProcess(APDATE);
	}

	public void setAPDATE( String APDATE)
	{
		this.APDATE=doPreProcess2(convertCode(APDATE));
	}

	public String getREMARK()
	{
		return doPreProcess(REMARK);
	}

	public void setREMARK( String REMARK)
	{
		this.REMARK=doPreProcess2(convertCode(REMARK));
	}

	public String getTRADPINY1()
	{
		return doPreProcess(TRADPINY1);
	}

	public void setTRADPINY1( String TRADPINY1)
	{
		this.TRADPINY1=doPreProcess2(convertCode(TRADPINY1));
	}

	public String getTRADPINY2()
	{
		return doPreProcess(TRADPINY2);
	}

	public void setTRADPINY2( String TRADPINY2)
	{
		this.TRADPINY2=doPreProcess2(convertCode(TRADPINY2));
	}

	public String getTRADPINY3()
	{
		return doPreProcess(TRADPINY3);
	}

	public void setTRADPINY3( String TRADPINY3)
	{
		this.TRADPINY3=doPreProcess2(convertCode(TRADPINY3));
	}

	public String getENTNAME1()
	{
		return doPreProcess(ENTNAME1);
	}

	public void setENTNAME1( String ENTNAME1)
	{
		this.ENTNAME1=doPreProcess2(convertCode(ENTNAME1));
	}

	public String getENTNAME2()
	{
		return doPreProcess(ENTNAME2);
	}

	public void setENTNAME2( String ENTNAME2)
	{
		this.ENTNAME2=doPreProcess2(convertCode(ENTNAME2));
	}

	public String getENTNAME3()
	{
		return doPreProcess(ENTNAME3);
	}

	public void setENTNAME3( String ENTNAME3)
	{
		this.ENTNAME3=doPreProcess2(convertCode(ENTNAME3));
	}

	public String getNAMEIND()
	{
		return doPreProcess(NAMEIND);
	}

	public void setNAMEIND( String NAMEIND)
	{
		this.NAMEIND=doPreProcess2(convertCode(NAMEIND));
	}

	public String getAPPRNO()
	{
		return doPreProcess(APPRNO);
	}

	public void setAPPRNO( String APPRNO)
	{
		this.APPRNO=doPreProcess2(convertCode(APPRNO));
	}

	public String getTRAMARK()
	{
		return doPreProcess(TRAMARK);
	}

	public void setTRAMARK( String TRAMARK)
	{
		this.TRAMARK=doPreProcess2(convertCode(TRAMARK));
	}

	public String getOWNERNAME()
	{
		return doPreProcess(OWNERNAME);
	}

	public void setOWNERNAME( String OWNERNAME)
	{
		this.OWNERNAME=doPreProcess2(convertCode(OWNERNAME));
	}

	public String getOWNERTEL()
	{
		return doPreProcess(OWNERTEL);
	}

	public void setOWNERTEL( String OWNERTEL)
	{
		this.OWNERTEL=doPreProcess2(convertCode(OWNERTEL));
	}

	public String getPLAYTIMELIMIT()
	{
		return doPreProcess(PLAYTIMELIMIT);
	}

	public void setPLAYTIMELIMIT( String PLAYTIMELIMIT)
	{
		this.PLAYTIMELIMIT=doPreProcess2(convertCode(PLAYTIMELIMIT));
	}

	public String getTRADPINY4()
	{
		return doPreProcess(TRADPINY4);
	}

	public void setTRADPINY4( String TRADPINY4)
	{
		this.TRADPINY4=doPreProcess2(convertCode(TRADPINY4));
	}

	public String getENTNAME4()
	{
		return doPreProcess(ENTNAME4);
	}

	public void setENTNAME4( String ENTNAME4)
	{
		this.ENTNAME4=doPreProcess2(convertCode(ENTNAME4));
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

	public String getCOUNTY()
	{
		return doPreProcess(COUNTY);
	}

	public void setCOUNTY( String COUNTY)
	{
		this.COUNTY=doPreProcess2(convertCode(COUNTY));
	}

	public String getS_EXT_TIMESTAMP()
	{
		return doPreProcess(S_EXT_TIMESTAMP);
	}

	public void setS_EXT_TIMESTAMP( String S_EXT_TIMESTAMP)
	{
		this.S_EXT_TIMESTAMP=doPreProcess2(convertCode(S_EXT_TIMESTAMP));
	}

	public String getTOWN()
	{
		return doPreProcess(TOWN);
	}

	public void setTOWN( String TOWN)
	{
		this.TOWN=doPreProcess2(convertCode(TOWN));
	}

	public String getVILLAGE()
	{
		return doPreProcess(VILLAGE);
	}

	public void setVILLAGE( String VILLAGE)
	{
		this.VILLAGE=doPreProcess2(convertCode(VILLAGE));
	}

	public String getHOUSENUMBER()
	{
		return doPreProcess(HOUSENUMBER);
	}

	public void setHOUSENUMBER( String HOUSENUMBER)
	{
		this.HOUSENUMBER=doPreProcess2(convertCode(HOUSENUMBER));
	}

	public String getSPANAME()
	{
		return doPreProcess(SPANAME);
	}

	public void setSPANAME( String SPANAME)
	{
		this.SPANAME=doPreProcess2(convertCode(SPANAME));
	}

	public String convertCode(String strvalue)
	{	return com.macrosoft.icms.system.SysUtility.convertCode( strvalue );	}

	public String doPreProcess( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess( sValue );	}

	public String doPreProcess2( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess2( sValue );	}

	public String doPreProcess3( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess3( sValue );	}

	public void doSelect() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsSelect;
		String sqlSelect="SELECT * FROM MCGL_JBXX_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
		rsSelect=dbc.executeQuery(sqlSelect);
		if(rsSelect.next())
		{
			doSetData( rsSelect );
		}
		dbc.close();
	}

	public void doSetData( ResultSet rsSelect ) throws SQLException
	{
	NAMEID=rsSelect.getString("NAMEID");
	CERNO=rsSelect.getString("CERNO");
	OPETYPE=rsSelect.getString("OPETYPE");
	OPENO=rsSelect.getString("OPENO");
	PRIPID=rsSelect.getString("PRIPID");
	ENTNAME=rsSelect.getString("ENTNAME");
	ENTNAMEPINY=rsSelect.getString("ENTNAMEPINY");
	SPANAME1=rsSelect.getString("SPANAME1");
	SPANAME2=rsSelect.getString("SPANAME2");
	SPANAME3=rsSelect.getString("SPANAME3");
	SPANAME4=rsSelect.getString("SPANAME4");
	NAMETYPE=rsSelect.getString("NAMETYPE");
	ENTTRA=rsSelect.getString("ENTTRA");
	TRADPINY=rsSelect.getString("TRADPINY");
	SAVEPERFROM=String.valueOf(rsSelect.getDate("SAVEPERFROM"));
	SAVEPERTO=String.valueOf(rsSelect.getDate("SAVEPERTO"));
	ENTCLASS=rsSelect.getString("ENTCLASS");
	ENTTYPE=rsSelect.getString("ENTTYPE");
	DOM=rsSelect.getString("DOM");
	DOMDISTRICT=rsSelect.getString("DOMDISTRICT");
	INDUSTRYPHY=rsSelect.getString("INDUSTRYPHY");
	INDUSTRYCO=rsSelect.getString("INDUSTRYCO");
	ABUITEMCO=rsSelect.getString("ABUITEMCO");
	CBUITEM=rsSelect.getString("CBUITEM");
	BUSSCOPE=rsSelect.getString("BUSSCOPE");
	CONGRO=rsSelect.getDouble("CONGRO");
	CONGROCUR=rsSelect.getString("CONGROCUR");
	CONGROUSD=rsSelect.getDouble("CONGROUSD");
	REGCAP=rsSelect.getDouble("REGCAP");
	REGCAPCUR=rsSelect.getString("REGCAPCUR");
	REGCAPUSD=rsSelect.getDouble("REGCAPUSD");
	PREREGORG=rsSelect.getString("PREREGORG");
	LOCALADM=rsSelect.getString("LOCALADM");
	CONTINENT=rsSelect.getString("CONTINENT");
	COUNTRY=rsSelect.getString("COUNTRY");
	ACCDEPT=rsSelect.getString("ACCDEPT");
	ACCDATE=String.valueOf(rsSelect.getDate("ACCDATE"));
	APPRAUTH=rsSelect.getString("APPRAUTH");
	APPRDATE=String.valueOf(rsSelect.getDate("APPRDATE"));
	ISENTNAMEALT=rsSelect.getInt("ISENTNAMEALT");
	ENTNAMEBEALT=rsSelect.getString("ENTNAMEBEALT");
	LOGINID=rsSelect.getString("LOGINID");
	NAMESTATUS=rsSelect.getString("NAMESTATUS");
	APDATE=String.valueOf(rsSelect.getDate("APDATE"));
	REMARK=rsSelect.getString("REMARK");
	TRADPINY1=rsSelect.getString("TRADPINY1");
	TRADPINY2=rsSelect.getString("TRADPINY2");
	TRADPINY3=rsSelect.getString("TRADPINY3");
	ENTNAME1=rsSelect.getString("ENTNAME1");
	ENTNAME2=rsSelect.getString("ENTNAME2");
	ENTNAME3=rsSelect.getString("ENTNAME3");
	NAMEIND=rsSelect.getString("NAMEIND");
	APPRNO=rsSelect.getString("APPRNO");
	TRAMARK=rsSelect.getString("TRAMARK");
	OWNERNAME=rsSelect.getString("OWNERNAME");
	OWNERTEL=rsSelect.getString("OWNERTEL");
	PLAYTIMELIMIT=String.valueOf(rsSelect.getDate("PLAYTIMELIMIT"));
	TRADPINY4=rsSelect.getString("TRADPINY4");
	ENTNAME4=rsSelect.getString("ENTNAME4");
	PROVINCE=rsSelect.getString("PROVINCE");
	CITY=rsSelect.getString("CITY");
	COUNTY=rsSelect.getString("COUNTY");
	S_EXT_TIMESTAMP=rsSelect.getString("S_EXT_TIMESTAMP");
	TOWN=rsSelect.getString("TOWN");
	VILLAGE=rsSelect.getString("VILLAGE");
	HOUSENUMBER=rsSelect.getString("HOUSENUMBER");
	SPANAME=rsSelect.getString("SPANAME");
	OPDATETO=rsSelect.getString("OPDATETO");
	}

	public boolean doAdd() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd="INSERT INTO MCGL_JBXX_SQ(OPDATETO,OPETYPE,OPENO,PRIPID,ENTNAME,ENTNAMEPINY,SPANAME1,SPANAME2,SPANAME3,SPANAME4,NAMETYPE,ENTTRA,TRADPINY,SAVEPERFROM,SAVEPERTO,ENTCLASS,ENTTYPE,DOM,DOMDISTRICT,INDUSTRYPHY,INDUSTRYCO,ABUITEMCO,CBUITEM,BUSSCOPE,CONGRO,CONGROCUR,CONGROUSD,REGCAP,REGCAPCUR,REGCAPUSD,PREREGORG,LOCALADM,CONTINENT,COUNTRY,ACCDEPT,ACCDATE,APPRAUTH,APPRDATE,ISENTNAMEALT,ENTNAMEBEALT,LOGINID,NAMESTATUS,APDATE,REMARK,TRADPINY1,TRADPINY2,TRADPINY3,ENTNAME1,ENTNAME2,ENTNAME3,NAMEIND,APPRNO,TRAMARK,OWNERNAME,OWNERTEL,PLAYTIMELIMIT,TRADPINY4,ENTNAME4,PROVINCE,CITY,COUNTY,S_EXT_TIMESTAMP,TOWN,VILLAGE,HOUSENUMBER,SPANAME,CERNO) VALUES("+doPreProcess3(OPDATETO)+","+ doPreProcess3(OPETYPE)+","+ doPreProcess3(OPENO)+","+ doPreProcess3(PRIPID)+","+ doPreProcess3(ENTNAME)+","+ doPreProcess3(ENTNAMEPINY)+","+ doPreProcess3(SPANAME1)+","+ doPreProcess3(SPANAME2)+","+ doPreProcess3(SPANAME3)+","+ doPreProcess3(SPANAME4)+","+ doPreProcess3(NAMETYPE)+","+ doPreProcess3(ENTTRA)+","+ doPreProcess3(TRADPINY)+",to_date("+doPreProcess3(SAVEPERFROM)+",'yyyy-mm-dd'),to_date("+doPreProcess3(SAVEPERTO)+",'yyyy-mm-dd'),"+ doPreProcess3(ENTCLASS)+","+ doPreProcess3(ENTTYPE)+","+ doPreProcess3(DOM)+","+ doPreProcess3(DOMDISTRICT)+","+ doPreProcess3(INDUSTRYPHY)+","+ doPreProcess3(INDUSTRYCO)+","+ doPreProcess3(ABUITEMCO)+","+ doPreProcess3(CBUITEM)+","+ doPreProcess3(BUSSCOPE)+","+CONGRO+","+ doPreProcess3(CONGROCUR)+","+CONGROUSD+","+REGCAP+","+ doPreProcess3(REGCAPCUR)+","+REGCAPUSD+","+ doPreProcess3(PREREGORG)+","+ doPreProcess3(LOCALADM)+","+ doPreProcess3(CONTINENT)+","+ doPreProcess3(COUNTRY)+","+ doPreProcess3(ACCDEPT)+",to_date("+doPreProcess3(ACCDATE)+",'yyyy-mm-dd'),"+ doPreProcess3(APPRAUTH)+",to_date("+doPreProcess3(APPRDATE)+",'yyyy-mm-dd'),"+ISENTNAMEALT+","+ doPreProcess3(ENTNAMEBEALT)+","+ doPreProcess3(LOGINID)+","+ doPreProcess3(NAMESTATUS)+",to_date("+doPreProcess3(APDATE)+",'yyyy-mm-dd'),"+ doPreProcess3(REMARK)+","+ doPreProcess3(TRADPINY1)+","+ doPreProcess3(TRADPINY2)+","+ doPreProcess3(TRADPINY3)+","+ doPreProcess3(ENTNAME1)+","+ doPreProcess3(ENTNAME2)+","+ doPreProcess3(ENTNAME3)+","+ doPreProcess3(NAMEIND)+","+ doPreProcess3(APPRNO)+","+ doPreProcess3(TRAMARK)+","+ doPreProcess3(OWNERNAME)+","+ doPreProcess3(OWNERTEL)+",to_date("+doPreProcess3(PLAYTIMELIMIT)+",'yyyy-mm-dd'),"+ doPreProcess3(TRADPINY4)+","+ doPreProcess3(ENTNAME4)+","+ doPreProcess3(PROVINCE)+","+ doPreProcess3(CITY)+","+ doPreProcess3(COUNTY)+","+ doPreProcess3(S_EXT_TIMESTAMP)+","+ doPreProcess3(TOWN)+","+ doPreProcess3(VILLAGE)+","+ doPreProcess3(HOUSENUMBER)+","+ doPreProcess3(SPANAME)+","+doPreProcess3(CERNO)+")";
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
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlCount="SELECT COUNT(*) FROM MCGL_JBXX_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
		DbConnection dbc=new DbConnection();
		String sqlModify="UPDATE MCGL_JBXX_SQ SET OPDATETO="+doPreProcess3(OPDATETO)+",OPETYPE="+ doPreProcess3(OPETYPE)+",OPENO="+ doPreProcess3(OPENO)+",PRIPID="+ doPreProcess3(PRIPID)+",ENTNAME="+ doPreProcess3(ENTNAME)+",ENTNAMEPINY="+ doPreProcess3(ENTNAMEPINY)+",SPANAME1="+ doPreProcess3(SPANAME1)+",SPANAME2="+ doPreProcess3(SPANAME2)+",SPANAME3="+ doPreProcess3(SPANAME3)+",SPANAME4="+ doPreProcess3(SPANAME4)+",NAMETYPE="+ doPreProcess3(NAMETYPE)+",ENTTRA="+ doPreProcess3(ENTTRA)+",TRADPINY="+ doPreProcess3(TRADPINY)+",SAVEPERFROM=to_date("+doPreProcess3(SAVEPERFROM)+",'yyyy-mm-dd'),SAVEPERTO=to_date("+doPreProcess3(SAVEPERTO)+",'yyyy-mm-dd'),ENTCLASS="+ doPreProcess3(ENTCLASS)+",ENTTYPE="+ doPreProcess3(ENTTYPE)+",DOM="+ doPreProcess3(DOM)+",DOMDISTRICT="+ doPreProcess3(DOMDISTRICT)+",INDUSTRYPHY="+ doPreProcess3(INDUSTRYPHY)+",INDUSTRYCO="+ doPreProcess3(INDUSTRYCO)+",ABUITEMCO="+ doPreProcess3(ABUITEMCO)+",CBUITEM="+ doPreProcess3(CBUITEM)+",BUSSCOPE="+ doPreProcess3(BUSSCOPE)+",CONGRO="+CONGRO+",CONGROCUR="+ doPreProcess3(CONGROCUR)+",CONGROUSD="+CONGROUSD+",REGCAP="+REGCAP+",REGCAPCUR="+ doPreProcess3(REGCAPCUR)+",REGCAPUSD="+REGCAPUSD+",PREREGORG="+ doPreProcess3(PREREGORG)+",LOCALADM="+ doPreProcess3(LOCALADM)+",CONTINENT="+ doPreProcess3(CONTINENT)+",COUNTRY="+ doPreProcess3(COUNTRY)+",ACCDEPT="+ doPreProcess3(ACCDEPT)+",ACCDATE=to_date("+doPreProcess3(ACCDATE)+",'yyyy-mm-dd'),APPRAUTH="+ doPreProcess3(APPRAUTH)+",APPRDATE=to_date("+doPreProcess3(APPRDATE)+",'yyyy-mm-dd'),ISENTNAMEALT="+ISENTNAMEALT+",ENTNAMEBEALT="+ doPreProcess3(ENTNAMEBEALT)+",LOGINID="+ doPreProcess3(LOGINID)+",NAMESTATUS="+ doPreProcess3(NAMESTATUS)+",APDATE=to_date("+doPreProcess3(APDATE)+",'yyyy-mm-dd'),REMARK="+ doPreProcess3(REMARK)+",TRADPINY1="+ doPreProcess3(TRADPINY1)+",TRADPINY2="+ doPreProcess3(TRADPINY2)+",TRADPINY3="+ doPreProcess3(TRADPINY3)+",ENTNAME1="+ doPreProcess3(ENTNAME1)+",ENTNAME2="+ doPreProcess3(ENTNAME2)+",ENTNAME3="+ doPreProcess3(ENTNAME3)+",NAMEIND="+ doPreProcess3(NAMEIND)+",APPRNO="+ doPreProcess3(APPRNO)+",TRAMARK="+ doPreProcess3(TRAMARK)+",OWNERNAME="+ doPreProcess3(OWNERNAME)+",OWNERTEL="+ doPreProcess3(OWNERTEL)+",PLAYTIMELIMIT=to_date("+doPreProcess3(PLAYTIMELIMIT)+",'yyyy-mm-dd'),TRADPINY4="+ doPreProcess3(TRADPINY4)+",ENTNAME4="+ doPreProcess3(ENTNAME4)+",PROVINCE="+ doPreProcess3(PROVINCE)+",CITY="+ doPreProcess3(CITY)+",COUNTY="+ doPreProcess3(COUNTY)+",S_EXT_TIMESTAMP="+ doPreProcess3(S_EXT_TIMESTAMP)+",TOWN="+ doPreProcess3(TOWN)+",VILLAGE="+ doPreProcess3(VILLAGE)+",HOUSENUMBER="+ doPreProcess3(HOUSENUMBER)+",SPANAME="+ doPreProcess3(SPANAME)+",CERNO="+doPreProcess3(CERNO)+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
		DbConnection dbc=new DbConnection();
		String sqlDelete="DELETE FROM MCGL_JBXX_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
		DbConnection dbc=new DbConnection();
		String sqlCount="SELECT COUNT(*) FROM MCGL_JBXX_SQ";
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
		DbConnection dbc=new DbConnection();
		ArrayList al= new ArrayList();
		String sqlList="SELECT * FROM MCGL_JBXX_SQ";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			MCGL_JBXX_SQ bTable=new MCGL_JBXX_SQ();
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
		DbConnection dbc=new DbConnection();
		ArrayList al= new ArrayList();
		String sqlList="SELECT * FROM MCGL_JBXX_SQ";
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
			MCGL_JBXX_SQ bTable=new MCGL_JBXX_SQ();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlArr="SELECT * FROM MCGL_JBXX_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
public boolean doModBySql(String sqlAdd) throws SQLException
	{		
		DbConnection dbc=new DbConnection();
		int nRowCount;
		{
			nRowCount=dbc.executeUpdate( sqlAdd );
			dbc.close();
			if (nRowCount>0)	//插入成功
				return true;
			else
				return false;
		}
	}
}
