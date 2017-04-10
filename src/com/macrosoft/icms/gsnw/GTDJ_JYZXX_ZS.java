package com.macrosoft.icms.gsnw;
import java.sql.*;
import java.util.*;
import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.gsdbc.GsDbConnection;
import com.macrosoft.icms.*;
import com.macrosoft.icms.system.*;
public class GTDJ_JYZXX_ZS
{
	String PRIPID;
	String NAME;
	String SEX;
	String NATDATE;
	String LITEDEG;
	String NATION;
	String DOM;
	String POSTALCODE;
	String TEL;
	String EMAIL;
	String POLSTAND;
	String OCCSTBEAPP;
	String OPERAREA;
	String CERTYPE;
	String CERNO;
	int CERVALPER;
	String CERISSDATE;
	String CER1TYPE;
	String CER1NO;
	String CER1ISSDATE;
	int CER1VALPER;
	String NOTORG;
	String NOTDOCNO;
	String FAVOURTYPE;
	String WHETHERHKMAC;
	String IFUNEMPLOYED;
	String PERSONTYPE;
	String S_EXT_TIMESTAMP;
	String MOBTEL;
	public String getMOBTEL() {
		return doPreProcess(MOBTEL);
	}

	public void setMOBTEL(String mOBTEL) {
		MOBTEL = mOBTEL;
	}
	public String getPRIPID()
	{
		return doPreProcess(PRIPID);
	}

	public void setPRIPID( String PRIPID)
	{
		this.PRIPID=doPreProcess2(convertCode(PRIPID));
	}

	public String getNAME()
	{
		return doPreProcess(NAME);
	}

	public void setNAME( String NAME)
	{
		this.NAME=doPreProcess2(convertCode(NAME));
	}

	public String getSEX()
	{
		return doPreProcess(SEX);
	}

	public void setSEX( String SEX)
	{
		this.SEX=doPreProcess2(convertCode(SEX));
	}

	public String getNATDATE()
	{
		return doPreProcess(NATDATE);
	}

	public void setNATDATE( String NATDATE)
	{
		this.NATDATE=doPreProcess2(convertCode(NATDATE));
	}

	public String getLITEDEG()
	{
		return doPreProcess(LITEDEG);
	}

	public void setLITEDEG( String LITEDEG)
	{
		this.LITEDEG=doPreProcess2(convertCode(LITEDEG));
	}

	public String getNATION()
	{
		return doPreProcess(NATION);
	}

