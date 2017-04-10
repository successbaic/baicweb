package com.macrosoft.icms.commAjax;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.macrosoft.icms.util.SYS_DMDZ;

import net.sf.json.JSONArray;

public class CommonAjaxAction extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// 用于处理客户端发送的GET请求

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=GB2312");// 这条语句指明了向客户端发送的内容格式和采用的字符编码．
		String method = request.getParameter("method");
		if("getPubCant".equals(method)){
			getPubCant(request,response);
		}
	}

	// 用于处理客户端发送的POST请求
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
		// 这条语句的作用是，当客户端发送POST请求时，调用doGet()方法进行处理
	}
	public void getPubCant(HttpServletRequest request, HttpServletResponse response){
		String supercode = request.getParameter("supercode");
		COM_DM dmdz = new COM_DM();
		String sqlWhere = " type ='DISTRICT' ";
		if(supercode.endsWith("0000")){
			sqlWhere = sqlWhere+" and code like '____00'";
		}else{
			sqlWhere = sqlWhere+" and code like '"+supercode.substring(0, 4)+"__'";
		}
		sqlWhere = sqlWhere+" and code!='"+supercode+"'";
		try {
			String res="";
			List list = dmdz.getList(sqlWhere);
			for(int i=0;i<list.size();i++){
				COM_DM pub = (COM_DM)list.get(i);
				res = res+"{\"CANT_CODE\":\""+pub.getCODE()+"\",\"CANT_NAME\":\""+pub.getREMARK()+"\"}";
				if(i!=list.size()-1){
					res=res+",";
				}
			} 
			PrintWriter out = response.getWriter();
			out.write("["+res+"]");
			out.flush();
			out.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
