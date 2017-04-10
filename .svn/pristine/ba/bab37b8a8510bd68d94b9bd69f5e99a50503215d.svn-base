<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="DCDY_DYWXX" scope="page" class="com.macrosoft.icms.htgl.DCDY_DYWXX_SQ">
	<jsp:setProperty name="DCDY_DYWXX" property="*"/>
</jsp:useBean>
<html>
<head>
<title>抵押物信息</title>
</head>
<body>
<%	
	String action = DCDY_DYWXX.doPreProcess(request.getParameter("action"));
	String RECID = DCDY_DYWXX.doPreProcess(request.getParameter("RECID"));
	String OPENO = DCDY_DYWXX.doPreProcess(request.getParameter("OPENO"));
	int max =DCDY_DYWXX.getListMax(" where OPENO='"+OPENO+"'");
		if(action.equals("1"))//添加
		{		 
		    DCDY_DYWXX.setOPENO(OPENO);
			DCDY_DYWXX.setRECID(max+1);
			if (DCDY_DYWXX.doAdd()){
			out.print(SysUtility.setAlertScript("添加抵押物信息成功!","parent.window.location.reload();"));
			}else{			
			out.print(SysUtility.setAlertScript("添加抵押物信息失败!","parent.window.location.reload();"));
			}
		}
		else if(action.equals("2"))//修改
		{				
			if (DCDY_DYWXX.doModify())
			out.print(SysUtility.setAlertScript("修改抵押物信息成功!","parent.window.location.reload();"));
	   		else
			out.print(SysUtility.setAlertScript("修改抵押物信息失败!","parent.window.location.reload();"));
		}
		else if(action.equals("3"))//删除
		{
			if (DCDY_DYWXX.doDelete()){			
			out.print(SysUtility.setAlertScript("删除抵押物信息成功!","parent.window.location.reload();"));
	   		}else{
			out.print(SysUtility.setAlertScript("删除抵押物信息失败!","parent.window.location.reload();"));
		    }
		}		
%>
</body>
</html>