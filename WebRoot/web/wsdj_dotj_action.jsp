<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="/jspheader.inc"%>
<%@ page import="com.macrosoft.icms.system.SysUtility" %>
<%@ page import="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ" %>
<%@ page import="com.macrosoft.icms.qydj.QYDJ_JBXX_SQ" %>
<%@ page import="com.macrosoft.icms.qydj.QYDJ_CZXX_SQ" %>
<%@ page import="java.util.ArrayList" %> 
<%@ page import="com.macrosoft.icms.gsnw.GSYJXX" %> 
<%@ page import="com.macrosoft.icms.commAjax.action.TzCheckAction" %> 
<%@ page import="com.macrosoft.icms.commAjax.action.DjhCheckAction" %> 
<jsp:useBean id="QYDJ_JBXX_ZS" scope="page" class="com.macrosoft.icms.gsnw.QYDJ_JBXX_ZS" />
<jsp:useBean id="GTDJ_JBXX_ZS" scope="page" class="com.macrosoft.icms.gsnw.GTDJ_JBXX_ZS" />
<jsp:useBean id='WSDJ_TXJL' scope='page' class='com.macrosoft.icms.util.WSDJ_TXJL'/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id='WSDJ_LOG_RECORD' scope='page' class='com.macrosoft.icms.util.WSDJ_LOG_RECORD'/>

<%
boolean bl=false;
String OPENO=Page.getOPENO();
String IFELEC=Page.getIFELEC();
QYDJ_YWSB_SQ ywsb=new QYDJ_YWSB_SQ();
String ENTTYPE = Page.getENTTYPE();
if(!"GT".equals(ENTTYPE)){
	int ywsbCount=ywsb.getColumnValueBySql("SELECT COUNT(*) FROM QYDJ_SQWT_SQ WHERE OPENO='"+OPENO+"'");
	if(ywsbCount==0){
		out.print(SysUtility.setAlertScript("您尚未填写授权委托信息！","parent.window.location.href='"+request.getContextPath() +"/qydj_sqwt.jsp'"));
		return;
	}
}

ywsb.setOPENO(OPENO);
ywsb.doSelect();
if(Page.getOPETYPE().equals("20")||Page.getOPETYPE().equals("30")){
	int  czr = ywsb.getColumnValueBySql("SELECT COUNT(*)  FROM  QYDJ_CZXX_SQ WHERE OPENO='"+OPENO+"'");
	if(Page.getENTTYPE().equals("GS")||Page.getENTTYPE().equals("WZGS")||Page.getENTTYPE().equals("WZHH")||Page.getENTTYPE().equals("HHQY")||Page.getENTTYPE().equals("NZFR")||Page.getENTTYPE().equals("HZS")){
		if(czr==0){
			out.print(SysUtility.setAlertScript("请填写股东（投资人）信息！",""));
			return;
		}
	}
	String ent = ywsb.getENTTYPE();
	if("115".equals(ent.substring(0,3))){
		if(czr>1){
			out.print(SysUtility.setAlertScript("一人有限责任公司股东只能有1个！",""));
			return;
		}	
	}	
}

String ip="";
if(request.getHeader("x-forwarded-for")==null){
	  ip=request.getRemoteAddr();
}else{
  ip=request.getHeader("x-forwarded-for");
}

String ENTCLASS=ywsb.getENTCLASS();
String REGORG=ywsb.getREGORG();
String YSBH=ywsb.getYSBH();
String ENTNAME=ywsb.getENTNAME();

String sENTTYPE=icms.getSysRemark("ENTTYPE",ywsb.getENTTYPE());
if(Page.getOPETYPE().equals("30") || Page.getOPETYPE().equals("20")){
	if(sENTTYPE.equals("GS")
	||sENTTYPE.equals("WZGS")
	||sENTTYPE.equals("NZFR")
	||sENTTYPE.equals("WZFR")
	||sENTTYPE.equals("HHQY")
	||sENTTYPE.equals("WZHH")
	||sENTTYPE.equals("HZS")){
		
	}
}

