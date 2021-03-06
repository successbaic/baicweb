package com.macrosoft.icms.commAjax;

import java.sql.*;
import java.util.*;
import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.*;
import com.macrosoft.icms.system.*;
public class COM_DM
{
	String TYPE;
	String CODE;
	String CONTENT;
	String REMARK;
	int SIGN;
	String DMBM;
	String PCODE;
	public String getTYPE()
	{
		return doPreProcess(TYPE);
	}

	public void setTYPE( String TYPE)
	{
		this.TYPE=doPreProcess2(convertCode(TYPE));
	}

	public String getCODE()
	{
		return doPreProcess(CODE);
	}

	public void setCODE( String CODE)
	{
		this.CODE=doPreProcess2(convertCode(CODE));
	}

	public String getCONTENT()
	{
		return doPreProcess(CONTENT);
	}

	public void setCONTENT( String CONTENT)
	{
		this.CONTENT=doPreProcess2(convertCode(CONTENT));
	}

	public String getREMARK()
	{
		return doPreProcess(REMARK);
	}

	public void setREMARK( String REMARK)
	{
		this.REMARK=doPreProcess2(convertCode(REMARK));
	}

	public int getSIGN()
	{
		return SIGN;
	}

	public void setSIGN( int SIGN)
	{
		this.SIGN=SIGN ;
	}

	public String getDMBM()
	{
		return doPreProcess(DMBM);
	}

	public void setDMBM( String DMBM)
	{
		this.DMBM=doPreProcess2(convertCode(DMBM));
	}

	public String getPCODE()
	{
		return doPreProcess(PCODE);
	}

	public void setPCODE( String PCODE)
	{
		this.PCODE=doPreProcess2(convertCode(PCODE));
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
		String sqlSelect="SELECT * FROM COM_DM"+" WHERE CODE='"+doPreProcess(CODE)+"' and TYPE='"+doPreProcess(TYPE)+"'";
		rsSelect=dbc.executeQuery(sqlSelect);
		if(rsSelect.next())
		{
			doSetData( rsSelect );
		}
		dbc.close();
	}

	public void doSetData( ResultSet rsSelect ) throws SQLException
	{
	TYPE=rsSelect.getString("TYPE");
	CODE=rsSelect.getString("CODE");
	CONTENT=rsSelect.getString("CONTENT");
	REMARK=rsSelect.getString("REMARK");
	SIGN=rsSelect.getInt("SIGN");
	DMBM=rsSelect.getString("DMBM");
	PCODE=rsSelect.getString("PCODE");
	}

	public boolean doAdd() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd="INSERT INTO COM_DM(TYPE,CODE,CONTENT,REMARK,SIGN,DMBM,PCODE) VALUES("+ doPreProcess3(TYPE)+","+ doPreProcess3(CODE)+","+ doPreProcess3(CONTENT)+","+ doPreProcess3(REMARK)+","+SIGN+","+ doPreProcess3(DMBM)+","+ doPreProcess3(PCODE)+")";
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
		String sqlCount="SELECT COUNT(*) FROM COM_DM"+" WHERE CODE='"+doPreProcess(CODE)+"' and TYPE='"+doPreProcess(TYPE)+"'";
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
		String sqlModify="UPDATE COM_DM SET TYPE="+ doPreProcess3(TYPE)+",CODE="+ doPreProcess3(CODE)+",CONTENT="+ doPreProcess3(CONTENT)+",REMARK="+ doPreProcess3(REMARK)+",SIGN="+SIGN+",DMBM="+ doPreProcess3(DMBM)+",PCODE="+ doPreProcess3(PCODE)+""+" WHERE CODE='"+doPreProcess(CODE)+"' and TYPE='"+doPreProcess(TYPE)+"'";
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
		String sqlDelete="DELETE FROM COM_DM"+" WHERE CODE='"+doPreProcess(CODE)+"' and TYPE='"+doPreProcess(TYPE)+"'";
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
		String sqlCount="SELECT COUNT(*) FROM COM_DM";
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
		String sqlList="SELECT * FROM COM_DM";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			COM_DM bTable=new COM_DM();
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
		String sqlList="SELECT * FROM COM_DM";
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
			COM_DM bTable=new COM_DM();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlArr="SELECT * FROM COM_DM"+" WHERE CODE='"+doPreProcess(CODE)+"' and TYPE='"+doPreProcess(TYPE)+"'";
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
