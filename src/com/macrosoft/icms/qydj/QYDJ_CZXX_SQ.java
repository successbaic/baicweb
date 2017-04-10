package com.macrosoft.icms.qydj;
import java.sql.*;
import java.util.*;
import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.*;
import com.macrosoft.icms.system.*;
public class QYDJ_CZXX_SQ
{
	String RECID;
	String OPENO;
	String PRIPID;
	String INVID;
	String INV;
	String INVTYPE;
	String CERTYPE;
	String CERNO;
	String BLICTYPE;
	String BLICNO;
	float SUBCONAM;
	String CONFORM;
	String CONDATE;
	float CONPROP;
	float ACCONAM;
	String ACCONFORM;
	String ACCONDATE;
	String SEX;
	String NATDATE;
	String LITEDEG;
	String NATION;
	String POLSTAND;
	String DOM;
	String POSTALCODE;
	String TEL;
	String OCCST;
	String ONDUTYSTY;
	String EVALSTY;
	String MEMTYPE;
	String COUNTRY;
	String FORSIGN;
	String CURRENCY;
	String REMARK;
	String BALDELTERM;
	float SUBCONPROP;
	String INVPERAREA;
	String EXEAFFSIGN;
	
	public String getEXEAFFSIGN()
	{
		return doPreProcess(EXEAFFSIGN);
	}

	public void setEXEAFFSIGN( String EXEAFFSIGN)
	{
		this.EXEAFFSIGN=doPreProcess(convertCode(EXEAFFSIGN)) ;
	}
	
	public String getINVPERAREA()
	{
		return doPreProcess(INVPERAREA);
	}

	public void setINVPERAREA( String INVPERAREA)
	{
		this.INVPERAREA=doPreProcess(convertCode(INVPERAREA)) ;
	}
	public void setSUBCONPROP( float SUBCONPROP)
	{
		this.SUBCONPROP=SUBCONPROP ;
	}

	public float getSUBCONPROP()
	{
		return SUBCONPROP;
	}
	
	public String getRECID()
	{
		return doPreProcess(RECID);
	}

