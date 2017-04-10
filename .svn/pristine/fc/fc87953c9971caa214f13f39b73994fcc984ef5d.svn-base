package com.macrosoft.icms.system;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.macrosoft.icms.dbc.DbConnection;

public class SysPyk {
	public String getHypy( String sHZ ) throws SQLException
	{
		DbConnection dbc=new DbConnection();
		String ret="";
		String sql="SELECT PY FROM SYS_PYK WHERE HZ='"+sHZ.trim()+"'";
		ResultSet rs=dbc.executeQuery(sql);	
		while (rs.next())
		{
			if (ret.equals(""))
			{
				ret=rs.getString(1).trim();
			}
			else
			{
				ret=ret+","+rs.getString(1).trim();
			}
		}
		rs.close();
		dbc.close();
		return ret;
	}
}
