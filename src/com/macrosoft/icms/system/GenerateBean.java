
package com.macrosoft.icms.system;

import java.sql.*;
import java.util.*;
import java.lang.*;
import java.io.*;

public class GenerateBean 
{
	//String driverClassName="org.gjt.mm.mysql.Driver"; //mysql
	//String driverClassName="com.microsoft.jdbc.sqlserver.SQLServerDriver"; //sql server
	String driverClassName="oracle.jdbc.driver.OracleDriver"; //oracle
	//String connStr="jdbc:mysql://192.168.1.158/ccol";  //mysql
	//String connStr="jdbc:microsoft:sqlserver://192.168.1.2;DatabaseName=ccol";  //sql server
	//String connStr="jdbc:oracle:thin:@10.48.34.152:1521:orcl";  //oracle
	String connStr="jdbc:oracle:thin:@10.110.1.108:1521:orcl";  //oracle
//	String connStr="jdbc:oracle:thin:@10.48.44.67:1521:ORCL";  //oracle
	String user="szhyyw";
	String pwd="111111";
	Connection conn=null;
	ResultSet rs=null;
	Statement stmt=null;
	String ssqlAdd, ssqlUpdate, ssqlDelete, ssqlSelect,ssqlcol;	//SQL语句存放
	Vector vPrimaryKey;
	Vector vColumnType;
	String sClassName, sTableName, sClassPath, sPackageName;
	String sErrorPage, sReturnPage, sReturnPage2;

	//初始化函数，加载数据库驱动
	public GenerateBean()
	{
		
	}

	public ResultSet executeQuery( String sqlQuery ) throws SQLException
	{
		try
		{
			Driver driver = (Driver)
			Class.forName(driverClassName).newInstance();
			DriverManager.registerDriver(driver);
		}
		catch ( Exception e)
		{
			System.err.println( "GenerateBean Error: " + e.getMessage() );
		}		
		try
		{
			System.out.println(sqlQuery);
			conn=DriverManager.getConnection( connStr, user, pwd );
			stmt=conn.createStatement();
			rs=stmt.executeQuery( sqlQuery );
						
		}
		catch ( SQLException e )
		{
			System.err.println( "ExecuteQuery Error: " + e.getMessage() );
			throw(e);
		}
		return rs;
	}
	String getJavaType( String sColumnXType )
	{
		String sJavaType;
		if( sColumnXType.equals("IMAGE") ) 
			return "image";
		else if ( sColumnXType.equals("CHAR")|| sColumnXType.equals("VARCHAR2")||sColumnXType.equals("VARCHAR")||sColumnXType.equals("TEXT"))
			return "String";
		else if ( sColumnXType.equals("DATETIME")||sColumnXType.equals("DATE") )
			return "datetime";
		else if ( sColumnXType.equals("INT")||sColumnXType.equals("BIGINT")||sColumnXType.equals("TINYINT")||sColumnXType.equals("INTEGER"))
			return "int";
		else if ( sColumnXType.equals("FLOAT")||sColumnXType.equals("DECIMAL")||sColumnXType.equals("NUMBER") )
			return "float";
		else if ( sColumnXType.equals("DOUBLE"))
			return "double";	
		else 
			return "String";			
	}


	public void GenerateColumnType()
	{ 
		//生成SQL语句
		int nColumnType;
		String sqlInsert,sqlInsert2, sqlSelect, sqlUpdate;
		ResultSet rsColumns;
		String sColumnName;
		String sColumnXType;

		vColumnType=new Vector();
		try
		{
			/* for mysql*/
			//rsColumns=executeQuery( "SELECT COLUMN_NAME,DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='" + sTableName + "'");
			/* for sql server*/
			//rsColumns=executeQuery( "select [name],type=(select [name] from systypes where systypes.xtype=syscolumns.xtype) from syscolumns where id=OBJECT_ID ('"+sTableName+"')");
			/* for oracle*/
			
			rsColumns=executeQuery( "select COLUMN_NAME,DECODE(DATA_TYPE,'NUMBER',DECODE(DATA_SCALE,0,'INT',null,'INT',DATA_TYPE),DATA_TYPE )DATA_TYPE from user_tab_columns where TABLE_NAME='"+sTableName+"'");
			
			while ( rsColumns.next() )
			{
				sColumnName=rsColumns.getString( 1 ).toUpperCase();
				sColumnXType=rsColumns.getString( 2 ).toUpperCase();				
				vColumnType.add( sColumnName );
				vColumnType.add( sColumnXType );
			}			
			rsColumns.close();
		}
		catch( SQLException e )
		{
			System.out.println( "SQLException:" + e.getMessage() );
		}
	}
	
