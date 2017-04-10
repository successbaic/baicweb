package com.macrosoft.icms.bean;

import java.sql.*;
import java.util.*;
import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.*;
import com.macrosoft.icms.system.*;
public class ONLINE_ORDER_RECODER_LS
{
	String PRINO;
	String OPENO;
	String ORDERNO;
	String REGORG;
	String ENTNAME;
	String OPERTYPE;
	String ORDERDATE;
	String STARTTIME;
	String ENDTIME;
	String RECODERTYPE;
	int OVERDUETIME;
	String LOGINID;
	String RECORDERDATE;
	public String getPRINO()
	{
		return doPreProcess(PRINO);
	}

	public void setPRINO( String PRINO)
	{
		this.PRINO=doPreProcess2(convertCode(PRINO));
	}

	public String getOPENO()
	{
		return doPreProcess(OPENO);
	}

	public void setOPENO( String OPENO)
	{
		this.OPENO=doPreProcess2(convertCode(OPENO));
	}

	public String getORDERNO()
	{
		return doPreProcess(ORDERNO);
	}

	public void setORDERNO( String ORDERNO)
	{
		this.ORDERNO=doPreProcess2(convertCode(ORDERNO));
	}

	public String getREGORG()
	{
		return doPreProcess(REGORG);
	}

	public void setREGORG( String REGORG)
	{
		this.REGORG=doPreProcess2(convertCode(REGORG));
	}

	public String getENTNAME()
	{
		return doPreProcess(ENTNAME);
	}

	public void setENTNAME( String ENTNAME)
	{
		this.ENTNAME=doPreProcess2(convertCode(ENTNAME));
	}

	public String getOPERTYPE()
	{
		return doPreProcess(OPERTYPE);
	}

	public void setOPERTYPE( String OPERTYPE)
	{
		this.OPERTYPE=doPreProcess2(convertCode(OPERTYPE));
	}

	public String getORDERDATE()
	{
		return doPreProcess(ORDERDATE);
	}

	public void setORDERDATE( String ORDERDATE)
	{
		this.ORDERDATE=doPreProcess2(convertCode(ORDERDATE));
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

	public String getRECODERTYPE()
	{
		return doPreProcess(RECODERTYPE);
	}

	public void setRECODERTYPE( String RECODERTYPE)
	{
		this.RECODERTYPE=doPreProcess2(convertCode(RECODERTYPE));
	}

	public int getOVERDUETIME()
	{
		return OVERDUETIME;
	}

	public void setOVERDUETIME( int OVERDUETIME)
	{
		this.OVERDUETIME=OVERDUETIME ;
	}

	public String getLOGINID()
	{
		return doPreProcess(LOGINID);
	}

	public void setLOGINID( String LOGINID)
	{
		this.LOGINID=doPreProcess2(convertCode(LOGINID));
	}

	public String getRECORDERDATE()
	{
		return doPreProcess(RECORDERDATE);
	}

	public void setRECORDERDATE( String RECORDERDATE)
	{
		this.RECORDERDATE=doPreProcess2(convertCode(RECORDERDATE));
	}

	public String convertCode(String strvalue)
	{	return strvalue;	}

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
		String sqlSelect="SELECT * FROM ONLINE_ORDER_RECODER_LS"+" WHERE PRINO='"+doPreProcess(PRINO)+"'";
		rsSelect=dbc.executeQuery(sqlSelect);
		if(rsSelect.next())
		{
			doSetData( rsSelect );
		}
		dbc.close();
	}

	public void doSetData( ResultSet rsSelect ) throws SQLException
	{
	PRINO=rsSelect.getString("PRINO");
	OPENO=rsSelect.getString("OPENO");
	ORDERNO=rsSelect.getString("ORDERNO");
	REGORG=rsSelect.getString("REGORG");
	ENTNAME=rsSelect.getString("ENTNAME");
	OPERTYPE=rsSelect.getString("OPERTYPE");
	ORDERDATE=String.valueOf(rsSelect.getDate("ORDERDATE"));
	STARTTIME=rsSelect.getString("STARTTIME");
	ENDTIME=rsSelect.getString("ENDTIME");
	RECODERTYPE=rsSelect.getString("RECODERTYPE");
	OVERDUETIME=rsSelect.getInt("OVERDUETIME");
	LOGINID=rsSelect.getString("LOGINID");
	RECORDERDATE=String.valueOf(rsSelect.getDate("RECORDERDATE"));
	}

