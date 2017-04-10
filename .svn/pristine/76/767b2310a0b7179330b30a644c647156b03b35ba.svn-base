<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html;charset=GBK"%>
<%
	/*通过企业类别关联企业类型*/
	String TYPE=request.getParameter("TYPE");
	String objStr = request.getParameter("OBJ");	
	String sql="SELECT DMNR,DM FROM SYS_DMB WHERE DMLX='QYLX' AND BZ='"+TYPE+"' ORDER BY DM";
	ResultSet rs = dbc.executeQuery(sql);
%>
<SCRIPT LANGUAGE="JavaScript" src="options.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript">
OptionsClear( <%=objStr%>);
<%
	while( rs.next() )
	{
%>
	OptionsAdd( <%=objStr%>, "<%=rs.getString(1).trim()%>","<%=rs.getString(2).trim()%>");
<%
	}
%>

</SCRIPT>
<%
rs.close();
dbc.close();
%>
