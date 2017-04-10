package com.macrosoft.icms.gsnw;

import java.sql.*;
import java.text.DecimalFormat;
import java.util.*;
import java.text.DecimalFormat;

import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.gsdbc.GsDbConnection;
import com.macrosoft.icms.*;
import com.macrosoft.icms.system.*;
public class QYDJ_JBXX_ZS
{
	String PAPROVINCE;
	String PACITY;
	String PACOUNTY;
	String PASTREET;
	String PAROAD;
	String PADOORPLATE;
	String UNISCID;
	String CALCULATIONMETHOD;
	String HZSTATUS;
	String HMTIME;
	float RECCAPUSD;
	float RECCAPRMB;
	float DOMEREGCAP;
	String DOMEREGCAPCUR;
	float DOMEREGCAPUSD;
	float DOMEREGCAPINVRAT;
	float DOMERECCAP;
	String DOMERECCAPCUR;
	float DOMERECCAPUSD;
	float DOMERECCAPCANPROP;
	float FORREGCAP;
	String FORREGCAPCUR;
	float FORREGCAPUSD;
	float FORREGCAPINVRAT;
	float FORRECCAP;
	String FORRECCAPCUR;
	float FORRECCAPUSD;
	float FORRECCAPCONPROP;
	String CHAMECDATE;
	String EXAAUTH;
	String SANDOCNO;
	String SANDATE;
	String FORENTNAME;
	String COUNTRY;
	String BOARDCHA;
	String OPEACTTYPE;
	String ITEMOFOPORCPRO;
	String CONOFCONTRPRO;
	String FORDOM;
	float FORREGECAP;
	String FORBUSSCOPE;
	String LEREP;
	String BALDELPER;
	float CURCONAM;
	String HIGHINDUSTRY;
	String BUSADDSCOPE;
	String CREDLEVEL;
	String SAFELEVEL;
	int BORSIGN;
	int MARSIGN;
	int ENTSTATUS;
	String APPRDATE;
	String CONUM;
	String APPRNO;
	String OPLOCPOSTALCODE;
	String REMARK;
	float WORCAP;
	String CONTINENT;
	int CITYSIGN;
	int IFFORHELP;
	int INVNUM;
	float ESTREGCAPUSD;
	float ESTFORREGCAPUSD;
	String SUPENTTYPE;
	String STOCKDEALTYPE;
	float STOCKNUM;
	int IFPROVINCENAME;
	String CERTINFO;
	float ROE;
	String OPSCOTYPE;
	String FORCAPENTSORT;
	int LIMPARNUM;
	String OPSTATE;
	String INDATE;
	String OUTDATE;
	String REVDATE;
	String CANDATE;
	int UNEMPNUM;
	int UNIVLEAVERNUM;
	String S_EXT_TIMESTAMP;
	String OPETYPE;
	String ACCOUNTFORM;
	int ADVSIGN;
	int AGRSIGN;
	String SUPOPFROM;
	String SUPOPTO;
	String PROVINCE;
	String CITY;
	String COUNTY;
	String STREET;
	String ROAD;
	String DOORPLATE;
	String ARCHNO;
	String ORGCODE;
	String TAXREGISTER;
	String ACCORG;
	String IFSJ;
	String SJTYPE;
	int FARMERNUM;
	int QTNUM;
	String OLD_PRIPID;
	String IFBL;
	String WZFLBS;
	String PROLOC;
	String PRIPID;
	String ENTNAME;
	String ENTNAMESPELL;
	String REGNO;
	String OLDREGNO;
	String ENTCAT;
	String ENTTYPE;
	double REGCAP;
	String INDUSTRYPHY;
	String INDUSTRYCO;
	String ESTDATE;
	String REGORG;
	String POSTALCODE;
	String TEL;
	String EMAIL;
	String FAX;
	String WEBSITE;
	String ABUITEMCO;
	String CBUITEM;
	String BUSSCOPE;
	String OPTYPE;
	int OPFYEARS;
	String OPFROM;
	String OPTO;
	String LOCALORG;
	String LOCALADM;
	float RECCAP;
	String INSFORM;
	String DOMDISTRICT;
	String DOM;
	String DOMPRORIGHT;
	String OPLOCDISTRICT;
	String OPLOC;
	String OPLOCPRORIGHT;
	String BUSFORM;
	String PTBUSSCOPE;
	String HYPOTAXIS;
	String ECOCHR;
	int PARNUM;
	String PARFORM;
	int EXENUM;
	int EMPNUM;
	String SCONFORM;
	String SUPENTNAME;
	String SUPREGNO;
	String SUPREGNORG;
	String SUPEMAIL;
	String FORCAPINDCODE;
	String MIDPREINDCODE;
	String ECOTECDEVZONE;
	String PROTYPE;
	float CONGRO;
	String CONGROCUR;
	float CONGROUSD;
	float FUNDAM;
	String CURRENCY;
	float FUNDAMUSD;
	float FUNDAMRMB;
	String REGCAPCUR;
	float REGCAPUSD;
	float REGCAPRMB;
	String RECCAPCUR;
	public String getPAPROVINCE()
	{
		return doPreProcess(PAPROVINCE);
	}

	public void setPAPROVINCE( String PAPROVINCE)
	{
		this.PAPROVINCE=doPreProcess2(convertCode(PAPROVINCE));
	}

	public String getPACITY()
	{
		return doPreProcess(PACITY);
	}

	public void setPACITY( String PACITY)
	{
		this.PACITY=doPreProcess2(convertCode(PACITY));
	}

	public String getPACOUNTY()
	{
		return doPreProcess(PACOUNTY);
	}

	public void setPACOUNTY( String PACOUNTY)
	{
		this.PACOUNTY=doPreProcess2(convertCode(PACOUNTY));
	}

	public String getPASTREET()
	{
		return doPreProcess(PASTREET);
	}

	public void setPASTREET( String PASTREET)
	{
		this.PASTREET=doPreProcess2(convertCode(PASTREET));
	}

	public String getPAROAD()
	{
		return doPreProcess(PAROAD);
	}

	public void setPAROAD( String PAROAD)
	{
		this.PAROAD=doPreProcess2(convertCode(PAROAD));
	}

	public String getPADOORPLATE()
	{
		return doPreProcess(PADOORPLATE);
	}

	public void setPADOORPLATE( String PADOORPLATE)
	{
		this.PADOORPLATE=doPreProcess2(convertCode(PADOORPLATE));
	}

	public String getUNISCID()
	{
		return doPreProcess(UNISCID);
	}

	public void setUNISCID( String UNISCID)
	{
		this.UNISCID=doPreProcess2(convertCode(UNISCID));
	}

