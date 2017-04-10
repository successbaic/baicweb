/**
	ClassName:	DbConnection
	Package:	com.macrosoft.icms.icms.dbc
	Function:	提供一般SQL语句（Select、Insert、Update）等的支持
				同时提供对事务的支持
	Author:		Orchid
	Date:		2002-3-15
	Modify:		
 **/
package com.macrosoft.icms.dbc;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Vector;

public class DbConnection {
	private String dbName = "wsdjdb";
	Connection dbcConn = null;
	Statement dbcStmt = null;
	ResultSet rs = null;
	CallableStatement dbccallstmt = null;
	DbConnectFactory factory = null;
	private static int maxRows = 5000;
	private static int queryTimeout = 30;
	Vector dbcVector=null;
	/**
	 * 构造函数 从连接池中获得一个全局的连接持实例
	 **/
	public DbConnection() {
		factory = DbConnectFactory.getInstance();
	}

	/**
	 * 从ConnectionManager中获得一个可用的连接 并把该连接赋值给类的变量dbcConn，并创建相应的Statement变量
	 * 
	 * @throws SQLException
	 */
	public synchronized void  connect() throws SQLException {
		if(dbcConn == null){
			dbcConn = DbConnectFactory.getConnection(dbName);
		}
		if (dbcConn == null) {
			throw new SQLException("数据库连接失败!" + "未找到" + dbName + "是数据库连接!", "");
		}
		if (dbcStmt == null) {
			dbcStmt = dbcConn.createStatement();
			dbcStmt.setMaxRows(maxRows);
			dbcStmt.setQueryTimeout(queryTimeout);

		}
	}

	/**
	 * 将已经连接的数据库连接断开
	 */
	public void close() throws SQLException {
		try {
			if (rs != null) {
				rs.close();
			}
			if (dbcStmt != null) {
				dbcStmt.close();
			}

			if (dbccallstmt != null) {
				dbccallstmt.close();
			}
			if(dbcConn != null){
				dbcConn.close();
			}
		}catch(SQLException e){
			e.printStackTrace();
			throw(e);
		}finally{
			if (rs != null) {
				rs.close();
			}
			if (dbcStmt != null) {
				dbcStmt.close();
			}

			if (dbccallstmt != null) {
				dbccallstmt.close();
			}
			if(dbcConn != null){
				dbcConn.close();
			}
		}
	}

	/**
	 * 提交一个事务同时清空事务变量
	 */
	void commit() throws SQLException {
		dbcConn.commit();
		System.out.println("Transaction committing....OK!");
	}
	/**
	 * 事务开始
	 */
	void beginTransation() throws SQLException {
		System.out.println("Transaction Beginning....");
		dbcConn.setAutoCommit(false);
	}

	/**
	 * 回滚一个事务同时清空事务变量
	 */
	void rollback() throws SQLException {
		dbcConn.rollback();
		System.out.println("Transaction rollbacking....OK!");
	}

	
	/**
	 * 执行存储过程返回结果集
	 *
	 * @param sqlQuery
	 *            执行查询操作的SQL语句
	 * @param p
	 *            参数列表
	 * @return ResultSet 查询返回的结果集
	 */

	public void executeStp(String sqlQuery, ArrayList lst) throws SQLException {
		System.out.println(sqlQuery);
		for (int i = 0; i < lst.size(); i++)
			System.out.print(lst.get(i) + "/");
		System.out.println();

		Object ret = null;
		if ((sqlQuery == null) || sqlQuery.equals(""))
			return;
		try {
			connect();
			dbccallstmt = dbcConn.prepareCall(sqlQuery);
			for (int i = 0; i < lst.size(); i++) {
				int parmNo = i + 1; // 1 is first parm
				if (lst.get(i).getClass().getName().equals("java.lang.String")) // 类型
				{
					dbccallstmt.setString(parmNo, (String) lst.get(i));
				} else // 参数
				{
					dbccallstmt.setInt(parmNo,
							((Integer) lst.get(i)).intValue());
				}
			}

			dbccallstmt.execute();
			// ret = dbccallstmt.getObject(1);
		} catch (SQLException e) {
			System.err.println("DbConnection Query Error: " + e.getMessage());
			close();
			throw (e);
		}
		// 这里不能够关闭连接和Statement，否则结果即变为不可用
		// 不知道有没有资源消耗的问题
	}

