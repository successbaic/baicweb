<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html; charset=GBK"%>
<%	
	String INDUSTRYPHY = request.getParameter("INDUSTRYPHY");
	String objStr = request.getParameter("OBJ");
%>
<script language="javascript" src="../support/options.js"></script>
<SCRIPT LANGUAGE="JavaScript">
var val=<%=objStr%>.value;
	OptionsClear( <%=objStr%> );
<%
Hashtable h=icms.gethDmb();
Vector vTemp=(Vector)(h.get("INDUSTRYCO"));
if (vTemp!=null)
{
	for (int i=0;i<vTemp.size();i++)         
	{
		String[] ss=(String[])vTemp.get(i);
		if (ss.length>2&&ss[2].equals(INDUSTRYPHY))
		{
		out.print("OptionsAdd("+objStr+",'"+ss[0]+"|"+ss[1]+"','"+ss[0]+"');\n");
		}
	}
}

%>
<%=objStr%>.value=val;
</SCRIPT>
