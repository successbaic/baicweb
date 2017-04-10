<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="QYDJ_JBXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.QYDJ_JBXX_ZS"/>
<jsp:useBean id="QYDJ_RYXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.QYDJ_RYXX_ZS"/>
<jsp:useBean id="GTDJ_JBXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.GTDJ_JBXX_ZS"/>
<jsp:useBean id="GTDJ_JYZXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.GTDJ_JYZXX_ZS"/>
<jsp:useBean id="MCGL_JBXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.MCGL_JBXX_ZS"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<%@ page import="com.macrosoft.icms.util.CHECK_INFO" %>
<%@ page import="java.text.*"%>
<html>
<head>
<title></title>
</head>
<body>
<%
	String parentOption="parent.document.getElementById('subid').disabled=false;parent.document.getElementById('waitdiv').style.display='none';";
	String REGNO=SysUtility.doPreProcess(request.getParameter("REGNO"));	
	String CERNO=SysUtility.doPreProcess(SysUtility.convertCode(request.getParameter("CERNO")));	
	String CDDL=SysUtility.doPreProcess(request.getParameter("CDDL"));
	String OPETYPE=SysUtility.doPreProcess(request.getParameter("OPETYPE"));
	String ENTCLASS="";
	String YWLX="QY";
	String wheSql1=" AND REGNO='"+REGNO+"' ";
	String info="注册号";
	if(REGNO.length()==18){
		wheSql1=" AND UNISCID ='"+REGNO+"' ";
		info="社会信用代码";
	}
	QYDJ_JBXX_ZS.doSelectBySql("SELECT * FROM QYDJ_JBXX_ZS WHERE ENTSTATUS ='1' "+wheSql1+" "+ContrInfo.getDjzssql_dishi(icms.getSjCode(),webuser.getXZQH()));
	String PRIPID=QYDJ_JBXX_ZS.getPRIPID();
	if(PRIPID.equals("")){
		GTDJ_JBXX_ZS.doSelectBySql("SELECT * FROM GTDJ_JBXX_ZS WHERE STATUS ='1' AND REGNO='"+REGNO+"' "+ContrInfo.getDjzssql_dishi(icms.getSjCode(),webuser.getXZQH()));
		if(GTDJ_JBXX_ZS.getPRIPID().equals("")){
			out.print(SysUtility.setAlertScript(info+"不存在或当前企业已注吊销，请保证"+info+"的准确及完整性，并重新输入！",parentOption));
		    return;	
		}else{
			PRIPID=GTDJ_JBXX_ZS.getPRIPID();
			YWLX="GT";
		}		
	}
	CHECK_INFO CHECKINFO =new CHECK_INFO();
	String wwywsbInfo=CHECKINFO.WW_YWSB_SQ(" WHERE STATUS NOT IN('4','5','11') "+wheSql1+" AND CDDL in ('0','1','3')");
	if(!wwywsbInfo.equals("")){
		out.print(SysUtility.setAlertScript(wwywsbInfo,parentOption));
		return;
	}	
	
	MCGL_JBXX_ZS.doSelectBySql("SELECT * FROM MCGL_JBXX_ZS WHERE NAMESTATUS not in('1','3') AND PRIPID='"+PRIPID+"'");
	String NAMEID=MCGL_JBXX_ZS.getNAMEID();
	int NAMESTATUS=MCGL_JBXX_ZS.getNAMESTATUS();
	String datetime=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime()); 
	if(!NAMEID.equals("")){
		MCGL_JBXX_ZS.doSelectBySql("SELECT * FROM MCGL_JBXX_ZS WHERE NAMESTATUS ='2' AND PRIPID='"+PRIPID+"' AND SAVEPERTO="+
				"(SELECT MAX(SAVEPERTO) FROM MCGL_JBXX_ZS WHERE PRIPID='"+PRIPID+"' AND NAMESTATUS='2') AND ROWNUM<2");
		if(datetime.compareTo(MCGL_JBXX_ZS.getSAVEPERTO())<0) {
			out.print(SysUtility.setAlertScript("该名称尚未办理完企业变更业务！",parentOption));
		       return;
		}
	}
	MCGL_JBXX_ZS.doSelectBySql("SELECT * FROM MCGL_JBXX_ZS WHERE NAMESTATUS ='3' AND PRIPID='"+PRIPID+"' AND SAVEPERTO="+
			"(SELECT MAX(SAVEPERTO) FROM MCGL_JBXX_ZS WHERE PRIPID='"+PRIPID+"' AND NAMESTATUS='3') AND ROWNUM<2");
	String SAVEPERTO=MCGL_JBXX_ZS.getSAVEPERTO();
	if(!SAVEPERTO.equals("")){
		if(datetime.compareTo(SAVEPERTO) < 0){
			out.print(SysUtility.setAlertScript("一年之内不能再次办理名称变更业务！",parentOption));
		       return;
		}
	}
	String QYLX=icms.getSysRemark("ENTTYPE",QYDJ_JBXX_ZS.getENTTYPE());       
	if(YWLX.equals("QY")){
		ENTCLASS=QYDJ_JBXX_ZS.getENTCAT()+"";
		QYDJ_RYXX_ZS.setPRIPID(PRIPID);
		QYDJ_RYXX_ZS.doSelectByLEREPSIGN();
		if(! CERNO.equals(QYDJ_RYXX_ZS.getCERNO())){
			out.print(SysUtility.setAlertScript("法定代表人（负责人）的证件号码与登记信息不一致，请检查！",parentOption));
			return;
		}	
	}else{
		QYLX="GT";
		ENTCLASS="5";
		GTDJ_JYZXX_ZS.setPRIPID(PRIPID);
		GTDJ_JYZXX_ZS.doSelect();
		if(! CERNO.equals(GTDJ_JYZXX_ZS.getCERNO())){
			out.print(SysUtility.setAlertScript("经营者的证件号码与登记信息不一致，请检查！",parentOption));
			return;
		}
	}
	
	Page.setENTTYPE(QYLX);
	Page.setPRIPID(PRIPID);
	Page.setXGBH(CERNO);
	Page.setREGNO(REGNO);	
	Page.setENTCLASS(ENTCLASS);
	out.print("<script language='javascript'>"+parentOption+"parent.window.location.href='mcbg_clsm.jsp'</script>");
%>
</body>
</html>
