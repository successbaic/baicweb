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
	out.print(SysUtility.setAlertScript("操作记录保存失败！",""));
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
       out.print(SysUtility.setAlertScript("历史表添加数据失败!","parent.window.location.reload();"));
       return;
    }
}

if(YSBH.equals("")){
	int mYSBH=0;	
}

bl=ywsb.doSql("UPDATE DCDY_JBXX_SQ SET APPDATE=sysdate ,STATUS='1' WHERE OPENO='"+OPENO+"'");

if(!bl){
	out.print(SysUtility.setAlertScript("基本信息保存失败！",""));
	return;
}
bl=ywsb.doSql("UPDATE QYDJ_YWSB_SQ SET APPDATE=sysdate,STATUS='1',YSBH='"+YSBH+"' WHERE OPENO='"+OPENO+"'");

if(!bl){
	out.print(SysUtility.setAlertScript("业务申办保存失败！",""));
	return;
}
out.print(SysUtility.setAlertScript("操作成功，请等待工商局人员预审！","parent.window.location.href='../../content.jsp'"));
%>