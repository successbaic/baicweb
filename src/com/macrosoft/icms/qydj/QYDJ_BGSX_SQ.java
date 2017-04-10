package com.macrosoft.icms.qydj;
import java.sql.*;
import java.util.*;
import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.system.*;
public class QYDJ_BGSX_SQ
{	
	String OPENO;
	String PRIPID;
	String REGNO;
	String ALTITEM;
	String ALTBE;
	String ALTAF;
	String ALTDATE;
	String REMARK;	

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

	public String getREGNO()
	{
		return doPreProcess(REGNO);
	}

	public void setREGNO( String REGNO)
	{
		this.REGNO=doPreProcess2(convertCode(REGNO));
	}

	public String getALTITEM()
	{
		return doPreProcess(ALTITEM);
	}

	public void setALTITEM( String ALTITEM)
	{
		this.ALTITEM=doPreProcess2(convertCode(ALTITEM));
	}

	public String getALTBE()
	{
		return doPreProcess(ALTBE);
	}

	public void setALTBE( String ALTBE)
	{
		this.ALTBE=doPreProcess2(convertCode(ALTBE));
	}

	public String getALTAF()
	{
		return doPreProcess(ALTAF);
	}

	public void setALTAF( String ALTAF)
	{
		this.ALTAF=doPreProcess2(convertCode(ALTAF));
	}

	public String getALTDATE()
	{
		return doPreProcess(ALTDATE);
	}

	public void setALTDATE( String ALTDATE)
	{
		this.ALTDATE=doPreProcess2(convertCode(ALTDATE));
	}

	public String getREMARK()
	{
		return doPreProcess(REMARK);
	}

	public void setREMARK( String REMARK)
	{
		this.REMARK=doPreProcess2(convertCode(REMARK));
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
		String sqlSelect="SELECT * FROM QYDJ_BGSX_SQ WHERE OPENO='"+doPreProcess(OPENO)+"' and ALTITEM='"+doPreProcess(ALTITEM)+"'";
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
	REGNO=rsSelect.getString("REGNO");
	ALTITEM=rsSelect.getString("ALTITEM");
	ALTBE=rsSelect.getString("ALTBE");
	ALTAF=rsSelect.getString("ALTAF");
	ALTDATE=String.valueOf(rsSelect.getDate("ALTDATE"));
	REMARK=rsSelect.getString("REMARK");
	}

