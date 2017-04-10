<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.macrosoft.icms.szcp.dao.SZCP_SQ_SHRYDao"%>
<%@page import="com.macrosoft.icms.szcp.dao.SZCP_SQ_GYJZDao"%>
<%@page import="com.macrosoft.icms.szcp.SZCP_SQ_SHRY"%>
<%@page import="java.util.List"%>
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<jsp:useBean id="shry" scope="page" class="com.macrosoft.icms.szcp.SZCP_SQ_SHRY" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language="javascript" src="<%=request.getContextPath() %>/szcp/js/print.js"></script>
<link href="<%=request.getContextPath() %>/szcp/css/print.css" type="text/css" rel="stylesheet" media="print">
<link href="<%=request.getContextPath() %>/szcp/css/NoPrint.css" type="text/css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>社会荣誉</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/szcp/js/createAjax.js"></script>
</head>
<body style="margin-top: 0; margin-bottom: 0">
	<OBJECT classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2" height="0"
		id="wb" name="wb" width="0"></OBJECT>
	<%
			String REG_NO = request.getParameter("REG_NO");
			String YEAR = request.getParameter("EVAL_YEAR");
			String CERNO = request.getParameter("CerNO");
			SZCP_SQ_SHRYDao shryDao = new SZCP_SQ_SHRYDao();
			SZCP_SQ_GYJZDao gyjzDao = new SZCP_SQ_GYJZDao();
			List<SZCP_SQ_SHRY> list = shryDao.querySZCP_SQ_SHRY(REG_NO,YEAR);
	%>

	<form name="form1" method="POST" action="szcp_sq_shry_action.jsp">
		<div style="text-align: right;" class="noprint">
			<input type=button name=button_print value="打印"
				onclick="javascript:print()"> <input type=button
				name=button_show value="打印预览" onclick="javascript:printpreview();">
		</div>
		<input type="hidden" name="REG_NO" value="<%=REG_NO%>" id="REG_NO"></input>
		<input type="hidden" name="EVAL_YEAR" value="<%=YEAR%>" id="EVAL_YEAR"></input>


		<table border="1" width="90%" align="center" bordercolor="#000000"  style="table-layout:fixed;">
			<caption align="center">
				<b> <span style="font-size: 16pt"><center>社会荣誉</center></b><br>
				<br>
			</caption>
			<%-- <tr>
      	<td colspan="7">
      		<table border="1" width="100%" cellpadding="0" cellspacing="0">
      			<tr>
      				<td class="lc1" colspan="3">公益捐赠钱数</td>
      				<td class="lc2" colspan="3">
      					<input type="text" name="LAST_DONT_RMB_W"  id="LAST_DONT_RMB_W"  size="60"  title="公益捐赠钱数"   value="<%=gyjz.getLAST_DONT_RMB_W()%>" ></input>&nbsp;<font color=red>*</font>
      				</td>
      				<td class="lc1">
      						<input type="button" class="button" value="添加" onclick="addSHRY();">
      				</td>
      			</tr>
      		</table>
      	</td>
      </tr> --%>

			<tr align='center' height=44 width="20%">
				<td>荣誉级别</td>
				<td>荣誉名称</td>
				<td>证件号</td>
				<td>授予单位</td>
				<td>授予日期</td>
				<td>有效期至</td>
				<td>说明</td>
			</tr>
			<c:if test="<%=list.size() == 0%>">
				<tr align='center' height=44 width="20%">
					<td colspan="7"></td>
				</tr>
			</c:if>
			<c:if test="<%=list.size() != 0%>">
				<c:forEach items="<%=list%>" var="temp">
					<tr align='center' height=44 width="20%">
						<td>${temp.HONOR_LEVEL_TYPE_VIEW}</td>
						<td>${temp.CERT_NAME}</td>
						<td>${temp.CERT_NO}</td>
						<td>${temp.AUTH_ORG_DESC}</td>
						<td>${temp.ISSUE_DATE}</td>
						<td>${temp.VALID_TO_DATE}</td>
						<td align='left' style="word-break : break-all; width: 50">${temp.HONORDESC}</td>
					</tr>
				</c:forEach>
			</c:if>
			<%-- <tr>
			<td class="lc1" colspan="3">公益捐赠钱数</td>
      				<td class="lc2" colspan="3">
      					<input type="text" name="LAST_DONT_RMB_W"  id="LAST_DONT_RMB_W"  size="60"  title="公益捐赠钱数"   value="<%=gyjz.getLAST_DONT_RMB_W()%>" ></input>&nbsp;<font color=red>*</font>
      				</td>
			</tr> --%>
		</table>
		<br>
	</form>
</body>
</html>