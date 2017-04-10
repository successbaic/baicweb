package com.macrosoft.icms.gggl;
import java.sql.*;
import java.util.*;
import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.*;
import com.macrosoft.icms.system.*;
public class HWGG_JBXX_SQ
{
	String OPENO;
	String ADNAME;
	int ADQUAN;
	String ADSPF;
	String ADISSSPOT;
	String ADISSFROM;
	String ADISSTO;
	String ADFORM;
	String ADREGCNO;
	String VALFROM;
	String VALTO;
	String ISSAUTH;
	String ISSCERPER;
	String ISSCARDDATE;
	String DRAWCERPER;
	String DRAWDATE;
	String TEL;
	String ORIREGREVST;
	String ADCLASS;
	String REGORG;
	String REMARK;
	String ADCONTENT;
	String ADSTUFF;
	String STATUS;
	String LOGINID;
	String OPETYPE;
	String APPDATE;
	public String getOPENO()
	{
		return doPreProcess(OPENO);
	}

	public void setOPENO( String OPENO)
	{
		this.OPENO=doPreProcess2(convertCode(OPENO));
	}

	public String getADNAME()
	{
		return doPreProcess(ADNAME);
	}

	public void setADNAME( String ADNAME)
	{
		this.ADNAME=doPreProcess2(convertCode(ADNAME));
	}

	public int getADQUAN()
	{
		return ADQUAN;
	}

	public void setADQUAN( int ADQUAN)
	{
		this.ADQUAN=ADQUAN ;
	}

	public String getADSPF()
	{
		return doPreProcess(ADSPF);
	}

	public void setADSPF( String ADSPF)
	{
		this.ADSPF=doPreProcess2(convertCode(ADSPF));
	}

	public String getADISSSPOT()
	{
		return doPreProcess(ADISSSPOT);
	}

	public void setADISSSPOT( String ADISSSPOT)
	{
		this.ADISSSPOT=doPreProcess2(convertCode(ADISSSPOT));
	}

	public String getADISSFROM()
	{
		return doPreProcess(ADISSFROM);
	}

	public void setADISSFROM( String ADISSFROM)
	{
		this.ADISSFROM=doPreProcess2(convertCode(ADISSFROM));
	}

	public String getADISSTO()
	{
		return doPreProcess(ADISSTO);
	}

	public void setADISSTO( String ADISSTO)
	{
		this.ADISSTO=doPreProcess2(convertCode(ADISSTO));
	}

	public String getADFORM()
	{
		return doPreProcess(ADFORM);
	}

	public void setADFORM( String ADFORM)
	{
		this.ADFORM=doPreProcess2(convertCode(ADFORM));
	}

	public String getADREGCNO()
	{
		return doPreProcess(ADREGCNO);
	}

