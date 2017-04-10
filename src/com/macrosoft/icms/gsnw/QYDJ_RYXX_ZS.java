package com.macrosoft.icms.gsnw;
import java.sql.*;
import java.util.*;
import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.gsdbc.GsDbConnection;
import com.macrosoft.icms.*;
import com.macrosoft.icms.system.*;
public class QYDJ_RYXX_ZS
{
	String MOBEL;
	String EMAIL;
	String RECID;
	String PRIPID;
	String NAME;
	String SEX;
	String NATDATE;
	String CERTYPE;
	String CERNO;
	String POSITION;
	String OFFHFROM;
	String OFFHTO;
	String POSBRFORM;
	String LEREPSIGN;
	String APPOUNIT;
	String OFFSIGN;
	String TEL;
	String POSTALCODE;
	String HOUSEADD;
	String COUNTRY;
	String ACCDSIDE;
	String CERISSDATE;
	String CERVALPER;
	String ARRCHDATE;
	String HOUSEADDINCHINA;
	String CHIOFTHEDESIGN;
	String OCCSTBEAPP;
	String LITEDEG;
	String POLSTAND;
	String NATION;
	String IFUNEMP;
	String IFUNIVERSAL;
	String S_EXT_TIMESTAMP;
	public String getMOBEL()
	{
		return doPreProcess(MOBEL);
	}

	public void setMOBEL( String MOBEL)
	{
		this.MOBEL=doPreProcess2(convertCode(MOBEL));
	}

	public String getEMAIL()
	{
		return doPreProcess(EMAIL);
	}

	public void setEMAIL( String EMAIL)
	{
		this.EMAIL=doPreProcess2(convertCode(EMAIL));
	}

	public String getRECID()
	{
		return doPreProcess(RECID);
	}

