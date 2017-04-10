<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html; charset=GBK"%>
<%	
	String objStr = request.getParameter("OBJ");
	String sRemark = request.getParameter("SREAMRK");
%>
<script language="javascript" src="options.js"></script>
<SCRIPT LANGUAGE="JavaScript">
var val=<%=objStr%>.value;
	OptionsClear( <%=objStr%> );
<%
	Vector vTemp=icms.getVGss();
	if (vTemp!=null)
	{
		for (int i=0;i<vTemp.size();i++)
		{
			String[] ss=(String[])vTemp.get(i);
			if (sRemark.equals(ss[2]))
			{
				out.print("OptionsAdd("+objStr+",'"+ss[1]+"','"+ss[0]+"');\n");
			}				
		}
	}

%>
<%=objStr%>.value=val;
</SCRIPT>
