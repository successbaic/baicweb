<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<%@ page import="org.apache.commons.lang.StringUtils"%>
<jsp:useBean id="ggdjJbxxSq" scope="page"
	class="com.macrosoft.icms.ggdj.GgdjJbxxSq" />
<html>
<script type="text/javascript" src="js/ggdj_slxx.js">
	
</script>
<head>
<title>���֤��</title>
</head>
<body style="margin: 0px">
	<%@include file="../top.inc"%>
	<%
		String openo = Page.getOPENO();
		String sign = Page.getSIGN(); //-1����δ����,1�ѿ�ҵ
		String certNo = "";
		if (!StringUtils.isEmpty(openo)) {
			ggdjJbxxSq.setId(openo);
			ggdjJbxxSq.loadData();
			certNo = ggdjJbxxSq.getCertNo();
		}
		StepShow stepShow = new StepShow();
		out.println(stepShow.getStep("2", Page.getDL() + Page.getOPETYPE(), Page.getOPENO()));
	%>
	<br />
	<table border='1' width='100%' align='center'>
		<tr>
			<td class=lc2 valign='top'><font
				style='font-size: 11pt; color: red; font-weight: bold'>
					&nbsp;&nbsp;ҵ�����˵���� </font> <br /> &nbsp;&nbsp; ��¼�����������֤��<font
				color="red">��˵��:ָ��׼�ļ��е��ļ���ţ�</font>��Ȼ��������һ������ť�����еǼ����롣���������Ϣ����ϵͳ����������
				<br></td>
		</tr>
	</table>
	<form id="form1" method="POST" action="ggdj_control.jsp">
		<table border="1" width="100%" cellspacing='0' cellpadding='0'
			align="center">
			<tr>
				<td colspan="2">
					<table id="mc" border="0" width="100%" cellspacing='0'
						cellpadding='0' align="center">
						<tr>
							<td class="yxsm" colspan="2">&nbsp; �����Ϣ</td>
						</tr>
						<tr>
							<td class="lc1" align="center" width="40%">���֤��:</td>
							<td class="lc2"><input type="text" name="certNo" id="certNo"
								size="30" value='<%=SysUtility.doPreProcess(certNo)%>'
								<%if (!StringUtils.isEmpty(certNo)||"1".equals(sign)) {%> disabled <%}%> />&nbsp;&nbsp;&nbsp;&nbsp;<font
								color="red">*</font></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</form>
	<br />
	<CENTER>
		<%if(!StringUtils.isEmpty(certNo)||"1".equals(sign)){
			%>
			<div class="subImgs" onclick="window.location.href='ggdj_control.jsp'">��һ��</div>
			<%
		} else {
			%>
		<div class="subImgs" onclick="doSub()">��һ��</div>
			<% 
		} %>
	</CENTER>
	<!-- 	<iframe height="0" width="0" name="editframe" src="" id="editframe"></iframe> -->
	<%@include file="../bottom.inc"%>
</body>
</html>
