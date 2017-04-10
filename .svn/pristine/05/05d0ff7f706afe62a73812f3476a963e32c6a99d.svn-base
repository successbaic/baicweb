package com.macrosoft.icms.htgl;
import java.sql.*;
import java.util.*;
import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.*;
import com.macrosoft.icms.system.*;
public class DCDY_DYWXX_SQ
{
	String OPENO;
	String MORCONTNO;
	int RECID;
	String GUANAME;
	String BRANDNAME;
	String TYPESPF;
	String LEAFACDATE;
	int USERTERM;
	String OWN;
	String USU;
	String DEPOSPOT;
	int QUAN;
	float VALUE;
	String ASCST;
	String POSST;
	public String getOPENO()
	{
		return doPreProcess(OPENO);
	}

	public void setOPENO( String OPENO)
	{
		this.OPENO=doPreProcess2(convertCode(OPENO));
	}

	public String getMORCONTNO()
	{
		return doPreProcess(MORCONTNO);
	}

	public void setMORCONTNO( String MORCONTNO)
	{
		this.MORCONTNO=doPreProcess2(convertCode(MORCONTNO));
	}

	public int getRECID()
	{
		return RECID;
	}

	public void setRECID( int RECID)
	{
		this.RECID=RECID ;
	}

	public String getGUANAME()
	{
		return doPreProcess(GUANAME);
	}

	public void setGUANAME( String GUANAME)
	{
		this.GUANAME=doPreProcess2(convertCode(GUANAME));
	}

	public String getBRANDNAME()
	{
		return doPreProcess(BRANDNAME);
	}

	public void setBRANDNAME( String BRANDNAME)
	{
		this.BRANDNAME=doPreProcess2(convertCode(BRANDNAME));
	}

	public String getTYPESPF()
	{
		return doPreProcess(TYPESPF);
	}

	public void setTYPESPF( String TYPESPF)
	{
		this.TYPESPF=doPreProcess2(convertCode(TYPESPF));
	}

	public String getLEAFACDATE()
	{
		return doPreProcess(LEAFACDATE);
	}

	public void setLEAFACDATE( String LEAFACDATE)
	{
		this.LEAFACDATE=doPreProcess2(convertCode(LEAFACDATE));
	}

	public int getUSERTERM()
	{
		return USERTERM;
	}

	public void setUSERTERM( int USERTERM)
	{
		this.USERTERM=USERTERM ;
	}

	public String getOWN()
	{
		return doPreProcess(OWN);
	}

	public void setOWN( String OWN)
	{
		this.OWN=doPreProcess2(convertCode(OWN));
	}

	public String getUSU()
	{
		return doPreProcess(USU);
	}

	public void setUSU( String USU)
	{
		this.USU=doPreProcess2(convertCode(USU));
	}

	public String getDEPOSPOT()
	{
		return doPreProcess(DEPOSPOT);
	}

	public void setDEPOSPOT( String DEPOSPOT)
	{
		this.DEPOSPOT=doPreProcess2(convertCode(DEPOSPOT));
	}

	public int getQUAN()
	{
		return QUAN;
	}

	public void setQUAN( int QUAN)
	{
		this.QUAN=QUAN ;
	}

	public float getVALUE()
	{
		return VALUE;
	}

	public void setVALUE( float VALUE)
	{
		this.VALUE=VALUE ;
	}

	public String getASCST()
	{
		return doPreProcess(ASCST);
	}

	public void setASCST( String ASCST)
	{
		this.ASCST=doPreProcess2(convertCode(ASCST));
	}

	public String getPOSST()
	{
		return doPreProcess(POSST);
	}

	public void setPOSST( String POSST)
	{
		this.POSST=doPreProcess2(convertCode(POSST));
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
		String sqlSelect="SELECT * FROM DCDY_DYWXX_SQ"+" WHERE RECID="+RECID+" and OPENO='"+doPreProcess(OPENO)+"'";
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
	MORCONTNO=rsSelect.getString("MORCONTNO");
	RECID=rsSelect.getInt("RECID");
	GUANAME=rsSelect.getString("GUANAME");
	BRANDNAME=rsSelect.getString("BRANDNAME");
	TYPESPF=rsSelect.getString("TYPESPF");
	LEAFACDATE=String.valueOf(rsSelect.getDate("LEAFACDATE"));
	USERTERM=rsSelect.getInt("USERTERM");
	OWN=rsSelect.getString("OWN");
	USU=rsSelect.getString("USU");
	DEPOSPOT=rsSelect.getString("DEPOSPOT");
	QUAN=rsSelect.getInt("QUAN");
	VALUE=rsSelect.getFloat("VALUE");
	ASCST=rsSelect.getString("ASCST");
	POSST=rsSelect.getString("POSST");
	}

	public boolean doAdd() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd="INSERT INTO DCDY_DYWXX_SQ(OPENO,MORCONTNO,RECID,GUANAME,BRANDNAME,TYPESPF,LEAFACDATE,USERTERM,OWN,USU,DEPOSPOT,QUAN,VALUE,ASCST,POSST) VALUES("+ doPreProcess3(OPENO)+","+ doPreProcess3(MORCONTNO)+","+RECID+","+ doPreProcess3(GUANAME)+","+ doPreProcess3(BRANDNAME)+","+ doPreProcess3(TYPESPF)+",to_date("+doPreProcess3(LEAFACDATE)+",'yyyy-mm-dd'),"+USERTERM+","+ doPreProcess3(OWN)+","+ doPreProcess3(USU)+","+ doPreProcess3(DEPOSPOT)+","+QUAN+","+VALUE+","+ doPreProcess3(ASCST)+","+ doPreProcess3(POSST)+")";
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
		String sqlCount="SELECT COUNT(*) FROM DCDY_DYWXX_SQ"+" WHERE RECID="+RECID+" and OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlModify="UPDATE DCDY_DYWXX_SQ SET OPENO="+ doPreProcess3(OPENO)+",MORCONTNO="+ doPreProcess3(MORCONTNO)+",RECID="+RECID+",GUANAME="+ doPreProcess3(GUANAME)+",BRANDNAME="+ doPreProcess3(BRANDNAME)+",TYPESPF="+ doPreProcess3(TYPESPF)+",LEAFACDATE=to_date("+doPreProcess3(LEAFACDATE)+",'yyyy-mm-dd'),USERTERM="+USERTERM+",OWN="+ doPreProcess3(OWN)+",USU="+ doPreProcess3(USU)+",DEPOSPOT="+ doPreProcess3(DEPOSPOT)+",QUAN="+QUAN+",VALUE="+VALUE+",ASCST="+ doPreProcess3(ASCST)+",POSST="+ doPreProcess3(POSST)+""+" WHERE RECID="+RECID+" and OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlDelete="DELETE FROM DCDY_DYWXX_SQ"+" WHERE RECID="+RECID+" and OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlCount="SELECT COUNT(*) FROM DCDY_DYWXX_SQ";
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
		String sqlList="SELECT * FROM DCDY_DYWXX_SQ";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			DCDY_DYWXX_SQ bTable=new DCDY_DYWXX_SQ();
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
		String sqlList="SELECT * FROM DCDY_DYWXX_SQ";
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
			DCDY_DYWXX_SQ bTable=new DCDY_DYWXX_SQ();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlArr="SELECT * FROM DCDY_DYWXX_SQ"+" WHERE RECID="+RECID+" and OPENO='"+doPreProcess(OPENO)+"'";
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
	public int getListMax(String sqlWhere ) throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlCount="SELECT MAX(RECID) FROM DCDY_DYWXX_SQ ";
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
}
