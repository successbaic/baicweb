package com.macrosoft.icms.util;
import java.sql.*;
import java.util.*;
import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.*;
import com.macrosoft.icms.system.*;
public class WSDJ_YYHM_REGORG
{
	String REGORG;
	int MAXBH;
	int BH1;
	int BH2;
	String CZRY;
	String CZSJ;
	int BH3;
	int BH4;
	int BH5;
	int BH6;
	int BH7;
	String TYPE;
	public String getREGORG()
	{
		return doPreProcess(REGORG);
	}

	public void setREGORG( String REGORG)
	{
		this.REGORG=doPreProcess2(convertCode(REGORG));
	}

	public int getMAXBH()
	{
		return MAXBH;
	}

	public void setMAXBH( int MAXBH)
	{
		this.MAXBH=MAXBH ;
	}

	public int getBH1()
	{
		return BH1;
	}

	public void setBH1( int BH1)
	{
		this.BH1=BH1 ;
	}

	public int getBH2()
	{
		return BH2;
	}

	public void setBH2( int BH2)
	{
		this.BH2=BH2 ;
	}

	public String getCZRY()
	{
		return doPreProcess(CZRY);
	}

	public void setCZRY( String CZRY)
	{
		this.CZRY=doPreProcess2(convertCode(CZRY));
	}

	public String getCZSJ()
	{
		return doPreProcess(CZSJ);
	}

	public void setCZSJ( String CZSJ)
	{
		this.CZSJ=doPreProcess2(convertCode(CZSJ));
	}

	public int getBH3()
	{
		return BH3;
	}

	public void setBH3( int BH3)
	{
		this.BH3=BH3 ;
	}

	public int getBH4()
	{
		return BH4;
	}

	public void setBH4( int BH4)
	{
		this.BH4=BH4 ;
	}

	public int getBH5()
	{
		return BH5;
	}

	public void setBH5( int BH5)
	{
		this.BH5=BH5 ;
	}

	public int getBH6()
	{
		return BH6;
	}

	public void setBH6( int BH6)
	{
		this.BH6=BH6 ;
	}

	public int getBH7()
	{
		return BH7;
	}

	public void setBH7( int BH7)
	{
		this.BH7=BH7 ;
	}

	public String getTYPE()
	{
		return doPreProcess(TYPE);
	}

	public void setTYPE( String TYPE)
	{
		this.TYPE=doPreProcess2(convertCode(TYPE));
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
		String sqlSelect="SELECT * FROM WSDJ_YYHM_REGORG"+" WHERE REGORG='"+doPreProcess(REGORG)+"' and TYPE='"+doPreProcess(TYPE)+"'";
		rsSelect=dbc.executeQuery(sqlSelect);
		if(rsSelect.next())
		{
			doSetData( rsSelect );
		}
		dbc.close();
	}
	public void doSelectBySql(String sqlSelect) throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsSelect;		
		rsSelect=dbc.executeQuery(sqlSelect);
		if(rsSelect.next())
		{
			doSetData( rsSelect );
		}
		dbc.close();
	}
	public void doSetData( ResultSet rsSelect ) throws SQLException
	{
	REGORG=rsSelect.getString("REGORG");
	MAXBH=rsSelect.getInt("MAXBH");
	BH1=rsSelect.getInt("BH1");
	BH2=rsSelect.getInt("BH2");
	CZRY=rsSelect.getString("CZRY");
	CZSJ=String.valueOf(rsSelect.getDate("CZSJ"));
	BH3=rsSelect.getInt("BH3");
	BH4=rsSelect.getInt("BH4");
	BH5=rsSelect.getInt("BH5");
	BH6=rsSelect.getInt("BH6");
	BH7=rsSelect.getInt("BH7");
	TYPE=rsSelect.getString("TYPE");
	}

	public boolean doAdd() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd="INSERT INTO WSDJ_YYHM_REGORG(REGORG,MAXBH,BH1,BH2,CZRY,CZSJ,BH3,BH4,BH5,BH6,BH7,TYPE) VALUES("+ doPreProcess3(REGORG)+","+MAXBH+","+BH1+","+BH2+","+ doPreProcess3(CZRY)+",to_date("+doPreProcess3(CZSJ)+",'yyyy-mm-dd'),"+BH3+","+BH4+","+BH5+","+BH6+","+BH7+","+ doPreProcess3(TYPE)+")";
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
		String sqlCount="SELECT COUNT(*) FROM WSDJ_YYHM_REGORG"+" WHERE REGORG='"+doPreProcess(REGORG)+"' and TYPE='"+doPreProcess(TYPE)+"'";
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
		String sqlModify="UPDATE WSDJ_YYHM_REGORG SET REGORG="+ doPreProcess3(REGORG)+",MAXBH="+MAXBH+",BH1="+BH1+",BH2="+BH2+",CZRY="+ doPreProcess3(CZRY)+",CZSJ=to_date("+doPreProcess3(CZSJ)+",'yyyy-mm-dd'),BH3="+BH3+",BH4="+BH4+",BH5="+BH5+",BH6="+BH6+",BH7="+BH7+",TYPE="+ doPreProcess3(TYPE)+""+" WHERE REGORG='"+doPreProcess(REGORG)+"' and TYPE='"+doPreProcess(TYPE)+"'";
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
		String sqlDelete="DELETE FROM WSDJ_YYHM_REGORG"+" WHERE REGORG='"+doPreProcess(REGORG)+"' and TYPE='"+doPreProcess(TYPE)+"'";
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
		String sqlCount="SELECT COUNT(*) FROM WSDJ_YYHM_REGORG";
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
		String sqlList="SELECT * FROM WSDJ_YYHM_REGORG";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			WSDJ_YYHM_REGORG bTable=new WSDJ_YYHM_REGORG();
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
		String sqlList="SELECT * FROM WSDJ_YYHM_REGORG";
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
			WSDJ_YYHM_REGORG bTable=new WSDJ_YYHM_REGORG();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlArr="SELECT * FROM WSDJ_YYHM_REGORG"+" WHERE REGORG='"+doPreProcess(REGORG)+"' and TYPE='"+doPreProcess(TYPE)+"'";
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
