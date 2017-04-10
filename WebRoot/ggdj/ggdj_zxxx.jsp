<%@ include file="/jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%@ page import="com.macrosoft.icms.system.SysUtility"%>
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<jsp:useBean id="ggdjJbxxSq" scope="page"
	class="com.macrosoft.icms.ggdj.GgdjJbxxSq" />
<jsp:useBean id="ggdjMjmc" scope="page"
	class="com.macrosoft.icms.ggdj.GgdjMjmc" />
<jsp:useBean id="ggdjZxxx" scope="page"
	class="com.macrosoft.icms.ggdj.GgdjZxxx" />
<%
	String SIGN = Page.getSIGN(); //-1����δ����,1�ѿ�ҵ
	String OPENO = Page.getOPENO(); // ҵ�� ����
	String OPETYPE = Page.getOPETYPE(); // ҵ������
	if (StringUtils.isEmpty(OPENO)) {
		OPENO = SysUtility.getUUID20();
		Page.setOPENO(OPENO);
	}
	// ע����Ϣ
	ggdjZxxx.setId(Page.getOPENO());
	ggdjZxxx.loadData();
	String canRea = ggdjZxxx.getCanRea();
	String sqxxId = !StringUtils.isEmpty(Page.getSqxxId()) ? Page.getSqxxId() : ggdjZxxx.getSqxxId();
	Page.setSqxxId(sqxxId);
	// �������Ϣ
	ggdjJbxxSq.setId(Page.getSqxxId());
	ggdjJbxxSq.loadDataFromDb(); //����ʽ���м�����Ϣ
	String entType = SysUtility.doPreProcess(ggdjJbxxSq.getEntType());
	// ý����ϣ�
	ggdjMjmc.setSqxxId(Page.getSqxxId());
	ggdjMjmc.queryMediaNameListByMtbIdFromDb(); // ����ʽ���������
	List mnList = ggdjMjmc.getMediaNameList();
%>
<html>
<head>
<script type="text/javascript">
var sign = '<%=SIGN%>';
var entType = '<%=entType%>';
var canRea = '<%=canRea%>';
</script>
<script type="text/javascript" src="js/ggdj_zxxx.js">
	
</script>
</head>
<body>
	<%@include file="../top.inc"%>
	<%
		String pageheader = Page.pageheader(request.getRequestURI());
		out.println(pageheader);
	%>
	<form id="form1" method="POST" action="ggdj_zxxx_action.jsp"
		target="editframe">
		<input type="hidden" name="id" value="<%=OPENO%>" /> <input
			type="hidden" name="CDDL" value="9" /> <input type="hidden"
			name="sqxxId" value="<%=Page.getSqxxId()%>" /> <input type="hidden"
			name="entName"
			value="<%=SysUtility.doPreProcess(ggdjJbxxSq.getEntName())%>" /> <input
			type="hidden" name="lerep"
			value="<%=SysUtility.doPreProcess(ggdjJbxxSq.getLerep())%>" />
		<table border="1" cellpadding="0" cellspacing="0" width="100%">
			<tr>
				<td class="yxsm" colspan='4'>��λ��Ϣ</td>
			</tr>
			<tr>
				<td class="lc1">���뵥λ����</td>
				<td class="lc2" align="right"><input type="text" name="entName"
					title="���뵥λ����" size="45"
					value='<%=SysUtility.doPreProcess(ggdjJbxxSq.getEntName())%>'
					disabled="true"><font color="red"> *</font></td>
				<td class="lc1" align="right">��λ��������������</td>
				<td class="lc2"><input type="text" name="lerep"
					style="width: 150px" title="��λ��������������" size="20"
					value='<%=SysUtility.doPreProcess(ggdjJbxxSq.getLerep())%>'
					disabled="true"><font color="red"> *</font></td>
			</tr>
			<tr>
				<td class="lc1">��λʵ�ʾ�Ӫ��ַ</td>
				<td class="lc2"><input type="text" name="address" size="45"
					title="��λʵ�ʾ�Ӫ��ַ"
					value='<%=SysUtility.doPreProcess(ggdjJbxxSq.getAddress())%>'
					disabled="true"><font color="red"> *</font></td>
				<td class="lc1">��λ����</td>
				<td class="lc2"><select id="entType" name="entType"
					title="��λ����" disabled="true" style="width: 150px">
						<option value="">��ѡ��</option>
						<%=icms.getSysDmList("GGFBDW")%>
				</select><font color="red"> *</font></td>
			</tr>
			<tr>
				<td class="yxsm" colspan='4'>������¹�淢����ý������</td>
			</tr>

			<%
				for (int i = 0; i < mnList.size(); i++) {
			%>

			<tr>
				<td align="center" class="lc1"><%= i+1 %></td>
				<td class="lc2" colspan="3"><input type="text" name="MJMC"
					size="80" title="ý�����" disblank maxlength=50
					value='<%=mnList.get(i)%>' disabled="true"></td>
			</tr>
			<%
				}
			%>
			<tr>
				<td class="yxsm" colspan='4'>����Ǽ�ע��ԭ��</td>
			</tr>
			<tr>
				<td class="lc1" colspan='1'>ע��ԭ��</td>
				<td class="lc2" colspan='3'><select id="canRea" name="canRea"  disblank  title = "ע��ԭ��"
					style="width: 400px"><option value="">��ѡ��</option><%=icms.getSysDmList("GGFBCANREA")%></select>&nbsp;<font color="red">*</font> </td>
			</tr>
			<br />
		</table>
		<br />
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
	<iframe height="0" width="0" name="editframe" src="" id="editframe"></iframe>
	<%@include file="/bottom.inc"%>
</body>
</html>