	public String getCALCULATIONMETHOD()
	{
		return doPreProcess(CALCULATIONMETHOD);
	}

	public void setCALCULATIONMETHOD( String CALCULATIONMETHOD)
	{
		this.CALCULATIONMETHOD=doPreProcess2(convertCode(CALCULATIONMETHOD));
	}

	public String getHZSTATUS()
	{
		return doPreProcess(HZSTATUS);
	}

	public void setHZSTATUS( String HZSTATUS)
	{
		this.HZSTATUS=doPreProcess2(convertCode(HZSTATUS));
	}

	public String getHMTIME()
	{
		return doPreProcess(HMTIME);
	}

	public void setHMTIME( String HMTIME)
	{
		this.HMTIME=doPreProcess2(convertCode(HMTIME));
	}

	public float getRECCAPUSD()
	{
		return RECCAPUSD;
	}

	public void setRECCAPUSD( float RECCAPUSD)
	{
		this.RECCAPUSD=RECCAPUSD ;
	}

	public float getRECCAPRMB()
	{
		return RECCAPRMB;
	}

	public void setRECCAPRMB( float RECCAPRMB)
	{
		this.RECCAPRMB=RECCAPRMB ;
	}

	public float getDOMEREGCAP()
	{
		return DOMEREGCAP;
	}

	public void setDOMEREGCAP( float DOMEREGCAP)
	{
		this.DOMEREGCAP=DOMEREGCAP ;
	}

	public String getDOMEREGCAPCUR()
	{
		return doPreProcess(DOMEREGCAPCUR);
	}

	public void setDOMEREGCAPCUR( String DOMEREGCAPCUR)
	{
		this.DOMEREGCAPCUR=doPreProcess2(convertCode(DOMEREGCAPCUR));
	}

	public float getDOMEREGCAPUSD()
	{
		return DOMEREGCAPUSD;
	}

	public void setDOMEREGCAPUSD( float DOMEREGCAPUSD)
	{
		this.DOMEREGCAPUSD=DOMEREGCAPUSD ;
	}

	public float getDOMEREGCAPINVRAT()
	{
		return DOMEREGCAPINVRAT;
	}

	public void setDOMEREGCAPINVRAT( float DOMEREGCAPINVRAT)
	{
		this.DOMEREGCAPINVRAT=DOMEREGCAPINVRAT ;
	}

	public float getDOMERECCAP()
	{
		return DOMERECCAP;
	}

	public void setDOMERECCAP( float DOMERECCAP)
	{
		this.DOMERECCAP=DOMERECCAP ;
	}

	public String getDOMERECCAPCUR()
	{
		return doPreProcess(DOMERECCAPCUR);
	}

	public void setDOMERECCAPCUR( String DOMERECCAPCUR)
	{
		this.DOMERECCAPCUR=doPreProcess2(convertCode(DOMERECCAPCUR));
	}

	public float getDOMERECCAPUSD()
	{
		return DOMERECCAPUSD;
	}

	public void setDOMERECCAPUSD( float DOMERECCAPUSD)
	{
		this.DOMERECCAPUSD=DOMERECCAPUSD ;
	}

	public float getDOMERECCAPCANPROP()
	{
		return DOMERECCAPCANPROP;
	}

	public void setDOMERECCAPCANPROP( float DOMERECCAPCANPROP)
	{
		this.DOMERECCAPCANPROP=DOMERECCAPCANPROP ;
	}

	public float getFORREGCAP()
	{
		return FORREGCAP;
	}

	public void setFORREGCAP( float FORREGCAP)
	{
		this.FORREGCAP=FORREGCAP ;
	}

	public String getFORREGCAPCUR()
	{
		return doPreProcess(FORREGCAPCUR);
	}

	public void setFORREGCAPCUR( String FORREGCAPCUR)
	{
		this.FORREGCAPCUR=doPreProcess2(convertCode(FORREGCAPCUR));
	}

	public float getFORREGCAPUSD()
	{
		return FORREGCAPUSD;
	}

	public void setFORREGCAPUSD( float FORREGCAPUSD)
	{
		this.FORREGCAPUSD=FORREGCAPUSD ;
	}

	public float getFORREGCAPINVRAT()
	{
		return FORREGCAPINVRAT;
	}

	public void setFORREGCAPINVRAT( float FORREGCAPINVRAT)
	{
		this.FORREGCAPINVRAT=FORREGCAPINVRAT ;
	}

	public float getFORRECCAP()
	{
		return FORRECCAP;
	}

	public void setFORRECCAP( float FORRECCAP)
	{
		this.FORRECCAP=FORRECCAP ;
	}

	public String getFORRECCAPCUR()
	{
		return doPreProcess(FORRECCAPCUR);
	}

	public void setFORRECCAPCUR( String FORRECCAPCUR)
	{
		this.FORRECCAPCUR=doPreProcess2(convertCode(FORRECCAPCUR));
	}

	public float getFORRECCAPUSD()
	{
		return FORRECCAPUSD;
	}

	public void setFORRECCAPUSD( float FORRECCAPUSD)
	{
		this.FORRECCAPUSD=FORRECCAPUSD ;
	}

	public float getFORRECCAPCONPROP()
	{
		return FORRECCAPCONPROP;
	}

	public void setFORRECCAPCONPROP( float FORRECCAPCONPROP)
	{
		this.FORRECCAPCONPROP=FORRECCAPCONPROP ;
	}

	public String getCHAMECDATE()
	{
		return doPreProcess(CHAMECDATE);
	}

	public void setCHAMECDATE( String CHAMECDATE)
	{
		this.CHAMECDATE=doPreProcess2(convertCode(CHAMECDATE));
	}

	public String getEXAAUTH()
	{
		return doPreProcess(EXAAUTH);
	}

	public void setEXAAUTH( String EXAAUTH)
	{
		this.EXAAUTH=doPreProcess2(convertCode(EXAAUTH));
	}

	public String getSANDOCNO()
	{
		return doPreProcess(SANDOCNO);
	}

	public void setSANDOCNO( String SANDOCNO)
	{
		this.SANDOCNO=doPreProcess2(convertCode(SANDOCNO));
	}

	public String getSANDATE()
	{
		return doPreProcess(SANDATE);
	}

	public void setSANDATE( String SANDATE)
	{
		this.SANDATE=doPreProcess2(convertCode(SANDATE));
	}

	public String getFORENTNAME()
	{
		return doPreProcess(FORENTNAME);
	}

	public void setFORENTNAME( String FORENTNAME)
	{
		this.FORENTNAME=doPreProcess2(convertCode(FORENTNAME));
	}

