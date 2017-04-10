package com.macrosoft.icms.qydj;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import com.macrosoft.icms.dbc.DbConnection;
import com.macrosoft.icms.gsdbc.GsDbConnection;
import com.macrosoft.icms.gsdbc.SzDbConnection;
import com.macrosoft.icms.system.SysUtility;
public class QYDJ_JBXX_SQ
{
	String PROVINCE;
	String CITY;
	String COUNTY;
	String TOWN;
	String VILLAGE;
	String HOUSENUMBER;
	String NAMEAPPNO;
	String OPETYPE;
	String LOGINID;
	String REMARK;
	String MCXH;
	String ENTCLASS;
	float WORCAP;
	String LOCALADM;
	String YSBH;
	String OPELOCDISTRICT;
	String OPENO;
	String PRIPID;
	String ENTNAME;
	String SPANAME;
	String REGNO;
	String ENTTYPE;
	double REGCAP;
	float RECCAP;
	String CONFORM;
	String INDUSTRYPHY;
	String INDUSTRYCO;
	String APPDATE;
	String REGORG;
	String LEREP;
	String POSITION;
	String TEL;
	String EMAIL;
	String FAX;
	String WEBSITE;
	String ABUITEMCO;
	String CBUITEM;
	String BUSSCOPE;
	String OPFROM;
	String OPTO;
	String OPDATETO;
	int COPYNUM;
	String DOMDISTRICT;
	String DOM;
	String POSTALCODE;
	String OPLOC;
	String OPLOCPOSTALCODE;
	String BUSFORM;
	String DEPINCHA;
	String HYPOTAXIS;
	String ECOCHR;
	int PARNUM;
	int EXENUM;
	int EMPNUM;
	String SCONFORM;
	int MEMNUM;
	int PEAMEMNUM;
	float PEAMEMRATE;
	int GROMEMNUM;
	float GROMEMRATE;
	String SUPENTNAME;
	String SUPREGNO;
	String SUPREGORG;
	String SUPEMAIL;
	String INSFORM;
	String PROTYPE;
	float CONGRO;
	String CONGROCUR;
	float CONGROUSD;
	String REGCAPCUR;
	float REGCAPUSD;
	String RECCAPCUR;
	float RECCAPUSD;
	float DOMEREGCAP;
	String DOMEREGCAPCUR;
	float DOMEREGCAPUSD;
	float DOMEREGCAPINVRAT;
	float DOMERECCAP;
	String DOMERECCAPCUR;
	float DOMERECCAPUSD;
	float DOMERECCAPCONPROP;
	float FORREGCAP;
	String FORREGCAPCUR;
	float FORREGCAPUSD;
	float FORREGCAPINVRAT;
	float FORRECCAP;
	String FORRECCAPCUR;
	float FORRECCAPUSD;
	float FORRECCAPCONPROP;
	String EXAAUTH;
	String SANDATE;
	String SANDOCNO;
	String COUNTRY;
	String OPEACTTYPE;
	String ITEMOFOPORCPRO;
	String CONOFCONTRPRO;
	String FORENTNAME;
	String FORENTFORNAME;
	String FORENTADD;
	float FORENTCAP;
	String FORENTSCOPE;
	String FORENTOPFROM;
	String FORENTOPTO;
	String FORENTAUTSIGN;
	String FORENLIAFOR;
	String RECITEM;
	int IFPROVINCENAME;
	String STATUS;
	
	String UNISCID;
	String YIEDISTRICT;
	String PROLOC;
	String CALCULATIONMETHOD;
	
	String PROPROVINCE;
	String PROCITY;
	String PROCOUNTY;
	String PROTOWN;
	String PROVILLAGE;
	String PROHOUSENUMBER;
	String IFELEC;
	
	public String getUNISCID()
	{
		return doPreProcess(UNISCID);
	}

	public void setUNISCID( String UNISCID)
	{
		this.UNISCID=doPreProcess2(convertCode(UNISCID));
	}
	public String getYIEDISTRICT()
	{
		return doPreProcess(YIEDISTRICT);
	}

	public void setYIEDISTRICT( String YIEDISTRICT)
	{
		this.YIEDISTRICT=doPreProcess2(convertCode(YIEDISTRICT));
	}
	public String getPROLOC()
	{
		return doPreProcess(PROLOC);
	}

	public void setPROLOC( String PROLOC)
	{
		this.PROLOC=doPreProcess2(convertCode(PROLOC));
	}
	public String getCALCULATIONMETHOD()
	{
		return doPreProcess(CALCULATIONMETHOD);
	}

	public void setCALCULATIONMETHOD( String CALCULATIONMETHOD)
	{
		this.CALCULATIONMETHOD=doPreProcess2(convertCode(CALCULATIONMETHOD));
	}
	
	
	
	public String getPROPROVINCE()
	{
		return doPreProcess(PROPROVINCE);
	}

	public void setPROPROVINCE( String PROPROVINCE)
	{
		this.PROPROVINCE=doPreProcess2(convertCode(PROPROVINCE));
	}

	public String getPROCITY()
	{
		return doPreProcess(PROCITY);
	}

	public void setPROCITY( String PROCITY)
	{
		this.PROCITY=doPreProcess2(convertCode(PROCITY));
	}

	public String getPROCOUNTY()
	{
		return doPreProcess(PROCOUNTY);
	}

	public void setPROCOUNTY( String PROCOUNTY)
	{
		this.PROCOUNTY=doPreProcess2(convertCode(PROCOUNTY));
	}

	public String getPROTOWN()
	{
		return doPreProcess(PROTOWN);
	}

	public void setPROTOWN( String PROTOWN)
	{
		this.PROTOWN=doPreProcess2(convertCode(PROTOWN));
	}

	public String getPROVILLAGE()
	{
		return doPreProcess(PROVILLAGE);
	}

	public void setPROVILLAGE( String PROVILLAGE)
	{
		this.PROVILLAGE=doPreProcess2(convertCode(PROVILLAGE));
	}

	public String getPROHOUSENUMBER()
	{
		return doPreProcess(PROHOUSENUMBER);
	}

