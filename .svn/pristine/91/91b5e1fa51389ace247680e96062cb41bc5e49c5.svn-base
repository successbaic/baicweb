<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="icms" scope="application"  class="com.macrosoft.icms.system.SysSystem"/>
<%
	String action=request.getParameter( "action" );
	
	boolean bReturn=false;
	if (action==null)
	{
		out.println("<script>alert('传递参数有误！');</script>");
		return;
	}
	
	
	if (!action.equals(""))
	{
		icms.Initialize();
		out.println("<script>alert('缓存重载成功！');</script>");
		return;
	}
%>