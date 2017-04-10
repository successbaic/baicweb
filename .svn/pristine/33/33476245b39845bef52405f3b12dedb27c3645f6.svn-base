<%-- <%@ include file="../jspheader.inc" %>
<%@ page contentType="text/html;charset=GBK"%> 
<jsp:useBean id="MCGL_JBXX" scope="page"  class="com.macrosoft.icms.mcgl.MCGL_JBXX_SQ"/>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"></jsp:useBean>
<%

	String OPENO = MCGL_JBXX.doPreProcess(request.getParameter("OPENO"));
	boolean flag=QYDJ_YWSB.doDelMcSq(OPENO);
    if(flag==true){
      out.print(SysUtility.setAlertScript("É¾³ý³É¹¦!","window.location.href='../content.jsp'"));
    }else{
    	out.print(SysUtility.setAlertScript("É¾³ýÊ§°Ü!","window.location.href='../content.jsp'"));
    }	
%> --%>