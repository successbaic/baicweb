package com.macrosoft.icms.htgl;
import java.sql.*;
import java.util.*;
import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.*;
import com.macrosoft.icms.system.*;
public class DCDY_JBXX_SQ
{
	String STATUS;
	String LOGINID;
	String OPENO;
	String MORCONTNAME;
	String MORCONTNO;
	String MORCONTDATE;
	String APPREGREA;
	String PRICLASECKIND;
	float PRICLASECAM;
	String PEFPERFROM;
	String PEFPERTO;
	String PRICRE;
	float INTEREST;
	float DEFAM;
	float DAMCOMAM;
	float EXPENSE;
	String CONTOTHSTI;
	String MORTGAGORTYPE;
	String MOREPRIPID;
	String MORE;
	String MORTGAGOADDRESS;
	String MOREAGENT;
	String MORECERTYPE;
	String MOREPERNO;
	String MORTGAGOPRIPID;
	String MORTGAGO;
	String MORTGAGOAGENT;
	String MORTGAGOCERTYPE;
	String MORTGAGORPERNO;
	String REGORG;
	String REGDATE;
	String MORREGCNO;
	String ISSCARDDATE;
	int SIGN;
	String REMARK;
	String MAINCONTTYPE;
	float MAINCONTAM;
	String DYRDLZZLX;
	String DYRDLZZHM;
	String DYQRDLZZLX;
	String DYQRDLZZHM;
	String OPETYPE;
	String ENTTYPE;
	String REGORUN;
	public String getENTTYPE() {
		return ENTTYPE;
	}

	public void setENTTYPE(String eNTTYPE) {
		ENTTYPE = eNTTYPE;
	}

	public String getREGORUN() {
		return REGORUN;
	}

	public void setREGORUN(String rEGORUN) {
		REGORUN = rEGORUN;
	}

	public String getOPETYPE()
	{
		return doPreProcess(OPETYPE);
	}

	public void setOPETYPE( String sOPETYPE)
	{
		this.OPETYPE=doPreProcess2(convertCode(sOPETYPE));
	}
	public String getSTATUS()
	{
		return doPreProcess(STATUS);
	}

	public void setSTATUS( String STATUS)
	{
		this.STATUS=doPreProcess2(convertCode(STATUS));
	}

	public String getLOGINID()
	{
		return doPreProcess(LOGINID);
	}

	public void setLOGINID( String LOGINID)
	{
		this.LOGINID=doPreProcess2(convertCode(LOGINID));
	}

	public String getOPENO()
	{
		return doPreProcess(OPENO);
	}

	public void setOPENO( String OPENO)
	{
		this.OPENO=doPreProcess2(convertCode(OPENO));
	}

	public String getMORCONTNAME()
	{
		return doPreProcess(MORCONTNAME);
	}

	public void setMORCONTNAME( String MORCONTNAME)
	{
		this.MORCONTNAME=doPreProcess2(convertCode(MORCONTNAME));
	}

	public String getMORCONTNO()
	{
		return doPreProcess(MORCONTNO);
	}

	public void setMORCONTNO( String MORCONTNO)
	{
		this.MORCONTNO=doPreProcess2(convertCode(MORCONTNO));
	}

	public String getMORCONTDATE()
	{
		return doPreProcess(MORCONTDATE);
	}

	public void setMORCONTDATE( String MORCONTDATE)
	{
		this.MORCONTDATE=doPreProcess2(convertCode(MORCONTDATE));
	}

	public String getAPPREGREA()
	{
		return doPreProcess(APPREGREA);
	}

	public void setAPPREGREA( String APPREGREA)
	{
		this.APPREGREA=doPreProcess2(convertCode(APPREGREA));
	}

	public String getPRICLASECKIND()
	{
		return doPreProcess(PRICLASECKIND);
	}

	public void setPRICLASECKIND( String PRICLASECKIND)
	{
		this.PRICLASECKIND=doPreProcess2(convertCode(PRICLASECKIND));
	}

	public float getPRICLASECAM()
	{
		return PRICLASECAM;
	}

	public void setPRICLASECAM( float PRICLASECAM)
	{
		this.PRICLASECAM=PRICLASECAM ;
	}

	public String getPEFPERFROM()
	{
		return doPreProcess(PEFPERFROM);
	}

	public void setPEFPERFROM( String PEFPERFROM)
	{
		this.PEFPERFROM=doPreProcess2(convertCode(PEFPERFROM));
	}

	public String getPEFPERTO()
	{
		return doPreProcess(PEFPERTO);
	}