	public void GenerateSetGetFunction()
	{
		ResultSet rsColumns;
		String sColumnName;
		String sColumnXType;
		String sJavaType;
		
		//生成get,set函数
		try
		{
			//for mysql
			//rsColumns=executeQuery( "SELECT COLUMN_NAME,DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='" + sTableName + "'");
			/* for sql server*/
			//rsColumns=executeQuery( "select [name],type=(select [name] from systypes where systypes.xtype=syscolumns.xtype) from syscolumns where id=OBJECT_ID ('"+sTableName+"')");
			/* for oracle*/
			rsColumns=executeQuery( "select COLUMN_NAME, DECODE(DATA_TYPE,'NUMBER',DECODE(DATA_SCALE,0,'INT',null,'INT',DATA_TYPE),DATA_TYPE )DATA_TYPE from user_tab_columns where TABLE_NAME='"+sTableName+"'");
			
			while ( rsColumns.next() )
			{
				sColumnName=(rsColumns.getString( 1 )).toUpperCase();
				sColumnXType=(rsColumns.getString( 2 )).toUpperCase();
				sJavaType=getJavaType(sColumnXType);
				if (sJavaType.equals("datetime"))
				{
					sJavaType="String";
				}
				FileOutput( "	public " + sJavaType + " get" + sColumnName.trim() + "()" );
				FileOutput( "	{" );
				if (sJavaType.equals("String"))	//字符串
				{
					FileOutput( "		return doPreProcess(" + sColumnName.trim() + ");" );
				}
				else if (sJavaType.equals("datetime"))	//日期型
				{
					FileOutput( "		return doPreProcess(" + sColumnName.trim() + ");" );
				}
				else
					FileOutput( "		return " + sColumnName.trim() + ";" );
				FileOutput( "	}" );
				FileOutput("");
				FileOutput( "	public void set" + sColumnName.trim() + "( " + sJavaType + " " + sColumnName.trim() + ")" );
				FileOutput( "	{" );
				if (sJavaType.equals("String") )	//字符串
				{
					FileOutput( "		this." +sColumnName.trim() + "=doPreProcess2(convertCode(" + sColumnName.trim() + "));"  );
				}
				else
					FileOutput( "		this." +sColumnName.trim() + "=" + sColumnName.trim() + " ;"  );
				FileOutput( "	}" );
				FileOutput("");	
			}
			rsColumns.close();
		}
		catch (SQLException e)
		{
			System.err.println( "GenerateBean Error " + e.getMessage() );
		}
	}
		
	public void finalize()
	{
	}

	//设置数据源名
	public void setConnStr( String sconame )
	{	connStr=sconame;	}

	//设置数据源名
	public void setPackageName( String spname )
	{	sPackageName=spname;	}

	//设置类路径
	public void setClassPath( String scpname )
	{	sClassPath=scpname;	}

	//设置类名
	public void setClassName( String scname )
	{	sClassName=scname;	}

	//设置表名
	public void setTableName( String stname )
	{	sTableName=stname;	}

	//获得表的主键
	public void GetPrimaryKey()
	{
		ResultSet rsPrimaryKey;

		vPrimaryKey=new Vector();
		try
		{
			//for mysql
			//rsPrimaryKey=executeQuery( "SELECT COLUMN_NAME,DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='" + sTableName + "' AND COLUMN_KEY='PRI'");
			/* for sql server*/
			//rsPrimaryKey=executeQuery( " sp_pkeys '"+sTableName+"'");
			//for oracle
			rsPrimaryKey=executeQuery("select distinct b.COLUMN_NAME from user_constraints a,dba_cons_columns b where b.TABLE_NAME=a.TABLE_NAME and a.CONSTRAINT_TYPE='P' and a.CONSTRAINT_NAME=b.CONSTRAINT_NAME and a.TABLE_NAME='"+sTableName+"'");
			while (rsPrimaryKey.next())
			{
				//mysql
				//vPrimaryKey.add( (rsPrimaryKey.getString(1)).toUpperCase() );
				//vPrimaryKey.add( (rsPrimaryKey.getString(2)).toUpperCase() );
				/* sql server*/
				String COLUMN_NAME=(rsPrimaryKey.getString("COLUMN_NAME")).toUpperCase();					
				ResultSet rsType=executeQuery("select DECODE(DATA_TYPE,'NUMBER',DECODE(DATA_SCALE,0,'INT',null,'INT',DATA_TYPE),DATA_TYPE )DATA_TYPE from user_tab_columns where table_name='"+sTableName+"' and COLUMN_NAME='"+COLUMN_NAME+"'");
				if (rsType.next())
				{
					vPrimaryKey.add(COLUMN_NAME);
					vPrimaryKey.add(rsType.getString(1).toUpperCase());
				}
				
			}
		}
		catch (SQLException e )
		{
			System.out.println( "SQLException : " + e.getMessage() );
		}
	}

