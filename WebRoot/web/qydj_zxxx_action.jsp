<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.util.SYS_BHBM" %>
<html><head><title>���ݱ���</title></head>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id='WSDJ_TXJL' scope='page' class='com.macrosoft.icms.util.WSDJ_TXJL'/>
<jsp:useBean id='QYDJ_BGSX' scope='page' class='com.macrosoft.icms.qydj.QYDJ_BGSX_SQ'/>
<jsp:useBean id='QYDJ_YWSB' scope='page' class='com.macrosoft.icms.qydj.QYDJ_YWSB_SQ'/>
<jsp:useBean id="QYDJ_ZXXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_ZXXX_SQ">
<jsp:setProperty name="QYDJ_ZXXX" property="*"/>
</jsp:useBean>

<body>
<%
	String parentOption="parent.document.getElementById('subid').disabled=false;parent.document.getElementById('waitdiv').style.display='none';";
	//ҵ����
	String OPENO=SysUtility.doPreProcess(request.getParameter("OPENO"));
	//��ҵ�ڲ����
	String PRIPID=SysUtility.doPreProcess(request.getParameter("PRIPID"));
	String sCDDL=request.getParameter("CDDL");
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
		//�״α�����Ҫ����ʽ�����Ϣ�������̱���
		bl=QYDJ_BGSX.doZs2Lc(OPENO,PRIPID,"50",true,true,true,true,true);
		if(!bl){
			out.print(SysUtility.setAlertScript("��ʽ�������̿��������ʧ��!","parent.window.location.reload();"));
		}
	}
	
	//ע����Ϣ����
	QYDJ_ZXXX.setOPENO(OPENO);
	if(QYDJ_ZXXX.doCount()){
		bl=QYDJ_ZXXX.doModify();
	}else{
		bl=QYDJ_ZXXX.doAdd();
	}
	if(!bl){
		out.print(SysUtility.setAlertScript("��ҵע����Ϣ����ʧ��!","parent.window.location.reload();"));
	}
	//������ҵ������Ϣ��״̬������ʱ���
	String jbxxSql="UPDATE QYDJ_JBXX_SQ SET APPDATE=sysdate,OPETYPE=50,STATUS='0',LOGINID='"+webuser.getLOGINID()
	+"',SPANAME='"+SysUtility.doPreProcess(request.getParameter("SPANAME"))+"' WHERE OPENO="+QYDJ_BGSX.doPreProcess3(OPENO);	
	bl=QYDJ_YWSB.doSql(jbxxSql);
	if(!bl){
		out.print(SysUtility.setAlertScript("������Ϣ���ݸ���ʧ��!","parent.window.location.reload();"));
		return;
	}
	//ҵ�������Ϣ
	QYDJ_YWSB.setOPENO(OPENO);	
	if(QYDJ_YWSB.doCount()){		
		bl=QYDJ_YWSB.doSql("UPDATE QYDJ_YWSB_SQ SET OPETYPE=50,JQIP='"+ip+"',APPDATE=sysdate WHERE OPENO='"+OPENO+"'");
	}else{		
		bl=QYDJ_YWSB.doSql("INSERT INTO QYDJ_YWSB_SQ "
		+"(OPENO,PRIPID,UNISCID,OPETYPE,APPDATE,REGNO,ENTNAME,LEREP,REGORG,ENTTYPE,ENTCLASS,LOGINID,STATUS,JQIP,CDDL,LOCALADM,OPELOCDISTRICT) "
		+"SELECT OPENO,PRIPID,UNISCID,OPETYPE,APPDATE,REGNO,ENTNAME,LEREP,REGORG,ENTTYPE,ENTCLASS,LOGINID,'0','"
		+ip+"','"+sCDDL+"',LOCALADM,OPELOCDISTRICT FROM QYDJ_JBXX_SQ WHERE OPENO='"+OPENO+"'");
	}	
	if(bl){
		out.print(SysUtility.setAlertScript("���ݱ���ɹ�!","parent.window.location.href='../"+Page.getNextPage()[0]+"';"));
		Page.setMusted(0);	//��ҳ�ѱ��棬���Խ�����һҳ	
	}
	else{
		out.print(SysUtility.setAlertScript("ҵ���걨���ݱ���ʧ��!","parent.window.location.reload();"));
	}
%>
</body>
</html>