	public boolean doAdd() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd="INSERT INTO ONLINE_ORDER_RECODER_LS(PRINO,OPENO,ORDERNO,REGORG,ENTNAME,OPERTYPE,ORDERDATE,STARTTIME,ENDTIME,RECODERTYPE,OVERDUETIME,LOGINID,RECORDERDATE) VALUES(sys_guid(),"+ doPreProcess3(OPENO)+","+ doPreProcess3(ORDERNO)+","+ doPreProcess3(REGORG)+","+ doPreProcess3(ENTNAME)+","+ doPreProcess3(OPERTYPE)+",to_date("+doPreProcess3(ORDERDATE)+",'yyyy-mm-dd'),"+ doPreProcess3(STARTTIME)+","+ doPreProcess3(ENDTIME)+","+ doPreProcess3(RECODERTYPE)+","+OVERDUETIME+","+ doPreProcess3(LOGINID)+",to_date("+doPreProcess3(RECORDERDATE)+",'yyyy-MM-dd hh24:mi:ss'))";
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
		String sqlCount="SELECT COUNT(*) FROM ONLINE_ORDER_RECODER_LS"+" WHERE PRINO='"+doPreProcess(PRINO)+"'";
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
		String sqlModify="UPDATE ONLINE_ORDER_RECODER_LS SET PRINO="+ doPreProcess3(PRINO)+",OPENO="+ doPreProcess3(OPENO)+",ORDERNO="+ doPreProcess3(ORDERNO)+",REGORG="+ doPreProcess3(REGORG)+",ENTNAME="+ doPreProcess3(ENTNAME)+",OPERTYPE="+ doPreProcess3(OPERTYPE)+",ORDERDATE=to_date("+doPreProcess3(ORDERDATE)+",'yyyy-mm-dd'),STARTTIME="+ doPreProcess3(STARTTIME)+",ENDTIME="+ doPreProcess3(ENDTIME)+",RECODERTYPE="+ doPreProcess3(RECODERTYPE)+",OVERDUETIME="+OVERDUETIME+",LOGINID="+ doPreProcess3(LOGINID)+",RECORDERDATE=to_date("+doPreProcess3(RECORDERDATE)+",'yyyy-mm-dd')"+" WHERE PRINO='"+doPreProcess(PRINO)+"'";
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
		String sqlDelete="DELETE FROM ONLINE_ORDER_RECODER_LS"+" WHERE PRINO='"+doPreProcess(PRINO)+"'";
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
		String sqlCount="SELECT COUNT(*) FROM ONLINE_ORDER_RECODER_LS";
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
		String sqlList="SELECT * FROM ONLINE_ORDER_RECODER_LS";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			ONLINE_ORDER_RECODER_LS bTable=new ONLINE_ORDER_RECODER_LS();
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
		String sqlList="SELECT * FROM ONLINE_ORDER_RECODER_LS";
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
			ONLINE_ORDER_RECODER_LS bTable=new ONLINE_ORDER_RECODER_LS();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlArr="SELECT * FROM ONLINE_ORDER_RECODER_LS"+" WHERE PRINO='"+doPreProcess(PRINO)+"'";
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
	/**
	 * 
	 * @return 已经逾期预约的次数
	 * @throws SQLException
	 */
	public int getYqTimes(String openo) throws SQLException{
		DbConnection dbc=new DbConnection();
		String sqlCount="SELECT COUNT(*) AS YqTimes FROM ONLINE_ORDER_RECODER_LS WHERE OPENO = '"+openo+"' AND RECODERTYPE = '10'";
		ResultSet rsCount=dbc.executeQuery( sqlCount );
		int YqTimes = 0;
		if(rsCount.next()){
			YqTimes=rsCount.getInt( "YqTimes" );
		}
		dbc.close();
		return YqTimes;
	}
	public ONLINE_ORDER_RECODER_LS getLastRecoder(String openo) throws SQLException{
		DbConnection dbc=new DbConnection();
		ONLINE_ORDER_RECODER_LS bean = new ONLINE_ORDER_RECODER_LS();
		String sqlQuery=
			"SELECT *" +
			"  FROM (SELECT t.*, RANK() OVER(ORDER BY t.recorderdate DESC) mm" + 
			"          FROM ONLINE_ORDER_RECODER_LS t" + 
			"         WHERE t.openo = '"+openo+"'" + 
			"         AND RECODERTYPE = '5')" + 
			" WHERE mm = 1";
		ResultSet rs = dbc.executeQuery(sqlQuery);
		if(rs.next()){
			bean.doSetData(rs);
		}
		dbc.close();
		return bean;
	}
}
