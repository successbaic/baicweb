package com.macrosoft.icms.dbc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public final class DbConnectFactory {

	private final static DbConnectFactory factory = new DbConnectFactory();

	private final static ComboPooledDataSource wsdjdb = new ComboPooledDataSource(
			"wsdjdb");
	private final static ComboPooledDataSource gsdb = new ComboPooledDataSource(
			"gsdb");
	private final static ComboPooledDataSource sddb = new ComboPooledDataSource(
			"sddb");
	private final static ComboPooledDataSource lsdb = new ComboPooledDataSource(
	"lsdb");

	public final static DbConnectFactory getInstance() {
		return factory;
		
	}

	public  final static Connection getConnection(String dbName) throws SQLException {
		if ("wsdjdb".equals(dbName)) {
			return wsdjdb.getConnection();
		} else if ("gsdb".equals(dbName)) {
			return gsdb.getConnection();
		} else if ("sddb".equals(dbName)) {
			return sddb.getConnection();
		}else if ("lsdb".equals(dbName)) {
			return lsdb.getConnection();
		}
		return null;
	}
	public static void main(String[] args) throws SQLException {
		Connection conn = wsdjdb.getConnection();
		Statement st= conn.createStatement();
		ResultSet rs =  st.executeQuery("select * from qydj_ywsb_sq WHERE rownum < 10");
//		ResultSet rs =  st.executeQuery("select * from qydj_jbxx_zs WHERE rownum < 10");
		if(rs.next()){
			System.out.println(rs.getString(1));
		}
		conn.close();
		
	}
}
