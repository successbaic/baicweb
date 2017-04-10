<%@include file="jspheader.inc"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html;charset=GBK"%> 
<html><head><title>基本管理制度建立和执行情况</title></head>
<jsp:useBean id="GGGL_JYDW_GLZD" scope="page" class="com.macrosoft.icms.ggxkz.GGGL_JYDW_GLZD">
	<jsp:setProperty name="GGGL_JYDW_GLZD" property="*"/>
</jsp:useBean>
<body>
<%	
	String ADBULICNO = GGGL_JYDW_GLZD.doPreProcess(request.getParameter("ADBULICNO"));
	int INSYEAR=Integer.parseInt(request.getParameter("INSYEAR"));
	GGGL_JYDW_GLZD.setADBULICNO(ADBULICNO);
	GGGL_JYDW_GLZD.setINSYEAR(INSYEAR);
	if(GGGL_JYDW_GLZD.doCount()){
	   if (GGGL_JYDW_GLZD.doModify())
			out.print(SysUtility.setAlertScript("数据修改成功!","parent.window.location.reload();"));
	   else
			out.print(SysUtility.setAlertScript("数据保存失败!","parent.window.location.reload();")); 
	}else{
	   if (GGGL_JYDW_GLZD.doAdd())
			out.print(SysUtility.setAlertScript("数据保存成功!","parent.window.location.reload();")); 
			else
			out.print(SysUtility.setAlertScript("数据保存失败!","parent.window.location.reload();"));
	}
%>
</body></html>
 
