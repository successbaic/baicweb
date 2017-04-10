package com.macrosoft.icms.qydj;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import com.macrosoft.icms.dbc.DbConnection;
import com.macrosoft.icms.gsdbc.SzDbConnection;
import com.macrosoft.icms.system.SysUtility;
public class GTDJ_JBXX_SQ
{
	String PROVINCE;
	String CITY;
	String COUNTY;
	String TOWN;
	String VILLAGE;
	String HOUSENUMBER;
	String APPDATE;
	String OPENO;
	String PRIPID;
	String MCXH;
	String REGNO;
	String TRANAME;
	String SPANAME1;
	String SPANAME2;
	String OPERNAME;
	float CAPAM;
	String OPLOC;
	String BUSSCOANDFORM;
	int EMPNUM;
	String COMPFORM;
	String OPFROM;
	String OPTO;
	String OPDATETO;
	String REGORG;
	String LOCALADM;
	String LOCALAREA;
	String STATUS;
	String OPETYPE;
	String LOGINID;
	String IFNW;
	String FAMMEMBER;
	String OPELOCDISTRICT;
	String NAMEAPPNO;
	String IFELEC;
	String UNISCID;
	String TEL;
	String POSTALCODE;
	
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
	
	public String getOPELOCDISTRICT()
	{
		return doPreProcess(OPELOCDISTRICT);
	}

	public void setOPELOCDISTRICT( String OPELOCDISTRICT)
	{
		this.OPELOCDISTRICT=doPreProcess2(convertCode(OPELOCDISTRICT));
	}
	
	public String getAPPDATE()
	{
		return doPreProcess(APPDATE);
	}

