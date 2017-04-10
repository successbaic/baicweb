<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="/jspheader.inc"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<jsp:useBean id="UPLOAD_FILE" scope="page"
	class="com.macrosoft.icms.util.UPLOAD_FILE" />
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<html>
<head>
<title>上传文件信息</title>
<script language="javascript"
	src="<%=request.getContextPath()%>/eid/eIDPluginHelper2.0.js"></script>
<script language="javascript"
	src="<%=request.getContextPath()%>/eid/base64.js"></script>
<script language="javascript"
	src='<%=request.getContextPath()%>/eid/jquery-1.8.2.js'></script>
<script language="javascript"
	src='<%=request.getContextPath()%>/eid/eIDUI/eIDSelect/jquery.eIDSelect.js'></script>
<script language="javascript"
	src='<%=request.getContextPath()%>/eid/eIDUI/eIDSelect/eIDUI-common.js'></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/eid/eIDUI/eIDSelect/jquery.eIDSelect.css">
<script language="javascript" src="js/ggdj_fjxx_list.js">
	
</script>
</head>
<body bgcolor="#eefbf7" onLoad="body_load()">
	<%@include file="/top.inc"%>
	<%
		String OPENO = Page.getOPENO();
		String SIGN = Page.getSIGN();
		String opeType = Page.getOPETYPE();
		String pageheader = Page.pageheader(request.getRequestURI());
		out.println(pageheader);
		// 初始化文件列表
		if ("20".equals(opeType) && !StringUtils.isEmpty(OPENO) && "0".equals(SIGN)) {
			String sqlWhere = "OPENO = " + SysUtility.doPreProcess3(OPENO);
			int count = UPLOAD_FILE.getListCount(sqlWhere);
			if (count == 0) {
				UPLOAD_FILE.setOPENO(OPENO);
				UPLOAD_FILE.setFILESIZE("0");
				UPLOAD_FILE.setWJBH(0);
				UPLOAD_FILE.setREMARKS("REQUIRE");
				UPLOAD_FILE.setFILEID(OPENO + "file01");
				UPLOAD_FILE.setFILENAME("法人资格证明文件");
				UPLOAD_FILE.doAdd();
				UPLOAD_FILE.setFILEID(OPENO + "file02");
				UPLOAD_FILE.setFILENAME("媒介批准文件");
				UPLOAD_FILE.doAdd();
				UPLOAD_FILE.setFILEID(OPENO + "file03");
				UPLOAD_FILE.setFILENAME("广告业务机构证明文件及其负责人任命文件");
				UPLOAD_FILE.doAdd();
				UPLOAD_FILE.setFILEID(OPENO + "file04");
				UPLOAD_FILE.setFILENAME("广告从业人员和广告审查人员证明文件");
				UPLOAD_FILE.doAdd();
				UPLOAD_FILE.setFILEID(OPENO + "file05");
				UPLOAD_FILE.setFILENAME("场所使用证明文件");
				UPLOAD_FILE.doAdd();
			}
		}
	%>
	<form name="form1" id="form1" method="POST"
		action="ggdj_fjxx_list_action.jsp" target="editframe">

		<div style="position: relative;">
			<div id="editDiv"
				style="position: absolute; width: 100%; height: 350px; top: 0px; left: 0px; display: none; border-style: solid; border-width: 1pt; border-color: blue">
				<table width="100%">
					<tr class="yxsm" style="background-color: #BED8EB;">
						<td align="left" style="font-size: 14px; font-weight: bold;">附件信息添加</td>
						<td align="right"><span
							onclick="document.getElementById('editDiv').style.display='none'"
							style="cursor: pointer; font-size: 14px; font-weight: bold;">
								关闭 &nbsp; </span></td>
					</tr>
				</table>
				<IFRAME height="100%" width="100%" name="editframe" src=""
					id="editframe" scrolling="no" border="0" align='center'
					frameborder="0"> </IFRAME>
			</div>
		</div>
		<table align="center" width="100%" cellpadding="0" cellspacing="0"
			id="stockmanID">
			<tr>
				<td
					style="font-size: 14px; padding-left: 2px; color: blue; font-weight: bold; line-height: 25px; text-align: left;">
					附件信息</td>
				<td style="text-align: right;" width="120px">
					<%
						if (!SIGN.equals("1")) {
					%> &nbsp; <a href='#'
					onclick="framejumpTo('ggdj_fjxx_do.jsp','action=1&OPENO=<%=OPENO%>&LEREPSIGN=2&IFELEC=0');">
						<img border=0 src='../images/icon/icon_list_add.gif' alt='增加'>
						<font style="font-size: 14px;">增加</font>
				</a> <%
 	}
 %>
				</td>
			</tr>
		</table>

		<table bgcolor="#FFFFFF" align="center" border="1" width="100%"
			cellpadding="0" cellspacing="0" id="table1">
			<tr class="yxsm">
				<td align="center" style="width: 40%;">文件名</td>
				<td align="center" style="width: 20%;">上传时间</td>
				<td align="center" style="width: 20%;">操作</td>
			</tr>
			<%
				String sql = " WHERE OPENO = '" + OPENO + "' ";

				ArrayList al = UPLOAD_FILE.getList(sql, request.getParameter("start")); //根据业务编号查询出该业务的所有上传文件信息
				Iterator It = al.iterator();
				while (It.hasNext()) {
					com.macrosoft.icms.util.UPLOAD_FILE f = (com.macrosoft.icms.util.UPLOAD_FILE) It.next();
			%>
			<tr>
				<td align="center"><%=f.getFILENAME()%></td>
				<!-- //文件名称 -->
				<td align="center"><%=f.getATTACHDATE()%></td>
				<td align="center">
					<%
						if (SIGN.equals("1")) {
					%> <a href='../upload/<%=f.getFILEID()%>' target="_blank"><img
						border=0 src='../images/icon/icon_edit.gif' alt='查看'>查看</a> <%
 	} else {

 			if ("REQUIRE".equals(f.getREMARKS())) {
 				if ("0".equals(f.getFILESIZE())) {
 %><a
					onclick="framejumpTo('ggdj_fjxx_do.jsp','action=1&OPENO=<%=OPENO%>&LEREPSIGN=2&IFELEC=0&FILEID=<%=f.getFILEID()%>')"
					target="_blank"><img border=0
						src='../images/icon/icon_edit.gif' alt='查看'>上传</a> <%
 	} else {
 %><a
					onclick="framejumpTo('ggdj_fjxx_do.jsp','action=1&OPENO=<%=OPENO%>&LEREPSIGN=2&IFELEC=0&FILEID=<%=f.getFILEID()%>')"
					target="_blank"><img border=0
						src='../images/icon/icon_edit.gif' alt='查看'>上传</a>&nbsp;<a
					href='../upload/<%=f.getFILEID()%>' target="_blank"><img
						border=0 src='../images/icon/icon_edit.gif' alt='查看'>查看</a> <%
 	}
 			} else {
 %> <a href='../upload/<%=f.getFILEID()%>' target="_blank"><img
						border=0 src='../images/icon/icon_edit.gif' alt='查看'>查看</a>
					&nbsp; <a href='#'
					onclick="framejumpToC('../web/wsdj_fjxx_delete.jsp','REMARK=delete&OPENO=<%=f.getOPENO()%>&FILEID=<%=f.getFILEID()%>','确定删除该记录吗?');"><img
						border=0 src='../images/icon/icon_delete.gif' alt='删除'>删除</a> <%
 	}

 		}
 %>
				</td>
				<%
					}
				%>
			
			<tr>
				<td colspan="4">
					<%
						SysPageShow sp = new SysPageShow(request, UPLOAD_FILE.getListCount(sql));
						out.print(sp.PageNav());
					%>
				</td>
			</tr>
		</table>
		<%
			if ("20".equals(opeType)) {
		%>
		<span><font color="red">说明:填报说明中的材料必须全部上传后方可提交</</font></span>
		<%
			}
		%>
		<br>
		<center>
			<%
				if (SIGN.equals("0")) {
			%>
			<div class="subImgs" onclick="subForm1();">下一步</div>
			<%
				} else {
			%>
			<div class="subImgs" onclick="window.location.href='ggdj_dotj.jsp'">下一步</div>
			<%
				}
			%>
		</center>
	</form>
	<%@include file="/bottom.inc"%>
</body>
</html>