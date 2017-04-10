<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%
	request.setCharacterEncoding("GBK");
%>
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<%	
	boolean retSave = true; // 保存结果
	// 根据不通保存结果进行操作
	if (retSave) {
		out.print("<script language='javascript'>alert('数据保存成功');parent.window.location.href='" + Page.getNextPage()[0]
				+ "'</script>");
		Page.setMusted(0); //该页已保存，可以进入下一页
	} else {
		out.print(SysUtility.setAlertScript("业务申报数据保存失败!", "parent.window.location.href = 'ggdj_ryqk.jsp'"));
	}
%>
<html>
<head>
</head>
<body>
</body>
</html>