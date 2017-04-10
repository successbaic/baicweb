<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%
	request.setCharacterEncoding("GBK");
%>
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<jsp:useBean id="ggdjJbxxSq" scope="page"
	class="com.macrosoft.icms.ggdj.GgdjJbxxSq" />
<html>
<head>
<title></title>
</head>
<body>
	<%
		String entName = SysUtility.doPreProcess(request.getParameter("entName")); // 单位名称
		String lerep = SysUtility.doPreProcess(request.getParameter("lerep")); // 法人名称
		ggdjJbxxSq.setEntName(entName);
		ggdjJbxxSq.setLerep(lerep);
		ggdjJbxxSq.loadDataByEntNameAndLerep();//从正式库加载数据
		if (!StringUtils.isEmpty(ggdjJbxxSq.getId())) {
			Page.setSqxxId(ggdjJbxxSq.getId());
			out.print("<script language='javascript'>parent.window.location.href='ggdj_tbxx_bgzx.jsp'</script>");
		} else {
			out.print(SysUtility.setAlertScript("单位名称/法人姓名不存在或不准确，请确认后重新输入！", ""));
			return;
		}
	%>
</body>
</html>