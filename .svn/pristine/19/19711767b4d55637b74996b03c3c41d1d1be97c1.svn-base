<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id='MCGL_BGSX' scope='page' class='com.macrosoft.icms.mcgl.MCGL_BGSX_SQ'/>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
<jsp:useBean id="QYDJ_JBXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.QYDJ_JBXX_ZS"/>
<jsp:useBean id="GTDJ_JBXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.GTDJ_JBXX_ZS"/>
<%@ page import="com.macrosoft.icms.util.SYS_BHBM" %>
<%@ page import="com.macrosoft.icms.system.PageShow" %> 
<html><head><title>数据保存</title></head>
<body>
<%
	String parentOption="parent.document.getElementById('subid').disabled=false;parent.document.getElementById('waitdiv').style.display='none';";
	String OPENO=Page.getOPENO();
	String PRIPID=Page.getPRIPID();
	String OPETYPE=Page.getOPETYPE();	
	String sCDDL=request.getParameter("CDDL");
	//String NAMEID=SysUtility.doPreProcess(request.getParameter("NAMEID"));
	String NAMETYPE=SysUtility.doPreProcess(request.getParameter("NAMETYPE"));
	String OLDNAME=SysUtility.doPreProcess(SysUtility.convertCode(request.getParameter("OLDNAME")));
	
	String ip="";
    if(request.getHeader("x-forwarded-for")==null){
  	  ip=request.getRemoteAddr();
    }else{
  	  ip=request.getHeader("x-forwarded-for");
    }
    String sqlJbxx="";
	boolean bl=false;
	boolean IfFirst=false;
	if(OPENO.equals("")|| OPENO==null){//第一次保存，生成新的业务编号
		OPENO=SYS_BHBM.CREATEBH(2,request.getParameter("REGORG"));
		Page.setOPENO(OPENO);//重新设置业务编号		
		IfFirst=true;		
	}
	
	bl=MCGL_BGSX.doZs2Lc_MCBG(OPENO,PRIPID,Page.getENTCLASS());
	if(!bl){
		out.print(SysUtility.setAlertScript("正式库更新数据失败!","parent.window.location.reload();"));
		return;
	}
	
	String jbxxSql="UPDATE MCGL_JBXX_SQ SET APDATE=sysdate,OPETYPE='"+OPETYPE+"',NAMESTATUS='0',LOGINID='"
	+webuser.getLOGINID()
	+"',ENTNAME="+SysUtility.doPreProcess3(SysUtility.convertCode(request.getParameter("ENTNAME")))
	+",ENTTRA="+SysUtility.doPreProcess3(SysUtility.convertCode(request.getParameter("ENTTRA")))
	+",TRADPINY="+SysUtility.doPreProcess3(SysUtility.convertCode(request.getParameter("TRADPINY")))
	+",NAMEIND="+SysUtility.doPreProcess3(SysUtility.convertCode(request.getParameter("NAMEIND")))
	+",ENTNAME1="+SysUtility.doPreProcess3(SysUtility.convertCode(request.getParameter("ENTNAME1")))
	+",TRADPINY1="+SysUtility.doPreProcess3(SysUtility.convertCode(request.getParameter("TRADPINY1")))
	+",SPANAME1="+SysUtility.doPreProcess3(SysUtility.convertCode(request.getParameter("SPANAME1")))
	+",NAMETYPE="+SysUtility.doPreProcess3(NAMETYPE)
	+",ENTNAMEBEALT="+SysUtility.doPreProcess3(OLDNAME)
	+",ISENTNAMEALT=1 WHERE OPENO="+MCGL_BGSX.doPreProcess3(OPENO);
	
	bl=MCGL_BGSX.doModifyBySql(jbxxSql);
	if(!bl){
		out.print(SysUtility.setAlertScript("基本信息数据更新失败!","parent.window.location.reload();"));
		return;
	}
	//外网业务申办表中插入一条记录
	QYDJ_YWSB.setOPENO(OPENO);
	String REGNO = "";
	String UNISCID = "";
 	if("5".equals(Page.getENTCLASS())) {
		GTDJ_JBXX_ZS.doSelectBySql("SELECT * FROM GTDJ_JBXX_ZS WHERE PRIPID = '" +PRIPID+"'");
		REGNO=GTDJ_JBXX_ZS.getREGNO();
	} else {
		QYDJ_JBXX_ZS.doSelectBySql("SELECT * FROM QYDJ_JBXX_ZS WHERE PRIPID = '" +PRIPID+"'");
		REGNO=QYDJ_JBXX_ZS.getREGNO();
		UNISCID=QYDJ_JBXX_ZS.getUNISCID();
	}
	if(QYDJ_YWSB.doCount()){		
		bl=QYDJ_YWSB.doSql("UPDATE QYDJ_YWSB_SQ "
		+"SET (ENTNAME,LEREP,REGORG,ENTTYPE,ENTCLASS,JQIP,REGNO,UNISCID,CERNO) "
		+"=(SELECT ENTNAME,OWNERNAME,PREREGORG,ENTTYPE,ENTCLASS,'"
		+ip+"','"+REGNO+"','"+UNISCID+"','"+Page.getXGBH()+"' FROM MCGL_JBXX_SQ WHERE OPENO='"+OPENO+"') WHERE OPENO='"+OPENO+"'");
	}else{
		bl=QYDJ_YWSB.doSql("INSERT INTO QYDJ_YWSB_SQ "
		+"(OPENO,PRIPID,OPETYPE,APPDATE,ENTNAME,LEREP,REGORG,ENTTYPE,ENTCLASS,LOGINID,STATUS,JQIP,CDDL,REGNO,UNISCID,CERNO) "
		+"SELECT OPENO,PRIPID,OPETYPE,APDATE,ENTNAME,OWNERNAME,PREREGORG,ENTTYPE,ENTCLASS,LOGINID,'0','"
		+ip+"','"+sCDDL+"','"+REGNO+"','"+UNISCID+"','"+Page.getXGBH()+"' FROM MCGL_JBXX_SQ WHERE OPENO='"+OPENO+"'");
	}

	if(bl){		
		Page.setMusted(0);
		out.print(SysUtility.setAlertScript("保存成功!","parent.window.location.href='../mcgl/"+Page.getNextPage()[0]+"';"));
	}
	else{
		out.print(SysUtility.setAlertScript("业务申报数据保存失败!",parentOption));
	}
%>
</body>
</html>