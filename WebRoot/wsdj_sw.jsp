<%@ include file="jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="Page" scope="session"
	class="com.macrosoft.icms.system.WebSysPage" />
<html>
<head>
<title>税务信息补充</title>
</head>
<body>
	<%@include file="top.inc"%>
	<%
		String pageheader = Page.pageheader(request.getRequestURI());
		out.println(pageheader);
	%>
<iframe style="width:100%;height: 500px;" src="wsdj_sw_info.jsp">
<br/>
<iframe style="width:100%;height: 250px;" src="wsdj_sw_lxrxx_list.jsp">
</iframe>
	<%@include file="bottom.inc"%>
<iframe height="0" width="0" name="editframe" src="" id="editframe"
		scrolling="no" border="1" align='center' frameborder="0"></iframe>
</body>
</html>
