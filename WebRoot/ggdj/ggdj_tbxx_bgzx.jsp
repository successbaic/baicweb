<%@ page contentType="text/html;charset=GBK"%>
<%@ include file="../jspheader.inc"%>
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<html>
<head>
<%
	if ("30".equals(Page.getOPETYPE())) {
%>
<title>��淢������������˵��</title>
<%
	} else if ("50".equals(Page.getOPETYPE())) {
%>
<title>��淢��ע���������˵��</title>
<%
	}
%>

<style type="text/css">
.yxsm {
	background-image: url(images/main/ywbltitleBG.jpg);
	background-repeat: repeat-x;
}
</style>

</head>
<body bgcolor="#eefbf7" style="margin-top: 0; margin-bottom: 0">
	<%@include file="../top.inc"%>

	<%
		StepShow stepShow = new StepShow();
	%>
	<%=stepShow.getStep("2", Page.getDL() + Page.getOPETYPE(), Page.getOPENO())%>
	<table width="100%" align="center" border="1">
		<tr>
			<td colspan="4" class="yxsm" align="center"
				style="font-size: 14pt; text-align: center; background-image: url('../images/main/ywbltitleBG.jpg');">
				<%
					if ("30".equals(Page.getOPETYPE())) {
				%> ��淢������������˵�� <%
					} else if ("50".equals(Page.getOPETYPE())) {
				%> ��淢��ע���������˵�� <%
					}
				%>
			</td>
		</tr>
		<tr>
			<td colspan="4" class="lc2" style="font-family: ����; font-size: 10pt;">
				1����ǩ���ļ������ǰ��������Ӧ���Ѿ��Ķ�<font color="red"><b>���л����񹲺͹�������ɷ��������л��������͹�����淨�������ҹ����ܾ֡���淢���Ǽǹ���涨��</b></font>�ȷ��ɡ�����͹��£�ȷ֪���Ȩ��������
				<br /> 2�������˶��ύ���ϵĺϷ��ԡ���Ч�ԡ���ʵ�Գе����Ρ� <br /> <%
 	if ("30".equals(Page.getOPETYPE())) {
 %> 3����淢���Ǽ���Ч�ڽ�����Ҫ�����ģ���淢����λӦ������Ч�ڽ�����ʮ��������������������������롣<br />
				4�����������������ҵ��Ǽǣ�����д���� �����⣬����Ҫ�ύ����������ص�֤���ļ���<br />
				5��ͨ����������ģ���������ɨ���ΪͼƬ���ϴ���<br> 6�����������������κ��������µ��洦����ϵ�绰��<%=icms.getSysDm("GGDJDH", icms.getCURRENTUNIT())%>��
				<br /> ����
		<tr class="yxsm">
			<td align="center" width="10%">���</td>
			<td align="center" width="35%">��������</td>
			<td align="center" width="40%">˵��</td>
			<td align="center" width="15%">����</td>
		</tr>
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
			<td align=""left"">ֻ����������ύ����</td>
			<td align="center">1</td>
		</tr>
		<%
			} else if ("50".equals(Page.getOPETYPE())) {
		%>
		3������������ע�����ҵ��Ǽǣ�����д��λ�������������ע���Ǽ�ԭ�������ύ�������ϡ�
		<br> 4�����������������κ��������µ��洦����ϵ�绰��<%=icms.getSysDm("GGDJDH", icms.getCURRENTUNIT())%>��
		<br />
		<%
			}
		%>
		</td>
		</tr>

	</table>
	<br />
	<CENTER>
		<%
			String url = "ggdj_control.jsp";
		%>
		<div class="subImgs" onclick="window.location.href='<%=url%>'">���˽�</div>
	</CENTER>
	<%@include file="../bottom.inc"%>
</body>
</html>