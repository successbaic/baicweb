package com.macrosoft.icms.htgl;
import java.sql.*;
import java.util.*;

import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.*;
import com.macrosoft.icms.system.*;
public class DCDY_BGXX_SQ
{
	String OPENO;
	String MORCONTNO;
	int RECID;
	String ALTCONITEM;
	String ALTBE;
	String ALTAF;
	String ALTDATA;
	String REMARK;
	public String getOPENO()
	{
		return doPreProcess(OPENO);
	}

	public void setOPENO( String OPENO)
	{
		this.OPENO=doPreProcess2(convertCode(OPENO));
	}

	public String getMORCONTNO()
	{
		return doPreProcess(MORCONTNO);
	}

	public void setMORCONTNO( String MORCONTNO)
	{
		this.MORCONTNO=doPreProcess2(convertCode(MORCONTNO));
	}

	public int getRECID()
	{
		return RECID;
	}

	public void setRECID( int RECID)
	{
		this.RECID=RECID ;
	}

	public String getALTCONITEM()
	{
		return doPreProcess(ALTCONITEM);
	}

	public void setALTCONITEM( String ALTCONITEM)
	{
		this.ALTCONITEM=doPreProcess2(convertCode(ALTCONITEM));
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

	public String getALTDATA()
	{
		return doPreProcess(ALTDATA);
	}

	public void setALTDATA( String ALTDATA)
	{
		this.ALTDATA=doPreProcess2(convertCode(ALTDATA));
	}

	public String getREMARK()
	{
		return doPreProcess(REMARK);
	}

	public void setREMARK( String REMARK)
	{
		this.REMARK=doPreProcess2(convertCode(REMARK));
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
		String sqlSelect="SELECT * FROM DCDY_BGXX_SQ"+" WHERE ALTCONITEM='"+doPreProcess(ALTCONITEM)+"' and OPENO='"+doPreProcess(OPENO)+"'";
		rsSelect=dbc.executeQuery(sqlSelect);
		if(rsSelect.next())
		{
			doSetData( rsSelect );
		}
		dbc.close();
	}

	public void doSetData( ResultSet rsSelect ) throws SQLException
	{
	OPENO=rsSelect.getString("OPENO");
	MORCONTNO=rsSelect.getString("MORCONTNO");
	RECID=rsSelect.getInt("RECID");
	ALTCONITEM=rsSelect.getString("ALTCONITEM");
	ALTBE=rsSelect.getString("ALTBE");
	ALTAF=rsSelect.getString("ALTAF");
	ALTDATA=String.valueOf(rsSelect.getDate("ALTDATA"));
	REMARK=rsSelect.getString("REMARK");
	}

	public boolean doAdd() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd="INSERT INTO DCDY_BGXX_SQ(OPENO,MORCONTNO,RECID,ALTCONITEM,ALTBE,ALTAF,ALTDATA,REMARK) VALUES("+ doPreProcess3(OPENO)+","+ doPreProcess3(MORCONTNO)+","+RECID+","+ doPreProcess3(ALTCONITEM)+","+ doPreProcess3(ALTBE)+","+ doPreProcess3(ALTAF)+",to_date("+doPreProcess3(ALTDATA)+",'yyyy-mm-dd'),"+ doPreProcess3(REMARK)+")";
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
		String sqlCount="SELECT COUNT(*) FROM DCDY_BGXX_SQ"+" WHERE ALTCONITEM='"+doPreProcess(ALTCONITEM)+"' and OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlModify="UPDATE DCDY_BGXX_SQ SET OPENO="+ doPreProcess3(OPENO)+",MORCONTNO="+ doPreProcess3(MORCONTNO)+",RECID="+RECID+",ALTCONITEM="+ doPreProcess3(ALTCONITEM)+",ALTBE="+ doPreProcess3(ALTBE)+",ALTAF="+ doPreProcess3(ALTAF)+",ALTDATA=to_date("+doPreProcess3(ALTDATA)+",'yyyy-mm-dd'),REMARK="+ doPreProcess3(REMARK)+""+" WHERE ALTCONITEM='"+doPreProcess(ALTCONITEM)+"' and OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlDelete="DELETE FROM DCDY_BGXX_SQ"+" WHERE ALTCONITEM='"+doPreProcess(ALTCONITEM)+"' and OPENO='"+doPreProcess(OPENO)+"'";
		int nRowCount=dbc.executeUpdate( sqlDelete );
		dbc.close();
		if (nRowCount>0)
		{
			return true;
		}
		else
			return false;
	}
	
