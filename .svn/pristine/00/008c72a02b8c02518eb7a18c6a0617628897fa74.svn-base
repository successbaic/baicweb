package com.macrosoft.icms.bean;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import com.macrosoft.icms.dbc.DbConnection;
import com.macrosoft.icms.system.SysUtility;
public class ONLINE_ORDER_CFG
{
	String REGORG;
	String STARTTIME;
	String ENDTIME;
	String BUSINESSTYPE;
	int ORDERMAXNUM;
	public String getREGORG()
	{
		return doPreProcess(REGORG);
	}

	public void setREGORG( String REGORG)
	{
		this.REGORG=doPreProcess2(convertCode(REGORG));
	}

	public String getSTARTTIME()
	{
		return doPreProcess(STARTTIME);
	}

	public void setSTARTTIME( String STARTTIME)
	{
		this.STARTTIME=doPreProcess2(convertCode(STARTTIME));
	}

	public String getENDTIME()
	{
		return doPreProcess(ENDTIME);
	}

	public void setENDTIME( String ENDTIME)
	{
		this.ENDTIME=doPreProcess2(convertCode(ENDTIME));
	}

	public String getBUSINESSTYPE()
	{
		return doPreProcess(BUSINESSTYPE);
	}

	public void setBUSINESSTYPE( String BUSINESSTYPE)
	{
		this.BUSINESSTYPE=doPreProcess2(convertCode(BUSINESSTYPE));
	}

	public int getORDERMAXNUM()
	{
		return ORDERMAXNUM;
	}

	public void setORDERMAXNUM( int ORDERMAXNUM)
	{
		this.ORDERMAXNUM=ORDERMAXNUM ;
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
		String sqlSelect="SELECT * FROM ONLINE_ORDER_CFG"+" WHERE ENDTIME='"+doPreProcess(ENDTIME)+"' and STARTTIME='"+doPreProcess(STARTTIME)+"' and REGORG='"+doPreProcess(REGORG)+"'";
		rsSelect=dbc.executeQuery(sqlSelect);
		if(rsSelect.next())
		{
			doSetData( rsSelect );
		}
		dbc.close();
	}

	public void doSetData( ResultSet rsSelect ) throws SQLException
	{
	REGORG=rsSelect.getString("REGORG");
	STARTTIME=rsSelect.getString("STARTTIME");
	ENDTIME=rsSelect.getString("ENDTIME");
	BUSINESSTYPE=rsSelect.getString("BUSINESSTYPE");
	ORDERMAXNUM=rsSelect.getInt("ORDERMAXNUM");
	}

	public boolean doAdd() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd="INSERT INTO ONLINE_ORDER_CFG(REGORG,STARTTIME,ENDTIME,BUSINESSTYPE,ORDERMAXNUM) VALUES("+ doPreProcess3(REGORG)+","+ doPreProcess3(STARTTIME)+","+ doPreProcess3(ENDTIME)+","+ doPreProcess3(BUSINESSTYPE)+","+ORDERMAXNUM+")";
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
		String sqlCount="SELECT COUNT(*) FROM ONLINE_ORDER_CFG"+" WHERE ENDTIME='"+doPreProcess(ENDTIME)+"' and STARTTIME='"+doPreProcess(STARTTIME)+"' and REGORG='"+doPreProcess(REGORG)+"'";
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
		String sqlModify="UPDATE ONLINE_ORDER_CFG SET REGORG="+ doPreProcess3(REGORG)+",STARTTIME="+ doPreProcess3(STARTTIME)+",ENDTIME="+ doPreProcess3(ENDTIME)+",BUSINESSTYPE="+ doPreProcess3(BUSINESSTYPE)+",ORDERMAXNUM="+ORDERMAXNUM+""+" WHERE ENDTIME='"+doPreProcess(ENDTIME)+"' and STARTTIME='"+doPreProcess(STARTTIME)+"' and REGORG='"+doPreProcess(REGORG)+"'";
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
		String sqlDelete="DELETE FROM ONLINE_ORDER_CFG"+" WHERE ENDTIME='"+doPreProcess(ENDTIME)+"' and STARTTIME='"+doPreProcess(STARTTIME)+"' and REGORG='"+doPreProcess(REGORG)+"'";
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
		String sqlCount="SELECT COUNT(*) FROM ONLINE_ORDER_CFG";
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

	public ArrayList<ONLINE_ORDER_CFG> getList( String sqlWhere ) throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ArrayList<ONLINE_ORDER_CFG> al= new ArrayList<ONLINE_ORDER_CFG>();
		String sqlList="SELECT * FROM ONLINE_ORDER_CFG";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			ONLINE_ORDER_CFG bTable=new ONLINE_ORDER_CFG();
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
		String sqlList="SELECT * FROM ONLINE_ORDER_CFG";
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
			ONLINE_ORDER_CFG bTable=new ONLINE_ORDER_CFG();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlArr="SELECT * FROM ONLINE_ORDER_CFG"+" WHERE ENDTIME='"+doPreProcess(ENDTIME)+"' and STARTTIME='"+doPreProcess(STARTTIME)+"' and REGORG='"+doPreProcess(REGORG)+"'";
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
