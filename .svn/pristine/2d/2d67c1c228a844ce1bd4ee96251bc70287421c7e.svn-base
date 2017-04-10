<%@include file="jspheader.inc"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html;charset=GBK"%> 
<html><head><title>经营情况</title></head>
<jsp:useBean id="GGGL_JYDW_JYQK" scope="page" class="com.macrosoft.icms.ggxkz.GGGL_JYDW_JYQK">
	<jsp:setProperty name="GGGL_JYDW_JYQK" property="*"/>
</jsp:useBean>
<body>
<%	
	String ADBULICNO = GGGL_JYDW_JYQK.doPreProcess(request.getParameter("ADBULICNO"));
	int INSYEAR=Integer.parseInt(request.getParameter("INSYEAR"));
	System.out.println("ADBULICNO="+ADBULICNO+"——INSYEAR="+INSYEAR);
	GGGL_JYDW_JYQK.setADBULICNO(ADBULICNO);
	GGGL_JYDW_JYQK.setINSYEAR(INSYEAR);
	if(GGGL_JYDW_JYQK.doCount()){
	   if (GGGL_JYDW_JYQK.doJBModify())
			out.print(SysUtility.setAlertScript("数据修改成功!","parent.window.location.reload();"));
	   		else
			out.print(SysUtility.setAlertScript("数据保存失败!","parent.window.location.reload();"));
	   
	}else{
	   if (GGGL_JYDW_JYQK.doAdd())
			out.print(SysUtility.setAlertScript("数据保存成功!","parent.window.location.reload();"));
		    
			else
			out.print(SysUtility.setAlertScript("数据保存失败!","parent.window.location.reload();"));
	   
	}
%>
</body></html>
 