	public String GenerateWhere()
	{
		String sqlWhere;
		int nSize;
		int i;
		String sColumnName;
		String sColumnXType;

		GetPrimaryKey();
		sqlWhere="\" WHERE ";
		nSize=vPrimaryKey.size();
		if (nSize==0)
		{
			FileOutput( "主键错误，该表没有主键，不能运行！" );
			sqlWhere="";
			return sqlWhere;
		}
		for( i=0; i<nSize; i=i+2 )
		{
			sColumnName=(String)vPrimaryKey.elementAt(i);
			sColumnXType=(String)vPrimaryKey.elementAt(i+1);
			if( getJavaType(sColumnXType).equals("String")) 
				sqlWhere=sqlWhere + sColumnName + "='\"" + "+doPreProcess(" + sColumnName + ")+\"' and ";
			else if( getJavaType(sColumnXType).equals("int")) 
				sqlWhere=sqlWhere + sColumnName + "=\"+" + sColumnName + "+\" and ";
			else if( getJavaType(sColumnXType).equals("double")) 
				sqlWhere=sqlWhere + sColumnName + "=\"+" + sColumnName + "+\" and ";
			else if( getJavaType(sColumnXType).equals("float")) 
				sqlWhere=sqlWhere + sColumnName + "=\"+" + sColumnName + "+\" and ";
			else if( getJavaType(sColumnXType).equals("datatime")) 
				sqlWhere=sqlWhere + sColumnName + "='\"" + "+doPreProcess(" + sColumnName + ")+\"' and ";
			else
				sqlWhere=sqlWhere + sColumnName + "='\"" + "+doPreProcess(" + sColumnName + ")+\"' and ";
		}
		sqlWhere=sqlWhere.substring(0,sqlWhere.length()-5)+"\"";
		return sqlWhere;
	}

	public void WriteBeanHeader()
	{
		FileOutput( "package " + sPackageName +";");
		FileOutput( "import java.sql.*;" );
		FileOutput( "import java.util.*;" );
		FileOutput( "import com.macrosoft.icms.dbc.*;" );
		FileOutput( "import com.macrosoft.icms.*;" );
		FileOutput( "import com.macrosoft.icms.system.*;" );

		FileOutput( "public class " + sClassName  );
		FileOutput( "{" );
	}

	public void WriteBeanFooter()
	{
		FileOutput( "}" );	
	}

	public void WriteColumnDefine()
	{
		ResultSet rsColumns;
		String sColumnName;
		String sColumnXType;

		//生成字段声明
		try
		{
			//for mysql
			//rsColumns=executeQuery( "SELECT COLUMN_NAME,DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='" + sTableName + "'");
			/* for sql server*/
			//rsColumns=executeQuery( "select [name],type=(select [name] from systypes where systypes.xtype=syscolumns.xtype) from syscolumns where id=OBJECT_ID ('"+sTableName+"')");
			/* for oracle*/
			rsColumns=executeQuery( "select COLUMN_NAME,DECODE(DATA_TYPE,'NUMBER',DECODE(DATA_SCALE,0,'INT',null,'INT',DATA_TYPE),DATA_TYPE )DATA_TYPE from user_tab_columns where TABLE_NAME='"+sTableName+"'");
			
			while ( rsColumns.next() )
			{
				sColumnName=(rsColumns.getString( 1 )).toUpperCase();
				sColumnXType=(rsColumns.getString( 2 )).toUpperCase();
				String dType= getJavaType(sColumnXType);
				if (dType.equals("datetime"))
				{
					dType="String";
				}
				FileOutput( "	" +dType+ " " + sColumnName.trim() + ";" );
			}
			rsColumns.close();
		}
		catch (SQLException e)
		{
			System.err.println( "GenerateBean Error " + e.getMessage() );
		}
	}

