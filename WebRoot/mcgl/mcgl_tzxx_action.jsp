<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id='MCGL_BGSX' scope='page' class='com.macrosoft.icms.mcgl.MCGL_BGSX_SQ'/>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
<%@ page import="com.macrosoft.icms.util.SYS_BHBM" %>
<%@ page import="com.macrosoft.icms.system.PageShow" %> 
<html><head><title>数据保存</title></head>
<body>
<%
	String parentOption="parent.document.getElementById('subid').disabled=false;parent.document.getElementById('waitdiv').style.display='none';";
	String OPENO=Page.getOPENO();
	String PRIPID=Page.getPRIPID();
	String OPETYPE=Page.getOPETYPE();
	String NAMEID=SysUtility.doPreProcess(request.getParameter("NAMEID"));
	String[] sALTITEM=request.getParameterValues("ALTITEM");
	String sCDDL=request.getParameter("CDDL");
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
	//删除原来的变更信息
	MCGL_BGSX.setOPENO(OPENO);
	MCGL_BGSX.doDeleteAll();
	
	//循环遍历填写的变更事项
	for(int i=0;i<sALTITEM.length;i++){
		String ALTITEM=sALTITEM[i];
		String befor="ALTBE"+ALTITEM;
		String after="ALTAF"+ALTITEM;
		
		String ALTAFTER=MCGL_BGSX.convertCode(request.getParameter(after));
		//生成更新基本信息、人员信息的sql语句
		if(!ALTAFTER.equals("")){
			String jbmod=MCGL_BGSX.doModifyJbxx(ALTITEM,ALTAFTER);
			if(!jbmod.equals("")){
				if(sqlJbxx.equals("")){
					sqlJbxx=jbmod;
				}else{
					sqlJbxx+=","+jbmod;
				}
			}
		}
		
		//int max =MCGL_BGSX.getListMax("WHERE OPENO='"+OPENO+"'");		
		//变更事项表数据保存
		MCGL_BGSX.setOPENO(OPENO);
		MCGL_BGSX.setALTAF(request.getParameter(after));
		MCGL_BGSX.setALTBE(request.getParameter(befor));
		MCGL_BGSX.setALTITEM(ALTITEM);
		MCGL_BGSX.setALTDATE(webuser.getCurrentDate());
		MCGL_BGSX.setPRIPID(PRIPID);
		MCGL_BGSX.setRECID(SysUtility.getUUID20());
		bl=MCGL_BGSX.doAdd();
		
		if(ALTITEM.equals("98")){
			befor="ALTBE11";
			after="ALTAF11";
			String afterValue=request.getParameter(after);
			String beforValue=request.getParameter(befor);
			if(afterValue!=null && !afterValue.equals("")){
				if(!afterValue.equals(beforValue)){
					
					String jbmod=MCGL_BGSX.doModifyJbxx("11",afterValue);
					if(!jbmod.equals("")){
						if(sqlJbxx.equals("")){
							sqlJbxx=jbmod;
						}else{
							sqlJbxx+=","+jbmod;
						}
					}
										
					//变更事项表数据保存
					MCGL_BGSX.setOPENO(OPENO);
					MCGL_BGSX.setALTAF(request.getParameter(after));
					MCGL_BGSX.setALTBE(request.getParameter(befor));
					MCGL_BGSX.setALTITEM("11");
					MCGL_BGSX.setALTDATE(webuser.getCurrentDate());
					MCGL_BGSX.setPRIPID(PRIPID);
					MCGL_BGSX.setRECID(SysUtility.getUUID20());
					bl=MCGL_BGSX.doAdd();
				}
			}
		}
		
		if(ALTITEM.equals("04") || ALTITEM.equals("13")){
			sqlJbxx+=",PROVINCE="+SysUtility.doPreProcess3(SysUtility.convertCode(request.getParameter("ALTAF161")))+
					",CITY="+SysUtility.doPreProcess3(SysUtility.convertCode(request.getParameter("ALTAF162")))+
					",COUNTY="+SysUtility.doPreProcess3(SysUtility.convertCode(request.getParameter("ALTAF163")))+
					",TOWN="+SysUtility.doPreProcess3(SysUtility.convertCode(request.getParameter("ALTAF164")))+
					",VILLAGE="+SysUtility.doPreProcess3(SysUtility.convertCode(request.getParameter("ALTAF165")))+
					",HOUSENUMBER="+SysUtility.doPreProcess3(SysUtility.convertCode(request.getParameter("ALTAF166")));
			MCGL_BGSX.setOPENO(OPENO);
			MCGL_BGSX.setALTDATE(webuser.getCurrentDate());
			MCGL_BGSX.setPRIPID(PRIPID);
			
			MCGL_BGSX.setALTAF(request.getParameter("ALTAF161"));
			MCGL_BGSX.setALTBE(request.getParameter("ALTBE161"));
			MCGL_BGSX.setALTITEM("161");
			MCGL_BGSX.setRECID(SysUtility.getUUID20());
			bl=MCGL_BGSX.doAdd();
			
			MCGL_BGSX.setALTAF(request.getParameter("ALTAF162"));
			MCGL_BGSX.setALTBE(request.getParameter("ALTBE162"));
			MCGL_BGSX.setALTITEM("162");
			MCGL_BGSX.setRECID(SysUtility.getUUID20());
			bl=MCGL_BGSX.doAdd();
			
			MCGL_BGSX.setALTAF(request.getParameter("ALTAF163"));
			MCGL_BGSX.setALTBE(request.getParameter("ALTBE163"));
			MCGL_BGSX.setALTITEM("163");
			MCGL_BGSX.setRECID(SysUtility.getUUID20());
			bl=MCGL_BGSX.doAdd();
			
			MCGL_BGSX.setALTAF(request.getParameter("ALTAF164"));
			MCGL_BGSX.setALTBE(request.getParameter("ALTBE164"));
			MCGL_BGSX.setALTITEM("164");
			MCGL_BGSX.setRECID(SysUtility.getUUID20());
			bl=MCGL_BGSX.doAdd();
			
			MCGL_BGSX.setALTAF(request.getParameter("ALTAF165"));
			MCGL_BGSX.setALTBE(request.getParameter("ALTBE165"));
			MCGL_BGSX.setALTITEM("165");
			MCGL_BGSX.setRECID(SysUtility.getUUID20());
			bl=MCGL_BGSX.doAdd();
			
			MCGL_BGSX.setALTAF(request.getParameter("ALTAF166"));
			MCGL_BGSX.setALTBE(request.getParameter("ALTBE166"));
			MCGL_BGSX.setALTITEM("166");
			MCGL_BGSX.setRECID(SysUtility.getUUID20());
			bl=MCGL_BGSX.doAdd();
		}
		if(!bl){
			out.print(SysUtility.setAlertScript("变更信息添加失败!","parent.window.location.reload();"));
			return;
		}
	}
	//从内网导入企业的相关信息--第一次全部导入，以后根据变更事项导入
	if(IfFirst){		
		bl=MCGL_BGSX.doZs2Lc(OPENO,NAMEID,true);
		if(!bl){
			out.print(SysUtility.setAlertScript("正式库更新数据失败!","parent.window.location.reload();"));
			return;
		}
	}else{
		bl=MCGL_BGSX.doZs2Lc(OPENO,NAMEID,true);
	}	
	
	String jbxxSql="UPDATE MCGL_JBXX_SQ SET APDATE=sysdate,OPETYPE='"+OPETYPE+"',NAMESTATUS='0',LOGINID='"
	+webuser.getLOGINID()+"',SPANAME='"+SysUtility.doPreProcess(request.getParameter("SPANAME"))+"'";
	if(sqlJbxx.equals("")){
		jbxxSql+=" WHERE OPENO="+MCGL_BGSX.doPreProcess3(OPENO);
	}else{
		jbxxSql+=","+sqlJbxx+" WHERE OPENO="+MCGL_BGSX.doPreProcess3(OPENO);
	}
	bl=MCGL_BGSX.doModifyBySql(jbxxSql);
	if(!bl){
		out.print(SysUtility.setAlertScript("基本信息数据更新失败!","parent.window.location.reload();"));
		return;
	}
	//外网业务申办表中插入一条记录
	QYDJ_YWSB.setOPENO(OPENO);	
	if(QYDJ_YWSB.doCount()){		
		bl=QYDJ_YWSB.doSql("UPDATE QYDJ_YWSB_SQ "
		+"SET (ENTNAME,LEREP,REGORG,ENTTYPE,ENTCLASS,JQIP) "
		+"=(SELECT ENTNAME,OWNERNAME,PREREGORG,ENTTYPE,ENTCLASS,'"
		+ip+"' FROM MCGL_JBXX_SQ WHERE OPENO='"+OPENO+"') WHERE OPENO='"+OPENO+"'");
	}else{
		bl=QYDJ_YWSB.doSql("INSERT INTO QYDJ_YWSB_SQ "
		+"(OPENO,PRIPID,OPETYPE,APPDATE,ENTNAME,LEREP,REGORG,ENTTYPE,ENTCLASS,LOGINID,STATUS,JQIP,CDDL) "
		+"SELECT OPENO,PRIPID,OPETYPE,APDATE,ENTNAME,OWNERNAME,PREREGORG,ENTTYPE,ENTCLASS,LOGINID,'0','"
		+ip+"','"+sCDDL+"' FROM MCGL_JBXX_SQ WHERE OPENO='"+OPENO+"'");
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