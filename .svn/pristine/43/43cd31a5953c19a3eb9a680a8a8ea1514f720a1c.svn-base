package com.macrosoft.icms.ggxkz;
import java.sql.*;
import java.util.*;
import com.macrosoft.icms.dbc.*;
import com.macrosoft.icms.system.*;
public class GGGL_JYDW_JYQK
{
	String ACTCON;
	String ADBULICNO;
	int INSYEAR;
	float ADOPEINC;
	float FORBUSIADINC;
	float RATAL;
	float NETINC;
	float DEFICIT;
	String ADNAME;
	int ISSDEG;
	float GDBUSINC;
	String REMARK;
	float HWBUSINC;
	int EXHPLAQUAN;
	int EDISUQUAN;
	int LAMPBOXQUAN;
	int NELQUAN;
	int OTHQUAN;
	int UNDDEG;
	float LSBUSINC;
	String ILLEGAL;
	String IMPROVEMENT;
	public String getACTCON()
	{
		return doPreProcess(ACTCON);
	}

	public void setACTCON( String ACTCON)
	{
		this.ACTCON=doPreProcess2(convertCode(ACTCON));
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

	public float getADOPEINC()
	{
		return ADOPEINC;
	}

	public void setADOPEINC( float ADOPEINC)
	{
		this.ADOPEINC=ADOPEINC ;
	}

	public float getFORBUSIADINC()
	{
		return FORBUSIADINC;
	}

	public void setFORBUSIADINC( float FORBUSIADINC)
	{
		this.FORBUSIADINC=FORBUSIADINC ;
	}

	public float getRATAL()
	{
		return RATAL;
	}

	public void setRATAL( float RATAL)
	{
		this.RATAL=RATAL ;
	}

	public float getNETINC()
	{
		return NETINC;
	}

	public void setNETINC( float NETINC)
	{
		this.NETINC=NETINC ;
	}

	public float getDEFICIT()
	{
		return DEFICIT;
	}

	public void setDEFICIT( float DEFICIT)
	{
		this.DEFICIT=DEFICIT ;
	}

	public String getADNAME()
	{
		return doPreProcess(ADNAME);
	}

	public void setADNAME( String ADNAME)
	{
		this.ADNAME=doPreProcess2(convertCode(ADNAME));
	}

	public int getISSDEG()
	{
		return ISSDEG;
	}

	public void setISSDEG( int ISSDEG)
	{
		this.ISSDEG=ISSDEG ;
	}

	public float getGDBUSINC()
	{
		return GDBUSINC;
	}

	public void setGDBUSINC( float GDBUSINC)
	{
		this.GDBUSINC=GDBUSINC ;
	}

	public String getREMARK()
	{
		return doPreProcess(REMARK);
	}

	public void setREMARK( String REMARK)
	{
		this.REMARK=doPreProcess2(convertCode(REMARK));
	}

	public float getHWBUSINC()
	{
		return HWBUSINC;
	}

	public void setHWBUSINC( float HWBUSINC)
	{
		this.HWBUSINC=HWBUSINC ;
	}

	public int getEXHPLAQUAN()
	{
		return EXHPLAQUAN;
	}

	public void setEXHPLAQUAN( int EXHPLAQUAN)
	{
		this.EXHPLAQUAN=EXHPLAQUAN ;
	}

	public int getEDISUQUAN()
	{
		return EDISUQUAN;
	}

	public void setEDISUQUAN( int EDISUQUAN)
	{
		this.EDISUQUAN=EDISUQUAN ;
	}

	public int getLAMPBOXQUAN()
	{
		return LAMPBOXQUAN;
	}

	public void setLAMPBOXQUAN( int LAMPBOXQUAN)
	{
		this.LAMPBOXQUAN=LAMPBOXQUAN ;
	}

	public int getNELQUAN()
	{
		return NELQUAN;
	}

	public void setNELQUAN( int NELQUAN)
	{
		this.NELQUAN=NELQUAN ;
	}

	public int getOTHQUAN()
	{
		return OTHQUAN;
	}

	public void setOTHQUAN( int OTHQUAN)
	{
		this.OTHQUAN=OTHQUAN ;
	}

	public int getUNDDEG()
	{
		return UNDDEG;
	}

	public void setUNDDEG( int UNDDEG)
	{
		this.UNDDEG=UNDDEG ;
	}

	public float getLSBUSINC()
	{
		return LSBUSINC;
	}

	public void setLSBUSINC( float LSBUSINC)
	{
		this.LSBUSINC=LSBUSINC ;
	}
	
	public String getILLEGAL()
	{
		return doPreProcess(ILLEGAL);
	}

	public void setILLEGAL( String ILLEGAL)
	{
		this.ILLEGAL=doPreProcess2(convertCode(ILLEGAL));
	}
	
	public String getIMPROVEMENT()
	{
		return doPreProcess(IMPROVEMENT);
	}

	public void setIMPROVEMENT( String IMPROVEMENT)
	{
		this.IMPROVEMENT=doPreProcess2(convertCode(IMPROVEMENT));
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
		String sqlSelect="SELECT * FROM GGGL_JYDW_JYQK"+" WHERE INSYEAR="+INSYEAR+" and ADBULICNO='"+doPreProcess(ADBULICNO)+"'";
		rsSelect=dbc.executeQuery(sqlSelect);
		if(rsSelect.next())
		{
			doSetData( rsSelect );
		}
		dbc.close();
	}

	public void doSetData( ResultSet rsSelect ) throws SQLException
	{
	ACTCON=rsSelect.getString("ACTCON");
	ADBULICNO=rsSelect.getString("ADBULICNO");
	INSYEAR=rsSelect.getInt("INSYEAR");
	ADOPEINC=rsSelect.getFloat("ADOPEINC");
	FORBUSIADINC=rsSelect.getFloat("FORBUSIADINC");
	RATAL=rsSelect.getFloat("RATAL");
	NETINC=rsSelect.getFloat("NETINC");
	DEFICIT=rsSelect.getFloat("DEFICIT");
	ADNAME=rsSelect.getString("ADNAME");
	ISSDEG=rsSelect.getInt("ISSDEG");
	GDBUSINC=rsSelect.getFloat("GDBUSINC");
	REMARK=rsSelect.getString("REMARK");
	HWBUSINC=rsSelect.getFloat("HWBUSINC");
	EXHPLAQUAN=rsSelect.getInt("EXHPLAQUAN");
	EDISUQUAN=rsSelect.getInt("EDISUQUAN");
	LAMPBOXQUAN=rsSelect.getInt("LAMPBOXQUAN");
	NELQUAN=rsSelect.getInt("NELQUAN");
	OTHQUAN=rsSelect.getInt("OTHQUAN");
	UNDDEG=rsSelect.getInt("UNDDEG");
	LSBUSINC=rsSelect.getFloat("LSBUSINC");
	ILLEGAL=rsSelect.getString("ILLEGAL");
	IMPROVEMENT=rsSelect.getString("IMPROVEMENT");
	}

	public boolean doAdd() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlAdd="INSERT INTO GGGL_JYDW_JYQK(ACTCON,ADBULICNO,INSYEAR,ADOPEINC,FORBUSIADINC,RATAL,NETINC,DEFICIT,ADNAME,ISSDEG,GDBUSINC,REMARK,HWBUSINC,EXHPLAQUAN,EDISUQUAN,LAMPBOXQUAN,NELQUAN,OTHQUAN,UNDDEG,LSBUSINC,ILLEGAL,IMPROVEMENT) VALUES("+ doPreProcess3(ACTCON)+","+ doPreProcess3(ADBULICNO)+","+INSYEAR+","+ADOPEINC+","+FORBUSIADINC+","+RATAL+","+NETINC+","+DEFICIT+","+ doPreProcess3(ADNAME)+","+ISSDEG+","+GDBUSINC+","+ doPreProcess3(REMARK)+","+HWBUSINC+","+EXHPLAQUAN+","+EDISUQUAN+","+LAMPBOXQUAN+","+NELQUAN+","+OTHQUAN+","+UNDDEG+","+LSBUSINC+","+doPreProcess3(ILLEGAL)+","+doPreProcess3(IMPROVEMENT)+")";
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
		String sqlCount="SELECT COUNT(*) FROM GGGL_JYDW_JYQK"+" WHERE INSYEAR="+INSYEAR+" and ADBULICNO='"+doPreProcess(ADBULICNO)+"'";
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
		String sqlModify="UPDATE GGGL_JYDW_JYQK SET ACTCON="+ doPreProcess3(ACTCON)+",ADBULICNO="+ doPreProcess3(ADBULICNO)+",INSYEAR="+INSYEAR+",ADOPEINC="+ADOPEINC+",FORBUSIADINC="+FORBUSIADINC+",RATAL="+RATAL+",NETINC="+NETINC+",DEFICIT="+DEFICIT+",ADNAME="+ doPreProcess3(ADNAME)+",ISSDEG="+ISSDEG+",GDBUSINC="+GDBUSINC+",REMARK="+ doPreProcess3(REMARK)+",HWBUSINC="+HWBUSINC+",EXHPLAQUAN="+EXHPLAQUAN+",EDISUQUAN="+EDISUQUAN+",LAMPBOXQUAN="+LAMPBOXQUAN+",NELQUAN="+NELQUAN+",OTHQUAN="+OTHQUAN+",UNDDEG="+UNDDEG+",LSBUSINC="+LSBUSINC+",ILLEGAL="+doPreProcess3(ILLEGAL)+",IMPROVEMENT="+doPreProcess3(IMPROVEMENT)+" WHERE INSYEAR="+INSYEAR+" and ADBULICNO='"+doPreProcess(ADBULICNO)+"'";
		int nRowCount=dbc.executeUpdate( sqlModify );
		dbc.close();
		if (nRowCount>0)	//修改成功
		{
			return true;
		}
		else
			return false;
	}
	public boolean doJBModify() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlModify="UPDATE GGGL_JYDW_JYQK SET ADBULICNO="+ doPreProcess3(ADBULICNO)+",INSYEAR="+INSYEAR+",ADOPEINC="+ADOPEINC+",FORBUSIADINC="+FORBUSIADINC+",RATAL="+RATAL+",NETINC="+NETINC+",DEFICIT="+DEFICIT+" WHERE INSYEAR="+INSYEAR+" and ADBULICNO='"+doPreProcess(ADBULICNO)+"'";
		int nRowCount=dbc.executeUpdate( sqlModify );
		dbc.close();
		if (nRowCount>0)	//修改成功
		{
			return true;
		}
		else
			return false;
	}
	public boolean doQTModify() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlModify="UPDATE GGGL_JYDW_JYQK SET ACTCON="+ doPreProcess3(ACTCON)+",ADBULICNO="+ doPreProcess3(ADBULICNO)+",INSYEAR="+INSYEAR+",ADNAME="+ doPreProcess3(ADNAME)+",ISSDEG="+ISSDEG+",GDBUSINC="+GDBUSINC+",REMARK="+ doPreProcess3(REMARK)+",HWBUSINC="+HWBUSINC+",EXHPLAQUAN="+EXHPLAQUAN+",EDISUQUAN="+EDISUQUAN+",LAMPBOXQUAN="+LAMPBOXQUAN+",NELQUAN="+NELQUAN+",OTHQUAN="+OTHQUAN+",UNDDEG="+UNDDEG+",LSBUSINC="+LSBUSINC+",ILLEGAL="+doPreProcess3(ILLEGAL)+",IMPROVEMENT="+doPreProcess3(IMPROVEMENT)+" WHERE INSYEAR="+INSYEAR+" and ADBULICNO='"+doPreProcess(ADBULICNO)+"'";
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
		String sqlDelete="DELETE FROM GGGL_JYDW_JYQK"+" WHERE INSYEAR="+INSYEAR+" and ADBULICNO='"+doPreProcess(ADBULICNO)+"'";
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
		String sqlCount="SELECT COUNT(*) FROM GGGL_JYDW_JYQK";
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
		String sqlList="SELECT * FROM GGGL_JYDW_JYQK";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			GGGL_JYDW_JYQK bTable=new GGGL_JYDW_JYQK();
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
		String sqlList="SELECT * FROM GGGL_JYDW_JYQK";
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
			GGGL_JYDW_JYQK bTable=new GGGL_JYDW_JYQK();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;
	}

	public ArrayList getData() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlArr="SELECT * FROM GGGL_JYDW_JYQK"+" WHERE INSYEAR="+INSYEAR+" and ADBULICNO='"+doPreProcess(ADBULICNO)+"'";
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
