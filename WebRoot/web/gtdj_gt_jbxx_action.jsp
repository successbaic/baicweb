<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.util.SYS_BHBM" %> 
<html><head><title>���ݱ���</title></head>
<jsp:useBean id="GTDJ_JYZXX" scope="page" class="com.macrosoft.icms.qydj.GTDJ_JYZXX_SQ"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id='WSDJ_TXJL' scope='page' class='com.macrosoft.icms.util.WSDJ_TXJL'/>
<jsp:useBean id='WSDJ_LOG_RECORD' scope='page' class='com.macrosoft.icms.util.WSDJ_LOG_RECORD'/>
<jsp:useBean id="GTDJ_JBXX" scope="page" class="com.macrosoft.icms.qydj.GTDJ_JBXX_SQ">
<jsp:setProperty name="GTDJ_JBXX" property="*"/>
</jsp:useBean>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ">
<jsp:setProperty name="QYDJ_YWSB" property="*"/>
</jsp:useBean>
<body>
<%
	String parentOption="parent.document.getElementById('subid').disabled=false;parent.document.getElementById('waitdiv').style.display='none';";
	String OPENO=GTDJ_JBXX.doPreProcess(request.getParameter("OPENO"));
	String sTYPE=request.getParameter("CDDL");
	String IFELEC = Page.getIFELEC();
	String XZQH =webuser.getXZQH();
	System.out.println("xzqh=="+XZQH);
	boolean bl=false;
	String ip="";
    if(request.getHeader("x-forwarded-for")==null){
  	  ip=request.getRemoteAddr();
    }else{
  	  ip=request.getHeader("x-forwarded-for");
    }
    
	if(OPENO.equals("")|| OPENO==null){//��һ�α��棬�����µ�ҵ����MB��ͷ
		OPENO=SYS_BHBM.CREATEBH(2,request.getParameter("REGORG"));
		Page.setOPENO(OPENO);//��������ҵ����
	}	
	//��������������������º�˫��ҵ��ϵͳ���ӵ�ַ�жϣ��ж��Ƿ���Υ�½�����ַ������ǲ����������Ǽ�
			if(XZQH.startsWith("3701")){
				String  dom="";
				if(request.getParameter("OPLOC")!=null && request.getParameter("OPLOC")!=""){
					dom=new String((request.getParameter("OPLOC")).getBytes("ISO-8859-1"),"GBK");
				}
				String  proloc="";
				if(request.getParameter("PROLOC")!=null && request.getParameter("PROLOC")!=""){
				  proloc=new String((request.getParameter("PROLOC")).getBytes("ISO-8859-1"),"GBK");
				}
				String sql = "SELECT * FROM SZSH_XTJG_WZJZ WHERE ACTUALDOM='"+dom+"' OR ACTUALDOM='"+proloc+"'";
				ResultSet rs = gsdbc.executeQuery(sql);
				if(rs.next()){
					out.print(SysUtility.setAlertScript("�õǼǵ�ַ�ѱ���ΪΥ��Υ�½���������������̵Ǽ�ҵ��!",parentOption));
					return;
				
				}
				
			}
	
	GTDJ_JBXX.setOPENO(OPENO);
	GTDJ_JBXX.setSTATUS("0");	
	GTDJ_JBXX.setIFELEC(IFELEC);

	if(GTDJ_JBXX.doCount()){
		bl=GTDJ_JBXX.doModify();
	}else{		
		//��ҵ�������Ϣ���л�û��¼ʱ����WSDJ_TXJL����д��¼���в���һ����¼��
		WSDJ_TXJL.setOPENO(OPENO);
		WSDJ_TXJL.setWJBH(1001);
		WSDJ_TXJL.setCZRY(webuser.getLOGINID());
		WSDJ_TXJL.setJQIP(ip);
		WSDJ_TXJL.setCZSJ(webuser.getCurrentDate());
		WSDJ_TXJL.doAdd();
		//������Ϣ���в���һ����¼
		bl=GTDJ_JBXX.doAdd();
	}
	if(!bl){
		out.print(SysUtility.setAlertScript("������Ϣ����ʧ��!","parent.window.location.reload();"));
	}
	if(isSanZheng){
		if(GTDJ_JBXX.doCount2MiddleData()){
			bl=GTDJ_JBXX.doModify2MiddleData();
		}else{				
			bl=GTDJ_JBXX.doAdd2MiddleData();
		}
		if(!bl){
			out.print(SysUtility.setAlertScript("������Ϣ����ʧ��!","parent.window.location.reload();"));
		}
	}
	GTDJ_JYZXX.setOPENO(OPENO);
	GTDJ_JYZXX.setPRIPID(Page.getPRIPID());
	GTDJ_JYZXX.setNAME(SysUtility.doPreProcess(request.getParameter("OPERNAME")));
	if(GTDJ_JYZXX.doCount()){
		GTDJ_JYZXX.doModifyByJyz();	
	}else{
		GTDJ_JYZXX.doAdd();
	}
	
	if(QYDJ_YWSB.doCount()){		
		bl=QYDJ_YWSB.doSql("UPDATE QYDJ_YWSB_SQ "
		+"SET (ENTNAME,LEREP,REGORG,JQIP,LOCALADM,OPELOCDISTRICT) "
		+"=(SELECT TRANAME,OPERNAME,REGORG,'"
		+ip+"',LOCALADM,OPELOCDISTRICT FROM GTDJ_JBXX_SQ WHERE OPENO='"+OPENO+"') WHERE OPENO='"+OPENO+"'");
	}else{
		bl=QYDJ_YWSB.doSql("INSERT INTO QYDJ_YWSB_SQ(OPELOCDISTRICT,LOCALADM,CDDL,JQIP,STATUS,LOGINID,OPENO,PRIPID,OPETYPE,REGNO,UNISCID,ENTNAME,REGORG,APPDATE,ENTTYPE,ENTCLASS,LEREP) VALUES('"
		+GTDJ_JBXX.getOPELOCDISTRICT()+"','"+GTDJ_JBXX.getLOCALADM()+"','"+sTYPE+"','"+ ip +"','0','"+ GTDJ_JBXX.getLOGINID() +"','"+ OPENO +"','"+ GTDJ_JBXX.getPRIPID() +"','"+ GTDJ_JBXX.getOPETYPE() +"','"+ GTDJ_JBXX.getREGNO() 
		+"','"+ GTDJ_JBXX.getUNISCID() +"','"+ GTDJ_JBXX.getTRANAME() +"','"+ GTDJ_JBXX.getREGORG()+"', to_date('"+GTDJ_JBXX.getAPPDATE() +"','yyyy-mm-dd'),'9999',5,'"+GTDJ_JBXX.getOPERNAME()+"')");
	}
	
	if(bl){
		out.print(SysUtility.setAlertScript("���ݱ���ɹ�!","parent.window.location.href='../"+Page.getNextPage()[0]+"'"));
		Page.setMusted(0);	//��ҳ�ѱ��棬���Խ�����һҳ
	}
	else{
		out.print(SysUtility.setAlertScript("��������ƽ̨_ҵ���걨���ݱ���ʧ��!",parentOption));
	}
	//���ݱ������־���¼��־
	WSDJ_LOG_RECORD.setLOGID(SysUtility.getUUID20());
	WSDJ_LOG_RECORD.setLINKNAME("���ϵǼǸ��幤�̻�������Ϣ���滷��");
	WSDJ_LOG_RECORD.setUSERID(GTDJ_JBXX.getLOGINID());
	WSDJ_LOG_RECORD.setOPENO(OPENO);
	WSDJ_LOG_RECORD.setUSERIP(ip);
	WSDJ_LOG_RECORD.setENTNAME(GTDJ_JBXX.getTRANAME());
	WSDJ_LOG_RECORD.setOPERNAME(GTDJ_JBXX.getOPERNAME());
	WSDJ_LOG_RECORD.setIFELEC(IFELEC);
	WSDJ_LOG_RECORD.doAdd();
%>
</body>
</html>