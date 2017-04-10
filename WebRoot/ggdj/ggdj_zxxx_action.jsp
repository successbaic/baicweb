<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<jsp:useBean id="ggdjZxxx" scope="page"
	class="com.macrosoft.icms.ggdj.GgdjZxxx">
	<jsp:setProperty name="ggdjZxxx" property="*" />
</jsp:useBean>
<jsp:useBean id="QYDJ_YWSB" scope="page"
	class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ" />
<jsp:useBean id="ggdjMjmc" scope="page"
	class="com.macrosoft.icms.ggdj.GgdjMjmc" />	
<%	
	webuser.validatePage(request.getRequestURI());//检查用户是否有权限访问该页面
	String entName = SysUtility.doPreProcess(request.getParameter("entName"));	
	String lerep = SysUtility.doPreProcess(request.getParameter("lerep"));	
	boolean retSave; // 保存结果
	// 保存数据
	try {
		// 登记机关
		ggdjZxxx.setAccOrg(icms.getCURRENTUNIT());
		// 保存基本信息
		if (ggdjZxxx.doCount()) {
			//修改
			retSave = ggdjZxxx.doUpdate();
		} else {
			// 插入
			retSave = ggdjZxxx.doInsert();
		}
		// 保存媒介名称
	} catch (Exception e) {
		retSave = false;
	}

	// 根据不通保存结果进行操作
	if (retSave) {
		// 保存业务信息
		QYDJ_YWSB.setOPENO(ggdjZxxx.getId());
		QYDJ_YWSB.doSelect();
		QYDJ_YWSB.setENTNAME(entName);
		QYDJ_YWSB.setLEREP(lerep);
		QYDJ_YWSB.setCDDL("9");
		QYDJ_YWSB.setOPETYPE("50");
		QYDJ_YWSB.setLOGINID(webuser.getLOGINID());
		if(StringUtils.isEmpty(QYDJ_YWSB.getSTATUS())) {
			QYDJ_YWSB.setSTATUS("0");
		}
		QYDJ_YWSB.setREGORG(icms.getCURRENTUNIT());
		try {
			if (QYDJ_YWSB.doCount()) {
				QYDJ_YWSB.doModify();
			} else {
				QYDJ_YWSB.setAPPDATE(new SimpleDateFormat("yyy-MM-dd").format(new Date()));
				QYDJ_YWSB.doAdd();
			}
		} catch (Exception e) {
			retSave = false;
		}

		out.print(SysUtility.setAlertScript("数据保存成功!",
				"parent.window.location.href='ggdj_dotj.jsp'"));
		Page.setMusted(0); //该页已保存，可以进入下一页
	} else {
		out.print(SysUtility.setAlertScript("业务申报数据保存失败!", "parent.window.location.reload();"));
	}
%>
<html>
<head>
</head>
<body>
</body>
</html>