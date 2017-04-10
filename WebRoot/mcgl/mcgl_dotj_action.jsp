<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.system.SysUtility" %>
<%@ page import="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ" %>
<%@ page import="com.macrosoft.icms.mcgl.MCGL_JBXX_SQ" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.macrosoft.icms.commAjax.action.TzCheckAction" %> 
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<%@ page import="com.macrosoft.icms.gsnw.GSYJXX" %><%@ page import="com.macrosoft.icms.mcgl.MCGL_TZRXX_SQ" %> 
<%
boolean bl=false;
String OPENO=Page.getOPENO();
String ip="";
if(request.getHeader("x-forwarded-for")==null){
	  ip=request.getRemoteAddr();
}else{
  ip=request.getHeader("x-forwarded-for");
}
QYDJ_YWSB_SQ ywsb=new QYDJ_YWSB_SQ();
ywsb.setOPENO(OPENO);
ywsb.doSelect();

MCGL_JBXX_SQ mcgl = new MCGL_JBXX_SQ();
mcgl.setOPENO(OPENO);
mcgl.doSelect();

String sENTTYPE=icms.getSysRemark("ENTTYPE",mcgl.getENTTYPE());
if((sENTTYPE!=null && !sENTTYPE.equals(""))&&Page.getOPETYPE().equals("10")){
	if(sENTTYPE.equals("GS")
	||sENTTYPE.equals("WZGS")
	||sENTTYPE.equals("HHQY")
	||sENTTYPE.equals("WZHH")
	||sENTTYPE.equals("HZS")){
		//String info = new TzCheckAction().mcglCheck(OPENO,request);
		//if(!info.equals("")){
		//	out.print(SysUtility.setAlertScript(info,"parent.window.location.href='mcgl_tzrxx.jsp'"));
		//	return;
		//}
	}
}

//一人有限公司检查股东人数
String ent = mcgl.getENTTYPE();
if("115".equals(ent.substring(0,3))){
	int  czr = ywsb.getColumnValueBySql("SELECT COUNT(*)  FROM  MCGL_TZRXX_SQ WHERE OPENO='"+OPENO+"'");
		if(czr>1){
			out.print(SysUtility.setAlertScript("一人有限责任公司股东只能有1个！",""));
			return;
		}	
}

if(ywsb.getENTCLASS().equals("5")){

}else{
	int ywsbCount=ywsb.getColumnValueBySql("SELECT COUNT(*) FROM QYDJ_SQWT_SQ WHERE OPENO='"+OPENO+"'");
	if(ywsbCount==0){
		out.print(SysUtility.setAlertScript("您尚未填写授权委托信息！","parent.window.location.href='mcgl_sqwt.jsp'"));
		return;
	}
}

if(ywsb.getSTATUS().equals("3")){
	StringBuffer sqlstr=new StringBuffer("insert into qydj_ywsb_sq_ls ");
    sqlstr.append("(OPENO,PRIPID,OPETYPE,APPFORM,LINKMAN,CERTYPE,CERNO,TEL,MOBTEL,APPDATE,");
    sqlstr.append("APPOPIN,APPPER,APPRNO,APPROPIN,APPRPER,APPRDATE,REGNO,ENTNAME,LEREP,");
   sqlstr.append("REGORG,STATUS,LOGINID,ENTTYPE,SUBDOC,REGORGN,JQIP,CLBSDD,DEPID,DEPNAME,");
     sqlstr.append("APPRPID,CDDL,ENTCLASS,YSBH,OPELOCDISTRICT,LOCALADM,S_EXT_TIMESTAMP,UNISCID,RBSJ)");
     sqlstr.append(" select  ");
     sqlstr.append("OPENO,PRIPID,OPETYPE,APPFORM,LINKMAN,CERTYPE,CERNO,TEL,MOBTEL,APPDATE,");
     sqlstr.append("APPOPIN,APPPER,APPRNO,APPROPIN,APPRPER,APPRDATE,REGNO,ENTNAME,LEREP,");
     sqlstr.append("REGORG,STATUS,LOGINID,ENTTYPE,SUBDOC,REGORGN,JQIP,CLBSDD,DEPID,DEPNAME,");
    sqlstr.append("APPRPID,CDDL,ENTCLASS,YSBH,OPELOCDISTRICT,LOCALADM,S_EXT_TIMESTAMP,UNISCID,sysdate");
     sqlstr.append(" from qydj_ywsb_sq t where openo='"+OPENO+"'");
    if(!ywsb.doSql(sqlstr.toString())){
       out.print(SysUtility.setAlertScript("历史表添加数据失败!","parent.window.location.reload();"));
       return;
    }
}

bl=ywsb.doSql("UPDATE QYDJ_YWSB_SQ SET ENTTYPE='"+mcgl.getENTTYPE()+"', APPDATE=sysdate,STATUS='1',JQIP = '"+ip+"' WHERE OPENO='"+OPENO+"'");
if(!bl){
	out.print(SysUtility.setAlertScript("业务申办失败！",""));
	return;
}


bl=ywsb.doSql("UPDATE MCGL_JBXX_SQ SET APDATE=sysdate,NAMESTATUS='1' WHERE OPENO='"+OPENO+"'");
if(!bl){
	out.print(SysUtility.setAlertScript("业务申办失败！",""));
	return;
}
Page.init();
out.print(SysUtility.setAlertScript("操作成功，请等待工商局人员预审！","parent.window.location.href='"+request.getContextPath()+"/content.jsp'"));
%>