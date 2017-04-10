/**
	ClassName:	DbConnection
	Package:	com.macrosoft.icms.icms.dbc
	Function:	�ṩһ��SQL��䣨Select��Insert��Update���ȵ�֧��
				ͬʱ�ṩ�������֧��
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
	 * ���캯�� �����ӳ��л��һ��ȫ�ֵ����ӳ�ʵ��
	 **/
	public DbConnection() {
		factory = DbConnectFactory.getInstance();
	}

	/**
	 * ��ConnectionManager�л��һ�����õ����� ���Ѹ����Ӹ�ֵ����ı���dbcConn����������Ӧ��Statement����
	 * 
	 * @throws SQLException
	 */
	public synchronized void  connect() throws SQLException {
		if(dbcConn == null){
			dbcConn = DbConnectFactory.getConnection(dbName);
		}
		if (dbcConn == null) {
			throw new SQLException("���ݿ�����ʧ��!" + "δ�ҵ�" + dbName + "�����ݿ�����!", "");
		}
		if (dbcStmt == null) {
			dbcStmt = dbcConn.createStatement();
			dbcStmt.setMaxRows(maxRows);
			dbcStmt.setQueryTimeout(queryTimeout);

		}
	}

	/**
	 * ���Ѿ����ӵ����ݿ����ӶϿ�
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
	 * �ύһ������ͬʱ����������
	 */
	void commit() throws SQLException {
		dbcConn.commit();
		System.out.println("Transaction committing....OK!");
	}
	/**
	 * ����ʼ
	 */
	void beginTransation() throws SQLException {
		System.out.println("Transaction Beginning....");
		dbcConn.setAutoCommit(false);
	}

	/**
	 * �ع�һ������ͬʱ����������
	 */
	void rollback() throws SQLException {
		dbcConn.rollback();
		System.out.println("Transaction rollbacking....OK!");
	}

	
	/**
	 * ִ�д洢���̷��ؽ����
	 *
	 * @param sqlQuery
	 *            ִ�в�ѯ������SQL���
	 * @param p
	 *            �����б�
	 * @return ResultSet ��ѯ���صĽ����
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
				if (lst.get(i).getClass().getName().equals("java.lang.String")) // ����
				{
					dbccallstmt.setString(parmNo, (String) lst.get(i));
				} else // ����
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
		// ���ﲻ�ܹ��ر����Ӻ�Statement������������Ϊ������
		// ��֪����û����Դ���ĵ�����
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
				if (lst.get(i).getClass().getName().equals("java.lang.String")) // ����
				{
					dbccallstmt.setString(parmNo, (String) lst.get(i));
				} else // ����
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
		// ���ﲻ�ܹ��ر����Ӻ�Statement������������Ϊ������
		// ��֪����û����Դ���ĵ�����
	}

	// dbccallstmt

	/**
	 * ִ�в�ѯ
	 *
	 * @param sqlQuery
	 *            ִ�в�ѯ������SQL���
	 * @return ResultSet ��ѯ���صĽ����
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
		// ���ﲻ�ܹ��ر����Ӻ�Statement������������Ϊ������
		// ��֪����û����Դ���ĵ�����
	}

	/**
	 * ִ�и��²���
	 *
	 * @param sqlUpdate
	 *            ִ��Update������SQL���
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
	 * ȡ�ò�����һ��PreparedStatement
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
	 * ���·����Ǹ����غ�ͬʹ�õġ����ܻ��������
	 */
	
	/**
	*	��������
	*/
	public void startTransaction() throws SQLException
	{
		//��ʼ����仺����
		dbcVector=new Vector();
		System.out.println(  "Transaction Starting....." );
	}

	/**
	*	��һ���Ѿ������������м���SQL���
	*/
	public void addSQL(String sqlTemp)
	{
		dbcVector.addElement( sqlTemp );
	}
	/**
	*	��ֹһ������
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
			dbcConn.setAutoCommit( false );		//��������
			dbcStmt=dbcConn.createStatement();
			for( i=0; i<nSize; i++ )
			{
				sqlTemp=(String)dbcVector.elementAt( i );
				System.out.println(  sqlTemp );
				dbcStmt.executeUpdate( sqlTemp );
			}			
			commit();		//�ύ����
			System.out.println(   "Process current Transaction... OK!" );
			bReturn=true;
		}
		catch (SQLException e)
		{
			System.out.println(  "DbConnection endTransaction Error: " + e.getMessage() );
			rollback();		//�ع�����
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
				throw new SQLException("���ݿ�����ʧ��!" + "δ�ҵ�" + dbName + "�����ݿ�����!", "");
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
	*  ��������
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