<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.system.SysUtility" %>
<%@ page import="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ" %>
<%@ page import="com.macrosoft.icms.qydj.QYDJ_JBXX_SQ" %> 
<jsp:useBean id='WSDJ_TXJL' scope='page' class='com.macrosoft.icms.util.WSDJ_TXJL'/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="webuser" scope="session" class="com.macrosoft.icms.qydj.WEB_USER"/>
<%
boolean bl=false;
String OPENO=Page.getOPENO();
QYDJ_YWSB_SQ ywsb=new QYDJ_YWSB_SQ();

String ip="";
if(request.getHeader("x-forwarded-for")==null){
	  ip=request.getRemoteAddr();
}else{
  ip=request.getHeader("x-forwarded-for");
}
WSDJ_TXJL.setOPENO(OPENO);
WSDJ_TXJL.setCZRY(webuser.getLOGINID());
WSDJ_TXJL.setJQIP(ip);
bl=WSDJ_TXJL.doAdd();
if(!bl){
	out.print(SysUtility.setAlertScript("������¼����ʧ�ܣ�",""));
	return;
}

ywsb.setOPENO(OPENO);
ywsb.doSelect();
String ENTCLASS=ywsb.getENTCLASS();
String REGORG=ywsb.getREGORG();
String YSBH=ywsb.getYSBH();

if(ywsb.getSTATUS().equals("3")){
	String sqlstr="insert into qydj_ywsb_sq_ls select t.*,sysdate as  rbsj from qydj_ywsb_sq t where openo='"+OPENO+"'";
    if(!ywsb.doSql(sqlstr)){
       out.print(SysUtility.setAlertScript("��ʷ���������ʧ��!","parent.window.location.reload();"));
       return;
    }
}

if(YSBH.equals("")){
	int mYSBH=0;	
}

bl=ywsb.doSql("UPDATE DCDY_JBXX_SQ SET APPDATE=sysdate ,STATUS='1' WHERE OPENO='"+OPENO+"'");

if(!bl){
	out.print(SysUtility.setAlertScript("������Ϣ����ʧ�ܣ�",""));
	return;
}
bl=ywsb.doSql("UPDATE QYDJ_YWSB_SQ SET APPDATE=sysdate,STATUS='1',YSBH='"+YSBH+"' WHERE OPENO='"+OPENO+"'");

if(!bl){
	out.print(SysUtility.setAlertScript("ҵ����챣��ʧ�ܣ�",""));
	return;
}
out.print(SysUtility.setAlertScript("�����ɹ�����ȴ����̾���ԱԤ��","parent.window.location.href='../../content.jsp'"));
%>