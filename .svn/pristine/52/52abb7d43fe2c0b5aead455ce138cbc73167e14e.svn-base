<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.macrosoft.icms.szcp.dao.SZCP_SQ_XGZSDao"%>
<%@page import="com.macrosoft.icms.szcp.SZCP_SQ_XGZS"%>
<%@page import="java.util.List"%>
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<jsp:useBean id="xgzs" scope="page"
	class="com.macrosoft.icms.szcp.SZCP_SQ_XGZS" />
<jsp:useBean id="lczt" scope="page"
class="com.macrosoft.icms.szcp.SZCP_LCZT" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<script language="javascript" src="<%=request.getContextPath() %>/szcp/js/print.js"></script>
<link href="<%=request.getContextPath() %>/szcp/css/print.css" type="text/css" rel="stylesheet" media="print">
<link href="<%=request.getContextPath() %>/szcp/css/NoPrint.css" type="text/css" rel="stylesheet">
<title>相关证书</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/szcp/js/createAjax.js"></script>
</head>
<body style="margin-top: 0; margin-bottom: 0">
<OBJECT classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2" height="0"
		id="wb" name="wb" width="0"></OBJECT>
	<%
		String REG_NO = request.getParameter("REG_NO");
		String YEAR = request.getParameter("EVAL_YEAR");
		SZCP_SQ_XGZSDao xgzsDao = new SZCP_SQ_XGZSDao();
		List<SZCP_SQ_XGZS> list = xgzsDao.querySZCP_SQ_XGZS(REG_NO,YEAR);
		lczt = xgzsDao.queryLcztStatus(REG_NO,YEAR);
	%>

	<form name="form1" method="POST" action="szcp_sq_xgzs_action.jsp">
	<div style="text-align: right;" class="noprint">
			<input type=button name=button_print value="打印"
				onclick="javascript:print()"> <input type=button
				name=button_show value="打印预览" onclick="javascript:printpreview();">
		</div>
		<input type="hidden" name="REG_NO" value="<%=REG_NO%>" id="REG_NO"></input>
		<input type="hidden" name="EVAL_YEAR" value="<%=YEAR%>" id="EVAL_YEAR"></input>
		<input type="hidden" name="APPR_STAT_FLAG"
			value="<%=lczt.getAPPR_STAT_FLAG()%>" id="APPR_STAT_FLAG"></input> <input
			type="hidden" name="PRO_STAT_FLAG"
			value="<%=lczt.getPRO_STAT_FLAG()%>" id="PRO_STAT_FLAG"></input>
		<table border="1" width="90%" align="center" bordercolor="#000000">
			<caption align="center">
				<b> <span style="font-size: 16pt"><center>相关证书</center></b><br>
				<br>
			</caption>

			<tr align='center' height=44 width="20%">
				<td>证件名称</td>
				<td>证件编号</td>
				<td>发证机构</td>
				<td>发证日期</td>
				<td>有效期至</td>
			</tr>
			<c:if test="<%=list.size() == 0%>">
				<tr>
					<td colspan="8" height="44"></td>
				</tr>
			</c:if>
			<c:if test="<%=list.size() != 0%>">
				<c:forEach items="<%=list%>" var="temp">
					<tr align='center' height=44 width="20%">
						<td>${temp.CERT_NAME}</td>
						<td>${temp.CERT_NO}</td>
						<td>${temp.AUTH_ORG_DESC}</td>
						<td>${temp.ISSUE_DATE}</td>
						<td>${temp.VALID_TO_DATE}</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<br>
	</form>
</body>
</html>