	public void setADREGCNO( String ADREGCNO)
	{
		this.ADREGCNO=doPreProcess2(convertCode(ADREGCNO));
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

	public String getISSAUTH()
	{
		return doPreProcess(ISSAUTH);
	}

	public void setISSAUTH( String ISSAUTH)
	{
		this.ISSAUTH=doPreProcess2(convertCode(ISSAUTH));
	}

	public String getISSCERPER()
	{
		return doPreProcess(ISSCERPER);
	}

	public void setISSCERPER( String ISSCERPER)
	{
		this.ISSCERPER=doPreProcess2(convertCode(ISSCERPER));
	}

	public String getISSCARDDATE()
	{
		return doPreProcess(ISSCARDDATE);
	}

	public void setISSCARDDATE( String ISSCARDDATE)
	{
		this.ISSCARDDATE=doPreProcess2(convertCode(ISSCARDDATE));
	}

	public String getDRAWCERPER()
	{
		return doPreProcess(DRAWCERPER);
	}

	public void setDRAWCERPER( String DRAWCERPER)
	{
		this.DRAWCERPER=doPreProcess2(convertCode(DRAWCERPER));
	}

	public String getDRAWDATE()
	{
		return doPreProcess(DRAWDATE);
	}

	public void setDRAWDATE( String DRAWDATE)
	{
		this.DRAWDATE=doPreProcess2(convertCode(DRAWDATE));
	}

	public String getTEL()
	{
		return doPreProcess(TEL);
	}

	public void setTEL( String TEL)
	{
		this.TEL=doPreProcess2(convertCode(TEL));
	}

	public String getORIREGREVST()
	{
		return doPreProcess(ORIREGREVST);
	}

	public void setORIREGREVST( String ORIREGREVST)
	{
		this.ORIREGREVST=doPreProcess2(convertCode(ORIREGREVST));
	}

	public String getADCLASS()
	{
		return doPreProcess(ADCLASS);
	}

	public void setADCLASS( String ADCLASS)
	{
		this.ADCLASS=doPreProcess2(convertCode(ADCLASS));
	}

	public String getREGORG()
	{
		return doPreProcess(REGORG);
	}

	public void setREGORG( String REGORG)
	{
		this.REGORG=doPreProcess2(convertCode(REGORG));
	}

	public String getREMARK()
	{
		return doPreProcess(REMARK);
	}

	public void setREMARK( String REMARK)
	{
		this.REMARK=doPreProcess2(convertCode(REMARK));
	}

	public String getADCONTENT()
	{
		return doPreProcess(ADCONTENT);
	}

	public void setADCONTENT( String ADCONTENT)
	{
		this.ADCONTENT=doPreProcess2(convertCode(ADCONTENT));
	}

	public String getADSTUFF()
	{
		return doPreProcess(ADSTUFF);
	}

	public void setADSTUFF( String ADSTUFF)
	{
		this.ADSTUFF=doPreProcess2(convertCode(ADSTUFF));
	}

	public String getSTATUS()
	{
		return doPreProcess(STATUS);
	}

	public void setSTATUS( String STATUS)
	{
		this.STATUS=doPreProcess2(convertCode(STATUS));
	}

	public String getLOGINID()
	{
		return doPreProcess(LOGINID);
	}

	public void setLOGINID( String LOGINID)
	{
		this.LOGINID=doPreProcess2(convertCode(LOGINID));
	}

	public String getOPETYPE()
	{
		return doPreProcess(OPETYPE);
	}

	public void setOPETYPE( String OPETYPE)
	{
		this.OPETYPE=doPreProcess2(convertCode(OPETYPE));
	}

	public String getAPPDATE()
	{
		return doPreProcess(APPDATE);
	}

	public void setAPPDATE( String APPDATE)
	{
		this.APPDATE=doPreProcess2(convertCode(APPDATE));
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
		String sqlSelect="SELECT * FROM HWGG_JBXX_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
	ADNAME=rsSelect.getString("ADNAME");
	ADQUAN=rsSelect.getInt("ADQUAN");
	ADSPF=rsSelect.getString("ADSPF");
	ADISSSPOT=rsSelect.getString("ADISSSPOT");
	ADISSFROM=String.valueOf(rsSelect.getDate("ADISSFROM"));
	ADISSTO=String.valueOf(rsSelect.getDate("ADISSTO"));
	ADFORM=rsSelect.getString("ADFORM");
	ADREGCNO=rsSelect.getString("ADREGCNO");
	VALFROM=String.valueOf(rsSelect.getDate("VALFROM"));
	VALTO=String.valueOf(rsSelect.getDate("VALTO"));
	ISSAUTH=rsSelect.getString("ISSAUTH");
	ISSCERPER=rsSelect.getString("ISSCERPER");
	ISSCARDDATE=String.valueOf(rsSelect.getDate("ISSCARDDATE"));
	DRAWCERPER=rsSelect.getString("DRAWCERPER");
	DRAWDATE=String.valueOf(rsSelect.getDate("DRAWDATE"));
	TEL=rsSelect.getString("TEL");
	ORIREGREVST=rsSelect.getString("ORIREGREVST");
	ADCLASS=rsSelect.getString("ADCLASS");
	REGORG=rsSelect.getString("REGORG");
	REMARK=rsSelect.getString("REMARK");
	ADCONTENT=rsSelect.getString("ADCONTENT");
	ADSTUFF=rsSelect.getString("ADSTUFF");
	STATUS=rsSelect.getString("STATUS");
	LOGINID=rsSelect.getString("LOGINID");
	OPETYPE=rsSelect.getString("OPETYPE");
	APPDATE=String.valueOf(rsSelect.getDate("APPDATE"));
	}

	public boolean doAdd() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd="INSERT INTO HWGG_JBXX_SQ(OPENO,ADNAME,ADQUAN,ADSPF,ADISSSPOT,ADISSFROM,ADISSTO,ADFORM,ADREGCNO,VALFROM,VALTO,ISSAUTH,ISSCERPER,ISSCARDDATE,DRAWCERPER,DRAWDATE,TEL,ORIREGREVST,ADCLASS,REGORG,REMARK,ADCONTENT,ADSTUFF,STATUS,LOGINID,OPETYPE,APPDATE) VALUES("+ doPreProcess3(OPENO)+","+ doPreProcess3(ADNAME)+","+ADQUAN+","+ doPreProcess3(ADSPF)+","+ doPreProcess3(ADISSSPOT)+",to_date("+doPreProcess3(ADISSFROM)+",'yyyy-mm-dd'),to_date("+doPreProcess3(ADISSTO)+",'yyyy-mm-dd'),"+ doPreProcess3(ADFORM)+","+ doPreProcess3(ADREGCNO)+",to_date("+doPreProcess3(VALFROM)+",'yyyy-mm-dd'),to_date("+doPreProcess3(VALTO)+",'yyyy-mm-dd'),"+ doPreProcess3(ISSAUTH)+","+ doPreProcess3(ISSCERPER)+",to_date("+doPreProcess3(ISSCARDDATE)+",'yyyy-mm-dd'),"+ doPreProcess3(DRAWCERPER)+",to_date("+doPreProcess3(DRAWDATE)+",'yyyy-mm-dd'),"+ doPreProcess3(TEL)+","+ doPreProcess3(ORIREGREVST)+","+doPreProcess3(ADCLASS)+","+ doPreProcess3(REGORG)+","+ doPreProcess3(REMARK)+","+ doPreProcess3(ADCONTENT)+","+ doPreProcess3(ADSTUFF)+","+ doPreProcess3(STATUS)+","+ doPreProcess3(LOGINID)+","+ doPreProcess3(OPETYPE)+",to_date("+doPreProcess3(APPDATE)+",'yyyy-mm-dd'))";
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
		String sqlCount="SELECT COUNT(*) FROM HWGG_JBXX_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlModify="UPDATE HWGG_JBXX_SQ SET OPENO="+ doPreProcess3(OPENO)+",ADNAME="+ doPreProcess3(ADNAME)+",ADQUAN="+ADQUAN+",ADSPF="+ doPreProcess3(ADSPF)+",ADISSSPOT="+ doPreProcess3(ADISSSPOT)+",ADISSFROM=to_date("+doPreProcess3(ADISSFROM)+",'yyyy-mm-dd'),ADISSTO=to_date("+doPreProcess3(ADISSTO)+",'yyyy-mm-dd'),ADFORM="+ doPreProcess3(ADFORM)+",ADREGCNO="+ doPreProcess3(ADREGCNO)+",VALFROM=to_date("+doPreProcess3(VALFROM)+",'yyyy-mm-dd'),VALTO=to_date("+doPreProcess3(VALTO)+",'yyyy-mm-dd'),ISSAUTH="+ doPreProcess3(ISSAUTH)+",ISSCERPER="+ doPreProcess3(ISSCERPER)+",ISSCARDDATE=to_date("+doPreProcess3(ISSCARDDATE)+",'yyyy-mm-dd'),DRAWCERPER="+ doPreProcess3(DRAWCERPER)+",DRAWDATE=to_date("+doPreProcess3(DRAWDATE)+",'yyyy-mm-dd'),TEL="+ doPreProcess3(TEL)+",ORIREGREVST="+ doPreProcess3(ORIREGREVST)+",ADCLASS="+doPreProcess3(ADCLASS)+",REGORG="+ doPreProcess3(REGORG)+",REMARK="+ doPreProcess3(REMARK)+",ADCONTENT="+ doPreProcess3(ADCONTENT)+",ADSTUFF="+ doPreProcess3(ADSTUFF)+",STATUS="+ doPreProcess3(STATUS)+",LOGINID="+ doPreProcess3(LOGINID)+",OPETYPE="+ doPreProcess3(OPETYPE)+",APPDATE=to_date("+doPreProcess3(APPDATE)+",'yyyy-mm-dd')"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlDelete="DELETE FROM HWGG_JBXX_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlCount="SELECT COUNT(*) FROM HWGG_JBXX_SQ";
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
		String sqlList="SELECT * FROM HWGG_JBXX_SQ";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			HWGG_JBXX_SQ bTable=new HWGG_JBXX_SQ();
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
		String sqlList="SELECT * FROM HWGG_JBXX_SQ";
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
			HWGG_JBXX_SQ bTable=new HWGG_JBXX_SQ();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlArr="SELECT * FROM HWGG_JBXX_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
