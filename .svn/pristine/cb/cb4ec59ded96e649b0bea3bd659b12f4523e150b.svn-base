package com.macrosoft.icms.util;
import java.sql.*;
import java.util.*;
import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.*;
import com.macrosoft.icms.system.*;
public class WSDJ_TXWJ
{
	String DL;
	String XL;
	int WJBH;
	String WJMC;
	String WJLJ;
	String WJSL;
	String WJSM;
	String CZLX;
	String BZ;
	public String getDL()
	{
		return doPreProcess(DL);
	}

	public void setDL( String DL)
	{
		this.DL=doPreProcess2(convertCode(DL));
	}

	public String getXL()
	{
		return doPreProcess(XL);
	}

	public void setXL( String XL)
	{
		this.XL=doPreProcess2(convertCode(XL));
	}

	public int getWJBH()
	{
		return WJBH;
	}

	public void setWJBH( int WJBH)
	{
		this.WJBH=WJBH ;
	}

	public String getWJMC()
	{
		return doPreProcess(WJMC);
	}

	public void setWJMC( String WJMC)
	{
		this.WJMC=doPreProcess2(convertCode(WJMC));
	}

	public String getWJLJ()
	{
		return doPreProcess(WJLJ);
	}

	public void setWJLJ( String WJLJ)
	{
		this.WJLJ=doPreProcess2(convertCode(WJLJ));
	}

	public String getWJSL()
	{
		return doPreProcess(WJSL);
	}

	public void setWJSL( String WJSL)
	{
		this.WJSL=doPreProcess2(convertCode(WJSL));
	}

	public String getWJSM()
	{
		return doPreProcess(WJSM);
	}

	public void setWJSM( String WJSM)
	{
		this.WJSM=doPreProcess2(convertCode(WJSM));
	}

	public String getCZLX()
	{
		return doPreProcess(CZLX);
	}

	public void setCZLX( String CZLX)
	{
		this.CZLX=doPreProcess2(convertCode(CZLX));
	}

	public String getBZ()
	{
		return doPreProcess(BZ);
	}

	public void setBZ( String BZ)
	{
		this.BZ=doPreProcess2(convertCode(BZ));
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
		String sqlSelect="SELECT * FROM WSDJ_TXWJ WHERE DL='"+doPreProcess(DL)+"' AND XL='"+doPreProcess(XL)+" AND WJBH='"+WJBH+"'";
		rsSelect=dbc.executeQuery(sqlSelect);
		if(rsSelect.next())
		{
			doSetData( rsSelect );
		}
		dbc.close();
	}

	public void doSetData( ResultSet rsSelect ) throws SQLException
	{
	DL=rsSelect.getString("DL");
	XL=rsSelect.getString("XL");
	WJBH=rsSelect.getInt("WJBH");
	WJMC=rsSelect.getString("WJMC");
	WJLJ=rsSelect.getString("WJLJ");
	WJSL=rsSelect.getString("WJSL");
	WJSM=rsSelect.getString("WJSM");
	CZLX=rsSelect.getString("CZLX");
	BZ=rsSelect.getString("BZ");
	}

	public boolean doAdd() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd="INSERT INTO WSDJ_TXWJ(DL,XL,WJBH,WJMC,WJLJ,WJSL,WJSM,CZLX,BZ) VALUES("+ doPreProcess3(DL)+","+ doPreProcess3(XL)+","+WJBH+","+ doPreProcess3(WJMC)+","+ doPreProcess3(WJLJ)+","+ doPreProcess3(WJSL)+","+ doPreProcess3(WJSM)+","+ doPreProcess3(CZLX)+","+ doPreProcess3(BZ)+")";
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
		String sqlCount="SELECT COUNT(*) FROM WSDJ_TXWJ";
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
		String sqlModify="UPDATE WSDJ_TXWJ SET DL="+ doPreProcess3(DL)+",XL="+ doPreProcess3(XL)+",WJBH="+WJBH+",WJMC="+ doPreProcess3(WJMC)+",WJLJ="+ doPreProcess3(WJLJ)+",WJSL="+ doPreProcess3(WJSL)+",WJSM="+ doPreProcess3(WJSM)+",CZLX="+ doPreProcess3(CZLX)+",BZ="+ doPreProcess3(BZ)+" WHERE DL='"+doPreProcess(DL)+"' AND XL='"+doPreProcess(XL)+" AND WJBH='"+WJBH+"'";
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
		String sqlDelete="DELETE FROM WSDJ_TXWJ WHERE DL='"+doPreProcess(DL)+"' AND XL='"+doPreProcess(XL)+" AND WJBH='"+WJBH+"'";
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
		String sqlCount="SELECT COUNT(*) FROM WSDJ_TXWJ";
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
		String sqlList="SELECT * FROM WSDJ_TXWJ";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			WSDJ_TXWJ bTable=new WSDJ_TXWJ();
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
		String sqlList="SELECT * FROM WSDJ_TXWJ";
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
			WSDJ_TXWJ bTable=new WSDJ_TXWJ();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlArr="SELECT * FROM WSDJ_TXWJ  WHERE DL='"+doPreProcess(DL)+"' AND XL='"+doPreProcess(XL)+" AND WJBH='"+WJBH+"'";;
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