	//生成四条SQL语句
	public void GenerateSQL()
	{
		//生成SQL语句
		int nColumnType;
		String sqlInsert,sqlInsert2, sqlSelect, sqlUpdate,sqlCol;
		ResultSet rsColumns,rsIdentity;
		String sColumnName;
		String sColumnXType;
		String sColumnKey;
		String sqlWhere;

		//初始化		
		sqlInsert="\"INSERT INTO " + sTableName + "(";
		sqlInsert2=" VALUES(";
		sqlSelect="\"SELECT ";
		sqlUpdate="\"UPDATE " + sTableName + " SET ";
		sqlCol="";
		try
		{
			//for mysql
			//rsColumns=executeQuery( "SELECT COLUMN_NAME,DATA_TYPE,EXTRA FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='" + sTableName + "'");
			/* for sql server*/
			//rsColumns=executeQuery( "select [name],type=(select [name] from systypes where systypes.xtype=syscolumns.xtype),colstat from syscolumns where id=OBJECT_ID ('"+sTableName+"')");
			/* for oracle*/
			rsColumns=executeQuery( "select COLUMN_NAME,DECODE(DATA_TYPE,'NUMBER',DECODE(DATA_SCALE,0,'INT',null,'INT',DATA_TYPE),DATA_TYPE )DATA_TYPE,0 from user_tab_columns where TABLE_NAME='"+sTableName+"'");
			
			while ( rsColumns.next() )
			{
				sColumnName=(rsColumns.getString( 1 )).toUpperCase();
				sColumnXType=(rsColumns.getString( 2 )).toUpperCase();
				sColumnKey=(rsColumns.getString( 3 )).toUpperCase(); 
				if( getJavaType(sColumnXType).equals("String") )
				{					
					
					//if (!sColumnKey.equals("auto_increment")) //mysql
					//sql server oracle
					if (!sColumnKey.equals("1")) 
					{
						sqlInsert=sqlInsert + sColumnName + ",";
						sqlInsert2=sqlInsert2 + "\"+ doPreProcess3("+sColumnName+")+\",";	
						sqlUpdate=sqlUpdate + sColumnName + "=\"+ doPreProcess3("+sColumnName+")+\",";					
					}
					sqlSelect=sqlSelect + sColumnName + ",";					
					sqlCol+=sColumnName + ",";
				}
				else if( getJavaType(sColumnXType).equals("datetime") )
				{					
					
					//if (!sColumnKey.equals("auto_increment")) //mysql
					//sql server oracle
					if (!sColumnKey.equals("1")) 
					{
						sqlInsert=sqlInsert + sColumnName + ",";
						//sql server
						//sqlInsert2=sqlInsert2 + "\"+ doPreProcess3("+sColumnName+")+\",";	
						//sqlUpdate=sqlUpdate + sColumnName + "=\"+ doPreProcess3("+sColumnName+")+\",";
						//oracle to_date('2001-12-12','yyyy-mm-dd')
						sqlInsert2=sqlInsert2 + "to_date(\"+doPreProcess3("+sColumnName+")+\",'yyyy-mm-dd'),";	
						sqlUpdate=sqlUpdate + sColumnName + "=to_date(\"+doPreProcess3("+sColumnName+")+\",'yyyy-mm-dd'),";
					}
					sqlSelect=sqlSelect + sColumnName + ",";					
					sqlCol+=sColumnName + ",";
				}
				else if( getJavaType(sColumnXType).equals("int")|| getJavaType(sColumnXType).equals("double")|| getJavaType(sColumnXType).equals("float") ) //Int
				{
					//if (!sColumnKey.equals("auto_increment")) //mysql
					//sql server
					if (!sColumnKey.equals("1")) 
					{
						sqlInsert=sqlInsert + sColumnName + ",";
						sqlInsert2=sqlInsert2 + "\"+" + sColumnName + "+\",";
						sqlUpdate=sqlUpdate + sColumnName + "=\"+" + sColumnName + "+\",";
					}
					sqlSelect=sqlSelect + sColumnName + ",";
					
					sqlCol+=sColumnName + ",";
				}				
			}
			rsColumns.close();
			sqlWhere=GenerateWhere();
			ssqlAdd=sqlInsert.substring(0,sqlInsert.length()-1) + ")" + sqlInsert2.substring(0,sqlInsert2.length()-1) + ")\"";
			ssqlUpdate=sqlUpdate.substring(0,sqlUpdate.length()-1)+"\"" + "+" + sqlWhere;
			ssqlDelete="\"DELETE FROM "+sTableName + "\"+" + sqlWhere;
			ssqlSelect=sqlSelect.substring(0,sqlSelect.length()-1)+ " FROM " + sTableName + "\"" + "+" + sqlWhere;
			ssqlcol=sqlCol.substring(0,sqlCol.length()-1);
	
		}
		catch (SQLException e)
		{
			System.err.println( "GenerateBean Error " + e.getMessage() );
		}
	}
	
	public void WriteConvertCode()
	{
		FileOutput("	public String convertCode(String strvalue)" );
		FileOutput("	{	return com.macrosoft.icms.system.SysUtility.convertCode( strvalue );	}" );
		FileOutput("" );
	}


	public void WriteDoPreProcess()
	{
		FileOutput("	public String doPreProcess( String sValue )" );
		FileOutput("	{	return com.macrosoft.icms.system.SysUtility.doPreProcess( sValue );	}" );
		FileOutput("" );
	}

	public void WriteDoPreProcess2()
	{
		FileOutput("	public String doPreProcess2( String sValue )" );
		FileOutput("	{	return com.macrosoft.icms.system.SysUtility.doPreProcess2( sValue );	}" );
		FileOutput("" );
	}

