<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<jsp:useBean id="ggdjRyqk" scope="page"
	class="com.macrosoft.icms.ggdj.GgdjRyqk" />
<html>
<head>
<title>����ҵ��Ա����������Ա���</title>
<%
	// ��������1��������2���޸ģ�3��ɾ����4���鿴
	String action = SysUtility.doPreProcess(request.getParameter("action"));
	// id
	String id = SysUtility.doPreProcess(request.getParameter("id"));
	// ����id
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
		// ���ݲ�ͨ���������в���
		if (ret) {
			out.print(SysUtility.setAlertScript("����ɾ���ɹ�!", "parent.window.location.reload();"));
			Page.setMusted(0); //��ҳ�ѱ��棬���Խ�����һҳ
		} else {
			out.print(SysUtility.setAlertScript("����ɾ��ʧ��!", "parent.window.location.reload();"));
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
		<!-- �������� -->
		<input type="hidden" name="id" value='<%=id%>'> <input
			type="hidden" name="sqxxid" value='<%=maTbId%>'>
		<table border="1" width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td class="lc1" nowrap="nowrap">����</td>
				<td class="lc2" colspan=""><input id="name" type="text" name="name"
					size="40" maxlength="25" disblank title='����'
					value='<%=SysUtility.doPreProcess(ggdjRyqk.getName())%>'>&nbsp;<font
					color=red>*</font></td>
				<td class="lc1" nowrap="nowrap">��Ա����</td>
				<td class="lc2" colspan=""><input id="personType" type="text" name="personType"
					size="20" maxlength="25" disblank title='��Ա����'
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
						type="button" onclick = "doSub1()" value="��  ��"></td>
				</tr>
			</tbody>
		</table>
		<%
			}
		%>

	</form>
</body>
</html>
