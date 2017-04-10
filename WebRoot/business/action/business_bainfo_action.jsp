<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="QYDJ_JBXX_SQ" scope="page"  class="com.macrosoft.icms.qydj.QYDJ_JBXX_SQ"/>
<jsp:useBean id="QYDJ_RYXX_SQ" scope="page"  class="com.macrosoft.icms.qydj.QYDJ_RYXX_SQ"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<%@ page import="com.macrosoft.icms.util.CHECK_INFO" %>
<html>
<head>
<title></title>
</head>
<body>
<%
	String REGNO=SysUtility.doPreProcess(request.getParameter("REGNO"));	
	String CERNO=SysUtility.doPreProcess(SysUtility.convertCode(request.getParameter("CERNO")));	
	String CDDL=SysUtility.doPreProcess(request.getParameter("CDDL"));
	String OPETYPE=SysUtility.doPreProcess(request.getParameter("OPETYPE"));
	QYDJ_JBXX_SQ.doSelectBySql("SELECT * FROM QYDJ_JBXX_SQ WHERE (regno='"+REGNO+"' or uniscid='"+REGNO+"') --AND STATUS IN ('1','4')");
	String FIELD001=QYDJ_JBXX_SQ.getREGNO();
	if(FIELD001.equals("")){
		out.print(SysUtility.setAlertScript("注册号不存在或当前企业已注吊销，请保证注册号的准确及完整性，并重新输入！",""));
	       return;
	}
	//CHECK_INFO CHECKINFO =new CHECK_INFO();
	//String wwywsbInfo=CHECKINFO.WW_YWSB_SQ(" WHERE REGNO='"+REGNO+"' AND STATUS!='4' AND CDDL in ('1','3')");
	//if(!wwywsbInfo.equals("")){
	//	out.print(SysUtility.setAlertGo(wwywsbInfo,""));
	//	return;
	//}	
	String QYLX=icms.getSysDmByRemark("ENTTYPE",QYDJ_JBXX_SQ.getENTTYPE());
	String pripid=QYDJ_JBXX_SQ.getPRIPID();
	String frsql="SELECT * FROM QYDJ_RYXX_SQ WHERE PRIPID='"+pripid+"' AND LEREPSIGN='1'";
	String frnum="";
	QYDJ_RYXX_SQ.doSelectBySql(frsql);
	if(QYLX.equals("WZFZ")){
		frnum=QYDJ_RYXX_SQ.getCERNO();
	}else{
		frnum=QYDJ_RYXX_SQ.getCERNO();
	}
	
	if(! CERNO.equals(frnum)){
		out.print(SysUtility.setAlertScript("法定代表人（负责人）的证件号码与登记信息不一致，请检查！",""));
		return;
	}
	Page.setENTTYPE("DCDY");
	Page.setPRIPID(pripid);
	Page.setXGBH(CERNO);
	Page.setREGNO(REGNO);

	out.print("<script language='javascript'>parent.window.location.href='../business_control.jsp'</script>");
%>
</body>
</html>
