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
	if(action.equals("1"))//���
	{  
		//int max =SW_LXRXX.getListMax(" where OPENO='"+OPENO+"'");
	    SW_LXRXX.setOPENO(OPENO);
		SW_LXRXX.setRECID(SysUtility.getUUID20());
		if (SW_LXRXX.doAdd())
		out.print(SysUtility.setAlertScript("���ݱ���ɹ�!","parent.window.location.reload();"));
	    
		else
		out.print(SysUtility.setAlertScript("���ݱ���ʧ��!","parent.window.location.reload();"));
	}
	else if(action.equals("2"))//�޸�
	{				
		if (SW_LXRXX.doModify())
		out.print(SysUtility.setAlertScript("�����޸ĳɹ�!","parent.window.location.reload();"));
   		else
		out.print(SysUtility.setAlertScript("���ݱ���ʧ��!","parent.window.location.reload();"));
		
	}
	else if(action.equals("3"))//ɾ��
	{
		if (SW_LXRXX.doDelete()){
		out.print(SysUtility.setAlertScript("����ɾ���ɹ�!","parent.window.location.reload();"));
   		}else{
		out.print(SysUtility.setAlertScript("���ݱ���ʧ��!","parent.window.location.reload();"));
	    }
	}
%>