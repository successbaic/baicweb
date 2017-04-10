package com.macrosoft.icms.qydj;
import java.sql.*;
import java.util.*;
import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.*;
import com.macrosoft.icms.system.*;
public class FGDJ_JBXX
{
	String ANCHEYEAR;
	String PRIPID;
	String ESTORGSIGN;
	String SETUPTIME;
	String PARINS;
	String PARORGW;
	int NUMPARM;
	String RESPARMSIGN;
	String RESPARSECSIGN;
	String ANORGPARSIGN;
	String NORMCHARG;
	String ACTIROOMSIGN;
	String ENTNAME;
	String REGNO;
	String ENTTYPE;
	double REGCAP;
	String PNAME;
	String ADDR;
	String TEL;
	int EMPNUM;
	String REGORG;
	String LOGINID;
	String RBSJ;
	public String getANCHEYEAR()
	{
		return doPreProcess(ANCHEYEAR);
	}

	public void setANCHEYEAR( String ANCHEYEAR)
	{
		this.ANCHEYEAR=doPreProcess2(convertCode(ANCHEYEAR));
	}

	public String getPRIPID()
	{
		return doPreProcess(PRIPID);
	}

	public void setPRIPID( String PRIPID)
	{
		this.PRIPID=doPreProcess2(convertCode(PRIPID));
	}

	public String getESTORGSIGN()
	{
		return doPreProcess(ESTORGSIGN);
	}

	public void setESTORGSIGN( String ESTORGSIGN)
	{
		this.ESTORGSIGN=doPreProcess2(convertCode(ESTORGSIGN));
	}

	public String getSETUPTIME()
	{
		return doPreProcess(SETUPTIME);
	}

	public void setSETUPTIME( String SETUPTIME)
	{
		this.SETUPTIME=doPreProcess2(convertCode(SETUPTIME));
	}

	public String getPARINS()
	{
		return doPreProcess(PARINS);
	}

	public void setPARINS( String PARINS)
	{
		this.PARINS=doPreProcess2(convertCode(PARINS));
	}

	public String getPARORGW()
	{
		return doPreProcess(PARORGW);
	}

	public void setPARORGW( String PARORGW)
	{
		this.PARORGW=doPreProcess2(convertCode(PARORGW));
	}

	public int getNUMPARM()
	{
		return NUMPARM;
	}

	public void setNUMPARM( int NUMPARM)
	{
		this.NUMPARM=NUMPARM ;
	}

	public String getRESPARMSIGN()
	{
		return doPreProcess(RESPARMSIGN);
	}

	public void setRESPARMSIGN( String RESPARMSIGN)
	{
		this.RESPARMSIGN=doPreProcess2(convertCode(RESPARMSIGN));
	}

	public String getRESPARSECSIGN()
	{
		return doPreProcess(RESPARSECSIGN);
	}

	public void setRESPARSECSIGN( String RESPARSECSIGN)
	{
		this.RESPARSECSIGN=doPreProcess2(convertCode(RESPARSECSIGN));
	}

	public String getANORGPARSIGN()
	{
		return doPreProcess(ANORGPARSIGN);
	}

	public void setANORGPARSIGN( String ANORGPARSIGN)
	{
		this.ANORGPARSIGN=doPreProcess2(convertCode(ANORGPARSIGN));
	}

	public String getNORMCHARG()
	{
		return doPreProcess(NORMCHARG);
	}

	public void setNORMCHARG( String NORMCHARG)
	{
		this.NORMCHARG=doPreProcess2(convertCode(NORMCHARG));
	}

	public String getACTIROOMSIGN()
	{
		return doPreProcess(ACTIROOMSIGN);
	}

	public void setACTIROOMSIGN( String ACTIROOMSIGN)
	{
		this.ACTIROOMSIGN=doPreProcess2(convertCode(ACTIROOMSIGN));
	}

	public String getENTNAME()
	{
		return doPreProcess(ENTNAME);
	}

	public void setENTNAME( String ENTNAME)
	{
		this.ENTNAME=doPreProcess2(convertCode(ENTNAME));
	}

	public String getREGNO()
	{
		return doPreProcess(REGNO);
	}

