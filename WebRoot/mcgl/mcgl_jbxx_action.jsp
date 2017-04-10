<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<html><head><title>数据保存</title></head>
<jsp:useBean id="MCGL_JBXX" scope="page" class="com.macrosoft.icms.mcgl.MCGL_JBXX_SQ">
	<jsp:setProperty name="MCGL_JBXX" property="*"/>
</jsp:useBean>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<body>
<%
	String parentOption="parent.document.getElementById('subid').disabled=false;parent.document.getElementById('waitdiv').style.display='none';";
	String OPENO=MCGL_JBXX.doPreProcess(request.getParameter("OPENO"));
	String NAMETYPE=MCGL_JBXX.doPreProcess(request.getParameter("NAMETYPE"));
	String REGCAP=MCGL_JBXX.doPreProcess(request.getParameter("REGCAP"));
	boolean bl=false;
	boolean ifFirst=false;
	if(MCGL_JBXX.getENTCLASS().equals("")
	||MCGL_JBXX.getENTTYPE().equals("")
	||MCGL_JBXX.getLOGINID().equals("")
	){
		out.print(SysUtility.setAlertScript("参数传递错误，请使用IE浏览器，请关闭浏览器后重新操作或联系系统管理员!",parentOption));
		return;
	}
	
	
	QYDJ_YWSB.setOPENO(OPENO);
	QYDJ_YWSB.doSelect();
	if(MCGL_JBXX.getENTCLASS().equals("")
	||MCGL_JBXX.getENTTYPE().equals("")
	||MCGL_JBXX.getLOGINID().equals("")
	||MCGL_JBXX.getPREREGORG().equals("")
	){
		out.print(SysUtility.setAlertScript("页面录入信息不完整，请使用IE浏览器，请关闭浏览器后重新操作或联系系统管理员!",parentOption));
		return;
	}
	
	
	String ENTCLASS=MCGL_JBXX.getENTCLASS();
	Page.setENTCLASS(ENTCLASS);
	
	String ENTTYPE=icms.getSysRemark("ENTTYPE",MCGL_JBXX.getENTTYPE());
	Page.setENTTYPE(ENTTYPE);
	
	if(ENTTYPE.equals("FGS")||ENTTYPE.equals("WZFZ")||ENTTYPE.equals("GRDZFZ")
	||ENTTYPE.equals("HHFZ")||ENTTYPE.equals("WZHHFZ")){
		if(REGCAP.equals("")||REGCAP.equals("0") || REGCAP.equals("0.0")){
			
		}else{
			out.print(SysUtility.setAlertScript("当前企业类型的注册资本应为0!",parentOption));
			return;
		}
	}
	MCGL_JBXX.setOPENO(OPENO);	
	if(MCGL_JBXX.doCount()){
		bl=MCGL_JBXX.doModify();		
	}else{
		bl=MCGL_JBXX.doAdd();
	}	
	
	
	
	Page.clearPage();
    PageShow pageShow=new PageShow();	
	pageShow.getPageForMC(ENTCLASS,ENTTYPE,"0","1",Page);
	
	QYDJ_YWSB.setLOCALADM(MCGL_JBXX.getLOCALADM());
	
	if(!(bl&&QYDJ_YWSB.doModify())){
		out.print(SysUtility.setAlertScript("数据保存失败!","parent.window.location.reload();"));
	}else{
		out.print(SysUtility.setAlertScript("数据保存成功!","parent.window.location.href='"+Page.getNextPage()[0]+"'"));
	}
%>	