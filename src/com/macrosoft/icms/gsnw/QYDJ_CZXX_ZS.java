package com.macrosoft.icms.gsnw;
import java.sql.*;
import java.util.*;

import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.gsdbc.GsDbConnection;
import com.macrosoft.icms.*;
import com.macrosoft.icms.system.*;
public class QYDJ_CZXX_ZS
{
	String RECID;
	String PRIPID;
	String INVID;
	String INV;
	String INVTYPE;
	String CERTYPE;
	String CERNO;
	String BLICTYPE;
	String BLICNO;
	float SUBCONAM;
	String CONFORM;
	String CONDATE;
	float CONPROP;
	float ACCONAM;
	String ACCONFORM;
	String ACCONDATE;
	String BALDELTERM;
	String COUNTRY;
	float SUBCONPROP;
	float SUBCONAMUSD;
	float ACCONAMUSD;
	String DOM;
	String POSTALCODE;
	String TEL;
	String OCCST;
	String EXEAFFSIGN;
	String LITEDEG;
	String POLSTAND;
	String NATION;
	String INVPERAREA;
	String CURRENCY;
	String ACCDIRECTOR;
	String REALCONFORM;
	String ONDUTYSTY;
	String EVALSTY;
	String ISLOCAL;
	float ROE;
	String CONTINENT;
	String CONSIGN;
	String REMARK;
	String S_EXT_TIMESTAMP;
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

	public String getINVID()
	{
		return doPreProcess(INVID);
	}

	public void setINVID( String INVID)
	{
		this.INVID=doPreProcess2(convertCode(INVID));
	}

	public String getINV()
	{
		return doPreProcess(INV);
	}

	public void setINV( String INV)
	{
		this.INV=doPreProcess2(convertCode(INV));
	}

	public String getINVTYPE()
	{
		return doPreProcess(INVTYPE);
	}

