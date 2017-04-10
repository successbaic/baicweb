<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.util.SYS_BHBM" %>
<%@ page import="java.net.URLEncoder" %>
<html><head><title>数据保存</title></head>
<jsp:useBean id="QYDJ_RYXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_RYXX_SQ"/>
<jsp:useBean id="QYDJ_CZXX" scope="page"  class="com.macrosoft.icms.qydj.QYDJ_CZXX_SQ"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id='WSDJ_TXJL' scope='page' class='com.macrosoft.icms.util.WSDJ_TXJL'/>
<jsp:useBean id='WSDJ_LOG_RECORD' scope='page' class='com.macrosoft.icms.util.WSDJ_LOG_RECORD'/>
<jsp:useBean id="QYDJ_JBXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_JBXX_SQ">
<jsp:setProperty name="QYDJ_JBXX" property="*"/>
</jsp:useBean>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ">
<jsp:setProperty name="QYDJ_YWSB" property="*"/>
</jsp:useBean>
<jsp:useBean id="MCGL_JBXX_ZS" scope="page"  class="com.macrosoft.icms.gsnw.MCGL_JBXX_ZS"/>
<body>
<%
	String parentOption="parent.document.getElementById('subid').disabled=false;parent.document.getElementById('waitdiv').style.display='none';";
	String OPENO=QYDJ_JBXX.doPreProcess(request.getParameter("OPENO"));
	String MCXH=QYDJ_JBXX.doPreProcess(request.getParameter("MCXH"));
	String CDDL=QYDJ_JBXX.doPreProcess(request.getParameter("CDDL"));
	String NAMEAPPNO = QYDJ_JBXX.doPreProcess(request.getParameter("NAMEAPPNO"));
	String ENTNAME = QYDJ_JBXX.doPreProcess(request.getParameter("ENTNAME"));
	String sENTTYPE = Page.getENTTYPE();
	String IFELEC = Page.getIFELEC();
	String LOGINID =request.getParameter("LOGINID");
	String XZQH =webuser.getXZQH();
	System.out.println("xzqh=="+XZQH);
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
	
	QYDJ_JBXX.setOPENO(OPENO);
	QYDJ_JBXX.setSTATUS("0");
	QYDJ_JBXX.setIFELEC(IFELEC);
	if(ENTNAME.equals("")
	||QYDJ_JBXX.getENTTYPE().equals("")
	||QYDJ_JBXX.getENTCLASS().equals("")
	||QYDJ_JBXX.getLOGINID().equals("")
	){
		out.print(SysUtility.setAlertScript("页面录入信息不完整，请使用IE浏览器，请关闭浏览器后重新操作或联系系统管理员!",parentOption));
		return;
	}

	//济南新增需求，配合事中事后双拆，业务系统增加地址判断，判断是否是违章建筑地址，如果是不允许设立登记
		if(XZQH.startsWith("3701") && !sENTTYPE.equalsIgnoreCase("HZS") && !sENTTYPE.equalsIgnoreCase("HZSFZ")){
			String  dom="";
			if(request.getParameter("DOM")!=null && request.getParameter("DOM")!=""){
				dom=new String((request.getParameter("DOM")).getBytes("ISO-8859-1"),"GBK");
			}
			String  proloc="";
			if(request.getParameter("PROLOC")!=null && request.getParameter("PROLOC")!=""){
			  proloc=new String((request.getParameter("PROLOC")).getBytes("ISO-8859-1"),"GBK");
			}
			String sql = "SELECT * FROM SZSH_XTJG_WZJZ WHERE ACTUALDOM='"+dom+"' OR ACTUALDOM='"+proloc+"'";
			ResultSet rs = gsdbc.executeQuery(sql);
			if(rs.next()){
				out.print(SysUtility.setAlertScript("该登记地址已被列为违法违章建筑，不允许办理工商登记业务!",parentOption));
				return;
			
			}
			
		}
	if(QYDJ_JBXX.doCount()){
		bl=QYDJ_JBXX.doModify();		
	}else{		
		bl=QYDJ_JBXX.doAdd();
	}
	if(!bl){
		out.print(SysUtility.setAlertScript("基本信息保存失败!","parent.window.location.reload();"));
	}
	if(isSanZheng){
		if(QYDJ_JBXX.doCount2MiddleData()){
			bl=QYDJ_JBXX.doModify2MiddleData();		
		}else{		
			bl=QYDJ_JBXX.doAdd2MiddleData();
		}
	}
	if(!bl){
		out.print(SysUtility.setAlertScript("共享数据平台_基本信息保存失败!","parent.window.location.reload();"));
	}
	if(ifFirst && !MCXH.equals("")){
		String sub="sub02_03";
		if(Page.getENTTYPE().equals("HZS")){
			sub="sub02_01";
		}
		
		QYDJ_YWSB.doSql("insert into qydj_czxx_sq (OPENO,RECID,PRIPID,INVID,INV,INVTYPE,CERTYPE,CERNO,BLICTYPE,BLICNO,SUBCONAM,SUBCONPROP,COUNTRY,SUBCONAMUSD,CURRENCY) select '"+
				OPENO+"',RECID,'"+Page.getPRIPID()+"',INVID,INV,INVTYPE,CERTYPE,CERNO,BLICTYPE,BLICNO,SUBCONAM,CONPROP,COUNTRY,SUBCONAMUSD,CURRENCY from mcgl_tzrxx_zs@gs_link where nameid='"+MCXH+"'");
		if(webuser.getXZQH().equals("3701")){
			//暂时济南特有冠省名获取方式
			if(Page.getGMLX().equals("1")){
				QYDJ_YWSB.doSql("insert into qydj_czxx_sq (OPENO,RECID,PRIPID,INVID,INV,INVTYPE,CERTYPE,CERNO,BLICTYPE,BLICNO,SUBCONAM,SUBCONPROP,COUNTRY,SUBCONAMUSD,CURRENCY) select '"+
				OPENO+"',RECID,'"+Page.getPRIPID()+"',INVID,INV,INVTYPE,CERTYPE,CERNO,BLICTYPE,BLICNO,SUBCONAM,CONPROP,COUNTRY,SUBCONAMUSD,CURRENCY from mcgl_tzrxx_zs@sgs_link where nameid='"+MCXH+"'");
			}
		}		
	}
	//把基本信息表中法定代表人同步到人员信息表中
	QYDJ_RYXX.setOPENO(OPENO);
	QYDJ_RYXX.setPRIPID(Page.getPRIPID());
	QYDJ_RYXX.setNAME(QYDJ_RYXX.doPreProcess(request.getParameter("LEREP")));
	if(QYDJ_RYXX.doCountByFr()){
		bl=QYDJ_RYXX.doModifyFoName();
	}else{
		QYDJ_RYXX.setLEREPSIGN("1");
		QYDJ_RYXX.setRECID(SysUtility.getUUID20());
		bl=QYDJ_RYXX.doAdd();
	}
	if(!bl){
		out.print(SysUtility.setAlertScript("法定代表人保存失败!","parent.window.location.reload();"));
	}
	//如果是内资法人同步信息到出资出资表中（主管部门）
	if (sENTTYPE.equalsIgnoreCase("NZFR")) {
		//QYDJ_CZXX.setOPENO(OPENO);
		//QYDJ_CZXX.doSelecByOpeno();
		//QYDJ_CZXX.setINV(QYDJ_CZXX.doPreProcess(request.getParameter("DEPINCHA")));
		//if(QYDJ_CZXX.doCountByOpeno()){
		//	bl=QYDJ_CZXX.doModifyByOpeno();
		//}else{
		//	QYDJ_CZXX.setRECID(SysUtility.getUUID20());
		//	bl=QYDJ_CZXX.doAdd();
		//}
	}
	if(!bl){
		out.print(SysUtility.setAlertScript("主管单位保存失败!","parent.window.location.reload();"));
	}
	//外网业务申办表中插入一条记录
	QYDJ_YWSB.setOPENO(OPENO);
	QYDJ_YWSB.setSTATUS("0");
	QYDJ_YWSB.setJQIP(ip);
	if(QYDJ_YWSB.doCount()){		
		bl=QYDJ_YWSB.doSql("UPDATE QYDJ_YWSB_SQ "
		+"SET (ENTNAME,LEREP,REGORG,ENTTYPE,ENTCLASS,JQIP,LOCALADM,OPELOCDISTRICT,IFELEC) "
		+"=(SELECT ENTNAME,LEREP,REGORG,ENTTYPE,ENTCLASS,'"
		+ip+"',LOCALADM,OPELOCDISTRICT,IFELEC FROM QYDJ_JBXX_SQ WHERE OPENO='"+OPENO+"') WHERE OPENO='"+OPENO+"'");
		
	}else{
		bl=QYDJ_YWSB.doSql("INSERT INTO QYDJ_YWSB_SQ "
		+"(OPENO,PRIPID,OPETYPE,APPDATE,REGNO,ENTNAME,LEREP,REGORG,ENTTYPE,ENTCLASS,LOGINID,STATUS,JQIP,CDDL,LOCALADM,OPELOCDISTRICT,IFELEC) "
		+"SELECT OPENO,PRIPID,OPETYPE,APPDATE,REGNO,ENTNAME,LEREP,REGORG,ENTTYPE,ENTCLASS,LOGINID,'0','"
		+ip+"','"+CDDL+"',LOCALADM,OPELOCDISTRICT,IFELEC FROM QYDJ_JBXX_SQ WHERE OPENO='"+OPENO+"'");
	}	
	if(!bl){
		out.print(SysUtility.setAlertScript("业务申报数据保存失败!","parent.window.location.reload();"));
		return;
	}
	
	if(bl){
		out.print(SysUtility.setAlertScript("数据保存成功!","parent.window.location.href='../"+Page.getNextPage()[0]+"'"));
		Page.setMusted(0);	//该页已保存，可以进入下一页
	}
	else{
		out.print(SysUtility.setAlertScript("共享数据平台_业务申报数据保存失败!",parentOption));
	}
	//数据保存后日志表记录日志
	WSDJ_LOG_RECORD.setLOGID(SysUtility.getUUID20());
	WSDJ_LOG_RECORD.setLINKNAME("网上登记企业基本信息保存环节");
	WSDJ_LOG_RECORD.setUSERID(LOGINID);
	WSDJ_LOG_RECORD.setOPENO(OPENO);
	WSDJ_LOG_RECORD.setUSERIP(ip);
	WSDJ_LOG_RECORD.setENTNAME(QYDJ_YWSB.getENTNAME());
	WSDJ_LOG_RECORD.setOPERNAME(QYDJ_YWSB.getLEREP());
	WSDJ_LOG_RECORD.setIFELEC(IFELEC);
	WSDJ_LOG_RECORD.doAdd();
%>
</body>
</html>