	public void setREGNO( String REGNO)
	{
		this.REGNO=doPreProcess2(convertCode(REGNO));
	}

	public String getENTTYPE()
	{
		return doPreProcess(ENTTYPE);
	}

	public void setENTTYPE( String ENTTYPE)
	{
		this.ENTTYPE=doPreProcess2(convertCode(ENTTYPE));
	}

	public double getREGCAP()
	{
		return REGCAP;
	}

	public void setREGCAP( double REGCAP)
	{
		this.REGCAP=REGCAP ;
	}

	public String getPNAME()
	{
		return doPreProcess(PNAME);
	}

	public void setPNAME( String PNAME)
	{
		this.PNAME=doPreProcess2(convertCode(PNAME));
	}

	public String getADDR()
	{
		return doPreProcess(ADDR);
	}

	public void setADDR( String ADDR)
	{
		this.ADDR=doPreProcess2(convertCode(ADDR));
	}

	public String getTEL()
	{
		return doPreProcess(TEL);
	}

	public void setTEL( String TEL)
	{
		this.TEL=doPreProcess2(convertCode(TEL));
	}

	public int getEMPNUM()
	{
		return EMPNUM;
	}

	public void setEMPNUM( int EMPNUM)
	{
		this.EMPNUM=EMPNUM ;
	}

	public String getREGORG()
	{
		return doPreProcess(REGORG);
	}

	public void setREGORG( String REGORG)
	{
		this.REGORG=doPreProcess2(convertCode(REGORG));
	}

	public String getLOGINID()
	{
		return doPreProcess(LOGINID);
	}

	public void setLOGINID( String LOGINID)
	{
		this.LOGINID=doPreProcess2(convertCode(LOGINID));
	}

	public String getRBSJ()
	{
		return doPreProcess(RBSJ);
	}

	public void setRBSJ( String RBSJ)
	{
		this.RBSJ=doPreProcess2(convertCode(RBSJ));
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
		String sqlSelect="SELECT * FROM FGDJ_JBXX"+" WHERE ANCHEYEAR='"+doPreProcess(ANCHEYEAR)+"' and PRIPID='"+doPreProcess(PRIPID)+"'";
		rsSelect=dbc.executeQuery(sqlSelect);
		if(rsSelect.next())
		{
			doSetData( rsSelect );
		}
		dbc.close();
	}

	public void doSetData( ResultSet rsSelect ) throws SQLException
	{
	ANCHEYEAR=rsSelect.getString("ANCHEYEAR");
	PRIPID=rsSelect.getString("PRIPID");
	ESTORGSIGN=rsSelect.getString("ESTORGSIGN");
	SETUPTIME=String.valueOf(rsSelect.getDate("SETUPTIME"));
	PARINS=rsSelect.getString("PARINS");
	PARORGW=rsSelect.getString("PARORGW");
	NUMPARM=rsSelect.getInt("NUMPARM");
	RESPARMSIGN=rsSelect.getString("RESPARMSIGN");
	RESPARSECSIGN=rsSelect.getString("RESPARSECSIGN");
	ANORGPARSIGN=rsSelect.getString("ANORGPARSIGN");
	NORMCHARG=rsSelect.getString("NORMCHARG");
	ACTIROOMSIGN=rsSelect.getString("ACTIROOMSIGN");
	ENTNAME=rsSelect.getString("ENTNAME");
	REGNO=rsSelect.getString("REGNO");
	ENTTYPE=rsSelect.getString("ENTTYPE");
	REGCAP=rsSelect.getDouble("REGCAP");
	PNAME=rsSelect.getString("PNAME");
	ADDR=rsSelect.getString("ADDR");
	TEL=rsSelect.getString("TEL");
	EMPNUM=rsSelect.getInt("EMPNUM");
	REGORG=rsSelect.getString("REGORG");
	LOGINID=rsSelect.getString("LOGINID");
	RBSJ=String.valueOf(rsSelect.getDate("RBSJ"));
	}