	public void setPEFPERTO( String PEFPERTO)
	{
		this.PEFPERTO=doPreProcess2(convertCode(PEFPERTO));
	}

	public String getPRICRE()
	{
		return doPreProcess(PRICRE);
	}

	public void setPRICRE( String PRICRE)
	{
		this.PRICRE=doPreProcess2(convertCode(PRICRE));
	}

	public float getINTEREST()
	{
		return INTEREST;
	}

	public void setINTEREST( float INTEREST)
	{
		this.INTEREST=INTEREST ;
	}

	public float getDEFAM()
	{
		return DEFAM;
	}

	public void setDEFAM( float DEFAM)
	{
		this.DEFAM=DEFAM ;
	}

	public float getDAMCOMAM()
	{
		return DAMCOMAM;
	}

	public void setDAMCOMAM( float DAMCOMAM)
	{
		this.DAMCOMAM=DAMCOMAM ;
	}

	public float getEXPENSE()
	{
		return EXPENSE;
	}

	public void setEXPENSE( float EXPENSE)
	{
		this.EXPENSE=EXPENSE ;
	}

	public String getCONTOTHSTI()
	{
		return doPreProcess(CONTOTHSTI);
	}

	public void setCONTOTHSTI( String CONTOTHSTI)
	{
		this.CONTOTHSTI=doPreProcess2(convertCode(CONTOTHSTI));
	}

	public String getMORTGAGORTYPE()
	{
		return doPreProcess(MORTGAGORTYPE);
	}

	public void setMORTGAGORTYPE( String MORTGAGORTYPE)
	{
		this.MORTGAGORTYPE=doPreProcess2(convertCode(MORTGAGORTYPE));
	}

	public String getMOREPRIPID()
	{
		return doPreProcess(MOREPRIPID);
	}

	public void setMOREPRIPID( String MOREPRIPID)
	{
		this.MOREPRIPID=doPreProcess2(convertCode(MOREPRIPID));
	}

	public String getMORE()
	{
		return doPreProcess(MORE);
	}

	public void setMORE( String MORE)
	{
		this.MORE=doPreProcess2(convertCode(MORE));
	}

	public String getMORTGAGOADDRESS()
	{
		return doPreProcess(MORTGAGOADDRESS);
	}

	public void setMORTGAGOADDRESS( String MORTGAGOADDRESS)
	{
		this.MORTGAGOADDRESS=doPreProcess2(convertCode(MORTGAGOADDRESS));
	}

	public String getMOREAGENT()
	{
		return doPreProcess(MOREAGENT);
	}

	public void setMOREAGENT( String MOREAGENT)
	{
		this.MOREAGENT=doPreProcess2(convertCode(MOREAGENT));
	}

	public String getMORECERTYPE()
	{
		return doPreProcess(MORECERTYPE);
	}

	public void setMORECERTYPE( String MORECERTYPE)
	{
		this.MORECERTYPE=doPreProcess2(convertCode(MORECERTYPE));
	}

	public String getMOREPERNO()
	{
		return doPreProcess(MOREPERNO);
	}

	public void setMOREPERNO( String MOREPERNO)
	{
		this.MOREPERNO=doPreProcess2(convertCode(MOREPERNO));
	}

	public String getMORTGAGOPRIPID()
	{
		return doPreProcess(MORTGAGOPRIPID);
	}

	public void setMORTGAGOPRIPID( String MORTGAGOPRIPID)
	{
		this.MORTGAGOPRIPID=doPreProcess2(convertCode(MORTGAGOPRIPID));
	}

	public String getMORTGAGO()
	{
		return doPreProcess(MORTGAGO);
	}

	public void setMORTGAGO( String MORTGAGO)
	{
		this.MORTGAGO=doPreProcess2(convertCode(MORTGAGO));
	}

	public String getMORTGAGOAGENT()
	{
		return doPreProcess(MORTGAGOAGENT);
	}

	public void setMORTGAGOAGENT( String MORTGAGOAGENT)
	{
		this.MORTGAGOAGENT=doPreProcess2(convertCode(MORTGAGOAGENT));
	}

	public String getMORTGAGOCERTYPE()
	{
		return doPreProcess(MORTGAGOCERTYPE);
	}

	public void setMORTGAGOCERTYPE( String MORTGAGOCERTYPE)
	{
		this.MORTGAGOCERTYPE=doPreProcess2(convertCode(MORTGAGOCERTYPE));
	}

	public String getMORTGAGORPERNO()
	{
		return doPreProcess(MORTGAGORPERNO);
	}

	public void setMORTGAGORPERNO( String MORTGAGORPERNO)
	{
		this.MORTGAGORPERNO=doPreProcess2(convertCode(MORTGAGORPERNO));
	}

