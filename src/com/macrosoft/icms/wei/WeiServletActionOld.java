package com.macrosoft.icms.wei;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.macrosoft.icms.system.SysUtility;

public class WeiServletActionOld extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8603909526553150728L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//request.setCharacterEncoding("GBK");
		response.setCharacterEncoding("GBK");
		response.setContentType("text/html;charset=GBK");
		
		dispachMethod(request,response);
	}
	

	/**
	 * 用来执行具体的请求操作
	 */
	public void dispachMethod(HttpServletRequest request,HttpServletResponse response)
	{
		try 
		{
			String url=request.getRequestURI();
			
			String className = url.substring(url.lastIndexOf("/") + 1,url.lastIndexOf(".do"));
			String methodName = request.getParameter("method");
			//Class dispachAction = this.getClass();

			Object obj = Class.forName("com.macrosoft.icms.wei."+className).newInstance(); 
            
			Method method = obj.getClass().getMethod(methodName, HttpServletRequest.class,HttpServletResponse.class);
			
			Object[] parameterVlaues = new Object[]{request,response};
			method.invoke(obj, request,response);
			
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			/*request.setAttribute("errorMessage", e.getMessage());
			String classname  =  e.getTargetException().getClass().getSimpleName();
			System.out.println("aaaaaaaaaaaaaaaaaa"+classname);*/
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}