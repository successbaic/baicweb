package com.macrosoft.icms.util;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.macrosoft.icms.dbc.DbConnection;
import com.macrosoft.icms.gsdbc.GsDbConnection;
import com.macrosoft.icms.gsnw.MCGL_JBXX_ZS;
/*
 * 注：公用检查方法
 * 方法里进行了汉字乱码的转换，因此传入值时不需再做转换
 */
public class CHECK_INFO {
	public String WW_YWSB_SQ (String wheSql) throws SQLException{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		String USERNAME="";
		String LOGINID="";
		//String sqlCount="SELECT LOGINID FROM QYDJ_YWSB_SQ"+" WHERE ENTNAME="+doPreProcess3(ENTNAME)+" AND STATUS!='4' AND CDDL!='0' ";
		String sqlCount="SELECT LOGINID FROM QYDJ_YWSB_SQ "+wheSql;
		rsCount=dbc.executeQuery( sqlCount );
		if(rsCount.next()){
			LOGINID=doPreProcess(rsCount.getString("LOGINID"));
		}
		if(!LOGINID.equals("")){
			rsCount=dbc.executeQuery( "SELECT USERNAME FROM WEB_USER WHERE LOGINID='"+LOGINID+"' " );
			if(rsCount.next()){
				USERNAME=doPreProcess(rsCount.getString("USERNAME"));
			}
		}
		rsCount.close();
		dbc.close();
		if (USERNAME.equals(""))
		{
			return "";
		}
		else
			return "该企业/个体户正在由 【"+USERNAME+"】 办理网上登记业务！";
	}
	
	public String WW_YWSB_SQ_BYSQL (String SQL) throws SQLException{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;		
		rsCount=dbc.executeQuery( SQL );
		rsCount.next();
		nRowCount=rsCount.getInt( 1 );
		
		dbc.close();
		if (nRowCount>0)
		{
			return "该企业/个体户正在办理网上登记业务！";
		}
		else
			return "";
	}
	public String WW_YWSB_SQ_BYSQL (String SQL,String retValue) throws SQLException{
		DbConnection dbc=new DbConnection();
		ResultSet rsCount;
		int nRowCount;		
		rsCount=dbc.executeQuery( SQL );
		rsCount.next();
		nRowCount=rsCount.getInt( 1 );
		
		dbc.close();
		if (nRowCount>0)
		{
			return retValue;
		}
		else
			return "";
	}
	
	public String convertCode(String strvalue)
	{	return com.macrosoft.icms.system.SysUtility.convertCode( strvalue );	}

	public String doPreProcess( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess( sValue );	}

	public String doPreProcess2( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess2( sValue );	}

	public String doPreProcess3( String sValue )
	{	return com.macrosoft.icms.system.SysUtility.doPreProcess3( sValue );	}
	public static boolean validateEntname(String entname){
		try {
			GsDbConnection gsDbc = new GsDbConnection();
			ResultSet rsSelect;
			String sqlSelect = "SELECT * FROM MCGL_JBXX_ZS"
					+ " WHERE entname='" + entname + "' AND (saveperto is null or saveperto>sysdate)";
			rsSelect = gsDbc.executeQuery(sqlSelect);
			if (rsSelect.next()) {
				return true;
			}
			DbConnection dbc = new DbConnection();
			sqlSelect = "SELECT * FROM MCGL_JBXX_SQ" + " WHERE entname='"
					+ entname + "' AND namestatus <> '5'";
			rsSelect = dbc.executeQuery(sqlSelect);
			if (rsSelect.next()) {
				return true;
			}
			gsDbc.close();
		} catch (Exception e) {
			e.printStackTrace();
			return true;
		}
		return false;
	}
}
