<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<html><head><title>许可信息</title></head>
<jsp:useBean id="QYDJ_XKXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_XKXX_SQ">
	<jsp:setProperty name="QYDJ_XKXX" property="*"/>
</jsp:useBean>

<body>
<%	
	String action = QYDJ_XKXX.doPreProcess(request.getParameter("action"));
	String RECID = QYDJ_XKXX.doPreProcess(request.getParameter("RECID"));
	String OPENO = QYDJ_XKXX.doPreProcess(request.getParameter("OPENO"));
	//int max =QYDJ_XKXX.getListMax(" where OPENO='"+OPENO+"'");
 
		if(action.equals("1"))//添加
		{  		 
		    QYDJ_XKXX.setOPENO(OPENO);
			QYDJ_XKXX.setRECID(SysUtility.getUUID20());
			if (QYDJ_XKXX.doAdd())
			out.print(SysUtility.setAlertScript("数据保存成功!","parent.window.location.reload();"));
		    
			else
			out.print(SysUtility.setAlertScript("数据保存失败!","parent.window.location.reload();"));
		}
		else if(action.equals("2"))//修改
		{				
			if (QYDJ_XKXX.doModify())
			out.print(SysUtility.setAlertScript("数据修改成功!","parent.window.location.reload();"));
	   		else
			out.print(SysUtility.setAlertScript("数据保存失败!","parent.window.location.reload();"));
		}
		else if(action.equals("3"))//删除
		{

			if (QYDJ_XKXX.doDelete()){
			out.print(SysUtility.setAlertScript("数据删除成功!","parent.window.location.reload();"));
	   		}else{
			out.print(SysUtility.setAlertScript("数据保存失败!","parent.window.location.reload();"));
		    }
		}		
%>
</body></html>