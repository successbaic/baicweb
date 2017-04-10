<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="../jspheader.inc"%>
<%@ page import="com.macrosoft.icms.util.SYS_BHBM" %>
<jsp:useBean id="MCGL_JBXX_SQ" scope="page" class="com.macrosoft.icms.mcgl.MCGL_JBXX_SQ"/>
<jsp:useBean id="QYDJ_YWSB_SQ" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<%
String parentOption="parent.document.getElementById('subid').disabled=false;parent.document.getElementById('waitdiv').style.display='none';";
String OPENO=MCGL_JBXX_SQ.doPreProcess(request.getParameter("OPENO"));
String TRADPINY=MCGL_JBXX_SQ.doPreProcess(request.getParameter("TRADPINY"));
String TRADPINY1=MCGL_JBXX_SQ.doPreProcess(request.getParameter("TRADPINY1"));
String TRADPINY2=MCGL_JBXX_SQ.doPreProcess(request.getParameter("TRADPINY2"));
String TRADPINY3=MCGL_JBXX_SQ.doPreProcess(request.getParameter("TRADPINY3"));

String ENTCLASS=MCGL_JBXX_SQ.doPreProcess(request.getParameter("ENTCLASS"));
String NAMETYPE=MCGL_JBXX_SQ.doPreProcess(request.getParameter("NAMETYPE"));
String PREREGORG=MCGL_JBXX_SQ.doPreProcess(request.getParameter("PREREGORG"));
String NAMEIND=MCGL_JBXX_SQ.doPreProcess(MCGL_JBXX_SQ.convertCode(request.getParameter("NAMEIND")));
String ENTTRA=MCGL_JBXX_SQ.doPreProcess(MCGL_JBXX_SQ.convertCode(request.getParameter("ENTTRA")));
String ENTNAME=MCGL_JBXX_SQ.doPreProcess(MCGL_JBXX_SQ.convertCode(request.getParameter("ENTNAME")));
if(ENTNAME.length()<5){
	out.print(SysUtility.setAlertScript("名称过短，完整的名称包括行政区划、字号、行业、组成形式!","parent.window.location.reload();"));
	return;
}

String SPANAME1=MCGL_JBXX_SQ.doPreProcess(MCGL_JBXX_SQ.convertCode(request.getParameter("SPANAME1")));
String ENTNAME1=MCGL_JBXX_SQ.doPreProcess(MCGL_JBXX_SQ.convertCode(request.getParameter("ENTNAME1")));
String SPANAME2=MCGL_JBXX_SQ.doPreProcess(MCGL_JBXX_SQ.convertCode(request.getParameter("SPANAME2")));
String ENTNAME2=MCGL_JBXX_SQ.doPreProcess(MCGL_JBXX_SQ.convertCode(request.getParameter("ENTNAME2")));
String SPANAME3=MCGL_JBXX_SQ.doPreProcess(MCGL_JBXX_SQ.convertCode(request.getParameter("SPANAME3")));
String ENTNAME3=MCGL_JBXX_SQ.doPreProcess(MCGL_JBXX_SQ.convertCode(request.getParameter("ENTNAME3")));

String ip="";
if(request.getHeader("x-forwarded-for")==null){
	  ip=request.getRemoteAddr();
}else{
	  ip=request.getHeader("x-forwarded-for");
}
if(OPENO.equals("")){
	if(QYDJ_YWSB_SQ.getListCount(" WHERE ENTNAME='"+ENTNAME+"'AND STATUS !='5' AND LOGINID='"+webuser.getLOGINID()+"'")>0){
		out.print(SysUtility.setAlertScript("您已经申请了该名称，请不要重复申请!","parent.window.location.reload();"));
		return;
	}
	OPENO=SYS_BHBM.CREATEBH(2,PREREGORG);
	Page.setOPENO(OPENO);	
}
if(ENTCLASS.equals("")
||NAMETYPE.equals("")
||ENTTRA.equals("")
||PREREGORG.equals("")
){
	out.print(SysUtility.setAlertScript("页面录入信息不完整，请使用IE浏览器，请关闭浏览器后重新操作或联系系统管理员!",parentOption));
	return;
}
Page.setENTCLASS(ENTCLASS);	
Page.setDL("0");

