<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="import java.util.HashMap"%>
<%@page import="import java.util.Map"%>
<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.util.SYS_BHBM" %>
<html><head><title>���ݱ���</title></head>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="business" scope="page" class="com.macrosoft.icms.qcdzh.BusinessBA"/>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ">
<jsp:setProperty name="QYDJ_YWSB" property="*"/>
</jsp:useBean>
<body>
<% 
	String OPENO=SysUtility.doPreProcess(request.getParameter("OPENO"));

	if(OPENO.equals("")|| OPENO==null){//��һ�α��棬�����µ�ҵ����MB��ͷ
		OPENO=SYS_BHBM.CREATEBH(2,request.getParameter("REGORG"));
		Page.setOPENO(OPENO);//��������ҵ����
		ifFirst=true;
	}

    String uniscid=SysUtility.doPreProcess(request.getParameter("uniscid"));
    String regno=SysUtility.doPreProcess(request.getParameter("regno"));
    String llr=SysUtility.doPreProcess(request.getParameter("llr"));
    String tel=SysUtility.doPreProcess(request.getParameter("tel"));
    String storeOl=SysUtility.doPreProcess(request.getParameter("storeOl"));
    String storeOl_url=SysUtility.doPreProcess(request.getParameter("storeOl_url"));
    
    Map map=new HashMap();
	map.put("uniscid", uniscid);
	map.put("regno", regno);
	map.put("llr", llr);
	map.put("tel", tel);
	map.put("storeOl", storeOl);
	map.put("storeOl_url", storeOl_url);
	map.put("openo", OPENO);
    
	String code=business.businessFiling(map);//����������
	if("10000".equals(code)){
		business.setStatus("12");
	}else{
		business.setStatus("0");
	}
	
    String pripid=Page.getPRIPID();
	boolean bl=false;
	boolean ifFirst=false;
	String ip="";
    if(request.getHeader("x-forwarded-for")==null){
  	  ip=request.getRemoteAddr();
    }else{
  	  ip=request.getHeader("x-forwarded-for");
    }
	/* if(OPENO.equals("")|| OPENO==null){//��һ�α��棬�����µ�ҵ����MB��ͷ
		OPENO=SYS_BHBM.CREATEBH(2,request.getParameter("REGORG"));
		Page.setOPENO(OPENO);//��������ҵ����
		ifFirst=true;
	} */
	business.setOPENO(OPENO);
	
	
	if(business.doCount()){
		bl=business.doModify();
	}else{
		bl=business.doAdd();
	}
	if(!bl){
		out.print(SysUtility.setAlertScript("ҵ���걨���ݱ���ʧ��!","parent.window.location.reload();"));
	}
	//����ҵ�������в���һ����¼
	QYDJ_YWSB.setOPENO(OPENO);
	QYDJ_YWSB.setSTATUS("0");
	QYDJ_YWSB.setJQIP(ip);
	if(QYDJ_YWSB.doCount()){
		bl=QYDJ_YWSB.doSql("UPDATE QYDJ_YWSB_SQ "
		+"SET (OPETYPE,REGNO,ENTNAME,REGORG,STATUS,JQIP) "
		+"=(SELECT OPETYPE,MORREGCNO,MORTGAGO,REGORG,'0','"
		+ip+"' FROM business_sq WHERE OPENO='"+OPENO+"') WHERE OPENO='"+OPENO+"'");
	}else{
		bl=QYDJ_YWSB.doSql("INSERT INTO QYDJ_YWSB_SQ "
		+"(OPENO,PRIPID,OPETYPE,APPDATE,REGNO,UNISCID,ENTNAME,LEREP,REGORG,ENTTYPE,ENTCLASS,LOGINID,STATUS,JQIP,CDDL,LOCALADM,OPELOCDISTRICT) "
		+"SELECT OPENO,MOREPRIPID,OPETYPE,APPDATE,'"+regno+"','"+uniscid+"',MORTGAGO,MORE,REGORG,ENTTYPE,'QC',LOGINID,'0','"
		+ip+"','11','','' FROM business_sq WHERE OPENO='"+OPENO+"'");
	}
	QYDJ_YWSB.doSql("UPDATE BUSINESS_BAXX_SQ SET APPDATE=sysdate WHERE OPENO='"+OPENO+"'");	
	if(bl){
		out.print(SysUtility.setAlertScript("�����ɹ�!","parent.window.location.href='../../content.jsp'"));
		Page.setMusted(0);	//��ҳ�ѱ��棬���Խ�����һҳ
	}
	else{
		out.print(SysUtility.setAlertScript("ҵ���걨���ݱ���ʧ��!",""));
	}
	
%>
</body>
</html>