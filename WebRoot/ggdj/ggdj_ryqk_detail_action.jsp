<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%
request.setCharacterEncoding("GBK");
%>
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<jsp:useBean id="ggdjRyqk" scope="page"
	class="com.macrosoft.icms.ggdj.GgdjRyqk">
	<jsp:setProperty name="ggdjRyqk" property="*" />
</jsp:useBean>
<%
	boolean retSave; // 保存结果
	try {
		if (ggdjRyqk.doCount()) {
			if (ggdjRyqk.doUpdate()) {
				retSave = true;
			} else {
				retSave = false;
			}
		} else {
			if (ggdjRyqk.doInsert()) {
				retSave = true;
			} else {
				retSave = false;
			}
		}
	} catch (Exception e) {
		retSave = false;
	}

	// 根据不通保存结果进行操作
	if (retSave) {
		out.print(SysUtility.setAlertScript("数据保存成功!", "parent.window.location.reload();"));
		Page.setMusted(0); //该页已保存，可以进入下一页
	} else {
		out.print(SysUtility.setAlertScript("业务申报数据保存失败!", "window.location = 'ggdj_ryqk_detail.jsp'"));
	}
%>
<html>
<head>
</head>
<body>
</body>
</html>