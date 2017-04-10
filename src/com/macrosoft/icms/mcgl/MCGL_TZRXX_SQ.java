package com.macrosoft.icms.mcgl;

import java.sql.*;
import java.util.*;

import com.macrosoft.icms.dbc.DbConnection;
import com.macrosoft.icms.system.*;
public class MCGL_TZRXX_SQ
{
	String RECID;
	String OPENO;
	String PRIPID;
	String INV;
	String INVTYPE;
	String CERTYPE;
	String CERNO;
	String BLICTYPE;
	String BLICNO;
	String CONTINENT;
	String COUNTRY;
	float SUBCONAM;
	float SUBCONAMUSD;
	float CONGRO;
	String CONGROCUR;
	double REGCAP;
	String REGCAPCUR;
	float CONPROP;
	String TEL;
	String REMARK;
	public String getRECID()
	{
		return doPreProcess(RECID);
	}

	public void setRECID( String RECID)
	{
		this.RECID=doPreProcess(RECID) ;
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

	public float getSUBCONAMUSD()
	{
		return SUBCONAMUSD;
	}

	public void setSUBCONAMUSD( float SUBCONAMUSD)
	{
		this.SUBCONAMUSD=SUBCONAMUSD;
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

	public float getCONPROP()
	{
		return CONPROP;
	}

	public void setCONPROP( float CONPROP)
	{
		this.CONPROP=CONPROP ;
	}

	public String getTEL()
	{
		return doPreProcess(TEL);
	}

	public void setTEL( String TEL)
	{
		this.TEL=doPreProcess2(convertCode(TEL));
	}

	public String getREMARK()
	{
		return doPreProcess(REMARK);
	}

	public void setREMARK( String REMARK)
	{
		this.REMARK=doPreProcess2(convertCode(REMARK));
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
		String sqlSelect="SELECT * FROM MCGL_TZRXX_SQ"+" WHERE RECID="+doPreProcess3(RECID)+" and OPENO='"+doPreProcess(OPENO)+"'";
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
	OPENO=rsSelect.getString("OPENO");
	PRIPID=rsSelect.getString("PRIPID");
	INV=rsSelect.getString("INV");
	INVTYPE=rsSelect.getString("INVTYPE");
	CERTYPE=rsSelect.getString("CERTYPE");
	CERNO=rsSelect.getString("CERNO");
	BLICTYPE=rsSelect.getString("BLICTYPE");
	BLICNO=rsSelect.getString("BLICNO");
	CONTINENT=rsSelect.getString("CONTINENT");
	COUNTRY=rsSelect.getString("COUNTRY");
	SUBCONAM=rsSelect.getFloat("SUBCONAM");
	SUBCONAMUSD=rsSelect.getFloat("SUBCONAMUSD");
	CONGRO=rsSelect.getFloat("CONGRO");
	CONGROCUR=rsSelect.getString("CONGROCUR");
	REGCAP=rsSelect.getDouble("REGCAP");
	REGCAPCUR=rsSelect.getString("REGCAPCUR");
	CONPROP=rsSelect.getFloat("CONPROP");
	TEL=rsSelect.getString("TEL");
	REMARK=rsSelect.getString("REMARK");
	}

	public boolean doAdd() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd="INSERT INTO MCGL_TZRXX_SQ(RECID,OPENO,PRIPID,INV,INVTYPE,CERTYPE,CERNO,BLICTYPE,BLICNO,CONTINENT,COUNTRY,SUBCONAM,SUBCONAMUSD,CONGRO,CONGROCUR,REGCAP,REGCAPCUR,CONPROP,TEL,REMARK) VALUES("+doPreProcess3(RECID)+","+ doPreProcess3(OPENO)+","+ doPreProcess3(PRIPID)+","+ doPreProcess3(INV)+","+ doPreProcess3(INVTYPE)+","+ doPreProcess3(CERTYPE)+","+ doPreProcess3(CERNO)+","+ doPreProcess3(BLICTYPE)+","+ doPreProcess3(BLICNO)+","+ doPreProcess3(CONTINENT)+","+ doPreProcess3(COUNTRY)+","+SUBCONAM+","+ SUBCONAMUSD+","+CONGRO+","+ doPreProcess3(CONGROCUR)+","+REGCAP+","+ doPreProcess3(REGCAPCUR)+","+CONPROP+","+ doPreProcess3(TEL)+","+ doPreProcess3(REMARK)+")";
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
		String sqlCount="SELECT COUNT(*) FROM MCGL_TZRXX_SQ"+" WHERE RECID="+doPreProcess3(RECID)+" and OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlModify="UPDATE MCGL_TZRXX_SQ SET RECID="+doPreProcess3(RECID)+",OPENO="+ doPreProcess3(OPENO)+",PRIPID="+ doPreProcess3(PRIPID)+",INV="+ doPreProcess3(INV)+",INVTYPE="+ doPreProcess3(INVTYPE)+",CERTYPE="+ doPreProcess3(CERTYPE)+",CERNO="+ doPreProcess3(CERNO)+",BLICTYPE="+ doPreProcess3(BLICTYPE)+",BLICNO="+ doPreProcess3(BLICNO)+",CONTINENT="+ doPreProcess3(CONTINENT)+",COUNTRY="+ doPreProcess3(COUNTRY)+",SUBCONAM="+SUBCONAM+",SUBCONAMUSD="+ SUBCONAMUSD+",CONGRO="+CONGRO+",CONGROCUR="+ doPreProcess3(CONGROCUR)+",REGCAP="+REGCAP+",REGCAPCUR="+ doPreProcess3(REGCAPCUR)+",CONPROP="+CONPROP+",TEL="+ doPreProcess3(TEL)+",REMARK="+ doPreProcess3(REMARK)+""+" WHERE RECID="+doPreProcess3(RECID)+" and OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlDelete="DELETE FROM MCGL_TZRXX_SQ"+" WHERE RECID="+doPreProcess3(RECID)+" and OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlCount="SELECT COUNT(*) FROM MCGL_TZRXX_SQ";
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
		String sqlList="SELECT * FROM MCGL_TZRXX_SQ";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			MCGL_TZRXX_SQ bTable=new MCGL_TZRXX_SQ();
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
		String sqlList="SELECT * FROM MCGL_TZRXX_SQ";
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
			MCGL_TZRXX_SQ bTable=new MCGL_TZRXX_SQ();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlArr="SELECT * FROM MCGL_TZRXX_SQ"+" WHERE RECID="+doPreProcess3(RECID)+" and OPENO='"+doPreProcess(OPENO)+"'";
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
