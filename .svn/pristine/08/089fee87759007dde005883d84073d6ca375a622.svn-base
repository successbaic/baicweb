package com.macrosoft.icms.gqdj;
import java.sql.*;
import java.util.*;
import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.gsdbc.GsDbConnection;
import com.macrosoft.icms.*;
import com.macrosoft.icms.system.*;
public class GQDJ_JBXX_SQ
{
	int ENTCLASS;
	String REMARK;
	String OPETYPE;
	String OPENO;
	String MORREGNO;
	String PRIPID;
	String ENTNAME;
	String REGNO;
	String EXPMOR;
	String EXPMORBLICNO;
	String IMPMOR;
	String IMPMORBLICNO;
	float EXPSHARAM;
	float PRICLASECAM;
	String SHARTYPE;
	String EXPMORTYPE;
	String IMPMORTYPE;
	String INSDATE;
	String APPRDATE;
	String REGORG;
	int STATUS;
	String SN;
	String EXPORGTEL;
	String IMPORGTEL;
	String LOGINID;
	String HOLDERTYPE;
	float HOLDERSHARE;
	String IMPFROM;
	String IMPTO;
	String NWID;
	String NWSN;
	
	public int getENTCLASS()
	{
		return ENTCLASS;
	}

	public void setENTCLASS( int ENTCLASS)
	{
		this.ENTCLASS=ENTCLASS ;
	}

	public String getREMARK()
	{
		return doPreProcess(REMARK);
	}

	public void setREMARK( String REMARK)
	{
		this.REMARK=doPreProcess2(convertCode(REMARK));
	}

	public String getOPETYPE()
	{
		return doPreProcess(OPETYPE);
	}

	public void setOPETYPE( String OPETYPE)
	{
		this.OPETYPE=doPreProcess2(convertCode(OPETYPE));
	}

	public String getOPENO()
	{
		return doPreProcess(OPENO);
	}

	public void setOPENO( String OPENO)
	{
		this.OPENO=doPreProcess2(convertCode(OPENO));
	}

	public String getMORREGNO()
	{
		return doPreProcess(MORREGNO);
	}

	public void setMORREGNO( String MORREGNO)
	{
		this.MORREGNO=doPreProcess2(convertCode(MORREGNO));
	}

	public String getPRIPID()
	{
		return doPreProcess(PRIPID);
	}

