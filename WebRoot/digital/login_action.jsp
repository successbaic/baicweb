<%@ page errorPage="error.jsp"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<%@ page import="com.macrosoft.icms.dbc.*"%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<LINK href="images/icms.css" type="text/css" rel="stylesheet">
<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="dbc" scope="page" class="com.macrosoft.icms.dbc.DbConnection"/>
<jsp:useBean id="webuser" scope="session" class="com.macrosoft.icms.qydj.WEB_USER"/>
</head>

<body>
<%	

	int nLoginCode;
	String LOGINID=SysUtility.convertCode(request.getParameter("QYMC").replaceAll("'",""));
	String PASSWORD=SysUtility.convertCode(request.getParameter("PASSWORD").replaceAll("'",""));
	System.out.println( "用户名：" + LOGINID + "    " + "密码：******    IP地址：" + request.getRemoteHost());
	nLoginCode=webuser.validateLogin(dbc, LOGINID, PASSWORD);
	if (nLoginCode==1)
	{
		String virtualPath = "http://"+request.getHeader("Host")+request.getContextPath()+"/";
		icms.setVirtualPath(virtualPath);
		icms.setContextPath(request.getContextPath());
		application.setAttribute( "icms",icms );
		String rp="degital_list.jsp?opt=sq";
		if(0==webuser.getLEVE()){
			rp="degital_list.jsp?opt=sq";
		}else{
			rp="degital_list.jsp?opt=sp";
		}
		out.print("<script>javascript:parent.location.href='"+rp+"';</script>");
		//response.sendRedirect("main.jsp");
	}
	else if (nLoginCode==-1 || nLoginCode==-2)
	{
		out.print(SysUtility.setAlertScript("您输入的用户名或密码错误!"
		,"javascript:parent.location.href='login.jsp';"));
	}	
	else
	{
		out.print(SysUtility.setAlertScript("系统登录错误,请电话咨询!","javascript:parent.location.href='login.jsp';"));
	}
%>
</body>
</html>
<%
	dbc.close();
%>