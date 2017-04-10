package com.macrosoft.icms.qydj;
import java.sql.*;
import java.util.*;
import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.*;
import com.macrosoft.icms.system.*;
public class QYDJ_GZXX_SQ
{
	String LEREP;
	String REGNO;
	String POSITION;
	String ENTTYPE;
	double REGCAP;
	float RECCAP;
	String CONFORM;
	String ABUITEMCO;
	String CBUITEM;
	String BUSSCOPE;
	String OPFROM;
	String OPTO;
	String RECITEM;
	String APPDATE;
	String REGORG;
	String TEL;
	String EMAIL;
	String REMARK;
	String OPENO;
	String PRIPID;
	String ORIENTNAME;
	String ORILEREP;
	String ORIREGCAP;
	String DEPINCHA;
	String ECOCHR;
	String ENTNAME;
	String DOM;
	String POSTALCODE;
	public String getLEREP()
	{
		return doPreProcess(LEREP);
	}

	public void setLEREP( String LEREP)
	{
		this.LEREP=doPreProcess2(convertCode(LEREP));
	}

	public String getREGNO()
	{
		return doPreProcess(REGNO);
	}

	public void setREGNO( String REGNO)
	{
		this.REGNO=doPreProcess2(convertCode(REGNO));
	}

	public String getPOSITION()
	{
		return doPreProcess(POSITION);
	}

