<%@ page contentType="text/html;charset=GBK"%> 
<%@ include file="../jspheader.inc"%>
<jsp:useBean id="QYDJ_JBXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_JBXX_SQ"/>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage"/>
<jsp:useBean id="QYDJ_CZXX" scope="page" class="com.macrosoft.icms.qydj.QYDJ_CZXX_SQ">
	<jsp:setProperty name="QYDJ_CZXX" property="*"/>
</jsp:useBean>

<body>
<%	
	String OPENO = QYDJ_CZXX.doPreProcess(request.getParameter("OPENO"));
	String OPETYPE = Page.getOPETYPE();
	QYDJ_CZXX.setOPENO(OPENO);
	boolean bl = false;
	if(QYDJ_CZXX.doCountByOpeno()){
		bl=QYDJ_CZXX.doModifyByOpeno();
	}else{
		QYDJ_CZXX.setRECID(SysUtility.getUUID20());
		bl=QYDJ_CZXX.doAdd();
	}
	if(bl){
		if(OPETYPE.equals("20")){
			String DEPINCHA = QYDJ_CZXX.doPreProcess(request.getParameter("INV"));
			QYDJ_JBXX.setOPENO(OPENO);
			QYDJ_JBXX.doSelect();
			QYDJ_JBXX.setDEPINCHA(DEPINCHA);
			if(QYDJ_JBXX.doModify()){
				out.print(SysUtility.setAlertScript("数据保存成功!","parent.window.location.href='../"+request.getParameter("nextPage")+"';"));
			}else{
				out.print(SysUtility.setAlertScript("数据保存失败!",""));
			}
		}else{
			out.print(SysUtility.setAlertScript("数据保存成功!","parent.window.location.href='../"+request.getParameter("nextPage")+"';"));
		}
			
	}else{
		out.print(SysUtility.setAlertScript("数据保存失败!",""));
	}	
		
%>