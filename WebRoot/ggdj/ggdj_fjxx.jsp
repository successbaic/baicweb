<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="/jspheader.inc"%>
<jsp:useBean id="UPLOAD_FILE" scope="page"
	class="com.macrosoft.icms.util.UPLOAD_FILE" />
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<html>
<head>
<title>�ϴ��ļ���Ϣ</title>
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
						<td align="left" style="font-size: 14px; font-weight: bold;">������Ϣ���</td>
						<td align="right"><span
							onclick="document.getElementById('editDiv').style.display='none'"
							style="cursor: pointer; font-size: 14px; font-weight: bold;">
								�ر� &nbsp; </span></td>
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
						<img border=0 src='../images/icon/icon_list_add.gif' alt='����'>
						<font style="font-size: 14px;">����</font>
				</a> <%
 	}
 %>
				</td> --%>
			</tr>
		</table>

		<table align="center" border="1" width="100%" cellpadding="0"
			cellspacing="0" id="table1">
			<tr class="yxsm">
				<td align="center" width="10%">���</td>
				<td align="center" width="35%">��������</td>
				<td align="center" width="45%">˵��</td>
				<td align="center" width="10">����</td>
			</tr>
			<%
				if ("20".equals(OPETYPE)) {
			%>
			<tr>
				<td align="center">1</td>
				<td align="left">�����ʸ�֤���ļ�</td>
				<td align=""left"">ԭ����ӡ��</td>
				<td align="center">1</td>
			</tr>
			<tr>
				<td align="center">2</td>
				<td align="left">ý����׼�ļ�</td>
				<td align=""left"">ԭ����ӡ����ý����׼��λ�еĳ��浥λ���߱������ʸ�ģ�Ӧ������з����ʸ�����쵥λ������롣��</td>
				<td align="center">1</td>
			</tr>
			<tr>
				<td align="center">3</td>
				<td align="left">���ҵ��֤���ļ����为���������ļ�</td>
				<td align=""left"">����֤��ʽ�ļ����ṩԭ����ӡ��������ʽ�ļ����ṩ���ڹ��ҵ��������为���˵����˵���������뵥λ����ȷ�ϣ�ԭ������</td>
				<td align="center">1</td>
			</tr>
			<tr>
				<td align="center">4</td>
				<td align="left">����ҵ��Ա�͹�������Ա֤���ļ�</td>
				<td align=""left"">��λ���ߵĹ���ҵ��Ա�͹�������Ա֤���ļ���ԭ����ӡ����</td>
				<td align="center">1</td>
			</tr>
			<tr>
				<td align="center">5</td>
				<td align="left">����ʹ��֤���ļ�</td>
				<td align=""left"">��Ӫ������Ȩ֤�������޺�ͬ��ԭ����ӡ����</td>
				<td align="center">1</td>
			</tr>
				<%
					} else if ("30".equals(OPETYPE)) {
				%>
			
			<tr>
				<td align="center">1</td>
				<td align="left">�����ķ����ʸ�֤���ļ�</td>
				<td align=""left"">ԭ����ӡ��</td>
				<td align="center">1</td>
			</tr>
			<tr>
				<td align="center">2</td>
				<td align="left">������ý����׼�ļ�</td>
				<td align=""left"">ԭ����ӡ��</td>
				<td align="center">1</td>
			</tr>
			<tr>
				<td align="center">3</td>
				<td align="left">����ĳ���ʹ��֤���ļ�</td>
				<td align=""left"">��Ӫ������Ȩ֤�����޺�ͬ��ԭ����ӡ����</td>
				<td align="center">1</td>
			</tr>
			<tr>
				<td align="center">4</td>
				<td align="left">��������ٹ�淢��ý��ı��</td>
				<td align=""left"">ֻ����д�ϱ������ύ����</td>
				<td align="center">1</td>
			</tr>
			<%
				}
			%>


		</table>
		<br>
		<CENTER>
			<div class="subImgs" onclick="window.location.href='ggdj_dotj.jsp'">��һ��</div>
		</CENTER>
	</form>
	<%@include file="/bottom.inc"%>
</body>
</html>
