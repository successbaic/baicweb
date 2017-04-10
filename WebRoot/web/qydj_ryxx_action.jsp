<%@ include file="../jspheader.inc"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.gsnw.GSYJXX" %> 
<%@ page import="com.macrosoft.icms.qydj.QYDJ_RYXX_SQ" %> 
<jsp:useBean id="QYDJ_RYXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_RYXX_SQ">
	<jsp:setProperty name="QYDJ_RYXX" property="*"/>
</jsp:useBean>
<jsp:useBean id="QYDJ_JBXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_JBXX_SQ"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<body>
<%	
	String action = QYDJ_RYXX.doPreProcess(request.getParameter("action"));
	String RECID = QYDJ_RYXX.doPreProcess(request.getParameter("RECID"));
	String OPENO = QYDJ_RYXX.doPreProcess(request.getParameter("OPENO"));
	String LEREPSIGN=QYDJ_RYXX.doPreProcess(request.getParameter("LEREPSIGN"));
	
	String CERNO = QYDJ_RYXX.doPreProcess(request.getParameter("CERNO"));
	String CERTYPE = QYDJ_RYXX.doPreProcess(request.getParameter("CERTYPE"));
	String INAME = "";
 	if(!"".equals(request.getParameter("NAME")) && request.getParameter("NAME") != null) {
		INAME = new String(request.getParameter("NAME").getBytes("ISO8859-1"),"GBK");
	}
	//List list_tzrs = QYDJ_RYXX.getList(" WHERE openo = '"+OPENO+"'");
	//for(int i = 0 ; i < list_tzrs.size(); i++){
	//	QYDJ_RYXX_SQ bean = (QYDJ_RYXX_SQ)list_tzrs.get(i);
	//	if(QYDJ_RYXX.getCERTYPE().equals(bean.getCERTYPE())
	//			&&QYDJ_RYXX.getCERNO().equals(bean.getCERNO())){
	///			if(!QYDJ_RYXX.getRECID().equals(bean.getRECID())){
	//				out.print(SysUtility.setAlertScript("同一个人员只能担任一种职务，请核查后再申请!","window.history.back(0);"));
	//				return;
	//			}
	//	}
	//}
	
//	if(Page.getOPETYPE().equals("20") || Page.getOPETYPE().equals("30")){
		if(!action.equals("")){
			GSYJXX yjxx=new GSYJXX();
			if(yjxx.checkRyHmd(CERNO,CERTYPE)){
				out.print(SysUtility.setAlertScript("提示:当前人员的在黑名单库中!","parent.window.location.reload();"));
				return;
			}
			if(Page.getENTTYPE().equals("GS")||Page.getENTTYPE().equals("WZGS")||Page.getENTTYPE().equals("NZFR")||Page.getENTTYPE().equals("HZS")){
				if(yjxx.checkLaolai(INAME, CERNO)){
					out.print(SysUtility.setAlertScript("提示:当前人员在失信被执行人名单中!","parent.window.location.reload();"));
					return;
				}
			}
		}
//	}		
	if(action.equals("1"))//添加
	{  
		//int max =QYDJ_RYXX.getListMax(" where OPENO='"+OPENO+"'");
	    QYDJ_RYXX.setOPENO(OPENO);
		QYDJ_RYXX.setRECID(SysUtility.getUUID20());
		if (QYDJ_RYXX.doAdd())
		out.print(SysUtility.setAlertScript("数据保存成功!","parent.window.location.reload();"));
	    
		else
		out.print(SysUtility.setAlertScript("数据保存失败!","parent.window.location.reload();"));
	}
	else if(action.equals("2"))//修改
	{				
		if (QYDJ_RYXX.doModify())
		out.print(SysUtility.setAlertScript("数据修改成功!","parent.window.location.reload();"));
   		else
		out.print(SysUtility.setAlertScript("数据保存失败!","parent.window.location.reload();"));
		
		if(LEREPSIGN.equals("1")){
			String NAME = QYDJ_RYXX.doPreProcess(request.getParameter("NAME"));
			QYDJ_JBXX.setOPENO(OPENO);
			QYDJ_JBXX.setLEREP(NAME);
			QYDJ_JBXX.setPOSITION(QYDJ_RYXX.doPreProcess(request.getParameter("POSITION")));
			QYDJ_JBXX.doModifyLerep();
		}
	}
	else if(action.equals("3"))//删除
	{
		if (QYDJ_RYXX.doDelete()){
		out.print(SysUtility.setAlertScript("数据删除成功!","parent.window.location.reload();"));
   		}else{
		out.print(SysUtility.setAlertScript("数据保存失败!","parent.window.location.reload();"));
	    }
	}
%>