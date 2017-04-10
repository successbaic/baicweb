package com.macrosoft.icms.qydj;

import java.sql.*;
import java.util.*;
import com.macrosoft.icms.dbc.*;

public class WSDJ_PARAM_CFG
{
	String ID;
	String PARAM_CODE;
	String PARAM_NAME;
	String PARAM_VALUE;
	String REMARK;

	
	public String getID() {
		return ID;
	}


	public void setID(String iD) {
		ID = iD;
	}


	public String getPARAM_CODE() {
		return PARAM_CODE;
	}


	public void setPARAM_CODE(String pARAM_CODE) {
		PARAM_CODE = pARAM_CODE;
	}


	public String getPARAM_NAME() {
		return PARAM_NAME;
	}


	public void setPARAM_NAME(String pARAM_NAME) {
		PARAM_NAME = pARAM_NAME;
	}


	public String getPARAM_VALUE() {
		return PARAM_VALUE;
	}


	public void setPARAM_VALUE(String pARAM_VALUE) {
		PARAM_VALUE = pARAM_VALUE;
	}


	public String getREMARK() {
		return REMARK;
	}


	public void setREMARK(String rEMARK) {
		REMARK = rEMARK;
	}

	/**
	 * 黑名单限制，校验限定用户名和IP地址不允许访问系统
	 * @param paramcode
	 * @param param
	 * @return
	 * @throws SQLException
	 */
	@SuppressWarnings("unchecked")
	public static int validateLoginParam(String paramcode, String param) throws SQLException
	{
		int flag =0;
		DbConnection dbc=new DbConnection();
		try
		{
		ResultSet rsSelect;
		String sqlSelect="SELECT PARAM_VALUE FROM WSDJ_PARAM_CFG WHERE PARAM_CODE='" + paramcode + "'";
		rsSelect=dbc.executeQuery(sqlSelect);
		ArrayList list = new ArrayList();
		while(rsSelect.next()) {
			String paramvalue = rsSelect.getString("PARAM_VALUE");
			list.add(paramvalue);
		 }
		for(int i=0;i<list.size();i++){
			if(param.equals(list.get(i))){
				flag =1;
			 }
		   }
		}
		catch (SQLException e)
		{
			System.out.println( "SysUser Error: " + e.getMessage() );
		}
		return flag;
	}
	public void doSetData( ResultSet rsSelect ) throws SQLException
	{
	PARAM_VALUE=rsSelect.getString("PARAM_VALUE");
	}
}
