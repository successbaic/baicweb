<%@ page errorPage="error.jsp"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.system.*"%>
<%@ page import="com.macrosoft.icms.dbc.*"%>
<%@ page import="com.macrosoft.icms.util.IPTIMESTAMP"%>
<%@ page import="com.jspsmart.upload.SmartUpload" %>
<%@ page import="com.macrosoft.icms.util.IPTIMESTAMP"%>
<jsp:useBean id='UPLOAD_FILE' scope='page' class='com.macrosoft.icms.util.CommonUPLOAD_FILE'/>
<jsp:useBean id="IPTimeStamp" scope="page"  class="com.macrosoft.icms.util.IPTIMESTAMP"/>

<html>
<head>
<title>企业网上登记系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<LINK href="images/icms.css" type="text/css" rel="stylesheet">
<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<jsp:useBean id="dbc" scope="page" class="com.macrosoft.icms.dbc.DbConnection"/>
<jsp:useBean id="DIGITAL_SQ" scope="page" class="com.macrosoft.icms.digital.DIGITAL_SQ">
	<jsp:setProperty name="DIGITAL_SQ" property="*"/>
</jsp:useBean>
</head>

<body>
<%
if(null!=DIGITAL_SQ.getID()&&!"".equals(DIGITAL_SQ.getID())){
	if(DIGITAL_SQ.doModify(dbc)){
		String str="<script language='javascript'>";
			str+="alert('操作成功！');";
			//str+="parent.window.close();";
			str+="</script>";
			out.print(str);
	}else{
		out.print(SysUtility.setAlertScript("数据保存失败!",""));
	}
}else{
	DIGITAL_SQ.setPICNAME(UPLOAD_FILE.getFILEID());

	if(DIGITAL_SQ.doAdd(dbc)){
		String str="<script language='javascript'>";
			str+="alert('操作成功！');";
			//str+="parent.window.close();";
			str+="</script>";
			out.print(str);
	}else{
		out.print(SysUtility.setAlertScript("数据保存失败!",""));
	}
	
}

%>
</html>
<%
dbc.close();
%>