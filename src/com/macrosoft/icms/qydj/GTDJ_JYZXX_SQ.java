package com.macrosoft.icms.qydj;
import java.sql.*;
import java.util.*;
import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.*;
import com.macrosoft.icms.system.*;
public class GTDJ_JYZXX_SQ
{
	String NATION;
	String BIRTHDAY;
	String HCERTYPE;
	String HCERNO;
	int HCERVALPER;
	String MCERTYPE;
	String MCERNO;
	int MCERVALPER;
	String TCERTYPE;
	String TCERNO;
	int TCERVALPER;
	String TCERNAME;
	String TCERNUM;
	String WHETHERHKMAC;
	String OPENO;
	String PRIPID;
	String NAME;
	String SEX;
	String POLSTAND;
	String LITEDEG;
	String OCCSTBEAPP;
	String DOM;
	String CERTYPE;
	String CERNO;
	String POSTALCODE;
	String TEL;
	String EMAIL;
	String MOBTEL;
	
	public String getNATION()
	{
		return doPreProcess(NATION);
	}

	public void setNATION( String NATION)
	{
		this.NATION=doPreProcess2(convertCode(NATION));
	}

	public String getBIRTHDAY()
	{
		return doPreProcess(BIRTHDAY);
	}

	public void setBIRTHDAY( String BIRTHDAY)
	{
		this.BIRTHDAY=doPreProcess2(convertCode(BIRTHDAY));
	}

	public String getHCERTYPE()
	{
		return doPreProcess(HCERTYPE);
	}

	public void setHCERTYPE( String HCERTYPE)
	{
		this.HCERTYPE=doPreProcess2(convertCode(HCERTYPE));
	}

	public String getHCERNO()
	{
		return doPreProcess(HCERNO);
	}

	public void setHCERNO( String HCERNO)
	{
		this.HCERNO=doPreProcess2(convertCode(HCERNO));
	}

	public int getHCERVALPER()
	{
		return HCERVALPER;
	}

	public void setHCERVALPER( int HCERVALPER)
	{
		this.HCERVALPER=HCERVALPER ;
	}

	public String getMCERTYPE()
	{
		return doPreProcess(MCERTYPE);
	}

	public void setMCERTYPE( String MCERTYPE)
	{
		this.MCERTYPE=doPreProcess2(convertCode(MCERTYPE));
	}

	public String getMCERNO()
	{
		return doPreProcess(MCERNO);
	}

	public void setMCERNO( String MCERNO)
	{
		this.MCERNO=doPreProcess2(convertCode(MCERNO));
	}

	public int getMCERVALPER()
	{
		return MCERVALPER;
	}

	public void setMCERVALPER( int MCERVALPER)
	{
		this.MCERVALPER=MCERVALPER ;
	}

	public String getTCERTYPE()
	{
		return doPreProcess(TCERTYPE);
	}

	public void setTCERTYPE( String TCERTYPE)
	{
		this.TCERTYPE=doPreProcess2(convertCode(TCERTYPE));
	}

	public String getTCERNO()
	{
		return doPreProcess(TCERNO);
	}

	public void setTCERNO( String TCERNO)
	{
		this.TCERNO=doPreProcess2(convertCode(TCERNO));
	}

	public int getTCERVALPER()
	{
		return TCERVALPER;
	}

	public void setTCERVALPER( int TCERVALPER)
	{
		this.TCERVALPER=TCERVALPER ;
	}

	public String getTCERNAME()
	{
		return doPreProcess(TCERNAME);
	}

	public void setTCERNAME( String TCERNAME)
	{
		this.TCERNAME=doPreProcess2(convertCode(TCERNAME));
	}

	public String getTCERNUM()
	{
		return doPreProcess(TCERNUM);
	}

	public void setTCERNUM( String TCERNUM)
	{
		this.TCERNUM=doPreProcess2(convertCode(TCERNUM));
	}

	public String getWHETHERHKMAC()
	{
		return doPreProcess(WHETHERHKMAC);
	}

