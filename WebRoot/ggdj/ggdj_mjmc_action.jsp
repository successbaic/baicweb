<%@ page contentType="text/html;charset=GBK"%> 
<%@ include file="../jspheader.inc"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
	request.setCharacterEncoding("GBK");
%>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="ggdjMjmc" scope="page"  class="com.macrosoft.icms.ggdj.GgdjMjmc" />

<body>
<%	
        String id = ggdjMjmc.doPreProcess(request.getParameter("id"));
        String sqxxId = ggdjMjmc.doPreProcess(request.getParameter("sqxxId"));
        String action = ggdjMjmc.doPreProcess(request.getParameter("action"));
        String mediaName = ggdjMjmc.doPreProcess(request.getParameter("mediaName"));
    	ggdjMjmc.setSqxxId(sqxxId);
    	ggdjMjmc.setId(id);
    	ggdjMjmc.setMediaName(mediaName);
		if(action.equals("1"))//���
		{  
			ggdjMjmc.setSqxxId(sqxxId);
			ggdjMjmc.setId(SysUtility.getUUID20());
			ggdjMjmc.setMediaName(mediaName);
			if (ggdjMjmc.doAdd()){
			out.print(SysUtility.setAlertScript("���ݱ���ɹ�!","parent.window.location.reload();"));
			}else{
			out.print(SysUtility.setAlertScript("���ݱ���ʧ��!","parent.window.location.reload();"));
			}
		}
		else if(action.equals("2"))//�޸�
		{				
			if (ggdjMjmc.doModify())
			out.print(SysUtility.setAlertScript("�����޸ĳɹ�!","parent.window.location.reload();"));
	   		else
			out.print(SysUtility.setAlertScript("���ݱ���ʧ��!","parent.window.location.reload();"));
		}
		else if(action.equals("3"))//ɾ��
		{
			if (ggdjMjmc.doDelete()){		
			out.print(SysUtility.setAlertScript("����ɾ���ɹ�!","parent.window.location.reload();"));
	   		}else{
			out.print(SysUtility.setAlertScript("���ݱ���ʧ��!","parent.window.location.reload();"));
		    }
		}
	
		
%>