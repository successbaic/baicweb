package com.macrosoft.icms.gsnw;

import java.sql.*;
import java.util.*;
import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.gsdbc.GsDbConnection;
import com.macrosoft.icms.*;
import com.macrosoft.icms.system.*;
public class MCGL_ZHJY_ZS
{
	String RECID;
	String BANLETTER;
	String BANLETTPINY;
	String BANTYPE;
	String BANEXP;
	String BANFROM;
	String BANTO;
	String RECPER;
	String RECDATE;
	String RECORG;
	String S_EXT_TIMESTAMP;
	public String getRECID()
	{
		return doPreProcess(RECID);
	}

	public void setRECID( String RECID)
	{
		this.RECID=doPreProcess2(convertCode(RECID));
	}

	public String getBANLETTER()
	{
		return doPreProcess(BANLETTER);
	}

	public void setBANLETTER( String BANLETTER)
	{
		this.BANLETTER=doPreProcess2(convertCode(BANLETTER));
	}

	public String getBANLETTPINY()
	{
		return doPreProcess(BANLETTPINY);
	}

	public void setBANLETTPINY( String BANLETTPINY)
	{
		this.BANLETTPINY=doPreProcess2(convertCode(BANLETTPINY));
	}

	public String getBANTYPE()
	{
		return doPreProcess(BANTYPE);
	}

	public void setBANTYPE( String BANTYPE)
	{
		this.BANTYPE=doPreProcess2(convertCode(BANTYPE));
	}

	public String getBANEXP()
	{
		return doPreProcess(BANEXP);
	}

	public void setBANEXP( String BANEXP)
	{
		this.BANEXP=doPreProcess2(convertCode(BANEXP));
	}

	public String getBANFROM()
	{
		return doPreProcess(BANFROM);
	}

	public void setBANFROM( String BANFROM)
	{
		this.BANFROM=doPreProcess2(convertCode(BANFROM));
	}

	public String getBANTO()
	{
		return doPreProcess(BANTO);
	}

	public void setBANTO( String BANTO)
	{
		this.BANTO=doPreProcess2(convertCode(BANTO));
	}

	public String getRECPER()
	{
		return doPreProcess(RECPER);
	}

	public void setRECPER( String RECPER)
	{
		this.RECPER=doPreProcess2(convertCode(RECPER));
	}

	public String getRECDATE()
	{
		return doPreProcess(RECDATE);
	}

	public void setRECDATE( String RECDATE)
	{
		this.RECDATE=doPreProcess2(convertCode(RECDATE));
	}

	public String getRECORG()
	{
		return doPreProcess(RECORG);
	}

	public void setRECORG( String RECORG)
	{
		this.RECORG=doPreProcess2(convertCode(RECORG));
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
		String sqlSelect="SELECT * FROM MCGL_ZHJY_ZS"+" WHERE RECID='"+doPreProcess(RECID)+"'";
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
	BANLETTER=rsSelect.getString("BANLETTER");
	BANLETTPINY=rsSelect.getString("BANLETTPINY");
	BANTYPE=rsSelect.getString("BANTYPE");
	BANEXP=rsSelect.getString("BANEXP");
	BANFROM=String.valueOf(rsSelect.getDate("BANFROM"));
	BANTO=String.valueOf(rsSelect.getDate("BANTO"));
	RECPER=rsSelect.getString("RECPER");
	RECDATE=String.valueOf(rsSelect.getDate("RECDATE"));
	RECORG=rsSelect.getString("RECORG");
	S_EXT_TIMESTAMP=rsSelect.getString("S_EXT_TIMESTAMP");
	}

	public boolean doAdd() throws SQLException
	{
		GsDbConnection dbc=new GsDbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd="INSERT INTO MCGL_ZHJY_ZS(RECID,BANLETTER,BANLETTPINY,BANTYPE,BANEXP,BANFROM,BANTO,RECPER,RECDATE,RECORG,S_EXT_TIMESTAMP) VALUES("+ doPreProcess3(RECID)+","+ doPreProcess3(BANLETTER)+","+ doPreProcess3(BANLETTPINY)+","+ doPreProcess3(BANTYPE)+","+ doPreProcess3(BANEXP)+",to_date("+doPreProcess3(BANFROM)+",'yyyy-mm-dd'),to_date("+doPreProcess3(BANTO)+",'yyyy-mm-dd'),"+ doPreProcess3(RECPER)+",to_date("+doPreProcess3(RECDATE)+",'yyyy-mm-dd'),"+ doPreProcess3(RECORG)+","+ doPreProcess3(S_EXT_TIMESTAMP)+")";
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
		String sqlCount="SELECT COUNT(*) FROM MCGL_ZHJY_ZS"+" WHERE RECID='"+doPreProcess(RECID)+"'";
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
		String sqlModify="UPDATE MCGL_ZHJY_ZS SET RECID="+ doPreProcess3(RECID)+",BANLETTER="+ doPreProcess3(BANLETTER)+",BANLETTPINY="+ doPreProcess3(BANLETTPINY)+",BANTYPE="+ doPreProcess3(BANTYPE)+",BANEXP="+ doPreProcess3(BANEXP)+",BANFROM=to_date("+doPreProcess3(BANFROM)+",'yyyy-mm-dd'),BANTO=to_date("+doPreProcess3(BANTO)+",'yyyy-mm-dd'),RECPER="+ doPreProcess3(RECPER)+",RECDATE=to_date("+doPreProcess3(RECDATE)+",'yyyy-mm-dd'),RECORG="+ doPreProcess3(RECORG)+",S_EXT_TIMESTAMP="+ doPreProcess3(S_EXT_TIMESTAMP)+""+" WHERE RECID='"+doPreProcess(RECID)+"'";
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
		String sqlDelete="DELETE FROM MCGL_ZHJY_ZS"+" WHERE RECID='"+doPreProcess(RECID)+"'";
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
		String sqlCount="SELECT COUNT(*) FROM MCGL_ZHJY_ZS";
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
		String sqlList="SELECT * FROM MCGL_ZHJY_ZS";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			MCGL_ZHJY_ZS bTable=new MCGL_ZHJY_ZS();
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
		String sqlList="SELECT * FROM MCGL_ZHJY_ZS";
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
			MCGL_ZHJY_ZS bTable=new MCGL_ZHJY_ZS();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException
	{
		GsDbConnection dbc=new GsDbConnection();
		String sqlArr="SELECT * FROM MCGL_ZHJY_ZS"+" WHERE RECID='"+doPreProcess(RECID)+"'";
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