	public void setPOSITION( String POSITION)
	{
		this.POSITION=doPreProcess2(convertCode(POSITION));
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

	public float getRECCAP()
	{
		return RECCAP;
	}

	public void setRECCAP( float RECCAP)
	{
		this.RECCAP=RECCAP ;
	}

	public String getCONFORM()
	{
		return doPreProcess(CONFORM);
	}

	public void setCONFORM( String CONFORM)
	{
		this.CONFORM=doPreProcess2(convertCode(CONFORM));
	}

	public String getABUITEMCO()
	{
		return doPreProcess(ABUITEMCO);
	}

	public void setABUITEMCO( String ABUITEMCO)
	{
		this.ABUITEMCO=doPreProcess2(convertCode(ABUITEMCO));
	}

	public String getCBUITEM()
	{
		return doPreProcess(CBUITEM);
	}

	public void setCBUITEM( String CBUITEM)
	{
		this.CBUITEM=doPreProcess2(convertCode(CBUITEM));
	}

	public String getBUSSCOPE()
	{
		return doPreProcess(BUSSCOPE);
	}

	public void setBUSSCOPE( String BUSSCOPE)
	{
		this.BUSSCOPE=doPreProcess2(convertCode(BUSSCOPE));
	}

	public String getOPFROM()
	{
		return doPreProcess(OPFROM);
	}

	public void setOPFROM( String OPFROM)
	{
		this.OPFROM=doPreProcess2(convertCode(OPFROM));
	}

	public String getOPTO()
	{
		return doPreProcess(OPTO);
	}

	public void setOPTO( String OPTO)
	{
		this.OPTO=doPreProcess2(convertCode(OPTO));
	}

	public String getRECITEM()
	{
		return doPreProcess(RECITEM);
	}

	public void setRECITEM( String RECITEM)
	{
		this.RECITEM=doPreProcess2(convertCode(RECITEM));
	}

	public String getAPPDATE()
	{
		return doPreProcess(APPDATE);
	}

	public void setAPPDATE( String APPDATE)
	{
		this.APPDATE=doPreProcess2(convertCode(APPDATE));
	}

	public String getREGORG()
	{
		return doPreProcess(REGORG);
	}

	public void setREGORG( String REGORG)
	{
		this.REGORG=doPreProcess2(convertCode(REGORG));
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

	public String getREMARK()
	{
		return doPreProcess(REMARK);
	}

	public void setREMARK( String REMARK)
	{
		this.REMARK=doPreProcess2(convertCode(REMARK));
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

	public String getORIENTNAME()
	{
		return doPreProcess(ORIENTNAME);
	}

	public void setORIENTNAME( String ORIENTNAME)
	{
		this.ORIENTNAME=doPreProcess2(convertCode(ORIENTNAME));
	}

	public String getORILEREP()
	{
		return doPreProcess(ORILEREP);
	}

	public void setORILEREP( String ORILEREP)
	{
		this.ORILEREP=doPreProcess2(convertCode(ORILEREP));
	}

	public String getORIREGCAP()
	{
		return doPreProcess(ORIREGCAP);
	}

	public void setORIREGCAP( String ORIREGCAP)
	{
		this.ORIREGCAP=doPreProcess2(convertCode(ORIREGCAP));
	}

	public String getDEPINCHA()
	{
		return doPreProcess(DEPINCHA);
	}

	public void setDEPINCHA( String DEPINCHA)
	{
		this.DEPINCHA=doPreProcess2(convertCode(DEPINCHA));
	}

	public String getECOCHR()
	{
		return doPreProcess(ECOCHR);
	}

	public void setECOCHR( String ECOCHR)
	{
		this.ECOCHR=doPreProcess2(convertCode(ECOCHR));
	}

	public String getENTNAME()
	{
		return doPreProcess(ENTNAME);
	}

	public void setENTNAME( String ENTNAME)
	{
		this.ENTNAME=doPreProcess2(convertCode(ENTNAME));
	}

	public String getDOM()
	{
		return doPreProcess(DOM);
	}

	public void setDOM( String DOM)
	{
		this.DOM=doPreProcess2(convertCode(DOM));
	}

	public String getPOSTALCODE()
	{
		return doPreProcess(POSTALCODE);
	}

	public void setPOSTALCODE( String POSTALCODE)
	{
		this.POSTALCODE=doPreProcess2(convertCode(POSTALCODE));
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
		String sqlSelect="SELECT * FROM QYDJ_GZXX_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
		rsSelect=dbc.executeQuery(sqlSelect);
		if(rsSelect.next())
		{
			doSetData( rsSelect );
		}
		dbc.close();
	}

	public void doSetData( ResultSet rsSelect ) throws SQLException
	{
	LEREP=rsSelect.getString("LEREP");
	REGNO=rsSelect.getString("REGNO");
	POSITION=rsSelect.getString("POSITION");
	ENTTYPE=rsSelect.getString("ENTTYPE");
	REGCAP=rsSelect.getDouble("REGCAP");
	RECCAP=rsSelect.getFloat("RECCAP");
	CONFORM=rsSelect.getString("CONFORM");
	ABUITEMCO=rsSelect.getString("ABUITEMCO");
	CBUITEM=rsSelect.getString("CBUITEM");
	BUSSCOPE=rsSelect.getString("BUSSCOPE");
	OPFROM=String.valueOf(rsSelect.getDate("OPFROM"));
	OPTO=String.valueOf(rsSelect.getDate("OPTO"));
	RECITEM=rsSelect.getString("RECITEM");
	APPDATE=String.valueOf(rsSelect.getDate("APPDATE"));
	REGORG=rsSelect.getString("REGORG");
	TEL=rsSelect.getString("TEL");
	EMAIL=rsSelect.getString("EMAIL");
	REMARK=rsSelect.getString("REMARK");
	OPENO=rsSelect.getString("OPENO");
	PRIPID=rsSelect.getString("PRIPID");
	ORIENTNAME=rsSelect.getString("ORIENTNAME");
	ORILEREP=rsSelect.getString("ORILEREP");
	ORIREGCAP=rsSelect.getString("ORIREGCAP");
	DEPINCHA=rsSelect.getString("DEPINCHA");
	ECOCHR=rsSelect.getString("ECOCHR");
	ENTNAME=rsSelect.getString("ENTNAME");
	DOM=rsSelect.getString("DOM");
	POSTALCODE=rsSelect.getString("POSTALCODE");
	}

	public boolean doAdd() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd="INSERT INTO QYDJ_GZXX_SQ(LEREP,REGNO,POSITION,ENTTYPE,REGCAP,RECCAP,CONFORM,ABUITEMCO,CBUITEM,BUSSCOPE,OPFROM,OPTO,RECITEM,APPDATE,REGORG,TEL,EMAIL,REMARK,OPENO,PRIPID,ORIENTNAME,ORILEREP,ORIREGCAP,DEPINCHA,ECOCHR,ENTNAME,DOM,POSTALCODE) VALUES("+ doPreProcess3(LEREP)+","+ doPreProcess3(REGNO)+","+ doPreProcess3(POSITION)+","+ doPreProcess3(ENTTYPE)+","+REGCAP+","+RECCAP+","+ doPreProcess3(CONFORM)+","+ doPreProcess3(ABUITEMCO)+","+ doPreProcess3(CBUITEM)+","+ doPreProcess3(BUSSCOPE)+",to_date("+doPreProcess3(OPFROM)+",'yyyy-mm-dd'),to_date("+doPreProcess3(OPTO)+",'yyyy-mm-dd'),"+ doPreProcess3(RECITEM)+",to_date("+doPreProcess3(APPDATE)+",'yyyy-mm-dd'),"+ doPreProcess3(REGORG)+","+ doPreProcess3(TEL)+","+ doPreProcess3(EMAIL)+","+ doPreProcess3(REMARK)+","+ doPreProcess3(OPENO)+","+ doPreProcess3(PRIPID)+","+ doPreProcess3(ORIENTNAME)+","+ doPreProcess3(ORILEREP)+","+ doPreProcess3(ORIREGCAP)+","+ doPreProcess3(DEPINCHA)+","+ doPreProcess3(ECOCHR)+","+ doPreProcess3(ENTNAME)+","+ doPreProcess3(DOM)+","+ doPreProcess3(POSTALCODE)+")";
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
		String sqlCount="SELECT COUNT(*) FROM QYDJ_GZXX_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlModify="UPDATE QYDJ_GZXX_SQ SET LEREP="+ doPreProcess3(LEREP)+",REGNO="+ doPreProcess3(REGNO)+",POSITION="+ doPreProcess3(POSITION)+",ENTTYPE="+ doPreProcess3(ENTTYPE)+",REGCAP="+REGCAP+",RECCAP="+RECCAP+",CONFORM="+ doPreProcess3(CONFORM)+",ABUITEMCO="+ doPreProcess3(ABUITEMCO)+",CBUITEM="+ doPreProcess3(CBUITEM)+",BUSSCOPE="+ doPreProcess3(BUSSCOPE)+",OPFROM=to_date("+doPreProcess3(OPFROM)+",'yyyy-mm-dd'),OPTO=to_date("+doPreProcess3(OPTO)+",'yyyy-mm-dd'),RECITEM="+ doPreProcess3(RECITEM)+",APPDATE=to_date("+doPreProcess3(APPDATE)+",'yyyy-mm-dd'),REGORG="+ doPreProcess3(REGORG)+",TEL="+ doPreProcess3(TEL)+",EMAIL="+ doPreProcess3(EMAIL)+",REMARK="+ doPreProcess3(REMARK)+",OPENO="+ doPreProcess3(OPENO)+",PRIPID="+ doPreProcess3(PRIPID)+",ORIENTNAME="+ doPreProcess3(ORIENTNAME)+",ORILEREP="+ doPreProcess3(ORILEREP)+",ORIREGCAP="+ doPreProcess3(ORIREGCAP)+",DEPINCHA="+ doPreProcess3(DEPINCHA)+",ECOCHR="+ doPreProcess3(ECOCHR)+",ENTNAME="+ doPreProcess3(ENTNAME)+",DOM="+ doPreProcess3(DOM)+",POSTALCODE="+ doPreProcess3(POSTALCODE)+""+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlDelete="DELETE FROM QYDJ_GZXX_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlCount="SELECT COUNT(*) FROM QYDJ_GZXX_SQ";
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
		String sqlList="SELECT * FROM QYDJ_GZXX_SQ";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			QYDJ_GZXX_SQ bTable=new QYDJ_GZXX_SQ();
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
		String sqlList="SELECT * FROM QYDJ_GZXX_SQ";
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
			QYDJ_GZXX_SQ bTable=new QYDJ_GZXX_SQ();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlArr="SELECT * FROM QYDJ_GZXX_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
