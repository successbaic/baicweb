<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="GTDJ_BGSX" scope="page" class="com.macrosoft.icms.qydj.GTDJ_BGXX_SQ"/>
<jsp:useBean id='WSDJ_TXJL' scope='page' class='com.macrosoft.icms.util.WSDJ_TXJL'/>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
<%@ page import="com.macrosoft.icms.util.SYS_BHBM" %>
<html><head><title>数据保存</title></head>
<body>
<%
    String parentOption="parent.document.getElementById('subid').disabled=false;parent.document.getElementById('waitdiv').style.display='none';";
	String OPENO=Page.getOPENO();
	String REGNO=Page.getREGNO();
	String PRIPID=Page.getPRIPID();
	String[] sALTITEM=request.getParameterValues("ALTITEM");
	String sTYPE=request.getParameter("TYPE");
	String ip="";
    if(request.getHeader("x-forwarded-for")==null){
  	  ip=request.getRemoteAddr();
    }else{
  	  ip=request.getHeader("x-forwarded-for");
    }
  
    String XZQH=webuser.getXZQH();
    //济南新增需求，配合事中事后双拆，业务系统增加地址判断，判断是否是违章建筑地址，如果是不允许设立登记
    	if(XZQH.startsWith("3701")){
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
    
	//String sqlJbxx="";
	String sqlRyxx="";
	boolean bl=false;	
	boolean IfFirst=false;
	boolean RyChange=false;
	if(OPENO.equals("")|| OPENO==null){//第一次保存，生成新的业务编号MB开头
		OPENO=SYS_BHBM.CREATEBH(2,request.getParameter("REGORG"));
		Page.setOPENO(OPENO);//重新设置业务编号		
		IfFirst=true;
	}
	//删除原来的变更信息
	GTDJ_BGSX.setOPENO(OPENO);
	GTDJ_BGSX.doDeleteAll();
	
	//循环遍历填写的变更事项
	for(int i=0;i<sALTITEM.length;i++){
		String ALTITEM=sALTITEM[i];
		String befor="ALTBE"+ALTITEM;
		String after="ALTAF"+ALTITEM;
		String ALTAFTER=GTDJ_BGSX.convertCode(request.getParameter(after));
		String jbmod="";
		String rymod="";
		//变更事项表数据保存
		GTDJ_BGSX.setOPENO(OPENO);
		GTDJ_BGSX.setALTAF(request.getParameter(after));
		GTDJ_BGSX.setALTBE(request.getParameter(befor));
		GTDJ_BGSX.setALTITEM(ALTITEM);
		GTDJ_BGSX.setALTDATE(webuser.getCurrentDate());
		GTDJ_BGSX.setPRIPID(PRIPID);
		bl=GTDJ_BGSX.doAdd();
		if(!bl){
			out.print(SysUtility.setAlertScript("变更信息添加失败!","parent.window.location.reload();"));
		}		
		if(ALTITEM.equals("01")){//字号名称
			jbmod="TRANAME='"+ALTAFTER+"'";
		}else if(ALTITEM.equals("09")){//经营者
			RyChange=true;
			jbmod="OPERNAME='"+ALTAFTER+"'";
			rymod="NAME='"+ALTAFTER+"'";
		}else if(ALTITEM.equals("68")){//性别
		    RyChange=true;
		    rymod="SEX='"+ALTAFTER+"'";
		}else if(ALTITEM.equals("64")){//民族
		    RyChange=true;
		    rymod="NATION='"+ALTAFTER+"'";
		}else if(ALTITEM.equals("70")){//政治面貌
		    RyChange=true;
		    rymod="POLSTAND='"+ALTAFTER+"'";
		}else if(ALTITEM.equals("71")){//文化程度
		    RyChange=true;
		    rymod="LITEDEG='"+ALTAFTER+"'";
		}else if(ALTITEM.equals("72")){//职业状况
		    RyChange=true;
		    rymod="OCCSTBEAPP='"+ALTAFTER+"'";
		}else if(ALTITEM.equals("65")){//家庭成员		    
		    jbmod="FAMMEMBER='"+ALTAFTER+"'";
		}else if(ALTITEM.equals("66")){//身份证号码
		    RyChange=true;
		    rymod="CERNO='"+ALTAFTER+"'";
		}else if(ALTITEM.equals("67")){//住所
		    RyChange=true;
		    rymod="DOM='"+ALTAFTER+"'";
		}else if(ALTITEM.equals("73")){//邮政编码
		    RyChange=true;
		    rymod="POSTALCODE='"+ALTAFTER+"'";
		}else if(ALTITEM.equals("74")){//经营者联系电话
		    RyChange=true;
		    rymod="TEL='"+ALTAFTER+"'";
		}else if(ALTITEM.equals("75")){//电子邮箱
		    RyChange=true;
		    rymod="EMAIL='"+ALTAFTER+"'";
		}else if(ALTITEM.equals("76")){//经营者移动电话
			RyChange=true;
			rymod="MOBTEL='"+ALTAFTER+"'";
		}else if(ALTITEM.equals("14")){//组成形式
			jbmod="COMPFORM='"+ALTAFTER+"'";			
		}else if(ALTITEM.equals("15")){//经营范围
			jbmod="BUSSCOANDFORM='"+ALTAFTER+"'";
		}else if(ALTITEM.equals("04")){//资金数额
			jbmod="CAPAM='"+ALTAFTER+"'";
		}else if(ALTITEM.equals("50")){//联系电话
			jbmod="TEL='"+ALTAFTER+"'";
		}else if(ALTITEM.equals("69")){//邮政编码
			jbmod="POSTALCODE='"+ALTAFTER+"'";
		}else if(ALTITEM.equals("16")){//经营场所
			jbmod="OPLOC='"+ALTAFTER+"'";
		
			GTDJ_BGSX.setOPENO(OPENO);
			GTDJ_BGSX.setALTDATE(webuser.getCurrentDate());
			GTDJ_BGSX.setPRIPID(PRIPID);
			
			GTDJ_BGSX.setALTAF(request.getParameter("ALTAF161"));
			GTDJ_BGSX.setALTBE(request.getParameter("ALTBE161"));
			GTDJ_BGSX.setALTITEM("161");
			bl=GTDJ_BGSX.doAdd();
			
			GTDJ_BGSX.setALTAF(request.getParameter("ALTAF162"));
			GTDJ_BGSX.setALTBE(request.getParameter("ALTBE162"));
			GTDJ_BGSX.setALTITEM("162");
			bl=GTDJ_BGSX.doAdd();
			
			GTDJ_BGSX.setALTAF(request.getParameter("ALTAF163"));
			GTDJ_BGSX.setALTBE(request.getParameter("ALTBE163"));
			GTDJ_BGSX.setALTITEM("163");
			bl=GTDJ_BGSX.doAdd();
			
			GTDJ_BGSX.setALTAF(request.getParameter("ALTAF164"));
			GTDJ_BGSX.setALTBE(request.getParameter("ALTBE164"));
			GTDJ_BGSX.setALTITEM("164");
			bl=GTDJ_BGSX.doAdd();
			
			GTDJ_BGSX.setALTAF(request.getParameter("ALTAF165"));
			GTDJ_BGSX.setALTBE(request.getParameter("ALTBE165"));
			GTDJ_BGSX.setALTITEM("165");
			bl=GTDJ_BGSX.doAdd();
			
			GTDJ_BGSX.setALTAF(request.getParameter("ALTAF166"));
			GTDJ_BGSX.setALTBE(request.getParameter("ALTBE166"));
			GTDJ_BGSX.setALTITEM("166");
			bl=GTDJ_BGSX.doAdd();
			
		}else if(ALTITEM.equals("13")){//从业人数
			jbmod="EMPNUM='"+ALTAFTER+"'";
		}	
		/*
		if(!jbmod.equals("")){
			if(sqlJbxx.equals("")){
				sqlJbxx=jbmod;
			}else{
				sqlJbxx+=","+jbmod;
			}
		}
		*/
		if(!rymod.equals("")){
		    if(sqlRyxx.equals("")){
		         sqlRyxx=rymod;
		    }else{
		         sqlRyxx+=","+rymod;
		    }
		}
	}
	//从内网导入企业的相关信息--第一次全部导入，以后根据变更事项导入
	if(IfFirst){		
		bl=GTDJ_BGSX.doZs2Lc(OPENO,PRIPID,"30","true");		
	}else{
		bl=GTDJ_BGSX.doZs2Lc(OPENO,PRIPID,"30",(!RyChange)+"");
	}
	if(!bl){
		out.print(SysUtility.setAlertScript("正式库更新数据失败!","parent.window.location.reload();"));
	}
	//NWACTION nwaction=new NWACTION();
	//nwaction.getSqlList();
	//nwaction.getNwJbxx(OPENO,PRIPID);
	//nwaction.getNwRyxx(OPENO,PRIPID);
	//nwaction.getNwCzxx(OPENO,PRIPID);
	//nwaction.doSqlExcute();
	//更新企业基本信息
	
	String jbxxSql="UPDATE GTDJ_JBXX_SQ SET APPDATE=sysdate,OPETYPE=30,STATUS='0',LOGINID='"+webuser.getLOGINID()
	+"',SPANAME1='"+SysUtility.doPreProcess(request.getParameter("SPANAME1"))+"' WHERE OPENO="+SysUtility.doPreProcess3(OPENO);
	
	bl=GTDJ_BGSX.doModifyBySql(jbxxSql);
	if(!bl){
		out.print(SysUtility.setAlertScript("基本信息数据更新失败!","parent.window.location.reload();"));
		return;
	}
	//更新人员信息
	if(!sqlRyxx.equals("")){
	    //System.out.println("UPDATE GTDJ_JYZXX_SQ SET "+sqlRyxx+" WHERE OPENO="+GTDJ_BGSX.doPreProcess3(OPENO)+"");
		bl=GTDJ_BGSX.doModifyBySql("UPDATE GTDJ_JYZXX_SQ SET "+sqlRyxx+" WHERE OPENO="+GTDJ_BGSX.doPreProcess3(OPENO)+"");
		if(!bl){
			out.print(SysUtility.setAlertScript("经营者信息数据更新失败!","parent.window.location.reload();"));
		}
	}
	//外网业务申办表中插入一条记录
	QYDJ_YWSB.setOPENO(OPENO);
	if(QYDJ_YWSB.doCount()){		
		bl=QYDJ_YWSB.doSql("UPDATE QYDJ_YWSB_SQ "
		+"SET (ENTNAME,LEREP,REGORG,JQIP,LOCALADM,OPELOCDISTRICT) "
		+"=(SELECT TRANAME,OPERNAME,REGORG,'"
		+ip+"',LOCALADM,OPELOCDISTRICT FROM GTDJ_JBXX_SQ WHERE OPENO='"+OPENO+"') WHERE OPENO='"+OPENO+"'");		
	}else{
		bl=QYDJ_YWSB.doSql("INSERT INTO QYDJ_YWSB_SQ "
		+"(OPENO,PRIPID,OPETYPE,APPDATE,REGNO,UNISCID,ENTNAME,LEREP,REGORG,LOGINID,ENTCLASS,ENTTYPE,STATUS,JQIP,CDDL,LOCALADM,OPELOCDISTRICT) "
		+"SELECT OPENO,PRIPID,OPETYPE,APPDATE,REGNO,UNISCID,TRANAME,OPERNAME,REGORG,LOGINID,'5','9999','0','"
		+ip+"','"+sTYPE+"',LOCALADM,OPELOCDISTRICT FROM GTDJ_JBXX_SQ WHERE OPENO='"+OPENO+"'");
	}
	

	if(IfFirst){
		//该业务出资信息表中还没记录时，往WSDJ_TXJL（填写记录表）中插入一条记录；
		WSDJ_TXJL.setOPENO(OPENO);
		WSDJ_TXJL.setWJBH(1001);
		WSDJ_TXJL.setCZRY(webuser.getLOGINID());
		WSDJ_TXJL.setJQIP(ip);
		WSDJ_TXJL.setCZSJ(webuser.getCurrentDate());
		bl=WSDJ_TXJL.doAdd();
	}
	String[] file;
	Page.clearPage();
	file= new String[]{"gtdj_bgsx.jsp","变更事项","1"};
	Page.addPage(file);
	//if(RyChange){
	//	file= new String[]{"gtdj_jyzxx.jsp","经营者信息","1"};
	//	Page.addPage(file);
	//}
		
	file= new String[]{"qydj_xkxx_list.jsp","许可信息","1"};
	Page.addPage(file);
	
	file= new String[]{"gtdj_sqwt.jsp","授权委托","1"};
	Page.addPage(file);
	file= new String[]{"wsdj_fjxx_list.jsp","附件信息","1"};
	Page.addPage(file);
	if(bl){
		out.print(SysUtility.setAlertScript("保存成功!","parent.window.location.href='../"+Page.getNextPage()[0]+"'"));
	}
	else{
		out.print(SysUtility.setAlertScript("保存失败!","parent.window.location.reload();"));
	}
%>
</body>
</html>