	public void setWHETHERHKMAC( String WHETHERHKMAC)
	{
		this.WHETHERHKMAC=doPreProcess2(convertCode(WHETHERHKMAC));
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

	public String getNAME()
	{
		return doPreProcess(NAME);
	}

	public void setNAME( String NAME)
	{
		this.NAME=doPreProcess2(convertCode(NAME));
	}

	public String getSEX()
	{
		return doPreProcess(SEX);
	}

	public void setSEX( String SEX)
	{
		this.SEX=doPreProcess2(convertCode(SEX));
	}

	public String getPOLSTAND()
	{
		return doPreProcess(POLSTAND);
	}

	public void setPOLSTAND( String POLSTAND)
	{
		this.POLSTAND=doPreProcess2(convertCode(POLSTAND));
	}

	public String getLITEDEG()
	{
		return doPreProcess(LITEDEG);
	}

	public void setLITEDEG( String LITEDEG)
	{
		this.LITEDEG=doPreProcess2(convertCode(LITEDEG));
	}

	public String getOCCSTBEAPP()
	{
		return doPreProcess(OCCSTBEAPP);
	}

	public void setOCCSTBEAPP( String OCCSTBEAPP)
	{
		this.OCCSTBEAPP=doPreProcess2(convertCode(OCCSTBEAPP));
	}

	public String getDOM()
	{
		return doPreProcess(DOM);
	}

	public void setDOM( String DOM)
	{
		this.DOM=doPreProcess2(convertCode(DOM));
	}

	public String getCERTYPE()
	{
		return doPreProcess(CERTYPE);
	}

	public void setCERTYPE( String CERTYPE)
	{
		this.CERTYPE=doPreProcess2(convertCode(CERTYPE));
	}

	public String getMOBTEL() {
		return doPreProcess(MOBTEL);
	}

	public void setMOBTEL(String mOBTEL) {
		MOBTEL = mOBTEL;
	}
	
	public String getCERNO()
	{
		return doPreProcess(CERNO);
	}

	public void setCERNO( String CERNO)
	{
		this.CERNO=doPreProcess2(convertCode(CERNO));
	}

	public String getPOSTALCODE()
	{
		return doPreProcess(POSTALCODE);
	}

	public void setPOSTALCODE( String POSTALCODE)
	{
		this.POSTALCODE=doPreProcess2(convertCode(POSTALCODE));
	}

	public String getTEL()
	{
		return doPreProcess(TEL);
	}

	public void setTEL( String TEL)
	{
		this.TEL=doPreProcess2(convertCode(TEL));
	}

	public String getEMAIL()
	{
		return doPreProcess(EMAIL);
	}

	public void setEMAIL( String EMAIL)
	{
		this.EMAIL=doPreProcess2(convertCode(EMAIL));
	}

	public String convertCode(String strvalue)
	{	return com.macrosoft.icms.system.SysUtility.convertCode( strvalue );	}

	public String doPreProcess( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess( sValue );	}

	public String doPreProcess2( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess2( sValue );	}

	public String doPreProcess3( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess3( sValue );	}

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
	
	public void doSelect() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsSelect;
		String sqlSelect="SELECT * FROM GTDJ_JYZXX_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
		rsSelect=dbc.executeQuery(sqlSelect);
		if(rsSelect.next())
		{
			doSetData( rsSelect );
		}
		dbc.close();
	}

	public void doSetData( ResultSet rsSelect ) throws SQLException
	{
	NATION=rsSelect.getString("NATION");
	BIRTHDAY=String.valueOf(rsSelect.getDate("BIRTHDAY"));
	HCERTYPE=rsSelect.getString("HCERTYPE");
	HCERNO=rsSelect.getString("HCERNO");
	HCERVALPER=rsSelect.getInt("HCERVALPER");
	MCERTYPE=rsSelect.getString("MCERTYPE");
	MCERNO=rsSelect.getString("MCERNO");
	MCERVALPER=rsSelect.getInt("MCERVALPER");
	TCERTYPE=rsSelect.getString("TCERTYPE");
	TCERNO=rsSelect.getString("TCERNO");
	TCERVALPER=rsSelect.getInt("TCERVALPER");
	TCERNAME=rsSelect.getString("TCERNAME");
	TCERNUM=rsSelect.getString("TCERNUM");
	WHETHERHKMAC=rsSelect.getString("WHETHERHKMAC");
	OPENO=rsSelect.getString("OPENO");
	PRIPID=rsSelect.getString("PRIPID");
	NAME=rsSelect.getString("NAME");
	SEX=rsSelect.getString("SEX");
	POLSTAND=rsSelect.getString("POLSTAND");
	LITEDEG=rsSelect.getString("LITEDEG");
	OCCSTBEAPP=rsSelect.getString("OCCSTBEAPP");
	DOM=rsSelect.getString("DOM");
	CERTYPE=rsSelect.getString("CERTYPE");
	CERNO=rsSelect.getString("CERNO");
	POSTALCODE=rsSelect.getString("POSTALCODE");
	TEL=rsSelect.getString("TEL");
	EMAIL=rsSelect.getString("EMAIL");
	MOBTEL=rsSelect.getString("MOBTEL");
	}

