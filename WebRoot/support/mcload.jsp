<%@ include file="../jspheader.inc"%>
<%@ page contentType="text/html; charset=GBK"%>
<%	
	String objStr = request.getParameter("OBJ");
	String sRemark=request.getParameter("SREAMRK");
	String XZQH=request.getParameter("XZQH");
%>
<script type="text/javascript" src="options.js"></script>
<SCRIPT type="text/javascript">
var val=<%=objStr%>.value;
	OptionsClear( <%=objStr%> );
<%
Vector mcVector=icms.getBsMcDjjgVect(XZQH,sRemark);
if (mcVector!=null)
{
	for (int i=0;i<mcVector.size();i++)
	{
		String[] ss=(String[])mcVector.get(i);
		out.print("OptionsAdd("+objStr+",'"+ss[1]+"','"+ss[0]+"');\n");				
	}
}
%>
<%=objStr%>.value=val;
</SCRIPT>
