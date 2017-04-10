<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="QYDJ_FZJG" scope="page" class="com.macrosoft.icms.qydj.QYDJ_FZJG_SQ">
	<jsp:setProperty name="QYDJ_FZJG" property="*"/>
</jsp:useBean>
<html><head><title>投资人信息</title></head>
<body>
<%	
	String action = QYDJ_FZJG.doPreProcess(request.getParameter("action"));
	String RECID = QYDJ_FZJG.doPreProcess(request.getParameter("RECID"));
	String OPENO = QYDJ_FZJG.doPreProcess(request.getParameter("OPENO"));
	//int max =QYDJ_FZJG.getListMax(" where OPENO='"+OPENO+"'");
		if(action.equals("1"))//添加
		{		 
		    QYDJ_FZJG.setOPENO(OPENO);
			QYDJ_FZJG.setRECID(SysUtility.getUUID20());
			if (QYDJ_FZJG.doAdd()){
			out.print(SysUtility.setAlertScript("数据保存成功!","parent.window.location.reload();"));
			}else{			
			out.print(SysUtility.setAlertScript("数据保存失败!","parent.window.location.reload();"));
			}
		}
		else if(action.equals("2"))//修改
		{				
			if (QYDJ_FZJG.doModify())
			out.print(SysUtility.setAlertScript("数据修改成功!","parent.window.location.reload();"));
	   		else
			out.print(SysUtility.setAlertScript("数据保存失败!","parent.window.location.reload();"));
		}
		else if(action.equals("3"))//删除
		{

			if (QYDJ_FZJG.doDelete()){			
			out.print(SysUtility.setAlertScript("数据删除成功!","parent.window.location.reload();"));
	   		}else{
			out.print(SysUtility.setAlertScript("数据保存失败!","parent.window.location.reload();"));
		    }
		}
	
		
%>
</body></html>