package com.macrosoft.icms.util;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class Constants extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 8832171365429273389L;
	// 项目路径名
	public static String PROJECT_NAME = "";

	public void init(ServletConfig config) throws ServletException {
		// 在这里做相应的处理
		Constants.PROJECT_NAME = "/"+config.getServletName()+"/";
//		String filename = config.getInitParameter("filename");
	}
	@Override
	public ServletContext getServletContext() {
		return super.getServletContext();
	}
	@Override
	public void init() throws ServletException {
		super.init();
	}
	@Override
	public ServletConfig getServletConfig() {
		return super.getServletConfig();
	}
	public void destroy() {
	}
}
