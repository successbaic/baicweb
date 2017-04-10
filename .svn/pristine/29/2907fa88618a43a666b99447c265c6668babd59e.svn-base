package com.macrosoft.icms.gqdj;
import java.sql.*;
import java.util.*;

import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.*;
import com.macrosoft.icms.system.*;
public class GQDJ_BGSX_SQ
{
	String MORREGNO;
	String PRIPID;
	String OPENO;
	String ALTITEM;
	String ALTBE;
	String ALTAF;
	String ALTDATE;
	int ALTTIME;
	public String getMORREGNO()
	{
		return doPreProcess(MORREGNO);
	}

	public void setMORREGNO( String MORREGNO)
	{
		this.MORREGNO=doPreProcess2(convertCode(MORREGNO));
	}

	public String getPRIPID()
	{
		return doPreProcess(PRIPID);
	}

	public void setPRIPID( String PRIPID)
	{
		this.PRIPID=doPreProcess2(convertCode(PRIPID));
	}

	public String getOPENO()
	{
		return doPreProcess(OPENO);
	}

	public void setOPENO( String OPENO)
	{
		this.OPENO=doPreProcess2(convertCode(OPENO));
	}

	public String getALTITEM()
	{
		return doPreProcess(ALTITEM);
	}

	public void setALTITEM( String ALTITEM)
	{
		this.ALTITEM=doPreProcess2(convertCode(ALTITEM));
	}

	public String getALTBE()
	{
		return doPreProcess(ALTBE);
	}

	public void setALTBE( String ALTBE)
	{
		this.ALTBE=doPreProcess2(convertCode(ALTBE));
	}

	public String getALTAF()
	{
		return doPreProcess(ALTAF);
	}

	public void setALTAF( String ALTAF)
	{
		this.ALTAF=doPreProcess2(convertCode(ALTAF));
	}

	public String getALTDATE()
	{
		return doPreProcess(ALTDATE);
	}

	public void setALTDATE( String ALTDATE)
	{
		this.ALTDATE=doPreProcess2(convertCode(ALTDATE));
	}

	public int getALTTIME()
	{
		return ALTTIME;
	}

	public void setALTTIME( int ALTTIME)
	{
		this.ALTTIME=ALTTIME ;
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
		String sqlSelect="SELECT * FROM GQDJ_BGSX_SQ"+" WHERE ALTITEM='"+doPreProcess(ALTITEM)+"' and MORREGNO='"+doPreProcess(MORREGNO)+"' and OPENO='"+doPreProcess(OPENO)+"'";
		rsSelect=dbc.executeQuery(sqlSelect);
		if(rsSelect.next())
		{
			doSetData( rsSelect );
		}
		dbc.close();
	}

	public void doSetData( ResultSet rsSelect ) throws SQLException
	{
	MORREGNO=rsSelect.getString("MORREGNO");
	PRIPID=rsSelect.getString("PRIPID");
	OPENO=rsSelect.getString("OPENO");
	ALTITEM=rsSelect.getString("ALTITEM");
	ALTBE=rsSelect.getString("ALTBE");
	ALTAF=rsSelect.getString("ALTAF");
	ALTDATE=String.valueOf(rsSelect.getDate("ALTDATE"));
	ALTTIME=rsSelect.getInt("ALTTIME");
	}

	public boolean doAdd() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd="INSERT INTO GQDJ_BGSX_SQ(MORREGNO,PRIPID,OPENO,ALTITEM,ALTBE,ALTAF,ALTDATE,ALTTIME) VALUES("+ doPreProcess3(MORREGNO)+","+ doPreProcess3(PRIPID)+","+ doPreProcess3(OPENO)+","+ doPreProcess3(ALTITEM)+","+ doPreProcess3(ALTBE)+","+ doPreProcess3(ALTAF)+",to_date("+doPreProcess3(ALTDATE)+",'yyyy-mm-dd'),"+ALTTIME+")";
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
		String sqlCount="SELECT COUNT(*) FROM GQDJ_BGSX_SQ"+" WHERE ALTITEM='"+doPreProcess(ALTITEM)+"' and MORREGNO='"+doPreProcess(MORREGNO)+"' and OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlModify="UPDATE GQDJ_BGSX_SQ SET MORREGNO="+ doPreProcess3(MORREGNO)+",PRIPID="+ doPreProcess3(PRIPID)+",OPENO="+ doPreProcess3(OPENO)+",ALTITEM="+ doPreProcess3(ALTITEM)+",ALTBE="+ doPreProcess3(ALTBE)+",ALTAF="+ doPreProcess3(ALTAF)+",ALTDATE=to_date("+doPreProcess3(ALTDATE)+",'yyyy-mm-dd'),ALTTIME="+ALTTIME+""+" WHERE ALTITEM='"+doPreProcess(ALTITEM)+"' and MORREGNO='"+doPreProcess(MORREGNO)+"' and OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlDelete="DELETE FROM GQDJ_BGSX_SQ"+" WHERE ALTITEM='"+doPreProcess(ALTITEM)+"' and MORREGNO='"+doPreProcess(MORREGNO)+"' and OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlCount="SELECT COUNT(*) FROM GQDJ_BGSX_SQ";
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
		String sqlList="SELECT * FROM GQDJ_BGSX_SQ";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			GQDJ_BGSX_SQ bTable=new GQDJ_BGSX_SQ();
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
		String sqlList="SELECT * FROM GQDJ_BGSX_SQ";
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
			GQDJ_BGSX_SQ bTable=new GQDJ_BGSX_SQ();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlArr="SELECT * FROM GQDJ_BGSX_SQ"+" WHERE ALTITEM='"+doPreProcess(ALTITEM)+"' and MORREGNO='"+doPreProcess(MORREGNO)+"' and OPENO='"+doPreProcess(OPENO)+"'";
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



