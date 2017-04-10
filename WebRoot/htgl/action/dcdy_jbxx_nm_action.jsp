<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.util.SYS_BHBM" %>
<html><head><title>数据保存</title></head>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="DCDY_JBXX" scope="page" class="com.macrosoft.icms.htgl.DCDY_JBXX_SQ">
<jsp:setProperty name="DCDY_JBXX" property="*"/>
</jsp:useBean>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ">
<jsp:setProperty name="QYDJ_YWSB" property="*"/>
</jsp:useBean>
<body>
<% 
	String OPENO=SysUtility.doPreProcess(request.getParameter("OPENO"));
    String ADNAME=SysUtility.doPreProcess(request.getParameter("ADNAME"));
	boolean bl=false;
	boolean ifFirst=false;
	String ip="";
    if(request.getHeader("x-forwarded-for")==null){
  	  ip=request.getRemoteAddr();
    }else{
  	  ip=request.getHeader("x-forwarded-for");
    }
	if(OPENO.equals("")|| OPENO==null){//第一次保存，生成新的业务编号MB开头
		OPENO=SYS_BHBM.CREATEBH(2,request.getParameter("REGORG"));
		Page.setOPENO(OPENO);//重新设置业务编号
		ifFirst=true;
	}
	DCDY_JBXX.setOPENO(OPENO);
	DCDY_JBXX.setSTATUS("0");
	DCDY_JBXX.setMORTGAGORTYPE("2");
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");  
	Date date=new Date();  
	String str=sdf.format(date);
	DCDY_JBXX.setREGDATE(str);
	
	if(DCDY_JBXX.doCount()){
		bl=DCDY_JBXX.doModify();
	}else{
		bl=DCDY_JBXX.doAdd();
	}
	if(!bl){
		out.print(SysUtility.setAlertScript("业务申报数据保存失败!","parent.window.location.reload();"));
	}
	String uniscid="";
	String regno="";
	String regorun=DCDY_JBXX.getREGORUN();
	if(regorun.length()==15){
	 	regno=regorun;
	}else{
		uniscid=regorun;
	}
	//外网业务申办表中插入一条记录
	QYDJ_YWSB.setOPENO(OPENO);
	QYDJ_YWSB.setSTATUS("0");
	QYDJ_YWSB.setJQIP(ip);
	if(QYDJ_YWSB.doCount()){
		/* if(QYDJ_YWSB.doPreProcess(request.getParameter("STATUS")).equals("3")){
			 String sqlstr="insert into qydj_ywsb_sq_ls select t.*,sysdate as rbsj from qydj_ywsb_sq t where openo='"+OPENO+"'";
		    if(!QYDJ_YWSB.doSql(sqlstr)){
		       out.print(SysUtility.setAlertScript("历史表添加数据失败!","parent.window.location.reload();"));
		       return;
		    }		   
		} */
		bl=QYDJ_YWSB.doSql("UPDATE QYDJ_YWSB_SQ "
		+"SET (OPETYPE,REGNO,ENTNAME,REGORG,STATUS,JQIP) "
		+"=(SELECT OPETYPE,MORREGCNO,MORTGAGO,REGORG,'0','"
		+ip+"' FROM dcdy_jbxx_sq WHERE OPENO='"+OPENO+"') WHERE OPENO='"+OPENO+"'");
	}else{
		bl=QYDJ_YWSB.doSql("INSERT INTO QYDJ_YWSB_SQ "
		+"(OPENO,PRIPID,OPETYPE,APPDATE,REGNO,UNISCID,ENTNAME,LEREP,REGORG,ENTTYPE,ENTCLASS,LOGINID,STATUS,JQIP,CDDL,LOCALADM,OPELOCDISTRICT) "
		+"SELECT OPENO,MOREPRIPID,OPETYPE,APPDATE,'"+regno+"','"+uniscid+"',MORTGAGO,MORE,REGORG,ENTTYPE,'D',LOGINID,'0','"
		+ip+"','6','','' FROM dcdy_jbxx_sq WHERE OPENO='"+OPENO+"'");
	}
	QYDJ_YWSB.doSql("UPDATE DCDY_JBXX_SQ SET APPDATE=sysdate WHERE OPENO='"+OPENO+"'");
	if(bl){
		out.print(SysUtility.setAlertScript("数据保存成功!","parent.window.location.href='../"+Page.getNextPage()[0]+"'"));
		Page.setMusted(0);	//该页已保存，可以进入下一页
	}
	else{
		out.print(SysUtility.setAlertScript("业务申报数据保存失败!",""));
	}
	
%>
</body>
</html>