<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<html>
<head>
<title>��ҵ���ϵǼ�ϵͳ</title>
<jsp:useBean id="WEB_USER_EXPRESS" scope="page" class="com.macrosoft.icms.ems.WEB_USER_EXPRESS">
	<jsp:setProperty name="WEB_USER_EXPRESS" property="*"/>
</jsp:useBean>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
</head>

<body>
<%	
	String name=SysUtility.doPreProcess(request.getParameter("NAME"));
	String tel=SysUtility.doPreProcess(request.getParameter("TEL"));
	String add = SysUtility.doPreProcess(request.getParameter("ADDRESS"));
	String OPENO =SysUtility.doPreProcess(request.getParameter("OPENO"));
	String method =SysUtility.doPreProcess(request.getParameter("method"));
	
	if(null==name||"".equals(name)||"".equals(name.trim())){
		out.print(SysUtility.setAlertScript("�û�������Ϊ��!","javascript:window.close();"));
		return;
	}
	if(null==tel||"".equals(tel)||"".equals(tel.trim())){
		out.print(SysUtility.setAlertScript("�绰���벻��Ϊ��!","javascript:window.close();"));
		return;
	}
	if(null==add||"".equals(add)||"".equals(add.trim())){
		out.print(SysUtility.setAlertScript("��ַ����Ϊ��!","javascript:window.close();"));
		return;
	}
	
	boolean bl=false;
	WEB_USER_EXPRESS.setOPENO(OPENO);
	if(WEB_USER_EXPRESS.doCount()){
		bl=WEB_USER_EXPRESS.doModify();
	}else{
		bl=WEB_USER_EXPRESS.doAdd();
	}
	QYDJ_YWSB.setOPENO(OPENO);
	QYDJ_YWSB.doSelect();
	QYDJ_YWSB.setSTATUS("9");
	if (bl&&QYDJ_YWSB.doModify())
	{
		out.print(SysUtility.setAlertScript("����ɹ�!","javascript:window.returnValue=true;window.close();"));
	}else{
		out.print(SysUtility.setAlertScript("����ʧ��!","javascript:window.close();"));
	}
%>
</body>
</html>