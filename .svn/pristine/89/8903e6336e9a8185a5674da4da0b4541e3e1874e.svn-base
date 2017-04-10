<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="GTDJ_JBXX_SQ" scope="page"  class="com.macrosoft.icms.qydj.GTDJ_JBXX_SQ"/>
<jsp:useBean id="GTDJ_JYZXX_SQ" scope="page"  class="com.macrosoft.icms.qydj.GTDJ_JYZXX_SQ"/>
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
	GTDJ_JBXX_SQ.doSelectBySql("SELECT * FROM GTDJ_JBXX_SQ WHERE regno='"+REGNO+"'--AND STATUS IN ('1','4')");
	String FIELD001=GTDJ_JBXX_SQ.getREGNO();
	if(FIELD001.equals("")){
		out.print(SysUtility.setAlertScript("注册号不存在或当前个体户已注吊销，请保证注册号的准确及完整性，并重新输入！",""));
	       return;
	}
	//CHECK_INFO CHECKINFO =new CHECK_INFO();
	//String wwywsbInfo=CHECKINFO.WW_YWSB_SQ(" WHERE REGNO='"+REGNO+"' AND STATUS!='4' AND CDDL in ('1','3')");
	//if(!wwywsbInfo.equals("")){
	//	out.print(SysUtility.setAlertGo(wwywsbInfo,""));
	//	return;
	//}	
	String QYLX=icms.getSysDmByRemark("ENTTYPE","9999");
	String pripid=GTDJ_JBXX_SQ.getPRIPID();
	String frsql="SELECT * FROM GTDJ_JYZXX_SQ WHERE PRIPID='"+pripid+"'";
	String frnum="";
	GTDJ_JYZXX_SQ.doSelectBySql(frsql);
	if(QYLX.equals("WZFZ")){
		frnum=GTDJ_JYZXX_SQ.getCERNO();
	}else{
		frnum=GTDJ_JYZXX_SQ.getCERNO();
	}
	
	if(! CERNO.equals(frnum)){
		out.print(SysUtility.setAlertScript("经营者的证件号码与登记信息不一致，请检查！",""));
		return;
	}
	Page.setENTTYPE("DCDY");
	Page.setPRIPID(pripid);
	Page.setXGBH(CERNO);
	Page.setREGNO(REGNO);

	out.print("<script language='javascript'>parent.window.location.href='../dcdy_xgcl_gt.jsp'</script>");
%>
</body>
</html>