	public String getCOUNTRY()
	{
		return doPreProcess(COUNTRY);
	}

	public void setCOUNTRY( String COUNTRY)
	{
		this.COUNTRY=doPreProcess2(convertCode(COUNTRY));
	}

	public String getBOARDCHA()
	{
		return doPreProcess(BOARDCHA);
	}

	public void setBOARDCHA( String BOARDCHA)
	{
		this.BOARDCHA=doPreProcess2(convertCode(BOARDCHA));
	}

	public String getOPEACTTYPE()
	{
		return doPreProcess(OPEACTTYPE);
	}

	public void setOPEACTTYPE( String OPEACTTYPE)
	{
		this.OPEACTTYPE=doPreProcess2(convertCode(OPEACTTYPE));
	}

	public String getITEMOFOPORCPRO()
	{
		return doPreProcess(ITEMOFOPORCPRO);
	}

	public void setITEMOFOPORCPRO( String ITEMOFOPORCPRO)
	{
		this.ITEMOFOPORCPRO=doPreProcess2(convertCode(ITEMOFOPORCPRO));
	}

	public String getCONOFCONTRPRO()
	{
		return doPreProcess(CONOFCONTRPRO);
	}

	public void setCONOFCONTRPRO( String CONOFCONTRPRO)
	{
		this.CONOFCONTRPRO=doPreProcess2(convertCode(CONOFCONTRPRO));
	}

	public String getFORDOM()
	{
		return doPreProcess(FORDOM);
	}

	public void setFORDOM( String FORDOM)
	{
		this.FORDOM=doPreProcess2(convertCode(FORDOM));
	}

	public float getFORREGECAP()
	{
		return FORREGECAP;
	}

	public void setFORREGECAP( float FORREGECAP)
	{
		this.FORREGECAP=FORREGECAP ;
	}

	public String getFORBUSSCOPE()
	{
		return doPreProcess(FORBUSSCOPE);
	}

	public void setFORBUSSCOPE( String FORBUSSCOPE)
	{
		this.FORBUSSCOPE=doPreProcess2(convertCode(FORBUSSCOPE));
	}

	public String getLEREP()
	{
		return doPreProcess(LEREP);
	}

	public void setLEREP( String LEREP)
	{
		this.LEREP=doPreProcess2(convertCode(LEREP));
	}

	public String getBALDELPER()
	{
		return doPreProcess(BALDELPER);
	}

	public void setBALDELPER( String BALDELPER)
	{
		this.BALDELPER=doPreProcess2(convertCode(BALDELPER));
	}

	public float getCURCONAM()
	{
		return CURCONAM;
	}

	public void setCURCONAM( float CURCONAM)
	{
		this.CURCONAM=CURCONAM ;
	}

	public String getHIGHINDUSTRY()
	{
		return doPreProcess(HIGHINDUSTRY);
	}

	public void setHIGHINDUSTRY( String HIGHINDUSTRY)
	{
		this.HIGHINDUSTRY=doPreProcess2(convertCode(HIGHINDUSTRY));
	}

	public String getBUSADDSCOPE()
	{
		return doPreProcess(BUSADDSCOPE);
	}

	public void setBUSADDSCOPE( String BUSADDSCOPE)
	{
		this.BUSADDSCOPE=doPreProcess2(convertCode(BUSADDSCOPE));
	}

	public String getCREDLEVEL()
	{
		return doPreProcess(CREDLEVEL);
	}

	public void setCREDLEVEL( String CREDLEVEL)
	{
		this.CREDLEVEL=doPreProcess2(convertCode(CREDLEVEL));
	}

	public String getSAFELEVEL()
	{
		return doPreProcess(SAFELEVEL);
	}

	public void setSAFELEVEL( String SAFELEVEL)
	{
		this.SAFELEVEL=doPreProcess2(convertCode(SAFELEVEL));
	}

	public int getBORSIGN()
	{
		return BORSIGN;
	}

	public void setBORSIGN( int BORSIGN)
	{
		this.BORSIGN=BORSIGN ;
	}

	public int getMARSIGN()
	{
		return MARSIGN;
	}

	public void setMARSIGN( int MARSIGN)
	{
		this.MARSIGN=MARSIGN ;
	}

	public int getENTSTATUS()
	{
		return ENTSTATUS;
	}

	public void setENTSTATUS( int ENTSTATUS)
	{
		this.ENTSTATUS=ENTSTATUS ;
	}

	public String getAPPRDATE()
	{
		return doPreProcess(APPRDATE);
	}

	public void setAPPRDATE( String APPRDATE)
	{
		this.APPRDATE=doPreProcess2(convertCode(APPRDATE));
	}

	public String getCONUM()
	{
		return doPreProcess(CONUM);
	}

	public void setCONUM( String CONUM)
	{
		this.CONUM=doPreProcess2(convertCode(CONUM));
	}

	public String getAPPRNO()
	{
		return doPreProcess(APPRNO);
	}

	public void setAPPRNO( String APPRNO)
	{
		this.APPRNO=doPreProcess2(convertCode(APPRNO));
	}

	public String getOPLOCPOSTALCODE()
	{
		return doPreProcess(OPLOCPOSTALCODE);
	}

	public void setOPLOCPOSTALCODE( String OPLOCPOSTALCODE)
	{
		this.OPLOCPOSTALCODE=doPreProcess2(convertCode(OPLOCPOSTALCODE));
	}

	public String getREMARK()
	{
		return doPreProcess(REMARK);
	}

	public void setREMARK( String REMARK)
	{
		this.REMARK=doPreProcess2(convertCode(REMARK));
	}

	public float getWORCAP()
	{
		return WORCAP;
	}

	public void setWORCAP( float WORCAP)
	{
		this.WORCAP=WORCAP ;
	}

	public String getCONTINENT()
	{
		return doPreProcess(CONTINENT);
	}

	public void setCONTINENT( String CONTINENT)
	{
		this.CONTINENT=doPreProcess2(convertCode(CONTINENT));
	}

	public int getCITYSIGN()
	{
		return CITYSIGN;
	}

	public void setCITYSIGN( int CITYSIGN)
	{
		this.CITYSIGN=CITYSIGN ;
	}

	public int getIFFORHELP()
	{
		return IFFORHELP;
	}

	public void setIFFORHELP( int IFFORHELP)
	{
		this.IFFORHELP=IFFORHELP ;
	}

	public int getINVNUM()
	{
		return INVNUM;
	}

	public void setINVNUM( int INVNUM)
	{
		this.INVNUM=INVNUM ;
	}

	public float getESTREGCAPUSD()
	{
		return ESTREGCAPUSD;
	}