	public void WriteDoPreProcess3()
	{
		FileOutput("	public String doPreProcess3( String sValue )" );
		FileOutput("	{	return com.macrosoft.icms.system.SysUtility.doPreProcess3( sValue );	}" );
		FileOutput("" );
	}

	public void WriteDoAdd()
	{
		String sqlCount;

		sqlCount="\"SELECT COUNT(*) FROM "+sTableName+ "\"+" +GenerateWhere();
		FileOutput("	public boolean doAdd() throws SQLException" );
		FileOutput("	{" );
		FileOutput("		DbConnection dbc=new DbConnection();" );
		FileOutput("		ResultSet rsCount;" );
		FileOutput("		int nRowCount;" );
		FileOutput("		String sqlAdd=" + ssqlAdd+";" );
	//	FileOutput("		String sqlCount="+sqlCount+";" );
	//	FileOutput("		rsCount=dbc.executeQuery( sqlCount );" );
	//	FileOutput("		rsCount.next();" );
	//	FileOutput("		nRowCount=rsCount.getInt( 1 );" );
	//	FileOutput("		if (nRowCount>0)		//有相同的数据存在" );
	//	FileOutput("		{" );
	//	FileOutput("			dbc.close();" );
	//	FileOutput("			return doModify();	" );
	//	FileOutput("		}" );
	//	FileOutput("		else	" );
		FileOutput("		{							");		
		FileOutput("			nRowCount=dbc.executeUpdate( sqlAdd );" );
		FileOutput("			dbc.close();" );
		FileOutput("			if (nRowCount>0)	//插入成功" );
		FileOutput("				return true;" );
		FileOutput("			else");
		FileOutput("				return false;" );
		FileOutput("		}" );
		FileOutput("	}" );
		FileOutput("" );
		//FileOutput("	*/" );
	}
	
	public void WriteDoCount()
	{
		String sqlCount;

		sqlCount="\"SELECT COUNT(*) FROM "+sTableName+ "\"+" +GenerateWhere();
		//FileOutput("	/*" );
		FileOutput("	public boolean doCount() throws SQLException" );
		FileOutput("	{" );
		FileOutput("		DbConnection dbc=new DbConnection();" );	
		FileOutput("		ResultSet rsCount;" );
		FileOutput("		int nRowCount;" );
		FileOutput("		String sqlCount="+sqlCount+";" );
		FileOutput("		rsCount=dbc.executeQuery( sqlCount );" );
		FileOutput("		rsCount.next();" );
		FileOutput("		nRowCount=rsCount.getInt( 1 );" );
		FileOutput("" );		
		FileOutput("		dbc.close();" );
		FileOutput("		if (nRowCount>0)" );
		FileOutput("		{" );
		FileOutput("			return true;" );
		FileOutput("		}");
		FileOutput("		else");
		FileOutput("			return false;" );
		FileOutput("	}" );
		FileOutput("" );
		//FileOutput("	*/" );
	}
	public void WritegetListCount()
	{
		String sqlCount;

		sqlCount="\"SELECT COUNT(*) FROM "+sTableName+"\"";
		//FileOutput("	/*" );
		FileOutput("	public int getListCount(String sqlWhere ) throws SQLException" );
		FileOutput("	{" );
		FileOutput("		DbConnection dbc=new DbConnection();" );
		FileOutput("		String sqlCount="+sqlCount+";" );
		FileOutput("		if (sqlWhere!=null&&sqlWhere.trim().compareTo(\"\")!=0){" );
		FileOutput("			if (sqlWhere.trim().toUpperCase().startsWith(\"WHERE\")){" );
		FileOutput("				sqlCount+=sqlWhere;}" );	
		FileOutput("			else {" );	
		FileOutput("				sqlCount+=\" WHERE \"+sqlWhere;}" );		
		FileOutput("		}" );		
		FileOutput("		ResultSet rsCount=dbc.executeQuery( sqlCount );" );
		FileOutput("		rsCount.next();" );
		FileOutput("		int nRowCount=rsCount.getInt( 1 );" );
		FileOutput("		dbc.close();" );
		FileOutput("		return nRowCount;" );
		FileOutput("" );		
		
		FileOutput("	}" );
		FileOutput("" );
		//FileOutput("	*/" );
	}

