<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.util.SYS_BHBM" %>
<html><head><title>���ݱ���</title></head>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="HWGG_JBXX" scope="page" class="com.macrosoft.icms.gggl.HWGG_JBXX_SQ">
<jsp:setProperty name="HWGG_JBXX" property="*"/>
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
	if(OPENO.equals("")|| OPENO==null){//��һ�α��棬�����µ�ҵ����MB��ͷ
		OPENO=SYS_BHBM.CREATEBH(2,request.getParameter("REGORG"));
		Page.setOPENO(OPENO);//��������ҵ����
		ifFirst=true;
	}
	HWGG_JBXX.setOPENO(OPENO);
	HWGG_JBXX.setSTATUS("0");
	if(HWGG_JBXX.doCount()){
		bl=HWGG_JBXX.doModify();
	}else{
		bl=HWGG_JBXX.doAdd();
	}
	if(!bl){
		out.print(SysUtility.setAlertScript("ҵ���걨���ݱ���ʧ��!","parent.window.location.reload();"));
	}
	//����ҵ�������в���һ����¼
	QYDJ_YWSB.setOPENO(OPENO);
	QYDJ_YWSB.setSTATUS("0");
	QYDJ_YWSB.setJQIP(ip);
	if(QYDJ_YWSB.doCount()){
		if(QYDJ_YWSB.doPreProcess(request.getParameter("STATUS")).equals("3")){
			 String sqlstr="insert into qydj_ywsb_sq_ls select t.*,sysdate as  rbsj from qydj_ywsb_sq t where openo='"+OPENO+"'";
		    if(!QYDJ_YWSB.doSql(sqlstr)){
		       out.print(SysUtility.setAlertScript("��ʷ���������ʧ��!","parent.window.location.reload();"));
		       return;
		    }		   
		}
		bl=QYDJ_YWSB.doSql("UPDATE QYDJ_YWSB_SQ "
		+"SET (ENTNAME,REGORG,STATUS,JQIP) "
		+"=(SELECT ADNAME,REGORG,'0','"
		+ip+"' FROM hwgg_jbxx_sq WHERE OPENO='"+OPENO+"') WHERE OPENO='"+OPENO+"'");
	}else{
		bl=QYDJ_YWSB.doSql("INSERT INTO QYDJ_YWSB_SQ "
		+"(OPENO,PRIPID,OPETYPE,APPDATE,REGNO,ENTNAME,LEREP,REGORG,ENTTYPE,ENTCLASS,LOGINID,STATUS,JQIP,CDDL,LOCALADM,OPELOCDISTRICT) "
		+"SELECT OPENO,'',OPETYPE,APPDATE,'',ADNAME,'',REGORG,'HWGG','H',LOGINID,'0','"
		+ip+"','5','','' FROM hwgg_jbxx_sq WHERE OPENO='"+OPENO+"'");
	}	
	if(bl){
		out.print(SysUtility.setAlertScript("���ݱ���ɹ�!","parent.window.location.href='../"+Page.getNextPage()[0]+"'"));
		Page.setMusted(0);	//��ҳ�ѱ��棬���Խ�����һҳ
	}
	else{
		out.print(SysUtility.setAlertScript("ҵ���걨���ݱ���ʧ��!",""));
	}
%>
</body>
</html>