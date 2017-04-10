package com.macrosoft.icms.util;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Properties;

public class PropertiesConfigUtil {

	private static Properties props = 
		new Properties();
	static{
		InputStream ips = 
			PropertiesConfigUtil.class.getClassLoader()
			.getResourceAsStream("iaicweb.properties");
		try {
			props.load(new InputStreamReader(ips,"GBK"));
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			try {
				ips.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static String getValue(String key){
		return props.getProperty(key);
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		System.out.println(getValue("deployregorg"));
		
	}
}