	public void setPROHOUSENUMBER( String PROHOUSENUMBER)
	{
		this.PROHOUSENUMBER=doPreProcess2(convertCode(PROHOUSENUMBER));
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

	public String getNAMEAPPNO()
	{
		return doPreProcess(NAMEAPPNO);
	}

	public void setNAMEAPPNO( String NAMEAPPNO)
	{
		this.NAMEAPPNO=doPreProcess2(convertCode(NAMEAPPNO));
	}

	public String getOPETYPE()
	{
		return doPreProcess(OPETYPE);
	}

	public void setOPETYPE( String OPETYPE)
	{
		this.OPETYPE=doPreProcess2(convertCode(OPETYPE));
	}

	public String getLOGINID()
	{
		return doPreProcess(LOGINID);
	}

	public void setLOGINID( String LOGINID)
	{
		this.LOGINID=doPreProcess2(convertCode(LOGINID));
	}

	public String getREMARK()
	{
		return doPreProcess(REMARK);
	}

	public void setREMARK( String REMARK)
	{
		this.REMARK=doPreProcess2(convertCode(REMARK));
	}

	public String getMCXH()
	{
		return doPreProcess(MCXH);
	}

	public void setMCXH( String MCXH)
	{
		this.MCXH=doPreProcess2(convertCode(MCXH));
	}

	public String getENTCLASS()
	{
		return doPreProcess(ENTCLASS);
	}

	public void setENTCLASS( String ENTCLASS)
	{
		this.ENTCLASS=doPreProcess2(convertCode(ENTCLASS));
	}

	public float getWORCAP()
	{
		return WORCAP;
	}

	public void setWORCAP( float WORCAP)
	{
		this.WORCAP=WORCAP ;
	}

	public String getLOCALADM()
	{
		return doPreProcess(LOCALADM);
	}

	public void setLOCALADM( String LOCALADM)
	{
		this.LOCALADM=doPreProcess2(convertCode(LOCALADM));
	}

	public String getYSBH()
	{
		return doPreProcess(YSBH);
	}

	public void setYSBH( String YSBH)
	{
		this.YSBH=doPreProcess2(convertCode(YSBH));
	}

	public String getOPELOCDISTRICT()
	{
		return doPreProcess(OPELOCDISTRICT);
	}

	public void setOPELOCDISTRICT( String OPELOCDISTRICT)
	{
		this.OPELOCDISTRICT=doPreProcess2(convertCode(OPELOCDISTRICT));
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

	public String getSPANAME()
	{
		return doPreProcess(SPANAME);
	}

	public void setSPANAME( String SPANAME)
	{
		this.SPANAME=doPreProcess2(convertCode(SPANAME));
	}

	public String getREGNO()
	{
		return doPreProcess(REGNO);
	}

	public void setREGNO( String REGNO)
	{
		this.REGNO=doPreProcess2(convertCode(REGNO));
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

	public float getRECCAP()
	{
		return RECCAP;
	}

	public void setRECCAP( float RECCAP)
	{
		this.RECCAP=RECCAP ;
	}

	public String getCONFORM()
	{
		return doPreProcess(CONFORM);
	}

	public void setCONFORM( String CONFORM)
	{
		this.CONFORM=doPreProcess2(convertCode(CONFORM));
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

	public String getAPPDATE()
	{
		return doPreProcess(APPDATE);
	}

	public void setAPPDATE( String APPDATE)
	{
		this.APPDATE=doPreProcess2(convertCode(APPDATE));
	}

	public String getREGORG()
	{
		return doPreProcess(REGORG);
	}

	public void setREGORG( String REGORG)
	{
		this.REGORG=doPreProcess2(convertCode(REGORG));
	}

	public String getLEREP()
	{
		return doPreProcess(LEREP);
	}

	public void setLEREP( String LEREP)
	{
		this.LEREP=doPreProcess2(convertCode(LEREP));
	}

	public String getPOSITION()
	{
		return doPreProcess(POSITION);
	}

	public void setPOSITION( String POSITION)
	{
		this.POSITION=doPreProcess2(convertCode(POSITION));
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

	public String getOPDATETO()
	{
		return doPreProcess(OPDATETO);
	}

	public void setOPDATETO( String OPDATETO)
	{
		this.OPDATETO=doPreProcess2(convertCode(OPDATETO));
	}

	public int getCOPYNUM()
	{
		return COPYNUM;
	}

	public void setCOPYNUM( int COPYNUM)
	{
		this.COPYNUM=COPYNUM ;
	}

	public int getIFPROVINCENAME()
	{
		return IFPROVINCENAME;
	}

	public void setIFPROVINCENAME( int IFPROVINCENAME)
	{
		this.IFPROVINCENAME=IFPROVINCENAME ;
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

	public String getPOSTALCODE()
	{
		return doPreProcess(POSTALCODE);
	}

	public void setPOSTALCODE( String POSTALCODE)
	{
		this.POSTALCODE=doPreProcess2(convertCode(POSTALCODE));
	}

	public String getOPLOC()
	{
		return doPreProcess(OPLOC);
	}

	public void setOPLOC( String OPLOC)
	{
		this.OPLOC=doPreProcess2(convertCode(OPLOC));
	}

	public String getOPLOCPOSTALCODE()
	{
		return doPreProcess(OPLOCPOSTALCODE);
	}

	public void setOPLOCPOSTALCODE( String OPLOCPOSTALCODE)
	{
		this.OPLOCPOSTALCODE=doPreProcess2(convertCode(OPLOCPOSTALCODE));
	}

	public String getBUSFORM()
	{
		return doPreProcess(BUSFORM);
	}

	public void setBUSFORM( String BUSFORM)
	{
		this.BUSFORM=doPreProcess2(convertCode(BUSFORM));
	}

	public String getDEPINCHA()
	{
		return doPreProcess(DEPINCHA);
	}

	public void setDEPINCHA( String DEPINCHA)
	{
		this.DEPINCHA=doPreProcess2(convertCode(DEPINCHA));
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

	public int getMEMNUM()
	{
		return MEMNUM;
	}

	public void setMEMNUM( int MEMNUM)
	{
		this.MEMNUM=MEMNUM ;
	}

	public int getPEAMEMNUM()
	{
		return PEAMEMNUM;
	}

	public void setPEAMEMNUM( int PEAMEMNUM)
	{
		this.PEAMEMNUM=PEAMEMNUM ;
	}

	public float getPEAMEMRATE()
	{
		return PEAMEMRATE;
	}

	public void setPEAMEMRATE( float PEAMEMRATE)
	{
		this.PEAMEMRATE=PEAMEMRATE ;
	}

	public int getGROMEMNUM()
	{
		return GROMEMNUM;
	}

	public void setGROMEMNUM( int GROMEMNUM)
	{
		this.GROMEMNUM=GROMEMNUM ;
	}

	public float getGROMEMRATE()
	{
		return GROMEMRATE;
	}

	public void setGROMEMRATE( float GROMEMRATE)
	{
		this.GROMEMRATE=GROMEMRATE ;
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

	public String getSUPREGORG()
	{
		return doPreProcess(SUPREGORG);
	}

	public void setSUPREGORG( String SUPREGORG)
	{
		this.SUPREGORG=doPreProcess2(convertCode(SUPREGORG));
	}

	public String getSUPEMAIL()
	{
		return doPreProcess(SUPEMAIL);
	}

	public void setSUPEMAIL( String SUPEMAIL)
	{
		this.SUPEMAIL=doPreProcess2(convertCode(SUPEMAIL));
	}

	public String getINSFORM()
	{
		return doPreProcess(INSFORM);
	}

	public void setINSFORM( String INSFORM)
	{
		this.INSFORM=doPreProcess2(convertCode(INSFORM));
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

	public String getRECCAPCUR()
	{
		return doPreProcess(RECCAPCUR);
	}

	public void setRECCAPCUR( String RECCAPCUR)
	{
		this.RECCAPCUR=doPreProcess2(convertCode(RECCAPCUR));
	}

	public float getRECCAPUSD()
	{
		return RECCAPUSD;
	}

	public void setRECCAPUSD( float RECCAPUSD)
	{
		this.RECCAPUSD=RECCAPUSD ;
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

	public float getDOMERECCAPCONPROP()
	{
		return DOMERECCAPCONPROP;
	}

	public void setDOMERECCAPCONPROP( float DOMERECCAPCONPROP)
	{
		this.DOMERECCAPCONPROP=DOMERECCAPCONPROP ;
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

	public String getEXAAUTH()
	{
		return doPreProcess(EXAAUTH);
	}

	public void setEXAAUTH( String EXAAUTH)
	{
		this.EXAAUTH=doPreProcess2(convertCode(EXAAUTH));
	}

	public String getSANDATE()
	{
		return doPreProcess(SANDATE);
	}

	public void setSANDATE( String SANDATE)
	{
		this.SANDATE=doPreProcess2(convertCode(SANDATE));
	}

	public String getSANDOCNO()
	{
		return doPreProcess(SANDOCNO);
	}

	public void setSANDOCNO( String SANDOCNO)
	{
		this.SANDOCNO=doPreProcess2(convertCode(SANDOCNO));
	}

	public String getCOUNTRY()
	{
		return doPreProcess(COUNTRY);
	}

	public void setCOUNTRY( String COUNTRY)
	{
		this.COUNTRY=doPreProcess2(convertCode(COUNTRY));
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

	public String getFORENTNAME()
	{
		return doPreProcess(FORENTNAME);
	}

	public void setFORENTNAME( String FORENTNAME)
	{
		this.FORENTNAME=doPreProcess2(convertCode(FORENTNAME));
	}

	public String getFORENTFORNAME()
	{
		return doPreProcess(FORENTFORNAME);
	}

	public void setFORENTFORNAME( String FORENTFORNAME)
	{
		this.FORENTFORNAME=doPreProcess2(convertCode(FORENTFORNAME));
	}

	public String getFORENTADD()
	{
		return doPreProcess(FORENTADD);
	}

	public void setFORENTADD( String FORENTADD)
	{
		this.FORENTADD=doPreProcess2(convertCode(FORENTADD));
	}

	public float getFORENTCAP()
	{
		return FORENTCAP;
	}

	public void setFORENTCAP( float FORENTCAP)
	{
		this.FORENTCAP=FORENTCAP ;
	}

	public String getFORENTSCOPE()
	{
		return doPreProcess(FORENTSCOPE);
	}

	public void setFORENTSCOPE( String FORENTSCOPE)
	{
		this.FORENTSCOPE=doPreProcess2(convertCode(FORENTSCOPE));
	}

	public String getFORENTOPFROM()
	{
		return doPreProcess(FORENTOPFROM);
	}

	public void setFORENTOPFROM( String FORENTOPFROM)
	{
		this.FORENTOPFROM=doPreProcess2(convertCode(FORENTOPFROM));
	}

	public String getFORENTOPTO()
	{
		return doPreProcess(FORENTOPTO);
	}

	public void setFORENTOPTO( String FORENTOPTO)
	{
		this.FORENTOPTO=doPreProcess2(convertCode(FORENTOPTO));
	}

	public String getFORENTAUTSIGN()
	{
		return doPreProcess(FORENTAUTSIGN);
	}

	public void setFORENTAUTSIGN( String FORENTAUTSIGN)
	{
		this.FORENTAUTSIGN=doPreProcess2(convertCode(FORENTAUTSIGN));
	}

	public String getFORENLIAFOR()
	{
		return doPreProcess(FORENLIAFOR);
	}

	public void setFORENLIAFOR( String FORENLIAFOR)
	{
		this.FORENLIAFOR=doPreProcess2(convertCode(FORENLIAFOR));
	}

	public String getRECITEM()
	{
		return doPreProcess(RECITEM);
	}

	public void setRECITEM( String RECITEM)
	{
		this.RECITEM=doPreProcess2(convertCode(RECITEM));
	}

	public String getSTATUS()
	{
		return doPreProcess(STATUS);
	}

	public void setSTATUS( String STATUS)
	{
		this.STATUS=doPreProcess2(convertCode(STATUS));
	}

	public String getIFELEC() {
		return IFELEC;
	}

	public void setIFELEC(String iFELEC) {
		IFELEC = iFELEC;
	}

	public String convertCode(String strvalue)
	{	return com.macrosoft.icms.system.SysUtility.convertCode( strvalue );	}

	public String doPreProcess( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess( sValue );	}

	public String doPreProcess2( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess2( sValue );	}

	public String doPreProcess3( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess3( sValue );	}

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
	
	public void doSelect() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsSelect;
		String sqlSelect="SELECT * FROM QYDJ_JBXX_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
		rsSelect=dbc.executeQuery(sqlSelect);
		if(rsSelect.next())
		{
			doSetData( rsSelect );
		}
		dbc.close();
	}

	public void doSetData( ResultSet rsSelect ) throws SQLException
	{
	PROVINCE=rsSelect.getString("PROVINCE");
	CITY=rsSelect.getString("CITY");
	COUNTY=rsSelect.getString("COUNTY");
	TOWN=rsSelect.getString("TOWN");
	VILLAGE=rsSelect.getString("VILLAGE");
	HOUSENUMBER=rsSelect.getString("HOUSENUMBER");
	NAMEAPPNO=rsSelect.getString("NAMEAPPNO");
	OPETYPE=rsSelect.getString("OPETYPE");
	LOGINID=rsSelect.getString("LOGINID");
	REMARK=rsSelect.getString("REMARK");
	MCXH=rsSelect.getString("MCXH");
	ENTCLASS=rsSelect.getString("ENTCLASS");
	WORCAP=rsSelect.getFloat("WORCAP");
	LOCALADM=rsSelect.getString("LOCALADM");
	YSBH=rsSelect.getString("YSBH");
	OPELOCDISTRICT=rsSelect.getString("OPELOCDISTRICT");
	OPENO=rsSelect.getString("OPENO");
	PRIPID=rsSelect.getString("PRIPID");
	ENTNAME=rsSelect.getString("ENTNAME");
	SPANAME=rsSelect.getString("SPANAME");
	REGNO=rsSelect.getString("REGNO");
	ENTTYPE=rsSelect.getString("ENTTYPE");
	REGCAP=rsSelect.getDouble("REGCAP");
	RECCAP=rsSelect.getFloat("RECCAP");
	CONFORM=rsSelect.getString("CONFORM");
	INDUSTRYPHY=rsSelect.getString("INDUSTRYPHY");
	INDUSTRYCO=rsSelect.getString("INDUSTRYCO");
	APPDATE=String.valueOf(rsSelect.getDate("APPDATE"));
	REGORG=rsSelect.getString("REGORG");
	LEREP=rsSelect.getString("LEREP");
	POSITION=rsSelect.getString("POSITION");
	TEL=rsSelect.getString("TEL");
	EMAIL=rsSelect.getString("EMAIL");
	FAX=rsSelect.getString("FAX");
	WEBSITE=rsSelect.getString("WEBSITE");
	ABUITEMCO=rsSelect.getString("ABUITEMCO");
	CBUITEM=rsSelect.getString("CBUITEM");
	BUSSCOPE=rsSelect.getString("BUSSCOPE");
	OPFROM=String.valueOf(rsSelect.getDate("OPFROM"));
	OPTO=String.valueOf(rsSelect.getDate("OPTO"));
	OPDATETO=rsSelect.getString("OPDATETO");
	COPYNUM=rsSelect.getInt("COPYNUM");
	IFPROVINCENAME=rsSelect.getInt("IFPROVINCENAME");
	DOMDISTRICT=rsSelect.getString("DOMDISTRICT");
	DOM=rsSelect.getString("DOM");
	POSTALCODE=rsSelect.getString("POSTALCODE");
	OPLOC=rsSelect.getString("OPLOC");
	OPLOCPOSTALCODE=rsSelect.getString("OPLOCPOSTALCODE");
	BUSFORM=rsSelect.getString("BUSFORM");
	DEPINCHA=rsSelect.getString("DEPINCHA");
	HYPOTAXIS=rsSelect.getString("HYPOTAXIS");
	ECOCHR=rsSelect.getString("ECOCHR");
	PARNUM=rsSelect.getInt("PARNUM");
	EXENUM=rsSelect.getInt("EXENUM");
	EMPNUM=rsSelect.getInt("EMPNUM");
	SCONFORM=rsSelect.getString("SCONFORM");
	MEMNUM=rsSelect.getInt("MEMNUM");
	PEAMEMNUM=rsSelect.getInt("PEAMEMNUM");
	PEAMEMRATE=rsSelect.getFloat("PEAMEMRATE");
	GROMEMNUM=rsSelect.getInt("GROMEMNUM");
	GROMEMRATE=rsSelect.getFloat("GROMEMRATE");
	SUPENTNAME=rsSelect.getString("SUPENTNAME");
	SUPREGNO=rsSelect.getString("SUPREGNO");
	SUPREGORG=rsSelect.getString("SUPREGORG");
	SUPEMAIL=rsSelect.getString("SUPEMAIL");
	INSFORM=rsSelect.getString("INSFORM");
	PROTYPE=rsSelect.getString("PROTYPE");
	CONGRO=rsSelect.getFloat("CONGRO");
	CONGROCUR=rsSelect.getString("CONGROCUR");
	CONGROUSD=rsSelect.getFloat("CONGROUSD");
	REGCAPCUR=rsSelect.getString("REGCAPCUR");
	REGCAPUSD=rsSelect.getFloat("REGCAPUSD");
	RECCAPCUR=rsSelect.getString("RECCAPCUR");
	RECCAPUSD=rsSelect.getFloat("RECCAPUSD");
	DOMEREGCAP=rsSelect.getFloat("DOMEREGCAP");
	DOMEREGCAPCUR=rsSelect.getString("DOMEREGCAPCUR");
	DOMEREGCAPUSD=rsSelect.getFloat("DOMEREGCAPUSD");
	DOMEREGCAPINVRAT=rsSelect.getFloat("DOMEREGCAPINVRAT");
	DOMERECCAP=rsSelect.getFloat("DOMERECCAP");
	DOMERECCAPCUR=rsSelect.getString("DOMERECCAPCUR");
	DOMERECCAPUSD=rsSelect.getFloat("DOMERECCAPUSD");
	DOMERECCAPCONPROP=rsSelect.getFloat("DOMERECCAPCONPROP");
	FORREGCAP=rsSelect.getFloat("FORREGCAP");
	FORREGCAPCUR=rsSelect.getString("FORREGCAPCUR");
	FORREGCAPUSD=rsSelect.getFloat("FORREGCAPUSD");
	FORREGCAPINVRAT=rsSelect.getFloat("FORREGCAPINVRAT");
	FORRECCAP=rsSelect.getFloat("FORRECCAP");
	FORRECCAPCUR=rsSelect.getString("FORRECCAPCUR");
	FORRECCAPUSD=rsSelect.getFloat("FORRECCAPUSD");
	FORRECCAPCONPROP=rsSelect.getFloat("FORRECCAPCONPROP");
	EXAAUTH=rsSelect.getString("EXAAUTH");
	SANDATE=String.valueOf(rsSelect.getDate("SANDATE"));
	SANDOCNO=rsSelect.getString("SANDOCNO");
	COUNTRY=rsSelect.getString("COUNTRY");
	OPEACTTYPE=rsSelect.getString("OPEACTTYPE");
	ITEMOFOPORCPRO=rsSelect.getString("ITEMOFOPORCPRO");
	CONOFCONTRPRO=rsSelect.getString("CONOFCONTRPRO");
	FORENTNAME=rsSelect.getString("FORENTNAME");
	FORENTFORNAME=rsSelect.getString("FORENTFORNAME");
	FORENTADD=rsSelect.getString("FORENTADD");
	FORENTCAP=rsSelect.getFloat("FORENTCAP");
	FORENTSCOPE=rsSelect.getString("FORENTSCOPE");
	FORENTOPFROM=String.valueOf(rsSelect.getDate("FORENTOPFROM"));
	FORENTOPTO=String.valueOf(rsSelect.getDate("FORENTOPTO"));
	FORENTAUTSIGN=rsSelect.getString("FORENTAUTSIGN");
	FORENLIAFOR=rsSelect.getString("FORENLIAFOR");
	RECITEM=rsSelect.getString("RECITEM");
	STATUS=rsSelect.getString("STATUS");
	UNISCID=rsSelect.getString("UNISCID");
	YIEDISTRICT=rsSelect.getString("YIEDISTRICT");
	PROLOC=rsSelect.getString("PROLOC");
	CALCULATIONMETHOD=rsSelect.getString("CALCULATIONMETHOD");
	PROPROVINCE=rsSelect.getString("PROPROVINCE");
	PROCITY=rsSelect.getString("PROCITY");
	PROCOUNTY=rsSelect.getString("PROCOUNTY");
	PROTOWN=rsSelect.getString("PROTOWN");
	PROVILLAGE=rsSelect.getString("PROVILLAGE");
	PROHOUSENUMBER=rsSelect.getString("PROHOUSENUMBER");
	IFELEC=rsSelect.getString("IFELEC");
	}

	public boolean doAdd() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd="INSERT INTO QYDJ_JBXX_SQ(OPENO,PRIPID,ENTNAME,SPANAME,REGNO,ENTTYPE,REGCAP,RECCAP,CONFORM,INDUSTRYPHY,INDUSTRYCO,APPDATE,REGORG,LEREP,POSITION,TEL,EMAIL,FAX,WEBSITE,ABUITEMCO,CBUITEM,BUSSCOPE,OPFROM,OPTO,OPDATETO,COPYNUM,DOMDISTRICT,DOM,POSTALCODE,OPLOC,OPLOCPOSTALCODE,BUSFORM,DEPINCHA,HYPOTAXIS,ECOCHR,PARNUM,EXENUM,EMPNUM,SCONFORM,MEMNUM,PEAMEMNUM,PEAMEMRATE,GROMEMNUM,GROMEMRATE,SUPENTNAME,SUPREGNO,SUPREGORG,SUPEMAIL,INSFORM,PROTYPE,CONGRO,CONGROCUR,CONGROUSD,REGCAPCUR,REGCAPUSD,RECCAPCUR,RECCAPUSD,DOMEREGCAP,DOMEREGCAPCUR,DOMEREGCAPUSD,DOMEREGCAPINVRAT,DOMERECCAP,DOMERECCAPCUR,DOMERECCAPUSD,DOMERECCAPCONPROP,FORREGCAP,FORREGCAPCUR,FORREGCAPUSD,FORREGCAPINVRAT,FORRECCAP,FORRECCAPCUR,FORRECCAPUSD,FORRECCAPCONPROP,EXAAUTH,SANDATE,SANDOCNO,COUNTRY,OPEACTTYPE,ITEMOFOPORCPRO,CONOFCONTRPRO,FORENTNAME,FORENTFORNAME,FORENTADD,FORENTCAP,FORENTSCOPE,FORENTOPFROM,FORENTOPTO,FORENTAUTSIGN,FORENLIAFOR,RECITEM,STATUS,OPETYPE,LOGINID,REMARK,MCXH,ENTCLASS,WORCAP,LOCALADM,YSBH,OPELOCDISTRICT,PROVINCE,CITY,COUNTY,TOWN,VILLAGE,HOUSENUMBER,NAMEAPPNO,IFPROVINCENAME,UNISCID,YIEDISTRICT,PROLOC,CALCULATIONMETHOD,PROPROVINCE,PROCITY,PROCOUNTY,PROTOWN,PROVILLAGE,PROHOUSENUMBER,IFELEC) VALUES("+ doPreProcess3(OPENO)+","+ doPreProcess3(PRIPID)+","+ doPreProcess3(ENTNAME)+","+ doPreProcess3(SPANAME)+","+ doPreProcess3(REGNO)+","+ doPreProcess3(ENTTYPE)+","+REGCAP+","+RECCAP+","+ doPreProcess3(CONFORM)+","+ doPreProcess3(INDUSTRYPHY)+","+ doPreProcess3(INDUSTRYCO)+",to_date("+doPreProcess3(APPDATE)+",'yyyy-mm-dd'),"+ doPreProcess3(REGORG)+","+ doPreProcess3(LEREP)+","+ doPreProcess3(POSITION)+","+ doPreProcess3(TEL)+","+ doPreProcess3(EMAIL)+","+ doPreProcess3(FAX)+","+ doPreProcess3(WEBSITE)+","+ doPreProcess3(ABUITEMCO)+","+ doPreProcess3(CBUITEM)+","+ doPreProcess3(BUSSCOPE)+",to_date("+doPreProcess3(OPFROM)+",'yyyy-mm-dd'),to_date("+doPreProcess3(OPTO)+",'yyyy-mm-dd'),"+ doPreProcess3(OPDATETO)+","+COPYNUM+","+ doPreProcess3(DOMDISTRICT)+","+ doPreProcess3(DOM)+","+ doPreProcess3(POSTALCODE)+","+ doPreProcess3(OPLOC)+","+ doPreProcess3(OPLOCPOSTALCODE)+","+ doPreProcess3(BUSFORM)+","+ doPreProcess3(DEPINCHA)+","+ doPreProcess3(HYPOTAXIS)+","+ doPreProcess3(ECOCHR)+","+PARNUM+","+EXENUM+","+EMPNUM+","+ doPreProcess3(SCONFORM)+","+MEMNUM+","+PEAMEMNUM+","+PEAMEMRATE+","+GROMEMNUM+","+GROMEMRATE+","+ doPreProcess3(SUPENTNAME)+","+ doPreProcess3(SUPREGNO)+","+ doPreProcess3(SUPREGORG)+","+ doPreProcess3(SUPEMAIL)+","+ doPreProcess3(INSFORM)+","+ doPreProcess3(PROTYPE)+","+CONGRO+","+ doPreProcess3(CONGROCUR)+","+CONGROUSD+","+ doPreProcess3(REGCAPCUR)+","+REGCAPUSD+","+ doPreProcess3(RECCAPCUR)+","+RECCAPUSD+","+DOMEREGCAP+","+ doPreProcess3(DOMEREGCAPCUR)+","+DOMEREGCAPUSD+","+DOMEREGCAPINVRAT+","+DOMERECCAP+","+ doPreProcess3(DOMERECCAPCUR)+","+DOMERECCAPUSD+","+DOMERECCAPCONPROP+","+FORREGCAP+","+ doPreProcess3(FORREGCAPCUR)+","+FORREGCAPUSD+","+FORREGCAPINVRAT+","+FORRECCAP+","+ doPreProcess3(FORRECCAPCUR)+","+FORRECCAPUSD+","+FORRECCAPCONPROP+","+ doPreProcess3(EXAAUTH)+",to_date("+doPreProcess3(SANDATE)+",'yyyy-mm-dd'),"+ doPreProcess3(SANDOCNO)+","+ doPreProcess3(COUNTRY)+","+ doPreProcess3(OPEACTTYPE)+","+ doPreProcess3(ITEMOFOPORCPRO)+","+ doPreProcess3(CONOFCONTRPRO)+","+ doPreProcess3(FORENTNAME)+","+ doPreProcess3(FORENTFORNAME)+","+ doPreProcess3(FORENTADD)+","+FORENTCAP+","+ doPreProcess3(FORENTSCOPE)+",to_date("+doPreProcess3(FORENTOPFROM)+",'yyyy-mm-dd'),to_date("+doPreProcess3(FORENTOPTO)+",'yyyy-mm-dd'),"+ doPreProcess3(FORENTAUTSIGN)+","+ doPreProcess3(FORENLIAFOR)+","+ doPreProcess3(RECITEM)+","+ doPreProcess3(STATUS)+","+ doPreProcess3(OPETYPE)+","+ doPreProcess3(LOGINID)+","+ doPreProcess3(REMARK)+","+ doPreProcess3(MCXH)+","+ doPreProcess3(ENTCLASS)+","+WORCAP+","+ doPreProcess3(LOCALADM)+","+ doPreProcess3(YSBH)+","+ doPreProcess3(OPELOCDISTRICT)+","+ doPreProcess3(PROVINCE)+","+ doPreProcess3(CITY)+","+ doPreProcess3(COUNTY)+","+ doPreProcess3(TOWN)+","+ doPreProcess3(VILLAGE)+","+ doPreProcess3(HOUSENUMBER)+","+ doPreProcess3(NAMEAPPNO)+","+IFPROVINCENAME+","+ doPreProcess3(UNISCID)+","+ doPreProcess3(YIEDISTRICT)+","+ doPreProcess3(PROLOC)+","+ doPreProcess3(CALCULATIONMETHOD)+","+ doPreProcess3(PROPROVINCE)+","+ doPreProcess3(PROCITY)+","+ doPreProcess3(PROCOUNTY)+","+ doPreProcess3(PROTOWN)+","+ doPreProcess3(PROVILLAGE)+","+ doPreProcess3(PROHOUSENUMBER)+","+ doPreProcess3(IFELEC)+")";
		{							
			nRowCount=dbc.executeUpdate(sqlAdd);
			dbc.close();
			if (nRowCount>0)	//插入成功
				return true;
			else
				return false;
		}
	}
	public boolean doAdd2MiddleData() throws SQLException
	{
		SzDbConnection dbc=new SzDbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd="INSERT INTO QYDJ_JBXX_SQ(OPENO,PRIPID,ENTNAME,SPANAME,REGNO,ENTTYPE,REGCAP,RECCAP,CONFORM,INDUSTRYPHY,INDUSTRYCO,APPDATE,REGORG,LEREP,POSITION,TEL,EMAIL,FAX,WEBSITE,ABUITEMCO,CBUITEM,BUSSCOPE,OPFROM,OPTO,OPDATETO,COPYNUM,DOMDISTRICT,DOM,POSTALCODE,OPLOC,OPLOCPOSTALCODE,BUSFORM,DEPINCHA,HYPOTAXIS,ECOCHR,PARNUM,EXENUM,EMPNUM,SCONFORM,MEMNUM,PEAMEMNUM,PEAMEMRATE,GROMEMNUM,GROMEMRATE,SUPENTNAME,SUPREGNO,SUPREGORG,SUPEMAIL,INSFORM,PROTYPE,CONGRO,CONGROCUR,CONGROUSD,REGCAPCUR,REGCAPUSD,RECCAPCUR,RECCAPUSD,DOMEREGCAP,DOMEREGCAPCUR,DOMEREGCAPUSD,DOMEREGCAPINVRAT,DOMERECCAP,DOMERECCAPCUR,DOMERECCAPUSD,DOMERECCAPCONPROP,FORREGCAP,FORREGCAPCUR,FORREGCAPUSD,FORREGCAPINVRAT,FORRECCAP,FORRECCAPCUR,FORRECCAPUSD,FORRECCAPCONPROP,EXAAUTH,SANDATE,SANDOCNO,COUNTRY,OPEACTTYPE,ITEMOFOPORCPRO,CONOFCONTRPRO,FORENTNAME,FORENTFORNAME,FORENTADD,FORENTCAP,FORENTSCOPE,FORENTOPFROM,FORENTOPTO,FORENTAUTSIGN,FORENLIAFOR,RECITEM,STATUS,OPETYPE,LOGINID,REMARK,MCXH,ENTCLASS,WORCAP,LOCALADM,YSBH,OPELOCDISTRICT,PROVINCE,CITY,COUNTY,TOWN,VILLAGE,HOUSENUMBER,NAMEAPPNO,IFPROVINCENAME,UNISCID,YIEDISTRICT,PROLOC,CALCULATIONMETHOD,PROPROVINCE,PROCITY,PROCOUNTY,PROTOWN,PROVILLAGE,PROHOUSENUMBER,IFELEC) VALUES("+ doPreProcess3(OPENO)+","+ doPreProcess3(PRIPID)+","+ doPreProcess3(ENTNAME)+","+ doPreProcess3(SPANAME)+","+ doPreProcess3(REGNO)+","+ doPreProcess3(ENTTYPE)+","+REGCAP+","+RECCAP+","+ doPreProcess3(CONFORM)+","+ doPreProcess3(INDUSTRYPHY)+","+ doPreProcess3(INDUSTRYCO)+",to_date("+doPreProcess3(APPDATE)+",'yyyy-mm-dd'),"+ doPreProcess3(REGORG)+","+ doPreProcess3(LEREP)+","+ doPreProcess3(POSITION)+","+ doPreProcess3(TEL)+","+ doPreProcess3(EMAIL)+","+ doPreProcess3(FAX)+","+ doPreProcess3(WEBSITE)+","+ doPreProcess3(ABUITEMCO)+","+ doPreProcess3(CBUITEM)+","+ doPreProcess3(BUSSCOPE)+",to_date("+doPreProcess3(OPFROM)+",'yyyy-mm-dd'),to_date("+doPreProcess3(OPTO)+",'yyyy-mm-dd'),"+ doPreProcess3(OPDATETO)+","+COPYNUM+","+ doPreProcess3(DOMDISTRICT)+","+ doPreProcess3(DOM)+","+ doPreProcess3(POSTALCODE)+","+ doPreProcess3(OPLOC)+","+ doPreProcess3(OPLOCPOSTALCODE)+","+ doPreProcess3(BUSFORM)+","+ doPreProcess3(DEPINCHA)+","+ doPreProcess3(HYPOTAXIS)+","+ doPreProcess3(ECOCHR)+","+PARNUM+","+EXENUM+","+EMPNUM+","+ doPreProcess3(SCONFORM)+","+MEMNUM+","+PEAMEMNUM+","+PEAMEMRATE+","+GROMEMNUM+","+GROMEMRATE+","+ doPreProcess3(SUPENTNAME)+","+ doPreProcess3(SUPREGNO)+","+ doPreProcess3(SUPREGORG)+","+ doPreProcess3(SUPEMAIL)+","+ doPreProcess3(INSFORM)+","+ doPreProcess3(PROTYPE)+","+CONGRO+","+ doPreProcess3(CONGROCUR)+","+CONGROUSD+","+ doPreProcess3(REGCAPCUR)+","+REGCAPUSD+","+ doPreProcess3(RECCAPCUR)+","+RECCAPUSD+","+DOMEREGCAP+","+ doPreProcess3(DOMEREGCAPCUR)+","+DOMEREGCAPUSD+","+DOMEREGCAPINVRAT+","+DOMERECCAP+","+ doPreProcess3(DOMERECCAPCUR)+","+DOMERECCAPUSD+","+DOMERECCAPCONPROP+","+FORREGCAP+","+ doPreProcess3(FORREGCAPCUR)+","+FORREGCAPUSD+","+FORREGCAPINVRAT+","+FORRECCAP+","+ doPreProcess3(FORRECCAPCUR)+","+FORRECCAPUSD+","+FORRECCAPCONPROP+","+ doPreProcess3(EXAAUTH)+",to_date("+doPreProcess3(SANDATE)+",'yyyy-mm-dd'),"+ doPreProcess3(SANDOCNO)+","+ doPreProcess3(COUNTRY)+","+ doPreProcess3(OPEACTTYPE)+","+ doPreProcess3(ITEMOFOPORCPRO)+","+ doPreProcess3(CONOFCONTRPRO)+","+ doPreProcess3(FORENTNAME)+","+ doPreProcess3(FORENTFORNAME)+","+ doPreProcess3(FORENTADD)+","+FORENTCAP+","+ doPreProcess3(FORENTSCOPE)+",to_date("+doPreProcess3(FORENTOPFROM)+",'yyyy-mm-dd'),to_date("+doPreProcess3(FORENTOPTO)+",'yyyy-mm-dd'),"+ doPreProcess3(FORENTAUTSIGN)+","+ doPreProcess3(FORENLIAFOR)+","+ doPreProcess3(RECITEM)+","+ doPreProcess3(STATUS)+","+ doPreProcess3(OPETYPE)+","+ doPreProcess3(LOGINID)+","+ doPreProcess3(REMARK)+","+ doPreProcess3(MCXH)+","+ doPreProcess3(ENTCLASS)+","+WORCAP+","+ doPreProcess3(LOCALADM)+","+ doPreProcess3(YSBH)+","+ doPreProcess3(OPELOCDISTRICT)+","+ doPreProcess3(PROVINCE)+","+ doPreProcess3(CITY)+","+ doPreProcess3(COUNTY)+","+ doPreProcess3(TOWN)+","+ doPreProcess3(VILLAGE)+","+ doPreProcess3(HOUSENUMBER)+","+ doPreProcess3(NAMEAPPNO)+","+IFPROVINCENAME+","+ doPreProcess3(UNISCID)+","+ doPreProcess3(YIEDISTRICT)+","+ doPreProcess3(PROLOC)+","+ doPreProcess3(CALCULATIONMETHOD)+","+ doPreProcess3(PROPROVINCE)+","+ doPreProcess3(PROCITY)+","+ doPreProcess3(PROCOUNTY)+","+ doPreProcess3(PROTOWN)+","+ doPreProcess3(PROVILLAGE)+","+ doPreProcess3(PROHOUSENUMBER)+","+ doPreProcess3(IFELEC)+")";
		{							
			nRowCount=dbc.executeUpdate(sqlAdd);
			dbc.close();
			if (nRowCount>0)	//插入成功
				return true;
			else
				return false;
		}
	}
   //	根据名称序号查询企业记录
	public boolean doCountByMcxh() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlCount="SELECT COUNT(*) FROM QYDJ_JBXX_SQ"+" WHERE MCXH='"+doPreProcess(MCXH)+"'";
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
	
	public boolean doCount() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlCount="SELECT COUNT(*) FROM QYDJ_JBXX_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
	public boolean doCount2MiddleData() throws SQLException
	{
		SzDbConnection dbc=new SzDbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlCount="SELECT COUNT(*) FROM QYDJ_JBXX_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlModify="UPDATE QYDJ_JBXX_SQ SET OPENO="+ doPreProcess3(OPENO)+",PRIPID="+ doPreProcess3(PRIPID)+",ENTNAME="+ doPreProcess3(ENTNAME)+",SPANAME="+ doPreProcess3(SPANAME)+",REGNO="+ doPreProcess3(REGNO)+",ENTTYPE="+ doPreProcess3(ENTTYPE)+",REGCAP="+REGCAP+",RECCAP="+RECCAP+",CONFORM="+ doPreProcess3(CONFORM)+",INDUSTRYPHY="+ doPreProcess3(INDUSTRYPHY)+",INDUSTRYCO="+ doPreProcess3(INDUSTRYCO)+",APPDATE=to_date("+doPreProcess3(APPDATE)+",'yyyy-mm-dd'),REGORG="+ doPreProcess3(REGORG)+",LEREP="+ doPreProcess3(LEREP)+",POSITION="+ doPreProcess3(POSITION)+",TEL="+ doPreProcess3(TEL)+",EMAIL="+ doPreProcess3(EMAIL)+",FAX="+ doPreProcess3(FAX)+",WEBSITE="+ doPreProcess3(WEBSITE)+",ABUITEMCO="+ doPreProcess3(ABUITEMCO)+",CBUITEM="+ doPreProcess3(CBUITEM)+",BUSSCOPE="+ doPreProcess3(BUSSCOPE)+",OPFROM=to_date("+doPreProcess3(OPFROM)+",'yyyy-mm-dd'),OPTO=to_date("+doPreProcess3(OPTO)+",'yyyy-mm-dd'),OPDATETO="+ doPreProcess3(OPDATETO)+",COPYNUM="+COPYNUM+",DOMDISTRICT="+ doPreProcess3(DOMDISTRICT)+",DOM="+ doPreProcess3(DOM)+",POSTALCODE="+ doPreProcess3(POSTALCODE)+",OPLOC="+ doPreProcess3(OPLOC)+",OPLOCPOSTALCODE="+ doPreProcess3(OPLOCPOSTALCODE)+",BUSFORM="+ doPreProcess3(BUSFORM)+",DEPINCHA="+ doPreProcess3(DEPINCHA)+",HYPOTAXIS="+ doPreProcess3(HYPOTAXIS)+",ECOCHR="+ doPreProcess3(ECOCHR)+",PARNUM="+PARNUM+",EXENUM="+EXENUM+",EMPNUM="+EMPNUM+",SCONFORM="+ doPreProcess3(SCONFORM)+",MEMNUM="+MEMNUM+",PEAMEMNUM="+PEAMEMNUM+",PEAMEMRATE="+PEAMEMRATE+",GROMEMNUM="+GROMEMNUM+",GROMEMRATE="+GROMEMRATE+",SUPENTNAME="+ doPreProcess3(SUPENTNAME)+",SUPREGNO="+ doPreProcess3(SUPREGNO)+",SUPREGORG="+ doPreProcess3(SUPREGORG)+",SUPEMAIL="+ doPreProcess3(SUPEMAIL)+",INSFORM="+ doPreProcess3(INSFORM)+",PROTYPE="+ doPreProcess3(PROTYPE)+",CONGRO="+CONGRO+",CONGROCUR="+ doPreProcess3(CONGROCUR)+",CONGROUSD="+CONGROUSD+",REGCAPCUR="+ doPreProcess3(REGCAPCUR)+",REGCAPUSD="+REGCAPUSD+",RECCAPCUR="+ doPreProcess3(RECCAPCUR)+",RECCAPUSD="+RECCAPUSD+",DOMEREGCAP="+DOMEREGCAP+",DOMEREGCAPCUR="+ doPreProcess3(DOMEREGCAPCUR)+",DOMEREGCAPUSD="+DOMEREGCAPUSD+",DOMEREGCAPINVRAT="+DOMEREGCAPINVRAT+",DOMERECCAP="+DOMERECCAP+",DOMERECCAPCUR="+ doPreProcess3(DOMERECCAPCUR)+",DOMERECCAPUSD="+DOMERECCAPUSD+",DOMERECCAPCONPROP="+DOMERECCAPCONPROP+",FORREGCAP="+FORREGCAP+",FORREGCAPCUR="+ doPreProcess3(FORREGCAPCUR)+",FORREGCAPUSD="+FORREGCAPUSD+",FORREGCAPINVRAT="+FORREGCAPINVRAT+",FORRECCAP="+FORRECCAP+",FORRECCAPCUR="+ doPreProcess3(FORRECCAPCUR)+",FORRECCAPUSD="+FORRECCAPUSD+",FORRECCAPCONPROP="+FORRECCAPCONPROP+",EXAAUTH="+ doPreProcess3(EXAAUTH)+",SANDATE=to_date("+doPreProcess3(SANDATE)+",'yyyy-mm-dd'),SANDOCNO="+ doPreProcess3(SANDOCNO)+",COUNTRY="+ doPreProcess3(COUNTRY)+",OPEACTTYPE="+ doPreProcess3(OPEACTTYPE)+",ITEMOFOPORCPRO="+ doPreProcess3(ITEMOFOPORCPRO)+",CONOFCONTRPRO="+ doPreProcess3(CONOFCONTRPRO)+",FORENTNAME="+ doPreProcess3(FORENTNAME)+",FORENTFORNAME="+ doPreProcess3(FORENTFORNAME)+",FORENTADD="+ doPreProcess3(FORENTADD)+",FORENTCAP="+FORENTCAP+",FORENTSCOPE="+ doPreProcess3(FORENTSCOPE)+",FORENTOPFROM=to_date("+doPreProcess3(FORENTOPFROM)+",'yyyy-mm-dd'),FORENTOPTO=to_date("+doPreProcess3(FORENTOPTO)+",'yyyy-mm-dd'),FORENTAUTSIGN="+ doPreProcess3(FORENTAUTSIGN)+",FORENLIAFOR="+ doPreProcess3(FORENLIAFOR)+",RECITEM="+ doPreProcess3(RECITEM)+",STATUS="+ doPreProcess3(STATUS)+",OPETYPE="+ doPreProcess3(OPETYPE)+",LOGINID="+ doPreProcess3(LOGINID)+",REMARK="+ doPreProcess3(REMARK)+",MCXH="+ doPreProcess3(MCXH)+",ENTCLASS="+ doPreProcess3(ENTCLASS)+",WORCAP="+WORCAP+",LOCALADM="+ doPreProcess3(LOCALADM)+",YSBH="+ doPreProcess3(YSBH)+",OPELOCDISTRICT="+ doPreProcess3(OPELOCDISTRICT)+",PROVINCE="+ doPreProcess3(PROVINCE)+",CITY="+ doPreProcess3(CITY)+",COUNTY="+ doPreProcess3(COUNTY)+",TOWN="+ doPreProcess3(TOWN)+",VILLAGE="+ doPreProcess3(VILLAGE)+",HOUSENUMBER="+ doPreProcess3(HOUSENUMBER)+",NAMEAPPNO="+ doPreProcess3(NAMEAPPNO)+",IFPROVINCENAME="+IFPROVINCENAME+",UNISCID="+ doPreProcess3(UNISCID)+",YIEDISTRICT="+ doPreProcess3(YIEDISTRICT)+",PROLOC="+ doPreProcess3(PROLOC)+",CALCULATIONMETHOD="+ doPreProcess3(CALCULATIONMETHOD)+",PROPROVINCE="+ doPreProcess3(PROPROVINCE)+",PROCITY="+ doPreProcess3(PROCITY)+",PROCOUNTY="+ doPreProcess3(PROCOUNTY)+",PROTOWN="+ doPreProcess3(PROTOWN)+",PROVILLAGE="+ doPreProcess3(PROVILLAGE)+",PROHOUSENUMBER="+ doPreProcess3(PROHOUSENUMBER)+",IFELEC="+ doPreProcess3(IFELEC)+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
		int nRowCount=dbc.executeUpdate( sqlModify );
		dbc.close();
		if (nRowCount>0)	//修改成功
		{
			return true;
		}
		else
			return false;
	}
	public boolean doModify2MiddleData() throws SQLException
	{
		SzDbConnection dbc=new SzDbConnection();		
		String sqlModify="UPDATE QYDJ_JBXX_SQ SET OPENO="+ doPreProcess3(OPENO)+",PRIPID="+ doPreProcess3(PRIPID)+",ENTNAME="+ doPreProcess3(ENTNAME)+",SPANAME="+ doPreProcess3(SPANAME)+",REGNO="+ doPreProcess3(REGNO)+",ENTTYPE="+ doPreProcess3(ENTTYPE)+",REGCAP="+REGCAP+",RECCAP="+RECCAP+",CONFORM="+ doPreProcess3(CONFORM)+",INDUSTRYPHY="+ doPreProcess3(INDUSTRYPHY)+",INDUSTRYCO="+ doPreProcess3(INDUSTRYCO)+",APPDATE=to_date("+doPreProcess3(APPDATE)+",'yyyy-mm-dd'),REGORG="+ doPreProcess3(REGORG)+",LEREP="+ doPreProcess3(LEREP)+",POSITION="+ doPreProcess3(POSITION)+",TEL="+ doPreProcess3(TEL)+",EMAIL="+ doPreProcess3(EMAIL)+",FAX="+ doPreProcess3(FAX)+",WEBSITE="+ doPreProcess3(WEBSITE)+",ABUITEMCO="+ doPreProcess3(ABUITEMCO)+",CBUITEM="+ doPreProcess3(CBUITEM)+",BUSSCOPE="+ doPreProcess3(BUSSCOPE)+",OPFROM=to_date("+doPreProcess3(OPFROM)+",'yyyy-mm-dd'),OPTO=to_date("+doPreProcess3(OPTO)+",'yyyy-mm-dd'),OPDATETO="+ doPreProcess3(OPDATETO)+",COPYNUM="+COPYNUM+",DOMDISTRICT="+ doPreProcess3(DOMDISTRICT)+",DOM="+ doPreProcess3(DOM)+",POSTALCODE="+ doPreProcess3(POSTALCODE)+",OPLOC="+ doPreProcess3(OPLOC)+",OPLOCPOSTALCODE="+ doPreProcess3(OPLOCPOSTALCODE)+",BUSFORM="+ doPreProcess3(BUSFORM)+",DEPINCHA="+ doPreProcess3(DEPINCHA)+",HYPOTAXIS="+ doPreProcess3(HYPOTAXIS)+",ECOCHR="+ doPreProcess3(ECOCHR)+",PARNUM="+PARNUM+",EXENUM="+EXENUM+",EMPNUM="+EMPNUM+",SCONFORM="+ doPreProcess3(SCONFORM)+",MEMNUM="+MEMNUM+",PEAMEMNUM="+PEAMEMNUM+",PEAMEMRATE="+PEAMEMRATE+",GROMEMNUM="+GROMEMNUM+",GROMEMRATE="+GROMEMRATE+",SUPENTNAME="+ doPreProcess3(SUPENTNAME)+",SUPREGNO="+ doPreProcess3(SUPREGNO)+",SUPREGORG="+ doPreProcess3(SUPREGORG)+",SUPEMAIL="+ doPreProcess3(SUPEMAIL)+",INSFORM="+ doPreProcess3(INSFORM)+",PROTYPE="+ doPreProcess3(PROTYPE)+",CONGRO="+CONGRO+",CONGROCUR="+ doPreProcess3(CONGROCUR)+",CONGROUSD="+CONGROUSD+",REGCAPCUR="+ doPreProcess3(REGCAPCUR)+",REGCAPUSD="+REGCAPUSD+",RECCAPCUR="+ doPreProcess3(RECCAPCUR)+",RECCAPUSD="+RECCAPUSD+",DOMEREGCAP="+DOMEREGCAP+",DOMEREGCAPCUR="+ doPreProcess3(DOMEREGCAPCUR)+",DOMEREGCAPUSD="+DOMEREGCAPUSD+",DOMEREGCAPINVRAT="+DOMEREGCAPINVRAT+",DOMERECCAP="+DOMERECCAP+",DOMERECCAPCUR="+ doPreProcess3(DOMERECCAPCUR)+",DOMERECCAPUSD="+DOMERECCAPUSD+",DOMERECCAPCONPROP="+DOMERECCAPCONPROP+",FORREGCAP="+FORREGCAP+",FORREGCAPCUR="+ doPreProcess3(FORREGCAPCUR)+",FORREGCAPUSD="+FORREGCAPUSD+",FORREGCAPINVRAT="+FORREGCAPINVRAT+",FORRECCAP="+FORRECCAP+",FORRECCAPCUR="+ doPreProcess3(FORRECCAPCUR)+",FORRECCAPUSD="+FORRECCAPUSD+",FORRECCAPCONPROP="+FORRECCAPCONPROP+",EXAAUTH="+ doPreProcess3(EXAAUTH)+",SANDATE=to_date("+doPreProcess3(SANDATE)+",'yyyy-mm-dd'),SANDOCNO="+ doPreProcess3(SANDOCNO)+",COUNTRY="+ doPreProcess3(COUNTRY)+",OPEACTTYPE="+ doPreProcess3(OPEACTTYPE)+",ITEMOFOPORCPRO="+ doPreProcess3(ITEMOFOPORCPRO)+",CONOFCONTRPRO="+ doPreProcess3(CONOFCONTRPRO)+",FORENTNAME="+ doPreProcess3(FORENTNAME)+",FORENTFORNAME="+ doPreProcess3(FORENTFORNAME)+",FORENTADD="+ doPreProcess3(FORENTADD)+",FORENTCAP="+FORENTCAP+",FORENTSCOPE="+ doPreProcess3(FORENTSCOPE)+",FORENTOPFROM=to_date("+doPreProcess3(FORENTOPFROM)+",'yyyy-mm-dd'),FORENTOPTO=to_date("+doPreProcess3(FORENTOPTO)+",'yyyy-mm-dd'),FORENTAUTSIGN="+ doPreProcess3(FORENTAUTSIGN)+",FORENLIAFOR="+ doPreProcess3(FORENLIAFOR)+",RECITEM="+ doPreProcess3(RECITEM)+",STATUS="+ doPreProcess3(STATUS)+",OPETYPE="+ doPreProcess3(OPETYPE)+",LOGINID="+ doPreProcess3(LOGINID)+",REMARK="+ doPreProcess3(REMARK)+",MCXH="+ doPreProcess3(MCXH)+",ENTCLASS="+ doPreProcess3(ENTCLASS)+",WORCAP="+WORCAP+",LOCALADM="+ doPreProcess3(LOCALADM)+",YSBH="+ doPreProcess3(YSBH)+",OPELOCDISTRICT="+ doPreProcess3(OPELOCDISTRICT)+",PROVINCE="+ doPreProcess3(PROVINCE)+",CITY="+ doPreProcess3(CITY)+",COUNTY="+ doPreProcess3(COUNTY)+",TOWN="+ doPreProcess3(TOWN)+",VILLAGE="+ doPreProcess3(VILLAGE)+",HOUSENUMBER="+ doPreProcess3(HOUSENUMBER)+",NAMEAPPNO="+ doPreProcess3(NAMEAPPNO)+",IFPROVINCENAME="+IFPROVINCENAME+" ,UNISCID="+ doPreProcess3(UNISCID)+",YIEDISTRICT="+ doPreProcess3(YIEDISTRICT)+",PROLOC="+ doPreProcess3(PROLOC)+",CALCULATIONMETHOD="+ doPreProcess3(CALCULATIONMETHOD)+",PROPROVINCE="+ doPreProcess3(PROPROVINCE)+",PROCITY="+ doPreProcess3(PROCITY)+",PROCOUNTY="+ doPreProcess3(PROCOUNTY)+",PROTOWN="+ doPreProcess3(PROTOWN)+",PROVILLAGE="+ doPreProcess3(PROVILLAGE)+",PROHOUSENUMBER="+ doPreProcess3(PROHOUSENUMBER)+",IFELEC="+ doPreProcess3(IFELEC)+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
		int nRowCount=dbc.executeUpdate( sqlModify );
		dbc.close();
		if (nRowCount>0)	//修改成功
		{
			return true;
		}
		else
			return false;
	}
	public boolean doModifyLerep() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlModify="UPDATE QYDJ_JBXX_SQ SET LEREP="+ doPreProcess3(LEREP)+",POSITION="+ doPreProcess3(POSITION)+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
		int nRowCount=dbc.executeUpdate( sqlModify );
		dbc.close();
		if (nRowCount>0)	//修改成功
		{
			return true;
		}
		else
			return false;
	}
	public boolean doModifyDEPINCHA() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlModify="UPDATE QYDJ_JBXX_SQ SET DEPINCHA="+ doPreProcess3(DEPINCHA)+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlDelete="DELETE FROM QYDJ_JBXX_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlCount="SELECT COUNT(*) FROM QYDJ_JBXX_SQ";
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
		String sqlList="SELECT * FROM QYDJ_JBXX_SQ";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			QYDJ_JBXX_SQ bTable=new QYDJ_JBXX_SQ();
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
		String sqlList="SELECT * FROM QYDJ_JBXX_SQ";
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
			QYDJ_JBXX_SQ bTable=new QYDJ_JBXX_SQ();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlArr="SELECT * FROM QYDJ_JBXX_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
	//根据业务编号修改记录状态
	public boolean doModStu() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlModify="UPDATE QYDJ_JBXX_SQ SET STATUS="+ doPreProcess3(STATUS)+",APPDATE=sysdate WHERE OPENO='"+doPreProcess(OPENO)+"'";
		int nRowCount=dbc.executeUpdate( sqlModify );
		dbc.close();
		if (nRowCount>0)	//修改成功
		{
			return true;
		}
		else
			return false;
	}
}
