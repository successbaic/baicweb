<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<%@ page import="org.apache.commons.lang.StringUtils"%>
<html>
<head>
<title>选择办理业务的单位</title>
<script type="text/javascript" src="js/ggdj_select.js">
	
</script>
</head>
<body style="margin: 0px">
	<%@include file="../top.inc"%>
	<%
		if (!StringUtils.isEmpty(Page.getOPENO())) {
			out.print("<script type='text/javascript'> window.location.href='ggdj_tbxx_bgzx.jsp' </script>");
		} else {
			StepShow stepShow = new StepShow();
			out.println(stepShow.getStep("1", Page.getDL() + Page.getOPETYPE(), Page.getOPENO()));
		}
	%>
	<br />
	<table border='1' width='100%' align='center'>
		<tr>
			<td class=lc2 valign='top'><font
				style='font-size: 11pt; color: red; font-weight: bold'>
					&nbsp;&nbsp;业务办理说明： </font> <br /> &nbsp;&nbsp;
				请录入完整的单位名称及法人名称，然后点击“下一步”按钮，进行登记申请。如果所填信息与登记信息不符，系统将不予受理！ <br></td>
		</tr>
	</table>
	<form id="form1" method="POST" action="ggdj_select_action.jsp"
		target="editframe">
		<table border="1" width="100%" cellspacing='0' cellpadding='0'
			align="center">
			<tr>
				<td colspan="2">
					<table id="mc" border="0" width="100%" cellspacing='0'
						cellpadding='0' align="center">
						<tr>
							<td class="yxsm" colspan="2">&nbsp; 待办单位信息</td>
						</tr>
						<tr>
							<td class="lc1" align="center" width="28%">单位名称:</td>
							<td class="lc2"><input type="text" name="entName"
								id="entName" size="30" /></td>
						</tr>
						<tr>
							<td class="lc1">法定代表人姓名:</td>
							<td class="lc2"><input type="text" name="lerep" id=""
								lerep""
								size="30" /></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
	<br />
	<CENTER>
		<div id="waitdiv" style="display: none">
			<img src="images/blue-loading.gif"> <br /> 数据查询中，请等待...<br />&nbsp;
		</div>
		<%
			if (!StringUtils.isEmpty(Page.getOPENO())) {
		%>
		<div class="subImgs" onclick="window.location.href='ggdj_tbxx_bgzx.jsp'">下一步</div>
		<%
			} else {
		%>
		<div class="subImgs" id="subid" onclick="doSub()">下一步</div>
		<%
			}
		%>
	</CENTER>
	<iframe height="0" width="0" name="editframe" src="" id="editframe"></iframe>
	<%@include file="../bottom.inc"%>
</body>
</html>
