<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="org.apache.commons.lang.StringUtils"%>
<%
	request.setCharacterEncoding("GBK");
%>
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<jsp:useBean id="ggdjJbxxSq" scope="page"
	class="com.macrosoft.icms.ggdj.GgdjJbxxSq" />
<html>
<head>
<title></title>
</head>
<body>
	<%
		String entName = SysUtility.doPreProcess(request.getParameter("entName")); // ��λ����
		String lerep = SysUtility.doPreProcess(request.getParameter("lerep")); // ��������
		ggdjJbxxSq.setEntName(entName);
		ggdjJbxxSq.setLerep(lerep);
		ggdjJbxxSq.loadDataByEntNameAndLerep();//����ʽ���������
		if (!StringUtils.isEmpty(ggdjJbxxSq.getId())) {
			Page.setSqxxId(ggdjJbxxSq.getId());
			out.print("<script language='javascript'>parent.window.location.href='ggdj_tbxx_bgzx.jsp'</script>");
		} else {
			out.print(SysUtility.setAlertScript("��λ����/�������������ڻ�׼ȷ����ȷ�Ϻ��������룡", ""));
			return;
		}
	%>
</body>
</html>