	public void setESTREGCAPUSD( float ESTREGCAPUSD)
	{
		this.ESTREGCAPUSD=ESTREGCAPUSD ;
	}

	public float getESTFORREGCAPUSD()
	{
		return ESTFORREGCAPUSD;
	}

	public void setESTFORREGCAPUSD( float ESTFORREGCAPUSD)
	{
		this.ESTFORREGCAPUSD=ESTFORREGCAPUSD ;
	}

	public String getSUPENTTYPE()
	{
		return doPreProcess(SUPENTTYPE);
	}

	public void setSUPENTTYPE( String SUPENTTYPE)
	{
		this.SUPENTTYPE=doPreProcess2(convertCode(SUPENTTYPE));
	}

	public String getSTOCKDEALTYPE()
	{
		return doPreProcess(STOCKDEALTYPE);
	}

	public void setSTOCKDEALTYPE( String STOCKDEALTYPE)
	{
		this.STOCKDEALTYPE=doPreProcess2(convertCode(STOCKDEALTYPE));
	}

	public float getSTOCKNUM()
	{
		return STOCKNUM;
	}

	public void setSTOCKNUM( float STOCKNUM)
	{
		this.STOCKNUM=STOCKNUM ;
	}

	public int getIFPROVINCENAME()
	{
		return IFPROVINCENAME;
	}

	public void setIFPROVINCENAME( int IFPROVINCENAME)
	{
		this.IFPROVINCENAME=IFPROVINCENAME ;
	}

	public String getCERTINFO()
	{
		return doPreProcess(CERTINFO);
	}

	public void setCERTINFO( String CERTINFO)
	{
		this.CERTINFO=doPreProcess2(convertCode(CERTINFO));
	}

	public float getROE()
	{
		return ROE;
	}

	public void setROE( float ROE)
	{
		this.ROE=ROE ;
	}

	public String getOPSCOTYPE()
	{
		return doPreProcess(OPSCOTYPE);
	}

	public void setOPSCOTYPE( String OPSCOTYPE)
	{
		this.OPSCOTYPE=doPreProcess2(convertCode(OPSCOTYPE));
	}

	public String getFORCAPENTSORT()
	{
		return doPreProcess(FORCAPENTSORT);
	}

	public void setFORCAPENTSORT( String FORCAPENTSORT)
	{
		this.FORCAPENTSORT=doPreProcess2(convertCode(FORCAPENTSORT));
	}

	public int getLIMPARNUM()
	{
		return LIMPARNUM;
	}

	public void setLIMPARNUM( int LIMPARNUM)
	{
		this.LIMPARNUM=LIMPARNUM ;
	}

	public String getOPSTATE()
	{
		return doPreProcess(OPSTATE);
	}

	public void setOPSTATE( String OPSTATE)
	{
		this.OPSTATE=doPreProcess2(convertCode(OPSTATE));
	}

	public String getINDATE()
	{
		return doPreProcess(INDATE);
	}

	public void setINDATE( String INDATE)
	{
		this.INDATE=doPreProcess2(convertCode(INDATE));
	}

	public String getOUTDATE()
	{
		return doPreProcess(OUTDATE);
	}

	public void setOUTDATE( String OUTDATE)
	{
		this.OUTDATE=doPreProcess2(convertCode(OUTDATE));
	}

	public String getREVDATE()
	{
		return doPreProcess(REVDATE);
	}

	public void setREVDATE( String REVDATE)
	{
		this.REVDATE=doPreProcess2(convertCode(REVDATE));
	}

	public String getCANDATE()
	{
		return doPreProcess(CANDATE);
	}

	public void setCANDATE( String CANDATE)
	{
		this.CANDATE=doPreProcess2(convertCode(CANDATE));
	}

	public int getUNEMPNUM()
	{
		return UNEMPNUM;
	}

	public void setUNEMPNUM( int UNEMPNUM)
	{
		this.UNEMPNUM=UNEMPNUM ;
	}

	public int getUNIVLEAVERNUM()
	{
		return UNIVLEAVERNUM;
	}

	public void setUNIVLEAVERNUM( int UNIVLEAVERNUM)
	{
		this.UNIVLEAVERNUM=UNIVLEAVERNUM ;
	}

	public String getS_EXT_TIMESTAMP()
	{
		return doPreProcess(S_EXT_TIMESTAMP);
	}

	public void setS_EXT_TIMESTAMP( String S_EXT_TIMESTAMP)
	{
		this.S_EXT_TIMESTAMP=doPreProcess2(convertCode(S_EXT_TIMESTAMP));
	}

	public String getOPETYPE()
	{
		return doPreProcess(OPETYPE);
	}

	public void setOPETYPE( String OPETYPE)
	{
		this.OPETYPE=doPreProcess2(convertCode(OPETYPE));
	}

	public String getACCOUNTFORM()
	{
		return doPreProcess(ACCOUNTFORM);
	}

	public void setACCOUNTFORM( String ACCOUNTFORM)
	{
		this.ACCOUNTFORM=doPreProcess2(convertCode(ACCOUNTFORM));
	}

	public int getADVSIGN()
	{
		return ADVSIGN;
	}

	public void setADVSIGN( int ADVSIGN)
	{
		this.ADVSIGN=ADVSIGN ;
	}

	public int getAGRSIGN()
	{
		return AGRSIGN;
	}

	public void setAGRSIGN( int AGRSIGN)
	{
		this.AGRSIGN=AGRSIGN ;
	}

	public String getSUPOPFROM()
	{
		return doPreProcess(SUPOPFROM);
	}

	public void setSUPOPFROM( String SUPOPFROM)
	{
		this.SUPOPFROM=doPreProcess2(convertCode(SUPOPFROM));
	}

	public String getSUPOPTO()
	{
		return doPreProcess(SUPOPTO);
	}

