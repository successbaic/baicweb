<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<html>
<head>
<title>企业网上登记系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<LINK href="images/icms.css" type="text/css" rel="stylesheet">
<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="dbc" scope="page" class="com.macrosoft.icms.dbc.DbConnection"/>
<jsp:useBean id="webuser" scope="session" class="com.macrosoft.icms.qydj.WEB_USER"/>
</head>

<body>
<%	
	String abcd=SysUtility.doPreProcess(request.getParameter("abcd"));
	String YZCODE=SysUtility.doPreProcess(request.getParameter("YZCODE"));
	if(!abcd.equals(YZCODE)){
		out.print(SysUtility.setAlertScript("验证码输入错误!","javascript:window.close();"));
		return;
	}
	String CJLX=SysUtility.doPreProcess(request.getParameter("CJLX"));
	String CDDL=SysUtility.doPreProcess(request.getParameter("CDDL"));
	if(CJLX.equals("")){
		CJLX="0";
	}
	int nLoginCode;
	String LOGINID=SysUtility.convertCode(request.getParameter("LOGINID").replaceAll("'",""));
	String PASSWORD=SysUtility.convertCode(request.getParameter("PASSWORD").replaceAll("'",""));
	System.out.println( "用户名：" + LOGINID + "    " + "密码：******    IP地址：" + request.getRemoteHost());
	nLoginCode=webuser.validateLogin(dbc, LOGINID, PASSWORD);
	System.out.println(nLoginCode+"---------");
	if (nLoginCode==1)
	{
		String virtualPath = "http://"+request.getHeader("Host")+request.getContextPath()+"/";
		icms.setVirtualPath(virtualPath);
		icms.setContextPath(request.getContextPath());
		application.setAttribute( "icms",icms );
		String rp="";
		if(CDDL.equals("0")){
			rp="../main.jsp?CJLX="+CJLX+"&CDDL="+CDDL+"&OPETYPE=10&SIGN=0&STEP=0";
		}else{
			rp="../welcSecond.jsp?CJLX="+CJLX+"&CDDL="+CDDL;
		}
		System.out.println(rp);
		
		out.print("<script>javascript:;parent.window.location.href='"+rp+"';</script>");
		//response.sendRedirect("main.jsp");
	}
	else if (nLoginCode==-1 || nLoginCode==-2)
	{
		out.print(SysUtility.setAlertScript("您输入的用户名或密码错误!"
		,"javascript:window.close();"));
	}	
	else
	{
		out.print(SysUtility.setAlertScript("企业网上工商系统登录错误,请电话咨询!","javascript:parent.window.location.reload();window.close();"));
	}
%>
</body>
</html>
<%
	dbc.close();
%>