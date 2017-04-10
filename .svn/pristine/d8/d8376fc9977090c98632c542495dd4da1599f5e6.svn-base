<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html; charset=GBK"%>
<%	
	String objStr = request.getParameter("OBJ");
	String sDmlx=request.getParameter("STYPE");
	String sRemark=request.getParameter("SREAMRK");
%>
<script language="javascript" src="options.js"></script>
<SCRIPT LANGUAGE="JavaScript">
var val=<%=objStr%>.value;
	OptionsClear( <%=objStr%> );
<%
Hashtable hDmb=icms.gethDmb();
if (sDmlx.equals("")||sRemark==null||sRemark.equals(""))
{
	
}
else
{
	Vector vTemp=(Vector)hDmb.get(sDmlx);
	if (vTemp==null)
	{
		
	}
	for (int i=0;i<vTemp.size();i++)
	{
		String[] ss=(String[])vTemp.get(i);
		if (ss[2].equals(sRemark))
		{
			out.print("OptionsAdd("+objStr+",'"+ss[1]+"','"+ss[0]+"');\n");
		}				
	}
}
%>
<%=objStr%>.value=val;
</SCRIPT>
