<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="/jspheader.inc"%>
<jsp:useBean id="UPLOAD_FILE" scope="page"
	class="com.macrosoft.icms.util.UPLOAD_FILE" />
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<html>
<head>
<title>�ϴ��ļ���Ϣ</title>
</head>
<body>
	<%@include file="/top.inc"%>
	<%
		String OPENO = Page.getOPENO();
		String SIGN = Page.getSIGN();
		String OPETYPE = Page.getOPETYPE();
		String pageheader = Page.pageheader(request.getRequestURI());
		out.println(pageheader);
	%>
	<br>
	<form name="form1">
		<table align="center" width="770px" cellpadding="0" cellspacing="0"
			id="wjlbTab">
			<tr>
				<td
					style="font-size: 14px; padding-left: 2px; color: blue; font-weight: bold; line-height: 25px; text-align: left;">
				</td>
			</tr>
		</table>

		<table align="center" border="1" width="100%" cellpadding="0"
			cellspacing="0" id="table1">
			<tr class="yxsm">
				<td align="center" width="10%">���</td>
				<td align="center" width="35%">��������</td>
				<td align="center" width="40%">˵��</td>
				<td align="center" width="15%">����</td>
			</tr>
			<tr>
				<td align="center">1</td>
				<td align="left">�����ķ����ʸ�֤���ļ�</td>
				<td align=""left"">ԭ����ӡ��</td>
				<td align="center">1</td>
			<tr>
			<tr>
				<td align="center">2</td>
				<td align="left">������ý����׼�ļ�</td>
				<td align=""left"">ԭ����ӡ��</td>
				<td align="center">1</td>
			<tr>
			<tr>
				<td align="center">3</td>
				<td align="left">�����ĳ���ʹ��֤���ļ�</td>
				<td align=""left"">��Ӫ������Ȩ֤�������޺�ͬ��ԭ����ӡ����</td>
				<td align="center">1</td>
			<tr>
			<tr>
				<td align="center">4</td>
				<td align="left">��������ٹ�淢��ý��ı��</td>
				<td align=""left"">ֻ����д�ϱ������ύ����</td>
				<td align="center">1</td>
			<tr>
		</table>
		<br>
		<CENTER>
			<div class="subImgs" onclick="window.location.href='ggdj_dotj.jsp'">��һ��</div>
		</CENTER>
	</form>
	<%@include file="/bottom.inc"%>
</body>
</html>
