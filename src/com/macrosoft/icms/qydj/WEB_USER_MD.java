package com.macrosoft.icms.qydj;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.macrosoft.icms.dbc.DbConnection;
import com.macrosoft.icms.system.md5;

public class WEB_USER_MD {
	
	String LOGINID;
	String USERNAME;
	String PASSWORD;
	String MDREMARK;
	public String getLOGINID()
	{
		return LOGINID;
	}

	public void setLOGINID( String LOGINID)
	{
		this.LOGINID=convertCode(LOGINID);
	}
	
	public String getUSERNAME()
	{
		return doPreProcess(USERNAME);
	}

	public void setUSERNAME( String USERNAME)
	{
		this.USERNAME=convertCode(USERNAME);
	}

	public String getPASSWORD()
	{
		return doPreProcess(PASSWORD);
	}

	public void setPASSWORD( String PASSWORD)
	{
		this.PASSWORD=convertCode(PASSWORD);
	}
	public String getMDREMARK()
	{
		return doPreProcess(LOGINID);
	}

	public void setMDREMARK( String MDREMARK)
	{
		this.MDREMARK=convertCode(MDREMARK);
	}
	public String convertCode(String strvalue)
	{	return com.macrosoft.icms.system.SysUtility.convertCode( strvalue );	}

	public String doPreProcess( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess( sValue );	}

	public String doPreProcess2( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess2( sValue );	}

	public String doPreProcess3( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess3( sValue );	}

	public void doSetData( ResultSet rsSelect ) throws SQLException
	{
	LOGINID=rsSelect.getString("LOGINID");
	USERNAME=rsSelect.getString("USERNAME");
	PASSWORD=rsSelect.getString("PASSWORD");
	MDREMARK=rsSelect.getString("MDREMARK");
	}
	public void doSelect() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsSelect;
		String sqlSelect="SELECT LOGINID,USERNAME,PASSWORD,MDREMARK  FROM WEB_USER"+" WHERE LOGINID='"+doPreProcess(LOGINID)+"'";
		rsSelect=dbc.executeQuery(sqlSelect);
		dbc.close();
	}
	
	public boolean doModifyPassMd5(String pass,String loginid) throws SQLException
	{
		DbConnection dbc=new DbConnection();
		md5 md=new md5();
		pass=md.calcMD5(pass);
		int nRowCount;
		String sqlAdd="UPDATE WEB_USER SET PASSWORD='"+pass+"',MDREMARK='Y' WHERE LOGINID='"+loginid+"'";
		{							
			nRowCount=dbc.executeUpdate( sqlAdd );
			dbc.close();
			if (nRowCount>0)	//插入成功
				return true;
			else
				return false;
		}
	}
	public ArrayList getList( String sqlWhere ) throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ArrayList al= new ArrayList();
		String sqlList="SELECT * FROM WEB_USER";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			WEB_USER_MD bTable=new WEB_USER_MD();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}
	
	public String ModPassMd5 (){
		try {
			ArrayList list=getList(" WHERE MDREMARK IS NULL ");
			if(list.size()<1){
				return "密码已经全部加密，不必再执行该操作！";
			}
			for(int i=0;i<list.size();i++){
				WEB_USER_MD user=(WEB_USER_MD)list.get(i);
				String pass=user.getPASSWORD();
				String loginid=user.getLOGINID();
				if(!pass.equals("") && !loginid.equals("")){
					boolean flag=doModifyPassMd5(user.getPASSWORD(),user.getLOGINID());
					if(!flag){
						return "操作失败！"+user.getLOGINID()+"密码加密失败！";
					}
				}				
			}
		} catch (SQLException e) {		
			e.printStackTrace();
			return "操作失败！出现异常："+e.getMessage();
		}
		return "操作成功！";
	}
}
