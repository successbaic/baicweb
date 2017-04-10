package com.macrosoft.icms.ggxkz;
import java.sql.*;
import java.util.*;
import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.system.*;
public class GGGL_JYDW_HCQK
{
	String ADBULICNO;
	int INSYEAR;
	String ISREGCAP;
	String ISOPDOM;
	String ISJUCOL;
	String ISCRED;
	String ISADCHE;
	String ISOPBUS;
	String ISPROEQU;
	String ISMASYS;
	String ISBUSSIT;
	String ISCASE;
	String ISCHANGE;
	String CHEOPIN;
	String CHEPER;
	String CHEDATE;
	String CHECHI;
	String CHECHIDATE;
	String DIRGENOPIN;
	String DIRGENDATE;
	String OPINION;
	String OPDATE;
	String OTHERCHEOPIN;
	String CHEPERID;
	
	public String getCHEPERID()
	{
		return doPreProcess(CHEPERID);
	}

	public void setCHEPERID( String CHEPERID)
	{
		this.CHEPERID=doPreProcess2(convertCode(CHEPERID));
	}
	
	public String getOTHERCHEOPIN()
	{
		return doPreProcess(OTHERCHEOPIN);
	}

	public void setOTHERCHEOPIN( String OTHERCHEOPIN)
	{
		this.OTHERCHEOPIN=doPreProcess2(convertCode(OTHERCHEOPIN));
	}
	
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

	public String getISREGCAP()
	{
		return doPreProcess(ISREGCAP);
	}

	public void setISREGCAP( String ISREGCAP)
	{
		this.ISREGCAP=doPreProcess2(convertCode(ISREGCAP));
	}

	public String getISOPDOM()
	{
		return doPreProcess(ISOPDOM);
	}

	public void setISOPDOM( String ISOPDOM)
	{
		this.ISOPDOM=doPreProcess2(convertCode(ISOPDOM));
	}
	
	public String getISJUCOL()
	{
		return doPreProcess(ISJUCOL);
	}

	public void setISJUCOL( String ISJUCOL)
	{
		this.ISJUCOL=doPreProcess2(convertCode(ISJUCOL));
	}

	public String getISCRED()
	{
		return doPreProcess(ISCRED);
	}

	public void setISCRED( String ISCRED)
	{
		this.ISCRED=doPreProcess2(convertCode(ISCRED));
	}

	public String getISADCHE()
	{
		return doPreProcess(ISADCHE);
	}

	public void setISADCHE( String ISADCHE)
	{
		this.ISADCHE=doPreProcess2(convertCode(ISADCHE));
	}

	public String getISOPBUS()
	{
		return doPreProcess(ISOPBUS);
	}

	public void setISOPBUS( String ISOPBUS)
	{
		this.ISOPBUS=doPreProcess2(convertCode(ISOPBUS));
	}

	public String getISPROEQU()
	{
		return doPreProcess(ISPROEQU);
	}

	public void setISPROEQU( String ISPROEQU)
	{
		this.ISPROEQU=doPreProcess2(convertCode(ISPROEQU));
	}

	public String getISMASYS()
	{
		return doPreProcess(ISMASYS);
	}

	public void setISMASYS( String ISMASYS)
	{
		this.ISMASYS=doPreProcess2(convertCode(ISMASYS));
	}

	public String getISBUSSIT()
	{
		return doPreProcess(ISBUSSIT);
	}

	public void setISBUSSIT( String ISBUSSIT)
	{
		this.ISBUSSIT=doPreProcess2(convertCode(ISBUSSIT));
	}

	public String getISCASE()
	{
		return doPreProcess(ISCASE);
	}

	public void setISCASE( String ISCASE)
	{
		this.ISCASE=doPreProcess2(convertCode(ISCASE));
	}

	public String getISCHANGE()
	{
		return doPreProcess(ISCHANGE);
	}

	public void setISCHANGE( String ISCHANGE)
	{
		this.ISCHANGE=doPreProcess2(convertCode(ISCHANGE));
	}

	public String getCHEOPIN()
	{
		return doPreProcess(CHEOPIN);
	}

	public void setCHEOPIN( String CHEOPIN)
	{
		this.CHEOPIN=doPreProcess2(convertCode(CHEOPIN));
	}

	public String getCHEPER()
	{
		return doPreProcess(CHEPER);
	}

