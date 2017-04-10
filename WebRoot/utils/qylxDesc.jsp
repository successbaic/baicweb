<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=GBK"%>
<jsp:useBean id="QYLXDESC" scope="page"
	class="com.macrosoft.icms.mcgl.QYLXDESC" />
<%@ page import="com.macrosoft.icms.mcgl.QYLXDESC"%>
<%@ include file="/jspheader.inc"%>
<html>
	<head>

		<title>企业（机构）类型的法律特征简表</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	</head>

	<body>
		<div style="text-align: center;">
		<table>
			<caption style="text-align: center;">企业（机构）类型的法律特征简表
                </caption>
			<tr>
				<td class="yxsm" style="width:300px;">
					企业（机构）类型
				</td>
				<!-- 
				<td class="yxsm" style="width:100px;">
					出资人数
				</td>
				 -->
				<td class="yxsm" style="width:500px;">
					简述
				</td>
			</tr>
			<%
				int colNum = 10;
				String sql = " WHERE 1=1 ";

				ArrayList<QYLXDESC> al = QYLXDESC.getList(sql, request.getParameter("start")); //根据业务编号查询出该业务的投资人文件信息
				Iterator<QYLXDESC> It = al.iterator();
				int j = 0;
				while (It.hasNext()) {
					j = j + 1;
					QYLXDESC tb = It.next();
			%>
			<tr>
				<td align="center">
					<%=tb.getCONTENT()%>
				</td>
				<%--
				<td>
					<%=tb.getCZRS()%>
				</td>
				 --%>
				<td>
					<%=tb.getDESCRIPTION()%>
				</td>
			</tr>
			<%
				}
			%>
			<tr>
				<td colspan="<%=colNum%>">
					<%
						SysPageShow sp = new SysPageShow(request, QYLXDESC
								.getListCount(sql));
						out.print(sp.PageNav());
					%>
				</td>
		</table>
		</div>
	</body>
</html>
