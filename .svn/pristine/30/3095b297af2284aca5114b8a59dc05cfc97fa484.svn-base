package com.macrosoft.icms.gggl;
import java.sql.*;
import java.util.*;
import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.*;
import com.macrosoft.icms.system.*;
public class HWGG_FBZXX_SQ
{
	String POSTALCODE;
	String LINKMAN;
	String TEL;
	String OPENO;
	String ADREGCNO;
	String ADISSENT;
	String ADISSENTTYPE;
	String LEREP;
	String BLICTYPE;
	String BLICNO;
	String ADDR;
	public String getPOSTALCODE()
	{
		return doPreProcess(POSTALCODE);
	}

	public void setPOSTALCODE( String POSTALCODE)
	{
		this.POSTALCODE=doPreProcess2(convertCode(POSTALCODE));
	}

	public String getLINKMAN()
	{
		return doPreProcess(LINKMAN);
	}

	public void setLINKMAN( String LINKMAN)
	{
		this.LINKMAN=doPreProcess2(convertCode(LINKMAN));
	}

	public String getTEL()
	{
		return doPreProcess(TEL);
	}

	public void setTEL( String TEL)
	{
		this.TEL=doPreProcess2(convertCode(TEL));
	}

	public String getOPENO()
	{
		return doPreProcess(OPENO);
	}

	public void setOPENO( String OPENO)
	{
		this.OPENO=doPreProcess2(convertCode(OPENO));
	}

	public String getADREGCNO()
	{
		return doPreProcess(ADREGCNO);
	}

	public void setADREGCNO( String ADREGCNO)
	{
		this.ADREGCNO=doPreProcess2(convertCode(ADREGCNO));
	}

	public String getADISSENT()
	{
		return doPreProcess(ADISSENT);
	}

	public void setADISSENT( String ADISSENT)
	{
		this.ADISSENT=doPreProcess2(convertCode(ADISSENT));
	}

	public String getADISSENTTYPE()
	{
		return doPreProcess(ADISSENTTYPE);
	}

	public void setADISSENTTYPE( String ADISSENTTYPE)
	{
		this.ADISSENTTYPE=doPreProcess2(convertCode(ADISSENTTYPE));
	}

	public String getLEREP()
	{
		return doPreProcess(LEREP);
	}

	public void setLEREP( String LEREP)
	{
		this.LEREP=doPreProcess2(convertCode(LEREP));
	}

	public String getBLICTYPE()
	{
		return doPreProcess(BLICTYPE);
	}

	public void setBLICTYPE( String BLICTYPE)
	{
		this.BLICTYPE=doPreProcess2(convertCode(BLICTYPE));
	}

	public String getBLICNO()
	{
		return doPreProcess(BLICNO);
	}

	public void setBLICNO( String BLICNO)
	{
		this.BLICNO=doPreProcess2(convertCode(BLICNO));
	}

	public String getADDR()
	{
		return doPreProcess(ADDR);
	}

	public void setADDR( String ADDR)
	{
		this.ADDR=doPreProcess2(convertCode(ADDR));
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
		String sqlSelect="SELECT * FROM HWGG_FBZXX_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
		rsSelect=dbc.executeQuery(sqlSelect);
		if(rsSelect.next())
		{
			doSetData( rsSelect );
		}
		dbc.close();
	}

	public void doSetData( ResultSet rsSelect ) throws SQLException
	{
	POSTALCODE=rsSelect.getString("POSTALCODE");
	LINKMAN=rsSelect.getString("LINKMAN");
	TEL=rsSelect.getString("TEL");
	OPENO=rsSelect.getString("OPENO");
	ADREGCNO=rsSelect.getString("ADREGCNO");
	ADISSENT=rsSelect.getString("ADISSENT");
	ADISSENTTYPE=rsSelect.getString("ADISSENTTYPE");
	LEREP=rsSelect.getString("LEREP");
	BLICTYPE=rsSelect.getString("BLICTYPE");
	BLICNO=rsSelect.getString("BLICNO");
	ADDR=rsSelect.getString("ADDR");
	}

	public boolean doAdd() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd="INSERT INTO HWGG_FBZXX_SQ(POSTALCODE,LINKMAN,TEL,OPENO,ADREGCNO,ADISSENT,ADISSENTTYPE,LEREP,BLICTYPE,BLICNO,ADDR) VALUES("+ doPreProcess3(POSTALCODE)+","+ doPreProcess3(LINKMAN)+","+ doPreProcess3(TEL)+","+ doPreProcess3(OPENO)+","+ doPreProcess3(ADREGCNO)+","+ doPreProcess3(ADISSENT)+","+ doPreProcess3(ADISSENTTYPE)+","+ doPreProcess3(LEREP)+","+ doPreProcess3(BLICTYPE)+","+ doPreProcess3(BLICNO)+","+ doPreProcess3(ADDR)+")";
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
		String sqlCount="SELECT COUNT(*) FROM HWGG_FBZXX_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlModify="UPDATE HWGG_FBZXX_SQ SET POSTALCODE="+ doPreProcess3(POSTALCODE)+",LINKMAN="+ doPreProcess3(LINKMAN)+",TEL="+ doPreProcess3(TEL)+",OPENO="+ doPreProcess3(OPENO)+",ADREGCNO="+ doPreProcess3(ADREGCNO)+",ADISSENT="+ doPreProcess3(ADISSENT)+",ADISSENTTYPE="+ doPreProcess3(ADISSENTTYPE)+",LEREP="+ doPreProcess3(LEREP)+",BLICTYPE="+ doPreProcess3(BLICTYPE)+",BLICNO="+ doPreProcess3(BLICNO)+",ADDR="+ doPreProcess3(ADDR)+""+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlDelete="DELETE FROM HWGG_FBZXX_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlCount="SELECT COUNT(*) FROM HWGG_FBZXX_SQ";
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
		String sqlList="SELECT * FROM HWGG_FBZXX_SQ";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			HWGG_FBZXX_SQ bTable=new HWGG_FBZXX_SQ();
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
		String sqlList="SELECT * FROM HWGG_FBZXX_SQ";
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
			HWGG_FBZXX_SQ bTable=new HWGG_FBZXX_SQ();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlArr="SELECT * FROM HWGG_FBZXX_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
