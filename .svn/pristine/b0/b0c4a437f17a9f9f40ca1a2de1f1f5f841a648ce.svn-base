<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<jsp:useBean id="ggdjRyqk" scope="page"
	class="com.macrosoft.icms.ggdj.GgdjRyqk" />
<html>
<head>
<script type="text/javascript" src="js/ggdj_ryqk.js"></script>
</head>
<body>
	<%@include file="../top.inc"%>
	<%
		String pageheader = Page.pageheader(request.getRequestURI());
		out.println(pageheader);
		String SIGN = Page.getSIGN(); //-1数据未保存,1已开业
		String OPENO = Page.getOPENO();
		String OPETYPE = Page.getOPETYPE();
		ggdjRyqk.setSqxxid(OPENO);
		List<Map> ryqkList = ggdjRyqk.queryDataByMtbId();
	%>
	<div style="position: relative;">
		<div id="editDiv"
			style="position: absolute; width: 100%; height: 200px; top: 0px; left: 0px; display: none; border-style: solid; border-width: 1pt; border-color: blue">
			<table width="100%">
				<tr class="yxsm">
					<td align="left" style="font-size: 14px; font-weight: bold;">广告从业人员、广告审查人员信息</td>
					<td align="right"><span
						onclick="document.getElementById('editDiv').style.display='none'"
						style="cursor: pointer; font-size: 14px; font-weight: bold;">
							关闭 &nbsp; </span></td>
				</tr>
			</table>
			<IFRAME height="300" width="770px" name="editframe" src=""
				id="editframe" scrolling="yes" border="0" align='center'
				frameborder="0"></IFRAME>
		</div>
	</div>


	<form id="form1" method="POST" action="ggdj_ryqk_action.jsp"
		target="editframe1">
		<table align="center" width="770px" cellpadding="0" cellspacing="0">
			<tr>
				<td
					style="font-size: 14px; padding-left: 2px; color: blue; font-weight: bold; line-height: 25px; text-align: left;"></td>
				<td align="center" width="120px">&nbsp; <%
 	if (SIGN.equals("0")) {
 %> <a href='#'
					onclick="framejumpTo('ggdj_ryqk_detail.jsp','action=1&maTbId=<%=OPENO%>')">
						<img border=0 src='../images/icon/icon_list_add.gif' alt='增加'>
						<font style="font-size: 14px;">增加</font>
				</a> <%
 	}
 %>
				</td>
			</tr>
		</table>
		<table align="center" border="1" width="100%" cellpadding="0"
			cellspacing="0" id="ryqk">
			<tr>
				<td class="yxsm" align="center" width ="35%">姓名</td>
				<td class="yxsm" align='center' width ="35%">人员类型</td>
				<td class="yxsm" align="center" width ="30%">操作</td>
			</tr>
			<%
				for (int i = 0; i < ryqkList.size(); i++) {
					Map ryqkMap = ryqkList.get(i);
			%>
			<tr>
			<td align="center" ><%=SysUtility.doPreProcess((String) ryqkMap.get("NAME"))%></td>
			<td align='center' ><%=SysUtility.doPreProcess((String) ryqkMap.get("PERSONTYPE"))%></td>
			<td align="center">
				<%
					if (SIGN.equals("1")) {
				%> <a href='#'
				onclick="framejumpTo('ggdj_ryqk_detail.jsp','action=4&id=<%=(String) ryqkMap.get("ID")%>&maTbId<%=(String) ryqkMap.get("SQXXID")%>');"><img
					border=0 src='../images/icon/icon_edit.gif' alt='查看'> 查看</a> <%
 	} else {
 %> <a href='#'
				onclick="framejumpTo('ggdj_ryqk_detail.jsp','action=2&id=<%=(String) ryqkMap.get("ID")%>&maTbId=<%=(String) ryqkMap.get("SQXXID")%>');"><img
					border=0 src='../images/icon/icon_edit.gif' alt='修改'> 修改</a>
				&nbsp; <a href='#'
				onclick="framejumpToC('ggdj_ryqk_detail.jsp','action=3&id=<%=(String) ryqkMap.get("ID")%>&maTbId=<%=(String) ryqkMap.get("SQXXID")%>','确定删除该记录吗?');"><img
					border=0 src='../images/icon/icon_delete.gif' alt='删除'> 删除</a> <%
 	}
 %>
			</td>
			</tr>
			<%
				}
			%>
		</table>
		<br />
		<center>
			<%
				if (SIGN.equals("0")) {
			%>
			<div class="subImgs" onclick="subForm1();">下一步</div>
			<%
				} else {
			%>
			<div class="subImgs" onclick="window.location.href='ggdj_fjxx_list.jsp'">下一步</div>
			<%
				}
			%>
		</center>
		<iframe height="0" width="0" name="editframe1" src="" id="editframe1"></iframe>
		<%@include file="/bottom.inc"%>
	</form>
</body>
</html>