	public boolean doAdd() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd="INSERT INTO GTDJ_JYZXX_SQ(NATION,BIRTHDAY,HCERTYPE,HCERNO,HCERVALPER,MCERTYPE,MCERNO,MCERVALPER,TCERTYPE,TCERNO,TCERVALPER,TCERNAME,TCERNUM,WHETHERHKMAC,OPENO,PRIPID,NAME,SEX,POLSTAND,LITEDEG,OCCSTBEAPP,DOM,CERTYPE,CERNO,POSTALCODE,TEL,EMAIL,MOBTEL) VALUES("+ doPreProcess3(NATION)+",to_date("+doPreProcess3(BIRTHDAY)+",'yyyy-mm-dd'),"+ doPreProcess3(HCERTYPE)+","+ doPreProcess3(HCERNO)+","+HCERVALPER+","+ doPreProcess3(MCERTYPE)+","+ doPreProcess3(MCERNO)+","+MCERVALPER+","+ doPreProcess3(TCERTYPE)+","+ doPreProcess3(TCERNO)+","+TCERVALPER+","+ doPreProcess3(TCERNAME)+","+ doPreProcess3(TCERNUM)+","+ doPreProcess3(WHETHERHKMAC)+","+ doPreProcess3(OPENO)+","+ doPreProcess3(PRIPID)+","+ doPreProcess3(NAME)+","+ doPreProcess3(SEX)+","+ doPreProcess3(POLSTAND)+","+ doPreProcess3(LITEDEG)+","+ doPreProcess3(OCCSTBEAPP)+","+ doPreProcess3(DOM)+","+ doPreProcess3(CERTYPE)+","+ doPreProcess3(CERNO)+","+ doPreProcess3(POSTALCODE)+","+ doPreProcess3(TEL)+","+ doPreProcess3(EMAIL)+","+ doPreProcess3(MOBTEL)+")";
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
		String sqlCount="SELECT COUNT(*) FROM GTDJ_JYZXX_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlModify="UPDATE GTDJ_JYZXX_SQ SET NATION="+ doPreProcess3(NATION)+",BIRTHDAY=to_date("+doPreProcess3(BIRTHDAY)+",'yyyy-mm-dd'),HCERTYPE="+ doPreProcess3(HCERTYPE)+",HCERNO="+ doPreProcess3(HCERNO)+",HCERVALPER="+HCERVALPER+",MCERTYPE="+ doPreProcess3(MCERTYPE)+",MCERNO="+ doPreProcess3(MCERNO)+",MCERVALPER="+MCERVALPER+",TCERTYPE="+ doPreProcess3(TCERTYPE)+",TCERNO="+ doPreProcess3(TCERNO)+",TCERVALPER="+TCERVALPER+",TCERNAME="+ doPreProcess3(TCERNAME)+",TCERNUM="+ doPreProcess3(TCERNUM)+",WHETHERHKMAC="+ doPreProcess3(WHETHERHKMAC)+",OPENO="+ doPreProcess3(OPENO)+",PRIPID="+ doPreProcess3(PRIPID)+",NAME="+ doPreProcess3(NAME)+",SEX="+ doPreProcess3(SEX)+",POLSTAND="+ doPreProcess3(POLSTAND)+",LITEDEG="+ doPreProcess3(LITEDEG)+",OCCSTBEAPP="+ doPreProcess3(OCCSTBEAPP)+",DOM="+ doPreProcess3(DOM)+",CERTYPE="+ doPreProcess3(CERTYPE)+",CERNO="+ doPreProcess3(CERNO)+",POSTALCODE="+ doPreProcess3(POSTALCODE)+",TEL="+ doPreProcess3(TEL)+",EMAIL="+ doPreProcess3(EMAIL)+",MOBTEL="+ doPreProcess3(MOBTEL)+""+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
		int nRowCount=dbc.executeUpdate( sqlModify );
		dbc.close();
		if (nRowCount>0)	//修改成功
		{
			return true;
		}
		else
			return false;
	}
	public boolean doModifyByJyz() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlModify="UPDATE GTDJ_JYZXX_SQ SET NAME="+ doPreProcess3(NAME)+""+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlDelete="DELETE FROM GTDJ_JYZXX_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlCount="SELECT COUNT(*) FROM GTDJ_JYZXX_SQ";
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
		String sqlList="SELECT * FROM GTDJ_JYZXX_SQ";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			GTDJ_JYZXX_SQ bTable=new GTDJ_JYZXX_SQ();
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
		String sqlList="SELECT * FROM GTDJ_JYZXX_SQ";
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
			GTDJ_JYZXX_SQ bTable=new GTDJ_JYZXX_SQ();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlArr="SELECT * FROM GTDJ_JYZXX_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
