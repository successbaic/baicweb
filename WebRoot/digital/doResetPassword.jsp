<%@ page errorPage="error.jsp"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<%@ page import="com.macrosoft.icms.dbc.*"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="dbc" scope="page" class="com.macrosoft.icms.dbc.DbConnection"/>
<%
	//��ϵͳApplication�������г�ʼ��
	String username;//��ҵ����
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
			question="��������Ϣ����,��ȷ�Ϻ���������";
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
		password="��������Ϣ����,��ȷ�Ϻ���������";
	}
	System.out.println(password);
	rs.close();
	dbc.close();	
	String CONTENT_TYPE = "text/xml; charset=GBK"; 

	response.setContentType(CONTENT_TYPE); 
	out.write(password); 
	}
	

%>

