package com.macrosoft.icms.ggxkz;
import java.sql.*;
import java.util.*;

import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.system.*;
public class GGGL_JYDW_ZSXX
{
	String ADBULICNO;
	int INSYEAR;
	int RECID;
	String ADTICERTYPE;
	String NAME;
	String CERNAME;
	String CERNO;
	String CULDATE;
	String ISSCARDDATE;
	String S_EXT_TIMESTAMP;
	public String getADBULICNO()
	{
		return doPreProcess(ADBULICNO);
	}

	public void setADBULICNO( String ADBULICNO)
	{
		this.ADBULICNO=doPreProcess2(convertCode(ADBULICNO));
	}

	public int getINSYEAR()
	{
		return INSYEAR;
	}

	public void setINSYEAR( int INSYEAR)
	{
		this.INSYEAR=INSYEAR ;
	}

	public int getRECID()
	{
		return RECID;
	}

	public void setRECID( int RECID)
	{
		this.RECID=RECID ;
	}

	public String getADTICERTYPE()
	{
		return doPreProcess(ADTICERTYPE);
	}

	public void setADTICERTYPE( String ADTICERTYPE)
	{
		this.ADTICERTYPE=doPreProcess2(convertCode(ADTICERTYPE));
	}

	public String getNAME()
	{
		return doPreProcess(NAME);
	}

	public void setNAME( String NAME)
	{
		this.NAME=doPreProcess2(convertCode(NAME));
	}

	public String getCERNAME()
	{
		return doPreProcess(CERNAME);
	}

	public void setCERNAME( String CERNAME)
	{
		this.CERNAME=doPreProcess2(convertCode(CERNAME));
	}

	public String getCERNO()
	{
		return doPreProcess(CERNO);
	}

	public void setCERNO( String CERNO)
	{
		this.CERNO=doPreProcess2(convertCode(CERNO));
	}

	public String getCULDATE()
	{
		return doPreProcess(CULDATE);
	}

	public void setCULDATE( String CULDATE)
	{
		this.CULDATE=doPreProcess2(convertCode(CULDATE));
	}

	public String getISSCARDDATE()
	{
		return doPreProcess(ISSCARDDATE);
	}

	public void setISSCARDDATE( String ISSCARDDATE)
	{
		this.ISSCARDDATE=doPreProcess2(convertCode(ISSCARDDATE));
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
		String sqlSelect="SELECT * FROM GGGL_JYDW_ZSXX"+" WHERE INSYEAR="+INSYEAR+" and ADBULICNO='"+doPreProcess(ADBULICNO)+"' and RECID="+RECID+"";
		rsSelect=dbc.executeQuery(sqlSelect);
		if(rsSelect.next())
		{
			doSetData( rsSelect );
		}
		dbc.close();
	}

	public void doSetData( ResultSet rsSelect ) throws SQLException
	{
	ADBULICNO=rsSelect.getString("ADBULICNO");
	INSYEAR=rsSelect.getInt("INSYEAR");
	RECID=rsSelect.getInt("RECID");
	ADTICERTYPE=rsSelect.getString("ADTICERTYPE");
	NAME=rsSelect.getString("NAME");
	CERNAME=rsSelect.getString("CERNAME");
	CERNO=rsSelect.getString("CERNO");
	CULDATE=String.valueOf(rsSelect.getDate("CULDATE"));
	ISSCARDDATE=String.valueOf(rsSelect.getDate("ISSCARDDATE"));
	S_EXT_TIMESTAMP=rsSelect.getString("S_EXT_TIMESTAMP");
	}

	public boolean doAdd() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd="INSERT INTO GGGL_JYDW_ZSXX(ADBULICNO,INSYEAR,RECID,ADTICERTYPE,NAME,CERNAME,CERNO,CULDATE,ISSCARDDATE) VALUES("+ doPreProcess3(ADBULICNO)+","+INSYEAR+","+RECID+","+ doPreProcess3(ADTICERTYPE)+","+ doPreProcess3(NAME)+","+ doPreProcess3(CERNAME)+","+ doPreProcess3(CERNO)+",to_date("+doPreProcess3(CULDATE)+",'yyyy-mm-dd'),to_date("+doPreProcess3(ISSCARDDATE)+",'yyyy-mm-dd'))";
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
		String sqlCount="SELECT COUNT(*) FROM GGGL_JYDW_ZSXX"+" WHERE INSYEAR="+INSYEAR+" and ADBULICNO='"+doPreProcess(ADBULICNO)+"' and RECID="+RECID+"";
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
		String sqlModify="UPDATE GGGL_JYDW_ZSXX SET ADBULICNO="+ doPreProcess3(ADBULICNO)+",INSYEAR="+INSYEAR+",RECID="+RECID+",ADTICERTYPE="+ doPreProcess3(ADTICERTYPE)+",NAME="+ doPreProcess3(NAME)+",CERNAME="+ doPreProcess3(CERNAME)+",CERNO="+ doPreProcess3(CERNO)+",CULDATE=to_date("+doPreProcess3(CULDATE)+",'yyyy-mm-dd'),ISSCARDDATE=to_date("+doPreProcess3(ISSCARDDATE)+",'yyyy-mm-dd')"+" WHERE INSYEAR="+INSYEAR+" and ADBULICNO='"+doPreProcess(ADBULICNO)+"' and RECID="+RECID+"";
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
		String sqlDelete="DELETE FROM GGGL_JYDW_ZSXX"+" WHERE INSYEAR="+INSYEAR+" and ADBULICNO='"+doPreProcess(ADBULICNO)+"' and RECID="+RECID+"";
		int nRowCount=dbc.executeUpdate( sqlDelete );
		dbc.close();
		if (nRowCount>0)
		{
			return true;
		}
		else
			return false;
	}

	//查询证书信息中某业务的记录编号最大值
	public int getListMax(String sqlWhere ) throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlCount="SELECT MAX(RECID) FROM GGGL_JYDW_ZSXX ";
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

	public int getListCount(String sqlWhere ) throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlCount="SELECT COUNT(*) FROM GGGL_JYDW_ZSXX";
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
		String sqlList="SELECT * FROM GGGL_JYDW_ZSXX";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			GGGL_JYDW_ZSXX bTable=new GGGL_JYDW_ZSXX();
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
		String sqlList="SELECT * FROM GGGL_JYDW_ZSXX";
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
			GGGL_JYDW_ZSXX bTable=new GGGL_JYDW_ZSXX();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;
	}

	public ArrayList getData() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlArr="SELECT * FROM GGGL_JYDW_ZSXX"+" WHERE INSYEAR="+INSYEAR+" and ADBULICNO='"+doPreProcess(ADBULICNO)+"' and RECID="+RECID;
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
