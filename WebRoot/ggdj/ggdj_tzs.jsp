<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@page import="com.macrosoft.icms.ems.WEB_USER_EXPRESS"%>
<%@page import="com.macrosoft.icms.bean.ONLINE_ORDER_CFG"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@ page import="com.macrosoft.icms.util.*"%>
<jsp:useBean id="ggdjTzsxx" scope="page"
	class="com.macrosoft.icms.ggdj.GgdjTzsxx" />
<%
	String openo = request.getParameter("openo");
	ggdjTzsxx.setOpeno(openo);
	ggdjTzsxx.loadDataByOpeno();
%>
<html>
<head>
</style>
<title>广告登记业务办理通知书</title>
</head>
<body>
	<table border="0" align="center" cellpadding="0" cellspacing="0"
		width="580">
		<caption style="text-align: center;">
			<font size="4pt">广告登记业务办理通知书 
		</caption>
	</table>
	<br>
	<br>
	<br>
	<table border="1"  align="center" cellpadding="0" cellspacing="0"
		width="580">
		<tr>
			<td class='lc1' width="25%" >审核人</td>
			<td class='lc2'><%=SysUtility.doPreProcess(ggdjTzsxx.getApprPer())%></td>
		</tr>
		<tr>
			<td class='lc1'>审批意见</td>
			<td class='lc2'><%=SysUtility.doPreProcess(ggdjTzsxx.getOpinion())%></td>
		</tr>
		<tr>
			<td class='lc1'>审核日期</td>
			<td class='lc2'><%=SysUtility.doPreProcess(ggdjTzsxx.getApprDate())%></td>
		</tr>
		<tr>
			<td class='lc1'>材料提交地址</td>
			<td class='lc2'><%=SysUtility.doPreProcess(ggdjTzsxx.getSubAddr())%></td>
		</tr>
	</table>
</body>
</html>
