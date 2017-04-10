<%
if(session.getAttribute("GGGL_USER")!=null){System.out.println("11");
	session.setAttribute("GGGL_USER",null);
}else{
	System.out.println("222");
}

out.println("<script language='javascript'>parent.window.location.reload()</script>");
%>