	public void setNATION( String NATION)
	{
		this.NATION=doPreProcess2(convertCode(NATION));
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

	public String getPOLSTAND()
	{
		return doPreProcess(POLSTAND);
	}

	public void setPOLSTAND( String POLSTAND)
	{
		this.POLSTAND=doPreProcess2(convertCode(POLSTAND));
	}

	public String getOCCSTBEAPP()
	{
		return doPreProcess(OCCSTBEAPP);
	}

	public void setOCCSTBEAPP( String OCCSTBEAPP)
	{
		this.OCCSTBEAPP=doPreProcess2(convertCode(OCCSTBEAPP));
	}

	public String getOPERAREA()
	{
		return doPreProcess(OPERAREA);
	}

	public void setOPERAREA( String OPERAREA)
	{
		this.OPERAREA=doPreProcess2(convertCode(OPERAREA));
	}

	public String getCERTYPE()
	{
		return doPreProcess(CERTYPE);
	}

	public void setCERTYPE( String CERTYPE)
	{
		this.CERTYPE=doPreProcess2(convertCode(CERTYPE));
	}

	public String getCERNO()
	{
		return doPreProcess(CERNO);
	}

	public void setCERNO( String CERNO)
	{
		this.CERNO=doPreProcess2(convertCode(CERNO));
	}

	public int getCERVALPER()
	{
		return CERVALPER;
	}

	public void setCERVALPER( int CERVALPER)
	{
		this.CERVALPER=CERVALPER ;
	}

	public String getCERISSDATE()
	{
		return doPreProcess(CERISSDATE);
	}

	public void setCERISSDATE( String CERISSDATE)
	{
		this.CERISSDATE=doPreProcess2(convertCode(CERISSDATE));
	}

	public String getCER1TYPE()
	{
		return doPreProcess(CER1TYPE);
	}

	public void setCER1TYPE( String CER1TYPE)
	{
		this.CER1TYPE=doPreProcess2(convertCode(CER1TYPE));
	}

	public String getCER1NO()
	{
		return doPreProcess(CER1NO);
	}

	public void setCER1NO( String CER1NO)
	{
		this.CER1NO=doPreProcess2(convertCode(CER1NO));
	}

	public String getCER1ISSDATE()
	{
		return doPreProcess(CER1ISSDATE);
	}

	public void setCER1ISSDATE( String CER1ISSDATE)
	{
		this.CER1ISSDATE=doPreProcess2(convertCode(CER1ISSDATE));
	}

	public int getCER1VALPER()
	{
		return CER1VALPER;
	}

	public void setCER1VALPER( int CER1VALPER)
	{
		this.CER1VALPER=CER1VALPER ;
	}

	public String getNOTORG()
	{
		return doPreProcess(NOTORG);
	}

	public void setNOTORG( String NOTORG)
	{
		this.NOTORG=doPreProcess2(convertCode(NOTORG));
	}

	public String getNOTDOCNO()
	{
		return doPreProcess(NOTDOCNO);
	}

	public void setNOTDOCNO( String NOTDOCNO)
	{
		this.NOTDOCNO=doPreProcess2(convertCode(NOTDOCNO));
	}

	public String getFAVOURTYPE()
	{
		return doPreProcess(FAVOURTYPE);
	}

	public void setFAVOURTYPE( String FAVOURTYPE)
	{
		this.FAVOURTYPE=doPreProcess2(convertCode(FAVOURTYPE));
	}

	public String getWHETHERHKMAC()
	{
		return doPreProcess(WHETHERHKMAC);
	}

	public void setWHETHERHKMAC( String WHETHERHKMAC)
	{
		this.WHETHERHKMAC=doPreProcess2(convertCode(WHETHERHKMAC));
	}

	public String getIFUNEMPLOYED()
	{
		return doPreProcess(IFUNEMPLOYED);
	}

	public void setIFUNEMPLOYED( String IFUNEMPLOYED)
	{
		this.IFUNEMPLOYED=doPreProcess2(convertCode(IFUNEMPLOYED));
	}

	public String getPERSONTYPE()
	{
		return doPreProcess(PERSONTYPE);
	}

	public void setPERSONTYPE( String PERSONTYPE)
	{
		this.PERSONTYPE=doPreProcess2(convertCode(PERSONTYPE));
	}

	public String getS_EXT_TIMESTAMP()
	{
		return doPreProcess(S_EXT_TIMESTAMP);
	}

	public void setS_EXT_TIMESTAMP( String S_EXT_TIMESTAMP)
	{
		this.S_EXT_TIMESTAMP=doPreProcess2(convertCode(S_EXT_TIMESTAMP));
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
		String sqlSelect="SELECT * FROM GTDJ_JYZXX_ZS"+" WHERE PRIPID='"+doPreProcess(PRIPID)+"'";
		rsSelect=dbc.executeQuery(sqlSelect);
		if(rsSelect.next())
		{
			doSetData( rsSelect );
		}
		dbc.close();
	}

	public void doSetData( ResultSet rsSelect ) throws SQLException
	{
	PRIPID=rsSelect.getString("PRIPID");
	NAME=rsSelect.getString("NAME");
	SEX=rsSelect.getString("SEX");
	NATDATE=String.valueOf(rsSelect.getDate("NATDATE"));
	LITEDEG=rsSelect.getString("LITEDEG");
	NATION=rsSelect.getString("NATION");
	DOM=rsSelect.getString("DOM");
	POSTALCODE=rsSelect.getString("POSTALCODE");
	TEL=rsSelect.getString("TEL");
	EMAIL=rsSelect.getString("EMAIL");
	POLSTAND=rsSelect.getString("POLSTAND");
	OCCSTBEAPP=rsSelect.getString("OCCSTBEAPP");
	OPERAREA=rsSelect.getString("OPERAREA");
	CERTYPE=rsSelect.getString("CERTYPE");
	CERNO=rsSelect.getString("CERNO");
	CERVALPER=rsSelect.getInt("CERVALPER");
	CERISSDATE=String.valueOf(rsSelect.getDate("CERISSDATE"));
	CER1TYPE=rsSelect.getString("CER1TYPE");
	CER1NO=rsSelect.getString("CER1NO");
	CER1ISSDATE=String.valueOf(rsSelect.getDate("CER1ISSDATE"));
	CER1VALPER=rsSelect.getInt("CER1VALPER");
	NOTORG=rsSelect.getString("NOTORG");
	NOTDOCNO=rsSelect.getString("NOTDOCNO");
	FAVOURTYPE=rsSelect.getString("FAVOURTYPE");
	WHETHERHKMAC=rsSelect.getString("WHETHERHKMAC");
	IFUNEMPLOYED=rsSelect.getString("IFUNEMPLOYED");
	PERSONTYPE=rsSelect.getString("PERSONTYPE");
	S_EXT_TIMESTAMP=rsSelect.getString("S_EXT_TIMESTAMP");
	MOBTEL=rsSelect.getString("MOBTEL");
	}

	public boolean doAdd() throws SQLException
	{
		GsDbConnection dbc=new GsDbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd="INSERT INTO GTDJ_JYZXX_ZS(PRIPID,NAME,SEX,NATDATE,LITEDEG,NATION,DOM,POSTALCODE,TEL,EMAIL,POLSTAND,OCCSTBEAPP,OPERAREA,CERTYPE,CERNO,CERVALPER,CERISSDATE,CER1TYPE,CER1NO,CER1ISSDATE,CER1VALPER,NOTORG,NOTDOCNO,FAVOURTYPE,WHETHERHKMAC,IFUNEMPLOYED,PERSONTYPE,S_EXT_TIMESTAMP,MOBTEL) VALUES("+ doPreProcess3(PRIPID)+","+ doPreProcess3(NAME)+","+ doPreProcess3(SEX)+",to_date("+doPreProcess3(NATDATE)+",'yyyy-mm-dd'),"+ doPreProcess3(LITEDEG)+","+ doPreProcess3(NATION)+","+ doPreProcess3(DOM)+","+ doPreProcess3(POSTALCODE)+","+ doPreProcess3(TEL)+","+ doPreProcess3(EMAIL)+","+ doPreProcess3(POLSTAND)+","+ doPreProcess3(OCCSTBEAPP)+","+ doPreProcess3(OPERAREA)+","+ doPreProcess3(CERTYPE)+","+ doPreProcess3(CERNO)+","+CERVALPER+",to_date("+doPreProcess3(CERISSDATE)+",'yyyy-mm-dd'),"+ doPreProcess3(CER1TYPE)+","+ doPreProcess3(CER1NO)+",to_date("+doPreProcess3(CER1ISSDATE)+",'yyyy-mm-dd'),"+CER1VALPER+","+ doPreProcess3(NOTORG)+","+ doPreProcess3(NOTDOCNO)+","+ doPreProcess3(FAVOURTYPE)+","+ doPreProcess3(WHETHERHKMAC)+","+ doPreProcess3(IFUNEMPLOYED)+","+ doPreProcess3(PERSONTYPE)+","+ doPreProcess3(S_EXT_TIMESTAMP)+","+ doPreProcess3(MOBTEL)+")";
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
		String sqlCount="SELECT COUNT(*) FROM GTDJ_JYZXX_ZS"+" WHERE PRIPID='"+doPreProcess(PRIPID)+"'";
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
		String sqlModify="UPDATE GTDJ_JYZXX_ZS SET PRIPID="+ doPreProcess3(PRIPID)+",NAME="+ doPreProcess3(NAME)+",SEX="+ doPreProcess3(SEX)+",NATDATE=to_date("+doPreProcess3(NATDATE)+",'yyyy-mm-dd'),LITEDEG="+ doPreProcess3(LITEDEG)+",NATION="+ doPreProcess3(NATION)+",DOM="+ doPreProcess3(DOM)+",POSTALCODE="+ doPreProcess3(POSTALCODE)+",TEL="+ doPreProcess3(TEL)+",EMAIL="+ doPreProcess3(EMAIL)+",POLSTAND="+ doPreProcess3(POLSTAND)+",OCCSTBEAPP="+ doPreProcess3(OCCSTBEAPP)+",OPERAREA="+ doPreProcess3(OPERAREA)+",CERTYPE="+ doPreProcess3(CERTYPE)+",CERNO="+ doPreProcess3(CERNO)+",CERVALPER="+CERVALPER+",CERISSDATE=to_date("+doPreProcess3(CERISSDATE)+",'yyyy-mm-dd'),CER1TYPE="+ doPreProcess3(CER1TYPE)+",CER1NO="+ doPreProcess3(CER1NO)+",CER1ISSDATE=to_date("+doPreProcess3(CER1ISSDATE)+",'yyyy-mm-dd'),CER1VALPER="+CER1VALPER+",NOTORG="+ doPreProcess3(NOTORG)+",NOTDOCNO="+ doPreProcess3(NOTDOCNO)+",FAVOURTYPE="+ doPreProcess3(FAVOURTYPE)+",WHETHERHKMAC="+ doPreProcess3(WHETHERHKMAC)+",IFUNEMPLOYED="+ doPreProcess3(IFUNEMPLOYED)+",PERSONTYPE="+ doPreProcess3(PERSONTYPE)+",S_EXT_TIMESTAMP="+ doPreProcess3(S_EXT_TIMESTAMP)+",MOBTEL="+ doPreProcess3(MOBTEL)+" WHERE PRIPID='"+doPreProcess(PRIPID)+"'";
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
		String sqlDelete="DELETE FROM GTDJ_JYZXX_ZS"+" WHERE PRIPID='"+doPreProcess(PRIPID)+"'";
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
		String sqlCount="SELECT COUNT(*) FROM GTDJ_JYZXX_ZS";
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
		String sqlList="SELECT * FROM GTDJ_JYZXX_ZS";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			GTDJ_JYZXX_ZS bTable=new GTDJ_JYZXX_ZS();
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
		String sqlList="SELECT * FROM GTDJ_JYZXX_ZS";
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
			GTDJ_JYZXX_ZS bTable=new GTDJ_JYZXX_ZS();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException
	{
		GsDbConnection dbc=new GsDbConnection();
		String sqlArr="SELECT * FROM GTDJ_JYZXX_ZS"+" WHERE PRIPID='"+doPreProcess(PRIPID)+"'";
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
