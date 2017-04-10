package com.macrosoft.icms.qydj;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Iterator;

import com.macrosoft.icms.dbc.DbConnection;
import com.macrosoft.icms.gsdbc.SzDbConnection;
import com.macrosoft.icms.system.SysUtility;
public class QYDJ_YWSB_SQ
{
		String DEPID;
		String DEPNAME;
		String APPRPID;
		String CDDL;
		String ENTCLASS;
		String YSBH;
		String OPENO;
		String PRIPID;
		String OPETYPE;
		String APPFORM;
		String LINKMAN;
		String CERTYPE;
		String CERNO;
		String TEL;
		String MOBTEL;
		String APPDATE;
		String APPOPIN;
		String APPPER;
		String APPRNO;
		String APPROPIN;
		String APPRPER;
		String APPRDATE;
		String REGNO;
		String ENTNAME;
		String LEREP;
		String REGORG;
		String STATUS;
		String LOGINID;
		String ENTTYPE;
		String SUBDOC;
		String REGORGN;
		String JQIP;
		String CLBSDD;
		String LOCALADM;
		String OPELOCDISTRICT;
		String UNISCID;
		String IFELEC;
		
		public String getUNISCID()
		{
			return doPreProcess(UNISCID);
		}

		public void setUNISCID( String UNISCID)
		{
			this.UNISCID=doPreProcess2(convertCode(UNISCID));
		}
		public String getOPELOCDISTRICT()
		{
			return doPreProcess(OPELOCDISTRICT);
		}

		public void setOPELOCDISTRICT( String OPELOCDISTRICT)
		{
			this.OPELOCDISTRICT=doPreProcess2(convertCode(OPELOCDISTRICT));
		}
		public String getLOCALADM()
		{
			return doPreProcess(LOCALADM);
		}

		public void setLOCALADM( String LOCALADM)
		{
			this.LOCALADM=doPreProcess2(convertCode(LOCALADM));
		}
		
		public String getIFELEC() {
			return IFELEC;
		}

		public void setIFELEC(String iFELEC) {
			IFELEC = iFELEC;
		}

		public String getDEPID()
		{
			return doPreProcess(DEPID);
		}

		public void setDEPID( String DEPID)
		{
			this.DEPID=doPreProcess2(convertCode(DEPID));
		}

		public String getDEPNAME()
		{
			return doPreProcess(DEPNAME);
		}

		public void setDEPNAME( String DEPNAME)
		{
			this.DEPNAME=doPreProcess2(convertCode(DEPNAME));
		}

		public String getAPPRPID()
		{
			return doPreProcess(APPRPID);
		}

		public void setAPPRPID( String APPRPID)
		{
			this.APPRPID=doPreProcess2(convertCode(APPRPID));
		}

		public String getCDDL()
		{
			return doPreProcess(CDDL);
		}

		public void setCDDL( String CDDL)
		{
			this.CDDL=doPreProcess2(convertCode(CDDL));
		}

		public String getENTCLASS()
		{
			return doPreProcess(ENTCLASS);
		}

		public void setENTCLASS( String ENTCLASS)
		{
			this.ENTCLASS=doPreProcess2(convertCode(ENTCLASS));
		}

		public String getYSBH()
		{
			return doPreProcess(YSBH);
		}

