<%@ include file="../jspheader.inc" %>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="QYDJ_WZLLR" scope="page" class="com.macrosoft.icms.qydj.QYDJ_WZLLR_SQ">
    <jsp:setProperty name="QYDJ_WZLLR" property="*"/>
</jsp:useBean>
<%
	String parentOption="parent.document.getElementById('subid').disabled=false;parent.document.getElementById('waitdiv').style.display='none';";
	String OPENO = QYDJ_WZLLR.doPreProcess(request.getParameter("OPENO"));
	if (QYDJ_WZLLR.doCount())
	{
		if (QYDJ_WZLLR.doModify()){
		  out.print(SysUtility.setAlertScript("���ݱ���ɹ�!","parent.window.location.href='../"+request.getParameter("nextPage")+"';"));
		}else{
		   out.print(SysUtility.setAlertScript("�޸�ʧ��!","parent.window.location.reload();"));
		}   
	}else
	{ 
			  
		if (QYDJ_WZLLR.doAdd()){	
			out.print(SysUtility.setAlertScript("���ݱ���ɹ�!","parent.window.location.href='../"+request.getParameter("nextPage")+"';"));
		}else{
			out.print(SysUtility.setAlertScript("����ʧ��!","parent.window.location.reload();"));
		}	
	}
 
%>