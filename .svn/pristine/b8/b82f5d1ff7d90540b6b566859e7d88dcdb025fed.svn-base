<%@ include file="../jspheader.inc" %>
<%@ page contentType="text/html;charset=GBK"%>
<%	
	String DQBH = qynjuser.doPreProcess(request.getParameter("DQBH"));
	String objStr = user.doPreProcess(request.getParameter("OBJ"));	
%>

<SCRIPT LANGUAGE="JavaScript">
OptionsClear( eval(<%=objStr%>) );
eval(<%=objStr%>).insertAdjacentHTML("beforeEnd",<%=icms.getDeptList(DQBH,3)%>);

</SCRIPT>
<%
	dbc.close();
%>