	public void setCHEPER( String CHEPER)
	{
		this.CHEPER=doPreProcess2(convertCode(CHEPER));
	}

	public String getCHEDATE()
	{
		return doPreProcess(CHEDATE);
	}

	public void setCHEDATE( String CHEDATE)
	{
		this.CHEDATE=doPreProcess2(convertCode(CHEDATE));
	}

	public String getCHECHI()
	{
		return doPreProcess(CHECHI);
	}

	public void setCHECHI( String CHECHI)
	{
		this.CHECHI=doPreProcess2(convertCode(CHECHI));
	}

	public String getCHECHIDATE()
	{
		return doPreProcess(CHECHIDATE);
	}

	public void setCHECHIDATE( String CHECHIDATE)
	{
		this.CHECHIDATE=doPreProcess2(convertCode(CHECHIDATE));
	}

	public String getDIRGENOPIN()
	{
		return doPreProcess(DIRGENOPIN);
	}

	public void setDIRGENOPIN( String DIRGENOPIN)
	{
		this.DIRGENOPIN=doPreProcess2(convertCode(DIRGENOPIN));
	}

	public String getDIRGENDATE()
	{
		return doPreProcess(DIRGENDATE);
	}

	public void setDIRGENDATE( String DIRGENDATE)
	{
		this.DIRGENDATE=doPreProcess2(convertCode(DIRGENDATE));
	}

	public String getOPINION()
	{
		return doPreProcess(OPINION);
	}

	public void setOPINION( String OPINION)
	{
		this.OPINION=doPreProcess2(convertCode(OPINION));
	}

	public String getOPDATE()
	{
		return doPreProcess(OPDATE);
	}

	public void setOPDATE( String OPDATE)
	{
		this.OPDATE=doPreProcess2(convertCode(OPDATE));
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
		String sqlSelect="SELECT * FROM GGGL_JYDW_HCQK"+" WHERE INSYEAR="+INSYEAR+" and ADBULICNO='"+doPreProcess(ADBULICNO)+"'";
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
	ISREGCAP=rsSelect.getString("ISREGCAP");
	ISOPDOM=rsSelect.getString("ISOPDOM");
	ISJUCOL=rsSelect.getString("ISJUCOL");
	ISCRED=rsSelect.getString("ISCRED");
	ISADCHE=rsSelect.getString("ISADCHE");
	ISOPBUS=rsSelect.getString("ISOPBUS");
	ISPROEQU=rsSelect.getString("ISPROEQU");
	ISMASYS=rsSelect.getString("ISMASYS");
	ISBUSSIT=rsSelect.getString("ISBUSSIT");
	ISCASE=rsSelect.getString("ISCASE");
	ISCHANGE=rsSelect.getString("ISCHANGE");
	CHEOPIN=rsSelect.getString("CHEOPIN");
	CHEPER=rsSelect.getString("CHEPER");
	CHEDATE=String.valueOf(rsSelect.getDate("CHEDATE"));
	CHECHI=rsSelect.getString("CHECHI");
	CHECHIDATE=String.valueOf(rsSelect.getDate("CHECHIDATE"));
	DIRGENOPIN=rsSelect.getString("DIRGENOPIN");
	DIRGENDATE=String.valueOf(rsSelect.getDate("DIRGENDATE"));
	OPINION=rsSelect.getString("OPINION");
	OPDATE=String.valueOf(rsSelect.getDate("OPDATE"));
	OTHERCHEOPIN=rsSelect.getString("OTHERCHEOPIN");
	CHEPERID=rsSelect.getString("CHEPERID");
	}