	public void setRECID( String RECID)
	{
		this.RECID=doPreProcess2(convertCode(RECID));
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

	public String getPOSITION()
	{
		return doPreProcess(POSITION);
	}

	public void setPOSITION( String POSITION)
	{
		this.POSITION=doPreProcess2(convertCode(POSITION));
	}

	public String getOFFHFROM()
	{
		return doPreProcess(OFFHFROM);
	}

	public void setOFFHFROM( String OFFHFROM)
	{
		this.OFFHFROM=doPreProcess2(convertCode(OFFHFROM));
	}

	public String getOFFHTO()
	{
		return doPreProcess(OFFHTO);
	}

	public void setOFFHTO( String OFFHTO)
	{
		this.OFFHTO=doPreProcess2(convertCode(OFFHTO));
	}

	public String getPOSBRFORM()
	{
		return doPreProcess(POSBRFORM);
	}

	public void setPOSBRFORM( String POSBRFORM)
	{
		this.POSBRFORM=doPreProcess2(convertCode(POSBRFORM));
	}

	public String getLEREPSIGN()
	{
		return doPreProcess(LEREPSIGN);
	}

	public void setLEREPSIGN( String LEREPSIGN)
	{
		this.LEREPSIGN=doPreProcess2(convertCode(LEREPSIGN));
	}

	public String getAPPOUNIT()
	{
		return doPreProcess(APPOUNIT);
	}

	public void setAPPOUNIT( String APPOUNIT)
	{
		this.APPOUNIT=doPreProcess2(convertCode(APPOUNIT));
	}

	public String getOFFSIGN()
	{
		return doPreProcess(OFFSIGN);
	}

	public void setOFFSIGN( String OFFSIGN)
	{
		this.OFFSIGN=doPreProcess2(convertCode(OFFSIGN));
	}

	public String getTEL()
	{
		return doPreProcess(TEL);
	}

	public void setTEL( String TEL)
	{
		this.TEL=doPreProcess2(convertCode(TEL));
	}

	public String getPOSTALCODE()
	{
		return doPreProcess(POSTALCODE);
	}

	public void setPOSTALCODE( String POSTALCODE)
	{
		this.POSTALCODE=doPreProcess2(convertCode(POSTALCODE));
	}

	public String getHOUSEADD()
	{
		return doPreProcess(HOUSEADD);
	}

	public void setHOUSEADD( String HOUSEADD)
	{
		this.HOUSEADD=doPreProcess2(convertCode(HOUSEADD));
	}

	public String getCOUNTRY()
	{
		return doPreProcess(COUNTRY);
	}

	public void setCOUNTRY( String COUNTRY)
	{
		this.COUNTRY=doPreProcess2(convertCode(COUNTRY));
	}

	public String getACCDSIDE()
	{
		return doPreProcess(ACCDSIDE);
	}

	public void setACCDSIDE( String ACCDSIDE)
	{
		this.ACCDSIDE=doPreProcess2(convertCode(ACCDSIDE));
	}

	public String getCERISSDATE()
	{
		return doPreProcess(CERISSDATE);
	}

	public void setCERISSDATE( String CERISSDATE)
	{
		this.CERISSDATE=doPreProcess2(convertCode(CERISSDATE));
	}

	public String getCERVALPER()
	{
		return doPreProcess(CERVALPER);
	}

	public void setCERVALPER( String CERVALPER)
	{
		this.CERVALPER=doPreProcess2(convertCode(CERVALPER));
	}

	public String getARRCHDATE()
	{
		return doPreProcess(ARRCHDATE);
	}

	public void setARRCHDATE( String ARRCHDATE)
	{
		this.ARRCHDATE=doPreProcess2(convertCode(ARRCHDATE));
	}

	public String getHOUSEADDINCHINA()
	{
		return doPreProcess(HOUSEADDINCHINA);
	}

	public void setHOUSEADDINCHINA( String HOUSEADDINCHINA)
	{
		this.HOUSEADDINCHINA=doPreProcess2(convertCode(HOUSEADDINCHINA));
	}

	public String getCHIOFTHEDESIGN()
	{
		return doPreProcess(CHIOFTHEDESIGN);
	}

	public void setCHIOFTHEDESIGN( String CHIOFTHEDESIGN)
	{
		this.CHIOFTHEDESIGN=doPreProcess2(convertCode(CHIOFTHEDESIGN));
	}

	public String getOCCSTBEAPP()
	{
		return doPreProcess(OCCSTBEAPP);
	}

	public void setOCCSTBEAPP( String OCCSTBEAPP)
	{
		this.OCCSTBEAPP=doPreProcess2(convertCode(OCCSTBEAPP));
	}

	public String getLITEDEG()
	{
		return doPreProcess(LITEDEG);
	}

	public void setLITEDEG( String LITEDEG)
	{
		this.LITEDEG=doPreProcess2(convertCode(LITEDEG));
	}

	public String getPOLSTAND()
	{
		return doPreProcess(POLSTAND);
	}

	public void setPOLSTAND( String POLSTAND)
	{
		this.POLSTAND=doPreProcess2(convertCode(POLSTAND));
	}

	public String getNATION()
	{
		return doPreProcess(NATION);
	}

	public void setNATION( String NATION)
	{
		this.NATION=doPreProcess2(convertCode(NATION));
	}

	public String getIFUNEMP()
	{
		return doPreProcess(IFUNEMP);
	}

	public void setIFUNEMP( String IFUNEMP)
	{
		this.IFUNEMP=doPreProcess2(convertCode(IFUNEMP));
	}

	public String getIFUNIVERSAL()
	{
		return doPreProcess(IFUNIVERSAL);
	}

	public void setIFUNIVERSAL( String IFUNIVERSAL)
	{
		this.IFUNIVERSAL=doPreProcess2(convertCode(IFUNIVERSAL));
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
		String sqlSelect="SELECT * FROM QYDJ_RYXX_ZS"+" WHERE RECID='"+doPreProcess(RECID)+"' and PRIPID='"+doPreProcess(PRIPID)+"'";
		rsSelect=dbc.executeQuery(sqlSelect);
		if(rsSelect.next())
		{
			doSetData( rsSelect );
		}
		dbc.close();
	}

	public void doSetData( ResultSet rsSelect ) throws SQLException
	{
	MOBEL=rsSelect.getString("MOBEL");
	EMAIL=rsSelect.getString("EMAIL");
	RECID=rsSelect.getString("RECID");
	PRIPID=rsSelect.getString("PRIPID");
	NAME=rsSelect.getString("NAME");
	SEX=rsSelect.getString("SEX");
	NATDATE=String.valueOf(rsSelect.getDate("NATDATE"));
	CERTYPE=rsSelect.getString("CERTYPE");
	CERNO=rsSelect.getString("CERNO");
	POSITION=rsSelect.getString("POSITION");
	OFFHFROM=String.valueOf(rsSelect.getDate("OFFHFROM"));
	OFFHTO=String.valueOf(rsSelect.getDate("OFFHTO"));
	POSBRFORM=rsSelect.getString("POSBRFORM");
	LEREPSIGN=rsSelect.getString("LEREPSIGN");
	APPOUNIT=rsSelect.getString("APPOUNIT");
	OFFSIGN=rsSelect.getString("OFFSIGN");
	TEL=rsSelect.getString("TEL");
	POSTALCODE=rsSelect.getString("POSTALCODE");
	HOUSEADD=rsSelect.getString("HOUSEADD");
	COUNTRY=rsSelect.getString("COUNTRY");
	ACCDSIDE=rsSelect.getString("ACCDSIDE");
	CERISSDATE=String.valueOf(rsSelect.getDate("CERISSDATE"));
	CERVALPER=String.valueOf(rsSelect.getDate("CERVALPER"));
	ARRCHDATE=String.valueOf(rsSelect.getDate("ARRCHDATE"));
	HOUSEADDINCHINA=rsSelect.getString("HOUSEADDINCHINA");
	CHIOFTHEDESIGN=rsSelect.getString("CHIOFTHEDESIGN");
	OCCSTBEAPP=rsSelect.getString("OCCSTBEAPP");
	LITEDEG=rsSelect.getString("LITEDEG");
	POLSTAND=rsSelect.getString("POLSTAND");
	NATION=rsSelect.getString("NATION");
	IFUNEMP=rsSelect.getString("IFUNEMP");
	IFUNIVERSAL=rsSelect.getString("IFUNIVERSAL");
	S_EXT_TIMESTAMP=rsSelect.getString("S_EXT_TIMESTAMP");
	}

	public void doSelectByPripid() throws SQLException
	{
		GsDbConnection dbc=new GsDbConnection();
		ResultSet rsSelect;
		String sqlSelect="SELECT * FROM QYDJ_RYXX_ZS"+" WHERE PRIPID='"+doPreProcess(PRIPID)+"'";
		rsSelect=dbc.executeQuery(sqlSelect);
		if(rsSelect.next())
		{
			doSetData( rsSelect );
		}
		dbc.close();
	}
	
	public void doSelectByLEREPSIGN() throws SQLException
	{
		GsDbConnection dbc=new GsDbConnection();
		ResultSet rsSelect;
		String sqlSelect="SELECT * FROM QYDJ_RYXX_ZS"+" WHERE (LEREPSIGN='1' OR (LEREPSIGN='2' AND chiofthedesign = '1')) and PRIPID='"+doPreProcess(PRIPID)+"'";
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
		String sqlCount="SELECT COUNT(*) FROM QYDJ_RYXX_ZS"+" WHERE RECID='"+doPreProcess(RECID)+"' and PRIPID='"+doPreProcess(PRIPID)+"'";
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
		String sqlCount="SELECT COUNT(*) FROM QYDJ_RYXX_ZS";
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
		String sqlList="SELECT * FROM QYDJ_RYXX_ZS";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			QYDJ_RYXX_ZS bTable=new QYDJ_RYXX_ZS();
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
		String sqlList="SELECT * FROM QYDJ_RYXX_ZS";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		sqlList+=" AND ROWNUM<="+(startRow+PageSize);//start+pagesize 
		ResultSet rsList=dbc.executeQuery( sqlList);
		//��������Ѿ���ʾ����
		int	nDispRows=0;
		do
		{
			nDispRows++;
			if (nDispRows>startRow)	break;
		}
		while (rsList.next());
		while(rsList.next()) {
			QYDJ_RYXX_ZS bTable=new QYDJ_RYXX_ZS();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException
	{
		GsDbConnection dbc=new GsDbConnection();
		String sqlArr="SELECT * FROM QYDJ_RYXX_ZS"+" WHERE RECID='"+doPreProcess(RECID)+"' and PRIPID='"+doPreProcess(PRIPID)+"'";
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
