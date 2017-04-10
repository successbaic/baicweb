<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="QYDJ_JBXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.QYDJ_JBXX_ZS"/>
<jsp:useBean id="QYDJ_RYXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.QYDJ_RYXX_ZS"/>
<jsp:useBean id="QYDJ_CZXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.QYDJ_CZXX_ZS"/>
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
	
	String wheSql1=" AND REGNO='"+REGNO+"' ";
	String info="注册号";
	if(REGNO.length()==18){
		wheSql1=" AND UNISCID ='"+REGNO+"' ";
		info="社会信用代码";
	}
	QYDJ_JBXX_ZS.doSelectBySql("SELECT * FROM QYDJ_JBXX_ZS WHERE ENTSTATUS IN ('1','2') "+wheSql1+ContrInfo.getDjzssql_dishi(icms.getSjCode(),webuser.getXZQH()));
	String PRIPID=QYDJ_JBXX_ZS.getPRIPID();
	if(PRIPID.equals("")){
		out.print(SysUtility.setAlertScript(info+"不存在或当前企业已注吊销，请保证"+info+"的准确及完整性，并重新输入！",parentOption));
	       return;
	}
	CHECK_INFO CHECKINFO =new CHECK_INFO();
	String wwywsbInfo=CHECKINFO.WW_YWSB_SQ(" WHERE STATUS NOT IN('4','5','11') "+wheSql1+" AND CDDL in ('1','3')");
	if(!wwywsbInfo.equals("")){
		out.print(SysUtility.setAlertScript(wwywsbInfo,parentOption));
		return;
	}	
	if(OPETYPE.equals("30")){
		if(QYDJ_JBXX_ZS.getENTSTATUS()==2){
			out.print(SysUtility.setAlertScript("当前企业已吊销！",parentOption));
			//return;
		}
	}
	String QYLX=icms.getSysRemark("ENTTYPE",QYDJ_JBXX_ZS.getENTTYPE());       
	if(CDDL.equals("3")){
		if(!QYLX.equals("HZS") && !QYLX.equals("HZSFZ")){
			out.print(SysUtility.setAlertScript("当前企业不是农民专业合作社或合作社分支！",parentOption));
			return;
		}
	}else{
		if(QYLX.equals("HZS") || QYLX.equals("HZSFZ")){
			out.print(SysUtility.setAlertScript("当前企业是农民专业合作社或合作社分支！",parentOption));
			return;
		}
		if(OPETYPE.equals("40")){
			if(!QYLX.equals("GS")&&!QYLX.equals("NZFR")&&!QYLX.equals("WZGS")){
			    out.print(SysUtility.setAlertScript("当前企业不需要备案！",parentOption));
				return;
			}
		}
	}
	
	if(QYLX.equals("HHQY")){
		QYDJ_CZXX_ZS.doSelectBySql("SELECT * FROM QYDJ_CZXX_ZS WHERE PRIPID='"+PRIPID+"' AND EXEAFFSIGN	='1'");
		String CZNO=QYDJ_CZXX_ZS.getCERNO();
		if(CZNO.equals("")){
			CZNO=QYDJ_CZXX_ZS.getBLICNO();
		}
		if(! CERNO.equals(CZNO)){
			out.print(SysUtility.setAlertScript("执行事务合伙人的证件（照）号码与登记信息不一致，请检查！",parentOption));
			return;
		}
	}else{
		QYDJ_RYXX_ZS.setPRIPID(PRIPID);
		QYDJ_RYXX_ZS.doSelectByLEREPSIGN();
		if(! CERNO.equals(QYDJ_RYXX_ZS.getCERNO())){
			out.print(SysUtility.setAlertScript("法定代表人（负责人）的证件号码与登记信息不一致，请检查！",parentOption));
			return;
		}
	}
	
	Page.setENTTYPE(QYLX);
	Page.setPRIPID(PRIPID);
	Page.setXGBH(CERNO);
	Page.setREGNO(REGNO);
	out.print("<script language='javascript'>parent.window.location.href='../wsdj_tbxx.jsp'</script>");
%>
</body>
</html>
