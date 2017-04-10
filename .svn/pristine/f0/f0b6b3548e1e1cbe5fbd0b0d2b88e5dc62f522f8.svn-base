/**
	ClassName:	SzDbConnection
	Package:	com.macrosoft.icms.icms.dbc
	Function:	提供一般SQL语句（Select、Insert、Update）等的支持
				同时提供对事务的支持
	Author:		Orchid
	Date:		2002-3-15
	Modify:		
 **/
package com.macrosoft.icms.gsdbc;


import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.macrosoft.icms.dbc.DbConnectFactory;

public class SzDbConnection {
	private String dbName = "szdb";
	Connection dbcConn = null;
	Statement dbcStmt = null;
	ResultSet rs = null;
	CallableStatement dbccallstmt = null;
	DbConnectFactory factory = null;
	private static int maxRows = 1000;
	private static int queryTimeout = 30;

	/**
	 * 构造函数 从连接池中获得一个全局的连接持实例
	 **/
	public SzDbConnection() {
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
		if(dbcConn == null){
			throw new SQLException("数据库连接失败!"+"未找到"+dbName+"是数据库连接!","");
		}
		if (dbcStmt==null)
		{
			dbcStmt=dbcConn.createStatement();
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
		System.out.println("Transaction committing....");
		dbcConn.commit();
		dbcConn.setAutoCommit(true);
		System.out.println("Transaction committing....OK!");
	}

	/**
	 * 回滚一个事务同时清空事务变量
	 */
	void rollback() throws SQLException {
		System.out.println("Transaction rollbacking....");
		dbcConn.rollback();
		dbcConn.setAutoCommit(true);
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
			System.err.println("SzDbConnection Query Error: " + e.getMessage());
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
			System.err.println("SzDbConnection Query Error: " + e.getMessage());
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
			System.err.println("SzDbConnection Query Error: " + e.getMessage());
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
			System.err.println("SzDbConnection Update Error: " + e.getMessage());
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
		SzDbConnection db = new SzDbConnection();
		try {
//			ResultSet res = db.executeQuery("SELECT * FROM sys_dmdz t WHERE t.type = 'ENTTYPE'");
			ResultSet res = db.executeQuery("select * from qydj_ywsb_sq t WHERE rownum < 10");
			while (res.next()) {
				System.out.println(res.getString(1));
			}
			db.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}


};
