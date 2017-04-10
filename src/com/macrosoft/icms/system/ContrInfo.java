package com.macrosoft.icms.system;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.Properties;

import com.macrosoft.icms.util.PropertiesConfigUtil;

public class ContrInfo {
	//public static boolean ifdoshengju=true;	
	//public static String bushumoshi="SHENGJU";
	
	public static boolean ifdoshengju=false;	
	public static String bushumoshi;
	public static String yxjkurl="";
	private static ContrInfo contrinfo = new ContrInfo();
	
	static{
		if(bushumoshi==null || "".equals(bushumoshi)){		
			bushumoshi=PropertiesConfigUtil.getValue("bushumoshi");
			if("ALL".equals(bushumoshi) || "SHENGJU".equals(bushumoshi)){
				ifdoshengju=true;
			}
		}
	}
	public static String getYxjkurl(){
		if(yxjkurl==null || yxjkurl.equals("")){
			System.out.println("first");
			yxjkurl=PropertiesConfigUtil.getValue("yxjkurl");
			System.out.println("get"+yxjkurl);
		}
		System.out.println("last"+yxjkurl);
		return yxjkurl;
	}
	public static String getMczssql_shengju(String sjcode,String xzqh) {
		String whesql= " AND APPRAUTH='"+sjcode+"' AND PREREGORG IN (select coding from com_djjg where (coding='"+xzqh+"' or pcoding ='"+xzqh+"'))";
		if(bushumoshi.equals("ALL")){
			whesql=" AND APPRAUTH='"+sjcode+"'  AND PREREGORG IN (select coding from com_djjg where (coding='"+xzqh+"' or pcoding ='"+xzqh+"' or coding='"+sjcode+"'))";
		}else if(bushumoshi.equals("SHENGJU")){
			whesql=" AND PREREGORG='"+sjcode+"' ";
		}
		return whesql;
	}
	
	public static String getMczssql_dishi(String xzqh) {
		String whesql= " AND APPRAUTH IN (select coding from com_djjg where (coding='"+xzqh+"' or pcoding ='"+xzqh+"'))";
		if(bushumoshi.equals("SHENGJU")){
			whesql= " AND PREREGORG ='"+xzqh+"' ";
		}else if(bushumoshi.equals("ALL")){//考虑到会有较大改动，暂时使用截取的方式获取省局代码
			whesql= " AND APPRAUTH IN (select coding from com_djjg where (coding='"+xzqh+"' or pcoding ='"+xzqh+"' or coding='"+xzqh.substring(0,2)+"0000'))";
		}
		return whesql;
	}
	
	public static String getDjzssql_shengju(String xzqh) {
		return "";
	}
	
	public static String getDjzssql_dishi(String sjcode,String xzqh) {
		String whesql= " AND REGORG IN (select coding from com_djjg where (coding='"+xzqh+"' or pcoding ='"+xzqh+"'))";
		if(bushumoshi.equals("ALL")){
			whesql= " AND REGORG IN (select coding from com_djjg where (coding='"+xzqh+"' or pcoding ='"+xzqh+"' or coding='"+sjcode+"'))";
		}else if(bushumoshi.equals("SHENGJU")){
			whesql= " AND REGORG ='"+sjcode+"' ";
		}
		return whesql;
	}
	
	public static String getDiShiOption(SysSystem system,String xzqh) throws SQLException{
		String options="";
		if(bushumoshi.equals("SHENGJU")){
			options="<option value=''></option>";
			options+=system.getSysDmListByRemark("XZQH","2");
		}else{
			options="<option value='"+xzqh+"'>"+system.getSysDm("XZQH",xzqh)+"</option>";
		}
		return options;
	}
	
	public static String getBenShiQuXianOption(SysSystem system,String xzqh,String CITY)throws SQLException{
		String options="";
		if(bushumoshi.equals("SHENGJU")){
			if(!CITY.equals("")){
				options="<option value=''></option>";
				options+=system.getSysDmListByRemark("DISCOUS",CITY);
			}
		}else{
			options=system.getSysDmListByRemark("DISCOUS",xzqh);
		}
		return options;
	}
}