	public Object executeStp(String sqlQuery, ArrayList lst, int rTypes)
			throws SQLException {
		System.out.println(sqlQuery);
		for (int i = 0; i < lst.size(); i++)
			System.out.print(lst.get(i) + "/");
		System.out.println();

		Object ret = null;
		if ((sqlQuery == null) || sqlQuery.equals(""))
			return null;
		try {
			connect();
			dbccallstmt = dbcConn.prepareCall(sqlQuery);

			// /first param
			dbccallstmt.registerOutParameter(1, rTypes); // 4-Types.INTEGER
															// 12-Types.VARCHAR
															// 91-Types.DATE -10
															// oracle.jdbc.OracleTypes.CURSOR
			for (int i = 0; i < lst.size(); i++) {
				int parmNo = i + 2; // 2 is first parm
				if (lst.get(i).getClass().getName().equals("java.lang.String")) // 类型
				{
					dbccallstmt.setString(parmNo, (String) lst.get(i));
				} else // 参数
				{
					dbccallstmt.setInt(parmNo,
							((Integer) lst.get(i)).intValue());
				}
			}

			dbccallstmt.execute();
			ret = dbccallstmt.getObject(1);
		} catch (SQLException e) {
			System.err.println("DbConnection Query Error: " + e.getMessage());
			dbcConn.close();
			throw (e);
		}
		return ret;
		// 这里不能够关闭连接和Statement，否则结果即变为不可用
		// 不知道有没有资源消耗的问题
	}

	// dbccallstmt

	/**
	 * 执行查询
	 *
	 * @param sqlQuery
	 *            执行查询操作的SQL语句
	 * @return ResultSet 查询返回的结果集
	 */
	public ResultSet executeQuery(String sqlQuery) throws SQLException {
		System.out.println(sqlQuery);
		try {
			connect();
			rs = dbcStmt.executeQuery(sqlQuery);
		} catch (SQLException e) {
			System.err.println("DbConnection Query Error: " + e.getMessage());
			dbcConn.close();
			throw (e);
		}
		return rs;
		// 这里不能够关闭连接和Statement，否则结果即变为不可用
		// 不知道有没有资源消耗的问题
	}

	/**
	 * 执行更新操作
	 *
	 * @param sqlUpdate
	 *            执行Update操作的SQL语句
	 */
	public int executeUpdate(String sqlUpdate) throws SQLException {
		int count = 0;
		System.out.println(sqlUpdate);
		try {
			connect();
			count = dbcStmt.executeUpdate(sqlUpdate);
		} catch (SQLException e) {
			System.err.println("DbConnection Update Error: " + e.getMessage());
			throw e;
		}
		return count;
	}

	/*
	 * 取得并返回一个PreparedStatement
	 */
	public PreparedStatement prepareStatement(String sql) throws SQLException {
		connect();
		PreparedStatement ps = dbcConn.prepareStatement(sql);
		return ps;
	}

	public static void main(String[] args) {
		DbConnection db = new DbConnection();
		try {
			// ResultSet res = db.executeQuery("select * from sys_dmdz");
			ResultSet res = db
					.executeQuery("select * from qydj_ywsb_sq WHERE rownum < 10");

			while (res.next()) {
				System.out.println(res.getString(1));
			}
			db.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 以下方法是给首重合同使用的。可能会带来问题
	 */
	
	/**
	*	启动事务
	*/
	public void startTransaction() throws SQLException
	{
		//初始化语句缓冲区
		dbcVector=new Vector();
		System.out.println(  "Transaction Starting....." );
	}

	/**
	*	向一个已经启动的事务中加入SQL语句
	*/
	public void addSQL(String sqlTemp)
	{
		dbcVector.addElement( sqlTemp );
	}
	/**
	*	终止一个事务
	*/
	public boolean endTransaction() throws SQLException
	{
		int nSize, i;
		String sqlTemp;
		boolean bReturn;

		nSize=dbcVector.size();
		try
		{
			System.out.println(  "Process current Transaction..." );
			connect();
			dbcConn.setAutoCommit( false );		//启动事务
			dbcStmt=dbcConn.createStatement();
			for( i=0; i<nSize; i++ )
			{
				sqlTemp=(String)dbcVector.elementAt( i );
				System.out.println(  sqlTemp );
				dbcStmt.executeUpdate( sqlTemp );
			}			
			commit();		//提交事务
			System.out.println(   "Process current Transaction... OK!" );
			bReturn=true;
		}
		catch (SQLException e)
		{
			System.out.println(  "DbConnection endTransaction Error: " + e.getMessage() );
			rollback();		//回滚事务
			bReturn=false;
		}
		return bReturn;
	}
	public Connection getConn() {
		try {
			if(dbcConn == null){
				dbcConn = DbConnectFactory.getConnection(dbName);
			}
			if (dbcConn == null) {
				throw new SQLException("数据库连接失败!" + "未找到" + dbName + "是数据库连接!", "");
			}
			if (dbcStmt == null) {
				dbcStmt = dbcConn.createStatement();
				dbcStmt.setMaxRows(maxRows);
				dbcStmt.setQueryTimeout(queryTimeout);

			}			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return dbcConn;
	}
	
	/**
	*  析构函数
	*/
	public void finalize() throws SQLException
	{
		if (dbcVector!=null)
		{
			dbcVector.clear();
			dbcVector=null;
		}
	}
	
};
