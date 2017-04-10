package com.macrosoft.icms.util;
import java.sql.*;
import java.util.*;
import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.system.*;
public class WSDJ_XGCL
{
	String QYLX;
	String ALTITEM;
	String WJMC;
	String FIELD01;
	String FIELD02;
	String FIELD03;
	String FIELD04;
	

	public String getQYLX() {
		return QYLX;
	}

	public void setQYLX(String qylx) {
		QYLX = qylx;
	}

	public String getALTITEM() {
		return ALTITEM;
	}

	public void setALTITEM(String altitem) {
		ALTITEM = altitem;
	}

	public String getWJMC() {
		return WJMC;
	}

	public void setWJMC(String wjmc) {
		WJMC = wjmc;
	}

	public String getFIELD01() {
		return FIELD01;
	}

	public void setFIELD01(String field01) {
		FIELD01 = field01;
	}

	public String getFIELD02() {
		return FIELD02;
	}

	public void setFIELD02(String field02) {
		FIELD02 = field02;
	}

	public String getFIELD03() {
		return FIELD03;
	}

	public void setFIELD03(String field03) {
		FIELD03 = field03;
	}

	public String getFIELD04() {
		return FIELD04;
	}

	public void setFIELD04(String field04) {
		FIELD04 = field04;
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
		String sqlSelect="SELECT * FROM WSDJ_XGCL WHERE QYLX='"+doPreProcess(QYLX)+"' AND ALTITEM='"+doPreProcess(ALTITEM);
		rsSelect=dbc.executeQuery(sqlSelect);
		if(rsSelect.next())
		{
			doSetData( rsSelect );
		}
		dbc.close();
	}

	public void doSetData( ResultSet rsSelect ) throws SQLException
	{
	QYLX=rsSelect.getString("QYLX");
	ALTITEM=rsSelect.getString("ALTITEM");
	WJMC=rsSelect.getString("WJMC");
	FIELD01=rsSelect.getString("FIELD01");
	FIELD02=rsSelect.getString("FIELD02");
	FIELD03=rsSelect.getString("FIELD03");
	FIELD04=rsSelect.getString("FIELD04");
	}

	public boolean doAdd() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd="INSERT INTO WSDJ_XGCL(QYLX,ALTITEM,WJMC,FIELD01,FIELD02,FIELD03,FIELD04) VALUES("+ doPreProcess3(QYLX)+","+ doPreProcess3(ALTITEM)+","+ doPreProcess3(WJMC)+","+ doPreProcess3(FIELD01)+","+ doPreProcess3(FIELD02)+","+ doPreProcess3(FIELD03)+","+ doPreProcess3(FIELD04)+")";
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
		String sqlCount="SELECT COUNT(*) FROM WSDJ_XGCL";
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
		String sqlModify="UPDATE WSDJ_XGCL SET QYLX="+ doPreProcess3(QYLX)+",ALTITEM="+ doPreProcess3(ALTITEM)+",WJMC="+ doPreProcess3(WJMC)+",FIELD01="+ doPreProcess3(FIELD01)+",FIELD02="+ doPreProcess3(FIELD02)+",FIELD03="+ doPreProcess3(FIELD03)+",FIELD04="+ doPreProcess3(FIELD04)+" WHERE QYLX='"+doPreProcess(QYLX)+"' AND ALTITEM='"+doPreProcess(ALTITEM);
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
		String sqlDelete="DELETE FROM WSDJ_XGCL WHERE QYLX='"+doPreProcess(QYLX)+"' AND ALTITEM='"+doPreProcess(ALTITEM);
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
		String sqlCount="SELECT COUNT(*) FROM WSDJ_XGCL";
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
		String sqlList="SELECT * FROM WSDJ_XGCL";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			WSDJ_XGCL bTable=new WSDJ_XGCL();
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
		String sqlList="SELECT * FROM WSDJ_XGCL";
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
			WSDJ_XGCL bTable=new WSDJ_XGCL();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlArr="SELECT * FROM WSDJ_XGCL  WHERE QYLX='"+doPreProcess(QYLX)+"' AND ALTITEM='"+doPreProcess(ALTITEM);
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
	public ArrayList getWJMC( String sqlWhere ) throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ArrayList al= new ArrayList();
		String sqlList="SELECT * FROM WSDJ_XGCL";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		System.out.println("getWJMC()="+sqlList);
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			WSDJ_XGCL bTable=new WSDJ_XGCL();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;
	}
}
