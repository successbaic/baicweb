<%@include file="jspheader.inc"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html;charset=GBK"%> 
<html><head><title>经营设备信息</title></head>
<jsp:useBean id="GGGL_JYDW_JYSB" scope="page"  class="com.macrosoft.icms.ggxkz.GGGL_JYDW_JYSB">
	<jsp:setProperty name="GGGL_JYDW_JYSB" property="*"/>
</jsp:useBean>
<body>
<%	
	String action = GGGL_JYDW_JYSB.doPreProcess(request.getParameter("action"));
	String RECID = GGGL_JYDW_JYSB.doPreProcess(request.getParameter("RECID"));
	String ADBULICNO = GGGL_JYDW_JYSB.doPreProcess(request.getParameter("ADBULICNO"));
	String INSYEAR=GGGL_JYDW_JYSB.doPreProcess(request.getParameter("INSYEAR"));
	System.out.println(action+"——"+RECID+"——"+ADBULICNO+"——"+INSYEAR);

		if(action.equals("1"))//添加
		{  
			int max =GGGL_JYDW_JYSB.getListMax(" where ADBULICNO='"+ADBULICNO+"' and INSYEAR="+INSYEAR);
		    GGGL_JYDW_JYSB.setADBULICNO(ADBULICNO);
		    GGGL_JYDW_JYSB.setINSYEAR(Integer.parseInt(INSYEAR));
			GGGL_JYDW_JYSB.setRECID(max+1);
			if (GGGL_JYDW_JYSB.doAdd())
			out.print(SysUtility.setAlertScript("数据保存成功!","parent.window.location.reload();"));
		    
			else
			out.print(SysUtility.setAlertScript("数据保存失败!","parent.window.location.reload();"));
		}
		else if(action.equals("2"))//修改
		{				
			if (GGGL_JYDW_JYSB.doModify())
			out.print(SysUtility.setAlertScript("数据修改成功!","parent.window.location.reload();"));
	   		else
			out.print(SysUtility.setAlertScript("数据保存失败!","parent.window.location.reload();"));
		}
		else if(action.equals("3"))//删除
		{
			if (GGGL_JYDW_JYSB.doDelete()){
			out.print(SysUtility.setAlertScript("数据删除成功!","parent.window.location.reload();"));
	   		}else{
			out.print(SysUtility.setAlertScript("数据保存失败!","parent.window.location.reload();"));
		    }
		}
%>
</body></html>
 
