package com.macrosoft.icms.qydj;
import java.sql.*;
import java.util.*;
import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.*;
import com.macrosoft.icms.system.*;
public class QYDJ_SQWT_SQ
{
	String OPENO;
	String PRIPID;
	String APPPER;
	String CONSIGNER;
	String CONITEM;
	String IFLICENSE1;
	String IFLICENSE2;
	String IFLICENSE3;
	String IFLICENSE4;
	String CONFROM;
	String CONTO;
	String CERTYPE;
	String CERNO;
	String TEL;
	String MOBTEL;
	String CONDATE;
	String DEPARTMENT;
	String UNIT;
	String SIGN;
	String SBZB;
	String POSTALCODE;
	public String getSBZB() {
		return doPreProcess(SBZB);
	}

	public void setSBZB(String SBZB) {
		this.SBZB = doPreProcess2(convertCode(SBZB));
	}

	public String getSIGN() {
		return doPreProcess(SIGN);
	}

	public void setSIGN(String SIGN) {
		this.SIGN = doPreProcess2(convertCode(SIGN));
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

	public String getAPPPER()
	{
		return doPreProcess(APPPER);
	}

	public void setAPPPER( String APPPER)
	{
		this.APPPER=doPreProcess2(convertCode(APPPER));
	}

	public String getCONSIGNER()
	{
		return doPreProcess(CONSIGNER);
	}

	public void setCONSIGNER( String CONSIGNER)
	{
		this.CONSIGNER=doPreProcess2(convertCode(CONSIGNER));
	}

	public String getCONITEM()
	{
		return doPreProcess(CONITEM);
	}

	public void setCONITEM( String CONITEM)
	{
		this.CONITEM=doPreProcess2(convertCode(CONITEM));
	}

	public String getIFLICENSE1()
	{
		return doPreProcess(IFLICENSE1);
	}

	public void setIFLICENSE1( String IFLICENSE1)
	{
		this.IFLICENSE1=doPreProcess2(convertCode(IFLICENSE1));
	}

	public String getIFLICENSE2()
	{
		return doPreProcess(IFLICENSE2);
	}

	public void setIFLICENSE2( String IFLICENSE2)
	{
		this.IFLICENSE2=doPreProcess2(convertCode(IFLICENSE2));
	}

	public String getIFLICENSE3()
	{
		return doPreProcess(IFLICENSE3);
	}

	public void setIFLICENSE3( String IFLICENSE3)
	{
		this.IFLICENSE3=doPreProcess2(convertCode(IFLICENSE3));
	}

	public String getIFLICENSE4()
	{
		return doPreProcess(IFLICENSE4);
	}

	public void setIFLICENSE4( String IFLICENSE4)
	{
		this.IFLICENSE4=doPreProcess2(convertCode(IFLICENSE4));
	}

	public String getCONFROM()
	{
		return doPreProcess(CONFROM);
	}

	public void setCONFROM( String CONFROM)
	{
		this.CONFROM=doPreProcess2(convertCode(CONFROM));
	}

	public String getCONTO()
	{
		return doPreProcess(CONTO);
	}

	public void setCONTO( String CONTO)
	{
		this.CONTO=doPreProcess2(convertCode(CONTO));
	}

	public String getCERTYPE()
	{
		return doPreProcess(CERTYPE);
	}

	public void setCERTYPE( String CERTYPE)
	{
		this.CERTYPE=doPreProcess2(convertCode(CERTYPE));
	}

	public String getCERNO()
	{
		return doPreProcess(CERNO);
	}

	public void setCERNO( String CERNO)
	{
		this.CERNO=doPreProcess2(convertCode(CERNO));
	}

	public String getTEL()
	{
		return doPreProcess(TEL);
	}

	public void setTEL( String TEL)
	{
		this.TEL=doPreProcess2(convertCode(TEL));
	}

	public String getMOBTEL()
	{
		return doPreProcess(MOBTEL);
	}

	public void setMOBTEL( String MOBTEL)
	{
		this.MOBTEL=doPreProcess2(convertCode(MOBTEL));
	}

	public String getCONDATE()
	{
		return doPreProcess(CONDATE);
	}

	public void setCONDATE( String CONDATE)
	{
		this.CONDATE=doPreProcess2(convertCode(CONDATE));
	}

	public String getDEPARTMENT()
	{
		return doPreProcess(DEPARTMENT);
	}

	public void setDEPARTMENT( String DEPARTMENT)
	{
		this.DEPARTMENT=doPreProcess2(convertCode(DEPARTMENT));
	}

	public String getPOSTALCODE() {
		return POSTALCODE;
	}

	public void setPOSTALCODE(String pOSTALCODE) {
		POSTALCODE = pOSTALCODE;
	}

	public String getUNIT()
	{
		return doPreProcess(UNIT);
	}

	public void setUNIT( String UNIT)
	{
		this.UNIT=doPreProcess2(convertCode(UNIT));
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
		String sqlSelect="SELECT * FROM QYDJ_SQWT_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
	PRIPID=rsSelect.getString("PRIPID");
	APPPER=rsSelect.getString("APPPER");
	CONSIGNER=rsSelect.getString("CONSIGNER");
	CONITEM=rsSelect.getString("CONITEM");
	IFLICENSE1=rsSelect.getString("IFLICENSE1");
	IFLICENSE2=rsSelect.getString("IFLICENSE2");
	IFLICENSE3=rsSelect.getString("IFLICENSE3");
	IFLICENSE4=rsSelect.getString("IFLICENSE4");
	CONFROM=String.valueOf(rsSelect.getDate("CONFROM"));
	CONTO=String.valueOf(rsSelect.getDate("CONTO"));
	CERTYPE=rsSelect.getString("CERTYPE");
	CERNO=rsSelect.getString("CERNO");
	TEL=rsSelect.getString("TEL");
	MOBTEL=rsSelect.getString("MOBTEL");
	POSTALCODE= rsSelect.getString("POSTALCODE");
	CONDATE=String.valueOf(rsSelect.getDate("CONDATE"));
	DEPARTMENT=rsSelect.getString("DEPARTMENT");
	UNIT=rsSelect.getString("UNIT");
	SBZB = rsSelect.getString("SBZB");
	SIGN = rsSelect.getString("SIGN");
	}

	public boolean doAdd() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd="INSERT INTO QYDJ_SQWT_SQ(OPENO,PRIPID,APPPER,CONSIGNER,CONITEM,IFLICENSE1,IFLICENSE2,IFLICENSE3,IFLICENSE4,CONFROM,CONTO,CERTYPE,CERNO,TEL,MOBTEL,POSTALCODE,CONDATE,DEPARTMENT,UNIT,SBZB,SIGN) VALUES("+ doPreProcess3(OPENO)+","+ doPreProcess3(PRIPID)+","+ doPreProcess3(APPPER)+","+ doPreProcess3(CONSIGNER)+","+ doPreProcess3(CONITEM)+","+ doPreProcess3(IFLICENSE1)+","+ doPreProcess3(IFLICENSE2)+","+ doPreProcess3(IFLICENSE3)+","+ doPreProcess3(IFLICENSE4)+",to_date("+doPreProcess3(CONFROM)+",'yyyy-mm-dd'),to_date("+doPreProcess3(CONTO)+",'yyyy-mm-dd'),"+ doPreProcess3(CERTYPE)+","+ doPreProcess3(CERNO)+","+ doPreProcess3(TEL)+","+ doPreProcess3(MOBTEL)+","+ doPreProcess3(POSTALCODE)+",to_date("+doPreProcess3(CONDATE)+",'yyyy-mm-dd'),"+ doPreProcess3(DEPARTMENT)+","+ doPreProcess3(UNIT)+","+doPreProcess3(SBZB)+","+doPreProcess2(SIGN)+""+")";
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
		String sqlCount="SELECT COUNT(*) FROM QYDJ_SQWT_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlModify="UPDATE QYDJ_SQWT_SQ SET OPENO="+ doPreProcess3(OPENO)+",PRIPID="+ doPreProcess3(PRIPID)+",APPPER="+ doPreProcess3(APPPER)+",CONSIGNER="+ doPreProcess3(CONSIGNER)+",CONITEM="+ doPreProcess3(CONITEM)+",IFLICENSE1="+ doPreProcess3(IFLICENSE1)+",IFLICENSE2="+ doPreProcess3(IFLICENSE2)+",IFLICENSE3="+ doPreProcess3(IFLICENSE3)+",IFLICENSE4="+ doPreProcess3(IFLICENSE4)+",CONFROM=to_date("+doPreProcess3(CONFROM)+",'yyyy-mm-dd'),CONTO=to_date("+doPreProcess3(CONTO)+",'yyyy-mm-dd'),CERTYPE="+ doPreProcess3(CERTYPE)+",CERNO="+ doPreProcess3(CERNO)+",TEL="+ doPreProcess3(TEL)+",MOBTEL="+ doPreProcess3(MOBTEL)+",POSTALCODE="+ doPreProcess3(POSTALCODE)+",CONDATE=to_date("+doPreProcess3(CONDATE)+",'yyyy-mm-dd'),DEPARTMENT="+ doPreProcess3(DEPARTMENT)+",UNIT="+ doPreProcess3(UNIT)+",SBZB="+doPreProcess3(SBZB)+",SIGN="+doPreProcess3(SIGN)+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlDelete="DELETE FROM QYDJ_SQWT_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlCount="SELECT COUNT(*) FROM QYDJ_SQWT_SQ";
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
		String sqlList="SELECT * FROM QYDJ_SQWT_SQ";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			QYDJ_SQWT_SQ bTable=new QYDJ_SQWT_SQ();
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
		String sqlList="SELECT * FROM QYDJ_SQWT_SQ";
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
			QYDJ_SQWT_SQ bTable=new QYDJ_SQWT_SQ();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlArr="SELECT * FROM QYDJ_SQWT_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
