package com.macrosoft.icms.qydj;
import java.sql.*;
import java.util.*;
import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.*;
import com.macrosoft.icms.system.*;
public class QYDJ_XKXX_SQ
{
	String RECID;
	String OPENO;
	String PRIPID;
	String LICNO;
	String LICNAME;
	String ABUITEMCO;
	String ITEMS;
	String VALFROM;
	String VALTO;
	String LICANTH;
	String LICSTATE;
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

	public String getLICNO()
	{
		return doPreProcess(LICNO);
	}

	public void setLICNO( String LICNO)
	{
		this.LICNO=doPreProcess2(convertCode(LICNO));
	}

	public String getLICNAME()
	{
		return doPreProcess(LICNAME);
	}

	public void setLICNAME( String LICNAME)
	{
		this.LICNAME=doPreProcess2(convertCode(LICNAME));
	}

	public String getABUITEMCO()
	{
		return doPreProcess(ABUITEMCO);
	}

	public void setABUITEMCO( String ABUITEMCO)
	{
		this.ABUITEMCO=doPreProcess2(convertCode(ABUITEMCO));
	}

	public String getITEMS()
	{
		return doPreProcess(ITEMS);
	}

	public void setITEMS( String ITEMS)
	{
		this.ITEMS=doPreProcess2(convertCode(ITEMS));
	}

	public String getVALFROM()
	{
		return doPreProcess(VALFROM);
	}

	public void setVALFROM( String VALFROM)
	{
		this.VALFROM=doPreProcess2(convertCode(VALFROM));
	}

	public String getVALTO()
	{
		return doPreProcess(VALTO);
	}

	public void setVALTO( String VALTO)
	{
		this.VALTO=doPreProcess2(convertCode(VALTO));
	}

	public String getLICANTH()
	{
		return doPreProcess(LICANTH);
	}

	public void setLICANTH( String LICANTH)
	{
		this.LICANTH=doPreProcess2(convertCode(LICANTH));
	}

	public String getLICSTATE()
	{
		return doPreProcess(LICSTATE);
	}

	public void setLICSTATE( String LICSTATE)
	{
		this.LICSTATE=doPreProcess2(convertCode(LICSTATE));
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
		String sqlSelect="SELECT * FROM QYDJ_XKXX_SQ"+" WHERE RECID="+doPreProcess3(RECID)+" and OPENO='"+doPreProcess(OPENO)+"'";
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
	LICNO=rsSelect.getString("LICNO");
	LICNAME=rsSelect.getString("LICNAME");
	ABUITEMCO=rsSelect.getString("ABUITEMCO");
	ITEMS=rsSelect.getString("ITEMS");
	VALFROM=String.valueOf(rsSelect.getDate("VALFROM"));
	VALTO=String.valueOf(rsSelect.getDate("VALTO"));
	LICANTH=rsSelect.getString("LICANTH");
	LICSTATE=rsSelect.getString("LICSTATE");
	}

	public boolean doAdd() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd="INSERT INTO QYDJ_XKXX_SQ(RECID,OPENO,PRIPID,LICNO,LICNAME,ABUITEMCO,ITEMS,VALFROM,VALTO,LICANTH,LICSTATE) VALUES("+doPreProcess3(RECID)+","+ doPreProcess3(OPENO)+","+ doPreProcess3(PRIPID)+","+ doPreProcess3(LICNO)+","+ doPreProcess3(LICNAME)+","+ doPreProcess3(ABUITEMCO)+","+ doPreProcess3(ITEMS)+",to_date("+doPreProcess3(VALFROM)+",'yyyy-mm-dd'),to_date("+doPreProcess3(VALTO)+",'yyyy-mm-dd'),"+ doPreProcess3(LICANTH)+","+ doPreProcess3(LICSTATE)+")";
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
		String sqlCount="SELECT COUNT(*) FROM QYDJ_XKXX_SQ"+" WHERE RECID="+doPreProcess3(RECID)+" and OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlModify="UPDATE QYDJ_XKXX_SQ SET RECID="+doPreProcess3(RECID)+",OPENO="+ doPreProcess3(OPENO)+",PRIPID="+ doPreProcess3(PRIPID)+",LICNO="+ doPreProcess3(LICNO)+",LICNAME="+ doPreProcess3(LICNAME)+",ABUITEMCO="+ doPreProcess3(ABUITEMCO)+",ITEMS="+ doPreProcess3(ITEMS)+",VALFROM=to_date("+doPreProcess3(VALFROM)+",'yyyy-mm-dd'),VALTO=to_date("+doPreProcess3(VALTO)+",'yyyy-mm-dd'),LICANTH="+ doPreProcess3(LICANTH)+",LICSTATE="+ doPreProcess3(LICSTATE)+""+" WHERE RECID="+doPreProcess3(RECID)+" and OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlDelete="DELETE FROM QYDJ_XKXX_SQ"+" WHERE RECID="+doPreProcess3(RECID)+" and OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlCount="SELECT COUNT(*) FROM QYDJ_XKXX_SQ";
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
		String sqlList="SELECT * FROM QYDJ_XKXX_SQ";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			QYDJ_XKXX_SQ bTable=new QYDJ_XKXX_SQ();
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
		String sqlList="SELECT * FROM QYDJ_XKXX_SQ";
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
			QYDJ_XKXX_SQ bTable=new QYDJ_XKXX_SQ();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlArr="SELECT * FROM QYDJ_XKXX_SQ"+" WHERE RECID="+doPreProcess3(RECID)+" and OPENO='"+doPreProcess(OPENO)+"'";
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