boolean bl=false;
MCGL_JBXX_SQ.setOPENO(OPENO);
if(MCGL_JBXX_SQ.doCount()){
	bl=MCGL_JBXX_SQ.doModBySql("UPDATE MCGL_JBXX_SQ SET ENTCLASS='"+ENTCLASS+"',NAMETYPE='"+NAMETYPE+"',PREREGORG='"+PREREGORG+"',NAMEIND='"+NAMEIND
	+"',ENTTRA='"+ENTTRA+"',ENTNAME='"+ENTNAME+"',TRADPINY='"+TRADPINY+"',TRADPINY1='"+TRADPINY1+"',TRADPINY2='"+TRADPINY2+"',TRADPINY3='"+TRADPINY3
	+"',TRADPINY4='"+TRADPINY+"',SPANAME1='"+SPANAME1+"',SPANAME2='"+SPANAME2+"',SPANAME3='"+SPANAME3+"',SPANAME4='"+ENTTRA+"',ENTNAME1='"+ENTNAME1
	+"',ENTNAME2='"+ENTNAME2+"',ENTNAME3='"+ENTNAME3+"',ENTNAME4='"+ENTNAME+"',LOGINID='"+webuser.getLOGINID()+"',APDATE=sysdate,TRAMARK=0,NAMESTATUS='0' WHERE OPENO='"+OPENO+"'");
}else{
	bl=MCGL_JBXX_SQ.doModBySql("INSERT INTO MCGL_JBXX_SQ (OPENO,NAMESTATUS,LOGINID,APDATE,TRAMARK,TRADPINY,TRADPINY1,TRADPINY2,TRADPINY3,ENTCLASS,NAMETYPE,PREREGORG,NAMEIND,ENTTRA,ENTNAME,SPANAME1,ENTNAME1,SPANAME2,ENTNAME2,SPANAME3,ENTNAME3,SPANAME4,TRADPINY4,ENTNAME4,OPETYPE) VALUES( "
	+"'"+OPENO+"','0','"+webuser.getLOGINID()+"',sysdate,'0','"+TRADPINY+"','"+TRADPINY1+"','"+TRADPINY2+"','"+TRADPINY3+"','"+ENTCLASS+"','"+NAMETYPE+"','"+PREREGORG+"','"+NAMEIND+"','"+ENTTRA+"','"+ENTNAME+"','"+SPANAME1+"','"+ENTNAME1+"','"
	+SPANAME2+"','"+ENTNAME2+"','"+SPANAME3+"','"+ENTNAME3+"','"+ENTTRA+"','"+TRADPINY+"','"+ENTNAME+"','10')");
}
if(!bl){
	out.print(SysUtility.setAlertScript("基本信息数据保存失败!","parent.window.location.reload();"));
	return;
}
QYDJ_YWSB_SQ.setOPENO(OPENO);
if(QYDJ_YWSB_SQ.doCount()){	
	bl=MCGL_JBXX_SQ.doModBySql("UPDATE QYDJ_YWSB_SQ SET (OPENO,PRIPID,OPETYPE,APPDATE,APPPER,APPRDATE,ENTNAME,REGORG,LOGINID,JQIP,CDDL,ENTCLASS) =(SELECT OPENO,PRIPID,'10',APDATE,'','',ENTNAME,PREREGORG,LOGINID,'"+ip+"','0',ENTCLASS FROM MCGL_JBXX_SQ WHERE OPENO='"+OPENO+"') WHERE OPENO='"+OPENO+"'");
}else{
	bl=MCGL_JBXX_SQ.doModBySql("INSERT INTO QYDJ_YWSB_SQ (OPENO,PRIPID,OPETYPE,APPDATE,APPPER,APPRDATE,ENTNAME,REGORG,STATUS,LOGINID,JQIP,CDDL,ENTCLASS) SELECT OPENO,PRIPID,'10',APDATE,'','',ENTNAME,PREREGORG,NAMESTATUS,LOGINID,'"+ip+"','0',ENTCLASS FROM MCGL_JBXX_SQ WHERE OPENO='"+OPENO+"'");
}
if(bl){
	out.print(SysUtility.setAlertScript("保存成功!","parent.window.location.href='mcgl_control.jsp';"));
	return;
}else{
	out.print(SysUtility.setAlertScript("业务申报数据保存失败!","parent.window.location.reload();"));
	return;
}

%>