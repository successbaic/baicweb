<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@page import="com.macrosoft.icms.szcp.dao.SZCP_SQ_JYXYDao"%>
<jsp:useBean id="Page" scope="session" class="com.macrosoft.icms.system.WebSysPage" />
<jsp:useBean id="jyxy" scope="page" class="com.macrosoft.icms.szcp.SZCP_SQ_JYXY" />
<jsp:useBean id="jyxy1" scope="page" class="com.macrosoft.icms.szcp.SZCP_SQ_JYXY" />
<jsp:useBean id="SZCP_SXSZ" scope="page" class="com.macrosoft.icms.szcp.SZCP_SXSZ" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language="javascript"
	src="<%=request.getContextPath()%>/szcp/js/print.js"></script>
<link href="<%=request.getContextPath()%>/szcp/css/print.css"
	type="text/css" rel="stylesheet" media="print">
<link href="<%=request.getContextPath()%>/szcp/css/NoPrint.css"
	type="text/css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title></title>
</head>
<body style="margin-top: 0; margin-bottom: 0">
	<OBJECT classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2" height="0"
		id="wb" name="wb" width="0"></OBJECT>
	<%
		String regNo = request.getParameter("REG_NO");
		String year = request.getParameter("EVAL_YEAR");
		String CERNO = request.getParameter("CerNO");
		SZCP_SQ_JYXYDao jyxyDao = new SZCP_SQ_JYXYDao();

		SZCP_SXSZ = SZCP_SXSZ.querySZCP_SXSZ(year);
		String REPORT_YEAR1 = SZCP_SXSZ.getREPORT_YEAR1();
		String REPORT_YEAR2 = SZCP_SXSZ.getREPORT_YEAR2();
		jyxy = jyxyDao.querySZCP_SQ_JYXY(regNo, year, REPORT_YEAR1);
		jyxy1 = jyxyDao.querySZCP_SQ_JYXY(regNo, year, REPORT_YEAR2);
	%>
	<!-- form表单 -->
	<form name="form1" method="POST" action="szcp_sq_jyxy_action.jsp">
		<input type="hidden" value="<%=regNo%>" name="REGNO" id="REG_NO">
		<input type="hidden" value="<%=year%>" name="EVAL_YEAR"
			id="EVAL_YEAR"> <input type="hidden"
			value="<%=REPORT_YEAR1%>" name="REPORT_YEAR1" id="REPORT_YEAR1">
		<input type="hidden" value="<%=REPORT_YEAR2%>" name="REPORT_YEAR2"
			id="REPORT_YEAR2">
	</form>
	<div style="text-align: right;" class="noprint">
		<input type=button name=button_print value="打印"
			onclick="javascript:print()"> <input type=button
			name=button_show value="打印预览" onclick="javascript:printpreview();">
	</div>
	<table border="1" width="90%" align="center" bordercolor="#000000">
		<caption align="center">
			<b> <span style="font-size: 16pt"><center>企业经营效益</center></b><br>
			<br>
		</caption>

		<tr align="center" height="44">
			<td class="lc1">项目/年份</td>
			<td class="lc1"><%=REPORT_YEAR1%>年（%）</td>
			<td class="lc1"><%=REPORT_YEAR2%>年（%）</td>
		</tr>

		<tr>
			<td align='center' height=50 width="40%">营业收入增长率(%)</td>
			<td align='center'><%=jyxy.getREVE_GROW_RATE()%></td>
			<td align='center'><%=jyxy1.getREVE_GROW_RATE()%></td>
		</tr>

		<tr>
			<td align='center' height=50 width="40%">主营业务利润率(%)</td>
			<td align='center'><%=jyxy.getPRI_GROW_RATE()%></td>
			<td align='center'><%=jyxy1.getPRI_GROW_RATE()%></td>
		</tr>

		<tr>
			<td align='center' height=50 width="40%">净资产收益率(%)</td>
			<td align='center'><%=jyxy.getNET_ASSET_RATE()%></td>
			<td align='center'><%=jyxy1.getNET_ASSET_RATE()%></td>
		</tr>

		<tr>
			<td align='center' height=50 width="40%">资产负债率(%)</td>
			<td align='center'><%=jyxy.getDEBT_ASSET_RATE()%></td>
			<td align='center'><%=jyxy1.getDEBT_ASSET_RATE()%></td>
		</tr>

		<tr>
			<td align='center' height=50 width="40%">速动比率(%)</td>
			<td align='center'><%=jyxy.getQUICK_ACT_RATE()%></td>
			<td align='center'><%=jyxy1.getQUICK_ACT_RATE()%></td>
		</tr>

		<tr>
			<td align='center' height=50 width="40%">应收账款周转率(%)</td>
			<td align='center'><%=jyxy.getRECV_TNOV_RATE()%></td>
			<td align='center'><%=jyxy1.getRECV_TNOV_RATE()%></td>
		</tr>

		<tr>
			<td align='center' height=50 width="40%">逾期账款占应收账款比例(%)</td>
			<td align='center'><%=jyxy.getRCV_OVERDUE_RATE()%></td>
			<td align='center'><%=jyxy1.getRCV_OVERDUE_RATE()%></td>
		</tr>

		<tr>
			<td align='center' height=50 width="40%">逾期账款占应付账款比例(%)</td>
			<td align='center'><%=jyxy.getPAY_OVERDUE_RATE()%></td>
			<td align='center'><%=jyxy1.getPAY_OVERDUE_RATE()%></td>
		</tr>

	</table>

</body>
</html>