<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<html><head><title>���ݱ���</title></head>
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
		out.print(SysUtility.setAlertScript("�������ݴ�����ʹ��IE���������ر�����������²�������ϵϵͳ����Ա!",parentOption));
		return;
	}
	
	
	QYDJ_YWSB.setOPENO(OPENO);
	QYDJ_YWSB.doSelect();
	if(MCGL_JBXX.getENTCLASS().equals("")
	||MCGL_JBXX.getENTTYPE().equals("")
	||MCGL_JBXX.getLOGINID().equals("")
	||MCGL_JBXX.getPREREGORG().equals("")
	){
		out.print(SysUtility.setAlertScript("ҳ��¼����Ϣ����������ʹ��IE���������ر�����������²�������ϵϵͳ����Ա!",parentOption));
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
			out.print(SysUtility.setAlertScript("��ǰ��ҵ���͵�ע���ʱ�ӦΪ0!",parentOption));
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
		out.print(SysUtility.setAlertScript("���ݱ���ʧ��!","parent.window.location.reload();"));
	}else{
		out.print(SysUtility.setAlertScript("���ݱ���ɹ�!","parent.window.location.href='"+Page.getNextPage()[0]+"'"));
	}
%>	