	public void WritegetList()
	{
		String sqlList;

		sqlList="\"SELECT * FROM "+sTableName+"\"";
		//FileOutput("	/*" );
		FileOutput("	public ArrayList getList( String sqlWhere ) throws SQLException" );
		FileOutput("	{" );
		FileOutput("		DbConnection dbc=new DbConnection();" );
		FileOutput("		ArrayList al= new ArrayList();" );
		FileOutput("		String sqlList="+sqlList+";" );
		FileOutput("		if (sqlWhere!=null&&sqlWhere.trim().compareTo(\"\")!=0){" );
		FileOutput("			if (sqlWhere.trim().toUpperCase().startsWith(\"WHERE\")){" );
		FileOutput("				sqlList+=sqlWhere;}" );	
		FileOutput("			else {" );	
		FileOutput("				sqlList+=\" WHERE \"+sqlWhere;}" );		
		FileOutput("		}" );
		FileOutput("		ResultSet rsList=dbc.executeQuery( sqlList );" );
		FileOutput("		while(rsList.next()) {" );
		FileOutput("			"+sTableName+" bTable=new "+sTableName+"();" );
		FileOutput("			bTable.doSetData( rsList );" );
		FileOutput("			al.add(bTable);" );
		FileOutput("		}" );
		FileOutput("		rsList.close();dbc.close();" );
		FileOutput("		return al;" );
		FileOutput("" );	
		FileOutput("	}" );
		FileOutput("" );
		/////////////
		FileOutput("	public Iterator getItList( String sqlWhere,String startRow ) throws SQLException" );
		FileOutput("	{"	);
		FileOutput("		if (SysUtility.isNumeric(startRow))		" );
		FileOutput("			return getList(sqlWhere,Integer.parseInt(startRow)).iterator();" );
		FileOutput("		else		" );
		FileOutput("			return getList(sqlWhere,0).iterator();" );
		FileOutput("	}" );
		/////////////
		FileOutput("	public ArrayList getList( String sqlWhere,String startRow ) throws SQLException" );
		FileOutput("	{"	);
		FileOutput("		if (SysUtility.isNumeric(startRow))		" );
		FileOutput("			return getList( sqlWhere,Integer.parseInt(startRow),10);" );
		FileOutput("		else		" );
		FileOutput("			return getList( sqlWhere,0,10);" );
		FileOutput("	}" );
		/////////////
		FileOutput("	public ArrayList getList( String sqlWhere,String startRow,int PageSize ) throws SQLException" );
		FileOutput("	{"	);
		FileOutput("		if (SysUtility.isNumeric(startRow))		" );
		FileOutput("			return getList( sqlWhere,Integer.parseInt(startRow),PageSize);" );
		FileOutput("		else		" );
		FileOutput("			return getList( sqlWhere,0,PageSize);" );
		FileOutput("	}" );
		/////////////
		FileOutput("	public ArrayList getList( String sqlWhere,int startRow ) throws SQLException" );
		FileOutput("	{"	);
		FileOutput("			return getList( sqlWhere,startRow,10);" );
		FileOutput("	}" );
		////////reload function getlist
		FileOutput("	////////reload function getlist" );
		FileOutput("	public ArrayList getList( String sqlWhere,int startRow,int PageSize) throws SQLException" );
		FileOutput("	{" );
		FileOutput("		DbConnection dbc=new DbConnection();" );
		FileOutput("		ArrayList al= new ArrayList();" );
		FileOutput("		String sqlList="+sqlList+";" );
		FileOutput("		if (sqlWhere!=null&&sqlWhere.trim().compareTo(\"\")!=0){" );
		FileOutput("			if (sqlWhere.trim().toUpperCase().startsWith(\"WHERE\")){" );
		FileOutput("				sqlList+=sqlWhere;}" );	
		FileOutput("			else {" );	
		FileOutput("				sqlList+=\" WHERE \"+sqlWhere;}" );		
		FileOutput("		}" );
		///////////////////////////////////////////////////////////////mysql 获取显示纪录数///////////////////
//		FileOutput("		sqlList+=\" limit \"+startRow+\",PageSize\";" );		
		//////////////////oracle//////////////////////////////////
		FileOutput("		sqlList+=\" AND ROWNUM<=\"+(startRow+PageSize);//start+pagesize " );	
		FileOutput("		ResultSet rsList=dbc.executeQuery( sqlList);" );
		FileOutput("		//过掉所有已经显示的列" );	
		FileOutput("		int	nDispRows=0;" );	
		FileOutput("		do" );	
		FileOutput("		{" );	
		FileOutput("			nDispRows++;" );	
		FileOutput("			if (nDispRows>startRow)	break;" );	
		FileOutput("		}" );	
		FileOutput("		while (rsList.next());" );	
		FileOutput("		while(rsList.next()) {" );
		FileOutput("			"+sTableName+" bTable=new "+sTableName+"();" );
		FileOutput("			bTable.doSetData( rsList );" );
		FileOutput("			al.add(bTable);" );
		FileOutput("		}" );
		FileOutput("		rsList.close();dbc.close();" );
		FileOutput("		return al;" );
		FileOutput("" );		
		FileOutput("	}" );
		FileOutput("" );
	}
	public void WritegetData()
	{
		//String sqlArr="\"SELECT " +ssqlcol+ " FROM "+sTableName+ "\"+" +GenerateWhere();		
		String sqlArr="\"SELECT * FROM "+sTableName+ "\"+" +GenerateWhere();		
		FileOutput("	public ArrayList getData() throws SQLException" );
		FileOutput("	{" );
		FileOutput("		DbConnection dbc=new DbConnection();" );
		FileOutput("		String sqlArr="+sqlArr+";" );
		FileOutput("		ResultSet rsArr=dbc.executeQuery(sqlArr);" );
		FileOutput("		ArrayList al= new ArrayList();" );
		FileOutput("		String[] ay = null;" );
		FileOutput("		if (rsArr.next()){	" );
		FileOutput( "			doSetData( rsArr );" );
		FileOutput("			ResultSetMetaData rsmd = rsArr.getMetaData();" );
		FileOutput("			for (int k=1;k<=rsmd.getColumnCount(); k++)	{" );
		FileOutput("				ay = new String[2];" );
		FileOutput("				ay[0]=rsmd.getColumnName(k);" );	
		FileOutput("				if (rsmd.getColumnTypeName(k).equalsIgnoreCase(\"DATETIME\")||rsmd.getColumnTypeName(k).equalsIgnoreCase(\"DATE\"))");
		FileOutput("					ay[1]=String.valueOf(rsArr.getDate(ay[0]));");
		FileOutput("				else");
		FileOutput("					ay[1]=String.valueOf(rsArr.getObject(ay[0]));" );
		FileOutput("				if (!ay[1].trim().equals(\"null\")&&!ay[1].trim().equals(\"\"))" );	
		FileOutput("					{ay[1]=SysUtility.pre(ay[1]); al.add(ay);}" ); 
		FileOutput("			}" );		
		FileOutput("		}" );	
		FileOutput("		dbc.close();" );
		FileOutput("		return al;" );		
		
		FileOutput("" );		
		
		FileOutput("	}" );		
	}



