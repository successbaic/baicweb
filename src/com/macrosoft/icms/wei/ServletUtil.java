package com.macrosoft.icms.wei;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;

public class ServletUtil {

	public static <T> T request2Bean(HttpServletRequest request,   //����ֵΪ���������   �������Ϊrequest �͸���������
			T bean) {
		try {
			Enumeration en = request.getParameterNames();   //��ò�����һ���о�  
			while (en.hasMoreElements()) {         //�����о�����ȡ���еĲ���
				String name = (String) en.nextElement();
				String value = request.getParameter(name);
				BeanUtils.setProperty(bean, name, value);   //ע�����ﵼ�����  import org.apache.commons.beanutils.BeanUtils; 
			}
			return bean;
		} catch (Exception e) {
			throw new RuntimeException(e);  //������� ������������ʱ�쳣
		}
	}
	
	public static <T> T request2Bean(HttpServletRequest request,   //����ֵΪ���������   �������Ϊrequest �͸���������
			Class<T> beanClass) {
		try {
			T bean = beanClass.newInstance();   //ʵ������������ 
			Enumeration en = request.getParameterNames();   //��ò�����һ���о�  
			while (en.hasMoreElements()) {         //�����о�����ȡ���еĲ���
				String name = (String) en.nextElement();
				String value = request.getParameter(name);
				BeanUtils.setProperty(bean, name, value);   //ע�����ﵼ�����  import org.apache.commons.beanutils.BeanUtils; 
			}
			return bean;
		} catch (Exception e) {
			throw new RuntimeException(e);  //������� ������������ʱ�쳣
		}
	}
}
