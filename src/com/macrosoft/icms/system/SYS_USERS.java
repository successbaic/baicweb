package com.macrosoft.icms.system;
import java.sql.*;
import java.util.*;
import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.*;
import com.macrosoft.icms.system.*;
public class SYS_USERS
{
	String NAME;
	String GZDW;
	String PASSWORD;
	String LOGINID;
	public String getNAME()
	{
		return doPreProcess(NAME);
	}

	public void setNAME( String NAME)
	{
		this.NAME=convertCode(NAME);
	}
	public String getGZDW()
	{
		return doPreProcess(GZDW);
	}

	public void setGZDW( String GZDW)
	{
		this.GZDW=convertCode(GZDW);
	}

	public String getPASSWORD()
	{
		return doPreProcess(PASSWORD);
	}

	public void setPASSWORD( String PASSWORD)
	{
		this.PASSWORD=convertCode(PASSWORD);
	}

	public String getLOGINID()
	{
		return doPreProcess(LOGINID);
	}

	public void setLOGINID( String LOGINID)
	{
		this.LOGINID=convertCode(LOGINID);
	}

	public String convertCode(String strvalue)
	{	return com.macrosoft.icms.system.SysUtility.convertCode( strvalue );	}

	public String doPreProcess( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess( sValue );	}

	public String doPreProcess2( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess2( sValue );	}

	public String doPreProcess3( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess3( sValue );	}

	public void doSelect( DbConnection dbc ) throws SQLException
	{
		ResultSet rsSelect;
		String sqlSelect="SELECT NAME,GZDW,PASSWORD,LOGINID FROM SYS_USERS"+" WHERE LOGINID='"+doPreProcess(LOGINID)+"'";
		rsSelect=dbc.executeQuery(sqlSelect);
		if(rsSelect.next())
		{
			NAME=cConvert.getStrings(rsSelect,"NAME");
			GZDW=cConvert.getStrings(rsSelect,"GZDW");
			PASSWORD=cConvert.getStrings(rsSelect,"PASSWORD");
			LOGINID=cConvert.getStrings(rsSelect,"LOGINID");
		}
	}

	public boolean doAdd( DbConnection dbc ) throws SQLException
	{
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd="INSERT INTO SYS_USERS(NAME,GZDW,PASSWORD,LOGINID) VALUES('"+doPreProcess(NAME)+"','"+doPreProcess(GZDW)+"','"+doPreProcess(PASSWORD)+"','"+doPreProcess(LOGINID)+"')";
		String sqlCount="SELECT COUNT(*) FROM SYS_USERS"+" WHERE LOGINID='"+doPreProcess(LOGINID)+"'";
		rsCount=dbc.executeQuery( sqlCount );
		rsCount.next();
		nRowCount=rsCount.getInt( 1 );

		if (nRowCount>0)		//有相同的数据存在
		{
			if (doModify(dbc))	
				return true;	 
			else	
				return false;	
		}
		else	
		{							
			nRowCount=dbc.executeUpdate( sqlAdd );
			if (nRowCount>0)	//插入成功
				return true;
			else
				return false;
		}
	}

	public boolean doCount( DbConnection dbc ) throws SQLException
	{
		ResultSet rsCount;
		int nRowCount;
		String sqlCount="SELECT COUNT(*) FROM SYS_USERS"+" WHERE LOGINID='"+doPreProcess(LOGINID)+"'";
		rsCount=dbc.executeQuery( sqlCount );
		rsCount.next();
		nRowCount=rsCount.getInt( 1 );

		if (nRowCount>0)
		{
			return true;
		}
		else
			return false;
	}

	public boolean doModify( DbConnection dbc ) throws SQLException
	{
		String sqlModify="UPDATE SYS_USERS SET NAME='"+doPreProcess(NAME)+"',GZDW='"+doPreProcess(GZDW)+"',PASSWORD='"+doPreProcess(PASSWORD)+"',LOGINID='"+doPreProcess(LOGINID)+"'"+" WHERE LOGINID='"+doPreProcess(LOGINID)+"'";
		int nRowCount=dbc.executeUpdate( sqlModify );
		if (nRowCount>0)	//修改成功
		{
			return true;
		}
		else
			return false;
	}

	public boolean doDelete( DbConnection dbc ) throws SQLException
	{
		String sqlDelete="DELETE FROM SYS_USERS"+" WHERE LOGINID='"+doPreProcess(LOGINID)+"'";
		String sqlDelete1="DELETE FROM SYS_ROLRIGHT"+" WHERE LOGINID='"+doPreProcess(LOGINID)+"'";
		int nRowCount=dbc.executeUpdate( sqlDelete1 )+dbc.executeUpdate( sqlDelete );
		if (nRowCount>0)
		{
			return true;
		}
		else
			return false;
	}

	public int getListCount( DbConnection dbc,String sqlWhere ) throws SQLException
	{
		String sqlCount="SELECT COUNT(*) FROM SYS_USERS";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlCount+=sqlWhere;}
			else {
				sqlCount+=" WHERE "+sqlWhere;}
		}
		ResultSet rsCount=dbc.executeQuery( sqlCount );
		rsCount.next();
		int nRowCount=rsCount.getInt( 1 );
		rsCount.close();
		rsCount=null;
		return nRowCount;

	}

	public ResultSet getList( DbConnection dbc,String sqlWhere ) throws SQLException
	{
		String sqlList="SELECT NAME,GZDW=(SELECT TOP 1 DWMC FROM SYS_GZDW WHERE GZDW=SYS_USERS.GZDW),PASSWORD,LOGINID FROM SYS_USERS";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		return dbc.executeQuery( sqlList );

	}

	public ArrayList getData( DbConnection dbc ) throws SQLException
	{
		String sqlArr="SELECT NAME,GZDW,PASSWORD,LOGINID,JGDM=(SELECT TOP 1 JGDM FROM SYS_GZDW WHERE GZDW=SYS_USERS.GZDW) FROM SYS_USERS"+" WHERE LOGINID='"+doPreProcess(LOGINID)+"'";
		ResultSet rsArr=dbc.executeQuery(sqlArr);
		ArrayList al= new ArrayList();
		String[] ay = null;
		if (rsArr.next()){	
			ResultSetMetaData rsmd = rsArr.getMetaData();
			for (int k=1;k<=rsmd.getColumnCount(); k++)	{
				ay = new String[2];
				ay[0]=rsmd.getColumnName(k);
				ay[1]=String.valueOf(rsArr.getObject(ay[0]));
				if (!ay[1].trim().equals("null")&&!ay[1].trim().equals(""))
					{al.add(ay);}
			}
		}
		rsArr.close(); rsArr=null;
		return al;

	}

	public boolean setpassnull( DbConnection dbc ) throws SQLException
	{
		String sqlModify="UPDATE SYS_USERS SET  PASSWORD=null WHERE LOGINID='"+doPreProcess(LOGINID)+"'";
		int nRowCount=dbc.executeUpdate( sqlModify );
		if (nRowCount>0)	//修改成功
			return true;
		else
			return false;
	}
}
