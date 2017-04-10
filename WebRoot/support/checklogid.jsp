<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="dbc" scope="page" class="com.macrosoft.icms.dbc.DbConnection"/>
<jsp:useBean id="webuser" scope="session" class="com.macrosoft.icms.qydj.WEB_USER"/>
<%	
	String loginid = request.getParameter("LOGINID");
	webuser.setLOGINID(loginid);
%>
<SCRIPT LANGUAGE="JavaScript">
<%
//webuser.setLOGINID(loginid);
boolean logflag=webuser.doCount(dbc);
String str="";
if(logflag){
    str+="parent.document.getElementById('imgName').src='../images/false.gif';";
	str+="parent.document.getElementById('nameres').innerHTML='该用户名已被使用！';";
	str+="parent.document.all.item('LOGINID').focus();";
	str+="parent.document.getElementById('u_flag').value='1';";
    out.print(str);    
}else{
    str+="parent.document.getElementById('imgName').src='../images/true.gif';";
	str+="parent.document.getElementById('nameres').innerHTML='该用户名可以使用！';";
	str+="parent.document.getElementById('u_flag').value='0';";
   out.print(str);
}

%>
</SCRIPT>
<%
	dbc.close();
%>