	public void WriteDoModify()
	{
		//FileOutput("	/*" );
		FileOutput("	public boolean doModify() throws SQLException" );
		FileOutput("	{");
		FileOutput("		DbConnection dbc=new DbConnection();" );
		FileOutput("		String sqlModify=" + ssqlUpdate + ";");
		FileOutput("		int nRowCount=dbc.executeUpdate( sqlModify );" );
		FileOutput("		dbc.close();" );
		FileOutput("		if (nRowCount>0)	//修改成功" );
		FileOutput("		{");
		FileOutput("			return true;" );
		FileOutput("		}" );
		FileOutput("		else" );
		FileOutput("			return false;");
		FileOutput("	}" );
		FileOutput("" );
		//FileOutput("	*/" );
	}

	public void WriteDoDelete()
	{
		//FileOutput("	/*" );
		FileOutput("	public boolean doDelete() throws SQLException" );
		FileOutput("	{" );
		FileOutput("		DbConnection dbc=new DbConnection();" );
		FileOutput("		String sqlDelete="+ssqlDelete+";");
		FileOutput("		int nRowCount=dbc.executeUpdate( sqlDelete );" );
		FileOutput("		dbc.close();" );
		FileOutput("		if (nRowCount>0)" );
		FileOutput("		{" );
		FileOutput("			return true;");
		FileOutput("		}" );
		FileOutput("		else" );
		FileOutput("			return false;" );
		FileOutput("	}" );
		FileOutput("" );
		//FileOutput("	*/" );
	}

