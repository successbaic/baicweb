<%@ page errorPage="error.jsp"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<%@ page import="com.macrosoft.icms.dbc.*"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="dbc" scope="page" class="com.macrosoft.icms.dbc.DbConnection"/>
<%
	//对系统Application参数进行初始化
	String username;//企业名称
	String question;
	String answer;
	String opt  = request.getParameter("opt");
	if("getQuestion".equals(opt)){
		username=com.macrosoft.icms.system.SysUtility.convertCode(request.getParameter("username"));
		String sql=" select question from web_user where username='"+username+"'  ";
		ResultSet rs = dbc.executeQuery(sql);
		question="";
		while(rs.next()){
			question=rs.getString("QUESTION");
		}
		if(null==question||"".equals(question)){
			question="您输入信息有误,请确认后重新输入";
		}
		System.out.println(question);
		rs.close();
		dbc.close();	
		String CONTENT_TYPE = "text/xml; charset=GBK"; 
		response.setContentType(CONTENT_TYPE); 
		out.write(question); 	
	}else{
 	username=com.macrosoft.icms.system.SysUtility.convertCode(request.getParameter("username"));
 	question=com.macrosoft.icms.system.SysUtility.convertCode(request.getParameter("question"));
 	answer=request.getParameter("answer");

	String sql=" select password from web_user where username='"+username+"' and question='"+question+"' and answer='"+answer+"'";
	String password="";
	ResultSet rs = dbc.executeQuery(sql);
	while(rs.next()){
		password=rs.getString("PASSWORD");
	}
	if(null==password||"".equals(password)){
		password="您输入信息有误,请确认后重新输入";
	}
	System.out.println(password);
	rs.close();
	dbc.close();	
	String CONTENT_TYPE = "text/xml; charset=GBK"; 

	response.setContentType(CONTENT_TYPE); 
	out.write(password); 
	}
	

%>