	public void setINVTYPE( String INVTYPE)
	{
		this.INVTYPE=doPreProcess2(convertCode(INVTYPE));
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

	public String getBLICTYPE()
	{
		return doPreProcess(BLICTYPE);
	}

	public void setBLICTYPE( String BLICTYPE)
	{
		this.BLICTYPE=doPreProcess2(convertCode(BLICTYPE));
	}

	public String getBLICNO()
	{
		return doPreProcess(BLICNO);
	}

	public void setBLICNO( String BLICNO)
	{
		this.BLICNO=doPreProcess2(convertCode(BLICNO));
	}

	public float getSUBCONAM()
	{
		return SUBCONAM;
	}

	public void setSUBCONAM( float SUBCONAM)
	{
		this.SUBCONAM=SUBCONAM ;
	}

	public String getCONFORM()
	{
		return doPreProcess(CONFORM);
	}

	public void setCONFORM( String CONFORM)
	{
		this.CONFORM=doPreProcess2(convertCode(CONFORM));
	}

	public String getCONDATE()
	{
		return doPreProcess(CONDATE);
	}

	public void setCONDATE( String CONDATE)
	{
		this.CONDATE=doPreProcess2(convertCode(CONDATE));
	}

	public float getCONPROP()
	{
		return CONPROP;
	}

	public void setCONPROP( float CONPROP)
	{
		this.CONPROP=CONPROP ;
	}

	public float getACCONAM()
	{
		return ACCONAM;
	}

	public void setACCONAM( float ACCONAM)
	{
		this.ACCONAM=ACCONAM ;
	}

	public String getACCONFORM()
	{
		return doPreProcess(ACCONFORM);
	}

	public void setACCONFORM( String ACCONFORM)
	{
		this.ACCONFORM=doPreProcess2(convertCode(ACCONFORM));
	}

	public String getACCONDATE()
	{
		return doPreProcess(ACCONDATE);
	}

	public void setACCONDATE( String ACCONDATE)
	{
		this.ACCONDATE=doPreProcess2(convertCode(ACCONDATE));
	}

	public String getBALDELTERM()
	{
		return doPreProcess(BALDELTERM);
	}

	public void setBALDELTERM( String BALDELTERM)
	{
		this.BALDELTERM=doPreProcess2(convertCode(BALDELTERM));
	}

	public String getCOUNTRY()
	{
		return doPreProcess(COUNTRY);
	}

	public void setCOUNTRY( String COUNTRY)
	{
		this.COUNTRY=doPreProcess2(convertCode(COUNTRY));
	}

	public float getSUBCONPROP()
	{
		return SUBCONPROP;
	}

	public void setSUBCONPROP( float SUBCONPROP)
	{
		this.SUBCONPROP=SUBCONPROP ;
	}

	public float getSUBCONAMUSD()
	{
		return SUBCONAMUSD;
	}

	public void setSUBCONAMUSD( float SUBCONAMUSD)
	{
		this.SUBCONAMUSD=SUBCONAMUSD ;
	}

	public float getACCONAMUSD()
	{
		return ACCONAMUSD;
	}

	public void setACCONAMUSD( float ACCONAMUSD)
	{
		this.ACCONAMUSD=ACCONAMUSD ;
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

	public String getOCCST()
	{
		return doPreProcess(OCCST);
	}

	public void setOCCST( String OCCST)
	{
		this.OCCST=doPreProcess2(convertCode(OCCST));
	}

	public String getEXEAFFSIGN()
	{
		return doPreProcess(EXEAFFSIGN);
	}

	public void setEXEAFFSIGN( String EXEAFFSIGN)
	{
		this.EXEAFFSIGN=doPreProcess2(convertCode(EXEAFFSIGN));
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

	public String getINVPERAREA()
	{
		return doPreProcess(INVPERAREA);
	}

	public void setINVPERAREA( String INVPERAREA)
	{
		this.INVPERAREA=doPreProcess2(convertCode(INVPERAREA));
	}

	public String getCURRENCY()
	{
		return doPreProcess(CURRENCY);
	}

	public void setCURRENCY( String CURRENCY)
	{
		this.CURRENCY=doPreProcess2(convertCode(CURRENCY));
	}

	public String getACCDIRECTOR()
	{
		return doPreProcess(ACCDIRECTOR);
	}

	public void setACCDIRECTOR( String ACCDIRECTOR)
	{
		this.ACCDIRECTOR=doPreProcess2(convertCode(ACCDIRECTOR));
	}

	public String getREALCONFORM()
	{
		return doPreProcess(REALCONFORM);
	}

	public void setREALCONFORM( String REALCONFORM)
	{
		this.REALCONFORM=doPreProcess2(convertCode(REALCONFORM));
	}

	public String getONDUTYSTY()
	{
		return doPreProcess(ONDUTYSTY);
	}

	public void setONDUTYSTY( String ONDUTYSTY)
	{
		this.ONDUTYSTY=doPreProcess2(convertCode(ONDUTYSTY));
	}

	public String getEVALSTY()
	{
		return doPreProcess(EVALSTY);
	}

	public void setEVALSTY( String EVALSTY)
	{
		this.EVALSTY=doPreProcess2(convertCode(EVALSTY));
	}

	public String getISLOCAL()
	{
		return doPreProcess(ISLOCAL);
	}

	public void setISLOCAL( String ISLOCAL)
	{
		this.ISLOCAL=doPreProcess2(convertCode(ISLOCAL));
	}

	public float getROE()
	{
		return ROE;
	}

	public void setROE( float ROE)
	{
		this.ROE=ROE ;
	}

	public String getCONTINENT()
	{
		return doPreProcess(CONTINENT);
	}

	public void setCONTINENT( String CONTINENT)
	{
		this.CONTINENT=doPreProcess2(convertCode(CONTINENT));
	}

	public String getCONSIGN()
	{
		return doPreProcess(CONSIGN);
	}

	public void setCONSIGN( String CONSIGN)
	{
		this.CONSIGN=doPreProcess2(convertCode(CONSIGN));
	}

	public String getREMARK()
	{
		return doPreProcess(REMARK);
	}

	public void setREMARK( String REMARK)
	{
		this.REMARK=doPreProcess2(convertCode(REMARK));
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
	
	public void doSelect() throws SQLException
	{
		GsDbConnection dbc=new GsDbConnection();
		ResultSet rsSelect;
		String sqlSelect="SELECT * FROM QYDJ_CZXX_ZS"+" WHERE RECID='"+doPreProcess(RECID)+"'";
		rsSelect=dbc.executeQuery(sqlSelect);
		if(rsSelect.next())
		{
			doSetData( rsSelect );
		}
		dbc.close();
	}

	public void doSetData( ResultSet rsSelect ) throws SQLException
	{
	RECID=rsSelect.getString("RECID");
	PRIPID=rsSelect.getString("PRIPID");
	INVID=rsSelect.getString("INVID");
	INV=rsSelect.getString("INV");
	INVTYPE=rsSelect.getString("INVTYPE");
	CERTYPE=rsSelect.getString("CERTYPE");
	CERNO=rsSelect.getString("CERNO");
	BLICTYPE=rsSelect.getString("BLICTYPE");
	BLICNO=rsSelect.getString("BLICNO");
	SUBCONAM=rsSelect.getFloat("SUBCONAM");
	CONFORM=rsSelect.getString("CONFORM");
	CONDATE=String.valueOf(rsSelect.getDate("CONDATE"));
	CONPROP=rsSelect.getFloat("CONPROP");
	ACCONAM=rsSelect.getFloat("ACCONAM");
	ACCONFORM=rsSelect.getString("ACCONFORM");
	ACCONDATE=String.valueOf(rsSelect.getDate("ACCONDATE"));
	BALDELTERM=String.valueOf(rsSelect.getDate("BALDELTERM"));
	COUNTRY=rsSelect.getString("COUNTRY");
	SUBCONPROP=rsSelect.getFloat("SUBCONPROP");
	SUBCONAMUSD=rsSelect.getFloat("SUBCONAMUSD");
	ACCONAMUSD=rsSelect.getFloat("ACCONAMUSD");
	DOM=rsSelect.getString("DOM");
	POSTALCODE=rsSelect.getString("POSTALCODE");
	TEL=rsSelect.getString("TEL");
	OCCST=rsSelect.getString("OCCST");
	EXEAFFSIGN=rsSelect.getString("EXEAFFSIGN");
	LITEDEG=rsSelect.getString("LITEDEG");
	POLSTAND=rsSelect.getString("POLSTAND");
	NATION=rsSelect.getString("NATION");
	INVPERAREA=rsSelect.getString("INVPERAREA");
	CURRENCY=rsSelect.getString("CURRENCY");
	ACCDIRECTOR=rsSelect.getString("ACCDIRECTOR");
	REALCONFORM=rsSelect.getString("REALCONFORM");
	ONDUTYSTY=rsSelect.getString("ONDUTYSTY");
	EVALSTY=rsSelect.getString("EVALSTY");
	ISLOCAL=rsSelect.getString("ISLOCAL");
	ROE=rsSelect.getFloat("ROE");
	CONTINENT=rsSelect.getString("CONTINENT");
	CONSIGN=rsSelect.getString("CONSIGN");
	REMARK=rsSelect.getString("REMARK");
	S_EXT_TIMESTAMP=rsSelect.getString("S_EXT_TIMESTAMP");
	}
	
	public int getListCount(String sqlWhere ) throws SQLException
	{
		GsDbConnection dbc=new GsDbConnection();
		String sqlCount="SELECT COUNT(*) FROM QYDJ_CZXX_ZS";
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
		String sqlList="SELECT * FROM QYDJ_CZXX_ZS";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			QYDJ_CZXX_ZS bTable=new QYDJ_CZXX_ZS();
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
		String sqlList="SELECT * FROM QYDJ_CZXX_ZS";
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
			QYDJ_CZXX_ZS bTable=new QYDJ_CZXX_ZS();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException
	{
		GsDbConnection dbc=new GsDbConnection();
		String sqlArr="SELECT * FROM QYDJ_CZXX_ZS";
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