	public void WriteDoSelect()
	{
		String sqlArr="\"SELECT * FROM "+sTableName+ "\"+" +GenerateWhere();
		FileOutput( "	public void doSelect() throws SQLException" );
		FileOutput( "	{" );
		FileOutput("		DbConnection dbc=new DbConnection();" );
		FileOutput( "		ResultSet rsSelect;" );
		FileOutput( "		String sqlSelect=" + sqlArr+";" );
		FileOutput( "		rsSelect=dbc.executeQuery(sqlSelect);" );
		FileOutput( "		if(rsSelect.next())" );
		FileOutput( "		{" );
		FileOutput( "			doSetData( rsSelect );" );
		FileOutput( "		}" );
		FileOutput("		dbc.close();" );
		FileOutput( "	}" );
		FileOutput("" );
	}
	public void WriteDoSetData()
	{
		ResultSet rsColumns;
		String sColumnName;
		String sColumnXType;
		
		//从数据表中读取数据
		try
		{
			//for mysql
			//rsColumns=executeQuery( "SELECT COLUMN_NAME,DATA_TYPE,COLUMN_KEY FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='" + sTableName + "'");
			/* for sql server*/
			//rsColumns=executeQuery( "select [name],type=(select [name] from systypes where systypes.xtype=syscolumns.xtype) from syscolumns where id=OBJECT_ID ('"+sTableName+"')");
			/* for oracle*/
			rsColumns=executeQuery( "select COLUMN_NAME,DECODE(DATA_TYPE,'NUMBER',DECODE(DATA_SCALE,0,'INT',null,'INT',DATA_TYPE),DATA_TYPE )DATA_TYPE from user_tab_columns where TABLE_NAME='"+sTableName+"'");
			
			FileOutput( "	public void doSetData( ResultSet rsSelect ) throws SQLException" );
			FileOutput( "	{" );
			while ( rsColumns.next() )
			{
				sColumnName=(rsColumns.getString( 1 )).toUpperCase();
				sColumnXType=(rsColumns.getString( 2 )).toUpperCase();
				if( getJavaType(sColumnXType).equals("String") )
				{					
					if (sColumnXType.equals("DATETIME")||sColumnXType.equals("DATE"))
						FileOutput( "	" + sColumnName + "=String.valueOf(rsSelect.getDate(\"" + sColumnName.trim() + "\"));" );
					else
						FileOutput( "	" + sColumnName + "=rsSelect.getString(\"" + sColumnName.trim() + "\");" );
				}
				else if( getJavaType(sColumnXType).equals("int") )
				{
					
					FileOutput( "	" + sColumnName + "=rsSelect.getInt(\"" + sColumnName.trim() + "\");" );
				}
				else if( getJavaType(sColumnXType).equals("float") )
				{
					
					FileOutput( "	" + sColumnName + "=rsSelect.getFloat(\"" + sColumnName.trim() + "\");" );
				}
				else if( getJavaType(sColumnXType).equals("double") )
				{
					
					FileOutput( "	" + sColumnName + "=rsSelect.getDouble(\"" + sColumnName.trim() + "\");" );
				}
				else if( getJavaType(sColumnXType).equals("datetime") )
				{					
					FileOutput( "	" + sColumnName + "=String.valueOf(rsSelect.getDate(\"" + sColumnName.trim() + "\"));" );
				}
				
			}
			rsColumns.close();
			FileOutput( "	}" );
			FileOutput("" );
		}
		catch (SQLException e)
		{
			System.err.println( "GenerateBean Error " + e.getMessage() );
		}
	}
	
	public boolean FileOperate()
	{
		String FileName = sClassPath+"\\"+SysUtility.replace(sPackageName,".","\\")+"\\"+sClassName+".java";
		try 
		{
			File f = new File(FileName);
			if(!f.exists())
			{
				f.createNewFile();
				return true;
			}
			else
			{
//				System.err.println( "文件已存在" );
//				return false;
				return true;
			}
		}
		catch (IOException e) 
		{
			System.err.println("无法打开文件: " + sClassPath);
			return false;
		}
	}
	public void FileOutput(String s)
	{
		String FileName = sClassPath+"\\"+SysUtility.replace(sPackageName,".","\\")+"\\"+sClassName+".java";
		try 
		{
			PrintWriter FileWrite = new PrintWriter(new FileWriter(FileName, true), true);
			FileWrite.println(s);
		}
		catch (IOException e) 
		{
			System.err.println("无法打开文件: " + sClassPath);
		}
	}

	public static void main(String[] args) 
	{
		GenerateBean gb;
		ResultSet rsColumns;
		String sColumnName;
		int nColumnXType;
		int nColumnType;
		String sColumnXType;

		gb=new GenerateBean();
		gb.setClassPath("E:\\workspace");//
	//	gb.setClassPath("E:\\Tomcat 5.0\\webapps\\ora_mp\\WEB-INF\\classes\\");
	//	gb.setClassPath("e:\\Tomcat5.0\\webapps\\ora_mp\\WEB-INF\\classes\\");//
		gb.setPackageName( "" );	// com\\macrosoft\\icms\\test
		gb.setClassName( "QYDJ_FZJG_ZS" );
		gb.setTableName( "QYDJ_FZJG_ZS" );		

		if(args.length != 0)
		{
			gb.setPackageName( "com.macrosoft.icms."+args[0] );
			gb.setClassName( args[1] );
			gb.setTableName( args[1] );
		}
		if(gb.FileOperate())
		{
			
			gb.GenerateColumnType();
			gb.GenerateSQL();
			gb.GenerateWhere();
			gb.WriteBeanHeader();
			gb.WriteColumnDefine();
			gb.GenerateSetGetFunction();
			
			gb.WriteConvertCode();
			gb.WriteDoPreProcess();
			gb.WriteDoPreProcess2();
			gb.WriteDoPreProcess3();
			
			gb.WriteDoSelect();
			gb.WriteDoSetData();
			gb.WriteDoAdd();
			gb.WriteDoCount();			
			gb.WriteDoModify();
			gb.WriteDoDelete();
			gb.WritegetListCount();
			gb.WritegetList();
			gb.WritegetData();
			gb.WriteBeanFooter();
			
		}
	}
}