if(Page.getOPETYPE().equals("20")){
	int countNum=0;
	if(ENTCLASS.equals("5")){
		if(ENTNAME.indexOf("*")<0){
			countNum=GTDJ_JBXX_ZS.getListCount(" WHERE TRANAME='"+ENTNAME+"' AND STATUS='1' ");
		}		
	}else{
		countNum=QYDJ_JBXX_ZS.getListCount(" WHERE ENTNAME='"+ENTNAME+"' AND ENTSTATUS='1' ");
	}
	if(countNum>0){
		out.print(SysUtility.setAlertScript("当前企业已经成立，不能再次办理！","parent.window.location.reload();"));	
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


if(YSBH.equals("")){
	int mYSBH=0;
	if(REGORG.equals("371300")){//市局是3
		mYSBH=ywsb.getColumnValueBySql("SELECT BH FROM SYS_YSBH WHERE REGORG='371300'");	
		if(mYSBH>=3){
			mYSBH=1;			
		}else{
			mYSBH=mYSBH+1;
		}
		bl=ywsb.doSql("UPDATE SYS_YSBH SET BH='"+mYSBH+"' WHERE REGORG='371300'");
		YSBH=mYSBH+"";
	}else if(REGORG.equals("371301")){//批发城是2
		mYSBH=ywsb.getColumnValueBySql("SELECT BH FROM SYS_YSBH WHERE REGORG='371301'");	
		if(mYSBH>=4){
			mYSBH=1;			
		}else{
			mYSBH=mYSBH+1;
		}
		bl=ywsb.doSql("UPDATE SYS_YSBH SET BH='"+mYSBH+"' WHERE REGORG='371301'");
		YSBH=mYSBH+"";
	}else if(REGORG.equals("371302")){//兰山是5
	   if(ywsb.getENTCLASS().equals("8") || ywsb.getENTCLASS().equals("5") || ywsb.getENTCLASS().equals("7") || (ywsb.getENTCLASS().equals("2") && ("4540".equals(ywsb.getENTTYPE()) || "4560".equals(ywsb.getENTTYPE()) ))){
	       
	   }else{
			mYSBH=ywsb.getColumnValueBySql("SELECT BH FROM SYS_YSBH WHERE REGORG='371302'");	
			if(mYSBH>=5){
				mYSBH=1;			
			}else{
				mYSBH=mYSBH+1;
			}
			bl=ywsb.doSql("UPDATE SYS_YSBH SET BH='"+mYSBH+"' WHERE REGORG='371302'");
		}
		YSBH=mYSBH+"";
	}else{
		YSBH="";
	}
}

if(ywsb.getENTCLASS().equals("5")){
	bl=ywsb.doSql("UPDATE GTDJ_JBXX_SQ SET APPDATE=sysdate ,STATUS='1' WHERE OPENO='"+OPENO+"'");
}else{
	bl=ywsb.doSql("UPDATE QYDJ_JBXX_SQ SET APPDATE=sysdate ,STATUS='1',YSBH='"+YSBH+"' WHERE OPENO='"+OPENO+"'");
}
if(!bl){
	out.print(SysUtility.setAlertScript("基本信息保存失败！",""));
	return;
}

bl=ywsb.doSql("UPDATE QYDJ_YWSB_SQ SET APPDATE=sysdate,STATUS='1',YSBH='"+YSBH+"' WHERE OPENO='"+OPENO+"'");

if(!bl){
	out.print(SysUtility.setAlertScript("业务申办保存失败！",""));
	return;
}
if(isSanZheng){
	bl=ywsb.doSql2MiddleData("UPDATE QYDJ_YWSB_SQ SET APPDATE=sysdate,STATUS='1',YSBH='"+YSBH+"' WHERE OPENO='"+OPENO+"'");
	
	if(!bl){
		out.print(SysUtility.setAlertScript("共享数据平台_业务申办保存失败！",""));
		return;
	}
}
bl=ywsb.doSql("insert into wsdj_czjl(openo,czlx,czry,czsj,jqip) values ('"+OPENO+"','1','"+webuser.getLOGINID()+"',sysdate,'"+ip+"')");
if(!bl){
	out.print(SysUtility.setAlertScript("操作记录保存失败！",""));
	return;
}
if(isSanZheng){
	bl=ywsb.doSql2MiddleData("insert into wsdj_czjl(openo,czlx,czry,czsj,jqip) values ('"+OPENO+"','1','"+webuser.getLOGINID()+"',sysdate,'"+ip+"')");
	if(!bl){
		out.print(SysUtility.setAlertScript("共享数据平台_操作记录保存失败！",""));
		return;
	}
	}
out.print(SysUtility.setAlertScript("操作成功，请等待工商局人员预审！","parent.window.location.href='../content.jsp'"));
//数据保存后日志表记录日志
WSDJ_LOG_RECORD.setLOGID(SysUtility.getUUID20());
WSDJ_LOG_RECORD.setLINKNAME("网上登记提交审批环节");
WSDJ_LOG_RECORD.setUSERID(webuser.getLOGINID());
WSDJ_LOG_RECORD.setOPENO(OPENO);
WSDJ_LOG_RECORD.setUSERIP(ip);
WSDJ_LOG_RECORD.setENTNAME(ywsb.getENTNAME());
WSDJ_LOG_RECORD.setOPERNAME(ywsb.getLEREP());
WSDJ_LOG_RECORD.setIFELEC(IFELEC);
WSDJ_LOG_RECORD.doAdd();
%>