	public void setRECID( String RECID)
	{
		this.RECID=doPreProcess(RECID) ;
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

	public String getINVID()
	{
		return doPreProcess(INVID);
	}

	public void setINVID( String INVID)
	{
		this.INVID=doPreProcess2(convertCode(INVID));
	}

	public String getINV()
	{
		return doPreProcess(INV);
	}

	public void setINV( String INV)
	{
		this.INV=doPreProcess2(convertCode(INV));
	}

	public String getINVTYPE()
	{
		return doPreProcess(INVTYPE);
	}

	public void setINVTYPE( String INVTYPE)
	{
		this.INVTYPE=doPreProcess2(convertCode(INVTYPE));
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

	public String getBLICTYPE()
	{
		return doPreProcess(BLICTYPE);
	}

	public void setBLICTYPE( String BLICTYPE)
	{
		this.BLICTYPE=doPreProcess2(convertCode(BLICTYPE));
	}

	public String getBLICNO()
	{
		return doPreProcess(BLICNO);
	}

	public void setBLICNO( String BLICNO)
	{
		this.BLICNO=doPreProcess2(convertCode(BLICNO));
	}

	public float getSUBCONAM()
	{
		return SUBCONAM;
	}

	public void setSUBCONAM( float SUBCONAM)
	{
		this.SUBCONAM=SUBCONAM ;
	}

	public String getCONFORM()
	{
		return doPreProcess(CONFORM);
	}

	public void setCONFORM( String CONFORM)
	{
		this.CONFORM=doPreProcess2(convertCode(CONFORM));
	}

	public String getCONDATE()
	{
		return doPreProcess(CONDATE);
	}

	public void setCONDATE( String CONDATE)
	{
		this.CONDATE=doPreProcess2(convertCode(CONDATE));
	}

	public float getCONPROP()
	{
		return CONPROP;
	}

	public void setCONPROP( float CONPROP)
	{
		this.CONPROP=CONPROP ;
	}

	public float getACCONAM()
	{
		return ACCONAM;
	}

	public void setACCONAM( float ACCONAM)
	{
		this.ACCONAM=ACCONAM ;
	}

	public String getACCONFORM()
	{
		return doPreProcess(ACCONFORM);
	}

	public void setACCONFORM( String ACCONFORM)
	{
		this.ACCONFORM=doPreProcess2(convertCode(ACCONFORM));
	}

	public String getACCONDATE()
	{
		return doPreProcess(ACCONDATE);
	}

	public void setACCONDATE( String ACCONDATE)
	{
		this.ACCONDATE=doPreProcess2(convertCode(ACCONDATE));
	}

	public String getSEX()
	{
		return doPreProcess(SEX);
	}

	public void setSEX( String SEX)
	{
		this.SEX=doPreProcess2(convertCode(SEX));
	}

	public String getNATDATE()
	{
		return doPreProcess(NATDATE);
	}

	public void setNATDATE( String NATDATE)
	{
		this.NATDATE=doPreProcess2(convertCode(NATDATE));
	}

	public String getLITEDEG()
	{
		return doPreProcess(LITEDEG);
	}

	public void setLITEDEG( String LITEDEG)
	{
		this.LITEDEG=doPreProcess2(convertCode(LITEDEG));
	}

	public String getNATION()
	{
		return doPreProcess(NATION);
	}

	public void setNATION( String NATION)
	{
		this.NATION=doPreProcess2(convertCode(NATION));
	}

	public String getPOLSTAND()
	{
		return doPreProcess(POLSTAND);
	}

	public void setPOLSTAND( String POLSTAND)
	{
		this.POLSTAND=doPreProcess2(convertCode(POLSTAND));
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

	public String getTEL()
	{
		return doPreProcess(TEL);
	}

	public void setTEL( String TEL)
	{
		this.TEL=doPreProcess2(convertCode(TEL));
	}

	public String getOCCST()
	{
		return doPreProcess(OCCST);
	}

	public void setOCCST( String OCCST)
	{
		this.OCCST=doPreProcess2(convertCode(OCCST));
	}

	public String getONDUTYSTY()
	{
		return doPreProcess(ONDUTYSTY);
	}

	public void setONDUTYSTY( String ONDUTYSTY)
	{
		this.ONDUTYSTY=doPreProcess2(convertCode(ONDUTYSTY));
	}

	public String getEVALSTY()
	{
		return doPreProcess(EVALSTY);
	}

	public void setEVALSTY( String EVALSTY)
	{
		this.EVALSTY=doPreProcess2(convertCode(EVALSTY));
	}

	public String getMEMTYPE()
	{
		return doPreProcess(MEMTYPE);
	}

	public void setMEMTYPE( String MEMTYPE)
	{
		this.MEMTYPE=doPreProcess2(convertCode(MEMTYPE));
	}

	public String getCOUNTRY()
	{
		return doPreProcess(COUNTRY);
	}

	public void setCOUNTRY( String COUNTRY)
	{
		this.COUNTRY=doPreProcess2(convertCode(COUNTRY));
	}

	public String getFORSIGN()
	{
		return doPreProcess(FORSIGN);
	}

	public void setFORSIGN( String FORSIGN)
	{
		this.FORSIGN=doPreProcess2(convertCode(FORSIGN));
	}

	public String getCURRENCY()
	{
		return doPreProcess(CURRENCY);
	}

	public void setCURRENCY( String CURRENCY)
	{
		this.CURRENCY=doPreProcess2(convertCode(CURRENCY));
	}

	public String getREMARK()
	{
		return doPreProcess(REMARK);
	}

	public void setREMARK( String REMARK)
	{
		this.REMARK=doPreProcess2(convertCode(REMARK));
	}
	
	public String getBALDELTERM()
	{
		return doPreProcess(BALDELTERM);
	}

	public void setBALDELTERM( String BALDELTERM)
	{
		this.BALDELTERM=doPreProcess2(convertCode(BALDELTERM));
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
		String sqlSelect="SELECT * FROM QYDJ_CZXX_SQ"+" WHERE RECID="+doPreProcess3(RECID)+" and OPENO='"+doPreProcess(OPENO)+"'";
		rsSelect=dbc.executeQuery(sqlSelect);
		if(rsSelect.next())
		{
			doSetData( rsSelect );
		}
		dbc.close();
	}
	public void doSelecByOpeno() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsSelect;
		String sqlSelect="SELECT * FROM QYDJ_CZXX_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
		rsSelect=dbc.executeQuery(sqlSelect);
		if(rsSelect.next())
		{
			doSetData( rsSelect );
		}
		dbc.close();
	}

	public void doSetData( ResultSet rsSelect ) throws SQLException
	{
	RECID=rsSelect.getString("RECID");
	OPENO=rsSelect.getString("OPENO");
	PRIPID=rsSelect.getString("PRIPID");
	INVID=rsSelect.getString("INVID");
	INV=rsSelect.getString("INV");
	INVTYPE=rsSelect.getString("INVTYPE");
	CERTYPE=rsSelect.getString("CERTYPE");
	CERNO=rsSelect.getString("CERNO");
	BLICTYPE=rsSelect.getString("BLICTYPE");
	BLICNO=rsSelect.getString("BLICNO");
	SUBCONAM=rsSelect.getFloat("SUBCONAM");
	CONFORM=rsSelect.getString("CONFORM");
	CONDATE=String.valueOf(rsSelect.getDate("CONDATE"));
	CONPROP=rsSelect.getFloat("CONPROP");
	ACCONAM=rsSelect.getFloat("ACCONAM");
	ACCONFORM=rsSelect.getString("ACCONFORM");
	ACCONDATE=String.valueOf(rsSelect.getDate("ACCONDATE"));
	SEX=rsSelect.getString("SEX");
	NATDATE=String.valueOf(rsSelect.getDate("NATDATE"));
	LITEDEG=rsSelect.getString("LITEDEG");
	NATION=rsSelect.getString("NATION");
	POLSTAND=rsSelect.getString("POLSTAND");
	DOM=rsSelect.getString("DOM");
	POSTALCODE=rsSelect.getString("POSTALCODE");
	TEL=rsSelect.getString("TEL");
	OCCST=rsSelect.getString("OCCST");
	ONDUTYSTY=rsSelect.getString("ONDUTYSTY");
	EVALSTY=rsSelect.getString("EVALSTY");
	MEMTYPE=rsSelect.getString("MEMTYPE");
	COUNTRY=rsSelect.getString("COUNTRY");
	FORSIGN=rsSelect.getString("FORSIGN");
	CURRENCY=rsSelect.getString("CURRENCY");
	REMARK=rsSelect.getString("REMARK");
	BALDELTERM=String.valueOf(rsSelect.getDate("BALDELTERM"));
	SUBCONPROP=rsSelect.getFloat("SUBCONPROP");
	INVPERAREA=rsSelect.getString("INVPERAREA");
	EXEAFFSIGN=rsSelect.getString("EXEAFFSIGN");
	}

	public boolean doAdd() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd="INSERT INTO QYDJ_CZXX_SQ(INVPERAREA,SUBCONPROP,RECID,OPENO,PRIPID,INVID,INV,INVTYPE,CERTYPE,CERNO,BLICTYPE,BLICNO,SUBCONAM,CONFORM,CONDATE,CONPROP,ACCONAM,ACCONFORM,ACCONDATE,SEX,NATDATE,LITEDEG,NATION,POLSTAND,DOM,POSTALCODE,TEL,OCCST,ONDUTYSTY,EVALSTY,MEMTYPE,COUNTRY,FORSIGN,CURRENCY,REMARK,BALDELTERM,EXEAFFSIGN) VALUES("+doPreProcess3(INVPERAREA)+","+SUBCONPROP+","+doPreProcess3(RECID)+","+ doPreProcess3(OPENO)+","+ doPreProcess3(PRIPID)+","+ doPreProcess3(INVID)+","+ doPreProcess3(INV)+","+ doPreProcess3(INVTYPE)+","+ doPreProcess3(CERTYPE)+","+ doPreProcess3(CERNO)+","+ doPreProcess3(BLICTYPE)+","+ doPreProcess3(BLICNO)+","+SUBCONAM+","+ doPreProcess3(CONFORM)+",to_date("+doPreProcess3(CONDATE)+",'yyyy-mm-dd'),"+CONPROP+","+ACCONAM+","+ doPreProcess3(ACCONFORM)+",to_date("+doPreProcess3(ACCONDATE)+",'yyyy-mm-dd'),"+ doPreProcess3(SEX)+",to_date("+doPreProcess3(NATDATE)+",'yyyy-mm-dd'),"+ doPreProcess3(LITEDEG)+","+ doPreProcess3(NATION)+","+ doPreProcess3(POLSTAND)+","+ doPreProcess3(DOM)+","+ doPreProcess3(POSTALCODE)+","+ doPreProcess3(TEL)+","+ doPreProcess3(OCCST)+","+ doPreProcess3(ONDUTYSTY)+","+ doPreProcess3(EVALSTY)+","+ doPreProcess3(MEMTYPE)+","+ doPreProcess3(COUNTRY)+","+ doPreProcess3(FORSIGN)+","+ doPreProcess3(CURRENCY)+","+ doPreProcess3(REMARK)+",to_date("+doPreProcess3(BALDELTERM)+",'yyyy-mm-dd'),"+doPreProcess3(EXEAFFSIGN)+")";
		{							
			nRowCount=dbc.executeUpdate( sqlAdd );
			dbc.close();
			if (nRowCount>0)	//����ɹ�
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
		String sqlCount="SELECT COUNT(*) FROM QYDJ_CZXX_SQ"+" WHERE RECID="+doPreProcess3(RECID)+" and OPENO='"+doPreProcess(OPENO)+"'";
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
	public boolean doCountByOpeno() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlCount="SELECT COUNT(*) FROM QYDJ_CZXX_SQ"+" WHERE  OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlModify="UPDATE QYDJ_CZXX_SQ SET EXEAFFSIGN="+doPreProcess3(EXEAFFSIGN)+",INVPERAREA="+doPreProcess3(INVPERAREA)+",SUBCONPROP="+SUBCONPROP+",RECID="+doPreProcess3(RECID)+",OPENO="+ doPreProcess3(OPENO)+",PRIPID="+ doPreProcess3(PRIPID)+",INVID="+ doPreProcess3(INVID)+",INV="+ doPreProcess3(INV)+",INVTYPE="+ doPreProcess3(INVTYPE)+",CERTYPE="+ doPreProcess3(CERTYPE)+",CERNO="+ doPreProcess3(CERNO)+",BLICTYPE="+ doPreProcess3(BLICTYPE)+",BLICNO="+ doPreProcess3(BLICNO)+",SUBCONAM="+SUBCONAM+",CONFORM="+ doPreProcess3(CONFORM)+",CONDATE=to_date("+doPreProcess3(CONDATE)+",'yyyy-mm-dd'),CONPROP="+CONPROP+",ACCONAM="+ACCONAM+",ACCONFORM="+ doPreProcess3(ACCONFORM)+",ACCONDATE=to_date("+doPreProcess3(ACCONDATE)+",'yyyy-mm-dd'),SEX="+ doPreProcess3(SEX)+",NATDATE=to_date("+doPreProcess3(NATDATE)+",'yyyy-mm-dd'),LITEDEG="+ doPreProcess3(LITEDEG)+",NATION="+ doPreProcess3(NATION)+",POLSTAND="+ doPreProcess3(POLSTAND)+",DOM="+ doPreProcess3(DOM)+",POSTALCODE="+ doPreProcess3(POSTALCODE)+",TEL="+ doPreProcess3(TEL)+",OCCST="+ doPreProcess3(OCCST)+",ONDUTYSTY="+ doPreProcess3(ONDUTYSTY)+",EVALSTY="+ doPreProcess3(EVALSTY)+",MEMTYPE="+ doPreProcess3(MEMTYPE)+",COUNTRY="+ doPreProcess3(COUNTRY)+",FORSIGN="+ doPreProcess3(FORSIGN)+",CURRENCY="+ doPreProcess3(CURRENCY)+",REMARK="+ doPreProcess3(REMARK)+",BALDELTERM=to_date("+doPreProcess3(BALDELTERM)+",'yyyy-mm-dd')"+" "+" WHERE RECID="+doPreProcess3(RECID)+" and OPENO='"+doPreProcess(OPENO)+"'";
		int nRowCount=dbc.executeUpdate( sqlModify );
		dbc.close();
		if (nRowCount>0)	//�޸ĳɹ�
		{
			return true;
		}
		else
			return false;
	}
	public boolean doModifyByOpeno() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlModify="UPDATE QYDJ_CZXX_SQ SET  EXEAFFSIGN="+doPreProcess3(EXEAFFSIGN)+",INVPERAREA="+doPreProcess3(INVPERAREA)+",SUBCONPROP="+SUBCONPROP+",RECID="+doPreProcess3(RECID)+",OPENO="+ doPreProcess3(OPENO)+",PRIPID="+ doPreProcess3(PRIPID)+",INVID="+ doPreProcess3(INVID)+",INV="+ doPreProcess3(INV)+",INVTYPE="+ doPreProcess3(INVTYPE)+",CERTYPE="+ doPreProcess3(CERTYPE)+",CERNO="+ doPreProcess3(CERNO)+",BLICTYPE="+ doPreProcess3(BLICTYPE)+",BLICNO="+ doPreProcess3(BLICNO)+",SUBCONAM="+SUBCONAM+",CONFORM="+ doPreProcess3(CONFORM)+",CONDATE=to_date("+doPreProcess3(CONDATE)+",'yyyy-mm-dd'),CONPROP="+CONPROP+",ACCONAM="+ACCONAM+",ACCONFORM="+ doPreProcess3(ACCONFORM)+",ACCONDATE=to_date("+doPreProcess3(ACCONDATE)+",'yyyy-mm-dd'),SEX="+ doPreProcess3(SEX)+",NATDATE=to_date("+doPreProcess3(NATDATE)+",'yyyy-mm-dd'),LITEDEG="+ doPreProcess3(LITEDEG)+",NATION="+ doPreProcess3(NATION)+",POLSTAND="+ doPreProcess3(POLSTAND)+",DOM="+ doPreProcess3(DOM)+",POSTALCODE="+ doPreProcess3(POSTALCODE)+",TEL="+ doPreProcess3(TEL)+",OCCST="+ doPreProcess3(OCCST)+",ONDUTYSTY="+ doPreProcess3(ONDUTYSTY)+",EVALSTY="+ doPreProcess3(EVALSTY)+",MEMTYPE="+ doPreProcess3(MEMTYPE)+",COUNTRY="+ doPreProcess3(COUNTRY)+",FORSIGN="+ doPreProcess3(FORSIGN)+",CURRENCY="+ doPreProcess3(CURRENCY)+",REMARK="+ doPreProcess3(REMARK)+",BALDELTERM=to_date("+doPreProcess3(BALDELTERM)+",'yyyy-mm-dd')"+" "+" WHERE  OPENO='"+doPreProcess(OPENO)+"'";
		int nRowCount=dbc.executeUpdate( sqlModify );
		dbc.close();
		if (nRowCount>0)	//�޸ĳɹ�
		{
			return true;
		}
		else
			return false;
	}

	public boolean doDelete() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlDelete="DELETE FROM QYDJ_CZXX_SQ"+" WHERE RECID="+doPreProcess3(RECID)+" and OPENO='"+doPreProcess(OPENO)+"'";
		int nRowCount=dbc.executeUpdate( sqlDelete );
		dbc.close();
		if (nRowCount>0)
		{
			return true;
		}
		else
			return false;
	}
	public boolean doDeleteByOpeno() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlDelete="DELETE FROM QYDJ_CZXX_SQ "+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlCount="SELECT COUNT(*) FROM QYDJ_CZXX_SQ";
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
		String sqlList="SELECT * FROM QYDJ_CZXX_SQ";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			QYDJ_CZXX_SQ bTable=new QYDJ_CZXX_SQ();
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
		String sqlList="SELECT * FROM QYDJ_CZXX_SQ";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		sqlList+=" AND ROWNUM<="+(startRow+PageSize);//start+pagesize 
		ResultSet rsList=dbc.executeQuery( sqlList);
		int	nDispRows=0;
		do
		{
			nDispRows++;
			if (nDispRows>startRow)	break;
		}
		while (rsList.next());
		while(rsList.next()) {
			QYDJ_CZXX_SQ bTable=new QYDJ_CZXX_SQ();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlArr="SELECT * FROM QYDJ_CZXX_SQ"+" WHERE RECID="+doPreProcess3(RECID)+" and OPENO='"+doPreProcess(OPENO)+"'";
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
	public ArrayList getDataByOpeno() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlArr="SELECT * FROM QYDJ_CZXX_SQ"+" WHERE  OPENO='"+doPreProcess(OPENO)+"'";
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
   
	public boolean doAddFromNw(String OPENO,String MCXH) throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd="INSERT INTO QYDJ_CZXX_SQ (recid, openo,SUBCONPROP, invid, inv, invtype, certype, cerno, country,subconam, conprop, blictype, blicno ) SELECT recid,"
			+OPENO+",CONPROP, invid, inv, invtype, certype, cerno, country,subconam, conprop, blictype, blicno FROM MCGL_TZRXX WHERE OPENO='"+ MCXH+"'";
		{							
			nRowCount=dbc.executeUpdate( sqlAdd );
			dbc.close();
			if (nRowCount>=0)	//����ɹ�
				return true;
			else
				return false;
		}
	}
}
