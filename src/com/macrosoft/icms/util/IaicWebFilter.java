package com.macrosoft.icms.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IaicWebFilter extends HttpServlet implements Filter{

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain dochain) throws IOException, ServletException {
		 String webname=((HttpServletRequest) request).getContextPath();
		 String url=((HttpServletRequest) request).getRequestURI();
		 //System.out.println(url+"---come-------"+webname);
		 if(url.indexOf(".")>1 || url.equals(webname+"/")){
			
		 }else{
			 ((HttpServletResponse) response).sendRedirect(webname+"/limit.jsp");
		 }
		 XssHttpServletRequestWrapper xssRequest = new XssHttpServletRequestWrapper((HttpServletRequest) request); 
		 
		dochain.doFilter(xssRequest, response);
		
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	 private static String xssEncode(String s) {  
	        if (s == null || "".equals(s)) {  
	            return s;  
	        }  
	        StringBuilder sb = new StringBuilder(s.length() + 16);  
	        for (int i = 0; i < s.length(); i++) {  
	            char c = s.charAt(i);  
	            switch (c) {  
	            case '>':  
	                sb.append('＞');//全角大于号  
	                break;  
	            case '<':  
	                sb.append('＜');//全角小于号  
	                break;  
	            case '\'':  
	                sb.append('‘');//全角单引号  
	                break;  
	            case '\"':  
	                sb.append('“');//全角双引号  
	                break;  
	            case '&':  
	                sb.append('＆');//全角  
	                break;  
	            case '\\':  
	                sb.append('＼');//全角斜线  
	                break;  
	            case '#':  
	                sb.append('＃');//全角井号  
	                break;  
	            default:  
	                sb.append(c);  
	                break;  
	            }  
	        }  
	        return sb.toString();  
	    }  
}
