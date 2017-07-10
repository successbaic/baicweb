package com.macrosoft.icms.wei;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import net.sf.json.JSONObject;

public class WeiActionUtil {
	public static String XZQH="370100";
	public static String SJ="370000";
	
	public static String errorReturn(String info){
		Map map=new HashMap();
		map.put("status", "2");
		map.put("info",info);
		JSONObject jsonObject = JSONObject.fromObject(map);
		return jsonObject.toString();
	}
	
	public static <T>T json2pojo(String jsonStr,Class<T> beanClass){    
        JSONObject jsonObj = JSONObject.fromObject(jsonStr);    
        T obj = (T) JSONObject.toBean(jsonObj, beanClass);    
        return obj;    
    }  
	
	public static String getJsonValueByKey(String jsonStr,String key){
		JSONObject jsonObject = new JSONObject();
		jsonObject = jsonObject.fromObject(jsonStr);//将String转为JSON数据
		String content = "";
		try{
			content=jsonObject.getString(key);
		}catch(Exception e){
			
		}
		return content;
	}
}
