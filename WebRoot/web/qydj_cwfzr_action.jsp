<%@ include file="../jspheader.inc" %>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="QYDJ_CWFZR" scope="page" class="com.macrosoft.icms.qydj.QYDJ_CWFZR_SQ">
    <jsp:setProperty name="QYDJ_CWFZR" property="*"/>
</jsp:useBean>
<%
	String parentOption="parent.document.getElementById('subid').disabled=false;parent.document.getElementById('waitdiv').style.display='none';";
	String OPENO = QYDJ_CWFZR.doPreProcess(request.getParameter("OPENO"));
	if (QYDJ_CWFZR.doCount())
	{
		if (QYDJ_CWFZR.doModify()){
		  out.print(SysUtility.setAlertScript("数据保存成功!","parent.window.location.href='../"+request.getParameter("nextPage")+"';"));
		}else{
		   out.print(SysUtility.setAlertScript("修改失败!","parent.window.location.reload();"));
		}   
	}else
	{ 
			  
		if (QYDJ_CWFZR.doAdd()){	
			out.print(SysUtility.setAlertScript("数据保存成功!","parent.window.location.href='../"+request.getParameter("nextPage")+"';"));
		}else{
			out.print(SysUtility.setAlertScript("保存失败!","parent.window.location.reload();"));
		}	
	}
 
%>