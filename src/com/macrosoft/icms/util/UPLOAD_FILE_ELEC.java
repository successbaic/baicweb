package com.macrosoft.icms.util;
import java.io.FileInputStream;
import java.io.InputStream;
import java.security.MessageDigest;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import com.macrosoft.icms.dbc.DbConnection;
import com.macrosoft.icms.system.SysUtility;
public class UPLOAD_FILE_ELEC
{
	String OPENO;
	String WJID;
	String FILEID;
	String FILEPATH;
	String FILENAME;
	String FILESIZE;
	String ATTACHPER;
	String ATTACHDATE;
	String FILEDES;
	String REMARKS;
	int WJBH;
	public String getOPENO()
	{
		return doPreProcess(OPENO);
	}

	public void setOPENO( String OPENO)
	{
		this.OPENO=doPreProcess2(convertCode(OPENO));
	}

	public String getWJID() {
		return WJID;
	}

	public void setWJID(String wJID) {
		WJID = wJID;
	}

	public String getFILEID()
	{
		return doPreProcess(FILEID);
	}

	public void setFILEID( String FILEID)
	{
		this.FILEID=doPreProcess2(convertCode(FILEID));
	}

	public String getFILEPATH()
	{
		return doPreProcess(FILEPATH);
	}

	public void setFILEPATH( String FILEPATH)
	{
		this.FILEPATH=doPreProcess2(convertCode(FILEPATH));
	}
	
	public String getFILENAME()
	{
		return doPreProcess(FILENAME);
	}

	public void setFILENAME( String FILENAME)
	{
		this.FILENAME=doPreProcess2(FILENAME);
	}

	public String getFILESIZE()
	{
		return doPreProcess(FILESIZE);
	}

	public void setFILESIZE( String FILESIZE)
	{
		this.FILESIZE=doPreProcess2(convertCode(FILESIZE));
	}
	
	public String getATTACHPER()
	{
		return doPreProcess(ATTACHPER);
	}

	public void setATTACHPER( String ATTACHPER)
	{
		this.ATTACHPER=doPreProcess2(convertCode(ATTACHPER));
	}
	
	public String getATTACHDATE()
	{
		return doPreProcess(ATTACHDATE);
	}

	public void setATTACHDATE( String ATTACHDATE)
	{
		this.ATTACHDATE=doPreProcess2(ATTACHDATE);
	}

	public String getFILEDES()
	{
		return doPreProcess(FILEDES);
	}

	public void setFILEDES( String FILEDES)
	{
		this.FILEDES=doPreProcess2(FILEDES);
	}
	
	public String getREMARKS()
	{
		return doPreProcess(REMARKS);
	}

	public void setREMARKS( String REMARKS)
	{
		this.REMARKS=doPreProcess2(REMARKS);
	}
	public int getWJBH()
	{
		return WJBH;
	}

	public void setWJBH( int WJBH)
	{
		this.WJBH=WJBH ;
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
		String sqlSelect="SELECT * FROM UPLOAD_FILE_ELEC"+" WHERE FILEID='"+doPreProcess(FILEID)+"' and OPENO='"+doPreProcess(OPENO)+"'";
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
	FILEID=rsSelect.getString("FILEID");
	FILEPATH=rsSelect.getString("FILEPATH");
	FILENAME=rsSelect.getString("FILENAME");
	FILESIZE=rsSelect.getString("FILESIZE");
	ATTACHPER=rsSelect.getString("ATTACHPER");
	ATTACHDATE=rsSelect.getString("ATTACHDATE");
	FILEDES=rsSelect.getString("FILEDES");
	REMARKS=rsSelect.getString("REMARKS");
	WJBH=rsSelect.getInt("WJBH");
	}

	public boolean doAdd(String WJID) throws SQLException
	{
		System.out.println(WJID+"*********************");
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sql="SELECT COUNT(*) FROM UPLOAD_FILE_ELEC WHERE WJID='"+WJID+"' AND OPENO='"+OPENO+"'" ;
		ResultSet rs=dbc.executeQuery(sql);
		int num=0;
		if(rs.next()){
			num=rs.getInt(1);
		}
		if(num>0)
		{
		   sql="UPDATE  UPLOAD_FILE_ELEC SET FILEID ="+ doPreProcess3(FILEID)+",FILEPATH="+ doPreProcess3(FILEPATH)+",FILENAME="+ doPreProcess3(FILENAME)+",FILESIZE ="+ doPreProcess3(FILESIZE)+",ATTACHDATE ="+ doPreProcess3(ATTACHDATE)+",FILEDES ="+ doPreProcess3(FILEDES)+",REMARKS =''  WHERE WJID="+doPreProcess3(WJID) +" AND OPENO="+doPreProcess3(OPENO);
		 }else{
		   sql="INSERT INTO UPLOAD_FILE_ELEC(OPENO,WJID,FILEID,FILEPATH,FILENAME,FILESIZE,ATTACHPER,ATTACHDATE,FILEDES,REMARKS,WJBH) VALUES("+ doPreProcess3(OPENO)+","+ doPreProcess3(WJID)+","+ doPreProcess3(FILEID)+","+ doPreProcess3(FILEPATH)+","+ doPreProcess3(FILENAME)+","+ doPreProcess3(FILESIZE)+","+doPreProcess3(ATTACHPER)+","+doPreProcess3(ATTACHDATE)+","+ doPreProcess3(FILEDES)+","+doPreProcess3(REMARKS)+","+WJBH+")";
		 }						
		nRowCount=dbc.executeUpdate( sql );
		dbc.close();
		if (nRowCount>0){	//插入成功
				return true;
		}else{
				return false;
		}
     }
	