		public void setYSBH( String YSBH)
		{
			this.YSBH=doPreProcess2(convertCode(YSBH));
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

		public String getOPETYPE()
		{
			return doPreProcess(OPETYPE);
		}

		public void setOPETYPE( String OPETYPE)
		{
			this.OPETYPE=doPreProcess2(convertCode(OPETYPE));
		}

		public String getAPPFORM()
		{
			return doPreProcess(APPFORM);
		}

		public void setAPPFORM( String APPFORM)
		{
			this.APPFORM=doPreProcess2(convertCode(APPFORM));
		}

		public String getLINKMAN()
		{
			return doPreProcess(LINKMAN);
		}

		public void setLINKMAN( String LINKMAN)
		{
			this.LINKMAN=doPreProcess2(convertCode(LINKMAN));
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

		public String getAPPDATE()
		{
			return doPreProcess(APPDATE);
		}

		public void setAPPDATE( String APPDATE)
		{
			this.APPDATE=doPreProcess2(convertCode(APPDATE));
		}

		public String getAPPOPIN()
		{
			return doPreProcess(APPOPIN);
		}

		public void setAPPOPIN( String APPOPIN)
		{
			this.APPOPIN=doPreProcess2(convertCode(APPOPIN));
		}

		public String getAPPPER()
		{
			return doPreProcess(APPPER);
		}

		public void setAPPPER( String APPPER)
		{
			this.APPPER=doPreProcess2(convertCode(APPPER));
		}

		public String getAPPRNO()
		{
			return doPreProcess(APPRNO);
		}

		public void setAPPRNO( String APPRNO)
		{
			this.APPRNO=doPreProcess2(convertCode(APPRNO));
		}

		public String getAPPROPIN()
		{
			return doPreProcess(APPROPIN);
		}

		public void setAPPROPIN( String APPROPIN)
		{
			this.APPROPIN=doPreProcess2(convertCode(APPROPIN));
		}

		public String getAPPRPER()
		{
			return doPreProcess(APPRPER);
		}

		public void setAPPRPER( String APPRPER)
		{
			this.APPRPER=doPreProcess2(convertCode(APPRPER));
		}

		public String getAPPRDATE()
		{
			return doPreProcess(APPRDATE);
		}

		public void setAPPRDATE( String APPRDATE)
		{
			this.APPRDATE=doPreProcess2(convertCode(APPRDATE));
		}

		public String getREGNO()
		{
			return doPreProcess(REGNO);
		}

		public void setREGNO( String REGNO)
		{
			this.REGNO=doPreProcess2(convertCode(REGNO));
		}

		public String getENTNAME()
		{
			return doPreProcess(ENTNAME);
		}

		public void setENTNAME( String ENTNAME)
		{
			this.ENTNAME=doPreProcess2(convertCode(ENTNAME));
		}

		public String getLEREP()
		{
			return doPreProcess(LEREP);
		}

		public void setLEREP( String LEREP)
		{
			this.LEREP=doPreProcess2(convertCode(LEREP));
		}

		public String getREGORG()
		{
			return doPreProcess(REGORG);
		}

		public void setREGORG( String REGORG)
		{
			this.REGORG=doPreProcess2(convertCode(REGORG));
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

		public String getENTTYPE()
		{
			return doPreProcess(ENTTYPE);
		}

		public void setENTTYPE( String ENTTYPE)
		{
			this.ENTTYPE=doPreProcess2(convertCode(ENTTYPE));
		}

		public String getSUBDOC()
		{
			return doPreProcess(SUBDOC);
		}

		public void setSUBDOC( String SUBDOC)
		{
			this.SUBDOC=doPreProcess2(convertCode(SUBDOC));
		}

		public String getREGORGN()
		{
			return doPreProcess(REGORGN);
		}

		public void setREGORGN( String REGORGN)
		{
			this.REGORGN=doPreProcess2(convertCode(REGORGN));
		}

		public String getJQIP()
		{
			return doPreProcess(JQIP);
		}

		public void setJQIP( String JQIP)
		{
			this.JQIP=doPreProcess2(convertCode(JQIP));
		}

		public String getCLBSDD()
		{
			return doPreProcess(CLBSDD);
		}

		public void setCLBSDD( String CLBSDD)
		{
			this.CLBSDD=doPreProcess2(convertCode(CLBSDD));
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
			String sqlSelect="SELECT * FROM QYDJ_YWSB_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
			rsSelect=dbc.executeQuery(sqlSelect);
			if(rsSelect.next())
			{
				doSetData( rsSelect );
			}
			dbc.close();
		}

		public void doSetData( ResultSet rsSelect ) throws SQLException
		{
		DEPID=rsSelect.getString("DEPID");
		DEPNAME=rsSelect.getString("DEPNAME");
		APPRPID=rsSelect.getString("APPRPID");
		CDDL=rsSelect.getString("CDDL");
		ENTCLASS=rsSelect.getString("ENTCLASS");
		YSBH=rsSelect.getString("YSBH");
		OPENO=rsSelect.getString("OPENO");
		PRIPID=rsSelect.getString("PRIPID");
		OPETYPE=rsSelect.getString("OPETYPE");
		APPFORM=rsSelect.getString("APPFORM");
		LINKMAN=rsSelect.getString("LINKMAN");
		CERTYPE=rsSelect.getString("CERTYPE");
		CERNO=rsSelect.getString("CERNO");
		TEL=rsSelect.getString("TEL");
		MOBTEL=rsSelect.getString("MOBTEL");
		APPDATE=String.valueOf(rsSelect.getDate("APPDATE"));
		APPOPIN=rsSelect.getString("APPOPIN");
		APPPER=rsSelect.getString("APPPER");
		APPRNO=rsSelect.getString("APPRNO");
		APPROPIN=rsSelect.getString("APPROPIN");
		APPRPER=rsSelect.getString("APPRPER");
		APPRDATE=String.valueOf(rsSelect.getDate("APPRDATE"));
		REGNO=rsSelect.getString("REGNO");
		ENTNAME=rsSelect.getString("ENTNAME");
		LEREP=rsSelect.getString("LEREP");
		REGORG=rsSelect.getString("REGORG");
		STATUS=rsSelect.getString("STATUS");
		LOGINID=rsSelect.getString("LOGINID");
		ENTTYPE=rsSelect.getString("ENTTYPE");
		SUBDOC=rsSelect.getString("SUBDOC");
		REGORGN=rsSelect.getString("REGORGN");
		JQIP=rsSelect.getString("JQIP");
		CLBSDD=rsSelect.getString("CLBSDD");
		LOCALADM=rsSelect.getString("LOCALADM");
		OPELOCDISTRICT=rsSelect.getString("OPELOCDISTRICT");
		UNISCID=rsSelect.getString("UNISCID");
		IFELEC=rsSelect.getString("IFELEC");
		}

		public boolean doAdd() throws SQLException
		{
			DbConnection dbc=new DbConnection();
			ResultSet rsCount;
			int nRowCount;
			String sqlAdd="INSERT INTO QYDJ_YWSB_SQ(UNISCID,LOCALADM,OPELOCDISTRICT,DEPID,DEPNAME,APPRPID,CDDL,ENTCLASS,OPENO,PRIPID,OPETYPE,APPFORM,LINKMAN,CERTYPE,CERNO,TEL,MOBTEL,APPDATE,APPOPIN,APPPER,APPRNO,APPROPIN,APPRPER,APPRDATE,REGNO,ENTNAME,LEREP,REGORG,STATUS,LOGINID,ENTTYPE,SUBDOC,REGORGN,JQIP,CLBSDD,IFELEC) VALUES("+doPreProcess3(UNISCID)+","+doPreProcess3(LOCALADM)+","+doPreProcess3(OPELOCDISTRICT)+","+ doPreProcess3(DEPID)+","+ doPreProcess3(DEPNAME)+","+ doPreProcess3(APPRPID)+","+ doPreProcess3(CDDL)+","+ doPreProcess3(ENTCLASS)+","+ doPreProcess3(OPENO)+","+ doPreProcess3(PRIPID)+","+ doPreProcess3(OPETYPE)+","+ doPreProcess3(APPFORM)+","+ doPreProcess3(LINKMAN)+","+ doPreProcess3(CERTYPE)+","+ doPreProcess3(CERNO)+","+ doPreProcess3(TEL)+","+ doPreProcess3(MOBTEL)+",to_date("+doPreProcess3(APPDATE)+",'yyyy-mm-dd'),"+ doPreProcess3(APPOPIN)+","+ doPreProcess3(APPPER)+","+ doPreProcess3(APPRNO)+","+ doPreProcess3(APPROPIN)+","+ doPreProcess3(APPRPER)+",to_date("+doPreProcess3(APPRDATE)+",'yyyy-mm-dd'),"+ doPreProcess3(REGNO)+","+ doPreProcess3(ENTNAME)+","+ doPreProcess3(LEREP)+","+ doPreProcess3(REGORG)+","+ doPreProcess3(STATUS)+","+ doPreProcess3(LOGINID)+","+ doPreProcess3(ENTTYPE)+","+ doPreProcess3(SUBDOC)+","+ doPreProcess3(REGORGN)+","+ doPreProcess3(JQIP)+","+ doPreProcess3(CLBSDD)+","+ doPreProcess3(IFELEC)+")";
			{							
				nRowCount=dbc.executeUpdate( sqlAdd );
				dbc.close();
				if (nRowCount>0)
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
			String sqlCount="SELECT COUNT(*) FROM QYDJ_YWSB_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
		public boolean doCount2MiddleData() throws SQLException
		{
			SzDbConnection dbc=new SzDbConnection();
			ResultSet rsCount;
			int nRowCount;
			String sqlCount="SELECT COUNT(*) FROM QYDJ_YWSB_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
			String sqlModify="UPDATE QYDJ_YWSB_SQ SET UNISCID="+doPreProcess3(UNISCID)+",LOCALADM="+doPreProcess3(LOCALADM)+",OPELOCDISTRICT="+doPreProcess3(OPELOCDISTRICT)+",DEPID="+ doPreProcess3(DEPID)+",DEPNAME="+ doPreProcess3(DEPNAME)+",APPRPID="+ doPreProcess3(APPRPID)+",CDDL="+ doPreProcess3(CDDL)+",ENTCLASS="+ doPreProcess3(ENTCLASS)+",OPENO="+ doPreProcess3(OPENO)+",PRIPID="+ doPreProcess3(PRIPID)+",OPETYPE="+ doPreProcess3(OPETYPE)+",APPFORM="+ doPreProcess3(APPFORM)+",LINKMAN="+ doPreProcess3(LINKMAN)+",CERTYPE="+ doPreProcess3(CERTYPE)+",CERNO="+ doPreProcess3(CERNO)+",TEL="+ doPreProcess3(TEL)+",MOBTEL="+ doPreProcess3(MOBTEL)+",APPDATE=to_date("+doPreProcess3(APPDATE)+",'yyyy-mm-dd'),APPOPIN="+ doPreProcess3(APPOPIN)+",APPPER="+ doPreProcess3(APPPER)+",APPRNO="+ doPreProcess3(APPRNO)+",APPROPIN="+ doPreProcess3(APPROPIN)+",APPRPER="+ doPreProcess3(APPRPER)+",APPRDATE=to_date("+doPreProcess3(APPRDATE)+",'yyyy-mm-dd'),REGNO="+ doPreProcess3(REGNO)+",ENTNAME="+ doPreProcess3(ENTNAME)+",LEREP="+ doPreProcess3(LEREP)+",REGORG="+ doPreProcess3(REGORG)+",STATUS="+ doPreProcess3(STATUS)+",LOGINID="+ doPreProcess3(LOGINID)+",ENTTYPE="+ doPreProcess3(ENTTYPE)+",SUBDOC="+ doPreProcess3(SUBDOC)+",REGORGN="+ doPreProcess3(REGORGN)+",JQIP="+ doPreProcess3(JQIP)+",CLBSDD="+ doPreProcess3(CLBSDD)+",IFELEC="+ doPreProcess3(IFELEC)+""+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
			int nRowCount=dbc.executeUpdate( sqlModify );
			dbc.close();
			if (nRowCount>0)
			{
				return true;
			}
			else
				return false;
		}

		public boolean doDelete() throws SQLException
		{
			DbConnection dbc=new DbConnection();
			String sqlDelete="DELETE FROM QYDJ_YWSB_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
			String sqlCount="SELECT COUNT(*) FROM QYDJ_YWSB_SQ";
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
			String sqlList="SELECT * FROM QYDJ_YWSB_SQ";
			if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
				if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
					sqlList+=sqlWhere;}
				else {
					sqlList+=" WHERE "+sqlWhere;}
			}
			ResultSet rsList=dbc.executeQuery( sqlList );
			while(rsList.next()) {
				QYDJ_YWSB_SQ bTable=new QYDJ_YWSB_SQ();
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
			String sqlList="SELECT * FROM QYDJ_YWSB_SQ";
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
				QYDJ_YWSB_SQ bTable=new QYDJ_YWSB_SQ();
				bTable.doSetData( rsList );
				al.add(bTable);
			}
			rsList.close();dbc.close();
			return al;

		}

		public ArrayList getData() throws SQLException
		{
			DbConnection dbc=new DbConnection();
			String sqlArr="SELECT * FROM QYDJ_YWSB_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
	
	public boolean doModStu() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlModify="UPDATE QYDJ_YWSB_SQ SET STATUS="+ doPreProcess3(STATUS)+",SUBDOC="+""+",REGORGN="+""+",APPRDATE="+""+ ",APPROPIN="+""+ ",APPPER="+""+"WHERE OPENO='"+doPreProcess(OPENO)+"'";
		int nRowCount=dbc.executeUpdate( sqlModify );
		dbc.close();
		if (nRowCount>0)
		{
			return true;
		}
		else
			return false;
	}
	
	public boolean doSql(String sqlAdd) throws SQLException
	{
		DbConnection dbc=new DbConnection();
		int nRowCount;
		{							
			nRowCount=dbc.executeUpdate( sqlAdd );
			dbc.close();
			if (nRowCount>=0)
				return true;
			else
				return false;
		}
	}
	public boolean doSql2MiddleData(String sqlAdd) throws SQLException
	{
		SzDbConnection dbc=new SzDbConnection();
		int nRowCount;
		{							
			nRowCount=dbc.executeUpdate( sqlAdd );
			dbc.close();
			if (nRowCount>=0)
				return true;
			else
				return false;
		}
	}
	
	public boolean doDelQySq(String OPENO) throws SQLException{
		DbConnection dbc=new DbConnection();
		java.util.ArrayList lst = new java.util.ArrayList();
 		lst.add(OPENO); 		
 		int res=((Integer)dbc.executeStp("{ ?=call STP_DEL_QYSQ(?)}", lst,Types.INTEGER)).intValue();	
		dbc.close();
		if (res==1)
		{
			return true;
		}
		else
			return false;
	}
	
	public boolean doDelGtSq(String OPENO) throws SQLException{
		DbConnection dbc=new DbConnection();
		java.util.ArrayList lst = new java.util.ArrayList();
 		lst.add(OPENO); 		
 		int res=((Integer)dbc.executeStp("{ ?=call STP_DEL_GTSQ(?)}", lst,Types.INTEGER)).intValue();	
		dbc.close();
		if (res==1)
		{
			return true;
		}
		else
			return false;
	}
	public boolean doDelDcdySq(String OPENO) throws SQLException{
		DbConnection dbc=new DbConnection();
		java.util.ArrayList lst = new java.util.ArrayList();
 		lst.add(OPENO); 		
 		int res=((Integer)dbc.executeStp("{ ?=call STP_DEL_DCDYSQ(?)}", lst,Types.INTEGER)).intValue();	
		dbc.close();
		if (res==1)
		{
			return true;
		}
		else
			return false;
	}
	public boolean doDelHwggSq(String OPENO) throws SQLException{
		DbConnection dbc=new DbConnection();
		java.util.ArrayList lst = new java.util.ArrayList();
 		lst.add(OPENO); 		
 		int res=((Integer)dbc.executeStp("{ ?=call STP_DEL_HWGGSQ(?)}", lst,Types.INTEGER)).intValue();	
		dbc.close();
		if (res==1)
		{
			return true;
		}
		else
			return false;
	}
	public boolean doModifyByNw() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlModify="UPDATE QYDJ_YWSB_SQ SET SUBDOC="+ doPreProcess3(SUBDOC)+",REGORGN="+ doPreProcess3(REGORGN)
		+",APPRDATE=to_date("+doPreProcess3(APPRDATE)+",'yyyy-mm-dd'),APPROPIN="+doPreProcess3(APPROPIN)
		+",APPPER="+ doPreProcess3(APPPER)+",STATUS="+ doPreProcess3(STATUS)+",CLBSDD="+doPreProcess3(CLBSDD)
		+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
		int nRowCount=dbc.executeUpdate( sqlModify );
		dbc.close();
		if (nRowCount>0)	//�޸ĳɹ�
		{
			return true;
		}
		else
			return false;
	}
	public int getColumnValueBySql(String sql)throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsSelect;
		rsSelect=dbc.executeQuery(sql);
		int value=0;
		if(rsSelect.next())
		{
			value=rsSelect.getInt(1);
		}
		dbc.close();
		return value;
	}
	
	public static void main(String[] agrs){
		QYDJ_YWSB_SQ y=new QYDJ_YWSB_SQ();
		int a;
		try {
			a = y.getColumnValueBySql("SELECT MAX(YSBH) FROM QYDJ_YWSB_SQ WHERE STATUS='1' AND ENTCLASS='1'");
			System.out.println(a);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}

