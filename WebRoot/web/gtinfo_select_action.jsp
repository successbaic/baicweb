<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="GTDJ_JBXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.GTDJ_JBXX_ZS"/>
<jsp:useBean id="GTDJ_JYZXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.GTDJ_JYZXX_ZS"/>
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
	String XZQH=SysUtility.doPreProcess(request.getParameter("XZQH"));
	String parentOption="parent.document.getElementById('subid').disabled=false;parent.document.getElementById('waitdiv').style.display='none';";
	GTDJ_JBXX_ZS.doSelectBySql("SELECT * FROM GTDJ_JBXX_ZS WHERE STATUS IN ('1','2') AND (REGNO='"+REGNO+"' or UNISCID='"+REGNO+"') AND REGORG IN (select coding from com_djjg where (coding='"+webuser.getXZQH()+"' or pcoding ='"+webuser.getXZQH()+"')) ");
	String PRIPID=GTDJ_JBXX_ZS.getPRIPID();
	if(PRIPID.equals("")){
		out.print(SysUtility.setAlertScript("统一社会信用代码/注册号不存在或不准确，请保证注册号的准确及完整性，并重新输入！",parentOption));
	       return;
	}
	if(OPETYPE.equals("30")){
		if(GTDJ_JBXX_ZS.getSTATUS()==2){
			out.print(SysUtility.setAlertScript("当前个体户已吊销！",parentOption));
			//return;
		}
	}
	CHECK_INFO CHECKINFO =new CHECK_INFO();
	String wwywsbInfo=CHECKINFO.WW_YWSB_SQ(" WHERE (REGNO='"+REGNO+"' or UNISCID='"+REGNO+"') AND STATUS NOT IN('4','5','11') AND CDDL='2' ");
	if(!wwywsbInfo.equals("")){
		out.print(SysUtility.setAlertScript(wwywsbInfo,parentOption));
		return;
	}
	GTDJ_JYZXX_ZS.setPRIPID(PRIPID);
	GTDJ_JYZXX_ZS.doSelect();
	if(! CERNO.equals(GTDJ_JYZXX_ZS.getCERNO()) && ! CERNO.equals(GTDJ_JYZXX_ZS.getCER1NO())){
		out.print(SysUtility.setAlertScript("经营者的证件号码与登记信息不一致，请检查！",parentOption));
		return;
	}

	Page.setENTTYPE("GT");
	Page.setPRIPID(PRIPID);
	Page.setXGBH(CERNO);
	Page.setREGNO(REGNO);
	out.print("<script language='javascript'>parent.window.location.href='../wsdj_tbxx.jsp'</script>");	
%>
</body>
</html>