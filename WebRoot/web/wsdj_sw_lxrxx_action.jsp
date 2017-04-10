<%@ include file="../jspheader.inc"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="SW_LXRXX" scope="page"
	class="com.macrosoft.icms.bean.SW_LXRXX">
<jsp:setProperty name="SW_LXRXX" property="*"/>
</jsp:useBean>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<body>
<%	
	String action = SW_LXRXX.doPreProcess(request.getParameter("action"));
	String RECID = SW_LXRXX.doPreProcess(request.getParameter("RECID"));
	String OPENO = SW_LXRXX.doPreProcess(request.getParameter("OPENO"));
	String LEREPSIGN=SW_LXRXX.doPreProcess(request.getParameter("LEREPSIGN"));
	
	String CERNO = SW_LXRXX.doPreProcess(request.getParameter("CERNO"));
	String CERTYPE = SW_LXRXX.doPreProcess(request.getParameter("CERTYPE"));
	
	List list_tzrs = SW_LXRXX.getList(" WHERE openo = '"+OPENO+"'");
	if(action.equals("1"))//添加
	{  
		//int max =SW_LXRXX.getListMax(" where OPENO='"+OPENO+"'");
	    SW_LXRXX.setOPENO(OPENO);
		SW_LXRXX.setRECID(SysUtility.getUUID20());
		if (SW_LXRXX.doAdd())
		out.print(SysUtility.setAlertScript("数据保存成功!","parent.window.location.reload();"));
	    
		else
		out.print(SysUtility.setAlertScript("数据保存失败!","parent.window.location.reload();"));
	}
	else if(action.equals("2"))//修改
	{				
		if (SW_LXRXX.doModify())
		out.print(SysUtility.setAlertScript("数据修改成功!","parent.window.location.reload();"));
   		else
		out.print(SysUtility.setAlertScript("数据保存失败!","parent.window.location.reload();"));
		
	}
	else if(action.equals("3"))//删除
	{
		if (SW_LXRXX.doDelete()){
		out.print(SysUtility.setAlertScript("数据删除成功!","parent.window.location.reload();"));
   		}else{
		out.print(SysUtility.setAlertScript("数据保存失败!","parent.window.location.reload();"));
	    }
	}
%>