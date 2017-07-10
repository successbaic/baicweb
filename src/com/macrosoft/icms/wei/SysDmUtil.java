package com.macrosoft.icms.wei;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Vector;

import com.macrosoft.icms.dbc.DbConnection;

public class SysDmUtil {
	private static Hashtable hDmb=new Hashtable();
	private static Vector vDjjg =new Vector();
	private static Vector vGss =new Vector();
	
	static public String convertCode(String strvalue)
	{
		String newStr=null;
		try
		{
			if (strvalue==null)
			{
				return null;
			}
			else
			{
				strvalue=strvalue.replaceAll("[\\n\\r]","");
				newStr=new String(strvalue.getBytes("ISO8859-1"),"GBK");
				return newStr;
			}
		}
		catch(Exception e)
		{
			return null;
		}
	}
	
	public static String doPreProcess( String sValue )
	{
		if (sValue==null)
		{
			return "";
		}
		else
		{
			if (sValue.compareTo("null")==0)
			{
				return "";
			}
			else
				return replace(sValue).trim();
		}
	}
	
	static public String replace(String strvalue)
	{		
		try
		{
			if (strvalue==null)
			{
				return null;
			}
			else
			{
				strvalue=strvalue.replaceAll("'","");
				strvalue= strvalue.trim();
				//strvalue=strvalue.replaceAll("=","");
				//strvalue=strvalue.replaceAll(">","");
				//strvalue=strvalue.replaceAll("<","");
				return strvalue;
			}
		}
		catch(Exception e)
		{
			return null;
		}
	}
	public SysDmUtil() throws SQLException{
		if(hDmb.size()<1){
			InitDjjg();
			InitSysDm();
		}
	}
	public void InitDjjg() throws SQLException {
		DbConnection dbc = new DbConnection();
		ResultSet rs = dbc.executeQuery("SELECT CODING,CONTENT,PCODING,REMARK,REGLEVEL,MCJC,DQJC FROM COM_DJJG ORDER BY REGLEVEL,CODING ");
		while(rs.next()){
			String CODING=rs.getString("CODING");
			String CONTENT=rs.getString("CONTENT");
			String PCODING=rs.getString("PCODING");
			String REMARK=rs.getString("REMARK");
			String REGLEVEL=rs.getString("REGLEVEL");
			String MCJC=rs.getString("MCJC");
			String DQJC =rs.getString("DQJC");
			if("5".equals(REGLEVEL)){
				vGss.addElement(new String[] {CODING,CONTENT,PCODING,REMARK,REGLEVEL,MCJC,DQJC});
			}else{
				vDjjg.addElement(new String[] {CODING,CONTENT,PCODING,REMARK,REGLEVEL,MCJC,DQJC});
			}					
		}
		rs.close();
		rs=null;
		dbc.close();
	}
	public void InitSysDm() throws SQLException {
		DbConnection dbc = new DbConnection();
		ArrayList aDmlx = new ArrayList();
		// 初始化DM
		String sqlDmlx = "SELECT TYPE FROM SYS_DMDZ GROUP BY TYPE ORDER BY TYPE";
		ResultSet rsDmlx = dbc.executeQuery(sqlDmlx);
		while (rsDmlx.next()) {
			String sDmlx = String.valueOf(rsDmlx.getObject("TYPE")).trim()
					.toUpperCase();
			aDmlx.add(sDmlx);
		}
		rsDmlx.close();
		rsDmlx = null;

		for (int i = 0; i < aDmlx.size(); i++) {
			String sqlDm = "SELECT CODE,CONTENT,REMARK,SIGN FROM SYS_DMDZ WHERE TYPE='"
					+ aDmlx.get(i).toString().trim() + "' ORDER BY CODE,SIGN";
			String sDm, sDmnr, sRemark, sign;
			ResultSet rsDm = dbc.executeQuery(sqlDm);
			Vector vTemp = new Vector();
			while (rsDm.next()) {
				sDm = String.valueOf(rsDm.getObject("CODE")).trim()
						.toUpperCase();
				sDmnr = String.valueOf(rsDm.getObject("CONTENT")).trim()
						.toUpperCase();
				sRemark = String.valueOf(rsDm.getObject("REMARK")).trim()
						.toUpperCase();
				sign = String.valueOf(rsDm.getObject("SIGN")).trim()
						.toUpperCase();
				vTemp.addElement(new String[] { sDm, sDmnr, sRemark, sign });
			}
			hDmb.put(aDmlx.get(i).toString().trim().toUpperCase(), vTemp);
			rsDm.close();
			rsDm = null;
		}
		dbc.close();
	}
	
	// 返回代码内容
		public String getSysDmByRemark(String sDmlx, String sRemark)
				throws SQLException {
			if (sDmlx.equals("") || sRemark == null || sRemark.equals("")) {
				return "";
			} else {
				Vector vTemp = (Vector) hDmb.get(sDmlx.toUpperCase());
				if (vTemp == null) {
					return "";
				}
				for (int i = 0; i < vTemp.size(); i++) {
					String[] ss = (String[]) vTemp.get(i);
					if (ss[2].equals(sRemark.toUpperCase())) {
						return ss[1];
					}
				}
				return "";
			}

		}

		public String getSysDmValByRemark(String sDmlx, String sRemark)
				throws SQLException {
			if (sDmlx.equals("") || sRemark == null || sRemark.equals("")) {
				return "";
			} else {
				Vector vTemp = (Vector) hDmb.get(sDmlx.toUpperCase());
				if (vTemp == null) {
					return "";
				}
				for (int i = 0; i < vTemp.size(); i++) {
					String[] ss = (String[]) vTemp.get(i);
					System.out.println(ss[2] + "==" + sRemark.toUpperCase());
					if (ss[2].equals(sRemark.toUpperCase())) {
						return ss[0];
					}
				}
				return "";
			}

		}

		// 返回代码内容
		public String getSysDm(String sDmlx, String sDm) throws SQLException {
			if (sDmlx.equals("") || sDm == null || sDm.equals("")) {
				return "";
			} else {
				Vector vTemp = (Vector) hDmb.get(sDmlx.toUpperCase());
				if (vTemp == null) {
					return "";
				}
				for (int i = 0; i < vTemp.size(); i++) {
					String[] ss = (String[]) vTemp.get(i);
					if (ss[0].equals(sDm.toUpperCase())) {
						return ss[1];
					}
				}
				return "";
			}

		}

		// 返回remark内容
		public String getSysRemark(String sDmlx, String sDm) throws SQLException {
			if (sDmlx.equals("") || sDm == null || sDm.equals("")) {
				return "";
			} else {
				Vector vTemp = (Vector) hDmb.get(sDmlx.toUpperCase());
				if (vTemp == null) {
					return "";
				}
				for (int i = 0; i < vTemp.size(); i++) {
					String[] ss = (String[]) vTemp.get(i);
					if (ss[0].equals(sDm.toUpperCase())) {
						return ss[2];
					}
				}
				return "";
			}

		}
}