	public String getREGORG()
	{
		return doPreProcess(REGORG);
	}

	public void setREGORG( String REGORG)
	{
		this.REGORG=doPreProcess2(convertCode(REGORG));
	}

	public String getREGDATE()
	{
		return doPreProcess(REGDATE);
	}

	public void setREGDATE( String REGDATE)
	{
		this.REGDATE=doPreProcess2(convertCode(REGDATE));
	}

	public String getMORREGCNO()
	{
		return doPreProcess(MORREGCNO);
	}

	public void setMORREGCNO( String MORREGCNO)
	{
		this.MORREGCNO=doPreProcess2(convertCode(MORREGCNO));
	}

	public String getISSCARDDATE()
	{
		return doPreProcess(ISSCARDDATE);
	}

	public void setISSCARDDATE( String ISSCARDDATE)
	{
		this.ISSCARDDATE=doPreProcess2(convertCode(ISSCARDDATE));
	}

	public int getSIGN()
	{
		return SIGN;
	}

	public void setSIGN( int SIGN)
	{
		this.SIGN=SIGN ;
	}

	public String getREMARK()
	{
		return doPreProcess(REMARK);
	}

	public void setREMARK( String REMARK)
	{
		this.REMARK=doPreProcess2(convertCode(REMARK));
	}

	public String getMAINCONTTYPE()
	{
		return doPreProcess(MAINCONTTYPE);
	}

	public void setMAINCONTTYPE( String MAINCONTTYPE)
	{
		this.MAINCONTTYPE=doPreProcess2(convertCode(MAINCONTTYPE));
	}

	public float getMAINCONTAM()
	{
		return MAINCONTAM;
	}

	public void setMAINCONTAM( float MAINCONTAM)
	{
		this.MAINCONTAM=MAINCONTAM ;
	}

	public String getDYRDLZZLX()
	{
		return doPreProcess(DYRDLZZLX);
	}

	public void setDYRDLZZLX( String DYRDLZZLX)
	{
		this.DYRDLZZLX=doPreProcess2(convertCode(DYRDLZZLX));
	}

	public String getDYRDLZZHM()
	{
		return doPreProcess(DYRDLZZHM);
	}

	public void setDYRDLZZHM( String DYRDLZZHM)
	{
		this.DYRDLZZHM=doPreProcess2(convertCode(DYRDLZZHM));
	}

	public String getDYQRDLZZLX()
	{
		return doPreProcess(DYQRDLZZLX);
	}

	public void setDYQRDLZZLX( String DYQRDLZZLX)
	{
		this.DYQRDLZZLX=doPreProcess2(convertCode(DYQRDLZZLX));
	}

	public String getDYQRDLZZHM()
	{
		return doPreProcess(DYQRDLZZHM);
	}

	public void setDYQRDLZZHM( String DYQRDLZZHM)
	{
		this.DYQRDLZZHM=doPreProcess2(convertCode(DYQRDLZZHM));
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
		String sqlSelect="SELECT * FROM DCDY_JBXX_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
		rsSelect=dbc.executeQuery(sqlSelect);
		if(rsSelect.next())
		{
			doSetData( rsSelect );
		}
		dbc.close();
	}

