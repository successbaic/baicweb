<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="/jspheader.inc"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<jsp:useBean id="UPLOAD_FILE" scope="page"
	class="com.macrosoft.icms.util.UPLOAD_FILE" />
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<html>
<head>
<title>�ϴ��ļ���Ϣ</title>
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
		// ��ʼ���ļ��б�
		if ("20".equals(opeType) && !StringUtils.isEmpty(OPENO) && "0".equals(SIGN)) {
			String sqlWhere = "OPENO = " + SysUtility.doPreProcess3(OPENO);
			int count = UPLOAD_FILE.getListCount(sqlWhere);
			if (count == 0) {
				UPLOAD_FILE.setOPENO(OPENO);
				UPLOAD_FILE.setFILESIZE("0");
				UPLOAD_FILE.setWJBH(0);
				UPLOAD_FILE.setREMARKS("REQUIRE");
				UPLOAD_FILE.setFILEID(OPENO + "file01");
				UPLOAD_FILE.setFILENAME("�����ʸ�֤���ļ�");
				UPLOAD_FILE.doAdd();
				UPLOAD_FILE.setFILEID(OPENO + "file02");
				UPLOAD_FILE.setFILENAME("ý����׼�ļ�");
				UPLOAD_FILE.doAdd();
				UPLOAD_FILE.setFILEID(OPENO + "file03");
				UPLOAD_FILE.setFILENAME("���ҵ�����֤���ļ����为���������ļ�");
				UPLOAD_FILE.doAdd();
				UPLOAD_FILE.setFILEID(OPENO + "file04");
				UPLOAD_FILE.setFILENAME("����ҵ��Ա�͹�������Ա֤���ļ�");
				UPLOAD_FILE.doAdd();
				UPLOAD_FILE.setFILEID(OPENO + "file05");
				UPLOAD_FILE.setFILENAME("����ʹ��֤���ļ�");
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
						<td align="left" style="font-size: 14px; font-weight: bold;">������Ϣ���</td>
						<td align="right"><span
							onclick="document.getElementById('editDiv').style.display='none'"
							style="cursor: pointer; font-size: 14px; font-weight: bold;">
								�ر� &nbsp; </span></td>
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
					������Ϣ</td>
				<td style="text-align: right;" width="120px">
					<%
						if (!SIGN.equals("1")) {
					%> &nbsp; <a href='#'
					onclick="framejumpTo('ggdj_fjxx_do.jsp','action=1&OPENO=<%=OPENO%>&LEREPSIGN=2&IFELEC=0');">
						<img border=0 src='../images/icon/icon_list_add.gif' alt='����'>
						<font style="font-size: 14px;">����</font>
				</a> <%
 	}
 %>
				</td>
			</tr>
		</table>

		<table bgcolor="#FFFFFF" align="center" border="1" width="100%"
			cellpadding="0" cellspacing="0" id="table1">
			<tr class="yxsm">
				<td align="center" style="width: 40%;">�ļ���</td>
				<td align="center" style="width: 20%;">�ϴ�ʱ��</td>
				<td align="center" style="width: 20%;">����</td>
			</tr>
			<%
				String sql = " WHERE OPENO = '" + OPENO + "' ";

				ArrayList al = UPLOAD_FILE.getList(sql, request.getParameter("start")); //����ҵ���Ų�ѯ����ҵ��������ϴ��ļ���Ϣ
				Iterator It = al.iterator();
				while (It.hasNext()) {
					com.macrosoft.icms.util.UPLOAD_FILE f = (com.macrosoft.icms.util.UPLOAD_FILE) It.next();
			%>
			<tr>
				<td align="center"><%=f.getFILENAME()%></td>
				<!-- //�ļ����� -->
				<td align="center"><%=f.getATTACHDATE()%></td>
				<td align="center">
					<%
						if (SIGN.equals("1")) {
					%> <a href='../upload/<%=f.getFILEID()%>' target="_blank"><img
						border=0 src='../images/icon/icon_edit.gif' alt='�鿴'>�鿴</a> <%
 	} else {

 			if ("REQUIRE".equals(f.getREMARKS())) {
 				if ("0".equals(f.getFILESIZE())) {
 %><a
					onclick="framejumpTo('ggdj_fjxx_do.jsp','action=1&OPENO=<%=OPENO%>&LEREPSIGN=2&IFELEC=0&FILEID=<%=f.getFILEID()%>')"
					target="_blank"><img border=0
						src='../images/icon/icon_edit.gif' alt='�鿴'>�ϴ�</a> <%
 	} else {
 %><a
					onclick="framejumpTo('ggdj_fjxx_do.jsp','action=1&OPENO=<%=OPENO%>&LEREPSIGN=2&IFELEC=0&FILEID=<%=f.getFILEID()%>')"
					target="_blank"><img border=0
						src='../images/icon/icon_edit.gif' alt='�鿴'>�ϴ�</a>&nbsp;<a
					href='../upload/<%=f.getFILEID()%>' target="_blank"><img
						border=0 src='../images/icon/icon_edit.gif' alt='�鿴'>�鿴</a> <%
 	}
 			} else {
 %> <a href='../upload/<%=f.getFILEID()%>' target="_blank"><img
						border=0 src='../images/icon/icon_edit.gif' alt='�鿴'>�鿴</a>
					&nbsp; <a href='#'
					onclick="framejumpToC('../web/wsdj_fjxx_delete.jsp','REMARK=delete&OPENO=<%=f.getOPENO()%>&FILEID=<%=f.getFILEID()%>','ȷ��ɾ���ü�¼��?');"><img
						border=0 src='../images/icon/icon_delete.gif' alt='ɾ��'>ɾ��</a> <%
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
		<span><font color="red">˵��:�˵���еĲ��ϱ���ȫ���ϴ��󷽿��ύ</</font></span>
		<%
			}
		%>
		<br>
		<center>
			<%
				if (SIGN.equals("0")) {
			%>
			<div class="subImgs" onclick="subForm1();">��һ��</div>
			<%
				} else {
			%>
			<div class="subImgs" onclick="window.location.href='ggdj_dotj.jsp'">��һ��</div>
			<%
				}
			%>
		</center>
	</form>
	<%@include file="/bottom.inc"%>
</body>
</html>