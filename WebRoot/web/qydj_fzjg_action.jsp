<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="QYDJ_FZJG" scope="page" class="com.macrosoft.icms.qydj.QYDJ_FZJG_SQ">
	<jsp:setProperty name="QYDJ_FZJG" property="*"/>
</jsp:useBean>
<html><head><title>Ͷ������Ϣ</title></head>
<body>
<%	
	String action = QYDJ_FZJG.doPreProcess(request.getParameter("action"));
	String RECID = QYDJ_FZJG.doPreProcess(request.getParameter("RECID"));
	String OPENO = QYDJ_FZJG.doPreProcess(request.getParameter("OPENO"));
	//int max =QYDJ_FZJG.getListMax(" where OPENO='"+OPENO+"'");
		if(action.equals("1"))//���
		{		 
		    QYDJ_FZJG.setOPENO(OPENO);
			QYDJ_FZJG.setRECID(SysUtility.getUUID20());
			if (QYDJ_FZJG.doAdd()){
			out.print(SysUtility.setAlertScript("���ݱ���ɹ�!","parent.window.location.reload();"));
			}else{			
			out.print(SysUtility.setAlertScript("���ݱ���ʧ��!","parent.window.location.reload();"));
			}
		}
		else if(action.equals("2"))//�޸�
		{				
			if (QYDJ_FZJG.doModify())
			out.print(SysUtility.setAlertScript("�����޸ĳɹ�!","parent.window.location.reload();"));
	   		else
			out.print(SysUtility.setAlertScript("���ݱ���ʧ��!","parent.window.location.reload();"));
		}
		else if(action.equals("3"))//ɾ��
		{

			if (QYDJ_FZJG.doDelete()){			
			out.print(SysUtility.setAlertScript("����ɾ���ɹ�!","parent.window.location.reload();"));
	   		}else{
			out.print(SysUtility.setAlertScript("���ݱ���ʧ��!","parent.window.location.reload();"));
		    }
		}
	
		
%>
</body></html>