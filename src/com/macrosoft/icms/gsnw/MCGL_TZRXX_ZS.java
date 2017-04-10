package com.macrosoft.icms.gsnw;

import java.sql.*;
import java.util.*;

import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.gsdbc.GsDbConnection;
import com.macrosoft.icms.*;
import com.macrosoft.icms.system.*;
public class MCGL_TZRXX_ZS
{
	String RECID;
	String NAMEID;
	String INVID;
	String INV;
	String INVTYPE;
	String BLICTYPE;
	String BLICNO;
	String CERTYPE;
	String CERNO;
	String CONTINENT;
	String COUNTRY;
	float SUBCONAM;
	String CURRENCY;
	float ROE;
	float SUBCONAMUSD;
	float SUBCONPROP;
	String SCONFORM;
	String S_EXT_TIMESTAMP;
	public String getRECID()
	{
		return doPreProcess(RECID);
	}

	public void setRECID( String RECID)
	{
		this.RECID=doPreProcess2(convertCode(RECID));
	}

	public String getNAMEID()
	{
		return doPreProcess(NAMEID);
	}

	public void setNAMEID( String NAMEID)
	{
		this.NAMEID=doPreProcess2(convertCode(NAMEID));
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

	public float getSUBCONAM()
	{
		return SUBCONAM;
	}

	public void setSUBCONAM( float SUBCONAM)
	{
		this.SUBCONAM=SUBCONAM ;
	}

	public String getCURRENCY()
	{
		return doPreProcess(CURRENCY);
	}

	public void setCURRENCY( String CURRENCY)
	{
		this.CURRENCY=doPreProcess2(convertCode(CURRENCY));
	}

	public float getROE()
	{
		return ROE;
	}

	public void setROE( float ROE)
	{
		this.ROE=ROE ;
	}

	public float getSUBCONAMUSD()
	{
		return SUBCONAMUSD;
	}

	public void setSUBCONAMUSD( float SUBCONAMUSD)
	{
		this.SUBCONAMUSD=SUBCONAMUSD ;
	}

	public float getSUBCONPROP()
	{
		return SUBCONPROP;
	}

	public void setSUBCONPROP( float SUBCONPROP)
	{
		this.SUBCONPROP=SUBCONPROP ;
	}

	public String getSCONFORM()
	{
		return doPreProcess(SCONFORM);
	}

	public void setSCONFORM( String SCONFORM)
	{
		this.SCONFORM=doPreProcess2(convertCode(SCONFORM));
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
		String sqlSelect="SELECT * FROM MCGL_TZRXX_ZS"+" WHERE RECID='"+doPreProcess(RECID)+"'";
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
	NAMEID=rsSelect.getString("NAMEID");
	INVID=rsSelect.getString("INVID");
	INV=rsSelect.getString("INV");
	INVTYPE=rsSelect.getString("INVTYPE");
	BLICTYPE=rsSelect.getString("BLICTYPE");
	BLICNO=rsSelect.getString("BLICNO");
	CERTYPE=rsSelect.getString("CERTYPE");
	CERNO=rsSelect.getString("CERNO");
	CONTINENT=rsSelect.getString("CONTINENT");
	COUNTRY=rsSelect.getString("COUNTRY");
	SUBCONAM=rsSelect.getFloat("SUBCONAM");
	CURRENCY=rsSelect.getString("CURRENCY");
	ROE=rsSelect.getFloat("ROE");
	SUBCONAMUSD=rsSelect.getFloat("SUBCONAMUSD");
	SUBCONPROP=rsSelect.getFloat("CONPROP");
	SCONFORM=rsSelect.getString("SCONFORM");
	S_EXT_TIMESTAMP=rsSelect.getString("S_EXT_TIMESTAMP");
	}

	public boolean doAdd() throws SQLException
	{
		GsDbConnection dbc=new GsDbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd="INSERT INTO MCGL_TZRXX_ZS(RECID,NAMEID,INVID,INV,INVTYPE,BLICTYPE,BLICNO,CERTYPE,CERNO,CONTINENT,COUNTRY,SUBCONAM,CURRENCY,ROE,SUBCONAMUSD,CONPROP,SCONFORM,S_EXT_TIMESTAMP) VALUES("+ doPreProcess3(RECID)+","+ doPreProcess3(NAMEID)+","+ doPreProcess3(INVID)+","+ doPreProcess3(INV)+","+ doPreProcess3(INVTYPE)+","+ doPreProcess3(BLICTYPE)+","+ doPreProcess3(BLICNO)+","+ doPreProcess3(CERTYPE)+","+ doPreProcess3(CERNO)+","+ doPreProcess3(CONTINENT)+","+ doPreProcess3(COUNTRY)+","+SUBCONAM+","+ doPreProcess3(CURRENCY)+","+ROE+","+SUBCONAMUSD+","+SUBCONPROP+","+ doPreProcess3(SCONFORM)+","+ doPreProcess3(S_EXT_TIMESTAMP)+")";
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
		String sqlCount="SELECT COUNT(*) FROM MCGL_TZRXX_ZS"+" WHERE RECID='"+doPreProcess(RECID)+"'";
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
		String sqlModify="UPDATE MCGL_TZRXX_ZS SET RECID="+ doPreProcess3(RECID)+",NAMEID="+ doPreProcess3(NAMEID)+",INVID="+ doPreProcess3(INVID)+",INV="+ doPreProcess3(INV)+",INVTYPE="+ doPreProcess3(INVTYPE)+",BLICTYPE="+ doPreProcess3(BLICTYPE)+",BLICNO="+ doPreProcess3(BLICNO)+",CERTYPE="+ doPreProcess3(CERTYPE)+",CERNO="+ doPreProcess3(CERNO)+",CONTINENT="+ doPreProcess3(CONTINENT)+",COUNTRY="+ doPreProcess3(COUNTRY)+",SUBCONAM="+SUBCONAM+",CURRENCY="+ doPreProcess3(CURRENCY)+",ROE="+ROE+",SUBCONAMUSD="+SUBCONAMUSD+",CONPROP="+SUBCONPROP+",SCONFORM="+ doPreProcess3(SCONFORM)+",S_EXT_TIMESTAMP="+ doPreProcess3(S_EXT_TIMESTAMP)+""+" WHERE RECID='"+doPreProcess(RECID)+"'";
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
		String sqlDelete="DELETE FROM MCGL_TZRXX_ZS"+" WHERE RECID='"+doPreProcess(RECID)+"'";
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
		String sqlCount="SELECT COUNT(*) FROM MCGL_TZRXX_ZS";
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
		String sqlList="SELECT * FROM MCGL_TZRXX_ZS";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			MCGL_TZRXX_ZS bTable=new MCGL_TZRXX_ZS();
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
		String sqlList="SELECT * FROM MCGL_TZRXX_ZS";
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
			MCGL_TZRXX_ZS bTable=new MCGL_TZRXX_ZS();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException
	{
		GsDbConnection dbc=new GsDbConnection();
		String sqlArr="SELECT * FROM MCGL_TZRXX_ZS"+" WHERE RECID='"+doPreProcess(RECID)+"'";
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
