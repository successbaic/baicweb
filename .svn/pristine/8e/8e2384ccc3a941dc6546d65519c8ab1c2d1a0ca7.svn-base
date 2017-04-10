package com.macrosoft.icms.ggxkz;
import java.sql.*;
import java.util.*;
import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.system.*;
public class GGGL_JYDW_GLZD
{
	String ADBULICNO;
	int INSYEAR;
	String ADREGSYS;
	String ADARCHMAG;
	String ADCONTMAG;
	String ADEXAMSYS;
	String ISBA;
	String ISSEPACC;
	String ISTABLE;
	String ISBG;
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

	public String getADREGSYS()
	{
		return doPreProcess(ADREGSYS);
	}

	public void setADREGSYS( String ADREGSYS)
	{
		this.ADREGSYS=doPreProcess2(convertCode(ADREGSYS));
	}

	public String getADARCHMAG()
	{
		return doPreProcess(ADARCHMAG);
	}

	public void setADARCHMAG( String ADARCHMAG)
	{
		this.ADARCHMAG=doPreProcess2(convertCode(ADARCHMAG));
	}

	public String getADCONTMAG()
	{
		return doPreProcess(ADCONTMAG);
	}

	public void setADCONTMAG( String ADCONTMAG)
	{
		this.ADCONTMAG=doPreProcess2(convertCode(ADCONTMAG));
	}

	public String getADEXAMSYS()
	{
		return doPreProcess(ADEXAMSYS);
	}

	public void setADEXAMSYS( String ADEXAMSYS)
	{
		this.ADEXAMSYS=doPreProcess2(convertCode(ADEXAMSYS));
	}

	public String getISBA()
	{
		return doPreProcess(ISBA);
	}

	public void setISBA( String ISBA)
	{
		this.ISBA=doPreProcess2(convertCode(ISBA));
	}

	public String getISSEPACC()
	{
		return doPreProcess(ISSEPACC);
	}

	public void setISSEPACC( String ISSEPACC)
	{
		this.ISSEPACC=doPreProcess2(convertCode(ISSEPACC));
	}

	public String getISTABLE()
	{
		return doPreProcess(ISTABLE);
	}

	public void setISTABLE( String ISTABLE)
	{
		this.ISTABLE=doPreProcess2(convertCode(ISTABLE));
	}

	public String getISBG()
	{
		return doPreProcess(ISBG);
	}

	public void setISBG( String ISBG)
	{
		this.ISBG=doPreProcess2(convertCode(ISBG));
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
		String sqlSelect="SELECT * FROM GGGL_JYDW_GLZD"+" WHERE INSYEAR="+INSYEAR+" and ADBULICNO='"+doPreProcess(ADBULICNO)+"'";
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
	ADREGSYS=rsSelect.getString("ADREGSYS");
	ADARCHMAG=rsSelect.getString("ADARCHMAG");
	ADCONTMAG=rsSelect.getString("ADCONTMAG");
	ADEXAMSYS=rsSelect.getString("ADEXAMSYS");
	ISBA=rsSelect.getString("ISBA");
	ISSEPACC=rsSelect.getString("ISSEPACC");
	ISTABLE=rsSelect.getString("ISTABLE");
	ISBG=rsSelect.getString("ISBG");
	}

	public boolean doAdd() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd="INSERT INTO GGGL_JYDW_GLZD(ADBULICNO,INSYEAR,ADREGSYS,ADARCHMAG,ADCONTMAG,ADEXAMSYS,ISBA,ISSEPACC,ISTABLE,ISBG) VALUES("+ doPreProcess3(ADBULICNO)+","+INSYEAR+","+ doPreProcess3(ADREGSYS)+","+ doPreProcess3(ADARCHMAG)+","+ doPreProcess3(ADCONTMAG)+","+ doPreProcess3(ADEXAMSYS)+","+ doPreProcess3(ISBA)+","+ doPreProcess3(ISSEPACC)+","+ doPreProcess3(ISTABLE)+","+ doPreProcess3(ISBG)+")";
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
		String sqlCount="SELECT COUNT(*) FROM GGGL_JYDW_GLZD"+" WHERE INSYEAR="+INSYEAR+" and ADBULICNO='"+doPreProcess(ADBULICNO)+"'";
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
		String sqlModify="UPDATE GGGL_JYDW_GLZD SET ADBULICNO="+ doPreProcess3(ADBULICNO)+",INSYEAR="+INSYEAR+",ADREGSYS="+ doPreProcess3(ADREGSYS)+",ADARCHMAG="+ doPreProcess3(ADARCHMAG)+",ADCONTMAG="+ doPreProcess3(ADCONTMAG)+",ADEXAMSYS="+ doPreProcess3(ADEXAMSYS)+",ISBA="+ doPreProcess3(ISBA)+",ISSEPACC="+ doPreProcess3(ISSEPACC)+",ISTABLE="+ doPreProcess3(ISTABLE)+",ISBG="+ doPreProcess3(ISBG)+""+" WHERE INSYEAR="+INSYEAR+" and ADBULICNO='"+doPreProcess(ADBULICNO)+"'";
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
		String sqlDelete="DELETE FROM GGGL_JYDW_GLZD"+" WHERE INSYEAR="+INSYEAR+" and ADBULICNO='"+doPreProcess(ADBULICNO)+"'";
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
		String sqlCount="SELECT COUNT(*) FROM GGGL_JYDW_GLZD";
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
		String sqlList="SELECT * FROM GGGL_JYDW_GLZD";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			GGGL_JYDW_GLZD bTable=new GGGL_JYDW_GLZD();
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
		String sqlList="SELECT * FROM GGGL_JYDW_GLZD";
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
			GGGL_JYDW_GLZD bTable=new GGGL_JYDW_GLZD();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlArr="SELECT * FROM GGGL_JYDW_GLZD"+" WHERE INSYEAR="+INSYEAR+" and ADBULICNO='"+doPreProcess(ADBULICNO)+"'";
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
