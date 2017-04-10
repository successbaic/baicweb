<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.util.SYS_BHBM" %> 
<html><head><title>数据保存</title></head>
<jsp:useBean id="GTDJ_JYZXX" scope="page" class="com.macrosoft.icms.qydj.GTDJ_JYZXX_SQ"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id='WSDJ_TXJL' scope='page' class='com.macrosoft.icms.util.WSDJ_TXJL'/>
<jsp:useBean id='WSDJ_LOG_RECORD' scope='page' class='com.macrosoft.icms.util.WSDJ_LOG_RECORD'/>
<jsp:useBean id="GTDJ_JBXX" scope="page" class="com.macrosoft.icms.qydj.GTDJ_JBXX_SQ">
<jsp:setProperty name="GTDJ_JBXX" property="*"/>
</jsp:useBean>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ">
<jsp:setProperty name="QYDJ_YWSB" property="*"/>
</jsp:useBean>
<body>
<%
	String parentOption="parent.document.getElementById('subid').disabled=false;parent.document.getElementById('waitdiv').style.display='none';";
	String OPENO=GTDJ_JBXX.doPreProcess(request.getParameter("OPENO"));
	String sTYPE=request.getParameter("CDDL");
	String IFELEC = Page.getIFELEC();
	String XZQH =webuser.getXZQH();
	System.out.println("xzqh=="+XZQH);
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
	}	
	//济南新增需求，配合事中事后双拆，业务系统增加地址判断，判断是否是违章建筑地址，如果是不允许设立登记
			if(XZQH.startsWith("3701")){
				String  dom="";
				if(request.getParameter("OPLOC")!=null && request.getParameter("OPLOC")!=""){
					dom=new String((request.getParameter("OPLOC")).getBytes("ISO-8859-1"),"GBK");
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
	
	GTDJ_JBXX.setOPENO(OPENO);
	GTDJ_JBXX.setSTATUS("0");	
	GTDJ_JBXX.setIFELEC(IFELEC);

	if(GTDJ_JBXX.doCount()){
		bl=GTDJ_JBXX.doModify();
	}else{		
		//该业务出资信息表中还没记录时，往WSDJ_TXJL（填写记录表）中插入一条记录；
		WSDJ_TXJL.setOPENO(OPENO);
		WSDJ_TXJL.setWJBH(1001);
		WSDJ_TXJL.setCZRY(webuser.getLOGINID());
		WSDJ_TXJL.setJQIP(ip);
		WSDJ_TXJL.setCZSJ(webuser.getCurrentDate());
		WSDJ_TXJL.doAdd();
		//基本信息表中插入一条记录
		bl=GTDJ_JBXX.doAdd();
	}
	if(!bl){
		out.print(SysUtility.setAlertScript("基本信息保存失败!","parent.window.location.reload();"));
	}
	if(isSanZheng){
		if(GTDJ_JBXX.doCount2MiddleData()){
			bl=GTDJ_JBXX.doModify2MiddleData();
		}else{				
			bl=GTDJ_JBXX.doAdd2MiddleData();
		}
		if(!bl){
			out.print(SysUtility.setAlertScript("基本信息保存失败!","parent.window.location.reload();"));
		}
	}
	GTDJ_JYZXX.setOPENO(OPENO);
	GTDJ_JYZXX.setPRIPID(Page.getPRIPID());
	GTDJ_JYZXX.setNAME(SysUtility.doPreProcess(request.getParameter("OPERNAME")));
	if(GTDJ_JYZXX.doCount()){
		GTDJ_JYZXX.doModifyByJyz();	
	}else{
		GTDJ_JYZXX.doAdd();
	}
	
	if(QYDJ_YWSB.doCount()){		
		bl=QYDJ_YWSB.doSql("UPDATE QYDJ_YWSB_SQ "
		+"SET (ENTNAME,LEREP,REGORG,JQIP,LOCALADM,OPELOCDISTRICT) "
		+"=(SELECT TRANAME,OPERNAME,REGORG,'"
		+ip+"',LOCALADM,OPELOCDISTRICT FROM GTDJ_JBXX_SQ WHERE OPENO='"+OPENO+"') WHERE OPENO='"+OPENO+"'");
	}else{
		bl=QYDJ_YWSB.doSql("INSERT INTO QYDJ_YWSB_SQ(OPELOCDISTRICT,LOCALADM,CDDL,JQIP,STATUS,LOGINID,OPENO,PRIPID,OPETYPE,REGNO,UNISCID,ENTNAME,REGORG,APPDATE,ENTTYPE,ENTCLASS,LEREP) VALUES('"
		+GTDJ_JBXX.getOPELOCDISTRICT()+"','"+GTDJ_JBXX.getLOCALADM()+"','"+sTYPE+"','"+ ip +"','0','"+ GTDJ_JBXX.getLOGINID() +"','"+ OPENO +"','"+ GTDJ_JBXX.getPRIPID() +"','"+ GTDJ_JBXX.getOPETYPE() +"','"+ GTDJ_JBXX.getREGNO() 
		+"','"+ GTDJ_JBXX.getUNISCID() +"','"+ GTDJ_JBXX.getTRANAME() +"','"+ GTDJ_JBXX.getREGORG()+"', to_date('"+GTDJ_JBXX.getAPPDATE() +"','yyyy-mm-dd'),'9999',5,'"+GTDJ_JBXX.getOPERNAME()+"')");
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
	WSDJ_LOG_RECORD.setLINKNAME("网上登记个体工商户基本信息保存环节");
	WSDJ_LOG_RECORD.setUSERID(GTDJ_JBXX.getLOGINID());
	WSDJ_LOG_RECORD.setOPENO(OPENO);
	WSDJ_LOG_RECORD.setUSERIP(ip);
	WSDJ_LOG_RECORD.setENTNAME(GTDJ_JBXX.getTRANAME());
	WSDJ_LOG_RECORD.setOPERNAME(GTDJ_JBXX.getOPERNAME());
	WSDJ_LOG_RECORD.setIFELEC(IFELEC);
	WSDJ_LOG_RECORD.doAdd();
%>
</body>
</html>