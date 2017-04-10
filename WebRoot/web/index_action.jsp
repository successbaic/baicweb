<%@ page errorPage="error.jsp"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<%@ page import="com.macrosoft.icms.dbc.*"%>
<%@ page import="com.macrosoft.icms.qydj.WSDJ_PARAM_CFG"%>

<html>
<head>
<title>��ҵ���ϵǼ�ϵͳ</title>
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
		out.print(SysUtility.setAlertScript("��֤���������!","javascript:parent.window.location.reload();"));
		return;
	}
	String CJLX=SysUtility.doPreProcess(request.getParameter("CJLX"));
	if(CJLX.equals("")){
		CJLX="0";
	}
	int nLoginCode=0;
	String LOGINID=SysUtility.convertCode(request.getParameter("LOGINID").replaceAll("'",""));
	String PASSWORD=SysUtility.convertCode(request.getParameter("PASSWORD").replaceAll("'",""));
	//String PINMA=SysUtility.convertCode(request.getParameter("PINMA").replaceAll("'",""));//��ͣʹ��2016.10.17
	//String cert=SysUtility.convertCode(request.getParameter("cert").replaceAll("'",""));//��ͣʹ��2016.10.17
	//String name=SysUtility.convertCode(request.getParameter("NAME").replaceAll("'",""));//��ͣʹ��2016.10.17
	//String idnum=SysUtility.convertCode(request.getParameter("IDNUM").replaceAll("'",""));//��ͣʹ��2016.10.17
	
	//��������begin20161025--------------------------------------------------
	int forbidFlag = WSDJ_PARAM_CFG.validateLoginParam("FORBIDLOGINID",LOGINID);
	if(forbidFlag==1){
		out.print(SysUtility.setAlertScript("��ǰ�û��������¼!",""));
		return;
	}
	int forbidIpFlag = WSDJ_PARAM_CFG.validateLoginParam("FORBIDLOGINIP",request.getRemoteHost());
	if(forbidIpFlag==1){
		out.print(SysUtility.setAlertScript("��ǰIP�������¼!",""));
		return;
	}
	//��������end20161025----------------------------------------------------
	   
	if(!LOGINID.equals("")&&!PASSWORD.equals("")){
		System.out.println( "�û�����" + LOGINID + "    " + "���룺******    IP��ַ��" + request.getRemoteHost());
		nLoginCode=webuser.validateLogin(dbc, LOGINID, PASSWORD);
	}
	/* if(!PINMA.equals("")&&!cert.equals("")){//��ͣʹ��2016.10.17
		System.out.println( "����Ӫҵִ�յ�¼  PIN��" + PINMA + "   IP��ַ��" + request.getRemoteHost());
		nLoginCode=webuser.validateLogin2(dbc, PINMA, cert);
	} */
	/* if(!name.equals("")&&!idnum.equals("")){//��ͣʹ��2016.10.17
		System.out.println( "EID��¼  �û���" + name + "   IP��ַ��" + request.getRemoteHost());
		String result=SysUtility.convertCode(request.getParameter("result").replaceAll("'",""));
		String issuer=SysUtility.convertCode(request.getParameter("issuer").replaceAll("'",""));
		String certSn=SysUtility.convertCode(request.getParameter("certSn").replaceAll("'",""));
		String issuerSn=SysUtility.convertCode(request.getParameter("issuerSn").replaceAll("'",""));
		String toSignData=SysUtility.convertCode(request.getParameter("toSignData").replaceAll("'",""));
		String subject=SysUtility.convertCode(request.getParameter("subject").replaceAll("'","")); */ 
		//System.out.println("name:"+name+" idnum:"+idnum+" issuer:"+issuer+" issuerSn:"+issuerSn+" toSignData:"+toSignData+" subject:"+subject+" result:"+result+" certSn:"+certSn);
		    /* String name1="������";
			String idnum2="342422198807163633";
			String issuer="eID MIC2";
			String issuerSn="022012";
			String certSn="1000000000000351";
			String subject="1JVPSkcZeKYMkPxXlwFldY1OVXBQW6epZR7QuufUKmRk=000";
			String toSignData="MjAxNjA3MjYxMzM3NDE6MjAxNjA3MjYxMzM3NDE6ZGF0YQ==";
			String result="uEUwfxe7q0x6vviW4Y50t6RNnEoafo8zeV11SOriD2wxhgpXOC2TkpXev8pZH8fCTawND6EkV13NiLePdW09UA=="; */
	/* 	nLoginCode=webuser.validateLogin3(dbc,name, idnum, result, issuer, certSn, issuerSn, toSignData,subject);
		System.out.println(nLoginCode);
	} */
	
	if (nLoginCode==1)
	{
		String virtualPath = "http://"+request.getHeader("Host")+request.getContextPath()+"/";
		icms.setVirtualPath(virtualPath);
		icms.setContextPath(request.getContextPath());
		String XZQH=webuser.getXZQH();
		icms.setSanZheng(XZQH);
		application.setAttribute( "icms",icms );
		String rp="index.jsp";
		//if(!CJLX.equals("0")){
		//	rp+="?CJLX="+CJLX;
		//}else{
		//}
		out.print("<script>javascript:parent.location.href='../"+rp+"';</script>");
		//response.sendRedirect("main.jsp");
	}
	else if (nLoginCode==-1 || nLoginCode==-2)
	{
		String str = "window.parent.document.getElementById(\"LOGINID\").value = '';";
		str+=" window.parent.document.getElementById(\"PASSWORD\").value = '';";
		str+= " window.parent.document.getElementById(\"validateCode\").value = '';";
		str+= " window.parent.document.getElementById(\"validateImage\").click();";
		out.print(SysUtility.setAlertScript("��������û������������!"
		,str));
	}	
	else
	{
		out.print(SysUtility.setAlertScript("��ҵ���Ϲ���ϵͳ��¼����,��绰��ѯ!","javascript:parent.window.location.reload();"));
	}
%>
</body>
</html>
<%
	dbc.close();
%>