	public boolean doAdd() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd="INSERT INTO FGDJ_JBXX(ANCHEYEAR,PRIPID,ESTORGSIGN,SETUPTIME,PARINS,PARORGW,NUMPARM,RESPARMSIGN,RESPARSECSIGN,ANORGPARSIGN,NORMCHARG,ACTIROOMSIGN,ENTNAME,REGNO,ENTTYPE,REGCAP,PNAME,ADDR,TEL,EMPNUM,REGORG,LOGINID,RBSJ) VALUES("+ doPreProcess3(ANCHEYEAR)+","+ doPreProcess3(PRIPID)+","+ doPreProcess3(ESTORGSIGN)+",to_date("+doPreProcess3(SETUPTIME)+",'yyyy-mm-dd'),"+ doPreProcess3(PARINS)+","+ doPreProcess3(PARORGW)+","+NUMPARM+","+ doPreProcess3(RESPARMSIGN)+","+ doPreProcess3(RESPARSECSIGN)+","+ doPreProcess3(ANORGPARSIGN)+","+ doPreProcess3(NORMCHARG)+","+ doPreProcess3(ACTIROOMSIGN)+","+ doPreProcess3(ENTNAME)+","+ doPreProcess3(REGNO)+","+ doPreProcess3(ENTTYPE)+","+REGCAP+","+ doPreProcess3(PNAME)+","+ doPreProcess3(ADDR)+","+ doPreProcess3(TEL)+","+EMPNUM+","+ doPreProcess3(REGORG)+","+ doPreProcess3(LOGINID)+",sysdate)";
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
		String sqlCount="SELECT COUNT(*) FROM FGDJ_JBXX"+" WHERE ANCHEYEAR='"+doPreProcess(ANCHEYEAR)+"' and PRIPID='"+doPreProcess(PRIPID)+"'";
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
		String sqlModify="UPDATE FGDJ_JBXX SET ANCHEYEAR="+ doPreProcess3(ANCHEYEAR)+",PRIPID="+ doPreProcess3(PRIPID)+",ESTORGSIGN="+ doPreProcess3(ESTORGSIGN)+",SETUPTIME=to_date("+doPreProcess3(SETUPTIME)+",'yyyy-mm-dd'),PARINS="+ doPreProcess3(PARINS)+",PARORGW="+ doPreProcess3(PARORGW)+",NUMPARM="+NUMPARM+",RESPARMSIGN="+ doPreProcess3(RESPARMSIGN)+",RESPARSECSIGN="+ doPreProcess3(RESPARSECSIGN)+",ANORGPARSIGN="+ doPreProcess3(ANORGPARSIGN)+",NORMCHARG="+ doPreProcess3(NORMCHARG)+",ACTIROOMSIGN="+ doPreProcess3(ACTIROOMSIGN)+",ENTNAME="+ doPreProcess3(ENTNAME)+",REGNO="+ doPreProcess3(REGNO)+",ENTTYPE="+ doPreProcess3(ENTTYPE)+",REGCAP="+REGCAP+",PNAME="+ doPreProcess3(PNAME)+",ADDR="+ doPreProcess3(ADDR)+",TEL="+ doPreProcess3(TEL)+",EMPNUM="+EMPNUM+",REGORG="+ doPreProcess3(REGORG)+",LOGINID="+ doPreProcess3(LOGINID)+",RBSJ=sysdate"+" WHERE ANCHEYEAR='"+doPreProcess(ANCHEYEAR)+"' and PRIPID='"+doPreProcess(PRIPID)+"'";
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
		String sqlDelete="DELETE FROM FGDJ_JBXX"+" WHERE ANCHEYEAR='"+doPreProcess(ANCHEYEAR)+"' and PRIPID='"+doPreProcess(PRIPID)+"'";
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
		String sqlCount="SELECT COUNT(*) FROM FGDJ_JBXX";
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
		String sqlList="SELECT * FROM FGDJ_JBXX";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			FGDJ_JBXX bTable=new FGDJ_JBXX();
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
		String sqlList="SELECT * FROM FGDJ_JBXX";
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
			FGDJ_JBXX bTable=new FGDJ_JBXX();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlArr="SELECT * FROM FGDJ_JBXX"+" WHERE ANCHEYEAR='"+doPreProcess(ANCHEYEAR)+"' and PRIPID='"+doPreProcess(PRIPID)+"'";
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