	public boolean doAdd() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd="INSERT INTO QYDJ_BGSX_SQ(OPENO,PRIPID,REGNO,ALTITEM,ALTBE,ALTAF,ALTDATE,REMARK) VALUES("+ doPreProcess3(OPENO)+","+ doPreProcess3(PRIPID)+","+ doPreProcess3(REGNO)+","+ doPreProcess3(ALTITEM)+","+ doPreProcess3(ALTBE)+","+ doPreProcess3(ALTAF)+",to_date("+doPreProcess3(ALTDATE)+",'yyyy-mm-dd'),"+ doPreProcess3(REMARK)+")";
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
		String sqlCount="SELECT COUNT(*) FROM QYDJ_BGSX_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlModify="UPDATE QYDJ_BGSX_SQ SET OPENO="+ doPreProcess3(OPENO)+",PRIPID="+ doPreProcess3(PRIPID)+",REGNO="+ doPreProcess3(REGNO)+",ALTITEM="+ doPreProcess3(ALTITEM)+",ALTBE="+ doPreProcess3(ALTBE)+",ALTAF="+ doPreProcess3(ALTAF)+",ALTDATE=to_date("+doPreProcess3(ALTDATE)+",'yyyy-mm-dd'),REMARK="+ doPreProcess3(REMARK)+""
		+" WHERE ALTITEM='"+doPreProcess(ALTITEM)+"' and OPENO='"+doPreProcess(OPENO)+"'";
		int nRowCount=dbc.executeUpdate( sqlModify );
		dbc.close();
		if (nRowCount>0)	//�޸ĳɹ�
		{
			return true;
		}
		else
			return false;
	}

	public boolean doDeleteAll() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlDelete="DELETE FROM QYDJ_BGSX_SQ"+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlCount="SELECT COUNT(*) FROM QYDJ_BGSX_SQ";
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
	public ArrayList getDataList() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlArr="SELECT * FROM QYDJ_BGSX_SQ "+" WHERE OPENO='"+doPreProcess(OPENO)+"'";
		ResultSet rsArr=dbc.executeQuery(sqlArr);
		ArrayList al= new ArrayList();
		String[] ay = null;		
		while (rsArr.next())
		{	
			String aALTITEM=doPreProcess(rsArr.getString("ALTITEM")).trim(); //"01 03 10 "
			ResultSetMetaData rsmd = rsArr.getMetaData();
			for (int k=1;k<=rsmd.getColumnCount(); k++)
			{
				
				ay = new String[2];
				ay[0]=rsmd.getColumnName(k);
				ay[1]=String.valueOf(rsArr.getObject(ay[0]));
				if (ay[0].equals("ALTBE")||ay[0].equals("ALTAF")||ay[0].equals("REMARK"))
				{
					if (!ay[1].trim().equals("null")&&!ay[1].trim().equals(""))
					{ay[0]+=aALTITEM;ay[1]=SysUtility.pre(ay[1]); al.add(ay);}
				}
				else
				{
					if (!ay[1].trim().equals("null")&&!ay[1].trim().equals(""))
					{ay[1]=SysUtility.pre(ay[1]); al.add(ay);}
				}
			}
		}
		rsArr.close(); rsArr=null;
		dbc.close();
		return al;

	}
	public ArrayList getList( String sqlWhere ) throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ArrayList al= new ArrayList();
		String sqlList="SELECT * FROM QYDJ_BGSX_SQ";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			QYDJ_BGSX_SQ bTable=new QYDJ_BGSX_SQ();
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
		String sqlList="SELECT * FROM QYDJ_BGSX_SQ";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		sqlList+=" AND ROWNUM<="+(startRow+PageSize);//start+pagesize 
		ResultSet rsList=dbc.executeQuery( sqlList);
		//���������Ѿ���ʾ����
		int	nDispRows=0;
		do
		{
			nDispRows++;
			if (nDispRows>startRow)	break;
		}
		while (rsList.next());
		while(rsList.next()) {
			QYDJ_BGSX_SQ bTable=new QYDJ_BGSX_SQ();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlArr="SELECT * FROM QYDJ_BGSX_SQ"+" WHERE ALTITEM='"+doPreProcess(ALTITEM)+"' and OPENO='"+doPreProcess(OPENO)+"'";
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
	
	public String doModifyJbxx(String sALTITEM,String sALTAF) throws SQLException
	{
		String sqlModify="";
		if(sALTITEM.equals("01"))
		{
			//sqlModify=" ENTNAME= "+ doPreProcess3(sALTAF);//���º�׼�ź���ҵ����
		}
		else if(sALTITEM.equals("02"))
		{
			sqlModify=" DOM= "+ doPreProcess3(sALTAF);//���ס��
		}
		else if(sALTITEM.equals("20"))
		{
			sqlModify=" CONGRO= "+ doPreProcess2(sALTAF);//����Ͷ���ܶ�
		}
		else if(sALTITEM.equals("21")){//�����˱��
			sqlModify=" LEREP= "+ doPreProcess3(sALTAF);//��������������
		}
		else if(sALTITEM.equals("100"))
		{
			sqlModify=" LOCALADM= "+ doPreProcess3(sALTAF);//���������
		}

		else if(sALTITEM.equals("102"))
		{
			//sqlModify=" CONUM= "+ doPreProcess3(sALTAF);//���������
		}

		else if(sALTITEM.equals("105"))
		{
			sqlModify=" SUPENTNAME= "+ doPreProcess3(sALTAF);//������ҵ����
		}

		else if(sALTITEM.equals("106"))
		{
			sqlModify=" SUPREGORG= "+ doPreProcess3(sALTAF);//������ҵ�Ǽǻ���
		}

		else if(sALTITEM.equals("107"))
		{
			sqlModify=" SUPREGNO= "+ doPreProcess3(sALTAF);//������ҵע���
		}
		else if(sALTITEM.equals("110"))
		{
			sqlModify=" REGCAPCUR= "+ doPreProcess3(sALTAF);//ע���ʱ�����
		}
		else if(sALTITEM.equals("111"))
		{
			sqlModify=" REGCAPUSD= "+ doPreProcess2(sALTAF);//ע���ʱ�������Ԫ
		}
		else if(sALTITEM.equals("112"))
		{
			sqlModify=" RECCAPCUR= "+ doPreProcess3(sALTAF);//ʵ���ʱ�����
		}
		else if(sALTITEM.equals("113"))
		{
			sqlModify=" RECCAPUSD= "+ doPreProcess2(sALTAF);//ʵ���ʱ�������Ԫ
		}

		else if(sALTITEM.equals("114"))
		{
			sqlModify=" CONGROCUR= "+ doPreProcess3(sALTAF);//Ͷ���ܶ���ֱ���
		}
		else if(sALTITEM.equals("115"))
		{
			sqlModify=" CONGROUSD= "+ doPreProcess2(sALTAF);//Ͷ���ܶ����������Ԫ
		}
		else if(sALTITEM.equals("03"))
		{
			sqlModify=" LEREP= "+ doPreProcess3(sALTAF);//��������������
		}
		else if(sALTITEM.equals("22"))
		{
			sqlModify=" LEREP= "+ doPreProcess3(sALTAF);//��ϯ����
		}
		else if(sALTITEM.equals("30"))
		{
			sqlModify=" LEREP= "+ doPreProcess3(sALTAF);//Ͷ��������
		}
		else if(sALTITEM.equals("04"))
		{
			sqlModify=" ENTTYPE= "+ doPreProcess3(sALTAF);//��˾����
		}
		else if(sALTITEM.equals("05"))
		{
			//sqlModify=" ,REGCAP= "+ doPreProcess3(sALTAF);//ע���ʱ�
			sqlModify=" REGCAP= "+ doPreProcess2(sALTAF);//ע���ʱ�
		}
		else if(sALTITEM.equals("18"))
		{
			sqlModify=" REGCAP= "+ doPreProcess2(sALTAF);//ע���ʱ�
		}
		else if(sALTITEM.equals("08"))
		{
			//sqlModify=" OPTO= to_date("+doPreProcess3(sALTAF)+",'yyyy-mm-dd')";//Ӫҵ����
			sqlModify=" OPDATETO= "+doPreProcess3(sALTAF);
		}
		else if(sALTITEM.equals("081"))
		{
			sqlModify=" OPTO= to_date("+doPreProcess3(sALTAF)+",'yyyy-mm-dd')";//Ӫҵ����
		}
		else if(sALTITEM.equals("09"))
		{
			sqlModify=" BUSFORM= "+ doPreProcess3(sALTAF);//��Ӫ��ʽ
		}		
		else if(sALTITEM.equals("11"))
		{
			sqlModify=" INDUSTRYCO= "+ doPreProcess3(sALTAF);;  //��ҵ�������ҵ����
		}
		else if(sALTITEM.equals("12"))
		{
			sqlModify=" BUSSCOPE= "+ doPreProcess3(sALTAF);//��Ӫ��Χ
		}
		else if(sALTITEM.equals("06"))
		{
			sqlModify=" ABUITEMCO= "+ doPreProcess3(sALTAF);//��ɾ�Ӫ��Ŀ
		}
		else if(sALTITEM.equals("07"))
		{
			sqlModify=" CBUITEM= "+ doPreProcess3(sALTAF);//һ�㾭Ӫ��Ŀ
		}
		else if(sALTITEM.equals("13"))
		{
			sqlModify=" OPLOC= "+ doPreProcess3(sALTAF);//�����Ӫ����
		}
		else if(sALTITEM.equals("18"))
		{
			sqlModify=" REGCAP= "+ doPreProcess3(sALTAF);//�Ͻɳ��ʶ�
		}
		else if(sALTITEM.equals("26"))
		{
			sqlModify=" REGCAP= "+ doPreProcess3(sALTAF);//�ʽ�����
		}
		else if(sALTITEM.equals("27"))
		{
			sqlModify=" RECCAP= "+ doPreProcess2(sALTAF);//ע���ʱ�
		}
		else if(sALTITEM.equals("69"))
		{
			sqlModify=" POSTALCODE= "+ doPreProcess3(sALTAF);//�����������
		}
		else if(sALTITEM.equals("98"))
		{
			sqlModify=" INDUSTRYPHY= "+ doPreProcess3(sALTAF);//�����������
		}
		else if(sALTITEM.equals("15"))
		{
			sqlModify=" SCONFORM= "+ doPreProcess3(sALTAF);//������ʷ�ʽ
		}
		else if(sALTITEM.equals("50"))
		{
			sqlModify=" TEL= "+ doPreProcess3(sALTAF);//��ϵ�绰
		}
		else if(sALTITEM.equals("51"))
		{
			sqlModify=" COUNTY= "+ doPreProcess3(sALTAF);//����/�ֵ�
		}
		else if(sALTITEM.equals("77"))
		{
			sqlModify=" PARNUM= "+ doPreProcess3(sALTAF);//�ϻ�����
		}
		else if(sALTITEM.equals("53"))
		{
			sqlModify=" EXENUM= "+ doPreProcess3(sALTAF);//���޺ϻ�����
		}
		else if(sALTITEM.equals("59"))		//��������� ��פ��ҵ��ַ
		{
			sqlModify=" FORDOM= "+ doPreProcess3(sALTAF);//���޺ϻ�����
		}
		else if(sALTITEM.equals("150")){//�������  ��פ��ҵ��������
			sqlModify=" FORENTNAME= "+ doPreProcess3(sALTAF);
		}
		else if(sALTITEM.equals("151")){//�������  ��פ��ҵ��ַ
			sqlModify=" FORENTADD= "+ doPreProcess3(sALTAF);
		}
		else if(sALTITEM.equals("90")){//�������������ҵ��Ȩǩ���˱���
			sqlModify=" FORENTAUTSIGN= "+ doPreProcess3(sALTAF);
		}
		else if(sALTITEM.equals("91")){//�������������ҵ������ʽ����
			sqlModify=" FORENLIAFOR= "+ doPreProcess3(sALTAF);
		}
		else if(sALTITEM.equals("92")){//�������������ҵ�ʱ����ʲ�������
			sqlModify=" FORENTCAP= "+ doPreProcess3(sALTAF);
		}
		else if(sALTITEM.equals("93")){//�������������ҵ��Ӫ��Χ����
			sqlModify=" FORENTSCOPE= "+ doPreProcess3(sALTAF);
		}
		else if(sALTITEM.equals("95")){//����
			sqlModify=" FORENTCAPCUR= "+ doPreProcess3(sALTAF);
		}			
		return sqlModify;
 	}
	public String doModifyRyxx(String sALTITEM,String sALTAF)
	{
		String sqlModify="";
		if(sALTITEM.equals("03"))
		{
			sqlModify=" NAME= "+ doPreProcess3(sALTAF);//��������������
		}
		else if(sALTITEM.equals("22"))
		{
			sqlModify=" NAME= "+ doPreProcess3(sALTAF);//��ϯ����
		}
		else if(sALTITEM.equals("30"))
		{
			sqlModify=" NAME= "+ doPreProcess3(sALTAF);//Ͷ��������
		}
		else if(sALTITEM.equals("54"))
		{
			sqlModify+=" HOUSEADD= "+ doPreProcess3(sALTAF);//������ס��
		}	
		return sqlModify;
	}
	public String doModifyYwxx(String sALTITEM,String sALTAF) throws SQLException
	{
		String sqlModify="";
		if(sALTITEM.equals("01"))
		{
			sqlModify=" ENTNAME= "+ doPreProcess3(sALTAF);//���º�׼�ź���ҵ����
		}	
		else if(sALTITEM.equals("21")){//�����˱��
			sqlModify=" LEREP= "+ doPreProcess3(sALTAF);//��������������
		}		
		else if(sALTITEM.equals("03"))
		{
			sqlModify=" LEREP= "+ doPreProcess3(sALTAF);//��������������
		}
		else if(sALTITEM.equals("22"))
		{
			sqlModify=" LEREP= "+ doPreProcess3(sALTAF);//��ϯ����
		}
		else if(sALTITEM.equals("30"))
		{
			sqlModify=" LEREP= "+ doPreProcess3(sALTAF);//Ͷ��������
		}		
		return sqlModify;
 	}
	public boolean doModifyBySql(String Sql) throws SQLException
	{
		DbConnection dbc=new DbConnection();
		int nRowCount=dbc.executeUpdate( Sql );
		dbc.close();
		if (nRowCount>0)
		{
			return true;
		}
		else{
			return false;
		}	
	}
	boolean RyChange;
	boolean CzChange;
	boolean GdzcChange;
	boolean FgsChange;
	boolean FrChange;
	boolean LlyChange;
	boolean CwfzrChange;
	
	public void setLlyChange(String ALTITEM){		
		if(ALTITEM.equals("780"))
		{
			LlyChange=true;
		}
	}
	
	public void setCwfzrChange(String ALTITEM){		
		if(ALTITEM.equals("790"))
		{
			CwfzrChange=true;
		}
	}
	
	public void setFrChange(String ALTITEM){		
		if(ALTITEM.equals("03")||
			ALTITEM.equals("21")||
			ALTITEM.equals("22")||
			ALTITEM.equals("30")||
			ALTITEM.equals("116"))
		{
			FrChange=true;
		}
	}
	public void setRyChange(String ALTITEM){		
		if(	ALTITEM.equals("70")||
			ALTITEM.equals("71")||
			ALTITEM.equals("72")||
			ALTITEM.equals("152")||
			ALTITEM.equals("94")){
			RyChange=true;
		}
	}
	public void setGdzcChange(String ALTITEM){		
		if(ALTITEM.equals("73")||
			ALTITEM.equals("74")){
			GdzcChange=true;
		}
	}
	public void setCzChange(String ALTITEM){
		if(ALTITEM.equals("10")||
		   ALTITEM.equals("30")||
		   ALTITEM.equals("54")||
		   ALTITEM.equals("55")||
		   ALTITEM.equals("56")||
		   ALTITEM.equals("57")||
		   ALTITEM.equals("58")||
		   ALTITEM.equals("160")){//���ʹ�˾�ɶ�(������)���ƻ������������д���ɶ���Ͷ����Ϣ��ҳ��
			CzChange=true;
		}
	}
	public void setFgsChange(String ALTITEM){		
		if(ALTITEM.equals("81")||
		   ALTITEM.equals("82")||
		   ALTITEM.equals("83")||
		   ALTITEM.equals("40")||
		   ALTITEM.equals("41")){
			FgsChange=true;
		}
	}
	public boolean getFrChange(){
		return this.FrChange;
	}
	public boolean getRyChange(){
		return this.RyChange;
	}
	public boolean getCzChange(){
		return this.CzChange;
	}
	public boolean getGdzcChange(){
		return this.GdzcChange;
	}
	public boolean getFgsChange(){
		return this.FgsChange;
	}
	
	public boolean getLlyChange(){
		return this.LlyChange;
	}
	
	public boolean getCwfzrChange(){
		return this.CwfzrChange;
	}
	public boolean doZs2Lc(String OPENO,String PRIPID,String OPETYPE,boolean RYXX,boolean CZXX,boolean FZJG,boolean CWFZR,boolean WZLLR) throws SQLException{
		DbConnection dbc=new DbConnection();
		ArrayList list=new ArrayList();
		list.add(OPENO);
		list.add(PRIPID);
		list.add(OPETYPE);
		list.add(RYXX+"");
		list.add(CZXX+"");
		list.add(FZJG+"");
		list.add(CWFZR+"");
		list.add(WZLLR+"");
		String ret=(String)dbc.executeStp("{ ?=call STP_ZS2LC(?,?,?,?,?,?,?,?)}",list,1);
		dbc.close();
		if(ret!=null && !ret.equals("")){
			return true;
		}else{
			return false;
		}
	}
	public String getSqlWhere(String qylx,String altitem,String enttype){
		String sqlwhere="";
		//��˾�����۱����Щ�������Ҫ�ύ��word�ļ��ǣ�1002�޸ĺ�Ĺ�˾�³̻��߹�˾�³�������
		if(qylx.equals("GS")&&qylx.indexOf(",'1002'")<0){
			sqlwhere+=",'1002'";	
		}
		//��˾�����۱����Щ�������Ҫ�ύ��word�ļ��ǣ�
		//���޹�˾--1006�ɶ�����飻һ�����޹�˾--1008�ɶ��������ɷ����޹�˾--1009�ɶ������������¼
		if(qylx.equals("GS")&&qylx.indexOf(",'1006'")<0&&qylx.indexOf(",'1008'")<0&&qylx.indexOf(",'1009'")<0){
			if(enttype.startsWith("115")){
				sqlwhere+=",'1008'";
			}else if(enttype.startsWith("12")){
				sqlwhere+=",'1009'";
			}else{
				sqlwhere+=",'1006'";
			}	
		}
		if(altitem.equals("03")){//���������˱�������ύ������������ְ�ļ�����word��ʽ��
			sqlwhere+=",'1004'";
		}
		//if(altitem.equals("70")||altitem.equals("71")||altitem.equals("72")){//���¡����¡���������Ҫ�ύ���¡����¡��������ְ�ļ�
		//	sqlwhere+=",'1003'";
		//}
		//if(altitem.equals("05")){//���ʷ�ʽ���--û�У�
		if(altitem.equals("10")){//�ɶ�������ύ1007��Ȩת��Э��
			sqlwhere+=",'1007'";
		}
		if(qylx.equals("NZFR")){
			if(altitem.equals("08")){//��Ӫ���ޱ�������ύ1002��ҵ������֯�³�
				sqlwhere+=",'1002'";
			}
			if(altitem.equals("40")){//�����֧������Ҫ�ύ1005��ҵ���˳��ߵķ�֧�������������˻��߸����˵������ļ�
				sqlwhere+=",'1005'";
			}
		}
		//ũ��רҵ�����磬���۱����Щ�������Ҫ�ύ��word�ļ��ǣ�1002����������ǩ����޸ĺ���³̻����³�������
		if(qylx.equals("NZFR")&&qylx.indexOf(",'1002'")<0){
			sqlwhere+=",'1002'";	
		}
		return sqlwhere;		
	}
	
	public String getNwxxByOneCol(String sql,String column) throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		String Oldxx="";
		rsCount=dbc.executeQuery(sql);
		while(rsCount.next()){
			String inv=rsCount.getString(column);
			if(Oldxx.equals("")){
				Oldxx=inv;
			}else{
				Oldxx+="��"+inv;
			}
		}
		dbc.close();
		return Oldxx;
	}
	public String getWwxxByOneCol(String sql,String column) throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		String Newxx="";
		rsCount=dbc.executeQuery(sql);
		while(rsCount.next()){
			String inv=rsCount.getString(column);
			if(Newxx.equals("")){
				Newxx=inv;
			}else{
				Newxx+="��"+inv;
			}		
		}
		dbc.close();
		return Newxx;
	}
}