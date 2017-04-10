<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="../jspheader.inc"%>
<%@ page import="com.macrosoft.icms.gsnw.GSYJXX" %> 
<%@ page import="com.macrosoft.icms.mcgl.MCGL_JBXX_SQ" %> 
<%@ page import="com.macrosoft.icms.gsnw.QYDJ_JBXX_ZS" %> 
<%@ page import="com.macrosoft.icms.mcgl.MCGL_TZRXX_SQ" %> 
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="MCGL_TZRXX" scope="page" class="com.macrosoft.icms.mcgl.MCGL_TZRXX_SQ">
	<jsp:setProperty name="MCGL_TZRXX" property="*"/>
</jsp:useBean>
<%
	String OPENO=MCGL_TZRXX.doPreProcess(Page.getOPENO());
	String RECID=MCGL_TZRXX.doPreProcess(request.getParameter("RECID"));
	
   String CERNO = MCGL_TZRXX.doPreProcess(request.getParameter("CERNO"));
   String CERTYPE = MCGL_TZRXX.doPreProcess(request.getParameter("CERTYPE"));
   
   String action=MCGL_TZRXX.doPreProcess(request.getParameter("action"));
   if(!action.equals("3")){
	   
	   MCGL_JBXX_SQ mcgl = new MCGL_JBXX_SQ();
	   mcgl.setOPENO(OPENO);
	   mcgl.doSelect();
	   if(mcgl.getENTTYPE().equals("1151")||mcgl.getENTTYPE().equals("4540")){
	//		if(mcgl.getENTTYPE().equals("1150") 
	//				|| mcgl.getENTTYPE().equals("1151")
	//				|| mcgl.getENTTYPE().equals("1152")){
			GSYJXX yjxx=new GSYJXX();
			if(yjxx.checkYrByRy(MCGL_TZRXX.getCERNO())){
	//			return "当前人员的身份证号码在一人有限公司库中!";						
				out.print(SysUtility.setAlertScript("姓名："+MCGL_TZRXX.getINV()+" 证件号码："+MCGL_TZRXX.getCERNO()+" 在一人有限公司库中，请核实后再申请!","window.history.back(0);"));
				return;
			}
		}else{
			if(MCGL_TZRXX.getINVTYPE().startsWith("1")){
				QYDJ_JBXX_ZS qydj_jbxx = new QYDJ_JBXX_ZS();
				List list = qydj_jbxx.getList(" WHERE regno = '"+MCGL_TZRXX.getBLICNO()+"' AND entstatus IN ('2','3')");
				if(list.size()>0){
					out.print(SysUtility.setAlertScript("当前企业在企业黑名单库中，请核实后再申请!","window.history.back(0);"));
					return;
				}
			}
			List list_tzrs = MCGL_TZRXX.getList(" WHERE openo = '"+OPENO+"'");
			for(int i = 0 ; i < list_tzrs.size(); i++){
				MCGL_TZRXX_SQ bean = (MCGL_TZRXX_SQ)list_tzrs.get(i);
				if(!MCGL_TZRXX.getCERTYPE().equals("")){
					if(MCGL_TZRXX.getCERTYPE().equals(bean.getCERTYPE())
							&&MCGL_TZRXX.getCERNO().equals(bean.getCERNO())){
						if(!MCGL_TZRXX.getRECID().equals(bean.getRECID())){
							out.print(SysUtility.setAlertScript("该投资人已投资，一个投资人只能存在一条记录!","window.history.back(0);"));
							return;	
						}
					}
				}else{
					if(MCGL_TZRXX.getBLICTYPE().equals(bean.getBLICTYPE())
							&&MCGL_TZRXX.getBLICNO().equals(bean.getBLICNO())){
						if(!MCGL_TZRXX.getRECID().equals(bean.getRECID())){
							out.print(SysUtility.setAlertScript("该投资人已投资，一个投资人只能存在一条记录!","window.history.back(0);"));
							return;	
						}
					}
				}
			}
			
		}
   }
	if(RECID.equals("")){
		RECID=SysUtility.getUUID20();
	}
	boolean bl=false;
	MCGL_TZRXX.setOPENO(OPENO);
	MCGL_TZRXX.setRECID(RECID);
	if(action.equals("1")){		
		bl=MCGL_TZRXX.doAdd();
	}else if(action.equals("2")){
		bl=MCGL_TZRXX.doModify();
	}else if(action.equals("3")){
		bl=MCGL_TZRXX.doDelete();
	}
	
	if(!bl){
		out.print(SysUtility.setAlertScript("操作失败!","parent.window.location.reload();"));
	}else{
		out.print(SysUtility.setAlertScript("操作成功!","parent.window.location.reload();"));		
	}
%>	