<%@include file="jspheader.inc"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html;charset=GBK"%> 
<html><head><title>分支机构信息</title></head>
<jsp:useBean id="GGGL_JYDW_FZJG" scope="page"  class="com.macrosoft.icms.ggxkz.GGGL_JYDW_FZJG">
	<jsp:setProperty name="GGGL_JYDW_FZJG" property="*"/>
</jsp:useBean>
<body>
<%	
	String action = GGGL_JYDW_FZJG.doPreProcess(request.getParameter("action"));
	String RECID = GGGL_JYDW_FZJG.doPreProcess(request.getParameter("RECID"));
	String ADBULICNO = GGGL_JYDW_FZJG.doPreProcess(request.getParameter("ADBULICNO"));
	String INSYEAR=GGGL_JYDW_FZJG.doPreProcess(request.getParameter("INSYEAR"));
	System.out.println(action+"——"+RECID+"——"+ADBULICNO+"——"+INSYEAR);

		if(action.equals("1"))//添加
		{  
			int max =GGGL_JYDW_FZJG.getListMax(" where ADBULICNO='"+ADBULICNO+"' and INSYEAR="+INSYEAR);
		    GGGL_JYDW_FZJG.setADBULICNO(ADBULICNO);
		    GGGL_JYDW_FZJG.setINSYEAR(Integer.parseInt(INSYEAR));
			GGGL_JYDW_FZJG.setRECID(max+1);
			if (GGGL_JYDW_FZJG.doAdd())
			out.print(SysUtility.setAlertScript("数据保存成功!","parent.window.location.reload();"));
		    
			else
			out.print(SysUtility.setAlertScript("数据保存失败!","parent.window.location.reload();"));
		}
		else if(action.equals("2"))//修改
		{				
			if (GGGL_JYDW_FZJG.doModify())
			out.print(SysUtility.setAlertScript("数据修改成功!","parent.window.location.reload();"));
	   		else
			out.print(SysUtility.setAlertScript("数据保存失败!","parent.window.location.reload();"));
		}
		else if(action.equals("3"))//删除
		{
			if (GGGL_JYDW_FZJG.doDelete()){
			out.print(SysUtility.setAlertScript("数据删除成功!","parent.window.location.reload();"));
	   		}else{
			out.print(SysUtility.setAlertScript("数据保存失败!","parent.window.location.reload();"));
		    }
		}
%>
</body></html>
 