	public void setAPPDATE( String APPDATE)
	{
		this.APPDATE=doPreProcess2(convertCode(APPDATE));
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

	public String getMCXH()
	{
		return doPreProcess(MCXH);
	}

	public void setMCXH( String MCXH)
	{
		this.MCXH=doPreProcess2(convertCode(MCXH));
	}

	public String getREGNO()
	{
		return doPreProcess(REGNO);
	}

	public void setREGNO( String REGNO)
	{
		this.REGNO=doPreProcess2(convertCode(REGNO));
	}

	public String getTRANAME()
	{
		return doPreProcess(TRANAME);
	}

	public void setTRANAME( String TRANAME)
	{
		this.TRANAME=doPreProcess2(convertCode(TRANAME));
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

	public String getOPERNAME()
	{
		return doPreProcess(OPERNAME);
	}

	public void setOPERNAME( String OPERNAME)
	{
		this.OPERNAME=doPreProcess2(convertCode(OPERNAME));
	}

	public float getCAPAM()
	{
		return CAPAM;
	}

	public void setCAPAM( float CAPAM)
	{
		this.CAPAM=CAPAM ;
	}

	public String getOPLOC()
	{
		return doPreProcess(OPLOC);
	}

	public void setOPLOC( String OPLOC)
	{
		this.OPLOC=doPreProcess2(convertCode(OPLOC));
	}

	public String getBUSSCOANDFORM()
	{
		return doPreProcess(BUSSCOANDFORM);
	}

	public void setBUSSCOANDFORM( String BUSSCOANDFORM)
	{
		this.BUSSCOANDFORM=doPreProcess2(convertCode(BUSSCOANDFORM));
	}

	public int getEMPNUM()
	{
		return EMPNUM;
	}

	public void setEMPNUM( int EMPNUM)
	{
		this.EMPNUM=EMPNUM ;
	}

	public String getCOMPFORM()
	{
		return doPreProcess(COMPFORM);
	}

	public void setCOMPFORM( String COMPFORM)
	{
		this.COMPFORM=doPreProcess2(convertCode(COMPFORM));
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

	public String getREGORG()
	{
		return doPreProcess(REGORG);
	}

	public void setREGORG( String REGORG)
	{
		this.REGORG=doPreProcess2(convertCode(REGORG));
	}

	public String getLOCALADM()
	{
		return doPreProcess(LOCALADM);
	}

	public void setLOCALADM( String LOCALADM)
	{
		this.LOCALADM=doPreProcess2(convertCode(LOCALADM));
	}

	public String getLOCALAREA()
	{
		return doPreProcess(LOCALAREA);
	}

	public void setLOCALAREA( String LOCALAREA)
	{
		this.LOCALAREA=doPreProcess2(convertCode(LOCALAREA));
	}

	public String getSTATUS()
	{
		return doPreProcess(STATUS);
	}

	public void setSTATUS( String STATUS)
	{
		this.STATUS=doPreProcess2(convertCode(STATUS));
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

	public String getIFNW()
	{
		return doPreProcess(IFNW);
	}

	public void setIFNW( String IFNW)
	{
		this.IFNW=doPreProcess2(convertCode(IFNW));
	}

	public String getFAMMEMBER()
	{
		return doPreProcess(FAMMEMBER);
	}

	public void setFAMMEMBER( String FAMMEMBER)
	{
		this.FAMMEMBER=doPreProcess2(convertCode(FAMMEMBER));
	}

	public String getNAMEAPPNO()
	{
		return doPreProcess(NAMEAPPNO);
	}

	public void setNAMEAPPNO( String NAMEAPPNO)
	{
		this.NAMEAPPNO=doPreProcess2(convertCode(NAMEAPPNO));
	}
	
	public String getIFELEC() {
		return IFELEC;
	}

	public String getUNISCID() {
		return doPreProcess(UNISCID);
	}

	public void setUNISCID(String uNISCID) {
		UNISCID = uNISCID;
	}

	public String getTEL() {
		return doPreProcess(TEL);
	}

	public void setTEL(String tEL) {
		TEL = tEL;
	}

	public String getPOSTALCODE() {
		return doPreProcess(POSTALCODE);
	}

	public void setPOSTALCODE(String pOSTALCODE) {
		POSTALCODE = pOSTALCODE;
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
		String sqlSelect="SELECT * FROM GTDJ_JBXX_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
	APPDATE=String.valueOf(rsSelect.getDate("APPDATE"));
	OPENO=rsSelect.getString("OPENO");
	PRIPID=rsSelect.getString("PRIPID");
	MCXH=rsSelect.getString("MCXH");
	REGNO=rsSelect.getString("REGNO");
	TRANAME=rsSelect.getString("TRANAME");
	SPANAME1=rsSelect.getString("SPANAME1");
	SPANAME2=rsSelect.getString("SPANAME2");
	OPERNAME=rsSelect.getString("OPERNAME");
	CAPAM=rsSelect.getFloat("CAPAM");
	OPLOC=rsSelect.getString("OPLOC");
	BUSSCOANDFORM=rsSelect.getString("BUSSCOANDFORM");
	EMPNUM=rsSelect.getInt("EMPNUM");
	COMPFORM=rsSelect.getString("COMPFORM");
	OPFROM=String.valueOf(rsSelect.getDate("OPFROM"));
	OPTO=String.valueOf(rsSelect.getDate("OPTO"));
	OPDATETO=rsSelect.getString("OPDATETO");
	REGORG=rsSelect.getString("REGORG");
	LOCALADM=rsSelect.getString("LOCALADM");
	LOCALAREA=rsSelect.getString("LOCALAREA");
	STATUS=rsSelect.getString("STATUS");
	OPETYPE=rsSelect.getString("OPETYPE");
	LOGINID=rsSelect.getString("LOGINID");
	IFNW=rsSelect.getString("IFNW");
	FAMMEMBER=rsSelect.getString("FAMMEMBER");
	OPELOCDISTRICT=rsSelect.getString("OPELOCDISTRICT");
	NAMEAPPNO=rsSelect.getString("NAMEAPPNO");
	IFELEC=rsSelect.getString("IFELEC");
	UNISCID=rsSelect.getString("UNISCID");
	TEL=rsSelect.getString("TEL");
	POSTALCODE=rsSelect.getString("POSTALCODE");

	}
	public boolean doAdd() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd="INSERT INTO GTDJ_JBXX_SQ(PROVINCE,CITY,COUNTY,TOWN,VILLAGE,HOUSENUMBER,OPELOCDISTRICT,APPDATE,OPENO,PRIPID,MCXH,REGNO,TRANAME,SPANAME1,SPANAME2,OPERNAME,CAPAM,OPLOC,BUSSCOANDFORM,EMPNUM,COMPFORM,OPFROM,OPTO,OPDATETO,REGORG,LOCALADM,LOCALAREA,STATUS,OPETYPE,LOGINID,IFNW,FAMMEMBER,NAMEAPPNO,IFELEC,UNISCID,TEL,POSTALCODE) VALUES("+doPreProcess3(PROVINCE)+","+ doPreProcess3(CITY)+","+ doPreProcess3(COUNTY)+","+ doPreProcess3(TOWN)+","+ doPreProcess3(VILLAGE)+","+ doPreProcess3(HOUSENUMBER)+","+doPreProcess3(OPELOCDISTRICT)+",to_date("+doPreProcess3(APPDATE)+",'yyyy-mm-dd'),"+ doPreProcess3(OPENO)+","+ doPreProcess3(PRIPID)+","+ doPreProcess3(MCXH)+","+ doPreProcess3(REGNO)+","+ doPreProcess3(TRANAME)+","+ doPreProcess3(SPANAME1)+","+ doPreProcess3(SPANAME2)+","+ doPreProcess3(OPERNAME)+","+CAPAM+","+ doPreProcess3(OPLOC)+","+ doPreProcess3(BUSSCOANDFORM)+","+EMPNUM+","+ doPreProcess3(COMPFORM)+",to_date("+doPreProcess3(OPFROM)+",'yyyy-mm-dd'),to_date("+doPreProcess3(OPTO)+",'yyyy-mm-dd'),"+ doPreProcess3(OPDATETO)+","+ doPreProcess3(REGORG)+","+ doPreProcess3(LOCALADM)+","+ doPreProcess3(LOCALAREA)+","+ doPreProcess3(STATUS)+","+ doPreProcess3(OPETYPE)+","+ doPreProcess3(LOGINID)+","+ doPreProcess3(IFNW)+","+ doPreProcess3(FAMMEMBER)+","+doPreProcess3(NAMEAPPNO)+","+doPreProcess3(IFELEC)+","+doPreProcess3(UNISCID)+","+doPreProcess3(TEL)+","+doPreProcess3(POSTALCODE)+")";
		{							
			nRowCount=dbc.executeUpdate( sqlAdd );
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
		String sqlAdd="INSERT INTO GTDJ_JBXX_SQ(PROVINCE,CITY,COUNTY,TOWN,VILLAGE,HOUSENUMBER,OPELOCDISTRICT,APPDATE,OPENO,PRIPID,MCXH,REGNO,TRANAME,SPANAME1,SPANAME2,OPERNAME,CAPAM,OPLOC,BUSSCOANDFORM,EMPNUM,COMPFORM,OPFROM,OPTO,OPDATETO,REGORG,LOCALADM,LOCALAREA,STATUS,OPETYPE,LOGINID,IFNW,FAMMEMBER,NAMEAPPNO,IFELEC,UNISCID,TEL,POSTALCODE) VALUES("+doPreProcess3(PROVINCE)+","+ doPreProcess3(CITY)+","+ doPreProcess3(COUNTY)+","+ doPreProcess3(TOWN)+","+ doPreProcess3(VILLAGE)+","+ doPreProcess3(HOUSENUMBER)+","+doPreProcess3(OPELOCDISTRICT)+",to_date("+doPreProcess3(APPDATE)+",'yyyy-mm-dd'),"+ doPreProcess3(OPENO)+","+ doPreProcess3(PRIPID)+","+ doPreProcess3(MCXH)+","+ doPreProcess3(REGNO)+","+ doPreProcess3(TRANAME)+","+ doPreProcess3(SPANAME1)+","+ doPreProcess3(SPANAME2)+","+ doPreProcess3(OPERNAME)+","+CAPAM+","+ doPreProcess3(OPLOC)+","+ doPreProcess3(BUSSCOANDFORM)+","+EMPNUM+","+ doPreProcess3(COMPFORM)+",to_date("+doPreProcess3(OPFROM)+",'yyyy-mm-dd'),to_date("+doPreProcess3(OPTO)+",'yyyy-mm-dd'),"+ doPreProcess3(OPDATETO)+","+ doPreProcess3(REGORG)+","+ doPreProcess3(LOCALADM)+","+ doPreProcess3(LOCALAREA)+","+ doPreProcess3(STATUS)+","+ doPreProcess3(OPETYPE)+","+ doPreProcess3(LOGINID)+","+ doPreProcess3(IFNW)+","+ doPreProcess3(FAMMEMBER)+","+doPreProcess3(NAMEAPPNO)+","+doPreProcess3(IFELEC)+","+doPreProcess3(UNISCID)+","+doPreProcess3(TEL)+","+doPreProcess3(POSTALCODE)+")";
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
		String sqlCount="SELECT COUNT(*) FROM GTDJ_JBXX_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlCount="SELECT COUNT(*) FROM GTDJ_JBXX_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlModify="UPDATE GTDJ_JBXX_SQ SET PROVINCE="+ doPreProcess3(PROVINCE)+",CITY="+ doPreProcess3(CITY)+",COUNTY="+ doPreProcess3(COUNTY)+",TOWN="+ doPreProcess3(TOWN)+",VILLAGE="+ doPreProcess3(VILLAGE)+",HOUSENUMBER="+ doPreProcess3(HOUSENUMBER)+",OPELOCDISTRICT="+doPreProcess3(OPELOCDISTRICT)+",APPDATE=to_date("+doPreProcess3(APPDATE)+",'yyyy-mm-dd'),OPENO="+ doPreProcess3(OPENO)+",PRIPID="+ doPreProcess3(PRIPID)+",MCXH="+ doPreProcess3(MCXH)+",REGNO="+ doPreProcess3(REGNO)+",TRANAME="+ doPreProcess3(TRANAME)+",SPANAME1="+ doPreProcess3(SPANAME1)+",SPANAME2="+ doPreProcess3(SPANAME2)+",OPERNAME="+ doPreProcess3(OPERNAME)+",CAPAM="+CAPAM+",OPLOC="+ doPreProcess3(OPLOC)+",BUSSCOANDFORM="+ doPreProcess3(BUSSCOANDFORM)+",EMPNUM="+EMPNUM+",COMPFORM="+ doPreProcess3(COMPFORM)+",OPFROM=to_date("+doPreProcess3(OPFROM)+",'yyyy-mm-dd'),OPTO=to_date("+doPreProcess3(OPTO)+",'yyyy-mm-dd'),OPDATETO="+ doPreProcess3(OPDATETO)+",REGORG="+ doPreProcess3(REGORG)+",LOCALADM="+ doPreProcess3(LOCALADM)+",LOCALAREA="+ doPreProcess3(LOCALAREA)+",STATUS="+ doPreProcess3(STATUS)+",OPETYPE="+ doPreProcess3(OPETYPE)+",LOGINID="+ doPreProcess3(LOGINID)+",IFNW="+ doPreProcess3(IFNW)+",FAMMEMBER="+ doPreProcess3(FAMMEMBER)+",NAMEAPPNO="+doPreProcess3(NAMEAPPNO)+",IFELEC="+doPreProcess3(IFELEC)+",UNISCID="+doPreProcess3(UNISCID)+",TEL="+doPreProcess3(TEL)+",POSTALCODE="+doPreProcess3(POSTALCODE)+"  WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlModify="UPDATE GTDJ_JBXX_SQ SET PROVINCE="+ doPreProcess3(PROVINCE)+",CITY="+ doPreProcess3(CITY)+",COUNTY="+ doPreProcess3(COUNTY)+",TOWN="+ doPreProcess3(TOWN)+",VILLAGE="+ doPreProcess3(VILLAGE)+",HOUSENUMBER="+ doPreProcess3(HOUSENUMBER)+",OPELOCDISTRICT="+doPreProcess3(OPELOCDISTRICT)+",APPDATE=to_date("+doPreProcess3(APPDATE)+",'yyyy-mm-dd'),OPENO="+ doPreProcess3(OPENO)+",PRIPID="+ doPreProcess3(PRIPID)+",MCXH="+ doPreProcess3(MCXH)+",REGNO="+ doPreProcess3(REGNO)+",TRANAME="+ doPreProcess3(TRANAME)+",SPANAME1="+ doPreProcess3(SPANAME1)+",SPANAME2="+ doPreProcess3(SPANAME2)+",OPERNAME="+ doPreProcess3(OPERNAME)+",CAPAM="+CAPAM+",OPLOC="+ doPreProcess3(OPLOC)+",BUSSCOANDFORM="+ doPreProcess3(BUSSCOANDFORM)+",EMPNUM="+EMPNUM+",COMPFORM="+ doPreProcess3(COMPFORM)+",OPFROM=to_date("+doPreProcess3(OPFROM)+",'yyyy-mm-dd'),OPTO=to_date("+doPreProcess3(OPTO)+",'yyyy-mm-dd'),OPDATETO="+ doPreProcess3(OPDATETO)+",REGORG="+ doPreProcess3(REGORG)+",LOCALADM="+ doPreProcess3(LOCALADM)+",LOCALAREA="+ doPreProcess3(LOCALAREA)+",STATUS="+ doPreProcess3(STATUS)+",OPETYPE="+ doPreProcess3(OPETYPE)+",LOGINID="+ doPreProcess3(LOGINID)+",IFNW="+ doPreProcess3(IFNW)+",FAMMEMBER="+ doPreProcess3(FAMMEMBER)+",NAMEAPPNO="+doPreProcess3(NAMEAPPNO)+",IFELEC="+doPreProcess3(IFELEC)+",UNISCID="+doPreProcess3(UNISCID)+",TEL="+doPreProcess3(TEL)+",POSTALCODE="+doPreProcess3(POSTALCODE)+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlDelete="DELETE FROM GTDJ_JBXX_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlCount="SELECT COUNT(*) FROM GTDJ_JBXX_SQ";
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
		String sqlList="SELECT * FROM GTDJ_JBXX_SQ";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			GTDJ_JBXX_SQ bTable=new GTDJ_JBXX_SQ();
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
		String sqlList="SELECT * FROM GTDJ_JBXX_SQ";
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
			GTDJ_JBXX_SQ bTable=new GTDJ_JBXX_SQ();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlArr="SELECT * FROM GTDJ_JBXX_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
	
//	根据业务编号修改记录状态
	public boolean doModStu() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlModify="UPDATE GTDJ_JBXX_SQ SET STATUS="+ doPreProcess3(STATUS)+",APPDATE=sysdate WHERE OPENO='"+doPreProcess(OPENO)+"'";
		int nRowCount=dbc.executeUpdate( sqlModify );
		dbc.close();
		if (nRowCount>0)	//修改成功
		{
			return true;
		}
		else
			return false;
	}
	
	public boolean doModByJyz() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlModify="UPDATE GTDJ_JBXX_SQ SET OPERNAME="+ doPreProcess3(OPERNAME)+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
