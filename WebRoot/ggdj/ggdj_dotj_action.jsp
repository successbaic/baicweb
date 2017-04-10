<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.macrosoft.icms.system.SysUtility"%>
<%@ page import="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ"%>
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<jsp:useBean id='WSDJ_TXJL' scope='page'
	class='com.macrosoft.icms.util.WSDJ_TXJL' />
<jsp:useBean id="webuser" scope="session"
	class="com.macrosoft.icms.qydj.WEB_USER" />
<%
	boolean bl = false;
	String OPENO = Page.getOPENO();
	if(OPENO == null){
		out.print(SysUtility.setAlertScript("请重新登录！", ""));
		return;
	}
	QYDJ_YWSB_SQ ywsb = new QYDJ_YWSB_SQ();

	String ip = "";
	if (request.getHeader("x-forwarded-for") == null) {
		ip = request.getRemoteAddr();
	} else {
		ip = request.getHeader("x-forwarded-for");
	}
	WSDJ_TXJL.setOPENO(OPENO);
	WSDJ_TXJL.setCZRY(webuser.getLOGINID());
	WSDJ_TXJL.setJQIP(ip);
	bl = WSDJ_TXJL.doAdd();
	if (!bl) {
		out.print(SysUtility.setAlertScript("操作记录保存失败！", ""));
		return;
	}
	// 修改业务表数据为提交状态
	ywsb.setOPENO(OPENO);
	ywsb.doSelect();
	ywsb.setSTATUS("1");
	bl = ywsb.doModify();	
	if (!bl) {
		out.print(SysUtility.setAlertScript("业务申办保存失败！", ""));
		return;
	}
	out.print(SysUtility.setAlertScript("操作成功，请等待工商局人员预审！", "parent.window.location.href='../content.jsp'"));
%>