	public boolean doDeleteAll() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlDelete="DELETE FROM GQDJ_BGSX_SQ"+" WHERE OPENO='"+OPENO+"'";
		int nRowCount=dbc.executeUpdate( sqlDelete );
		dbc.close();
		if (nRowCount>0)
		{
			return true;
		}
		else
			return false;
	}

	public ArrayList getDataList() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlArr="SELECT * FROM GQDJ_BGSX_SQ "+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
		ResultSet rsArr=dbc.executeQuery(sqlArr);
		ArrayList al= new ArrayList();
		String[] ay = null;		
		while (rsArr.next())
		{	
			String aALTITEM=doPreProcess(rsArr.getString("ALTITEM")).trim(); //"01 03 10 "
			ResultSetMetaData rsmd = rsArr.getMetaData();
			for (int k=1;k<=rsmd.getColumnCount(); k++)
			{
				
				ay = new String[2];
				ay[0]=rsmd.getColumnName(k);
				ay[1]=String.valueOf(rsArr.getObject(ay[0]));
				if (ay[0].equals("ALTBE")||ay[0].equals("ALTAF")||ay[0].equals("REMARK"))
				{
					if (!ay[1].trim().equals("null")&&!ay[1].trim().equals(""))
					{ay[0]+=aALTITEM;ay[1]=SysUtility.pre(ay[1]); al.add(ay);}
				}
				else
				{
					if (!ay[1].trim().equals("null")&&!ay[1].trim().equals(""))
					{ay[1]=SysUtility.pre(ay[1]); al.add(ay);}
				}
			}
		}
		rsArr.close(); rsArr=null;
		dbc.close();
		return al;
	}

		/*
	判断是否存在此变更项，用于变更补录
	*/
	public int IsExist(String openo1,String altitem1) throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlCount="SELECT count(*) FROM GQDJ_BGSX_SQ"+" WHERE ALTITEM='"+doPreProcess(altitem1)+"' and OPENO='"+doPreProcess(openo1)+"'";
		rsCount=dbc.executeQuery( sqlCount );
		rsCount.next();
		int rt=rsCount.getInt(1);
		dbc.close();
		return rt;
	}
	
	public boolean doZs2Lc(String vOPENO,String vID,String vSN) throws SQLException{
		DbConnection dbc=new DbConnection();
		ArrayList list=new ArrayList();
		list.add(vOPENO);
		list.add(vID);
		list.add(vSN);
		//String ret=(String)dbc.executeStp("{ ?=call STP_ZS2LC_GQDJ(?,?,?)}",list,1);
		int res=((Integer)dbc.executeStp("{ ?=call STP_ZS2LC_GQDJ(?,?,?)}", list,Types.INTEGER)).intValue();	
		System.out.println("res"+res);
		
		dbc.close();
 		if (res==1)
		{
			return true;
		}
		else
			return false;
	}	
	public boolean doModifyBySql(String Sql) throws SQLException
	{
		DbConnection dbc=new DbConnection();
		int nRowCount=dbc.executeUpdate( Sql );
		dbc.close();
		if (nRowCount>0)
		{
			return true;
		}
		else{
			return false;
		}	
	}
	public static void main(String[] args) throws SQLException
	{
		//doZs2Lc()37130011212190001/371300000135537565659968/00/
		//GQDJ_BGSX_SQ bgsx=new GQDJ_BGSX_SQ(())
		
	}
	
}
