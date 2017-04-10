<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<%
	request.setCharacterEncoding("GBK");
%>
<jsp:useBean id="ggdjJbxxSq" scope="page"
	class="com.macrosoft.icms.ggdj.GgdjJbxxSq">
	<jsp:setProperty name="ggdjJbxxSq" property="*" />
</jsp:useBean>
<jsp:useBean id="QYDJ_YWSB" scope="page"
	class="com.macrosoft.icms.qydj.QYDJ_YWSB_SQ" />
<jsp:useBean id="ggdjMjmc" scope="page"
	class="com.macrosoft.icms.ggdj.GgdjMjmc" />
<%
	// 媒介材料信息
	try {
		String[] mediaName = request.getParameterValues("MJMC");
		ggdjMjmc.setSqxxId(Page.getOPENO());
		if (mediaName != null) {
			ggdjMjmc.setMediaNameList(Arrays.asList(mediaName));
		}
		webuser.validatePage(request.getRequestURI());//检查用户是否有权限访问该页面
	} catch (Exception e) {
		out.print(SysUtility.setAlertScript("数据保存异常!", ""));
		return;
	}
	boolean retSave; // 保存结果
	// 保存数据
	try {
		// 登记机关
		ggdjJbxxSq.setAccOrg(icms.getCURRENTUNIT());
		// 保存基本信息
		if (ggdjJbxxSq.doCount()) {
			//修改
			retSave = ggdjJbxxSq.doUpdate();
		} else {
			// 插入
			retSave = ggdjJbxxSq.doInsert();
		}
		// 保存媒介名称
		ggdjMjmc.doDeleteBySqxxId();
		ggdjMjmc.doInsert();
	} catch (Exception e) {
		retSave = false;
	}

	// 根据不通保存结果进行操作
	if (retSave) {
		// 保存业务信息
		QYDJ_YWSB.setOPENO(ggdjJbxxSq.getId());
		QYDJ_YWSB.doSelect();
		QYDJ_YWSB.setENTNAME(ggdjJbxxSq.getEntName());
		QYDJ_YWSB.setLEREP(ggdjJbxxSq.getLerep());
		QYDJ_YWSB.setENTTYPE(ggdjJbxxSq.getEntType());
		QYDJ_YWSB.setCDDL("9"); // 业务类型
		QYDJ_YWSB.setOPETYPE("20"); //
		QYDJ_YWSB.setLOGINID(webuser.getLOGINID());
		if(StringUtils.isEmpty(QYDJ_YWSB.getSTATUS())) {
			QYDJ_YWSB.setSTATUS("0");
		}
		QYDJ_YWSB.setREGORG(icms.getCURRENTUNIT());
		try {
			if (QYDJ_YWSB.doCount()) {
				QYDJ_YWSB.doModify();
			} else {
				QYDJ_YWSB.setAPPDATE(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
				QYDJ_YWSB.doAdd();
			}
		} catch (Exception e) {
			retSave = false;
		}
	}	
	// 返回结果提示
	if (retSave) {
		out.print(SysUtility.setAlertScript("数据保存成功!",
				"parent.window.location.href='" + Page.getNextPage()[0] + "'"));
		Page.setMusted(0); //该页已保存，可以进入下一页
	} else {
		out.print(SysUtility.setAlertScript("业务申报数据保存失败!", ""));
		return;
	}
%>
<html>
<head>
</head>
<body>
</body>
</html>