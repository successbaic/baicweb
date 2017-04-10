<%@ include file="../jspheader.inc" %>
<%@ page contentType="text/html;charset=GBK"%>
<%	
	String DQBH = SysUtility.doPreProcess(request.getParameter("RECORG"));
	String objStr = SysUtility.doPreProcess(request.getParameter("OBJ"));	
	System.out.println(DQBH+"-------"+objStr);
%>

<SCRIPT LANGUAGE="JavaScript">
OptionsClear( eval(<%=objStr%>) );alert("1");
eval(<%=objStr%>).insertAdjacentHTML("beforeEnd",<%=icms.getSysDmList("GSS",DQBH)%>);

</SCRIPT>
<%
	dbc.close();
%>
