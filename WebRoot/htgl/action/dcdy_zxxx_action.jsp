<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.util.SYS_BHBM" %>
<html><head><title>���ݱ���</title></head>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id='QYDJ_YWSB' scope='page' class='com.macrosoft.icms.qydj.QYDJ_YWSB_SQ'/>
<jsp:useBean id="DCDY_ZXXX" scope="page" class="com.macrosoft.icms.htgl.DCDY_ZXXX_SQ">
<jsp:setProperty name="DCDY_ZXXX" property="*"/>
</jsp:useBean>

<body>
<%
    String OPENO =Page.getOPENO();
	String OPETYPE = Page.getOPETYPE(); OPETYPE="50";
	String MORCONTNO = Page.getREGNO();
	System.out.println("OPETYPE in dcdy_bgsx_action.jsp =="+OPETYPE);	
	boolean bl=false;
	String ip="";
    if(request.getHeader("x-forwarded-for")==null){
  	  ip=request.getRemoteAddr();
    }else{
  	  ip=request.getHeader("x-forwarded-for");
    }
    System.out.println(OPENO);
	if(OPENO.equals("")|| OPENO==null){//��һ�α��棬�����µ�ҵ����MB��ͷ
		OPENO=SYS_BHBM.CREATEBH(2,request.getParameter("REGORG"));
		Page.setOPENO(OPENO);//��������ҵ����		
	}
	
	//ע����Ϣ����
	System.out.println(OPENO);
	DCDY_ZXXX.setOPENO(OPENO);
	if(DCDY_ZXXX.doCount()){
	    System.out.println("Modify");
		bl=DCDY_ZXXX.doModify();
	}else{
	    System.out.println("Add");
		bl=DCDY_ZXXX.doAdd();
	}
	/* 	//������������ҵ�������Ϣ--��һ��ȫ�����룬�Ժ���ݱ�������
	bl=QYDJ_YWSB.doSql("delete from DCDY_JBXX_SQ where openo='"+OPENO+"'");	
	bl=QYDJ_YWSB.doSql("insert into DCDY_JBXX_SQ(OPENO,MORCONTNO,PRICLASECKIND,PRICLASECAM,PEFPERFROM,PEFPERTO,MORTGAGOTYPE,MORE,MORTGAGOADDRESS,MOREAGENT,MORECERTYPE,MOREPERNO,MORTGAGO,MORTGAGOAGENT,MORTGAGOCERTYPE,MORTGAGORPERNO,REGORG,REGDATE,MORREGCNO,OPETYPE,LOGINID,APPDATE) select '"
	+OPENO+"',AF04023,HF04067,HF04069,to_date(HF04059,'yyyy-MM-dd'),to_date(HF04061,'yyyy-MM-dd'),HF04100,AF04011,HF04097,HF04099,HF04098,HF04063,AF04017,HF04096,HF04095,HF04071,AF04035,to_date(AF04008,'yyyy-MM-dd'),AF04005,'30','"+webuser.getLOGINID()+"',sysdate from sgs.AF0401 where AF04005='"+Page.getREGNO()+"' AND AF04011='"+Page.getXGBH()+"' AND AF04017='"+Page.getENTNAME()+"'");

	if(!bl){
		out.print(SysUtility.setAlertScript("��ʽ���������ʧ��!","parent.window.location.reload();"));
		return;
	} */
	//������ҵ������Ϣ��״̬������ʱ���
	String jbxxSql="UPDATE DCDY_JBXX_SQ SET APPDATE=sysdate,OPETYPE=50,STATUS='0',LOGINID='"+webuser.getLOGINID()+"' WHERE OPENO="+DCDY_ZXXX.doPreProcess3(OPENO);
	bl=QYDJ_YWSB.doSql(jbxxSql);
	if(!bl){
		out.print(SysUtility.setAlertScript("������Ϣ���ݸ���ʧ��!","parent.window.location.reload();"));
		return;
	}
	QYDJ_YWSB.setOPENO(OPENO);
	QYDJ_YWSB.setSTATUS("0");
	QYDJ_YWSB.setJQIP(ip);
	if(QYDJ_YWSB.doCount()){
		if(QYDJ_YWSB.doPreProcess(request.getParameter("STATUS")).equals("3")){
			 String sqlstr="insert into qydj_ywsb_sq_ls select t.*,sysdate as  rbsj from qydj_ywsb_sq t where openo='"+OPENO+"'";
		    if(!QYDJ_YWSB.doSql(sqlstr)){
		       out.print(SysUtility.setAlertScript("��ʷ���������ʧ��!","parent.window.location.reload();"));
		       return;
		    }		   
		}
		bl=QYDJ_YWSB.doSql("UPDATE QYDJ_YWSB_SQ "
		+"SET (OPETYPE,REGNO,ENTNAME,REGORG,STATUS,JQIP) "
		+"=(SELECT OPETYPE,MORREGCNO,MORTGAGO,REGORG,'0','"
		+ip+"' FROM dcdy_jbxx_sq WHERE OPENO='"+OPENO+"') WHERE OPENO='"+OPENO+"'");
	}else{
		bl=QYDJ_YWSB.doSql("INSERT INTO QYDJ_YWSB_SQ "
		+"(OPENO,PRIPID,OPETYPE,APPDATE,REGNO,ENTNAME,LEREP,REGORG,ENTTYPE,ENTCLASS,LOGINID,STATUS,JQIP,CDDL,LOCALADM,OPELOCDISTRICT) "
		+"SELECT OPENO,'',OPETYPE,APPDATE,'',MORTGAGO,'',REGORG,'DCDY','D',LOGINID,'0','"
		+ip+"','6','','' FROM dcdy_jbxx_sq WHERE OPENO='"+OPENO+"'");
	}
	if(bl){
		out.print(SysUtility.setAlertScript("���ݱ���ɹ�!","parent.window.location.href='../"+Page.getNextPage()[0]+"'"));
	
	}
	else{
		out.print(SysUtility.setAlertScript("ҵ���걨���ݱ���ʧ��!","parent.window.location.reload();"));
	}
%>
</body>
</html>