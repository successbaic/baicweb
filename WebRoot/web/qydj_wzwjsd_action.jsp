<%@ include file="../jspheader.inc" %>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="QYDJ_WZWJSD" scope="page" class="com.macrosoft.icms.qydj.QYDJ_WZWJSD_SQ">
    <jsp:setProperty name="QYDJ_WZWJSD" property="*"/>
</jsp:useBean>
<%
	String parentOption="parent.document.getElementById('subid').disabled=false;parent.document.getElementById('waitdiv').style.display='none';";
	String OPENO = QYDJ_WZWJSD.doPreProcess(request.getParameter("OPENO"));
	if (QYDJ_WZWJSD.doCount())
	{
		if (QYDJ_WZWJSD.doModify()){
		  out.print(SysUtility.setAlertScript("���ݱ���ɹ�!","parent.window.location.href='../"+request.getParameter("nextPage")+"';"));
		}else{
		   out.print(SysUtility.setAlertScript("�޸�ʧ��!","parent.window.location.reload();"));
		}   
	}else
	{ 
			  
		if (QYDJ_WZWJSD.doAdd()){	
			out.print(SysUtility.setAlertScript("���ݱ���ɹ�!","parent.window.location.href='../"+request.getParameter("nextPage")+"';"));
		}else{
			out.print(SysUtility.setAlertScript("����ʧ��!","parent.window.location.reload();"));
		}	
	}
 
%>