	public boolean doDeleteAll() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlDelete="DELETE FROM DCDY_BGXX_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlCount="SELECT COUNT(*) FROM DCDY_BGXX_SQ";
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
		String sqlList="SELECT * FROM DCDY_BGXX_SQ";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			DCDY_BGXX_SQ bTable=new DCDY_BGXX_SQ();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}
	boolean DywChange;
	public void setDywChange(String ALTITEM){		
		if(ALTITEM.equals("03")||
			ALTITEM.equals("04")||
			ALTITEM.equals("05")){
			DywChange=true;
		}
	}
	public boolean getDywChange(){
		return this.DywChange;
	}
	
	public boolean doZs2LcDcdy(String OPENO,String MORCONTNO,String OPETYPE,String DYWALONE) throws SQLException{
		DbConnection dbc=new DbConnection();
		ArrayList list=new ArrayList();
		list.add(OPENO);
		list.add(MORCONTNO);
		list.add(OPETYPE);
		list.add(DYWALONE);
		String ret=(String)dbc.executeStp("{ ?=call STP_ZS2LC_DCDY(?,?,?,?)}",list,1);
		dbc.close();
		if(ret!=null && !ret.equals("")){
			return true;
		}else{
			return false;
		}
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
	public ArrayList getDataList() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlArr="SELECT * FROM DCDY_BGXX_SQ "+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
		ResultSet rsArr=dbc.executeQuery(sqlArr);
		ArrayList al= new ArrayList();
		String[] ay = null;		
		while (rsArr.next())
		{	
			String aALTITEM=doPreProcess(rsArr.getString("ALTCONITEM")).trim(); //"01 03 10 "
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
	////////reload function getlist
	public ArrayList getList( String sqlWhere,int startRow,int PageSize) throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ArrayList al= new ArrayList();
		String sqlList="SELECT * FROM DCDY_BGXX_SQ";
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
			DCDY_BGXX_SQ bTable=new DCDY_BGXX_SQ();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlArr="SELECT * FROM DCDY_BGXX_SQ"+" WHERE ALTCONITEM='"+doPreProcess(ALTCONITEM)+"' and OPENO='"+doPreProcess(OPENO)+"'";
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
	public String doModifyJbxx(String sALTITEM,String sALTAF) throws SQLException
	{
		String sqlModify="";
		if(sALTITEM.equals("MAINCONTTYPE"))
		{
			sqlModify=" MAINCONTTYPE= "+ doPreProcess3(sALTAF);//更新主债权的种类
		}
		else if(sALTITEM.equals("MAINCONTAM"))
		{
			sqlModify=" MAINCONTAM= "+ doPreProcess3(sALTAF);//变更主债权的数额
		}
		else if(sALTITEM.equals("PRICRE"))
		{
			sqlModify=" PRICRE= "+ doPreProcess3(sALTAF);//担保范围
		}
		else if(sALTITEM.equals("11")){
			sqlModify=" CONTOTHSTI= "+ doPreProcess3(sALTAF);//抵押合同其他约定
		}
		else if(sALTITEM.equals("PEFPERFROM"))
		{
			sqlModify=" PEFPERFROM= to_date("+ doPreProcess3(sALTAF)+",'yyyy-mm-dd')";//履行债务起始时间
		}

		else if(sALTITEM.equals("PEFPERTO"))
		{
			sqlModify=" PEFPERTO= to_date("+ doPreProcess3(sALTAF)+",'yyyy-mm-dd')";//履行债务结束时间
		}

		else if(sALTITEM.equals("99"))
		{
			
		}		
		return sqlModify;
 	}
	public String doModifyDywxx(String sALTITEM,String sALTAF)
	{
		String sqlModify="";
		if(sALTITEM.equals("03"))
		{
			sqlModify=" GUANAME= "+ doPreProcess3(sALTAF);//抵押物的名称
		}
		else if(sALTITEM.equals("04"))
		{
			sqlModify=" QUAN= "+ doPreProcess3(sALTAF);//抵押物的数量
		}
		else if(sALTITEM.equals("05"))
		{
			sqlModify=" VALUE= "+ doPreProcess3(sALTAF);//抵押物的价格
		}
		return sqlModify;
	}
	public int getListMax(String sqlWhere ) throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlCount="SELECT MAX(RECID) FROM DCDY_BGXX_SQ ";
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
}
