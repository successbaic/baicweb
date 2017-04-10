package com.macrosoft.icms.qydj;
import java.sql.*;
import java.util.*;
import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.*;
import com.macrosoft.icms.system.*;
public class QYDJ_FZJG_SQ
{
	String RECID;
	String OPENO;
	String PRIPID;
	String BRNAME;
	String REGNO;
	String REGDATE;
	String REGORG;
	String REGTYPE;
	String REGULATION;
	String UNISCID;
	
	public String getUNISCID()
	{
		return doPreProcess(UNISCID);
	}

	public void setUNISCID( String UNISCID)
	{
		this.UNISCID=doPreProcess2(convertCode(UNISCID));
	}
	public String getREGULATION()
	{
		return doPreProcess(REGULATION);
	}
	
	public void setREGULATION( String REGULATION)
	{
		this.REGULATION=doPreProcess2(convertCode(REGULATION));
	}
	
	public String getRECID()
	{
		return doPreProcess(RECID);
	}

	public void setRECID( String RECID)
	{
		this.RECID=doPreProcess(RECID) ;
	}

	public String getOPENO()
	{
		return doPreProcess(OPENO);
	}

	public void setOPENO( String OPENO)
	{
		this.OPENO=doPreProcess2(convertCode(OPENO));
	}

	public String getPRIPID()
	{
		return doPreProcess(PRIPID);
	}

	public void setPRIPID( String PRIPID)
	{
		this.PRIPID=doPreProcess2(convertCode(PRIPID));
	}

	public String getBRNAME()
	{
		return doPreProcess(BRNAME);
	}

	public void setBRNAME( String BRNAME)
	{
		this.BRNAME=doPreProcess2(convertCode(BRNAME));
	}

	public String getREGNO()
	{
		return doPreProcess(REGNO);
	}

	public void setREGNO( String REGNO)
	{
		this.REGNO=doPreProcess2(convertCode(REGNO));
	}

	public String getREGDATE()
	{
		return doPreProcess(REGDATE);
	}

	public void setREGDATE( String REGDATE)
	{
		this.REGDATE=doPreProcess2(convertCode(REGDATE));
	}

	public String getREGORG()
	{
		return doPreProcess(REGORG);
	}

	public void setREGORG( String REGORG)
	{
		this.REGORG=doPreProcess2(convertCode(REGORG));
	}

	public String getREGTYPE()
	{
		return doPreProcess(REGTYPE);
	}

	public void setREGTYPE( String REGTYPE)
	{
		this.REGTYPE=doPreProcess2(convertCode(REGTYPE));
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
		String sqlSelect="SELECT * FROM QYDJ_FZJG_SQ"+" WHERE RECID="+doPreProcess3(RECID)+" and OPENO='"+doPreProcess(OPENO)+"'";
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
	PRIPID=rsSelect.getString("PRIPID");
	BRNAME=rsSelect.getString("BRNAME");
	REGNO=rsSelect.getString("REGNO");
	REGDATE=String.valueOf(rsSelect.getDate("REGDATE"));
	REGORG=rsSelect.getString("REGORG");
	REGTYPE=rsSelect.getString("REGTYPE");
	REGULATION=rsSelect.getString("REGULATION");
	UNISCID=rsSelect.getString("UNISCID");
	}

	public boolean doAdd() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd="INSERT INTO QYDJ_FZJG_SQ(RECID,OPENO,PRIPID,BRNAME,REGNO,REGDATE,REGORG,REGTYPE,REGULATION,UNISCID) VALUES("+doPreProcess3(RECID)+","+ doPreProcess3(OPENO)+","+ doPreProcess3(PRIPID)+","+ doPreProcess3(BRNAME)+","+ doPreProcess3(REGNO)+",to_date("+doPreProcess3(REGDATE)+",'yyyy-mm-dd'),"+ doPreProcess3(REGORG)+","+ doPreProcess3(REGTYPE)+","+doPreProcess3(REGULATION)+","+doPreProcess3(UNISCID)+")";
		{							
			nRowCount=dbc.executeUpdate( sqlAdd );
			dbc.close();
			if (nRowCount>0)					
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
		String sqlCount="SELECT COUNT(*) FROM QYDJ_FZJG_SQ"+" WHERE RECID="+doPreProcess3(RECID)+" and OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlModify="UPDATE QYDJ_FZJG_SQ SET REGULATION="+doPreProcess3(REGULATION)+",RECID="+doPreProcess3(RECID)+",OPENO="+ doPreProcess3(OPENO)+",PRIPID="+ doPreProcess3(PRIPID)+",BRNAME="+ doPreProcess3(BRNAME)+",REGNO="+ doPreProcess3(REGNO)+",REGDATE=to_date("+doPreProcess3(REGDATE)+",'yyyy-mm-dd'),REGORG="+ doPreProcess3(REGORG)+",REGTYPE="+ doPreProcess3(REGTYPE)+",UNISCID="+doPreProcess3(UNISCID)+" WHERE RECID="+doPreProcess3(RECID)+" and OPENO='"+doPreProcess(OPENO)+"'";
		int nRowCount=dbc.executeUpdate( sqlModify );
		dbc.close();
		if (nRowCount>0)	//锟睫改成癸拷
		{
			return true;
		}
		else
			return false;
	}

	public boolean doDelete() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlDelete="DELETE FROM QYDJ_FZJG_SQ"+" WHERE RECID="+doPreProcess3(RECID)+" and OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlCount="SELECT COUNT(*) FROM QYDJ_FZJG_SQ";
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
		String sqlList="SELECT * FROM QYDJ_FZJG_SQ";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			QYDJ_FZJG_SQ bTable=new QYDJ_FZJG_SQ();
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
		String sqlList="SELECT * FROM QYDJ_FZJG_SQ";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		sqlList+=" AND ROWNUM<="+(startRow+PageSize);//start+pagesize 
		ResultSet rsList=dbc.executeQuery( sqlList);
		int	nDispRows=0;
		do
		{
			nDispRows++;
			if (nDispRows>startRow)	break;
		}
		while (rsList.next());
		while(rsList.next()) {
			QYDJ_FZJG_SQ bTable=new QYDJ_FZJG_SQ();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlArr="SELECT * FROM QYDJ_FZJG_SQ"+" WHERE RECID="+doPreProcess3(RECID)+" and OPENO='"+doPreProcess(OPENO)+"'";
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