	public void setSUPOPTO( String SUPOPTO)
	{
		this.SUPOPTO=doPreProcess2(convertCode(SUPOPTO));
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

	public String getARCHNO()
	{
		return doPreProcess(ARCHNO);
	}

	public void setARCHNO( String ARCHNO)
	{
		this.ARCHNO=doPreProcess2(convertCode(ARCHNO));
	}

	public String getORGCODE()
	{
		return doPreProcess(ORGCODE);
	}

	public void setORGCODE( String ORGCODE)
	{
		this.ORGCODE=doPreProcess2(convertCode(ORGCODE));
	}

	public String getTAXREGISTER()
	{
		return doPreProcess(TAXREGISTER);
	}

	public void setTAXREGISTER( String TAXREGISTER)
	{
		this.TAXREGISTER=doPreProcess2(convertCode(TAXREGISTER));
	}

	public String getACCORG()
	{
		return doPreProcess(ACCORG);
	}

	public void setACCORG( String ACCORG)
	{
		this.ACCORG=doPreProcess2(convertCode(ACCORG));
	}

	public String getIFSJ()
	{
		return doPreProcess(IFSJ);
	}

	public void setIFSJ( String IFSJ)
	{
		this.IFSJ=doPreProcess2(convertCode(IFSJ));
	}

	public String getSJTYPE()
	{
		return doPreProcess(SJTYPE);
	}

	public void setSJTYPE( String SJTYPE)
	{
		this.SJTYPE=doPreProcess2(convertCode(SJTYPE));
	}

	public int getFARMERNUM()
	{
		return FARMERNUM;
	}

	public void setFARMERNUM( int FARMERNUM)
	{
		this.FARMERNUM=FARMERNUM ;
	}

	public int getQTNUM()
	{
		return QTNUM;
	}

	public void setQTNUM( int QTNUM)
	{
		this.QTNUM=QTNUM ;
	}

	public String getOLD_PRIPID()
	{
		return doPreProcess(OLD_PRIPID);
	}

	public void setOLD_PRIPID( String OLD_PRIPID)
	{
		this.OLD_PRIPID=doPreProcess2(convertCode(OLD_PRIPID));
	}

	public String getIFBL()
	{
		return doPreProcess(IFBL);
	}

	public void setIFBL( String IFBL)
	{
		this.IFBL=doPreProcess2(convertCode(IFBL));
	}

	public String getWZFLBS()
	{
		return doPreProcess(WZFLBS);
	}

	public void setWZFLBS( String WZFLBS)
	{
		this.WZFLBS=doPreProcess2(convertCode(WZFLBS));
	}

	public String getPROLOC()
	{
		return doPreProcess(PROLOC);
	}

	public void setPROLOC( String PROLOC)
	{
		this.PROLOC=doPreProcess2(convertCode(PROLOC));
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

	public String getENTNAMESPELL()
	{
		return doPreProcess(ENTNAMESPELL);
	}

	public void setENTNAMESPELL( String ENTNAMESPELL)
	{
		this.ENTNAMESPELL=doPreProcess2(convertCode(ENTNAMESPELL));
	}

	public String getREGNO()
	{
		return doPreProcess(REGNO);
	}

	public void setREGNO( String REGNO)
	{
		this.REGNO=doPreProcess2(convertCode(REGNO));
	}

	public String getOLDREGNO()
	{
		return doPreProcess(OLDREGNO);
	}

	public void setOLDREGNO( String OLDREGNO)
	{
		this.OLDREGNO=doPreProcess2(convertCode(OLDREGNO));
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

	public double getREGCAP()
	{
		return REGCAP;
	}

	public void setREGCAP( double REGCAP)
	{
		this.REGCAP=REGCAP ;
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

	public String getESTDATE()
	{
		return doPreProcess(ESTDATE);
	}

	public void setESTDATE( String ESTDATE)
	{
		this.ESTDATE=doPreProcess2(convertCode(ESTDATE));
	}

	public String getREGORG()
	{
		return doPreProcess(REGORG);
	}

	public void setREGORG( String REGORG)
	{
		this.REGORG=doPreProcess2(convertCode(REGORG));
	}

	public String getPOSTALCODE()
	{
		return doPreProcess(POSTALCODE);
	}

	public void setPOSTALCODE( String POSTALCODE)
	{
		this.POSTALCODE=doPreProcess2(convertCode(POSTALCODE));
	}

	public String getTEL()
	{
		return doPreProcess(TEL);
	}

	public void setTEL( String TEL)
	{
		this.TEL=doPreProcess2(convertCode(TEL));
	}

	public String getEMAIL()
	{
		return doPreProcess(EMAIL);
	}

	public void setEMAIL( String EMAIL)
	{
		this.EMAIL=doPreProcess2(convertCode(EMAIL));
	}

	public String getFAX()
	{
		return doPreProcess(FAX);
	}

	public void setFAX( String FAX)
	{
		this.FAX=doPreProcess2(convertCode(FAX));
	}

	public String getWEBSITE()
	{
		return doPreProcess(WEBSITE);
	}

	public void setWEBSITE( String WEBSITE)
	{
		this.WEBSITE=doPreProcess2(convertCode(WEBSITE));
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

	public String getOPTYPE()
	{
		return doPreProcess(OPTYPE);
	}

	public void setOPTYPE( String OPTYPE)
	{
		this.OPTYPE=doPreProcess2(convertCode(OPTYPE));
	}

	public int getOPFYEARS()
	{
		return OPFYEARS;
	}

	public void setOPFYEARS( int OPFYEARS)
	{
		this.OPFYEARS=OPFYEARS ;
	}

	public String getOPFROM()
	{
		return doPreProcess(OPFROM);
	}

	public void setOPFROM( String OPFROM)
	{
		this.OPFROM=doPreProcess2(convertCode(OPFROM));
	}

	public String getOPTO()
	{
		return doPreProcess(OPTO);
	}

	public void setOPTO( String OPTO)
	{
		this.OPTO=doPreProcess2(convertCode(OPTO));
	}

	public String getLOCALORG()
	{
		return doPreProcess(LOCALORG);
	}

	public void setLOCALORG( String LOCALORG)
	{
		this.LOCALORG=doPreProcess2(convertCode(LOCALORG));
	}

	public String getLOCALADM()
	{
		return doPreProcess(LOCALADM);
	}

	public void setLOCALADM( String LOCALADM)
	{
		this.LOCALADM=doPreProcess2(convertCode(LOCALADM));
	}

	public float getRECCAP()
	{
		return RECCAP;
	}

	public void setRECCAP( float RECCAP)
	{
		this.RECCAP=RECCAP ;
	}

	public String getINSFORM()
	{
		return doPreProcess(INSFORM);
	}

	public void setINSFORM( String INSFORM)
	{
		this.INSFORM=doPreProcess2(convertCode(INSFORM));
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

	public String getDOMPRORIGHT()
	{
		return doPreProcess(DOMPRORIGHT);
	}

	public void setDOMPRORIGHT( String DOMPRORIGHT)
	{
		this.DOMPRORIGHT=doPreProcess2(convertCode(DOMPRORIGHT));
	}

	public String getOPLOCDISTRICT()
	{
		return doPreProcess(OPLOCDISTRICT);
	}

	public void setOPLOCDISTRICT( String OPLOCDISTRICT)
	{
		this.OPLOCDISTRICT=doPreProcess2(convertCode(OPLOCDISTRICT));
	}

	public String getOPLOC()
	{
		return doPreProcess(OPLOC);
	}

	public void setOPLOC( String OPLOC)
	{
		this.OPLOC=doPreProcess2(convertCode(OPLOC));
	}

	public String getOPLOCPRORIGHT()
	{
		return doPreProcess(OPLOCPRORIGHT);
	}

	public void setOPLOCPRORIGHT( String OPLOCPRORIGHT)
	{
		this.OPLOCPRORIGHT=doPreProcess2(convertCode(OPLOCPRORIGHT));
	}

	public String getBUSFORM()
	{
		return doPreProcess(BUSFORM);
	}

	public void setBUSFORM( String BUSFORM)
	{
		this.BUSFORM=doPreProcess2(convertCode(BUSFORM));
	}

	public String getPTBUSSCOPE()
	{
		return doPreProcess(PTBUSSCOPE);
	}

	public void setPTBUSSCOPE( String PTBUSSCOPE)
	{
		this.PTBUSSCOPE=doPreProcess2(convertCode(PTBUSSCOPE));
	}

	public String getHYPOTAXIS()
	{
		return doPreProcess(HYPOTAXIS);
	}

	public void setHYPOTAXIS( String HYPOTAXIS)
	{
		this.HYPOTAXIS=doPreProcess2(convertCode(HYPOTAXIS));
	}

	public String getECOCHR()
	{
		return doPreProcess(ECOCHR);
	}

	public void setECOCHR( String ECOCHR)
	{
		this.ECOCHR=doPreProcess2(convertCode(ECOCHR));
	}

	public int getPARNUM()
	{
		return PARNUM;
	}

	public void setPARNUM( int PARNUM)
	{
		this.PARNUM=PARNUM ;
	}

	public String getPARFORM()
	{
		return doPreProcess(PARFORM);
	}

	public void setPARFORM( String PARFORM)
	{
		this.PARFORM=doPreProcess2(convertCode(PARFORM));
	}

	public int getEXENUM()
	{
		return EXENUM;
	}

	public void setEXENUM( int EXENUM)
	{
		this.EXENUM=EXENUM ;
	}

	public int getEMPNUM()
	{
		return EMPNUM;
	}

	public void setEMPNUM( int EMPNUM)
	{
		this.EMPNUM=EMPNUM ;
	}

	public String getSCONFORM()
	{
		return doPreProcess(SCONFORM);
	}

	public void setSCONFORM( String SCONFORM)
	{
		this.SCONFORM=doPreProcess2(convertCode(SCONFORM));
	}

	public String getSUPENTNAME()
	{
		return doPreProcess(SUPENTNAME);
	}

	public void setSUPENTNAME( String SUPENTNAME)
	{
		this.SUPENTNAME=doPreProcess2(convertCode(SUPENTNAME));
	}

	public String getSUPREGNO()
	{
		return doPreProcess(SUPREGNO);
	}

	public void setSUPREGNO( String SUPREGNO)
	{
		this.SUPREGNO=doPreProcess2(convertCode(SUPREGNO));
	}

	public String getSUPREGNORG()
	{
		return doPreProcess(SUPREGNORG);
	}

	public void setSUPREGNORG( String SUPREGNORG)
	{
		this.SUPREGNORG=doPreProcess2(convertCode(SUPREGNORG));
	}

	public String getSUPEMAIL()
	{
		return doPreProcess(SUPEMAIL);
	}

	public void setSUPEMAIL( String SUPEMAIL)
	{
		this.SUPEMAIL=doPreProcess2(convertCode(SUPEMAIL));
	}

	public String getFORCAPINDCODE()
	{
		return doPreProcess(FORCAPINDCODE);
	}

	public void setFORCAPINDCODE( String FORCAPINDCODE)
	{
		this.FORCAPINDCODE=doPreProcess2(convertCode(FORCAPINDCODE));
	}

	public String getMIDPREINDCODE()
	{
		return doPreProcess(MIDPREINDCODE);
	}

	public void setMIDPREINDCODE( String MIDPREINDCODE)
	{
		this.MIDPREINDCODE=doPreProcess2(convertCode(MIDPREINDCODE));
	}

	public String getECOTECDEVZONE()
	{
		return doPreProcess(ECOTECDEVZONE);
	}

	public void setECOTECDEVZONE( String ECOTECDEVZONE)
	{
		this.ECOTECDEVZONE=doPreProcess2(convertCode(ECOTECDEVZONE));
	}

	public String getPROTYPE()
	{
		return doPreProcess(PROTYPE);
	}

	public void setPROTYPE( String PROTYPE)
	{
		this.PROTYPE=doPreProcess2(convertCode(PROTYPE));
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

	public float getFUNDAM()
	{
		return FUNDAM;
	}

	public void setFUNDAM( float FUNDAM)
	{
		this.FUNDAM=FUNDAM ;
	}

	public String getCURRENCY()
	{
		return doPreProcess(CURRENCY);
	}

	public void setCURRENCY( String CURRENCY)
	{
		this.CURRENCY=doPreProcess2(convertCode(CURRENCY));
	}

	public float getFUNDAMUSD()
	{
		return FUNDAMUSD;
	}

	public void setFUNDAMUSD( float FUNDAMUSD)
	{
		this.FUNDAMUSD=FUNDAMUSD ;
	}

	public float getFUNDAMRMB()
	{
		return FUNDAMRMB;
	}

	public void setFUNDAMRMB( float FUNDAMRMB)
	{
		this.FUNDAMRMB=FUNDAMRMB ;
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

	public float getREGCAPRMB()
	{
		return REGCAPRMB;
	}

	public void setREGCAPRMB( float REGCAPRMB)
	{
		this.REGCAPRMB=REGCAPRMB ;
	}

	public String getRECCAPCUR()
	{
		return doPreProcess(RECCAPCUR);
	}

	public void setRECCAPCUR( String RECCAPCUR)
	{
		this.RECCAPCUR=doPreProcess2(convertCode(RECCAPCUR));
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
			GsDbConnection dbc=new GsDbConnection();
			ResultSet rsSelect;
			String sqlSelect="SELECT * FROM QYDJ_JBXX_ZS"+" WHERE PRIPID='"+doPreProcess(PRIPID)+"'";
			rsSelect=dbc.executeQuery(sqlSelect);
			if(rsSelect.next())
			{
				doSetData( rsSelect );
			}
			dbc.close();
		}

		public void doSetData( ResultSet rsSelect ) throws SQLException
		{
			PAPROVINCE=rsSelect.getString("PAPROVINCE");
			PACITY=rsSelect.getString("PACITY");
			PACOUNTY=rsSelect.getString("PACOUNTY");
			PASTREET=rsSelect.getString("PASTREET");
			PAROAD=rsSelect.getString("PAROAD");
			PADOORPLATE=rsSelect.getString("PADOORPLATE");
			UNISCID=rsSelect.getString("UNISCID");
			CALCULATIONMETHOD=rsSelect.getString("CALCULATIONMETHOD");
			HZSTATUS=rsSelect.getString("HZSTATUS");
			HMTIME=String.valueOf(rsSelect.getDate("HMTIME"));
			RECCAPUSD=rsSelect.getFloat("RECCAPUSD");
			RECCAPRMB=rsSelect.getFloat("RECCAPRMB");
			DOMEREGCAP=rsSelect.getFloat("DOMEREGCAP");
			DOMEREGCAPCUR=rsSelect.getString("DOMEREGCAPCUR");
			DOMEREGCAPUSD=rsSelect.getFloat("DOMEREGCAPUSD");
			DOMEREGCAPINVRAT=rsSelect.getFloat("DOMEREGCAPINVRAT");
			DOMERECCAP=rsSelect.getFloat("DOMERECCAP");
			DOMERECCAPCUR=rsSelect.getString("DOMERECCAPCUR");
			DOMERECCAPUSD=rsSelect.getFloat("DOMERECCAPUSD");
			DOMERECCAPCANPROP=rsSelect.getFloat("DOMERECCAPCANPROP");
			FORREGCAP=rsSelect.getFloat("FORREGCAP");
			FORREGCAPCUR=rsSelect.getString("FORREGCAPCUR");
			FORREGCAPUSD=rsSelect.getFloat("FORREGCAPUSD");
			FORREGCAPINVRAT=rsSelect.getFloat("FORREGCAPINVRAT");
			FORRECCAP=rsSelect.getFloat("FORRECCAP");
			FORRECCAPCUR=rsSelect.getString("FORRECCAPCUR");
			FORRECCAPUSD=rsSelect.getFloat("FORRECCAPUSD");
			FORRECCAPCONPROP=rsSelect.getFloat("FORRECCAPCONPROP");
			CHAMECDATE=String.valueOf(rsSelect.getDate("CHAMECDATE"));
			EXAAUTH=rsSelect.getString("EXAAUTH");
			SANDOCNO=rsSelect.getString("SANDOCNO");
			SANDATE=String.valueOf(rsSelect.getDate("SANDATE"));
			FORENTNAME=rsSelect.getString("FORENTNAME");
			COUNTRY=rsSelect.getString("COUNTRY");
			BOARDCHA=rsSelect.getString("BOARDCHA");
			OPEACTTYPE=rsSelect.getString("OPEACTTYPE");
			ITEMOFOPORCPRO=rsSelect.getString("ITEMOFOPORCPRO");
			CONOFCONTRPRO=rsSelect.getString("CONOFCONTRPRO");
			FORDOM=rsSelect.getString("FORDOM");
			FORREGECAP=rsSelect.getFloat("FORREGECAP");
			FORBUSSCOPE=rsSelect.getString("FORBUSSCOPE");
			LEREP=rsSelect.getString("LEREP");
			BALDELPER=String.valueOf(rsSelect.getDate("BALDELPER"));
			CURCONAM=rsSelect.getFloat("CURCONAM");
			HIGHINDUSTRY=rsSelect.getString("HIGHINDUSTRY");
			BUSADDSCOPE=rsSelect.getString("BUSADDSCOPE");
			CREDLEVEL=rsSelect.getString("CREDLEVEL");
			SAFELEVEL=rsSelect.getString("SAFELEVEL");
			BORSIGN=rsSelect.getInt("BORSIGN");
			MARSIGN=rsSelect.getInt("MARSIGN");
			ENTSTATUS=rsSelect.getInt("ENTSTATUS");
			APPRDATE=String.valueOf(rsSelect.getDate("APPRDATE"));
			CONUM=rsSelect.getString("CONUM");
			APPRNO=rsSelect.getString("APPRNO");
			OPLOCPOSTALCODE=rsSelect.getString("OPLOCPOSTALCODE");
			REMARK=rsSelect.getString("REMARK");
			WORCAP=rsSelect.getFloat("WORCAP");
			CONTINENT=rsSelect.getString("CONTINENT");
			CITYSIGN=rsSelect.getInt("CITYSIGN");
			IFFORHELP=rsSelect.getInt("IFFORHELP");
			INVNUM=rsSelect.getInt("INVNUM");
			ESTREGCAPUSD=rsSelect.getFloat("ESTREGCAPUSD");
			ESTFORREGCAPUSD=rsSelect.getFloat("ESTFORREGCAPUSD");
			SUPENTTYPE=rsSelect.getString("SUPENTTYPE");
			STOCKDEALTYPE=rsSelect.getString("STOCKDEALTYPE");
			STOCKNUM=rsSelect.getFloat("STOCKNUM");
			IFPROVINCENAME=rsSelect.getInt("IFPROVINCENAME");
			CERTINFO=rsSelect.getString("CERTINFO");
			ROE=rsSelect.getFloat("ROE");
			OPSCOTYPE=rsSelect.getString("OPSCOTYPE");
			FORCAPENTSORT=rsSelect.getString("FORCAPENTSORT");
			LIMPARNUM=rsSelect.getInt("LIMPARNUM");
			OPSTATE=rsSelect.getString("OPSTATE");
			INDATE=String.valueOf(rsSelect.getDate("INDATE"));
			OUTDATE=String.valueOf(rsSelect.getDate("OUTDATE"));
			REVDATE=String.valueOf(rsSelect.getDate("REVDATE"));
			CANDATE=String.valueOf(rsSelect.getDate("CANDATE"));
			UNEMPNUM=rsSelect.getInt("UNEMPNUM");
			UNIVLEAVERNUM=rsSelect.getInt("UNIVLEAVERNUM");
			S_EXT_TIMESTAMP=rsSelect.getString("S_EXT_TIMESTAMP");
			OPETYPE=rsSelect.getString("OPETYPE");
			ACCOUNTFORM=rsSelect.getString("ACCOUNTFORM");
			ADVSIGN=rsSelect.getInt("ADVSIGN");
			AGRSIGN=rsSelect.getInt("AGRSIGN");
			SUPOPFROM=String.valueOf(rsSelect.getDate("SUPOPFROM"));
			SUPOPTO=String.valueOf(rsSelect.getDate("SUPOPTO"));
			PROVINCE=rsSelect.getString("PROVINCE");
			CITY=rsSelect.getString("CITY");
			COUNTY=rsSelect.getString("COUNTY");
			STREET=rsSelect.getString("STREET");
			ROAD=rsSelect.getString("ROAD");
			DOORPLATE=rsSelect.getString("DOORPLATE");
			ARCHNO=rsSelect.getString("ARCHNO");
			ORGCODE=rsSelect.getString("ORGCODE");
			TAXREGISTER=rsSelect.getString("TAXREGISTER");
			ACCORG=rsSelect.getString("ACCORG");
			IFSJ=rsSelect.getString("IFSJ");
			SJTYPE=rsSelect.getString("SJTYPE");
			FARMERNUM=rsSelect.getInt("FARMERNUM");
			QTNUM=rsSelect.getInt("QTNUM");
			OLD_PRIPID=rsSelect.getString("OLD_PRIPID");
			IFBL=rsSelect.getString("IFBL");
			WZFLBS=rsSelect.getString("WZFLBS");
			PROLOC=rsSelect.getString("PROLOC");
			PRIPID=rsSelect.getString("PRIPID");
			ENTNAME=rsSelect.getString("ENTNAME");
			ENTNAMESPELL=rsSelect.getString("ENTNAMESPELL");
			REGNO=rsSelect.getString("REGNO");
			OLDREGNO=rsSelect.getString("OLDREGNO");
			ENTCAT=rsSelect.getString("ENTCAT");
			ENTTYPE=rsSelect.getString("ENTTYPE");
			REGCAP=rsSelect.getDouble("REGCAP");
			INDUSTRYPHY=rsSelect.getString("INDUSTRYPHY");
			INDUSTRYCO=rsSelect.getString("INDUSTRYCO");
			ESTDATE=String.valueOf(rsSelect.getDate("ESTDATE"));
			REGORG=rsSelect.getString("REGORG");
			POSTALCODE=rsSelect.getString("POSTALCODE");
			TEL=rsSelect.getString("TEL");
			EMAIL=rsSelect.getString("EMAIL");
			FAX=rsSelect.getString("FAX");
			WEBSITE=rsSelect.getString("WEBSITE");
			ABUITEMCO=rsSelect.getString("ABUITEMCO");
			CBUITEM=rsSelect.getString("CBUITEM");
			BUSSCOPE=rsSelect.getString("BUSSCOPE");
			OPTYPE=rsSelect.getString("OPTYPE");
			OPFYEARS=rsSelect.getInt("OPFYEARS");
			OPFROM=String.valueOf(rsSelect.getDate("OPFROM"));
			OPTO=String.valueOf(rsSelect.getDate("OPTO"));
			LOCALORG=rsSelect.getString("LOCALORG");
			LOCALADM=rsSelect.getString("LOCALADM");
			RECCAP=rsSelect.getFloat("RECCAP");
			INSFORM=rsSelect.getString("INSFORM");
			DOMDISTRICT=rsSelect.getString("DOMDISTRICT");
			DOM=rsSelect.getString("DOM");
			DOMPRORIGHT=rsSelect.getString("DOMPRORIGHT");
			OPLOCDISTRICT=rsSelect.getString("OPLOCDISTRICT");
			OPLOC=rsSelect.getString("OPLOC");
			OPLOCPRORIGHT=rsSelect.getString("OPLOCPRORIGHT");
			BUSFORM=rsSelect.getString("BUSFORM");
			PTBUSSCOPE=rsSelect.getString("PTBUSSCOPE");
			HYPOTAXIS=rsSelect.getString("HYPOTAXIS");
			ECOCHR=rsSelect.getString("ECOCHR");
			PARNUM=rsSelect.getInt("PARNUM");
			PARFORM=rsSelect.getString("PARFORM");
			EXENUM=rsSelect.getInt("EXENUM");
			EMPNUM=rsSelect.getInt("EMPNUM");
			SCONFORM=rsSelect.getString("SCONFORM");
			SUPENTNAME=rsSelect.getString("SUPENTNAME");
			SUPREGNO=rsSelect.getString("SUPREGNO");
			SUPREGNORG=rsSelect.getString("SUPREGNORG");
			SUPEMAIL=rsSelect.getString("SUPEMAIL");
			FORCAPINDCODE=rsSelect.getString("FORCAPINDCODE");
			MIDPREINDCODE=rsSelect.getString("MIDPREINDCODE");
			ECOTECDEVZONE=rsSelect.getString("ECOTECDEVZONE");
			PROTYPE=rsSelect.getString("PROTYPE");
			CONGRO=rsSelect.getFloat("CONGRO");
			CONGROCUR=rsSelect.getString("CONGROCUR");
			CONGROUSD=rsSelect.getFloat("CONGROUSD");
			FUNDAM=rsSelect.getFloat("FUNDAM");
			CURRENCY=rsSelect.getString("CURRENCY");
			FUNDAMUSD=rsSelect.getFloat("FUNDAMUSD");
			FUNDAMRMB=rsSelect.getFloat("FUNDAMRMB");
			REGCAPCUR=rsSelect.getString("REGCAPCUR");
			REGCAPUSD=rsSelect.getFloat("REGCAPUSD");
			REGCAPRMB=rsSelect.getFloat("REGCAPRMB");
			RECCAPCUR=rsSelect.getString("RECCAPCUR");
		}

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
	
	public boolean doCount() throws SQLException
	{
		GsDbConnection dbc=new GsDbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlCount="SELECT COUNT(*) FROM QYDJ_JBXX_ZS"+" WHERE PRIPID='"+doPreProcess(PRIPID)+"'";
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

	public int getListCount(String sqlWhere ) throws SQLException
	{
		GsDbConnection dbc=new GsDbConnection();
		String sqlCount="SELECT COUNT(*) FROM QYDJ_JBXX_ZS";
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
		String sqlList="SELECT * FROM QYDJ_JBXX_ZS";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			QYDJ_JBXX_ZS bTable=new QYDJ_JBXX_ZS();
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
		String sqlList="SELECT * FROM QYDJ_JBXX_ZS";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		sqlList+=" AND ROWNUM<="+(startRow+PageSize);//start+pagesize 
		ResultSet rsList=dbc.executeQuery( sqlList);
		int	nDispRows=0;
		do
		{
			nDispRows++;
			if (nDispRows>startRow)	break;
		}
		while (rsList.next());
		while(rsList.next()) {
			QYDJ_JBXX_ZS bTable=new QYDJ_JBXX_ZS();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException
	{
		GsDbConnection dbc=new GsDbConnection();
		String sqlArr="SELECT * FROM QYDJ_JBXX_ZS"+" WHERE PRIPID='"+doPreProcess(PRIPID)+"'";
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