	public boolean doCount() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;
		String sqlCount="SELECT COUNT(*) FROM UPLOAD_FILE_ELEC"+" WHERE FILEID='"+doPreProcess(FILEID)+"' and OPENO='"+doPreProcess(OPENO)+"'";
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
		String sqlModify="UPDATE UPLOAD_FILE_ELEC SET OPENO="+ doPreProcess3(OPENO)+",FILEID="+ doPreProcess3(FILEID)+",FILEPATH="+ doPreProcess3(FILEPATH)+",FILENAME="+ doPreProcess3(FILENAME)+",FILESIZE="+ doPreProcess3(FILESIZE)+",ATTACHPER="+doPreProcess3(ATTACHPER)+",ATTACHDATE="+doPreProcess3(ATTACHDATE)+",FILEDES="+ doPreProcess3(FILEDES)+",REMARKS="+doPreProcess3(REMARKS)+" WHERE FILEID='"+doPreProcess(FILEID)+"' and OPENO='"+doPreProcess(OPENO)+"'";
		int nRowCount=dbc.executeUpdate( sqlModify );
		dbc.close();
		if (nRowCount>0)	//修改成功
		{
			return true;
		}
		else
			return false;
	}

	public boolean doDelete(String fileid,String openo) throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlDelete="DELETE FROM UPLOAD_FILE_ELEC"+" WHERE FILEID='"+fileid+"' and OPENO='"+openo+"'";
		int nRowCount=dbc.executeUpdate( sqlDelete );
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

	public int getListCount(String sqlWhere ) throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlCount="SELECT COUNT(*) FROM UPLOAD_FILE_ELEC";
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
		String sqlList="SELECT * FROM UPLOAD_FILE_ELEC";
		if (sqlWhere!=null&&sqlWhere.trim().compareTo("")!=0){
			if (sqlWhere.trim().toUpperCase().startsWith("WHERE")){
				sqlList+=sqlWhere;}
			else {
				sqlList+=" WHERE "+sqlWhere;}
		}
		ResultSet rsList=dbc.executeQuery( sqlList );
		while(rsList.next()) {
			UPLOAD_FILE_ELEC bTable=new UPLOAD_FILE_ELEC();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}

	/**
	 * 获取上传文件的哈希值
	 * @param fileName
	 * @return
	 * @throws Exception
	 */
	public String getHash(String fileName)throws Exception
	{
	        InputStream fis = new FileInputStream(fileName);
	        byte buffer[] = new byte[1024];
	        MessageDigest md5 = MessageDigest.getInstance("MD5");
	        int numRead;
	        do {
	               numRead = fis.read(buffer);
	               if (numRead > 0) {
	            	   md5.update(buffer, 0, numRead);
	               }
	        } while (numRead != -1);
	        fis.close();
	        
	        byte[] b =md5.digest();
	        String result = "";
	        for (int i=0; i < b.length; i++) {
	               result += Integer.toString( ( b[i] & 0xff ) + 0x100, 16).substring( 1 );
	          }
	        return result;
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
		String sqlList="SELECT * FROM UPLOAD_FILE_ELEC";
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
			UPLOAD_FILE_ELEC bTable=new UPLOAD_FILE_ELEC();
			bTable.doSetData( rsList );
			al.add(bTable);
		}
		rsList.close();dbc.close();
		return al;

	}

	public ArrayList getData() throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlArr="SELECT * FROM UPLOAD_FILE_ELEC"+" WHERE FILEID='"+doPreProcess(FILEID)+"' and OPENO='"+doPreProcess(OPENO)+"'";
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
	public String getFileid(int wjbh,String openo) throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String sqlArr="SELECT FILEID FROM UPLOAD_FILE_ELEC"+" WHERE OPENO='"+doPreProcess(openo)+"' and WJBH="+wjbh;
		System.out.println("sql22="+sqlArr);
		ResultSet rsArr=dbc.executeQuery(sqlArr);
		String fileid="";
		if (rsArr.next())
		{
			fileid=rsArr.getString(1);
		}
		System.out.println("fileid="+fileid);
		dbc.close();
		return fileid;
	}
}
