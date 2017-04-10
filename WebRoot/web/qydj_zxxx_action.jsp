<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.util.SYS_BHBM" %>
<html><head><title>数据保存</title></head>
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
	//业务编号
	String OPENO=SysUtility.doPreProcess(request.getParameter("OPENO"));
	//企业内部序号
	String PRIPID=SysUtility.doPreProcess(request.getParameter("PRIPID"));
	String sCDDL=request.getParameter("CDDL");
	boolean bl=false;
	String ip="";
    if(request.getHeader("x-forwarded-for")==null){
  	  ip=request.getRemoteAddr();
    }else{
  	  ip=request.getHeader("x-forwarded-for");
    }
    
	if(OPENO.equals("")|| OPENO==null){//第一次保存，生成新的业务编号MB开头
		OPENO=SYS_BHBM.CREATEBH(2,request.getParameter("REGORG"));
		Page.setOPENO(OPENO);//重新设置业务编号
		//首次保存需要将正式表的信息导入流程表中
		bl=QYDJ_BGSX.doZs2Lc(OPENO,PRIPID,"50",true,true,true,true,true);
		if(!bl){
			out.print(SysUtility.setAlertScript("正式库入流程库更新数据失败!","parent.window.location.reload();"));
		}
	}
	
	//注销信息保存
	QYDJ_ZXXX.setOPENO(OPENO);
	if(QYDJ_ZXXX.doCount()){
		bl=QYDJ_ZXXX.doModify();
	}else{
		bl=QYDJ_ZXXX.doAdd();
	}
	if(!bl){
		out.print(SysUtility.setAlertScript("企业注销信息保存失败!","parent.window.location.reload();"));
	}
	//更新企业基本信息的状态、申请时间等
	String jbxxSql="UPDATE QYDJ_JBXX_SQ SET APPDATE=sysdate,OPETYPE=50,STATUS='0',LOGINID='"+webuser.getLOGINID()
	+"',SPANAME='"+SysUtility.doPreProcess(request.getParameter("SPANAME"))+"' WHERE OPENO="+QYDJ_BGSX.doPreProcess3(OPENO);	
	bl=QYDJ_YWSB.doSql(jbxxSql);
	if(!bl){
		out.print(SysUtility.setAlertScript("基本信息数据更新失败!","parent.window.location.reload();"));
		return;
	}
	//业务申办信息
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
		out.print(SysUtility.setAlertScript("数据保存成功!","parent.window.location.href='../"+Page.getNextPage()[0]+"';"));
		Page.setMusted(0);	//该页已保存，可以进入下一页	
	}
	else{
		out.print(SysUtility.setAlertScript("业务申报数据保存失败!","parent.window.location.reload();"));
	}
%>
</body>
</html>