	public boolean doAdd() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd="INSERT INTO GGGL_JYDW_HCQK(ADBULICNO,INSYEAR,ISREGCAP,ISOPDOM,ISJUCOL,ISCRED,ISADCHE,ISOPBUS,ISPROEQU,ISMASYS,ISBUSSIT,ISCASE,ISCHANGE,CHEOPIN,CHEPER,CHEDATE,CHECHI,CHECHIDATE,DIRGENOPIN,DIRGENDATE,OPINION,OPDATE,OTHERCHEOPIN,CHEPERID) VALUES("+ doPreProcess3(ADBULICNO)+","+INSYEAR+","+ doPreProcess3(ISREGCAP)+","+ doPreProcess3(ISOPDOM)+","+ doPreProcess3(ISJUCOL)+","+ doPreProcess3(ISCRED)+","+ doPreProcess3(ISADCHE)+","+ doPreProcess3(ISOPBUS)+","+ doPreProcess3(ISPROEQU)+","+ doPreProcess3(ISMASYS)+","+ doPreProcess3(ISBUSSIT)+","+ doPreProcess3(ISCASE)+","+ doPreProcess3(ISCHANGE)+","+ doPreProcess3(CHEOPIN)+","+ doPreProcess3(CHEPER)+",to_date("+doPreProcess3(CHEDATE)+",'yyyy-mm-dd'),"+ doPreProcess3(CHECHI)+",to_date("+doPreProcess3(CHECHIDATE)+",'yyyy-mm-dd'),"+ doPreProcess3(DIRGENOPIN)+",to_date("+doPreProcess3(DIRGENDATE)+",'yyyy-mm-dd'),"+ doPreProcess3(OPINION)+",to_date("+doPreProcess3(OPDATE)+",'yyyy-mm-dd'),"+doPreProcess3(OTHERCHEOPIN)+","+doPreProcess3(CHEPERID)+")";
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
		String sqlCount="SELECT COUNT(*) FROM GGGL_JYDW_HCQK"+" WHERE INSYEAR="+INSYEAR+" and ADBULICNO='"+doPreProcess(ADBULICNO)+"'";
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
		String sqlModify="UPDATE GGGL_JYDW_HCQK SET ADBULICNO="+ doPreProcess3(ADBULICNO)+",INSYEAR="+INSYEAR+",ISREGCAP="+ doPreProcess3(ISREGCAP)+",ISOPDOM="+ doPreProcess3(ISOPDOM)+",ISJUCOL="+ doPreProcess3(ISJUCOL)+",ISCRED="+ doPreProcess3(ISCRED)+",ISADCHE="+ doPreProcess3(ISADCHE)+",ISOPBUS="+ doPreProcess3(ISOPBUS)+",ISPROEQU="+ doPreProcess3(ISPROEQU)+",ISMASYS="+ doPreProcess3(ISMASYS)+",ISBUSSIT="+ doPreProcess3(ISBUSSIT)+",ISCASE="+ doPreProcess3(ISCASE)+",ISCHANGE="+ doPreProcess3(ISCHANGE)+",CHEOPIN="+ doPreProcess3(CHEOPIN)+",CHEPER="+ doPreProcess3(CHEPER)+",CHEDATE=to_date("+doPreProcess3(CHEDATE)+",'yyyy-mm-dd'),CHECHI="+ doPreProcess3(CHECHI)+",CHECHIDATE=to_date("+doPreProcess3(CHECHIDATE)+",'yyyy-mm-dd'),DIRGENOPIN="+ doPreProcess3(DIRGENOPIN)+",DIRGENDATE=to_date("+doPreProcess3(DIRGENDATE)+",'yyyy-mm-dd'),OPINION="+ doPreProcess3(OPINION)+",OPDATE=to_date("+doPreProcess3(OPDATE)+",'yyyy-mm-dd'),OTHERCHEOPIN="+doPreProcess3(OTHERCHEOPIN)+",CHEPERID="+doPreProcess3(CHEPERID)+" WHERE INSYEAR="+INSYEAR+" and ADBULICNO='"+doPreProcess(ADBULICNO)+"'";
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
		String sqlDelete="DELETE FROM GGGL_JYDW_HCQK"+" WHERE INSYEAR="+INSYEAR+" and ADBULICNO='"+doPreProcess(ADBULICNO)+"'";
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
		String sqlCount="SELECT COUNT(*) FROM GGGL_JYDW_HCQK";
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
		String sqlList="SELECT * FROM GGGL_JYDW_HCQK";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			GGGL_JYDW_HCQK bTable=new GGGL_JYDW_HCQK();
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
		String sqlList="SELECT * FROM GGGL_JYDW_HCQK";
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
			GGGL_JYDW_HCQK bTable=new GGGL_JYDW_HCQK();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlArr="SELECT * FROM GGGL_JYDW_HCQK"+" WHERE INSYEAR="+INSYEAR+" and ADBULICNO='"+doPreProcess(ADBULICNO)+"'";
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