	public void doSetData( ResultSet rsSelect ) throws SQLException
	{
	STATUS=rsSelect.getString("STATUS");
	LOGINID=rsSelect.getString("LOGINID");
	OPENO=rsSelect.getString("OPENO");
	MORCONTNAME=rsSelect.getString("MORCONTNAME");
	MORCONTNO=rsSelect.getString("MORCONTNO");
	MORCONTDATE=String.valueOf(rsSelect.getDate("MORCONTDATE"));
	APPREGREA=rsSelect.getString("APPREGREA");
	PRICLASECKIND=rsSelect.getString("PRICLASECKIND");
	PRICLASECAM=rsSelect.getFloat("PRICLASECAM");
	PEFPERFROM=String.valueOf(rsSelect.getDate("PEFPERFROM"));
	PEFPERTO=String.valueOf(rsSelect.getDate("PEFPERTO"));
	PRICRE=rsSelect.getString("PRICRE");
	INTEREST=rsSelect.getFloat("INTEREST");
	DEFAM=rsSelect.getFloat("DEFAM");
	DAMCOMAM=rsSelect.getFloat("DAMCOMAM");
	EXPENSE=rsSelect.getFloat("EXPENSE");
	CONTOTHSTI=rsSelect.getString("CONTOTHSTI");
	MORTGAGORTYPE=rsSelect.getString("MORTGAGORTYPE");
	MOREPRIPID=rsSelect.getString("MOREPRIPID");
	MORE=rsSelect.getString("MORE");
	MORTGAGOADDRESS=rsSelect.getString("MORTGAGOADDRESS");
	MOREAGENT=rsSelect.getString("MOREAGENT");
	MORECERTYPE=rsSelect.getString("MORECERTYPE");
	MOREPERNO=rsSelect.getString("MOREPERNO");
	MORTGAGOPRIPID=rsSelect.getString("MORTGAGOPRIPID");
	MORTGAGO=rsSelect.getString("MORTGAGO");
	MORTGAGOAGENT=rsSelect.getString("MORTGAGOAGENT");
	MORTGAGOCERTYPE=rsSelect.getString("MORTGAGOCERTYPE");
	MORTGAGORPERNO=rsSelect.getString("MORTGAGORPERNO");
	REGORG=rsSelect.getString("REGORG");
	REGDATE=String.valueOf(rsSelect.getDate("REGDATE"));
	MORREGCNO=rsSelect.getString("MORREGCNO");
	ISSCARDDATE=String.valueOf(rsSelect.getDate("ISSCARDDATE"));
	SIGN=rsSelect.getInt("SIGN");
	REMARK=rsSelect.getString("REMARK");
	MAINCONTTYPE=rsSelect.getString("MAINCONTTYPE");
	MAINCONTAM=rsSelect.getFloat("MAINCONTAM");
	DYRDLZZLX=rsSelect.getString("DYRDLZZLX");
	DYRDLZZHM=rsSelect.getString("DYRDLZZHM");
	DYQRDLZZLX=rsSelect.getString("DYQRDLZZLX");
	DYQRDLZZHM=rsSelect.getString("DYQRDLZZHM");
	OPETYPE=rsSelect.getString("OPETYPE");
	ENTTYPE=rsSelect.getString("ENTTYPE");
	REGORUN=rsSelect.getString("REGORUN");
	}