	public void setPRIPID( String PRIPID)
	{
		this.PRIPID=doPreProcess2(convertCode(PRIPID));
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

	public String getEXPMOR()
	{
		return doPreProcess(EXPMOR);
	}

	public void setEXPMOR( String EXPMOR)
	{
		this.EXPMOR=doPreProcess2(convertCode(EXPMOR));
	}

	public String getEXPMORBLICNO()
	{
		return doPreProcess(EXPMORBLICNO);
	}

	public void setEXPMORBLICNO( String EXPMORBLICNO)
	{
		this.EXPMORBLICNO=doPreProcess2(convertCode(EXPMORBLICNO));
	}

	public String getIMPMOR()
	{
		return doPreProcess(IMPMOR);
	}

	public void setIMPMOR( String IMPMOR)
	{
		this.IMPMOR=doPreProcess2(convertCode(IMPMOR));
	}

	public String getIMPMORBLICNO()
	{
		return doPreProcess(IMPMORBLICNO);
	}

	public void setIMPMORBLICNO( String IMPMORBLICNO)
	{
		this.IMPMORBLICNO=doPreProcess2(convertCode(IMPMORBLICNO));
	}

	public float getEXPSHARAM()
	{
		return EXPSHARAM;
	}

	public void setEXPSHARAM( float EXPSHARAM)
	{
		this.EXPSHARAM=EXPSHARAM ;
	}

	public float getPRICLASECAM()
	{
		return PRICLASECAM;
	}

	public void setPRICLASECAM( float PRICLASECAM)
	{
		this.PRICLASECAM=PRICLASECAM ;
	}

	public String getSHARTYPE()
	{
		return doPreProcess(SHARTYPE);
	}

	public void setSHARTYPE( String SHARTYPE)
	{
		this.SHARTYPE=doPreProcess2(convertCode(SHARTYPE));
	}

	public String getEXPMORTYPE()
	{
		return doPreProcess(EXPMORTYPE);
	}

	public void setEXPMORTYPE( String EXPMORTYPE)
	{
		this.EXPMORTYPE=doPreProcess2(convertCode(EXPMORTYPE));
	}

	public String getIMPMORTYPE()
	{
		return doPreProcess(IMPMORTYPE);
	}

	public void setIMPMORTYPE( String IMPMORTYPE)
	{
		this.IMPMORTYPE=doPreProcess2(convertCode(IMPMORTYPE));
	}

	public String getINSDATE()
	{
		return doPreProcess(INSDATE);
	}

	public void setINSDATE( String INSDATE)
	{
		this.INSDATE=doPreProcess2(convertCode(INSDATE));
	}

	public String getAPPRDATE()
	{
		return doPreProcess(APPRDATE);
	}

	public void setAPPRDATE( String APPRDATE)
	{
		this.APPRDATE=doPreProcess2(convertCode(APPRDATE));
	}

	public String getREGORG()
	{
		return doPreProcess(REGORG);
	}

	public void setREGORG( String REGORG)
	{
		this.REGORG=doPreProcess2(convertCode(REGORG));
	}

	public int getSTATUS()
	{
		return STATUS;
	}

	public void setSTATUS( int STATUS)
	{
		this.STATUS=STATUS ;
	}
	public String getSN()
	{
		return doPreProcess(SN);
	}

	public void setSN( String SN)
	{
		this.SN=doPreProcess2(convertCode(SN));
	}
	public String getEXPORGTEL()
	{
		return doPreProcess(EXPORGTEL);
	}

	public void setEXPORGTEL( String EXPORGTEL)
	{
		this.EXPORGTEL=doPreProcess2(convertCode(EXPORGTEL));
	}
	
	public String getIMPORGTEL()
	{
		return doPreProcess(IMPORGTEL);
	}

	public void setIMPORGTEL( String IMPORGTEL)
	{
		this.IMPORGTEL=doPreProcess2(convertCode(IMPORGTEL));
	}
	public String getLOGINID()
	{
		return doPreProcess(LOGINID);
	}

	public void setLOGINID( String LOGINID)
	{
		this.LOGINID=doPreProcess2(convertCode(LOGINID));
	}
	
	public String getHOLDERTYPE()
	{
		return doPreProcess(HOLDERTYPE);
	}

	public void setHOLDERTYPE( String HOLDERTYPE)
	{
		this.HOLDERTYPE=doPreProcess2(convertCode(HOLDERTYPE));
	}
	
	public float getHOLDERSHARE()
	{
		return HOLDERSHARE;
	}
	public void setHOLDERSHARE( float HOLDERSHARE)
	{
		this.HOLDERSHARE=HOLDERSHARE;
	}
	
	public String getIMPFROM()
	{
		return doPreProcess(IMPFROM);
	}
	public void setIMPFROM( String IMPFROM)
	{
		this.IMPFROM=doPreProcess2(convertCode(IMPFROM));
	}
	
	public String getIMPTO()
	{
		return doPreProcess(IMPTO);
	}
	public void setIMPTO( String IMPTO)
	{
		this.IMPTO=doPreProcess2(convertCode(IMPTO));
	}
	
	public String getNWID()
	{
		return doPreProcess(NWID);
	}
	public void setNWID( String NWID)
	{
		this.NWID=doPreProcess2(convertCode(NWID));
	}
	
	public String getNWSN()
	{
		return doPreProcess(NWSN);
	}
	public void setNWSN( String NWSN)
	{
		this.NWSN=doPreProcess2(convertCode(NWSN));
	}
	
	public String convertCode(String strvalue)
	{	return com.macrosoft.icms.system.SysUtility.convertCode( strvalue );	}

	public String doPreProcess( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess( sValue );	}

	public String doPreProcess2( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess2( sValue );	}

	public String doPreProcess3( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess3( sValue );	}
	/**
	 * 根据企业PRIPID判段该信息是否存在并取得OPENO
	 * PRIPID   ENTNAME
	 * **/
	public String doIFSelect(String PRIPID,String ENTNAME) throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsSelect;
		String sqlSelect="SELECT * FROM GQDJ_JBXX_SQ"+" WHERE PRIPID='"+doPreProcess(PRIPID)+"' AND '"+ENTNAME+"'";
		rsSelect=dbc.executeQuery(sqlSelect);
		String sOPENO="";
		if(rsSelect.next())
		{
			sOPENO=rsSelect.getString("OPENO");
		}
		dbc.close();
		return sOPENO;
		
	}
	public void doSelect() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsSelect;
		String sqlSelect="SELECT * FROM GQDJ_JBXX_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
		rsSelect=dbc.executeQuery(sqlSelect);
		if(rsSelect.next())
		{
			doSetData( rsSelect );
		}
		dbc.close();
	}

	public void doSetData( ResultSet rsSelect ) throws SQLException
	{
	ENTCLASS=rsSelect.getInt("ENTCLASS");
	REMARK=rsSelect.getString("REMARK");
	OPETYPE=rsSelect.getString("OPETYPE");
	OPENO=rsSelect.getString("OPENO");
	MORREGNO=rsSelect.getString("MORREGNO");
	PRIPID=rsSelect.getString("PRIPID");
	ENTNAME=rsSelect.getString("ENTNAME");
	REGNO=rsSelect.getString("REGNO");
	EXPMOR=rsSelect.getString("EXPMOR");
	EXPMORBLICNO=rsSelect.getString("EXPMORBLICNO");
	IMPMOR=rsSelect.getString("IMPMOR");
	IMPMORBLICNO=rsSelect.getString("IMPMORBLICNO");
	EXPSHARAM=rsSelect.getFloat("EXPSHARAM");
	PRICLASECAM=rsSelect.getFloat("PRICLASECAM");
	SHARTYPE=rsSelect.getString("SHARTYPE");
	EXPMORTYPE=rsSelect.getString("EXPMORTYPE");
	IMPMORTYPE=rsSelect.getString("IMPMORTYPE");
	INSDATE=String.valueOf(rsSelect.getDate("INSDATE"));
	APPRDATE=String.valueOf(rsSelect.getDate("APPRDATE"));
	REGORG=rsSelect.getString("REGORG");
	STATUS=rsSelect.getInt("STATUS");
	SN=rsSelect.getString("SN");
	EXPORGTEL=rsSelect.getString("EXPORGTEL");
	IMPORGTEL=rsSelect.getString("IMPORGTEL");
	LOGINID=rsSelect.getString("LOGINID");
	HOLDERTYPE=rsSelect.getString("HOLDERTYPE");
	HOLDERSHARE=rsSelect.getFloat("HOLDERSHARE");
	IMPFROM=rsSelect.getString("IMPFROM");
	IMPTO=rsSelect.getString("IMPTO");
	NWID=rsSelect.getString("NWID");
	NWSN=rsSelect.getString("NWSN");
	}

	public boolean doAdd() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;	
		String sqlAdd="INSERT INTO GQDJ_JBXX_SQ(ENTCLASS,REMARK,OPETYPE,OPENO,MORREGNO,PRIPID,ENTNAME,REGNO,EXPMOR,EXPMORBLICNO,IMPMOR,IMPMORBLICNO,EXPSHARAM,PRICLASECAM,SHARTYPE,EXPMORTYPE,IMPMORTYPE,INSDATE,APPRDATE,REGORG,STATUS,SN,EXPORGTEL,IMPORGTEL,LOGINID,HOLDERTYPE,HOLDERSHARE,IMPFROM,IMPTO) VALUES("+ENTCLASS+","+ doPreProcess3(REMARK)+","+ doPreProcess3(OPETYPE)+","+ doPreProcess3(OPENO)+","+ doPreProcess3(MORREGNO)+","+ doPreProcess3(PRIPID)+","+ doPreProcess3(ENTNAME)+","+ doPreProcess3(REGNO)+","+ doPreProcess3(EXPMOR)+","+ doPreProcess3(EXPMORBLICNO)+","+ doPreProcess3(IMPMOR)+","+ doPreProcess3(IMPMORBLICNO)+","+EXPSHARAM+","+PRICLASECAM+","+ doPreProcess3(SHARTYPE)+","+ doPreProcess3(EXPMORTYPE)+","+ doPreProcess3(IMPMORTYPE)+",sysdate,to_date("+doPreProcess3(APPRDATE)+",'yyyy-mm-dd'),"+ doPreProcess3(REGORG)+","+STATUS+","+ doPreProcess3(SN)+","+ doPreProcess3(EXPORGTEL)+","+ doPreProcess3(IMPORGTEL)+","+ doPreProcess3(LOGINID)+","+doPreProcess3(HOLDERTYPE)+","+HOLDERSHARE+","+doPreProcess3(IMPFROM)+","+doPreProcess3(IMPTO)+")";
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
		String sqlCount="SELECT COUNT(*) FROM GQDJ_JBXX_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlModify="UPDATE GQDJ_JBXX_SQ SET ENTCLASS="+ENTCLASS+",REMARK="+ doPreProcess3(REMARK)+",OPETYPE="+ doPreProcess3(OPETYPE)+",OPENO="+ doPreProcess3(OPENO)+",MORREGNO="+ doPreProcess3(MORREGNO)+",PRIPID="+ doPreProcess3(PRIPID)+",ENTNAME="+ doPreProcess3(ENTNAME)+",REGNO="+ doPreProcess3(REGNO)+",EXPMOR="+ doPreProcess3(EXPMOR)+",EXPMORBLICNO="+ doPreProcess3(EXPMORBLICNO)+",IMPMOR="+ doPreProcess3(IMPMOR)+",IMPMORBLICNO="+ doPreProcess3(IMPMORBLICNO)+",EXPSHARAM="+EXPSHARAM+",PRICLASECAM="+PRICLASECAM+",SHARTYPE="+ doPreProcess3(SHARTYPE)+",EXPMORTYPE="+ doPreProcess3(EXPMORTYPE)+",IMPMORTYPE="+ doPreProcess3(IMPMORTYPE)+",INSDATE=to_date("+doPreProcess3(INSDATE)+",'yyyy-mm-dd'),APPRDATE=to_date("+doPreProcess3(APPRDATE)+",'yyyy-mm-dd'),REGORG="+ doPreProcess3(REGORG)+",STATUS="+STATUS+",SN="+ doPreProcess3(SN)+",EXPORGTEL="+ doPreProcess3(EXPORGTEL)+",IMPORGTEL="+ doPreProcess3(IMPORGTEL)+",LOGINID="+ doPreProcess3(LOGINID)+",HOLDERTYPE="+ doPreProcess3(HOLDERTYPE)+",HOLDERSHARE="+ HOLDERSHARE+",IMPFROM="+ doPreProcess3(IMPFROM)+",IMPTO="+ doPreProcess3(IMPTO)+""+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
		int nRowCount=dbc.executeUpdate( sqlModify );
		dbc.close();
		if (nRowCount>0)	//修改成功
		{
			return true;
		}
		else
			return false;
	}
	/***
	 * 股权外网更新
	 * */
	public boolean doWWModify() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlModify="UPDATE GQDJ_JBXX_SQ SET ENTCLASS="+ENTCLASS+",REMARK="+ doPreProcess3(REMARK)+",OPETYPE="+ doPreProcess3(OPETYPE)+",OPENO="+ doPreProcess3(OPENO)+",MORREGNO="+ doPreProcess3(MORREGNO)+",PRIPID="+ doPreProcess3(PRIPID)+",ENTNAME="+ doPreProcess3(ENTNAME)+",REGNO="+ doPreProcess3(REGNO)+",EXPMOR="+ doPreProcess3(EXPMOR)+",EXPMORBLICNO="+ doPreProcess3(EXPMORBLICNO)+",IMPMOR="+ doPreProcess3(IMPMOR)+",IMPMORBLICNO="+ doPreProcess3(IMPMORBLICNO)+",EXPSHARAM="+EXPSHARAM+",PRICLASECAM="+PRICLASECAM+",SHARTYPE="+ doPreProcess3(SHARTYPE)+",EXPMORTYPE="+ doPreProcess3(EXPMORTYPE)+",IMPMORTYPE="+ doPreProcess3(IMPMORTYPE)+",INSDATE=to_date("+doPreProcess3(INSDATE)+",'yyyy-mm-dd'),APPRDATE=to_date("+doPreProcess3(APPRDATE)+",'yyyy-mm-dd'),REGORG="+ doPreProcess3(REGORG)+",STATUS="+STATUS+",EXPORGTEL="+ doPreProcess3(EXPORGTEL)+",IMPORGTEL="+ doPreProcess3(IMPORGTEL)+",LOGINID="+ doPreProcess3(LOGINID)+""+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlDelete="DELETE FROM GQDJ_JBXX_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlCount="SELECT COUNT(*) FROM GQDJ_JBXX_SQ";
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
		String sqlList="SELECT * FROM GQDJ_JBXX_SQ";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			GQDJ_JBXX_SQ bTable=new GQDJ_JBXX_SQ();
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
		String sqlList="SELECT * FROM GQDJ_JBXX_SQ";
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
			GQDJ_JBXX_SQ bTable=new GQDJ_JBXX_SQ();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlArr="SELECT * FROM GQDJ_JBXX_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
	//外网导入内网
	public boolean executeStp(String OPENO1) throws SQLException
	{
		//删除流程数据 
		//OPENO1是流程表主键
		GsDbConnection wsdjdb=new GsDbConnection();
		java.util.ArrayList lst = new java.util.ArrayList();
 		lst.add(OPENO1);
		int res=((Integer)wsdjdb.executeStp("{ ?=call STP_DONW_GQDJ(?)}", lst,Types.INTEGER)).intValue();	
		wsdjdb.close();
		if (res==1)
		{
			return true;
		}
		else
			return false;
	}
	public int dataReady(String OPRTYPE1,String OPENO1,String MORREGNO1 , String SOPETYPE1) throws SQLException
	{
 
		 // OPENO1为流程表主键，PRIPID1是正式表主键
     	DbConnection dbc=new DbConnection();
 		java.util.ArrayList lst = new java.util.ArrayList();
		lst.add(OPRTYPE1);
		lst.add(OPENO1);
		lst.add(MORREGNO1);
		lst.add(SOPETYPE1);
		
		System.out.println(OPRTYPE1);
		System.out.println(OPENO1);
		System.out.println(MORREGNO1);
		System.out.println(SOPETYPE1);
		
 		int res=((Integer)dbc.executeStp("{ ?=call STP_GQDJ_ZS2LC(?,?,?,?)}", lst,Types.INTEGER)).intValue();	
		dbc.close();
 		return res;
	} 


	public boolean doLC2ZS(String OPENO1, String FLAG1) throws SQLException
	{
		//处理流程到正式 
		//OPRTYPE1 操作类型 OPENO1 为流程表主键，PRIPID1是正式表主键
		DbConnection dbc=new DbConnection();
		java.util.ArrayList lst = new java.util.ArrayList();
		lst.add(OPENO1);
		lst.add(FLAG1);

		System.out.println("OPENO1:"+OPENO1);
		System.out.println("FLAG1:"+FLAG1);
		int res=((Integer)dbc.executeStp("{ ?=call STP_GQDJ_LC2ZS(?,?)}", lst,Types.INTEGER)).intValue();	
		dbc.close();
 		if (res==1)
		{
			return true;
		}
		else
			return false;
	} 

	public String substringBetween(String str, String open, String close)
	{
		int start = str.indexOf(open) + open.length();
		int end = str.indexOf(close);
		return str.substring(start, end);
	}
	public String DoPre(String app1)
	{
		// （济工商）股质登记设字[2009]第0004号
		
		return substringBetween(app1, "[", "]")+substringBetween(app1, "第", "号");
	}

	public boolean dataOpra(String OPENO1,String OPETYPE1,int STATUS1, String APPRDATE1, String DQBH1, String Entcls1, String Appno1) throws SQLException
	{
		boolean bl=false;
//////////////////////////////////////update jbxx/////////////////////////////////////////////////
		DbConnection dbc=new DbConnection();	

		String sqlModify="UPDATE GQDJ_JBXX_SQ SET STATUS="+STATUS1+" WHERE OPENO='"+doPreProcess(OPENO1)+"'";
		if (STATUS1==1)//STATUS=1 受理
		{
			if (dbc.executeUpdate(sqlModify)>0)	bl=true;
			sqlModify="UPDATE GQDJ_YWSB SET STATUS="+STATUS1+" WHERE OPENO='"+doPreProcess(OPENO1)+"'";
			if (dbc.executeUpdate(sqlModify)>0)	bl=true;
			dbc.close();
		}	
		else if (STATUS1==9)//STATUS=9 审核驳回
		{
			if (dbc.executeUpdate(sqlModify)>0)	bl=true;
			sqlModify="UPDATE GQDJ_YWSB SET STATUS="+STATUS1+" WHERE OPENO='"+doPreProcess(OPENO1)+"'";
			if (dbc.executeUpdate(sqlModify)>0)	bl=true;
			dbc.close();
		}
		else if (STATUS1==2) //核准
		{
			// IF 2 UPDATE LC STATUS&APPDATE
			sqlModify="UPDATE GQDJ_JBXX_SQ SET STATUS="+STATUS1+",APPRDATE=to_date('"+doPreProcess(APPRDATE1)+"','yyyy-mm-dd') WHERE OPENO='"+doPreProcess(OPENO1)+"'";
	
			if (OPETYPE1.equals("20")) //开业
			{
				this.OPENO=OPENO1;	doSelect(); //检索出登记的基本信息				
				if (doPreProcess(MORREGNO).equals(""))
				{
					/*
					SYS_ZCH syszch=new SYS_ZCH();//生成新的注册号	
					MORREGNO=syszch.CreateZCH(REGORG,"G", Entcls1);
					*/
					// 获取
					
					MORREGNO=DQBH1+Entcls1+DoPre(Appno1);
					

					sqlModify="UPDATE GQDJ_JBXX_SQ SET MORREGNO="+ doPreProcess3(MORREGNO)+",STATUS="+STATUS1+",APPRDATE=to_date('"+doPreProcess(APPRDATE1)+"','yyyy-mm-dd'),INSDATE=to_date('"+doPreProcess(APPRDATE1)+"','yyyy-mm-dd') WHERE OPENO='"+doPreProcess(OPENO1)+"'";				
				}				
				////update jbxx
				if (dbc.executeUpdate(sqlModify)>0)	bl=true;

				sqlModify="UPDATE GQDJ_YWSB SET MORREGNO="+ doPreProcess3(MORREGNO)+",STATUS="+STATUS1+",APPRDATE=to_date('"+doPreProcess(APPRDATE1)+"','yyyy-mm-dd') WHERE OPENO='"+doPreProcess(OPENO1)+"'";				
				////update GQDJ_YWSB
				if (dbc.executeUpdate(sqlModify)>0)	bl=true;

				sqlModify="UPDATE QYDJ_TJWJ SET PRIPID="+ doPreProcess3(MORREGNO)+" WHERE OPENO='"+doPreProcess(OPENO1)+"'";				
				if (dbc.executeUpdate(sqlModify)>0)	bl=true;

				sqlModify="UPDATE QYDJ_SQWT SET PRIPID="+ doPreProcess3(MORREGNO)+" WHERE OPENO='"+doPreProcess(OPENO1)+"'";				
				if (dbc.executeUpdate(sqlModify)>0)	bl=true;

				dbc.close();
				////lc2zs
				if (bl) bl=doLC2ZS(OPENO1, "1");//流程数据转入正式
			}
			else if (OPETYPE1.equals("30")) //变更
			{
				//update jbxx
				sqlModify="UPDATE GQDJ_JBXX_SQ SET STATUS="+STATUS1+",APPRDATE=to_date('"+doPreProcess(APPRDATE1)+"','yyyy-mm-dd')  WHERE OPENO='"+doPreProcess(OPENO1)+"'";
				if (dbc.executeUpdate(sqlModify)>0)	bl=true;				

				sqlModify="UPDATE GQDJ_YWSB SET MORREGNO="+ doPreProcess3(MORREGNO)+",PRIPID="+ doPreProcess3(PRIPID)+",STATUS="+STATUS1+",APPRDATE=to_date('"+doPreProcess(APPRDATE1)+"','yyyy-mm-dd') WHERE OPENO='"+doPreProcess(OPENO1)+"'";				
				////update GQDJ_YWSB
				if (dbc.executeUpdate(sqlModify)>0)	bl=true;
				dbc.close();
				if (bl) bl=doLC2ZS(OPENO1, "1");//流程数据转入正式  1:正式 3:注销 4:吊销 5:迁出
			}
			else if (OPETYPE1.equals("50")) //注销
			{
				///update jbxx
				sqlModify="UPDATE GQDJ_JBXX_SQ SET STATUS="+STATUS1+",APPRDATE=to_date('"+doPreProcess(APPRDATE1)+"','yyyy-mm-dd')  WHERE OPENO='"+doPreProcess(OPENO1)+"'";
				if (dbc.executeUpdate(sqlModify)>0)	bl=true;				

				sqlModify="UPDATE GQDJ_YWSB SET MORREGNO="+ doPreProcess3(MORREGNO)+",PRIPID="+ doPreProcess3(PRIPID)+",STATUS="+STATUS1+",APPRDATE=to_date('"+doPreProcess(APPRDATE1)+"','yyyy-mm-dd') WHERE OPENO='"+doPreProcess(OPENO1)+"'";				
				////update GQDJ_YWSB
				if (dbc.executeUpdate(sqlModify)>0)	bl=true;

				dbc.close();
				if (bl) 				
				   bl=doLC2ZS(OPENO1, "3");//流程数据转入正式
			}		
			
			else if (OPETYPE1.equals("81")) //撤销
			{
				///update jbxx
				sqlModify="UPDATE GQDJ_JBXX_SQ SET STATUS="+STATUS1+",APPRDATE=to_date('"+doPreProcess(APPRDATE1)+"','yyyy-mm-dd')  WHERE OPENO='"+doPreProcess(OPENO1)+"'";
				if (dbc.executeUpdate(sqlModify)>0)	bl=true;				

				sqlModify="UPDATE GQDJ_YWSB SET MORREGNO="+ doPreProcess3(MORREGNO)+",PRIPID="+ doPreProcess3(PRIPID)+",STATUS="+STATUS1+",APPRDATE=to_date('"+doPreProcess(APPRDATE1)+"','yyyy-mm-dd') WHERE OPENO='"+doPreProcess(OPENO1)+"'";				
				////update GQDJ_YWSB
				if (dbc.executeUpdate(sqlModify)>0)	bl=true;

				dbc.close();
				if (bl)
				   bl=doLC2ZS(OPENO1, "4");//流程数据转入正式
			
			}			
			else // others
			{
				sqlModify="UPDATE GQDJ_JBXX_SQ SET STATUS="+STATUS1+",APPRDATE=to_date('"+doPreProcess(APPRDATE1)+"','yyyy-mm-dd')  WHERE OPENO='"+doPreProcess(OPENO1)+"'";
				if (dbc.executeUpdate(sqlModify)>0)	bl=true;

				sqlModify="UPDATE GQDJ_YWSB SET REGNO="+ doPreProcess3(REGNO)+",PRIPID="+ doPreProcess3(PRIPID)+",STATUS="+STATUS1+",APPRDATE=to_date('"+doPreProcess(APPRDATE1)+"','yyyy-mm-dd') WHERE OPENO='"+doPreProcess(OPENO1)+"'";				
				////update GQDJ_YWSB
				if (dbc.executeUpdate(sqlModify)>0)	bl=true;

				dbc.close();
			}							
		}		
		return bl;
	}


	public boolean doDELLC(String OPENO1, String ALL1 ) throws SQLException
	{
		//删除流程数据 
		//OPENO1是流程表主键
		DbConnection dbc=new DbConnection();
		java.util.ArrayList lst = new java.util.ArrayList();
 		lst.add(OPENO1);
		lst.add(ALL1);
		int res=((Integer)dbc.executeStp("{ ?=call STP_GQDJ_DELLC(?,?)}", lst,Types.INTEGER)).intValue();	
		dbc.close();
		if (res==1)
		{
			return true;
		}
		else
			return false;
	}


	public boolean restoreItem () throws SQLException
	{		
		DbConnection dbc=new DbConnection();

		String sqlres="UPDATE GQDJ_JBXX_SQ SET (ENTNAME,REGNO,EXPMOR,IMPMOR,EXPMORBLICNO,IMPMORBLICNO,EXPSHARAM)=(SELECT ENTNAME,REGNO,EXPMOR,IMPMOR,EXPMORBLICNO,IMPMORBLICNO,EXPSHARAM FROM GQDJ_JBXX_ZS WHERE GQDJ_JBXX_ZS.MORREGNO=GQDJ_JBXX_SQ.MORREGNO AND GQDJ_JBXX_SQ.OPENO='"+OPENO+"') WHERE OPENO='"+OPENO+"'";

		/*变更恢复*/
		int nRowCount=dbc.executeUpdate( sqlres );
		dbc.close();
		if (nRowCount>0 )	//恢复成功
			return true;
		else
			return false;

	}
	public boolean doModifyItem(String sALTITEM,String sALTAF) throws SQLException
	{
		String sqlModify="UPDATE GQDJ_JBXX_SQ SET OPENO=OPENO ";		

		if(sALTITEM.equals("01"))
		{
			sqlModify+=" ,ENTNAME= "+ doPreProcess3(sALTAF);//更新股权所在公司名称
			
		}
		else if(sALTITEM.equals("02"))
		{
			sqlModify+=" ,REGNO= "+ doPreProcess3(sALTAF);//更新股权所在公司注册号
			
		}
		else if(sALTITEM.equals("03"))				
		{
			sqlModify+=" ,EXPMOR= "+ doPreProcess3(sALTAF);//更新出质人姓名
			
		}
		else if(sALTITEM.equals("04"))
		{
			sqlModify+=" ,IMPMOR= "+ doPreProcess3(sALTAF);//更新质权人姓名
			
		}
		else if(sALTITEM.equals("05"))
		{
			sqlModify+=" ,EXPMORBLICNO= "+ doPreProcess3(sALTAF);//更新出质人证照号码
			
		}
		else if(sALTITEM.equals("06"))
		{
			sqlModify+=" ,IMPMORBLICNO= "+ doPreProcess3(sALTAF);//
			
		}
		else if(sALTITEM.equals("07"))
		{
			sqlModify+=" ,EXPSHARAM= "+ doPreProcess3(sALTAF);//
			
		}

		sqlModify+= " WHERE OPENO='"+doPreProcess(OPENO)+"'";	
		DbConnection dbc=new DbConnection();		
		int nRowCount=-1;
		nRowCount=dbc.executeUpdate( sqlModify );		
		
		dbc.close();
		if (nRowCount>0)	//修改成功
			return true;
		else
			return false;
 	}

}
