<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="Page" scope="session"  class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="DCDY_BGXX" scope="page" class="com.macrosoft.icms.htgl.DCDY_BGXX_SQ"/>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>
<%@ page import="com.macrosoft.icms.util.SYS_BHBM" %> 
<body>
<%				System.out.println("----------");
    String OPENO =Page.getOPENO();
 	String OPETYPE = Page.getOPETYPE(); 
 	OPETYPE="30";
 	String MORCONTNO = Page.getREGNO();
	String[] sALTITEM=request.getParameterValues("ALTCONITEM");
	if(sALTITEM==null){
		out.print(SysUtility.setAlertScript("请选择并填写变更信息！","parent.window.location.reload();"));
	    return;
	}
	String ip="";
    if(request.getHeader("x-forwarded-for")==null){
  	  ip=request.getRemoteAddr();
    }else{
  	  ip=request.getHeader("x-forwarded-for");
    }
	String sqlJbxx="";
	boolean bl=false;
	boolean DywChange=false;
	boolean IfFirst=false;
	if(OPENO.equals("")|| OPENO==null){//第一次保存，生成新的业务编号MB开头
		OPENO=SYS_BHBM.CREATEBH(2,request.getParameter("REGORG"));
		Page.setOPENO(OPENO);//重新设置业务编号		
		IfFirst=true;
	}
	//删除原来的变更信息
	DCDY_BGXX.setOPENO(OPENO);
	DCDY_BGXX.doDeleteAll();
	System.out.println("----------");
	//循环遍历填写的变更事项
	for(int i=0;i<sALTITEM.length;i++){
		String ALTITEM=sALTITEM[i];
		String befor="ALTBE"+ALTITEM;
		String after="ALTAF"+ALTITEM;
		String ALTAFTER=DCDY_BGXX.convertCode(request.getParameter(after));
		
		//生成更新基本信息、人员信息的sql语句
		if(!ALTAFTER.equals("")){
			String jbmod=DCDY_BGXX.doModifyJbxx(ALTITEM,ALTAFTER);
			if(!jbmod.equals("")){
				if(sqlJbxx.equals("")){
					sqlJbxx=jbmod;
				}else{
					sqlJbxx+=","+jbmod;
				}
			}
		}
		int newRecId=DCDY_BGXX.getListMax(" WHERE OPENO='"+OPENO+"'");
		
		//变更事项表数据保存
		DCDY_BGXX.setOPENO(OPENO);
		DCDY_BGXX.setMORCONTNO(MORCONTNO);
		DCDY_BGXX.setRECID(newRecId+1);
		DCDY_BGXX.setALTCONITEM(ALTITEM);
		DCDY_BGXX.setALTAF(request.getParameter(after));
		DCDY_BGXX.setALTBE(request.getParameter(befor));
		DCDY_BGXX.setALTDATA(webuser.getCurrentDate());
		bl=DCDY_BGXX.doAdd();
		if(!bl){
			out.print(SysUtility.setAlertScript("变更信息添加失败!","parent.window.location.reload();"));
		}	
		if(!DywChange){
			DCDY_BGXX.setDywChange(ALTITEM);
			DywChange=DCDY_BGXX.getDywChange();
		}
	}
	//从内网导入企业的相关信息--第一次全部导入，以后根据变更事项导入
	//bl=DCDY_BGXX.doModifyBySql("delete from DCDY_JBXX_SQ where openo='"+OPENO+"'");	
	/* bl=DCDY_BGXX.doModifyBySql("insert into DCDY_JBXX_SQ(OPENO,MORCONTNO,PRICLASECKIND,PRICLASECAM,PEFPERFROM,PEFPERTO,MORTGAGORTYPE,MORE,MORTGAGOADDRESS,MOREAGENT,MORECERTYPE,MOREPERNO,MORTGAGO,MORTGAGOAGENT,MORTGAGOCERTYPE,MORTGAGORPERNO,REGORG,REGDATE,MORREGCNO,OPETYPE,LOGINID,APPDATE) select '"
	+OPENO+"',AF04023,HF04067,HF04069,to_date(HF04059,'yyyy-MM-dd'),to_date(HF04061,'yyyy-MM-dd'),HF04100,AF04011,HF04097,HF04099,HF04098,HF04063,AF04017,HF04096,HF04095,HF04071,AF04035,to_date(AF04008,'yyyy-MM-dd'),AF04005,'30','"+webuser.getLOGINID()+"',sysdate from sgs.AF0401 where AF04005='"+Page.getREGNO()+"' AND AF04011='"+Page.getXGBH()+"' AND AF04017='"+Page.getENTNAME()+"'");

	if(!bl){
		out.print(SysUtility.setAlertScript("正式库更新数据失败!","parent.window.location.reload();"));
		return;
	} */
	
	String jbxxSql="UPDATE DCDY_JBXX_SQ SET OPETYPE='"+OPETYPE+"',STATUS='0',LOGINID='"+webuser.getLOGINID();
	if(sqlJbxx.equals("")){
		jbxxSql+="' WHERE OPENO="+DCDY_BGXX.doPreProcess3(OPENO);
	}else{
		jbxxSql+="',"+sqlJbxx+" WHERE OPENO="+DCDY_BGXX.doPreProcess3(OPENO);
	}	
	bl=DCDY_BGXX.doModifyBySql(jbxxSql);
	if(!bl){
		out.print(SysUtility.setAlertScript("基本信息数据更新失败!","parent.window.location.reload();"));
		return;
	}
	//外网业务申办表中插入一条记录
	System.out.println(OPENO);
	QYDJ_YWSB.setOPENO(OPENO);
	if(QYDJ_YWSB.doCount()){
		if(QYDJ_YWSB.doPreProcess(request.getParameter("STATUS")).equals("3")){
			 String sqlstr="insert into qydj_ywsb_sq_ls select t.*,sysdate as  rbsj from qydj_ywsb_sq t where openo='"+OPENO+"'";
		    if(!QYDJ_YWSB.doSql(sqlstr)){
		       out.print(SysUtility.setAlertScript("历史表添加数据失败!","parent.window.location.reload();"));
		       return;
		    }		   
		}
		bl=QYDJ_YWSB.doSql("UPDATE QYDJ_YWSB_SQ "
		+"SET (OPETYPE,REGNO,ENTNAME,REGORG,STATUS,JQIP) "
		+"=(SELECT OPETYPE,MORREGCNO,MORTGAGO,REGORG,'0','"
		+ip+"' FROM dcdy_jbxx_sq WHERE OPENO='"+OPENO+"') WHERE OPENO='"+OPENO+"'");
	}else{
		bl=QYDJ_YWSB.doSql("INSERT INTO QYDJ_YWSB_SQ "
		+"(OPENO,PRIPID,OPETYPE,APPDATE,REGNO,ENTNAME,LEREP,REGORG,ENTTYPE,ENTCLASS,LOGINID,STATUS,JQIP,CDDL,LOCALADM,OPELOCDISTRICT) "
		+"SELECT OPENO,'',OPETYPE,APPDATE,REGORUN,MORTGAGO,MORE,REGORG,ENTTYPE,'D',LOGINID,'0','"
		+ip+"','6','','' FROM dcdy_jbxx_sq WHERE OPENO='"+OPENO+"'");
	}
	
	if(bl){
		out.print(SysUtility.setAlertScript("业务申报数据保存成功!","parent.window.location.href='../"+Page.getNextPage()[0]+"'"));
	}
	else{
		out.print(SysUtility.setAlertScript("业务申报数据保存失败!","parent.window.location.reload();"));
	}
%>
</body>


