<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<jsp:useBean id="ggdjRyqk" scope="page"
	class="com.macrosoft.icms.ggdj.GgdjRyqk" />
<html>
<head>
<title>广告从业人员、广告审查人员情况</title>
<%
	// 操作类型1、新增，2、修改，3、删除，4、查看
	String action = SysUtility.doPreProcess(request.getParameter("action"));
	// id
	String id = SysUtility.doPreProcess(request.getParameter("id"));
	// 主表id
	String maTbId = SysUtility.doPreProcess(request.getParameter("maTbId"));

	if ("1".equals(action)) {
		ggdjRyqk.setSqxxid(maTbId);
		id = UUID.randomUUID().toString().trim().replaceAll("-", "");
		ggdjRyqk.setId(id);
	} else if ("2".equals(action) || "4".equals(action)) {
		ggdjRyqk.setId(id);
		ggdjRyqk.loadData();
	} else if ("3".equals(action)) {
		ggdjRyqk.setId(id);
		boolean ret;
		try {
			if (ggdjRyqk.doDelete()) {
				ret = true;
			} else {
				ret = false;
			}
		} catch (Exception e) {
			ret = false;
		}
		// 根据不通保存结果进行操作
		if (ret) {
			out.print(SysUtility.setAlertScript("数据删除成功!", "parent.window.location.reload();"));
			Page.setMusted(0); //该页已保存，可以进入下一页
		} else {
			out.print(SysUtility.setAlertScript("数据删除失败!", "parent.window.location.reload();"));
		}
	}
%>
<script type="text/javascript">
var sign = '<%=Page.getSIGN()%>';
</script>
<script type="text/javascript" src="js/ggdj_ryqk_detail.js"></script>
</head>
<body>
	<form id="form1" action="ggdj_ryqk_detail_action.jsp" method="post">
		<!-- 隐藏数据 -->
		<input type="hidden" name="id" value='<%=id%>'> <input
			type="hidden" name="sqxxid" value='<%=maTbId%>'>
		<table border="1" width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td class="lc1" nowrap="nowrap">姓名</td>
				<td class="lc2" colspan=""><input id="name" type="text" name="name"
					size="40" maxlength="25" disblank title='姓名'
					value='<%=SysUtility.doPreProcess(ggdjRyqk.getName())%>'>&nbsp;<font
					color=red>*</font></td>
				<td class="lc1" nowrap="nowrap">人员类型</td>
				<td class="lc2" colspan=""><input id="personType" type="text" name="personType"
					size="20" maxlength="25" disblank title='人员类型'
					value='<%=SysUtility.doPreProcess(ggdjRyqk.getPersonType())%>'>&nbsp;<font
					color=red>*</font></td>
			</tr>

		</table>
		<%
			if ("0".equals(Page.getSIGN())) {
		%>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tbody>
				<tr>
					<td align="center"><input name="btSave" class="butontType"
						type="button" onclick = "doSub1()" value="保  存"></td>
				</tr>
			</tbody>
		</table>
		<%
			}
		%>

	</form>
</body>
</html>
