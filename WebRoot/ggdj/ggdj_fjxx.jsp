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

		<!-- 		<div style="position: relative;">
			<div id="editDiv"
				style="position: absolute; width: 100%; height: 200px; top: 0px; left: 0px; display: none; border-style: solid; border-width: 1pt; border-color: blue">
				<table width="100%">
					<tr class="yxsm">
						<td align="left" style="font-size: 14px; font-weight: bold;">附件信息添加</td>
						<td align="right"><span
							onclick="document.getElementById('editDiv').style.display='none'"
							style="cursor: pointer; font-size: 14px; font-weight: bold;">
								关闭 &nbsp; </span></td>
					</tr>
				</table>
				<IFRAME height="300" width="770px" name="editframe" src=""
					id="editframe" scrolling="no" border="0" align='center'
					frameborder="0"> </IFRAME>
			</div>
		</div> -->

		<table align="center" width="770px" cellpadding="0" cellspacing="0"
			id="wjlbTab">
			<tr>
				<td
					style="font-size: 14px; padding-left: 2px; color: blue; font-weight: bold; line-height: 25px; text-align: left;">
				</td>
				<%-- 				<td align="center" width="120px">
					<%
						if (!SIGN.equals("1")) {
					%> &nbsp; <a href='#'
					onclick="framejumpTo('hwgg_fjxx_do.jsp','action=1&OPENO=<%=OPENO%>&LEREPSIGN=2');">
						<img border=0 src='../images/icon/icon_list_add.gif' alt='增加'>
						<font style="font-size: 14px;">增加</font>
				</a> <%
 	}
 %>
				</td> --%>
			</tr>
		</table>

		<table align="center" border="1" width="100%" cellpadding="0"
			cellspacing="0" id="table1">
			<tr class="yxsm">
				<td align="center" width="10%">序号</td>
				<td align="center" width="35%">材料名称</td>
				<td align="center" width="45%">说明</td>
				<td align="center" width="10">份数</td>
			</tr>
			<%
				if ("20".equals(OPETYPE)) {
			%>
			<tr>
				<td align="center">1</td>
				<td align="left">法人资格证明文件</td>
				<td align=""left"">原件复印件</td>
				<td align="center">1</td>
			</tr>
			<tr>
				<td align="center">2</td>
				<td align="left">媒介批准文件</td>
				<td align=""left"">原件复印件（媒介批准单位中的出版单位不具备法人资格的，应由其具有法人资格的主办单位提出申请。）</td>
				<td align="center">1</td>
			</tr>
			<tr>
				<td align="center">3</td>
				<td align="left">广告业务证明文件及其负责人任命文件</td>
				<td align=""left"">已有证正式文件的提供原件复印件；无正式文件的提供关于广告业务机构及其负责人的情况说明，由申请单位盖章确认（原件）。</td>
				<td align="center">1</td>
			</tr>
			<tr>
				<td align="center">4</td>
				<td align="left">广告从业人员和广告审查人员证明文件</td>
				<td align=""left"">单位出具的广告从业人员和广告审查人员证明文件（原件复印件）</td>
				<td align="center">1</td>
			</tr>
			<tr>
				<td align="center">5</td>
				<td align="left">场地使用证明文件</td>
				<td align=""left"">经营产所产权证明或租赁合同（原件复印件）</td>
				<td align="center">1</td>
			</tr>
				<%
					} else if ("30".equals(OPETYPE)) {
				%>
			
			<tr>
				<td align="center">1</td>
				<td align="left">变更后的法人资格证明文件</td>
				<td align=""left"">原件复印件</td>
				<td align="center">1</td>
			</tr>
			<tr>
				<td align="center">2</td>
				<td align="left">变更后的媒介批准文件</td>
				<td align=""left"">原件复印件</td>
				<td align="center">1</td>
			</tr>
			<tr>
				<td align="center">3</td>
				<td align="left">变更的场所使用证明文件</td>
				<td align=""left"">经营场所产权证或租赁合同（原件复印件）</td>
				<td align="center">1</td>
			</tr>
			<tr>
				<td align="center">4</td>
				<td align="left">仅办理减少广告发布媒介的变更</td>
				<td align=""left"">只需填写上表，无需提交材料</td>
				<td align="center">1</td>
			</tr>
			<%
				}
			%>


		</table>
		<br>
		<CENTER>
			<div class="subImgs" onclick="window.location.href='ggdj_dotj.jsp'">下一步</div>
		</CENTER>
	</form>
	<%@include file="/bottom.inc"%>
</body>
</html>
