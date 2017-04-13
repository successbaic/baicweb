package com.macrosoft.icms.wei;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;

public class ServletUtil {

	public static <T> T request2Bean(HttpServletRequest request,   //返回值为随意的类型   传入参数为request 和该随意类型
			T bean) {
		try {
			Enumeration en = request.getParameterNames();   //获得参数的一个列举  
			while (en.hasMoreElements()) {         //遍历列举来获取所有的参数
				String name = (String) en.nextElement();
				String value = request.getParameter(name);
				BeanUtils.setProperty(bean, name, value);   //注意这里导入的是  import org.apache.commons.beanutils.BeanUtils; 
			}
			return bean;
		} catch (Exception e) {
			throw new RuntimeException(e);  //如果错误 则向上抛运行时异常
		}
	}
	
	public static <T> T request2Bean(HttpServletRequest request,   //返回值为随意的类型   传入参数为request 和该随意类型
			Class<T> beanClass) {
		try {
			T bean = beanClass.newInstance();   //实例化随意类型 
			Enumeration en = request.getParameterNames();   //获得参数的一个列举  
			while (en.hasMoreElements()) {         //遍历列举来获取所有的参数
				String name = (String) en.nextElement();
				String value = request.getParameter(name);
				BeanUtils.setProperty(bean, name, value);   //注意这里导入的是  import org.apache.commons.beanutils.BeanUtils; 
			}
			return bean;
		} catch (Exception e) {
			throw new RuntimeException(e);  //如果错误 则向上抛运行时异常
		}
	}
}
