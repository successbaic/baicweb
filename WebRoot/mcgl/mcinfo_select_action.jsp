<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="MCGL_JBXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.MCGL_JBXX_ZS"/>
<jsp:useBean id="QYDJ_RYXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.QYDJ_RYXX_ZS"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<%@ page import="com.macrosoft.icms.util.CHECK_INFO" %>
<html>
<head>
<title></title>
</head>
<body>
<%
	String parentOption="parent.document.getElementById('subid').disabled=false;parent.document.getElementById('waitdiv').style.display='none';";
	String ENTNAME=SysUtility.doPreProcess(SysUtility.convertCode(request.getParameter("ENTNAME")));	
	String XGBH=SysUtility.doPreProcess(SysUtility.convertCode(request.getParameter("XGBH")));
	String dMCID=XGBH;
	String CDDL=SysUtility.doPreProcess(request.getParameter("CDDL"));
	String OPETYPE=SysUtility.doPreProcess(request.getParameter("OPETYPE"));
	String XZQH=SysUtility.doPreProcess(request.getParameter("XZQH"));

	MCGL_JBXX_ZS.doSelectBySql("SELECT * FROM MCGL_JBXX_ZS WHERE NAMESTATUS = '2' AND ENTNAME='"+ENTNAME+"' "+ContrInfo.getMczssql_dishi(webuser.getXZQH()));
	String NAMEID=MCGL_JBXX_ZS.getNAMEID();
	if(NAMEID.equals("")){
		out.print(SysUtility.setAlertScript("名称不存在或状态不符合要求，请保证名称的准确及完整性，并重新输入！",parentOption));
	       return;
	}
	String apprno=MCGL_JBXX_ZS.getAPPRNO();
	if(apprno.indexOf(dMCID)>=0){
		
	}else{
		out.print(SysUtility.setAlertScript("名称与名称预先核准通知书文号不匹配！",parentOption));
		return;			
	}
	
	CHECK_INFO CHECKINFO =new CHECK_INFO();
	String wwywsbInfo=CHECKINFO.WW_YWSB_SQ(" WHERE ENTNAME='"+ENTNAME+"' AND STATUS NOT IN('4','5')");
	if(!wwywsbInfo.equals("")){
		out.print(SysUtility.setAlertScript(wwywsbInfo,parentOption));
		return;
	}	

	String QYLX=icms.getSysRemark("ENTTYPE",MCGL_JBXX_ZS.getENTTYPE());       
	
	Page.setENTTYPE(QYLX);
	Page.setPRIPID(MCGL_JBXX_ZS.getNAMEID());
	Page.setXGBH(XGBH);
	Page.setENTNAME(ENTNAME);
	out.print("<script language='javascript'>"+parentOption+"parent.window.location.href='mcbg_clsm.jsp'</script>");
%>
</body>
</html>
