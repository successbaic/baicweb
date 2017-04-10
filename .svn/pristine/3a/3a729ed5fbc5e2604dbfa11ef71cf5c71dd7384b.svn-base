<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="HWGG_BGXX" scope="page" class="com.macrosoft.icms.gggl.HWGG_BGXX_SQ"/>
<jsp:useBean id="QYDJ_YWSB" scope="page" class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"/>	
<%@ page import="com.macrosoft.icms.util.SYS_BHBM" %> 
<%
    String OPENO =Page.getOPENO();
 	String OPETYPE = Page.getOPETYPE(); 
 	String ADREGCNO = Page.getREGNO();
 	if(ADREGCNO.equals("")){
 		ADREGCNO=SysUtility.convertCode(request.getParameter("ADREGCNO"));
 	}
	String[] sALTITEM=request.getParameterValues("ADALTITEM");
	String ip="";
    if(request.getHeader("x-forwarded-for")==null){
  	  ip=request.getRemoteAddr();
    }else{
  	  ip=request.getHeader("x-forwarded-for");
    }
	String sqlJbxx="";
	boolean bl=false;
	boolean IfFirst=false;
	if(OPENO.equals("")|| OPENO==null){//第一次保存，生成新的业务编号MB开头
		OPENO=SYS_BHBM.CREATEBH(2,request.getParameter("REGORG"));
		Page.setOPENO(OPENO);//重新设置业务编号		
		IfFirst=true;
	}
	//删除原来的变更信息
	HWGG_BGXX.setOPENO(OPENO);
	HWGG_BGXX.setADREGCNO(ADREGCNO);
	HWGG_BGXX.doDeleteAll();
	
	//循环遍历填写的变更事项
	for(int i=0;i<sALTITEM.length;i++){
		String ALTITEM=sALTITEM[i];
		String befor="ALTBE_"+ALTITEM;
		String after="ALTAF_"+ALTITEM;
		String ALTAFTER=HWGG_BGXX.convertCode(request.getParameter(after));
		
		//生成更新基本信息、人员信息的sql语句
		if(!ALTAFTER.equals("")){
			String jbmod=HWGG_BGXX.doModifyJbxx(ALTITEM,ALTAFTER); 
			if(!jbmod.equals("")){
				if(sqlJbxx.equals("")){
					sqlJbxx=jbmod;
				}else{
					sqlJbxx+=","+jbmod;
				}
			}
		}		
		//变更事项表数据保存
		HWGG_BGXX.setADREGCNO(ADREGCNO);
		HWGG_BGXX.setOPENO(OPENO);
		HWGG_BGXX.setADALTITEM(ALTITEM);
		HWGG_BGXX.setALTAF(request.getParameter(after));
		HWGG_BGXX.setALTBE(request.getParameter(befor));
		HWGG_BGXX.setALTDATE(webuser.getCurrentDate());
		bl=HWGG_BGXX.doAdd();
		if(!bl){
			out.print(SysUtility.setAlertScript("变更信息添加失败!","parent.window.location.reload();"));
			return;
		}	
	}
	//先不导广告发布者和广告主信息
	bl=HWGG_BGXX.doModifyBySql("delete from HWGG_JBXX_SQ where openo='"+OPENO+"'");	
	bl=HWGG_BGXX.doModifyBySql("insert into HWGG_JBXX_SQ(OPENO,ADNAME,ADQUAN,ADSPF,ADISSFROM,ADISSTO,ADFORM,ADREGCNO,REGORG,OPETYPE,LOGINID,APPDATE) select '"
	+OPENO+"',HD04035,HD04025,HD04011,to_date(HD04014,'yyyy-MM-dd'),to_date(HD04034,'yyyy-MM-dd'),HD04027,HD04023,HD04002,'30','"+webuser.getLOGINID()+"',sysdate from HD0403@gs_link where HD04001='"
	+Page.getPRIPID()+"'");
	if(!bl){
		out.print(SysUtility.setAlertScript("正式库更新数据失败!","parent.window.location.reload();"));
		return;
	}
		
	String jbxxSql="UPDATE HWGG_JBXX_SQ SET OPETYPE='"+OPETYPE+"',STATUS='0',LOGINID='"+webuser.getLOGINID();
	if(sqlJbxx.equals("")){
		jbxxSql+="' WHERE OPENO="+HWGG_BGXX.doPreProcess3(OPENO);
	}else{
		jbxxSql+="',"+sqlJbxx+" WHERE OPENO="+HWGG_BGXX.doPreProcess3(OPENO);
	}	
	bl=HWGG_BGXX.doModifyBySql(jbxxSql);
	if(!bl){
		out.print(SysUtility.setAlertScript("基本信息数据更新失败!","parent.window.location.reload();"));
		return;
	}
	QYDJ_YWSB.setOPENO(OPENO);
	QYDJ_YWSB.setSTATUS("0");
	QYDJ_YWSB.setJQIP(ip);
	if(QYDJ_YWSB.doCount()){
		if(QYDJ_YWSB.doPreProcess(request.getParameter("STATUS")).equals("3")){
			 String sqlstr="insert into qydj_ywsb_sq_ls select t.*,sysdate as  rbsj from qydj_ywsb_sq t where openo='"+OPENO+"'";
		    if(!QYDJ_YWSB.doSql(sqlstr)){
		       out.print(SysUtility.setAlertScript("历史表添加数据失败!","parent.window.location.reload();"));
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
		+"SELECT OPENO,'"+QYDJ_YWSB.doPreProcess(request.getParameter("PRIPID"))+"',OPETYPE,APPDATE,'',ADNAME,'',REGORG,'HWGG','H',LOGINID,'0','"
		+ip+"','5','','' FROM hwgg_jbxx_sq WHERE OPENO='"+OPENO+"'");
	}	
	if(bl){
		out.print(SysUtility.setAlertScript("数据保存成功!","parent.window.location.href='../"+Page.getNextPage()[0]+"'"));
		Page.setMusted(0);	//该页已保存，可以进入下一页
	}
	else{
		out.print(SysUtility.setAlertScript("业务申报数据保存失败!",""));
	}
%>