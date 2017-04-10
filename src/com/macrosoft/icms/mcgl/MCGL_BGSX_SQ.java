package com.macrosoft.icms.mcgl;
import java.sql.*;
import java.util.*;

import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.*;
import com.macrosoft.icms.system.*;
public class MCGL_BGSX_SQ
{
	String RECID;
	String OPENO;
	String ALTITEM;
	String PRIPID;
	String ALTBE;
	String ALTAF;
	String ALTDATE;
	int ALTTIME;
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

	public String getPRIPID()
	{
		return doPreProcess(PRIPID);
	}

	public void setPRIPID( String PRIPID)
	{
		this.PRIPID=doPreProcess2(convertCode(PRIPID));
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

	public void doSelect() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsSelect;
		String sqlSelect="SELECT * FROM MCGL_BGSX_SQ"+" WHERE RECID='"+doPreProcess(RECID)+"'";
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
	ALTITEM=rsSelect.getString("ALTITEM");
	PRIPID=rsSelect.getString("PRIPID");
	ALTBE=rsSelect.getString("ALTBE");
	ALTAF=rsSelect.getString("ALTAF");
	ALTDATE=String.valueOf(rsSelect.getDate("ALTDATE"));
	ALTTIME=rsSelect.getInt("ALTTIME");
	REMARK=rsSelect.getString("REMARK");
	S_EXT_TIMESTAMP=rsSelect.getString("S_EXT_TIMESTAMP");
	}

	public boolean doAdd() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd="INSERT INTO MCGL_BGSX_SQ(RECID,OPENO,ALTITEM,PRIPID,ALTBE,ALTAF,ALTDATE,ALTTIME,REMARK,S_EXT_TIMESTAMP) VALUES("+ doPreProcess3(RECID)+","+ doPreProcess3(OPENO)+","+ doPreProcess3(ALTITEM)+","+ doPreProcess3(PRIPID)+","+ doPreProcess3(ALTBE)+","+ doPreProcess3(ALTAF)+",to_date("+doPreProcess3(ALTDATE)+",'yyyy-mm-dd'),"+ALTTIME+","+ doPreProcess3(REMARK)+","+ doPreProcess3(S_EXT_TIMESTAMP)+")";
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
		String sqlCount="SELECT COUNT(*) FROM MCGL_BGSX_SQ"+" WHERE RECID='"+doPreProcess(RECID)+"'";
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
		String sqlModify="UPDATE MCGL_BGSX_SQ SET RECID="+ doPreProcess3(RECID)+",OPENO="+ doPreProcess3(OPENO)+",ALTITEM="+ doPreProcess3(ALTITEM)+",PRIPID="+ doPreProcess3(PRIPID)+",ALTBE="+ doPreProcess3(ALTBE)+",ALTAF="+ doPreProcess3(ALTAF)+",ALTDATE=to_date("+doPreProcess3(ALTDATE)+",'yyyy-mm-dd'),ALTTIME="+ALTTIME+",REMARK="+ doPreProcess3(REMARK)+",S_EXT_TIMESTAMP="+ doPreProcess3(S_EXT_TIMESTAMP)+""+" WHERE RECID='"+doPreProcess(RECID)+"'";
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
		String sqlDelete="DELETE FROM MCGL_BGSX_SQ"+" WHERE RECID='"+doPreProcess(RECID)+"'";
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
		String sqlCount="SELECT COUNT(*) FROM MCGL_BGSX_SQ";
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
		String sqlList="SELECT * FROM MCGL_BGSX_SQ";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			MCGL_BGSX_SQ bTable=new MCGL_BGSX_SQ();
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
		String sqlList="SELECT * FROM MCGL_BGSX_SQ";
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
			MCGL_BGSX_SQ bTable=new MCGL_BGSX_SQ();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlArr="SELECT * FROM MCGL_BGSX_SQ"+" WHERE RECID='"+doPreProcess(RECID)+"'";
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
	public ArrayList getDataList() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlArr="SELECT * FROM MCGL_BGSX_SQ "+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
	
	public boolean doDeleteAll() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlDelete="DELETE FROM MCGL_BGSX_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
		int nRowCount=dbc.executeUpdate( sqlDelete );
		dbc.close();
		if (nRowCount>0)
		{
			return true;
		}
		else
			return false;
	}
	public boolean doZs2Lc(String OPENO,String NAMEID,boolean CZXX) throws SQLException{
		DbConnection dbc=new DbConnection();
		ArrayList list=new ArrayList();
		list.add(OPENO);
		list.add(NAMEID);
		list.add(CZXX+"");
		String ret=(String)dbc.executeStp("{ ?=call STP_ZS2LC_MC(?,?,?)}",list,1);
		dbc.close();
		if(ret!=null && !ret.equals("")){
			return true;
		}else{
			return false;
		}
	}
	
	public boolean doZs2Lc_MCBG(String OPENO,String RPIPID,String ENTCLASS) throws SQLException{
		DbConnection dbc=new DbConnection();
		ArrayList list=new ArrayList();
		list.add(OPENO);
		list.add(RPIPID);
		list.add(ENTCLASS);
		String ret=(String)dbc.executeStp("{ ?=call STP_ZS2LC_MCBG(?,?,?)}",list,1);
		dbc.close();
		if(ret!=null && !ret.equals("")){
			return true;
		}else{
			return false;
		}
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
	
	public String doModifyJbxx(String sALTITEM,String sALTAF) throws SQLException
	{
		String sqlModify="";
		if(sALTITEM.equals("04"))
		{
			sqlModify=" DOM= "+ doPreProcess3(sALTAF);//变更住所
		}
		else if(sALTITEM.equals("05"))
		{
			sqlModify=" REGCAP= "+ doPreProcess2(sALTAF);//注册资本
		}else if(sALTITEM.equals("114"))
		{
			sqlModify=" CONGROCUR= "+ doPreProcess3(sALTAF);//投资总额币种
		}else if(sALTITEM.equals("06"))
		{
			sqlModify=" CONGRO= "+ doPreProcess3(sALTAF);//投资总额
		}else if(sALTITEM.equals("110"))
		{
			sqlModify=" REGCAPCUR= "+ doPreProcess3(sALTAF);//注册资本币种
		}
		else if(sALTITEM.equals("07")){
			sqlModify=" ENTTYPE= "+ doPreProcess3(sALTAF);//企业类型
		}
		else if(sALTITEM.equals("98"))
		{
			sqlModify=" INDUSTRYPHY= "+ doPreProcess3(sALTAF);//行业门类
		}
		else if(sALTITEM.equals("11"))
		{
			sqlModify=" INDUSTRYCO= "+ doPreProcess3(sALTAF);//行业代码
		}
		else if(sALTITEM.equals("12"))
		{
			sqlModify=" BUSSCOPE= "+ doPreProcess3(sALTAF);//经营范围
		}
		else if(sALTITEM.equals("08"))
		{
			sqlModify=" SAVEPERTO=to_date("+ doPreProcess3(sALTAF)+",'yyyy-MM-dd')";//经营期限
		}
		
		else if(sALTITEM.equals("09"))
		{
			sqlModify=" OWNERNAME= "+ doPreProcess3(sALTAF);
		}
		else if(sALTITEM.equals("13"))
		{
			sqlModify=" DOM= "+ doPreProcess3(sALTAF);
		}
		else if(sALTITEM.equals("26"))
		{
			sqlModify=" REGCAP= "+ doPreProcess3(sALTAF);
		}
		else if(sALTITEM.equals("14"))
		{
			sqlModify=" PREREGORG= "+ doPreProcess3(sALTAF);
		}
		return sqlModify;
 	}
}
