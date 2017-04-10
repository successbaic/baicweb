<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="/jspheader.inc"%>
<jsp:useBean id="UPLOAD_FILE" scope="page"
	class="com.macrosoft.icms.util.UPLOAD_FILE" />
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<html>
<head>
<title>上传文件信息</title>
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
				<td align="center" width="10%">序号</td>
				<td align="center" width="35%">材料名称</td>
				<td align="center" width="40%">说明</td>
				<td align="center" width="15%">份数</td>
			</tr>
			<tr>
				<td align="center">1</td>
				<td align="left">变更后的法人资格证明文件</td>
				<td align=""left"">原件复印件</td>
				<td align="center">1</td>
			<tr>
			<tr>
				<td align="center">2</td>
				<td align="left">变更后的媒介批准文件</td>
				<td align=""left"">原件复印件</td>
				<td align="center">1</td>
			<tr>
			<tr>
				<td align="center">3</td>
				<td align="left">变更后的场所使用证明文件</td>
				<td align=""left"">经营场所产权证明或租赁合同（原件复印件）</td>
				<td align="center">1</td>
			<tr>
			<tr>
				<td align="center">4</td>
				<td align="left">仅办理减少广告发布媒介的变更</td>
				<td align=""left"">只需填写上表，无需提交材料</td>
				<td align="center">1</td>
			<tr>
		</table>
		<br>
		<CENTER>
			<div class="subImgs" onclick="window.location.href='ggdj_dotj.jsp'">下一步</div>
		</CENTER>
	</form>
	<%@include file="/bottom.inc"%>
</body>
</html>