	public boolean doAdd() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd="INSERT INTO DCDY_JBXX_SQ(OPETYPE,STATUS,LOGINID,OPENO,MORCONTNAME,MORCONTNO,MORCONTDATE,APPREGREA,PRICLASECKIND,PRICLASECAM,PEFPERFROM,PEFPERTO,PRICRE,INTEREST,DEFAM,DAMCOMAM,EXPENSE,CONTOTHSTI,MORTGAGORTYPE,MOREPRIPID,MORE,MORTGAGOADDRESS,MOREAGENT,MORECERTYPE,MOREPERNO,MORTGAGOPRIPID,MORTGAGO,MORTGAGOAGENT,MORTGAGOCERTYPE,MORTGAGORPERNO,REGORG,REGDATE,MORREGCNO,ISSCARDDATE,SIGN,REMARK,MAINCONTTYPE,MAINCONTAM,DYRDLZZLX,DYRDLZZHM,DYQRDLZZLX,DYQRDLZZHM,ENTTYPE,REGORUN) VALUES("+ doPreProcess3(OPETYPE)+","+doPreProcess3(STATUS)+","+ doPreProcess3(LOGINID)+","+ doPreProcess3(OPENO)+","+ doPreProcess3(MORCONTNAME)+","+ doPreProcess3(MORCONTNO)+",to_date("+doPreProcess3(MORCONTDATE)+",'yyyy-mm-dd'),"+ doPreProcess3(APPREGREA)+","+ doPreProcess3(PRICLASECKIND)+","+PRICLASECAM+",to_date("+doPreProcess3(PEFPERFROM)+",'yyyy-mm-dd'),to_date("+doPreProcess3(PEFPERTO)+",'yyyy-mm-dd'),"+ doPreProcess3(PRICRE)+","+INTEREST+","+DEFAM+","+DAMCOMAM+","+EXPENSE+","+ doPreProcess3(CONTOTHSTI)+","+ doPreProcess3(MORTGAGORTYPE)+","+ doPreProcess3(MOREPRIPID)+","+ doPreProcess3(MORE)+","+ doPreProcess3(MORTGAGOADDRESS)+","+ doPreProcess3(MOREAGENT)+","+ doPreProcess3(MORECERTYPE)+","+ doPreProcess3(MOREPERNO)+","+ doPreProcess3(MORTGAGOPRIPID)+","+ doPreProcess3(MORTGAGO)+","+ doPreProcess3(MORTGAGOAGENT)+","+ doPreProcess3(MORTGAGOCERTYPE)+","+ doPreProcess3(MORTGAGORPERNO)+","+ doPreProcess3(REGORG)+",to_date("+doPreProcess3(REGDATE)+",'yyyy-mm-dd'),"+ doPreProcess3(MORREGCNO)+",to_date("+doPreProcess3(ISSCARDDATE)+",'yyyy-mm-dd'),"+SIGN+","+ doPreProcess3(REMARK)+","+ doPreProcess3(MAINCONTTYPE)+","+MAINCONTAM+","+ doPreProcess3(DYRDLZZLX)+","+ doPreProcess3(DYRDLZZHM)+","+ doPreProcess3(DYQRDLZZLX)+","+ doPreProcess3(DYQRDLZZHM)+","+ doPreProcess3(ENTTYPE)+","+ doPreProcess3(REGORUN)+")";
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
		String sqlCount="SELECT COUNT(*) FROM DCDY_JBXX_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlModify="UPDATE DCDY_JBXX_SQ SET OPETYPE="+doPreProcess3(OPETYPE)+",STATUS="+ doPreProcess3(STATUS)+",LOGINID="+ doPreProcess3(LOGINID)+",OPENO="+ doPreProcess3(OPENO)+",MORCONTNAME="+ doPreProcess3(MORCONTNAME)+",MORCONTNO="+ doPreProcess3(MORCONTNO)+",MORCONTDATE=to_date("+doPreProcess3(MORCONTDATE)+",'yyyy-mm-dd'),APPREGREA="+ doPreProcess3(APPREGREA)+",PRICLASECKIND="+ doPreProcess3(PRICLASECKIND)+",PRICLASECAM="+PRICLASECAM+",PEFPERFROM=to_date("+doPreProcess3(PEFPERFROM)+",'yyyy-mm-dd'),PEFPERTO=to_date("+doPreProcess3(PEFPERTO)+",'yyyy-mm-dd'),PRICRE="+ doPreProcess3(PRICRE)+",INTEREST="+INTEREST+",DEFAM="+DEFAM+",DAMCOMAM="+DAMCOMAM+",EXPENSE="+EXPENSE+",CONTOTHSTI="+ doPreProcess3(CONTOTHSTI)+",MORTGAGORTYPE="+ doPreProcess3(MORTGAGORTYPE)+",MOREPRIPID="+ doPreProcess3(MOREPRIPID)+",MORE="+ doPreProcess3(MORE)+",MORTGAGOADDRESS="+ doPreProcess3(MORTGAGOADDRESS)+",MOREAGENT="+ doPreProcess3(MOREAGENT)+",MORECERTYPE="+ doPreProcess3(MORECERTYPE)+",MOREPERNO="+ doPreProcess3(MOREPERNO)+",MORTGAGOPRIPID="+ doPreProcess3(MORTGAGOPRIPID)+",MORTGAGO="+ doPreProcess3(MORTGAGO)+",MORTGAGOAGENT="+ doPreProcess3(MORTGAGOAGENT)+",MORTGAGOCERTYPE="+ doPreProcess3(MORTGAGOCERTYPE)+",MORTGAGORPERNO="+ doPreProcess3(MORTGAGORPERNO)+",REGORG="+ doPreProcess3(REGORG)+",REGDATE=to_date("+doPreProcess3(REGDATE)+",'yyyy-mm-dd'),MORREGCNO="+ doPreProcess3(MORREGCNO)+",ISSCARDDATE=to_date("+doPreProcess3(ISSCARDDATE)+",'yyyy-mm-dd'),SIGN="+SIGN+",REMARK="+ doPreProcess3(REMARK)+",MAINCONTTYPE="+ doPreProcess3(MAINCONTTYPE)+",MAINCONTAM="+MAINCONTAM+",DYRDLZZLX="+ doPreProcess3(DYRDLZZLX)+",DYRDLZZHM="+ doPreProcess3(DYRDLZZHM)+",DYQRDLZZLX="+ doPreProcess3(DYQRDLZZLX)+",DYQRDLZZHM="+ doPreProcess3(DYQRDLZZHM)+",ENTTYPE="+ doPreProcess3(ENTTYPE)+",REGORUN="+ doPreProcess3(REGORUN)+""+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlDelete="DELETE FROM DCDY_JBXX_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlCount="SELECT COUNT(*) FROM DCDY_JBXX_SQ";
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
		String sqlList="SELECT * FROM DCDY_JBXX_SQ";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			DCDY_JBXX_SQ bTable=new DCDY_JBXX_SQ();
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
		String sqlList="SELECT * FROM DCDY_JBXX_SQ";
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
			DCDY_JBXX_SQ bTable=new DCDY_JBXX_SQ();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlArr="SELECT * FROM DCDY_JBXX_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
