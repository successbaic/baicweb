<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.util.SYS_BHBM" %>
<html><head><title>数据保存</title></head>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id='WSDJ_TXJL' scope='page' class='com.macrosoft.icms.util.WSDJ_TXJL'/>
<jsp:useBean id="GTDJ_BGSX" scope="page" class="com.macrosoft.icms.qydj.GTDJ_BGXX_SQ"/>
<jsp:useBean id='QYDJ_YWSB' scope='page' class='com.macrosoft.icms.qydj.QYDJ_YWSB_SQ'/>
<jsp:useBean id="GTDJ_ZXXX" scope="page" class="com.macrosoft.icms.qydj.GTDJ_ZXXX_SQ">
<jsp:setProperty name="GTDJ_ZXXX" property="*"/>
</jsp:useBean>

<body>
<%
	String parentOption="parent.document.getElementById('subid').disabled=false;parent.document.getElementById('waitdiv').style.display='none';";
	//业务编号
	String OPENO=SysUtility.doPreProcess(request.getParameter("OPENO"));
	//企业内部序号
	String PRIPID=SysUtility.doPreProcess(request.getParameter("PRIPID"));
	String sTYPE=request.getParameter("TYPE");
	boolean bl=false;
	String ip="";
    if(request.getHeader("x-forwarded-for")==null){
  	  ip=request.getRemoteAddr();
    }else{
  	  ip=request.getHeader("x-forwarded-for");
    }
    System.out.println(OPENO);
	if(OPENO.equals("")|| OPENO==null){//第一次保存，生成新的业务编号MB开头
		OPENO=SYS_BHBM.CREATEBH(2,request.getParameter("REGORG"));
		Page.setOPENO(OPENO);//重新设置业务编号
		//首次保存需要将正式表的信息导入流程表中
		bl=GTDJ_BGSX.doZs2Lc(OPENO,PRIPID,"50","true");
		System.out.println(bl);
		if(!bl){
			out.print(SysUtility.setAlertScript("正式库入流程库更新数据失败!","parent.window.location.reload();"));
		}
	}
	
	//注销信息保存
	System.out.println(OPENO);
	GTDJ_ZXXX.setOPENO(OPENO);
	if(GTDJ_ZXXX.doCount()){
	    System.out.println("Modify");
		bl=GTDJ_ZXXX.doModify();
	}else{
	    System.out.println("Add");
		bl=GTDJ_ZXXX.doAdd();
	}
	if(!bl){
		out.print(SysUtility.setAlertScript("个体注销信息保存失败!","parent.window.location.reload();"));
	}
	//更新企业基本信息的状态、申请时间等
	String jbxxSql="UPDATE GTDJ_JBXX_SQ SET APPDATE=sysdate,OPETYPE=50,STATUS='0',LOGINID='"+webuser.getLOGINID()
	+"',SPANAME1='"+SysUtility.doPreProcess(request.getParameter("SPANAME1"))+"' WHERE OPENO="+SysUtility.doPreProcess3(OPENO);
	
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
		+"(OPENO,PRIPID,OPETYPE,APPDATE,REGNO,UNISCID,ENTNAME,LEREP,REGORG,LOGINID,ENTCLASS,ENTTYPE,STATUS,JQIP,CDDL,LOCALADM,OPELOCDISTRICT) "
		+"SELECT OPENO,PRIPID,OPETYPE,APPDATE,REGNO,UNISCID,TRANAME,OPERNAME,REGORG,LOGINID,'5','9999','0','"
		+ip+"','"+sTYPE+"',LOCALADM,OPELOCDISTRICT FROM GTDJ_JBXX_SQ WHERE OPENO='"+OPENO+"'");
	}
	
	
	if(bl){
		out.print(SysUtility.setAlertScript("数据保存成功!","parent.window.location.href='../"+Page.getNextPage()[0]+"'"));
		Page.setMusted(0);	//该页已保存，可以进入下一页
	}
	else{
		out.print(SysUtility.setAlertScript("业务申报数据保存失败!","parent.window.location.reload();"));
	}
%>
</body>
</html>