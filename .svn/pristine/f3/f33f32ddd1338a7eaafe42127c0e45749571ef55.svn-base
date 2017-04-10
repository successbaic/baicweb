<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="QYDJ_BGSX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_BGSX_SQ"/>
<jsp:useBean id='WSDJ_TXJL' scope='page' class='com.macrosoft.icms.util.WSDJ_TXJL'/>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
<%@ page import="com.macrosoft.icms.util.SYS_BHBM" %>
<%@ page import="com.macrosoft.icms.system.PageShow" %>
<jsp:useBean id='MCGL_JBXX' scope='page' class='com.macrosoft.icms.gsnw.MCGL_JBXX_ZS'/>
<%@ page import="java.text.SimpleDateFormat" %> 
<%@ page import="java.util.Date" %>   
<html><head><title>数据保存</title></head>
<body>
<%
	String parentOption="parent.document.getElementById('subid').disabled=false;parent.document.getElementById('waitdiv').style.display='none';";
	String OPENO=Page.getOPENO();
	String REGNO=Page.getREGNO();
	String PRIPID=Page.getPRIPID();
	String ENTTYPE=Page.getENTTYPE();
	String OPETYPE=Page.getOPETYPE();
	String[] sALTITEM=request.getParameterValues("ALTITEM");
	String IFPROVINCENAME=QYDJ_BGSX.doPreProcess(request.getParameter("IFPROVINCENAME"));
	String sCDDL=request.getParameter("CDDL");
	String ENTNAME="";
	String ENTNAMEBE="";
	String ip="";
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");  
	Date date = new Date();
   	int dateNum=Integer.parseInt(sdf.format(date));
  // 	System.out.println(dateNum);
    if(request.getHeader("x-forwarded-for")==null){
  	  ip=request.getRemoteAddr();
    }else{
  	  ip=request.getHeader("x-forwarded-for");
    }
    String XZQH=webuser.getXZQH();
  //济南新增需求，配合事中事后双拆，业务系统增加地址判断，判断是否是违章建筑地址，如果是不允许设立登记
  	if(XZQH.startsWith("3701") && !ENTTYPE.equals("HZS") && !ENTTYPE.equals("HZSFZ")){//农合的不判断
  		//先判断原登记住所是否有值，是否属于违法建筑
  		String dom="";
  		if(request.getParameter("ALTBE02")!=null && request.getParameter("ALTBE02")!=""){
			dom=new String((request.getParameter("ALTBE02")).getBytes("ISO-8859-1"),"GBK");
		}
  		if(request.getParameter("ALTBE16")!=null && request.getParameter("ALTBE16")!=""){
			dom=new String((request.getParameter("ALTBE16")).getBytes("ISO-8859-1"),"GBK");
		}
  		String sql = "SELECT * FROM SZSH_XTJG_WZJZ WHERE ACTUALDOM='"+dom+"'";
			ResultSet rs = gsdbc.executeQuery(sql);
			if(rs.next()){
				out.print(SysUtility.setAlertScript("该登记地址已被列为违法违章建筑，不允许办理工商登记业务!",parentOption));
				return;
			
		}
		//循环选中的变更项，如果是住所，取出变更后的住所，判断是否是违法违章建筑	
  		for(int i=0;i<sALTITEM.length;i++){
  			String ALTITEM=sALTITEM[i];
  			if(ALTITEM.equals("02") || ALTITEM.equals("16")){//住所
  				String after="ALTAF"+ALTITEM;//取出变更后住所信息
  				String aftervalue=new String((request.getParameter(after)).getBytes("ISO-8859-1"),"GBK");
  				String sql1 = "SELECT * FROM SZSH_XTJG_WZJZ WHERE ACTUALDOM='"+aftervalue+"'";
  				ResultSet rs1 = gsdbc.executeQuery(sql1);
  				if(rs1.next()){
  					out.print(SysUtility.setAlertScript("该登记地址已被列为违法违章建筑，不允许办理工商登记业务!",parentOption));
  					return;
  				
  				}
  				
  			}
  	
  		}
  		
  	}
  
	String jbxxSqlCsh="";
	String sqlRyxx="";
	boolean bl=false;
	boolean FrChange=false;
	boolean RyChange=false;
	boolean CzChange=false;
	boolean FgsChange=false;
	boolean LlyChange=false;
	boolean IfFirst=false;
	boolean CwfzrChange=false;
	if(OPENO.equals("")|| OPENO==null){//第一次保存，生成新的业务编号MB开头
		OPENO=SYS_BHBM.CREATEBH(2,request.getParameter("REGORG"));
		Page.setOPENO(OPENO);//重新设置业务编号		
		IfFirst=true;
	}
	//删除原来的变更信息
	QYDJ_BGSX.setOPENO(OPENO);
	QYDJ_BGSX.doDeleteAll();	
	
	//循环遍历填写的变更事项
	for(int i=0;i<sALTITEM.length;i++){
		String ALTITEM=sALTITEM[i];
		String befor="ALTBE"+ALTITEM;
		String after="ALTAF"+ALTITEM;
		String ALTAFTER=QYDJ_BGSX.doPreProcess(QYDJ_BGSX.convertCode(request.getParameter(after)));
		
		if(!ALTAFTER.equals("")){
			String jbmod=QYDJ_BGSX.doModifyJbxx(ALTITEM,ALTAFTER);
		
			if(!jbmod.equals("")){
				if(jbxxSqlCsh.equals("")){
					jbxxSqlCsh=jbmod;
				}else{
					jbxxSqlCsh+=","+jbmod;
				}
			}
			
			String rymod=QYDJ_BGSX.doModifyRyxx(ALTITEM,ALTAFTER);
			if(!rymod.equals("")){
				if(sqlRyxx.equals("")){
					sqlRyxx=rymod;
				}else{
					sqlRyxx+=","+rymod;
				}
			}
		}
		if(request.getParameter("ALTITEM").equals("01")){	
			String str =(String)request.getParameter("ALTAF01");
			String strb = (String)request.getParameter("ALTBE01");
			ENTNAME=new String(str.getBytes("ISO8859-1"),"GBK");
			ENTNAMEBE=new String(strb.getBytes("ISO8859-1"),"GBK");
			StringBuffer sb = new StringBuffer();
			if(IFPROVINCENAME.equals("1")){
				sb.append(" SELECT *                        ");
				sb.append("   FROM MCGL_JBXX_ZS             ");
				sb.append("  WHERE ENTNAME = '"+ENTNAME+"'  ");
				sb.append("  AND S_EXT_TIMESTAMP=(SELECT  MAX(S_EXT_TIMESTAMP) FROM MCGL_JBXX_ZS WHERE ENTNAME = '"+ENTNAME+"'  AND PRIPID='"+PRIPID+"')  ");				
				sb.append(ContrInfo.getMczssql_shengju(icms.getSjCode(),webuser.getXZQH()));
				MCGL_JBXX.doSelectBySqlSJ(sb.toString());
			}else{
				sb.append(" SELECT *                        ");
				sb.append("   FROM MCGL_JBXX_ZS             ");
				sb.append("  WHERE ENTNAME = '"+ENTNAME+"'  ");
				sb.append("  AND S_EXT_TIMESTAMP=(SELECT  MAX(S_EXT_TIMESTAMP) FROM MCGL_JBXX_ZS WHERE ENTNAME = '"+ENTNAME+"'  AND PRIPID='"+PRIPID+"')  ");
				sb.append(ContrInfo.getMczssql_dishi(webuser.getXZQH()));
				MCGL_JBXX.doSelectBySql(sb.toString());		
			}
		//if(MCGL_JBXX.getENTNAMEBEALT().equals(""))	
		if(!MCGL_JBXX.getNAMEID().equals("")){
			if(!(MCGL_JBXX.getENTNAMEBEALT().equals(ENTNAMEBE))){
				System.out.println(ENTNAMEBE);
				out.print(SysUtility.setAlertScript("该企业名称不是当前申请变更企业的变更名称！","parent.window.location.reload();"));
				return;
			}
			if(!(MCGL_JBXX.getISENTNAMEALT()==1)){
				out.print(SysUtility.setAlertScript("该企业名称不是变更企业名称！","parent.window.location.reload();"));
				return;
			}
			if(!(MCGL_JBXX.getNAMESTATUS()==2)){
				out.print(SysUtility.setAlertScript("该企业名称不是预核准企业名称！","parent.window.location.reload();"));
				return;
			}
		
			int saveperto = Integer.parseInt(MCGL_JBXX.getSAVEPERTO().replaceAll("-", ""));	
		//	System.out.println(saveperto);
			if(saveperto<dateNum){
				out.print(SysUtility.setAlertScript("该企业名称已超出变更期限!","parent.window.location.reload();"));
				return;
			}
		}
	}	
		
		
		//变更事项表数据保存
		QYDJ_BGSX.setOPENO(OPENO);
		QYDJ_BGSX.setALTAF(request.getParameter(after));
		QYDJ_BGSX.setALTBE(request.getParameter(befor));
		QYDJ_BGSX.setALTITEM(ALTITEM);
		QYDJ_BGSX.setALTDATE(webuser.getCurrentDate());
		QYDJ_BGSX.setPRIPID(PRIPID);
		QYDJ_BGSX.setREGNO(REGNO);
		bl=QYDJ_BGSX.doAdd();
		if(!bl){
			out.print(SysUtility.setAlertScript("变更信息添加失败!","parent.window.location.reload();"));
			return;
		}
		
		if(!FrChange){
			QYDJ_BGSX.setFrChange(ALTITEM);
			FrChange=QYDJ_BGSX.getFrChange();
		}
		if(!RyChange){
			QYDJ_BGSX.setRyChange(ALTITEM);
			RyChange=QYDJ_BGSX.getRyChange();
		}
		if(!CzChange){			
			QYDJ_BGSX.setCzChange(ALTITEM);		
			CzChange=QYDJ_BGSX.getCzChange();
		}
		if(!FgsChange){			
			QYDJ_BGSX.setFgsChange(ALTITEM);		
			FgsChange=QYDJ_BGSX.getFgsChange();
		}
		if(!LlyChange){
			QYDJ_BGSX.setLlyChange(ALTITEM);		
			LlyChange=QYDJ_BGSX.getLlyChange();
		}
		if(!CwfzrChange){
			QYDJ_BGSX.setCwfzrChange(ALTITEM);		
			CwfzrChange=QYDJ_BGSX.getCwfzrChange();
		}
		if(ALTITEM.equals("02")){
			/*
			jbxxSqlCsh+=",PROVINCE="+SysUtility.doPreProcess3(SysUtility.convertCode(request.getParameter("ALTAF161")))+
					",CITY="+SysUtility.doPreProcess3(SysUtility.convertCode(request.getParameter("ALTAF162")))+
					",COUNTY="+SysUtility.doPreProcess3(SysUtility.convertCode(request.getParameter("ALTAF163")))+
					",TOWN="+SysUtility.doPreProcess3(SysUtility.convertCode(request.getParameter("ALTAF164")))+
					",VILLAGE="+SysUtility.doPreProcess3(SysUtility.convertCode(request.getParameter("ALTAF165")))+
					",HOUSENUMBER="+SysUtility.doPreProcess3(SysUtility.convertCode(request.getParameter("ALTAF166")));
			*/
			QYDJ_BGSX.setOPENO(OPENO);
			QYDJ_BGSX.setALTDATE(webuser.getCurrentDate());
			QYDJ_BGSX.setPRIPID(PRIPID);
			QYDJ_BGSX.setREGNO(REGNO);
			
			QYDJ_BGSX.setALTAF(request.getParameter("ALTAF161"));
			QYDJ_BGSX.setALTBE(request.getParameter("ALTBE161"));
			QYDJ_BGSX.setALTITEM("161");
			bl=QYDJ_BGSX.doAdd();
			
			QYDJ_BGSX.setALTAF(request.getParameter("ALTAF162"));
			QYDJ_BGSX.setALTBE(request.getParameter("ALTBE162"));
			QYDJ_BGSX.setALTITEM("162");
			bl=QYDJ_BGSX.doAdd();
			
			QYDJ_BGSX.setALTAF(request.getParameter("ALTAF163"));
			QYDJ_BGSX.setALTBE(request.getParameter("ALTBE163"));
			QYDJ_BGSX.setALTITEM("163");
			bl=QYDJ_BGSX.doAdd();
			
			QYDJ_BGSX.setALTAF(request.getParameter("ALTAF164"));
			QYDJ_BGSX.setALTBE(request.getParameter("ALTBE164"));
			QYDJ_BGSX.setALTITEM("164");
			bl=QYDJ_BGSX.doAdd();
			
			QYDJ_BGSX.setALTAF(request.getParameter("ALTAF165"));
			QYDJ_BGSX.setALTBE(request.getParameter("ALTBE165"));
			QYDJ_BGSX.setALTITEM("165");
			bl=QYDJ_BGSX.doAdd();
			
			QYDJ_BGSX.setALTAF(request.getParameter("ALTAF166"));
			QYDJ_BGSX.setALTBE(request.getParameter("ALTBE166"));
			QYDJ_BGSX.setALTITEM("166");
			bl=QYDJ_BGSX.doAdd();
		}
		if(!bl){
			out.print(SysUtility.setAlertScript("变更信息添加失败!","parent.window.location.reload();"));
			return;
		}
	
	}
	
	
	//从内网导入企业的相关信息--第一次全部导入，以后根据变更事项导入
	if(IfFirst){		
		bl=QYDJ_BGSX.doZs2Lc(OPENO,PRIPID,ENTTYPE,true,true,true,true,true);
		if(!bl){
			out.print(SysUtility.setAlertScript("正式库更新数据失败!","parent.window.location.reload();"));
			return;
		}
	}else{
		bl=QYDJ_BGSX.doZs2Lc(OPENO,PRIPID,ENTTYPE,!RyChange,!CzChange,!FgsChange,!LlyChange,!CwfzrChange);
	}
	
	String jbxxSql="UPDATE QYDJ_JBXX_SQ SET IFPROVINCENAME='"+IFPROVINCENAME+"',APPDATE=sysdate,OPETYPE='"+OPETYPE+"',STATUS='0',LOGINID='"
					+webuser.getLOGINID()+"',SPANAME='"+SysUtility.doPreProcess(request.getParameter("SPANAME"))+"' ";
	if(!jbxxSqlCsh.equals("")){
		jbxxSql+=","+jbxxSqlCsh;
	}					
	jbxxSql+=" WHERE OPENO="+QYDJ_BGSX.doPreProcess3(OPENO);
		
	bl=QYDJ_BGSX.doModifyBySql(jbxxSql);
	if(!bl){
		out.print(SysUtility.setAlertScript("基本信息数据更新失败!","parent.window.location.reload();"));
		return;
	}
	//更新人员信息
	if(!sqlRyxx.equals("")){
		bl=QYDJ_BGSX.doModifyBySql("UPDATE QYDJ_RYXX_SQ SET "+sqlRyxx+" WHERE OPENO="+QYDJ_BGSX.doPreProcess3(OPENO)+" AND LEREPSIGN='1'");
		if(!ENTTYPE.equals("HHQY")){
			if(!bl){
				out.print(SysUtility.setAlertScript("法定代表人信息数据更新失败!","parent.window.location.reload();"));
				return;
			}
		}
	}
	//外网业务申办表中插入一条记录
	QYDJ_YWSB.setOPENO(OPENO);	
	if(QYDJ_YWSB.doCount()){		
		bl=QYDJ_YWSB.doSql("UPDATE QYDJ_YWSB_SQ "
		+"SET (ENTNAME,LEREP,REGORG,ENTTYPE,ENTCLASS,JQIP,LOCALADM,OPELOCDISTRICT) "
		+"=(SELECT ENTNAME,LEREP,REGORG,ENTTYPE,ENTCLASS,'"
		+ip+"',LOCALADM,OPELOCDISTRICT FROM QYDJ_JBXX_SQ WHERE OPENO='"+OPENO+"') WHERE OPENO='"+OPENO+"'");		
	}else{
		bl=QYDJ_YWSB.doSql("INSERT INTO QYDJ_YWSB_SQ "
		+"(OPENO,PRIPID,UNISCID,OPETYPE,APPDATE,REGNO,ENTNAME,LEREP,REGORG,ENTTYPE,ENTCLASS,LOGINID,STATUS,JQIP,CDDL,LOCALADM,OPELOCDISTRICT) "
		+"SELECT OPENO,PRIPID,UNISCID,OPETYPE,APPDATE,REGNO,ENTNAME,LEREP,REGORG,ENTTYPE,ENTCLASS,LOGINID,'0','"
		+ip+"','"+sCDDL+"',LOCALADM,OPELOCDISTRICT FROM QYDJ_JBXX_SQ WHERE OPENO='"+OPENO+"'");
	}
	
		
	Page.clearPage();
	PageShow pageshow=new PageShow();
	if(OPETYPE.equals("30")){
	   pageshow.getPageForBg(ENTTYPE,FrChange, RyChange, CzChange, FgsChange,CwfzrChange,LlyChange,"1", "0", Page);
	}else if(OPETYPE.equals("40")){
	   pageshow.getPageForBa(ENTTYPE, RyChange, CzChange, FgsChange,CwfzrChange,LlyChange,"1", "0", Page);
	}	
	if(bl){	
		Page.setMusted(0);
		out.print(SysUtility.setAlertScript("保存成功!","parent.window.location.href='../"+Page.getNextPage()[0]+"';"));
	}
	else{
		out.print(SysUtility.setAlertScript("保存失败!",parentOption));
	}
%>
</body>
</html>