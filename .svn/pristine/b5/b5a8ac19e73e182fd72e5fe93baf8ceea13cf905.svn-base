<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.util.SYS_BHBM" %>
<html><head><title>数据保存</title></head>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id='WSDJ_TXJL' scope='page' class='com.macrosoft.icms.util.WSDJ_TXJL'/>
<jsp:useBean id='QYDJ_YWSB' scope='page' class='com.macrosoft.icms.qydj.QYDJ_YWSB_SQ'/>
<jsp:useBean id='GQDJ_BGSX' scope='page' class='com.macrosoft.icms.gqdj.GQDJ_BGSX_SQ'/>
<jsp:useBean id="GQDJ_CXXX" scope="page" class="com.macrosoft.icms.gqdj.GQDJ_CXXX_SQ">
<jsp:setProperty name="GQDJ_CXXX" property="*"/>
</jsp:useBean>

<body>
<%
	//业务编号
	String OPENO=SysUtility.doPreProcess(request.getParameter("OPENO"));
	//企业内部序号
	String PRIPID=SysUtility.doPreProcess(request.getParameter("PRIPID"));
	String NWID=SysUtility.doPreProcess(request.getParameter("NWID"));
	String NWSN=SysUtility.doPreProcess(request.getParameter("NWSN"));
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
		OPENO=SYS_BHBM.getUniqueId(request.getParameter("REGORG"));
		Page.setOPENO(OPENO);//重新设置业务编号
		//首次保存需要将正式表的信息导入流程表中
		bl=GQDJ_BGSX.doZs2Lc(OPENO,NWID,NWSN);
		if(!bl){
			out.print(SysUtility.setAlertScript("正式库入流程库更新数据失败!","parent.window.location.reload();"));
		}
	}
	//注销信息保存
	GQDJ_CXXX.setOPENO(OPENO);
	if(GQDJ_CXXX.doCount()){
	    System.out.println("Modify");
		bl=GQDJ_CXXX.doModify();
	}else{
	    System.out.println("Add");
		bl=GQDJ_CXXX.doAdd();
	}
	if(!bl){
		out.print(SysUtility.setAlertScript("个体注销信息保存失败!","parent.window.location.reload();"));
	}
	//更新企业基本信息的状态、申请时间等
	String jbxxSql="UPDATE GQDJ_JBXX_SQ SET APPRDATE=sysdate,OPETYPE=81,STATUS='0',LOGINID='"+webuser.getLOGINID()
	+"' WHERE OPENO="+SysUtility.doPreProcess3(OPENO);
	
	bl=QYDJ_YWSB.doSql(jbxxSql);
	if(!bl){
		out.print(SysUtility.setAlertScript("基本信息数据更新失败!","parent.window.location.reload();"));
		return;
	}
	//业务申办信息
	QYDJ_YWSB.setOPENO(OPENO);	
	if(QYDJ_YWSB.doCount()){
		if(QYDJ_YWSB.doPreProcess(request.getParameter("STATUS")).equals("3")){
			 String sqlstr="insert into qydj_ywsb_sq_ls select t.*,sysdate as  rbsj from qydj_ywsb_sq t where openo='"+OPENO+"'";
		    if(!QYDJ_YWSB.doSql(sqlstr)){
		       out.print(SysUtility.setAlertScript("历史表添加数据失败!","parent.window.location.reload();"));
		       return;
		    }
		}
		bl=QYDJ_YWSB.doDelete();
	}
	bl=QYDJ_YWSB.doSql("INSERT INTO QYDJ_YWSB_SQ (OPENO,PRIPID,OPETYPE,APPDATE,REGNO,ENTNAME,REGORG,LOGINID,ENTCLASS,STATUS,JQIP,CDDL) "
			+"SELECT OPENO,PRIPID,OPETYPE,APPRDATE,REGNO,ENTNAME,REGORG,LOGINID,'4','0','"
			+ip+"','4' FROM GQDJ_JBXX_SQ WHERE OPENO='"+OPENO+"'");
	
	if(bl){
		out.print(SysUtility.setAlertScript("数据保存成功!","parent.window.location.href='"+Page.getNextPage()[0]+"'"));
		Page.setMusted(0);	//该页已保存，可以进入下一页
	}
	else{
		out.print(SysUtility.setAlertScript("业务申报数据保存失败!","parent.window.location.reload();"));
	}
%>
</body>
</html>