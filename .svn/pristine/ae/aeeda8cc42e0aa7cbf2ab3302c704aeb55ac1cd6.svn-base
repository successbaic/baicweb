package com.macrosoft.icms.gsnw;

import java.sql.*;
import java.util.*;
import com.macrosoft.icms.*;
import com.macrosoft.icms.gsdbc.GsDbConnection;
import com.macrosoft.icms.system.*;
public class QYDJ_CWFZR_ZS
{
	String PRIPID;
	String NAME;
	String TEL;
	String MOBTEL;
	String EMAIL;
	String S_EXT_TIMESTAMP;
	String CERTYPE;
	String CERNO;
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

	public String getTEL()
	{
		return doPreProcess(TEL);
	}

	public void setTEL( String TEL)
	{
		this.TEL=doPreProcess2(convertCode(TEL));
	}

	public String getMOBTEL()
	{
		return doPreProcess(MOBTEL);
	}

	public void setMOBTEL( String MOBTEL)
	{
		this.MOBTEL=doPreProcess2(convertCode(MOBTEL));
	}

	public String getEMAIL()
	{
		return doPreProcess(EMAIL);
	}

	public void setEMAIL( String EMAIL)
	{
		this.EMAIL=doPreProcess2(convertCode(EMAIL));
	}

	public String getS_EXT_TIMESTAMP()
	{
		return doPreProcess(S_EXT_TIMESTAMP);
	}

	public void setS_EXT_TIMESTAMP( String S_EXT_TIMESTAMP)
	{
		this.S_EXT_TIMESTAMP=doPreProcess2(convertCode(S_EXT_TIMESTAMP));
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
		String sqlSelect="SELECT * FROM QYDJ_CWFZR_ZS"+" WHERE PRIPID='"+doPreProcess(PRIPID)+"'";
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
	TEL=rsSelect.getString("TEL");
	MOBTEL=rsSelect.getString("MOBTEL");
	EMAIL=rsSelect.getString("EMAIL");
	S_EXT_TIMESTAMP=rsSelect.getString("S_EXT_TIMESTAMP");
	CERTYPE=rsSelect.getString("CERTYPE");
	CERNO=rsSelect.getString("CERNO");
	}

	public boolean doAdd() throws SQLException
	{
		GsDbConnection dbc=new GsDbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd="INSERT INTO QYDJ_CWFZR_ZS(PRIPID,NAME,TEL,MOBTEL,EMAIL,S_EXT_TIMESTAMP,CERTYPE,CERNO) VALUES("+ doPreProcess3(PRIPID)+","+ doPreProcess3(NAME)+","+ doPreProcess3(TEL)+","+ doPreProcess3(MOBTEL)+","+ doPreProcess3(EMAIL)+","+ doPreProcess3(S_EXT_TIMESTAMP)+","+ doPreProcess3(CERTYPE)+","+ doPreProcess3(CERNO)+")";
		{							
			nRowCount=dbc.executeUpdate( sqlAdd );
			dbc.close();
			if (nRowCount>0)	//����ɹ�
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
		String sqlCount="SELECT COUNT(*) FROM QYDJ_CWFZR_ZS"+" WHERE PRIPID='"+doPreProcess(PRIPID)+"'";
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
		String sqlModify="UPDATE QYDJ_CWFZR_ZS SET PRIPID="+ doPreProcess3(PRIPID)+",NAME="+ doPreProcess3(NAME)+",TEL="+ doPreProcess3(TEL)+",MOBTEL="+ doPreProcess3(MOBTEL)+",EMAIL="+ doPreProcess3(EMAIL)+",S_EXT_TIMESTAMP="+ doPreProcess3(S_EXT_TIMESTAMP)+",CERTYPE="+ doPreProcess3(CERTYPE)+",CERNO="+ doPreProcess3(CERNO)+""+" WHERE PRIPID='"+doPreProcess(PRIPID)+"'";
		int nRowCount=dbc.executeUpdate( sqlModify );
		dbc.close();
		if (nRowCount>0)	//�޸ĳɹ�
		{
			return true;
		}
		else
			return false;
	}

	public boolean doDelete() throws SQLException
	{
		GsDbConnection dbc=new GsDbConnection();
		String sqlDelete="DELETE FROM QYDJ_CWFZR_ZS"+" WHERE PRIPID='"+doPreProcess(PRIPID)+"'";
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
		String sqlCount="SELECT COUNT(*) FROM QYDJ_CWFZR_ZS";
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
		String sqlList="SELECT * FROM QYDJ_CWFZR_ZS";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			QYDJ_CWFZR_ZS bTable=new QYDJ_CWFZR_ZS();
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
		String sqlList="SELECT * FROM QYDJ_CWFZR_ZS";
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
			QYDJ_CWFZR_ZS bTable=new QYDJ_CWFZR_ZS();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException
	{
		GsDbConnection dbc=new GsDbConnection();
		String sqlArr="SELECT * FROM QYDJ_CWFZR_ZS"+" WHERE PRIPID='"+doPreProcess(PRIPID)+"'";
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
